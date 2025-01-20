@interface IDSCellularLinkMonitor
+ (id)sharedInstance;
- (BOOL)_dataContextUsable:(id)a3 dataStatus:(id)a4;
- (BOOL)_updateCellularDataInterface:(BOOL)a3;
- (BOOL)_updateCellularDataInterfaceNameByConnectionState:(int)a3 isStateActiveRequired:(BOOL)a4 interfaceName:(id)a5;
- (BOOL)_updateCellularMTU;
- (BOOL)_updateDataBearerSoMask;
- (BOOL)_updateDataBearerSoMaskWithCTDataStatus:(id)a3;
- (BOOL)_updateRadioAccessTechnology;
- (BOOL)_updateRadioAccessTechnologyWithCTDataStatus:(id)a3;
- (BOOL)dataUsable;
- (BOOL)dropIPPackets:(id)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5 isRelay:(BOOL)a6 channelNumberMSB:(unsigned __int8)a7 ifname:(id)a8;
- (BOOL)isSlicedCellularInterfaceActive:(id)a3;
- (BOOL)setPacketNotificationFilter:(const sockaddr *)a3 remote:(const sockaddr *)a4 uniqueTag:(unsigned int)a5 callType:(unsigned __int8)a6 ifname:(id)a7;
- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContextSync;
- (CoreTelephonyClient)_ctClient;
- (IDSCellularLinkMonitor)init;
- (NSString)cellularDataInterfaceName;
- (__CTServerConnection)_ctServerConnection;
- (id)_getCTXPCServiceSubscriptionContext;
- (id)_getCurrentDataSimContext:(id)a3 inContextArray:(id)a4;
- (id)_getDataStatus;
- (unsigned)cellularMTU;
- (unsigned)dataSoMaskBits;
- (unsigned)radioAccessTechnology;
- (void)_notifyClientDataBearerSoMask:(id)a3;
- (void)_setupCTServerConnection;
- (void)_updateDataStatus;
- (void)addCellularLinkDelegate:(id)a3;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)currentCellularSignalStrength:(int *)a3 signalStrength:(int *)a4 signalGrade:(int *)a5;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)preferredDataSimChanged:(id)a3;
- (void)processCTConnectionStateChangeNotification:(id)a3 connectionStatus:(id)a4;
- (void)registerCellularDataStatusNotification:(BOOL)a3;
- (void)removeCellularLinkDelegate:(id)a3;
- (void)removePacketNotificationFilter;
- (void)reset;
- (void)setRemoteDeviceVersion:(unsigned int)a3;
- (void)set_ctClient:(id)a3;
- (void)set_ctServerConnection:(__CTServerConnection *)a3;
- (void)updateProtocolQualityOfService:(BOOL)a3 localAddress:(sockaddr *)a4;
@end

@implementation IDSCellularLinkMonitor

+ (id)sharedInstance
{
  if (qword_1EB2BB720 != -1) {
    dispatch_once(&qword_1EB2BB720, &unk_1EEFCD518);
  }
  v2 = (void *)qword_1EB2BB770;
  return v2;
}

- (IDSCellularLinkMonitor)init
{
  v20.receiver = self;
  v20.super_class = (Class)IDSCellularLinkMonitor;
  v2 = [(IDSCellularLinkMonitor *)&v20 init];
  if (v2)
  {
    v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "IDSCellularLinkMonitor init", v19, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"IDSCellularLinkMonitor init");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"IDSCellularLinkMonitor init");
        }
      }
    }
    objc_msgSend__setupCTServerConnection(v2, v4, v5, v6);
    objc_msgSend__updateCellularDataInterface_(v2, v7, 0, v8);
    objc_msgSend__updateRadioAccessTechnology(v2, v9, v10, v11);
    objc_msgSend__updateCellularMTU(v2, v12, v13, v14);
    objc_msgSend__updateDataStatus(v2, v15, v16, v17);
  }
  return v2;
}

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    CFRelease(ctServerConnection);
    self->_ctServerConnection = 0;
  }
  objc_msgSend_setDelegate_(self->_ctClient, a2, 0, v2);
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "IDSCellularLinkMonitor dealloc", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"IDSCellularLinkMonitor dealloc");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"IDSCellularLinkMonitor dealloc");
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)IDSCellularLinkMonitor;
  [(IDSCellularLinkMonitor *)&v6 dealloc];
}

- (void)addCellularLinkDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_19DA21568;
    v6[3] = &unk_1E5973CF8;
    v6[4] = self;
    id v7 = v4;
    IDSTransportThreadAddBlock(v6);
  }
}

- (void)removeCellularLinkDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_19DA21780;
    v6[3] = &unk_1E5973CF8;
    id v7 = v4;
    double v8 = self;
    IDSTransportThreadAddBlock(v6);
  }
}

- (void)_setupCTServerConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_ctServerConnection)
  {
    v3 = im_primary_queue();
    self->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    id v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      ctServerConnection = self->_ctServerConnection;
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = ctServerConnection;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "created CT server connection %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"created CT server connection %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"created CT server connection %@.");
      }
    }
    id v6 = objc_alloc(MEMORY[0x1E4F23A80]);
    id v7 = im_primary_queue();
    uint64_t v10 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v6, v8, (uint64_t)v7, v9);
    ctClient = self->_ctClient;
    self->_ctClient = v10;
  }
}

- (id)_getCurrentDataSimContext:(id)a3 inContextArray:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v5;
    _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "currentDataSimContext: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v25 = v5;
      _IDSLogTransport(@"GL", @"IDS", @"currentDataSimContext: %@");
      if (_IDSShouldLog())
      {
        id v25 = v5;
        _IDSLogV(0, @"IDSFoundation", @"GL", @"currentDataSimContext: %@");
      }
    }
  }
  if (!v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v6;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, v11, v30, 16);
    if (v14)
    {
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v9);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v19 = objc_msgSend_userDataPreferred(v18, v12, v13, v15, v25);
          BOOL v23 = objc_msgSend_intValue(v19, v20, v21, v22) == 0;

          if (!v23)
          {
            id v8 = v18;

            goto LABEL_19;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, v15, v30, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  id v8 = v5;
LABEL_19:

  return v8;
}

