@interface IDSBTLinkManager
- (BOOL)isPoweredOn;
- (IDSBTLinkManager)initWithDelegate:(id)a3 pairedDevice:(id)a4;
- (IDSNanoRegistryPluginManager)idsNRPluginManager;
- (NSString)pairedDevice;
- (id)nanoRegistryPluginManager;
- (void)_advertiseNow;
- (void)_connectNow;
- (void)_stopAdvertising;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)obliterateConnectionInfo;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)removeLink:(id)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setIdsNRPluginManager:(id)a3;
- (void)setLinkPreferences:(id)a3;
- (void)start;
- (void)startDatagramLink;
- (void)startDatagramLinkWithEndpointIdentifier:(id)a3;
- (void)startDatagramLinkWithName:(id)a3;
- (void)stop;
- (void)stopDatagramLink;
- (void)stopDatagramLinkWithEndpointIdentifier:(id)a3;
- (void)stopDatagramLinkWithName:(id)a3;
- (void)updatePairedDevice:(id)a3;
@end

@implementation IDSBTLinkManager

- (IDSBTLinkManager)initWithDelegate:(id)a3 pairedDevice:(id)a4
{
  id v6 = a3;
  v7 = (IDSBTLinkManager *)a4;
  v36.receiver = self;
  v36.super_class = (Class)IDSBTLinkManager;
  v8 = [(IDSBTLinkManager *)&v36 init];
  if (!v8)
  {
LABEL_27:
    v32 = v8;
    goto LABEL_35;
  }
  v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "============= New BTLinkManager %@ starting =============", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v35 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v35 = v8;
        _IDSLogV();
      }
    }
  }
  if (v7)
  {
    v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "using %@ UUID from LinkManager", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v35 = v7;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v35 = v7;
          _IDSLogV();
        }
      }
    }
    v11 = (NSString *)[(IDSBTLinkManager *)v7 copy];
    pipePeripheralUUIDString = v8->_pipePeripheralUUIDString;
    v8->_pipePeripheralUUIDString = v11;

    IMSetDomainValueForKey();
  }
  else
  {
    v13 = IMGetDomainValueForKey();
    v14 = (NSString *)[v13 copy];
    v15 = v8->_pipePeripheralUUIDString;
    v8->_pipePeripheralUUIDString = v14;

    v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v8->_pipePeripheralUUIDString;
      *(_DWORD *)buf = 138412290;
      v38 = (IDSBTLinkManager *)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "read pipe peripheral UUID from default: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v35 = (IDSBTLinkManager *)v8->_pipePeripheralUUIDString;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v35 = (IDSBTLinkManager *)v8->_pipePeripheralUUIDString;
          _IDSLogV();
        }
      }
    }
  }
  if (v8->_pipePeripheralUUIDString)
  {
    v18 = IMGetDomainValueForKey();
    v19 = IMGetDomainValueForKey();
    v20 = v18;
    if (v18 || (v20 = v19) != 0) {
      unsigned __int8 v21 = objc_msgSend(v20, "BOOLValue", v35);
    }
    else {
      unsigned __int8 v21 = 1;
    }
    v8->_useSkywalkChannel = v21;
    objc_storeWeak((id *)&v8->_delegate, v6);
    v8->_isPipeConnectingOrConnected = 0;
    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    linkIDToLink = v8->_linkIDToLink;
    v8->_linkIDToLink = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    linkIDToDatagramLink = v8->_linkIDToDatagramLink;
    v8->_linkIDToDatagramLink = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    datagramPipeRegistration = v8->_datagramPipeRegistration;
    v8->_datagramPipeRegistration = v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create("IDSBTLinkManager", v29);
    managerQueue = v8->_managerQueue;
    v8->_managerQueue = (OS_dispatch_queue *)v30;

    goto LABEL_27;
  }
  v33 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "pipe peripheral UUID is nil!  Not setting up BTLinkManager", buf, 2u);
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
  v32 = 0;
LABEL_35:

  return v32;
}

- (void)dealloc
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "============= Old BTLinkManager %@ stopping =============", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v4 = self;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v4 = self;
        _IDSLogV();
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)IDSBTLinkManager;
  [(IDSBTLinkManager *)&v5 dealloc];
}

