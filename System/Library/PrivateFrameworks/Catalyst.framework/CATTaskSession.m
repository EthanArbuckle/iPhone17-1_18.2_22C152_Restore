@interface CATTaskSession
- (BOOL)delegateShouldAcceptConnection;
- (CATTaskSession)init;
- (CATTaskSessionDelegate)delegate;
- (CATTransport)transport;
- (NSDictionary)clientUserInfo;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSUUID)sessionUUID;
- (id)captureTransport;
- (id)delegatePrepareOperationWithRequest:(id)a3 error:(id *)a4;
- (void)abandonTransport;
- (void)acceptConnection;
- (void)clearQueuedMessagesAndCancelAllOperationsWithError:(id)a3;
- (void)clientDidResumeWithMessage:(id)a3;
- (void)connectWithTransport:(id)a3;
- (void)connectWithTransportFromTaskSession:(id)a3;
- (void)dealloc;
- (void)delegateDidConnect;
- (void)delegateDidDisconnect;
- (void)delegateDidInterruptWithError:(id)a3;
- (void)delegateDidInvalidate;
- (void)delegateDidInvalidateAndFinalize;
- (void)delegateEnqueueOperation:(id)a3;
- (void)delegateWillInvalidate;
- (void)delegateWillInvalidateAndInvalidateSessionWithError:(id)a3;
- (void)delegatedidReceiveNotificationWithName:(id)a3;
- (void)didCompleteSendForMessage:(id)a3;
- (void)discardPreviousSessionInfo;
- (void)disconnect;
- (void)enqueueDelegateDidInterruptWithError:(id)a3;
- (void)enqueueMessage:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)evaluateConnectionWithResumeMessage:(id)a3;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)localOperationDidFinish:(id)a3;
- (void)operationDidFinish:(id)a3 remoteUUID:(id)a4;
- (void)operationDidIncrementProgress:(id)a3 remoteUUID:(id)a4;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)processCancelMessage:(id)a3;
- (void)processFetchProgressMessage:(id)a3;
- (void)processNotificationMessage:(id)a3;
- (void)processSessionMessage:(id)a3;
- (void)processStartMessage:(id)a3;
- (void)processTaskMessage:(id)a3;
- (void)rejectConnection;
- (void)restorePreviousSessionInfo;
- (void)resumeCapturedTransportFromTaskSession:(id)a3;
- (void)resumeTransport:(id)a3;
- (void)savePreviousSessionInfo;
- (void)sendMessage:(id)a3;
- (void)sendMessageThroughTransport:(id)a3;
- (void)sendResumedMessage;
- (void)sessionDidInvalidate;
- (void)setClientUserInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)transport:(id)a3 didFailToSendMessage:(id)a4 error:(id)a5;
- (void)transport:(id)a3 didInterruptWithError:(id)a4;
- (void)transport:(id)a3 didReceiveMessage:(id)a4;
- (void)transport:(id)a3 didSendMessage:(id)a4;
- (void)transportDidInvalidate:(id)a3;
@end

@implementation CATTaskSession

- (void)dealloc
{
  v4 = [(CATStateMachine *)self->mFSM currentState];
  v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"Invalidated"];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CATTaskSession.m", 65, @"%@ cannot dealloc while receiver is still valid.", self object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)CATTaskSession;
  [(CATTaskSession *)&v8 dealloc];
}

