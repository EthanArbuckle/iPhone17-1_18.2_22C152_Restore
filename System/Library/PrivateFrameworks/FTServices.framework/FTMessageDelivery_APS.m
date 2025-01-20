@interface FTMessageDelivery_APS
+ (id)sharedInstance;
- (BOOL)_fillMessageParameters:(id *)a3 ftMessage:(id *)a4;
- (BOOL)_isBusyWithMessage:(id)a3;
- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4;
- (BOOL)_shouldSendSOSForFailure:(id)a3;
- (BOOL)busy;
- (BOOL)sendMessage:(id)a3;
- (BOOL)shouldFailFastForMessage:(id)a3;
- (FTMessageDelivery_APS)initWithAPSConnection:(id)a3;
- (FTMessageDelivery_APS)initWithAPSConnection:(id)a3 mobileNetworkManager:(id)a4;
- (id)_apsOutgoingMessageForFTMessage:(id)a3;
- (id)_bodyForMessage:(id)a3;
- (id)_currentAPSMessages;
- (id)_currentMessages;
- (id)_currentTimers;
- (id)_messageForAPSOutgoingMessage:(id)a3;
- (id)_requiredTopicsWithUltraConstrainedTopics:(id *)a3;
- (id)allMessages;
- (int64_t)_retryCountForMessage:(id)a3;
- (int64_t)maxLargeMessageSize;
- (int64_t)maxMessageSize;
- (void)_apsMessageBodyForMessage:(id)a3 completion:(id)a4;
- (void)_apsMessageForMessage:(id)a3 body:(id)a4 completion:(id)a5;
- (void)_clearMapForMessageID:(id)a3;
- (void)_dequeueIfNeeded;
- (void)_invalidateDeathTimerForMessageID:(id)a3;
- (void)_invalidateTimerForMessageID:(id)a3;
- (void)_messageACKTimedOut:(id)a3;
- (void)_messageAckGracePeriodTimedOut:(id)a3;
- (void)_messageCompletelyTimedOut:(id)a3;
- (void)_messageNeedsRetry:(id)a3;
- (void)_messageSendTimedOut:(id)a3;
- (void)_noteMessageACKd:(id)a3 ftMessage:(id)a4;
- (void)_noteMessageFailed:(id)a3 ftMessage:(id)a4 retryBehavior:(int)a5 error:(id)a6;
- (void)_noteMessageSent:(id)a3 ftMessage:(id)a4 body:(id)a5;
- (void)_noteMessageSucceeded:(id)a3 ftMessage:(id)a4 error:(id)a5 result:(id)a6 resultCode:(int64_t)a7;
- (void)_notifyDelegateAboutError:(id)a3 resultCode:(int64_t)a4 forMessage:(id)a5;
- (void)_powerLogEvent:(id)a3 dictionary:(id)a4;
- (void)_sendMessage:(id)a3 ftMessage:(id)a4;
- (void)_serverBagLoaded:(id)a3;
- (void)_setEnabledTopics:(id)a3;
- (void)_setMapForMessage:(id)a3 apsMessage:(id)a4 messageBody:(id)a5 timeoutTime:(double)a6 timeoutSelector:(SEL)a7 handlerBlock:(id)a8 retries:(id)a9;
- (void)_updateTopics;
- (void)cancelMessage:(id)a3;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FTMessageDelivery_APS

- (int64_t)maxMessageSize
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_connection(self, a2, v2);
  int64_t v7 = objc_msgSend_messageSize(v4, v5, v6);

  if (v7 <= 5119)
  {
    v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend_connection(self, v9, v10);
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      __int16 v24 = 1024;
      int v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = 5120;
      _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_ERROR, "APSConnection %@  gave me a connection size of: %d  which doesn't pass our sanity size of: %ld   ignoring", buf, 0x1Cu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v19 = objc_msgSend_connection(self, v12, v13);
      _IDSWarnV();

      v20 = objc_msgSend_connection(self, v14, v15, v19, v7, 5120);
      _IDSLogV();

      v21 = objc_msgSend_connection(self, v16, v17, v20, v7, 5120);
      _IDSLogTransport();
    }
  }
  if (v7 <= 5120) {
    return 5120;
  }
  else {
    return v7;
  }
}

- (int64_t)maxLargeMessageSize
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_connection(self, a2, v2);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v8 = objc_msgSend_connection(self, v6, v7);
    int64_t v11 = objc_msgSend_largeMessageSize(v8, v9, v10);

    if (v11 <= 5119)
    {
      v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_msgSend_connection(self, v13, v14);
        *(_DWORD *)buf = 138412802;
        uint64_t v27 = v15;
        __int16 v28 = 1024;
        int v29 = v11;
        __int16 v30 = 2048;
        uint64_t v31 = 5120;
        _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_ERROR, "APSConnection %@  gave me a connection large size of: %d  which doesn't pass our sanity size of: %ld   ignoring", buf, 0x1Cu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v23 = objc_msgSend_connection(self, v16, v17);
        _IDSWarnV();

        __int16 v24 = objc_msgSend_connection(self, v18, v19, v23, v11, 5120);
        _IDSLogV();

        int v25 = objc_msgSend_connection(self, v20, v21, v24, v11, 5120);
        _IDSLogTransport();
      }
    }
    if (v11 <= 5120) {
      return 5120;
    }
    else {
      return v11;
    }
  }
  else
  {
    return MEMORY[0x1F4181798](self, sel_maxMessageSize, v7);
  }
}

+ (id)sharedInstance
{
  if (qword_1EB47C8B8 != -1) {
    dispatch_once(&qword_1EB47C8B8, &unk_1EFE07920);
  }
  uint64_t v2 = (void *)qword_1EB47C870;

  return v2;
}

- (FTMessageDelivery_APS)initWithAPSConnection:(id)a3 mobileNetworkManager:(id)a4
{
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)FTMessageDelivery_APS;
  v8 = [(FTMessageDelivery *)&v26 initWithAPSConnection:a3];
  if (v8)
  {
    v8->_APSOutgoingMessageClass = (Class)MEMORY[0x1AD0D4F50](@"APSOutgoingMessage", @"ApplePushService");
    int64_t v11 = objc_msgSend_connection(v8, v9, v10);
    objc_msgSend_setDelegate_(v11, v12, (uint64_t)v8);

    objc_storeStrong((id *)&v8->_mobileNetworkManager, a4);
    uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1C978], v13, v14);
    objc_msgSend__setEnabledTopics_(v8, v16, (uint64_t)v15);

    objc_msgSend__updateTopics(v8, v17, v18);
    if (_os_feature_enabled_impl()
      && (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E4F6C408], v19, v20) & 1) == 0)
    {
      uint64_t v21 = (IDSOffGridConnectionMonitor *)objc_alloc_init((Class)MEMORY[0x1AD0D4F50](@"IDSOffGridConnectionMonitor", @"IDS"));
      offGridConnectionMonitor = v8->_offGridConnectionMonitor;
      v8->_offGridConnectionMonitor = v21;
    }
    v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20);
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v8, sel__serverBagLoaded_, *MEMORY[0x1E4F6B2E0], 0);
  }
  return v8;
}

- (FTMessageDelivery_APS)initWithAPSConnection:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F6C378];
  id v5 = a3;
  v8 = objc_msgSend_sharedInstance(v4, v6, v7);
  uint64_t v10 = (FTMessageDelivery_APS *)objc_msgSend_initWithAPSConnection_mobileNetworkManager_(self, v9, (uint64_t)v5, v8);

  return v10;
}

- (void)dealloc
{
  v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, 0, 0);

  apsMessageMap = self->_apsMessageMap;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A7BE16EC;
  v19[3] = &unk_1E5D1AD50;
  v19[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(apsMessageMap, v7, (uint64_t)v19);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_timerMap, v8, (uint64_t)&unk_1EFE077E0);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_deathTimerMap, v9, (uint64_t)&unk_1EFE075A0);
  v12 = objc_msgSend_array(MEMORY[0x1E4F1C978], v10, v11);
  objc_msgSend__setEnabledTopics_(self, v13, (uint64_t)v12);

  v16 = objc_msgSend_connection(self, v14, v15);
  objc_msgSend_setDelegate_(v16, v17, 0);

  v18.receiver = self;
  v18.super_class = (Class)FTMessageDelivery_APS;
  [(FTMessageDelivery *)&v18 dealloc];
}