- (void)_advertiseNow
{
  if ([(CBPeripheralManager *)self->_peripheralManager state] == (id)5 && !self->_isAdvertising)
  {
    v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      peripheralManager = self->_peripheralManager;
      *(_DWORD *)buf = 138412290;
      v9 = peripheralManager;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ start advertising empty now", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v7 = self->_peripheralManager;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v7 = self->_peripheralManager;
        _IDSLogV();
      }
    }
    p_peripheralManager = &self->_peripheralManager;
    -[CBPeripheralManager startAdvertising:](self->_peripheralManager, "startAdvertising:", 0, v7);
    self->_isAdvertising = 1;
    id v6 = [(IDSBTLinkManager *)self nanoRegistryPluginManager];
    [v6 notifyWatchDidStartAdvertisingWithPeripheralManager:*p_peripheralManager];
  }
}

- (void)_stopAdvertising
{
  if (self->_isAdvertising)
  {
    v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stop advertising", v5, 2u);
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
    if ((uint64_t)[(CBPeripheralManager *)self->_peripheralManager state] >= 4) {
      [(CBPeripheralManager *)self->_peripheralManager stopAdvertising];
    }
    self->_isAdvertising = 0;
    v4 = [(IDSBTLinkManager *)self nanoRegistryPluginManager];
    [v4 notifyWatchDidStopAdvertisingWithPeripheralManager:self->_peripheralManager];
  }
}

- (void)_connectNow
{
  if (!self->_isCentral
    && self->_pipeRegistered
    && [(CBCentralManager *)self->_centralManager state] == (id)5
    && !self->_isPipeConnectingOrConnected)
  {
    if (self->_pipePeripheral) {
      goto LABEL_24;
    }
    v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      pipePeripheralUUIDString = self->_pipePeripheralUUIDString;
      *(_DWORD *)buf = 138412290;
      v20 = (CBPeripheral *)pipePeripheralUUIDString;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "using pipe peripheral UUID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v17 = (CBPeripheral *)self->_pipePeripheralUUIDString;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v17 = (CBPeripheral *)self->_pipePeripheralUUIDString;
          _IDSLogV();
        }
      }
    }
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_pipePeripheralUUIDString];
    id v6 = v5;
    if (v5)
    {
      centralManager = self->_centralManager;
      id v18 = v5;
      v8 = +[NSArray arrayWithObjects:&v18 count:1];
      v9 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v8];

      if (v9 && [v9 count])
      {
        v10 = [v9 firstObject];
        pipePeripheral = self->_pipePeripheral;
        self->_pipePeripheral = v10;

        v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_pipePeripheral;
          *(_DWORD *)buf = 138412290;
          v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "created pipe peripheral %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v17 = self->_pipePeripheral;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v17 = self->_pipePeripheral;
              _IDSLogV();
            }
          }
        }
      }
    }
    if (self->_pipePeripheral)
    {
LABEL_24:
      v14 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_pipePeripheral;
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connecting to %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v17 = self->_pipePeripheral;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v17 = self->_pipePeripheral;
          _IDSLogV();
        }
      }
      -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", self->_pipePeripheral, 0, v17);
      self->_isPipeConnectingOrConnected = 1;
    }
    else
    {
      v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "pipe peripheral is not set. Not connecting", buf, 2u);
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
}

- (void)start
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D4100;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)stop
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D4224;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)connect
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D44BC;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)removeLink:(id)a3
{
  id v4 = a3;
  id v5 = [v4 linkID];
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D4588;
  block[3] = &unk_10097E418;
  id v10 = v4;
  id v11 = v5;
  v12 = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(managerQueue, block);
}

