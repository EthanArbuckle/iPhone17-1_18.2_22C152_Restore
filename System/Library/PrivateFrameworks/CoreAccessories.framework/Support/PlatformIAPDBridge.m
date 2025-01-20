@interface PlatformIAPDBridge
+ (id)sharedPlatformIAPDBridge;
- (BOOL)_getPortLockout:(unint64_t)a3;
- (BOOL)_handleTransmitData:(char *)a3 withLength:(unint64_t)a4 forPortID:(unint64_t)a5 withSynchronousTransmit:(BOOL)a6;
- (BOOL)_shouldProcessAuthenticationFailState:(ACCEndpoint_s *)a3;
- (BOOL)iapdAccessory:(ACCEndpoint_s *)a3 dataArrivedFromAccessory:(id)a4;
- (BOOL)supportsIAPD;
- (PlatformIAPDBridge)init;
- (id)findClientPortForUUID:(id)a3;
- (unint64_t)_generatePortID;
- (void)_E75To30PinAdapterConnected;
- (void)_generateIAPDPortInfoForDictionary:(id)a3 fromEndpoint:(ACCEndpoint_s *)a4;
- (void)_generateIAPDPortTypeForDictionary:(id)a3 fromEndpoint:(ACCEndpoint_s *)a4;
- (void)_handleAccessoryInfo:(id *)a3 forPortID:(unint64_t)a4;
- (void)_handleAuthenticationState:(BOOL)a3 forPortID:(unint64_t)a4 certData:(id)a5;
- (void)_handleAvailableCurrentNegotiated:(unsigned __int16)a3 forPortID:(unint64_t)a4;
- (void)_handleB139B164ConnectedStatus:(id)a3;
- (void)_handleIncomingXPCEvent:(id)a3 forXPCConnection:(id)a4;
- (void)_handleLingoesSupported:(unsigned int)a3 forPortID:(unint64_t)a4;
- (void)_handlePrimaryPortReturn:(id)a3;
- (void)_handleResistorID:(id)a3 forPortDictionary:(id)a4;
- (void)_handleResistorIDChanged:(id)a3;
- (void)_handleSetPortLockout:(unint64_t)a3;
- (void)_sendHasAdaptor;
- (void)handleIAPDDisconnect;
- (void)handleIncomingXPCConnection:(id)a3;
- (void)iapdAccessoryArrived:(ACCEndpoint_s *)a3;
- (void)iapdAccessoryLeft:(id)a3;
- (void)init;
- (void)sendData:(char *)a3 length:(unint64_t)a4 forConnection:(id)a5 portUID:(id)a6;
@end

@implementation PlatformIAPDBridge

- (PlatformIAPDBridge)init
{
  v21.receiver = self;
  v21.super_class = (Class)PlatformIAPDBridge;
  v2 = [(PlatformIAPDBridge *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = objc_alloc_init(ACCClientPortShimManager);
    v6 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v5;

    v2[24] = 0;
    if ([v2 supportsIAPD])
    {
      dispatch_queue_t v7 = dispatch_queue_create((const char *)[@"com.apple.accessories.IAPDBridgeQueue" UTF8String], 0);
      v8 = (void *)*((void *)v2 + 5);
      *((void *)v2 + 5) = v7;

      xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.iaptransportd.xpc" UTF8String], *((dispatch_queue_t *)v2 + 5), 1uLL);
      v10 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = mach_service;

      v11 = (_xpc_connection_s *)*((void *)v2 + 4);
      if (v11)
      {
        xpc_connection_set_event_handler(v11, &__block_literal_global_5);
        xpc_connection_activate(*((xpc_connection_t *)v2 + 4));
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v12 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v12 = &_os_log_default;
          id v13 = &_os_log_default;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[PlatformIAPDBridge init]();
        }
      }
    }
    *((_DWORD *)v2 + 12) = -1;
    v14 = (int *)(v2 + 48);
    if (!notify_register_check("com.apple.iaptransportd.notify.availability", (int *)v2 + 12))
    {
      uint64_t state64 = 0;
      notify_get_state(*v14, &state64);
      if (state64 != 1)
      {
        notify_set_state(*v14, 1uLL);
        notify_post("com.apple.iaptransportd.notify.availability");
      }
    }
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_handleResistorIDChanged:" name:ACCPlatformIAPDPort_ResistorIDChangedNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"_handleB139B164ConnectedStatus:" name:ACCPlatformIAPDPort_ReturnB139B164ConnectedNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"_handlePrimaryPortReturn:" name:ACCPlatformIAPDPort_ReturnPrimaryPort object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kIAPTransportServerLaunchedNotification", 0, 0, 1u);
  }
  return (PlatformIAPDBridge *)v2;
}

void __26__PlatformIAPDBridge_init__block_invoke(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __26__PlatformIAPDBridge_init__block_invoke_cold_1();
  }

  v6 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
  [v6 handleIncomingXPCConnection:v2];
}

