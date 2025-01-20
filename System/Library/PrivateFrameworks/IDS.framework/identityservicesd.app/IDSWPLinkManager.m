@interface IDSWPLinkManager
+ (id)sharedInstance;
- (BOOL)isScanningOrAdvertising;
- (IDSWPLinkManager)init;
- (unint64_t)sendData:(id)a3 peerID:(id)a4;
- (void)_checkWPContinuitySetup;
- (void)_cleanup;
- (void)_continuityDidUpdateStateWithStateValue:(int64_t)a3;
- (void)addConnectivityDelegate:(id)a3;
- (void)clientInstanceCreatedWithMessageContext:(id)a3;
- (void)clientInstancesRemoved;
- (void)connectOnMainQueueToPeer:(id)a3;
- (void)connectToPeer:(id)a3;
- (void)continuity:(id)a3 didConnectToPeer:(id)a4 error:(id)a5;
- (void)continuity:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6;
- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)continuity:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)continuity:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6;
- (void)continuityDidStartAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4;
- (void)continuityDidStartScanningForType:(id)a3 scanningType:(int64_t)a4;
- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4;
- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4 withError:(id)a5;
- (void)continuityDidStopScanningForType:(id)a3 scanningType:(int64_t)a4;
- (void)continuityDidUpdateState:(id)a3;
- (void)disconnectFromPeer:(id)a3;
- (void)disconnectOnMainQueueFromPeer:(id)a3;
- (void)removeConnectivityDelegate:(id)a3;
- (void)removeLink:(id)a3;
- (void)sendReset;
- (void)setAlwaysConnectedForCBUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateOnMainQueue:(id)a3;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)systemDidFastUserSwitchIn;
- (void)systemDidFastUserSwitchOut;
@end

@implementation IDSWPLinkManager

+ (id)sharedInstance
{
  if (qword_100A4A870 != -1) {
    dispatch_once(&qword_100A4A870, &stru_100984130);
  }
  v2 = (void *)qword_100A4A878;

  return v2;
}

- (IDSWPLinkManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)IDSWPLinkManager;
  v2 = [(IDSWPLinkManager *)&v12 init];
  if (v2)
  {
    v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "============= New WPLinkManager %@ starting =============", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v11 = v2;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v11 = v2;
          _IDSLogV();
        }
      }
    }
    v2->_state = 0;
    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    connectivityDelegates = v2->_connectivityDelegates;
    v2->_connectivityDelegates = (NSHashTable *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    linkIDToLink = v2->_linkIDToLink;
    v2->_linkIDToLink = v6;

    v8 = +[IMSystemMonitor sharedInstance];
    [v8 addListener:v2];

    v9 = +[IMSystemMonitor sharedInstance];
    v2->_systemIsFastUserSwitched = [v9 isFastUserSwitched];
  }
  return v2;
}

- (void)_checkWPContinuitySetup
{
  if (self->_systemIsFastUserSwitched
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate), WeakRetained, !WeakRetained))
  {
    if (self->_continuity)
    {
      v3 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        continuity = self->_continuity;
        *(_DWORD *)buf = 138412290;
        v17 = continuity;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating WPContinuity instance %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v15 = self->_continuity;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v15 = self->_continuity;
          _IDSLogV();
        }
      }
      v6 = self->_continuity;
      p_continuity = &self->_continuity;
      [(WPContinuity *)v6 invalidate];
      v7 = *p_continuity;
      *p_continuity = 0;
    }
  }
  else if (!self->_continuity)
  {
    id v9 = objc_alloc((Class)WPContinuity);
    v10 = im_primary_queue();
    v11 = (WPContinuity *)[v9 initWithDelegate:self queue:v10];
    objc_super v12 = self->_continuity;
    self->_continuity = v11;

    v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_continuity;
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created a new WPContinuity instance %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172468;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setDelegateOnMainQueue:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(IDSWPLinkManager *)self _checkWPContinuitySetup];
}

- (BOOL)isScanningOrAdvertising
{
  v3 = (char *)[(NSMutableSet *)self->_linkIDsAlwaysConnected count];
  id v4 = &v3[(void)[(NSMutableSet *)self->_scanningTypes count]];
  return (char *)[(NSMutableSet *)self->_advertisingTypes count] + (void)v4 != 0;
}

- (void)addConnectivityDelegate:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_connectivityDelegates addObject:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_linkIDsAlwaysConnected;
  id v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
        v10 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100172690;
        block[3] = &unk_10097E418;
        id v13 = v4;
        v14 = self;
        uint64_t v15 = v9;
        dispatch_async(v10, block);

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)removeConnectivityDelegate:(id)a3
{
}

- (void)setAlwaysConnectedForCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017275C;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)clientInstanceCreatedWithMessageContext:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "client instance created", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v6 = +[IDSDaemon sharedInstance];
  uint64_t v7 = [v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:v4];

  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 3) {
      v10 = "UnexpectedState";
    }
    else {
      v10 = (&off_100984150)[state];
    }
    *(_DWORD *)buf = 136315138;
    long long v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "calling continuityDidUpdateStateToState:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    unint64_t v11 = self->_state;
    objc_super v12 = v11 > 3 ? "UnexpectedState" : (&off_100984150)[v11];
    uint64_t v15 = v12;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      unint64_t v13 = self->_state;
      if (v13 > 3) {
        v14 = "UnexpectedState";
      }
      else {
        v14 = (&off_100984150)[v13];
      }
      uint64_t v15 = (void *)v14;
      _IDSLogV();
    }
  }
  objc_msgSend(v7, "continuityDidUpdateStateToState:", self->_state, v15);
}