- (void)updatePairedDevice:(id)a3
{
  id v4 = a3;
  managerQueue = self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D4778;
  v7[3] = &unk_10097E440;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)obliterateConnectionInfo
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D52F8;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)setLinkPreferences:(id)a3
{
  id v4 = a3;
  managerQueue = self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D5510;
  v7[3] = &unk_10097E440;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)startDatagramLink
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D59E8;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)stopDatagramLink
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D5ACC;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)startDatagramLinkWithName:(id)a3
{
  id v4 = a3;
  managerQueue = self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D5BD4;
  v7[3] = &unk_10097E440;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)stopDatagramLinkWithName:(id)a3
{
  id v4 = a3;
  managerQueue = self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D5CD4;
  v7[3] = &unk_10097E440;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)startDatagramLinkWithEndpointIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v4];
  id v6 = (char *)[v5 unsignedIntegerValue];

  id v7 = v6 + 1;
  id v8 = +[NSNumber numberWithUnsignedInteger:v6 + 1];
  [(NSMutableDictionary *)self->_datagramPipeRegistration setObject:v8 forKeyedSubscript:v4];

  if (self->_pipeRegistered)
  {
    if (v6)
    {
      v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v22 = v4;
        *(_WORD *)&v22[8] = 1024;
        *(_DWORD *)&v22[10] = v6;
        __int16 v23 = 1024;
        int v24 = v6 + 1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not registering datagram link endpoint %@ registrationCount %u => %u", buf, 0x18u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
LABEL_8:
          }
            _IDSLogV();
        }
      }
    }
    else
    {
      BOOL isCentral = self->_isCentral;
      BOOL v12 = !self->_isCentral;
      v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v22 = !isCentral;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v4;
        __int16 v23 = 1024;
        int v24 = (int)v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registering datagram link type %d endpoint %@ registrationCount 0 => %u", buf, 0x18u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v17 = v4;
          id v18 = v7;
          BOOL v16 = !isCentral;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v17 = v4;
            id v18 = v7;
            BOOL v16 = !isCentral;
            _IDSLogV();
          }
        }
      }
      pipeManager = self->_pipeManager;
      uint64_t v19 = CBScalablePipeOptionTransport;
      v20 = &off_1009D1CC8;
      v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, v16, v17, v18);
      [(CBScalablePipeManager *)pipeManager registerEndpoint:v4 type:v12 priority:3 options:v15];
    }
  }
  else
  {
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot start datagram link if regular pipe not registered", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_8;
        }
      }
    }
  }
}

- (void)stopDatagramLinkWithEndpointIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v4];
  id v6 = (char *)[v5 unsignedIntegerValue];

  if (v6 == (char *)1)
  {
    [(NSMutableDictionary *)self->_datagramPipeRegistration setObject:0 forKeyedSubscript:v4];
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v4;
      __int16 v16 = 1024;
      int v17 = 1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregistering datagram link endpoint %@ registrationCount %u => 0", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v11 = v4;
        uint64_t v12 = 1;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v11 = v4;
          uint64_t v12 = 1;
          _IDSLogV();
        }
      }
    }
    -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v4, v11, v12);
  }
  else if (v6)
  {
    v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v4;
      __int16 v16 = 1024;
      int v17 = (int)v6;
      __int16 v18 = 1024;
      int v19 = v6 - 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not unregistering datagram link endpoint %@ registrationCount %u => %u", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v12 = (uint64_t)v6;
        uint64_t v13 = (v6 - 1);
        id v11 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v12 = (uint64_t)v6;
          uint64_t v13 = (v6 - 1);
          id v11 = v4;
          _IDSLogV();
        }
      }
    }
    id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6 - 1, v11, v12, v13);
    [(NSMutableDictionary *)self->_datagramPipeRegistration setObject:v10 forKeyedSubscript:v4];
  }
  else
  {
    id v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot unregister datagram link endpoint %@ - not registered", buf, 0xCu);
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

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 5)
    {
      id v6 = "UnexpectedState";
    }
    else
    {
      id v6 = (&_centralManagerStateStrings)[(void)[v4 state]];
    }
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2080;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ didUpdateState %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v7 = ((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 5
       ? "UnexpectedState"
       : (&_centralManagerStateStrings)[(void)[v4 state]];
    id v10 = v4;
    id v11 = v7;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (((unint64_t)objc_msgSend(v4, "state", v4, v11) & 0x8000000000000000) != 0
        || (uint64_t)[v4 state] > 5)
      {
        id v8 = "UnexpectedState";
      }
      else
      {
        id v8 = (&_centralManagerStateStrings)[(void)[v4 state]];
      }
      id v10 = v4;
      id v11 = (void *)v8;
      _IDSLogV();
    }
  }
  if (objc_msgSend(v4, "state", v10, v11) == (id)5)
  {
    [(IDSBTLinkManager *)self _connectNow];
  }
  else if ((uint64_t)[v4 state] <= 4)
  {
    self->_isPipeConnectingOrConnected = 0;
    if ((uint64_t)[v4 state] <= 3)
    {
      pipePeripheral = self->_pipePeripheral;
      self->_pipePeripheral = 0;
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ didConnectPeripheral %@", buf, 0x16u);
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

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = (NSMutableDictionary *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ didFailToConnectPeripheral %@ err %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v15 = v9;
      id v16 = v10;
      __int16 v14 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v15 = v9;
        id v16 = v10;
        __int16 v14 = v8;
        _IDSLogV();
      }
    }
  }
  self->_isPipeConnectingOrConnected = 0;
  [(IDSBTLinkManager *)self _connectNow];
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    linkIDToLink = self->_linkIDToLink;
    *(_DWORD *)buf = 138412290;
    __int16 v18 = linkIDToLink;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = (NSMutableDictionary *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ didDisconnectPeripheral %@ err %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v15 = v9;
      id v16 = v10;
      __int16 v14 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v15 = v9;
        id v16 = v10;
        __int16 v14 = v8;
        _IDSLogV();
      }
    }
  }
  self->_isPipeConnectingOrConnected = 0;
  [(IDSBTLinkManager *)self _connectNow];
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    linkIDToLink = self->_linkIDToLink;
    *(_DWORD *)buf = 138412290;
    __int16 v18 = linkIDToLink;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 5)
    {
      id v6 = "UnexpectedState";
    }
    else
    {
      id v6 = (&_peripheralManagerStateStrings)[(void)[v4 state]];
    }
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2080;
    __int16 v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ didUpdateState %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v7 = ((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 5
       ? "UnexpectedState"
       : (&_peripheralManagerStateStrings)[(void)[v4 state]];
    id v9 = v4;
    id v10 = v7;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (((unint64_t)objc_msgSend(v4, "state", v4, v10) & 0x8000000000000000) != 0
        || (uint64_t)[v4 state] > 5)
      {
        id v8 = "UnexpectedState";
      }
      else
      {
        id v8 = (&_peripheralManagerStateStrings)[(void)[v4 state]];
      }
      id v9 = v4;
      id v10 = (void *)v8;
      _IDSLogV();
    }
  }
  if (objc_msgSend(v4, "state", v9, v10) == (id)5)
  {
    [(IDSBTLinkManager *)self _advertiseNow];
  }
  else if ((uint64_t)[v4 state] <= 4 && (uint64_t)objc_msgSend(v4, "state") <= 3)
  {
    self->_isAdvertising = 0;
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ didStartAdvertising error %@", buf, 0x16u);
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
  if (v7) {
    self->_isAdvertising = 0;
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  v39 = (__CFString *)a3;
  id v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)[(__CFString *)v39 state] & 0x8000000000000000) != 0
      || (uint64_t)[(__CFString *)v39 state] > 5)
    {
      id v5 = "UnexpectedState";
    }
    else
    {
      id v5 = (&off_1009880E8)[(void)[(__CFString *)v39 state]];
    }
    *(_DWORD *)buf = 136315138;
    CFStringRef v48 = (const __CFString *)v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " => Pipe did update state: %s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v6 = ((unint64_t)[(__CFString *)v39 state] & 0x8000000000000000) != 0
      || (uint64_t)[(__CFString *)v39 state] > 5
       ? "UnexpectedState"
       : (&off_1009880E8)[(void)[(__CFString *)v39 state]];
    v34 = (__CFString *)v6;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (((unint64_t)[(__CFString *)v39 state] & 0x8000000000000000) != 0
        || (uint64_t)[(__CFString *)v39 state] > 5)
      {
        id v7 = "UnexpectedState";
      }
      else
      {
        id v7 = (&off_1009880E8)[(void)[(__CFString *)v39 state]];
      }
      v34 = (__CFString *)v7;
      _IDSLogV();
    }
  }
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)[(__CFString *)v39 state] & 0x8000000000000000) != 0
      || (uint64_t)[(__CFString *)v39 state] > 5)
    {
      id v9 = "UnexpectedState";
    }
    else
    {
      id v9 = (&off_1009880E8)[(void)[(__CFString *)v39 state]];
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v48 = v39;
    __int16 v49 = 2080;
    CFStringRef v50 = (const __CFString *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ didUpdateState %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (((unint64_t)[(__CFString *)v39 state] & 0x8000000000000000) != 0
      || (uint64_t)[(__CFString *)v39 state] > 5)
    {
      id v10 = "UnexpectedState";
    }
    else
    {
      id v10 = (&off_1009880E8)[(void)[(__CFString *)v39 state]];
    }
    objc_super v36 = v10;
    v34 = v39;
    _IDSLogV();
  }
  if ([(__CFString *)v39 state] == (id)5)
  {
    if (!self->_pipeRegistered)
    {
      BOOL isCentral = self->_isCentral;
      BOOL v12 = !self->_isCentral;
      __int16 v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v14 = @"Client";
        if (!self->_isCentral) {
          CFStringRef v14 = @"Server";
        }
        *(_DWORD *)buf = 138412802;
        CFStringRef v48 = v39;
        __int16 v49 = 2112;
        CFStringRef v50 = @"com.apple.ids";
        __int16 v51 = 2112;
        CFStringRef v52 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ registering for service %@ as %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        if (self->_isCentral) {
          CFStringRef v15 = @"Client";
        }
        else {
          CFStringRef v15 = @"Server";
        }
        v37 = @"com.apple.ids";
        CFStringRef v38 = v15;
        CFStringRef v35 = v39;
        _IDSLogV();
      }
      id v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v17 = @"Client";
        if (!isCentral) {
          CFStringRef v17 = @"Server";
        }
        BOOL useSkywalkChannel = self->_useSkywalkChannel;
        *(_DWORD *)buf = 138412802;
        CFStringRef v48 = @"com.apple.ids";
        __int16 v49 = 2112;
        CFStringRef v50 = v17;
        if (useSkywalkChannel) {
          CFStringRef v19 = @"skywalk";
        }
        else {
          CFStringRef v19 = @"nsstream";
        }
        __int16 v51 = 2112;
        CFStringRef v52 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Register endpoint identifier: %@  type: %@  priority: Medium pipeTransport: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        id v20 = isCentral ? @"Client" : @"Server";
        __int16 v21 = self->_useSkywalkChannel ? @"skywalk" : @"nsstream";
        v37 = v20;
        CFStringRef v38 = v21;
        CFStringRef v35 = @"com.apple.ids";
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          if (self->_useSkywalkChannel) {
            CFStringRef v22 = @"skywalk";
          }
          else {
            CFStringRef v22 = @"nsstream";
          }
          v37 = v20;
          CFStringRef v38 = v22;
          CFStringRef v35 = @"com.apple.ids";
          _IDSLogV();
        }
      }
      BOOL v23 = self->_useSkywalkChannel;
      uint64_t v45 = CBScalablePipeOptionTransport;
      int v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23, v35, v37, v38);
      v46 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      [(__CFString *)v39 registerEndpoint:@"com.apple.ids" type:v12 priority:1 options:v25];
    }
    self->_isPoweredOn = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained manager:self didPowerStateChange:1];
  }
  else
  {
    if ((uint64_t)[(__CFString *)v39 state] > 4) {
      goto LABEL_83;
    }
    [(NSMutableDictionary *)self->_linkIDToLink removeAllObjects];
    [(NSMutableDictionary *)self->_datagramPipeRegistration allKeys];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    id v27 = [WeakRetained countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v41;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(WeakRetained);
          }
          CFStringRef v30 = *(const __CFString **)(*((void *)&v40 + 1) + 8 * i);
          v31 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v30];
            *(_DWORD *)buf = 138412546;
            CFStringRef v48 = v30;
            __int16 v49 = 2112;
            CFStringRef v50 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Unregistering datagram link endpoint %@ registrationCount %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v30];
              CFStringRef v35 = v30;
              v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              _IDSLogTransport();

              if (_IDSShouldLog())
              {
                -[NSMutableDictionary objectForKeyedSubscript:](self->_datagramPipeRegistration, "objectForKeyedSubscript:", v30, v30, v37);
                CFStringRef v35 = v30;
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
                _IDSLogV();
              }
            }
          }
          -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v30, v35, v37);
        }
        id v27 = [WeakRetained countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v27);
    }

    self->_isPoweredOn = 0;
    id v33 = objc_loadWeakRetained((id *)&self->_delegate);
    [v33 manager:self didPowerStateChange:0];

    if ((uint64_t)[(__CFString *)v39 state] <= 3) {
      self->_pipeRegistered = 0;
    }
  }