- (id)_getCTXPCServiceSubscriptionContext
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  ctClient = self->_ctClient;
  id v23 = 0;
  id v5 = objc_msgSend_getSubscriptionInfoWithError_(ctClient, a2, (uint64_t)&v23, v2);
  id v6 = v23;
  uint64_t v10 = objc_msgSend_subscriptions(v5, v7, v8, v9);

  double v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "getCTXPCServiceSubscriptionContext: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v21 = v10;
      _IDSLogTransport(@"GL", @"IDS", @"getCTXPCServiceSubscriptionContext: %@");
      if (_IDSShouldLog())
      {
        uint64_t v21 = v10;
        _IDSLogV(0, @"IDSFoundation", @"GL", @"getCTXPCServiceSubscriptionContext: %@");
      }
    }
  }
  uint64_t v14 = self->_ctClient;
  id v22 = v6;
  double v15 = objc_msgSend_getCurrentDataSubscriptionContextSync_(v14, v12, (uint64_t)&v22, v13, v21);
  id v16 = v22;

  v19 = objc_msgSend__getCurrentDataSimContext_inContextArray_(self, v17, (uint64_t)v15, v18, v10);

  return v19;
}

- (BOOL)_updateCellularDataInterfaceNameByConnectionState:(int)a3 isStateActiveRequired:(BOOL)a4 interfaceName:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (!a3 && v6)
  {
    uint64_t v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "_updateCellularDataInterfaceNameByConnectionState: connectionStatus state is inactive, return", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"_updateCellularDataInterfaceNameByConnectionState: connectionStatus state is inactive, return");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateCellularDataInterfaceNameByConnectionState: connectionStatus state is inactive, return");
        }
      }
    }
LABEL_16:
    BOOL v16 = 0;
    goto LABEL_24;
  }
  double v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "newCelularDataInterfaceName: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v20 = v9;
      _IDSLogTransport(@"GL", @"IDS", @"newCelularDataInterfaceName: %@");
      if (_IDSShouldLog())
      {
        id v20 = v9;
        _IDSLogV(0, @"IDSFoundation", @"GL", @"newCelularDataInterfaceName: %@");
      }
    }
  }
  cellularDataInterfaceName = self->_cellularDataInterfaceName;
  p_cellularDataInterfaceName = (id *)&self->_cellularDataInterfaceName;
  if (objc_msgSend_isEqualToIgnoringCase_(cellularDataInterfaceName, v12, (uint64_t)v9, v13, v20)) {
    goto LABEL_16;
  }
  double v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = *p_cellularDataInterfaceName;
    *(_DWORD *)buf = 138412546;
    id v22 = v18;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "update cellular data interface name [%@->%@].", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update cellular data interface name [%@->%@].");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update cellular data interface name [%@->%@].");
      }
    }
  }
  objc_storeStrong(p_cellularDataInterfaceName, a5);
  BOOL v16 = 1;
LABEL_24:

  return v16;
}

- (BOOL)_updateCellularDataInterface:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    BOOL v4 = a3;
    id v7 = objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, a3, v3);
    if (v7)
    {
      ctClient = self->_ctClient;
      id v28 = 0;
      uint64_t v10 = objc_msgSend_getConnectionState_connectionType_error_(ctClient, v6, (uint64_t)v7, v8, 0, &v28);
      id v11 = v28;
      v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v10;
        _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "_updateCellularDataInterface: connectionStatus: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"_updateCellularDataInterface: connectionStatus: %@");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateCellularDataInterface: connectionStatus: %@");
          }
        }
      }
      if (v10)
      {
        uint64_t v16 = objc_msgSend_state(v10, v13, v14, v15);
        id v20 = objc_msgSend_interfaceName(v10, v17, v18, v19);
        char isStateActiveRequired_interfaceName = objc_msgSend__updateCellularDataInterfaceNameByConnectionState_isStateActiveRequired_interfaceName_(self, v21, v16, v22, v4, v20);
      }
      else
      {
        uint64_t v26 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v30 = v11;
          __int16 v31 = 2112;
          id v32 = v7;
          _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "getConnectionState failed: %@ %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"getConnectionState failed: %@ %@");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"getConnectionState failed: %@ %@");
            }
          }
        }
        char isStateActiveRequired_interfaceName = 0;
      }
    }
    else
    {
      uint64_t v25 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "_updateCellularDataInterface: failed to get context", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"_updateCellularDataInterface: failed to get context");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateCellularDataInterface: failed to get context");
          }
        }
      }
      id v11 = 0;
      char isStateActiveRequired_interfaceName = 0;
    }
  }
  else
  {
    id v24 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "failed to get cellular data interface name due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get cellular data interface name due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get cellular data interface name due to invalid CT server connection.");
        }
      }
    }
    return 0;
  }
  return isStateActiveRequired_interfaceName;
}

- (id)_getDataStatus
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    BOOL v6 = objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, v2, v3);
    if (v6)
    {
      ctClient = self->_ctClient;
      id v16 = 0;
      id v9 = objc_msgSend_getDataStatus_error_(ctClient, v5, (uint64_t)v6, v7, &v16);
      id v10 = v16;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        uint64_t v14 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v10;
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "getDataStatus failed: %@ %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"getDataStatus failed: %@ %@");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"getDataStatus failed: %@ %@");
            }
          }
        }
      }
    }
    else
    {
      double v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "_getDataStatus: failed to get context", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"_getDataStatus: failed to get context");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"_getDataStatus: failed to get context");
          }
        }
      }
      id v9 = 0;
    }
  }
  else
  {
    v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "failed to get data status due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get data status due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get data status due to invalid CT server connection.");
        }
      }
    }
    id v9 = 0;
  }
  return v9;
}

- (BOOL)_updateRadioAccessTechnology
{
  BOOL v6 = objc_msgSend__getDataStatus(self, a2, v2, v3);
  if (!v6)
  {
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "_updateRadioAccessTechnology failed to get data status", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_updateRadioAccessTechnology failed to get data status");
      char updated = 0;
      if (!_IDSShouldLog()) {
        goto LABEL_10;
      }
      _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateRadioAccessTechnology failed to get data status");
    }
    char updated = 0;
    goto LABEL_10;
  }
  char updated = objc_msgSend__updateRadioAccessTechnologyWithCTDataStatus_(self, v5, (uint64_t)v6, v7);
