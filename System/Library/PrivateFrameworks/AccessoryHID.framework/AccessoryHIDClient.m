@interface AccessoryHIDClient
- (AccessoryHIDClient)initWithDelegate:(id)a3;
- (AccessoryHIDClientProtocol)delegate;
- (AccessoryHIDXPCServerProtocol)remoteObject;
- (NSMutableDictionary)registeredHIDDescriptors;
- (NSXPCConnection)serverConnection;
- (void)connectToServer;
- (void)dealloc;
- (void)getReportResponse:(id)a3 componentID:(unsigned __int16)a4 reportType:(unsigned __int8)a5 reportID:(unsigned __int8)a6 report:(id)a7 withReply:(id)a8;
- (void)hidDescriptor:(id)a3 active:(BOOL)a4;
- (void)inReport:(id)a3 componentID:(unsigned __int16)a4 report:(id)a5 withReply:(id)a6;
- (void)registerHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 dictionary:(id)a5 withReply:(id)a6;
- (void)sendGetReportForType:(id)a3 andID:(id)a4 fromUUID:(id)a5;
- (void)sendOutReport:(id)a3 fromUUID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRegisteredHIDDescriptors:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)unregisterAllDescriptors:(id)a3 withReply:(id)a4;
- (void)unregisterHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 withReply:(id)a5;
@end

@implementation AccessoryHIDClient

- (AccessoryHIDClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  init_logging();
  v17.receiver = self;
  v17.super_class = (Class)AccessoryHIDClient;
  v5 = [(AccessoryHIDClient *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v6->_serverConnection;
    v6->_serverConnection = 0;

    remoteObject = v6->_remoteObject;
    v6->_remoteObject = 0;

    registeredHIDDescriptors = v6->_registeredHIDDescriptors;
    v6->_registeredHIDDescriptors = 0;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __39__AccessoryHIDClient_initWithDelegate___block_invoke;
    v14 = &unk_26467C620;
    objc_copyWeak(&v15, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.hid.availability-changed", &v11);
    [(AccessoryHIDClient *)v6 connectToServer];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __39__AccessoryHIDClient_initWithDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_222ED3000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
      }
      v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_222ED3000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  registeredHIDDescriptors = self->_registeredHIDDescriptors;
  self->_registeredHIDDescriptors = 0;

  BOOL v4 = [(AccessoryHIDClient *)self serverConnection];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)AccessoryHIDClient;
  [(AccessoryHIDClient *)&v5 dealloc];
}

- (void)connectToServer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222ED3000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
}

void __37__AccessoryHIDClient_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_222ED3000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }
}

void __37__AccessoryHIDClient_connectToServer__block_invoke_75(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_222ED3000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __37__AccessoryHIDClient_connectToServer__block_invoke_76(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __37__AccessoryHIDClient_connectToServer__block_invoke_76_cold_1((uint64_t)v2, v5);
  }
}

void __37__AccessoryHIDClient_connectToServer__block_invoke_78(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_222ED3000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (void)sendOutReport:(id)a3 fromUUID:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  uint64_t v24 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v9 = *(void *)v30;
    uint64_t v22 = *(void *)v30;
    id v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
        v13 = [v12 objectForKey:v11];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              id v20 = [v14 objectForKey:v19];
              if (v20 == v7)
              {
                v21 = [(AccessoryHIDClient *)self remoteObject];
                id v6 = v23;
                [v21 outReport:v11 componentID:v19 report:v23 withReply:&__block_literal_global_80];

                goto LABEL_18;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v22;
      }
      id v6 = v23;
      uint64_t v24 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
LABEL_18:
}

void __45__AccessoryHIDClient_sendOutReport_fromUUID___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__AccessoryHIDClient_sendOutReport_fromUUID___block_invoke_cold_1();
  }
}