LABEL_83:
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, " => Pipe did register endpoint: %@  error: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v13 = v9;
      id v14 = v10;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = v9;
        id v14 = v10;
        _IDSLogV();
      }
    }
  }
  BOOL v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ didRegisterEndpoint id %@ err %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v14 = v9;
    id v15 = v10;
    id v13 = v8;
    _IDSLogV();
  }
  self->_pipeRegistered = 1;
  [(IDSBTLinkManager *)self _connectNow];
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " => Pipe did unregister endpoint: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v19 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v19 = v7;
        _IDSLogV();
      }
    }
  }
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v25 = v6;
    __int16 v26 = 2112;
    CFStringRef v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ didUnregisterEndpoint id %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v19 = v6;
    id v21 = v7;
    _IDSLogV();
  }
  if ([(__CFString *)v7 isEqualToString:@"com.apple.ids", v19, v21])
  {
    BOOL isCentral = self->_isCentral;
    BOOL v11 = !self->_isCentral;
    BOOL v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = self->_isCentral;
      *(_DWORD *)buf = 138412802;
      if (v13) {
        CFStringRef v14 = @"Client";
      }
      else {
        CFStringRef v14 = @"Server";
      }
      CFStringRef v25 = v6;
      __int16 v26 = 2112;
      CFStringRef v27 = @"com.apple.ids";
      __int16 v28 = 2112;
      CFStringRef v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ re-registering for service %@ as %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      if (self->_isCentral) {
        CFStringRef v15 = @"Client";
      }
      else {
        CFStringRef v15 = @"Server";
      }
      CFStringRef v22 = @"com.apple.ids";
      CFStringRef v23 = v15;
      CFStringRef v20 = v6;
      _IDSLogV();
    }
    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v17 = @"Client";
      if (!isCentral) {
        CFStringRef v17 = @"Server";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v25 = @"com.apple.ids";
      __int16 v26 = 2112;
      CFStringRef v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Re-register endpoint identifier: %@  type: %@  priority: Medium", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      if (isCentral) {
        CFStringRef v18 = @"Client";
      }
      else {
        CFStringRef v18 = @"Server";
      }
      CFStringRef v20 = @"com.apple.ids";
      CFStringRef v22 = v18;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        CFStringRef v20 = @"com.apple.ids";
        CFStringRef v22 = v18;
        _IDSLogV();
      }
    }
    [(__CFString *)v6 registerEndpoint:@"com.apple.ids", v11, 1, 0, v20, v22, v23 type priority options];
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v52 = a3;
  id v53 = a4;
  id v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v62 = v53;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, " => Pipe did connect: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v43 = v53;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v43 = v53;
        _IDSLogV();
      }
    }
  }
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v62 = v52;
    *(_WORD *)&v62[8] = 2112;
    *(void *)&v62[10] = v53;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ pipeDidConnect %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v43 = v52;
    id v46 = v53;
    _IDSLogV();
  }
  id v8 = objc_msgSend(v53, "name", v43, v46);
  unsigned int v9 = [v8 hasPrefix:@"com.apple.ids.datagram"];

  id v10 = [v53 name];
  unsigned int v11 = [v10 isEqualToString:@"com.apple.ids"];

  if (v11 | v9)
  {
    BOOL v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [v53 name];
      *(_DWORD *)buf = 138412546;
      *(void *)v62 = v52;
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ got a new pipe for service %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v53 name];
      v47 = id v44 = v52;
      _IDSLogV();
    }
    CFStringRef v14 = objc_msgSend(v53, "peer", v44, v47);
    CFStringRef v15 = [v14 identifier];
    __int16 v51 = [v15 UUIDString];

    if (v51)
    {
      if ([(NSString *)self->_pipePeripheralUUIDString isEqualToString:@"LOCAL-SETUP-STARTED"])
      {
        id v16 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v62 = v51;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "pipe UUID is not set yet - deferring verification for %@ until addPairedDevice", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v45 = v51;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              uint64_t v45 = v51;
              _IDSLogV();
            }
          }
        }
        if (v9)
        {
          CFStringRef v17 = [v53 name];
          [(IDSBTLinkManager *)self stopDatagramLinkWithEndpointIdentifier:v17];

LABEL_95:
          goto LABEL_96;
        }
        pendingPipes = self->_pendingPipes;
        if (!pendingPipes)
        {
          CFStringRef v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          int v24 = self->_pendingPipes;
          self->_pendingPipes = v23;

          pendingPipes = self->_pendingPipes;
        }
        -[NSMutableArray addObject:](pendingPipes, "addObject:", v53, v45);
