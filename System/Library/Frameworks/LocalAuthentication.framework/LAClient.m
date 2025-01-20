@interface LAClient
+ (id)_queue;
+ (id)createConnection:(const unsigned int *)a3 legacyService:(BOOL)a4;
+ (void)_performInvalidationBlocks:(id)a3;
- (BOOL)_setPermanentError:(id)a3;
- (BOOL)setServerPropertyForOption:(int64_t)a3 value:(id)a4 error:(id *)a5;
- (BOOL)shouldRecoverConnection;
- (BOOL)willRetryOnInterruptedConnection;
- (LACachedExternalizedContext)cachedExternalizedContext;
- (LAClient)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4 context:(id)a5;
- (LAClient)initWithUUID:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 context:(id)a6;
- (LAContext)context;
- (LAContextXPC)remoteContext;
- (LAContextXPC)synchronousRemoteContext;
- (LAUIDelegate)uiDelegate;
- (NSData)existingContext;
- (NSData)externalizedContext;
- (NSError)permanentError;
- (NSMutableArray)invalidations;
- (NSNumber)userSession;
- (NSString)proxyId;
- (NSUUID)uuid;
- (NSXPCConnection)serverConnection;
- (id)_updateOptions:(id)a3;
- (id)serverPropertyForOption:(int64_t)a3 error:(id *)a4;
- (id)synchronousExternalizedContextWithError:(id *)a3;
- (void)_checkIdResultForTCC:(id)a3 synchronous:(BOOL)a4 error:(id)a5 retryBlock:(id)a6 finally:(id)a7;
- (void)_connectToServerWithRecovery:(BOOL)a3 userSession:(const unsigned int *)a4 legacyService:(BOOL)a5;
- (void)_handleConnectionResult:(id)a3 uuid:(id)a4 proxyId:(id)a5 error:(id)a6;
- (void)_invalidateCachedExternalizedContextWithError:(id)a3;
- (void)_performCallBool:(id)a3 finally:(id)a4;
- (void)_performCallId:(id)a3 finally:(id)a4;
- (void)_performSynchronous:(BOOL)a3 callBool:(id)a4 finally:(id)a5;
- (void)_performSynchronous:(BOOL)a3 callId:(id)a4 finally:(id)a5;
- (void)_recoverConnectionIfNeeded;
- (void)_scheduleRecovery;
- (void)_serializedInvalidateWithMessage:(id)a3;
- (void)_synchronousRemoteObjectProxy:(const unsigned int *)a3 performCall:(id)a4;
- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5;
- (void)authMethodWithReply:(id)a3;
- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4;
- (void)credentialOfType:(int64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 reply:(id)a6;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 synchronous:(BOOL)a7 reply:(id)a8;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 synchronous:(BOOL)a6 reply:(id)a7;
- (void)externalizedContext;
- (void)externalizedContextWithReply:(id)a3;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4;
- (void)getDomainStateWithOptions:(id)a3 synchronous:(BOOL)a4 reply:(id)a5;
- (void)invalidateWithMessage:(id)a3;
- (void)invalidateWithReply:(id)a3;
- (void)invalidatedWithError:(id)a3;
- (void)isCredentialSet:(int64_t)a3 reply:(id)a4;
- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)prearmTouchIdWithReply:(id)a3;
- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)resetWithReply:(id)a3;
- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4;
- (void)setCachedExternalizedContext:(id)a3;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)setExistingContext:(id)a3;
- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5;
- (void)setPermanentError:(id)a3;
- (void)setProxyId:(id)a3;
- (void)setRemoteContext:(id)a3;
- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setShouldRecoverConnection:(BOOL)a3;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5;
- (void)setUiDelegate:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWillRetryOnInterruptedConnection:(BOOL)a3;
- (void)tokenForTransferToUnknownProcess:(id)a3;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation LAClient

uint64_t __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:a2 uuid:a3 proxyId:a4 error:a5];
}

void __18__LAClient__queue__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F72F38];
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 createDefaultQueueWithIdentifier:@"la_client" concurrencyAttribute:v3];
  v2 = (void *)_queue_queue;
  _queue_queue = v1;
}

- (void)invalidateWithMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[LAClient _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__LAClient_invalidateWithMessage___block_invoke;
  block[3] = &unk_1E63C4980;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __34__LAClient_invalidateWithMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _serializedInvalidateWithMessage:*(void *)(a1 + 32)];
}

- (void)_serializedInvalidateWithMessage:(id)a3
{
  serverConnection = self->_serverConnection;
  id v5 = a3;
  [(NSXPCConnection *)serverConnection invalidate];
  id v6 = self->_serverConnection;
  self->_serverConnection = 0;

  v7 = [MEMORY[0x1E4F30B90] errorWithCode:-9 message:v5];

  [(LAClient *)self _setPermanentError:v7];
  id v8 = [MEMORY[0x1E4F30B90] errorWithCode:-10 message:@"Invalid context."];
  [(LAClient *)self setPermanentError:v8];
}

uint64_t __19__LAClient_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 40);

  return +[LAClient _performInvalidationBlocks:v2];
}

- (void)dealloc
{
  id v3 = [(LAClient *)self serverConnection];
  id v4 = [(LAClient *)self invalidations];
  id v5 = +[LAClient _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__LAClient_dealloc__block_invoke;
  block[3] = &unk_1E63C4868;
  id v10 = v3;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)LAClient;
  [(LAClient *)&v8 dealloc];
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_3;
  v9[3] = &unk_1E63C4B60;
  uint64_t v8 = *(void *)(a1 + 64);
  v9[4] = v6;
  uint64_t v12 = v8;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v6 _checkIdResultForTCC:a2 synchronous:v7 error:a3 retryBlock:v9 finally:*(void *)(a1 + 56)];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_existingContext, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_cachedExternalizedContext, 0);
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_synchronousRemoteContext, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_permanentError, 0);
  objc_storeStrong((id *)&self->_proxyId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_destroyWeak((id *)&self->_uiDelegate);
}