- (CATTaskSession)init
{
  v24.receiver = self;
  v24.super_class = (Class)CATTaskSession;
  v2 = [(CATTaskSession *)&v24 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mOperations = v2->mOperations;
    v2->mOperations = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    mOperationByRemoteUUID = v2->mOperationByRemoteUUID;
    v2->mOperationByRemoteUUID = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    mEnqueuedMessages = v2->mEnqueuedMessages;
    v2->mEnqueuedMessages = (NSMutableArray *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    mSessionDidInvalidateGroup = v2->mSessionDidInvalidateGroup;
    v2->mSessionDidInvalidateGroup = (OS_dispatch_group *)v9;

    uint64_t v11 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    mRemoteUUIDsByFinishedOperationProgressUpdates = v2->mRemoteUUIDsByFinishedOperationProgressUpdates;
    v2->mRemoteUUIDsByFinishedOperationProgressUpdates = (NSMapTable *)v11;

    v13 = [[CATStateMachine alloc] initWithTarget:v2];
    mFSM = v2->mFSM;
    v2->mFSM = v13;

    v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v16 = [v15 valueForKey:@"CATTaskLogLevel"];
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", [v16 integerValue]);

    v17 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Disconnected"];
    v18 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connecting"];
    v19 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Negotiating"];
    v20 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connected"];
    v21 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidating"];
    v23 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidated"];
    objc_msgSend(v17, "setEnterAction:");
    [v17 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueMessage_];
    [v17 addTransitionToState:v18 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v17 addTransitionToState:v20 triggeringEvent:@"connectWithTransportFromTaskSession:" action:sel_resumeCapturedTransportFromTaskSession_];
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v21, @"invalidateWithError:");
    [v18 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueMessage_];
    [v18 addTransitionToState:v18 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v18 addTransitionToState:v20 triggeringEvent:@"connectWithTransportFromTaskSession:" action:sel_resumeCapturedTransportFromTaskSession_];
    [v18 addTransitionToState:v19 triggeringEvent:@"clientDidResumeWithMessage:"];
    [v18 addTransitionToState:v17 triggeringEvent:@"transportDidInvalidate:"];
    [v18 addTransitionToState:v21 triggeringEvent:@"invalidateWithError:" action:sel_clearQueuedMessagesAndCancelAllOperationsWithError_];
    [v19 setEnterAction:sel_evaluateConnectionWithResumeMessage_];
    [v19 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueMessage_];
    [v19 addTransitionToState:v18 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v19 addTransitionToState:v20 triggeringEvent:@"connectWithTransportFromTaskSession:" action:sel_resumeCapturedTransportFromTaskSession_];
    [v19 addTransitionToState:v19 triggeringEvent:@"clientDidResumeWithMessage:"];
    [v19 addTransitionToState:v20 triggeringEvent:@"acceptConnection" action:sel_sendResumedMessage];
    [v19 addTransitionToState:0 triggeringEvent:@"rejectConnection" action:sel_enqueueDelegateDidInterruptWithError_];
    [v19 addTransitionToState:v17 triggeringEvent:@"transportDidInvalidate:"];
    [v19 addTransitionToState:v21 triggeringEvent:@"invalidateWithError:" action:sel_clearQueuedMessagesAndCancelAllOperationsWithError_];
    [v20 setEnterAction:sel_delegateDidConnect];
    [v20 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_sendMessageThroughTransport_];
    [v20 addTransitionToState:0 triggeringEvent:@"processTaskMessage:"];
    [v20 addTransitionToState:0 triggeringEvent:@"processNotificationMessage:"];
    [v20 addTransitionToState:v18 triggeringEvent:@"connectWithTransport:" action:sel_resumeTransport_];
    [v20 addTransitionToState:v20 triggeringEvent:@"connectWithTransportFromTaskSession:" action:sel_resumeCapturedTransportFromTaskSession_];
    [v20 addTransitionToState:v19 triggeringEvent:@"clientDidResumeWithMessage:"];
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", v17);
    [v20 addTransitionToState:v21 triggeringEvent:@"invalidateWithError:" action:sel_clearQueuedMessagesAndCancelAllOperationsWithError_];
    [v20 setExitAction:sel_delegateDidDisconnect];
    [v21 setEnterAction:sel_delegateWillInvalidateAndInvalidateSessionWithError_];
    [v21 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_didCompleteSendForMessage_];
    [v21 addTransitionToState:0 triggeringEvent:@"invalidateWithError:"];
    [v21 addTransitionToState:0 triggeringEvent:@"clientDidResumeWithMessage:"];
    [v21 addTransitionToState:0 triggeringEvent:@"rejectConnection"];
    [v21 addTransitionToState:0 triggeringEvent:@"transportDidInvalidate:" action:sel_abandonTransport];
    [v21 addTransitionToState:v23 triggeringEvent:@"sessionDidInvalidate"];
    [v23 setEnterAction:sel_delegateDidInvalidateAndFinalize];
    [v23 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_didCompleteSendForMessage_];
    [v23 addTransitionToState:0 triggeringEvent:@"invalidateWithError:"];
    [v23 addTransitionToState:0 triggeringEvent:@"clientDidResumeWithMessage:"];
    [v23 addTransitionToState:0 triggeringEvent:@"transportDidInvalidate:"];
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
  objc_super v8 = [(CATTaskSession *)self sessionUUID];
  uint64_t v9 = [v8 UUIDString];
  v10 = (void *)v9;
  if (mTransport) {
    [v4 stringWithFormat:@"<%@: %p { state = %@, session = %@, transport = %@ }>", v5, self, v7, v9, self->mTransport];
  }
  else {
  uint64_t v11 = [v4 stringWithFormat:@"<%@: %p { state = %@, session = %@ }>", v5, self, v7, v9, v13];
  }

  return (NSString *)v11;
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = CATGetCatalystQueue();
  CATAssertIsQueue(v9);

  if (!v8)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATTaskSession.m", 161, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  uint64_t v11 = [[CATNotificationMessage alloc] initWithName:v8 userInfo:v7];

  [(CATTaskSession *)self sendMessage:v11];
}

- (void)enqueueOperation:(id)a3
{
  id v13 = a3;
  if (!v13)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATTaskSession.m", 169, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  uint64_t v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(NSMutableSet *)self->mOperations addObject:v13];
  dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = CATGetCatalystQueue();
    [v13 addTarget:self selector:sel_localOperationDidFinish_ forOperationEvents:6 delegateQueue:v6];
  }
  else
  {
    if (!self->mDelegationQueue)
    {
      id v7 = (CATOperationQueue *)objc_opt_new();
      mDelegationQueue = self->mDelegationQueue;
      self->mDelegationQueue = v7;

      uint64_t v9 = CATGetCatalystQueue();
      [(CATOperationQueue *)self->mDelegationQueue setUnderlyingQueue:v9];

      v10 = [NSString stringWithFormat:@"%@.%p.delegation", objc_opt_class(), self];
      [(CATOperationQueue *)self->mDelegationQueue setName:v10];
    }
    char v6 = (void *)[objc_alloc(MEMORY[0x263F088D8]) initWithTarget:self selector:sel_localOperationDidFinish_ object:v13];
    uint64_t v11 = [v6 invocation];
    [v11 retainArguments];

    [v6 addDependency:v13];
    [(CATOperationQueue *)self->mDelegationQueue addOperation:v6];
  }

  [(CATTaskSession *)self delegateEnqueueOperation:v13];
}

