@interface CATTaskClient
- (CATTaskClient)init;
- (CATTaskClientDelegate)delegate;
- (CATTransport)transport;
- (NSDictionary)serverUserInfo;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSUUID)sessionUUID;
- (id)captureTransport;
- (id)prepareTaskOperationForRequest:(id)a3;
- (void)abandonTransport;
- (void)abandonTransportClearQueuedMessagesAndCancelAllOperationsWithError:(id)a3;
- (void)activeOperationDidFinish:(id)a3;
- (void)clearQueuedMessagesAndCancelAllOperationsWithError:(id)a3;
- (void)connectWithTransport:(id)a3;
- (void)connectWithTransportFromTaskClient:(id)a3;
- (void)dealloc;
- (void)delegateDidConnect;
- (void)delegateDidDisconnect;
- (void)delegateDidInterruptWithError:(id)a3;
- (void)delegateDidInvalidate;
- (void)delegateDidInvalidateAndFinalize;
- (void)delegateWillInvalidate;
- (void)delegateWillInvalidateAndInvalidateSessionWithError:(id)a3;
- (void)delegatedidReceiveNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)didPrepareTaskOperation:(id)a3;
- (void)disconnect;
- (void)enqueueMessage:(id)a3;
- (void)enqueueTaskOperation:(id)a3;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)processNotificationMessage:(id)a3;
- (void)processSessionMessage:(id)a3;
- (void)processTaskMessage:(id)a3;
- (void)remoteTaskOperation:(id)a3 preparedMessage:(id)a4;
- (void)resumeCapturedTransportFromTaskClient:(id)a3;
- (void)resumeSession;
- (void)resumeTransport:(id)a3;
- (void)resumeWithTaskUUIDs:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageThroughTransport:(id)a3;
- (void)sessionDidInvalidate;
- (void)sessionResumedWithTaskUUIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServerUserInfo:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)taskOperationDidFailWithInvalidTaskClient:(id)a3;
- (void)trackTaskOperation:(id)a3;
- (void)transport:(id)a3 didFailToSendMessage:(id)a4 error:(id)a5;
- (void)transport:(id)a3 didInterruptWithError:(id)a4;
- (void)transport:(id)a3 didReceiveMessage:(id)a4;
- (void)transport:(id)a3 didSendMessage:(id)a4;
- (void)transportDidInvalidate:(id)a3;
- (void)transportDidResume:(id)a3;
@end

@implementation CATTaskClient

- (void)dealloc
{
  v4 = [(CATStateMachine *)self->mFSM currentState];
  v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"Invalidated"];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CATTaskClient.m", 54, @"%@ cannot dealloc while receiver is still valid.", self object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)CATTaskClient;
  [(CATTaskClient *)&v8 dealloc];
}

