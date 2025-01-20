@interface XRMobileAgentQueueStop
+ (id)backgroundQueueStop;
+ (id)mainQueueStop;
+ (id)userInitiatedQueueStop;
+ (id)userInteractiveQueueStop;
+ (id)utilityQueueStop;
+ (void)initialize;
- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4;
- (XRMobileAgentQueueStop)init;
- (XRMobileAgentQueueStop)initWithDispatchQueue:(id)a3;
- (XRMobileAgentQueueStop)initWithDispatchQueue:(id)a3 funnelTarget:(id)a4;
- (XRMobileAgentQueueStop)initWithMainQueue;
- (id)_funnelQueue;
- (int)agentStopDiagnosticsTypeCode;
- (void)_executeAgent:(id)a3;
- (void)_executeWelcomeForAgent:(id)a3;
- (void)_runAgentEpilogue:(id)a3;
- (void)_runAgentPrologue:(id)a3;
- (void)_welcomeAgent:(id)a3;
- (void)_welcomeAgent:(id)a3 followedByAgents:(id)a4;
- (void)_welcomeAgents:(id)a3;
- (void)receiveMobileAgent:(id)a3;
@end

@implementation XRMobileAgentQueueStop

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [XRMobileAgentQueueStop alloc];
    v3 = (void *)MEMORY[0x263EF83A0];
    uint64_t v6 = [v2 initWithDispatchQueue:v4 funnelTarget:MEMORY[0x263EF83A0] funnelTarget:MEMORY[0x263EF83A0] funnelTarget:v5];
    v7 = (void *)qword_2687AA0A0;
    qword_2687AA0A0 = v6;

    v8 = [XRMobileAgentQueueStop alloc];
    v9 = dispatch_get_global_queue(25, 0);
    uint64_t v13 = [v8 initWithDispatchQueue:v10 queuePriority:v9];
    v14 = (void *)qword_2687AA0A8;
    qword_2687AA0A8 = v13;

    v15 = [XRMobileAgentQueueStop alloc];
    v16 = dispatch_get_global_queue(33, 0);
    uint64_t v20 = [v15 initWithDispatchQueue:v17 queuePriority:v16];
    v21 = (void *)qword_2687AA0B0;
    qword_2687AA0B0 = v20;

    v22 = [XRMobileAgentQueueStop alloc];
    v23 = dispatch_get_global_queue(17, 0);
    uint64_t v27 = [v22 initWithDispatchQueue:v24 queuePriority:v25];
    v28 = (void *)qword_2687AA0B8;
    qword_2687AA0B8 = v27;

    v29 = [XRMobileAgentQueueStop alloc];
    v30 = dispatch_get_global_queue(9, 0);
    uint64_t v34 = [v29 initWithDispatchQueue:v31 queuePriority:v32 queueAttributes:v33];
    v35 = (void *)qword_2687AA0C0;
    qword_2687AA0C0 = v34;

    *(_DWORD *)(qword_2687AA0A0 + 24) = 4;
    *(_DWORD *)(qword_2687AA0B0 + 24) = 5;
    *(_DWORD *)(qword_2687AA0A8 + 24) = 6;
    *(_DWORD *)(qword_2687AA0B8 + 24) = 7;
    *(_DWORD *)(qword_2687AA0C0 + 24) = 8;
  }
}

+ (id)mainQueueStop
{
  return (id)qword_2687AA0A0;
}

+ (id)userInitiatedQueueStop
{
  return (id)qword_2687AA0A8;
}

+ (id)userInteractiveQueueStop
{
  return (id)qword_2687AA0B0;
}

+ (id)utilityQueueStop
{
  return (id)qword_2687AA0B8;
}

+ (id)backgroundQueueStop
{
  return (id)qword_2687AA0C0;
}

- (XRMobileAgentQueueStop)initWithDispatchQueue:(id)a3 funnelTarget:(id)a4
{
  uint64_t v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)XRMobileAgentQueueStop;
  v8 = [(XRMobileAgentQueueStop *)&v22 init];
  uint64_t v12 = v8;
  if (v8)
  {
    uint64_t v13 = [v8 methodForSelector:sel__holdReceivedAgent_ticket_ withArguments:v10, v11];
    v12->_holdIsPossible = v13 != [XRMobileAgentQueueStop _holdReceivedAgent_ticket_:v14 ticket:v15];
    if (v7) {
      dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.dt.agent-stop-funnel", 0, v7);
    }
    else {
      dispatch_queue_t v17 = dispatch_queue_create("com.apple.dt.agent-stop-funnel", 0);
    }
    funnelQueue = v12->_funnelQueue;
    v12->_funnelQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("com.apple.dt.agent-exec", 0, v6);
    executionQueue = v12->_executionQueue;
    v12->_executionQueue = (OS_dispatch_queue *)v19;

    v12->_diagnosticID = 3;
  }

  return v12;
}