- (LAClient)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)LAClient;
  id v11 = [(LAClient *)&v24 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_existingContext, a3);
    objc_storeWeak((id *)&v12->_context, v10);
    id v13 = objc_alloc(MEMORY[0x1E4F30B88]);
    if (v9) {
      uint64_t v14 = [v13 initWithExternalizedContext:v9];
    }
    else {
      uint64_t v14 = [v13 initWithExternalizationDelegate:v12];
    }
    cachedExternalizedContext = v12->_cachedExternalizedContext;
    v12->_cachedExternalizedContext = (LACachedExternalizedContext *)v14;

    uint64_t v16 = objc_opt_new();
    invalidations = v12->_invalidations;
    v12->_invalidations = (NSMutableArray *)v16;

    if (a4)
    {
      uint64_t v18 = [NSNumber numberWithUnsignedInt:*a4];
      userSession = v12->_userSession;
      v12->_userSession = (NSNumber *)v18;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke;
    v21[3] = &unk_1E63C47F0;
    id v22 = v9;
    v23 = v12;
    [(LAClient *)v23 _synchronousRemoteObjectProxy:a4 performCall:v21];
  }
  return v12;
}

- (BOOL)_setPermanentError:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F30B90] error:v4 hasCode:-9] & 1) == 0)
  {
    id v5 = LALogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LAClient _setPermanentError:](self);
    }
  }
  id v6 = [(LAClient *)self permanentError];

  if (!v6)
  {
    uint64_t v7 = [(LAClient *)self cachedExternalizedContext];
    uint64_t v8 = [v7 cachedExternalizedContext];
    [(LAClient *)self setExistingContext:v8];

    [(LAClient *)self _invalidateCachedExternalizedContextWithError:v4];
    [(LAClient *)self setRemoteContext:0];
    [(LAClient *)self setPermanentError:v4];
    id v9 = self;
    objc_sync_enter(v9);
    id v10 = [(LAClient *)v9 invalidations];
    +[LAClient _performInvalidationBlocks:v10];

    objc_sync_exit(v9);
  }

  return v6 == 0;
}

- (void)_handleConnectionResult:(id)a3 uuid:(id)a4 proxyId:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    uint64_t v14 = LALogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[LAClient _handleConnectionResult:uuid:proxyId:error:](self);
    }

    [(LAClient *)self _invalidateCachedExternalizedContextWithError:v13];
  }
  [(LAClient *)self setRemoteContext:v10];
  [(LAClient *)self setUuid:v11];
  [(LAClient *)self setProxyId:v12];
  [(LAClient *)self setPermanentError:v13];
}

- (void)setPermanentError:(id)a3
{
}

- (void)setRemoteContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_remoteContext, a3);
  if (v5)
  {
    id v6 = [(LAClient *)self remoteContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__LAClient_setRemoteContext___block_invoke;
    v10[3] = &unk_1E63C48E0;
    v10[4] = self;
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];
    synchronousRemoteContext = self->_synchronousRemoteContext;
    self->_synchronousRemoteContext = v7;
  }
  else
  {
    id v9 = self->_synchronousRemoteContext;
    self->_synchronousRemoteContext = 0;
  }
}

- (void)setUuid:(id)a3
{
}

- (void)setProxyId:(id)a3
{
}

- (LAContextXPC)remoteContext
{
  return self->_remoteContext;
}

+ (void)_performInvalidationBlocks:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invoke];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [v3 removeAllObjects];
}

- (LACachedExternalizedContext)cachedExternalizedContext
{
  return (LACachedExternalizedContext *)objc_getProperty(self, a2, 80, 1);
}

void __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 instanceId];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke_2;
  v8[3] = &unk_1E63C47C8;
  id v9 = *(id *)(a1 + 40);
  [v5 connectToExistingContext:v3 callback:v4 clientId:v7 reply:v8];
}

- (void)_checkIdResultForTCC:(id)a3 synchronous:(BOOL)a4 error:(id)a5 retryBlock:(id)a6 finally:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, id))a6;
  v15 = (void (**)(id, id, id))a7;
  uint64_t v16 = [(LAClient *)self context];
  v17 = [v16 description];

  if (v12
    || ![MEMORY[0x1E4F30B90] error:v13 hasCode:-1018]
    || ([v13 userInfo],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        [v18 objectForKeyedSubscript:@"TCCServerPrompt"],
        v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 BOOLValue],
        v19,
        v18,
        (v20 & 1) != 0))
  {
    v15[2](v15, v12, v13);
  }
  else
  {
    v21 = [v13 userInfo];
    id v22 = [v21 objectForKeyedSubscript:@"TCCService"];

    if (v10)
    {
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      id v30 = v17;
      id v31 = v22;
      objc_super v24 = v23;
      TCCAccessRequest();
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v33 + 24)) {
        v14[2](v14, v15);
      }
      else {
        v15[2](v15, 0, v13);
      }

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      v25 = v17;
      id v26 = v22;
      v28 = v14;
      v29 = v15;
      id v27 = v13;
      TCCAccessRequest();

      objc_super v24 = v25;
    }
  }
}

- (LAContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (LAContext *)WeakRetained;
}