- (CATTaskClient)init
{
  v22.receiver = self;
  v22.super_class = (Class)CATTaskClient;
  v2 = [(CATTaskClient *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
    mRemoteTaskByUUID = v2->mRemoteTaskByUUID;
    v2->mRemoteTaskByUUID = (NSMapTable *)v3;

    uint64_t v5 = objc_opt_new();
    mEnqueuedMessages = v2->mEnqueuedMessages;
    v2->mEnqueuedMessages = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    mEnqueuedTaskUUIDs = v2->mEnqueuedTaskUUIDs;
    v2->mEnqueuedTaskUUIDs = (NSMutableArray *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    mSessionDidInvalidateGroup = v2->mSessionDidInvalidateGroup;
    v2->mSessionDidInvalidateGroup = (OS_dispatch_group *)v9;

    v11 = [[CATStateMachine alloc] initWithTarget:v2];
    mFSM = v2->mFSM;
    v2->mFSM = v11;

    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v14 = [v13 valueForKey:@"CATTaskLogLevel"];
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", [v14 integerValue]);

    v15 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Disconnected"];
    v16 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connecting"];
    v21 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Negotiating"];
    v17 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connected"];
    v18 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidating"];
    v20 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidated"];
    objc_msgSend(v15, "setEnterAction:");
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", 0);
    [v15 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueMessage_];
    [v15 addTransitionToState:v16 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v15 addTransitionToState:v16 triggeringEvent:@"connectWithTransportFromTaskClient:" action:sel_resumeCapturedTransportFromTaskClient_];
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", v18, @"invalidateWithError:");
    [v16 addTransitionToState:0 triggeringEvent:@"didPrepareTaskOperation:" action:sel_enqueueTaskOperation_];
    [v16 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueMessage_];
    [v16 addTransitionToState:v16 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v16 addTransitionToState:v16 triggeringEvent:@"connectWithTransportFromTaskClient:" action:sel_resumeCapturedTransportFromTaskClient_];
    [v16 addTransitionToState:v21 triggeringEvent:@"transportDidResume:"];
    [v16 addTransitionToState:v15 triggeringEvent:@"transportDidInvalidate:"];
    [v16 addTransitionToState:v18 triggeringEvent:@"invalidateWithError:" action:sel_abandonTransportClearQueuedMessagesAndCancelAllOperationsWithError_];
    [v21 setEnterAction:sel_resumeSession];
    [v21 addTransitionToState:0 triggeringEvent:@"didPrepareTaskOperation:" action:sel_enqueueTaskOperation_];
    [v21 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueMessage_];
    [v21 addTransitionToState:v16 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v21 addTransitionToState:v16 triggeringEvent:@"connectWithTransportFromTaskClient:" action:sel_resumeCapturedTransportFromTaskClient_];
    [v21 addTransitionToState:v17 triggeringEvent:@"sessionResumedWithTaskUUIDs:" action:sel_resumeWithTaskUUIDs_];
    [v21 addTransitionToState:v15 triggeringEvent:@"transportDidInvalidate:"];
    [v21 addTransitionToState:v18 triggeringEvent:@"invalidateWithError:" action:sel_clearQueuedMessagesAndCancelAllOperationsWithError_];
    [v17 setEnterAction:sel_delegateDidConnect];
    [v17 addTransitionToState:0 triggeringEvent:@"didPrepareTaskOperation:" action:sel_trackTaskOperation_];
    [v17 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_sendMessageThroughTransport_];
    [v17 addTransitionToState:0 triggeringEvent:@"processTaskMessage:"];
    [v17 addTransitionToState:0 triggeringEvent:@"processNotificationMessage:"];
    [v17 addTransitionToState:0 triggeringEvent:@"sessionResumedWithTaskUUIDs:" action:sel_resumeWithTaskUUIDs_];
    [v17 addTransitionToState:v16 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v17 addTransitionToState:v16 triggeringEvent:@"connectWithTransportFromTaskClient:" action:sel_resumeCapturedTransportFromTaskClient_];
    [v17 addTransitionToState:v15 triggeringEvent:@"transportDidInvalidate:"];
    [v17 addTransitionToState:v18 triggeringEvent:@"invalidateWithError:" action:sel_clearQueuedMessagesAndCancelAllOperationsWithError_];
    [v17 setExitAction:sel_delegateDidDisconnect];
    [v18 setEnterAction:sel_delegateWillInvalidateAndInvalidateSessionWithError_];
    [v18 addTransitionToState:0 triggeringEvent:@"didPrepareTaskOperation:" action:sel_taskOperationDidFailWithInvalidTaskClient_];
    [v18 addTransitionToState:0 triggeringEvent:@"sendMessage:"];
    [v18 addTransitionToState:0 triggeringEvent:@"invalidateWithError:"];
    [v18 addTransitionToState:0 triggeringEvent:@"transportDidResume:"];
    [v18 addTransitionToState:0 triggeringEvent:@"sessionResumedWithTaskUUIDs:"];
    [v18 addTransitionToState:0 triggeringEvent:@"transportDidInvalidate:" action:sel_abandonTransport];
    [v18 addTransitionToState:v20 triggeringEvent:@"sessionDidInvalidate"];
    [v20 setEnterAction:sel_delegateDidInvalidateAndFinalize];
    [v20 addTransitionToState:0 triggeringEvent:@"didPrepareTaskOperation:" action:sel_taskOperationDidFailWithInvalidTaskClient_];
    [v20 addTransitionToState:0 triggeringEvent:@"sendMessage:"];
    [v20 addTransitionToState:0 triggeringEvent:@"invalidateWithError:"];
    [v20 addTransitionToState:0 triggeringEvent:@"sessionDidInvalidate"];
    [v20 addTransitionToState:0 triggeringEvent:@"transportDidInvalidate:"];
    v2->mIsStarting = 1;
    [(CATStateMachine *)v2->mFSM start];
    v2->mIsStarting = 0;
  }
  return v2;
}

- (NSString)description
{
  mTransport = self->mTransport;
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  char v6 = [(CATStateMachine *)self->mFSM currentState];
  uint64_t v7 = [v6 name];
  objc_super v8 = [(CATTaskClient *)self sessionUUID];
  uint64_t v9 = [v8 UUIDString];
  v10 = (void *)v9;
  if (mTransport) {
    [v4 stringWithFormat:@"<%@: %p { state = %@, session = %@, transport = %@ }>", v5, self, v7, v9, self->mTransport];
  }
  else {
  v11 = [v4 stringWithFormat:@"<%@: %p { state = %@, session = %@ }>", v5, self, v7, v9, v13];
  }

  return (NSString *)v11;
}

- (id)prepareTaskOperationForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CATRemoteTaskOperation alloc] initWithRequest:v4 client:self];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__CATTaskClient_prepareTaskOperationForRequest___block_invoke;
  v13[3] = &unk_2641DC000;
  v13[4] = self;
  char v6 = v5;
  v14 = v6;
  uint64_t v7 = v13;
  objc_super v8 = CATGetCatalystQueue();
  uint64_t v9 = v7;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_2641DBD98;
  id v16 = v9;
  dispatch_async(v8, block);

  v10 = v14;
  v11 = v6;

  return v11;
}