LABEL_88:
        if (self->_isCentral) {
          [(IDSBTLinkManager *)self _stopAdvertising];
        }
        long long v41 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          linkIDToLink = self->_linkIDToLink;
          *(_DWORD *)buf = 138412290;
          *(void *)v62 = linkIDToLink;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        goto LABEL_95;
      }
      if ([(NSString *)self->_pipePeripheralUUIDString isEqualToString:v51])
      {
        id v19 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v62 = v51;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Pipe UUID %@ match", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v45 = v51;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              uint64_t v45 = v51;
              _IDSLogV();
            }
          }
        }
        if (v9) {
          CFStringRef v50 = [[IDSBTDatagramLink alloc] initWithPipe:v53 withDeviceUniqueID:0 cbuuid:v51];
        }
        else {
          CFStringRef v50 = [[IDSBTLink alloc] initWithPipe:v53 useSkywalkChannel:self->_useSkywalkChannel withDeviceUniqueID:0 cbuuid:v51];
        }
        CFStringRef v25 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v62 = v50;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Link %@ created", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v45 = v50;
          _IDSLogV();
        }
        if (v50)
        {
          if (v9)
          {
            [(NSMutableDictionary *)self->_linkIDToDatagramLink setObject:v50 forKey:v51];
          }
          else
          {
            [(NSMutableDictionary *)self->_linkIDToLink setObject:v50 forKey:v51];
            [(IDSBTLinkManager *)self setLinkPreferences:0];
            [(NSMutableDictionary *)self->_datagramPipeRegistration allKeys];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id obj = (id)objc_claimAutoreleasedReturnValue();
            id v27 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v56;
              uint64_t v29 = CBScalablePipeOptionTransport;
              do
              {
                for (i = 0; i != v27; i = (char *)i + 1)
                {
                  if (*(void *)v56 != v28) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                  BOOL isCentral = self->_isCentral;
                  BOOL v33 = !self->_isCentral;
                  v34 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    CFStringRef v35 = [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v31];
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v62 = !isCentral;
                    *(_WORD *)&v62[4] = 2112;
                    *(void *)&v62[6] = v31;
                    *(_WORD *)&v62[14] = 2112;
                    *(void *)&v62[16] = v35;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Re-registering datagram link type %d endpoint %@ registrationCount %@", buf, 0x1Cu);
                  }
                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      BOOL v36 = !isCentral;
                      [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v31];
                      v49 = uint64_t v48 = v31;
                      uint64_t v45 = (IDSBTDatagramLink *)v36;
                      _IDSLogTransport();

                      if (_IDSShouldLog())
                      {
                        -[NSMutableDictionary objectForKeyedSubscript:](self->_datagramPipeRegistration, "objectForKeyedSubscript:", v31, v36, v31, v49);
                        v49 = uint64_t v48 = v31;
                        uint64_t v45 = (IDSBTDatagramLink *)v36;
                        _IDSLogV();
                      }
                    }
                  }
                  pipeManager = self->_pipeManager;
                  uint64_t v59 = v29;
                  v60 = &off_1009D1CC8;
                  CFStringRef v38 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1, v45, v48, v49);
                  [(CBScalablePipeManager *)pipeManager registerEndpoint:v31 type:v33 priority:3 options:v38];
                }
                id v27 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
              }
              while (v27);
            }
          }
          v39 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v62 = v50;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "linkDidConnect:%@", buf, 0xCu);
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
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained manager:self linkDidConnect:v50];

          goto LABEL_88;
        }
        __int16 v26 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v62 = v51;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "could not create a link for %@", buf, 0xCu);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_95;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_95;
        }
        _IDSLogTransport();
        if (!_IDSShouldLog()) {
          goto LABEL_95;
        }
      }
      else
      {
        CFStringRef v20 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          pipePeripheralUUIDString = self->_pipePeripheralUUIDString;
          *(_DWORD *)buf = 138412546;
          *(void *)v62 = v51;
          *(_WORD *)&v62[8] = 2112;
          *(void *)&v62[10] = pipePeripheralUUIDString;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "new UUID %@ doesn't match to existing UUID %@ - ignoring this new pipe", buf, 0x16u);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_95;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_95;
        }
        _IDSLogTransport();
        if (!_IDSShouldLog()) {
          goto LABEL_95;
        }
      }
    }
    else
    {
      CFStringRef v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "pipe UUID is nil", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_95;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_95;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_95;
      }
    }
    _IDSLogV();
    goto LABEL_95;
  }