- (void)localOperationDidFinish:(id)a3
{
  id v5 = a3;
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(NSMutableSet *)self->mOperations containsObject:v5])
  {
    [(NSMutableSet *)self->mOperations removeObject:v5];
    dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  }
}

- (void)connectWithTransport:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)connectWithTransportFromTaskSession:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CATTaskSession.m", 214, @"Invalid parameter not satisfying: %@", @"otherSession" object file lineNumber description];
  }
  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[CATStateMachineEvent eventWithTrigger:v10 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)disconnect
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mTransport = self->mTransport;

  [(CATTransport *)mTransport invalidate];
}

- (void)invalidate
{
  CATErrorWithCodeAndUserInfo(503, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CATTaskSession *)self invalidateWithError:v3];
}

- (void)invalidateWithError:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)clientDidResumeWithMessage:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)evaluateConnectionWithResumeMessage:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATTaskSession *)self savePreviousSessionInfo];
  char v6 = [v4 sessionUUID];
  [(CATTaskSession *)self setSessionUUID:v6];

  id v7 = [v4 clientUserInfo];

  [(CATTaskSession *)self setClientUserInfo:v7];
  if ([(CATTaskSession *)self delegateShouldAcceptConnection])
  {
    id v8 = [(CATTaskSession *)self sessionUUID];

    if (!v8)
    {
      id v9 = [MEMORY[0x263F08C38] UUID];
      [(CATTaskSession *)self setSessionUUID:v9];
    }
    [(CATTaskSession *)self discardPreviousSessionInfo];
    [(CATTaskSession *)self acceptConnection];
  }
  else if (self->mTransport)
  {
    [(CATTaskSession *)self restorePreviousSessionInfo];
    [(CATTaskSession *)self rejectConnection];
  }
}

- (void)acceptConnection
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)rejectConnection
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = CATErrorWithCodeAndUserInfo(504, 0);
  id v7 = +[CATStateMachineEvent eventWithTrigger:v8 context:v6];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v7];
}

- (void)resumeCapturedTransportFromTaskSession:(id)a3
{
  v12 = (CATTaskSession *)a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  char v6 = v12;
  if (!v12)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CATTaskSession.m", 293, @"Invalid parameter not satisfying: %@", @"otherSession" object file lineNumber description];

    char v6 = 0;
  }
  if (self == v6)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, v12, @"CATTaskSession.m", 294, @"%@ cannot call %@ when the other session is the receiver", v12, v11 object file lineNumber description];

    char v6 = v12;
  }
  id v7 = [(CATTaskSession *)v6 clientUserInfo];
  [(CATTaskSession *)self setClientUserInfo:v7];

  id v8 = [(CATTaskSession *)v12 captureTransport];
  [(CATTaskSession *)self resumeTransport:v8];
  [(CATTaskSession *)self sendResumedMessage];
}

