@interface EKDaemonConnection
+ (EKDaemonConnection)preferredAvailableDaemonConnection;
+ (id)anyAvailableDaemonConnection;
+ (void)addLivingDaemonConnection:(id)a3;
+ (void)setPreferredAvailableDaemonConnection:(id)a3;
- (BOOL)_connectToServer;
- (BOOL)hasAccessToReminders;
- (BOOL)hasEverConnected;
- (BOOL)shouldValidateObjectIDs;
- (CADDatabaseInitializationOptions)initializationOptions;
- (CADInterface)CADOperationProxy;
- (CADInterface)CADOperationProxySync;
- (EKDaemonConnection)initWithConnectionFactory:(id)a3;
- (EKDaemonConnectionDelegate)delegate;
- (id)operationForToken:(unsigned int)a3 respondingToSelector:(SEL)a4 finished:(BOOL)a5;
- (int)databaseRestoreGeneration;
- (int)eventAccessLevel;
- (int64_t)eventAuthorization;
- (int64_t)remindersAuthorization;
- (unsigned)addCancellableRemoteOperation:(id)a3;
- (void)CADClientReceiveDatabaseIntegrityErrors:(id)a3;
- (void)CADClientReceiveDiagnosticsCollectionResults:(id)a3 forToken:(unsigned int)a4 finished:(BOOL)a5;
- (void)CADClientReceiveOccurrenceCacheSearchResults:(id)a3 forSearchToken:(unsigned int)a4 finished:(BOOL)a5;
- (void)_createConnectionAndOperationProxyIfNeeded;
- (void)_daemonRestarted;
- (void)_eventAuthorization:(int64_t *)a3 remindersAuthorization:(int64_t *)a4;
- (void)_finishAllRepliesOnServerDeath;
- (void)cancelRemoteOperation:(unsigned int)a3;
- (void)clearCachedAuthStatus;
- (void)databaseRestoreGenerationChangedByThisClient:(int)a3;
- (void)dealloc;
- (void)disconnect;
- (void)removeCancellableRemoteOperation:(unsigned int)a3;
- (void)setDatabaseRestoreGeneration:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setHasEverConnected:(BOOL)a3;
- (void)setInitializationOptions:(id)a3;
@end

@implementation EKDaemonConnection

- (BOOL)shouldValidateObjectIDs
{
  v2 = self;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  LOBYTE(v2) = v2->_databaseRestoreGenerationHasEverChangedSignificantly;
  os_unfair_lock_unlock(p_internalStateLock);
  return (char)v2;
}

- (void)removeCancellableRemoteOperation:(unsigned int)a3
{
  replyHandlerLock = self->_replyHandlerLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__EKDaemonConnection_removeCancellableRemoteOperation___block_invoke;
  v4[3] = &unk_1E5B96ED0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(replyHandlerLock, v4);
}

- (int64_t)remindersAuthorization
{
  int64_t v3 = 0;
  [(EKDaemonConnection *)self _eventAuthorization:0 remindersAuthorization:&v3];
  return v3;
}

- (int)eventAccessLevel
{
  int64_t v2 = [(EKDaemonConnection *)self eventAuthorization];

  return MEMORY[0x1F410DF08](v2);
}

- (int64_t)eventAuthorization
{
  int64_t v3 = 0;
  [(EKDaemonConnection *)self _eventAuthorization:&v3 remindersAuthorization:0];
  return v3;
}