- (void)clientInstancesRemoved
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    advertisingTypes = self->_advertisingTypes;
    scanningTypes = self->_scanningTypes;
    *(_DWORD *)buf = 138412546;
    v38 = scanningTypes;
    __int16 v39 = 2112;
    v40 = advertisingTypes;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "all client instances removed, currently scanning: %@   currently advertising: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v24 = self->_scanningTypes;
      v26 = self->_advertisingTypes;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v24 = self->_scanningTypes;
        v26 = self->_advertisingTypes;
        _IDSLogV();
      }
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(NSMutableSet *)self->_advertisingTypes copy];
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = (unint64_t)[*(id *)(*((void *)&v31 + 1) + 8 * i) integerValue];
        unint64_t v11 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v12 = "UnexpectedType";
          if (v10 <= 2) {
            objc_super v12 = (&off_100984170)[v10];
          }
          *(_DWORD *)buf = 136315138;
          v38 = (void *)v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  => Stopping advertisement for type: %s", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          unint64_t v13 = "UnexpectedType";
          if (v10 <= 2) {
            unint64_t v13 = (&off_100984170)[v10];
          }
          v25 = v13;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v14 = "UnexpectedType";
            if (v10 <= 2) {
              v14 = (&off_100984170)[v10];
            }
            v25 = v14;
            _IDSLogV();
          }
        }
        -[IDSWPLinkManager stopAdvertisingOfType:](self, "stopAdvertisingOfType:", v10, v25);
      }
      id v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = [(NSMutableSet *)self->_scanningTypes copy];
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v15);
        }
        unint64_t v19 = (unint64_t)[*(id *)(*((void *)&v27 + 1) + 8 * (void)j) integerValue];
        v20 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = "UnexpectedType";
          if (v19 <= 2) {
            v21 = (&off_100984170)[v19];
          }
          *(_DWORD *)buf = 136315138;
          v38 = (void *)v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "  => Stopping scanning for type: %s", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          v22 = "UnexpectedType";
          if (v19 <= 2) {
            v22 = (&off_100984170)[v19];
          }
          v25 = v22;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v23 = "UnexpectedType";
            if (v19 <= 2) {
              v23 = (&off_100984170)[v19];
            }
            v25 = v23;
            _IDSLogV();
          }
        }
        -[IDSWPLinkManager stopScanningForType:](self, "stopScanningForType:", v19, v25);
      }
      id v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      unint64_t v11 = "UnexpectedType";
    }
    else {
      unint64_t v11 = (&off_100984170)[a3];
    }
    *(_DWORD *)buf = 136315650;
    long long v27 = v11;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "startAdvertisingOfType:%s withData:%@ withOptions:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    objc_super v12 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    id v24 = v8;
    id v25 = v9;
    v23 = v12;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        unint64_t v13 = "UnexpectedType";
      }
      else {
        unint64_t v13 = (&off_100984170)[a3];
      }
      id v24 = v8;
      id v25 = v9;
      v23 = (void *)v13;
      _IDSLogV();
    }
  }
  if (self->_state != 3)
  {
    v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  if ((unint64_t)a3 >= 3) {
    int64_t v15 = 3;
  }
  else {
    int64_t v15 = a3;
  }
  -[WPContinuity startAdvertisingOfType:withData:](self->_continuity, "startAdvertisingOfType:withData:", v15, v8, v23, v24, v25);
  advertisingTypes = self->_advertisingTypes;
  uint64_t v17 = +[NSNumber numberWithInteger:a3];
  LOBYTE(advertisingTypes) = [(NSMutableSet *)advertisingTypes containsObject:v17];

  if ((advertisingTypes & 1) == 0)
  {
    long long v18 = self->_advertisingTypes;
    if (!v18)
    {
      unint64_t v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v21 = self->_advertisingTypes;
      p_advertisingTypes = &self->_advertisingTypes;
      *p_advertisingTypes = v19;

      long long v18 = *p_advertisingTypes;
    }
    v22 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v18 addObject:v22];
  }
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      id v6 = "UnexpectedType";
    }
    else {
      id v6 = (&off_100984170)[a3];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopAdvertisingOfType:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v7 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    int64_t v15 = v7;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        id v8 = "UnexpectedType";
      }
      else {
        id v8 = (&off_100984170)[a3];
      }
      int64_t v15 = (void *)v8;
      _IDSLogV();
    }
  }
  if ((unint64_t)a3 >= 3) {
    int64_t v9 = 3;
  }
  else {
    int64_t v9 = a3;
  }
  -[WPContinuity stopAdvertisingOfType:](self->_continuity, "stopAdvertisingOfType:", v9, v15);
  advertisingTypes = self->_advertisingTypes;
  unint64_t v11 = +[NSNumber numberWithInteger:a3];
  LODWORD(advertisingTypes) = [(NSMutableSet *)advertisingTypes containsObject:v11];

  if (advertisingTypes)
  {
    objc_super v12 = self->_advertisingTypes;
    unint64_t v13 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v12 removeObject:v13];

    if (![(NSMutableSet *)self->_advertisingTypes count])
    {
      v14 = self->_advertisingTypes;
      self->_advertisingTypes = 0;
    }
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      v14 = "UnexpectedType";
    }
    else {
      v14 = (&off_100984170)[a3];
    }
    int64_t v15 = IMLoggingStringForArray();
    *(_DWORD *)buf = 136315906;
    long long v34 = v14;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "startScanningForType:%s withData:%@ mask:%@ peers: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v16 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    IMLoggingStringForArray();
    v32 = id v31 = v11;
    id v29 = v16;
    id v30 = v10;
    _IDSLogTransport();

    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        uint64_t v17 = "UnexpectedType";
      }
      else {
        uint64_t v17 = (&off_100984170)[a3];
      }
      IMLoggingStringForArray();
      v32 = id v31 = v11;
      id v29 = (void *)v17;
      id v30 = v10;
      _IDSLogV();
    }
  }
  if (self->_state != 3)
  {
    long long v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  unint64_t v19 = objc_msgSend(v12, "__imArrayByApplyingBlock:", &stru_100984188, v29, v30, v31, v32);

  continuity = self->_continuity;
  if ((unint64_t)a3 >= 3) {
    int64_t v21 = 3;
  }
  else {
    int64_t v21 = a3;
  }
  if (v11) {
    [(WPContinuity *)continuity startScanningForType:v21 withData:v10 mask:v11 peers:v19];
  }
  else {
    [(WPContinuity *)continuity startScanningForType:v21 withData:v10 peers:v19];
  }
  scanningTypes = self->_scanningTypes;
  v23 = +[NSNumber numberWithInteger:a3];
  LOBYTE(scanningTypes) = [(NSMutableSet *)scanningTypes containsObject:v23];

  if ((scanningTypes & 1) == 0)
  {
    id v24 = self->_scanningTypes;
    if (!v24)
    {
      id v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v27 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v25;

      id v24 = *p_scanningTypes;
    }
    __int16 v28 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v24 addObject:v28];
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      id v11 = "UnexpectedType";
    }
    else {
      id v11 = (&off_100984170)[a3];
    }
    *(_DWORD *)buf = 136315650;
    __int16 v28 = v11;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "startScanningForType:%s withData:%@ mask:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v12 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    id v25 = v8;
    id v26 = v9;
    id v24 = v12;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        unint64_t v13 = "UnexpectedType";
      }
      else {
        unint64_t v13 = (&off_100984170)[a3];
      }
      id v25 = v8;
      id v26 = v9;
      id v24 = (void *)v13;
      _IDSLogV();
    }
  }
  if (self->_state != 3)
  {
    v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  continuity = self->_continuity;
  if ((unint64_t)a3 >= 3) {
    int64_t v16 = 3;
  }
  else {
    int64_t v16 = a3;
  }
  if (v9) {
    [(WPContinuity *)continuity startScanningForType:v16 withData:v8 mask:v9 peers:0];
  }
  else {
    [(WPContinuity *)continuity startScanningForType:v16 withData:v8 peers:0];
  }
  scanningTypes = self->_scanningTypes;
  long long v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v24, v25, v26);
  LOBYTE(scanningTypes) = [(NSMutableSet *)scanningTypes containsObject:v18];

  if ((scanningTypes & 1) == 0)
  {
    unint64_t v19 = self->_scanningTypes;
    if (!v19)
    {
      v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v22 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v20;

      unint64_t v19 = *p_scanningTypes;
    }
    v23 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v19 addObject:v23];
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  BOOL v44 = a8;
  BOOL v8 = a7;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int64_t v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      uint64_t v17 = "UnexpectedType";
    }
    else {
      uint64_t v17 = (&off_100984170)[a3];
    }
    uint64_t v18 = IMLoggingStringForArray();
    unint64_t v19 = (void *)v18;
    CFStringRef v20 = @"NO";
    *(_DWORD *)buf = 136316418;
    v46 = v17;
    __int16 v47 = 2112;
    if (v8) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    id v48 = v13;
    if (v44) {
      CFStringRef v20 = @"YES";
    }
    __int16 v49 = 2112;
    id v50 = v14;
    __int16 v51 = 2112;
    uint64_t v52 = v18;
    __int16 v53 = 2112;
    CFStringRef v54 = v21;
    __int16 v55 = 2112;
    CFStringRef v56 = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "startScanningForType:%s withData:%@ mask:%@ peers:%@ boostedScan:%@ duplicates:%@", buf, 0x3Eu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    v22 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    uint64_t v23 = IMLoggingStringForArray();
    id v24 = (void *)v23;
    id v25 = v8 ? @"YES" : @"NO";
    id v26 = v44 ? @"YES" : @"NO";
    v42 = v25;
    v43 = v26;
    id v40 = v14;
    v41 = (void *)v23;
    id v38 = v22;
    id v39 = v13;
    _IDSLogTransport();

    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        long long v27 = "UnexpectedType";
      }
      else {
        long long v27 = (&off_100984170)[a3];
      }
      IMLoggingStringForArray();
      v42 = v25;
      v43 = v26;
      v41 = id v40 = v14;
      id v38 = (void *)v27;
      id v39 = v13;
      _IDSLogV();
    }
  }
  if (self->_state != 3)
  {
    __int16 v28 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  __int16 v29 = objc_msgSend(v15, "__imArrayByApplyingBlock:", &stru_100984188, v38, v39, v40, v41, v42, v43);

  if ((unint64_t)a3 >= 3) {
    int64_t v30 = 3;
  }
  else {
    int64_t v30 = a3;
  }
  [(WPContinuity *)self->_continuity startScanningForType:v30 withData:v13 mask:v14 peers:v29 boostedScan:v8 duplicates:v44];
  scanningTypes = self->_scanningTypes;
  id v32 = +[NSNumber numberWithInteger:a3];
  LOBYTE(scanningTypes) = [(NSMutableSet *)scanningTypes containsObject:v32];

  if ((scanningTypes & 1) == 0)
  {
    long long v33 = self->_scanningTypes;
    if (!v33)
    {
      long long v34 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v36 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v34;

      long long v33 = *p_scanningTypes;
    }
    __int16 v37 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v33 addObject:v37];
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      id v15 = "UnexpectedType";
    }
    else {
      id v15 = (&off_100984170)[a3];
    }
    CFStringRef v16 = @"NO";
    *(_DWORD *)buf = 136316162;
    __int16 v37 = v15;
    __int16 v38 = 2112;
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    id v39 = v12;
    if (v7) {
      CFStringRef v16 = @"YES";
    }
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    CFStringRef v43 = v17;
    __int16 v44 = 2112;
    CFStringRef v45 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "startScanningForType:%s withData:%@ mask:%@ boostedScan:%@ duplicates:%@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    uint64_t v18 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    unint64_t v19 = v8 ? @"YES" : @"NO";
    CFStringRef v20 = v7 ? @"YES" : @"NO";
    long long v34 = v19;
    __int16 v35 = v20;
    id v32 = v12;
    id v33 = v13;
    __int16 v31 = v18;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        CFStringRef v21 = "UnexpectedType";
      }
      else {
        CFStringRef v21 = (&off_100984170)[a3];
      }
      long long v34 = v19;
      __int16 v35 = v20;
      id v32 = v12;
      id v33 = v13;
      __int16 v31 = (void *)v21;
      _IDSLogV();
    }
  }
  if (self->_state != 3)
  {
    v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  if ((unint64_t)a3 >= 3) {
    int64_t v23 = 3;
  }
  else {
    int64_t v23 = a3;
  }
  -[WPContinuity startScanningForType:withData:mask:peers:boostedScan:duplicates:](self->_continuity, "startScanningForType:withData:mask:peers:boostedScan:duplicates:", v23, v12, v13, 0, v8, v7, v31, v32, v33, v34, v35);
  scanningTypes = self->_scanningTypes;
  id v25 = +[NSNumber numberWithInteger:a3];
  LOBYTE(scanningTypes) = [(NSMutableSet *)scanningTypes containsObject:v25];

  if ((scanningTypes & 1) == 0)
  {
    id v26 = self->_scanningTypes;
    if (!v26)
    {
      long long v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      __int16 v29 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v27;

      id v26 = *p_scanningTypes;
    }
    int64_t v30 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v26 addObject:v30];
  }
}

