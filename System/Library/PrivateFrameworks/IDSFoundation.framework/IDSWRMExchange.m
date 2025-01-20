@interface IDSWRMExchange
+ (id)sharedInstance;
- (BOOL)_isXPCDictionary:(id)a3;
- (BOOL)_processLinkPreferenceNotificationEvent:(id)a3;
- (BOOL)_processMetricsConfigEvent:(id)a3;
- (BOOL)_processXPCMessage:(id)a3;
- (BOOL)_setRecommendedLinkType:(unint64_t)a3;
- (BOOL)isBTRecommended;
- (BOOL)isWiFiRecommended;
- (IDSWRMExchange)init;
- (id)_newMetricReportMessage;
- (id)_newPrefSubscribeMessage:(BOOL)a3;
- (id)_newRegisterMessage;
- (id)_newSubscribeMessage;
- (id)_newSubscribeStatusUpdateMessage;
- (id)_newSubscribeStatusUpdateMessage:(BOOL)a3 nearby:(BOOL)a4;
- (id)_newUnsubscribeMessage;
- (unint64_t)recommendedLinkType;
- (void)_dispatchAfter:(double)a3 block:(id)a4;
- (void)_notifyDelegate;
- (void)_processXPCEvent:(id)a3;
- (void)_reconnectUntilTimeout;
- (void)_registerWithWRM;
- (void)_resetLocalMetric;
- (void)_restartClient;
- (void)_restartSubscriptionIfNeeded;
- (void)_sendMetricReport;
- (void)_sendMetricReportPeriodically;
- (void)_sendXPCMessage:(id)a3;
- (void)_setReportInterval:(unint64_t)a3;
- (void)_startXPCConnection;
- (void)_stopXPCConnection;
- (void)_submitBlockAsync:(id)a3;
- (void)_updateLocalMetric:(id)a3;
- (void)dealloc;
- (void)handleActiveLinkChange:(unint64_t)a3;
- (void)submitMetric:(id)a3;
- (void)subscribeForRecommendation:(id)a3 recommendationType:(unint64_t)a4 block:(id)a5;
- (void)unsubscribeForRecommendation;
@end

@implementation IDSWRMExchange

+ (id)sharedInstance
{
  if (qword_1EB2BB740 != -1) {
    dispatch_once(&qword_1EB2BB740, &unk_1EEFCD798);
  }
  v2 = (void *)qword_1EB2BB790;
  return v2;
}

- (IDSWRMExchange)init
{
  v28.receiver = self;
  v28.super_class = (Class)IDSWRMExchange;
  v2 = [(IDSWRMExchange *)&v28 init];
  v3 = (IDSWRMExchange *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 24) = vdupq_n_s64(2uLL);
    *((_WORD *)v2 + 24) = 0;
    v4 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = 0;

    id delegateBlock = v3->_delegateBlock;
    v3->_id delegateBlock = 0;

    v3->_reportInterval = 0;
    v3->_shouldSendReport = 0;
    v3->_connectCount = 0;
    v3->_activeRecommendationType = 2;
    *(_WORD *)&v3->_isPaired = 0;
    v3->_isConnected = 0;
    v6 = objc_alloc_init(IDSWRMMetricContainer);
    metrics = v3->_metrics;
    v3->_metrics = v6;

    objc_msgSend__resetLocalMetric(v3, v8, v9, v10);
    objc_msgSend_UTF8String(@"kIDSPairingStateChangedNotification", v11, v12, v13);
    IMUserScopedNotification();
    v14 = im_primary_queue();
    uint64_t v26 = MEMORY[0x1E4F143A8];
    v27 = v3;
    im_notify_register_dispatch();

    v3->_isPaired = 0;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.ids.connection.queue", v15, v16);
    v18 = (void *)*((void *)v27 + 1);
    *((void *)v27 + 1) = v17;

    objc_msgSend__startXPCConnection(v27, v19, v20, v21, v26, 3221225472, sub_19DB1BA8C, &unk_1E59756F8);
    objc_msgSend__registerWithWRM(v27, v22, v23, v24);
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend__stopXPCConnection(self, a2, v2, v3);
  notify_cancel(self->_isPairedNotifyToken);
  v5.receiver = self;
  v5.super_class = (Class)IDSWRMExchange;
  [(IDSWRMExchange *)&v5 dealloc];
}

