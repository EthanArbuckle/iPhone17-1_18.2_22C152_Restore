@interface CONodeManager
- (BOOL)_updateBallot:(id)a3;
- (BOOL)isInElection;
- (COBallotBrowser)ballotBrowser;
- (COConstituent)leader;
- (COConstituent)longestBackedOffConstituent;
- (COConstituent)me;
- (COElectionInfo)electionInfo;
- (COExecutionContext)executionContext;
- (COMeshNode)nodeForMe;
- (CONodeManager)initWithExecutionContext:(id)a3;
- (CONodeManagerDelegate)delegate;
- (NSArray)nodes;
- (NSError)error;
- (NSMutableArray)pendingDiscoveryRecords;
- (NSMutableDictionary)browsersObservers;
- (NSMutableDictionary)leaderCommands;
- (NSMutableDictionary)nodeControllers;
- (NSSet)acceptableCommands;
- (NSString)description;
- (OS_dispatch_source)electionElapsedTimer;
- (id)_constituentCharacteristics:(id)a3;
- (id)activeNodesWithSelfNode:(BOOL)a3;
- (id)nodeControllerForConstituent:(id)a3;
- (id)nodeControllerForIDS:(id)a3;
- (id)shortDescription;
- (unint64_t)electionEnd;
- (unint64_t)electionPrevious;
- (unint64_t)electionStart;
- (unint64_t)longestBackOff;
- (void)_bumpGeneration;
- (void)_checkForElectionCompletion:(id)a3 nodeController:(id)a4;
- (void)_didDiscoverRecord:(id)a3;
- (void)_didLoseRecord:(id)a3;
- (void)_handleDiscoveryRecord:(id)a3;
- (void)_handleEnqueuedCommandsForLostNode:(id)a3 error:(id)a4;
- (void)_handleLostRecord:(id)a3;
- (void)_informControllersAboutNewElectionInfo;
- (void)_informDelegateAboutNodeAddition:(id)a3 oldState:(int64_t)a4;
- (void)_informDelegateAboutNodeRemoval:(id)a3 oldState:(int64_t)a4;
- (void)_logElectionSummary;
- (void)_nodeBecameInactive:(id)a3 withReason:(int64_t)a4;
- (void)_nodeStartedElection:(id)a3 withElectionInfo:(id)a4;
- (void)_nodeStopped:(id)a3 withReason:(int64_t)a4;
- (void)_reportLostLeader:(id)a3 withReason:(int64_t)a4;
- (void)_resetBallot;
- (void)addBrowser:(id)a3;
- (void)backedOffNodeMovedOutOfElection:(id)a3;
- (void)fast_fold_nodeController:(id)a3 didReceiveElectionCmd:(id)a4 withCompletionHandler:(id)a5;
- (void)nodeController:(id)a3 didAddTransport:(id)a4;
- (void)nodeController:(id)a3 didReceiveCommand:(id)a4;
- (void)nodeController:(id)a3 didReceiveElectionCmd:(id)a4 withCompletionHandler:(id)a5;
- (void)nodeController:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5;
- (void)nodeController:(id)a3 didReceiveOnDemandNodeCreationRequest:(id)a4;
- (void)nodeController:(id)a3 didReceiveRequest:(id)a4 callback:(id)a5;
- (void)nodeController:(id)a3 didRemoveTransport:(id)a4 withError:(id)a5;
- (void)nodeController:(id)a3 didUpdateRemoteConstituent:(id)a4 to:(id)a5;
- (void)nodeController:(id)a3 didUpdateState:(int64_t)a4 to:(int64_t)a5 reason:(int64_t)a6 withLastSentElectionInfo:(id)a7;
- (void)pingLeader;
- (void)removeBrowser:(id)a3;
- (void)sendCommand:(id)a3;
- (void)sendCommands:(id)a3;
- (void)setAcceptableCommands:(id)a3;
- (void)setBallotBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElectionElapsedTimer:(id)a3;
- (void)setElectionEnd:(unint64_t)a3;
- (void)setElectionInfo:(id)a3;
- (void)setElectionPrevious:(unint64_t)a3;
- (void)setElectionStart:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setExecutionContext:(id)a3;
- (void)setIsInElection:(BOOL)a3;
- (void)setLeader:(id)a3;
- (void)setLeaderCommands:(id)a3;
- (void)setLongestBackOff:(unint64_t)a3;
- (void)setLongestBackedOffConstituent:(id)a3;
- (void)setNodeControllers:(id)a3;
- (void)setPendingDiscoveryRecords:(id)a3;
- (void)start;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation CONodeManager

- (CONodeManager)initWithExecutionContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CONodeManager;
  v5 = [(CONodeManager *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    executionContext = v5->_executionContext;
    v5->_executionContext = (COExecutionContext *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    nodeControllers = v5->_nodeControllers;
    v5->_nodeControllers = (NSMutableDictionary *)v8;

    v10 = objc_alloc_init(COElectionInfo);
    electionInfo = v5->_electionInfo;
    v5->_electionInfo = v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    browsersObservers = v5->_browsersObservers;
    v5->_browsersObservers = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFFA08] set];
    acceptableCommands = v5->_acceptableCommands;
    v5->_acceptableCommands = (NSSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    leaderCommands = v5->_leaderCommands;
    v5->_leaderCommands = (NSMutableDictionary *)v16;
  }
  return v5;
}

- (id)shortDescription
{
  v3 = NSString;
  id v4 = [(CONodeManager *)self executionContext];
  v5 = [v4 meshControllerDescription];
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v3 stringWithFormat:@"[m:%@] <%@: %p>", v5, v7, self];

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CONodeManager *)self me];
  v7 = [(CONodeManager *)self browsersObservers];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p,\n ME: %@, Browsers: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (void)start
{
  v3 = [(CONodeManager *)self executionContext];
  [v3 assertDispatchQueue];

  if (!self->_started)
  {
    self->_started = 1;
    objc_initWeak(&location, self);
    id v4 = [(CONodeManager *)self browsersObservers];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __22__CONodeManager_start__block_invoke;
    v5[3] = &unk_2645CCC48;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];

    [(CONodeManager *)self _bumpGeneration];
    [(CONodeManager *)self _resetBallot];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __22__CONodeManager_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __22__CONodeManager_start__block_invoke_2;
  v14[3] = &unk_2645CCBF8;
  v7 = (id *)(a1 + 40);
  objc_copyWeak(&v15, (id *)(a1 + 40));
  uint64_t v8 = [v5 addObserverUsingBlock:v14];
  v9 = [*(id *)(a1 + 32) browsersObservers];
  [v9 setObject:v8 forKey:v5];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __22__CONodeManager_start__block_invoke_4;
  v11[3] = &unk_2645CCC20;
  objc_copyWeak(&v13, v7);
  id v10 = v5;
  id v12 = v10;
  [v10 startWithCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
}

void __22__CONodeManager_start__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained executionContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __22__CONodeManager_start__block_invoke_3;
    v9[3] = &unk_2645CC168;
    char v11 = a2;
    v9[4] = v7;
    id v10 = v5;
    [v8 dispatchAsync:v9];
  }
}

uint64_t __22__CONodeManager_start__block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 _didDiscoverRecord:v4];
  }
  else {
    return [v3 _didLoseRecord:v4];
  }
}

void __22__CONodeManager_start__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COCoreLogForCategory(15);
    id v6 = v5;
    if (a2)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __22__CONodeManager_start__block_invoke_4_cold_1();
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [WeakRetained shortDescription];
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      char v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully started browser %@", (uint8_t *)&v10, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = *(id *)(a1 + 32);
      id v6 = WeakRetained[6];
      WeakRetained[6] = v9;
LABEL_9:
    }
  }
}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CONodeManager *)self executionContext];
  [v5 assertDispatchQueue];

  self->_started = 0;
  objc_initWeak(&location, self);
  id v6 = [(CONodeManager *)self executionContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke;
  v8[3] = &unk_2645CCCE0;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 dispatchAsync:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [WeakRetained shortDescription];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&buf, 0xCu);
    }
    id v6 = [WeakRetained browsersObservers];
    [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v7 = a1[4];
    objc_sync_enter(v7);
    uint64_t v8 = [WeakRetained nodeControllers];
    uint64_t v9 = [v8 count];
    *(void *)(*((void *)&buf + 1) + 24) = v9;

    id v10 = [WeakRetained nodeControllers];
    char v11 = (void *)[v10 copy];

    __int16 v12 = [WeakRetained activeNodesWithSelfNode:1];
    uint64_t v13 = (void *)[v12 count];

    objc_sync_exit(v7);
    if (*(void *)(*((void *)&buf + 1) + 24))
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke_2;
      v14[3] = &unk_2645CCCB8;
      objc_copyWeak(v18, v2);
      p_long long buf = &buf;
      id v15 = v11;
      v18[1] = v13;
      id v16 = a1[5];
      [v15 enumerateKeysAndObjectsUsingBlock:v14];

      objc_destroyWeak(v18);
    }
    else
    {
      (*((void (**)(void))a1[5] + 2))();
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9D0] null];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    [v7 removeObserver:v4];
    [v7 stop];
  }
}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_2645CCC90;
  objc_copyWeak(v13, (id *)(a1 + 56));
  uint64_t v12 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 64);
  id v10 = v7;
  v13[1] = v8;
  id v11 = *(id *)(a1 + 40);
  [v6 stopWithCompletionHandler:v9];

  objc_destroyWeak(v13);
}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v4 + 24) - 1;
    *(void *)(v4 + 24) = v5;
    if (!v5)
    {
      unint64_t v6 = [WeakRetained electionEnd];
      if (v6 > [v3 electionStart])
      {
        id v7 = [v3 executionContext];
        v23 = [v7 label];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v8 = [*(id *)(a1 + 32) allValues];
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v31;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v13), "node", v23);
              if ([v14 connectionType] == 2)
              {
                ++v10;
                if ([v14 discoveryType] == 2) {
                  ++v9;
                }
              }

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v11);
        }

        __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        id v16 = [v3 executionContext];
        v17 = [v16 analyticsRecorder];

        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke_4;
        v24[3] = &unk_2645CBBF8;
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v27 = v10;
        uint64_t v28 = v9;
        double v29 = (double)(v15 - v6) / 1000000000.0;
        id v25 = v23;
        uint64_t v26 = v18;
        objc_super v19 = (void (*)(void *, uint64_t, void *))v17[2];
        id v20 = v23;
        v19(v17, 0x26D3D6168, v24);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v21 = v3;
      objc_sync_enter(v21);
      [v21 setElectionElapsedTimer:0];
      uint64_t v22 = [v21 nodeControllers];
      [v22 removeAllObjects];

      objc_sync_exit(v21);
    }
  }
}

