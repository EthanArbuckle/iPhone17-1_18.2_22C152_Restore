@interface _CDClientContext
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)userContext;
+ (id)userContextWithEndpoint:(id)a3;
- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5;
- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 synchronous:(BOOL)a6 responseQueue:(id)a7 withCompletion:(id)a8;
- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4;
- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (BOOL)evaluatePredicate:(id)a3;
- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3;
- (BOOL)interrupted;
- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4;
- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4;
- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (BOOL)setObject:(id)a3 lastModifiedDate:(id)a4 forContextualKeyPath:(id)a5;
- (NSCountedSet)keyPathsWithRegistrationsForAnyChange;
- (NSMutableDictionary)keyPathToValues;
- (NSMutableDictionary)openRegistrationTokens;
- (NSMutableDictionary)registrations;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)registrationCallbackQueue;
- (OS_dispatch_queue)xpcEventQueue;
- (OS_dispatch_queue)xpcQueue;
- (OS_os_log)log;
- (_CDClientContext)initWithEndpoint:(id)a3;
- (_CDRemoteUserContextServer)remoteUserContextProxy;
- (id)cachedValueIfClientHasRegistrationsForKeyPath:(id)a3;
- (id)currentConnection;
- (id)defaultCallbackQueue;
- (id)lastModifiedDateForContextualKeyPath:(id)a3;
- (id)lastModifiedDateForContextualKeyPath:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (id)objectForContextualKeyPath:(id)a3;
- (id)objectForContextualKeyPath:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (id)valuesForKeyPaths:(id)a3;
- (id)valuesForKeyPaths:(id)a3 inContextsMatchingPredicate:(id)a4;
- (id)valuesForKeyPaths:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4;
- (void)addKeyPathsWithRegistrationsForAnyChangeFromRegistration:(id)a3;
- (void)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (void)addObjects:(id)a3 toArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)cleanupInternalReferencesToRegistration:(id)a3;
- (void)clearCacheForKeyPathsWithFireOnChangeRegistrations:(id)a3;
- (void)deactivateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4;
- (void)dealloc;
- (void)deregisterCallback:(id)a3;
- (void)handleContextualChange:(id)a3 info:(id)a4 handler:(id)a5;
- (void)handleFetchPropertiesEvent:(id)a3;
- (void)handleFetchProxySourceDeviceUUIDEvent:(id)a3;
- (void)handleKeepAliveEvent:(id)a3;
- (void)handleMDCSEvent:(id)a3;
- (void)handleNotificationEvent:(id)a3;
- (void)handleRegistrationCompleted:(id)a3 handler:(id)a4;
- (void)handleRequestActivateDevicesEvent:(id)a3;
- (void)handleSubscribeToContextValueNotificationsEvent:(id)a3;
- (void)handleUnsubscribeFromContextValueNotificationsEvent:(id)a3;
- (void)lastModifiedDateForContextualKeyPath:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)logFaultIfDeprecatedKeyPath:(id)a3;
- (void)objectForContextualKeyPath:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)registerCallback:(id)a3;
- (void)removeKeyPathsWithRegistrationsForAnyChangeFromRegistration:(id)a3;
- (void)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)retryTimes:(int)a3 block:(id)a4;
- (void)setCachedValueIfClientHasRegistrations:(id)a3 forKeyPath:(id)a4;
- (void)setEndpoint:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setKeyPathToValues:(id)a3;
- (void)setKeyPathsWithRegistrationsForAnyChange:(id)a3;
- (void)setLog:(id)a3;
- (void)setObject:(id)a3 forContextualKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)setOpenRegistrationTokens:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistrationCallbackQueue:(id)a3;
- (void)setRegistrations:(id)a3;
- (void)setRemoteUserContextProxy:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcEventQueue:(id)a3;
- (void)setXpcQueue:(id)a3;
- (void)subscribeToEventStreams;
- (void)unprotectedSetUpXPCConnectionWithEndpoint:(id)a3;
- (void)valuesForKeyPaths:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
@end

@implementation _CDClientContext

- (id)objectForContextualKeyPath:(id)a3
{
  if (a3)
  {
    v4 = [(_CDClientContext *)self objectForContextualKeyPath:a3 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)objectForContextualKeyPath:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v10];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v50[3] = &unk_1E5609828;
  v50[4] = self;
  id v13 = v10;
  id v51 = v13;
  id v14 = v12;
  id v53 = v14;
  v15 = v11;
  v52 = v15;
  v16 = (void *)MEMORY[0x192FB2040](v50);
  v17 = [(_CDClientContext *)self currentConnection];
  v18 = v17;
  if (v8) {
    [v17 synchronousRemoteObjectProxyWithErrorHandler:v16];
  }
  else {
  v19 = [v17 remoteObjectProxyWithErrorHandler:v16];
  }

  v20 = +[_CDContextQueries keyPathForSystemTime];
  int v21 = [v13 isEqual:v20];

  if (v21)
  {
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    if (!v14) {
      goto LABEL_28;
    }
    v23 = v15;
    if (!v15)
    {
      v23 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E56095F0;
    id v49 = v14;
    id v22 = v22;
    id v48 = v22;
    dispatch_async(v23, block);
    if (!v15) {

    }
    v24 = v49;
  }
  else
  {
    v24 = [(_CDClientContext *)self cachedValueIfClientHasRegistrationsForKeyPath:v13];
    uint64_t v25 = [v24 value];
    if (v25)
    {
      id v22 = (id)v25;
      v26 = [MEMORY[0x1E4F1CA98] null];
      int v27 = [v22 isEqual:v26];

      if (v27)
      {

        id v22 = 0;
      }
      if (!v14) {
        goto LABEL_27;
      }
      v28 = v15;
      if (!v15)
      {
        v28 = [(_CDClientContext *)self defaultCallbackQueue];
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3;
      v44[3] = &unk_1E56095F0;
      v46 = v14;
      id v22 = v22;
      id v45 = v22;
      dispatch_async(v28, v44);
      if (!v15) {

      }
      v29 = v46;
    }
    else
    {
      if (v8) {
        v30 = "Duet: ClientContext objectForContextualKeyPath:";
      }
      else {
        v30 = "Duet: ClientContext objectForContextualKeyPath:responseQueue:withCompletion:";
      }
      v29 = _os_activity_create(&dword_18EC9B000, v30, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v29, &state);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[_CDClientContext objectForContextualKeyPath:synchronous:responseQueue:withCompletion:]();
      }
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__1;
      v41 = __Block_byref_object_dispose__1;
      id v42 = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_132;
      v32[3] = &unk_1E5609878;
      v36 = &v37;
      v32[4] = self;
      id v33 = v13;
      id v35 = v14;
      v34 = v15;
      [v19 propertiesOfPath:v33 handler:v32];
      id v22 = (id)v38[5];

      _Block_object_dispose(&v37, 8);
      os_activity_scope_leave(&state);
    }
  }
LABEL_27:

LABEL_28:
  return v22;
}

- (id)currentConnection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___CDClientContext_currentConnection__block_invoke;
  v5[3] = &unk_1E5609718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logFaultIfDeprecatedKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];

  if (v5)
  {
    uint64_t v6 = +[_CDContextQueries keyPathForDeviceName];
    v7 = [v6 key];

    uint64_t v8 = [v4 key];
    int v9 = [v7 isEqualToString:v8];

    if (v9 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT)) {
      -[_CDClientContext logFaultIfDeprecatedKeyPath:]();
    }
  }
}