- (void)_submitBlockAsync:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_19DB1BB90;
      block[3] = &unk_1E5973F20;
      id v8 = v4;
      dispatch_async(queue, block);
    }
  }
}

- (void)_dispatchAfter:(double)a3 block:(id)a4
{
  id v6 = a4;
  if (v6 && self->_queue)
  {
    dispatch_block_t block = v6;
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    dispatch_after(v7, (dispatch_queue_t)self->_queue, block);
    id v6 = block;
  }
}

- (void)_startXPCConnection
{
  queue = self->_queue;
  if (queue)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", queue, 0);
    connection = self->_connection;
    self->_connection = mach_service;

    id v6 = self->_connection;
    if (v6)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_19DB1BE8C;
      handler[3] = &unk_1E59756D0;
      handler[4] = self;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_resume(self->_connection);
      return;
    }
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create a XPC connection to WirelessRadioManagerd", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"Failed to create a XPC connection to WirelessRadioManagerd");
        if (_IDSShouldLog())
        {
          id v8 = @"Failed to create a XPC connection to WirelessRadioManagerd";
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    dispatch_time_t v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "Failed to start XPC connection due to nil _queue", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"Failed to start XPC connection due to nil _queue");
        if (_IDSShouldLog())
        {
          id v8 = @"Failed to start XPC connection due to nil _queue";
LABEL_16:
          _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", v8);
        }
      }
    }
  }
}

- (void)_stopXPCConnection
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_set_event_handler(connection, &unk_1EEFCE8F8);
    xpc_connection_cancel(self->_connection);
    id v4 = self->_connection;
    self->_connection = 0;
  }
  self->_registered = 0;
}

- (void)_restartClient
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_19DB1BF54;
  v2[3] = &unk_1E5973BA8;
  v2[4] = self;
  objc_msgSend__submitBlockAsync_(self, a2, (uint64_t)v2, COERCE_DOUBLE(3221225472));
}

- (void)_processXPCEvent:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x19F3AFA60]();
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (v5 == MEMORY[0x1E4F14590])
  {
    if ((objc_msgSend__processXPCMessage_(self, v6, (uint64_t)v4, v7) & 1) == 0)
    {
      uint64_t v12 = (char *)MEMORY[0x19F3AF9A0](v4);
      double v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = "<unknown";
        if (v12) {
          v14 = v12;
        }
        *(_DWORD *)buf = 136315138;
        v29 = v14;
        _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Failed to process this event: %s", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Failed to process this event: %s");
      }
      free(v12);
    }
    if (v8 != MEMORY[0x1E4F145A8]) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 != MEMORY[0x1E4F145A8])
    {
      uint64_t v9 = (char *)MEMORY[0x19F3AF9A0](v4);
      double v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = "<unknown>";
        if (v9) {
          v11 = v9;
        }
        *(_DWORD *)buf = 136315138;
        v29 = v11;
        _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "Received an unexpected message from WRM: %s", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Received an unexpected message from WRM: %s");
      }
      free(v9);