- (void)_eventAuthorization:(int64_t *)a3 remindersAuthorization:(int64_t *)a4
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  if (self->_accessDetermined)
  {
    if (a3) {
      *a3 = self->_eventAuthorization;
    }
    if (a4) {
      *a4 = self->_remindersAuthorization;
    }
    os_unfair_lock_unlock(p_internalStateLock);
  }
  else
  {
    os_unfair_lock_unlock(p_internalStateLock);
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v8 = [(EKDaemonConnection *)self CADOperationProxySync];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke;
    v9[3] = &unk_1E5B96F48;
    v9[4] = &v10;
    v9[5] = &v18;
    v9[6] = &v14;
    [v8 CADDatabaseGetAccess:v9];

    if (*((unsigned char *)v11 + 24))
    {
      os_unfair_lock_lock(p_internalStateLock);
      self->_accessDetermined = 1;
      self->_eventAuthorization = v19[3];
      self->_remindersAuthorization = v15[3];
      os_unfair_lock_unlock(p_internalStateLock);
      if (a3) {
        *a3 = v19[3];
      }
      if (a4) {
        *a4 = v15[3];
      }
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
}

- (CADInterface)CADOperationProxySync
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  connectionLock = self->_connectionLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__EKDaemonConnection_CADOperationProxySync__block_invoke;
  v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADInterface *)v3;
}

void __55__EKDaemonConnection_removeCancellableRemoteOperation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 56);
  id v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v1 removeObjectForKey:v2];
}

- (BOOL)hasAccessToReminders
{
  return [(EKDaemonConnection *)self remindersAuthorization] == 3;
}

void __32__EKDaemonConnection_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (int)databaseRestoreGeneration
{
  id v2 = self;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  os_unfair_lock_unlock(p_internalStateLock);
  return (int)v2;
}

void __32__EKDaemonConnection_disconnect__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned int v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)dealloc
{
  [(EKDaemonConnection *)self disconnect];
  v3.receiver = self;
  v3.super_class = (Class)EKDaemonConnection;
  [(EKDaemonConnection *)&v3 dealloc];
}

- (void)disconnect
{
  [MEMORY[0x1E4F576F8] removeObserver:self name:*MEMORY[0x1E4F56A50]];
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__EKDaemonConnection_disconnect__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(replyHandlerLock, block);
  connectionLock = self->_connectionLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__EKDaemonConnection_disconnect__block_invoke_2;
  v5[3] = &unk_1E5B96E08;
  v5[4] = self;
  dispatch_sync(connectionLock, v5);
}

void __39__EKDaemonConnection_CADOperationProxy__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createConnectionAndOperationProxyIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  objc_super v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

void __43__EKDaemonConnection_CADOperationProxySync__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createConnectionAndOperationProxyIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  objc_super v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (void)_createConnectionAndOperationProxyIfNeeded
{
  if (!self->_xpcConnection
    && [(EKDaemonConnection *)self _connectToServer]
    && !self->_registeredForStartNote)
  {
    [MEMORY[0x1E4F576F8] addObserver:self selector:sel__daemonRestarted name:*MEMORY[0x1E4F56A50]];
    self->_registeredForStartNote = 1;
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setInitializationOptions:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  connectionLock = self->_connectionLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKDaemonConnection_setInitializationOptions___block_invoke;
  block[3] = &unk_1E5B96E58;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = &v13;
  dispatch_sync(connectionLock, block);
  if (*((unsigned char *)v14 + 24))
  {
    v7 = [(EKDaemonConnection *)self CADOperationProxy];
    initializationOptions = self->_initializationOptions;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__EKDaemonConnection_setInitializationOptions___block_invoke_2;
    v9[3] = &unk_1E5B96E80;
    v9[4] = self;
    [v7 CADDatabaseSetInitializationOptions:initializationOptions reply:v9];
  }
  [(EKDaemonConnection *)self clearCachedAuthStatus];

  _Block_object_dispose(&v13, 8);
}

- (EKDaemonConnection)initWithConnectionFactory:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EKDaemonConnection;
  id v6 = [(EKDaemonConnection *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionFactory, a3);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];

    dispatch_queue_t v10 = dispatch_queue_create(v9, 0);
    connectionLock = v7->_connectionLock;
    v7->_connectionLock = (OS_dispatch_queue *)v10;

    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (const char *)[v12 UTF8String];

    dispatch_queue_t v14 = dispatch_queue_create(v13, 0);
    replyHandlerLock = v7->_replyHandlerLock;
    v7->_replyHandlerLock = (OS_dispatch_queue *)v14;

    v7->_databaseRestoreGeneration = -1;
    v7->_internalStateLock._os_unfair_lock_opaque = 0;
    +[EKDaemonConnection addLivingDaemonConnection:v7];
  }

  return v7;
}