id __43__CONodeManager_stopWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  v10[6] = *MEMORY[0x263EF8340];
  v10[0] = &unk_26D3EB830;
  v9[0] = 0x26D3D6228;
  v9[1] = 0x26D3D6248;
  int v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v10[1] = v2;
  v9[2] = 0x26D3D6268;
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v10[2] = v3;
  v9[3] = 0x26D3D6288;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v10[3] = v4;
  void v9[4] = 0x26D3D6208;
  uint64_t v5 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  void v9[5] = 0x26D3D61E8;
  uint64_t v6 = *(void *)(a1 + 32);
  v10[4] = v5;
  v10[5] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

- (void)addBrowser:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(CONodeManager *)self executionContext];
  [v4 assertDispatchQueue];

  if (!self->_started)
  {
    uint64_t v5 = [(CONodeManager *)self browsersObservers];
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];
    [v5 setObject:v6 forKey:v7];
  }
}

- (void)removeBrowser:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CONodeManager *)self executionContext];
  [v4 assertDispatchQueue];

  if (!self->_started)
  {
    uint64_t v5 = [(CONodeManager *)self browsersObservers];
    [v5 removeObjectForKey:v6];
  }
}

- (void)sendCommands:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(CONodeManager *)self executionContext];
    [v5 assertDispatchQueue];

    [(CONodeManager *)self pingLeader];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[CONodeManager sendCommand:](self, "sendCommand:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)sendCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CONodeManager *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = [v4 destination];
  if (!v6)
  {
    if ([MEMORY[0x263F33F80] isFastFoldEnabled])
    {
      uint64_t v7 = [(CONodeManager *)self electionInfo];
      uint64_t v8 = [v7 leader];
    }
    else
    {
      uint64_t v8 = [(CONodeManager *)self leader];
    }
    uint64_t v9 = [(CONodeManager *)self nodeControllerForConstituent:v8];
    uint64_t v10 = [COMeshNode alloc];
    long long v11 = [v9 node];
    id v6 = [(COMeshNode *)v10 initWithNode:v11];

    [v4 setDestination:v6];
  }
  long long v12 = objc_opt_class();
  long long v13 = objc_opt_class();
  long long v14 = objc_opt_class();
  __uint64_t v15 = [(COMeshNode *)v6 remote];
  uint64_t v16 = [(CONodeManager *)self nodeControllerForConstituent:v15];

  if (!v16)
  {
    v17 = [(COMeshNode *)v6 IDSIdentifier];
    uint64_t v16 = [(CONodeManager *)self nodeControllerForIDS:v17];
  }
  uint64_t v18 = self;
  objc_initWeak(&location, v16);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __29__CONodeManager_sendCommand___block_invoke;
  v21[3] = &unk_2645CCD08;
  v21[4] = v18;
  objc_copyWeak(v24, &location);
  id v19 = v4;
  id v22 = v19;
  v24[1] = v12;
  v24[2] = v13;
  v24[3] = v14;
  id v20 = v6;
  v23 = v20;
  [v16 sendCommand:v19 withCompletionHandler:v21];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

void __29__CONodeManager_sendCommand___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v11 = WeakRetained;
  if (v9) {
    BOOL v12 = WeakRetained == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_isKindOfClass() & 1) != 0)
    {
      long long v13 = [v9 delegate];
      if (!v8)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v15 = *(void *)(a1 + 48);
        long long v14 = [v17 command];
        [v13 node:v15 didReceiveResponse:v7 toRequest:v14];
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      long long v13 = [v9 delegate];
      if (!v8)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v16 = *(void *)(a1 + 48);
        long long v14 = [v17 command];
        [v13 node:v16 didSendCommand:v14];
        goto LABEL_12;
      }
    }
    long long v14 = [v17 command];
    [v9 nodeController:v11 didReceiveError:v8 forCommand:v14];
    goto LABEL_12;
  }
LABEL_14:
}

- (void)pingLeader
{
  v3 = [(CONodeManager *)self executionContext];
  [v3 assertDispatchQueue];

  if ([MEMORY[0x263F33F80] isFastFoldEnabled])
  {
    id v4 = [(CONodeManager *)self electionInfo];
    id v6 = [v4 leader];
  }
  else
  {
    id v6 = [(CONodeManager *)self leader];
  }
  uint64_t v5 = [(CONodeManager *)self nodeControllerForConstituent:v6];
  [v5 sendPing];
}

- (COConstituent)me
{
  int v2 = [(CONodeManager *)self executionContext];
  v3 = [v2 constituentForMe];

  return (COConstituent *)v3;
}

- (COMeshNode)nodeForMe
{
  v3 = [(CONodeManager *)self executionContext];
  id v4 = [v3 constituentForMe];

  uint64_t v5 = [(CONodeManager *)self nodeControllerForConstituent:v4];
  id v6 = [v5 node];

  id v7 = [[COMeshNode alloc] initWithNode:v6];
  return v7;
}

- (COConstituent)leader
{
  int v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_leader;
  objc_sync_exit(v2);

  return v3;
}

- (id)nodeControllerForConstituent:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__13;
  uint64_t v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CONodeManager *)v5 nodeControllers];
  id v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__CONodeManager_nodeControllerForConstituent___block_invoke;
  v11[3] = &unk_2645CCD30;
  id v8 = v4;
  id v12 = v8;
  long long v13 = &v14;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __46__CONodeManager_nodeControllerForConstituent___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v7 = [v10 node];
  id v8 = [v7 remote];
  int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)nodeControllerForIDS:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__13;
  uint64_t v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CONodeManager *)v5 nodeControllers];
  id v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__CONodeManager_nodeControllerForIDS___block_invoke;
  v11[3] = &unk_2645CCD30;
  id v8 = v4;
  id v12 = v8;
  long long v13 = &v14;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __38__CONodeManager_nodeControllerForIDS___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v7 = [v10 node];
  id v8 = [v7 IDSIdentifier];
  int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (NSArray)nodes
{
  return (NSArray *)[(CONodeManager *)self activeNodesWithSelfNode:0];
}

- (id)activeNodesWithSelfNode:(BOOL)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__13;
  uint64_t v16 = __Block_byref_object_dispose__13;
  id v17 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CONodeManager *)v5 nodeControllers];
  id v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__CONodeManager_activeNodesWithSelfNode___block_invoke;
  v10[3] = &unk_2645CCD58;
  BOOL v11 = a3;
  v10[4] = &v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __41__CONodeManager_activeNodesWithSelfNode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v4 = [v8 nodeAfterReconciliation];
  if ([v4 isActive]
    && (*(unsigned char *)(a1 + 40) || ([v8 isLocalNodeController] & 1) == 0))
  {
    uint64_t v5 = [COMeshNode alloc];
    id v6 = [v8 node];
    id v7 = [(COMeshNode *)v5 initWithNode:v6];

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  }
}

- (void)_didDiscoverRecord:(id)a3
{
  id v5 = a3;
  id v4 = [(CONodeManager *)self executionContext];
  [v4 assertDispatchQueue];

  if (self->_started) {
    [(CONodeManager *)self _handleDiscoveryRecord:v5];
  }
}

- (void)_didLoseRecord:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CONodeManager *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = COCoreLogForCategory(15);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CONodeManager *)self shortDescription];
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ lost a record %@", (uint8_t *)&v8, 0x16u);
  }
  if (self->_started) {
    [(CONodeManager *)self _handleLostRecord:v4];
  }
}

- (void)nodeController:(id)a3 didUpdateState:(int64_t)a4 to:(int64_t)a5 reason:(int64_t)a6 withLastSentElectionInfo:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = [(CONodeManager *)self executionContext];
  [v14 assertDispatchQueue];

  if (self->_started)
  {
    uint64_t v15 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(CONodeManager *)self shortDescription];
      id v17 = CONodeControllerStateDescription(a4);
      uint64_t v18 = CONodeControllerStateDescription(a5);
      int v19 = 138544130;
      id v20 = v16;
      __int16 v21 = 2048;
      id v22 = v12;
      __int16 v23 = 2114;
      v24 = v17;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %p state from %{public}@ to %{public}@", (uint8_t *)&v19, 0x2Au);
    }
    switch(a5)
    {
      case 1:
        if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
          goto LABEL_6;
        }
        break;
      case 2:
LABEL_6:
        [(CONodeManager *)self _nodeBecameInactive:v12 withReason:a6];
        goto LABEL_8;
      case 4:
        [(CONodeManager *)self _nodeStopped:v12 withReason:a6];