- (id)cachedValueIfClientHasRegistrationsForKeyPath:(id)a3
{
  id v4 = a3;
  v5 = self->_keyPathsWithRegistrationsForAnyChange;
  objc_sync_enter(v5);
  NSUInteger v6 = [(NSCountedSet *)self->_keyPathsWithRegistrationsForAnyChange countForObject:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    v7 = self->_keyPathToValues;
    objc_sync_enter(v7);
    uint64_t v8 = [(NSMutableDictionary *)self->_keyPathToValues objectForKeyedSubscript:v4];
    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)handleContextualChange:(id)a3 info:(id)a4 handler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext handleContextualChange:info:handler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Registration fired for %@", (uint8_t *)&state, 0xCu);
  }
  id v13 = self->_registrations;
  objc_sync_enter(v13);
  id v14 = [(NSMutableDictionary *)self->_registrations objectForKeyedSubscript:v8];
  objc_sync_exit(v13);

  if (v14)
  {
    v15 = self->_keyPathToValues;
    objc_sync_enter(v15);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = [v14 predicate];
    v17 = [v16 keyPaths];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v17);
          }
          [(NSMutableDictionary *)self->_keyPathToValues removeObjectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v18);
    }

    objc_sync_exit(v15);
    int v21 = [v14 callback];
    registrationCallbackQueue = self->_registrationCallbackQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56___CDClientContext_handleContextualChange_info_handler___block_invoke;
    v28[3] = &unk_1E5609918;
    id v29 = v14;
    id v30 = v8;
    id v31 = v9;
    id v33 = v21;
    id v34 = v10;
    v32 = self;
    v23 = v28;
    v24 = registrationCallbackQueue;
    id v25 = v21;
    v26 = (void *)os_transaction_create();
    state.opaque[0] = MEMORY[0x1E4F143A8];
    state.opaque[1] = 3221225472;
    v41 = __cd_dispatch_async_capture_tx_block_invoke_0;
    id v42 = &unk_1E56095F0;
    id v43 = v26;
    id v44 = v23;
    id v27 = v26;
    dispatch_async(v24, &state);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDClientContext handleContextualChange:info:handler:]();
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)setCachedValueIfClientHasRegistrations:(id)a3 forKeyPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    v7 = self->_keyPathsWithRegistrationsForAnyChange;
    objc_sync_enter(v7);
    NSUInteger v8 = [(NSCountedSet *)self->_keyPathsWithRegistrationsForAnyChange countForObject:v6];
    objc_sync_exit(v7);

    if (v8)
    {
      id v9 = self->_keyPathToValues;
      objc_sync_enter(v9);
      [(NSMutableDictionary *)self->_keyPathToValues setObject:v10 forKeyedSubscript:v6];
      objc_sync_exit(v9);
    }
  }
}

- (void)unprotectedSetUpXPCConnectionWithEndpoint:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  if (self->_interrupted)
  {
    id v6 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext setupXPCConnection:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    os_activity_scope_leave(&state);

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v8 = @"com.apple.coreduetd.context";
      if (v5) {
        NSUInteger v8 = v5;
      }
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v8;
      _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Setting up XPC connection with %@", (uint8_t *)&state, 0xCu);
    }
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    if (v5)
    {
      objc_storeStrong((id *)&self->_endpoint, a3);
      id v9 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
    }
    else
    {
      id v9 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.coreduetd.context" options:4096];
    }
    id v10 = v9;
    [(NSXPCConnection *)v9 _setQueue:self->_xpcQueue];
    objc_initWeak((id *)&state, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __62___CDClientContext_unprotectedSetUpXPCConnectionWithEndpoint___block_invoke;
    uint64_t v18 = &unk_1E56096F0;
    objc_copyWeak(&v20, (id *)&state);
    uint64_t v19 = self;
    [(NSXPCConnection *)v10 setInterruptionHandler:&v15];
    id v11 = objc_msgSend((id)objc_opt_class(), "serverInterface", v15, v16, v17, v18);
    [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

    id v12 = [(id)objc_opt_class() clientInterface];
    [(NSXPCConnection *)v10 setExportedInterface:v12];

    [(NSXPCConnection *)v10 setExportedObject:self];
    [(NSXPCConnection *)v10 resume];
    self->_interrupted = 0;
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v10;
    id v14 = v10;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)&state);
  }
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)serverInterface_serverInterface;
  return v2;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_89);
  }
  v2 = (void *)clientInterface_clientInterface;
  return v2;
}