- (XRMobileAgentQueueStop)initWithMainQueue
{
  v3 = (void *)MEMORY[0x263EF83A0];
  v4 = [[XRMobileAgentQueueStop alloc] initWithDispatchQueue:a2 funnelTarget:MEMORY[0x263EF83A0] queueTarget:MEMORY[0x263EF83A0] queueName:v2];

  return v4;
}

- (XRMobileAgentQueueStop)initWithDispatchQueue:(id)a3
{
  return (XRMobileAgentQueueStop *)[[XRMobileAgentQueueStop alloc] initWithDispatchQueue:a2 funnelTarget:(uint64_t)a3];
}

- (XRMobileAgentQueueStop)init
{
  uint64_t v3 = dispatch_get_global_queue(17, 0);
  v7 = (XRMobileAgentQueueStop *)[self initWithDispatchQueue:v4 queueID:v3 queueName:v5 queueType:v6];

  return v7;
}

- (int)agentStopDiagnosticsTypeCode
{
  return self->_diagnosticID;
}

- (void)_runAgentPrologue:(id)a3
{
  id v4 = a3;
  [v4 v5:v6 v7:v8];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [self _prepareAgentToExecute:v9 withTicket:(uint64_t)v4 completion:(uint64_t)v11];
}

- (void)_executeAgent:(id)a3
{
  [a3 a2:(uint64_t)a3 v3:v4];
}

- (void)_runAgentEpilogue:(id)a3
{
  id v15 = a3;
  uint64_t v8 = [v15 performSelector:v4 withObject:v5 withObject:v6 withObject:v7];
  [self escortAgentToExit:v9 withTicket:(uint64_t)v15 completion:(uint64_t)v8];

  [v15 goodbye:v11 v12:v12 v13:v13 v14:v14];
}

- (void)_executeWelcomeForAgent:(id)a3
{
  id v13 = a3;
  [self _runAgentPrologue_:v4 withTransitionContext:v5 withCompletion:v6];
  [self _executeAgent_:v7 withTransitionContext:v13 withCompletion:v8 withError:v9];
  [self _runAgentEpilogue_:v10 withTransitionContext:v13 withCompletion:v11 withError:v12];
}

- (void)receiveMobileAgent:(id)a3
{
  id v4 = a3;
  if (![v4 movementType:v5 with:v6 and:v7 and:v8]) {
    sub_23459B920();
  }
  if (self->_holdIsPossible)
  {
    funnelQueue = self->_funnelQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_23457ECB0;
    v13[3] = &unk_264BF0D90;
    v13[4] = self;
    id v14 = v4;
    dispatch_async(funnelQueue, v13);
  }
  else
  {
    [self _welcomeAgent_:v9 withContext:(uint64_t)v4 withCompletion:v10 withCompletionHandler:v11];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);

  objc_storeStrong((id *)&self->_funnelQueue, 0);
}

- (id)_funnelQueue
{
  return self->_funnelQueue;
}

- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4
{
  return 0;
}

- (void)_welcomeAgent:(id)a3
{
  id v4 = a3;
  if (![v4 movementType:v5, v6, v7, v8]) {
    sub_23459B94C();
  }
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_23457EE38;
  v11[3] = &unk_264BF0D90;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(executionQueue, v11);
}

- (void)_welcomeAgents:(id)a3
{
  id v4 = a3;
  uint64_t v27 = (id *)&v29;
  id v8 = v28;
  if (!v8)
  {
    [self _welcomeAgent_:v5 withTransitionContext:v4 withCompletion:v6];
LABEL_10:
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23457F00C;
    block[3] = &unk_264BF0DB8;
    block[4] = self;
    id v25 = v4;
    id v26 = v8;
    dispatch_async(executionQueue, block);

    goto LABEL_11;
  }
  uint64_t v9 = v27++;
  id v10 = *v9;
  if (!v10) {
    goto LABEL_10;
  }
  id v14 = v10;
  id v15 = 0;
  do
  {
    if (!v15) {
      id v15 = objc_opt_new();
    }
    [v15 addObject:(id)v14];
    uint64_t v16 = v27++;
    id v17 = *v16;

    id v14 = v17;
  }
  while (v17);
  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v18 = self->_executionQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_23457F078;
  v21[3] = &unk_264BF0D90;
  id v22 = v15;
  v23 = self;
  id v19 = v15;
  dispatch_async(v18, v21);

LABEL_11:
}

- (void)_welcomeAgent:(id)a3 followedByAgents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23457F350;
  block[3] = &unk_264BF0DB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(executionQueue, block);
}

@end