- (id)captureTransport
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mTransport = self->mTransport;
  if (!mTransport)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CATTaskSession.m", 308, @"%@ cannot call %@ when there is no transport", self, v11 object file lineNumber description];

    mTransport = self->mTransport;
  }
  char v6 = mTransport;
  [(CATTransport *)v6 suspend];
  [(CATTransport *)v6 setDelegate:0];
  id v7 = self->mTransport;
  self->mTransport = 0;

  [(CATTaskSession *)self restorePreviousSessionInfo];
  id v8 = CATErrorWithCodeAndUserInfo(505, 0);
  [(CATTaskSession *)self invalidateWithError:v8];

  dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);

  return v6;
}

- (void)savePreviousSessionInfo
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (self->mPreviousSessionInfo)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CATTaskSession.m", 335, @"%@ cannot call %@ when previous session has not been popped", self, v10 object file lineNumber description];
  }
  id v11 = (id)objc_opt_new();
  id v5 = [(CATTaskSession *)self sessionUUID];
  [v11 setObject:v5 forKeyedSubscript:@"_CATTaskSessionUUID"];

  char v6 = [(CATTaskSession *)self clientUserInfo];
  [v11 setObject:v6 forKeyedSubscript:@"_CATTaskSessionClientUserInfo"];

  id v7 = (NSDictionary *)[v11 copy];
  mPreviousSessionInfo = self->mPreviousSessionInfo;
  self->mPreviousSessionInfo = v7;
}

- (void)restorePreviousSessionInfo
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mPreviousSessionInfo = self->mPreviousSessionInfo;
  if (mPreviousSessionInfo)
  {
    id v5 = [(NSDictionary *)mPreviousSessionInfo objectForKeyedSubscript:@"_CATTaskSessionUUID"];
    [(CATTaskSession *)self setSessionUUID:v5];

    id v6 = [(NSDictionary *)self->mPreviousSessionInfo objectForKeyedSubscript:@"_CATTaskSessionClientUserInfo"];
    [(CATTaskSession *)self setClientUserInfo:v6];
  }
}

- (void)discardPreviousSessionInfo
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mPreviousSessionInfo = self->mPreviousSessionInfo;
  self->mPreviousSessionInfo = 0;
}

- (void)resumeTransport:(id)a3
{
  id v9 = (CATTransport *)a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CATTaskSession.m", 365, @"Invalid parameter not satisfying: %@", @"transport" object file lineNumber description];
  }
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  id v7 = v9;
  if (self->mTransport != v9)
  {
    dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
    [(CATTaskSession *)self abandonTransport];
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

- (void)delegateWillInvalidateAndInvalidateSessionWithError:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATTaskSession *)self delegateWillInvalidate];
  objc_storeStrong((id *)&self->mStrongSelf, self);
  if (self->mTransport)
  {
    id v6 = [[CATSessionMessageDidInvalidate alloc] initWithError:v4];
    [(CATTaskSession *)self sendMessageThroughTransport:v6];
  }
  mSessionDidInvalidateGroup = self->mSessionDidInvalidateGroup;
  id v8 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CATTaskSession_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke;
  block[3] = &unk_2641DBE60;
  block[4] = self;
  dispatch_group_notify(mSessionDidInvalidateGroup, v8, block);
}

uint64_t __70__CATTaskSession_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke(uint64_t a1)
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

- (void)clearQueuedMessagesAndCancelAllOperationsWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [(NSMutableDictionary *)self->mOperationByRemoteUUID allValues];
  [v5 makeObjectsPerformSelector:sel_cancel];

  [(NSMutableSet *)self->mOperations makeObjectsPerformSelector:sel_cancel];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->mEnqueuedMessages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = -[NSMapTable objectForKey:](self->mRemoteUUIDsByFinishedOperationProgressUpdates, "objectForKey:", v11, (void)v13);
        [(NSMapTable *)self->mRemoteUUIDsByFinishedOperationProgressUpdates removeObjectForKey:v11];
        if (v12)
        {
          [(NSMutableDictionary *)self->mOperationByRemoteUUID removeObjectForKey:v12];
          dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->mEnqueuedMessages removeAllObjects];
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