LABEL_21:
      self->_connectCount = 0;
      goto LABEL_64;
    }
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
    v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v17 = "<unknown>";
      if (string) {
        dispatch_queue_t v17 = string;
      }
      *(_DWORD *)buf = 136315138;
      v29 = v17;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Received error message from WRM: %s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v18 = string ? (char *)string : "<unknown>";
      v27 = v18;
      _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"Received error message from WRM: %s");
      if (_IDSShouldLog())
      {
        v27 = v18;
        _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Received error message from WRM: %s");
      }
    }
    if (v4 == (id)MEMORY[0x1E4F14528])
    {
      double v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "WirelessRadioManagerd is not running", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"WirelessRadioManagerd is not running");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"WirelessRadioManagerd is not running");
          }
        }
      }
    }
    else if (v4 == (id)MEMORY[0x1E4F14520])
    {
      v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "WirelessRadioManagerd daemon has crashed", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"WirelessRadioManagerd daemon has crashed");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"WirelessRadioManagerd daemon has crashed");
          }
        }
      }
    }
    else
    {
      v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = "<unknown>";
        if (string) {
          uint64_t v20 = string;
        }
        *(_DWORD *)buf = 136315138;
        v29 = v20;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Received unknown error message from WirelessRadioManagerd: %s", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        if (!string) {
          string = "<unknown>";
        }
        v27 = (void *)string;
        _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"Received unknown error message from WirelessRadioManagerd: %s");
        if (_IDSShouldLog())
        {
          v27 = (void *)string;
          _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Received unknown error message from WirelessRadioManagerd: %s");
        }
      }
    }
    uint64_t v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Trying to reconnect to WirelessRadioManagerd daemon", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"IDSWRMExchange", @"IDS", @"Trying to reconnect to WirelessRadioManagerd daemon");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Trying to reconnect to WirelessRadioManagerd daemon");
        }
      }
    }
    objc_msgSend__reconnectUntilTimeout(self, v24, v25, v26, v27);
  }
LABEL_64:
}

- (void)_reconnectUntilTimeout
{
  if (self->_connectCount <= 9u)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = sub_19DB1C73C;
    v2[3] = &unk_1E5973BA8;
    v2[4] = self;
    objc_msgSend__dispatchAfter_block_(self, a2, (uint64_t)v2, 1000.0);
  }
}

- (void)_sendXPCMessage:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_19DB1C81C;
    v9[3] = &unk_1E5974088;
    v9[4] = self;
    id v10 = v4;
    objc_msgSend__submitBlockAsync_(self, v7, (uint64_t)v9, v8);
  }
}

- (BOOL)_isXPCDictionary:(id)a3
{
  return a3 && MEMORY[0x19F3AFA60](a3, a2) == MEMORY[0x1E4F14590];
}

- (id)_newRegisterMessage
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_uint64(v3, "kMessageId", 1uLL);
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    double v8 = v5;
    if (v5)
    {
      xpc_dictionary_set_uint64(v5, "kWCMRegisterProcess_ProcessId", 0xBuLL);
      xpc_dictionary_set_value(v4, "kMessageArgs", v8);
    }
    if (objc_msgSend__isXPCDictionary_(self, v6, (uint64_t)v4, v7)) {
      id v9 = v4;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_newSubscribeMessage
{
  return (id)((uint64_t (*)(IDSWRMExchange *, char *, void))MEMORY[0x1F4181798])(self, sel__newPrefSubscribeMessage_, 0);
}

- (id)_newSubscribeStatusUpdateMessage
{
  return (id)((uint64_t (*)(IDSWRMExchange *, char *, uint64_t))MEMORY[0x1F4181798])(self, sel__newPrefSubscribeMessage_, 1);
}

- (id)_newSubscribeStatusUpdateMessage:(BOOL)a3 nearby:(BOOL)a4
{
  self->_isNearby = a4;
  self->_isConnected = a3;
  return (id)((uint64_t (*)(IDSWRMExchange *, char *, uint64_t))MEMORY[0x1F4181798])(self, sel__newPrefSubscribeMessage_, 1);
}

- (id)_newPrefSubscribeMessage:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  double v6 = v5;
  if (!v5)
  {
    id v16 = 0;
    goto LABEL_23;
  }
  if (v3) {
    uint64_t v7 = 403;
  }
  else {
    uint64_t v7 = 402;
  }
  xpc_dictionary_set_uint64(v5, "kMessageId", v7);
  uint64_t activeRecommendationType = self->_activeRecommendationType;
  if (activeRecommendationType != 2) {
    xpc_dictionary_set_uint64(v6, "kWRMSubscriptionType", activeRecommendationType);
  }
  xpc_object_t v10 = xpc_array_create(0, 0);
  if (v10)
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    double v13 = v12;
    if (!v12)
    {
LABEL_16:
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      v18 = v17;
      if (v17)
      {
        xpc_dictionary_set_value(v17, "kWRMApplicationTypeList", v10);
        xpc_dictionary_set_value(v6, "kMessageArgs", v18);
      }

      goto LABEL_19;
    }
    xpc_dictionary_set_uint64(v12, "kWRMApplicationType", 0);
    xpc_dictionary_set_uint64(v13, "kWRMLinkDirection", 2uLL);
    if (v3)
    {
      xpc_dictionary_set_uint64(v13, "kWRMLinkType", self->_activeLinkType);
      xpc_dictionary_set_uint64(v13, "kWRMCompPairedWithGizmo", self->_isPaired);
      xpc_dictionary_set_uint64(v13, "kWRMNearByOverBT", self->_isNearby);
      xpc_dictionary_set_uint64(v13, "kWRMConnected", self->_isConnected);
      uint64_t nearbyOverWiFi = self->_nearbyOverWiFi;
      v15 = "kWRMNearByOverWiFi";
    }
    else
    {
      uint64_t nearbyOverWiFi = self->_recommendedLinkType;
      if (nearbyOverWiFi == 2)
      {
LABEL_15:
        xpc_array_append_value(v10, v13);
        goto LABEL_16;
      }
      v15 = "kWRMLinkType";
    }
    xpc_dictionary_set_uint64(v13, v15, nearbyOverWiFi);
    goto LABEL_15;
  }