+ (id)userContext
{
  if (userContext_onceToken != -1) {
    dispatch_once(&userContext_onceToken, &__block_literal_global_115);
  }
  v2 = (void *)userContext_context;
  return v2;
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext setObject:forContextualKeyPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if (v7) {
    BOOL v9 = [(_CDClientContext *)self setObject:v6 forContextualKeyPath:v7 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v13];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v36[3] = &unk_1E5609940;
  v36[4] = self;
  id v16 = v12;
  id v37 = v16;
  id v17 = v13;
  id v38 = v17;
  id v18 = v15;
  id v40 = v18;
  id v19 = v14;
  id v39 = v19;
  id v20 = (void *)MEMORY[0x192FB2040](v36);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Setting keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v22 = [(_CDClientContext *)self currentConnection];
  v23 = v22;
  if (v9) {
    [v22 synchronousRemoteObjectProxyWithErrorHandler:v20];
  }
  else {
  v24 = [v22 remoteObjectProxyWithErrorHandler:v20];
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_143;
  v30[3] = &unk_1E5609990;
  p_long long buf = &buf;
  id v25 = v18;
  id v34 = v25;
  id v26 = v19;
  id v31 = v26;
  v32 = self;
  id v27 = v17;
  id v33 = v27;
  [v24 setObject:v16 forPath:v27 handler:v30];
  BOOL v28 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v28;
}

- (void)deregisterCallback:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext deregisterCallback:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v5, &v11);
  os_activity_scope_leave(&v11);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = log;
    NSUInteger v8 = [v4 identifier];
    LODWORD(v11.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v11.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18EC9B000, v7, OS_LOG_TYPE_DEFAULT, "Deregistering callback: %@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = [(_CDClientContext *)self currentConnection];
  id v10 = [v9 remoteObjectProxy];
  [v10 deregisterCallback:v4];

  [(_CDClientContext *)self cleanupInternalReferencesToRegistration:v4];
}

- (void)cleanupInternalReferencesToRegistration:(id)a3
{
  id v13 = a3;
  [(_CDClientContext *)self removeKeyPathsWithRegistrationsForAnyChangeFromRegistration:v13];
  id v4 = self->_registrations;
  objc_sync_enter(v4);
  registrations = self->_registrations;
  id v6 = [v13 identifier];
  [(NSMutableDictionary *)registrations removeObjectForKey:v6];

  objc_sync_exit(v4);
  id v7 = self->_openRegistrationTokens;
  objc_sync_enter(v7);
  openRegistrationTokens = self->_openRegistrationTokens;
  BOOL v9 = [v13 identifier];
  id v10 = [(NSMutableDictionary *)openRegistrationTokens objectForKeyedSubscript:v9];

  if (v10)
  {
    notify_cancel([v10 intValue]);
    os_activity_scope_state_s v11 = self->_openRegistrationTokens;
    uint64_t v12 = [v13 identifier];
    [(NSMutableDictionary *)v11 removeObjectForKey:v12];
  }
  objc_sync_exit(v7);
}

- (void)removeKeyPathsWithRegistrationsForAnyChangeFromRegistration:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 predicate];
  int v6 = [v5 firesOnAnyChange];

  if (v6)
  {
    id v7 = self->_keyPathsWithRegistrationsForAnyChange;
    objc_sync_enter(v7);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    NSUInteger v8 = objc_msgSend(v4, "predicate", 0);
    BOOL v9 = [v8 keyPaths];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          [(NSCountedSet *)self->_keyPathsWithRegistrationsForAnyChange removeObject:v13];
          if (![(NSCountedSet *)self->_keyPathsWithRegistrationsForAnyChange countForObject:v13])
          {
            id v14 = self->_keyPathToValues;
            objc_sync_enter(v14);
            [(NSMutableDictionary *)self->_keyPathToValues removeObjectForKey:v13];
            objc_sync_exit(v14);
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    objc_sync_exit(v7);
  }
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext addObjects:toArrayAtKeyPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if ([v6 count]) {
    BOOL v9 = [(_CDClientContext *)self addObjects:v6 toArrayAtKeyPath:v7 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v13];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v36[3] = &unk_1E5609940;
  v36[4] = self;
  id v16 = v12;
  id v37 = v16;
  id v17 = v13;
  id v38 = v17;
  id v18 = v15;
  id v40 = v18;
  id v19 = v14;
  id v39 = v19;
  uint64_t v20 = (void *)MEMORY[0x192FB2040](v36);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Adding object to keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v22 = [(_CDClientContext *)self currentConnection];
  v23 = v22;
  if (v9) {
    [v22 synchronousRemoteObjectProxyWithErrorHandler:v20];
  }
  else {
  v24 = [v22 remoteObjectProxyWithErrorHandler:v20];
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_145;
  v30[3] = &unk_1E5609990;
  p_long long buf = &buf;
  id v25 = v18;
  id v34 = v25;
  id v26 = v19;
  id v31 = v26;
  v32 = self;
  id v27 = v17;
  id v33 = v27;
  [v24 addObjects:v16 andRemoveObjects:0 forArrayAtPath:v27 handler:v30];
  BOOL v28 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v28;
}

- (id)defaultCallbackQueue
{
  if (defaultCallbackQueue_onceToken != -1) {
    dispatch_once(&defaultCallbackQueue_onceToken, &__block_literal_global_100);
  }
  v2 = (void *)defaultCallbackQueue_callbackQueue;
  return v2;
}

- (_CDClientContext)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_CDClientContext;
  v5 = [(_CDClientContext *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28BD0] set];
    keyPathsWithRegistrationsForAnyChange = v5->_keyPathsWithRegistrationsForAnyChange;
    v5->_keyPathsWithRegistrationsForAnyChange = (NSCountedSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    registrations = v5->_registrations;
    v5->_registrations = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    openRegistrationTokens = v5->_openRegistrationTokens;
    v5->_openRegistrationTokens = (NSMutableDictionary *)v10;

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.cdclientcontext.queue", v12);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v13;

    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.cdclientcontext.registrationCallbackQueue", v15);
    registrationCallbackQueue = v5->_registrationCallbackQueue;
    v5->_registrationCallbackQueue = (OS_dispatch_queue *)v16;

    id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.cdclientcontext.xpcQueue", v18);
    xpcQueue = v5->_xpcQueue;
    v5->_xpcQueue = (OS_dispatch_queue *)v19;

    int v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.cdclientcontext.xpcEventQueue", v21);
    xpcEventQueue = v5->_xpcEventQueue;
    v5->_xpcEventQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    keyPathToValues = v5->_keyPathToValues;
    v5->_keyPathToValues = (NSMutableDictionary *)v24;

    v5->_interrupted = 1;
    os_log_t v26 = os_log_create("com.apple.coreduet.context", "client");
    log = v5->_log;
    v5->_log = (OS_os_log *)v26;

    BOOL v28 = v5->_queue;
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    id v33 = __37___CDClientContext_initWithEndpoint___block_invoke;
    id v34 = &unk_1E56091D8;
    id v29 = v5;
    long long v35 = v29;
    id v36 = v4;
    dispatch_sync(v28, &v31);
    [(_CDClientContext *)v29 subscribeToEventStreams];
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_CDClientContext;
  [(_CDClientContext *)&v3 dealloc];
}

+ (id)userContextWithEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEndpoint:v3];

  return v4;
}

- (void)subscribeToEventStreams
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CDClientContext_subscribeToEventStreams__block_invoke;
  block[3] = &unk_1E5609210;
  void block[4] = self;
  if (subscribeToEventStreams_onceToken != -1) {
    dispatch_once(&subscribeToEventStreams_onceToken, block);
  }
}