LABEL_10:

  return updated;
}

- (BOOL)_updateRadioAccessTechnologyWithCTDataStatus:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v8 = objc_msgSend_indicator(v4, v5, v6, v7);
  int v12 = objc_msgSend_radioTechnology(v4, v9, v10, v11);
  double v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int remoteDeviceVersion = self->_remoteDeviceVersion;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)id v24 = v12;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v8;
    *(_WORD *)uint64_t v25 = 2112;
    *(void *)&v25[2] = v4;
    __int16 v26 = 1024;
    unsigned int v27 = remoteDeviceVersion;
    _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "_updateRadioAccessTechnology: radioAccessTech: %d, data indicator: %d, data status: %@, _remoteDeviceVersion: %u", buf, 0x1Eu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_updateRadioAccessTechnology: radioAccessTech: %d, data indicator: %d, data status: %@, _remoteDeviceVersion: %u");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateRadioAccessTechnology: radioAccessTech: %d, data indicator: %d, data status: %@, _remoteDeviceVersion: %u");
      }
    }
  }
  unsigned int v15 = 2;
  switch(v12)
  {
    case 0:
      break;
    case 2:
      if ((v8 - 3) >= 3) {
        unsigned int v15 = 1;
      }
      else {
        unsigned int v15 = 6;
      }
      break;
    case 3:
      unsigned int v15 = 4;
      break;
    case 4:
    case 5:
      unsigned int v15 = 3;
      break;
    case 7:
    case 8:
      goto LABEL_18;
    case 9:
      unsigned int v15 = 7;
      break;
    case 10:
      if (self->_remoteDeviceVersion == 1)
      {
        id v16 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "remote is preAzul that doesn't support NR, change NR to LTE", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"remote is preAzul that doesn't support NR, change NR to LTE");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"remote is preAzul that doesn't support NR, change NR to LTE");
            }
          }
        }
LABEL_18:
        unsigned int v15 = 5;
      }
      else
      {
        unsigned int v15 = 8;
      }
      break;
    default:
      double v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)id v24 = v12;
        _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "receive unknown RAT: %d.", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"receive unknown RAT: %d.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive unknown RAT: %d.");
          }
        }
      }
      unsigned int v15 = 10;
      break;
  }
  unsigned int radioAccessTechnology = self->_radioAccessTechnology;
  if (radioAccessTechnology != v15)
  {
    __int16 v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
      uint64_t v21 = IDSRadioAccessTechnologyToString(v15);
      *(_DWORD *)buf = 136315394;
      *(void *)id v24 = v20;
      *(_WORD *)&v24[8] = 2080;
      *(void *)uint64_t v25 = v21;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "update cellular RAT [%s->%s].", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
        IDSRadioAccessTechnologyToString(v15);
        _IDSLogTransport(@"GL", @"IDS", @"update cellular RAT [%s->%s].");
        if (_IDSShouldLog())
        {
          IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
          IDSRadioAccessTechnologyToString(v15);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"update cellular RAT [%s->%s].");
        }
      }
    }
    self->_unsigned int radioAccessTechnology = v15;
  }

  return radioAccessTechnology != v15;
}

- (BOOL)_updateDataBearerSoMask
{
  uint64_t v6 = objc_msgSend__getDataStatus(self, a2, v2, v3);
  if (!v6)
  {
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "_updateDataBearerSoMask failed  to get data status", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_updateDataBearerSoMask failed  to get data status");
      char updated = 0;
      if (!_IDSShouldLog()) {
        goto LABEL_10;
      }
      _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateDataBearerSoMask failed  to get data status");
    }
    char updated = 0;
    goto LABEL_10;
  }
  char updated = objc_msgSend__updateDataBearerSoMaskWithCTDataStatus_(self, v5, (uint64_t)v6, v7);
LABEL_10:

  return updated;
}

- (BOOL)_updateDataBearerSoMaskWithCTDataStatus:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v8 = v4;
  if (!v4)
  {
    uint64_t v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "_updateDataBearerSoMask: No CTDataStatus", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"_updateDataBearerSoMask: No CTDataStatus");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateDataBearerSoMask: No CTDataStatus");
        }
      }
    }
    goto LABEL_16;
  }
  int v9 = objc_msgSend_indicator(v4, v5, v6, v7);
  int v13 = objc_msgSend_radioTechnology(v8, v10, v11, v12);
  unsigned int v17 = objc_msgSend_dataBearerSoMask(v8, v14, v15, v16);
  id v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int dataSoMaskBits = self->_dataSoMaskBits;
    *(_DWORD *)buf = 67110146;
    int v24 = v13;
    __int16 v25 = 1024;
    int v26 = v9;
    __int16 v27 = 1024;
    unsigned int v28 = v17;
    __int16 v29 = 1024;
    unsigned int v30 = dataSoMaskBits;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "_updateDataBearerSoMask: radioAccessTech: %d, data indicator: %d, soMask: %u, _dataSoMaskBits: %u, data status: %@", buf, 0x24u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_updateDataBearerSoMask: radioAccessTech: %d, data indicator: %d, soMask: %u, _dataSoMaskBits: %u, data status: %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateDataBearerSoMask: radioAccessTech: %d, data indicator: %d, soMask: %u, _dataSoMaskBits: %u, data status: %@");
      }
    }
  }
  if (v17 == self->_dataSoMaskBits)
  {
LABEL_16:
    BOOL v20 = 0;
    goto LABEL_17;
  }
  self->_unsigned int dataSoMaskBits = v17;
  BOOL v20 = 1;
LABEL_17:

  return v20;
}

- (BOOL)_updateCellularMTU
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    unint64_t v2 = _CTServerConnectionCopyCurrentMTU();
    int v3 = v2;
    if (!v2)
    {
LABEL_15:
      LOBYTE(v6) = 0;
      return v6;
    }
    unint64_t v4 = HIDWORD(v2);
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v10 = v3;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "failed to get cellular MTU (error:%d.%d)", buf, 0xEu);
    }

    int v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      int v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get cellular MTU (error:%d.%d)");
        int v6 = _IDSShouldLog();
        if (v6)
        {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get cellular MTU (error:%d.%d)");
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    double v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "failed to get cellular MTU due to invalid CT server connection.", buf, 2u);
    }

    int v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      int v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get cellular MTU due to invalid CT server connection.");
        int v6 = _IDSShouldLog();
        if (v6)
        {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get cellular MTU due to invalid CT server connection.");
          goto LABEL_15;
        }
      }
    }
  }
  return v6;
}