+ (id)sharedPlatformIAPDBridge
{
  if (sharedPlatformIAPDBridge_onceToken != -1) {
    dispatch_once(&sharedPlatformIAPDBridge_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)sharedPlatformIAPDBridge_iapdBridgeInstance;

  return v2;
}

void __46__PlatformIAPDBridge_sharedPlatformIAPDBridge__block_invoke(id a1)
{
  v1 = objc_alloc_init(PlatformIAPDBridge);
  v2 = (void *)sharedPlatformIAPDBridge_iapdBridgeInstance;
  sharedPlatformIAPDBridge_iapdBridgeInstance = (uint64_t)v1;

  uint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = (void *)gCoreAccessoriesEndpointMap;
  gCoreAccessoriesEndpointMap = v3;

  gIAPDEndpointMap = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

- (void)iapdAccessoryArrived:(ACCEndpoint_s *)a3
{
  if ([(PlatformIAPDBridge *)self supportsIAPD])
  {
    if (!self->iapdConnection)
    {
      int var4 = a3->var4;
      if (var4 == 3 || var4 == 0)
      {
        dispatch_queue_t v7 = [[ACCXPCConnection alloc] initWithServiceName:@"com.apple.iapd.xpc" queueName:@"com.apple.accessoryd.ACCXPCConnection"];
        iapdConnection = self->iapdConnection;
        self->iapdConnection = v7;

        [(ACCXPCConnection *)self->iapdConnection setDisconnectBlock:&__block_literal_global_43];
        [(PlatformIAPDBridge *)self _sendHasAdaptor];
      }
    }
    unint64_t v9 = [(PlatformIAPDBridge *)self _generatePortID];
    v10 = a3->var2;
    id v11 = *(id *)a3->var0;
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    id v13 = +[NSNumber numberWithUnsignedLongLong:v9];
    [v12 setObject:v13 forKey:@"ACCPlatformIAPDBridge_PortID"];

    id v14 = [(__CFString *)v10 copy];
    [v12 setObject:v14 forKey:ACCPlatformIAPDPort_EndpointUUID];

    id v15 = [v11 copy];
    [v12 setObject:v15 forKey:ACCPlatformIAPDPort_ConnectionUUID];

    v16 = +[NSNumber numberWithInt:a3->var4];
    [v12 setObject:v16 forKey:ACCPlatformIAPDPort_Protocol];

    if (gLogObjects && gNumLogObjects >= 7)
    {
      v17 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v17 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 138412802;
      id v41 = v11;
      __int16 v42 = 2048;
      unint64_t v43 = v9;
      __int16 v44 = 2112;
      id v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] iapd accessory arrived, connectionUID %@, generated portID %llu, acc. info %@", (uint8_t *)&v40, 0x20u);
    }

    [(id)gCoreAccessoriesEndpointMap setObject:v12 forKey:v10];
    v19 = (void *)gIAPDEndpointMap;
    v20 = +[NSNumber numberWithUnsignedLongLong:v9];
    [v19 setObject:v12 forKey:v20];

    [(PlatformIAPDBridge *)self _generateIAPDPortTypeForDictionary:v12 fromEndpoint:a3];
    unsigned int var3 = a3->var3;
    if (var3 <= 7 && ((1 << var3) & 0xC3) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v22 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v22 = &_os_log_default;
        id v23 = &_os_log_default;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = a3->var3;
        int v40 = 67109120;
        LODWORD(v41) = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] an iAP1 dock accessory connected with transport type %{coreacc:ACCEndpoint_TransportType_t}d", (uint8_t *)&v40, 8u);
      }

      if (!a3->var0) {
        goto LABEL_46;
      }
      v25 = acc_connection_copyProperties((const __CFDictionary *)a3->var0);
      v26 = acc_endpoint_copyProperties((pthread_mutex_t *)a3);
      v27 = [(id)gCoreAccessoriesEndpointMap objectForKey:v10];
      uint64_t v28 = kACCProperties_Connection_PrimaryPortNumber;
      v29 = [v25 objectForKey:kACCProperties_Connection_PrimaryPortNumber];

      if (v29)
      {
        v30 = [v25 objectForKey:v28];
        [v27 setObject:v30 forKey:ACCPlatformIAPDBridge_PrimaryPortNumber];
      }
      uint64_t v31 = kACCProperties_Endpoint_PortNumber;
      v32 = [(pthread_mutex_t *)v26 objectForKey:kACCProperties_Endpoint_PortNumber];

      if (v32)
      {
        v33 = [(pthread_mutex_t *)v26 objectForKey:v31];
        [v27 setObject:v33 forKey:@"ACCPlatformIAPDBridge_PortNumber"];
      }
      v34 = [(pthread_mutex_t *)v26 objectForKey:kACCProperties_Endpoint_ResistorID];
      if (v34)
      {
        [v27 setObject:v34 forKey:ACCPlatformIAPDPort_ResistorID];
        [(PlatformIAPDBridge *)self _handleResistorID:v34 forPortDictionary:v27];
      }
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v35 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v35 = &_os_log_default;
        id v36 = &_os_log_default;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        int v40 = 138412802;
        id v41 = v11;
        __int16 v42 = 2048;
        unint64_t v43 = v9;
        __int16 v44 = 2112;
        id v45 = v27;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] iapd accessory arrived, connectionUID %@, generated portID %llu, coreAccToIAPDAccDict %@", (uint8_t *)&v40, 0x20u);
      }
    }
    else
    {
      int Type = acc_connection_getType((uint64_t)a3->var0);
      [(PlatformIAPDBridge *)self _generateIAPDPortInfoForDictionary:v12 fromEndpoint:a3];
      if (Type != 2) {
        goto LABEL_46;
      }
      v25 = [(id)gCoreAccessoriesEndpointMap objectForKey:v10];
      if (!v25)
      {
LABEL_45:

LABEL_46:
        return;
      }
      v38 = (pthread_mutex_t *)acc_connection_copyIdentifier((uint64_t)a3->var0);
      v26 = v38;
      if (!v38 || (convertNSStringToNSData(v38), (uint64_t v39 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_44:

        goto LABEL_45;
      }
      v27 = (void *)v39;
      [v25 setObject:v39 forKey:@"ACCPlatformIAPDPort_BluetoothMACAddress"];
    }

    goto LABEL_44;
  }
}

void __43__PlatformIAPDBridge_iapdAccessoryArrived___block_invoke(id a1)
{
  id v1 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
  [v1 handleIAPDDisconnect];
}

