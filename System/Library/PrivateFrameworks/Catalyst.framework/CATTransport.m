@interface CATTransport
- (CATTransport)init;
- (CATTransportDelegate)delegate;
- (NSString)name;
- (id)debugDescription;
- (id)description;
- (id)operationToSendMessage:(id)a3;
- (void)cancelAndResumeQueuesAndEnqueueInvalidateConnection;
- (void)cancelHelloMessageAndResumeQueueOperations;
- (void)dealloc;
- (void)delegateDidInvalidate;
- (void)delegateDidResume;
- (void)didInterruptWithError:(id)a3;
- (void)didInvalidate;
- (void)didReceiveMessage:(id)a3;
- (void)enqueueDelegateCouldNotConnectWithError:(id)a3;
- (void)enqueueDelegateDidConnect;
- (void)enqueueDelegateDidInterruptWithError:(id)a3;
- (void)enqueueDelegateDidInvalidateAndFinalize;
- (void)enqueueDelegateDidReceiveMessage:(id)a3;
- (void)enqueueSendForMessage:(id)a3;
- (void)invalidSendForMessage:(id)a3;
- (void)invalidate;
- (void)invalidateConnection;
- (void)resume;
- (void)resumeConnection;
- (void)resumeQueue;
- (void)resumeQueueAndConnection;
- (void)sendHelloMessageAndResumeQueue;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)suspend;
- (void)suspendConnection;
- (void)suspendQueue;
- (void)suspendQueueAndConnection;
@end

@implementation CATTransport

- (void)dealloc
{
  v4 = [(CATStateMachine *)self->mFSM currentState];
  v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"Invalidated"];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CATTransport.m", 49, @"%@ cannot dealloc while receiver is still valid.", self object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)CATTransport;
  [(CATTransport *)&v8 dealloc];
}

- (CATTransport)init
{
  v23.receiver = self;
  v23.super_class = (Class)CATTransport;
  v2 = [(CATTransport *)&v23 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mControlQueue = v2->mControlQueue;
    v2->mControlQueue = (CATOperationQueue *)v3;

    v5 = [NSString stringWithFormat:@"%@.%p.control", objc_opt_class(), v2];
    [(CATOperationQueue *)v2->mControlQueue setName:v5];

    char v6 = CATGetCatalystQueue();
    [(CATOperationQueue *)v2->mControlQueue setUnderlyingQueue:v6];

    uint64_t v7 = objc_opt_new();
    mMessageQueue = v2->mMessageQueue;
    v2->mMessageQueue = (CATOperationQueue *)v7;

    [(CATOperationQueue *)v2->mMessageQueue setMaxConcurrentOperationCount:1];
    v9 = [NSString stringWithFormat:@"%@.%p.messages", objc_opt_class(), v2];
    [(CATOperationQueue *)v2->mMessageQueue setName:v9];

    v10 = CATGetCatalystQueue();
    [(CATOperationQueue *)v2->mMessageQueue setUnderlyingQueue:v10];

    [(CATOperationQueue *)v2->mMessageQueue setSuspended:1];
    v11 = [[CATStateMachine alloc] initWithTarget:v2];
    mFSM = v2->mFSM;
    v2->mFSM = v11;

    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v14 = [v13 valueForKey:@"CATTransportLogLevel"];
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", [v14 integerValue]);

    v15 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Not Connected (Suspended)"];
    v16 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connecting"];
    v17 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connecting (Suspended)"];
    v18 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connected"];
    v22 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Connected (Suspended)"];
    v19 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidating"];
    v21 = [(CATStateMachine *)v2->mFSM addStateWithName:@"Invalidated"];
    [v15 addTransitionToState:v16 triggeringEvent:@"resume" action:sel_sendHelloMessageAndResumeQueue];
    [v15 addTransitionToState:v19 triggeringEvent:@"invalidate"];
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", 0);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v16, @"resume");
    [v17 addTransitionToState:v19 triggeringEvent:@"invalidate" action:sel_cancelHelloMessageAndResumeQueueOperations];
    [v17 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueSendForMessage_];
    [v16 addTransitionToState:v17 triggeringEvent:@"suspend" action:sel_suspendQueueAndConnection];
    [v16 addTransitionToState:v19 triggeringEvent:@"invalidate" action:sel_cancelHelloMessageAndResumeQueueOperations];
    [v16 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueSendForMessage_];
    [v16 addTransitionToState:v18 triggeringEvent:@"didReceiveMessage:" action:sel_enqueueDelegateDidConnect];
    [v16 addTransitionToState:0 triggeringEvent:@"didInterruptWithError:" action:sel_enqueueDelegateCouldNotConnectWithError_];
    [v18 addTransitionToState:v22 triggeringEvent:@"suspend" action:sel_suspendQueueAndConnection];
    [v18 addTransitionToState:v19 triggeringEvent:@"invalidate"];
    [v18 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueSendForMessage_];
    [v18 addTransitionToState:0 triggeringEvent:@"didReceiveMessage:" action:sel_enqueueDelegateDidReceiveMessage_];
    [v18 addTransitionToState:0 triggeringEvent:@"didInterruptWithError:" action:sel_enqueueDelegateDidInterruptWithError_];
    [v22 addTransitionToState:v18 triggeringEvent:@"resume" action:sel_resumeQueueAndConnection];
    [v22 addTransitionToState:v19 triggeringEvent:@"invalidate"];
    [v22 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_enqueueSendForMessage_];
    [v19 setEnterAction:sel_cancelAndResumeQueuesAndEnqueueInvalidateConnection];
    [v19 addTransitionToState:0 triggeringEvent:@"invalidate"];
    [v19 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_invalidSendForMessage_];
    [v19 addTransitionToState:v21 triggeringEvent:@"didInvalidate"];
    [v19 addTransitionToState:0 triggeringEvent:@"didReceiveMessage:"];
    [v19 addTransitionToState:0 triggeringEvent:@"didInterruptWithError:"];
    [v21 setEnterAction:sel_enqueueDelegateDidInvalidateAndFinalize];
    [v21 addTransitionToState:0 triggeringEvent:@"invalidate"];
    [v21 addTransitionToState:0 triggeringEvent:@"sendMessage:" action:sel_invalidSendForMessage_];
    [v21 addTransitionToState:0 triggeringEvent:@"didInterruptWithError:"];
    [(CATStateMachine *)v2->mFSM start];
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = [(CATTransport *)self name];

  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    char v6 = [(CATTransport *)self name];
    uint64_t v7 = [(CATStateMachine *)self->mFSM currentState];
    objc_super v8 = [v7 name];
    v9 = [v4 stringWithFormat:@"<%@: %p { name = %@, state = %@ }>", v5, self, v6, v8];
  }
  else
  {
    char v6 = [(CATStateMachine *)self->mFSM currentState];
    uint64_t v7 = [v6 name];
    v9 = [v4 stringWithFormat:@"<%@: %p { state = %@ }>", v5, self, v7];
  }

  return v9;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  v4 = [(CATTransport *)self description];
  uint64_t v5 = [v3 stringWithString:v4];

  [v5 appendFormat:@"\nControl Queue:%@", self->mControlQueue];
  [v5 appendFormat:@"\nMessage Queue:%@", self->mMessageQueue];

  return v5;
}