void __47__LAClient__performSynchronous_callId_finally___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) _recoverConnectionIfNeeded];
  objc_sync_exit(v2);

  uint64_t v3 = [*(id *)(a1 + 32) permanentError];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) permanentError];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v12);
  }
  else
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_2;
    v18[3] = &unk_1E63C4A20;
    char v20 = v21;
    id v5 = *(id *)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v5;
    uint64_t v6 = (void *)MEMORY[0x1C189BE50](v18);
    uint64_t v7 = [[Invalidation alloc] initWithBlock:v6];
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    id v9 = [*(id *)(a1 + 32) invalidations];
    [v9 addObject:v7];

    objc_sync_exit(v8);
    uint64_t v10 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_3;
    v13[3] = &unk_1E63C4A70;
    v13[4] = *(void *)(a1 + 32);
    long long v11 = v7;
    uint64_t v14 = v11;
    uint64_t v16 = v21;
    char v17 = *(unsigned char *)(a1 + 56);
    id v15 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

    _Block_object_dispose(v21, 8);
  }
}

- (NSError)permanentError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

void __47__LAClient__performSynchronous_callId_finally___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  id v8 = [*(id *)(a1 + 32) invalidations];
  [v8 removeObject:*(void *)(a1 + 40)];

  objc_sync_exit(v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v9 + 24))
  {
    *(unsigned char *)(v9 + 24) = 1;
    if (*(unsigned char *)(a1 + 64))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v10 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_4;
      block[3] = &unk_1E63C4A48;
      id v14 = *(id *)(a1 + 48);
      id v12 = v5;
      id v13 = v6;
      dispatch_async(v10, block);
    }
  }
}

- (NSMutableArray)invalidations
{
  return self->_invalidations;
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) synchronousRemoteContext];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_2;
  v10[3] = &unk_1E63C4B88;
  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 64);
  v10[4] = v8;
  uint64_t v14 = v5;
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v13 = v3;
  id v9 = v3;
  [v4 evaluatePolicy:v5 options:v11 uiDelegate:v6 reply:v10];
}

- (LAUIDelegate)uiDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);

  return (LAUIDelegate *)WeakRetained;
}

- (NSString)proxyId
{
  return self->_proxyId;
}

- (LAContextXPC)synchronousRemoteContext
{
  return self->_synchronousRemoteContext;
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 synchronous:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = [(LAClient *)self _updateOptions:a4];
  char v15 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v16 = [MEMORY[0x1E4F30BA8] checkOptions:v14];
  [v15 raiseExceptionOnError:v16];

  char v17 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v18 = [MEMORY[0x1E4F30BA8] checkPolicy:a3];
  [v17 raiseExceptionOnError:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke;
  void v21[3] = &unk_1E63C4BB0;
  void v21[4] = self;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a3;
  BOOL v25 = v8;
  id v19 = v12;
  id v20 = v14;
  [(LAClient *)self _performSynchronous:v8 callId:v21 finally:v13];
}

- (id)_updateOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:&unk_1F19EC730];
  uint64_t v5 = v3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
    uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    [v5 setObject:v6 forKey:&unk_1F19EC730];
  }

  return v5;
}

- (void)_recoverConnectionIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(LAClient *)self shouldRecoverConnection])
  {
    [(LAClient *)self setShouldRecoverConnection:0];
    id v3 = LALogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(LAClient *)self context];
      *(_DWORD *)buf = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is recovering connection to server", buf, 0xCu);
    }
    uint64_t v5 = [(LAClient *)self userSession];
    int v6 = [v5 unsignedIntValue];

    *(_DWORD *)buf = v6;
    id v7 = [(LAClient *)self userSession];
    if (v7) {
      BOOL v8 = buf;
    }
    else {
      BOOL v8 = 0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__LAClient__recoverConnectionIfNeeded__block_invoke;
    v9[3] = &unk_1E63C4908;
    v9[4] = self;
    [(LAClient *)self _synchronousRemoteObjectProxy:v8 performCall:v9];
  }
}

- (BOOL)shouldRecoverConnection
{
  return self->_shouldRecoverConnection;
}

- (void)_synchronousRemoteObjectProxy:(const unsigned int *)a3 performCall:(id)a4
{
  int v6 = (void (**)(id, void *))a4;
  [(LAClient *)self setWillRetryOnInterruptedConnection:1];
  [(LAClient *)self _connectToServerWithRecovery:1 userSession:a3 legacyService:0];
  id v7 = [(LAClient *)self serverConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke;
  void v21[3] = &unk_1E63C48E0;
  void v21[4] = self;
  BOOL v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];

  v6[2](v6, v8);
  id v9 = [(NSError *)self->_permanentError domain];
  uint64_t v10 = *MEMORY[0x1E4F281F8];
  if ([v9 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    NSInteger v11 = [(NSError *)self->_permanentError code];

    if (v11 == 4097)
    {
      uint64_t v12 = LALogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LAClient _synchronousRemoteObjectProxy:performCall:](v12);
      }

      [(LAClient *)self _connectToServerWithRecovery:1 userSession:a3 legacyService:0];
      id v13 = [(LAClient *)self serverConnection];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_95;
      v20[3] = &unk_1E63C48E0;
      v20[4] = self;
      uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];

      v6[2](v6, v14);
    }
  }
  else
  {
  }
  [(LAClient *)self setWillRetryOnInterruptedConnection:0];
  char v15 = [(NSError *)self->_permanentError domain];
  if ([v15 isEqualToString:v10])
  {
    NSInteger v16 = [(NSError *)self->_permanentError code];

    if (v16 == 4099)
    {
      [(LAClient *)self _connectToServerWithRecovery:1 userSession:a3 legacyService:1];
      char v17 = [(LAClient *)self serverConnection];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_2;
      v19[3] = &unk_1E63C48E0;
      v19[4] = self;
      uint64_t v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v19];

      v6[2](v6, (void *)v18);
      BOOL v8 = (void *)v18;
    }
  }
  else
  {
  }
}