- (void)sendResumedMessage
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [CATSessionMessageResumed alloc];
  id v5 = [(CATTaskSession *)self sessionUUID];
  id v6 = [(CATSessionMessageResumed *)v4 initWithSessionUUID:v5];

  uint64_t v7 = [(NSMutableDictionary *)self->mOperationByRemoteUUID allKeys];
  [(CATSessionMessageResumed *)v6 setPendingRemoteTaskUUIDs:v7];

  uint64_t v8 = [(CATTaskSession *)self userInfo];
  [(CATSessionMessageResumed *)v6 setServerUserInfo:v8];

  [(CATTaskSession *)self sendMessageThroughTransport:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = self->mEnqueuedMessages;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CATTaskSession sendMessageThroughTransport:](self, "sendMessageThroughTransport:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->mEnqueuedMessages removeAllObjects];
}

- (void)sendMessageThroughTransport:(id)a3
{
  id v8 = a3;
  if (!self->mTransport)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CATTaskSession.m", 489, @"%@ cannot call %@ with %@ when there is no transport", self, v7, v8 object file lineNumber description];
  }
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATTransport *)self->mTransport sendMessage:v8];
}

- (void)enqueueMessage:(id)a3
{
  id v5 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  [(NSMutableArray *)self->mEnqueuedMessages addObject:v5];
}

- (void)didCompleteSendForMessage:(id)a3
{
  id v6 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CATTransport *)self->mTransport invalidate];
  }
  id v5 = [(NSMapTable *)self->mRemoteUUIDsByFinishedOperationProgressUpdates objectForKey:v6];
  if (v5)
  {
    [(NSMapTable *)self->mRemoteUUIDsByFinishedOperationProgressUpdates removeObjectForKey:v6];
    [(NSMutableDictionary *)self->mOperationByRemoteUUID removeObjectForKey:v5];
    dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  }
}

- (void)delegateDidInvalidateAndFinalize
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATTaskSession *)self delegateDidInvalidate];
  if (self->mStrongSelf)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __50__CATTaskSession_delegateDidInvalidateAndFinalize__block_invoke;
    v4[3] = &unk_2641DBCB0;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x263EF83A0], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __50__CATTaskSession_delegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)transport:(id)a3 didSendMessage:(id)a4
{
}

- (void)transport:(id)a3 didFailToSendMessage:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_CATLogGeneral_onceToken_16 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_16, &__block_literal_global_22);
  }
  uint64_t v11 = _CATLogGeneral_logObj_16;
  if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_16, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543874;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_error_impl(&dword_213B7F000, v11, OS_LOG_TYPE_ERROR, "%{public}@ failed to send message %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [(CATTaskSession *)self didCompleteSendForMessage:v9];
}

- (void)transport:(id)a3 didReceiveMessage:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      id v8 = [v7 taskUUID];

      if (v8)
      {
        mOperationByRemoteUUID = self->mOperationByRemoteUUID;
        id v10 = [v7 taskUUID];
        uint64_t v11 = [(NSMutableDictionary *)mOperationByRemoteUUID objectForKeyedSubscript:v10];

        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v13 = [v7 name];
        __int16 v14 = [v7 userInfo];
        if (isKindOfClass) {
          [v11 postNotificationWithName:v13 userInfo:v14];
        }
        else {
          [v11 processNotificationWithName:v13 userInfo:v14];
        }
      }
      else
      {
        [(CATTaskSession *)self processNotificationMessage:v7];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CATTaskSession *)self processTaskMessage:v5];
        goto LABEL_14;
      }
      uint64_t v18 = @"kCATErrorMessageNameKey";
      id v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      __int16 v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v17 = CATErrorWithCodeAndUserInfo(300, v16);
      [(CATTaskSession *)self delegateDidInterruptWithError:v17];
    }
    goto LABEL_14;
  }
  [(CATTaskSession *)self processSessionMessage:v5];
LABEL_14:
}

- (void)transport:(id)a3 didInterruptWithError:(id)a4
{
  id v6 = a4;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATTaskSession *)self delegateDidInterruptWithError:v6];
}

- (void)transportDidInvalidate:(id)a3
{
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = +[CATStateMachineEvent eventWithTrigger:v8 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v7];
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_getAssociatedObject(v8, @"_CATTaskSessionOperationRemoteUUID");
  if (v11)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__CATTaskSession_taskOperation_didPostNotificationWithName_userInfo___block_invoke;
    v14[3] = &unk_2641DC5D8;
    id v15 = v8;
    id v16 = v11;
    id v17 = v9;
    id v18 = v10;
    uint64_t v19 = self;
    int v12 = v14;
    uint64_t v13 = CATGetCatalystQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_16;
    block[3] = &unk_2641DBD98;
    id v21 = v12;
    dispatch_async(v13, block);
  }
}