- (BOOL)_dataContextUsable:(id)a3 dataStatus:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    char v11 = objc_msgSend_cellularDataPossible(v6, v8, v9, v10);
    int v15 = objc_msgSend_state(v7, v12, v13, v14);

    LODWORD(v7) = objc_msgSend_indicator(v6, v16, v17, v18);
    if (v7) {
      BOOL v19 = v15 == 2;
    }
    else {
      BOOL v19 = 0;
    }
    if (v19) {
      return v11;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_updateDataStatus
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, v2, v3);
  if (v6)
  {
    ctClient = self->_ctClient;
    id v25 = 0;
    uint64_t v9 = objc_msgSend_getConnectionState_connectionType_error_(ctClient, v5, (uint64_t)v6, v7, 0, &v25);
    id v12 = v25;
    if (v9)
    {
      int v15 = objc_msgSend__getDataStatus(self, v10, v11, v13);
      if (v15)
      {
        int v17 = objc_msgSend__dataContextUsable_dataStatus_(self, v14, (uint64_t)v9, v16, v15);
        double v18 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          BOOL dataUsable = self->_dataUsable;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)__int16 v27 = v17;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = dataUsable;
          *(_WORD *)unsigned int v28 = 2112;
          *(void *)&v28[2] = v9;
          __int16 v29 = 2112;
          unsigned int v30 = v15;
          _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "_updateDataStatus: %d %d, connection status: %@, data status: %@", buf, 0x22u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"_updateDataStatus: %d %d, connection status: %@, data status: %@");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateDataStatus: %d %d, connection status: %@, data status: %@");
            }
          }
        }
        if (self->_dataUsable != v17)
        {
          self->_BOOL dataUsable = v17;
          BOOL v20 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = @"NO";
            if (v17) {
              uint64_t v21 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)__int16 v27 = v21;
            _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "cellular data usable: %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"cellular data usable: %@.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"cellular data usable: %@.");
              }
            }
          }
        }
      }
      else
      {
        int v24 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "_updateDataStatus failed to get data status", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"_updateDataStatus failed to get data status");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateDataStatus failed to get data status");
            }
          }
        }
      }
    }
    else
    {
      __int16 v23 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v27 = v12;
        *(_WORD *)&v27[8] = 2112;
        *(void *)unsigned int v28 = v6;
        _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "getConnectionState failed: %@ %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"getConnectionState failed: %@ %@");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"getConnectionState failed: %@ %@");
          }
        }
      }
    }
  }
  else
  {
    double v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "_updateDataStatus: failed to get context", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"_updateDataStatus: failed to get context");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateDataStatus: failed to get context");
        }
      }
    }
    id v12 = 0;
  }
}

- (void)processCTConnectionStateChangeNotification:(id)a3 connectionStatus:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (__CFString *)a4;
  ctClient = self->_ctClient;
  id v69 = 0;
  uint64_t v11 = objc_msgSend_getDataStatus_error_(ctClient, v9, (uint64_t)v6, v10, &v69);
  id v12 = (__CFString *)v69;
  if (v11)
  {
    double v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v7;
      __int16 v73 = 2112;
      *(void *)v74 = v11;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "processCTConnectionStateChangeNotification: %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v57 = v7;
        v59 = v11;
        _IDSLogTransport(@"GL", @"IDS", @"processCTConnectionStateChangeNotification: %@ %@");
        if (_IDSShouldLog())
        {
          v57 = v7;
          v59 = v11;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processCTConnectionStateChangeNotification: %@ %@");
        }
      }
    }
    uint64_t v64 = objc_msgSend_indicator(v11, v14, v15, v16, v57, v59);
    uint64_t v19 = objc_msgSend__dataContextUsable_dataStatus_(self, v17, (uint64_t)v7, v18, v11);
    uint64_t v22 = v19;
    int dataUsable = self->_dataUsable;
    if (dataUsable != v19) {
      self->_int dataUsable = v19;
    }
    BOOL v24 = dataUsable != v19;
    int updated = objc_msgSend__updateCellularDataInterface_(self, v20, 0, v21);
    int v29 = objc_msgSend__updateCellularMTU(self, v26, v27, v28);
    if ((objc_msgSend__updateRadioAccessTechnologyWithCTDataStatus_(self, v30, (uint64_t)v11, v31) | v29 | v24 | updated) == 1)
    {
      id v32 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        cellularDataInterfaceName = self->_cellularDataInterfaceName;
        unsigned int cellularMTU = self->_cellularMTU;
        v35 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
        v36 = @"NO";
        *(_DWORD *)buf = 138413314;
        if (v22) {
          v36 = @"YES";
        }
        v72 = v36;
        __int16 v73 = 1024;
        *(_DWORD *)v74 = v64;
        *(_WORD *)&v74[4] = 2112;
        *(void *)&v74[6] = cellularDataInterfaceName;
        __int16 v75 = 1024;
        unsigned int v76 = cellularMTU;
        __int16 v77 = 2080;
        v78 = v35;
        _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "cellular data usable: %@ (indicator:%d, if:[%@], mtu:%u, RAT:[%s]).", buf, 0x2Cu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v40 = v22 ? @"YES" : @"NO";
        v41 = self->_cellularDataInterfaceName;
        uint64_t v62 = self->_cellularMTU;
        v63 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
        uint64_t v60 = v64;
        v61 = v41;
        v58 = v40;
        _IDSLogTransport(@"GL", @"IDS", @"cellular data usable: %@ (indicator:%d, if:[%@], mtu:%u, RAT:[%s]).");
        if (_IDSShouldLog())
        {
          v42 = self->_cellularDataInterfaceName;
          uint64_t v62 = self->_cellularMTU;
          v63 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
          uint64_t v60 = v64;
          v61 = v42;
          v58 = v40;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"cellular data usable: %@ (indicator:%d, if:[%@], mtu:%u, RAT:[%s]).");
        }
      }
      v43 = objc_msgSend_allObjects(self->_cellularLinkDelegates, v37, v38, v39, v58, v60, v61, v62, v63);
      v47 = objc_msgSend_copy(v43, v44, v45, v46);

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v48 = v47;
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v65, v50, v70, 16);
      if (v52)
      {
        uint64_t v54 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v66 != v54) {
              objc_enumerationMutation(v48);
            }
            objc_msgSend_cellularRadioAccessTechnologyDidChange_(*(void **)(*((void *)&v65 + 1) + 8 * i), v51, v22, v53);
          }
          uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v65, v53, v70, 16);
        }
        while (v52);
      }
    }
  }
  else
  {
    v56 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v12;
      __int16 v73 = 2112;
      *(void *)v74 = v6;
      _os_log_impl(&dword_19D9BE000, v56, OS_LOG_TYPE_DEFAULT, "getDataStatus failed: %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"getDataStatus failed: %@ %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"getDataStatus failed: %@ %@");
        }
      }
    }
  }
}