- (void)setWillRetryOnInterruptedConnection:(BOOL)a3
{
  self->_willRetryOnInterruptedConnection = a3;
}

- (void)_connectToServerWithRecovery:(BOOL)a3 userSession:(const unsigned int *)a4 legacyService:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = LALogForCategory();
  uint64_t v10 = +[LAClient createConnection:a4 legacyService:v5];
  serverConnection = self->_serverConnection;
  self->_serverConnection = v10;

  uint64_t v12 = [MEMORY[0x1E4F30BA0] interfaceWithInternalProtocol:&unk_1F19F6298];
  id v13 = [(LAClient *)self serverConnection];
  [v13 setRemoteObjectInterface:v12];

  uint64_t v14 = [(LAClient *)self serverConnection];
  char v15 = +[LAClient _queue];
  [v14 _setQueue:v15];

  if (a4 && *a4)
  {
    -[NSXPCConnection _setTargetUserIdentifier:](self->_serverConnection, "_setTargetUserIdentifier:");
    NSInteger v16 = v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      char v17 = [(LAClient *)self context];
      unsigned int v18 = *a4;
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      __int16 v29 = 1024;
      unsigned int v30 = v18;
      _os_log_impl(&dword_1BED06000, v16, OS_LOG_TYPE_INFO, "%{public}@ target uid: %u", buf, 0x12u);
    }
  }
  objc_initWeak((id *)buf, self);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v19 = v9;
  id v23 = v19;
  objc_copyWeak(&v25, (id *)buf);
  BOOL v26 = a3;
  int64_t v24 = self;
  id v20 = [(LAClient *)self serverConnection];
  [v20 setInterruptionHandler:&v22];

  v21 = [(LAClient *)self serverConnection];
  [v21 resume];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)_performSynchronous:(BOOL)a3 callId:(id)a4 finally:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  char v17 = __47__LAClient__performSynchronous_callId_finally___block_invoke;
  unsigned int v18 = &unk_1E63C4A98;
  id v19 = self;
  id v10 = v9;
  id v20 = v10;
  id v11 = v8;
  id v21 = v11;
  BOOL v22 = v6;
  uint64_t v12 = (void *)MEMORY[0x1C189BE50](&v15);
  id v13 = +[LAClient _queue];
  uint64_t v14 = v13;
  if (v6) {
    dispatch_sync(v13, v12);
  }
  else {
    dispatch_async(v13, v12);
  }
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)_queue_queue;

  return v2;
}

+ (id)createConnection:(const unsigned int *)a3 legacyService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v6 = LALogForCategory();
  id v7 = @"com.apple.CoreAuthentication.daemon";
  if (v4) {
    id v7 = @"com.apple.CoreAuthentication.daemon.libxpc";
  }
  id v8 = v7;
  if (xpc_user_sessions_enabled()) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 4096;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v8 options:v9];
  if (xpc_user_sessions_enabled())
  {
    *(_DWORD *)char v17 = 0;
    uint64_t foreground_uid = xpc_user_sessions_get_foreground_uid();
    uint64_t v12 = objc_msgSend(v10, "_xpcConnection", *(void *)v17);
    xpc_connection_set_target_user_session_uid();

    id v13 = v6;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[LAClient createConnection:legacyService:](foreground_uid, v13);
    }
  }
  uint64_t v14 = v6;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      uint64_t v15 = [NSNumber numberWithUnsignedInt:*a3];
    }
    else
    {
      uint64_t v15 = 0;
    }
    *(_DWORD *)char v17 = 138543874;
    *(void *)&v17[4] = v8;
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 2114;
    id v21 = v15;
    _os_log_impl(&dword_1BED06000, v14, OS_LOG_TYPE_INFO, "Connecting to %{public}@, flags:%x, uid:%{public}@", v17, 0x1Cu);
    if (a3) {
  }
    }

  return v10;
}

- (void)setExistingContext:(id)a3
{
}

- (void)_invalidateCachedExternalizedContextWithError:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v5 = [v7 code] == 4099;
  }
  else {
    BOOL v5 = 0;
  }

  BOOL v6 = [(LAClient *)self cachedExternalizedContext];
  [v6 invalidateBecauseOfInvalidConnection:v5];
}

- (LAClient)initWithUUID:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)LAClient;
  uint64_t v15 = [(LAClient *)&v26 init];
  if (v15)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F30B88]) initWithExternalizationDelegate:v15];
    cachedExternalizedContext = v15->_cachedExternalizedContext;
    v15->_cachedExternalizedContext = (LACachedExternalizedContext *)v16;

    uint64_t v18 = objc_opt_new();
    invalidations = v15->_invalidations;
    v15->_invalidations = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeWeak((id *)&v15->_context, v14);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke;
    void v21[3] = &unk_1E63C4840;
    id v22 = v11;
    id v23 = v15;
    id v24 = v12;
    id v25 = v13;
    [(LAClient *)v23 _synchronousRemoteObjectProxy:0 performCall:v21];
  }
  return v15;
}

void __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  id v5 = a2;
  BOOL v6 = [v4 context];
  uint64_t v7 = [v6 instanceId];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke_2;
  v10[3] = &unk_1E63C4818;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  [v5 connectToContextWithUUID:v3 callback:v4 clientId:v7 token:v8 senderAuditTokenData:v9 reply:v10];
}

uint64_t __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:a2 uuid:*(void *)(a1 + 40) proxyId:a3 error:a4];
}