void __69__CATTaskSession_taskOperation_didPostNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v2 = [[CATNotificationMessage alloc] initWithTaskUUID:*(void *)(a1 + 40) name:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
    [*(id *)(a1 + 64) sendMessage:v2];
  }
}

- (void)processSessionMessage:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = @"kCATErrorMessageNameKey";
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v18 = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      int v12 = CATErrorWithCodeAndUserInfo(300, v11);
      [(CATTaskSession *)self delegateDidInterruptWithError:v12];

LABEL_14:
      goto LABEL_15;
    }
    id v6 = [v4 error];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      CATErrorWithCodeAndUserInfo(503, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = v8;

    uint64_t v13 = [v10 domain];
    if ([v13 isEqualToString:@"Catalyst.error"])
    {
      uint64_t v14 = [v10 code];

      if (v14 == 503) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v10;
    id v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v16 = CATErrorWithCodeAndUserInfo(503, v15);

    id v10 = (void *)v16;
LABEL_13:
    [(CATTaskSession *)self delegateDidInterruptWithError:v10];
    goto LABEL_14;
  }
  [(CATTaskSession *)self clientDidResumeWithMessage:v4];
LABEL_15:
}

- (void)processTaskMessage:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  id v7 = [v5 taskUUID];

  if (!v7)
  {
    uint64_t v11 = CATErrorWithCodeAndUserInfo(301, 0);
    [(CATTaskSession *)self delegateDidInterruptWithError:v11];
LABEL_8:

    goto LABEL_9;
  }
  mFSM = self->mFSM;
  id v9 = NSStringFromSelector(a2);
  id v10 = +[CATStateMachineEvent eventWithTrigger:v9 context:0];
  LOBYTE(mFSM) = [(CATStateMachine *)mFSM canTransitionWithTriggeringEvent:v10];

  if ((mFSM & 1) == 0)
  {
    uint64_t v19 = @"kCATErrorMessageNameKey";
    int v12 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v12);
    v20[0] = v11;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v14 = 302;
LABEL_7:
    id v15 = CATErrorWithCodeAndUserInfo(v14, v13);
    [(CATTaskSession *)self delegateDidInterruptWithError:v15];

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CATTaskSession *)self processCancelMessage:v5];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CATTaskSession *)self processFetchProgressMessage:v5];
      goto LABEL_9;
    }
    id v17 = @"kCATErrorMessageNameKey";
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v16);
    id v18 = v11;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v14 = 300;
    goto LABEL_7;
  }
  [(CATTaskSession *)self processStartMessage:v5];
LABEL_9:
}

- (void)processStartMessage:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = [v4 request];

  if (v6)
  {
    id v7 = [v4 request];
    id v27 = 0;
    id v8 = [(CATTaskSession *)self delegatePrepareOperationWithRequest:v7 error:&v27];
    id v9 = v27;

    if (v8)
    {
      id v10 = [v4 taskUUID];
      objc_setAssociatedObject(v8, @"_CATTaskSessionOperationRemoteUUID", v10, (void *)0x303);
      uint64_t v11 = [v8 notificationDelegate];

      if (!v11) {
        [v8 setNotificationDelegate:self];
      }
      [(NSMutableDictionary *)self->mOperationByRemoteUUID setObject:v8 forKeyedSubscript:v10];
      int v12 = objc_msgSend(v4, "cat_assertion");
      objc_msgSend(v8, "cat_addAssertion:", v12);

      dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
      uint64_t v13 = CATGetCatalystQueue();
      [v8 addTarget:self selector:sel_operationDidIncrementProgress_remoteUUID_ forOperationEvents:8 userInfo:v10 delegateQueue:v13];

      uint64_t v14 = CATGetCatalystQueue();
      [v8 addTarget:self selector:sel_operationDidFinish_remoteUUID_ forOperationEvents:6 userInfo:v10 delegateQueue:v14];

      id v15 = [[CATMutableTaskProgress alloc] initWithOperationUUID:v10];
      [(CATTaskProgress *)v15 setPhase:0];
      uint64_t v16 = [[CATTaskMessageProgressUpdate alloc] initWithTaskUUID:v10 progress:v15];
      [(CATTaskSession *)self sendMessage:v16];
      [(CATTaskSession *)self delegateEnqueueOperation:v8];
    }
    else
    {
      if (!v9)
      {
        v28 = @"kCATErrorRequestNameKey";
        id v21 = [v4 request];
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v29[0] = v23;
        objc_super v24 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
        CATErrorWithCodeAndUserInfo(403, v24);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = [CATTaskMessageError alloc];
      v26 = [v4 taskUUID];
      id v10 = [(CATTaskMessageError *)v25 initWithTaskUUID:v26 taskError:v9];

      [(CATTaskSession *)self sendMessage:v10];
    }
  }
  else
  {
    id v17 = CATErrorWithCodeAndUserInfo(403, 0);
    id v18 = [CATTaskMessageError alloc];
    uint64_t v19 = [v4 taskUUID];
    v20 = [(CATTaskMessageError *)v18 initWithTaskUUID:v19 taskError:v17];

    [(CATTaskSession *)self sendMessage:v20];
  }
}