- (void)stopScanningForType:(int64_t)a3
{
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      id v6 = "UnexpectedType";
    }
    else {
      id v6 = (&off_100984170)[a3];
    }
    *(_DWORD *)buf = 136315138;
    CFStringRef v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopScanningForType:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    BOOL v7 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_100984170)[a3];
    id v15 = v7;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a3 > 2) {
        BOOL v8 = "UnexpectedType";
      }
      else {
        BOOL v8 = (&off_100984170)[a3];
      }
      id v15 = (void *)v8;
      _IDSLogV();
    }
  }
  if ((unint64_t)a3 >= 3) {
    int64_t v9 = 3;
  }
  else {
    int64_t v9 = a3;
  }
  -[WPContinuity stopScanningForType:](self->_continuity, "stopScanningForType:", v9, v15);
  scanningTypes = self->_scanningTypes;
  id v11 = +[NSNumber numberWithInteger:a3];
  LODWORD(scanningTypes) = [(NSMutableSet *)scanningTypes containsObject:v11];

  if (scanningTypes)
  {
    id v12 = self->_scanningTypes;
    id v13 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v12 removeObject:v13];

    if (![(NSMutableSet *)self->_scanningTypes count])
    {
      id v14 = self->_scanningTypes;
      self->_scanningTypes = 0;
    }
  }
}