LABEL_96:
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  long long v40 = (NSMutableDictionary *)a3;
  id v8 = (NSMutableDictionary *)a4;
  long long v41 = (NSMutableDictionary *)a5;
  long long v42 = v8;
  unsigned int v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v49 = v8;
    __int16 v50 = 2112;
    __int16 v51 = v41;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " => Pipe did disconnect: %@   error: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      CFStringRef v30 = v8;
      BOOL v33 = v41;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        CFStringRef v30 = v8;
        BOOL v33 = v41;
        _IDSLogV();
      }
    }
  }
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v49 = v40;
    __int16 v50 = 2112;
    __int16 v51 = v8;
    __int16 v52 = 2112;
    id v53 = v41;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ pipeDidDisconnect %@ err %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    BOOL v33 = v8;
    BOOL v36 = v41;
    CFStringRef v30 = v40;
    _IDSLogV();
  }
  unsigned int v11 = [(NSMutableDictionary *)v8 name];
  unsigned int v12 = [v11 hasPrefix:@"com.apple.ids.datagram"];

  BOOL v13 = [(NSMutableDictionary *)v42 name];
  unsigned int v14 = [v13 isEqualToString:@"com.apple.ids"];

  if (v14 | v12)
  {
    CFStringRef v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(NSMutableDictionary *)v42 name];
      *(_DWORD *)buf = 138412802;
      __int16 v49 = v40;
      __int16 v50 = 2112;
      __int16 v51 = v42;
      __int16 v52 = 2112;
      id v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ pipe %@ disconnected for service %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [(NSMutableDictionary *)v42 name];
      v37 = v34 = v42;
      uint64_t v31 = v40;
      _IDSLogV();
    }
    CFStringRef v17 = [(NSMutableDictionary *)v42 peer];
    CFStringRef v18 = [v17 identifier];
    CFStringRef v38 = [v18 UUIDString];

    if (v12)
    {
      v39 = [(NSMutableDictionary *)self->_linkIDToDatagramLink objectForKey:v38];
      [(NSMutableDictionary *)self->_linkIDToDatagramLink removeObjectForKey:v38];
    }
    else
    {
      v39 = [(NSMutableDictionary *)self->_linkIDToLink objectForKey:v38];
      [(NSMutableDictionary *)self->_linkIDToLink removeObjectForKey:v38];
      [(NSMutableDictionary *)self->_datagramPipeRegistration allKeys];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v44;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v19);
            }
            CFStringRef v23 = *(NSMutableDictionary **)(*((void *)&v43 + 1) + 8 * i);
            int v24 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v25 = [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v23];
              *(_DWORD *)buf = 138412546;
              __int16 v49 = v23;
              __int16 v50 = 2112;
              __int16 v51 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Unregistering datagram link endpoint %@ registrationCount %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                [(NSMutableDictionary *)self->_datagramPipeRegistration objectForKeyedSubscript:v23];
                CFStringRef v35 = v32 = v23;
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_datagramPipeRegistration, "objectForKeyedSubscript:", v23, v23, v35);
                  CFStringRef v35 = v32 = v23;
                  _IDSLogV();
                }
              }
            }
            -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v23, v32, v35);
          }
          id v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v20);
      }
    }
    if (v39)
    {
      __int16 v26 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v49 = v39;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "linkDidDisconnect: %@", buf, 0xCu);
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
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained manager:self linkDidDisconnect:v39];
    }
    if (self->_isCentral) {
      [(IDSBTLinkManager *)self _advertiseNow];
    }
    uint64_t v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      linkIDToLink = self->_linkIDToLink;
      *(_DWORD *)buf = 138412290;
      __int16 v49 = linkIDToLink;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (id)nanoRegistryPluginManager
{
  idsNRPluginManager = self->_idsNRPluginManager;
  if (!idsNRPluginManager)
  {
    id v4 = +[IDSNanoRegistryPluginManager sharedInstance];
    id v5 = self->_idsNRPluginManager;
    self->_idsNRPluginManager = v4;

    idsNRPluginManager = self->_idsNRPluginManager;
  }

  return idsNRPluginManager;
}

- (NSString)pairedDevice
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isPoweredOn
{
  return self->_isPoweredOn;
}

- (IDSNanoRegistryPluginManager)idsNRPluginManager
{
  return self->_idsNRPluginManager;
}

- (void)setIdsNRPluginManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsNRPluginManager, 0);
  objc_storeStrong((id *)&self->_datagramPipeRegistration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managerQueue, 0);
  objc_storeStrong((id *)&self->_linkIDToDatagramLink, 0);
  objc_storeStrong((id *)&self->_linkIDToLink, 0);
  objc_storeStrong((id *)&self->_pipePeripheralUUIDString, 0);
  objc_storeStrong((id *)&self->_pendingPipes, 0);
  objc_storeStrong((id *)&self->_pipePeripheral, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);

  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end