- (void)_setEnabledTopics:(id)a3
{
  id v4 = a3;
  objc_msgSend_connection(self, v5, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_array(MEMORY[0x1E4F1C978], v7, v8);
  v12 = objc_msgSend_array(MEMORY[0x1E4F1C978], v10, v11);
  objc_msgSend_setEnabledTopics_ignoredTopics_opportunisticTopics_(v14, v13, (uint64_t)v9, v12, v4);
}

- (void)_invalidateTimerForMessageID:(id)a3
{
  objc_msgSend_objectForKey_(self->_timerMap, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v5, v3, v4);
}

- (void)_invalidateDeathTimerForMessageID:(id)a3
{
  objc_msgSend_objectForKey_(self->_deathTimerMap, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v5, v3, v4);
}

- (void)_setMapForMessage:(id)a3 apsMessage:(id)a4 messageBody:(id)a5 timeoutTime:(double)a6 timeoutSelector:(SEL)a7 handlerBlock:(id)a8 retries:(id)a9
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v86 = a4;
  id value = a5;
  id v83 = a8;
  id v85 = a9;
  uint64_t v19 = objc_msgSend_uniqueIDString(v16, v17, v18);
  if (v19)
  {
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (a7)
      {
        NSStringFromSelector(a7);
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v21 = @"none";
      }
      *(_DWORD *)buf = 138413314;
      id v89 = v19;
      __int16 v90 = 2112;
      id v91 = v16;
      __int16 v92 = 2112;
      id v93 = v86;
      __int16 v94 = 2048;
      double v95 = a6;
      __int16 v96 = 2112;
      v97 = v21;
      _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "Mapping messageID: %@  message: %@   APSMessage: %@   timeout: %f  timeoutSelector: %@", buf, 0x34u);
      if (a7) {
    }
      }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      if (a7)
      {
        NSStringFromSelector(a7);
        v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
        double v81 = a6;
        id v79 = v16;
        id v80 = v86;
        v74 = v19;
        _IDSLogV();
      }
      else
      {
        v82 = @"none";
        double v81 = a6;
        id v79 = v16;
        id v80 = v86;
        v74 = v19;
        _IDSLogV();
      }
    }
    objc_msgSend__invalidateTimerForMessageID_(self, v23, (uint64_t)v19, v74, v79, v80, *(void *)&v81, v82);
    if (!self->_ftMessageMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      ftMessageMap = self->_ftMessageMap;
      self->_ftMessageMap = Mutable;
    }
    if (!self->_apsMessageMap)
    {
      uint64_t v27 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      apsMessageMap = self->_apsMessageMap;
      self->_apsMessageMap = v27;
    }
    if (!self->_timerMap)
    {
      int v29 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      timerMap = self->_timerMap;
      self->_timerMap = v29;
    }
    if (!self->_retriesMap)
    {
      uint64_t v31 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      retriesMap = self->_retriesMap;
      self->_retriesMap = v31;
    }
    if (!self->_bodyMap)
    {
      v33 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      bodyMap = self->_bodyMap;
      self->_bodyMap = v33;
    }
    if (!self->_startDateMap)
    {
      v35 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      startDateMap = self->_startDateMap;
      self->_startDateMap = v35;
    }
    if (!self->_deathTimerMap)
    {
      v37 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      deathTimerMap = self->_deathTimerMap;
      self->_deathTimerMap = v37;
    }
    if (a6 > 0.0)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F6C328]);
      v40 = im_primary_queue();
      v42 = objc_msgSend_initWithQueue_interval_repeats_userInfo_handlerBlock_(v39, v41, (uint64_t)v40, (unint64_t)a6, 0, v19, v83);

      if (v42)
      {
        objc_msgSend_setObject_forKey_(self->_timerMap, v43, (uint64_t)v42, v19);
      }
      else
      {
        v44 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v89 = v19;
          _os_log_impl(&dword_1A7BC0000, v44, OS_LOG_TYPE_ERROR, "No timer specified for message ID: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          v75 = v19;
          _IDSLogTransport();
        }
      }
    }
    if (v16) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_ftMessageMap, v19, v16);
    }
    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_bodyMap, v19, value);
    }
    if (v85) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_retriesMap, v19, v85);
    }
    if (v86) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_apsMessageMap, v19, v86);
    }
    v45 = objc_msgSend_objectForKey_(self->_apsMessageMap, v24, (uint64_t)v19, v75);
    BOOL v46 = v45 == 0;

    if (v46)
    {
      v48 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v89 = v19;
        _os_log_impl(&dword_1A7BC0000, v48, OS_LOG_TYPE_ERROR, "Missing APS Message for message ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v76 = v19;
        _IDSLogTransport();
      }
    }
    v49 = objc_msgSend_objectForKey_(self->_ftMessageMap, v47, (uint64_t)v19, v76);
    BOOL v50 = v49 == 0;

    if (v50)
    {
      v52 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v89 = v19;
        _os_log_impl(&dword_1A7BC0000, v52, OS_LOG_TYPE_ERROR, "Missing FTMessage for message ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v77 = v19;
        _IDSLogTransport();
      }
    }
    v53 = objc_msgSend_objectForKey_(self->_bodyMap, v51, (uint64_t)v19, v77);
    BOOL v54 = v53 == 0;

    if (v54)
    {
      v56 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v89 = v19;
        _os_log_impl(&dword_1A7BC0000, v56, OS_LOG_TYPE_ERROR, "Missing body for message ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v78 = v19;
        _IDSLogTransport();
      }
    }
    v57 = objc_msgSend_objectForKey_(self->_retriesMap, v55, (uint64_t)v19, v78);
    BOOL v58 = v57 == 0;

    if (v58) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_retriesMap, v19, &unk_1EFE11BE0);
    }
    v60 = objc_msgSend_objectForKey_(self->_deathTimerMap, v59, (uint64_t)v19);
    BOOL v61 = v60 == 0;

    if (v61)
    {
      id v62 = objc_alloc(MEMORY[0x1E4F6C328]);
      v63 = im_primary_queue();
      objc_msgSend_timeout(v16, v64, v65);
      double v67 = v66;
      v70 = objc_msgSend_uniqueIDString(v16, v68, v69);
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = sub_1A7BE22EC;
      v87[3] = &unk_1E5D1AF28;
      v87[4] = self;
      v72 = objc_msgSend_initWithQueue_interval_repeats_userInfo_handlerBlock_(v62, v71, (uint64_t)v63, (unint64_t)fmax(v67, 20.0), 0, v70, v87);

      objc_msgSend_setObject_forKey_(self->_deathTimerMap, v73, (uint64_t)v72, v19);
    }
  }
  else
  {
    v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v16;
      _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_ERROR, "Cannot map Message: %@   no ID!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)_clearMapForMessageID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v4;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "_clearMapForMessageID: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v32 = v4;
    _IDSLogV();
  }
  objc_msgSend__invalidateTimerForMessageID_(self, v6, (uint64_t)v4, v32);
  objc_msgSend__invalidateDeathTimerForMessageID_(self, v7, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_ftMessageMap, v8, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_apsMessageMap, v9, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_retriesMap, v10, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_timerMap, v11, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_bodyMap, v12, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_deathTimerMap, v13, (uint64_t)v4);
  if (!objc_msgSend_count(self->_deathTimerMap, v14, v15))
  {
    deathTimerMap = self->_deathTimerMap;
    self->_deathTimerMap = 0;
  }
  if (!objc_msgSend_count(self->_ftMessageMap, v16, v17))
  {
    ftMessageMap = self->_ftMessageMap;
    self->_ftMessageMap = 0;
  }
  if (!objc_msgSend_count(self->_apsMessageMap, v19, v20))
  {
    apsMessageMap = self->_apsMessageMap;
    self->_apsMessageMap = 0;
  }
  if (!objc_msgSend_count(self->_bodyMap, v22, v23))
  {
    bodyMap = self->_bodyMap;
    self->_bodyMap = 0;
  }
  if (!objc_msgSend_count(self->_timerMap, v25, v26))
  {
    timerMap = self->_timerMap;
    self->_timerMap = 0;
  }
  if (!objc_msgSend_count(self->_retriesMap, v28, v29))
  {
    retriesMap = self->_retriesMap;
    self->_retriesMap = 0;
  }
}

- (BOOL)_isBusyWithMessage:(id)a3
{
  v3 = objc_msgSend_allKeysForObject_(self->_apsMessageMap, a2, (uint64_t)a3);
  BOOL v6 = objc_msgSend_count(v3, v4, v5) != 0;

  return v6;
}

- (id)_currentAPSMessages
{
  return (id)objc_msgSend_allValues(self->_apsMessageMap, a2, v2);
}

- (id)_currentMessages
{
  return (id)objc_msgSend_allValues(self->_ftMessageMap, a2, v2);
}

- (id)allMessages
{
  id v4 = objc_msgSend_queuedMessages(self, a2, v2);
  id v7 = (id)objc_msgSend_mutableCopy(v4, v5, v6);

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v10 = objc_msgSend__currentMessages(self, v8, v9);
  objc_msgSend_addObjectsFromArray_(v7, v11, (uint64_t)v10);

  return v7;
}

- (id)_currentTimers
{
  return (id)objc_msgSend_allValues(self->_timerMap, a2, v2);
}

- (int64_t)_retryCountForMessage:(id)a3
{
  retriesMap = self->_retriesMap;
  id v4 = objc_msgSend_uniqueIDString(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_objectForKey_(retriesMap, v5, (uint64_t)v4);
  int64_t v9 = (int)objc_msgSend_intValue(v6, v7, v8);

  return v9;
}

- (id)_bodyForMessage:(id)a3
{
  bodyMap = self->_bodyMap;
  id v4 = objc_msgSend_uniqueIDString(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_objectForKey_(bodyMap, v5, (uint64_t)v4);

  return v6;
}

- (id)_messageForAPSOutgoingMessage:(id)a3
{
  id v4 = objc_msgSend_allKeysForObject_(self->_apsMessageMap, a2, (uint64_t)a3);
  id v7 = objc_msgSend___imFirstObject(v4, v5, v6);
  int64_t v9 = objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);

  return v9;
}

- (id)_apsOutgoingMessageForFTMessage:(id)a3
{
  id v4 = objc_msgSend_allKeysForObject_(self->_ftMessageMap, a2, (uint64_t)a3);
  id v7 = objc_msgSend___imFirstObject(v4, v5, v6);
  int64_t v9 = objc_msgSend_objectForKey_(self->_apsMessageMap, v8, (uint64_t)v7);

  return v9;
}

- (BOOL)_fillMessageParameters:(id *)a3 ftMessage:(id *)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v8 = *a3;
    id v9 = *a4;
    if (v8)
    {
      if (v9) {
        return 1;
      }
    }
    else
    {
      objc_msgSend__apsOutgoingMessageForFTMessage_(self, a2, (uint64_t)v9);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      *a3 = v8;
      id v10 = *a4;
      if (*a4) {
        return v8 && v10 != 0;
      }
    }
    objc_msgSend__messageForAPSOutgoingMessage_(self, a2, (uint64_t)v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v10;
    id v8 = *a3;
    return v8 && v10 != 0;
  }
  return result;
}

- (BOOL)_shouldSendSOSForFailure:(id)a3
{
  id v5 = a3;
  if (!qword_1EB47C760)
  {
    uint64_t v6 = (void **)MEMORY[0x1AD0D4F60]("APSErrorDomain", @"ApplePushService");
    if (v6) {
      id v7 = *v6;
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C760, v7);
  }
  id v8 = objc_msgSend_domain(v5, v3, v4);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, qword_1EB47C760);

  if ((isEqualToString & 1) != 0
    || (objc_msgSend_domain(v5, v11, v12),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v15 = objc_msgSend_isEqualToString_(v13, v14, *MEMORY[0x1E4F289A0]),
        v13,
        v15))
  {
    objc_msgSend_code(v5, v11, v12);
  }

  return 0;
}

- (void)_noteMessageFailed:(id)a3 ftMessage:(id)a4 retryBehavior:(int)a5 error:(id)a6
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v133 = a4;
  id v134 = a3;
  id v11 = a4;
  id v12 = a3;
  int v14 = objc_msgSend__fillMessageParameters_ftMessage_(self, v13, (uint64_t)&v134, &v133);
  id v15 = v134;

  id v16 = v133;
  if (!v14) {
    goto LABEL_93;
  }
  if (!qword_1EB47C770)
  {
    uint64_t v18 = (void **)MEMORY[0x1AD0D4F60]("APSErrorDomain", @"ApplePushService");
    if (v18) {
      uint64_t v19 = *v18;
    }
    else {
      uint64_t v19 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C770, v19);
  }
  uint64_t v128 = objc_msgSend__retryCountForMessage_(self, v17, (uint64_t)v16);
  v22 = objc_msgSend_domain(v10, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x1E4F289A0]);

  if (isEqualToString)
  {
    char v127 = 0;
    BOOL v29 = objc_msgSend_code(v10, v25, v26) == -1001;
    goto LABEL_14;
  }
  __int16 v30 = objc_msgSend_domain(v10, v25, v26);
  int v32 = objc_msgSend_isEqualToString_(v30, v31, qword_1EB47C770);

  if (v32)
  {
    unint64_t v33 = objc_msgSend_code(v10, v27, v28);
    if (v33 <= 7)
    {
      if (((1 << v33) & 0xC6) != 0)
      {
        BOOL v29 = 0;
        char v127 = 1;
        goto LABEL_14;
      }
      if (v33 == 3) {
        goto LABEL_93;
      }
    }
    char v127 = 1;
    BOOL v29 = 1;
  }
  else
  {
    char v127 = 0;
    BOOL v29 = 0;
  }