uint64_t __48__CATTaskClient_prepareTaskOperationForRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didPrepareTaskOperation:*(void *)(a1 + 40)];
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CATTaskClient.m", 164, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__CATTaskClient_postNotificationWithName_userInfo___block_invoke;
  v15[3] = &unk_2641DBE10;
  id v16 = v7;
  id v17 = v8;
  v18 = self;
  uint64_t v9 = v15;
  id v10 = v8;
  id v11 = v7;
  v12 = CATGetCatalystQueue();
  uint64_t v13 = v9;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_2641DBD98;
  id v20 = v13;
  dispatch_async(v12, block);
}

void __51__CATTaskClient_postNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  v2 = [[CATNotificationMessage alloc] initWithName:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) sendMessage:v2];
}

- (void)connectWithTransport:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__CATTaskClient_connectWithTransport___block_invoke;
  v10[3] = &unk_2641DC188;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  char v6 = v10;
  id v7 = v5;
  id v8 = CATGetCatalystQueue();
  uint64_t v9 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_2641DBD98;
  id v14 = v9;
  dispatch_async(v8, block);
}

void __38__CATTaskClient_connectWithTransport___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = +[CATStateMachineEvent eventWithTrigger:v4 context:*(void *)(a1 + 40)];
  [v2 transitionWithTriggeringEvent:v3];
}

- (void)connectWithTransportFromTaskClient:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__CATTaskClient_connectWithTransportFromTaskClient___block_invoke;
  v10[3] = &unk_2641DC188;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  char v6 = v10;
  id v7 = v5;
  id v8 = CATGetCatalystQueue();
  uint64_t v9 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_2641DBD98;
  id v14 = v9;
  dispatch_async(v8, block);
}

void __52__CATTaskClient_connectWithTransportFromTaskClient___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = +[CATStateMachineEvent eventWithTrigger:v4 context:*(void *)(a1 + 40)];
  [v2 transitionWithTriggeringEvent:v3];
}

- (void)disconnect
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__CATTaskClient_disconnect__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  v2 = v4;
  uint64_t v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __27__CATTaskClient_disconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
}

- (void)invalidate
{
  CATErrorWithCodeAndUserInfo(503, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CATTaskClient *)self invalidateWithError:v3];
}

- (void)invalidateWithError:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__CATTaskClient_invalidateWithError___block_invoke;
  v10[3] = &unk_2641DC188;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  id v6 = v10;
  id v7 = v5;
  id v8 = CATGetCatalystQueue();
  uint64_t v9 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_2641DBD98;
  id v14 = v9;
  dispatch_async(v8, block);
}