- (void)connectOnMainQueueToPeer:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    continuity = self->_continuity;
    *(_DWORD *)buf = 138543618;
    id v41 = v4;
    __int16 v42 = 2112;
    CFStringRef v43 = continuity;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connectToPeer %{public}@, continuity %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v31 = v4;
      id v33 = self->_continuity;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v31 = v4;
        id v33 = self->_continuity;
        _IDSLogV();
      }
    }
  }
  if (v4)
  {
    if (self->_continuity)
    {
      BOOL v7 = +[IDSDevicePolicyController sharedInstance];
      unsigned __int8 v8 = [v7 shouldBlackOutDeviceWithCbuuid:v4];

      if ((v8 & 1) == 0)
      {
        if (self->_state == 3)
        {
          int64_t v9 = [(NSMutableDictionary *)self->_linkIDToLink objectForKey:v4];

          if (v9)
          {
            id v10 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v41 = v4;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "already connected to %{public}@.", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  _IDSLogV();
                }
              }
            }
            goto LABEL_51;
          }
          linkIDsConnecting = self->_linkIDsConnecting;
          if (!linkIDsConnecting)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            uint64_t v18 = self->_linkIDsConnecting;
            self->_linkIDsConnecting = Mutable;

            linkIDsConnecting = self->_linkIDsConnecting;
          }
          unint64_t v19 = -[NSMutableDictionary objectForKey:](linkIDsConnecting, "objectForKey:", v4, v31, v33);
          CFStringRef v20 = v19;
          if (v19 && ([v19 timeIntervalSinceNow], fabs(v21) < 10.0))
          {
            v22 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              int64_t v23 = [(NSMutableDictionary *)self->_linkIDsConnecting objectForKey:v4];
              [v23 timeIntervalSinceNow];
              *(_DWORD *)buf = 138543618;
              id v41 = v4;
              __int16 v42 = 2048;
              CFStringRef v43 = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "already connecting to %{public}@  (Time: %f)", buf, 0x16u);
            }
            if (!os_log_shim_legacy_logging_enabled()) {
              goto LABEL_50;
            }
            if (!_IDSShouldLogTransport()) {
              goto LABEL_50;
            }
            id v25 = [(NSMutableDictionary *)self->_linkIDsConnecting objectForKey:v4];
            [v25 timeIntervalSinceNow];
            uint64_t v34 = v26;
            _IDSLogTransport();

            if (!_IDSShouldLog()) {
              goto LABEL_50;
            }
            -[NSMutableDictionary objectForKey:](self->_linkIDsConnecting, "objectForKey:", v4, v4, v34);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            [v27 timeIntervalSinceNow];
            _IDSLogV();
          }
          else
          {
            __int16 v28 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v41 = v4;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "*** starting connection to %{public}@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v32 = v4;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  id v32 = v4;
                  _IDSLogV();
                }
              }
            }
            __int16 v29 = self->_linkIDsConnecting;
            int64_t v30 = +[NSDate date];
            [(NSMutableDictionary *)v29 setObject:v30 forKey:v4];

            id v27 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
            kdebug_trace();
            [(WPContinuity *)self->_continuity connectToPeer:v27];
          }

LABEL_50:
          goto LABEL_51;
        }
        id v11 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v12 = self->_connectivityDelegates;
        id v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v36;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v36 != v14) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "manager:cbuuidDidFailToConnect:withReason:", self, v4, 0, v31, v33, (void)v35);
            }
            id v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v13);
        }
      }
    }
  }
LABEL_51:
}