LABEL_8:
        [(CONodeManager *)self _informDelegateAboutNodeRemoval:v12 oldState:a4];
        goto LABEL_11;
      case 5:
        [(CONodeManager *)self _nodeStartedElection:v12 withElectionInfo:v13];
        [(CONodeManager *)self _informDelegateAboutNodeAddition:v12 oldState:a4];
        break;
      case 6:
        [(CONodeManager *)self _informDelegateAboutNodeAddition:v12 oldState:a4];
LABEL_11:
        [(CONodeManager *)self _checkForElectionCompletion:v13 nodeController:v12];
        break;
      default:
        break;
    }
  }
}

- (void)fast_fold_nodeController:(id)a3 didReceiveElectionCmd:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void *))a5;
  id v11 = [(CONodeManager *)self executionContext];
  [v11 assertDispatchQueue];

  if (self->_started)
  {
    id v12 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v46 = [(CONodeManager *)self shortDescription];
      *(_DWORD *)long long buf = 138543874;
      v53 = v46;
      __int16 v54 = 2112;
      unint64_t v55 = (unint64_t)v9;
      __int16 v56 = 2048;
      unint64_t v57 = (unint64_t)v8;
      _os_log_debug_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ got a command %@ from node controller %p", buf, 0x20u);
    }
    id v13 = [(CONodeManager *)self ballotBrowser];
    uint64_t v14 = [v9 ballot];
    [v13 discoveryUsingBallot:v14];

    uint64_t v15 = [[COElectionInfo alloc] initWithCommand:v9];
    uint64_t v16 = [(CONodeManager *)self electionInfo];
    int v17 = [v16 hasSameGenerationAndLeader:v15];

    if (v17)
    {
      uint64_t v18 = [(CONodeManager *)self electionInfo];
      v10[2](v10, v18);
LABEL_27:

      goto LABEL_28;
    }
    int v19 = [(CONodeManager *)self electionInfo];
    unint64_t v47 = [v19 generation];

    unint64_t v48 = [(COElectionInfo *)v15 generation];
    if (v47 > v48)
    {
      id v20 = COCoreLogForCategory(15);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = [(CONodeManager *)self shortDescription];
        id v22 = [(CONodeManager *)self electionInfo];
        uint64_t v23 = [v22 generation];
        uint64_t v24 = [(COElectionInfo *)v15 generation];
        *(_DWORD *)long long buf = 138543874;
        v53 = v21;
        __int16 v54 = 2048;
        unint64_t v55 = v23;
        __int16 v56 = 2048;
        unint64_t v57 = v24;
        _os_log_impl(&dword_2217C1000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Our generation %llu is greater than the incoming generation %llu", buf, 0x20u);
      }
      uint64_t v18 = [(CONodeManager *)self electionInfo];
      v10[2](v10, v18);
      goto LABEL_27;
    }
    __int16 v25 = [v8 node];
    uint64_t v18 = [v25 remote];

    uint64_t v26 = [(CONodeManager *)self electionInfo];
    uint64_t v27 = [v26 ballot];
    uint64_t v28 = [v27 candidates];
    char v29 = [v28 containsObject:v18];

    if (v29)
    {
      BOOL v30 = 0;
      goto LABEL_21;
    }
    long long v31 = [(CONodeManager *)self electionInfo];
    long long v32 = [v31 ballot];
    long long v33 = (void *)[v32 mutableCopy];

    [v33 addCandidate:v18];
    v34 = [v8 ipDiscoveryRecord];
    uint64_t v35 = v34;
    if (v34 && [v34 shouldAdvertise])
    {
      if (![v33 addDiscoveryRecord:v35])
      {
LABEL_20:
        BOOL v30 = -[CONodeManager _updateBallot:](self, "_updateBallot:", v33, v47);

LABEL_21:
        if (v48 <= v47)
        {
          v42 = [(CONodeManager *)self electionInfo];
          v10[2](v10, v42);

          if (!v30) {
            goto LABEL_27;
          }
        }
        else
        {
          v38 = COCoreLogForCategory(15);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [(CONodeManager *)self shortDescription];
            *(_DWORD *)long long buf = 138543874;
            v53 = v39;
            __int16 v54 = 2048;
            unint64_t v55 = v47;
            __int16 v56 = 2048;
            unint64_t v57 = v48;
            _os_log_impl(&dword_2217C1000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ bumping election generation from %llu to %llu", buf, 0x20u);
          }
          v40 = [(CONodeManager *)self electionInfo];
          [v40 setGeneration:v48];

          [(CONodeManager *)self _resetBallot];
          v41 = [(CONodeManager *)self electionInfo];
          v10[2](v10, v41);
        }
        v43 = self;
        objc_sync_enter(v43);
        v44 = [(CONodeManager *)v43 nodeControllers];
        v45 = (void *)[v44 copy];

        objc_sync_exit(v43);
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __86__CONodeManager_fast_fold_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke;
        v49[3] = &unk_2645CCD80;
        id v50 = v8;
        v51 = v43;
        [v45 enumerateKeysAndObjectsUsingBlock:v49];

        goto LABEL_27;
      }
      v36 = COCoreLogForCategory(11);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v33 discovery];
        *(_DWORD *)long long buf = 134218498;
        v53 = self;
        __int16 v54 = 2112;
        unint64_t v55 = (unint64_t)v37;
        __int16 v56 = 2048;
        unint64_t v57 = (unint64_t)v33;
        _os_log_impl(&dword_2217C1000, v36, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p when handling response", buf, 0x20u);
      }
    }
    else
    {
      v36 = COCoreLogForCategory(11);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134219010;
        v53 = self;
        __int16 v54 = 2112;
        unint64_t v55 = (unint64_t)v35;
        __int16 v56 = 2112;
        unint64_t v57 = (unint64_t)v8;
        __int16 v58 = 2048;
        v59 = v33;
        __int16 v60 = 2112;
        id v61 = v9;
        _os_log_debug_impl(&dword_2217C1000, v36, OS_LOG_TYPE_DEBUG, "%p cannot add Discovery %@ for %@ to ballot %p when handling response %@", buf, 0x34u);
      }
    }

    goto LABEL_20;
  }
LABEL_28:
}

void __86__CONodeManager_fast_fold_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void **)(a1 + 32) != a3)
  {
    v3 = *(void **)(a1 + 40);
    id v4 = a3;
    id v5 = [v3 electionInfo];
    [v4 updateElectionInfo:v5];
  }
}

- (void)nodeController:(id)a3 didReceiveElectionCmd:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void *))a5;
  if (![MEMORY[0x263F33F80] isFastFoldEnabled])
  {
    id v11 = [(CONodeManager *)self executionContext];
    [v11 assertDispatchQueue];

    if (!self->_started) {
      goto LABEL_45;
    }
    id v12 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v46 = [(CONodeManager *)self shortDescription];
      *(_DWORD *)long long buf = 138543874;
      v70 = v46;
      __int16 v71 = 2112;
      unint64_t v72 = (unint64_t)v9;
      __int16 v73 = 2048;
      unint64_t v74 = (unint64_t)v8;
      _os_log_debug_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ got a command %@ from node controller %p", buf, 0x20u);
    }
    id v13 = [(CONodeManager *)self ballotBrowser];
    uint64_t v14 = [v9 ballot];
    [v13 discoveryUsingBallot:v14];

    v65 = [[COElectionInfo alloc] initWithCommand:v9];
    uint64_t v15 = [(CONodeManager *)self electionInfo];
    int v16 = [v15 hasGreaterGenerationThan:v65];

    if (v16)
    {
      int v17 = COCoreLogForCategory(15);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(CONodeManager *)self shortDescription];
        int v19 = [(CONodeManager *)self electionInfo];
        uint64_t v20 = [v19 generation];
        uint64_t v21 = [(COElectionInfo *)v65 generation];
        *(_DWORD *)long long buf = 138543874;
        v70 = v18;
        __int16 v71 = 2048;
        unint64_t v72 = v20;
        __int16 v73 = 2048;
        unint64_t v74 = v21;
        _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Our generation %llu is greater than the incoming generation %llu", buf, 0x20u);
      }
LABEL_9:

      id v22 = [(CONodeManager *)self electionInfo];
      v10[2](v10, v22);