- (void)handleMDCSEvent:(id)a3
{
  id v4 = a3;
  switch(+[_CDXPCCodecs eventTypeWithEvent:v4])
  {
    case 1:
      [(_CDClientContext *)self handleFetchPropertiesEvent:v4];
      goto LABEL_11;
    case 2:
      [(_CDClientContext *)self handleSubscribeToContextValueNotificationsEvent:v4];
      goto LABEL_11;
    case 3:
      [(_CDClientContext *)self handleUnsubscribeFromContextValueNotificationsEvent:v4];
      goto LABEL_11;
    case 4:
      [(_CDClientContext *)self handleKeepAliveEvent:v4];
      goto LABEL_11;
    case 5:
      [(_CDClientContext *)self handleFetchProxySourceDeviceUUIDEvent:v4];
      goto LABEL_11;
    case 6:
      [(_CDClientContext *)self handleRequestActivateDevicesEvent:v4];
      goto LABEL_11;
    default:
      v5 = (void *)MEMORY[0x192FB22E0](v4);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[_CDClientContext handleMDCSEvent:]();
        if (!v5) {
          goto LABEL_11;
        }
      }
      else if (!v5)
      {
        goto LABEL_11;
      }
      free(v5);
LABEL_11:

      return;
  }
}

- (void)handleFetchPropertiesEvent:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  v5 = +[_CDXPCContextCodecs keyPathsFromFetchPropertiesEvent:v4 error:&v14];
  id v6 = v14;
  if (v5)
  {
    remoteUserContextProxy = self->_remoteUserContextProxy;
    if (remoteUserContextProxy)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47___CDClientContext_handleFetchPropertiesEvent___block_invoke;
      v12[3] = &unk_1E5609768;
      v12[4] = self;
      id v13 = v4;
      [(_CDRemoteUserContextServer *)remoteUserContextProxy fetchPropertiesOfRemoteKeyPaths:v5 handler:v12];
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[_CDClientContext handleFetchPropertiesEvent:](log);
      }
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B678] userInfo:0];

      os_activity_scope_state_s v11 = +[_CDXPCCodecs fetchPropertiesReplyWithEvent:v4 error:v10];
      if (v11) {
        xpc_dictionary_send_reply();
      }

      id v6 = (id)v10;
    }
  }
  else
  {
    uint64_t v8 = +[_CDXPCCodecs fetchPropertiesReplyWithEvent:v4 error:v6];
    if (v8) {
      xpc_dictionary_send_reply();
    }
  }
}

- (void)handleSubscribeToContextValueNotificationsEvent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_remoteUserContextProxy)
  {
    id v17 = 0;
    id v18 = 0;
    id v16 = 0;
    BOOL v5 = +[_CDXPCContextCodecs parseSubscribeToContextValueNotificationsEvent:v4 registration:&v18 deviceIDs:&v17 error:&v16];
    id v6 = v18;
    id v7 = v17;
    id v8 = v16;
    if (v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = log;
        os_activity_scope_state_s v11 = [v6 identifier];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_18EC9B000, v10, OS_LOG_TYPE_INFO, "Handling subscribe to context value change notifications request with registration %@: %@", buf, 0x16u);
      }
      remoteUserContextProxy = self->_remoteUserContextProxy;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68___CDClientContext_handleSubscribeToContextValueNotificationsEvent___block_invoke;
      v14[3] = &unk_1E5609790;
      id v15 = v4;
      [(_CDRemoteUserContextServer *)remoteUserContextProxy subscribeToContextValueChangeNotificationsWithRegistration:v6 deviceIDs:v7 handler:v14];
      id v13 = v15;
    }
    else
    {
      id v13 = +[_CDXPCContextCodecs subscribeToContextValueNotificationsReplyWithEvent:v4 error:v8];
      if (v13) {
        xpc_dictionary_send_reply();
      }
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B678] userInfo:0];
    id v7 = +[_CDXPCContextCodecs subscribeToContextValueNotificationsReplyWithEvent:v4 error:v6];
    if (v7) {
      xpc_dictionary_send_reply();
    }
  }
}

- (void)handleUnsubscribeFromContextValueNotificationsEvent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_remoteUserContextProxy)
  {
    id v17 = 0;
    id v18 = 0;
    id v16 = 0;
    BOOL v5 = +[_CDXPCContextCodecs parseUnsubscribeFromContextValueNotificationsEvent:v4 registration:&v18 deviceIDs:&v17 error:&v16];
    id v6 = v18;
    id v7 = v17;
    id v8 = v16;
    if (v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = log;
        os_activity_scope_state_s v11 = [v6 identifier];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_18EC9B000, v10, OS_LOG_TYPE_INFO, "Handling unsubscribe from context value change notifications request with registration %@: %@", buf, 0x16u);
      }
      remoteUserContextProxy = self->_remoteUserContextProxy;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72___CDClientContext_handleUnsubscribeFromContextValueNotificationsEvent___block_invoke;
      v14[3] = &unk_1E5609790;
      id v15 = v4;
      [(_CDRemoteUserContextServer *)remoteUserContextProxy unsubscribeFromContextValueChangeNotificationsWithRegistration:v6 deviceIDs:v7 handler:v14];
      id v13 = v15;
    }
    else
    {
      id v13 = +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsReplyWithEvent:v4 error:v8];
      if (v13) {
        xpc_dictionary_send_reply();
      }
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B678] userInfo:0];
    id v7 = +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsReplyWithEvent:v4 error:v6];
    if (v7) {
      xpc_dictionary_send_reply();
    }
  }
}

- (void)handleKeepAliveEvent:(id)a3
{
  id v4 = a3;
  if (!self->_remoteUserContextProxy)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B678] userInfo:0];
    goto LABEL_5;
  }
  id v15 = 0;
  BOOL v5 = +[_CDXPCCodecs keepAliveFromKeepAliveEvent:v4 error:&v15];
  id v6 = v15;
  if (!v6)
  {
    log = self->_log;
    BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        uint64_t v10 = "Handling request to keep alive";
LABEL_12:
        _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, v10, buf, 2u);
      }
    }
    else if (v9)
    {
      *(_WORD *)long long buf = 0;
      uint64_t v10 = "Handling request to no longer keep alive";
      goto LABEL_12;
    }
    remoteUserContextProxy = self->_remoteUserContextProxy;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41___CDClientContext_handleKeepAliveEvent___block_invoke;
    v12[3] = &unk_1E5609790;
    id v13 = v4;
    [(_CDRemoteUserContextServer *)remoteUserContextProxy subscribeToDeviceStatusChangeNotificationsForDeviceTypes:0xFFFFLL handler:v12];
    id v7 = v13;
    goto LABEL_14;
  }
LABEL_5:
  id v7 = +[_CDXPCCodecs keepAliveReplyWithEvent:v4 error:v6];
  if (v7) {
    xpc_dictionary_send_reply();
  }
LABEL_14:
}

