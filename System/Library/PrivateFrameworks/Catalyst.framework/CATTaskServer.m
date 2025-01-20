@interface CATTaskServer
- (BOOL)delegateClientSession:(id)a3 shouldConnectWithTransport:(id)a4;
- (BOOL)session:(id)a3 shouldAcceptConnectionFromTransport:(id)a4;
- (CATTaskServer)init;
- (CATTaskServerDelegate)delegate;
- (NSArray)clientSessions;
- (NSArray)connectedClientSessions;
- (NSDictionary)userInfo;
- (id)session:(id)a3 prepareOperationForRequest:(id)a4 error:(id *)a5;
- (void)allSessionsDidInvalidate;
- (void)connectWithClientTransport:(id)a3;
- (void)dealloc;
- (void)delegateClientSession:(id)a3 didInterruptWithError:(id)a4;
- (void)delegateClientSession:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)delegateClientSessionDidConnect:(id)a3;
- (void)delegateClientSessionDidDisconnect:(id)a3;
- (void)delegateDidInvalidate;
- (void)delegateDidInvalidateAndFinalize;
- (void)delegateSessionDidInvalidate:(id)a3;
- (void)disconnectAllClientSessions;
- (void)invalidate;
- (void)invalidateAllClientSessions;
- (void)invalidateWithError:(id)a3;
- (void)makeSessionWithClientTransport:(id)a3;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)session:(id)a3 didInterruptWithError:(id)a4;
- (void)session:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)session:(id)a3 enqueueOperation:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)sessionDidInvalidate:(id)a3;
- (void)sessionWillInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)startInvalidatingWithError:(id)a3;
@end

@implementation CATTaskServer

- (void)dealloc
{
  v4 = [(CATStateMachine *)self->mFSM currentState];
  v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"Invalidated"];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CATTaskServer.m", 38, @"%@ cannot dealloc while receiver is still valid.", self object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)CATTaskServer;
  [(CATTaskServer *)&v8 dealloc];
}

- (CATTaskServer)init
{
  v21.receiver = self;
  v21.super_class = (Class)CATTaskServer;
  v2 = [(CATTaskServer *)&v21 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mSessions = v2->mSessions;
    v2->mSessions = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    mActiveSessionsByUUID = v2->mActiveSessionsByUUID;
    v2->mActiveSessionsByUUID = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    mInvalidatingSessionsByUUID = v2->mInvalidatingSessionsByUUID;
    v2->mInvalidatingSessionsByUUID = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    mConnectedSessionsByUUID = v2->mConnectedSessionsByUUID;
    v2->mConnectedSessionsByUUID = (NSMutableDictionary *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    mAllSessionsDidInvalidateGroup = v2->mAllSessionsDidInvalidateGroup;
    v2->mAllSessionsDidInvalidateGroup = (OS_dispatch_group *)v11;

    v13 = [[CATStateMachine alloc] initWithTarget:v2];
    mFSM = v2->mFSM;
    v2->mFSM = v13;

    v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v16 = [v15 valueForKey:@"CATTaskLogLevel"];
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", [v16 integerValue]);

    v17 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Running"];
    v18 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidating"];
    v19 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidated"];
    [v17 addTransitionToState:v18 triggeringEvent:@"invalidateWithError:"];
    [v17 addTransitionToState:0 triggeringEvent:@"connectWithClientTransport:" action:sel_makeSessionWithClientTransport_];
    [v18 setEnterAction:sel_startInvalidatingWithError_];
    [v18 addTransitionToState:0 triggeringEvent:@"invalidateWithError:"];
    [v18 addTransitionToState:v19 triggeringEvent:@"allSessionsDidInvalidate"];
    [v19 setEnterAction:sel_delegateDidInvalidateAndFinalize];
    [v19 addTransitionToState:0 triggeringEvent:@"invalidateWithError:"];
    [(CATStateMachine *)v2->mFSM start];
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSDictionary *)[v4 copy];
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  id v7 = (id)[(NSMutableSet *)self->mSessions copy];
  [v7 setValue:v4 forKey:@"userInfo"];
}

- (NSArray)clientSessions
{
  return (NSArray *)[(NSMutableDictionary *)self->mActiveSessionsByUUID allValues];
}

- (NSArray)connectedClientSessions
{
  return (NSArray *)[(NSMutableDictionary *)self->mConnectedSessionsByUUID allValues];
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__CATTaskServer_postNotificationWithName_userInfo___block_invoke;
  v13[3] = &unk_2641DBE10;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  objc_super v8 = v13;
  id v9 = v7;
  id v10 = v6;
  dispatch_group_t v11 = CATGetCatalystQueue();
  v12 = v8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_2641DBD98;
  id v17 = v12;
  dispatch_async(v11, block);
}

void __51__CATTaskServer_postNotificationWithName_userInfo___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "postNotificationWithName:userInfo:", a1[5], a1[6], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)connectWithClientTransport:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__CATTaskServer_connectWithClientTransport___block_invoke;
  v10[3] = &unk_2641DC188;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  uint64_t v6 = v10;
  id v7 = v5;
  long long v8 = CATGetCatalystQueue();
  long long v9 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_2641DBD98;
  id v14 = v9;
  dispatch_async(v8, block);
}