LABEL_44:

      goto LABEL_45;
    }
    uint64_t v23 = [(CONodeManager *)self electionInfo];
    int v24 = [v23 isEqual:v65];

    if (v24)
    {
      id v22 = [(CONodeManager *)self electionInfo];
      v10[2](v10, v22);
      goto LABEL_44;
    }
    __int16 v25 = [(CONodeManager *)self electionInfo];
    int v26 = [v25 hasSameGenerationAndLeader:v65];

    if (v26)
    {
      int v17 = COCoreLogForCategory(15);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(CONodeManager *)self shortDescription];
        uint64_t v28 = [(CONodeManager *)self electionInfo];
        char v29 = [v28 leader];
        BOOL v30 = [(CONodeManager *)self electionInfo];
        uint64_t v31 = [v30 generation];
        *(_DWORD *)long long buf = 138544130;
        v70 = v27;
        __int16 v71 = 2112;
        unint64_t v72 = (unint64_t)v29;
        __int16 v73 = 2048;
        unint64_t v74 = v31;
        __int16 v75 = 2112;
        id v76 = v8;
        _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ The leader %@ and generation %llu for command  %@ on node has not changed", buf, 0x2Au);
      }
      goto LABEL_9;
    }
    long long v32 = [(CONodeManager *)self electionInfo];
    unint64_t v63 = [v32 generation];

    unint64_t v64 = [(COElectionInfo *)v65 generation];
    long long v33 = [v8 node];
    id v22 = [v33 remote];

    v34 = [(CONodeManager *)self electionInfo];
    uint64_t v35 = [v34 ballot];
    v36 = [v35 candidates];
    char v37 = [v36 containsObject:v22];

    if (v37)
    {
      BOOL v38 = 0;
      goto LABEL_31;
    }
    v39 = [(CONodeManager *)self electionInfo];
    v40 = [v39 ballot];
    v41 = (void *)[v40 mutableCopy];

    [v41 addCandidate:v22];
    v42 = [v8 ipDiscoveryRecord];
    v43 = v42;
    if (v42 && [v42 shouldAdvertise])
    {
      if (![v41 addDiscoveryRecord:v43])
      {
LABEL_26:
        BOOL v38 = [(CONodeManager *)self _updateBallot:v41];
        if (([MEMORY[0x263F33F80] isSlimBallotsEnabled] & 1) == 0)
        {
          unint64_t v47 = COCoreLogForCategory(15);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v48 = [(CONodeManager *)self shortDescription];
            *(_DWORD *)long long buf = 138543618;
            v70 = v48;
            __int16 v71 = 2114;
            unint64_t v72 = (unint64_t)v22;
            _os_log_impl(&dword_2217C1000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ adding candidate %{public}@ to our ballot", buf, 0x16u);
          }
          BOOL v38 = 1;
        }

LABEL_31:
        if (v64 > v63)
        {
          v49 = COCoreLogForCategory(15);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            id v50 = [(CONodeManager *)self shortDescription];
            *(_DWORD *)long long buf = 138543874;
            v70 = v50;
            __int16 v71 = 2048;
            unint64_t v72 = v63;
            __int16 v73 = 2048;
            unint64_t v74 = v64;
            _os_log_impl(&dword_2217C1000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading election generation from %llu to %llu", buf, 0x20u);
          }
          v51 = [(CONodeManager *)self electionInfo];
          [v51 setGeneration:v64];

          [(CONodeManager *)self _resetBallot];
          BOOL v38 = 1;
        }
        if (v64 == v63)
        {
          v52 = [v8 node];
          if ([v52 isInElectionState])
          {
          }
          else
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              [(CONodeManager *)self _bumpGeneration];
              [(CONodeManager *)self _resetBallot];
              __int16 v54 = COCoreLogForCategory(15);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v55 = [(CONodeManager *)self shortDescription];
                __int16 v56 = [(CONodeManager *)self electionInfo];
                uint64_t v57 = [v56 generation];
                *(_DWORD *)long long buf = 138543618;
                v70 = v55;
                __int16 v71 = 2048;
                unint64_t v72 = v57;
                _os_log_impl(&dword_2217C1000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting ELECTION %llu", buf, 0x16u);
              }
              __int16 v58 = [(CONodeManager *)self electionInfo];
              v10[2](v10, v58);

              goto LABEL_43;
            }
          }
        }
        v59 = [(CONodeManager *)self electionInfo];
        v10[2](v10, v59);

        if (!v38) {
          goto LABEL_44;
        }
LABEL_43:
        __int16 v60 = self;
        objc_sync_enter(v60);
        id v61 = [(CONodeManager *)v60 nodeControllers];
        uint64_t v62 = (void *)[v61 copy];

        objc_sync_exit(v60);
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __76__CONodeManager_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke;
        v66[3] = &unk_2645CCD80;
        id v67 = v8;
        v68 = v60;
        [v62 enumerateKeysAndObjectsUsingBlock:v66];

        goto LABEL_44;
      }
      v44 = COCoreLogForCategory(11);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [v41 discovery];
        *(_DWORD *)long long buf = 134218498;
        v70 = self;
        __int16 v71 = 2112;
        unint64_t v72 = (unint64_t)v45;
        __int16 v73 = 2048;
        unint64_t v74 = (unint64_t)v41;
        _os_log_impl(&dword_2217C1000, v44, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p when handling response", buf, 0x20u);
      }
    }
    else
    {
      v44 = COCoreLogForCategory(11);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134219010;
        v70 = self;
        __int16 v71 = 2112;
        unint64_t v72 = (unint64_t)v43;
        __int16 v73 = 2112;
        unint64_t v74 = (unint64_t)v8;
        __int16 v75 = 2048;
        id v76 = v41;
        __int16 v77 = 2112;
        id v78 = v9;
        _os_log_debug_impl(&dword_2217C1000, v44, OS_LOG_TYPE_DEBUG, "%p cannot add Discovery %@ for %@ to ballot %p when handling response %@", buf, 0x34u);
      }
    }

    goto LABEL_26;
  }
  [(CONodeManager *)self fast_fold_nodeController:v8 didReceiveElectionCmd:v9 withCompletionHandler:v10];
LABEL_45:
}

void __76__CONodeManager_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void **)(a1 + 32) != a3)
  {
    v3 = *(void **)(a1 + 40);
    id v4 = a3;
    id v5 = [v3 electionInfo];
    [v4 updateElectionInfo:v5];
  }
}

- (void)nodeController:(id)a3 didReceiveCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeManager *)self executionContext];
  [v8 assertDispatchQueue];

  id v9 = [(CONodeManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    __int16 v10 = [COMeshNode alloc];
    id v11 = [v6 node];
    id v12 = [(COMeshNode *)v10 initWithNode:v11];

    [v7 _setSender:v12];
    [v9 node:v12 didReceiveCommand:v7];
  }
  else
  {
    id v13 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CONodeManager nodeController:didReceiveCommand:]();
    }
  }
}

- (void)nodeController:(id)a3 didReceiveRequest:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void, void *))a5;
  id v11 = [(CONodeManager *)self executionContext];
  [v11 assertDispatchQueue];

  id v12 = [(CONodeManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [COMeshNode alloc];
    uint64_t v14 = [v8 node];
    uint64_t v15 = [(COMeshNode *)v13 initWithNode:v14];

    [v9 _setSender:v15];
    [v12 node:v15 didReceiveRequest:v9 responseCallBack:v10];
  }
  else
  {
    int v16 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CONodeManager nodeController:didReceiveRequest:callback:]();
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
    v10[2](v10, 0, v15);
  }
}

- (void)nodeController:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CONodeManager *)self executionContext];
  [v11 assertDispatchQueue];

  id v12 = [(CONodeManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [COMeshNode alloc];
    uint64_t v14 = [v8 node];
    uint64_t v15 = [(COMeshNode *)v13 initWithNode:v14];

    [v10 _setSender:v15];
    [v12 node:v15 didReceiveError:v9 forCommand:v10];
  }
  else
  {
    int v16 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = [(CONodeManager *)self shortDescription];
      int v18 = 138543874;
      int v19 = v17;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_2217C1000, v16, OS_LOG_TYPE_ERROR, "%{public}@ failed to send a command %@ with error %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)nodeController:(id)a3 didUpdateRemoteConstituent:(id)a4 to:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CONodeManager *)self executionContext];
  [v11 assertDispatchQueue];

  if (self->_started)
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    [(CONodeManager *)self _handleEnqueuedCommandsForLostNode:v8 error:v12];
    if ([MEMORY[0x263F33F80] isFastFoldEnabled])
    {
      id v13 = [(CONodeManager *)self electionInfo];
      uint64_t v14 = [v13 leader];
    }
    else
    {
      uint64_t v14 = [(CONodeManager *)self leader];
    }
    if ([v9 isEqual:v14])
    {
      uint64_t v15 = [(CONodeManager *)self executionContext];
      int v16 = [v15 analyticsRecorder];

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __62__CONodeManager_nodeController_didUpdateRemoteConstituent_to___block_invoke;
      v29[3] = &unk_2645CBF40;
      v29[4] = self;
      ((void (*)(COMutableBallot *, uint64_t, void *))v16->super._discovery)(v16, 0x26D3D6188, v29);
      [(CONodeManager *)self _bumpGeneration];
      [(CONodeManager *)self _resetBallot];
    }
    else
    {
      BOOL v17 = [(CONodeManager *)self isInElection];
      if (!v14 || v17) {
        goto LABEL_9;
      }
      if (![MEMORY[0x263F33F80] isFastFoldEnabled])
      {
        int v16 = [(COBallot *)[COMutableBallot alloc] initWithCandidate:v14];
        [(COMutableBallot *)v16 addCandidate:v10];
        __int16 v22 = [(COBallot *)v16 candidates];
        id v23 = [v22 firstObject];

        if (([v23 isEqual:v14] & 1) == 0)
        {
          uint64_t v24 = COCoreLogForCategory(15);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v25 = [(CONodeManager *)self shortDescription];
            *(_DWORD *)long long buf = 138544130;
            uint64_t v31 = v25;
            __int16 v32 = 2112;
            id v33 = v8;
            __int16 v34 = 2112;
            id v35 = v10;
            __int16 v36 = 2112;
            char v37 = v14;
            _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ node controller changed %@ to a new constituent %@ that is better than our current leader %@", buf, 0x2Au);
          }
          [(CONodeManager *)self _bumpGeneration];
          [(CONodeManager *)self _resetBallot];
          [(CONodeManager *)self _informControllersAboutNewElectionInfo];
        }

        goto LABEL_8;
      }
      int v18 = [(CONodeManager *)self electionInfo];
      int v19 = [v18 ballot];
      if (v19)
      {
        __int16 v20 = [(CONodeManager *)self electionInfo];
        [v20 ballot];
        id v21 = v28 = v18;
        int v16 = (COMutableBallot *)[v21 mutableCopy];

        int v18 = v28;
      }
      else
      {
        int v16 = objc_alloc_init(COMutableBallot);
      }

      [(COMutableBallot *)v16 addCandidate:v10];
      if (![(CONodeManager *)self _updateBallot:v16])
      {
LABEL_8:

LABEL_9:
        goto LABEL_10;
      }
      int v26 = COCoreLogForCategory(15);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(CONodeManager *)self shortDescription];
        *(_DWORD *)long long buf = 138544130;
        uint64_t v31 = v27;
        __int16 v32 = 2112;
        id v33 = v8;
        __int16 v34 = 2112;
        id v35 = v10;
        __int16 v36 = 2112;
        char v37 = v14;
        _os_log_impl(&dword_2217C1000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ node controller changed %@ to a new constituent %@ that is better than our current leader %@", buf, 0x2Au);
      }
    }
    [(CONodeManager *)self _informControllersAboutNewElectionInfo];
    goto LABEL_8;
  }