- (void)reset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "reset cellular link monitor %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"reset cellular link monitor %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"reset cellular link monitor %@.");
      }
    }
  }
  cellularDataInterfaceName = self->_cellularDataInterfaceName;
  self->_cellularDataInterfaceName = 0;

  *(void *)&self->_unsigned int radioAccessTechnology = 10;
  self->_int dataUsable = 0;
  *(void *)&self->_unsigned int dataSoMaskBits = 0;
}

- (NSString)cellularDataInterfaceName
{
  cellularDataInterfaceName = self->_cellularDataInterfaceName;
  if (!cellularDataInterfaceName)
  {
    objc_msgSend__updateCellularDataInterface_(self, a2, 1, v2);
    cellularDataInterfaceName = self->_cellularDataInterfaceName;
  }
  return cellularDataInterfaceName;
}

- (unsigned)radioAccessTechnology
{
  unsigned int result = self->_radioAccessTechnology;
  if (result == 10)
  {
    objc_msgSend__updateRadioAccessTechnology(self, a2, v2, v3);
    return self->_radioAccessTechnology;
  }
  else if (result == 8 && self->_remoteDeviceVersion == 1)
  {
    unsigned int result = 5;
    self->_unsigned int radioAccessTechnology = 5;
  }
  return result;
}

- (unsigned)cellularMTU
{
  unsigned int result = self->_cellularMTU;
  if (!result)
  {
    objc_msgSend__updateCellularMTU(self, a2, v2, v3);
    return self->_cellularMTU;
  }
  return result;
}

- (BOOL)dataUsable
{
  if (self->_dataUsable) {
    return 1;
  }
  objc_msgSend__updateDataStatus(self, a2, v2, v3);
  return self->_dataUsable;
}

- (unsigned)dataSoMaskBits
{
  unsigned int result = self->_dataSoMaskBits;
  if (!result)
  {
    objc_msgSend__updateDataBearerSoMask(self, a2, v2, v3);
    return self->_dataSoMaskBits;
  }
  return result;
}

- (void)removePacketNotificationFilter
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection && self->_notificationRegInfo)
  {
    _CTServerConnectionSetPacketNotificationFilter();
    double v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      notificationRegInfo = self->_notificationRegInfo;
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = notificationRegInfo;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "removed packet notification filter for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"removed packet notification filter for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"removed packet notification filter for %@.");
      }
    }
    id v5 = self->_notificationRegInfo;
    self->_notificationRegInfo = 0;
  }
}

- (BOOL)setPacketNotificationFilter:(const sockaddr *)a3 remote:(const sockaddr *)a4 uniqueTag:(unsigned int)a5 callType:(unsigned __int8)a6 ifname:(id)a7
{
  uint64_t v7 = a6;
  *(void *)&v58[5] = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  if (!self->_ctServerConnection)
  {
    uint64_t v38 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "failed to set packet notification filter due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to set packet notification filter due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to set packet notification filter due to invalid CT server connection.");
        }
      }
    }
    goto LABEL_34;
  }
  if (a3->sa_family != a4->sa_family)
  {
    double v39 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "failed to set packet notification filter due to address family mismatch.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to set packet notification filter due to address family mismatch.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to set packet notification filter due to address family mismatch.");
        }
      }
    }
LABEL_34:
    BOOL v40 = 0;
    goto LABEL_60;
  }
  objc_msgSend_removePacketNotificationFilter(self, v12, v13, v15);
  if (!self->_notificationRegInfo)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    notificationRegInfo = self->_notificationRegInfo;
    self->_notificationRegInfo = Mutable;
  }
  if (v14) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_notificationRegInfo, (const void *)*MEMORY[0x1E4F23DC8], v14);
  }
  double v18 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v21 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v19, v7, v20);
  if (v21) {
    CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23EF8], v21);
  }

  BOOL v24 = objc_msgSend_numberWithInt_(NSNumber, v22, bswap32(a5), v23);
  if (v24) {
    CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F70], v24);
  }

  if (a3->sa_family == 2)
  {
    uint64_t v27 = objc_msgSend_numberWithShort_(NSNumber, v25, *(__int16 *)a3->sa_data, v26);
    if (v27) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F08], v27);
    }

    double v31 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v28, (uint64_t)&a3->sa_data[2], v29, 4);
    if (v31) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F00], v31);
    }
    uint64_t v33 = objc_msgSend_numberWithShort_(NSNumber, v30, *(__int16 *)a4->sa_data, v32);
    if (v33) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F58], v33);
    }

    v36 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v34, (uint64_t)&a4->sa_data[2], v35, 4);

    if (v36) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F50], v36);
    }
    if (!v18) {
      goto LABEL_46;
    }
    v37 = (const void **)MEMORY[0x1E4F23F20];
  }
  else
  {
    v41 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v25, *(unsigned __int16 *)a3->sa_data, v26);
    if (v41) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F08], v41);
    }

    uint64_t v45 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v42, (uint64_t)&a3->sa_data[6], v43, 16);
    if (v45) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F00], v45);
    }
    v47 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v44, *(unsigned __int16 *)a4->sa_data, v46);
    if (v47) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F58], v47);
    }

    v36 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v48, (uint64_t)&a4->sa_data[6], v49, 16);

    if (v36) {
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F23F50], v36);
    }
    if (!v18) {
      goto LABEL_46;
    }
    v37 = (const void **)MEMORY[0x1E4F23F28];
  }
  CFDictionarySetValue((CFMutableDictionaryRef)self->_notificationRegInfo, *v37, v18);