- (void)clearCachedAuthStatus
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  self->_accessDetermined = 0;

  os_unfair_lock_unlock(p_internalStateLock);
}

- (BOOL)_connectToServer
{
  if (!self->_xpcConnection && !self->_wasAbortedDueToExcessiveConnections)
  {
    objc_initWeak(&location, self);
    connectionFactory = self->_connectionFactory;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__EKDaemonConnection__connectToServer__block_invoke;
    v16[3] = &unk_1E5B96DE0;
    objc_copyWeak(&v17, &location);
    id v4 = [(EKXPCConnectionFactory *)connectionFactory tryNewConnectionWithExportedObject:self interruptionHandler:v16];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v4;

    id v6 = [(EKDaemonConnection *)self initializationOptions];
    v7 = v6;
    if (self->_xpcConnection)
    {
      id v8 = (CADInterface *)[objc_alloc(MEMORY[0x1E4F56A28]) initWithXPCConnection:self->_xpcConnection protocol:&unk_1EF98DFF8 synchronous:0];
      remoteOperationProxy = self->_remoteOperationProxy;
      self->_remoteOperationProxy = v8;

      dispatch_queue_t v10 = (CADInterface *)[objc_alloc(MEMORY[0x1E4F56A28]) initWithXPCConnection:self->_xpcConnection protocol:&unk_1EF98DFF8 synchronous:1];
      syncRemoteOperationProxy = self->_syncRemoteOperationProxy;
      self->_syncRemoteOperationProxy = v10;

      [(CADInterface *)self->_remoteOperationProxy setDelegate:self];
      [(CADInterface *)self->_syncRemoteOperationProxy setDelegate:self];
      [(CADInterface *)self->_remoteOperationProxy setInitializationOptions:v7];
      [(CADInterface *)self->_syncRemoteOperationProxy setInitializationOptions:v7];
      [(CADXPCConnection *)self->_xpcConnection resume];
    }
    else
    {
      self->_wasAbortedDueToExcessiveConnections = 1;
      if ([v6 unitTesting]) {
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      }
      else {
        os_log_type_t v12 = OS_LOG_TYPE_FAULT;
      }
      uint64_t v13 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, v12))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1A4E47000, v13, v12, "Client tried to open too many connections to calaccessd. Refusing to open another", v15, 2u);
      }
    }
    [(EKDaemonConnection *)self setHasEverConnected:1];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return 1;
}

- (void)setHasEverConnected:(BOOL)a3
{
  self->_hasEverConnected = a3;
}

- (CADDatabaseInitializationOptions)initializationOptions
{
  return self->_initializationOptions;
}

+ (void)addLivingDaemonConnection:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
  objc_super v3 = (void *)storedWeakReferenceDaemonConnection;
  if (!storedWeakReferenceDaemonConnection)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    id v5 = (void *)storedWeakReferenceDaemonConnection;
    storedWeakReferenceDaemonConnection = v4;

    objc_super v3 = (void *)storedWeakReferenceDaemonConnection;
  }
  [v3 addObject:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);
}

- (unsigned)addCancellableRemoteOperation:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  os_log_type_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKDaemonConnection_addCancellableRemoteOperation___block_invoke;
  block[3] = &unk_1E5B96EA8;
  id v9 = v4;
  dispatch_queue_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(replyHandlerLock, block);
  LODWORD(replyHandlerLock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return replyHandlerLock;
}

void __47__EKDaemonConnection_setInitializationOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 40));
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 32) setInitializationOptions:*(void *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 40);
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 40);
    [v3 setInitializationOptions:v2];
  }
}