LABEL_19:
  if (objc_msgSend__isXPCDictionary_(self, v9, (uint64_t)v6, v11)) {
    id v16 = v6;
  }
  else {
    id v16 = 0;
  }

LABEL_23:
  return v16;
}

- (id)_newUnsubscribeMessage
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_uint64(v3, "kMessageId", 0x192uLL);
    uint64_t activeRecommendationType = self->_activeRecommendationType;
    if (activeRecommendationType != 2) {
      xpc_dictionary_set_uint64(v4, "kWRMSubscriptionType", activeRecommendationType);
    }
    xpc_object_t v7 = xpc_array_create(0, 0);
    if (v7)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v10 = v9;
      if (v9)
      {
        xpc_dictionary_set_value(v9, "kWRMApplicationTypeList", v7);
        xpc_dictionary_set_value(v4, "kMessageArgs", v10);
      }
    }
    if (objc_msgSend__isXPCDictionary_(self, v6, (uint64_t)v4, v8)) {
      id v11 = v4;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_registerWithWRM
{
  self->_registered = 1;
  id v7 = (id)objc_msgSend__newRegisterMessage(self, a2, v2, v3);
  objc_msgSend__sendXPCMessage_(self, v5, (uint64_t)v7, v6);
}

- (void)subscribeForRecommendation:(id)a3 recommendationType:(unint64_t)a4 block:(id)a5
{
  id v9 = a3;
  id v12 = a5;
  unint64_t activeRecommendationType = self->_activeRecommendationType;
  if (activeRecommendationType != 2 && activeRecommendationType != a4) {
    objc_msgSend_unsubscribeForRecommendation(self, v10, v11, v13);
  }
  id v16 = self;
  objc_sync_enter(v16);
  objc_storeStrong((id *)&v16->_delegateQueue, a3);
  if (v12)
  {
    uint64_t v20 = objc_msgSend_copy(v12, v17, v18, v19);
    id delegateBlock = v16->_delegateBlock;
    v16->_id delegateBlock = (id)v20;
  }
  objc_sync_exit(v16);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_19DB1CF3C;
  v23[3] = &unk_1E5975380;
  v23[4] = v16;
  v23[5] = a4;
  objc_msgSend__submitBlockAsync_(v16, v22, (uint64_t)v23, COERCE_DOUBLE(3221225472));
}

- (void)_restartSubscriptionIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_subscribed && (self->_activeLinkType == 1 || self->_recommendedLinkType != 3))
  {
    double v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t activeRecommendationType = self->_activeRecommendationType;
      *(_DWORD *)buf = 67109120;
      int v13 = activeRecommendationType;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "Re-subscribe to WRM for link recommendations of type: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
      {
        unint64_t v11 = self->_activeRecommendationType;
        _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Re-subscribe to WRM for link recommendations of type: %d");
      }
    }
    double v8 = objc_msgSend__newSubscribeMessage(self, v5, v6, v7, v11);
    objc_msgSend__sendXPCMessage_(self, v9, (uint64_t)v8, v10);
  }
}