- (void)connectToPeer:(id)a3
{
  id v4 = a3;
  id v5 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100174E90;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)disconnectOnMainQueueFromPeer:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    continuity = self->_continuity;
    *(_DWORD *)buf = 138543618;
    id v27 = v4;
    __int16 v28 = 2114;
    __int16 v29 = continuity;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "disconnectFromPeer %{public}@, continuity %{public}@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v22 = v4;
      id v24 = self->_continuity;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v22 = v4;
        id v24 = self->_continuity;
        _IDSLogV();
      }
    }
  }
  if (v4 && self->_continuity)
  {
    linkIDsDisconnecting = self->_linkIDsDisconnecting;
    if (!linkIDsDisconnecting)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      int64_t v9 = self->_linkIDsDisconnecting;
      self->_linkIDsDisconnecting = Mutable;

      linkIDsDisconnecting = self->_linkIDsDisconnecting;
    }
    id v10 = -[NSMutableDictionary objectForKey:](linkIDsDisconnecting, "objectForKey:", v4, v22, v24);
    id v11 = v10;
    if (v10 && ([v10 timeIntervalSinceNow], fabs(v12) < 10.0))
    {
      id v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(NSMutableDictionary *)self->_linkIDsDisconnecting objectForKey:v4];
        [v14 timeIntervalSinceNow];
        *(_DWORD *)buf = 138543618;
        id v27 = v4;
        __int16 v28 = 2048;
        __int16 v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "already disconnecting from %{public}@  (Time: %f)", buf, 0x16u);
      }
      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_27;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_27;
      }
      CFStringRef v16 = [(NSMutableDictionary *)self->_linkIDsDisconnecting objectForKey:v4];
      [v16 timeIntervalSinceNow];
      uint64_t v25 = v17;
      _IDSLogTransport();

      if (!_IDSShouldLog()) {
        goto LABEL_27;
      }
      -[NSMutableDictionary objectForKey:](self->_linkIDsDisconnecting, "objectForKey:", v4, v4, v25);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      [v18 timeIntervalSinceNow];
      _IDSLogV();
    }
    else
    {
      unint64_t v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v4;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "*** starting disconnected from %{public}@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v23 = v4;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v23 = v4;
            _IDSLogV();
          }
        }
      }
      CFStringRef v20 = self->_linkIDsDisconnecting;
      double v21 = +[NSDate date];
      [(NSMutableDictionary *)v20 setObject:v21 forKey:v4];

      id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
      [(WPContinuity *)self->_continuity disconnectFromPeer:v18];
    }

LABEL_27:
  }
}

- (void)disconnectFromPeer:(id)a3
{
  id v4 = a3;
  id v5 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100175384;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeLink:(id)a3
{
  id v4 = a3;
  id v5 = [v4 linkID];
  id v6 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175464;
  block[3] = &unk_10097E418;
  id v10 = v4;
  id v11 = v5;
  double v12 = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (unint64_t)sendData:(id)a3 peerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v13 = [v6 length];
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendData %luB peerID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v6 length];
    _IDSLogV();
  }
  if (self->_state == 3)
  {
    [(WPContinuity *)self->_continuity sendData:v6 toPeer:v7];
    unint64_t v9 = 0;
  }
  else
  {
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    unint64_t v9 = 6;
  }

  return v9;
}

- (void)_cleanup
{
  linkIDToLink = self->_linkIDToLink;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001758AC;
  v6[3] = &unk_100980928;
  v6[4] = self;
  [(NSMutableDictionary *)linkIDToLink enumerateKeysAndObjectsUsingBlock:v6];
  [(NSMutableDictionary *)self->_linkIDToLink removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained manager:self didPowerStateChange:0];

  id v5 = +[IDSUTunDeliveryController sharedInstance];
  [v5 unlockAllContinuityPeers];
}

- (void)systemDidFastUserSwitchOut
{
  self->_systemIsFastUserSwitched = 1;
  [(IDSWPLinkManager *)self _continuityDidUpdateStateWithStateValue:1];

  [(IDSWPLinkManager *)self _checkWPContinuitySetup];
}

- (void)systemDidFastUserSwitchIn
{
  self->_systemIsFastUserSwitched = 0;
  [(IDSWPLinkManager *)self _checkWPContinuitySetup];
}

- (void)continuityDidUpdateState:(id)a3
{
  id v4 = [a3 state];

  [(IDSWPLinkManager *)self _continuityDidUpdateStateWithStateValue:v4];
}

- (void)_continuityDidUpdateStateWithStateValue:(int64_t)a3
{
  self->_int64_t state = a3;
  int64_t state = a3;
  if (a3 < 2)
  {
    [(NSMutableDictionary *)self->_linkIDsConnecting removeAllObjects];
    linkIDsConnecting = self->_linkIDsConnecting;
    self->_linkIDsConnecting = 0;

    [(NSMutableDictionary *)self->_linkIDsDisconnecting removeAllObjects];
    linkIDsDisconnecting = self->_linkIDsDisconnecting;
    self->_linkIDsDisconnecting = 0;

    int64_t state = self->_state;
  }
  if (state <= 2) {
    [(IDSWPLinkManager *)self _cleanup];
  }
  id v8 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175B20;
  block[3] = &unk_10097EA18;
  void block[4] = a3;
  dispatch_async(v8, block);
}

- (void)continuityDidStartAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IDSDaemon sharedInstance];
  id v7 = [v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = 3;
  }
  unint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v10 = (&off_100984170)[v8];
    }
    else {
      id v10 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling continuityDidStartAdvertisingOfType:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v11 = (unint64_t)a4 <= 2 ? (&off_100984170)[v8] : "UnexpectedType";
    id v13 = v11;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        double v12 = (&off_100984170)[v8];
      }
      else {
        double v12 = "UnexpectedType";
      }
      id v13 = (void *)v12;
      _IDSLogV();
    }
  }
  objc_msgSend(v7, "continuityDidStartAdvertisingOfType:", v8, v13);
}

- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IDSDaemon sharedInstance];
  id v7 = [v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = 3;
  }
  unint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v10 = (&off_100984170)[v8];
    }
    else {
      id v10 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling continuityDidStopAdvertisingOfType:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v11 = (unint64_t)a4 <= 2 ? (&off_100984170)[v8] : "UnexpectedType";
    id v13 = v11;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        double v12 = (&off_100984170)[v8];
      }
      else {
        double v12 = "UnexpectedType";
      }
      id v13 = (void *)v12;
      _IDSLogV();
    }
  }
  objc_msgSend(v7, "continuityDidStopAdvertisingOfType:", v8, v13);
}

- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = +[IDSDaemon sharedInstance];
  id v10 = [v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v11 = a4;
  }
  else {
    int64_t v11 = 3;
  }
  double v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v13 = (&off_100984170)[v11];
    }
    else {
      id v13 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315394;
    unint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling continuityDidStopAdvertisingOfType:%s withError:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    __int16 v14 = (unint64_t)a4 <= 2 ? (&off_100984170)[v11] : "UnexpectedType";
    CFStringRef v16 = v14;
    id v17 = v8;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        id v15 = (&off_100984170)[v11];
      }
      else {
        id v15 = "UnexpectedType";
      }
      CFStringRef v16 = (void *)v15;
      id v17 = v8;
      _IDSLogV();
    }
  }
  objc_msgSend(v10, "continuityDidStopAdvertisingOfType:withError:", v11, v8, v16, v17);
}

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = +[IDSDaemon sharedInstance];
  id v10 = [v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v11 = a4;
  }
  else {
    int64_t v11 = 3;
  }
  double v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v13 = (&off_100984170)[v11];
    }
    else {
      id v13 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315394;
    unint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling continuityDidFailToStartAdvertisingOfType:%s withError:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    __int16 v14 = (unint64_t)a4 <= 2 ? (&off_100984170)[v11] : "UnexpectedType";
    CFStringRef v16 = v14;
    id v17 = v8;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        id v15 = (&off_100984170)[v11];
      }
      else {
        id v15 = "UnexpectedType";
      }
      CFStringRef v16 = (void *)v15;
      id v17 = v8;
      _IDSLogV();
    }
  }
  objc_msgSend(v10, "continuityDidFailToStartAdvertisingOfType:withError:", v11, v8, v16, v17);
}

- (void)continuityDidStartScanningForType:(id)a3 scanningType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IDSDaemon sharedInstance];
  id v7 = [v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = 3;
  }
  unint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v10 = (&off_100984170)[v8];
    }
    else {
      id v10 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling continuityDidStartScanningForType:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    int64_t v11 = (unint64_t)a4 <= 2 ? (&off_100984170)[v8] : "UnexpectedType";
    id v13 = v11;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        double v12 = (&off_100984170)[v8];
      }
      else {
        double v12 = "UnexpectedType";
      }
      id v13 = (void *)v12;
      _IDSLogV();
    }
  }
  objc_msgSend(v7, "continuityDidStartScanningForType:", v8, v13);
}

- (void)continuityDidStopScanningForType:(id)a3 scanningType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IDSDaemon sharedInstance];
  id v7 = [v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = 3;
  }
  unint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v10 = (&off_100984170)[v8];
    }
    else {
      id v10 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling continuityDidStopScanningForType:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    int64_t v11 = (unint64_t)a4 <= 2 ? (&off_100984170)[v8] : "UnexpectedType";
    id v13 = v11;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        double v12 = (&off_100984170)[v8];
      }
      else {
        double v12 = "UnexpectedType";
      }
      id v13 = (void *)v12;
      _IDSLogV();
    }
  }
  objc_msgSend(v7, "continuityDidStopScanningForType:", v8, v13);
}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = +[IDSDaemon sharedInstance];
  id v10 = [v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v11 = a4;
  }
  else {
    int64_t v11 = 3;
  }
  double v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v13 = (&off_100984170)[v11];
    }
    else {
      id v13 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315394;
    unint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling continuityDidFailToStartScanningForType:%s withError:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    __int16 v14 = (unint64_t)a4 <= 2 ? (&off_100984170)[v11] : "UnexpectedType";
    CFStringRef v16 = v14;
    id v17 = v8;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        id v15 = (&off_100984170)[v11];
      }
      else {
        id v15 = "UnexpectedType";
      }
      CFStringRef v16 = (void *)v15;
      id v17 = v8;
      _IDSLogV();
    }
  }
  objc_msgSend(v10, "continuityDidFailToStartScanningForType:withError:", v11, v8, v16, v17);
}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 UUIDString];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  __int16 v14 = self->_connectivityDelegates;
  id v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v14);
      }
      if ([*(id *)(*((void *)&v29 + 1) + 8 * v17) manager:self cbuuidDidDiscover:v13])break; {
      if (v15 == (id)++v17)
      }
      {
        id v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v18 = +[IDSDaemon sharedInstance];
  unint64_t v19 = [v18 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  if ((unint64_t)a4 <= 2) {
    int64_t v20 = a4;
  }
  else {
    int64_t v20 = 3;
  }
  id v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 <= 2) {
      id v22 = (&off_100984170)[v20];
    }
    else {
      id v22 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v34 = v22;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "calling continuityDidDiscoverType:%s withData:%@ fromPeer:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v23 = (unint64_t)a4 <= 2 ? (&off_100984170)[v20] : "UnexpectedType";
    id v27 = v11;
    id v28 = v12;
    uint64_t v26 = v23;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if ((unint64_t)a4 <= 2) {
        id v24 = (&off_100984170)[v20];
      }
      else {
        id v24 = "UnexpectedType";
      }
      id v27 = v11;
      id v28 = v12;
      uint64_t v26 = (void *)v24;
      _IDSLogV();
    }
  }
  uint64_t v25 = objc_msgSend(v12, "UUIDString", v26, v27, v28);
  [v19 continuityDidDiscoverType:v20 withData:v11 fromPeer:v25];
}