- (void)iapdAccessoryLeft:(id)a3
{
  id v12 = a3;
  if ([(PlatformIAPDBridge *)self supportsIAPD])
  {
    id v4 = [(id)gCoreAccessoriesEndpointMap objectForKey:v12];
    v5 = v4;
    if (!v4) {
      goto LABEL_8;
    }
    v6 = [v4 objectForKey:ACCPlatformIAPDPort_Protocol];
    if (!v6) {
      goto LABEL_8;
    }
    dispatch_queue_t v7 = v6;
    if ([v6 intValue] == 3)
    {
    }
    else
    {
      unsigned int v8 = [v7 intValue];

      if (v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    unint64_t v9 = [v5 objectForKey:@"ACCPlatformIAPDBridge_PortID"];
    id v10 = [v9 unsignedLongLongValue];
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "portID", (uint64_t)v10);
    xpc_dictionary_set_string(v11, "requestType", "transportLeft");
    [(ACCXPCConnection *)self->iapdConnection sendMessage:v11];
    [(id)gCoreAccessoriesEndpointMap removeObjectForKey:v12];
    [(id)gIAPDEndpointMap removeObjectForKey:v9];

    goto LABEL_8;
  }
LABEL_9:

  _objc_release_x2();
}

- (BOOL)iapdAccessory:(ACCEndpoint_s *)a3 dataArrivedFromAccessory:(id)a4
{
  id v6 = a4;
  if ([(PlatformIAPDBridge *)self supportsIAPD]
    && ((int var4 = a3->var4, var4 != 3) ? (v8 = var4 == 0) : (v8 = 1), v8))
  {
    unint64_t v9 = a3->var2;
    id v10 = [(id)gCoreAccessoriesEndpointMap objectForKey:v9];
    xpc_object_t v11 = v10;
    BOOL v12 = v10 != 0;
    if (v10)
    {
      v26 = v9;
      v25 = [v10 objectForKey:@"ACCPlatformIAPDBridge_PortID"];
      id v13 = [v25 unsignedLongLongValue];
      int v24 = [v11 objectForKey:@"ACCPlatformIAPDBridge_PortNumber"];
      id v14 = [v24 unsignedLongLongValue];
      id v23 = [v11 objectForKey:ACCPlatformIAPDBridge_PrimaryPortNumber];
      id v15 = [v23 unsignedLongLongValue];
      v22 = [v11 objectForKey:@"ACCPlatformIAPDBridge_PrimaryPortType"];
      id v16 = [v22 unsignedLongLongValue];
      v17 = [v11 objectForKey:@"ACCPlatformIAPDPort_BluetoothMACAddress"];
      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v18, "portID", (uint64_t)v13);
      xpc_dictionary_set_uint64(v18, "portType", (uint64_t)v16);
      xpc_dictionary_set_uint64(v18, "portNumber", (uint64_t)v14);
      xpc_dictionary_set_uint64(v18, "portManagerNumber", (uint64_t)v15);
      id v19 = v6;
      xpc_dictionary_set_data(v18, "data", [v19 bytes], (size_t)objc_msgSend(v19, "length"));
      xpc_dictionary_set_string(v18, "requestType", "dataArrived");
      if (v17)
      {
        id v20 = v17;
        xpc_dictionary_set_data(v18, "macAddr", [v20 bytes], (size_t)objc_msgSend(v20, "length"));
      }
      [(ACCXPCConnection *)self->iapdConnection sendMessage:v18];

      unint64_t v9 = v26;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)handleIAPDDisconnect
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] iapd disconnected from accessoryd", buf, 2u);
  }

  int out_token = -1;
  if (!notify_register_check("com.apple.iapd.notify.availability", &out_token))
  {
    uint64_t v7 = 0;
    notify_get_state(out_token, &v7);
    if (v7 == 1)
    {
      notify_set_state(out_token, 0);
      notify_post("com.apple.iapd.notify.availability");
    }
    notify_cancel(out_token);
  }
  if ([(PlatformIAPDBridge *)self supportsIAPD])
  {
    [(ACCXPCConnection *)self->iapdConnection setDisconnectBlock:0];
    iapdConnection = self->iapdConnection;
    self->iapdConnection = 0;
  }
}

- (BOOL)supportsIAPD
{
  return 1;
}

- (void)handleIncomingXPCConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PlatformIAPDBridge handleIncomingXPCConnection:].cold.7();
  }

  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      xpc_object_t v11 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      xpc_object_t v11 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PlatformIAPDBridge handleIncomingXPCConnection:]();
    }

    xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_accessoryIAPDBridgeListenerQueue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __50__PlatformIAPDBridge_handleIncomingXPCConnection___block_invoke;
    handler[3] = &unk_100216710;
    id v14 = v4;
    xpc_object_t v18 = v14;
    xpc_connection_set_event_handler(v14, handler);
    xpc_connection_resume(v14);
  }
  else if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      BOOL v12 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v12 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PlatformIAPDBridge handleIncomingXPCConnection:](v4, v12);
    }
  }
  else
  {
    BOOL v8 = xpc_copy_description(v4);
    if (v8)
    {
      unint64_t v9 = v8;
      if (gLogObjects && gNumLogObjects >= 7)
      {
        id v10 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v10 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PlatformIAPDBridge handleIncomingXPCConnection:].cold.5();
      }

      free(v9);
    }
  }
}

void __50__PlatformIAPDBridge_handleIncomingXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
  [v4 _handleIncomingXPCEvent:v3 forXPCConnection:*(void *)(a1 + 32)];
}