void __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v5 = [WeakRetained context];
    int v6 = *(unsigned __int8 *)(a1 + 56);
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    id v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = [v7 willRetryOnInterruptedConnection];
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_INFO, "%{public}@ connection to server interrupted (recovery: %d, willRetry: %d)", buf, 0x18u);
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (([*(id *)(a1 + 40) willRetryOnInterruptedConnection] & 1) == 0)
    {
      uint64_t v8 = +[LAClient _queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke_93;
      block[3] = &unk_1E63C4890;
      objc_copyWeak(&v10, (id *)(a1 + 48));
      dispatch_async(v8, block);

      objc_destroyWeak(&v10);
    }
  }
}

void __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke_93(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleRecovery];
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:0 uuid:0 proxyId:0 error:a2];
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_95(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:0 uuid:0 proxyId:0 error:a2];
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:0 uuid:0 proxyId:0 error:a2];
}

void __29__LAClient_setRemoteContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = LALogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __29__LAClient_setRemoteContext___block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 32) _scheduleRecovery];
}

- (void)_scheduleRecovery
{
  id v3 = [MEMORY[0x1E4F30B90] errorWithCode:-10 message:@"Lost connection to coreauthd."];
  BOOL v4 = [(LAClient *)self _setPermanentError:v3];

  if (v4)
  {
    [(LAClient *)self setShouldRecoverConnection:1];
  }
}

void __38__LAClient__recoverConnectionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 existingContext];
  int v6 = *(void **)(a1 + 32);
  id v7 = [v6 context];
  unsigned int v8 = [v7 instanceId];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__LAClient__recoverConnectionIfNeeded__block_invoke_2;
  v9[3] = &unk_1E63C47C8;
  v9[4] = *(void *)(a1 + 32);
  [v4 connectToExistingContext:v5 callback:v6 clientId:v8 reply:v9];
}

uint64_t __38__LAClient__recoverConnectionIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:a2 uuid:a3 proxyId:a4 error:a5];
}

- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__LAClient_allowTransferToProcess_receiverAuditTokenData_reply___block_invoke;
  v10[3] = &unk_1E63C4930;
  int v12 = a3;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(LAClient *)self _performCallBool:v10 finally:a5];
}

void __64__LAClient_allowTransferToProcess_receiverAuditTokenData_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 allowTransferToProcess:*(unsigned int *)(a1 + 48) receiverAuditTokenData:*(void *)(a1 + 40) reply:v4];
}

- (void)tokenForTransferToUnknownProcess:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__LAClient_tokenForTransferToUnknownProcess___block_invoke;
  v3[3] = &unk_1E63C4958;
  v3[4] = self;
  [(LAClient *)self _performCallId:v3 finally:a3];
}

void __45__LAClient_tokenForTransferToUnknownProcess___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 synchronousRemoteContext];
  [v4 tokenForTransferToUnknownProcess:v3];
}

- (void)invalidatedWithError:(id)a3
{
  id v4 = a3;
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LAClient invalidatedWithError:](self);
  }

  int v6 = +[LAClient _queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__LAClient_invalidatedWithError___block_invoke;
  v8[3] = &unk_1E63C4868;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __33__LAClient_invalidatedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPermanentError:*(void *)(a1 + 40)];
}

- (void)invalidateWithReply:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__LAClient_invalidateWithReply___block_invoke;
  v3[3] = &unk_1E63C49A8;
  v3[4] = self;
  [(LAClient *)self _performCallBool:v3 finally:a3];
}

uint64_t __32__LAClient_invalidateWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 invalidateWithReply:v4];

  int v6 = *(void **)(a1 + 32);

  return [v6 _serializedInvalidateWithMessage:@"invalidate called"];
}

intptr_t __70__LAClient__checkIdResultForTCC_synchronous_error_retryBlock_finally___block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = LALogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_1BED06000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TCC access request for %@ returned %d", (uint8_t *)&v8, 0x1Cu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __70__LAClient__checkIdResultForTCC_synchronous_error_retryBlock_finally___block_invoke_109(void *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = LALogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_1BED06000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TCC access request for %@ returned %d", (uint8_t *)&v8, 0x1Cu);
  }

  if (a2) {
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(a1[8] + 16))();
  }
}

- (void)_performCallId:(id)a3 finally:(id)a4
{
}

- (void)_performCallBool:(id)a3 finally:(id)a4
{
}

void __47__LAClient__performSynchronous_callId_finally___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) permanentError];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
  }
}

uint64_t __47__LAClient__performSynchronous_callId_finally___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_performSynchronous:(BOOL)a3 callBool:(id)a4 finally:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke;
  v14[3] = &unk_1E63C4AE8;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke_3;
  v12[3] = &unk_1E63C4B10;
  id v13 = v9;
  id v10 = v9;
  id v11 = v8;
  [(LAClient *)self _performSynchronous:v6 callId:v14 finally:v12];
}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke_2;
  v7[3] = &unk_1E63C4AC0;
  id v8 = v3;
  uint64_t v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithBool:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4
{
}

- (void)getDomainStateWithOptions:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke;
  v10[3] = &unk_1E63C4B38;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(LAClient *)self _performSynchronous:v6 callId:v10 finally:a5];
}

void __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) synchronousRemoteContext];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke_2;
  v7[3] = &unk_1E63C3E88;
  id v8 = v3;
  id v6 = v3;
  [v4 getDomainStateWithOptions:v5 reply:v7];
}

