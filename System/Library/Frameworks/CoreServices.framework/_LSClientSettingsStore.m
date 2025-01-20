@interface _LSClientSettingsStore
+ (BOOL)supportsSecureCoding;
- (BOOL)resetUserElectionsWithError:(id *)a3;
- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5;
- (LSSettingsStoreConfiguration)configuration;
- (OS_dispatch_queue)internalQueue;
- (_LSClientSettingsStore)init;
- (id)__internalQueue_xpcConnectionWithError:(id *)a3;
- (unsigned)userElectionForExtensionKey:(id)a3;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setInternalQueue:(id)a3;
@end

@implementation _LSClientSettingsStore

- (unsigned)userElectionForExtensionKey:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__30;
  v28 = __Block_byref_object_dispose__30;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__30;
  internalQueue = self->_internalQueue;
  v22[4] = __Block_byref_object_dispose__30;
  id v23 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke;
  block[3] = &unk_1E522BDE0;
  block[4] = self;
  block[5] = &v24;
  block[6] = v22;
  dispatch_sync(internalQueue, block);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v6 = (void *)v25[5];
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2;
    v15[3] = &unk_1E522BF50;
    v7 = v4;
    v16 = v7;
    v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_219;
    v12[3] = &unk_1E522FA20;
    v13 = v7;
    v14 = &v17;
    [v8 userElectionForExtensionKey:v13 reply:v12];

    v9 = v16;
  }
  else
  {
    v9 = _LSExtensionsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LSClientSettingsStore userElectionForExtensionKey:]();
    }
  }

  unsigned __int8 v10 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

- (id)__internalQueue_xpcConnectionWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__30;
  v22 = __Block_byref_object_dispose__30;
  id v23 = 0;
  v5 = [(_LSClientSettingsStore *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_configuration)
  {
    v17[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
    v17[1] = (void (*)(void, void))3221225472;
    v17[2] = (void (*)(void, void))__65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke;
    v17[3] = (void (*)(void, void))&unk_1E522BA78;
    v17[4] = (void (*)(void, void))&v18;
    v6 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v17);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_216;
    v16[3] = &unk_1E522F9F8;
    v16[4] = self;
    v16[5] = &v18;
    [v6 getSettingsStoreConfigurationWithCompletionHandler:v16];
  }
  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    xpcConnection = self->_configuration;
    if (xpcConnection)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F29268]);
      unsigned __int8 v10 = [(LSSettingsStoreConfiguration *)self->_configuration endpoint];
      v11 = (void *)[v9 initWithListenerEndpoint:v10];

      v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB64390];
      [v11 setRemoteObjectInterface:v12];

      [v11 _setQueue:self->_internalQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_218;
      v15[3] = &unk_1E522D3E8;
      void v15[4] = self;
      [v11 setInterruptionHandler:v15];
      objc_storeStrong((id *)&self->_xpcConnection, v11);
      [v11 resume];

      xpcConnection = *p_xpcConnection;
    }
    if (a3 && !xpcConnection)
    {
      *a3 = (id) v19[5];
      xpcConnection = *p_xpcConnection;
    }
  }
  id v13 = xpcConnection;
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (_LSClientSettingsStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LSClientSettingsStore;
  v2 = [(LSSettingsStore *)&v7 _init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_LSClientSettingsStore;
  [(_LSClientSettingsStore *)&v3 dealloc];
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__30;
  v45 = __Block_byref_object_dispose__30;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__30;
  internalQueue = self->_internalQueue;
  v39 = __Block_byref_object_dispose__30;
  id v40 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke;
  block[3] = &unk_1E522BDE0;
  block[4] = self;
  block[5] = &v41;
  block[6] = &v35;
  dispatch_sync(internalQueue, block);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  unsigned __int8 v10 = (void *)v42[5];
  if (v10)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__30;
    v28 = __Block_byref_object_dispose__30;
    id v29 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_2;
    v20[3] = &unk_1E522FA48;
    id v11 = v8;
    id v21 = v11;
    v22 = &v24;
    id v23 = &v30;
    v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_221;
    v16[3] = &unk_1E522FA48;
    id v17 = v11;
    uint64_t v18 = &v24;
    uint64_t v19 = &v30;
    [v12 setUserElection:v6 forExtensionKey:v17 reply:v16];
    if (a5 && !*((unsigned char *)v31 + 24)) {
      *a5 = (id) v25[5];
    }

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    char v33 = 0;
    id v13 = _LSExtensionsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LSClientSettingsStore setUserElection:forExtensionKey:error:]();
    }

    if (a5) {
      *a5 = (id) v36[5];
    }
  }
  char v14 = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v14;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  uint64_t v32 = 0;
  char v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__30;
  v36 = __Block_byref_object_dispose__30;
  id v37 = 0;
  uint64_t v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x3032000000;
  v30[2] = __Block_byref_object_copy__30;
  internalQueue = self->_internalQueue;
  v30[3] = __Block_byref_object_dispose__30;
  id v31 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke;
  block[3] = &unk_1E522BDE0;
  block[4] = self;
  block[5] = &v32;
  block[6] = &v29;
  dispatch_sync(internalQueue, block);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  v5 = (void *)v33[5];
  if (v5)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__30;
    v22 = __Block_byref_object_dispose__30;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2;
    v17[3] = &unk_1E522FA70;
    v17[4] = &v18;
    v17[5] = &v24;
    uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v17];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_222;
    v16[3] = &unk_1E522FA70;
    void v16[4] = &v18;
    v16[5] = &v24;
    [v6 resetUserElectionsWithReply:v16];
    if (a3 && !*((unsigned char *)v25 + 24)) {
      *a3 = (id) v19[5];
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    char v27 = 0;
    objc_super v7 = _LSExtensionsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_LSClientSettingsStore resetUserElectionsWithError:]((uint64_t)v30, v7, v8, v9, v10, v11, v12, v13);
    }

    if (a3) {
      *a3 = *(id *)(v30[0] + 40);
    }
  }
  char v14 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v32, 8);
  return v14;
}

- (LSSettingsStoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)userElectionForExtensionKey:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Failed to determine user election for extension key %@: failure creating connection: %@");
}

- (void)setUserElection:forExtensionKey:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Failed to set user election for extension key %@: failure creating connection: %@");
}

- (void)resetUserElectionsWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end