LABEL_46:
  unint64_t v50 = _CTServerConnectionSetPacketNotificationFilter();
  int v51 = v50;
  BOOL v40 = v50 == 0;
  if (v50)
  {
    unint64_t v52 = HIDWORD(v50);
    double v53 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v58[0] = v51;
      LOWORD(v58[1]) = 1024;
      *(_DWORD *)((char *)&v58[1] + 2) = v52;
      _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "failed to set packet notification filter (error: %d.%d).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to set packet notification filter (error: %d.%d).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to set packet notification filter (error: %d.%d).");
        }
      }
    }
  }
  else
  {
    uint64_t v54 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = self->_notificationRegInfo;
      *(_DWORD *)buf = 138412290;
      *(void *)v58 = v55;
      _os_log_impl(&dword_19D9BE000, v54, OS_LOG_TYPE_DEFAULT, "set packet notification filter for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"set packet notification filter for %@.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"set packet notification filter for %@.");
        }
      }
    }
  }

LABEL_60:
  return v40;
}

- (void)setRemoteDeviceVersion:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v7 = a3;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "CellularLinkMonitor: set remote device version: %u", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"CellularLinkMonitor: set remote device version: %u");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"CellularLinkMonitor: set remote device version: %u");
      }
    }
  }
  self->_unsigned int remoteDeviceVersion = a3;
}

- (BOOL)dropIPPackets:(id)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5 isRelay:(BOOL)a6 channelNumberMSB:(unsigned __int8)a7 ifname:(id)a8
{
  uint64_t v9 = a7;
  BOOL v10 = a6;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id value = a8;
  if (!self->_ctServerConnection)
  {
    __int16 v77 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v77, OS_LOG_TYPE_DEFAULT, "failed to drop IP packets due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to drop IP packets due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to drop IP packets due to invalid CT server connection.");
        }
      }
    }
    goto LABEL_98;
  }
  if (!a4 || !a5)
  {
    v78 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v78, OS_LOG_TYPE_DEFAULT, "failed to drop IP packets due to invalid address.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to drop IP packets due to invalid address.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to drop IP packets due to invalid address.");
        }
      }
    }
LABEL_98:
    BOOL v79 = 0;
    goto LABEL_123;
  }
  if (a4->sa_family == 2) {
    int v15 = 1;
  }
  else {
    int v15 = 2;
  }
  if (a4->sa_family == 2) {
    char v16 = 28;
  }
  else {
    char v16 = 48;
  }
  unsigned int v99 = v15;
  char v100 = v16;
  unsigned int v97 = *(unsigned __int16 *)a5->sa_data;
  unsigned int v98 = *(unsigned __int16 *)a4->sa_data;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v14;
  unint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v103, v18, v110, 16);
  if (!v20)
  {

    goto LABEL_114;
  }
  double v21 = 0;
  uint64_t v22 = 0;
  if (v10) {
    char v23 = 4;
  }
  else {
    char v23 = 0;
  }
  char v87 = v23 + v100;
  v95 = (void *)*MEMORY[0x1E4F23F18];
  v93 = (void *)*MEMORY[0x1E4F23F08];
  v94 = (void *)*MEMORY[0x1E4F23F58];
  v92 = (void *)*MEMORY[0x1E4F23F40];
  v88 = (void *)*MEMORY[0x1E4F23F48];
  v91 = (void *)*MEMORY[0x1E4F23F68];
  v90 = (void *)*MEMORY[0x1E4F23F60];
  uint64_t v24 = 138412546;
  v89 = (void *)*MEMORY[0x1E4F23F10];
  uint64_t v96 = *(void *)v104;
  for (uint64_t i = *(void *)v104; ; uint64_t i = *(void *)v104)
  {
    if (i != v96) {
      objc_enumerationMutation(obj);
    }
    CFDictionaryRef v26 = *(const __CFDictionary **)(*((void *)&v103 + 1) + 8 * v22);
    char v27 = v100;
    if (!v9)
    {
      if (v26) {
        BOOL v28 = @"qos-family-offset-bytes" == 0;
      }
      else {
        BOOL v28 = 1;
      }
      if (v28)
      {
        char v33 = objc_msgSend_intValue(0, (const char *)@"qos-family-offset-bytes", v19, *(double *)&v24);
      }
      else
      {
        double v29 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v103 + 1) + 8 * v22), @"qos-family-offset-bytes");
        char v33 = objc_msgSend_intValue(v29, v30, v31, v32);
      }
      char v27 = v87 + v33;
    }
    v34 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v37 = objc_msgSend_numberWithChar_(NSNumber, v35, v99, v36);
    if (v37)
    {
      CFDictionarySetValue(v34, v95, v37);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v95;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    BOOL v40 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v38, v98, v39);
    if (v40)
    {
      CFDictionarySetValue(v34, v94, v40);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v94;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    double v43 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v41, v97, v42);
    if (v43)
    {
      CFDictionarySetValue(v34, v93, v43);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v93;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    double v46 = objc_msgSend_numberWithChar_(NSNumber, v44, v27, v45);
    if (v46)
    {
      CFDictionarySetValue(v34, v92, v46);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v92;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    if (v9)
    {
      double v49 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v47, v9, v48);
      if (v49)
      {
        CFDictionarySetValue(v34, v88, v49);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v108 = v88;
        *(_WORD *)&v108[8] = 2080;
        v109 = "newPayloadDictionary";
        _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
      }
    }
    else if (v26 {
           && @"qos-family-payload-type"
    }
           && (unint64_t v50 = (id)CFDictionaryGetValue(v26, @"qos-family-payload-type")) != 0)
    {
      int v51 = v50;
      CFDictionarySetValue(v34, v88, v50);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v88;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }
    v55 = 0;
    if (v26 && @"qos-family-transaction-id") {
      v55 = (void *)CFDictionaryGetValue(v26, @"qos-family-transaction-id");
    }
    unsigned int v56 = objc_msgSend_unsignedShortValue(v55, v52, v53, v54);
    v59 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v57, __rev16(v56), v58);
    if (v59)
    {
      CFDictionarySetValue(v34, v91, v59);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v91;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    v63 = v26 != 0 && @"qos-family-timestamp-value" != 0
        ? (void *)CFDictionaryGetValue(v26, @"qos-family-timestamp-value")
        : 0;
    unsigned int v64 = objc_msgSend_unsignedIntValue(v63, v60, v61, v62);
    long long v67 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v65, bswap32(v64), v66);
    if (v67)
    {
      CFDictionarySetValue(v34, v90, v67);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v90;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    v71 = v26 != 0 && @"qos-family-drop-operation" != 0
        ? (void *)CFDictionaryGetValue(v26, @"qos-family-drop-operation")
        : 0;
    unsigned int v72 = objc_msgSend_unsignedShortValue(v71, v68, v69, v70);
    __int16 v75 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v73, __rev16(v72), v74);
    if (v75)
    {
      CFDictionarySetValue(v34, v89, v75);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v108 = v89;
      *(_WORD *)&v108[8] = 2080;
      v109 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    if (!v21) {
      double v21 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (value && v21) {
      CFArrayAppendValue(v21, value);
    }
    if (v21 && v34) {
      CFArrayAppendValue(v21, v34);
    }

    if (++v22 >= v20) {
      break;
    }
LABEL_85:
    ;
  }
  unint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v103, *(double *)&v24, v110, 16);
  if (v20)
  {
    uint64_t v22 = 0;
    goto LABEL_85;
  }

  if (!v21)
  {
LABEL_114:
    v85 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v85, OS_LOG_TYPE_DEFAULT, "dropIPPackets failed due to invalid payloadArray.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"dropIPPackets failed due to invalid payloadArray.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"dropIPPackets failed due to invalid payloadArray.");
        }
      }
    }
    double v21 = 0;