- (void)continuity:(id)a3 didConnectToPeer:(id)a4 error:(id)a5
{
  id v49 = a3;
  id v8 = (NSHashTable *)a4;
  id v9 = a5;
  id v50 = v8;
  id v10 = [(NSHashTable *)v8 UUIDString];
  if (v10)
  {
    kdebug_trace();
    id v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v62 = v10;
      __int16 v63 = 2114;
      double v64 = *(double *)&v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didConnectToPeer:%{public}@ error:%{public}@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        __int16 v47 = v10;
        double v48 = *(double *)&v9;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          __int16 v47 = v10;
          double v48 = *(double *)&v9;
          _IDSLogV();
        }
      }
    }
    if (v9)
    {
      id v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "linkDidFailToConnect for peer %{public}@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          __int16 v47 = v10;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            __int16 v47 = v10;
            _IDSLogV();
          }
        }
      }
      id v13 = +[IDSUTunDeliveryController sharedInstance];
      unsigned int v14 = [v13 isPeerForPhoneContinuityLocalMessage:v10];

      if (v14)
      {
        id v15 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v10;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skip unlockContinuityPeer for peer %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            __int16 v47 = v10;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              __int16 v47 = v10;
              _IDSLogV();
            }
          }
        }
      }
      else
      {
        uint64_t v25 = +[IDSUTunDeliveryController sharedInstance];
        [v25 unlockContinuityPeer:v10];
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v17 = self->_connectivityDelegates;
      id v26 = [(NSHashTable *)v17 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v52;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v52 != v27) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "manager:cbuuidDidFailToConnect:withReason:", self, v10, v9, v47);
          }
          id v26 = [(NSHashTable *)v17 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v26);
      }
    }
    else
    {
      uint64_t v17 = [(NSMutableDictionary *)self->_linkIDToLink objectForKey:v10];
      if (!v17)
      {
        uint64_t v17 = [[IDSBTLELink alloc] initWithWPLinkManager:self withIdentifier:v10];
        id v18 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v62 = v17;
          __int16 v63 = 2114;
          double v64 = *(double *)&v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BTLELink %{public}@ created with BTID: %{public}@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            __int16 v47 = v17;
            double v48 = *(double *)&v10;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              __int16 v47 = v17;
              double v48 = *(double *)&v10;
              _IDSLogV();
            }
          }
        }
        -[NSMutableDictionary setObject:forKey:](self->_linkIDToLink, "setObject:forKey:", v17, v10, v47, *(void *)&v48, v49);
        kdebug_trace();
        unint64_t v19 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "linkDidConnect %{public}@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            __int16 v47 = v17;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              __int16 v47 = v17;
              _IDSLogV();
            }
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained manager:self linkDidConnect:v17];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v21 = self->_connectivityDelegates;
        id v22 = [(NSHashTable *)v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v56;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v56 != v23) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * (void)j), "manager:cbuuidDidConnect:isAlwaysConnected:", self, v10, 0, v47);
            }
            id v22 = [(NSHashTable *)v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
          }
          while (v22);
        }
      }
    }

    long long v29 = [(NSMutableDictionary *)self->_linkIDsConnecting objectForKey:v10];
    long long v30 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      [v29 timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      v62 = v50;
      __int16 v63 = 2048;
      double v64 = fabs(v31);
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "   * Connect for %@ time was: %f", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        [v29 timeIntervalSinceNow];
        double v48 = fabs(v32);
        __int16 v47 = v50;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          objc_msgSend(v29, "timeIntervalSinceNow", v50, *(void *)&v48);
          double v48 = fabs(v33);
          __int16 v47 = v50;
          _IDSLogV();
        }
      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_linkIDsConnecting, "removeObjectForKey:", v10, v47, *(void *)&v48);
    if (![(NSMutableDictionary *)self->_linkIDsConnecting count])
    {
      linkIDsConnecting = self->_linkIDsConnecting;
      self->_linkIDsConnecting = 0;
    }
    [v29 timeIntervalSinceNow];
    double v36 = ceil(fabs(v35) * 1000.0);
    if (v9)
    {
      id v37 = [objc_alloc((Class)IDSWiProxConnectionFailedMetric) initWithDuration:(unint64_t)v36];
      id v38 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v38 logMetric:v37];

      IMSubmitSimpleAWDMetric();
      id v39 = +[NSString stringWithFormat:@"%@.%@", kIDSCoreAnalyticsIDSDomain, kIDSWiProxConnectionFailureMetricName];
      IMSubmitSimpleCoreAnalyticsMetric();
      id v40 = objc_msgSend(objc_alloc((Class)IDSWiProxDidConnectToPeerMetric), "initWithDuration:resultCode:", (unint64_t)v36, objc_msgSend(v9, "code"));
      id v41 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v41 logMetric:v40];

      __int16 v42 = +[IDSAWDLogging sharedInstance];
      objc_msgSend(v42, "IDSWiProxDidConnectToPeer:resultCode:", (uint64_t)v36, objc_msgSend(v9, "code"));
    }
    else
    {
      if (v36 == 0.0)
      {
LABEL_70:
        CFStringRef v45 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          linkIDToLink = self->_linkIDToLink;
          *(_DWORD *)buf = 138412290;
          v62 = linkIDToLink;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }

        goto LABEL_77;
      }
      id v37 = [objc_alloc((Class)IDSWiProxConnectionSuccessMetric) initWithDuration:(unint64_t)v36];
      CFStringRef v43 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v43 logMetric:v37];

      IMSubmitSimpleAWDMetric();
      id v39 = +[NSString stringWithFormat:@"%@.%@", kIDSCoreAnalyticsIDSDomain, kIDSWiProxConnectionSuccessMetricName];
      IMSubmitSimpleCoreAnalyticsMetric();
      id v40 = [objc_alloc((Class)IDSWiProxDidConnectToPeerMetric) initWithDuration:(unint64_t)v36 resultCode:0];
      __int16 v44 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v44 logMetric:v40];

      __int16 v42 = +[IDSAWDLogging sharedInstance];
      [v42 IDSWiProxDidConnectToPeer:(uint64_t)v36 resultCode:0];
    }

    goto LABEL_70;
  }
  uint64_t v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didConnectToPeer was called with an invalid linkID: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
LABEL_77:
}

