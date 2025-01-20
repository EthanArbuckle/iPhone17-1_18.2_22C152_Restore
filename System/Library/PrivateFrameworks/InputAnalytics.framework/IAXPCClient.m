@interface IAXPCClient
- (IAXPCClient)init;
- (IAXPCClient)initWithServiceName:(id)a3;
- (IAXPCProtocolObject)server;
- (void)dealloc;
- (void)invalidateConnection;
- (void)logMessage:(id)a3;
@end

@implementation IAXPCClient

- (IAXPCClient)initWithServiceName:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)IAXPCClient;
  v7 = [(IAXPCClient *)&v48 init];
  if (v7)
  {
    v8 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v5, (uint64_t)&unk_2702F06F8, v6);
    id v9 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v11 = objc_msgSend_initWithMachServiceName_options_(v9, v10, (uint64_t)v4, 0);
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v11;

    objc_msgSend_setRemoteObjectInterface_(v7->_connection, v13, (uint64_t)v8, v14);
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    v47 = v7;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    v43 = v7->_connection;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    server = v7->_server;
    v15 = sub_252A0588C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v45[3];
      *(_DWORD *)buf = 134217984;
      uint64_t v50 = v16;
      _os_log_impl(&dword_2529F1000, v15, OS_LOG_TYPE_INFO, "Initialized 0x%lx", buf, 0xCu);
    }

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_252A06620;
    v35[3] = &unk_265387E08;
    v35[4] = &v44;
    v35[5] = &v40;
    v35[6] = &v36;
    objc_msgSend_setInterruptionHandler_(v7->_connection, v17, (uint64_t)v35, v18);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_252A0666C;
    v34[3] = &unk_265387E08;
    v34[4] = &v44;
    v34[5] = &v40;
    v34[6] = &v36;
    objc_msgSend_setInvalidationHandler_(v7->_connection, v19, (uint64_t)v34, v20);
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7->_connection, v21, (uint64_t)&unk_2702E3988, v22);
    v24 = v7->_server;
    v7->_server = (IAXPCProtocolObject *)v23;

    objc_msgSend_resume(v7->_connection, v25, v26, v27);
    v28 = sub_252A0588C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = v45[3];
      uint64_t v30 = v41[3];
      uint64_t v31 = v37[3];
      *(_DWORD *)buf = 134218496;
      uint64_t v50 = v29;
      __int16 v51 = 2048;
      uint64_t v52 = v30;
      __int16 v53 = 2048;
      uint64_t v54 = v31;
      _os_log_impl(&dword_2529F1000, v28, OS_LOG_TYPE_INFO, "IAXPCclient 0x%lx init created _connection 0x%lx _server 0x%lx", buf, 0x20u);
    }

    v32 = v7;
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  return v7;
}

- (IAXPCClient)init
{
  return (IAXPCClient *)objc_msgSend_initWithServiceName_(self, a2, @"com.apple.inputanalyticsd", v2);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = sub_252A0588C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = self;
    _os_log_impl(&dword_2529F1000, v3, OS_LOG_TYPE_INFO, "dealloc 0x%lx", buf, 0xCu);
  }

  objc_msgSend_invalidateConnection(self, v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)IAXPCClient;
  [(IAXPCClient *)&v7 dealloc];
}

- (void)invalidateConnection
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = sub_252A0588C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_2529F1000, v3, OS_LOG_TYPE_INFO, "invalidateConnection called 0x%lx", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_252A0693C;
  v11[3] = &unk_265387E50;
  v11[4] = &buf;
  objc_msgSend_setInvalidationHandler_(self->_connection, v4, (uint64_t)v11, v5);
  objc_msgSend_invalidate(self->_connection, v6, v7, v8);
  server = self->_server;
  self->_server = 0;

  connection = self->_connection;
  self->_connection = 0;

  _Block_object_dispose(&buf, 8);
}

- (void)logMessage:(id)a3
{
}

- (IAXPCProtocolObject)server
{
  return (IAXPCProtocolObject *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end