- (void)unsubscribeForRecommendation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_19DB1D238;
  v2[3] = &unk_1E5973BA8;
  v2[4] = self;
  objc_msgSend__submitBlockAsync_(self, a2, (uint64_t)v2, COERCE_DOUBLE(3221225472));
}

- (BOOL)_processXPCMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6))
  {
    double v7 = (void *)MEMORY[0x19F3AF9A0](v4);
    double v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = v7;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Got an event = %s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Got an event = %s");
    }
    free(v7);
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "kMessageId");
    if (uint64 == 1103)
    {
      char v12 = objc_msgSend__processMetricsConfigEvent_(self, v10, (uint64_t)v4, v11);
      goto LABEL_12;
    }
    if (uint64 == 1301)
    {
      char v12 = objc_msgSend__processLinkPreferenceNotificationEvent_(self, v10, (uint64_t)v4, v11);
LABEL_12:
      BOOL v13 = v12;
      goto LABEL_13;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_processLinkPreferenceNotificationEvent:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6)
    && xpc_dictionary_get_uint64(v4, "kMessageId") == 1301)
  {
    double v7 = xpc_dictionary_get_value(v4, "kMessageArgs");
    if (objc_msgSend__isXPCDictionary_(self, v8, (uint64_t)v7, v9))
    {
      uint64_t v10 = xpc_dictionary_get_value(v7, "kWRMApplicationTypeList");
      double v11 = (void *)v10;
      if (v10 && MEMORY[0x19F3AFA60](v10) == MEMORY[0x1E4F14568] && xpc_array_get_count(v11))
      {
        v15 = xpc_array_get_value(v11, 0);
        if (v15
          && objc_msgSend__isXPCDictionary_(self, v14, (uint64_t)v15, v16)
          && !xpc_dictionary_get_uint64(v15, "kWRMApplicationType")
          && (uint64_t uint64 = xpc_dictionary_get_uint64(v15, "kWRMLinkType"), (uint64 & 0xFFFFFFFFFFFFFFFDLL) == 1))
        {
          if (objc_msgSend__setRecommendedLinkType_(self, v18, uint64, v19)) {
            objc_msgSend__notifyDelegate(self, v20, v21, v22);
          }
          BOOL v12 = 1;
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isWiFiRecommended
{
  return self->_recommendedLinkType == 1;
}

- (BOOL)isBTRecommended
{
  return self->_recommendedLinkType == 3;
}

- (unint64_t)recommendedLinkType
{
  return self->_recommendedLinkType;
}

- (BOOL)_setRecommendedLinkType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t recommendedLinkType = self->_recommendedLinkType;
  if (recommendedLinkType != a3)
  {
    self->_unint64_t recommendedLinkType = a3;
    double v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = self->_recommendedLinkType;
      double v8 = "Unknown";
      if (v7 == 3) {
        double v8 = "BT";
      }
      if (v7 == 1) {
        double v9 = "WiFi";
      }
      else {
        double v9 = v8;
      }
      *(_DWORD *)buf = 136315138;
      BOOL v12 = v9;
      _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "Recommended link changed to '%s'", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Recommended link changed to '%s'");
    }
  }
  return recommendedLinkType != a3;
}

- (void)_notifyDelegate
{
  id delegateBlock = (void (**)(id, unint64_t))self->_delegateBlock;
  if (delegateBlock) {
    delegateBlock[2](delegateBlock, self->_recommendedLinkType);
  }
}

- (void)_setReportInterval:(unint64_t)a3
{
  if (a3 && !self->_reportInterval)
  {
    unint64_t v3 = 5000;
    if (a3 > 0x1388) {
      unint64_t v3 = a3;
    }
    self->_reportInterval = v3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DB1D91C;
    block[3] = &unk_1E5973BA8;
    void block[4] = self;
    if (qword_1E944F910 != -1) {
      dispatch_once(&qword_1E944F910, block);
    }
  }
}

- (BOOL)_processMetricsConfigEvent:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6)
    && xpc_dictionary_get_uint64(v4, "kMessageId") == 1103)
  {
    unint64_t v7 = xpc_dictionary_get_value(v4, "kMessageArgs");
    if (objc_msgSend__isXPCDictionary_(self, v8, (uint64_t)v7, v9)
      && (uint64_t uint64 = xpc_dictionary_get_uint64(v7, "PeriodRptInval")) != 0)
    {
      objc_msgSend__setReportInterval_(self, v11, uint64, v12);
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_newMetricReportMessage
{
  if (self->_metrics)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    id v4 = v3;
    if (!v3)
    {
      id v58 = 0;
LABEL_38:

      return v58;
    }
    uint64_t activeRecommendationType = self->_activeRecommendationType;
    if (activeRecommendationType != 2) {
      xpc_dictionary_set_uint64(v3, "kWRMSubscriptionType", activeRecommendationType);
    }
    xpc_dictionary_set_uint64(v4, "kMessageId", 0x258uLL);
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      if (objc_msgSend_StreamBytesSent(self->_metrics, v6, v7, v9) != -1)
      {
        uint64_t v13 = objc_msgSend_StreamBytesSent(self->_metrics, v10, v11, v12);
        xpc_dictionary_set_uint64(v8, "StrmBytesSnt", v13);
      }
      if (objc_msgSend_StreamBytesReceived(self->_metrics, v10, v11, v12) != -1)
      {
        uint64_t v17 = objc_msgSend_StreamBytesReceived(self->_metrics, v14, v15, v16);
        xpc_dictionary_set_uint64(v8, "StrmBytesRcvd", v17);
      }
      if (objc_msgSend_StreamPacketsSent(self->_metrics, v14, v15, v16) != -1)
      {
        uint64_t v21 = objc_msgSend_StreamPacketsSent(self->_metrics, v18, v19, v20);
        xpc_dictionary_set_uint64(v8, "StrmPktsSnt", v21);
      }
      if (objc_msgSend_StreamPacketsReceived(self->_metrics, v18, v19, v20) != -1)
      {
        uint64_t v25 = objc_msgSend_StreamPacketsReceived(self->_metrics, v22, v23, v24);
        xpc_dictionary_set_uint64(v8, "StrmPktRcvd", v25);
      }
      if (objc_msgSend_MessageSentSize(self->_metrics, v22, v23, v24) != -1)
      {
        uint64_t v29 = objc_msgSend_MessageSentSize(self->_metrics, v26, v27, v28);
        xpc_dictionary_set_uint64(v8, "LocMsgSntSz", v29);
      }
      if (objc_msgSend_MessageReceivedSize(self->_metrics, v26, v27, v28) != -1)
      {
        uint64_t v33 = objc_msgSend_MessageReceivedSize(self->_metrics, v30, v31, v32);
        xpc_dictionary_set_uint64(v8, "LocMsgRcvdMgSz", v33);
      }
      if (objc_msgSend_MessageDeliveredSize(self->_metrics, v30, v31, v32) != -1)
      {
        uint64_t v37 = objc_msgSend_MessageDeliveredSize(self->_metrics, v34, v35, v36);
        xpc_dictionary_set_uint64(v8, "DeliveredMsgSz", v37);
      }
      if (objc_msgSend_MessageDeliveredDeliveryError(self->_metrics, v34, v35, v36) != -1)
      {
        uint64_t v41 = objc_msgSend_MessageDeliveredDeliveryError(self->_metrics, v38, v39, v40);
        xpc_dictionary_set_uint64(v8, "LocMsgDeliveryEr", v41);
      }
      if (objc_msgSend_MessageDeliveredRTT(self->_metrics, v38, v39, v40) != -1)
      {
        uint64_t v45 = objc_msgSend_MessageDeliveredRTT(self->_metrics, v42, v43, v44);
        xpc_dictionary_set_uint64(v8, "LocMsgDeliveredRTT", v45);
      }
      if (objc_msgSend_numMessageReceivedSize(self->_metrics, v42, v43, v44))
      {
        uint64_t v49 = objc_msgSend_numMessageReceivedSize(self->_metrics, v46, v47, v48);
        xpc_dictionary_set_uint64(v8, "LocMsgRcvd", v49);
      }
      if (objc_msgSend_numMessageSentSize(self->_metrics, v46, v47, v48))
      {
        uint64_t v53 = objc_msgSend_numMessageSentSize(self->_metrics, v50, v51, v52);
        xpc_dictionary_set_uint64(v8, "LocMsgSnt", v53);
      }
      if (objc_msgSend_numMessageDeliveredSize(self->_metrics, v50, v51, v52))
      {
        uint64_t v57 = objc_msgSend_numMessageDeliveredSize(self->_metrics, v54, v55, v56);
        xpc_dictionary_set_uint64(v8, "LocMsgDelivered", v57);
      }
      if (!xpc_dictionary_get_count(v8)) {
        goto LABEL_36;
      }
      xpc_dictionary_set_value(v4, "kMessageArgs", v8);
    }
    if (objc_msgSend__isXPCDictionary_(self, v6, (uint64_t)v4, v9))
    {
      id v58 = v4;
LABEL_37:

      goto LABEL_38;
    }
LABEL_36:
    id v58 = 0;
    goto LABEL_37;
  }
  return 0;
}

