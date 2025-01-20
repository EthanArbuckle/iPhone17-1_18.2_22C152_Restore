@interface _PMCoreSmartPowerNap
- (BOOL)connection_interrupted;
- (NSString)identifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)callback_queue;
- (_PMCoreSmartPowerNap)init;
- (id)callback;
- (unsigned)current_state;
- (unsigned)state;
- (unsigned)syncState;
- (void)reRegister;
- (void)registerWithCallback:(id)a3 callback:(id)a4;
- (void)registerWithIdentifier:(id)a3;
- (void)setCSPNIgnoreRemoteClient:(unsigned int)a3;
- (void)setCSPNMotionAlarmStartThreshold:(unsigned int)a3;
- (void)setCSPNMotionAlarmThreshold:(unsigned int)a3;
- (void)setCSPNQueryDelta:(unsigned int)a3;
- (void)setCSPNRequeryDelta:(unsigned int)a3;
- (void)setCallback:(id)a3;
- (void)setCallback_queue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnection_interrupted:(BOOL)a3;
- (void)setCurrent_state:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)syncStateWithHandler:(id)a3;
- (void)unregister;
- (void)unregisterWithIdentifier:(id)a3;
- (void)updateState:(unsigned __int8)a3;
@end

@implementation _PMCoreSmartPowerNap

- (_PMCoreSmartPowerNap)init
{
  v26.receiver = self;
  v26.super_class = (Class)_PMCoreSmartPowerNap;
  v2 = [(_PMCoreSmartPowerNap *)&v26 init];
  os_log_t v3 = os_log_create("com.apple.powerd", "coresmartpowernap");
  v4 = (void *)coresmartpowernap_log;
  coresmartpowernap_log = (uint64_t)v3;

  if (!v2) {
    return v2;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerd.coresmartpowernap" options:4096];
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v5;

  v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5FBC70];
  [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v7];

  [(NSXPCConnection *)v2->_connection setExportedObject:v2];
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5FBCD0];
  [(NSXPCConnection *)v2->_connection setExportedInterface:v8];

  objc_initWeak(&location, v2);
  v9 = v2->_connection;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __28___PMCoreSmartPowerNap_init__block_invoke;
  v23[3] = &unk_264241248;
  objc_copyWeak(&v24, &location);
  [(NSXPCConnection *)v9 setInterruptionHandler:v23];
  v10 = v2->_connection;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __28___PMCoreSmartPowerNap_init__block_invoke_21;
  v21[3] = &unk_264241248;
  objc_copyWeak(&v22, &location);
  [(NSXPCConnection *)v10 setInvalidationHandler:v21];
  [(NSXPCConnection *)v2->_connection resume];
  v2->_connection_interrupted = 0;
  uint64_t v11 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = v11;
LABEL_7:
      _os_log_impl(&dword_2153B0000, v12, OS_LOG_TYPE_DEFAULT, "Initialized connection", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v12 = &_os_log_internal;
    goto LABEL_7;
  }
  v13 = MEMORY[0x263EF83A0];
  id v14 = MEMORY[0x263EF83A0];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __28___PMCoreSmartPowerNap_init__block_invoke_23;
  handler[3] = &unk_264241270;
  objc_copyWeak(&v19, &location);
  uint32_t v15 = notify_register_dispatch("com.apple.system.powermanagement.assertionresync", (int *)&init_resync_token_0, v13, handler);

  if (v15)
  {
    v16 = coresmartpowernap_log;
    if (coresmartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_ERROR)) {
        [(_PMSmartPowerNap *)v15 init];
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[_PMSmartPowerNap init](v15);
    }
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  return v2;
}

- (void)registerWithCallback:(id)a3 callback:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = (OS_dispatch_queue *)a3;
  id v7 = a4;
  pid_t v8 = getpid();
  proc_name(v8, buffer, 0x80u);
  v9 = NSString;
  v10 = [MEMORY[0x263F08C38] UUID];
  uint64_t v11 = [v10 UUIDString];
  v12 = [v9 stringWithFormat:@"%@:%s", v11, buffer];
  identifier = self->_identifier;
  self->_identifier = v12;

  [(_PMCoreSmartPowerNap *)self registerWithIdentifier:self->_identifier];
  callback_queue = self->_callback_queue;
  self->_callback_queue = v6;
  uint32_t v15 = v6;

  v16 = (void *)MEMORY[0x2166B8AD0](v7);
  id callback = self->_callback;
  self->_id callback = v16;
}

- (unsigned)state
{
  return self->_current_state;
}

- (void)registerWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = coresmartpowernap_log;
  if (v4)
  {
    if (coresmartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pid_t v8 = 138412290;
        *(void *)&v8[4] = v4;
        v6 = v5;
LABEL_9:
        _os_log_impl(&dword_2153B0000, v6, OS_LOG_TYPE_DEFAULT, "registerWithIdentifier %@", v8, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pid_t v8 = 138412290;
      *(void *)&v8[4] = v4;
      v6 = &_os_log_internal;
      goto LABEL_9;
    }
    id v7 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1, *(_OWORD *)v8);
    [v7 registerWithIdentifier:v4];

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_FAULT)) {
    -[_PMSmartPowerNap registerWithIdentifier:](v5);
  }