uint64_t __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(LAClient *)self uiDelegate];
  [(LAClient *)self evaluatePolicy:a3 options:v9 uiDelegate:v10 reply:v8];
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6
{
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 evaluatePolicy:a1[7] options:a1[5] uiDelegate:a1[6] reply:v4];
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(LAClient *)self uiDelegate];
  [(LAClient *)self evaluateACL:v13 operation:v12 options:v11 uiDelegate:v14 reply:v10];
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 synchronous:(BOOL)a7 reply:(id)a8
{
  BOOL v26 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  uint64_t v17 = [(LAClient *)self _updateOptions:a5];
  uint64_t v18 = (void *)MEMORY[0x1E4F30B90];
  int v19 = [MEMORY[0x1E4F30BA8] checkOptions:v17];
  [v18 raiseExceptionOnError:v19];

  __int16 v20 = (void *)MEMORY[0x1E4F30B90];
  id v21 = [MEMORY[0x1E4F30BA8] checkACL:v13];
  [v20 raiseExceptionOnError:v21];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke;
  v27[3] = &unk_1E63C4C28;
  v27[4] = self;
  id v28 = v13;
  id v29 = v14;
  id v30 = v17;
  id v31 = v15;
  BOOL v32 = v26;
  id v22 = v15;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  [(LAClient *)self _performSynchronous:v26 callId:v27 finally:v16];
}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) synchronousRemoteContext];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_2;
  v10[3] = &unk_1E63C4C00;
  void v10[4] = *(void *)(a1 + 32);
  char v16 = *(unsigned char *)(a1 + 72);
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = v3;
  id v9 = v3;
  [v4 evaluateACL:v11 operation:v6 options:v7 uiDelegate:v8 reply:v10];
}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_3;
  v8[3] = &unk_1E63C4BD8;
  void v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  [v6 _checkIdResultForTCC:a2 synchronous:v7 error:a3 retryBlock:v8 finally:*(void *)(a1 + 72)];
}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 evaluateACL:a1[5] operation:a1[6] options:a1[7] uiDelegate:a1[8] reply:v4];
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F30B90];
  id v10 = (void *)MEMORY[0x1E4F30BA8];
  id v11 = a5;
  id v12 = [v10 checkEvent:a3];
  [v9 raiseExceptionOnError:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__LAClient_failProcessedEvent_failureError_reply___block_invoke;
  v14[3] = &unk_1E63C4C50;
  id v15 = v8;
  int64_t v16 = a3;
  void v14[4] = self;
  id v13 = v8;
  [(LAClient *)self _performCallBool:v14 finally:v11];
}

void __50__LAClient_failProcessedEvent_failureError_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 failProcessedEvent:a1[6] failureError:a1[5] reply:v4];
}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v7 = (void *)MEMORY[0x1E4F30BA8];
  id v8 = a4;
  id v9 = [v7 checkEvent:a3];
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__LAClient_retryProcessedEvent_reply___block_invoke;
  v10[3] = &unk_1E63C4C78;
  void v10[4] = self;
  void v10[5] = a3;
  [(LAClient *)self _performCallBool:v10 finally:v8];
}

void __38__LAClient_retryProcessedEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 retryProcessedEvent:*(void *)(a1 + 40) reply:v4];
}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v7 = (void *)MEMORY[0x1E4F30BA8];
  id v8 = a4;
  id v9 = [v7 checkEvent:a3];
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__LAClient_resetProcessedEvent_reply___block_invoke;
  v10[3] = &unk_1E63C4C78;
  void v10[4] = self;
  void v10[5] = a3;
  [(LAClient *)self _performCallBool:v10 finally:v8];
}

void __38__LAClient_resetProcessedEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 resetProcessedEvent:*(void *)(a1 + 40) reply:v4];
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F30B90];
  id v9 = (void *)MEMORY[0x1E4F30BA8];
  id v10 = a5;
  id v11 = [v9 checkEvent:a3];
  [v8 raiseExceptionOnError:v11];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__LAClient_pauseProcessedEvent_pause_reply___block_invoke;
  v12[3] = &unk_1E63C4CA0;
  void v12[4] = self;
  v12[5] = a3;
  BOOL v13 = a4;
  [(LAClient *)self _performCallBool:v12 finally:v10];
}

void __44__LAClient_pauseProcessedEvent_pause_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 pauseProcessedEvent:*(void *)(a1 + 40) pause:*(unsigned __int8 *)(a1 + 48) reply:v4];
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E4F30B90];
  id v12 = (void *)MEMORY[0x1E4F30BA8];
  id v13 = a6;
  id v14 = [v12 checkEvent:a4];
  [v11 raiseExceptionOnError:v14];

  id v15 = (void *)MEMORY[0x1E4F30B90];
  int64_t v16 = [MEMORY[0x1E4F30BA8] checkCredentialType:a5];
  [v15 raiseExceptionOnError:v16];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__LAClient_setCredential_forProcessedEvent_credentialType_reply___block_invoke;
  v18[3] = &unk_1E63C4CC8;
  v18[4] = self;
  id v19 = v10;
  int64_t v20 = a4;
  int64_t v21 = a5;
  id v17 = v10;
  [(LAClient *)self _performCallBool:v18 finally:v13];
}

void __65__LAClient_setCredential_forProcessedEvent_credentialType_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 setCredential:a1[5] forProcessedEvent:a1[6] credentialType:a1[7] reply:v4];
}

- (void)isCredentialSet:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v7 = (void *)MEMORY[0x1E4F30BA8];
  id v8 = a4;
  id v9 = [v7 checkCredentialType:a3];
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__LAClient_isCredentialSet_reply___block_invoke;
  v10[3] = &unk_1E63C4C78;
  void v10[4] = self;
  void v10[5] = a3;
  [(LAClient *)self _performCallBool:v10 finally:v8];
}