void __44__CATTaskServer_connectWithClientTransport___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = +[CATStateMachineEvent eventWithTrigger:v4 context:*(void *)(a1 + 40)];
  [v2 transitionWithTriggeringEvent:v3];
}

- (void)makeSessionWithClientTransport:(id)a3
{
  id v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->mAllSessionsDidInvalidateGroup);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__CATTaskServer_makeSessionWithClientTransport___block_invoke;
  v9[3] = &unk_2641DC000;
  v9[4] = self;
  id v10 = v4;
  id v5 = v9;
  id v6 = v4;
  id v7 = CATGetCatalystQueue();
  long long v8 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_2641DBD98;
  id v12 = v8;
  dispatch_async(v7, block);
}

void __48__CATTaskServer_makeSessionWithClientTransport___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v3];
  [v3 setDelegate:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 32) userInfo];
  [v3 setUserInfo:v2];

  [v3 connectWithTransport:*(void *)(a1 + 40)];
}

- (void)invalidateAllClientSessions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__CATTaskServer_invalidateAllClientSessions__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  id v2 = v4;
  id v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __44__CATTaskServer_invalidateAllClientSessions__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) makeObjectsPerformSelector:sel_invalidate];
}

- (void)disconnectAllClientSessions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__CATTaskServer_disconnectAllClientSessions__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  id v2 = v4;
  id v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __44__CATTaskServer_disconnectAllClientSessions__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) makeObjectsPerformSelector:sel_disconnect];
}

- (void)invalidate
{
}

- (void)invalidateWithError:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__CATTaskServer_invalidateWithError___block_invoke;
  v10[3] = &unk_2641DC188;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  id v6 = v10;
  id v7 = v5;
  long long v8 = CATGetCatalystQueue();
  long long v9 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_2641DBD98;
  id v14 = v9;
  dispatch_async(v8, block);
}

void __37__CATTaskServer_invalidateWithError___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[CATStateMachineEvent eventWithTrigger:v4 context:*(void *)(a1 + 40)];
  [v2 transitionWithTriggeringEvent:v3];
}

- (void)startInvalidatingWithError:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_storeStrong((id *)&self->mStrongSelf, self);
  [(NSMutableSet *)self->mSessions makeObjectsPerformSelector:sel_invalidateWithError_ withObject:v4];

  mAllSessionsDidInvalidateGroup = self->mAllSessionsDidInvalidateGroup;
  id v7 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CATTaskServer_startInvalidatingWithError___block_invoke;
  block[3] = &unk_2641DBE60;
  void block[4] = self;
  dispatch_group_notify(mAllSessionsDidInvalidateGroup, v7, block);
}

uint64_t __44__CATTaskServer_startInvalidatingWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) allSessionsDidInvalidate];
}