- (void)_handleIncomingXPCEvent:(id)a3 forXPCConnection:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (_xpc_connection_s *)a4;
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v6, "requestType");
    if (!string)
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        id v13 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v13 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] RequestType not specified in xpc message!", buf, 2u);
      }

      string = "<nil>";
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v16 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v16 = &_os_log_default;
      id v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PlatformIAPDBridge _handleIncomingXPCEvent:forXPCConnection:]();
    }

    if (!strcmp(string, "transmitData"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v6);
      if (reply)
      {
        *(void *)buf = 0;
        uint64_t uint64 = xpc_dictionary_get_uint64(v6, "portID");
        data = xpc_dictionary_get_data(v6, "data", (size_t *)buf);
        BOOL v30 = xpc_dictionary_get_BOOL(v6, "waitSendDone");
        uint64_t v31 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
        LODWORD(uint64) = [v31 _handleTransmitData:data withLength:*(void *)buf forPortID:uint64 withSynchronousTransmit:v30];

        xpc_dictionary_set_int64(reply, "result", uint64 ^ 1);
LABEL_71:
        xpc_connection_send_message(v7, reply);
      }
    }
    else
    {
      if (strcmp(string, "getHasE75To30PinAdapter"))
      {
        if (!strcmp(string, "IAPClientPortRegisterStr"))
        {
          id v36 = xpc_dictionary_get_string(v6, "IAPClientPortUUIDStr");
          if (!v36) {
            goto LABEL_116;
          }
          v37 = v36;
          if (gLogObjects && gNumLogObjects >= 7)
          {
            v38 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            v38 = &_os_log_default;
            id v49 = &_os_log_default;
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v37;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] _xpc_iaptransportd_handle_incoming_request handling kXPCIAPClientPortRegisterStr for uuid: %s", buf, 0xCu);
          }

          v50 = +[NSString stringWithUTF8String:v37];
          v51 = [(ACCClientPortShimManager *)self->_clienPortShimManager findClientPortForUUID:v50];
          if (!v51)
          {
            v51 = [[ACCClientPortShim alloc] initWithUID:v50 xpcConnection:v7 delegate:self];
            [(ACCClientPortShimManager *)self->_clienPortShimManager addClienPort:v51 forUUID:v50];
          }
        }
        else
        {
          if (strcmp(string, "IAPClientPortUnregisterStr"))
          {
            if (!strcmp(string, "dataArrived"))
            {
              size_t length = 0;
              __int16 v42 = xpc_dictionary_get_string(v6, "IAPClientPortUUIDStr");
              unint64_t v43 = xpc_dictionary_get_data(v6, "data", &length);
              if (!v42) {
                goto LABEL_116;
              }
              __int16 v44 = v43;
              if (!v43) {
                goto LABEL_116;
              }
              id v45 = logObjectForModule_6();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = v42;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = length;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] _xpc_iaptransportd_handle_incoming_request handling kXPCDataArrivedStr for uuid: %s with %lu bytes", buf, 0x16u);
              }

              v46 = +[NSString stringWithUTF8String:v42];
              v47 = [(ACCClientPortShimManager *)self->_clienPortShimManager findClientPortForUUID:v46];
              v48 = v47;
              if (v47) {
                [v47 receiveData:v44 length:length];
              }

              goto LABEL_88;
            }
            if (!strcmp(string, "setPortLockout"))
            {
              uint64_t v52 = xpc_dictionary_get_uint64(v6, "portID");
              v50 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
              [v50 _handleSetPortLockout:v52];
LABEL_115:

              goto LABEL_116;
            }
            if (strcmp(string, "getPortLockout"))
            {
              if (!strcmp(string, "handleAuthenticationPassed"))
              {
                uint64_t v56 = xpc_dictionary_get_uint64(v6, "portID");
                *(void *)buf = 0;
                v57 = xpc_dictionary_get_data(v6, "certData", (size_t *)buf);
                v50 = 0;
                if (v57 && *(void *)buf)
                {
                  v50 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v57);
                }
                v58 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
                v51 = v58;
                uint64_t v59 = 1;
              }
              else
              {
                if (strcmp(string, "handleAuthenticationFailed"))
                {
                  if (!strcmp(string, "iAP1LingoesSupported"))
                  {
                    uint64_t v61 = xpc_dictionary_get_uint64(v6, "portID");
                    uint64_t v62 = xpc_dictionary_get_uint64(v6, "lingoesSupported");
                    if (!v62) {
                      goto LABEL_116;
                    }
                    uint64_t v63 = v62;
                    v46 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
                    [v46 _handleLingoesSupported:v63 forPortID:v61];
                  }
                  else
                  {
                    if (strcmp(string, "availableCurrentNegotiated"))
                    {
                      if (!strcmp(string, "accInfo"))
                      {
                        uint64_t v18 = xpc_dictionary_get_uint64(v6, "portID");
                        id v19 = xpc_dictionary_get_string(v6, "accName");
                        id v20 = xpc_dictionary_get_string(v6, "accManufacturer");
                        objc_super v21 = xpc_dictionary_get_string(v6, "accModel");
                        v22 = xpc_dictionary_get_string(v6, "accSerialNumber");
                        id v23 = xpc_dictionary_get_string(v6, "accHardwareVersion");
                        int v24 = xpc_dictionary_get_string(v6, "accFirmwareVersionActive");
                        if (v19)
                        {
                          if (v20)
                          {
                            if (v21)
                            {
                              if (v22)
                              {
                                if (v23)
                                {
                                  v25 = v24;
                                  if (v24)
                                  {
                                    uint64_t v79 = 0;
                                    long long v78 = 0u;
                                    long long v77 = 0u;
                                    long long v76 = 0u;
                                    long long v75 = 0u;
                                    long long v74 = 0u;
                                    long long v73 = 0u;
                                    long long v72 = 0u;
                                    *(void *)buf = +[NSString stringWithCString:v19 encoding:4];
                                    *(void *)&buf[8] = +[NSString stringWithCString:v20 encoding:4];
                                    *(void *)&uint8_t buf[16] = +[NSString stringWithCString:v21 encoding:4];
                                    CFTypeRef v68 = +[NSString stringWithCString:v22 encoding:4];
                                    CFTypeRef v69 = +[NSString stringWithCString:v23 encoding:4];
                                    CFTypeRef v70 = +[NSString stringWithCString:v25 encoding:4];
                                    uint64_t v71 = 0;
                                    v26 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
                                    [v26 _handleAccessoryInfo:buf forPortID:v18];

                                    if (*(void *)buf)
                                    {
                                      CFRelease(*(CFTypeRef *)buf);
                                      *(void *)buf = 0;
                                    }
                                    if (*(void *)&buf[8])
                                    {
                                      CFRelease(*(CFTypeRef *)&buf[8]);
                                      *(void *)&buf[8] = 0;
                                    }
                                    if (*(void *)&buf[16])
                                    {
                                      CFRelease(*(CFTypeRef *)&buf[16]);
                                      *(void *)&uint8_t buf[16] = 0;
                                    }
                                    if (v68)
                                    {
                                      CFRelease(v68);
                                      CFTypeRef v68 = 0;
                                    }
                                    if (v69)
                                    {
                                      CFRelease(v69);
                                      CFTypeRef v69 = 0;
                                    }
                                    if (v70) {
                                      CFRelease(v70);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      goto LABEL_116;
                    }
                    uint64_t v64 = xpc_dictionary_get_uint64(v6, "portID");
                    unsigned __int16 v65 = xpc_dictionary_get_uint64(v6, "availableCurrent");
                    v46 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
                    [v46 _handleAvailableCurrentNegotiated:v65 forPortID:v64];
                  }
LABEL_88:

                  goto LABEL_116;
                }
                uint64_t v56 = xpc_dictionary_get_uint64(v6, "portID");
                *(void *)buf = 0;
                v60 = xpc_dictionary_get_data(v6, "certData", (size_t *)buf);
                v50 = 0;
                if (v60 && *(void *)buf)
                {
                  v50 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v60);
                }
                v58 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
                v51 = v58;
                uint64_t v59 = 0;
              }
              [(ACCClientPortShim *)v58 _handleAuthenticationState:v59 forPortID:v56 certData:v50];
              goto LABEL_114;
            }
            xpc_object_t reply = xpc_dictionary_create_reply(v6);
            uint64_t v54 = xpc_dictionary_get_uint64(v6, "portID");
            v55 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
            LOBYTE(v54) = [v55 _getPortLockout:v54];

            xpc_dictionary_set_uint64(reply, "result", 0);
            v34 = "bAuthLockout";
            v35 = reply;
            char v33 = v54;
            goto LABEL_70;
          }
          uint64_t v39 = xpc_dictionary_get_string(v6, "IAPClientPortUUIDStr");
          if (!v39) {
            goto LABEL_116;
          }
          int v40 = v39;
          if (gLogObjects && gNumLogObjects >= 7)
          {
            id v41 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            id v41 = &_os_log_default;
            id v53 = &_os_log_default;
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v40;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] _xpc_iaptransportd_handle_incoming_request handling kXPCIAPClientPortUnregisterStr for uuid: %s", buf, 0xCu);
          }

          v50 = +[NSString stringWithUTF8String:v40];
          v51 = [(ACCClientPortShimManager *)self->_clienPortShimManager findClientPortForUUID:v50];
          if (v51)
          {
            [(ACCClientPortShimManager *)self->_clienPortShimManager removeClienPortForUUID:v50];
            [(ACCClientPortShim *)v51 shutdown];
          }
        }
LABEL_114:

        goto LABEL_115;
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v6);
      if (reply)
      {
        v32 = +[PlatformIAPDBridge sharedPlatformIAPDBridge];
        [v32 _E75To30PinAdapterConnected];

        xpc_dictionary_set_uint64(reply, "result", 0);
        char v33 = gb139b164ConnectedState;
        v34 = "bHasE75To30PinAdapter";
        v35 = reply;
LABEL_70:
        xpc_dictionary_set_BOOL(v35, v34, v33);
        goto LABEL_71;
      }
    }

    goto LABEL_116;
  }
  BOOL v8 = xpc_copy_description(v6);
  unint64_t v9 = xpc_copy_description(v7);
  id v10 = v9;
  if (v8 && v9)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      xpc_object_t v11 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      xpc_object_t v11 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] unexpected event: %s for connection: %s\n", buf, 0x16u);
    }
  }
  else if (!v8)
  {
    if (!v9) {
      goto LABEL_116;
    }
    goto LABEL_21;
  }
  free(v8);
  if (v10) {
LABEL_21:
  }
    free(v10);