- (void)resume
{
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)suspend
{
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)invalidate
{
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)sendMessage:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)didReceiveMessage:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  id v7 = NSStringFromSelector(a2);
  objc_super v8 = +[CATStateMachineEvent eventWithTrigger:v7 context:v5];

  id v9 = (void *)MEMORY[0x263F086D0];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __34__CATTransport_didReceiveMessage___block_invoke;
  v15 = &unk_2641DC000;
  v16 = self;
  id v17 = v8;
  id v10 = v8;
  v11 = [v9 blockOperationWithBlock:&v12];
  objc_msgSend(v11, "setName:", @"Receive Message", v12, v13, v14, v15, v16);
  [(CATOperationQueue *)self->mMessageQueue addOperation:v11];
}

void __34__CATTransport_didReceiveMessage___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  [*(id *)(*(void *)(a1 + 32) + 8) transitionWithTriggeringEvent:*(void *)(a1 + 40)];
}

- (void)didInterruptWithError:(id)a3
{
  id v5 = a3;
  char v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = +[CATStateMachineEvent eventWithTrigger:v9 context:v5];

  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v8];
}

- (void)didInvalidate
{
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = +[CATStateMachineEvent eventWithTrigger:v7 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)sendHelloMessageAndResumeQueue
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x263F086D0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke;
  v12[3] = &unk_2641DBCB0;
  objc_copyWeak(&v13, &location);
  id v5 = [v4 blockOperationWithBlock:v12];
  [v5 setName:@"Resume Connection"];
  char v6 = objc_opt_new();
  id v7 = [(CATTransport *)self operationToSendMessage:v6];

  objc_super v8 = (void *)MEMORY[0x263F086D0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke_2;
  v10[3] = &unk_2641DBCB0;
  objc_copyWeak(&v11, &location);
  id v9 = [v8 blockOperationWithBlock:v10];
  [v9 setName:@"Resume Queue"];
  [v7 addDependency:v5];
  [v9 addDependency:v7];
  [(CATOperationQueue *)self->mControlQueue addOperation:v5];
  [(CATOperationQueue *)self->mControlQueue addOperation:v7];
  [(CATOperationQueue *)self->mControlQueue addOperation:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained delegateDidResume];

  id v5 = objc_loadWeakRetained(a1);
  [v5 resumeConnection];
}

void __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resumeQueue];
}