- (void)operationDidIncrementProgress:(id)a3 remoteUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  if (self->mTransport)
  {
    id v8 = -[CATTaskMessageIncrementalProgress initWithTaskUUID:completedUnitCount:totalUnitCount:]([CATTaskMessageIncrementalProgress alloc], "initWithTaskUUID:completedUnitCount:totalUnitCount:", v6, [v9 completedUnitCount], objc_msgSend(v9, "totalUnitCount"));
    [(CATTaskSession *)self sendMessageThroughTransport:v8];
  }
}

- (void)operationDidFinish:(id)a3 remoteUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  id v11 = +[CATTaskProgress progressForOperation:v7];
  id v9 = [[CATTaskMessageProgressUpdate alloc] initWithTaskUUID:v6 progress:v11];
  [(NSMapTable *)self->mRemoteUUIDsByFinishedOperationProgressUpdates setObject:v6 forKey:v9];

  id v10 = objc_msgSend(v7, "cat_assertions");

  [(CATMessage *)v9 setCat_assertion:v10];
  [(CATTaskSession *)self sendMessage:v9];
}

- (void)processCancelMessage:(id)a3
{
  id v12 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mOperationByRemoteUUID = self->mOperationByRemoteUUID;
  id v6 = [v12 taskUUID];
  id v7 = [(NSMutableDictionary *)mOperationByRemoteUUID objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 cancel];
  }
  else
  {
    id v8 = CATErrorWithCodeAndUserInfo(401, 0);
    id v9 = [CATTaskMessageError alloc];
    id v10 = [v12 taskUUID];
    id v11 = [(CATTaskMessageError *)v9 initWithTaskUUID:v10 taskError:v8];

    [(CATTaskSession *)self sendMessage:v11];
  }
}

- (void)processFetchProgressMessage:(id)a3
{
  id v14 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mOperationByRemoteUUID = self->mOperationByRemoteUUID;
  id v6 = [v14 taskUUID];
  id v7 = [(NSMutableDictionary *)mOperationByRemoteUUID objectForKeyedSubscript:v6];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 fetchProgress];
      goto LABEL_7;
    }
    id v8 = +[CATTaskProgress progressForOperation:v7];
    id v12 = [CATTaskMessageProgressUpdate alloc];
    id v10 = [v14 taskUUID];
    uint64_t v11 = [(CATTaskMessageProgressUpdate *)v12 initWithTaskUUID:v10 progress:v8];
  }
  else
  {
    id v8 = CATErrorWithCodeAndUserInfo(401, 0);
    id v9 = [CATTaskMessageError alloc];
    id v10 = [v14 taskUUID];
    uint64_t v11 = [(CATTaskMessageError *)v9 initWithTaskUUID:v10 taskError:v8];
  }
  uint64_t v13 = (void *)v11;

  [(CATTaskSession *)self sendMessage:v13];
LABEL_7:
}

- (void)processNotificationMessage:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  id v7 = [v5 name];

  if (!v7)
  {
    uint64_t v11 = CATErrorWithCodeAndUserInfo(301, 0);
    [(CATTaskSession *)self delegateDidInterruptWithError:v11];
LABEL_6:

    goto LABEL_7;
  }
  mFSM = self->mFSM;
  id v9 = NSStringFromSelector(a2);
  id v10 = +[CATStateMachineEvent eventWithTrigger:v9 context:0];
  LOBYTE(mFSM) = [(CATStateMachine *)mFSM canTransitionWithTriggeringEvent:v10];

  if ((mFSM & 1) == 0)
  {
    id v15 = @"kCATErrorMessageNameKey";
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v12);
    v16[0] = v11;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v14 = CATErrorWithCodeAndUserInfo(302, v13);
    [(CATTaskSession *)self delegateDidInterruptWithError:v14];

    goto LABEL_6;
  }
  [(CATTaskSession *)self delegatedidReceiveNotificationWithName:v5];