LABEL_121:
    BOOL v79 = 0;
    goto LABEL_122;
  }
  v80 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v108 = v21;
    _os_log_impl(&dword_19D9BE000, v80, OS_LOG_TYPE_DEFAULT, "drop IP packets for payload array %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"drop IP packets for payload array %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"drop IP packets for payload array %@.");
      }
    }
  }
  unint64_t v81 = _CTServerConnectionDropIPPackets();
  int v82 = v81;
  if (v81)
  {
    unint64_t v83 = HIDWORD(v81);
    v84 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v108 = v82;
      *(_WORD *)&v108[4] = 1024;
      *(_DWORD *)&v108[6] = v83;
      _os_log_impl(&dword_19D9BE000, v84, OS_LOG_TYPE_DEFAULT, "CTServerConnectionDropIPPackets failed (error: %d.%d).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"CTServerConnectionDropIPPackets failed (error: %d.%d).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"CTServerConnectionDropIPPackets failed (error: %d.%d).");
        }
      }
    }
    goto LABEL_121;
  }
  BOOL v79 = 1;
LABEL_122:

LABEL_123:
  return v79;
}

- (void)updateProtocolQualityOfService:(BOOL)a3 localAddress:(sockaddr *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    if (a4)
    {
      BOOL v4 = a3;
      if (a4->sa_family == 30) {
        int v5 = 2;
      }
      else {
        int v5 = 1;
      }
      unint64_t updated = _CTServerConnectionUpdateProtocolQualityOfService();
      int v7 = updated;
      if (updated)
      {
        unint64_t v8 = HIDWORD(updated);
        uint64_t v9 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)int v15 = v7;
          *(_WORD *)&v15[4] = 1024;
          *(_DWORD *)&v15[6] = v8;
          _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "failed to update protocol QoS (error: %d.%d)", buf, 0xEu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to update protocol QoS (error: %d.%d)");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to update protocol QoS (error: %d.%d)");
          }
        }
      }
      else
      {
        id v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = @"NO";
          if (v4) {
            uint64_t v13 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)int v15 = v13;
          *(_WORD *)&v15[8] = 1024;
          int v16 = v5;
          _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "update procotol QoS (isGood:%@, addressFamily:%d).", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"update procotol QoS (isGood:%@, addressFamily:%d).");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"update procotol QoS (isGood:%@, addressFamily:%d).");
            }
          }
        }
      }
    }
    else
    {
      uint64_t v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "updateProtocolQualityOfService failed due to invalid address.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"updateProtocolQualityOfService failed due to invalid address.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"updateProtocolQualityOfService failed due to invalid address.");
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "failed to update protocol QoS due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to update protocol QoS due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to update protocol QoS due to invalid CT server connection.");
        }
      }
    }
  }
}

- (void)currentCellularSignalStrength:(int *)a3 signalStrength:(int *)a4 signalGrade:(int *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    *a3 = 0;
    *a4 = 100;
    *a5 = 0;
    uint64_t v11 = objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, (uint64_t)a3, v5);
    if (v11)
    {
      ctClient = self->_ctClient;
      id v30 = 0;
      id v14 = objc_msgSend_getSignalStrengthInfo_error_(ctClient, v10, (uint64_t)v11, v12, &v30);
      id v17 = v30;
      if (v14)
      {
        uint64_t v19 = objc_msgSend_bars(v14, v15, v16, v18);
        *a5 = objc_msgSend_intValue(v19, v20, v21, v22);

        char v23 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = *a3;
          int v25 = *a4;
          int v26 = *a5;
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)double v32 = v24;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v25;
          LOWORD(v33) = 1024;
          *(_DWORD *)((char *)&v33 + 2) = v26;
          _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "current cellular signal strength  [Raw: %d Strength: %d  Grade: %d]", buf, 0x14u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"current cellular signal strength  [Raw: %d Strength: %d  Grade: %d]");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"current cellular signal strength  [Raw: %d Strength: %d  Grade: %d]");
          }
        }
      }
      else
      {
        double v29 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)double v32 = v17;
          *(_WORD *)&v32[8] = 2112;
          char v33 = v11;
          _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "getSignalStrengthInfo failed: %@ %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"getSignalStrengthInfo failed: %@ %@");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"getSignalStrengthInfo failed: %@ %@");
            }
          }
        }
      }
    }
    else
    {
      BOOL v28 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "currentCellularSignalStrength: failed to get context", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"currentCellularSignalStrength: failed to get context");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"currentCellularSignalStrength: failed to get context");
          }
        }
      }
    }
  }
  else
  {
    char v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "failed to get cellular signal strength due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get cellular signal strength due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get cellular signal strength due to invalid CT server connection.");
        }
      }
    }
  }
}