LABEL_14:
  if (objc_msgSend_ignoreMaxRetryCount(v16, v27, v28))
  {
    v36 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      int hasReceivedPushAck = objc_msgSend_hasReceivedPushAck(v16, v37, v38);
      v40 = @"NO";
      if (hasReceivedPushAck) {
        v40 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v128;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v40;
      _os_log_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEFAULT, "  => Message ignores max retry count set on server bag. Keep retrying (current retires %d). Has received courier ack? %@", buf, 0x12u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_43;
  }
  v43 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v34, v35);
  v45 = objc_msgSend_objectForKey_(v43, v44, @"md-retry-attempts");

  if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v46 = v45;
    uint64_t v49 = objc_msgSend_intValue(v46, v47, v48);
    BOOL v50 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v49;
      _os_log_impl(&dword_1A7BC0000, v50, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d retries", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v118 = v49;
      _IDSLogV();
    }

    uint64_t v51 = (int)v49;
  }
  else
  {
    v52 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = 2;
      _os_log_impl(&dword_1A7BC0000, v52, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for retries, using the default: %ld retries", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v118 = 2;
      _IDSLogV();
    }
    uint64_t v51 = 2;
  }

  if (v128 < v51) {
    goto LABEL_47;
  }
  v53 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = objc_msgSend_hasReceivedPushAck(v16, v54, v55);
    v57 = @"NO";
    if (v56) {
      v57 = @"YES";
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v128;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v57;
    _os_log_impl(&dword_1A7BC0000, v53, OS_LOG_TYPE_DEFAULT, "  => Message retried too many times (%d), not retrying anymore. Has received courier ack? %@", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    BOOL v29 = 0;
    if (_IDSShouldLog())
    {
LABEL_43:
      int v58 = objc_msgSend_hasReceivedPushAck(v16, v41, v42, v118);
      v59 = @"NO";
      if (v58) {
        v59 = @"YES";
      }
      uint64_t v118 = v128;
      uint64_t v120 = (uint64_t)v59;
      _IDSLogV();
    }
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_47:
  v60 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = objc_msgSend_uniqueIDString(v16, v61, v62);
    v64 = (void *)v63;
    uint64_t v65 = @"NO";
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    if (a5 == 1) {
      double v66 = @"YES";
    }
    else {
      double v66 = @"NO";
    }
    *(void *)&buf[14] = v63;
    if (v29) {
      uint64_t v65 = @"YES";
    }
    LOWORD(v136) = 1024;
    *(_DWORD *)((char *)&v136 + 2) = v128;
    HIWORD(v136) = 2112;
    v137 = v66;
    __int16 v138 = 2112;
    v139 = v65;
    _os_log_impl(&dword_1A7BC0000, v60, OS_LOG_TYPE_DEFAULT, "Noting message failed: %@   (Request ID: %@  Retries: %d  Retry Allowed: %@  Wants Retry: %@)", buf, 0x30u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v69 = objc_msgSend_uniqueIDString(v16, v67, v68, v118, v120);
    v70 = (void *)v69;
    v71 = @"NO";
    if (a5 == 1) {
      v72 = @"YES";
    }
    else {
      v72 = @"NO";
    }
    if (v29) {
      v71 = @"YES";
    }
    v124 = v72;
    v126 = v71;
    uint64_t v120 = v69;
    uint64_t v122 = v128;
    uint64_t v118 = (uint64_t)v16;
    _IDSLogV();
  }
  objc_msgSend_logFailureInfo(v16, v67, v68, v118, v120, v122, v124, v126);
  if (objc_msgSend__shouldSendSOSForFailure_(self, v73, (uint64_t)v10))
  {
    if (objc_msgSend_code(v10, v74, v75)) {
      uint64_t v78 = objc_msgSend_code(v10, v76, v77);
    }
    else {
      uint64_t v78 = 9999;
    }
    id v79 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      int v82 = objc_msgSend_code(v10, v80, v81);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v82;
      _os_log_impl(&dword_1A7BC0000, v79, OS_LOG_TYPE_DEFAULT, "FTMessageDelivery Sending SOS for APS failure that recieved response code: (HTTP Status Code: %d)", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v119 = objc_msgSend_code(v10, v83, v84);
      _IDSLogV();
    }
    id v85 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      v88 = objc_msgSend_topic(v16, v86, v87);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 0;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v78;
      *(_WORD *)&buf[20] = 2112;
      v136 = v88;
      _os_log_impl(&dword_1A7BC0000, v85, OS_LOG_TYPE_DEFAULT, "SOS Metric Domain (%d), sos type (%d), error code (%d), url (%@)", buf, 0x1Eu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_topic(v16, v89, v90);
      uint64_t v119 = 0;
      double v121 = 0.0;
      v125 = uint64_t v123 = v78;
      _IDSLogV();
    }
    id v91 = (void *)MEMORY[0x1E4F6B588];
    __int16 v92 = objc_msgSend_topic(v16, v89, v90, v119, *(void *)&v121, v123, v125);
    __int16 v94 = objc_msgSend_metricWithDomain_type_error_bagURL_(v91, v93, 0, 0, v78, v92);

    v97 = objc_msgSend_logger(MEMORY[0x1E4F6B580], v95, v96);
    objc_msgSend_logMetric_(v97, v98, (uint64_t)v94);
  }
  char v99 = !v29;
  if (a5 != 1) {
    char v99 = 1;
  }
  if (v99)
  {
    if ((v127 & 1) != 0 || ((a5 == 2) | objc_msgSend_hasReceivedPushAck(v16, v74, v75)) == 1)
    {
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(self, v74, (uint64_t)v10, 20001, v16);
    }
    else if ((objc_msgSend_hasReceivedPushAck(v16, v74, v114) & 1) == 0)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = sub_1A7BE374C;
      v129[3] = &unk_1E5D1B1F0;
      objc_copyWeak(&v130, (id *)buf);
      v116 = objc_msgSend_numberWithInteger_(NSNumber, v115, v128);
      objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v117, (uint64_t)v16, 0, 0, sel__messageAckGracePeriodTimedOut_, v129, v116, 90.0);

      objc_destroyWeak(&v130);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    double v102 = 1.0;
    if (objc_msgSend_wantsCustomRetryInterval(v16, v74, v75))
    {
      objc_msgSend_customRetryInterval(v16, v100, v101);
      double v102 = v103;
    }
    v104 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v102;
      _os_log_impl(&dword_1A7BC0000, v104, OS_LOG_TYPE_DEFAULT, "  => Will retry message: %@ in %f seconds", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      double v121 = v102;
      uint64_t v119 = (uint64_t)v16;
      _IDSLogV();
    }
    v107 = objc_msgSend_connection(self, v105, v106, v119, *(void *)&v121);
    objc_msgSend_cancelOutgoingMessage_(v107, v108, (uint64_t)v15);

    objc_msgSend_setHasReceivedPushAck_(v16, v109, 0);
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = sub_1A7BE364C;
    v131[3] = &unk_1E5D1B1F0;
    objc_copyWeak(&v132, (id *)buf);
    v112 = objc_msgSend_numberWithInteger_(NSNumber, v110, v128 + 1);
    double v113 = 1.0;
    if (v102 >= 1.0) {
      double v113 = v102;
    }
    objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v111, (uint64_t)v16, 0, 0, sel__messageNeedsRetry_, v131, v112, v113);

    objc_destroyWeak(&v132);
    objc_destroyWeak((id *)buf);
  }
LABEL_93:
}

- (void)_noteMessageSucceeded:(id)a3 ftMessage:(id)a4 error:(id)a5 result:(id)a6 resultCode:(int64_t)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v44 = a4;
  id v45 = a3;
  id v14 = a4;
  id v15 = a3;
  int v17 = objc_msgSend__fillMessageParameters_ftMessage_(self, v16, (uint64_t)&v45, &v44);
  id v18 = v45;

  id v19 = v44;
  if (v17)
  {
    v22 = objc_msgSend_uniqueIDString(v19, v20, v21);
    objc_msgSend_setHasReceivedPushAck_(v19, v23, 1);
    __int16 v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v19;
      __int16 v48 = 2048;
      int64_t v49 = a7;
      _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, "Informing delegate about message %@ with resultCode %ld", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v39 = v19;
      int64_t v41 = a7;
      _IDSLogV();
    }
    objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v25, (uint64_t)v19, 0, v13, a7, 1, v39, v41);
    uint64_t v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v19, v27, v28);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      int v32 = objc_msgSend_count(self->_ftMessageMap, v30, v31);
      *(_DWORD *)buf = 138412802;
      id v47 = v19;
      __int16 v48 = 2112;
      int64_t v49 = (int64_t)v29;
      __int16 v50 = 1024;
      int v51 = v32;
      _os_log_impl(&dword_1A7BC0000, v26, OS_LOG_TYPE_DEFAULT, "Noting message success: %@   (Request ID: %@   %d remaining)", buf, 0x1Cu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v42 = objc_msgSend_uniqueIDString(v19, v33, v34);
      uint64_t v43 = objc_msgSend_count(self->_ftMessageMap, v35, v36);
      id v40 = v19;
      _IDSLogV();
    }
    objc_msgSend__clearMapForMessageID_(self, v33, (uint64_t)v22, v40, v42, v43);
    objc_msgSend__dequeueIfNeeded(self, v37, v38);
  }
}

- (void)_noteMessageACKd:(id)a3 ftMessage:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v35 = a3;
  id v6 = a4;
  id v7 = a3;
  int v9 = objc_msgSend__fillMessageParameters_ftMessage_(self, v8, (uint64_t)&v35, &v34);
  id v10 = v35;

  id v11 = v34;
  if (v9)
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v11, v13, v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int v18 = objc_msgSend_count(self->_ftMessageMap, v16, v17);
      *(_DWORD *)buf = 138412802;
      id v37 = v11;
      __int16 v38 = 2112;
      id v39 = v15;
      __int16 v40 = 1024;
      int v41 = v18;
      _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, "Noting message ack'd: %@   (Request ID: %@   %d remaining)", buf, 0x1Cu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      int v32 = objc_msgSend_uniqueIDString(v11, v19, v20);
      uint64_t v33 = objc_msgSend_count(self->_ftMessageMap, v21, v22);
      id v31 = v11;
      _IDSLogV();
    }
    uint64_t v23 = objc_msgSend_originalTimestamp(v11, v19, v20, v31, v32, v33);
    BOOL v24 = v23 == 0;

    if (v24)
    {
      uint64_t v27 = objc_msgSend_pushAckTimestamp(v11, v25, v26);
      objc_msgSend_setOriginalTimestamp_(v11, v28, (uint64_t)v27);
    }
    objc_msgSend_setHasReceivedPushAck_(v11, v25, 1);
    objc_msgSend__dequeueIfNeeded(self, v29, v30);
  }
}

- (void)_noteMessageSent:(id)a3 ftMessage:(id)a4 body:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v88 = a4;
  id v89 = a3;
  id v9 = a4;
  id v10 = a3;
  int v12 = objc_msgSend__fillMessageParameters_ftMessage_(self, v11, (uint64_t)&v89, &v88);
  id v13 = v89;

  id v14 = v88;
  if (v12)
  {
    uint64_t v17 = objc_msgSend_uniqueIDString(v14, v15, v16);
    if (objc_msgSend_wantsAPSRetries(v14, v18, v19)
      && objc_msgSend_highPriority(v14, v20, v21))
    {
      uint64_t v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "   => Setting ack timeout time, this will use APS retries", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      uint64_t v24 = objc_msgSend__retryCountForMessage_(self, v23, (uint64_t)v14);
      uint64_t v27 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v25, v26);
      id v29 = objc_msgSend_objectForKey_(v27, v28, @"md-retry-start-interval");

      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v30 = v29;
        objc_msgSend_doubleValue(v30, v31, v32);
        double v34 = v33;
        id v35 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v34;
          _os_log_impl(&dword_1A7BC0000, v35, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a retry interval of %f ", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v82 = *(void *)&v34;
          _IDSLogV();
        }
      }
      else
      {
        __int16 v50 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = 0x404E000000000000;
          _os_log_impl(&dword_1A7BC0000, v50, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for interval , using the default: %f interval", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v82 = 0x404E000000000000;
          _IDSLogV();
        }
        double v34 = 60.0;
      }

      if (objc_msgSend_wantsCustomRetryInterval(v14, v51, v52))
      {
        objc_msgSend_customRetryInterval(v14, v53, v54);
        double v34 = v55;
      }
      double v56 = v34 * (double)(v24 + 1);
      v57 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v24;
        __int16 v91 = 2048;
        double v92 = v56;
        _os_log_impl(&dword_1A7BC0000, v57, OS_LOG_TYPE_DEFAULT, "Message has used %ld retries, Retry timeout time with multiplier will be %f", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        double v83 = v56;
        uint64_t v82 = v24;
        _IDSLogV();
      }
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = sub_1A7BE4604;
      v86[3] = &unk_1E5D1B1F0;
      objc_copyWeak(&v87, (id *)buf);
      objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v58, (uint64_t)v14, v13, v8, sel__messageACKTimedOut_, v86, 0, v56);
      objc_destroyWeak(&v87);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v36 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_timeout(v14, v37, v38);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v39;
        _os_log_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEFAULT, "   => Setting send timeout time: %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_timeout(v14, v40, v41);
        uint64_t v82 = v42;
        _IDSLogV();
      }
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      objc_msgSend_timeout(v14, v43, v44);
      double v46 = v45;
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = sub_1A7BE4704;
      v84[3] = &unk_1E5D1B1F0;
      objc_copyWeak(&v85, (id *)buf);
      objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v47, (uint64_t)v14, v13, v8, sel__messageSendTimedOut_, v84, 0, v46 + 2.0);
      objc_destroyWeak(&v85);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v59 = objc_msgSend_payloadLength(v13, v48, v49, v82, *(void *)&v83);
    objc_msgSend_setSentByteCount_(v14, v60, v59);
    BOOL v61 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v14, v62, v63);
      id v64 = (id)objc_claimAutoreleasedReturnValue();
      int v67 = objc_msgSend_count(self->_ftMessageMap, v65, v66);
      uint64_t v69 = objc_msgSend_objectForKey_(self->_retriesMap, v68, (uint64_t)v17);
      int v72 = objc_msgSend_intValue(v69, v70, v71);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v91 = 2112;
      double v92 = *(double *)&v64;
      __int16 v93 = 1024;
      int v94 = v67;
      __int16 v95 = 1024;
      int v96 = v72;
      _os_log_impl(&dword_1A7BC0000, v61, OS_LOG_TYPE_DEFAULT, "Noting message sent: %@   (Request ID: %@  Remaining: %d  Attempt: %d)", buf, 0x22u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v75 = objc_msgSend_uniqueIDString(v14, v73, v74);
      objc_msgSend_count(self->_ftMessageMap, v76, v77);
      id v79 = objc_msgSend_objectForKey_(self->_retriesMap, v78, (uint64_t)v17);
      objc_msgSend_intValue(v79, v80, v81);
      _IDSLogV();
    }
  }
}