- (CADInterface)CADOperationProxy
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  dispatch_queue_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  connectionLock = self->_connectionLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EKDaemonConnection_CADOperationProxy__block_invoke;
  v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(connectionLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADInterface *)v3;
}

- (void)setDatabaseRestoreGeneration:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  int databaseRestoreGeneration = self->_databaseRestoreGeneration;
  if (databaseRestoreGeneration == -1 || databaseRestoreGeneration == v3)
  {
    self->_int databaseRestoreGeneration = v3;
    os_unfair_lock_unlock(p_internalStateLock);
  }
  else
  {
    self->_databaseRestoreGenerationHasEverChangedSignificantly = 1;
    self->_int databaseRestoreGeneration = v3;
    os_unfair_lock_unlock(p_internalStateLock);
    id v8 = [(EKDaemonConnection *)self delegate];
    [v8 databaseRestoreGenerationChangedExternally:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancellableOperations, 0);
  objc_storeStrong((id *)&self->_replyHandlerLock, 0);
  objc_storeStrong((id *)&self->_syncRemoteOperationProxy, 0);
  objc_storeStrong((id *)&self->_remoteOperationProxy, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_connectionFactory, 0);
}

void __52__EKDaemonConnection_addCancellableRemoteOperation___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 56))
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = a1[4];
  }
  int v6 = *(_DWORD *)(v2 + 64);
  *(_DWORD *)(v2 + 64) = v6 + 1;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v6;
  uint64_t v7 = a1[5];
  id v8 = *(void **)(a1[4] + 56);
  id v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
  [v8 setObject:v7 forKey:v9];
}

+ (id)anyAvailableDaemonConnection
{
  uint64_t v2 = [a1 preferredAvailableDaemonConnection];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
    id v4 = [(id)storedWeakReferenceDaemonConnection anyObject];
    os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);
  }

  return v4;
}

+ (EKDaemonConnection)preferredAvailableDaemonConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
  id WeakRetained = objc_loadWeakRetained(&_preferredAvailableDaemonConnection);
  os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);

  return (EKDaemonConnection *)WeakRetained;
}

void __38__EKDaemonConnection__connectToServer__block_invoke(uint64_t a1)
{
  uint64_t v2 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __38__EKDaemonConnection__connectToServer__block_invoke_cold_1(v2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _finishAllRepliesOnServerDeath];
  }
}

+ (void)setPreferredAvailableDaemonConnection:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
  objc_storeWeak(&_preferredAvailableDaemonConnection, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);
}

- (void)_daemonRestarted
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained daemonRestarted];
    id WeakRetained = v3;
  }
}

void __47__EKDaemonConnection_setInitializationOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKDaemonConnection_setInitializationOptions___block_invoke_2_cold_1(v3, a2);
    }
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "setDatabaseRestoreGeneration:");
  }
}

- (void)databaseRestoreGenerationChangedByThisClient:(int)a3
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  self->_int databaseRestoreGeneration = a3;
  self->_databaseRestoreGenerationHasEverChangedSignificantly = 1;

  os_unfair_lock_unlock(p_internalStateLock);
}

- (void)cancelRemoteOperation:(unsigned int)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  dispatch_queue_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EKDaemonConnection_cancelRemoteOperation___block_invoke;
  block[3] = &unk_1E5B96EF8;
  block[4] = self;
  void block[5] = &v6;
  unsigned int v5 = a3;
  dispatch_sync(replyHandlerLock, block);
  [(id)v7[5] cancel];
  _Block_object_dispose(&v6, 8);
}

void __44__EKDaemonConnection_cancelRemoteOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 56);
  id v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v7 removeObjectForKey:v8];
}