LABEL_116:
}

- (BOOL)_handleTransmitData:(char *)a3 withLength:(unint64_t)a4 forPortID:(unint64_t)a5 withSynchronousTransmit:(BOOL)a6
{
  unint64_t v9 = +[NSNumber numberWithUnsignedLongLong:a5];
  id v10 = [(id)gIAPDEndpointMap objectForKey:v9];
  xpc_object_t v11 = v10;
  if (v10)
  {
    BOOL v12 = [v10 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
    EndpointWithUUID = acc_manager_getEndpointWithUUID(v12);
    CFDataRef v14 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)a3, a4, kCFAllocatorNull);
    int v15 = acc_endpoint_sendOutgoingData((uint64_t)EndpointWithUUID, v14);
    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v16 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v16 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412802;
      unint64_t v22 = (unint64_t)v12;
      __int16 v23 = 2048;
      unint64_t v24 = a5;
      __int16 v25 = 1024;
      int v26 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[#iapd Bridge] found endpointUUID %@ for portID %llu, transmitData success = %d", (uint8_t *)&v21, 0x1Cu);
    }

    CFRelease(v14);
  }
  else
  {
    if (gLogObjects) {
      BOOL v17 = gNumLogObjects < 7;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v12 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    else
    {
      BOOL v12 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134217984;
      unint64_t v22 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] no dictionary found for portID %llu", (uint8_t *)&v21, 0xCu);
    }
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_E75To30PinAdapterConnected
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:ACCPlatformIAPDPort_RequestB139B164ConnectedNotification object:0 userInfo:0];
}

- (void)_handleSetPortLockout:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v4 = [(id)gIAPDEndpointMap objectForKey:v3];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
    EndpointWithUUID = acc_manager_getEndpointWithUUID(v6);
    acc_manager_enableLockoutForTransportType(EndpointWithUUID[6], 6u);
    if (gLogObjects && gNumLogObjects >= 7)
    {
      BOOL v8 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v8 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PlatformIAPDBridge _handleSetPortLockout:]();
    }
  }
}

- (BOOL)_getPortLockout:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  BOOL v5 = [(id)gIAPDEndpointMap objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
    EndpointWithUUID = acc_manager_getEndpointWithUUID(v7);
    isLockoutActiveForTransportint Type = acc_manager_isLockoutActiveForTransportType(EndpointWithUUID[6], 0);
    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v10 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412802;
      CFDataRef v14 = v7;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 1024;
      int v18 = isLockoutActiveForTransportType;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[#iapd Bridge] found endpointUUID %@ for portID %llu, lockoutEnabled = %d", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    LOBYTE(isLockoutActiveForTransportType) = 0;
  }

  return isLockoutActiveForTransportType;
}