- (void)_sendMessage:(id)a3 ftMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A7BE48D0;
  v11[3] = &unk_1E5D1B218;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend__apsMessageForMessage_body_completion_(self, v10, (uint64_t)v9, v8, v11);
}

- (void)_messageACKTimedOut:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_userInfo(v4, v5, v6);
  id v9 = objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  if (v9)
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_msgSend_uniqueIDString(v9, v11, v12);
      *(_DWORD *)buf = 138412546;
      int v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server ack for message: %@   (Request ID: %@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      uint64_t v23 = v22 = v9;
      _IDSLogV();
    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      uint64_t v23 = v22 = v9;
      _IMAlwaysLog();
    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      uint64_t v23 = v22 = v9;
      MarcoNoteCheckpoint();
    }
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, *MEMORY[0x1E4F289A0], -1001, 0, v22, v23);
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 1, v20);
  }
}

- (void)_messageSendTimedOut:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_userInfo(v4, v5, v6);
  id v9 = objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  if (v9)
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_msgSend_uniqueIDString(v9, v11, v12);
      *(_DWORD *)buf = 138412546;
      int v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server response for message: %@   (Request ID: %@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      uint64_t v23 = v22 = v9;
      _IDSLogV();
    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      uint64_t v23 = v22 = v9;
      _IMAlwaysLog();
    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      uint64_t v23 = v22 = v9;
      MarcoNoteCheckpoint();
    }
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, *MEMORY[0x1E4F289A0], -1001, 0, v22, v23);
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 1, v20);
  }
}

- (void)_messageCompletelyTimedOut:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_userInfo(v4, v5, v6);
  id v9 = objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  if (v9)
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_msgSend_uniqueIDString(v9, v11, v12);
      *(_DWORD *)buf = 138412546;
      int v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server response for message: %@   (Request ID: %@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      uint64_t v23 = v22 = v9;
      _IDSLogV();
    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      uint64_t v23 = v22 = v9;
      _IMAlwaysLog();
    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      uint64_t v23 = v22 = v9;
      MarcoNoteCheckpoint();
    }
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, *MEMORY[0x1E4F289A0], -1001, 0, v22, v23);
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 0, v20);
  }
}

- (void)_messageNeedsRetry:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_userInfo(v4, v5, v6);
  id v9 = objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  uint64_t v11 = objc_msgSend__retryCountForMessage_(self, v10, (uint64_t)v9);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend_removeObjectForKey_(self->_bodyMap, v12, (uint64_t)v7);
    objc_msgSend_removeObjectForKey_(self->_apsMessageMap, v13, (uint64_t)v7);
    uint64_t v15 = objc_msgSend_numberWithInteger_(NSNumber, v14, v11);
    objc_msgSend_setRetryCount_(v9, v16, (uint64_t)v15);
  }
  uint64_t v17 = objc_msgSend_objectForKey_(self->_apsMessageMap, v12, (uint64_t)v7);
  uint64_t v19 = objc_msgSend__bodyForMessage_(self, v18, (uint64_t)v9);
  if (v9)
  {
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_msgSend_uniqueIDString(v9, v21, v22);
      *(_DWORD *)buf = 138412546;
      id v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "Starting retry for message: %@   (Request ID: %@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v24, v25);
      v32 = id v31 = v17;
      _IDSLogV();
    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v26, v27);
      v32 = id v31 = v17;
      _IMAlwaysLog();
    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v28, v29);
      v32 = id v31 = v17;
      MarcoNoteCheckpoint();
    }
    objc_msgSend__sendMessage_ftMessage_(self, v28, (uint64_t)v19, v9, v31, v32);
  }
  else
  {
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v4;
      __int16 v35 = 2112;
      uint64_t v36 = v7;
      _os_log_impl(&dword_1A7BC0000, v30, OS_LOG_TYPE_ERROR, "Missing message for retry!  (timer: %@   messageID: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)_messageAckGracePeriodTimedOut:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_userInfo(v4, v5, v6);
  id v9 = objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  if (v9)
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_msgSend_uniqueIDString(v9, v11, v12);
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server response after final grace period for message: %@   (Request ID: %@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      uint64_t v23 = v22 = v9;
      _IDSLogV();
    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      uint64_t v23 = v22 = v9;
      _IMAlwaysLog();
    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      uint64_t v23 = v22 = v9;
      MarcoNoteCheckpoint();
    }
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, *MEMORY[0x1E4F289A0], -1001, 0, v22, v23);
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 2, v20);
  }
}

- (id)_requiredTopicsWithUltraConstrainedTopics:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v49 = 0;
  __int16 v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = sub_1A7BE5B74;
  v53 = sub_1A7BE5B84;
  id v54 = 0;
  id v8 = objc_msgSend_currentMessage(self, v6, v7);
  uint64_t v11 = objc_msgSend_topic(v8, v9, v10);

  if (objc_msgSend_length(v11, v12, v13))
  {
    objc_msgSend_addObject_(v5, v14, (uint64_t)v11);
    if (a3)
    {
      uint64_t v17 = objc_msgSend_currentMessage(self, v15, v16);
      int v20 = objc_msgSend_ultraConstrainedAllowed(v17, v18, v19);

      if (v20)
      {
        uint64_t v22 = (void *)v50[5];
        if (!v22)
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          uint64_t v24 = (void *)v50[5];
          v50[5] = (uint64_t)v23;

          uint64_t v22 = (void *)v50[5];
        }
        objc_msgSend_addObject_(v22, v21, (uint64_t)v11);
      }
    }
  }

  uint64_t v27 = objc_msgSend_queuedMessages(self, v25, v26);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1A7BE5B8C;
  v46[3] = &unk_1E5D1B240;
  id v28 = v5;
  id v47 = v28;
  __int16 v48 = &v49;
  objc_msgSend_enumerateObjectsUsingBlock_(v27, v29, (uint64_t)v46);

  uint64_t v32 = objc_msgSend__currentMessages(self, v30, v31);
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  uint64_t v42 = sub_1A7BE5C44;
  uint64_t v43 = &unk_1E5D1B240;
  id v33 = v28;
  id v44 = v33;
  double v45 = &v49;
  objc_msgSend_enumerateObjectsUsingBlock_(v32, v34, (uint64_t)&v40);

  if (a3)
  {
    uint64_t v37 = (void *)v50[5];
    if (v37)
    {
      objc_msgSend_allObjects(v37, v35, v36, v40, v41, v42, v43);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v38 = objc_msgSend_allObjects(v33, v35, v36, v40, v41, v42, v43);

  _Block_object_dispose(&v49, 8);

  return v38;
}

- (void)_updateTopics
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v33 = 0;
  v3 = objc_msgSend__requiredTopicsWithUltraConstrainedTopics_(self, a2, (uint64_t)&v33);
  id v4 = v33;
  uint64_t v7 = objc_msgSend_count(self->_enabledTopics, v5, v6);
  if (v7 == objc_msgSend_count(v3, v8, v9)) {
    int v11 = objc_msgSend_isEqualToArray_(self->_enabledTopics, v10, (uint64_t)v3) ^ 1;
  }
  else {
    int v11 = 1;
  }
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v35 = v3;
    _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, "Enabling required topics: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v32 = v3;
    _IDSLogV();
  }
  if (v11)
  {
    objc_msgSend__setEnabledTopics_(self, v13, (uint64_t)v3);
    uint64_t v16 = (NSMutableArray *)objc_msgSend_mutableCopy(v3, v14, v15);
    enabledTopics = self->_enabledTopics;
    self->_enabledTopics = v16;
  }
  else
  {
    int v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEBUG, "  => Skipping, already enabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  uint64_t v21 = objc_msgSend_count(self->_ultraConstrainedTopics, v18, v19, v32);
  if (v21 != objc_msgSend_count(v4, v22, v23)
    || (objc_msgSend_isEqualToArray_(self->_ultraConstrainedTopics, v24, (uint64_t)v4) & 1) == 0)
  {
    uint64_t v26 = objc_msgSend_connection(self, v24, v25);
    objc_msgSend_setUltraConstrainedTopics_(v26, v27, (uint64_t)v4);

    id v30 = (NSArray *)objc_msgSend_copy(v4, v28, v29);
    ultraConstrainedTopics = self->_ultraConstrainedTopics;
    self->_ultraConstrainedTopics = v30;
  }
}