- (void)continuity:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  id v10 = a5;
  id v11 = [(NSMutableDictionary *)v9 UUIDString];
  id v12 = [(NSMutableDictionary *)self->_linkIDToLink objectForKey:v11];
  if (v12)
  {
    [(NSMutableDictionary *)self->_linkIDToLink removeObjectForKey:v11];
    id v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "linkDidDisconnect %{public}@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v35 = v12;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          double v35 = v12;
          _IDSLogV();
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained manager:self linkDidDisconnect:v12];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v15 = self->_connectivityDelegates;
    id v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v39;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "manager:cbuuidDidDisconnect:", self, v11, v35);
        }
        id v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v16);
    }

    unint64_t v19 = +[IDSUTunDeliveryController sharedInstance];
    [v19 unlockContinuityPeer:v11];
  }
  int64_t v20 = -[NSMutableDictionary objectForKey:](self->_linkIDsDisconnecting, "objectForKey:", v11, v35);
  id v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    [v20 timeIntervalSinceNow];
    *(_DWORD *)buf = 138412546;
    CFStringRef v43 = v9;
    __int16 v44 = 2048;
    double v45 = fabs(v22);
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "   * Disconnect for %@ time was: %f", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      [v20 timeIntervalSinceNow];
      double v37 = fabs(v23);
      double v36 = v9;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        objc_msgSend(v20, "timeIntervalSinceNow", v9, *(void *)&v37);
        double v37 = fabs(v24);
        double v36 = v9;
        _IDSLogV();
      }
    }
  }
  -[NSMutableDictionary removeObjectForKey:](self->_linkIDsConnecting, "removeObjectForKey:", v11, v36, *(void *)&v37, (void)v38);
  [(NSMutableDictionary *)self->_linkIDsDisconnecting removeObjectForKey:v11];
  if (![(NSMutableDictionary *)self->_linkIDsDisconnecting count])
  {
    linkIDsDisconnecting = self->_linkIDsDisconnecting;
    self->_linkIDsDisconnecting = 0;
  }
  if (![(NSMutableDictionary *)self->_linkIDsConnecting count])
  {
    linkIDsConnecting = self->_linkIDsConnecting;
    self->_linkIDsConnecting = 0;
  }
  [v20 timeIntervalSinceNow];
  double v28 = ceil(fabs(v27) * 1000.0);
  if (v10)
  {
    id v29 = objc_msgSend(objc_alloc((Class)IDSWiProxDidDisconnectFromPeerMetric), "initWithDuration:resultCode:", (unint64_t)v28, objc_msgSend(v10, "code"));
    long long v30 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v30 logMetric:v29];

    double v31 = +[IDSAWDLogging sharedInstance];
    objc_msgSend(v31, "IDSWiProxDidDisconnectFromPeer:resultCode:", (uint64_t)v28, objc_msgSend(v10, "code"));
  }
  else
  {
    if (v28 == 0.0) {
      goto LABEL_31;
    }
    id v29 = [objc_alloc((Class)IDSWiProxDidDisconnectFromPeerMetric) initWithDuration:(unint64_t)v28 resultCode:0];
    double v32 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v32 logMetric:v29];

    double v31 = +[IDSAWDLogging sharedInstance];
    [v31 IDSWiProxDidDisconnectFromPeer:(uint64_t)v28 resultCode:0];
  }

LABEL_31:
  double v33 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    linkIDToLink = self->_linkIDToLink;
    *(_DWORD *)buf = 138412290;
    CFStringRef v43 = linkIDToLink;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)continuity:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = v12;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "didSendData to:%{public}@ error:%{public}@ data:%{public}@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v15 = objc_msgSend(objc_alloc((Class)IDSWiProxDidSendDataMetric), "initWithResultCode:", objc_msgSend(v13, "code"));
  id v16 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v16 logMetric:v15];

  uint64_t v17 = +[IDSAWDLogging sharedInstance];
  objc_msgSend(v17, "IDSWiProxDidSendData:", objc_msgSend(v13, "code"));

  id v18 = [v12 UUIDString];
  unint64_t v19 = [(NSMutableDictionary *)self->_linkIDToLink objectForKey:v18];
  [v19 setHasSpaceAvailable:1];
}

- (void)continuity:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  id v10 = a5;
  id v11 = [v10 UUIDString];
  id v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int64_t v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didReceiveData from:%{public}@ data:%{public}@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v17 = v11;
    id v18 = v9;
    _IDSLogV();
  }
  id v13 = -[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v11, v17, v18);
  unsigned int v14 = v13;
  if (v13)
  {
    [v13 didReceiveData:v9];
  }
  else
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      linkIDToLink = self->_linkIDToLink;
      *(_DWORD *)buf = 138412546;
      int64_t v20 = v11;
      __int16 v21 = 2112;
      __int16 v22 = linkIDToLink;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "missing peer:%@ links:%@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)sendReset
{
  v3 = +[IDSDaemon sharedInstance];
  id v4 = [v3 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0];

  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reseting client states", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "Resetting";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "   calling continuityDidUpdateStateToState:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      unsigned int v14 = "Resetting";
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        unsigned int v14 = "Resetting";
        _IDSLogV();
      }
    }
  }
  objc_msgSend(v4, "continuityDidUpdateStateToState:", 1, v14);
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 3) {
      id v9 = "UnexpectedState";
    }
    else {
      id v9 = (&off_100984150)[state];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "   calling continuityDidUpdateStateToState:%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    unint64_t v10 = self->_state;
    id v11 = v10 > 3 ? "UnexpectedState" : (&off_100984150)[v10];
    id v15 = v11;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      unint64_t v12 = self->_state;
      if (v12 > 3) {
        id v13 = "UnexpectedState";
      }
      else {
        id v13 = (&off_100984150)[v12];
      }
      id v15 = (void *)v13;
      _IDSLogV();
    }
  }
  objc_msgSend(v4, "continuityDidUpdateStateToState:", self->_state, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityDelegates, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkIDsAlwaysConnected, 0);
  objc_storeStrong((id *)&self->_linkIDsDisconnecting, 0);
  objc_storeStrong((id *)&self->_linkIDsConnecting, 0);
  objc_storeStrong((id *)&self->_linkIDToLink, 0);
  objc_storeStrong((id *)&self->_scanningTypes, 0);
  objc_storeStrong((id *)&self->_advertisingTypes, 0);

  objc_storeStrong((id *)&self->_continuity, 0);
}

@end