- (void)_handleAuthenticationState:(BOOL)a3 forPortID:(unint64_t)a4 certData:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [(id)gIAPDEndpointMap objectForKey:v9];
  id v11 = v10;
  if (!v10)
  {
    if (gLogObjects) {
      BOOL v18 = gNumLogObjects < 7;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v12 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    else
    {
      BOOL v12 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find dictionary for auth passed %d", buf, 8u);
    }
    goto LABEL_39;
  }
  v29 = v9;
  BOOL v12 = [v10 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
  EndpointWithUUID = (uint64_t **)acc_manager_getEndpointWithUUID(v12);
  uint64_t v14 = (uint64_t)EndpointWithUUID;
  if (EndpointWithUUID)
  {
    __int16 v15 = *EndpointWithUUID;
    if (*EndpointWithUUID)
    {
      char v16 = 0;
      uint64_t v17 = *v15;
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v15 = 0;
  }
  uint64_t v17 = 0;
  char v16 = 1;
LABEL_15:
  if (acc_connection_getType((uint64_t)v15) == 6 || acc_endpoint_getTransportType(v14) == 8)
  {
    uint64_t v28 = self;
    id v20 = v8;
    if (gLogObjects && gNumLogObjects >= 7)
    {
      int v21 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v21 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] enabling authentication passed? %d for USB Host", buf, 8u);
    }

    if (v6)
    {
      platform_usb_unlockUSBHostInterfaces(v17);
      id v8 = v20;
      if (v16) {
        goto LABEL_38;
      }
LABEL_34:
      acc_connection_setAuthCertData((BOOL)v15, v8);
      uint64_t v23 = (uint64_t)v15;
      int v24 = 2;
LABEL_37:
      acc_connection_setAuthStatus(v23, 1, v24);
      goto LABEL_38;
    }
    platform_usb_lockUSBHostInterfaces(v17);
    id v8 = v20;
    if (v16) {
      goto LABEL_38;
    }
  }
  else
  {
    if (v16)
    {
LABEL_38:
      id v9 = v29;
      goto LABEL_39;
    }
    uint64_t v28 = self;
    if (v6) {
      goto LABEL_34;
    }
  }
  if (-[PlatformIAPDBridge _shouldProcessAuthenticationFailState:](v28, "_shouldProcessAuthenticationFailState:", v14, v28))
  {
    uint64_t v23 = (uint64_t)v15;
    int v24 = 1;
    goto LABEL_37;
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    __int16 v25 = *(id *)(gLogObjects + 48);
    id v9 = v29;
  }
  else
  {
    id v9 = v29;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v25 = &_os_log_default;
    id v26 = &_os_log_default;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = *(_DWORD *)(v14 + 24);
    *(_DWORD *)buf = 67109120;
    BOOL v31 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Ignoring failed auth state for endpoint type %{coreacc:ACCEndpoint_TransportType_t}d, matching iaptransportd behavior", buf, 8u);
  }

LABEL_39:
}

- (void)_handleLingoesSupported:(unsigned int)a3 forPortID:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v5 = +[NSNumber numberWithUnsignedLongLong:a4];
  BOOL v6 = [(id)gIAPDEndpointMap objectForKey:v5];
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 7;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v13 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    else
    {
      int v13 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      int v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find dictionary for supported lingoes: %08x", (uint8_t *)&v16, 8u);
    }
  }
  else
  {
    id v11 = [v6 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
    int v13 = v11;
    if (v11)
    {
      EndpointWithUUID = (uint64_t *)acc_manager_getEndpointWithUUID(v11);
      if (EndpointWithUUID) {
        platform_analytics_iap1_lingoesSupportedDidChange(EndpointWithUUID, v4);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        uint64_t v14 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v14 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 67109120;
        int v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find endpoint for supported lingoes: %08x", (uint8_t *)&v16, 8u);
      }
    }
  }
}

- (void)_handleAvailableCurrentNegotiated:(unsigned __int16)a3 forPortID:(unint64_t)a4
{
  uint64_t v4 = a3;
  BOOL v5 = +[NSNumber numberWithUnsignedLongLong:a4];
  BOOL v6 = [(id)gIAPDEndpointMap objectForKey:v5];
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 7;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v13 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    else
    {
      int v13 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find dictionary for power negotiation", v16, 2u);
    }
  }
  else
  {
    id v11 = [v6 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
    int v13 = v11;
    if (v11)
    {
      EndpointWithUUID = (uint64_t *)acc_manager_getEndpointWithUUID(v11);
      if (EndpointWithUUID) {
        platform_analytics_availableCurrentNegotiated(EndpointWithUUID, v4);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        uint64_t v14 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v14 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find endpoint for power negotiation", buf, 2u);
      }
    }
  }
}

- (void)_handleAccessoryInfo:(id *)a3 forPortID:(unint64_t)a4
{
  BOOL v5 = +[NSNumber numberWithUnsignedLongLong:a4];
  BOOL v6 = [(id)gIAPDEndpointMap objectForKey:v5];
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 7;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v13 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    else
    {
      int v13 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find dictionary for power negotiation", v16, 2u);
    }
  }
  else
  {
    id v11 = [v6 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
    int v13 = v11;
    if (v11)
    {
      EndpointWithUUID = acc_manager_getEndpointWithUUID(v11);
      if (a3 && EndpointWithUUID) {
        acc_endpoint_setAccessoryInfo((uint64_t)EndpointWithUUID, (uint64_t)a3);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        uint64_t v14 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v14 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Can't find endpoint for power negotiation", buf, 2u);
      }
    }
  }
}

- (void)_handleResistorID:(id)a3 forPortDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 7;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Sending kXPCResistorArrivedStr with resistorID %@ for portDict %@", buf, 0x16u);
  }

  if (v7)
  {
    uint64_t v23 = [v7 objectForKey:@"ACCPlatformIAPDBridge_PortID"];
    id value = [v23 unsignedLongLongValue];
    id v22 = [v7 objectForKey:@"ACCPlatformIAPDBridge_PortNumber"];
    id v11 = [v22 unsignedLongLongValue];
    BOOL v12 = [v7 objectForKey:ACCPlatformIAPDBridge_PrimaryPortNumber];
    id v13 = [v12 unsignedLongLongValue];
    uint64_t v14 = [v7 objectForKey:@"ACCPlatformIAPDBridge_PrimaryPortType"];
    id v15 = self;
    id v16 = [v14 unsignedLongLongValue];
    id v17 = v6;
    id v18 = [v6 unsignedLongLongValue];
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v19, "portNumber", (uint64_t)v11);
    xpc_dictionary_set_uint64(v19, "portManagerNumber", (uint64_t)v13);
    xpc_dictionary_set_uint64(v19, "portType", (uint64_t)v16);
    xpc_dictionary_set_uint64(v19, "portID", (uint64_t)value);
    uint64_t v20 = (uint64_t)v18;
    id v6 = v17;
    xpc_dictionary_set_uint64(v19, "resistorID", v20);
    xpc_dictionary_set_string(v19, "requestType", "resistorArrived");
    [(ACCXPCConnection *)v15->iapdConnection sendMessage:v19];
  }
}