- (void)_apsMessageBodyForMessage:(id)a3 completion:(id)a4
{
  uint64_t v249 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v215 = a4;
  v218 = v5;
  id v219 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_msgSend_messageBodyUsingCache(v5, v6, v7);
  uint64_t v11 = objc_msgSend_mutableCopy(v8, v9, v10);

  id v217 = (id)v11;
  if (!v11) {
    id v217 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v213 = objc_msgSend_bagKey(v218, v12, v13);
  v216 = objc_msgSend_topic(v218, v14, v15);
  if (v216)
  {
    theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v246 = (uint64_t)v216;
      __int16 v247 = 2112;
      id v248 = v213;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Building URL request with topic: %@  bagKey: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v203 = v216;
      v208 = v213;
      _IDSLogV();
    }
    if (!objc_msgSend_wantsHTTPHeaders(v218, v17, v18, v203, v208)) {
      goto LABEL_106;
    }
    uint64_t v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userAgent(self, v22, v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v246 = (uint64_t)v24;
      _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, "       User Agent: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v204 = objc_msgSend_userAgent(self, v25, v26);
      _IDSLogV();
    }
    v210 = objc_msgSend_userAgent(self, v25, v26, v204);
    if (objc_msgSend_length(v210, v27, v28))
    {
      uint64_t v31 = NSString;
      uint64_t v32 = objc_msgSend_sharedInstance(FTDeviceSupport, v29, v30);
      __int16 v35 = objc_msgSend_userAgentString(v32, v33, v34);
      v211 = objc_msgSend_stringWithFormat_(v31, v36, @"%@ %@", v210, v35);
    }
    else
    {
      uint64_t v32 = objc_msgSend_sharedInstance(FTDeviceSupport, v29, v30);
      v211 = objc_msgSend_userAgentString(v32, v38, v39);
    }

    uint64_t v40 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v246 = (uint64_t)v211;
      _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, "            Agent: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v205 = v211;
      _IDSLogV();
    }
    int v43 = objc_msgSend_wantsUserAgentInHeaders(v218, v41, v42, v205);
    uint64_t v46 = objc_msgSend_length(v211, v44, v45);
    if (v43)
    {
      if (!v46) {
        goto LABEL_39;
      }
      uint64_t v49 = objc_msgSend_userAgentHeaderString(v218, v47, v48);
      objc_msgSend_setObject_forKey_(v219, v50, (uint64_t)v211, v49);
    }
    else
    {
      if (!v46) {
        goto LABEL_39;
      }
      uint64_t v49 = objc_msgSend_userAgentHeaderString(v218, v47, v48);
      objc_msgSend_setObject_forKey_(v217, v51, (uint64_t)v211, v49);
    }

LABEL_39:
    if (objc_msgSend_wantsCompressedBody(v218, v47, v48))
    {
      id v54 = sub_1A7BE7358();
      BOOL v57 = objc_msgSend_length(v54, v55, v56) == 0;

      if (!v57)
      {
        int v58 = sub_1A7BE7358();
        objc_msgSend_setObject_forKey_(v219, v59, (uint64_t)v58, @"Accept-Language");
      }
    }
    v60 = objc_msgSend_additionalMessageHeadersForOutgoingPush(v218, v52, v53);
    long long v239 = 0u;
    long long v240 = 0u;
    long long v237 = 0u;
    long long v238 = 0u;
    uint64_t v63 = objc_msgSend_allKeys(v60, v61, v62);
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v237, v244, 16);
    if (v66)
    {
      uint64_t v67 = *(void *)v238;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v238 != v67) {
            objc_enumerationMutation(v63);
          }
          uint64_t v69 = *(void *)(*((void *)&v237 + 1) + 8 * i);
          v70 = objc_msgSend_objectForKey_(v60, v65, v69, v206, v209);

          if (v70)
          {
            int v72 = objc_msgSend_objectForKey_(v60, v71, v69);
            objc_msgSend_setObject_forKey_(v219, v73, (uint64_t)v72, v69);
          }
          uint64_t v74 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v60, v75, v69);
            id v76 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v246 = v69;
            __int16 v247 = 2112;
            id v248 = v76;
            _os_log_impl(&dword_1A7BC0000, v74, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v60, v65, v69);
            v209 = uint64_t v206 = v69;
            _IDSLogV();
          }
        }
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v65, (uint64_t)&v237, v244, 16);
      }
      while (v66);
    }

    id v79 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v77, v78);
    int isInternalInstall = objc_msgSend_isInternalInstall(v79, v80, v81);

    if (isInternalInstall)
    {
      id v85 = objc_msgSend_additionalInternalHeaders(v218, v83, v84);

      long long v235 = 0u;
      long long v236 = 0u;
      long long v233 = 0u;
      long long v234 = 0u;
      id v88 = objc_msgSend_allKeys(v85, v86, v87);
      uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v233, v243, 16);
      if (!v92) {
        goto LABEL_75;
      }
      uint64_t v93 = *(void *)v234;
      while (1)
      {
        for (uint64_t j = 0; j != v92; ++j)
        {
          if (*(void *)v234 != v93) {
            objc_enumerationMutation(v88);
          }
          uint64_t v95 = *(void *)(*((void *)&v233 + 1) + 8 * j);
          int v96 = objc_msgSend_wantsUserAgentInHeaders(v218, v90, v91, v206, v209);
          uint64_t v98 = objc_msgSend_objectForKey_(v85, v97, v95);

          if (v96)
          {
            if (!v98) {
              goto LABEL_68;
            }
            v100 = objc_msgSend_objectForKey_(v85, v99, v95);
            objc_msgSend_setObject_forKey_(v219, v101, (uint64_t)v100, v95);
          }
          else
          {
            if (!v98) {
              goto LABEL_68;
            }
            v100 = objc_msgSend_objectForKey_(v85, v99, v95);
            objc_msgSend_setObject_forKey_(v217, v102, (uint64_t)v100, v95);
          }

LABEL_68:
          double v103 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v85, v104, v95);
            id v105 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v246 = v95;
            __int16 v247 = 2112;
            id v248 = v105;
            _os_log_impl(&dword_1A7BC0000, v103, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v85, v90, v95);
            v209 = uint64_t v206 = v95;
            _IDSLogV();
          }
        }
        uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v90, (uint64_t)&v233, v243, 16);
        if (!v92)
        {
LABEL_75:

          goto LABEL_77;
        }
      }
    }
    id v85 = v60;
LABEL_77:
    uint64_t v106 = objc_msgSend_nonStandardMessageHeadersForOutgoingPush(v218, v83, v84, v206);

    long long v231 = 0u;
    long long v232 = 0u;
    long long v229 = 0u;
    long long v230 = 0u;
    v109 = objc_msgSend_allKeys(v106, v107, v108);
    uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v110, (uint64_t)&v229, v242, 16);
    if (v112)
    {
      uint64_t v113 = *(void *)v230;
      do
      {
        for (uint64_t k = 0; k != v112; ++k)
        {
          if (*(void *)v230 != v113) {
            objc_enumerationMutation(v109);
          }
          uint64_t v115 = *(void *)(*((void *)&v229 + 1) + 8 * k);
          v116 = objc_msgSend_objectForKey_(v106, v111, v115, v204, v209);

          if (v116)
          {
            uint64_t v118 = objc_msgSend_objectForKey_(v106, v117, v115);
            objc_msgSend_setObject_forKey_(v219, v119, (uint64_t)v118, v115);
          }
          uint64_t v120 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v106, v121, v115);
            id v122 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v246 = v115;
            __int16 v247 = 2112;
            id v248 = v122;
            _os_log_impl(&dword_1A7BC0000, v120, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v106, v111, v115);
            v209 = v204 = (void *)v115;
            _IDSLogV();
          }
        }
        uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v111, (uint64_t)&v229, v242, 16);
      }
      while (v112);
    }

    v125 = objc_msgSend_nonStandardMessageHeadersForOutgoingPush(v218, v123, v124);

    long long v227 = 0u;
    long long v228 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    uint64_t v128 = objc_msgSend_allKeys(v125, v126, v127);
    uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v225, v241, 16);
    if (v131)
    {
      uint64_t v132 = *(void *)v226;
      do
      {
        for (uint64_t m = 0; m != v131; ++m)
        {
          if (*(void *)v226 != v132) {
            objc_enumerationMutation(v128);
          }
          uint64_t v134 = *(void *)(*((void *)&v225 + 1) + 8 * m);
          v135 = objc_msgSend_objectForKey_(v125, v130, v134, v204, v209);

          if (v135)
          {
            v137 = objc_msgSend_objectForKey_(v125, v136, v134);
            objc_msgSend_setObject_forKey_(v219, v138, (uint64_t)v137, v134);
          }
          v139 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v125, v140, v134);
            id v141 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v246 = v134;
            __int16 v247 = 2112;
            id v248 = v141;
            _os_log_impl(&dword_1A7BC0000, v139, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v125, v130, v134);
            v209 = v204 = (void *)v134;
            _IDSLogV();
          }
        }
        uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v130, (uint64_t)&v225, v241, 16);
      }
      while (v131);
    }

LABEL_106:
    if (objc_msgSend_wantsCompressedBody(v218, v19, v20, v204))
    {
      v144 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        int CanBeLogged = objc_msgSend_payloadCanBeLogged(v218, v145, v146);
        if (CanBeLogged)
        {
          objc_msgSend_description(v217, v147, v148);
          v150 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v150 = @"(Not Loggable)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v246 = (uint64_t)v150;
        _os_log_impl(&dword_1A7BC0000, v144, OS_LOG_TYPE_DEFAULT, "Body: %@", buf, 0xCu);
        if (CanBeLogged) {
      }
        }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        if (objc_msgSend_payloadCanBeLogged(v218, v142, v143))
        {
          objc_msgSend_description(v217, v151, v152);
          v207 = (__CFString *)objc_claimAutoreleasedReturnValue();
          _IDSLogV();
        }
        else
        {
          v207 = @"(Not Loggable)";
          _IDSLogV();
        }
      }
    }
    if (objc_msgSend_wantsBagKey(v218, v142, v143, v207))
    {
      v155 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v153, v154);
      v158 = objc_msgSend_bagKey(v218, v156, v157);
      v160 = objc_msgSend_urlWithKey_(v155, v159, (uint64_t)v158);

      v163 = objc_msgSend_absoluteString(v160, v161, v162);
      if (v163)
      {
        CFDictionarySetValue(theDict, @"u", v163);
      }
      else
      {
        v164 = MEMORY[0x1E4F14500];
        id v165 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
          sub_1A7BFEEF8();
        }
      }
    }
    uint64_t v167 = objc_msgSend_command(v218, v153, v154);
    if (v167 >= 1)
    {
      v168 = objc_msgSend_numberWithInt_(NSNumber, v166, v167);
      if (v168)
      {
        CFDictionarySetValue(theDict, @"c", v168);
      }
      else
      {
        v169 = MEMORY[0x1E4F14500];
        id v170 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR)) {
          sub_1A7BFEE70();
        }
      }
    }
    BOOL v171 = objc_msgSend_count(v217, v166, v167) == 0;
    int v174 = objc_msgSend_wantsCompressedBody(v218, v172, v173);
    if (v171)
    {
      if (v174)
      {
        v178 = objc_msgSend_dictionary(MEMORY[0x1E4F1C9E8], v175, v176);
        objc_msgSend_setObject_forKey_(theDict, v179, (uint64_t)v178, @"p");
      }
    }
    else if (v174)
    {
      id v177 = v217;
      if (v177)
      {
        CFDictionarySetValue(theDict, @"p", v177);
      }
      else
      {
        v180 = MEMORY[0x1E4F14500];
        id v181 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR)) {
          sub_1A7BFEDE8();
        }
      }
    }
    else
    {
      objc_msgSend_addEntriesFromDictionary_(theDict, v175, (uint64_t)v217);
    }
    if (objc_msgSend_count(v219, v175, v176) && objc_msgSend_wantsHTTPHeaders(v218, v182, v183))
    {
      id v184 = v219;
      if (v184)
      {
        CFDictionarySetValue(theDict, @"h", v184);
      }
      else
      {
        v185 = MEMORY[0x1E4F14500];
        id v186 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR)) {
          sub_1A7BFED60();
        }
      }
    }
    if (objc_msgSend_wantsIntegerUniqueIDs(v218, v182, v183))
    {
      v189 = NSNumber;
      uint64_t v190 = objc_msgSend_uniqueID(v218, v187, v188);
      v192 = objc_msgSend_numberWithUnsignedLongLong_(v189, v191, v190);
      if (v192)
      {
LABEL_153:
        CFDictionarySetValue(theDict, @"i", v192);
LABEL_161:

        v220[0] = MEMORY[0x1E4F143A8];
        v220[1] = 3221225472;
        v220[2] = sub_1A7BE73B0;
        v220[3] = &unk_1E5D1B268;
        id v221 = v219;
        id v197 = v218;
        id v222 = v197;
        v198 = theDict;
        v223 = v198;
        id v224 = v215;
        v199 = (void (**)(void, void))MEMORY[0x1AD0D56D0](v220);
        if (objc_msgSend_wantsSignature(v197, v200, v201)) {
          objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(self, v202, (uint64_t)v197, 1, 0, 0, v199);
        }
        else {
          v199[2](v199, 0);
        }

        goto LABEL_165;
      }
      v195 = MEMORY[0x1E4F14500];
      id v196 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFECD8();
      }
    }
    else
    {
      v192 = objc_msgSend_uniqueIDString(v218, v187, v188);
      if (v192) {
        goto LABEL_153;
      }
      v193 = MEMORY[0x1E4F14500];
      id v194 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFECD8();
      }
    }

    goto LABEL_161;
  }
  uint64_t v37 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v246 = (uint64_t)v218;
    _os_log_impl(&dword_1A7BC0000, v37, OS_LOG_TYPE_DEFAULT, "Cannot send message: Empty topic requested for message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (MarcoShouldLogCheckpoints()) {
    MarcoNoteCheckpoint();
  }
  (*((void (**)(id, void))v215 + 2))(v215, 0);
LABEL_165:
}