LABEL_10:
}

id __62__CONodeManager_nodeController_didUpdateRemoteConstituent_to___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = 0x26D3D5648;
  v5[1] = 0x26D3D61E8;
  v6[0] = 0x26D3D6308;
  v1 = [*(id *)(a1 + 32) executionContext];
  int v2 = [v1 label];
  v6[1] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)nodeController:(id)a3 didAddTransport:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeManager *)self executionContext];
  [v8 assertDispatchQueue];

  if (self->_started)
  {
    int v9 = [v7 supportsLeaderElection];
    id v10 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CONodeManager *)self shortDescription];
      id v12 = @"does not support";
      *(_DWORD *)uint64_t v24 = 138544130;
      *(_WORD *)&v24[12] = 2048;
      *(void *)&id v24[4] = v11;
      if (v9) {
        id v12 = @"supports";
      }
      *(void *)&v24[14] = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Node %p added a transport %@ that %@ election", v24, 0x2Au);
    }
    if (v9)
    {
      id v13 = [v6 node];
      uint64_t v14 = [v13 state];

      if (v14)
      {
        int v15 = [MEMORY[0x263F33F80] isFastFoldEnabled];
        int v16 = [(CONodeManager *)self electionInfo];
        BOOL v17 = v16;
        if (v15)
        {

          if (!v17) {
            [(CONodeManager *)self _resetBallot];
          }
          [(CONodeManager *)self _informControllersAboutNewElectionInfo];
        }
        else
        {
          int v19 = [v16 ballot];

          __int16 v20 = [v6 node];
          id v21 = [v20 remote];

          __int16 v22 = [v19 candidates];
          char v23 = [v22 containsObject:v21];

          if ((v23 & 1) == 0)
          {
            [(CONodeManager *)self _bumpGeneration];
            [(CONodeManager *)self _resetBallot];
            [(CONodeManager *)self _informControllersAboutNewElectionInfo];
          }
        }
      }
      else
      {
        int v18 = [(CONodeManager *)self electionInfo];
        [v6 updateElectionInfo:v18];
      }
    }
    else
    {
      [v6 inquireForTransport:v7];
    }
  }
}

- (void)nodeController:(id)a3 didRemoveTransport:(id)a4 withError:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CONodeManager *)self executionContext];
  [v11 assertDispatchQueue];

  id v12 = COCoreLogForCategory(15);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(CONodeManager *)self shortDescription];
    uint64_t v14 = [v8 transports];
    *(_DWORD *)long long buf = 138544130;
    unint64_t v55 = v13;
    __int16 v56 = 2048;
    id v57 = v9;
    __int16 v58 = 2048;
    id v59 = v8;
    __int16 v60 = 2114;
    id v61 = v14;
    _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Lost transport %p for node %p. Remaining transports = %{public}@", buf, 0x2Au);
  }
  int v15 = [v8 transports];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    BOOL v17 = [v8 transports];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      int v20 = 0;
      uint64_t v21 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(v17);
          }
          v20 |= [*(id *)(*((void *)&v49 + 1) + 8 * i) supportsLeaderElection];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v19);
    }
    else
    {
      LOBYTE(v20) = 0;
    }

    __int16 v32 = [v8 node];
    id v33 = [v32 remote];

    __int16 v34 = [(CONodeManager *)self electionInfo];
    id v35 = [v34 ballot];

    __int16 v36 = [v35 candidates];
    int v37 = [v36 containsObject:v33];

    if (v37 && (v20 & 1) == 0)
    {
      id v48 = v10;
      if ([MEMORY[0x263F33F80] isFastFoldEnabled])
      {
        uint64_t v38 = [(CONodeManager *)self electionInfo];
        v39 = [v38 leader];
      }
      else
      {
        v39 = [(CONodeManager *)self leader];
      }
      v40 = [v8 node];
      v41 = [v40 remote];

      if (v41)
      {
        id v47 = v9;
        char v42 = [v41 isEqual:v39];
        v43 = [(CONodeManager *)self electionInfo];
        v44 = [v43 ballot];
        v45 = (void *)[v44 mutableCopy];

        [v45 removeCandidate:v41];
        [(CONodeManager *)self _updateBallot:v45];
        if (v42)
        {
          [(CONodeManager *)self _bumpGeneration];
          [(CONodeManager *)self _resetBallot];
          [(CONodeManager *)self _informControllersAboutNewElectionInfo];
        }
        else
        {
          v46 = [(CONodeManager *)self electionInfo];
          [(CONodeManager *)self _checkForElectionCompletion:v46 nodeController:v8];
        }
        id v9 = v47;
      }

      id v10 = v48;
    }
  }
  else
  {
    char v23 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(CONodeManager *)self shortDescription];
      *(_DWORD *)long long buf = 138543618;
      unint64_t v55 = v24;
      __int16 v56 = 2048;
      id v57 = v8;
      _os_log_impl(&dword_2217C1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping node %p since we don't have any more transports available", buf, 0x16u);
    }
    __int16 v25 = [v10 domain];
    int v26 = [v25 isEqualToString:0x26D3D6748];

    if (v26)
    {
      if ([v10 code] == -5001) {
        uint64_t v27 = 18;
      }
      else {
        uint64_t v27 = 20;
      }
      if ([v10 code] == -5003)
      {
        uint64_t v28 = [v10 underlyingErrors];
        uint64_t v29 = [v28 firstObject];

        BOOL v30 = [v29 domain];
        if ([v30 isEqualToString:0x26D3D5A48])
        {
          uint64_t v31 = [v29 code];

          if (v31 == -6001) {
            uint64_t v27 = 19;
          }
        }
        else
        {
        }
      }
    }
    else
    {
      uint64_t v27 = 20;
    }
    [v8 invalidateWithReason:v27];
  }
}

- (void)nodeController:(id)a3 didReceiveOnDemandNodeCreationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(CONodeManager *)self ballotBrowser];
  [v6 discoveryUsingOnDemandNodeCreationRequest:v5];
}

- (void)backedOffNodeMovedOutOfElection:(id)a3
{
  id v10 = a3;
  id v4 = [v10 node];
  unint64_t v5 = [v4 totalBackedOffTime];
  unint64_t v6 = [(CONodeManager *)self longestBackOff];

  if (v5 > v6)
  {
    id v7 = [v10 node];
    -[CONodeManager setLongestBackOff:](self, "setLongestBackOff:", [v7 totalBackedOffTime]);

    id v8 = [v10 node];
    id v9 = [v8 remote];
    [(CONodeManager *)self setLongestBackedOffConstituent:v9];
  }
}

- (void)_bumpGeneration
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(CONodeManager *)self executionContext];
  [v3 assertDispatchQueue];

  id v4 = [(CONodeManager *)self electionInfo];
  uint64_t v5 = [v4 generation] + 1;

  unint64_t v6 = [(CONodeManager *)self electionInfo];
  [v6 setGeneration:v5];

  id v7 = COCoreLogForCategory(15);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CONodeManager *)self shortDescription];
    id v9 = [(CONodeManager *)self electionInfo];
    id v10 = [v9 leader];
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ bumping generation to %llu. Current leader = %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)_resetBallot
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(CONodeManager *)self executionContext];
  [v3 assertDispatchQueue];

  id v4 = [(CONodeManager *)self executionContext];
  uint64_t v5 = [v4 constituentForMe];

  unint64_t v6 = [[COBallot alloc] initWithCandidate:v5];
  id v7 = [(CONodeManager *)self electionInfo];
  [v7 setBallot:v6];

  id v8 = COCoreLogForCategory(15);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(CONodeManager *)self shortDescription];
    id v10 = [(CONodeManager *)self electionInfo];
    int v12 = 138543874;
    __int16 v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = [v10 generation];
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting ballot. Current leader = %{public}@. Current generation = %llu", (uint8_t *)&v12, 0x20u);
  }
  int v11 = [(CONodeManager *)self ballotBrowser];
  [v11 clearRecords];
}

- (BOOL)_updateBallot:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F33F80] isSlimBallotsEnabled])
  {
    uint64_t v5 = [v4 candidates];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = [(CONodeManager *)self nodeForMe];
      id v8 = [v7 underlyingNode];
      id v9 = [v8 meConstituent];
      [v4 addCandidate:v9];
    }
  }
  id v10 = [(CONodeManager *)self electionInfo];
  int v11 = [v10 leader];

  int v12 = [(CONodeManager *)self electionInfo];
  [v12 setBallot:v4];

  __int16 v13 = [(CONodeManager *)self electionInfo];
  __int16 v14 = [v13 leader];

  char v15 = [v11 isEqual:v14];
  if ((v15 & 1) == 0)
  {
    __int16 v16 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(CONodeManager *)self shortDescription];
      uint64_t v18 = [(CONodeManager *)self electionInfo];
      int v20 = 138544130;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      char v23 = v11;
      __int16 v24 = 2114;
      __int16 v25 = v14;
      __int16 v26 = 2048;
      uint64_t v27 = [v18 generation];
      _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Changing leader from %{public}@ to %{public}@. Current generation = %llu", (uint8_t *)&v20, 0x2Au);
    }
  }

  return v15 ^ 1;
}