- (void)sendGetReportForType:(id)a3 andID:(id)a4 fromUUID:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v11 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  uint64_t v27 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v12 = *(void *)v34;
    uint64_t v25 = *(void *)v34;
    id v26 = v8;
    id v28 = v9;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v11);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v15 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
        uint64_t v16 = [v15 objectForKey:v14];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
              id v23 = [v17 objectForKey:v22];
              if (v23 == v10)
              {
                uint64_t v24 = [(AccessoryHIDClient *)self remoteObject];
                id v8 = v26;
                id v9 = v28;
                [v24 getReport:v14 componentID:v22 reportType:v26 reportID:v28 withReply:&__block_literal_global_82];

                goto LABEL_18;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        id v9 = v28;
        uint64_t v12 = v25;
      }
      id v8 = v26;
      uint64_t v27 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }
LABEL_18:
}

void __58__AccessoryHIDClient_sendGetReportForType_andID_fromUUID___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AccessoryHIDClient_sendGetReportForType_andID_fromUUID___block_invoke_cold_1();
  }
}

- (void)hidDescriptor:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  uint64_t v23 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v8 = *(void *)v29;
    BOOL v22 = v4;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
        uint64_t v12 = [v11 objectForKey:v10];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              id v19 = [v13 objectForKey:v18];
              if (v19 == v6)
              {
                uint64_t v20 = [(AccessoryHIDClient *)self remoteObject];
                [v20 componentUpdate:v10 componentID:v18 enabled:v22 withReply:&__block_literal_global_84];

                goto LABEL_18;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v21;
      }
      uint64_t v23 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }
LABEL_18:
}

void __43__AccessoryHIDClient_hidDescriptor_active___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __43__AccessoryHIDClient_hidDescriptor_active___block_invoke_cold_1();
  }
}

- (void)registerHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 dictionary:(id)a5 withReply:(id)a6
{
  unsigned int v8 = a4;
  id v23 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *))a6;
  uint64_t v12 = [(AccessoryHIDClient *)self delegate];
  if (!v12)
  {
LABEL_9:
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v13 = [(AccessoryHIDClient *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v15 = [(AccessoryHIDClient *)self delegate];
  uint64_t v12 = [v15 createHIDDescriptor:v10];

  if (!v12) {
    goto LABEL_9;
  }
  uint64_t v16 = [(AccessoryHIDClient *)self registeredHIDDescriptors];

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(AccessoryHIDClient *)self setRegisteredHIDDescriptors:v17];
  }
  uint64_t v18 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  id v19 = [v18 objectForKey:v23];

  if (v19)
  {
    id v20 = [NSNumber numberWithUnsignedInteger:v8];
    [v19 setObject:v12 forKey:v20];
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v8];
    [v20 setObject:v12 forKey:v21];

    BOOL v22 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
    [v22 setObject:v20 forKey:v23];
  }
  if (v11) {
LABEL_10:
  }
    v11[2](v11, v12);
LABEL_11:
}