void __37__CATTaskClient_invalidateWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[CATStateMachineEvent eventWithTrigger:v4 context:*(void *)(a1 + 40)];
  [v2 transitionWithTriggeringEvent:v3];
}

- (void)didPrepareTaskOperation:(id)a3
{
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)enqueueTaskOperation:(id)a3
{
  id v7 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mEnqueuedTaskUUIDs = self->mEnqueuedTaskUUIDs;
  id v6 = [v7 UUID];
  [(NSMutableArray *)mEnqueuedTaskUUIDs addObject:v6];

  [(CATTaskClient *)self trackTaskOperation:v7];
}

- (void)trackTaskOperation:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  mRemoteTaskByUUID = self->mRemoteTaskByUUID;
  id v7 = [v4 UUID];
  [(NSMapTable *)mRemoteTaskByUUID setObject:v4 forKey:v7];
}

- (void)taskOperationDidFailWithInvalidTaskClient:(id)a3
{
  id v3 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  CATErrorWithCodeAndUserInfo(501, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 clientFailedWithError:v5];
}

- (void)resumeCapturedTransportFromTaskClient:(id)a3
{
  id v11 = (CATTaskClient *)a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = v11;
  if (!v11)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CATTaskClient.m", 246, @"Invalid parameter not satisfying: %@", @"otherClient" object file lineNumber description];

    id v6 = 0;
  }
  if (self == v6)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, v11, @"CATTaskClient.m", 247, @"%@ cannot call %@ when the other client is the receiver", v11, v10 object file lineNumber description];

    id v6 = v11;
  }
  id v7 = [(CATTaskClient *)v6 captureTransport];
  [(CATTaskClient *)self resumeTransport:v7];
}

- (id)captureTransport
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mTransport = self->mTransport;
  if (!mTransport)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATTaskClient.m", 258, @"%@: Can't capture transport when one doesn't exist", self object file lineNumber description];

    mTransport = self->mTransport;
  }
  id v6 = mTransport;
  [(CATTransport *)v6 suspend];
  [(CATTransport *)v6 setDelegate:0];
  id v7 = self->mTransport;
  self->mTransport = 0;

  id v8 = CATErrorWithCodeAndUserInfo(505, 0);
  [(CATTaskClient *)self invalidateWithError:v8];

  dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);

  return v6;
}

- (void)resumeTransport:(id)a3
{
  id v9 = (CATTransport *)a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CATTaskClient.m", 281, @"Invalid parameter not satisfying: %@", @"transport" object file lineNumber description];
  }
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  id v7 = v9;
  if (self->mTransport != v9)
  {
    dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
    [(CATTaskClient *)self abandonTransport];
    objc_storeStrong((id *)&self->mTransport, a3);
    [(CATTransport *)self->mTransport setDelegate:self];
    [(CATTransport *)self->mTransport resume];
    id v7 = v9;
  }
}

- (void)abandonTransport
{
  if (!self->mIsStarting)
  {
    id v3 = CATGetCatalystQueue();
    CATAssertIsQueue(v3);

    mTransport = self->mTransport;
    if (mTransport)
    {
      id v9 = mTransport;
      [(CATTransport *)self->mTransport setDelegate:0];
      id v5 = self->mTransport;
      self->mTransport = 0;

      mOrphanedTransports = self->mOrphanedTransports;
      if (!mOrphanedTransports)
      {
        id v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
        id v8 = self->mOrphanedTransports;
        self->mOrphanedTransports = v7;

        mOrphanedTransports = self->mOrphanedTransports;
      }
      [(NSHashTable *)mOrphanedTransports addObject:v9];
      [(CATTransport *)v9 invalidate];
      dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
    }
  }
}