void __34__LAClient_isCredentialSet_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 isCredentialSet:*(void *)(a1 + 40) reply:v4];
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F30B90];
  id v10 = (void *)MEMORY[0x1E4F30BA8];
  id v11 = a5;
  id v12 = [v10 checkCredentialType:a4];
  [v9 raiseExceptionOnError:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__LAClient_setCredential_type_reply___block_invoke;
  v14[3] = &unk_1E63C4C50;
  void v14[4] = self;
  id v15 = v8;
  int64_t v16 = a4;
  id v13 = v8;
  [(LAClient *)self _performCallBool:v14 finally:v11];
}

void __37__LAClient_setCredential_type_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 setCredential:a1[5] type:a1[6] reply:v4];
}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v7 = (void *)MEMORY[0x1E4F30BA8];
  id v8 = a4;
  id v9 = [v7 checkCredentialType:a3];
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__LAClient_credentialOfType_reply___block_invoke;
  v10[3] = &unk_1E63C4CF0;
  void v10[4] = self;
  void v10[5] = a3;
  [(LAClient *)self _performCallId:v10 finally:v8];
}

void __35__LAClient_credentialOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 credentialOfType:*(void *)(a1 + 40) reply:v4];
}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F30B90];
  id v10 = (void *)MEMORY[0x1E4F30BA8];
  id v11 = a5;
  id v12 = [v10 checkInternalOperation:a4 options:v8];
  [v9 raiseExceptionOnError:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__LAClient_setOptions_forInternalOperation_reply___block_invoke;
  v14[3] = &unk_1E63C4C50;
  void v14[4] = self;
  id v15 = v8;
  int64_t v16 = a4;
  id v13 = v8;
  [(LAClient *)self _performCallBool:v14 finally:v11];
}

void __50__LAClient_setOptions_forInternalOperation_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 setOptions:a1[5] forInternalOperation:a1[6] reply:v4];
}

- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v7 = (void *)MEMORY[0x1E4F30BA8];
  id v8 = a4;
  id v9 = [v7 checkInternalOperation:a3 options:0];
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__LAClient_optionsForInternalOperation_reply___block_invoke;
  v10[3] = &unk_1E63C4CF0;
  void v10[4] = self;
  void v10[5] = a3;
  [(LAClient *)self _performCallId:v10 finally:v8];
}

void __46__LAClient_optionsForInternalOperation_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 optionsForInternalOperation:*(void *)(a1 + 40) reply:v4];
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__LAClient_verifyFileVaultUser_volumeUuid_options_reply___block_invoke;
  v14[3] = &unk_1E63C4D18;
  void v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  unint64_t v17 = a5;
  id v12 = v11;
  id v13 = v10;
  [(LAClient *)self _performCallBool:v14 finally:a6];
}

void __57__LAClient_verifyFileVaultUser_volumeUuid_options_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 verifyFileVaultUser:a1[5] volumeUuid:a1[6] options:a1[7] reply:v4];
}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__LAClient_serverPropertyForOption_reply___block_invoke;
  v4[3] = &unk_1E63C4CF0;
  v4[4] = self;
  v4[5] = a3;
  [(LAClient *)self _performCallId:v4 finally:a4];
}

void __42__LAClient_serverPropertyForOption_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 serverPropertyForOption:*(void *)(a1 + 40) reply:v4];
}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__LAClient_setServerPropertyForOption_value_reply___block_invoke;
  v10[3] = &unk_1E63C4C50;
  id v11 = v8;
  int64_t v12 = a3;
  void v10[4] = self;
  id v9 = v8;
  [(LAClient *)self _performCallBool:v10 finally:a5];
}

void __51__LAClient_setServerPropertyForOption_value_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 setServerPropertyForOption:a1[6] value:a1[5] reply:v4];
}

- (id)serverPropertyForOption:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  int64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__LAClient_serverPropertyForOption_error___block_invoke;
  v7[3] = &unk_1E63C4D40;
  void v7[4] = &v14;
  v7[5] = &v8;
  [(LAClient *)self serverPropertyForOption:a3 reply:v7];
  if (a4) {
    *a4 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

void __42__LAClient_serverPropertyForOption_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setServerPropertyForOption:(int64_t)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__LAClient_setServerPropertyForOption_value_error___block_invoke;
  v11[3] = &unk_1E63C4D68;
  v11[4] = &v18;
  v11[5] = &v12;
  [(LAClient *)self setServerPropertyForOption:a3 value:v8 reply:v11];
  if (a5) {
    *a5 = (id) v13[5];
  }
  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __51__LAClient_setServerPropertyForOption_value_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)externalizedContextWithReply:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__LAClient_externalizedContextWithReply___block_invoke;
  v3[3] = &unk_1E63C4958;
  v3[4] = self;
  [(LAClient *)self _performCallId:v3 finally:a3];
}

void __41__LAClient_externalizedContextWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 synchronousRemoteContext];
  [v4 externalizedContextWithReply:v3];
}

- (id)synchronousExternalizedContextWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__LAClient_synchronousExternalizedContextWithError___block_invoke;
  v7[3] = &unk_1E63C4958;
  void v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__LAClient_synchronousExternalizedContextWithError___block_invoke_2;
  v6[3] = &unk_1E63C4D90;
  v6[4] = &v14;
  v6[5] = &v8;
  [(LAClient *)self _performCallId:v7 finally:v6];
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v4;
}

void __52__LAClient_synchronousExternalizedContextWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 synchronousRemoteContext];
  [v4 externalizedContextWithReply:v3];
}