- (void)_handleEnqueuedCommandsForLostNode:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CONodeManager *)self executionContext];
  [v8 assertDispatchQueue];

  if ([MEMORY[0x263F33F80] isFastFoldEnabled])
  {
    id v9 = [(CONodeManager *)self electionInfo];
    id v10 = [v9 leader];
  }
  else
  {
    id v10 = [(CONodeManager *)self leader];
  }
  int v11 = [v7 node];
  int v12 = [v11 remote];
  char v13 = [v10 isEqual:v12];

  __int16 v14 = [v7 sentElements];
  char v15 = (void *)[v14 copy];

  __int16 v16 = [v7 sentElements];

  [v16 removeAllObjects];
  if (v13)
  {
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke_2;
    v21[3] = &unk_2645CCDD0;
    id v22 = v6;
    id v18 = v17;
    id v23 = v18;
    id v19 = v6;
    [v15 enumerateKeysAndObjectsUsingBlock:v21];
    int v20 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CONodeManager _handleEnqueuedCommandsForLostNode:error:]();
    }

    [(CONodeManager *)self setLeaderCommands:v18];
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke;
    v24[3] = &unk_2645CCDA8;
    id v25 = v6;
    id v18 = v6;
    [v15 enumerateKeysAndObjectsUsingBlock:v24];
    id v19 = v25;
  }
}

uint64_t __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a3 + 16))(a3, a2, 0, *(void *)(a1 + 32));
}

void __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    (*((void (**)(id, id, void, void))v5 + 2))(v5, v8, 0, *(void *)(a1 + 32));
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = (void *)MEMORY[0x223C8B4A0](v5);
    [v6 setObject:v7 forKey:v8];
  }
}

- (void)_reportLostLeader:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CONodeManager *)self executionContext];
  int v8 = [v7 leaderElectionConfigured];

  if (v8)
  {
    id v9 = [(CONodeManager *)self executionContext];
    id v10 = [v9 label];

    int64_t v11 = a4 - 6;
    if (unint64_t)(a4 - 6) <= 0xE && ((0x7D67u >> v11)) {
      id v12 = (id)*off_2645CCEE0[v11];
    }
    else {
      id v12 = 0;
    }
    char v13 = [(CONodeManager *)self executionContext];
    __int16 v14 = [v13 analyticsRecorder];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    id v18[2] = __46__CONodeManager__reportLostLeader_withReason___block_invoke;
    v18[3] = &unk_2645CCDF8;
    id v19 = v12;
    id v20 = v10;
    id v21 = v6;
    char v15 = (void (*)(void *, uint64_t, void *))v14[2];
    id v16 = v10;
    id v17 = v12;
    v15(v14, 0x26D3D6188, v18);
  }
}

id __46__CONodeManager__reportLostLeader_withReason___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:*(void *)(a1 + 32) forKey:0x26D3D5648];
  [v2 setObject:*(void *)(a1 + 40) forKey:0x26D3D61E8];
  if ([*(id *)(a1 + 32) isEqualToString:0x26D3D62A8])
  {
    v3 = [*(id *)(a1 + 48) rapportTransport];
    id v4 = v3;
    if (v3)
    {
      id v5 = NSNumber;
      [v3 currentPingTimeout];
      id v6 = objc_msgSend(v5, "numberWithDouble:");
      [v2 setObject:v6 forKey:0x26D3D62A8];
    }
  }
  return v2;
}

- (void)setElectionPrevious:(unint64_t)a3
{
  if (self->_electionPrevious != a3)
  {
    if (!a3) {
      self->_electionEnd = 0;
    }
    self->_electionPrevious = a3;
  }
}

- (void)setElectionStart:(unint64_t)a3
{
  if (self->_electionStart != a3)
  {
    [(CONodeManager *)self setElectionElapsedTimer:0];
    [(CONodeManager *)self setElectionPrevious:self->_electionStart];
    self->_electionStart = a3;
  }
}

- (void)setElectionEnd:(unint64_t)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (self->_electionEnd != a3)
  {
    uint64_t v28 = [(CONodeManager *)self electionPrevious];
    if (v28)
    {
      uint64_t v29 = [(CONodeManager *)self electionStart];
      id v5 = [(CONodeManager *)self activeNodesWithSelfNode:1];
      if (self->_electionEnd) {
        double v6 = (double)(unint64_t)(v29 - v28) / 1000000000.0;
      }
      else {
        double v6 = 0.0;
      }
      id v7 = [(CONodeManager *)self executionContext];
      __int16 v26 = [v7 label];

      uint64_t v27 = (void *)[v5 count];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v8 = v5;
      unint64_t v9 = 0;
      id v10 = 0;
      int64_t v11 = 0;
      uint64_t v12 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v8);
            }
            char v15 = [*(id *)(*((void *)&v44 + 1) + 8 * i) underlyingNode];
            if ([v15 connectionType] == 2)
            {
              ++v11;
              if ([v15 discoveryType] == 2) {
                ++v10;
              }
            }
            if ([v15 totalBackedOffTime] > v9) {
              unint64_t v9 = [v15 totalBackedOffTime];
            }
          }
          uint64_t v12 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v12);
      }

      id v16 = [(CONodeManager *)self executionContext];
      id v17 = [v16 analyticsRecorder];

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __32__CONodeManager_setElectionEnd___block_invoke;
      v35[3] = &unk_2645CCE20;
      double v38 = (double)(a3 - (unint64_t)v29) / 1000000.0;
      v39 = v27;
      v40 = v11;
      v41 = v10;
      double v42 = v6;
      id v18 = v26;
      unint64_t v43 = v9;
      id v36 = v18;
      int v37 = self;
      ((void (**)(void, uint64_t, void *))v17)[2](v17, 0x26D3D6168, v35);
      self->_electionEnd = a3;
      id v19 = [(CONodeManager *)self electionElapsedTimer];
      BOOL v20 = v19 == 0;

      if (v20)
      {
        id v21 = [(CONodeManager *)self executionContext];
        id v22 = [v21 dispatchQueue];

        id v23 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v22);
        if (v23)
        {
          dispatch_time_t v24 = dispatch_walltime(0, 86400000000000);
          dispatch_source_set_timer(v23, v24, 0x4E94914F0000uLL, 0);
          objc_initWeak(&location, self);
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = __32__CONodeManager_setElectionEnd___block_invoke_2;
          handler[3] = &unk_2645CCE48;
          objc_copyWeak(v33, &location);
          v33[1] = v28;
          v33[2] = v29;
          __int16 v32 = v17;
          v33[3] = v27;
          v33[4] = v11;
          v33[5] = v10;
          id v31 = v18;
          dispatch_source_set_event_handler(v23, handler);
          [(CONodeManager *)self setElectionElapsedTimer:v23];

          objc_destroyWeak(v33);
          objc_destroyWeak(&location);
        }
      }
    }
  }
  longestBackedOffConstituent = self->_longestBackedOffConstituent;
  self->_longestBackOff = 0;
  self->_longestBackedOffConstituent = 0;
}

id __32__CONodeManager_setElectionEnd___block_invoke(uint64_t a1)
{
  v15[7] = *MEMORY[0x263EF8340];
  v14[0] = 0x26D3D6228;
  int v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v15[0] = v2;
  v14[1] = 0x26D3D6248;
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v15[1] = v3;
  v14[2] = 0x26D3D6268;
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v15[2] = v4;
  v14[3] = 0x26D3D6288;
  id v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v15[3] = v5;
  void v14[4] = 0x26D3D6208;
  double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  uint64_t v7 = *(void *)(a1 + 32);
  v15[4] = v6;
  v15[5] = v7;
  v14[5] = 0x26D3D61E8;
  v14[6] = 0x26D3D6468;
  id v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
  v15[6] = v8;
  unint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
  id v10 = (void *)[v9 mutableCopy];

  int64_t v11 = *(void **)(a1 + 40);
  if (v11[12])
  {
    uint64_t v12 = objc_msgSend(v11, "_constituentCharacteristics:");
    [v10 setObject:v12 forKey:0x26D3D6488];
  }
  return v10;
}

void __32__CONodeManager_setElectionEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4 == [WeakRetained electionPrevious])
    {
      uint64_t v5 = *(void *)(a1 + 64);
      if (v5 == [v3 electionStart])
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __32__CONodeManager_setElectionEnd___block_invoke_3;
        v7[3] = &unk_2645CBB58;
        long long v10 = *(_OWORD *)(a1 + 72);
        uint64_t v11 = *(void *)(a1 + 88);
        uint64_t v6 = *(void *)(a1 + 40);
        id v8 = *(id *)(a1 + 32);
        unint64_t v9 = v3;
        (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, 0x26D3D6168, v7);
      }
    }
  }
}

id __32__CONodeManager_setElectionEnd___block_invoke_3(void *a1)
{
  v13[7] = *MEMORY[0x263EF8340];
  v13[0] = &unk_26D3EB830;
  v12[0] = 0x26D3D6228;
  v12[1] = 0x26D3D6248;
  int v2 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v13[1] = v2;
  v12[2] = 0x26D3D6268;
  v3 = [NSNumber numberWithUnsignedInteger:a1[7]];
  id v13[2] = v3;
  v12[3] = 0x26D3D6288;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1[8]];
  v13[3] = v4;
  v13[4] = &unk_26D3EB8E8;
  v12[4] = 0x26D3D6208;
  v12[5] = 0x26D3D61E8;
  uint64_t v5 = a1[5];
  v13[5] = a1[4];
  v12[6] = 0x26D3D6468;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(v5 + 88)];
  v13[6] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];
  id v8 = (void *)[v7 mutableCopy];

  unint64_t v9 = (void *)a1[5];
  if (v9[12])
  {
    long long v10 = objc_msgSend(v9, "_constituentCharacteristics:");
    [v8 setObject:v10 forKey:0x26D3D6488];
  }
  return v8;
}