- (void)sessionResumedWithTaskUUIDs:(id)a3
{
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)resumeWithTaskUUIDs:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  v24 = v4;
  id v6 = [MEMORY[0x263EFF9C0] setWithArray:v4];
  [v6 addObjectsFromArray:self->mEnqueuedTaskUUIDs];
  [(NSMutableArray *)self->mEnqueuedTaskUUIDs removeAllObjects];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = self->mEnqueuedMessages;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        SEL v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 taskUUID];
          int v14 = [v6 containsObject:v13];

          if (!v14) {
            continue;
          }
        }
        [(CATTaskClient *)self sendMessageThroughTransport:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  [(NSMutableArray *)self->mEnqueuedMessages removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = [(NSMapTable *)self->mRemoteTaskByUUID objectEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        v21 = [v20 UUID];
        char v22 = [v6 containsObject:v21];

        if ((v22 & 1) == 0)
        {
          v23 = CATErrorWithCodeAndUserInfo(502, 0);
          [v20 clientFailedWithError:v23];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }
}

- (void)delegateWillInvalidateAndInvalidateSessionWithError:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATTaskClient *)self delegateWillInvalidate];
  objc_storeStrong((id *)&self->mStrongSelf, self);
  if (self->mTransport)
  {
    id v6 = [[CATSessionMessageInvalidate alloc] initWithError:v4];
    [(CATTaskClient *)self sendMessageThroughTransport:v6];
  }
  mSessionDidInvalidateGroup = self->mSessionDidInvalidateGroup;
  uint64_t v8 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CATTaskClient_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke;
  block[3] = &unk_2641DBE60;
  void block[4] = self;
  dispatch_group_notify(mSessionDidInvalidateGroup, v8, block);
}

uint64_t __69__CATTaskClient_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sessionDidInvalidate];
}

- (void)sessionDidInvalidate
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)abandonTransportClearQueuedMessagesAndCancelAllOperationsWithError:(id)a3
{
  id v5 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  [(CATTaskClient *)self abandonTransport];
  [(CATTaskClient *)self clearQueuedMessagesAndCancelAllOperationsWithError:v5];
}

- (void)clearQueuedMessagesAndCancelAllOperationsWithError:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(NSMutableArray *)self->mEnqueuedTaskUUIDs removeAllObjects];
  [(NSMutableArray *)self->mEnqueuedMessages removeAllObjects];
  id v6 = [(NSMapTable *)self->mRemoteTaskByUUID objectEnumerator];
  id v7 = [v6 allObjects];

  [v7 makeObjectsPerformSelector:sel_clientFailedWithError_ withObject:v4];
}

- (void)sendMessage:(id)a3
{
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)resumeSession
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [CATSessionMessageResume alloc];
  id v5 = [(CATTaskClient *)self sessionUUID];
  id v7 = [(CATSessionMessageResume *)v4 initWithSessionUUID:v5];

  id v6 = [(CATTaskClient *)self userInfo];
  [(CATSessionMessageResume *)v7 setClientUserInfo:v6];

  [(CATTaskClient *)self sendMessageThroughTransport:v7];
}

- (void)sendMessageThroughTransport:(id)a3
{
  id v9 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  mTransport = self->mTransport;
  if (!mTransport)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CATTaskClient.m", 441, @"%@ cannot call %@ with %@ when there is no transport", self, v8, v9 object file lineNumber description];

    mTransport = self->mTransport;
  }
  [(CATTransport *)mTransport sendMessage:v9];
}

- (void)enqueueMessage:(id)a3
{
  id v5 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  [(NSMutableArray *)self->mEnqueuedMessages addObject:v5];
}

- (void)delegateDidInvalidateAndFinalize
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATTaskClient *)self delegateDidInvalidate];
  if (self->mStrongSelf)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__CATTaskClient_delegateDidInvalidateAndFinalize__block_invoke;
    v6[3] = &unk_2641DBCB0;
    objc_copyWeak(&v7, &location);
    id v4 = v6;
    id v5 = CATGetCatalystQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_11;
    block[3] = &unk_2641DBD98;
    id v10 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__CATTaskClient_delegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)remoteTaskOperation:(id)a3 preparedMessage:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  mActiveRemoteTaskOperations = self->mActiveRemoteTaskOperations;
  if (!mActiveRemoteTaskOperations)
  {
    id v9 = (NSMutableSet *)objc_opt_new();
    id v10 = self->mActiveRemoteTaskOperations;
    self->mActiveRemoteTaskOperations = v9;

    mActiveRemoteTaskOperations = self->mActiveRemoteTaskOperations;
  }
  if (([(NSMutableSet *)mActiveRemoteTaskOperations containsObject:v12] & 1) == 0)
  {
    [(NSMutableSet *)self->mActiveRemoteTaskOperations addObject:v12];
    dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
    id v11 = CATGetCatalystQueue();
    [v12 addTarget:self selector:sel_activeOperationDidFinish_ forOperationEvents:6 delegateQueue:v11];
  }
  [(CATTaskClient *)self sendMessage:v6];
}