- (void)_finishAllRepliesOnServerDeath
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke;
  block[3] = &unk_1E5B96F20;
  block[4] = self;
  void block[5] = &v5;
  dispatch_sync(replyHandlerLock, block);
  if ([(id)v6[5] count])
  {
    if (_finishAllRepliesOnServerDeath_onceToken != -1) {
      dispatch_once(&_finishAllRepliesOnServerDeath_onceToken, &__block_literal_global_8);
    }
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v5;
    dispatch_async((dispatch_queue_t)_finishAllRepliesOnServerDeath_disconnectionQueue, v3);
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v5 removeAllObjects];
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_2()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("EventKitClientDisconnectionQ", v2);
  uint64_t v1 = (void *)_finishAllRepliesOnServerDeath_disconnectionQueue;
  _finishAllRepliesOnServerDeath_disconnectionQueue = (uint64_t)v0;
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_2(a1, v2);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v8 disconnected];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v9 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_1(v9);
  }
}

- (id)operationForToken:(unsigned int)a3 respondingToSelector:(SEL)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__EKDaemonConnection_operationForToken_respondingToSelector_finished___block_invoke;
  block[3] = &unk_1E5B96EF8;
  block[4] = self;
  void block[5] = &v14;
  unsigned int v13 = a3;
  dispatch_sync(replyHandlerLock, block);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v9 = (void *)v15[5];
    v15[5] = 0;
  }
  if (v5) {
    [(EKDaemonConnection *)self removeCancellableRemoteOperation:v6];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __70__EKDaemonConnection_operationForToken_respondingToSelector_finished___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)CADClientReceiveOccurrenceCacheSearchResults:(id)a3 forSearchToken:(unsigned int)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = [(EKDaemonConnection *)self operationForToken:v6 respondingToSelector:sel_receivedBatchResultsFromServer_finished_ finished:v5];
  [v9 receivedBatchResultsFromServer:v8 finished:v5];
}

- (void)CADClientReceiveDiagnosticsCollectionResults:(id)a3 forToken:(unsigned int)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = [(EKDaemonConnection *)self operationForToken:v6 respondingToSelector:sel_receivedBatchResultsFromServer_finished_ finished:v5];
  [v9 receivedBatchResultsFromServer:v8 finished:v5];
}

- (void)CADClientReceiveDatabaseIntegrityErrors:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKDaemonConnection CADClientReceiveDatabaseIntegrityErrors:]((uint64_t)v4, v5);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = @"integrityErrors";
    v10[0] = v4;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v7 postNotificationName:@"EKEventStoreIntegrityErrorsFoundNotification" object:WeakRetained userInfo:v8];
  }
}

void __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2 == 0;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
  id v4 = EKLogHandle;
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 24);
      v9[0] = 67109376;
      v9[1] = v6;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_INFO, "Loaded access. eventAuth = %d, remindersAuth = %d", (uint8_t *)v9, 0xEu);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke_cold_1(v4, a2);
  }
}

- (EKDaemonConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDaemonConnectionDelegate *)WeakRetained;
}

- (BOOL)hasEverConnected
{
  return self->_hasEverConnected;
}

void __38__EKDaemonConnection__connectToServer__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Connection interrupted!", v1, 2u);
}

void __47__EKDaemonConnection_setInitializationOptions___block_invoke_2_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  BOOL v5 = [v3 errorWithCADResult:a2];
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Error setting initialization options: %@", v8, v9, v10, v11, 2u);
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Finished notifying asynchronous operations about the dropped XPC connection", v1, 2u);
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_2(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = a2;
  v4[0] = 67109120;
  v4[1] = [v2 count];
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Notifying %d asynchronous operations about the dropped XPC connection", (uint8_t *)v4, 8u);
}

- (void)CADClientReceiveDatabaseIntegrityErrors:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Detected database integrity errors: %@", (uint8_t *)&v2, 0xCu);
}

void __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  uint64_t v5 = [v3 errorWithCADResult:a2];
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Error loading access: %@", v8, v9, v10, v11, 2u);
}

@end