- (void)_generateIAPDPortInfoForDictionary:(id)a3 fromEndpoint:(ACCEndpoint_s *)a4
{
  id v5 = a3;
  id v6 = [(id)gCoreAccessoriesEndpointMap objectForKey:a4->var2];
  int var3 = a4->var3;
  p_int var3 = &a4->var3;
  if (var3 == 8)
  {
    uint64_t v9 = ACCPlatformIAPDPort_ConnectionUUID;
    id v10 = [v5 objectForKey:ACCPlatformIAPDPort_ConnectionUUID];
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 7;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v15 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    else
    {
      id v15 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[#iapd Bridge] iAP1 USB Host connectionUUID = %@", buf, 0xCu);
    }

    uint64_t v24 = v9;
    id v25 = v10;
    id v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v17 = +[NSNotificationCenter defaultCenter];
    [v17 postNotificationName:ACCPlatformIAPDPort_RequestPrimaryPort object:0 userInfo:v16];

    id v18 = gPrimaryPortNumber;
    if (gLogObjects && gNumLogObjects >= 7)
    {
      xpc_object_t v19 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      xpc_object_t v19 = &_os_log_default;
      id v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[#iapd Bridge] Returning primaryPortNumber %llu for USBHost endpoint type", buf, 0xCu);
    }

    uint64_t v20 = 2;
  }
  else
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 7;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    else
    {
      id v10 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PlatformIAPDBridge _generateIAPDPortInfoForDictionary:fromEndpoint:](p_var3, v10);
    }
    id v18 = 0;
    uint64_t v20 = 0;
  }

  id v22 = +[NSNumber numberWithUnsignedLongLong:v20];
  uint64_t v23 = +[NSNumber numberWithUnsignedLongLong:v18];
  [v6 setObject:v22 forKey:@"ACCPlatformIAPDBridge_PortNumber"];
  [v6 setObject:v23 forKey:ACCPlatformIAPDBridge_PrimaryPortNumber];
}

- (void)_generateIAPDPortTypeForDictionary:(id)a3 fromEndpoint:(ACCEndpoint_s *)a4
{
  id v5 = [(id)gCoreAccessoriesEndpointMap objectForKey:a4->var2];
  if (a4->var0)
  {
    if (acc_connection_getType((uint64_t)a4->var0) == 2)
    {
      unsigned int v6 = 2;
      goto LABEL_17;
    }
    Transportint Type = acc_endpoint_getTransportType((uint64_t)a4);
    unsigned int v6 = 1;
    if (!TransportType || TransportType == 8) {
      goto LABEL_17;
    }
    if (TransportType != 6)
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        BOOL v8 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        BOOL v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int var3 = a4->var3;
        int v16 = 67109120;
        unsigned int v17 = var3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Unknown transport type %{coreacc:ACCEndpoint_TransportType_t}d", (uint8_t *)&v16, 8u);
      }
    }
  }
  unsigned int v6 = 0;
LABEL_17:
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 7;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    BOOL v13 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = a4->var3;
    int v16 = 67109376;
    unsigned int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] generated ACCPlatform_IAPDPort_t %d for %{coreacc:ACCEndpoint_TransportType_t}d", (uint8_t *)&v16, 0xEu);
  }

  id v15 = +[NSNumber numberWithUnsignedLongLong:v6];
  [v5 setObject:v15 forKey:@"ACCPlatformIAPDBridge_PrimaryPortType"];
}

- (unint64_t)_generatePortID
{
  if ((unint64_t)(_generatePortID_gPortIDCounter + 1) > 1) {
    unint64_t result = _generatePortID_gPortIDCounter + 1;
  }
  else {
    unint64_t result = 1;
  }
  _generatePortID_gPortIDCounter = result;
  return result;
}

- (void)_sendHasAdaptor
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "[#iapd Bridge] Sending kXPCHasAdaptorStr but faking info...iapd doesn't care, it just used this to wake up the process", v2, v3, v4, v5, v6);
}

- (void)_handleResistorIDChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = ACCPlatformIAPDPort_ConnectionUUID;
  uint8_t v6 = [v4 objectForKey:ACCPlatformIAPDPort_ConnectionUUID];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 7;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v53 = (uint64_t)v6;
    __int16 v54 = 2112;
    v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Received notification for handling resistor ID change, connectionUUID %@, accInfo contained in notification %@", buf, 0x16u);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = [(id)gCoreAccessoriesEndpointMap allValues];
  id v11 = [v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v11)
  {
    id v13 = v11;
    unint64_t v43 = self;
    __int16 v44 = v4;
    int v14 = 0;
    uint64_t v15 = *(void *)v48;
    int v16 = &_os_log_default;
    *(void *)&long long v12 = 134218240;
    long long v42 = v12;
    uint64_t v45 = *(void *)v48;
LABEL_13:
    unsigned int v17 = 0;
    __int16 v18 = v14;
    id v46 = v13;
    while (1)
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(v10);
      }
      int v14 = *(id *)(*((void *)&v47 + 1) + 8 * (void)v17);

      int v19 = [v14 objectForKey:v5];
      unsigned int v20 = [v19 isEqualToString:v6];

      if (v20)
      {
        id v21 = [v14 objectForKey:@"ACCPlatformIAPDBridge_PrimaryPortType"];
        if ([v21 unsignedIntValue] != 1)
        {

          if (gLogObjects && gNumLogObjects > 6)
          {
            v29 = *(id *)(gLogObjects + 48);
            BOOL v30 = v43;
            uint64_t v4 = v44;
          }
          else
          {
            BOOL v30 = v43;
            uint64_t v4 = v44;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            v29 = &_os_log_default;
            id v31 = &_os_log_default;
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = (uint64_t)v14;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[#iapd Bridge] Found dictionary %@ in coreAccToIAPDAccDict for the resistorID change", buf, 0xCu);
          }

          uint64_t v32 = ACCPlatformIAPDPort_ResistorID;
          char v33 = [v4 objectForKey:ACCPlatformIAPDPort_ResistorID];
          if (!v33) {
            goto LABEL_50;
          }
          v34 = [v14 objectForKey:@"ACCPlatformIAPDBridge_PortNumber"];
          if (v34) {
            goto LABEL_48;
          }
          v35 = [v14 objectForKey:ACCPlatformIAPDPort_EndpointUUID];
          id v36 = v35;
          if (!v35) {
            goto LABEL_47;
          }
          EndpointWithUUID = (pthread_mutex_t *)acc_manager_getEndpointWithUUID(v35);
          if (EndpointWithUUID)
          {
            v38 = acc_endpoint_copyProperties(EndpointWithUUID);
            uint64_t v39 = [(pthread_mutex_t *)v38 objectForKey:kACCProperties_Endpoint_PortNumber];
            if (v39)
            {
              int v40 = (void *)v39;
              [v14 setObject:v39 forKey:@"ACCPlatformIAPDBridge_PortNumber"];

LABEL_47:
LABEL_48:
              -[NSObject setObject:forKey:](v14, "setObject:forKey:", v33, v32, v42);
              [(PlatformIAPDBridge *)v30 _handleResistorID:v33 forPortDictionary:v14];
LABEL_49:

LABEL_50:
              goto LABEL_56;
            }
          }
          goto LABEL_49;
        }
        id v22 = v10;
        uint64_t v23 = v5;
        uint64_t v24 = v16;
        id v25 = v6;
        uint64_t v26 = gLogObjects;
        int v27 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 7)
        {
          int v16 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            uint64_t v53 = v26;
            __int16 v54 = 1024;
            LODWORD(v55) = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v28 = v16;
        }
        uint8_t v6 = v25;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v53 = (uint64_t)v14;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[#iapd Bridge] Got resistorID notification for eACCPlatformIAPDPort_USB, unexpected. (accessory info %@)", buf, 0xCu);
        }

        int v16 = v24;
        uint64_t v5 = v23;
        id v10 = v22;
        uint64_t v15 = v45;
        id v13 = v46;
      }
      unsigned int v17 = (char *)v17 + 1;
      __int16 v18 = v14;
      if (v13 == v17)
      {
        id v13 = [v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v13) {
          goto LABEL_13;
        }

        uint64_t v4 = v44;
        break;
      }
    }
  }

  if (gLogObjects && gNumLogObjects >= 7)
  {
    int v14 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v14 = &_os_log_default;
    id v41 = &_os_log_default;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Unable to find iapd information dictionary for connectionUUID %@", buf, 0xCu);
  }