- (void)_sendMetricReport
{
  if (self->_shouldSendReport)
  {
    id v8 = (id)objc_msgSend__newMetricReportMessage(self, a2, v2, v3);
    if (v8) {
      objc_msgSend__sendXPCMessage_(self, v5, (uint64_t)v8, v7);
    }
    self->_shouldSendReport = 0;
    objc_msgSend__resetLocalMetric(self, v5, v6, v7);
  }
}

- (void)_sendMetricReportPeriodically
{
  objc_msgSend__sendMetricReport(self, a2, v2, v3);
  double reportInterval = (double)self->_reportInterval;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19DB1DDD4;
  v7[3] = &unk_1E5973BA8;
  v7[4] = self;
  objc_msgSend__dispatchAfter_block_(self, v6, (uint64_t)v7, reportInterval);
}

- (void)submitMetric:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_19DB1DE78;
    v8[3] = &unk_1E5974088;
    v8[4] = self;
    id v9 = v4;
    objc_msgSend__submitBlockAsync_(self, v6, (uint64_t)v8, v7);
  }
}

- (void)_updateLocalMetric:(id)a3
{
  id v4 = a3;
  if (v4 && self->_metrics)
  {
    id v71 = v4;
    if (objc_msgSend_StreamBytesSent(v4, v5, v6, v7) != -1)
    {
      metrics = self->_metrics;
      uint64_t v12 = objc_msgSend_StreamBytesSent(v71, v8, v9, v10);
      objc_msgSend_setStreamBytesSent_(metrics, v13, v12, v14);
    }
    if (objc_msgSend_StreamBytesReceived(v71, v8, v9, v10) != -1)
    {
      uint64_t v18 = self->_metrics;
      uint64_t v19 = objc_msgSend_StreamBytesReceived(v71, v15, v16, v17);
      objc_msgSend_setStreamBytesReceived_(v18, v20, v19, v21);
    }
    if (objc_msgSend_StreamPacketsSent(v71, v15, v16, v17) != -1)
    {
      uint64_t v25 = self->_metrics;
      uint64_t v26 = objc_msgSend_StreamPacketsSent(v71, v22, v23, v24);
      objc_msgSend_setStreamPacketsSent_(v25, v27, v26, v28);
    }
    if (objc_msgSend_StreamPacketsReceived(v71, v22, v23, v24) != -1)
    {
      double v32 = self->_metrics;
      uint64_t v33 = objc_msgSend_StreamPacketsReceived(v71, v29, v30, v31);
      objc_msgSend_setStreamPacketsReceived_(v32, v34, v33, v35);
    }
    if (objc_msgSend_MessageSentSize(v71, v29, v30, v31) != -1)
    {
      uint64_t v39 = self->_metrics;
      uint64_t v40 = objc_msgSend_MessageSentSize(v71, v36, v37, v38);
      objc_msgSend_setMessageSentSize_(v39, v41, v40, v42);
    }
    if (objc_msgSend_MessageReceivedSize(v71, v36, v37, v38) != -1)
    {
      v46 = self->_metrics;
      uint64_t v47 = objc_msgSend_MessageReceivedSize(v71, v43, v44, v45);
      objc_msgSend_setMessageReceivedSize_(v46, v48, v47, v49);
    }
    if (objc_msgSend_MessageDeliveredSize(v71, v43, v44, v45) != -1)
    {
      uint64_t v53 = self->_metrics;
      uint64_t v54 = objc_msgSend_MessageDeliveredSize(v71, v50, v51, v52);
      objc_msgSend_setMessageDeliveredSize_(v53, v55, v54, v56);
    }
    if (objc_msgSend_MessageDeliveredDeliveryError(v71, v50, v51, v52) != -1)
    {
      v60 = self->_metrics;
      uint64_t v61 = objc_msgSend_MessageDeliveredDeliveryError(v71, v57, v58, v59);
      objc_msgSend_setMessageDeliveredDeliveryError_(v60, v62, v61, v63);
    }
    if (objc_msgSend_MessageDeliveredRTT(v71, v57, v58, v59) != -1)
    {
      v67 = self->_metrics;
      uint64_t v68 = objc_msgSend_MessageDeliveredRTT(v71, v64, v65, v66);
      objc_msgSend_setMessageDeliveredRTT_(v67, v69, v68, v70);
    }
    self->_shouldSendReport = 1;
    id v4 = v71;
  }
}