- (void)handleFetchProxySourceDeviceUUIDEvent:(id)a3
{
  id v4 = a3;
  remoteUserContextProxy = self->_remoteUserContextProxy;
  if (!remoteUserContextProxy)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B678] userInfo:0];
    BOOL v9 = +[_CDXPCCodecs keepAliveReplyWithEvent:v4 error:v8];

    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v6 = [(_CDRemoteUserContextServer *)remoteUserContextProxy sourceDeviceUUID];
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B688] userInfo:0];
  }
  BOOL v9 = +[_CDXPCCodecs fetchProxySourceDeviceUUIDReplyWithEvent:v4 sourceDeviceUUID:v6 error:v7];
  if (v7)
  {
    uint64_t v10 = +[_CDXPCCodecs keepAliveReplyWithEvent:v4 error:v7];

    BOOL v9 = (void *)v10;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Handling request for source device uuid", v12, 2u);
    }
  }

  if (v9) {
LABEL_12:
  }
    xpc_dictionary_send_reply();
LABEL_13:
}

- (void)handleRequestActivateDevicesEvent:(id)a3
{
  id v4 = a3;
  if (self->_remoteUserContextProxy)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Handling request for activate devices", buf, 2u);
    }
    remoteUserContextProxy = self->_remoteUserContextProxy;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54___CDClientContext_handleRequestActivateDevicesEvent___block_invoke;
    v9[3] = &unk_1E5609790;
    id v10 = v4;
    [(_CDRemoteUserContextServer *)remoteUserContextProxy requestActivateDevicesWithHandler:v9];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B678] userInfo:0];
    id v8 = +[_CDXPCCodecs requestActivateDevicesReplyWithEvent:v4 error:v7];
    if (v8) {
      xpc_dictionary_send_reply();
    }
  }
}

- (void)handleNotificationEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = 0;
  id v17 = 0;
  id v15 = 0;
  BOOL v5 = +[_CDXPCCodecs parseNotificationEvent:v4 registrationIdentifier:&v17 info:&v16 error:&v15];
  id v6 = v17;
  id v7 = v16;
  id v8 = v15;
  log = self->_log;
  if (v5)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Received context value change notification for registration %@: %@", buf, 0x16u);
    }
    id v10 = self->_registrations;
    objc_sync_enter(v10);
    os_activity_scope_state_s v11 = [(NSMutableDictionary *)self->_registrations objectForKeyedSubscript:v6];
    objc_sync_exit(v10);

    if (v11)
    {
      [(_CDClientContext *)self handleContextualChange:v6 info:v7 handler:&__block_literal_global_125];
    }
    else
    {
      id v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = v6;
        _os_log_impl(&dword_18EC9B000, v12, OS_LOG_TYPE_DEFAULT, "Sending change notification for registration %@", buf, 0xCu);
      }
      v18[0] = @"RegistrationIdentifier";
      v18[1] = @"Info";
      v19[0] = v6;
      v19[1] = v7;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"_CDClientContextContextChanged" object:self userInfo:v13];
    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    [(_CDClientContext *)(uint64_t)v6 handleNotificationEvent:log];
  }
}

- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3
{
  id v4 = a3;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v4];
  BOOL v5 = +[_CDContextQueries keyPathForSystemTime];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v8 = [(_CDClientContext *)self currentConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke;
    v13[3] = &unk_1E5609768;
    v13[4] = self;
    id v9 = v4;
    id v14 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_129;
    v12[3] = &unk_1E56097D8;
    void v12[4] = &v15;
    [v10 hasKnowledgeOfPath:v9 handler:v12];

    BOOL v7 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

- (void)objectForContextualKeyPath:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_activity_scope_state_s v11 = v10;
  if (v8 && v10)
  {
    id v12 = [(_CDClientContext *)self objectForContextualKeyPath:v8 synchronous:0 responseQueue:v9 withCompletion:v10];
  }
  else if (v10)
  {
    id v13 = v9;
    if (!v9)
    {
      id v13 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76___CDClientContext_objectForContextualKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v15 = v11;
    dispatch_async(v13, block);
    if (!v9) {
  }
    }
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3
{
  if (a3)
  {
    id v4 = [(_CDClientContext *)self lastModifiedDateForContextualKeyPath:a3 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)lastModifiedDateForContextualKeyPath:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_activity_scope_state_s v11 = v10;
  if (v8 && v10)
  {
    id v12 = [(_CDClientContext *)self lastModifiedDateForContextualKeyPath:v8 synchronous:0 responseQueue:v9 withCompletion:v10];
  }
  else if (v10)
  {
    id v13 = v9;
    if (!v9)
    {
      id v13 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86___CDClientContext_lastModifiedDateForContextualKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v15 = v11;
    dispatch_async(v13, block);
    if (!v9) {
  }
    }
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v10];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v47[3] = &unk_1E5609828;
  v47[4] = self;
  id v13 = v10;
  id v48 = v13;
  id v14 = v12;
  id v50 = v14;
  id v15 = v11;
  id v49 = v15;
  id v16 = (void *)MEMORY[0x192FB2040](v47);
  uint64_t v17 = [(_CDClientContext *)self currentConnection];
  char v18 = v17;
  if (v8) {
    [v17 synchronousRemoteObjectProxyWithErrorHandler:v16];
  }
  else {
  dispatch_queue_t v19 = [v17 remoteObjectProxyWithErrorHandler:v16];
  }

  uint64_t v20 = +[_CDContextQueries keyPathForSystemTime];
  int v21 = [v13 isEqual:v20];

  if (v21)
  {
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    if (!v14) {
      goto LABEL_24;
    }
    id v23 = v15;
    if (!v15)
    {
      id v23 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E56095F0;
    id v46 = v14;
    id v22 = v22;
    id v45 = v22;
    dispatch_async(v23, block);
    if (!v15) {

    }
    uint64_t v24 = v46;
  }
  else
  {
    uint64_t v24 = [(_CDClientContext *)self cachedValueIfClientHasRegistrationsForKeyPath:v13];
    if (v24)
    {
      if (v14)
      {
        id v25 = v15;
        if (!v15)
        {
          id v25 = [(_CDClientContext *)self defaultCallbackQueue];
        }
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3;
        v41[3] = &unk_1E56095F0;
        id v43 = v14;
        id v42 = v24;
        dispatch_async(v25, v41);
        if (!v15) {
      }
        }
      id v22 = [v24 lastModifiedDate];
    }
    else
    {
      if (v8) {
        os_log_t v26 = "Duet: ClientContext lastModifiedDateForContextualKeyPath:";
      }
      else {
        os_log_t v26 = "Duet: ClientContext lastModifiedDateForContextualKeyPath:responseQueue:withCompletion:";
      }
      id v27 = _os_activity_create(&dword_18EC9B000, v26, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v27, &state);
      uint64_t v34 = 0;
      long long v35 = &v34;
      uint64_t v36 = 0x3032000000;
      objc_super v37 = __Block_byref_object_copy__1;
      id v38 = __Block_byref_object_dispose__1;
      id v39 = 0;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_4;
      v29[3] = &unk_1E5609878;
      id v33 = &v34;
      v29[4] = self;
      id v30 = v13;
      id v32 = v14;
      uint64_t v31 = v15;
      [v19 propertiesOfPath:v30 handler:v29];
      id v22 = (id)v35[5];

      _Block_object_dispose(&v34, 8);
      os_activity_scope_leave(&state);
    }
  }

LABEL_24:
  return v22;
}

- (void)addKeyPathsWithRegistrationsForAnyChangeFromRegistration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 predicate];
  int v6 = [v5 firesOnAnyChange];

  if (v6)
  {
    BOOL v7 = self->_keyPathsWithRegistrationsForAnyChange;
    objc_sync_enter(v7);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v8 = objc_msgSend(v4, "predicate", 0);
    id v9 = [v8 keyPaths];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          [(NSCountedSet *)self->_keyPathsWithRegistrationsForAnyChange addObject:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    objc_sync_exit(v7);
  }
}

- (void)clearCacheForKeyPathsWithFireOnChangeRegistrations:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 predicate];
  int v6 = [v5 firesOnAnyChange];

  if (v6)
  {
    BOOL v7 = self->_keyPathToValues;
    objc_sync_enter(v7);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v8 = objc_msgSend(v4, "predicate", 0);
    id v9 = [v8 keyPaths];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          [(NSMutableDictionary *)self->_keyPathToValues removeObjectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    objc_sync_exit(v7);
  }
}

- (void)retryTimes:(int)a3 block:(id)a4
{
  BOOL v7 = (unsigned int (**)(void))a4;
  if (a3 >= 1)
  {
    int v5 = a3 & ~(a3 >> 31);
    unsigned int v6 = 1;
    do
    {
      if (!v7[2]()) {
        break;
      }
      sleep(v6);
      v6 += v6 * arc4random_uniform(3u);
      --v5;
    }
    while (v5);
  }
}

- (void)registerCallback:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext registerCallback:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = log;
    BOOL v8 = [v4 identifier];
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18EC9B000, v7, OS_LOG_TYPE_DEFAULT, "Registering callback: %@", (uint8_t *)&state, 0xCu);
  }
  id v9 = self->_registrations;
  objc_sync_enter(v9);
  registrations = self->_registrations;
  uint64_t v11 = [v4 identifier];
  [(NSMutableDictionary *)registrations setObject:v4 forKeyedSubscript:v11];

  objc_sync_exit(v9);
  int out_token = 0;
  objc_initWeak((id *)&state, v4);
  id v12 = [v4 identifier];
  long long v13 = (const char *)[v12 UTF8String];
  registrationCallbackQueue = self->_registrationCallbackQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37___CDClientContext_registerCallback___block_invoke;
  handler[3] = &unk_1E56098F0;
  objc_copyWeak(&v23, (id *)&state);
  handler[4] = self;
  notify_register_dispatch(v13, &out_token, registrationCallbackQueue, handler);

  long long v15 = self->_openRegistrationTokens;
  objc_sync_enter(v15);
  long long v16 = [NSNumber numberWithInt:out_token];
  openRegistrationTokens = self->_openRegistrationTokens;
  uint64_t v18 = [v4 identifier];
  [(NSMutableDictionary *)openRegistrationTokens setObject:v16 forKeyedSubscript:v18];

  objc_sync_exit(v15);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37___CDClientContext_registerCallback___block_invoke_139;
  v20[3] = &unk_1E56098C8;
  v20[4] = self;
  id v19 = v4;
  id v21 = v19;
  [(_CDClientContext *)self retryTimes:3 block:v20];
  [(_CDClientContext *)self addKeyPathsWithRegistrationsForAnyChangeFromRegistration:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)&state);
}

- (BOOL)evaluatePredicate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext evaluatePredicate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v4;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Evaluating predicate: %@", (uint8_t *)&state, 0xCu);
  }
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v7 = [(_CDClientContext *)self currentConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38___CDClientContext_evaluatePredicate___block_invoke;
  v12[3] = &unk_1E5609768;
  void v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38___CDClientContext_evaluatePredicate___block_invoke_141;
  v11[3] = &unk_1E56097D8;
  v11[4] = &state;
  [v9 evaluatePredicate:v8 handler:v11];

  LOBYTE(v9) = *(unsigned char *)(state.opaque[1] + 24) != 0;
  _Block_object_dispose(&state, 8);

  return (char)v9;
}

- (void)handleRegistrationCompleted:(id)a3 handler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, BOOL))a4;
  id v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext handleRegistrationCompleted:handler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v8, &v12);
  os_activity_scope_leave(&v12);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v12.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v12.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Registration completed for %@", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v10 = self->_registrations;
  objc_sync_enter(v10);
  uint64_t v11 = [(NSMutableDictionary *)self->_registrations objectForKeyedSubscript:v6];
  objc_sync_exit(v10);

  if (v11) {
    [(_CDClientContext *)self clearCacheForKeyPathsWithFireOnChangeRegistrations:v11];
  }
  v7[2](v7, v11 != 0);
}

- (void)setObject:(id)a3 forContextualKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  os_activity_scope_state_s v12 = a5;
  id v13 = a6;
  long long v14 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext setObject:forContextualKeyPath:responseQueue:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (v11)
  {
    [(_CDClientContext *)self setObject:v10 forContextualKeyPath:v11 synchronous:0 responseQueue:v12 withCompletion:v13];
  }
  else if (v13)
  {
    uint64_t v15 = v12;
    if (!v12)
    {
      uint64_t v15 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80___CDClientContext_setObject_forContextualKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v17 = v13;
    dispatch_async(v15, block);
    if (!v12) {
  }
    }
}