- (void)activeOperationDidFinish:(id)a3
{
  id v5 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(NSMutableSet *)self->mActiveRemoteTaskOperations containsObject:v5])
  {
    [(NSMutableSet *)self->mActiveRemoteTaskOperations removeObject:v5];
    dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  }
}

- (void)transportDidResume:(id)a3
{
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = +[CATStateMachineEvent eventWithTrigger:v8 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v7];
}

- (void)transport:(id)a3 didSendMessage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = CATGetCatalystQueue();
  CATAssertIsQueue((dispatch_queue_t)v6);

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6)
  {
    mTransport = self->mTransport;
    [(CATTransport *)mTransport invalidate];
  }
}

- (void)transport:(id)a3 didFailToSendMessage:(id)a4 error:(id)a5
{
  id v6 = a4;
  uint64_t v7 = CATGetCatalystQueue();
  CATAssertIsQueue((dispatch_queue_t)v7);

  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if (v7)
  {
    mTransport = self->mTransport;
    [(CATTransport *)mTransport invalidate];
  }
}

- (void)transport:(id)a3 didReceiveMessage:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CATTaskClient *)self processSessionMessage:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CATTaskClient *)self processNotificationMessage:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CATTaskClient *)self processTaskMessage:v5];
      }
      else
      {
        id v11 = @"kCATErrorMessageNameKey";
        uint64_t v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        v12[0] = v8;
        id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
        id v10 = CATErrorWithCodeAndUserInfo(300, v9);
        [(CATTaskClient *)self delegateDidInterruptWithError:v10];
      }
    }
  }
}

- (void)transport:(id)a3 didInterruptWithError:(id)a4
{
  id v6 = a4;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATTaskClient *)self delegateDidInterruptWithError:v6];
}

- (void)transportDidInvalidate:(id)a3
{
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = +[CATStateMachineEvent eventWithTrigger:v8 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v7];
}

- (void)processSessionMessage:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = @"kCATErrorMessageNameKey";
      uint64_t v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      char v22 = v14;
      v15 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v16 = CATErrorWithCodeAndUserInfo(300, v15);
      [(CATTaskClient *)self delegateDidInterruptWithError:v16];

LABEL_14:
      goto LABEL_15;
    }
    id v10 = [v4 error];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      CATErrorWithCodeAndUserInfo(502, 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v14 = v12;

    uint64_t v17 = [v14 domain];
    if ([v17 isEqualToString:@"Catalyst.error"])
    {
      uint64_t v18 = [v14 code];

      if (v18 == 502) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v23 = *MEMORY[0x263F08608];
    v24[0] = v14;
    v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v20 = CATErrorWithCodeAndUserInfo(502, v19);

    int v14 = (void *)v20;
LABEL_13:
    [(CATTaskClient *)self delegateDidInterruptWithError:v14];
    goto LABEL_14;
  }
  id v6 = v4;
  uint64_t v7 = [v6 sessionUUID];
  [(CATTaskClient *)self setSessionUUID:v7];

  id v8 = [v6 serverUserInfo];
  [(CATTaskClient *)self setServerUserInfo:v8];

  id v9 = [v6 pendingRemoteTaskUUIDs];

  [(CATTaskClient *)self sessionResumedWithTaskUUIDs:v9];
LABEL_15:
}