- (void)setElectionElapsedTimer:(id)a3
{
  uint64_t v5 = (OS_dispatch_source *)a3;
  electionElapsedTimer = self->_electionElapsedTimer;
  p_electionElapsedTimer = &self->_electionElapsedTimer;
  uint64_t v6 = electionElapsedTimer;
  unint64_t v9 = v5;
  if (electionElapsedTimer != v5)
  {
    if (v6) {
      dispatch_source_cancel(v6);
    }
    objc_storeStrong((id *)p_electionElapsedTimer, a3);
    if (*p_electionElapsedTimer) {
      dispatch_resume((dispatch_object_t)*p_electionElapsedTimer);
    }
  }
}

- (void)_informControllersAboutNewElectionInfo
{
  v3 = [(CONodeManager *)self executionContext];
  [v3 assertDispatchQueue];

  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(CONodeManager *)v4 nodeControllers];
  uint64_t v6 = (void *)[v5 copy];

  objc_sync_exit(v4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CONodeManager__informControllersAboutNewElectionInfo__block_invoke;
  v7[3] = &unk_2645CCE70;
  void v7[4] = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __55__CONodeManager__informControllersAboutNewElectionInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 electionInfo];
  [v4 updateElectionInfo:v5];
}

- (void)_handleDiscoveryRecord:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CONodeManager *)self executionContext];
  [v5 assertDispatchQueue];

  uint64_t v6 = [v4 IDSIdentifier];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  BOOL v30 = __Block_byref_object_copy__13;
  id v31 = __Block_byref_object_dispose__13;
  id v32 = 0;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(CONodeManager *)v7 nodeControllers];
  uint64_t v9 = [v8 objectForKey:v6];
  long long v10 = (void *)v28[5];
  v28[5] = v9;

  objc_sync_exit(v7);
  uint64_t v11 = (void *)v28[5];
  if (v11)
  {
    [v11 addDiscoveryRecord:v4];
  }
  else
  {
    uint64_t v12 = [CONodeController alloc];
    uint64_t v13 = [(CONodeManager *)v7 executionContext];
    uint64_t v14 = [(CONodeController *)v12 initWithDiscoveryRecord:v4 executionContext:v13];
    char v15 = (void *)v28[5];
    v28[5] = v14;

    id v16 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(CONodeManager *)v7 shortDescription];
      uint64_t v18 = v28[5];
      *(_DWORD *)long long buf = 138543874;
      __int16 v34 = v17;
      __int16 v35 = 2048;
      uint64_t v36 = v18;
      __int16 v37 = 2114;
      id v38 = v4;
      _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ created NodeController %p with record %{public}@", buf, 0x20u);
    }
    [(id)v28[5] setDelegate:v7];
    [(id)v28[5] setAcceptableCommands:v7->_acceptableCommands];
    id v19 = v7;
    objc_sync_enter(v19);
    BOOL v20 = [(CONodeManager *)v19 nodeControllers];
    [v20 setObject:v28[5] forKey:v6];

    objc_sync_exit(v19);
    objc_initWeak((id *)buf, v19);
    id v21 = (void *)v28[5];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __40__CONodeManager__handleDiscoveryRecord___block_invoke;
    v22[3] = &unk_2645CCE98;
    objc_copyWeak(&v26, (id *)buf);
    id v23 = v4;
    id v24 = v6;
    id v25 = &v27;
    [v21 activateWithCompletionHandler:v22];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v27, 8);
}

void __40__CONodeManager__handleDiscoveryRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = COCoreLogForCategory(15);
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __40__CONodeManager__handleDiscoveryRecord___block_invoke_cold_1(WeakRetained);
      }

      uint64_t v6 = WeakRetained;
      objc_sync_enter(v6);
      uint64_t v7 = [v6 nodeControllers];
      [v7 removeObjectForKey:*(void *)(a1 + 40)];

      objc_sync_exit(v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [WeakRetained shortDescription];
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      uint64_t v13 = v9;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully activated NodeController %p", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_handleLostRecord:(id)a3
{
  id v9 = a3;
  id v4 = [(CONodeManager *)self executionContext];
  [v4 assertDispatchQueue];

  id v5 = [v9 IDSIdentifier];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(CONodeManager *)v6 nodeControllers];
  id v8 = [v7 objectForKey:v5];

  objc_sync_exit(v6);
  if (v8) {
    [v8 removeDiscoveryRecord:v9];
  }
}

- (void)_nodeStopped:(id)a3 withReason:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 node];
  id v8 = [v7 IDSIdentifier];

  id v9 = COCoreLogForCategory(15);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(CONodeManager *)self shortDescription];
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %p [IDS: %@] from our list", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = self;
  objc_sync_enter(v11);
  __int16 v12 = [(CONodeManager *)v11 nodeControllers];
  [v12 removeObjectForKey:v8];

  objc_sync_exit(v11);
  [(CONodeManager *)v11 _nodeBecameInactive:v6 withReason:a4];
}

- (void)_nodeBecameInactive:(id)a3 withReason:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(CONodeManager *)self executionContext];
  [v7 assertDispatchQueue];

  id v8 = [v6 node];
  id v9 = [v8 remote];

  if (v9)
  {
    int v10 = [(CONodeManager *)self executionContext];
    int v11 = [v10 leaderElectionConfigured];

    if (v11)
    {
      if ([MEMORY[0x263F33F80] isFastFoldEnabled])
      {
        __int16 v12 = [(CONodeManager *)self electionInfo];
        int v13 = [v12 leader];
      }
      else
      {
        int v13 = [(CONodeManager *)self leader];
      }
      uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D5E28 code:-4101 userInfo:0];
      [(CONodeManager *)self _handleEnqueuedCommandsForLostNode:v6 error:v14];

      if ([v9 isEqual:v13])
      {
        __int16 v15 = COCoreLogForCategory(15);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [(CONodeManager *)self shortDescription];
          int v22 = 138543362;
          id v23 = v16;
          _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ leader lost", (uint8_t *)&v22, 0xCu);
        }
        [(CONodeManager *)self _bumpGeneration];
        [(CONodeManager *)self _resetBallot];
        [(CONodeManager *)self _informControllersAboutNewElectionInfo];
        [(CONodeManager *)self _reportLostLeader:v6 withReason:a4];
      }
      else
      {
        __int16 v17 = [(CONodeManager *)self electionInfo];
        uint64_t v18 = [v17 ballot];
        uint64_t v19 = (void *)[v18 mutableCopy];

        BOOL v20 = [v6 node];
        id v21 = [v20 remote];
        [v19 removeCandidate:v21];

        [(CONodeManager *)self _updateBallot:v19];
      }
    }
    [v6 markInactive];
  }
}

- (void)_informDelegateAboutNodeAddition:(id)a3 oldState:(int64_t)a4
{
  uint64_t v6 = (uint64_t)a3;
  uint64_t v7 = v6;
  if ((unint64_t)a4 <= 2)
  {
    __int16 v12 = (void *)v6;
    uint64_t v6 = [(id)v6 isLocalNodeController];
    uint64_t v7 = (uint64_t)v12;
    if ((v6 & 1) == 0)
    {
      id v8 = [(CONodeManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        id v9 = [COMeshNode alloc];
        int v10 = [v12 node];
        int v11 = [(COMeshNode *)v9 initWithNode:v10];

        [v8 didAddNode:v11];
      }

      uint64_t v7 = (uint64_t)v12;
    }
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_informDelegateAboutNodeRemoval:(id)a3 oldState:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 5) <= 1)
  {
    id v11 = v6;
    uint64_t v7 = [(CONodeManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v8 = [COMeshNode alloc];
      id v9 = [v11 node];
      int v10 = [(COMeshNode *)v8 initWithNode:v9];

      [v7 didRemoveNode:v10];
    }

    id v6 = v11;
  }
}

- (void)_nodeStartedElection:(id)a3 withElectionInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeManager *)self executionContext];
  [v8 assertDispatchQueue];

  if ([MEMORY[0x263F33F80] isFastFoldEnabled])
  {
    id v9 = COCoreLogForCategory(15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(CONodeManager *)self shortDescription];
      int v19 = 138543618;
      BOOL v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ node started election %@", (uint8_t *)&v19, 0x16u);
    }
  }
  else if ([MEMORY[0x263F33F80] isSlimBallotsEnabled])
  {
    id v11 = [(CONodeManager *)self executionContext];
    __int16 v12 = [v11 constituentForMe];

    int v13 = [v6 node];
    uint64_t v14 = [v13 meConstituent];
    if ([v12 isEqual:v14] && objc_msgSend(v7, "generation") == 1)
    {
    }
    else
    {
      __int16 v15 = [(CONodeManager *)self electionInfo];
      char v16 = [v7 isEqual:v15];

      if (v16) {
        goto LABEL_15;
      }
    }
  }
  __int16 v17 = self;
  objc_sync_enter(v17);
  [(CONodeManager *)v17 setLeader:0];
  objc_sync_exit(v17);

  if (![(CONodeManager *)v17 isInElection])
  {
    [(CONodeManager *)v17 setElectionStart:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
    [(CONodeManager *)v17 setIsInElection:1];
  }
  uint64_t v18 = [(CONodeManager *)v17 delegate];
  if (objc_opt_respondsToSelector()) {
    [v18 didStartElection];
  }

LABEL_15:
}