- (void)_apsMessageForMessage:(id)a3 body:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1A7BE78C8;
  v16[3] = &unk_1E5D1B068;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v18 = v10;
  id v12 = v10;
  uint64_t v13 = MEMORY[0x1AD0D56D0](v16);
  uint64_t v15 = (void *)v13;
  if (v9) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v9);
  }
  else {
    objc_msgSend__apsMessageBodyForMessage_completion_(self, v14, (uint64_t)v11, v13);
  }
}

- (void)_powerLogEvent:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (qword_1EB47C7C0 != -1) {
    dispatch_once(&qword_1EB47C7C0, &unk_1EFE07680);
  }
  if (off_1EB47C7B8) {
    off_1EB47C7B8(2, v6, v5, 0);
  }
}

- (void)_notifyDelegateAboutError:(id)a3 resultCode:(int64_t)a4 forMessage:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v12 = objc_msgSend_uniqueIDString(v8, v10, v11);
  objc_msgSend__clearMapForMessageID_(self, v13, (uint64_t)v12);

  objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v14, (uint64_t)v8, v9, 0, a4, 1);

  objc_msgSend__dequeueIfNeeded(self, v15, v16);
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "invalidating: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend__queue(v4, v5, v6);
  objc_msgSend_removeAllMessages(v7, v8, v9);

  objc_msgSend__updateTopics(v4, v10, v11);
  objc_sync_exit(v4);
}

- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Requesting async send: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v5;
    _IDSLogV();
  }
  id v10 = objc_msgSend_bagKey(v5, v8, v9, v15);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1A7BE8078;
  v16[3] = &unk_1E5D1ADC8;
  id v11 = v10;
  id v17 = v11;
  id v12 = v5;
  id v18 = v12;
  uint64_t v19 = v6;
  objc_msgSend__apsMessageBodyForMessage_completion_(v6, v13, (uint64_t)v12, v16);

  objc_sync_exit(v6);
  return 1;
}

- (void)_dequeueIfNeeded
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v160 = _os_activity_create(&dword_1A7BC0000, "APS dequeue message", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v160, &state);
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v10 = objc_msgSend__queue(v7, v8, v9);
  BOOL v13 = objc_msgSend_count(v10, v11, v12) == 0;

  if (!v13)
  {
    uint64_t v16 = objc_msgSend__queue(v7, v14, v15);
    uint64_t v19 = objc_msgSend_topMessage(v16, v17, v18);

    if (objc_msgSend_isIDSMessage(v19, v20, v21) && objc_msgSend_wantsBagKey(v19, v22, v23))
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v24, v25);
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isLoaded(v26, v27, v28) & 1) == 0)
      {
        uint64_t v74 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v74, OS_LOG_TYPE_DEFAULT, "Server bag is not loaded, waiting for it", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        if (objc_msgSend_isServerAvailable(v26, v75, v76))
        {
          uint64_t v77 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v77, OS_LOG_TYPE_DEFAULT, " => Server is available", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          if ((objc_msgSend_isLoading(v26, v78, v79) & 1) == 0)
          {
            v111 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7BC0000, v111, OS_LOG_TYPE_DEFAULT, " => Starting load", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
            objc_msgSend_startBagLoad(v26, v112, v113);
            goto LABEL_148;
          }
          id v80 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v80, OS_LOG_TYPE_DEFAULT, " => Already loading", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0) {
            goto LABEL_148;
          }
        }
        else
        {
          uint64_t v93 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v93, OS_LOG_TYPE_DEFAULT, " => Server not available", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
            goto LABEL_148;
          }
        }
        _IDSLogV();
        goto LABEL_148;
      }
    }
    else
    {
      uint64_t v31 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v31, OS_LOG_TYPE_DEFAULT, " => Server bag not needed, proceeding", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
    if (objc_msgSend_busy(v7, v29, v30))
    {
      uint64_t v34 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v34, OS_LOG_TYPE_DEFAULT, "We're already busy, not pulling from queue", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      goto LABEL_149;
    }
    uint64_t v38 = objc_msgSend__queue(v7, v32, v33);
    uint64_t v41 = objc_msgSend_dequeueTopMessage(v38, v39, v40);

    if ((objc_msgSend_isValidMessage(v41, v42, v43) & 1) == 0)
    {
      uint64_t v63 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v63, OS_LOG_TYPE_DEFAULT, "Cancelling message delivery! invalid message!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      id v64 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        int CanBeLogged = objc_msgSend_payloadCanBeLogged(v41, v65, v66);
        if (CanBeLogged)
        {
          uint64_t v19 = objc_msgSend_messageBodyUsingCache(v41, v67, v68);
          v3 = objc_msgSend_description(v19, v69, v70);
          id v4 = objc_msgSend_service(v41, v71, v72);
          IDSLoggableDescriptionForObjectOnService();
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v73 = @"(Not Loggable)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = v73;
        _os_log_impl(&dword_1A7BC0000, v64, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if (CanBeLogged)
        {
        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        int v98 = objc_msgSend_payloadCanBeLogged(v41, v94, v95);
        if (v98)
        {
          id v64 = objc_msgSend_messageBodyUsingCache(v41, v96, v97);
          int CanBeLogged = objc_msgSend_description(v64, v99, v100);
          v3 = objc_msgSend_service(v41, v101, v102);
          IDSLoggableDescriptionForObjectOnService();
          double v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v103 = @"(Not Loggable)";
        }
        uint64_t v157 = v103;
        _IDSLogV();
        if (v98)
        {
        }
      }
      v109 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v94, 5003, 0, v157);
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v114, (uint64_t)v109, 5003, v41);
      uint64_t v26 = 0;
      goto LABEL_147;
    }
    id v158 = 0;
    char hasRequiredKeys = objc_msgSend_hasRequiredKeys_(v41, v44, (uint64_t)&v158);
    uint64_t v26 = (__CFString *)v158;
    if ((hasRequiredKeys & 1) == 0)
    {
      uint64_t v81 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v46, v47);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF04C((uint64_t)v26, v81);
      }

      uint64_t v82 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = v26;
        _os_log_impl(&dword_1A7BC0000, v82, OS_LOG_TYPE_DEFAULT, "Cancelling message delivery! Missing keys: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v157 = v26;
        _IDSLogV();
      }
      double v83 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        v3 = objc_msgSend_payloadCanBeLogged(v41, v84, v85);
        if (v3)
        {
          int CanBeLogged = objc_msgSend_messageBodyUsingCache(v41, v86, v87);
          id v4 = objc_msgSend_description(CanBeLogged, v88, v89);
          id v5 = objc_msgSend_service(v41, v90, v91);
          IDSLoggableDescriptionForObjectOnService();
          uint64_t v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v92 = @"(Not Loggable)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = v92;
        _os_log_impl(&dword_1A7BC0000, v83, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if (v3)
        {
        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        int v119 = objc_msgSend_payloadCanBeLogged(v41, v115, v116);
        if (v119)
        {
          double v83 = objc_msgSend_messageBodyUsingCache(v41, v117, v118);
          v3 = objc_msgSend_description(v83, v120, v121);
          id v4 = objc_msgSend_service(v41, v122, v123);
          IDSLoggableDescriptionForObjectOnService();
          uint64_t v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v124 = @"(Not Loggable)";
        }
        uint64_t v157 = v124;
        _IDSLogV();
        if (v119)
        {
        }
      }
      v109 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v115, 5008, 0, v157);
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v136, (uint64_t)v109, 5008, v41);
      goto LABEL_147;
    }
    if ((objc_msgSend_ignoresNetworkConnectivity(v41, v46, v47) & 1) == 0
      && objc_msgSend_isAirplaneModeEnabled(v7->_mobileNetworkManager, v48, v49)
      && (objc_msgSend_isWiFiUsable(v7->_mobileNetworkManager, v48, v50) & 1) == 0)
    {
      v125 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v125, OS_LOG_TYPE_DEFAULT, "Message not being delivered, airplane mode is enabled", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v126 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        v3 = objc_msgSend_payloadCanBeLogged(v41, v127, v128);
        if (v3)
        {
          int CanBeLogged = objc_msgSend_messageBodyUsingCache(v41, v129, v130);
          id v4 = objc_msgSend_description(CanBeLogged, v131, v132);
          id v5 = objc_msgSend_service(v41, v133, v134);
          IDSLoggableDescriptionForObjectOnService();
          v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v135 = @"(Not Loggable)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = v135;
        _os_log_impl(&dword_1A7BC0000, v126, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if (v3)
        {
        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        int v150 = objc_msgSend_payloadCanBeLogged(v41, v137, v147);
        if (v150)
        {
          v126 = objc_msgSend_messageBodyUsingCache(v41, v148, v149);
          v3 = objc_msgSend_description(v126, v151, v152);
          id v4 = objc_msgSend_service(v41, v153, v154);
          IDSLoggableDescriptionForObjectOnService();
          v155 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v155 = @"(Not Loggable)";
        }
        uint64_t v157 = v155;
        _IDSLogV();
        if (v150)
        {
        }
      }
      goto LABEL_146;
    }
    if (objc_msgSend_shouldFailFastForMessage_(v7, v48, (uint64_t)v41))
    {
      uint64_t v52 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v52, OS_LOG_TYPE_DEFAULT, "Message not being delivered, no network, can attempt stewie", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      uint64_t v53 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v3 = objc_msgSend_payloadCanBeLogged(v41, v54, v55);
        if (v3)
        {
          int CanBeLogged = objc_msgSend_messageBodyUsingCache(v41, v56, v57);
          id v4 = objc_msgSend_description(CanBeLogged, v58, v59);
          id v5 = objc_msgSend_service(v41, v60, v61);
          IDSLoggableDescriptionForObjectOnService();
          uint64_t v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v62 = @"(Not Loggable)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = v62;
        _os_log_impl(&dword_1A7BC0000, v53, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if (v3)
        {
        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        int v141 = objc_msgSend_payloadCanBeLogged(v41, v137, v138);
        if (v141)
        {
          uint64_t v53 = objc_msgSend_messageBodyUsingCache(v41, v139, v140);
          v3 = objc_msgSend_description(v53, v142, v143);
          id v4 = objc_msgSend_service(v41, v144, v145);
          IDSLoggableDescriptionForObjectOnService();
          uint64_t v146 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v146 = @"(Not Loggable)";
        }
        uint64_t v157 = v146;
        _IDSLogV();
        if (v141)
        {
        }
      }
LABEL_146:
      v109 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v137, 10000, 0, v157);
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v156, (uint64_t)v109, 10000, v41);
LABEL_147:

      uint64_t v19 = v41;
      goto LABEL_148;
    }
    if (objc_msgSend_isTrafficDisabledOnVMForMessage_(v7, v51, (uint64_t)v41))
    {
      uint64_t v106 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v104, v105);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF008(v106);
      }

      v107 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v107, OS_LOG_TYPE_DEFAULT, "Message not being delivered, vm traffic is disable", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
      v109 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v108, 20000, 0);
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v110, (uint64_t)v109, 20000, v41);
      goto LABEL_147;
    }
    objc_msgSend__sendMessageAsynchronously_error_(v7, v104, (uint64_t)v41, 0);
    uint64_t v19 = v41;
LABEL_148:

LABEL_149:
    goto LABEL_150;
  }
  __int16 v35 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v35, OS_LOG_TYPE_DEFAULT, "Nothing left in queue, done", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  objc_msgSend__updateTopics(v7, v36, v37);
LABEL_150:
  objc_sync_exit(v7);

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (BOOL)busy
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_copy(self->_ftMessageMap, a2, v2);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = objc_msgSend_allValues(v4, v5, v6, 0);
  unint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v7);
        }
        v12 += objc_msgSend_hasReceivedPushAck(*(void **)(*((void *)&v19 + 1) + 8 * i), v9, v10) ^ 1;
      }
      unint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
    }
    while (v11);
    unint64_t v11 = v12;
  }

  BOOL v17 = objc_msgSend_maxConcurrentMessages(self, v15, v16) <= v11;
  return v17;
}