- (void)addObjects:(id)a3 toArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  os_activity_scope_state_s v12 = a5;
  id v13 = a6;
  long long v14 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext addObjects:toArrayAtKeyPath:responseQueue:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if ([v10 count])
  {
    [(_CDClientContext *)self addObjects:v10 toArrayAtKeyPath:v11 synchronous:0 responseQueue:v12 withCompletion:v13];
  }
  else if (v13)
  {
    uint64_t v15 = v12;
    if (!v12)
    {
      uint64_t v15 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77___CDClientContext_addObjects_toArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v17 = v13;
    dispatch_async(v15, block);
    if (!v12) {
  }
    }
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext removeObjects:fromArrayAtKeyPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if ([v6 count]) {
    BOOL v9 = [(_CDClientContext *)self removeObjects:v6 fromArrayAtKeyPath:v7 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  os_activity_scope_state_s v12 = a5;
  id v13 = a6;
  long long v14 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext removeObjects:fromArrayAtKeyPath:responseQueue:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if ([v10 count])
  {
    [(_CDClientContext *)self removeObjects:v10 fromArrayAtKeyPath:v11 synchronous:0 responseQueue:v12 withCompletion:v13];
  }
  else if (v13)
  {
    uint64_t v15 = v12;
    if (!v12)
    {
      uint64_t v15 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82___CDClientContext_removeObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v17 = v13;
    dispatch_async(v15, block);
    if (!v12) {
  }
    }
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v13];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v35[3] = &unk_1E5609940;
  v35[4] = self;
  id v16 = v12;
  id v36 = v16;
  id v17 = v13;
  id v37 = v17;
  id v18 = v15;
  id v39 = v18;
  id v19 = v14;
  id v38 = v19;
  uint64_t v20 = (void *)MEMORY[0x192FB2040](v35);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Removing object from keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  id v22 = [(_CDClientContext *)self currentConnection];
  id v23 = v22;
  if (v9) {
    [v22 synchronousRemoteObjectProxyWithErrorHandler:v20];
  }
  else {
  uint64_t v24 = [v22 remoteObjectProxyWithErrorHandler:v20];
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_147;
  v30[3] = &unk_1E56099B8;
  p_long long buf = &buf;
  void v30[4] = self;
  id v25 = v17;
  id v31 = v25;
  id v26 = v18;
  id v33 = v26;
  id v27 = v19;
  id v32 = v27;
  [v24 addObjects:0 andRemoveObjects:v16 forArrayAtPath:v25 handler:v30];
  BOOL v28 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v28;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  if (a3)
  {
    int v5 = [(_CDClientContext *)self removeObjectsMatchingPredicate:a3 fromArrayAtKeyPath:a4 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (void)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v10)
  {
    id v15 = [(_CDClientContext *)self removeObjectsMatchingPredicate:v10 fromArrayAtKeyPath:v11 synchronous:0 responseQueue:v12 withCompletion:v13];
  }
  else if (v13)
  {
    id v16 = v12;
    if (!v12)
    {
      id v16 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v18 = v14;
    dispatch_async(v16, block);
    if (!v12) {
  }
    }
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v13];
  id v16 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext removeObjectsMatchingPredicate:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  os_activity_scope_leave(&state);

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v36[3] = &unk_1E5609940;
  v36[4] = self;
  id v17 = v12;
  id v37 = v17;
  id v18 = v13;
  id v38 = v18;
  id v19 = v15;
  id v40 = v19;
  id v20 = v14;
  id v39 = v20;
  id v21 = (void *)MEMORY[0x192FB2040](v36);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v18;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Removing objects matching predicate from keypath: %@", (uint8_t *)&state, 0xCu);
  }
  id v23 = [(_CDClientContext *)self currentConnection];
  uint64_t v24 = v23;
  if (v9) {
    [v23 synchronousRemoteObjectProxyWithErrorHandler:v21];
  }
  else {
  id v25 = [v23 remoteObjectProxyWithErrorHandler:v21];
  }

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__1;
  uint64_t v44 = __Block_byref_object_dispose__1;
  id v45 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_150;
  v31[3] = &unk_1E5609A08;
  p_os_activity_scope_state_s state = &state;
  v31[4] = self;
  id v26 = v18;
  id v32 = v26;
  id v27 = v19;
  id v34 = v27;
  id v28 = v20;
  id v33 = v28;
  [v25 removeObjectsMatchingPredicate:v17 fromArrayAtPath:v26 handler:v31];
  id v29 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v29;
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext addObjects:andRemoveObjects:fromArrayAtKeyPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  BOOL v12 = ([v8 count] || objc_msgSend(v9, "count"))
     && [(_CDClientContext *)self addObjects:v8 andRemoveObjects:v9 fromArrayAtKeyPath:v10 synchronous:1 responseQueue:0 withCompletion:0];

  return v12;
}

- (void)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext addObjects:andRemoveObjects:fromArrayAtKeyPath:responseQueue:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v17, &state);
  os_activity_scope_leave(&state);

  if ([v12 count] || objc_msgSend(v13, "count"))
  {
    [(_CDClientContext *)self addObjects:v12 andRemoveObjects:v13 fromArrayAtKeyPath:v14 synchronous:0 responseQueue:v15 withCompletion:v16];
  }
  else if (v16)
  {
    id v18 = v15;
    if (!v15)
    {
      id v18 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v20 = v16;
    dispatch_async(v18, block);
    if (!v15) {
  }
    }
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 synchronous:(BOOL)a6 responseQueue:(id)a7 withCompletion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:v16];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v39[3] = &unk_1E5609A30;
  v39[4] = self;
  id v19 = v14;
  id v40 = v19;
  id v20 = v15;
  id v41 = v20;
  id v21 = v16;
  id v42 = v21;
  id v22 = v18;
  id v44 = v22;
  id v23 = v17;
  id v43 = v23;
  uint64_t v24 = (void *)MEMORY[0x192FB2040](v39);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Adding to and removing from keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  id v26 = [(_CDClientContext *)self currentConnection];
  id v27 = v26;
  if (v10) {
    [v26 synchronousRemoteObjectProxyWithErrorHandler:v24];
  }
  else {
  id v28 = [v26 remoteObjectProxyWithErrorHandler:v24];
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_154;
  v34[3] = &unk_1E56099B8;
  p_long long buf = &buf;
  v34[4] = self;
  id v29 = v21;
  id v35 = v29;
  id v30 = v22;
  id v37 = v30;
  id v31 = v23;
  id v36 = v31;
  [v28 addObjects:v19 andRemoveObjects:v20 forArrayAtPath:v29 handler:v34];
  BOOL v32 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v32;
}

- (id)valuesForKeyPaths:(id)a3 inContextsMatchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext valuesForKeyPaths:inContextsMatchingPredicate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  id v9 = [(_CDClientContext *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke;
  v14[3] = &unk_1E5609790;
  void v14[4] = self;
  BOOL v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_156;
  v13[3] = &unk_1E5609A58;
  v13[4] = &state;
  [v10 valuesForPaths:v6 inContextsMatching:v7 handler:v13];

  id v11 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v11;
}

- (id)valuesForKeyPaths:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext valuesForKeyPaths:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  os_activity_scope_leave(&v8);

  if ([v4 count])
  {
    id v6 = [(_CDClientContext *)self valuesForKeyPaths:v4 synchronous:1 responseQueue:0 withCompletion:0];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (void)valuesForKeyPaths:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext valuesForKeyPaths:responseQueue:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  uint64_t v12 = [v8 count];
  if (v10 && v12)
  {
    id v13 = [(_CDClientContext *)self valuesForKeyPaths:v8 synchronous:0 responseQueue:v9 withCompletion:v10];
  }
  else if (v10)
  {
    id v14 = v9;
    if (!v9)
    {
      id v14 = [(_CDClientContext *)self defaultCallbackQueue];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67___CDClientContext_valuesForKeyPaths_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E5609800;
    id v16 = v10;
    dispatch_async(v14, block);
    if (!v9) {
  }
    }
}

- (id)valuesForKeyPaths:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v10);
        }
        [(_CDClientContext *)self logFaultIfDeprecatedKeyPath:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v13);
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Getting values for keypaths: %@", (uint8_t *)&buf, 0xCu);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke;
  v34[3] = &unk_1E5609A80;
  v34[4] = self;
  id v17 = v12;
  id v36 = v17;
  id v18 = v11;
  id v35 = v18;
  id v19 = (void *)MEMORY[0x192FB2040](v34);
  id v20 = [(_CDClientContext *)self currentConnection];
  id v21 = v20;
  if (v8) {
    [v20 synchronousRemoteObjectProxyWithErrorHandler:v19];
  }
  else {
  id v22 = [v20 remoteObjectProxyWithErrorHandler:v19];
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__1;
  id v44 = __Block_byref_object_dispose__1;
  id v45 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_2;
  v28[3] = &unk_1E5609AA8;
  p_long long buf = &buf;
  id v23 = v17;
  id v32 = v23;
  id v24 = v18;
  id v29 = v24;
  id v30 = self;
  id v25 = v10;
  id v31 = v25;
  [v22 valuesForPaths:v25 handler:v28];
  id v26 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v26;
}

- (BOOL)setObject:(id)a3 lastModifiedDate:(id)a4 forContextualKeyPath:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext setObject:lastModifiedDate:forContextualKeyPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v11, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s state = 138412546;
    *(void *)&state[4] = v10;
    *(_WORD *)&state[12] = 2112;
    *(void *)&state[14] = v9;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_INFO, "Setting object at keypath %@ with modified date: %@", state, 0x16u);
  }
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = state;
  *(void *)&state[16] = 0x2020000000;
  char v26 = 0;
  uint64_t v13 = [(_CDClientContext *)self currentConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke;
  v21[3] = &unk_1E5609AD0;
  v21[4] = self;
  id v14 = v8;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  id v16 = v10;
  id v24 = v16;
  id v17 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_159;
  v20[3] = &unk_1E56097D8;
  v20[4] = state;
  [v17 setObject:v14 lastModifiedDate:v15 forContextualKeyPath:v16 handler:v20];

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[_CDClientContext setObject:lastModifiedDate:forContextualKeyPath:]();
  }
  BOOL v18 = *(unsigned char *)(*(void *)&state[8] + 24) != 0;

  _Block_object_dispose(state, 8);
  return v18;
}

- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext activateDevices:remoteUserContextProxySourceDeviceUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Activating devices", (uint8_t *)&state, 2u);
  }
  id v10 = [(_CDClientContext *)self currentConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke;
  v13[3] = &unk_1E5609790;
  v13[4] = self;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v13];
  [v11 activateDevices:v7 remoteUserContextProxySourceDeviceUUID:v6];

  id v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18EC9B000, v12, OS_LOG_TYPE_DEFAULT, "Done activating devices", (uint8_t *)&state, 2u);
  }
}

- (void)deactivateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext deactivateDevices:remoteUserContextProxySourceDeviceUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEFAULT, "Deactivating devices", (uint8_t *)&state, 2u);
  }
  id v10 = [(_CDClientContext *)self currentConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke;
  v13[3] = &unk_1E5609790;
  v13[4] = self;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v13];
  [v11 deactivateDevices:v7 remoteUserContextProxySourceDeviceUUID:v6];

  id v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18EC9B000, v12, OS_LOG_TYPE_DEFAULT, "Done deactivating devices", (uint8_t *)&state, 2u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcEventQueue
{
  return self->_xpcEventQueue;
}

- (void)setXpcEventQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (NSMutableDictionary)keyPathToValues
{
  return self->_keyPathToValues;
}

- (void)setKeyPathToValues:(id)a3
{
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (NSCountedSet)keyPathsWithRegistrationsForAnyChange
{
  return self->_keyPathsWithRegistrationsForAnyChange;
}

- (void)setKeyPathsWithRegistrationsForAnyChange:(id)a3
{
}

- (OS_dispatch_queue)registrationCallbackQueue
{
  return self->_registrationCallbackQueue;
}

- (void)setRegistrationCallbackQueue:(id)a3
{
}

- (NSMutableDictionary)openRegistrationTokens
{
  return self->_openRegistrationTokens;
}

- (void)setOpenRegistrationTokens:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDRemoteUserContextServer)remoteUserContextProxy
{
  return self->_remoteUserContextProxy;
}

- (void)setRemoteUserContextProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUserContextProxy, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_openRegistrationTokens, 0);
  objc_storeStrong((id *)&self->_registrationCallbackQueue, 0);
  objc_storeStrong((id *)&self->_keyPathsWithRegistrationsForAnyChange, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_keyPathToValues, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcEventQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleMDCSEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Ignoring unrecognized message: %s", v2, v3, v4, v5, v6);
}

- (void)handleFetchPropertiesEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18EC9B000, log, OS_LOG_TYPE_ERROR, "Missing delegate, unable to fetch properties", v1, 2u);
}

- (void)handleNotificationEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_18EC9B000, a2, a3, "Failed to parse context value change notification for registration %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)logFaultIfDeprecatedKeyPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_FAULT, "the %@ contextual key path is deprecated and will be removed soon, please contact #help-biome", v1, 0xCu);
}

- (void)objectForContextualKeyPath:synchronous:responseQueue:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18EC9B000, v0, v1, "Uncached value for %@", v2, v3, v4, v5, v6);
}

- (void)handleContextualChange:info:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Unable to find registration for %@", v2, v3, v4, v5, v6);
}

- (void)setObject:lastModifiedDate:forContextualKeyPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18EC9B000, v0, v1, "Done setting object at keypath %@", v2, v3, v4, v5, v6);
}

@end