- (void)allSessionsDidInvalidate
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)delegateDidInvalidateAndFinalize
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (!self->mStrongSelf)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CATTaskServer.m", 190, @"%@ cannot call %@ when it has not created a strong reference to self", self, v6 object file lineNumber description];
  }
  [(CATTaskServer *)self delegateDidInvalidate];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CATTaskServer_delegateDidInvalidateAndFinalize__block_invoke;
  block[3] = &unk_2641DBCB0;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__CATTaskServer_delegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (BOOL)session:(id)a3 shouldAcceptConnectionFromTransport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  uint64_t v9 = [v6 sessionUUID];
  if (v9)
  {
    id v10 = (void *)v9;
    mActiveSessionsByUUID = self->mActiveSessionsByUUID;
    SEL v12 = [v6 sessionUUID];
    v13 = [(NSMutableDictionary *)mActiveSessionsByUUID objectForKeyedSubscript:v12];

    if (v13
      && [(CATTaskServer *)self delegateClientSession:v13 shouldConnectWithTransport:v7])
    {
      [v13 connectWithTransportFromTaskSession:v6];
LABEL_8:
      BOOL v17 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = [MEMORY[0x263F08C38] UUID];
  [v6 setSessionUUID:v14];

  if (![(CATTaskServer *)self delegateClientSession:v6 shouldConnectWithTransport:v7])goto LABEL_8; {
  id v15 = self->mActiveSessionsByUUID;
  }
  v16 = [v6 sessionUUID];
  [(NSMutableDictionary *)v15 setObject:v6 forKeyedSubscript:v16];

  BOOL v17 = 1;
LABEL_9:

  return v17;
}

- (void)sessionDidConnect:(id)a3
{
  id v7 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mConnectedSessionsByUUID = self->mConnectedSessionsByUUID;
  id v6 = [v7 sessionUUID];
  [(NSMutableDictionary *)mConnectedSessionsByUUID setObject:v7 forKeyedSubscript:v6];

  [(CATTaskServer *)self delegateClientSessionDidConnect:v7];
}

- (void)sessionDidDisconnect:(id)a3
{
  id v10 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mConnectedSessionsByUUID = self->mConnectedSessionsByUUID;
  id v6 = [v10 sessionUUID];
  id v7 = [(NSMutableDictionary *)mConnectedSessionsByUUID objectForKeyedSubscript:v6];

  if (v7 == v10)
  {
    id v8 = self->mConnectedSessionsByUUID;
    uint64_t v9 = [v10 sessionUUID];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];
  }
  [(CATTaskServer *)self delegateClientSessionDidDisconnect:v10];
}

- (void)session:(id)a3 didInterruptWithError:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  [(CATTaskServer *)self delegateClientSession:v8 didInterruptWithError:v6];
}

- (void)sessionWillInvalidate:(id)a3
{
  id v7 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [v7 sessionUUID];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->mActiveSessionsByUUID objectForKeyedSubscript:v5];

    if (v6 == v7)
    {
      [(NSMutableDictionary *)self->mActiveSessionsByUUID removeObjectForKey:v5];
      [(NSMutableDictionary *)self->mInvalidatingSessionsByUUID setObject:v7 forKeyedSubscript:v5];
    }
  }
}

- (void)sessionDidInvalidate:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [v8 sessionUUID];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->mInvalidatingSessionsByUUID objectForKeyedSubscript:v5];

    id v7 = v8;
    if (v6 == v8)
    {
      [(NSMutableDictionary *)self->mInvalidatingSessionsByUUID removeObjectForKey:v5];
      id v7 = v8;
    }
    [(CATTaskServer *)self delegateSessionDidInvalidate:v7];
  }
  [(NSMutableSet *)self->mSessions removeObject:v8];
  dispatch_group_leave((dispatch_group_t)self->mAllSessionsDidInvalidateGroup);
}

- (void)session:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  id v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  [(CATTaskServer *)self delegateClientSession:v11 didReceiveNotificationWithName:v9 userInfo:v8];
}