LABEL_11:
}

- (void)reRegister
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)id v7 = 138412290;
      *(void *)&v7[4] = identifier;
      uint64_t v5 = v3;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v5, OS_LOG_TYPE_DEFAULT, "re-register with powerd with identifier: %@", v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_identifier;
    *(_DWORD *)id v7 = 138412290;
    *(void *)&v7[4] = v6;
    uint64_t v5 = &_os_log_internal;
    goto LABEL_6;
  }
  -[_PMCoreSmartPowerNap registerWithIdentifier:](self, "registerWithIdentifier:", self->_identifier, *(_OWORD *)v7);
}

- (void)unregister
{
  if (self->_identifier)
  {
    -[_PMCoreSmartPowerNap unregisterWithIdentifier:](self, "unregisterWithIdentifier:");
  }
  else
  {
    v2 = coresmartpowernap_log;
    if (coresmartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_ERROR)) {
        -[_PMSmartPowerNap unregister](v2);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[_PMSmartPowerNap unregister]();
    }
    uint64_t v3 = coresmartpowernap_log;
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_FAULT)) {
      -[_PMSmartPowerNap unregister](v3);
    }
  }
}

- (void)unregisterWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v8 = 138412290;
      *(void *)&v8[4] = v4;
      v6 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v6, OS_LOG_TYPE_DEFAULT, "unregisterWithIdentifier %@", v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)&v8[4] = v4;
    v6 = &_os_log_internal;
    goto LABEL_6;
  }
  id v7 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_32, *(_OWORD *)v8);
  [v7 unregisterWithIdentifier:v4];
}

- (void)updateState:(unsigned __int8)a3
{
  self->_current_state = a3;
  uint64_t v5 = (void *)os_transaction_create();
  v6 = v5;
  if (self->_callback)
  {
    callback_queue = self->_callback_queue;
    if (callback_queue)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36___PMCoreSmartPowerNap_updateState___block_invoke;
      block[3] = &unk_2642412B8;
      id v9 = v5;
      v10 = self;
      unsigned __int8 v11 = a3;
      dispatch_async(callback_queue, block);
    }
  }
}

- (void)setState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8) = 67109120;
      HIDWORD(v8) = v3;
      v6 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v6, OS_LOG_TYPE_DEFAULT, "Updating CSPN state to %d", (uint8_t *)&v8, 8u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8) = 67109120;
    HIDWORD(v8) = v3;
    v6 = &_os_log_internal;
    goto LABEL_6;
  }
  id v7 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_35, v8, v9);
  [v7 setState:v3];
}

- (void)setCSPNQueryDelta:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      id v7 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN Query delay", v6, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    id v7 = &_os_log_internal;
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  uint64_t v8 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_37_0, v9);
  [v8 setCSPNQueryDelta:v3];
}

- (void)setCSPNRequeryDelta:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      id v7 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN Re-query delay", v6, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    id v7 = &_os_log_internal;
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  uint64_t v8 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_39_0, v9);
  [v8 setCSPNRequeryDelta:v3];
}

- (void)setCSPNIgnoreRemoteClient:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8) = 67109120;
      HIDWORD(v8) = v3;
      v6 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v6, OS_LOG_TYPE_DEFAULT, "Updating setCSPNIgnoreRemoteClient state to %d", (uint8_t *)&v8, 8u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8) = 67109120;
    HIDWORD(v8) = v3;
    v6 = &_os_log_internal;
    goto LABEL_6;
  }
  id v7 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41_0, v8, v9);
  [v7 setCSPNIgnoreRemoteClient:v3];
}

- (void)setCSPNMotionAlarmThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      id v7 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN motion alarm threshold", v6, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    id v7 = &_os_log_internal;
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  uint64_t v8 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_43_0, v9);
  [v8 setCSPNMotionAlarmThreshold:v3];
}

- (void)setCSPNMotionAlarmStartThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      id v7 = v5;
LABEL_6:
      _os_log_impl(&dword_2153B0000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN motion alarm start threshold", v6, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    id v7 = &_os_log_internal;
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  uint64_t v8 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_45_0, v9);
  [v8 setCSPNMotionAlarmStartThreshold:v3];
}

- (void)syncStateWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_47_0];
  [v5 syncStateWithHandler:v4];
}

- (unsigned)syncState
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_49_0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33___PMCoreSmartPowerNap_syncState__block_invoke_50;
  v5[3] = &unk_2642412E0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 syncStateWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
}

- (unsigned)current_state
{
  return self->_current_state;
}

- (void)setCurrent_state:(unsigned __int8)a3
{
  self->_current_state = a3;
}

- (BOOL)connection_interrupted
{
  return self->_connection_interrupted;
}

- (void)setConnection_interrupted:(BOOL)a3
{
  self->_connection_interrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end