LABEL_56:
}

- (void)_handleB139B164ConnectedStatus:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v3 = [v4 objectForKey:ACCPlatformIAPDPort_B139B164Connected];
  gb139b164ConnectedState = [v3 BOOLValue];
}

- (void)_handlePrimaryPortReturn:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v3 = [v4 objectForKey:ACCPlatformIAPDBridge_PrimaryPortNumber];
  gPrimaryPortNumber = [v3 unsignedIntValue];
}

- (BOOL)_shouldProcessAuthenticationFailState:(ACCEndpoint_s *)a3
{
  if (!a3) {
    return 1;
  }
  Transportint Type = acc_endpoint_getTransportType((uint64_t)a3);
  BOOL result = 1;
  if (TransportType <= 7 && ((1 << TransportType) & 0xC3) != 0)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 7;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v7 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    else
    {
      BOOL v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = TransportType;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] Got endpoint type of %d, must not handle failed auth state", (uint8_t *)v8, 8u);
    }

    return 0;
  }
  return result;
}

- (void)sendData:(char *)a3 length:(unint64_t)a4 forConnection:(id)a5 portUID:(id)a6
{
  id v9 = (_xpc_connection_s *)a5;
  id v10 = a6;
  if (a3 && a4)
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_data(v11, "data", a3, a4);
    xpc_dictionary_set_string(v11, "IAPClientPortUUIDStr", (const char *)[v10 UTF8String]);
    xpc_dictionary_set_string(v11, "requestType", "transmitData");
    xpc_connection_send_message(v9, v11);
  }
  else
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 7;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v14 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    else
    {
      int v14 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#iapd Bridge] ACCClientPortShimDelegate: ERROR: NULL transport data", v15, 2u);
    }
  }
}

- (id)findClientPortForUUID:(id)a3
{
  return [(ACCClientPortShimManager *)self->_clienPortShimManager findClientPortForUUID:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clienPortShimManager, 0);
  objc_storeStrong((id *)&self->_accessoryIAPDBridgeListenerQueue, 0);
  objc_storeStrong((id *)&self->_accessorydIAPDBridgeListenerConnection, 0);
  objc_storeStrong((id *)&self->iapdConnection, 0);

  objc_storeStrong((id *)&self->activeIAPDConnections, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[#iapd Bridge] Unable to create iapd bridge listener XPC connection", v1, 2u);
}

void __26__PlatformIAPDBridge_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "[#iapd Bridge] handling an iapd xpc connection!", v2, v3, v4, v5, v6);
}

- (void)handleIncomingXPCConnection:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "[#iapd Bridge] handling incoming XPC_TYPE_CONNECTION", v2, v3, v4, v5, v6);
}

- (void)handleIncomingXPCConnection:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  OUTLINED_FUNCTION_3();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[#iapd Bridge] handling XPC_TYPE_ERROR %s\n", v3, 0xCu);
}

- (void)handleIncomingXPCConnection:.cold.5()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[#iapd Bridge] unexpected event: %s\n", v1, 0xCu);
}

- (void)handleIncomingXPCConnection:.cold.7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "[#iapd Bridge] handling incoming XPC Event", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingXPCEvent:forXPCConnection:.cold.3()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[#iapd Bridge] received kXPCRequestTypeStr %s", v1, 0xCu);
}

- (void)_handleSetPortLockout:.cold.1()
{
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "[#iapd Bridge] found endpointUUID %@ for portID %llu, handle port lockout", v2, 0x16u);
}

- (void)_generateIAPDPortInfoForDictionary:(int *)a1 fromEndpoint:(NSObject *)a2 .cold.3(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109632;
  v3[1] = v2;
  __int16 v4 = 2048;
  uint64_t v5 = 0;
  __int16 v6 = 2048;
  uint64_t v7 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#iapd Bridge] Transport type %{coreacc:ACCEndpoint_TransportType_t}d port info set to default values portNumber %llu, primaryPortNumber %llu", (uint8_t *)v3, 0x1Cu);
}

@end