- (id)session:(id)a3 prepareOperationForRequest:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = CATGetCatalystQueue();
  CATAssertIsQueue(v11);

  if (!v10)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"CATTaskServer.m", 307, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  SEL v12 = [(CATTaskServer *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(CATTaskServer *)self delegate];
    a5 = [v14 server:self clientSession:v9 operationForRequest:v10 error:a5];

    goto LABEL_10;
  }
  if (_CATLogGeneral_onceToken_15 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_15, &__block_literal_global_21);
  }
  id v15 = (void *)_CATLogGeneral_logObj_15;
  if (!os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_15, OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v20 = v15;
  objc_super v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [(CATTaskServer *)self delegate];
  v24 = NSStringFromSelector(sel_server_clientSession_operationForRequest_error_);
  *(_DWORD *)buf = 138412802;
  v29 = v22;
  __int16 v30 = 2112;
  v31 = v23;
  __int16 v32 = 2112;
  v33 = v24;
  _os_log_error_impl(&dword_213B7F000, v20, OS_LOG_TYPE_ERROR, "Dropping message (%@) because delegate (%@) does not implement %@", buf, 0x20u);

  if (a5)
  {
LABEL_9:
    v26 = @"kCATErrorRequestNameKey";
    v16 = (objc_class *)objc_opt_class();
    BOOL v17 = NSStringFromClass(v16);
    v27 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    CATErrorWithCodeAndUserInfo(400, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_10:

  return a5;
}

- (void)session:(id)a3 enqueueOperation:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  id v8 = [(CATTaskServer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CATTaskServer *)self delegate];
    [v10 server:self clientSession:v15 enqueueOperation:v6];
  }
  else
  {
    mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    if (!mOrphanedOperationQueue)
    {
      SEL v12 = (CATOperationQueue *)objc_opt_new();
      char v13 = self->mOrphanedOperationQueue;
      self->mOrphanedOperationQueue = v12;

      id v14 = [NSString stringWithFormat:@"%@.%p.orphaned", objc_opt_class(), self];
      [(CATOperationQueue *)self->mOrphanedOperationQueue setName:v14];

      [(CATOperationQueue *)self->mOrphanedOperationQueue setMaxConcurrentOperationCount:0x7FFFFFFFFFFFFFFFLL];
      mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    }
    [(CATOperationQueue *)mOrphanedOperationQueue addOperation:v6];
  }
}

- (BOOL)delegateClientSession:(id)a3 shouldConnectWithTransport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  char v9 = [(CATTaskServer *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(CATTaskServer *)self delegate];
    char v12 = [v11 server:self clientSession:v6 shouldConnectWithTransport:v7];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (void)delegateDidInvalidate
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskServer *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskServer *)self delegate];
    [v6 serverDidInvalidate:self];
  }
}

- (void)delegateClientSession:(id)a3 didInterruptWithError:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  id v8 = [(CATTaskServer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(CATTaskServer *)self delegate];
    [v10 server:self clientSession:v11 didInterruptWithError:v6];
  }
  else
  {
    [v11 invalidateWithError:v6];
  }
}

- (void)delegateClientSessionDidConnect:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  char v5 = [(CATTaskServer *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATTaskServer *)self delegate];
    [v7 server:self clientSessionDidConnect:v8];
  }
}

- (void)delegateClientSessionDidDisconnect:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  char v5 = [(CATTaskServer *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATTaskServer *)self delegate];
    [v7 server:self clientSessionDidDisconnect:v8];
  }
}

- (void)delegateSessionDidInvalidate:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  char v5 = [(CATTaskServer *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATTaskServer *)self delegate];
    [v7 server:self clientSessionDidInvalidate:v8];
  }
}

- (void)delegateClientSession:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  id v11 = [(CATTaskServer *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    char v13 = [(CATTaskServer *)self delegate];
    [v13 server:self clientSession:v14 didReceiveNotificationWithName:v8 userInfo:v9];
  }
}

- (CATTaskServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATTaskServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mOrphanedOperationQueue, 0);
  objc_storeStrong((id *)&self->mAllSessionsDidInvalidateGroup, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mConnectedSessionsByUUID, 0);
  objc_storeStrong((id *)&self->mInvalidatingSessionsByUUID, 0);
  objc_storeStrong((id *)&self->mActiveSessionsByUUID, 0);
  objc_storeStrong((id *)&self->mSessions, 0);

  objc_storeStrong((id *)&self->mFSM, 0);
}

@end