- (void)cancelMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FTMessageDelivery_APS;
  [(FTMessageDelivery *)&v27 cancelMessage:v4];
  if (v4)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling message in the queue: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v24 = v4;
      _IDSLogV();
    }
    uint64_t v7 = objc_msgSend__apsOutgoingMessageForFTMessage_(self, v6, (uint64_t)v4, v24);
    uint64_t v10 = objc_msgSend__queue(self, v8, v9);
    int v12 = objc_msgSend_removeMessage_(v10, v11, (uint64_t)v4);

    if (v12)
    {
      if (v7)
      {
        uint64_t v15 = objc_msgSend_connection(self, v13, v14);
        objc_msgSend_cancelOutgoingMessage_(v15, v16, (uint64_t)v7);

        objc_msgSend__noteMessageSucceeded_ftMessage_error_result_resultCode_(self, v17, (uint64_t)v7, v4, 0, 0, 0);
      }
      else
      {
        objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v13, (uint64_t)v4, 0, 0, 5013, 1);
      }
      long long v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v4;
        __int16 v30 = 2112;
        uint64_t v31 = v7;
        _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, "Removed message: %@   apsMessage: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v25 = v4;
        uint64_t v26 = v7;
        _IDSLogV();
      }
      if (v7) {
        objc_msgSend__dequeueIfNeeded(self, v19, v20);
      }
    }
    else
    {
      uint64_t v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v4;
        __int16 v30 = 2112;
        uint64_t v31 = v7;
        _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Message: %@ not in queue.   Current message: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v25 = v4;
        uint64_t v26 = v7;
        _IDSLogV();
      }
    }
    long long v22 = objc_msgSend_uniqueIDString(v4, v19, v20, v25, v26);
    objc_msgSend__clearMapForMessageID_(self, v23, (uint64_t)v22);
  }
}

- (BOOL)sendMessage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_msgSend__setUsingOutgoingPush_(v4, v6, 1);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v7, v8);
  objc_msgSend_setTimeSent_(v4, v9, v10);
  unint64_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, "Adding message to the queue: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = v4;
    _IDSLogV();
  }
  uint64_t v14 = objc_msgSend__queue(v5, v12, v13, v27);
  objc_msgSend_addMessage_(v14, v15, (uint64_t)v4);

  if (objc_msgSend_busy(v5, v16, v17))
  {
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_msgSend__currentMessages(v5, v21, v22);
      *(_DWORD *)buf = 138412290;
      id v30 = v23;
      _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v28 = objc_msgSend__currentMessages(v5, v24, v25);
      _IDSLogV();
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v18, v19);
  }
  objc_sync_exit(v5);

  return 1;
}

- (void)_serverBagLoaded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Server bag loaded", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (objc_msgSend_busy(self, v6, v7))
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend__currentMessages(self, v11, v12);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v16 = objc_msgSend__currentMessages(self, v14, v15);
      _IDSLogV();
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(self, v8, v9);
  }
}

- (BOOL)shouldFailFastForMessage:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()
    || (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E4F6C408], v5, v6) & 1) != 0)
  {
    goto LABEL_20;
  }
  if (!qword_1EB47C7A0)
  {
    uint64_t v9 = (void **)MEMORY[0x1AD0D4F60]("IDSServiceNameiMessage", @"IDS");
    if (v9) {
      uint64_t v10 = *v9;
    }
    else {
      uint64_t v10 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7A0, v10);
  }
  if (!qword_1EB47C7B0)
  {
    unint64_t v11 = (void **)MEMORY[0x1AD0D4F60]("IDSServiceNameiMessageLite", @"IDS");
    if (v11) {
      uint64_t v12 = *v11;
    }
    else {
      uint64_t v12 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7B0, v12);
  }
  uint64_t v13 = objc_msgSend_topic(v4, v7, v8);
  if (objc_msgSend_isEqualToIgnoringCase_(v13, v14, qword_1EB47C7A0))
  {
    char isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v15, v16);
  }
  else
  {
    uint64_t v18 = objc_msgSend_topic(v4, v15, v16);
    if ((objc_msgSend_isEqualToIgnoringCase_(v18, v19, qword_1EB47C7B0) & 1) == 0)
    {

      goto LABEL_20;
    }
    char isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v20, v21);
  }
  if ((isConnectionSuitableForIMLOverStewie & 1) == 0)
  {
LABEL_20:
    BOOL v22 = 0;
    goto LABEL_21;
  }
  BOOL v22 = 1;
LABEL_21:

  return v22;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  enabledTopics = self->_enabledTopics;
  self->_enabledTopics = 0;

  ultraConstrainedTopics = self->_ultraConstrainedTopics;
  self->_ultraConstrainedTopics = 0;
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  enabledTopics = self->_enabledTopics;
  self->_enabledTopics = 0;

  ultraConstrainedTopics = self->_ultraConstrainedTopics;
  self->_ultraConstrainedTopics = 0;
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v138 = a3;
  id v7 = a4;
  id v8 = a5;
  v142 = objc_msgSend_objectForKey_(v8, v9, @"c");
  uint64_t v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForObjectOnService();
    unint64_t v11 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v148 = v11;
    _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "received response dictionary: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v124 = IDSLoggableDescriptionForObjectOnService();
    _IDSLogV();
  }
  uint64_t v13 = objc_msgSend_objectForKey_(v8, v12, @"i", v124);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v16 = objc_msgSend_objectForKey_(v8, v15, @"i");
  uint64_t v19 = v16;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v20 = objc_msgSend_stringValue(v16, v17, v18);

    uint64_t v19 = (void *)v20;
  }
  uint64_t v140 = objc_msgSend__dataForKey_(v8, v17, @"U");
  id v24 = objc_msgSend_objectForKey_(v8, v21, @"h");
  if (v24)
  {
    BOOL v25 = objc_msgSend_intValue(v142, v22, v23) == 97;

    if (v25)
    {
      uint64_t v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_objectForKey_(v8, v27, @"h");
        uint64_t v28 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v148 = v28;
        _os_log_impl(&dword_1A7BC0000, v26, OS_LOG_TYPE_DEFAULT, "Response Headers: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v125 = objc_msgSend_objectForKey_(v8, v22, @"h");
        _IDSLogV();
      }
    }
  }
  id v29 = objc_msgSend_objectForKey_(self->_ftMessageMap, v22, (uint64_t)v19, v125);
  if (v29)
  {
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      IDSLoggableDescriptionForObjectOnService();
      uint64_t v31 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v148 = v31;
      _os_log_impl(&dword_1A7BC0000, v30, OS_LOG_TYPE_DEFAULT, "received response dictionary: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v126 = IDSLoggableDescriptionForObjectOnService();
      _IDSLogV();
    }
    int v34 = objc_msgSend_intValue(v142, v32, v33, v126);
    if (objc_msgSend_responseCommand(v29, v35, v36) == v34
      || objc_msgSend_intValue(v142, v37, v38) == 255
      || objc_msgSend_intValue(v142, v39, v40) == 101)
    {
      uint64_t v41 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        IDSLoggableDescriptionForObjectOnService();
        uint64_t v42 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v148 = v42;
        _os_log_impl(&dword_1A7BC0000, v41, OS_LOG_TYPE_DEFAULT, "received response dictionary: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v127 = IDSLoggableDescriptionForObjectOnService();
        _IDSLogV();
      }
      id v44 = objc_msgSend_objectForKey_(v8, v43, @"b", v127);

      if (v44)
      {
        uint64_t v47 = objc_msgSend_objectForKey_(v8, v45, @"b");
        objc_opt_class();
        char v48 = objc_opt_isKindOfClass();

        v139 = objc_msgSend_objectForKey_(v8, v49, @"b");
        if (v48)
        {
          uint64_t v52 = objc_msgSend__FTDataFromBase64String(v139, v50, v51);
          goto LABEL_45;
        }
        objc_opt_class();
        char v55 = objc_opt_isKindOfClass();

        if (v55)
        {
          uint64_t v52 = objc_msgSend_objectForKey_(v8, v56, @"b");
LABEL_44:
          v139 = 0;
LABEL_45:
          unint64_t v144 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v134 = v52;
          uint64_t v58 = objc_msgSend__FTDecompressData(v52, v45, v46);
          v135 = (void *)v58;
          uint64_t v59 = v134;
          if (v58) {
            uint64_t v59 = (void *)v58;
          }
          id v136 = v59;
          objc_msgSend_objectForKey_(v8, v60, @"p");
          id v63 = (id)objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            id v64 = 0;
          }
          else
          {
            uint64_t v62 = (uint64_t)v136;
            if (!v136)
            {
              id v63 = 0;
              id v64 = 0;
              goto LABEL_55;
            }
            id v143 = 0;
            uint64_t v65 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v61, (uint64_t)v136, 0, &v144, &v143);
            id v64 = (NSMutableDictionary *)v143;
            id v63 = v65;
          }
          if (!v64 && v63)
          {
            id v64 = 0;
            goto LABEL_61;
          }
LABEL_55:
          if (objc_msgSend_length(v139, v61, v62) || objc_msgSend_count(v63, v66, v67))
          {
            uint64_t v68 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v148 = v64;
              __int16 v149 = 2112;
              id v150 = v136;
              _os_log_impl(&dword_1A7BC0000, v68, OS_LOG_TYPE_ERROR, "Error decompressing body: %@  (Data: %@)", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              uint64_t v128 = v64;
              id v131 = v136;
              _IDSLogTransport();
            }
          }
LABEL_61:
          v137 = objc_msgSend_objectForKey_(v8, v61, @"h", v128, v131);
          objc_msgSend_objectForKey_(v8, v69, @"s");
          uint64_t v70 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          if (_os_feature_enabled_impl())
          {
            v73 = objc_msgSend_objectForKey_(v8, v71, @"hs");
            uint64_t v74 = MEMORY[0x1AD0D4F50](@"IDSBAASigner", @"IDS");
            if (v73)
            {
              uint64_t v75 = (void *)v74;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v75 != 0)) == 1)
              {
                uint64_t v78 = objc_msgSend_integerValue(v73, v76, v77);
                if (objc_msgSend_isBAAHTTPResponseCode_(v75, v79, v78))
                {
                  id v80 = v73;

                  uint64_t v70 = v80;
                }
              }
            }
          }
          if (v137)
          {
            uint64_t v81 = objc_msgSend_objectForKey_(v137, v71, @"X-Apple-Splunk-Hint");
            objc_msgSend_setSplunkHint_(v29, v82, (uint64_t)v81);
          }
          if ((objc_msgSend_isWebTunnelMessage(v29, v71, v72) & 1) == 0)
          {
            uint64_t v85 = sub_1A7BED028(v63);

            id v63 = (id)v85;
          }
          id v86 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v83, v84);
          objc_msgSend_setResponseReceived_(v29, v87, (uint64_t)v86);

          if (!objc_msgSend_count(v63, v88, v89))
          {
            id v90 = v8;

            id v63 = v90;
          }
          uint64_t v91 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            IDSLoggableDescriptionForObjectOnService();
            id v92 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v148 = v70;
            __int16 v149 = 2112;
            id v150 = v92;
            _os_log_impl(&dword_1A7BC0000, v91, OS_LOG_TYPE_DEFAULT, "received response code: %@  response body: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            IDSLoggableDescriptionForObjectOnService();
            uint64_t v132 = v129 = v70;
            _IDSLogV();
          }
          id v93 = objc_alloc(MEMORY[0x1E4F6B428]);
          id v133 = objc_msgSend_initWithServerResponseDictionary_(v93, v94, (uint64_t)v63);
          if (v63)
          {
            if (objc_msgSend_isIDSMessage(v29, v95, v96)) {
              objc_msgSend_handleResponseDictionary_(v29, v97, (uint64_t)v63);
            }
            else {
              objc_msgSend_handleResponseDictionary_(v29, v97, (uint64_t)v8);
            }
            objc_msgSend_objectForKey_(v63, v98, @"status", v129, v132);
            char v99 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
            if (v99)
            {
              uint64_t v100 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v148 = v99;
                _os_log_impl(&dword_1A7BC0000, v100, OS_LOG_TYPE_DEFAULT, "  Found internal status code of: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                v129 = v99;
                _IDSLogV();
              }
              uint64_t v101 = v99;

              uint64_t v70 = v101;
            }
          }
          if (objc_msgSend_wantsMultipleResponses(v29, v95, v96, v129))
          {
            v104 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7BC0000, v104, OS_LOG_TYPE_DEFAULT, "  This Message Wants Multiple responses", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
            if (objc_opt_respondsToSelector())
            {
              uint64_t v105 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A7BC0000, v105, OS_LOG_TYPE_DEFAULT, "  This Message responds to receiving updates for multipleMessages", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
              objc_msgSend_noteResponseForToken_(v29, v106, (uint64_t)v133);
            }
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_111;
            }
            if (objc_msgSend_expectingMoreResponses(v29, v107, v108))
            {
              v109 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A7BC0000, v109, OS_LOG_TYPE_DEFAULT, " More To Come, Not done yet", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
              goto LABEL_111;
            }
            uint64_t v123 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7BC0000, v123, OS_LOG_TYPE_DEFAULT, "  Last message Has Been acknowledged", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
          int v110 = objc_msgSend_intValue(v70, v102, v103);
          objc_msgSend__noteMessageSucceeded_ftMessage_error_result_resultCode_(self, v111, 0, v29, v64, v63, v110);