LABEL_7:
}

- (id)delegatePrepareOperationWithRequest:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  id v8 = [(CATTaskSession *)self delegate];

  if (v8)
  {
    id v9 = [(CATTaskSession *)self delegate];
    a4 = [v9 session:self prepareOperationForRequest:v6 error:a4];
  }
  else if (a4)
  {
    id v14 = @"kCATErrorRequestNameKey";
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    v15[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    CATErrorWithCodeAndUserInfo(403, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (void)delegateEnqueueOperation:(id)a3
{
  id v12 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [(CATTaskSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATTaskSession *)self delegate];
    [v7 session:self enqueueOperation:v12];
  }
  else
  {
    mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    if (!mOrphanedOperationQueue)
    {
      id v9 = (CATOperationQueue *)objc_opt_new();
      id v10 = self->mOrphanedOperationQueue;
      self->mOrphanedOperationQueue = v9;

      uint64_t v11 = [NSString stringWithFormat:@"%@.%p.orphaned", objc_opt_class(), self];
      [(CATOperationQueue *)self->mOrphanedOperationQueue setName:v11];

      [(CATOperationQueue *)self->mOrphanedOperationQueue setMaxConcurrentOperationCount:0x7FFFFFFFFFFFFFFFLL];
      mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    }
    [(CATOperationQueue *)mOrphanedOperationQueue addOperation:v12];
  }
}

- (BOOL)delegateShouldAcceptConnection
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  char v6 = [(CATTaskSession *)self delegate];
  char v7 = [v6 session:self shouldAcceptConnectionFromTransport:self->mTransport];

  return v7;
}

- (void)delegatedidReceiveNotificationWithName:(id)a3
{
  id v10 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  char v5 = [(CATTaskSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(CATTaskSession *)self delegate];
    id v8 = [v10 name];
    id v9 = [v10 userInfo];
    [v7 session:self didReceiveNotificationWithName:v8 userInfo:v9];
  }
}

- (void)delegateDidConnect
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskSession *)self delegate];
    [v6 sessionDidConnect:self];
  }
}

- (void)enqueueDelegateDidInterruptWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__CATTaskSession_enqueueDelegateDidInterruptWithError___block_invoke;
  v8[3] = &unk_2641DC0C0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = v8;
  char v7 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_16;
  block[3] = &unk_2641DBD98;
  id v13 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__CATTaskSession_enqueueDelegateDidInterruptWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained delegateDidInterruptWithError:*(void *)(a1 + 32)];
}

- (void)delegateDidInterruptWithError:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [(CATTaskSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(CATTaskSession *)self delegate];
    [v7 session:self didInterruptWithError:v8];
  }
}

- (void)delegateDidDisconnect
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskSession *)self delegate];
    [v6 sessionDidDisconnect:self];
  }
}

- (void)delegateWillInvalidate
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskSession *)self delegate];
    [v6 sessionWillInvalidate:self];
  }
}

- (void)delegateDidInvalidate
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTaskSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTaskSession *)self delegate];
    [v6 sessionDidInvalidate:self];
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

- (CATTaskSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATTaskSessionDelegate *)WeakRetained;
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

- (NSDictionary)clientUserInfo
{
  return self->_clientUserInfo;
}

- (void)setClientUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->mDelegationQueue, 0);
  objc_storeStrong((id *)&self->mSessionDidInvalidateGroup, 0);
  objc_storeStrong((id *)&self->mRemoteUUIDsByFinishedOperationProgressUpdates, 0);
  objc_storeStrong((id *)&self->mPreviousSessionInfo, 0);
  objc_storeStrong((id *)&self->mOrphanedOperationQueue, 0);
  objc_storeStrong((id *)&self->mOrphanedTransports, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mEnqueuedMessages, 0);
  objc_storeStrong((id *)&self->mOperationByRemoteUUID, 0);
  objc_storeStrong((id *)&self->mOperations, 0);
  objc_storeStrong((id *)&self->mTransport, 0);

  objc_storeStrong((id *)&self->mFSM, 0);
}

@end