- (void)processTaskMessage:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  uint64_t v7 = [v5 taskUUID];

  if (!v7)
  {
    uint64_t v17 = CATErrorWithCodeAndUserInfo(301, 0);
    [(CATTaskClient *)self delegateDidInterruptWithError:v17];
LABEL_7:

    goto LABEL_10;
  }
  mFSM = self->mFSM;
  id v9 = NSStringFromSelector(a2);
  id v10 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];
  LOBYTE(mFSM) = [(CATStateMachine *)mFSM canTransitionWithTriggeringEvent:v10];

  if ((mFSM & 1) == 0)
  {
    char v22 = @"kCATErrorMessageNameKey";
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v18);
    v23[0] = v17;
    v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v20 = CATErrorWithCodeAndUserInfo(302, v19);
    [(CATTaskClient *)self delegateDidInterruptWithError:v20];

    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  mRemoteTaskByUUID = self->mRemoteTaskByUUID;
  if (isKindOfClass)
  {
    id v13 = v5;
    int v14 = [v13 taskUUID];
    v15 = [(NSMapTable *)mRemoteTaskByUUID objectForKey:v14];

    uint64_t v16 = [v13 taskError];

    [v15 clientFailedWithError:v16];
  }
  else
  {
    v21 = [v5 taskUUID];
    v15 = [(NSMapTable *)mRemoteTaskByUUID objectForKey:v21];

    [v15 processMessage:v5];
  }

LABEL_10:
}

- (void)processNotificationMessage:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  uint64_t v7 = [v5 name];

  if (!v7)
  {
    v15 = CATErrorWithCodeAndUserInfo(301, 0);
    [(CATTaskClient *)self delegateDidInterruptWithError:v15];
LABEL_9:

    goto LABEL_10;
  }
  mFSM = self->mFSM;
  id v9 = NSStringFromSelector(a2);
  id v10 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];
  LOBYTE(mFSM) = [(CATStateMachine *)mFSM canTransitionWithTriggeringEvent:v10];

  if ((mFSM & 1) == 0)
  {
    v19 = @"kCATErrorMessageNameKey";
    uint64_t v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v20[0] = v15;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v18 = CATErrorWithCodeAndUserInfo(302, v17);
    [(CATTaskClient *)self delegateDidInterruptWithError:v18];

LABEL_8:
    goto LABEL_9;
  }
  id v11 = [v5 taskUUID];

  if (!v11)
  {
    v15 = [v5 name];
    uint64_t v17 = [v5 userInfo];
    [(CATTaskClient *)self delegatedidReceiveNotificationWithName:v15 userInfo:v17];
    goto LABEL_8;
  }
  mRemoteTaskByUUID = self->mRemoteTaskByUUID;
  id v13 = [v5 taskUUID];
  int v14 = [(NSMapTable *)mRemoteTaskByUUID objectForKey:v13];

  [v14 processMessage:v5];
LABEL_10:
}

- (void)delegatedidReceiveNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  id v8 = [(CATTaskClient *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CATTaskClient *)self delegate];
    [v10 client:self didReceiveNotificationWithName:v11 userInfo:v6];
  }
}

- (void)delegateDidConnect
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskClient *)self delegate];
    [v6 clientDidConnect:self];
  }
}

- (void)delegateDidInterruptWithError:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  char v5 = [(CATTaskClient *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CATTaskClient *)self delegate];
    [v7 client:self didInterruptWithError:v8];
  }
}

- (void)delegateDidDisconnect
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskClient *)self delegate];
    [v6 clientDidDisconnect:self];
  }
}

- (void)delegateWillInvalidate
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskClient *)self delegate];
    [v6 clientWillInvalidate:self];
  }
}

- (void)delegateDidInvalidate
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskClient *)self delegate];
    [v6 clientDidInvalidate:self];
  }
}

- (CATTransport)transport
{
  return self->mTransport;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (CATTaskClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATTaskClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)serverUserInfo
{
  return self->_serverUserInfo;
}

- (void)setServerUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->mSessionDidInvalidateGroup, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mOrphanedTransports, 0);
  objc_storeStrong((id *)&self->mEnqueuedTaskUUIDs, 0);
  objc_storeStrong((id *)&self->mEnqueuedMessages, 0);
  objc_storeStrong((id *)&self->mRemoteTaskByUUID, 0);
  objc_storeStrong((id *)&self->mActiveRemoteTaskOperations, 0);
  objc_storeStrong((id *)&self->mTransport, 0);

  objc_storeStrong((id *)&self->mFSM, 0);
}

@end