- (void)unregisterHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 withReply:(id)a5
{
  uint64_t v6 = a4;
  id v20 = a3;
  unsigned int v8 = (void (**)(id, uint64_t))a5;
  uint64_t v9 = [(AccessoryHIDClient *)self delegate];
  if (!v9) {
    goto LABEL_8;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [(AccessoryHIDClient *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0
    || ([(AccessoryHIDClient *)self registeredHIDDescriptors],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
LABEL_8:
    uint64_t v19 = 0;
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  char v14 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  uint64_t v15 = [v14 objectForKey:v20];

  if (v15)
  {
    uint64_t v16 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v6];
    if (v16)
    {
      id v17 = [v15 objectForKey:v16];
      if (v17)
      {
        uint64_t v18 = [(AccessoryHIDClient *)self delegate];
        uint64_t v19 = [v18 deleteHIDDescriptor:v17];
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  if (v8) {
LABEL_9:
  }
    v8[2](v8, v19);
LABEL_10:
}

- (void)unregisterAllDescriptors:(id)a3 withReply:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(AccessoryHIDClient *)self delegate];
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = (void *)v8;
  id v10 = [(AccessoryHIDClient *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || ([(AccessoryHIDClient *)self registeredHIDDescriptors],
        char v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
LABEL_12:
    LOBYTE(v18) = 0;
    if (!v7) {
      goto LABEL_14;
    }
LABEL_13:
    v7[2](v7, v18 & 1);
    goto LABEL_14;
  }
  id v13 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  char v14 = [v13 objectForKey:v6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v25 = v6;
    int v18 = 0;
    id v19 = 0;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      BOOL v22 = v19;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(id *)(*((void *)&v26 + 1) + 8 * v21);

        id v23 = [(AccessoryHIDClient *)self delegate];
        long long v24 = [v15 objectForKey:v19];
        v18 |= [v23 deleteHIDDescriptor:v24];

        ++v21;
        BOOL v22 = v19;
      }
      while (v17 != v21);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);

    id v6 = v25;
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  if (v7) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)inReport:(id)a3 componentID:(unsigned __int16)a4 report:(id)a5 withReply:(id)a6
{
  uint64_t v8 = a4;
  id v23 = a3;
  id v10 = a5;
  char v11 = (void (**)(id, uint64_t))a6;
  uint64_t v12 = [(AccessoryHIDClient *)self delegate];
  if (!v12) {
    goto LABEL_8;
  }
  id v13 = (void *)v12;
  char v14 = [(AccessoryHIDClient *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0
    || ([(AccessoryHIDClient *)self registeredHIDDescriptors],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
LABEL_8:
    uint64_t v22 = 0;
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  int v18 = [v17 objectForKey:v23];

  if (v18)
  {
    id v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v8];
    if (v19)
    {
      uint64_t v20 = [v18 objectForKey:v19];
      if (v20)
      {
        uint64_t v21 = [(AccessoryHIDClient *)self delegate];
        uint64_t v22 = [v21 processInReport:v10 forUUID:v20];
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  if (v11) {
LABEL_9:
  }
    v11[2](v11, v22);
LABEL_10:
}

- (void)getReportResponse:(id)a3 componentID:(unsigned __int16)a4 reportType:(unsigned __int8)a5 reportID:(unsigned __int8)a6 report:(id)a7 withReply:(id)a8
{
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  id v27 = a3;
  id v14 = a7;
  char v15 = (void (**)(id, uint64_t))a8;
  uint64_t v16 = [(AccessoryHIDClient *)self delegate];
  if (!v16) {
    goto LABEL_8;
  }
  uint64_t v17 = (void *)v16;
  int v18 = [(AccessoryHIDClient *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0
    || ([(AccessoryHIDClient *)self registeredHIDDescriptors],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        !v20))
  {
LABEL_8:
    uint64_t v26 = 0;
    if (!v15) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v21 = [(AccessoryHIDClient *)self registeredHIDDescriptors];
  uint64_t v22 = [v21 objectForKey:v27];

  if (v22)
  {
    id v23 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v12];
    if (v23)
    {
      long long v24 = [v22 objectForKey:v23];
      if (v24)
      {
        id v25 = [(AccessoryHIDClient *)self delegate];
        uint64_t v26 = [v25 processGetReportResponse:v14 reportType:v11 reportID:v10 forUUID:v24];
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  if (v15) {
LABEL_9:
  }
    v15[2](v15, v26);
LABEL_10:
}

- (AccessoryHIDClientProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AccessoryHIDClientProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (AccessoryHIDXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)registeredHIDDescriptors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRegisteredHIDDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredHIDDescriptors, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_222ED3000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __37__AccessoryHIDClient_connectToServer__block_invoke_76_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222ED3000, a2, OS_LOG_TYPE_ERROR, "XPC connection error: %@", (uint8_t *)&v2, 0xCu);
}

void __45__AccessoryHIDClient_sendOutReport_fromUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222ED3000, v0, v1, "sendOutReport result: %d", v2, v3, v4, v5, v6);
}

void __58__AccessoryHIDClient_sendGetReportForType_andID_fromUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222ED3000, v0, v1, "getReport result: %d", v2, v3, v4, v5, v6);
}

void __43__AccessoryHIDClient_hidDescriptor_active___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222ED3000, v0, v1, "componentUpdate result: %d", v2, v3, v4, v5, v6);
}

@end