- (void)_checkForElectionCompletion:(id)a3 nodeController:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeManager *)self executionContext];
  [v8 assertDispatchQueue];

  if ([(CONodeManager *)self isInElection])
  {
    id v9 = self;
    objc_sync_enter(v9);
    int v10 = [(CONodeManager *)v9 nodeControllers];
    id v11 = (void *)[v10 copy];

    objc_sync_exit(v9);
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 1;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke;
    v32[3] = &unk_2645CCD30;
    id v33 = v6;
    __int16 v34 = &v35;
    [v11 enumerateKeysAndObjectsUsingBlock:v32];
    if (*((unsigned char *)v36 + 24))
    {
      __int16 v12 = COCoreLogForCategory(15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [(CONodeManager *)v9 shortDescription];
        *(_DWORD *)long long buf = 138543362;
        v40 = v13;
        _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ all nodes have finished election. Moving to state processing", buf, 0xCu);
      }
      [(CONodeManager *)v9 _logElectionSummary];
      [(CONodeManager *)v9 setIsInElection:0];
      [(CONodeManager *)v9 setElectionEnd:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
      uint64_t v14 = v9;
      objc_sync_enter(v14);
      __int16 v15 = [(CONodeManager *)v14 electionInfo];
      char v16 = [v15 ballot];
      __int16 v17 = [v16 candidates];
      uint64_t v18 = [v17 firstObject];

      [(CONodeManager *)v14 setLeader:v18];
      objc_sync_exit(v14);

      int v19 = [(CONodeManager *)v14 delegate];
      if (objc_opt_respondsToSelector()) {
        [v19 didCompleteElection];
      }
      BOOL v20 = [(CONodeManager *)v14 electionInfo];
      __int16 v21 = [v20 ballot];
      id v22 = [v21 candidates];
      uint64_t v23 = [v22 firstObject];

      uint64_t v24 = [(CONodeManager *)v14 nodeControllerForConstituent:v23];
      id v25 = [(CONodeManager *)v14 leaderCommands];
      id v26 = (void *)[v25 mutableCopy];

      uint64_t v27 = [(CONodeManager *)v14 leaderCommands];
      [v27 removeAllObjects];

      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke_66;
      v30[3] = &unk_2645CCDA8;
      id v28 = v24;
      id v31 = v28;
      [v26 enumerateKeysAndObjectsUsingBlock:v30];
    }
    _Block_object_dispose(&v35, 8);
  }
  else if ([v7 isLocalNodeController])
  {
    uint64_t v29 = [(CONodeManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v29 didCompleteElection];
    }
  }
}

void __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  id v6 = [v12 node];
  if (![v6 isActive]) {
    goto LABEL_7;
  }
  int v7 = [v12 supportsLeaderElection];

  id v8 = v12;
  if (!v7) {
    goto LABEL_10;
  }
  id v6 = [v12 node];
  if ([v6 state] != 14)
  {

    id v8 = v12;
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 32))
  {
LABEL_7:

    id v8 = v12;
    goto LABEL_10;
  }
  id v9 = [v12 node];
  int v10 = [v9 lastElectionInfoSent];
  char v11 = [v10 hasSameGenerationAndLeader:*(void *)(a1 + 32)];

  id v8 = v12;
  if ((v11 & 1) == 0)
  {
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_10:
}

uint64_t __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke_66(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) sendCommand:a2 withCompletionHandler:a3];
}

- (id)_constituentCharacteristics:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 device];
  uint64_t v6 = [v4 flags];

  return (id)[v3 stringWithFormat:@"%d, %llu", v5, v6];
}

- (void)_logElectionSummary
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089D8] string];
  id v4 = [MEMORY[0x263F089D8] string];
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  uint64_t v6 = [(CONodeManager *)self executionContext];
  int v7 = [v6 meshName];

  id v8 = [(CONodeManager *)self electionInfo];
  uint64_t v9 = [v8 generation];

  int v10 = [(CONodeManager *)self electionInfo];
  char v11 = [v10 ballot];
  id v12 = [v11 candidates];
  id v31 = [v12 firstObject];

  int v13 = self;
  objc_sync_enter(v13);
  uint64_t v14 = [(CONodeManager *)v13 nodeControllers];
  __int16 v15 = (void *)[v14 copy];

  objc_sync_exit(v13);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __36__CONodeManager__logElectionSummary__block_invoke;
  v32[3] = &unk_2645CCEC0;
  id v16 = v5;
  id v33 = v16;
  id v17 = v4;
  id v34 = v17;
  id v18 = v3;
  id v35 = v18;
  [v15 enumerateKeysAndObjectsUsingBlock:v32];
  int v19 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = [(CONodeManager *)v13 executionContext];
    __int16 v21 = [v20 meshControllerDescription];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v37 = v21;
    __int16 v38 = 2114;
    uint64_t v39 = v7;
    __int16 v40 = 2048;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    id v43 = v31;
    _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Completed Election(%llu). Leader is %{public}@", buf, 0x2Au);
  }
  id v22 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [(CONodeManager *)v13 executionContext];
    uint64_t v24 = [v23 meshControllerDescription];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v37 = v24;
    __int16 v38 = 2114;
    uint64_t v39 = v7;
    __int16 v40 = 2048;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    id v43 = v18;
    _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Candidate summary for Election(%llu)\n%{public}@", buf, 0x2Au);
  }
  id v25 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [(CONodeManager *)v13 executionContext];
    uint64_t v27 = [v26 meshControllerDescription];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v37 = v27;
    __int16 v38 = 2114;
    uint64_t v39 = v7;
    __int16 v40 = 2048;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    id v43 = v16;
    _os_log_impl(&dword_2217C1000, v25, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Dormant trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);
  }
  id v28 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [(CONodeManager *)v13 executionContext];
    BOOL v30 = [v29 meshControllerDescription];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v37 = v30;
    __int16 v38 = 2114;
    uint64_t v39 = v7;
    __int16 v40 = 2048;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    id v43 = v17;
    _os_log_impl(&dword_2217C1000, v28, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Discovered trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);
  }
}

void __36__CONodeManager__logElectionSummary__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v4 = [v12 node];
  uint64_t v5 = [v4 state];

  if (v5)
  {
    uint64_t v6 = [v12 node];
    uint64_t v7 = [v6 state];

    if (v7 == 2)
    {
      id v8 = (void *)a1[4];
    }
    else
    {
      uint64_t v9 = [v12 node];
      uint64_t v10 = [v9 state];

      if (v10 == 1) {
        id v8 = (void *)a1[5];
      }
      else {
        id v8 = (void *)a1[6];
      }
    }
    char v11 = [v12 electionSummaryDetails];
    [v8 appendFormat:@"%@\n", v11];
  }
}

- (CONodeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CONodeManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (void)setExecutionContext:(id)a3
{
}

- (void)setLeader:(id)a3
{
}

- (NSSet)acceptableCommands
{
  return self->_acceptableCommands;
}

- (void)setAcceptableCommands:(id)a3
{
}

- (COBallotBrowser)ballotBrowser
{
  return self->_ballotBrowser;
}

- (void)setBallotBrowser:(id)a3
{
}

- (OS_dispatch_source)electionElapsedTimer
{
  return self->_electionElapsedTimer;
}

- (unint64_t)electionPrevious
{
  return self->_electionPrevious;
}

- (unint64_t)electionStart
{
  return self->_electionStart;
}

- (unint64_t)electionEnd
{
  return self->_electionEnd;
}

- (unint64_t)longestBackOff
{
  return self->_longestBackOff;
}

- (void)setLongestBackOff:(unint64_t)a3
{
  self->_longestBackOff = a3;
}

- (COConstituent)longestBackedOffConstituent
{
  return self->_longestBackedOffConstituent;
}

- (void)setLongestBackedOffConstituent:(id)a3
{
}

- (BOOL)isInElection
{
  return self->_isInElection;
}

- (void)setIsInElection:(BOOL)a3
{
  self->_isInElection = a3;
}

- (NSMutableDictionary)browsersObservers
{
  return self->_browsersObservers;
}

- (NSMutableDictionary)nodeControllers
{
  return self->_nodeControllers;
}

- (void)setNodeControllers:(id)a3
{
}

- (COElectionInfo)electionInfo
{
  return self->_electionInfo;
}

- (void)setElectionInfo:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)pendingDiscoveryRecords
{
  return self->_pendingDiscoveryRecords;
}

- (void)setPendingDiscoveryRecords:(id)a3
{
}

- (NSMutableDictionary)leaderCommands
{
  return self->_leaderCommands;
}

- (void)setLeaderCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderCommands, 0);
  objc_storeStrong((id *)&self->_pendingDiscoveryRecords, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_electionInfo, 0);
  objc_storeStrong((id *)&self->_nodeControllers, 0);
  objc_storeStrong((id *)&self->_browsersObservers, 0);
  objc_storeStrong((id *)&self->_longestBackedOffConstituent, 0);
  objc_storeStrong((id *)&self->_electionElapsedTimer, 0);
  objc_storeStrong((id *)&self->_ballotBrowser, 0);
  objc_storeStrong((id *)&self->_acceptableCommands, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __22__CONodeManager_start__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 shortDescription];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ failed to start browser %@", v4, v5, v6, v7, 2u);
}

- (void)nodeController:didReceiveCommand:.cold.1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 shortDescription];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ received a command %@ but has no delegate to deliver to", v4, v5, v6, v7, v8);
}

- (void)nodeController:didReceiveRequest:callback:.cold.1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 shortDescription];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ received a request %@ but has no delegate to deliver to", v4, v5, v6, v7, v8);
}

- (void)_handleEnqueuedCommandsForLostNode:error:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = [v1 shortDescription];
  [v0 count];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v3, v4, "%{public}@ lost leader. Re-queuing %lu elements", v5, v6, v7, v8, 2u);
}

void __40__CONodeManager__handleDiscoveryRecord___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ failed to create a NodeController using Record %{public}@", v4, v5, v6, v7, 2u);
}

@end