- (void)registerCellularDataStatusNotification:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    BOOL v3 = a3;
    double v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      double v12 = v6;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "registerCellularDataStatusNotification: %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"registerCellularDataStatusNotification: %@.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"registerCellularDataStatusNotification: %@.");
        }
      }
    }
    ctClient = self->_ctClient;
    if (v3) {
      objc_msgSend_setDelegate_(ctClient, v7, (uint64_t)self, v8);
    }
    else {
      objc_msgSend_setDelegate_(ctClient, v7, 0, v8);
    }
  }
  else
  {
    BOOL v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "registerCellularDataStatusNotification failed due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"registerCellularDataStatusNotification failed due to invalid CT server connection.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"registerCellularDataStatusNotification failed due to invalid CT server connection.");
        }
      }
    }
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = a4;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "connectionStateChanged, connection type: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"connectionStateChanged, connection type: %d");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"connectionStateChanged, connection type: %d");
      }
    }
  }
  if (!a4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19DA26914;
    v10[3] = &unk_1E5973CF8;
    id v11 = v7;
    id v12 = v8;
    IDSTransportThreadAddBlock(v10);
  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  ctClient = self->_ctClient;
  id v20 = 0;
  id v11 = objc_msgSend_getPreferredDataSubscriptionContextSync_(ctClient, v9, (uint64_t)&v20, v10);
  id v12 = v20;
  int isEqual = objc_msgSend_isEqual_(v11, v13, (uint64_t)v6, v14);

  uint64_t v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v22 = v6;
    __int16 v23 = 2112;
    if (isEqual) {
      id v17 = @"YES";
    }
    int v24 = v17;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Received CT data status changed callback { context: %@, isRelevant: %@, dataStatus: %@ }", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"Received CT data status changed callback { context: %@, isRelevant: %@, dataStatus: %@ }");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"Received CT data status changed callback { context: %@, isRelevant: %@, dataStatus: %@ }");
      }
    }
  }
  if (isEqual) {
    objc_msgSend__notifyClientDataBearerSoMask_(self, v18, (uint64_t)v7, v19);
  }
}

- (void)_notifyClientDataBearerSoMask:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend__updateDataBearerSoMaskWithCTDataStatus_(self, v5, (uint64_t)v4, v6))
  {
    id v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int dataSoMaskBits = self->_dataSoMaskBits;
      *(_DWORD *)buf = 67109120;
      unsigned int v44 = dataSoMaskBits;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "_updateClientDataBearerSoMask: update AVC cellular so Mask: %u", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v36 = self->_dataSoMaskBits;
        _IDSLogTransport(@"GL", @"IDS", @"_updateClientDataBearerSoMask: update AVC cellular so Mask: %u");
        if (_IDSShouldLog())
        {
          uint64_t v36 = self->_dataSoMaskBits;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_updateClientDataBearerSoMask: update AVC cellular so Mask: %u");
        }
      }
    }
    id v12 = objc_msgSend_allObjects(self->_cellularLinkDelegates, v9, v10, v11, v36);
    uint64_t v16 = objc_msgSend_copy(v12, v13, v14, v15);

    id v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = objc_msgSend_count(v16, v18, v19, v20);
      *(_DWORD *)buf = 67109120;
      unsigned int v44 = v21;
      _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "[delegates count]: %u", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v37 = objc_msgSend_count(v16, v22, v23, v24);
        _IDSLogTransport(@"GL", @"IDS", @"[delegates count]: %u");
        if (_IDSShouldLog())
        {
          uint64_t v37 = objc_msgSend_count(v16, v25, v26, v27, v37);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"[delegates count]: %u");
        }
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v28 = v16;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v38, v30, v42, 16);
    if (v32)
    {
      uint64_t v34 = *(void *)v39;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v39 != v34) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend_cellularSoMaskDidChange_(*(void **)(*((void *)&v38 + 1) + 8 * v35++), v31, self->_dataSoMaskBits, v33, v37);
        }
        while (v32 != v35);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v38, v33, v42, 16);
      }
      while (v32);
    }
  }
}

- (void)preferredDataSimChanged:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "preferredDataSimChanged %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"preferredDataSimChanged %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"preferredDataSimChanged %@");
      }
    }
  }
}

- (BOOL)isSlicedCellularInterfaceActive:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6, v7))
  {
    id v12 = objc_msgSend_getPreferredDataSubscriptionContextSync_(self->_ctClient, v9, 0, v10);
    if (v12)
    {
      uint64_t v14 = 28;
      while (1)
      {
        double v15 = objc_msgSend_getConnectionState_connectionType_error_(self->_ctClient, v11, (uint64_t)v12, v13, v14, 0);
        if (v15)
        {
          id v17 = v15;
          double v18 = objc_msgSend_interfaceName(v15, v11, v16, v13);
          char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v18, v19, (uint64_t)v8, v20);

          if (isEqualToIgnoringCase) {
            break;
          }
        }
        uint64_t v14 = (v14 + 1);
        if (v14 == 36) {
          goto LABEL_8;
        }
      }
      BOOL v22 = 1;
    }
    else
    {
LABEL_8:
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (__CTServerConnection)_ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)set_ctServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (CoreTelephonyClient)_ctClient
{
  return self->_ctClient;
}

- (void)set_ctClient:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContextSync
{
  return self->_currentDataSubscriptionContextSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSubscriptionContextSync, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_notificationRegInfo, 0);
  objc_storeStrong((id *)&self->_cellularLinkDelegates, 0);
  objc_storeStrong((id *)&self->_cellularDataInterfaceName, 0);
  objc_storeStrong((id *)&self->_dataIndicator, 0);
  objc_storeStrong((id *)&self->_ctClientDataDelegate, 0);
}

@end