- (void)_resetLocalMetric
{
  metrics = self->_metrics;
  if (metrics) {
    objc_msgSend_resetMetric(metrics, a2, v2, v3);
  }
}

- (void)handleActiveLinkChange:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 == 2 || self->_activeLinkType != a3)
  {
    xpc_object_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "Unknown";
      unint64_t activeLinkType = self->_activeLinkType;
      if (activeLinkType == 3) {
        id v8 = "BT";
      }
      else {
        id v8 = "Unknown";
      }
      if (activeLinkType == 1) {
        uint64_t v9 = "WiFi";
      }
      else {
        uint64_t v9 = v8;
      }
      if (a3 == 3) {
        uint64_t v6 = "BT";
      }
      if (a3 == 1) {
        uint64_t v6 = "WiFi";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = v9;
      __int16 v27 = 2080;
      double v28 = v6;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Active link changed from '%s' to '%s'", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      unint64_t v13 = self->_activeLinkType;
      double v14 = "Unknown";
      if (v13 == 3) {
        uint64_t v15 = "BT";
      }
      else {
        uint64_t v15 = "Unknown";
      }
      if (v13 == 1) {
        uint64_t v16 = "WiFi";
      }
      else {
        uint64_t v16 = v15;
      }
      if (a3 == 3) {
        double v14 = "BT";
      }
      if (a3 == 1) {
        double v14 = "WiFi";
      }
      double v21 = v16;
      double v22 = v14;
      _IDSLogV(0, @"IDSFoundation", @"IDSWRMExchange", @"Active link changed from '%s' to '%s'");
    }
    self->_unint64_t activeLinkType = a3;
    updated = objc_msgSend__newSubscribeStatusUpdateMessage(self, v10, v11, v12, v21, v22);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19DB1E270;
    v23[3] = &unk_1E5974088;
    v23[4] = self;
    id v24 = updated;
    id v18 = updated;
    objc_msgSend__submitBlockAsync_(self, v19, (uint64_t)v23, v20);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegateBlock, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end