void __52__LAClient_synchronousExternalizedContextWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSData)externalizedContext
{
  id v3 = [(LAClient *)self cachedExternalizedContext];
  id v4 = [v3 externalizedContext];

  if (![v4 length])
  {
    usleep(0x1388u);
    id v5 = LALogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LAClient externalizedContext](v5);
    }

    id v6 = [(LAClient *)self cachedExternalizedContext];
    uint64_t v7 = [v6 externalizedContext];

    id v4 = (void *)v7;
  }

  return (NSData *)v4;
}

- (void)authMethodWithReply:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__LAClient_authMethodWithReply___block_invoke;
  v3[3] = &unk_1E63C4958;
  v3[4] = self;
  [(LAClient *)self _performCallId:v3 finally:a3];
}

void __32__LAClient_authMethodWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 synchronousRemoteContext];
  [v4 authMethodWithReply:v3];
}

- (void)prearmTouchIdWithReply:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__LAClient_prearmTouchIdWithReply___block_invoke;
  v3[3] = &unk_1E63C4958;
  v3[4] = self;
  [(LAClient *)self _performCallId:v3 finally:a3];
}

void __35__LAClient_prearmTouchIdWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serverConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__LAClient_prearmTouchIdWithReply___block_invoke_2;
  v7[3] = &unk_1E63C4028;
  id v8 = v3;
  id v5 = v3;
  id v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 prearmTouchIdWithReply:v5];
}

uint64_t __35__LAClient_prearmTouchIdWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetWithReply:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__LAClient_resetWithReply___block_invoke;
  v3[3] = &unk_1E63C49A8;
  v3[4] = self;
  [(LAClient *)self _performCallBool:v3 finally:a3];
}

void __27__LAClient_resetWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 synchronousRemoteContext];
  [v4 resetProcessedEvent:0 reply:v3];
}

- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(LAClient *)self _connectToServerWithRecovery:0 userSession:0 legacyService:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__LAClient_notifyEvent_options_reply___block_invoke;
  v11[3] = &unk_1E63C4C50;
  id v12 = v8;
  int64_t v13 = a3;
  v11[4] = self;
  id v10 = v8;
  [(LAClient *)self _performSynchronous:0 callBool:v11 finally:v9];
}

void __38__LAClient_notifyEvent_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serverConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__LAClient_notifyEvent_options_reply___block_invoke_2;
  v7[3] = &unk_1E63C4028;
  id v8 = v3;
  id v5 = v3;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v7];
  [v6 notifyEvent:*(void *)(a1 + 48) options:*(void *)(a1 + 40) reply:v5];
}

uint64_t __38__LAClient_notifyEvent_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__LAClient_setShowingCoachingHint_event_reply___block_invoke;
  v5[3] = &unk_1E63C4CA0;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  [(LAClient *)self _performCallBool:v5 finally:a5];
}

void __47__LAClient_setShowingCoachingHint_event_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 synchronousRemoteContext];
  [v5 setShowingCoachingHint:*(unsigned __int8 *)(a1 + 48) event:*(void *)(a1 + 40) reply:v4];
}

- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LAClient *)self serverConnection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __51__LAClient_bootstrapServiceType_completionHandler___block_invoke;
  uint64_t v18 = &unk_1E63C4028;
  id v19 = v6;
  id v9 = v6;
  id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&v15];
  id v11 = NSString;
  id v12 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v13 = [v12 processIdentifier];
  uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", @"%d", v13, v15, v16, v17, v18);
  [v10 bootstrapSessionServiceType:v7 serviceClientID:v14 completionHandler:v9];
}

uint64_t __51__LAClient_bootstrapServiceType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUiDelegate:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setCachedExternalizedContext:(id)a3
{
}

- (void)setShouldRecoverConnection:(BOOL)a3
{
  self->_shouldRecoverConnection = a3;
}

- (BOOL)willRetryOnInterruptedConnection
{
  return self->_willRetryOnInterruptedConnection;
}

- (NSNumber)userSession
{
  return self->_userSession;
}

- (NSData)existingContext
{
  return self->_existingContext;
}

+ (void)createConnection:(uint64_t)a1 legacyService:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithUnsignedInt:a1];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_debug_impl(&dword_1BED06000, a2, OS_LOG_TYPE_DEBUG, "xpc_connection_set_target_user_session_uid() setting uid:%{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)createConnection:(int *)a1 legacyService:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2080;
  uint64_t v6 = xpc_strerror();
  _os_log_error_impl(&dword_1BED06000, a2, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v4, 0x12u);
}

- (void)_synchronousRemoteObjectProxy:(os_log_t)log performCall:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BED06000, log, OS_LOG_TYPE_ERROR, "Retrying on an interrupted XPC connection", v1, 2u);
}

- (void)_handleConnectionResult:(void *)a1 uuid:proxyId:error:.cold.1(void *a1)
{
  uint64_t v1 = [a1 context];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BED06000, v2, v3, "%{public}@ failed to initialize: %{public}@", v4, v5, v6, v7, v8);
}

void __29__LAClient_setRemoteContext___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) context];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BED06000, v2, v3, "%{public}@ has encountered XPC error on synchronous proxy: %{public}@", v4, v5, v6, v7, v8);
}

- (void)invalidatedWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 context];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BED06000, v2, v3, "%{public}@ invalidated by server: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_setPermanentError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 context];
  OUTLINED_FUNCTION_0(&dword_1BED06000, v2, v3, "%{public}@ will keep returning %{public}@ from now on", v4, v5, v6, v7, 2u);
}

- (void)externalizedContext
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BED06000, log, OS_LOG_TYPE_ERROR, "Retrying on cachedExternalizedContext", v1, 2u);
}

@end