LABEL_111:
          v145[0] = @"CommandID";
          v145[1] = @"MessageIdentifier";
          v146[0] = v142;
          v146[1] = v19;
          v145[2] = @"Topic";
          v146[2] = v7;
          uint64_t v112 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v107, (uint64_t)v146, v145, 3);
          uint64_t v115 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v112, v113, v114);

          if (v140)
          {
            uint64_t v116 = JWUUIDPushObjectToString();
            objc_msgSend_setObject_forKeyedSubscript_(v115, v117, (uint64_t)v116, @"MessageGUID");
          }
          uint64_t v118 = objc_opt_class();
          uint64_t v120 = sub_1A7BE8888(v118, v8, (void *)*MEMORY[0x1E4F6ACC8]);
          if (v120) {
            objc_msgSend_setObject_forKeyedSubscript_(v115, v119, (uint64_t)v120, @"CommandContext");
          }
          uint64_t v121 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v148 = v115;
            _os_log_impl(&dword_1A7BC0000, v121, OS_LOG_TYPE_DEFAULT, "Logging incoming push power event: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v130 = v115;
            _IDSLogV();
          }
          objc_msgSend__powerLogEvent_dictionary_(self, v122, @"IDS IncomingPushReceived", v115, v130);

          goto LABEL_121;
        }
        uint64_t v57 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v57, OS_LOG_TYPE_ERROR, "Received an unknown object for kBodyIDKey", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
      uint64_t v52 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v53 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      ftMessageMap = self->_ftMessageMap;
      *(_DWORD *)buf = 138412290;
      uint64_t v148 = ftMessageMap;
      _os_log_impl(&dword_1A7BC0000, v53, OS_LOG_TYPE_DEFAULT, "no message found, map reads: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
LABEL_121:
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend__isBusyWithMessage_(self, v8, (uint64_t)v7))
  {
    uint64_t v10 = objc_msgSend__messageForAPSOutgoingMessage_(self, v9, (uint64_t)v7);
    unint64_t v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v10, v12, v13);
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v62 = v7;
      __int16 v63 = 2112;
      id v64 = v14;
      _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, "Server ACK'd outgoing message: %@      (Request ID: %@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v10, v15, v16);
      v60 = id v59 = v7;
      _IDSLogV();
    }
    uint64_t v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = objc_msgSend_wantsResponse(v10, v18, v19);
      uint64_t v21 = @"NO";
      if (v20) {
        uint64_t v21 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v62 = v10;
      __int16 v63 = 2112;
      id v64 = v21;
      _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "   message: %@ wants response: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      int v24 = objc_msgSend_wantsResponse(v10, v22, v23);
      BOOL v25 = @"NO";
      if (v24) {
        BOOL v25 = @"YES";
      }
      id v59 = v10;
      v60 = v25;
      _IDSLogV();
    }
    uint64_t v27 = 1000000 * objc_msgSend_ackTimestamp(v7, v22, v23, v59, v60);
    if (v27)
    {
      uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v26, v27);
      objc_msgSend_setPushAckTimestamp_(v10, v29, (uint64_t)v28);
    }
    uint64_t v30 = objc_msgSend_deliveryAcknowledgementBlock(v10, v26, v27);
    uint64_t v32 = (void *)v30;
    if (v30) {
      (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v10);
    }
    uint64_t v33 = objc_msgSend__messageForAPSOutgoingMessage_(self, v31, (uint64_t)v7);
    __int16 v35 = objc_msgSend__bodyForMessage_(self, v34, (uint64_t)v33);
    uint64_t v37 = objc_msgSend_objectForKey_(v35, v36, *MEMORY[0x1E4F6ACD0]);

    uint64_t v40 = objc_msgSend_integerValue(v37, v38, v39);
    if ((unint64_t)(v40 - 200) <= 0x27 && ((1 << (v40 + 56)) & 0x8100000FC1) != 0)
    {
      id v43 = objc_alloc(MEMORY[0x1E4F6B408]);
      uint64_t v46 = objc_msgSend_integerValue(v37, v44, v45);
      uint64_t v48 = objc_msgSend__retryCountForMessage_(self, v47, (uint64_t)v33);
      uint64_t v50 = objc_msgSend_initWithCommand_success_errorDomain_errorCode_retryCount_(v43, v49, v46, 1, 0, 0, v48);
      uint64_t v52 = objc_msgSend_loggerWithCategory_(MEMORY[0x1E4F6B550], v51, 2000);
      objc_msgSend_logMetric_(v52, v53, (uint64_t)v50);
    }
    id v54 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v41, v42);
    objc_msgSend_setRequestEnd_(v10, v55, (uint64_t)v54);

    if (objc_msgSend_wantsResponse(v10, v56, v57)) {
      objc_msgSend__noteMessageACKd_ftMessage_(self, v58, (uint64_t)v7, v10);
    }
    else {
      objc_msgSend__noteMessageSucceeded_ftMessage_error_result_resultCode_(self, v58, (uint64_t)v7, v10, 0, 0, 0);
    }
  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v112 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend__isBusyWithMessage_(self, v10, (uint64_t)v8))
  {
    if (!qword_1EB47C768)
    {
      uint64_t v13 = (void **)MEMORY[0x1AD0D4F60]("APSErrorDomain", @"ApplePushService");
      if (v13) {
        uint64_t v14 = *v13;
      }
      else {
        uint64_t v14 = 0;
      }
      objc_storeStrong((id *)&qword_1EB47C768, v14);
    }
    uint64_t v15 = objc_msgSend_domain(v9, v11, v12);
    int isEqualToString = objc_msgSend_isEqualToString_(v15, v16, qword_1EB47C768);

    if (!isEqualToString || objc_msgSend_code(v9, v18, v19) != 3)
    {
      int v20 = objc_msgSend__messageForAPSOutgoingMessage_(self, v18, (uint64_t)v8);
      uint64_t v111 = objc_msgSend_disallowRetry(self, v21, v22) ^ 1;
      uint64_t v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v114 = v9;
        __int16 v115 = 1024;
        int v116 = v111;
        _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "message delivery failed {error: %@, retryBehavior: %d}", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v105 = v9;
        uint64_t v106 = v111;
        _IDSLogV();
      }
      int v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_domain(v9, v25, v26);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        int v30 = objc_msgSend_code(v9, v28, v29);
        objc_msgSend_localizedDescription(v9, v31, v32);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v36 = objc_msgSend_userInfo(v9, v34, v35);
        uint64_t v38 = objc_msgSend_objectForKey_(v36, v37, *MEMORY[0x1E4F289C0]);
        *(_DWORD *)buf = 138413058;
        id v114 = v27;
        __int16 v115 = 1024;
        int v116 = v30;
        __int16 v117 = 2112;
        id v118 = v33;
        __int16 v119 = 2112;
        uint64_t v120 = v38;
        _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_ERROR, "FTMessageDelivery failed! Error (%@:%d): %@ %@", buf, 0x26u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v41 = objc_msgSend_domain(v9, v39, v40);
        uint64_t v44 = objc_msgSend_code(v9, v42, v43);
        uint64_t v47 = objc_msgSend_localizedDescription(v9, v45, v46);
        uint64_t v50 = objc_msgSend_userInfo(v9, v48, v49);
        uint64_t v51 = *MEMORY[0x1E4F289C0];
        v109 = objc_msgSend_objectForKey_(v50, v52, *MEMORY[0x1E4F289C0]);
        _IDSWarnV();

        char v55 = objc_msgSend_domain(v9, v53, v54, v41, v44, v47, v109);
        uint64_t v58 = objc_msgSend_code(v9, v56, v57);
        uint64_t v61 = objc_msgSend_localizedDescription(v9, v59, v60);
        id v64 = objc_msgSend_userInfo(v9, v62, v63);
        int v110 = objc_msgSend_objectForKey_(v64, v65, v51);
        _IDSLogV();

        uint64_t v68 = objc_msgSend_domain(v9, v66, v67, v55, v58, v61, v110);
        uint64_t v71 = objc_msgSend_code(v9, v69, v70);
        uint64_t v74 = objc_msgSend_localizedDescription(v9, v72, v73);
        uint64_t v77 = objc_msgSend_userInfo(v9, v75, v76);
        objc_msgSend_objectForKey_(v77, v78, v51);
        uint64_t v108 = v107 = v74;
        id v105 = v68;
        uint64_t v106 = v71;
        _IDSLogTransport();
      }
      uint64_t v79 = objc_msgSend__bodyForMessage_(self, v39, (uint64_t)v20, v105, v106, v107, v108);
      uint64_t v81 = objc_msgSend_objectForKey_(v79, v80, *MEMORY[0x1E4F6ACD0]);

      unint64_t v85 = objc_msgSend_integerValue(v81, v82, v83) - 200;
      if (v85 <= 0x27 && ((1 << v85) & 0x8100000FC1) != 0)
      {
        id v86 = objc_alloc(MEMORY[0x1E4F6B408]);
        uint64_t v89 = objc_msgSend_integerValue(v81, v87, v88);
        id v92 = objc_msgSend_domain(v9, v90, v91);
        uint64_t v95 = objc_msgSend_code(v9, v93, v94);
        uint64_t v97 = objc_msgSend__retryCountForMessage_(self, v96, (uint64_t)v20);
        char v99 = objc_msgSend_initWithCommand_success_errorDomain_errorCode_retryCount_(v86, v98, v89, 0, v92, v95, v97);

        uint64_t v101 = objc_msgSend_loggerWithCategory_(MEMORY[0x1E4F6B550], v100, 2000);
        objc_msgSend_logMetric_(v101, v102, (uint64_t)v99);
      }
      objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v84, (uint64_t)v8, v20, v111, v9);
      enabledTopics = self->_enabledTopics;
      self->_enabledTopics = 0;

      ultraConstrainedTopics = self->_ultraConstrainedTopics;
      self->_ultraConstrainedTopics = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retriesMap, 0);
  objc_storeStrong((id *)&self->_deathTimerMap, 0);
  objc_storeStrong((id *)&self->_timerMap, 0);
  objc_storeStrong((id *)&self->_apsMessageMap, 0);
  objc_storeStrong((id *)&self->_bodyMap, 0);
  objc_storeStrong((id *)&self->_startDateMap, 0);
  objc_storeStrong((id *)&self->_ftMessageMap, 0);
  objc_storeStrong((id *)&self->_ultraConstrainedTopics, 0);
  objc_storeStrong((id *)&self->_enabledTopics, 0);
  objc_storeStrong((id *)&self->_offGridConnectionMonitor, 0);

  objc_storeStrong((id *)&self->_mobileNetworkManager, 0);
}

@end