- (void)cancelHelloMessageAndResumeQueueOperations
{
}

- (void)resumeQueueAndConnection
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x263F086D0];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  objc_super v8 = __40__CATTransport_resumeQueueAndConnection__block_invoke;
  id v9 = &unk_2641DBCB0;
  objc_copyWeak(&v10, &location);
  id v5 = [v4 blockOperationWithBlock:&v6];
  objc_msgSend(v5, "setName:", @"Resume Queue and Connection", v6, v7, v8, v9);
  [(CATOperationQueue *)self->mControlQueue addOperation:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __40__CATTransport_resumeQueueAndConnection__block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained delegateDidResume];

  id v5 = objc_loadWeakRetained(a1);
  [v5 resumeConnection];

  id v6 = objc_loadWeakRetained(a1);
  [v6 resumeQueue];
}

- (void)suspendQueueAndConnection
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATTransport *)self suspendConnection];

  [(CATTransport *)self suspendQueue];
}

- (void)resumeQueue
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mMessageQueue = self->mMessageQueue;

  [(CATOperationQueue *)mMessageQueue setSuspended:0];
}

- (void)suspendQueue
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mMessageQueue = self->mMessageQueue;

  [(CATOperationQueue *)mMessageQueue setSuspended:1];
}

- (void)enqueueSendForMessage:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = [(CATTransport *)self operationToSendMessage:v4];
  [v6 setName:@"Send Message"];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __38__CATTransport_enqueueSendForMessage___block_invoke;
  id v13 = &unk_2641DC278;
  id v7 = v6;
  id v14 = v7;
  objc_copyWeak(&v16, &location);
  id v8 = v4;
  id v15 = v8;
  id v9 = +[NSBlockOperation blockOperationWithBlock:&v10];
  objc_msgSend(v9, "setName:", @"Delegate Did Send Message", v10, v11, v12, v13);
  [v9 setQueuePriority:4];
  [v9 addDependency:v7];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v7];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __38__CATTransport_enqueueSendForMessage___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [*(id *)(a1 + 32) error];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 domain];
    if ([v6 isEqualToString:@"Catalyst.error"])
    {
      uint64_t v7 = [v5 code];

      if (v7 != 404)
      {
LABEL_6:
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        id v9 = [WeakRetained delegate];
        char v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0) {
          goto LABEL_12;
        }
        id v11 = objc_loadWeakRetained((id *)(a1 + 48));
        uint64_t v12 = [v11 delegate];
        id v13 = objc_loadWeakRetained((id *)(a1 + 48));
        [v12 transport:v13 didFailToSendMessage:*(void *)(a1 + 40) error:v5];
        goto LABEL_10;
      }
      CATErrorWithCodeAndUserInfo(200, 0);
      v5 = id v6 = v5;
    }

    goto LABEL_6;
  }
  id v14 = objc_loadWeakRetained((id *)(a1 + 48));
  id v15 = [v14 delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v12 = [v11 delegate];
    id v13 = objc_loadWeakRetained((id *)(a1 + 48));
    [v12 transport:v13 didSendMessage:*(void *)(a1 + 40)];
    id v5 = 0;
LABEL_10:

    goto LABEL_12;
  }
  id v5 = 0;
LABEL_12:
}

- (void)invalidSendForMessage:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__CATTransport_invalidSendForMessage___block_invoke;
  v8[3] = &unk_2641DC0C0;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  uint64_t v7 = +[NSBlockOperation blockOperationWithBlock:v8];
  [v7 setName:@"Invalid Send"];
  [v7 setQueuePriority:4];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__CATTransport_invalidSendForMessage___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [v7 delegate];
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = CATErrorWithCodeAndUserInfo(200, 0);
    [v8 transport:v9 didFailToSendMessage:v10 error:v11];
  }
}

- (void)cancelAndResumeQueuesAndEnqueueInvalidateConnection
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  objc_storeStrong((id *)&self->mStrongSelf, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__CATTransport_cancelAndResumeQueuesAndEnqueueInvalidateConnection__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  id v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v5];
  [v4 setName:@"Invalidate Connection"];
  [(CATOperationQueue *)self->mControlQueue addOperation:v4];
}

void __67__CATTransport_cancelAndResumeQueuesAndEnqueueInvalidateConnection__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  [*(id *)(*(void *)(a1 + 32) + 24) cancelAllOperations];
  [*(id *)(*(void *)(a1 + 32) + 24) setSuspended:0];
  [*(id *)(a1 + 32) invalidateConnection];
}

- (void)enqueueDelegateDidInvalidateAndFinalize
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (!self->mStrongSelf)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CATTransport.m", 386, @"%@ cannot call %@ when it has not created a strong reference to self", self, v10 object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x263F086D0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke;
  v13[3] = &unk_2641DBCB0;
  objc_copyWeak(&v14, &location);
  char v6 = [v5 blockOperationWithBlock:v13];
  [v6 setName:@"Delegate Did Invalidate"];
  id v7 = (void *)MEMORY[0x263F086D0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke_2;
  v11[3] = &unk_2641DBCB0;
  objc_copyWeak(&v12, &location);
  id v8 = [v7 blockOperationWithBlock:v11];
  [v8 setName:@"Finalize Transport"];
  [v8 addDependency:v6];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v6];
  [(CATOperationQueue *)self->mControlQueue addOperation:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained delegateDidInvalidate];
}

void __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = 0;
  }
}

- (void)resumeConnection
{
  id v5 = [MEMORY[0x263F08690] currentHandler];
  id v4 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"CATTransport.m", 420, @"%@ must override %@", self, v4 object file lineNumber description];
}

- (void)suspendConnection
{
  id v5 = [MEMORY[0x263F08690] currentHandler];
  id v4 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"CATTransport.m", 426, @"%@ must override %@", self, v4 object file lineNumber description];
}

- (void)invalidateConnection
{
  id v5 = [MEMORY[0x263F08690] currentHandler];
  id v4 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"CATTransport.m", 432, @"%@ must override %@", self, v4 object file lineNumber description];
}

- (id)operationToSendMessage:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  char v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"CATTransport.m", 438, @"%@ must override %@", self, v6 object file lineNumber description];

  return 0;
}

- (void)delegateDidResume
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTransport *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTransport *)self delegate];
    [v6 transportDidResume:self];
  }
}

- (void)enqueueDelegateDidConnect
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x263F086D0];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __41__CATTransport_enqueueDelegateDidConnect__block_invoke;
  id v9 = &unk_2641DBCB0;
  objc_copyWeak(&v10, &location);
  char v5 = [v4 blockOperationWithBlock:&v6];
  objc_msgSend(v5, "setName:", @"Delegate Did Connect", v6, v7, v8, v9);
  [v5 setQueuePriority:4];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__CATTransport_enqueueDelegateDidConnect__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v6 = [WeakRetained delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 delegate];
    id v10 = objc_loadWeakRetained(v4);
    [v9 transportDidConnect:v10];
  }
}

- (void)enqueueDelegateDidReceiveMessage:(id)a3
{
  id v4 = a3;
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x263F086D0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__CATTransport_enqueueDelegateDidReceiveMessage___block_invoke;
  v9[3] = &unk_2641DC0C0;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  id v8 = [v6 blockOperationWithBlock:v9];
  [v8 setName:@"Delegate Did Receive Message"];
  [v8 setQueuePriority:4];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__CATTransport_enqueueDelegateDidReceiveMessage___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [v7 delegate];
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 transport:v9 didReceiveMessage:*(void *)(a1 + 32)];
  }
}

- (void)enqueueDelegateCouldNotConnectWithError:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  uint64_t v8 = *MEMORY[0x263F08608];
  v9[0] = v4;
  char v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = CATErrorWithCodeAndUserInfo(202, v6);

  [(CATTransport *)self enqueueDelegateDidInterruptWithError:v7];
}

- (void)enqueueDelegateDidInterruptWithError:(id)a3
{
  id v4 = a3;
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_initWeak(&location, self);
  char v6 = (void *)MEMORY[0x263F086D0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __53__CATTransport_enqueueDelegateDidInterruptWithError___block_invoke;
  v9[3] = &unk_2641DC0C0;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  uint64_t v8 = [v6 blockOperationWithBlock:v9];
  [v8 setName:@"Delegate Did Interrupt"];
  [v8 setQueuePriority:4];
  [(CATOperationQueue *)self->mMessageQueue addOperation:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __53__CATTransport_enqueueDelegateDidInterruptWithError___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = [v7 delegate];
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 transport:v9 didInterruptWithError:*(void *)(a1 + 32)];
  }
}

- (void)delegateDidInvalidate
{
  uint64_t v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATTransport *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATTransport *)self delegate];
    [v6 transportDidInvalidate:self];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CATTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mMessageQueue, 0);
  objc_storeStrong((id *)&self->mControlQueue, 0);

  objc_storeStrong((id *)&self->mFSM, 0);
}

@end