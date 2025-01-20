@interface COMeshController
- (BOOL)_isCurrentElectionVariant:(int64_t)a3;
- (BOOL)_isElectionComplete;
- (BOOL)addAddOn:(id)a3;
- (BOOL)hasPendingPing;
- (BOOL)removeAddOn:(id)a3;
- (COBallot)ballot;
- (COBallotBrowser)ballotBrowser;
- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory;
- (COConstituent)leader;
- (COConstituent)longestBackedOffConstituent;
- (COConstituent)me;
- (CODiscoveryManager)discoveryManager;
- (COIDSBrowser)idsBrowser;
- (COMeshController)init;
- (COMeshController)initWithConstituentType:(unint64_t)a3;
- (COMeshLocalNode)listener;
- (COMeshNode)nodeForMe;
- (COMeshNodeStateTrackerSet)trackers;
- (CONodeManager)nodeManager;
- (CORapportBrowser)rapportBrowser;
- (NSArray)nodes;
- (NSArray)queuedCommands;
- (NSArray)sentCommands;
- (NSDictionary)commandHandlers;
- (NSDictionary)notificationHandlers;
- (NSDictionary)requestHandlers;
- (NSOrderedSet)addOns;
- (NSString)description;
- (NSString)globalServiceName;
- (NSString)label;
- (NSString)meshName;
- (NSUserDefaults)coordinationDefaults;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)electionElapsedTimer;
- (double)pingMaximum;
- (double)pingMinimum;
- (id)_acceptResponseWithBallot:(id)a3 generation:(unint64_t)a4;
- (id)_ballotResponseWithBallot:(id)a3 generation:(unint64_t)a4;
- (id)_constituentCharacteristics:(id)a3;
- (id)_currentBallotMergedWithBallot:(id)a3;
- (id)_electionRequestWithBallot:(id)a3 generation:(unint64_t)a4;
- (id)_handleDiscoveryUsingElectionRequest:(id)a3;
- (id)_inflateQueueCommands;
- (id)_newCompanionLinkClient;
- (id)_nodeDetails:(id)a3;
- (id)_voteRequestWithBallot:(id)a3 generation:(unint64_t)a4;
- (id)nodeForConstituent:(id)a3;
- (id)recorder;
- (unint64_t)clusterOptions;
- (unint64_t)electionEnd;
- (unint64_t)electionPrevious;
- (unint64_t)electionStart;
- (unint64_t)generation;
- (unint64_t)internalFlags;
- (unint64_t)longestBackOff;
- (unint64_t)state;
- (void)_enqueueCommand:(id)a3;
- (void)_finalizeCompletionOfNode:(id)a3 memberOfMesh:(BOOL)a4 eventProvider:(id)a5;
- (void)_handleAcceptResponse:(id)a3 onNode:(id)a4;
- (void)_handleBallotResponse:(id)a3 onNode:(id)a4;
- (void)_handleDiscoveryUsingBallot:(id)a3;
- (void)_handleElectionRequest:(id)a3 onNode:(id)a4 responseCallBack:(id)a5;
- (void)_handleNodeChanges;
- (void)_handleVoteRequest:(id)a3 onNode:(id)a4 responseCallBack:(id)a5;
- (void)_logElectionSummary;
- (void)_performElectionGeneration:(unint64_t)a3 source:(id)a4 allowingPostTransition:(BOOL)a5;
- (void)_performInvalidationOfNode:(id)a3 error:(id)a4 eventProvider:(id)a5;
- (void)_performStopOfNode:(id)a3 error:(id)a4 eventProvider:(id)a5;
- (void)_pingLeader;
- (void)_processBackedOffNodesExcludingTracker:(id)a3;
- (void)_processQueuedCommands;
- (void)_removeSentCommand:(id)a3 fromNode:(id)a4 withResponse:(id)a5 error:(id)a6;
- (void)_setupBrowsers;
- (void)_setupCoordinationPrefsObserver;
- (void)_tearDownCoordinationPrefsObserver;
- (void)_transitionToPostElection;
- (void)addBrowser:(id)a3;
- (void)backedOffNodeMovedOutOfElection:(id)a3;
- (void)broadcastRequest:(id)a3 includingSelf:(BOOL)a4 recipientsCallback:(id)a5 completionHandler:(id)a6;
- (void)deregisterHandlerForCommandClass:(Class)a3;
- (void)deregisterHandlerForNotificationClass:(Class)a3;
- (void)deregisterHandlerForRequestClass:(Class)a3;
- (void)didActivateNode:(id)a3;
- (void)didAddNode:(id)a3;
- (void)didCompleteElection;
- (void)didInvalidateNode:(id)a3;
- (void)didRemoveNode:(id)a3;
- (void)didStartElection;
- (void)didTransitionToState:(unint64_t)a3;
- (void)discoveryManager:(id)a3 didDiscoverRecords:(id)a4;
- (void)node:(id)a3 didReceiveCommand:(id)a4;
- (void)node:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5;
- (void)node:(id)a3 didReceiveRequest:(id)a4 responseCallBack:(id)a5;
- (void)node:(id)a3 didReceiveResponse:(id)a4 toRequest:(id)a5;
- (void)node:(id)a3 didSendCommand:(id)a4;
- (void)nodeBecameAvailable:(id)a3;
- (void)nodeShouldRetryAfterBackoff:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerHandler:(id)a3 forCommandClass:(Class)a4;
- (void)registerHandler:(id)a3 forNotificationClass:(Class)a4;
- (void)registerHandler:(id)a3 forRequestClass:(Class)a4;
- (void)sendCommand:(id)a3 toPeer:(id)a4;
- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)sendNotification:(id)a3;
- (void)sendRequest:(id)a3 sentRequestCallback:(id)a4;
- (void)sendRequest:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5;
- (void)sendRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)setAddOns:(id)a3;
- (void)setBallot:(id)a3;
- (void)setBallotBrowser:(id)a3;
- (void)setClusterOptions:(unint64_t)a3;
- (void)setCommandHandlers:(id)a3;
- (void)setCompanionLinkClientFactory:(id)a3;
- (void)setCoordinationDefaults:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setElectionElapsedTimer:(id)a3;
- (void)setElectionEnd:(unint64_t)a3;
- (void)setElectionPrevious:(unint64_t)a3;
- (void)setElectionStart:(unint64_t)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setGlobalServiceName:(id)a3;
- (void)setIdsBrowser:(id)a3;
- (void)setInternalFlags:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLeader:(id)a3;
- (void)setListener:(id)a3;
- (void)setLongestBackOff:(unint64_t)a3;
- (void)setLongestBackedOffConstituent:(id)a3;
- (void)setMeshName:(id)a3;
- (void)setNotificationHandlers:(id)a3;
- (void)setPendingPing:(BOOL)a3;
- (void)setPingMaximum:(double)a3;
- (void)setPingMinimum:(double)a3;
- (void)setQueuedCommands:(id)a3;
- (void)setRapportBrowser:(id)a3;
- (void)setRecorder:(id)a3;
- (void)setRequestHandlers:(id)a3;
- (void)setSentCommands:(id)a3;
- (void)start;
- (void)stop;
- (void)unknownNodeForCommand:(id)a3 result:(id)a4;
- (void)unknownNodeForRequest:(id)a3 result:(id)a4;
- (void)willActivateNode:(id)a3;
- (void)willInvalidateNode:(id)a3 error:(id)a4;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation COMeshController

- (COMeshController)initWithConstituentType:(unint64_t)a3
{
  v35.receiver = self;
  v35.super_class = (Class)COMeshController;
  v4 = [(COMeshController *)&v35 init];
  if (v4)
  {
    v5 = [[COConstituent alloc] initWithType:a3];
    v6 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v5;

    if (([*((id *)v4 + 5) supportsBackoff] & 1) == 0) {
      *((void *)v4 + 3) |= 1uLL;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF9D8]);
    v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v7;

    v9 = [[COBallot alloc] initWithCandidate:*((void *)v4 + 5)];
    v10 = (void *)*((void *)v4 + 11);
    *((void *)v4 + 11) = v9;

    v11 = objc_alloc_init(COMeshNodeStateTrackerSet);
    v12 = (void *)*((void *)v4 + 21);
    *((void *)v4 + 21) = v11;

    uint64_t v13 = +[CODiscoveryManager managerWithDiscoveryDelay:v4 delegate:30.0];
    v14 = (void *)*((void *)v4 + 22);
    *((void *)v4 + 22) = v13;

    id v15 = objc_alloc_init(NSDictionary);
    v16 = (void *)*((void *)v4 + 23);
    *((void *)v4 + 23) = v15;

    id v17 = objc_alloc_init(NSDictionary);
    v18 = (void *)*((void *)v4 + 24);
    *((void *)v4 + 24) = v17;

    id v19 = objc_alloc_init(NSDictionary);
    v20 = (void *)*((void *)v4 + 25);
    *((void *)v4 + 25) = v19;

    id v21 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    v22 = (void *)*((void *)v4 + 26);
    *((void *)v4 + 26) = v21;

    id v23 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    v24 = (void *)*((void *)v4 + 27);
    *((void *)v4 + 27) = v23;

    objc_storeStrong((id *)v4 + 7, MEMORY[0x263EF83A0]);
    v25 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v26 = [v25 bundleIdentifier];
    v27 = (void *)*((void *)v4 + 36);
    *((void *)v4 + 36) = v26;

    if (![*((id *)v4 + 36) length])
    {
      v28 = [MEMORY[0x263F08AB0] processInfo];
      uint64_t v29 = [v28 processName];
      v30 = (void *)*((void *)v4 + 36);
      *((void *)v4 + 36) = v29;
    }
    uint64_t v31 = [*((id *)v4 + 36) copy];
    v32 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v31;

    v33 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = &__block_literal_global_1;

    *((void *)v4 + 10) = 1;
    *(_OWORD *)(v4 + 232) = xmmword_22188FE70;
  }
  return (COMeshController *)v4;
}

uint64_t __44__COMeshController_initWithConstituentType___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (COMeshController)init
{
  return [(COMeshController *)self initWithConstituentType:-1];
}

- (NSString)description
{
  unint64_t v3 = [(COMeshController *)self state];
  if (v3 > 4) {
    v4 = @"Unknown";
  }
  else {
    v4 = off_2645CBFB0[v3];
  }
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = [(COMeshController *)self nodes];
  v9 = [v5 stringWithFormat:@"<%@: %p, %@, %@>", v7, self, v4, v8];

  return (NSString *)v9;
}

- (void)setInternalFlags:(unint64_t)a3
{
  char v3 = a3;
  self->_internalFlags = a3;
  if (![(COMeshController *)self state])
  {
    id v7 = [(COMeshController *)self me];
    if (((v3 & 1) == 0) != [v7 supportsBackoff])
    {
      int v5 = [v7 flags];
      if (v3) {
        unint64_t v6 = 0;
      }
      else {
        unint64_t v6 = 0xFFFFFFFF80000000;
      }
      [v7 setFlags:v6 & 0xFFFFFFFF80000000 | v5 & 0x7FFFFFFF];
    }
  }
}

- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory
{
  companionLinkClientFactory = self->_companionLinkClientFactory;
  if (!companionLinkClientFactory)
  {
    v4 = objc_alloc_init(COCompanionLinkClientFactory);
    int v5 = self->_companionLinkClientFactory;
    self->_companionLinkClientFactory = (COCompanionLinkClientFactoryProtocol *)v4;

    companionLinkClientFactory = self->_companionLinkClientFactory;
  }
  return companionLinkClientFactory;
}

- (void)addBrowser:(id)a3
{
}

- (void)setListener:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(COMeshController *)self listener];
  v8 = v7;
  if (v7 != v5)
  {
    if (v7)
    {
      [v7 setDelegate:0];
      [v8 invalidate];
    }
    p_listener = &self->_listener;
    objc_storeStrong((id *)&self->_listener, a3);
    v10 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[COMeshController setListener:]();
    }

    v11 = *p_listener;
    if (*p_listener)
    {
      v12 = [(COMeshController *)self meshName];
      [(COMeshNode *)v11 setMeshName:v12];

      listener = self->_listener;
      v14 = [(COMeshController *)self label];
      [(COMeshNode *)listener setLabel:v14];

      id v15 = self->_listener;
      v16 = [(COMeshController *)self recorder];
      [(COMeshNode *)v15 setRecorder:v16];

      id v17 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      id v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
      v22 = [(COMeshController *)self commandHandlers];
      id v23 = [v22 allKeys];
      [v21 addObjectsFromArray:v23];

      v24 = [(COMeshController *)self notificationHandlers];
      v25 = [v24 allKeys];
      [v21 addObjectsFromArray:v25];

      uint64_t v26 = [(COMeshController *)self requestHandlers];
      v27 = [v26 allKeys];
      [v21 addObjectsFromArray:v27];

      [(COMeshLocalNode *)self->_listener setAcceptableCommands:v21];
      [(COMeshNode *)self->_listener setDelegate:self];
      [(COMeshLocalNode *)self->_listener activate];
    }
  }
}

- (COConstituent)leader
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    if ([(COMeshController *)self state] == 3)
    {
      char v3 = [(CONodeManager *)self->_nodeManager leader];
    }
    else
    {
      char v3 = 0;
    }
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    if ([(COMeshController *)v4 state] == 3) {
      char v3 = v4->_leader;
    }
    else {
      char v3 = 0;
    }
    objc_sync_exit(v4);
  }
  return v3;
}

- (COMeshNode)nodeForMe
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    char v3 = [(COMeshController *)self nodeManager];
    v4 = [v3 nodeForMe];
  }
  else
  {
    v4 = self->_listener;
  }
  return (COMeshNode *)v4;
}

- (unint64_t)generation
{
  if (![MEMORY[0x263F33F80] isGlobalMessagingEnabled]) {
    return self->_generation;
  }
  char v3 = [(COMeshController *)self nodeManager];
  v4 = [v3 electionInfo];
  unint64_t v5 = [v4 generation];

  return v5;
}

- (COBallot)ballot
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    char v3 = [(COMeshController *)self nodeManager];
    v4 = [v3 electionInfo];
    unint64_t v5 = [v4 ballot];
  }
  else
  {
    unint64_t v5 = self->_ballot;
  }
  return v5;
}

- (NSOrderedSet)addOns
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)[(NSOrderedSet *)v2->_addOns copy];
  objc_sync_exit(v2);

  return (NSOrderedSet *)v3;
}

- (void)setAddOns:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = [(COMeshController *)v4 addOns];
  char v6 = [v5 isEqualToOrderedSet:v9];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v9 copy];
    addOns = v4->_addOns;
    v4->_addOns = (NSOrderedSet *)v7;
  }
  objc_sync_exit(v4);
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
    [(COMeshController *)self setElectionElapsedTimer:0];
    [(COMeshController *)self setElectionPrevious:self->_electionStart];
    self->_electionStart = a3;
  }
}

- (void)setElectionEnd:(unint64_t)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (self->_electionEnd != a3)
  {
    unint64_t v5 = [(COMeshController *)self electionPrevious];
    if (v5)
    {
      char v6 = (void *)v5;
      unint64_t v7 = [(COMeshController *)self electionStart];
      v27 = (void *)v7;
      if (self->_electionEnd) {
        double v8 = (double)(v7 - (unint64_t)v6) / 1000000000.0;
      }
      else {
        double v8 = 0.0;
      }
      uint64_t v26 = [(COMeshController *)self label];
      id v9 = [(COMeshController *)self nodes];
      uint64_t v25 = [v9 count];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v10 = [(COMeshController *)self nodes];
      v11 = 0;
      v12 = 0;
      uint64_t v13 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(v10);
            }
            v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if ([v16 connectionType] == 2)
            {
              ++v11;
              if ([v16 discoveryType] == 2) {
                ++v12;
              }
            }
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v13);
      }

      id v17 = [(COMeshController *)self recorder];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __35__COMeshController_setElectionEnd___block_invoke;
      v33[3] = &unk_2645CBB30;
      double v36 = (double)(a3 - (unint64_t)v27) / 1000000.0;
      uint64_t v37 = v25 + 1;
      v38 = v11;
      v39 = v12;
      double v40 = v8;
      id v18 = v26;
      id v34 = v18;
      objc_super v35 = self;
      ((void (**)(void, uint64_t, void *))v17)[2](v17, 0x26D3D6168, v33);

      self->_electionEnd = a3;
      uint64_t v19 = [(COMeshController *)self electionElapsedTimer];
      BOOL v20 = v19 == 0;

      if (v20)
      {
        id v21 = [(COMeshController *)self dispatchQueue];
        v22 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v21);

        if (v22)
        {
          dispatch_time_t v23 = dispatch_walltime(0, 86400000000000);
          dispatch_source_set_timer(v22, v23, 0x4E94914F0000uLL, 0);
          objc_initWeak(&location, self);
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = __35__COMeshController_setElectionEnd___block_invoke_2;
          handler[3] = &unk_2645CBB80;
          objc_copyWeak(v31, &location);
          v31[1] = v6;
          v31[2] = v27;
          v31[3] = (id)(v25 + 1);
          v31[4] = v11;
          v31[5] = v12;
          id v29 = v18;
          v30 = self;
          dispatch_source_set_event_handler(v22, handler);
          [(COMeshController *)self setElectionElapsedTimer:v22];

          objc_destroyWeak(v31);
          objc_destroyWeak(&location);
        }
      }
    }
  }
  longestBackedOffConstituent = self->_longestBackedOffConstituent;
  self->_longestBackOff = 0;
  self->_longestBackedOffConstituent = 0;
}

id __35__COMeshController_setElectionEnd___block_invoke(uint64_t a1)
{
  v16[7] = *MEMORY[0x263EF8340];
  v15[0] = 0x26D3D6228;
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v16[0] = v2;
  v15[1] = 0x26D3D6248;
  char v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v16[1] = v3;
  v15[2] = 0x26D3D6268;
  v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v16[2] = v4;
  v15[3] = 0x26D3D6288;
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v16[3] = v5;
  v15[4] = 0x26D3D6208;
  char v6 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v16[4] = v6;
  v16[5] = v7;
  v15[5] = 0x26D3D61E8;
  v15[6] = 0x26D3D6468;
  id v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(v8 + 248)];
  v16[6] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:7];
  v11 = (void *)[v10 mutableCopy];

  v12 = *(void **)(a1 + 40);
  if (v12[32])
  {
    uint64_t v13 = objc_msgSend(v12, "_constituentCharacteristics:");
    [v11 setObject:v13 forKey:0x26D3D6488];
  }
  return v11;
}

void __35__COMeshController_setElectionEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4 == [WeakRetained electionPrevious])
    {
      uint64_t v5 = *(void *)(a1 + 64);
      if (v5 == [v3 electionStart])
      {
        char v6 = [v3 recorder];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __35__COMeshController_setElectionEnd___block_invoke_3;
        v9[3] = &unk_2645CBB58;
        long long v12 = *(_OWORD *)(a1 + 72);
        uint64_t v13 = *(void *)(a1 + 88);
        id v7 = *(id *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        id v10 = v7;
        uint64_t v11 = v8;
        ((void (**)(void, uint64_t, void *))v6)[2](v6, 0x26D3D6168, v9);
      }
    }
  }
}

id __35__COMeshController_setElectionEnd___block_invoke_3(void *a1)
{
  v13[7] = *MEMORY[0x263EF8340];
  v13[0] = &unk_26D3EB818;
  v12[0] = 0x26D3D6228;
  v12[1] = 0x26D3D6248;
  v2 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v13[1] = v2;
  v12[2] = 0x26D3D6268;
  char v3 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v13[2] = v3;
  v12[3] = 0x26D3D6288;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1[8]];
  v13[3] = v4;
  v13[4] = &unk_26D3EB8D8;
  v12[4] = 0x26D3D6208;
  v12[5] = 0x26D3D61E8;
  uint64_t v5 = a1[5];
  v13[5] = a1[4];
  v12[6] = 0x26D3D6468;
  char v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(v5 + 248)];
  v13[6] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];
  uint64_t v8 = (void *)[v7 mutableCopy];

  id v9 = (void *)a1[5];
  if (v9[32])
  {
    id v10 = objc_msgSend(v9, "_constituentCharacteristics:");
    [v8 setObject:v10 forKey:0x26D3D6488];
  }
  return v8;
}

- (void)setDispatchQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  if (self->_dispatchQueue != v4 && [MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    uint64_t v5 = [(COMeshController *)self nodeManager];
    char v6 = [v5 executionContext];
    id v7 = (void *)[v6 mutableCopy];

    [v7 setObject:v4 forKey:0x26D3D7548];
    uint64_t v8 = [(COMeshController *)self nodeManager];
    [v8 setExecutionContext:v7];
  }
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v4;
}

- (void)setRecorder:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_recorder != v4)
  {
    int v5 = [MEMORY[0x263F33F80] isGlobalMessagingEnabled];
    id v4 = v13;
    if (v5)
    {
      char v6 = [(COMeshController *)self nodeManager];
      id v7 = [v6 executionContext];
      uint64_t v8 = (void *)[v7 mutableCopy];

      id v9 = (void *)MEMORY[0x223C8B4A0](v13);
      [v8 setObject:v9 forKey:0x26D3D7568];

      id v10 = [(COMeshController *)self nodeManager];
      [v10 setExecutionContext:v8];

      id v4 = v13;
    }
  }
  uint64_t v11 = (void *)MEMORY[0x223C8B4A0](v4);
  id recorder = self->_recorder;
  self->_id recorder = v11;
}

- (void)setElectionElapsedTimer:(id)a3
{
  int v5 = (OS_dispatch_source *)a3;
  electionElapsedTimer = self->_electionElapsedTimer;
  p_electionElapsedTimer = &self->_electionElapsedTimer;
  char v6 = electionElapsedTimer;
  id v9 = v5;
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

- (NSArray)nodes
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    char v3 = [(COMeshController *)self nodeManager];
    id v4 = [(COMeshController *)v3 nodes];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    char v3 = self;
    objc_sync_enter(v3);
    char v6 = [(COMeshController *)v3 trackers];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __25__COMeshController_nodes__block_invoke;
    v8[3] = &unk_2645CBBA8;
    id v4 = v5;
    id v9 = v4;
    [v6 enumerateNodeStateTrackersOfStatus:1 usingBlock:v8];

    objc_sync_exit(v3);
  }

  return (NSArray *)v4;
}

void __25__COMeshController_nodes__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 node];
  [v2 addObject:v3];
}

- (BOOL)addAddOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(COMeshController *)v5 addOns];
  if (-[COMeshController state](v5, "state") || ([v6 containsObject:v4] & 1) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v9 = (void *)[v6 mutableCopy];
    [v9 addObject:v4];
    [v4 willAddToMeshController:v5];
    [(COMeshController *)v5 setAddOns:v9];
    [v4 didAddToMeshController:v5];

    BOOL v7 = 1;
  }

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)removeAddOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(COMeshController *)v5 addOns];
  if (-[COMeshController state](v5, "state") || ![v6 containsObject:v4])
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v7 = (void *)[v6 mutableCopy];
    [v7 removeObject:v4];
    [v4 willRemoveFromMeshController:v5];
    [(COMeshController *)v5 setAddOns:v7];
    [v4 didRemoveFromMeshController:v5];

    BOOL v8 = 1;
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)start
{
  id v3 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__COMeshController_start__block_invoke;
  block[3] = &unk_2645CB288;
  block[4] = self;
  dispatch_async(v3, block);
}

void __25__COMeshController_start__block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) state];
  objc_sync_exit(v2);

  if (!v3)
  {
    id v4 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      char v6 = [v5 meshName];
      BOOL v7 = [*(id *)(a1 + 32) me];
      *(_DWORD *)buf = 134218498;
      v59 = v5;
      __int16 v60 = 2112;
      v61 = v6;
      __int16 v62 = 2112;
      v63 = v7;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p starting \"%@\" mesh (%@)", buf, 0x20u);
    }
    [*(id *)(a1 + 32) setElectionPrevious:0];
    BOOL v8 = [*(id *)(a1 + 32) addOns];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __25__COMeshController_start__block_invoke_57;
    v57[3] = &unk_2645CBBD0;
    v57[4] = *(void *)(a1 + 32);
    [v8 enumerateObjectsUsingBlock:v57];
    [*(id *)(a1 + 32) willTransitionToState:1];
    id v9 = [MEMORY[0x263F08AB0] processInfo];
    id v10 = [v9 processName];

    if (![v10 isEqualToString:@"coordinated"]
      || ([*(id *)(a1 + 32) meshName],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 containsString:@"home-mesh"],
          v11,
          v12))
    {
      [*(id *)(a1 + 32) _setupCoordinationPrefsObserver];
    }
    char v13 = [MEMORY[0x263F33F80] isGlobalMessagingEnabled];
    id v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    *(void *)(*(void *)(a1 + 32) + 32) = 1;
    if (v13)
    {
      objc_sync_exit(v14);

      id v15 = [MEMORY[0x263EFF9C0] set];
      [v15 addObject:objc_opt_class()];
      [v15 addObject:objc_opt_class()];
      if ([*(id *)(a1 + 32) clusterOptions])
      {
        [v15 addObject:objc_opt_class()];
        [v15 addObject:objc_opt_class()];
      }
      v16 = [*(id *)(a1 + 32) commandHandlers];
      id v17 = [v16 allKeys];
      [v15 addObjectsFromArray:v17];

      id v18 = [*(id *)(a1 + 32) notificationHandlers];
      uint64_t v19 = [v18 allKeys];
      [v15 addObjectsFromArray:v19];

      BOOL v20 = [*(id *)(a1 + 32) requestHandlers];
      id v21 = [v20 allKeys];
      [v15 addObjectsFromArray:v21];

      v22 = *(void **)(a1 + 32);
      if (!v22[33])
      {
        dispatch_time_t v23 = [COMutableExecutionContext alloc];
        v24 = [*(id *)(a1 + 32) dispatchQueue];
        uint64_t v25 = [(COExecutionContext *)v23 initWithDispatchQueue:v24];

        uint64_t v26 = [*(id *)(a1 + 32) meshName];
        [(COMutableExecutionContext *)v25 setObject:v26 forKey:0x26D3D7588];

        v27 = [*(id *)(a1 + 32) label];
        [(COMutableExecutionContext *)v25 setObject:v27 forKey:0x26D3D75A8];

        v28 = [*(id *)(a1 + 32) me];
        [(COMutableExecutionContext *)v25 setObject:v28 forKey:0x26D3D75C8];

        id v29 = [*(id *)(a1 + 32) recorder];
        [(COMutableExecutionContext *)v25 setObject:v29 forKey:0x26D3D7568];

        v30 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(a1 + 32));
        [(COMutableExecutionContext *)v25 setObject:v30 forKey:0x26D3D75E8];

        uint64_t v31 = objc_alloc_init(CONetworkActivityFactory);
        [(COMutableExecutionContext *)v25 setObject:v31 forKey:0x26D3D7608];

        v32 = NSNumber;
        [*(id *)(a1 + 32) pingMinimum];
        v33 = objc_msgSend(v32, "numberWithDouble:");
        [(COMutableExecutionContext *)v25 setObject:v33 forKey:0x26D3D7628];

        id v34 = NSNumber;
        [*(id *)(a1 + 32) pingMaximum];
        objc_super v35 = objc_msgSend(v34, "numberWithDouble:");
        [(COMutableExecutionContext *)v25 setObject:v35 forKey:0x26D3D7648];

        double v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "clusterOptions"));
        [(COMutableExecutionContext *)v25 setObject:v36 forKey:0x26D3D7668];

        uint64_t v37 = [[CONodeManager alloc] initWithExecutionContext:v25];
        v38 = *(void **)(*(void *)(a1 + 32) + 264);
        *(void *)(*(void *)(a1 + 32) + 264) = v37;

        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "setDelegate:");
        v22 = *(void **)(a1 + 32);
      }
      [v22 _setupBrowsers];
      v39 = [*(id *)(a1 + 32) nodeManager];
      [v39 setAcceptableCommands:v15];

      double v40 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        long long v41 = *(void **)(a1 + 32);
        long long v42 = [v41 nodeManager];
        *(_DWORD *)buf = 134218242;
        v59 = v41;
        __int16 v60 = 2112;
        v61 = v42;
        _os_log_impl(&dword_2217C1000, v40, OS_LOG_TYPE_DEFAULT, "%p starting NodeManager %@", buf, 0x16u);
      }
      long long v43 = [*(id *)(a1 + 32) nodeManager];
      [v43 start];

      long long v44 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v59 = v45;
        _os_log_impl(&dword_2217C1000, v44, OS_LOG_TYPE_DEFAULT, "%p NodeManager started", buf, 0xCu);
      }

      v47 = *(void **)(a1 + 32);
      uint64_t v46 = (id *)(a1 + 32);
      v48 = [v47 addOns];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __25__COMeshController_start__block_invoke_72;
      v56[3] = &unk_2645CBBD0;
      v56[4] = *v46;
      [v48 enumerateObjectsUsingBlock:v56];

      [*v46 didTransitionToState:1];
    }
    else
    {
      v49 = [*(id *)(a1 + 32) trackers];
      [v49 removeAllNodeStateTrackers];

      objc_sync_exit(v14);
      v51 = *(void **)(a1 + 32);
      v50 = (id *)(a1 + 32);
      id v15 = [v51 me];
      v52 = [[COBallot alloc] initWithCandidate:v15];
      v53 = (void *)[*v50 _newCompanionLinkClient];
      v54 = [[COMeshLocalNode alloc] initWithCompanionLinkClient:v53 source:v15];
      v55 = [*v50 companionLinkClientFactory];
      [(COMeshLocalNode *)v54 setCompanionLinkClientFactory:v55];

      [*v50 setBallot:v52];
      [*v50 setListener:v54];
      [*v50 didTransitionToState:1];
    }
  }
}

uint64_t __25__COMeshController_start__block_invoke_57(uint64_t a1, void *a2)
{
  return [a2 willStartMeshController:*(void *)(a1 + 32)];
}

uint64_t __25__COMeshController_start__block_invoke_72(uint64_t a1, void *a2)
{
  return [a2 didStartMeshController:*(void *)(a1 + 32)];
}

- (void)stop
{
  uint64_t v3 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__COMeshController_stop__block_invoke;
  block[3] = &unk_2645CB288;
  block[4] = self;
  dispatch_async(v3, block);
}

void __24__COMeshController_stop__block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) state];
  objc_sync_exit(v2);

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    id v4 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      char v6 = [v5 meshName];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p stopping \"%@\" mesh", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__9;
    v59 = __Block_byref_object_dispose__9;
    id v60 = [*(id *)(a1 + 32) addOns];
    BOOL v7 = *(void **)(*(void *)&buf[8] + 40);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __24__COMeshController_stop__block_invoke_73;
    v55[3] = &unk_2645CBBD0;
    v55[4] = *(void *)(a1 + 32);
    [v7 enumerateObjectsUsingBlock:v55];
    [*(id *)(a1 + 32) willTransitionToState:4];
    [*(id *)(a1 + 32) _tearDownCoordinationPrefsObserver];
    int v8 = [MEMORY[0x263F33F80] isGlobalMessagingEnabled];
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    *(void *)(*(void *)(a1 + 32) + 32) = 4;
    if (v8)
    {
      objc_sync_exit(v9);

      [*(id *)(a1 + 32) didTransitionToState:4];
      id v10 = [*(id *)(a1 + 32) nodeManager];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __24__COMeshController_stop__block_invoke_2;
      v54[3] = &unk_2645CB120;
      v54[4] = *(void *)(a1 + 32);
      v54[5] = buf;
      [v10 stopWithCompletionHandler:v54];

      [*(id *)(a1 + 32) setRapportBrowser:0];
      [*(id *)(a1 + 32) setIdsBrowser:0];
      [*(id *)(a1 + 32) setBallotBrowser:0];
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) trackers];
      int v12 = [v11 nodeStateTrackersWithStatus:1];

      objc_sync_exit(v9);
      char v13 = [*(id *)(a1 + 32) listener];
      id v14 = objc_alloc_init(MEMORY[0x263EFFA08]);
      [v13 setAcceptableCommands:v14];

      uint64_t v15 = [v12 count];
      v16 = *(void **)(a1 + 32);
      if (v15)
      {
        unint64_t v17 = [v16 electionEnd];
        if (v17 > [*(id *)(a1 + 32) electionStart])
        {
          uint64_t v18 = [*(id *)(a1 + 32) label];
          uint64_t v19 = [*(id *)(a1 + 32) nodes];
          uint64_t v20 = [v19 count];

          long long v51 = 0u;
          long long v52 = 0u;
          long long v50 = 0u;
          long long v49 = 0u;
          id v21 = [*(id *)(a1 + 32) nodes];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v56 count:16];
          uint64_t v38 = v20;
          v39 = (void *)v18;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          if (v22)
          {
            uint64_t v25 = *(void *)v50;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v50 != v25) {
                  objc_enumerationMutation(v21);
                }
                v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                if ([v27 connectionType] == 2)
                {
                  ++v23;
                  if ([v27 discoveryType] == 2) {
                    ++v24;
                  }
                }
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v56 count:16];
            }
            while (v22);
          }

          __uint64_t v28 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          id v29 = [*(id *)(a1 + 32) recorder];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __24__COMeshController_stop__block_invoke_3;
          v43[3] = &unk_2645CBBF8;
          uint64_t v45 = v38 + 1;
          uint64_t v46 = v23;
          uint64_t v47 = v24;
          double v48 = (double)(v28 - v17) / 1000000000.0;
          id v30 = v39;
          id v44 = v30;
          ((void (**)(void, uint64_t, void *))v29)[2](v29, 0x26D3D6168, v43);
        }
        uint64_t v31 = objc_alloc_init(COMeshWithdrawalCommand);
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __24__COMeshController_stop__block_invoke_4;
        v40[3] = &unk_2645CBC20;
        uint64_t v42 = 4;
        v32 = v31;
        long long v41 = v32;
        [v12 enumerateObjectsUsingBlock:v40];

        uint64_t v33 = 4;
      }
      else
      {
        [v16 setElectionStart:0];
        [*(id *)(a1 + 32) didTransitionToState:4];
        [*(id *)(a1 + 32) willTransitionToState:0];
        [*(id *)(a1 + 32) setListener:0];
        id v34 = *(id *)(a1 + 32);
        objc_sync_enter(v34);
        *(void *)(*(void *)(a1 + 32) + 32) = 0;
        uint64_t v35 = [*(id *)(a1 + 32) addOns];
        double v36 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v35;

        objc_sync_exit(v34);
        uint64_t v37 = *(void **)(*(void *)&buf[8] + 40);
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __24__COMeshController_stop__block_invoke_2_76;
        v53[3] = &unk_2645CBBD0;
        v53[4] = *(void *)(a1 + 32);
        [v37 enumerateObjectsUsingBlock:v53];
        uint64_t v33 = 0;
      }
      [*(id *)(a1 + 32) didTransitionToState:v33];
    }
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __24__COMeshController_stop__block_invoke_73(uint64_t a1, void *a2)
{
  return [a2 willStopMeshController:*(void *)(a1 + 32)];
}

uint64_t __24__COMeshController_stop__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 nodeManager];
    *(_DWORD *)buf = 134218240;
    char v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p Node manager %p successfully stopped", buf, 0x16u);
  }
  [*(id *)(a1 + 32) willTransitionToState:0];
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v6 = [*(id *)(a1 + 32) addOns];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_sync_exit(v5);
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __24__COMeshController_stop__block_invoke_74;
  v11[3] = &unk_2645CBBD0;
  v11[4] = *(void *)(a1 + 32);
  [v9 enumerateObjectsUsingBlock:v11];
  return [*(id *)(a1 + 32) didTransitionToState:0];
}

uint64_t __24__COMeshController_stop__block_invoke_74(uint64_t a1, void *a2)
{
  return [a2 didStopMeshController:*(void *)(a1 + 32)];
}

uint64_t __24__COMeshController_stop__block_invoke_2_76(uint64_t a1, void *a2)
{
  return [a2 didStopMeshController:*(void *)(a1 + 32)];
}

id __24__COMeshController_stop__block_invoke_3(uint64_t a1)
{
  v10[6] = *MEMORY[0x263EF8340];
  v10[0] = &unk_26D3EB818;
  v9[0] = 0x26D3D6228;
  v9[1] = 0x26D3D6248;
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v10[1] = v2;
  v9[2] = 0x26D3D6268;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v10[2] = v3;
  v9[3] = 0x26D3D6288;
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v10[3] = v4;
  void v9[4] = 0x26D3D6208;
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v9[5] = 0x26D3D61E8;
  uint64_t v6 = *(void *)(a1 + 32);
  v10[4] = v5;
  v10[5] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

void __24__COMeshController_stop__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setState:v3];
  id v5 = [v4 node];

  [v5 sendMeshCommand:*(void *)(a1 + 32)];
}

- (void)willTransitionToState:(unint64_t)a3
{
  id v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(COMeshController *)v6 addOns];
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__COMeshController_willTransitionToState___block_invoke;
  v8[3] = &unk_2645CBC48;
  void v8[4] = v6;
  v8[5] = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __42__COMeshController_willTransitionToState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 meshController:*(void *)(a1 + 32) willTransitionToState:*(void *)(a1 + 40)];
}

- (void)didTransitionToState:(unint64_t)a3
{
  id v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(COMeshController *)v6 addOns];
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__COMeshController_didTransitionToState___block_invoke;
  v8[3] = &unk_2645CBC48;
  void v8[4] = v6;
  v8[5] = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __41__COMeshController_didTransitionToState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 meshController:*(void *)(a1 + 32) didTransitionToState:*(void *)(a1 + 40)];
}

- (void)willActivateNode:(id)a3
{
  uint64_t v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)willInvalidateNode:(id)a3 error:(id)a4
{
  id v4 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);
}

- (void)registerHandler:(id)a3 forCommandClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__COMeshController_registerHandler_forCommandClass___block_invoke;
  block[3] = &unk_2645CBC70;
  id v10 = v6;
  Class v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __52__COMeshController_registerHandler_forCommandClass___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__COMeshController_registerHandler_forCommandClass___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) commandHandlers];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = (void *)[*(id *)(a1 + 40) copy];
  id v6 = (void *)MEMORY[0x223C8B4A0]();
  [v4 setObject:v6 forKey:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setCommandHandlers:v4];
}

- (void)deregisterHandlerForCommandClass:(Class)a3
{
  id v5 = [(COMeshController *)self dispatchQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__COMeshController_deregisterHandlerForCommandClass___block_invoke;
  v6[3] = &unk_2645CBC98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __53__COMeshController_deregisterHandlerForCommandClass___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__COMeshController_deregisterHandlerForCommandClass___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) commandHandlers];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCommandHandlers:v4];
}

- (void)registerHandler:(id)a3 forNotificationClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__COMeshController_registerHandler_forNotificationClass___block_invoke;
  block[3] = &unk_2645CBC70;
  id v10 = v6;
  Class v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __57__COMeshController_registerHandler_forNotificationClass___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__COMeshController_registerHandler_forNotificationClass___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) notificationHandlers];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = (void *)[*(id *)(a1 + 40) copy];
  id v6 = (void *)MEMORY[0x223C8B4A0]();
  [v4 setObject:v6 forKey:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setNotificationHandlers:v4];
}

- (void)deregisterHandlerForNotificationClass:(Class)a3
{
  id v5 = [(COMeshController *)self dispatchQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke;
  v6[3] = &unk_2645CBC98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) notificationHandlers];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setNotificationHandlers:v4];
}

- (void)registerHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__COMeshController_registerHandler_forRequestClass___block_invoke;
  block[3] = &unk_2645CBC70;
  id v10 = v6;
  Class v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __52__COMeshController_registerHandler_forRequestClass___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__COMeshController_registerHandler_forRequestClass___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) requestHandlers];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = (void *)[*(id *)(a1 + 40) copy];
  id v6 = (void *)MEMORY[0x223C8B4A0]();
  [v4 setObject:v6 forKey:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setRequestHandlers:v4];
}

- (void)deregisterHandlerForRequestClass:(Class)a3
{
  id v5 = [(COMeshController *)self dispatchQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__COMeshController_deregisterHandlerForRequestClass___block_invoke;
  v6[3] = &unk_2645CBC98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __53__COMeshController_deregisterHandlerForRequestClass___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__COMeshController_deregisterHandlerForRequestClass___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) requestHandlers];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setRequestHandlers:v4];
}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__COMeshController_sendCommand_withCompletionHandler___block_invoke;
  block[3] = &unk_2645CB330;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__COMeshController_sendCommand_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshController_sendCommand_withCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v3 = [[COMeshControllerQueuedCommand alloc] initWithCommand:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _enqueueCommand:v3];
}

- (void)sendRequest:(id)a3 sentRequestCallback:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__COMeshController_sendRequest_sentRequestCallback___block_invoke;
  v10[3] = &unk_2645CBCC0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x223C8B4A0](v10);
  [(COMeshController *)self sendRequest:v8 withCompletionHandler:v9];
}

uint64_t __52__COMeshController_sendRequest_sentRequestCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__COMeshController_sendRequest_withCompletionHandler___block_invoke;
  block[3] = &unk_2645CB330;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__COMeshController_sendRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshController_sendRequest_withCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v3 = [[COMeshControllerQueuedRequest alloc] initWithRequest:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _enqueueCommand:v3];
}

- (void)sendCommand:(id)a3 toPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__COMeshController_sendCommand_toPeer___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __39__COMeshController_sendCommand_toPeer___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39__COMeshController_sendCommand_toPeer___block_invoke_cold_1();
  }

  uint64_t v3 = [COMeshControllerQueuedCommand alloc];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__COMeshController_sendCommand_toPeer___block_invoke_82;
  v6[3] = &unk_2645CBCE8;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v5 = [(COMeshControllerQueuedCommand *)v3 initWithCommand:v7 completionHandler:v6];
  [(COMeshControllerQueuedCommand *)v5 setDestination:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _enqueueCommand:v5];
}

void __39__COMeshController_sendCommand_toPeer___block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COCoreLogForCategory(0);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__COMeshController_sendCommand_toPeer___block_invoke_82_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 134218498;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p sent command %@ to peer %@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)sendRequest:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(COMeshController *)self dispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke;
  v15[3] = &unk_2645CB4D0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v3 = [(COMeshControllerQueuedRequest *)[COMeshControllerQueuedPeerRequest alloc] initWithRequest:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
  [(COMeshControllerQueuedRequest *)v3 setDestination:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _enqueueCommand:v3];
}

- (void)broadcastRequest:(id)a3 includingSelf:(BOOL)a4 recipientsCallback:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(COMeshController *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__COMeshController_broadcastRequest_includingSelf_recipientsCallback_completionHandler___block_invoke;
  block[3] = &unk_2645CBD10;
  BOOL v22 = a4;
  id v20 = v11;
  id v21 = v12;
  id v18 = v10;
  uint64_t v19 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __88__COMeshController_broadcastRequest_includingSelf_recipientsCallback_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = [[COMeshControllerQueuedBroadcastRequestMarker alloc] initWithRequest:*(void *)(a1 + 32) includeSelf:*(unsigned __int8 *)(a1 + 64) recipientBlock:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 queuedCommands];
  id v4 = [v3 arrayByAddingObject:v5];
  [v2 setQueuedCommands:v4];

  [*(id *)(a1 + 40) _processQueuedCommands];
}

- (void)sendNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshController *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__COMeshController_sendNotification___block_invoke;
  v7[3] = &unk_2645CAE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__COMeshController_sendNotification___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) nodes];
  uint64_t v3 = (void *)[v2 copy];

  id v4 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    BOOL v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v3;
    _os_log_debug_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEBUG, "%p notifying %@ with recipients list %@", buf, 0x20u);
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __37__COMeshController_sendNotification___block_invoke_86;
  id v16 = &unk_2645CBD38;
  id v17 = *(id *)(a1 + 40);
  id v18 = v5;
  id v6 = v5;
  [v3 enumerateObjectsUsingBlock:&v13];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = objc_msgSend(v7, "queuedCommands", v13, v14, v15, v16);
  id v9 = [v8 arrayByAddingObjectsFromArray:v6];
  [v7 setQueuedCommands:v9];

  [*(id *)(a1 + 32) _processQueuedCommands];
}

void __37__COMeshController_sendNotification___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[COMeshControllerQueuedNotification alloc] initWithNotification:*(void *)(a1 + 32) destination:v3];

  [*(id *)(a1 + 40) addObject:v4];
}

- (id)_newCompanionLinkClient
{
  id v3 = [(COMeshController *)self companionLinkClientFactory];
  id v4 = [v3 companionLinkClientForCurrentDevice];

  id v5 = [(COMeshController *)self dispatchQueue];
  [v4 setDispatchQueue:v5];

  return v4;
}

- (id)nodeForConstituent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(COMeshController *)self nodes];
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 remote];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_currentBallotMergedWithBallot:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COMeshController *)self ballot];
  id v7 = (void *)[v6 mutableCopy];

  [v7 mergeBallot:v4];
  uint64_t v8 = [(COMeshController *)self me];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = objc_msgSend(v7, "candidates", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v14 isEqual:v8] & 1) == 0)
        {
          long long v15 = [(COMeshController *)self nodeForConstituent:v14];

          if (!v15) {
            [v7 removeCandidate:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  long long v16 = (void *)[v7 copy];
  return v16;
}

- (void)_pingLeader
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%p sending ping (%g)", (uint8_t *)&v3, 0x16u);
}

- (id)_inflateQueueCommands
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(COMeshController *)self nodes];
  __int16 v5 = (void *)[v4 copy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v22 = self;
  double v6 = [(COMeshController *)self queuedCommands];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          id v13 = v5;
          if ([v12 includeSelfInBroadcast])
          {
            long long v14 = [(COMeshController *)v22 nodeForMe];
            [v13 arrayByAddingObject:v14];
            long long v15 = v6;
            uint64_t v17 = v16 = v5;

            id v13 = (id)v17;
            __int16 v5 = v16;
            double v6 = v15;
          }
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __41__COMeshController__inflateQueueCommands__block_invoke;
          v23[3] = &unk_2645CBD38;
          id v18 = v12;
          id v24 = v18;
          id v25 = v3;
          [v13 enumerateObjectsUsingBlock:v23];
          long long v19 = [v18 recipientCallback];

          if (v19)
          {
            long long v20 = [v18 recipientCallback];
            ((void (**)(void, id))v20)[2](v20, v13);
          }
        }
        else
        {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  return v3;
}

void __41__COMeshController__inflateQueueCommands__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [COMeshControllerQueuedBroadcastRequest alloc];
  __int16 v5 = [*(id *)(a1 + 32) request];
  double v6 = [*(id *)(a1 + 32) completionHandler];
  uint64_t v7 = [(COMeshControllerQueuedBroadcastRequest *)v4 initWithRequest:v5 destination:v3 completionHandler:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

- (void)_processQueuedCommands
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p leader is %p, so dispatching queue to self", v2, v3);
}

void __42__COMeshController__processQueuedCommands__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __int16 v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResponse:a2];
  [*(id *)(a1 + 32) invokeCallbackWithError:v6];
}

void __42__COMeshController__processQueuedCommands__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  __int16 v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResponse:a2];
  [*(id *)(a1 + 32) invokeCallbackWithError:v6];
}

void __42__COMeshController__processQueuedCommands__block_invoke_91(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) command];
    [v3 _setSender:*(void *)(a1 + 40)];
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [*(id *)(a1 + 32) destination];
      __int16 v5 = [WeakRetained listener];
      int v6 = [v4 isEqual:v5];

      if (v6)
      {
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __42__COMeshController__processQueuedCommands__block_invoke_2_92;
        v40[3] = &unk_2645CBD60;
        uint64_t v7 = *(void *)(a1 + 40);
        void v40[4] = *(void *)(a1 + 32);
        [WeakRetained node:v7 didReceiveRequest:v3 responseCallBack:v40];
LABEL_13:

        goto LABEL_14;
      }
      id v13 = *(void **)(a1 + 48);
      long long v14 = [v13 sentCommands];
      long long v15 = [v14 arrayByAddingObject:*(void *)(a1 + 32)];
      [v13 setSentCommands:v15];

      goto LABEL_11;
    }
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) setDestination:*(void *)(a1 + 40)];
      uint64_t v8 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = *(void *)(a1 + 48);
        long long v27 = (objc_class *)objc_opt_class();
        long long v28 = NSStringFromClass(v27);
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        uint64_t v42 = v26;
        __int16 v43 = 2112;
        id v44 = v28;
        __int16 v45 = 2048;
        uint64_t v46 = v29;
        _os_log_debug_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEBUG, "%p self requesting %@ from %p", buf, 0x20u);
      }
      uint64_t v9 = *(void **)(a1 + 40);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __42__COMeshController__processQueuedCommands__block_invoke_93;
      v37[3] = &unk_2645CBD88;
      id v10 = v9;
      uint64_t v11 = *(void *)(a1 + 32);
      id v38 = v10;
      uint64_t v39 = v11;
      [WeakRetained node:v10 didReceiveRequest:v3 responseCallBack:v37];
      id v12 = v38;
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v25 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v30 = *(void *)(a1 + 48);
            uint64_t v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            uint64_t v33 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 134218498;
            uint64_t v42 = v30;
            __int16 v43 = 2112;
            id v44 = v32;
            __int16 v45 = 2048;
            uint64_t v46 = v33;
            _os_log_debug_impl(&dword_2217C1000, v25, OS_LOG_TYPE_DEBUG, "%p self sending %@ to %p", buf, 0x20u);
          }
          [*(id *)(a1 + 32) invokeCallbackWithError:0];
          [WeakRetained node:*(void *)(a1 + 40) didReceiveCommand:v3];
          goto LABEL_13;
        }
        long long v16 = [*(id *)(a1 + 32) destination];
        [v16 sendMeshCommand:v3];
        goto LABEL_12;
      }
      uint64_t v17 = [*(id *)(a1 + 32) destination];
      id v18 = [WeakRetained listener];
      int v19 = [v17 isEqual:v18];

      if (!v19)
      {
        uint64_t v23 = [WeakRetained sentCommands];
        id v24 = [v23 arrayByAddingObject:*(void *)(a1 + 32)];
        [WeakRetained setSentCommands:v24];

LABEL_11:
        long long v16 = [*(id *)(a1 + 32) destination];
        [v16 sendMeshRequest:v3];
LABEL_12:

        goto LABEL_13;
      }
      long long v20 = *(void **)(a1 + 40);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __42__COMeshController__processQueuedCommands__block_invoke_2_94;
      v34[3] = &unk_2645CBD88;
      id v21 = v20;
      uint64_t v22 = *(void *)(a1 + 32);
      id v35 = v21;
      uint64_t v36 = v22;
      [WeakRetained node:v21 didReceiveRequest:v3 responseCallBack:v34];
      id v12 = v35;
    }

    goto LABEL_13;
  }
LABEL_14:
}

void __42__COMeshController__processQueuedCommands__block_invoke_2_92(uint64_t a1, uint64_t a2, void *a3)
{
  __int16 v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResponse:a2];
  [*(id *)(a1 + 32) invokeCallbackWithError:v6];
}

void __42__COMeshController__processQueuedCommands__block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v6 _setSender:v5];
  [*(id *)(a1 + 40) setResponse:v6];

  [*(id *)(a1 + 40) invokeCallbackWithError:v7];
}

void __42__COMeshController__processQueuedCommands__block_invoke_2_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v6 _setSender:v5];
  [*(id *)(a1 + 40) setResponse:v6];

  [*(id *)(a1 + 40) invokeCallbackWithError:v7];
}

- (void)_enqueueCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COMeshController *)self queuedCommands];
  id v7 = [v6 arrayByAddingObject:v4];

  [(COMeshController *)self setQueuedCommands:v7];
  [(COMeshController *)self _processQueuedCommands];
}

- (void)_removeSentCommand:(id)a3 fromNode:(id)a4 withResponse:(id)a5 error:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v13);

  if (([MEMORY[0x263F33F80] isGlobalMessagingEnabled] & 1) == 0)
  {
    long long v14 = self;
    objc_sync_enter(v14);
    long long v15 = [(COMeshController *)v14 trackers];
    long long v16 = [v15 nodeStateTrackerForNode:v10];
    uint64_t v17 = [v16 state];

    objc_sync_exit(v14);
    if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
      goto LABEL_15;
    }
  }
  id v18 = [(COMeshController *)self sentCommands];
  uint64_t v19 = [v18 count];
  if (!v19) {
    goto LABEL_14;
  }
  uint64_t v20 = v19;
  uint64_t v21 = 0;
  while (1)
  {
    uint64_t v22 = [v18 objectAtIndex:v21];
    id v23 = [v22 command];
    if (v23 == v27) {
      break;
    }

LABEL_8:
    if (v20 == ++v21) {
      goto LABEL_14;
    }
  }
  id v24 = [v22 destination];
  int v25 = [v24 isEqual:v10];

  if (!v25) {
    goto LABEL_8;
  }
  uint64_t v26 = (void *)[v18 mutableCopy];
  [v26 removeObjectAtIndex:v21];
  [(COMeshController *)self setSentCommands:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v22 setResponse:v11];
  }
  [v22 invokeCallbackWithError:v12];

LABEL_14:
LABEL_15:
}

- (BOOL)_isCurrentElectionVariant:(int64_t)a3
{
  return a3 == 1;
}

- (id)_electionRequestWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(COMeshController *)self listener];
  uint64_t v8 = [v7 listeningPort];

  uint64_t v9 = [[COMeshElectionRequest alloc] initWithBallot:v6 generation:a4 listeningPort:v8];
  return v9;
}

- (id)_ballotResponseWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(COMeshBaseBallotResponse *)[COMeshBallotResponse alloc] initWithBallot:v5 generation:a4];

  return v6;
}

- (id)_voteRequestWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(COMeshBaseBallotRequest *)[COMeshVoteRequest alloc] initWithBallot:v5 generation:a4];

  return v6;
}

- (id)_acceptResponseWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(COMeshBaseBallotResponse *)[COMeshAcceptResponse alloc] initWithBallot:v5 generation:a4];

  return v6;
}

- (void)_performElectionGeneration:(unint64_t)a3 source:(id)a4 allowingPostTransition:(BOOL)a5
{
  BOOL v45 = a5;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(COMeshController *)v9 state];
  id v11 = [(COMeshController *)v9 trackers];
  id v12 = [v11 nodeStateTrackersWithStatus:1];
  id v13 = [v11 nodeStateTrackersWithStatus:2];

  objc_sync_exit(v9);
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
    goto LABEL_37;
  }
  [(COMeshController *)v9 _pingLeader];
  if (v10 == 2)
  {
    unint64_t v23 = [(COMeshController *)v9 generation];
    BOOL v24 = v23 >= a3;
    if (v23 > a3) {
      a3 = v23;
    }
    if (v24)
    {
      uint64_t v29 = [(COMeshController *)v9 ballot];
      uint64_t v20 = (COMutableBallot *)[v29 mutableCopy];

      uint64_t v21 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        long long v28 = "%p continuing ELECTION (%llu)";
        goto LABEL_17;
      }
    }
    else
    {
      int v25 = [(COMeshController *)v9 discoveryManager];
      [v25 clearRecords];

      uint64_t v26 = [COMutableBallot alloc];
      id v27 = [(COMeshController *)v9 me];
      uint64_t v20 = [(COBallot *)v26 initWithCandidate:v27];

      uint64_t v21 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        long long v28 = "%p update to ELECTION (%llu)";
LABEL_17:
        _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
      }
    }
    char v22 = 1;
    goto LABEL_19;
  }
  if (v10 == 1)
  {
    long long v14 = [(COMeshController *)v9 addOns];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke;
    v56[3] = &unk_2645CBBD0;
    v56[4] = v9;
    [v14 enumerateObjectsUsingBlock:v56];
  }
  [(COMeshController *)v9 setElectionStart:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
  [(COMeshController *)v9 willTransitionToState:2];
  long long v15 = v9;
  objc_sync_enter(v15);
  v15->_state = 2;
  objc_sync_exit(v15);

  uint64_t v16 = [(COMeshController *)v15 generation];
  if (v16 + 1 > a3) {
    a3 = v16 + 1;
  }
  uint64_t v17 = [(COMeshController *)v15 discoveryManager];
  [v17 clearRecords];

  id v18 = [COMutableBallot alloc];
  uint64_t v19 = [(COMeshController *)v15 me];
  uint64_t v20 = [(COBallot *)v18 initWithCandidate:v19];

  uint64_t v21 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%p starting ELECTION (%llu)", buf, 0x16u);
  }
  char v22 = 0;
LABEL_19:

  [(COMeshController *)v9 setGeneration:a3];
  if (v7)
  {
    [(COMutableBallot *)v20 addCandidate:v7];
    uint64_t v30 = [(COMeshController *)v9 nodeForConstituent:v7];
    uint64_t v31 = v30;
    if (!v30)
    {
LABEL_30:

      goto LABEL_31;
    }
    v32 = [(COMutableBallot *)v30 discoveryRecord];
    uint64_t v33 = v32;
    if (v32 && [v32 shouldAdvertise])
    {
      if (![(COMutableBallot *)v20 addDiscoveryRecord:v33])
      {
LABEL_29:

        goto LABEL_30;
      }
      id v34 = COCoreLogForCategory(11);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = [(COBallot *)v20 discovery];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2048;
        v58 = v20;
        id v44 = (void *)v35;
        _os_log_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p", buf, 0x20u);
      }
    }
    else
    {
      id v34 = COCoreLogForCategory(11);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        v58 = v31;
        __int16 v59 = 2048;
        id v60 = v20;
        _os_log_error_impl(&dword_2217C1000, v34, OS_LOG_TYPE_ERROR, "%p cannot add Discovery %@ for %@ to ballot %p", buf, 0x2Au);
      }
    }

    goto LABEL_29;
  }
LABEL_31:
  -[COMeshController setBallot:](v9, "setBallot:", v20, v44);
  uint64_t v36 = [(COBallot *)v20 candidates];
  uint64_t v37 = [v36 firstObject];

  id v38 = [(COMeshController *)v9 _electionRequestWithBallot:v20 generation:a3];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v58) = 0;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_99;
  v50[3] = &unk_2645CBDD8;
  v54 = buf;
  unint64_t v55 = a3;
  id v39 = v37;
  id v51 = v39;
  id v40 = v38;
  id v52 = v40;
  long long v41 = v20;
  v53 = v41;
  [v12 enumerateObjectsUsingBlock:v50];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_2;
  v46[3] = &unk_2645CBE00;
  v46[4] = v9;
  id v42 = v40;
  id v47 = v42;
  unint64_t v49 = a3;
  __int16 v43 = v41;
  double v48 = v43;
  [v13 enumerateObjectsUsingBlock:v46];
  if ((v22 & 1) == 0) {
    [(COMeshController *)v9 didTransitionToState:2];
  }
  if (!*(unsigned char *)(*(void *)&buf[8] + 24) && v45) {
    [(COMeshController *)v9 _transitionToPostElection];
  }

  _Block_object_dispose(buf, 8);
LABEL_37:
}

uint64_t __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didStartMeshController:*(void *)(a1 + 32)];
}

void __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_99(void *a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 state];
  if (v3 == 3)
  {
    uint64_t v4 = a1[8];
    if (v4 != [v10 lastGenerationReceived]) {
      goto LABEL_6;
    }
    id v5 = (void *)a1[4];
    id v6 = [v10 lastBallotReceived];
    id v7 = [v6 candidates];
    uint64_t v8 = [v7 firstObject];

    LOBYTE(v5) = [v5 isEqual:v8];
    if ((v5 & 1) == 0)
    {
LABEL_6:
      if (([v10 hasOutstandingRequest] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        [v10 setElectionStage:1];
        [v10 setState:2];
        [v10 setOutstandingRequest:1];
        uint64_t v9 = [v10 node];
        [v9 sendMeshRequest:a1[5]];

        [v10 setLastGenerationSent:a1[8]];
        [v10 setLastBallotSent:a1[6]];
      }
    }
  }
  else if (v3 == 2)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

void __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 hasOutstandingProbe] & 1) == 0)
  {
    uint64_t v4 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      id v6 = [v3 node];
      int v8 = 134218240;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      id v11 = v6;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p sending probe to %p", (uint8_t *)&v8, 0x16u);
    }
    id v7 = [v3 node];
    [v7 sendMeshRequest:a1[5]];

    [v3 setElectionStage:1];
    [v3 setLastGenerationSent:a1[7]];
    [v3 setLastBallotSent:a1[6]];
    [v3 setOutstandingProbe:1];
  }
}

- (BOOL)_isElectionComplete
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(COMeshController *)v2 trackers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__COMeshController__isElectionComplete__block_invoke;
  v5[3] = &unk_2645CBE28;
  v5[4] = &v6;
  [v3 enumerateNodeStateTrackersOfStatus:1 usingBlock:v5];

  objc_sync_exit(v2);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __39__COMeshController__isElectionComplete__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 state];
  if (result == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (void)_setupBrowsers
{
  id v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->_rapportBrowser)
  {
    uint64_t v4 = objc_alloc_init(CORapportBrowser);
    uint64_t v5 = [(COMeshController *)self companionLinkClientFactory];
    if (v5) {
      [(CORapportBrowser *)v4 setCompanionLinkClientFactory:v5];
    }
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = v4;
    id v7 = v4;

    [(COMeshController *)self addBrowser:v7];
  }
  if (!self->_ballotBrowser)
  {
    uint64_t v8 = [[COBallotBrowser alloc] initWithDiscoveryDelay:30.0];
    [(COBallotBrowser *)v8 setRapportBrowser:self->_rapportBrowser];
    ballotBrowser = self->_ballotBrowser;
    self->_ballotBrowser = v8;
    __int16 v10 = v8;

    [(COMeshController *)self addBrowser:v10];
  }
  if (self->_globalServiceName && !self->_idsBrowser)
  {
    id v11 = [COIDSBrowser alloc];
    uint64_t v12 = [(COMeshController *)self meshName];
    id v13 = [(COMeshController *)self globalServiceName];
    long long v14 = [(COIDSBrowser *)v11 initWithMeshName:v12 idsServiceName:v13];

    idsBrowser = self->_idsBrowser;
    self->_idsBrowser = v14;
    uint64_t v16 = v14;

    [(COMeshController *)self addBrowser:v16];
  }
}

- (id)_constituentCharacteristics:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 device];
  uint64_t v6 = [v4 flags];

  return (id)[v3 stringWithFormat:@"%d, %llu", v5, v6];
}

- (id)_nodeDetails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 remote];
    id v7 = [v5 client];
    uint64_t v8 = [v7 destinationDevice];
    char v9 = [v8 name];

    __int16 v10 = [v5 client];
    id v11 = [v10 destinationDevice];
    uint64_t v12 = [v11 identifier];

    unint64_t v13 = [v5 connectionType];
    if (v13 > 2) {
      long long v14 = 0;
    }
    else {
      long long v14 = off_2645CBFD8[v13];
    }
    char v16 = [v5 discoveryType];
    uint64_t v17 = 67;
    if ((v16 & 2) == 0) {
      uint64_t v17 = 99;
    }
    uint64_t v18 = 82;
    if ((v16 & 1) == 0) {
      uint64_t v18 = 114;
    }
    long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c", v18, v17);
  }
  else
  {
    uint64_t v6 = [(COMeshController *)self me];
    uint64_t v12 = 0;
    char v9 = 0;
    long long v14 = 0;
    long long v15 = 0;
  }
  uint64_t v19 = [NSString stringWithFormat:@"[COMeshNode : %p] %@ [Name] - %@ [Rapport ID] - %@ [Conn] - %@ [Disc] - %@", v5, v6, v9, v12, v14, v15];

  return v19;
}

- (void)_logElectionSummary
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = [(COMeshController *)self ballot];
  id v4 = [v3 candidates];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__9;
  id v39 = __Block_byref_object_dispose__9;
  id v40 = [MEMORY[0x263F089D8] string];
  uint64_t v6 = [(COMeshController *)self trackers];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __39__COMeshController__logElectionSummary__block_invoke;
  v32[3] = &unk_2645CBE50;
  id v34 = &v35;
  v32[4] = self;
  id v7 = v5;
  id v33 = v7;
  [v6 enumerateNodeStateTrackersOfStatus:1 usingBlock:v32];

  uint64_t v8 = (void *)v36[5];
  char v9 = [(COMeshController *)self _nodeDetails:0];
  [v8 appendFormat:@"%@\n", v9];

  __int16 v10 = [(COMeshController *)self me];
  [v7 removeObject:v10];

  id v11 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(COMeshController *)self meshName];
    unint64_t v13 = [(COMeshController *)self generation];
    long long v14 = (void *)v36[5];
    *(_DWORD *)buf = 134218754;
    id v42 = self;
    __int16 v43 = 2114;
    id v44 = v12;
    __int16 v45 = 2048;
    unint64_t v46 = v13;
    __int16 v47 = 2114;
    id v48 = v14;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p %{public}@ : Candidate summary for Election(%llu)\n%{public}@", buf, 0x2Au);
  }
  if ([v7 count])
  {
    long long v15 = COCoreLogForCategory(8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v28 = [(COMeshController *)self meshName];
      unint64_t v29 = [(COMeshController *)self generation];
      *(_DWORD *)buf = 134218754;
      id v42 = self;
      __int16 v43 = 2114;
      id v44 = v28;
      __int16 v45 = 2048;
      unint64_t v46 = v29;
      __int16 v47 = 2112;
      id v48 = v7;
      _os_log_error_impl(&dword_2217C1000, v15, OS_LOG_TYPE_ERROR, "%p %{public}@ : Ballot contituents and active trackers are mismatched for Election(%llu). Constituents not found in active trackers = %@", buf, 0x2Au);
    }
  }
  char v16 = (void *)v36[5];
  v36[5] = 0;

  uint64_t v17 = [(COMeshController *)self trackers];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __39__COMeshController__logElectionSummary__block_invoke_125;
  v31[3] = &unk_2645CBE78;
  v31[4] = self;
  v31[5] = &v35;
  [v17 enumerateNodeStateTrackersOfStatus:2 usingBlock:v31];

  uint64_t v18 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [(COMeshController *)self meshName];
    unint64_t v20 = [(COMeshController *)self generation];
    uint64_t v21 = (void *)v36[5];
    *(_DWORD *)buf = 134218754;
    id v42 = self;
    __int16 v43 = 2114;
    id v44 = v19;
    __int16 v45 = 2048;
    unint64_t v46 = v20;
    __int16 v47 = 2114;
    id v48 = v21;
    _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p %{public}@ : Dormant trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);
  }
  char v22 = (void *)v36[5];
  v36[5] = 0;

  unint64_t v23 = [(COMeshController *)self trackers];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __39__COMeshController__logElectionSummary__block_invoke_126;
  v30[3] = &unk_2645CBE78;
  v30[4] = self;
  v30[5] = &v35;
  [v23 enumerateNodeStateTrackersOfStatus:0 usingBlock:v30];

  BOOL v24 = COCoreLogForCategory(8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = [(COMeshController *)self meshName];
    unint64_t v26 = [(COMeshController *)self generation];
    id v27 = (void *)v36[5];
    *(_DWORD *)buf = 134218754;
    id v42 = self;
    __int16 v43 = 2114;
    id v44 = v25;
    __int16 v45 = 2048;
    unint64_t v46 = v26;
    __int16 v47 = 2114;
    id v48 = v27;
    _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%p %{public}@ : Discovered trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);
  }
  _Block_object_dispose(&v35, 8);
}

void __39__COMeshController__logElectionSummary__block_invoke(void *a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v4 = (void *)a1[4];
  id v5 = a2;
  uint64_t v6 = [v5 node];
  id v7 = [v4 _nodeDetails:v6];
  [v3 appendFormat:@"%@\n", v7];

  uint64_t v8 = (void *)a1[5];
  id v10 = [v5 node];

  char v9 = [v10 remote];
  [v8 removeObject:v9];
}

void __39__COMeshController__logElectionSummary__block_invoke_125(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v11 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263F089D8] string];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v11;
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  char v9 = [v3 node];
  id v10 = [v8 _nodeDetails:v9];
  [v4 appendFormat:@"%@\n", v10];
}

void __39__COMeshController__logElectionSummary__block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v11 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263F089D8] string];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v11;
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  char v9 = [v3 node];
  id v10 = [v8 _nodeDetails:v9];
  [v4 appendFormat:@"%@\n", v10];
}

- (void)_processBackedOffNodesExcludingTracker:(id)a3
{
  id v4 = a3;
  if (self->_internalFlags)
  {
    id v10 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[COMeshController _processBackedOffNodesExcludingTracker:]();
    }
  }
  else
  {
    uint64_t v5 = [(COMeshController *)self ballot];
    unint64_t v6 = [(COMeshController *)self generation];
    id v7 = [(COMeshBaseBallotRequest *)[COMeshElectionRequest alloc] initWithBallot:v5 generation:v6];
    uint64_t v8 = [(COMeshController *)self trackers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__COMeshController__processBackedOffNodesExcludingTracker___block_invoke;
    v11[3] = &unk_2645CBEA0;
    id v12 = v4;
    id v13 = v5;
    long long v15 = v7;
    unint64_t v16 = v6;
    long long v14 = self;
    char v9 = v7;
    id v10 = v5;
    [v8 enumerateNodeStateTrackersUsingBlock:v11];
  }
}

void __59__COMeshController__processBackedOffNodesExcludingTracker___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 state] == 2 && (objc_msgSend(v3, "isEqual:", *(void *)(a1 + 32)) & 1) == 0)
  {
    id v4 = [v3 lastBallotSent];
    int v5 = [v4 isEqualToBallot:*(void *)(a1 + 40)];

    uint64_t v6 = [v3 lastGenerationSent];
    if ((!v5 || v6 != *(void *)(a1 + 64))
      && (![v3 electionStage] || objc_msgSend(v3, "electionStage") == 4))
    {
      id v7 = [v3 backoffResponse];
      if (v7)
      {
        [v3 setLastGenerationSent:*(void *)(a1 + 64)];
        [v3 setLastBallotSent:*(void *)(a1 + 40)];
        uint64_t v8 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 48);
          uint64_t v10 = *(void *)(a1 + 64);
          id v11 = [v3 node];
          int v19 = 134218496;
          uint64_t v20 = v9;
          __int16 v21 = 2048;
          uint64_t v22 = v10;
          __int16 v23 = 2048;
          BOOL v24 = v11;
          _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p delayed BALLOT (%llu) to %p", (uint8_t *)&v19, 0x20u);
        }
        id v12 = [*(id *)(a1 + 48) _ballotResponseWithBallot:*(void *)(a1 + 40) generation:*(void *)(a1 + 64)];
        ((void (**)(void, void *, void))v7)[2](v7, v12, 0);

        [v3 setBackoffResponse:0];
      }
      else if (([v3 hasOutstandingRequest] & 1) == 0)
      {
        [v3 setLastGenerationSent:*(void *)(a1 + 64)];
        [v3 setLastBallotSent:*(void *)(a1 + 40)];
        id v13 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 48);
          uint64_t v15 = [v3 node];
          unint64_t v16 = (void *)v15;
          int v19 = 134218496;
          uint64_t v20 = v14;
          if (v5) {
            int v17 = 103;
          }
          else {
            int v17 = 98;
          }
          __int16 v21 = 2048;
          uint64_t v22 = v15;
          __int16 v23 = 1024;
          LODWORD(v24) = v17;
          _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p resend election to %p because our %c has changed", (uint8_t *)&v19, 0x1Cu);
        }
        [v3 setElectionStage:1];
        uint64_t v18 = [v3 node];
        [v18 sendMeshRequest:*(void *)(a1 + 56)];
      }
    }
  }
}

- (void)_transitionToPostElection
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "%p not transitioning because not in election", v1, 0xCu);
}

- (void)_handleElectionRequest:(id)a3 onNode:(id)a4 responseCallBack:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v42 = a4;
  id v38 = (void (**)(id, void *, void))a5;
  uint64_t v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v39 = [v42 remote];
  uint64_t v9 = [v40 generation];
  uint64_t v10 = [v40 variant];
  long long v41 = [v40 ballot];
  id v11 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v39 software];
    uint64_t v13 = [v40 rapportTransactionID];
    uint64_t v14 = [v41 candidates];
    uint64_t v15 = [v14 count];
    unint64_t v16 = [v41 candidates];
    int v17 = [v16 firstObject];

    *(_DWORD *)buf = 134219778;
    id v44 = self;
    __int16 v45 = 2048;
    uint64_t v46 = v9;
    __int16 v47 = 1024;
    *(_DWORD *)id v48 = v10;
    *(_WORD *)&v48[4] = 2048;
    *(void *)&v48[6] = v42;
    __int16 v49 = 2114;
    long long v50 = v12;
    __int16 v51 = 2048;
    uint64_t v52 = v13;
    __int16 v53 = 2048;
    uint64_t v54 = v15;
    __int16 v55 = 2114;
    v56 = v17;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p received ELECTION (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
  }
  uint64_t v18 = self;
  objc_sync_enter(v18);
  int v19 = [(COMeshController *)v18 trackers];
  uint64_t v20 = [v19 nodeStateTrackerForNode:v42];

  objc_sync_exit(v18);
  [v20 setState:2];
  if (v18->_internalFlags) {
    goto LABEL_11;
  }
  __int16 v21 = [v42 remote];
  if ([v21 supportsBackoff])
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v22 = [v20 lastBallotReceived];
  if (([v22 isEqualToBallot:v41] & 1) == 0)
  {

    goto LABEL_10;
  }
  BOOL v23 = [v20 lastGenerationReceived] == v9;

  if (v23)
  {
    [v20 setElectionStage:4];
    [v20 setBackoffResponse:v38];
    BOOL v24 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v44 = v18;
      __int16 v45 = 2048;
      uint64_t v46 = (uint64_t)v42;
      _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%p backed off legacy node %p", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_11:
  [v20 setLastGenerationReceived:v9];
  [v20 setLastBallotReceived:v41];
  if (![(COMeshController *)v18 _isCurrentElectionVariant:v10])
  {
    BOOL v24 = [(COMeshController *)v18 ballot];
    uint64_t v29 = [(COMeshController *)v18 generation];
    if (([v24 isEqualToBallot:v41] & 1) == 0)
    {
      uint64_t v30 = [(COMeshController *)v18 _currentBallotMergedWithBallot:v41];
      [v20 setLastBallotSent:v30];
      uint64_t v31 = [v24 candidates];
      v32 = [v31 firstObject];

      id v33 = [v30 candidates];
      id v34 = [v33 firstObject];

      LODWORD(v33) = [v32 isEqual:v34];
      if (v33)
      {
        uint64_t v35 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          id v44 = v18;
          __int16 v45 = 2048;
          uint64_t v46 = v29;
          __int16 v47 = 2048;
          *(void *)id v48 = v42;
          _os_log_debug_impl(&dword_2217C1000, v35, OS_LOG_TYPE_DEBUG, "%p performing fast election (%llu) with %p", buf, 0x20u);
        }

        uint64_t v36 = [(COMeshController *)v18 _acceptResponseWithBallot:v30 generation:v29];
        v38[2](v38, v36, 0);

        [v20 setState:3];
        if ([(COMeshController *)v18 _isElectionComplete]) {
          [(COMeshController *)v18 _transitionToPostElection];
        }
        goto LABEL_23;
      }
      [(COMeshController *)v18 _performElectionGeneration:[(COMeshController *)v18 generation] source:v39 allowingPostTransition:1];
    }
    uint64_t v30 = [(COMeshController *)v18 ballot];
    uint64_t v37 = [(COMeshController *)v18 _ballotResponseWithBallot:v30 generation:v29];
    v38[2](v38, v37, 0);

LABEL_23:
    goto LABEL_24;
  }
  uint64_t v25 = [v40 ballot];
  [(COMeshController *)v18 _handleDiscoveryUsingBallot:v25];

  [(COMeshController *)v18 _performElectionGeneration:v9 source:v39 allowingPostTransition:1];
  BOOL v24 = [(COMeshController *)v18 ballot];
  uint64_t v26 = [(COMeshController *)v18 generation];
  [v20 setElectionStage:0];
  [v20 setLastBallotSent:v24];
  [v20 setLastGenerationSent:v26];
  id v27 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    id v44 = v18;
    __int16 v45 = 2048;
    uint64_t v46 = v26;
    __int16 v47 = 2048;
    *(void *)id v48 = v42;
    _os_log_debug_impl(&dword_2217C1000, v27, OS_LOG_TYPE_DEBUG, "%p sending BALLOT (%llu) to %p", buf, 0x20u);
  }

  long long v28 = [(COMeshController *)v18 _ballotResponseWithBallot:v24 generation:v26];
  v38[2](v38, v28, 0);

  [(COMeshController *)v18 _processBackedOffNodesExcludingTracker:v20];
LABEL_24:
}

- (void)_handleBallotResponse:(id)a3 onNode:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v46 = a4;
  uint64_t v6 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  __int16 v43 = [v46 remote];
  uint64_t v7 = [v45 generation];
  uint64_t v8 = [v45 variant];
  id v44 = [v45 ballot];
  uint64_t v9 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v43 software];
    uint64_t v11 = [v45 rapportTransactionID];
    id v12 = [v44 candidates];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [v44 candidates];
    uint64_t v15 = [v14 firstObject];

    *(_DWORD *)buf = 134219778;
    id v48 = self;
    __int16 v49 = 2048;
    uint64_t v50 = v7;
    __int16 v51 = 1024;
    *(_DWORD *)uint64_t v52 = v8;
    *(_WORD *)&v52[4] = 2048;
    *(void *)&v52[6] = v46;
    *(_WORD *)&v52[14] = 2114;
    *(void *)&v52[16] = v10;
    *(_WORD *)&v52[24] = 2048;
    *(void *)&v52[26] = v11;
    __int16 v53 = 2048;
    uint64_t v54 = v13;
    __int16 v55 = 2114;
    v56 = v15;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p received BALLOT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
  }
  unint64_t v16 = self;
  objc_sync_enter(v16);
  int v17 = [(COMeshController *)v16 trackers];
  uint64_t v18 = [v17 nodeStateTrackerForNode:v46];

  objc_sync_exit(v16);
  [v18 setState:2];
  [v18 setLastGenerationReceived:v7];
  [v18 setLastBallotReceived:v44];
  [v18 setOutstandingRequest:0];
  if (![(COMeshController *)v16 _isCurrentElectionVariant:v8])
  {
    long long v28 = [(COMeshController *)v16 ballot];
    uint64_t v29 = [v45 ballot];
    uint64_t v30 = [v28 candidates];
    uint64_t v31 = [v30 firstObject];

    v32 = [v29 candidates];
    id v33 = [v32 firstObject];

    LODWORD(v32) = [v31 isEqual:v33];
    if (v32)
    {
      [v18 setLastBallotSent:v29];
      id v34 = [(COMeshController *)v16 _voteRequestWithBallot:v29 generation:[(COMeshController *)v16 generation]];
      [v46 sendMeshRequest:v34];
    }
    else
    {
      [v18 setState:3];
      [(COMeshController *)v16 _performElectionGeneration:[(COMeshController *)v16 generation] source:v43 allowingPostTransition:1];
    }

    goto LABEL_33;
  }
  int v19 = [v45 ballot];
  [(COMeshController *)v16 _handleDiscoveryUsingBallot:v19];

  if ([(COMeshController *)v16 generation] != v7)
  {
    [(COMeshController *)v16 _performElectionGeneration:v7 source:v43 allowingPostTransition:1];
    uint64_t v35 = [(COMeshController *)v16 generation];
    __int16 v21 = [(COMeshController *)v16 ballot];
    [v18 setLastBallotSent:v21];
    [v18 setLastGenerationSent:v35];
    [v18 setElectionStage:1];
    [v18 setOutstandingRequest:1];
    BOOL v23 = [(COMeshController *)v16 _electionRequestWithBallot:v21 generation:v35];
    [v46 sendMeshRequest:v23];
LABEL_32:

    [(COMeshController *)v16 _processBackedOffNodesExcludingTracker:v18];
    goto LABEL_33;
  }
  uint64_t v20 = [(COMeshController *)v16 ballot];
  __int16 v21 = (void *)[v20 mutableCopy];

  uint64_t v22 = [v21 candidates];
  BOOL v23 = [v22 firstObject];

  [v21 addCandidate:v43];
  BOOL v24 = [v46 discoveryRecord];
  uint64_t v25 = v24;
  if (!v24 || ![v24 shouldAdvertise])
  {
    uint64_t v26 = COCoreLogForCategory(11);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219010;
      id v48 = v16;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v25;
      __int16 v51 = 2112;
      *(void *)uint64_t v52 = v46;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = v21;
      *(_WORD *)&v52[18] = 2112;
      *(void *)&v52[20] = v45;
      _os_log_error_impl(&dword_2217C1000, v26, OS_LOG_TYPE_ERROR, "%p cannot add Discovery %@ for %@ to ballot %p when handling response %@", buf, 0x34u);
    }
    goto LABEL_17;
  }
  if ([v21 addDiscoveryRecord:v25])
  {
    uint64_t v26 = COCoreLogForCategory(11);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v21 discovery];
      *(_DWORD *)buf = 134218498;
      id v48 = v16;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v27;
      __int16 v51 = 2048;
      *(void *)uint64_t v52 = v21;
      _os_log_impl(&dword_2217C1000, v26, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p when handling response", buf, 0x20u);
    }
LABEL_17:
  }
  [(COMeshController *)v16 setBallot:v21];
  uint64_t v36 = [v44 candidates];
  uint64_t v37 = [v36 firstObject];

  LODWORD(v36) = [v23 isEqual:v37];
  if (v36)
  {
    [v18 setLastBallotSent:v21];
    [v18 setLastGenerationSent:v7];
    [v18 setElectionStage:3];
    [v18 setOutstandingRequest:1];
    id v38 = [(COMeshController *)v16 _voteRequestWithBallot:v21 generation:v7];
    [v46 sendMeshRequest:v38];
LABEL_31:

    goto LABEL_32;
  }
  if (v23 && ([v23 isEqual:v43] & 1) == 0) {
    [(COMeshController *)v16 _pingLeader];
  }
  [(COMeshController *)v16 _performElectionGeneration:v7 source:v43 allowingPostTransition:1];
  if (v16->_internalFlags) {
    goto LABEL_30;
  }
  id v39 = [v18 lastBallotSent];
  if (([v39 isEqualToBallot:v21] & 1) == 0)
  {

    goto LABEL_30;
  }
  BOOL v40 = [v18 lastGenerationSent] == v7;

  if (!v40)
  {
LABEL_30:
    [v18 setElectionStage:1];
    [v18 setLastBallotSent:v21];
    [v18 setLastGenerationSent:v7];
    [v18 setOutstandingRequest:1];
    id v38 = [(COMeshController *)v16 ballot];
    id v42 = [(COMeshController *)v16 _electionRequestWithBallot:v38 generation:[(COMeshController *)v16 generation]];
    [v46 sendMeshRequest:v42];

    goto LABEL_31;
  }
  [v18 setElectionStage:4];
  long long v41 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v48 = v16;
    __int16 v49 = 2048;
    uint64_t v50 = (uint64_t)v46;
    _os_log_impl(&dword_2217C1000, v41, OS_LOG_TYPE_DEFAULT, "%p backed off %p", buf, 0x16u);
  }

LABEL_33:
}

- (void)_handleVoteRequest:(id)a3 onNode:(id)a4 responseCallBack:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v42 = a4;
  id v39 = (void (**)(id, void *, void))a5;
  uint64_t v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v38 = [v42 remote];
  uint64_t v9 = [v41 generation];
  uint64_t v10 = [v41 variant];
  BOOL v40 = [v41 ballot];
  uint64_t v11 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v38 software];
    uint64_t v13 = [v41 rapportTransactionID];
    uint64_t v14 = [v40 candidates];
    uint64_t v15 = [v14 count];
    unint64_t v16 = [v40 candidates];
    int v17 = [v16 firstObject];

    *(_DWORD *)buf = 134219778;
    id v44 = self;
    __int16 v45 = 2048;
    uint64_t v46 = v9;
    __int16 v47 = 1024;
    int v48 = v10;
    __int16 v49 = 2048;
    id v50 = v42;
    __int16 v51 = 2114;
    uint64_t v52 = v12;
    __int16 v53 = 2048;
    uint64_t v54 = v13;
    __int16 v55 = 2048;
    uint64_t v56 = v15;
    __int16 v57 = 2114;
    v58 = v17;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p received VOTE (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
  }
  uint64_t v18 = self;
  objc_sync_enter(v18);
  int v19 = [(COMeshController *)v18 trackers];
  uint64_t v20 = [v19 nodeStateTrackerForNode:v42];

  objc_sync_exit(v18);
  [v20 setLastGenerationReceived:v9];
  [v20 setLastBallotReceived:v40];
  [v20 setElectionStage:0];
  if ([(COMeshController *)v18 _isCurrentElectionVariant:v10])
  {
    __int16 v21 = [v41 ballot];
    [(COMeshController *)v18 _handleDiscoveryUsingBallot:v21];

    uint64_t v22 = [(COMeshController *)v18 ballot];
    uint64_t v23 = [(COMeshController *)v18 generation];
    if (v23 != v9) {
      goto LABEL_11;
    }
    BOOL v24 = [v22 candidates];
    uint64_t v25 = [v24 firstObject];

    uint64_t v26 = [v40 candidates];
    id v27 = [v26 firstObject];

    LODWORD(v26) = [v25 isEqual:v27];
    if (v26)
    {
      [v20 setLastBallotSent:v22];
      [v20 setLastGenerationSent:v9];
      long long v28 = [(COMeshController *)v18 _acceptResponseWithBallot:v22 generation:v9];
      v39[2](v39, v28, 0);

      [v20 setState:3];
      if ([(COMeshController *)v18 _isElectionComplete]) {
        [(COMeshController *)v18 _transitionToPostElection];
      }
    }
    else
    {
LABEL_11:
      [v20 setLastBallotSent:v22];
      [v20 setLastGenerationSent:v9];
      uint64_t v35 = [(COMeshController *)v18 _ballotResponseWithBallot:v22 generation:v23];
      v39[2](v39, v35, 0);
    }
  }
  else
  {
    uint64_t v22 = [(COMeshController *)v18 ballot];
    uint64_t v29 = [v41 ballot];
    uint64_t v30 = [v22 candidates];
    uint64_t v31 = [v30 firstObject];

    v32 = [v29 candidates];
    id v33 = [v32 firstObject];

    LODWORD(v32) = [v31 isEqual:v33];
    if (v32)
    {
      id v34 = [(COMeshController *)v18 _acceptResponseWithBallot:v22 generation:[(COMeshController *)v18 generation]];
      v39[2](v39, v34, 0);

      [v20 setState:3];
      if ([(COMeshController *)v18 _isElectionComplete]) {
        [(COMeshController *)v18 _transitionToPostElection];
      }
    }
    else
    {
      uint64_t v36 = [(COMeshController *)v18 _currentBallotMergedWithBallot:v29];
      [v20 setLastBallotSent:v36];
      uint64_t v37 = [(COMeshController *)v18 _ballotResponseWithBallot:v36 generation:[(COMeshController *)v18 generation]];
      v39[2](v39, v37, 0);
    }
  }
}

- (void)_handleAcceptResponse:(id)a3 onNode:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v43 = a4;
  uint64_t v6 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  BOOL v40 = [v43 remote];
  uint64_t v7 = [v42 generation];
  uint64_t v8 = [v42 variant];
  id v41 = [v42 ballot];
  uint64_t v9 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v40 software];
    uint64_t v11 = [v42 rapportTransactionID];
    id v12 = [v41 candidates];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [v41 candidates];
    uint64_t v15 = [v14 firstObject];

    *(_DWORD *)buf = 134219778;
    __int16 v45 = self;
    __int16 v46 = 2048;
    uint64_t v47 = v7;
    __int16 v48 = 1024;
    int v49 = v8;
    __int16 v50 = 2048;
    id v51 = v43;
    __int16 v52 = 2114;
    __int16 v53 = v10;
    __int16 v54 = 2048;
    uint64_t v55 = v11;
    __int16 v56 = 2048;
    uint64_t v57 = v13;
    __int16 v58 = 2114;
    uint64_t v59 = v15;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p received ACCEPT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
  }
  unint64_t v16 = self;
  objc_sync_enter(v16);
  int v17 = [(COMeshController *)v16 trackers];
  uint64_t v18 = [v17 nodeStateTrackerForNode:v43];

  objc_sync_exit(v16);
  [v18 setLastGenerationReceived:v7];
  [v18 setLastBallotReceived:v41];
  [v18 setOutstandingRequest:0];
  if ([(COMeshController *)v16 _isCurrentElectionVariant:v8])
  {
    int v19 = [v42 ballot];
    [(COMeshController *)v16 _handleDiscoveryUsingBallot:v19];

    uint64_t v20 = [(COMeshController *)v16 ballot];
    uint64_t v21 = [(COMeshController *)v16 generation];
    if (v21 == v7)
    {
      uint64_t v22 = [v20 candidates];
      uint64_t v23 = [v22 firstObject];

      BOOL v24 = [v41 candidates];
      uint64_t v25 = [v24 firstObject];

      LODWORD(v24) = [v23 isEqual:v25];
      if (v24)
      {
        [v18 setLastBallotSent:v20];
        [v18 setLastGenerationSent:v7];
        [v18 setState:3];
        [v18 setElectionStage:0];
        if ([(COMeshController *)v16 _isElectionComplete]) {
          [(COMeshController *)v16 _transitionToPostElection];
        }
        goto LABEL_25;
      }
    }
    if ((v16->_internalFlags & 1) == 0)
    {
      uint64_t v31 = [v18 lastBallotSent];
      if ([v31 isEqualToBallot:v20])
      {
        BOOL v32 = [v18 lastGenerationSent] == v7;

        if (v32)
        {
          [v18 setElectionStage:4];
          id v33 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            __int16 v45 = v16;
            __int16 v46 = 2048;
            uint64_t v47 = (uint64_t)v43;
            _os_log_impl(&dword_2217C1000, v33, OS_LOG_TYPE_DEFAULT, "%p backed off %p", buf, 0x16u);
          }

          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    [v18 setLastBallotSent:v20];
    [v18 setLastGenerationSent:v7];
    [v18 setElectionStage:1];
    [v18 setOutstandingRequest:1];
    id v39 = [(COMeshController *)v16 _electionRequestWithBallot:v20 generation:v21];
    [v43 sendMeshRequest:v39];

    goto LABEL_25;
  }
  [v18 setState:3];
  uint64_t v20 = [(COMeshController *)v16 ballot];
  uint64_t v26 = [v42 ballot];
  id v27 = [v20 candidates];
  long long v28 = [v27 firstObject];

  uint64_t v29 = [v26 candidates];
  uint64_t v30 = [v29 firstObject];

  LODWORD(v29) = [v28 isEqual:v30];
  if (v29)
  {
    if ([(COMeshController *)v16 _isElectionComplete]) {
      [(COMeshController *)v16 _transitionToPostElection];
    }
  }
  else
  {
    id v34 = [(COMeshController *)v16 _currentBallotMergedWithBallot:v26];
    [(COMeshController *)v16 setBallot:v34];
    uint64_t v35 = [v20 candidates];
    uint64_t v36 = [v35 firstObject];

    uint64_t v37 = [v34 candidates];
    id v38 = [v37 firstObject];

    LODWORD(v37) = [v36 isEqual:v38];
    if (v37)
    {
      if ([(COMeshController *)v16 _isElectionComplete]) {
        [(COMeshController *)v16 _transitionToPostElection];
      }
    }
    else
    {
      [(COMeshController *)v16 _performElectionGeneration:[(COMeshController *)v16 generation] source:0 allowingPostTransition:1];
    }
  }
LABEL_25:
}

- (void)_handleDiscoveryUsingBallot:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [a3 discovery];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    int v8 = 0;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v6 = 134217984;
    long long v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [(COMeshController *)self me];
        char v13 = [v11 isEqual:v12];

        if (v13)
        {
          uint64_t v14 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v19;
            uint64_t v25 = self;
            _os_log_debug_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEBUG, "%p ignoring discovery of myself", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v14 = [v4 objectForKey:v11];
          uint64_t v15 = [(COMeshController *)self discoveryManager];
          v8 |= [v15 addDiscoveryRecord:v14];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
    if (v8)
    {
      unint64_t v16 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [(COMeshController *)self discoveryManager];
        uint64_t v18 = [v17 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v25 = self;
        __int16 v26 = 2048;
        uint64_t v27 = v18;
        _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%p Discovery (IP) has %ld queued records", buf, 0x16u);
      }
    }
  }
}

- (id)_handleDiscoveryUsingElectionRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D3F7A00]) {
    uint64_t v5 = [v4 listeningPort];
  }
  else {
    uint64_t v5 = 0;
  }
  long long v6 = [v4 _sendingConstituent];
  uint64_t v7 = [v4 rapportOptions];
  int v8 = [v7 objectForKey:*MEMORY[0x263F62C80]];
  uint64_t v9 = [v7 objectForKey:*MEMORY[0x263F62C88]];
  uint64_t v10 = [v7 objectForKey:*MEMORY[0x263F62C50]];
  if (v6
    && [v8 length]
    && [v9 length]
    && [v10 length]
    && (+[CODiscoveryRecord discoveryRecordWithConstituent:v6 rapportIdentifier:v8 IDSIdentifier:v9 peerAddress:v10 port:v5], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = (void *)v11;
    char v13 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218242;
      long long v19 = self;
      __int16 v20 = 2112;
      long long v21 = v12;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p discovered (election) %@", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v14 = [(COMeshController *)self listener];
    uint64_t v15 = [v14 _handleDiscoveryRecord:v12];
  }
  else
  {
    uint64_t v14 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[COMeshController _handleDiscoveryUsingElectionRequest:]();
    }
    id v12 = 0;
    uint64_t v15 = 0;
  }

  id v16 = v15;
  return v16;
}

- (void)_finalizeCompletionOfNode:(id)a3 memberOfMesh:(BOOL)a4 eventProvider:(id)a5
{
  BOOL v6 = a4;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v42 = a5;
  uint64_t v61 = 0;
  __int16 v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(COMeshController *)v9 trackers];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke;
  v60[3] = &unk_2645CBE28;
  v60[4] = &v61;
  [v10 enumerateNodeStateTrackersUsingBlock:v60];

  uint64_t v11 = [(COMeshController *)v9 state];
  id v12 = [(COMeshController *)v9 addOns];
  objc_sync_exit(v9);

  if (v6)
  {
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_2;
    v59[3] = &unk_2645CBBD0;
    v59[4] = v9;
    [v12 enumerateObjectsUsingBlock:v59];
  }
  if (v11 == 4)
  {
    if (!v62[3])
    {
      [(COMeshController *)v9 willTransitionToState:0];
      char v13 = v9;
      objc_sync_enter(v13);
      v13->_state = 0;
      objc_sync_exit(v13);

      [(COMeshController *)v13 setListener:0];
      [(COMeshController *)v13 didTransitionToState:0];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_181;
      v43[3] = &unk_2645CBBD0;
      void v43[4] = v13;
      [v12 enumerateObjectsUsingBlock:v43];
    }
  }
  else
  {
    BOOL v40 = [v8 remote];
    if (v40)
    {
      uint64_t v14 = [(COMeshController *)v9 ballot];
      id v41 = (void *)[v14 mutableCopy];

      uint64_t v15 = [v41 candidates];
      uint64_t v36 = [v15 firstObject];

      [v41 removeCandidate:v40];
      [(COMeshController *)v9 setBallot:v41];
      id v16 = [(COMeshController *)v9 sentCommands];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_3;
      v55[3] = &unk_2645CBEC8;
      uint64_t v57 = v17;
      uint64_t v58 = v18;
      id v19 = v8;
      id v56 = v19;
      id v39 = [v16 indexesOfObjectsPassingTest:v55];
      __int16 v20 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshControllerErrorDomain" code:-4100 userInfo:0];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_4;
      v52[3] = &unk_2645CBEF0;
      id v21 = v16;
      id v53 = v21;
      id v35 = v20;
      id v54 = v35;
      [v39 enumerateIndexesUsingBlock:v52];
      id v38 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v21, "count"));
      [v38 removeIndexes:v39];
      uint64_t v37 = [v21 objectsAtIndexes:v38];

      [(COMeshController *)v9 setSentCommands:v37];
      if (v11)
      {
        if ([v36 isEqual:v40])
        {
          id v22 = objc_alloc_init(MEMORY[0x263F089C8]);
          id v23 = objc_alloc_init(MEMORY[0x263F089C8]);
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_5;
          v46[3] = &unk_2645CBF18;
          uint64_t v50 = v17;
          uint64_t v51 = v18;
          id v24 = v22;
          id v47 = v24;
          id v48 = v19;
          id v25 = v23;
          id v49 = v25;
          [v37 enumerateObjectsUsingBlock:v46];
          if ([v24 count])
          {
            __int16 v26 = [v37 objectsAtIndexes:v24];
            uint64_t v27 = [(COMeshController *)v9 queuedCommands];
            long long v28 = [v26 arrayByAddingObjectsFromArray:v27];
            [(COMeshController *)v9 setQueuedCommands:v28];
          }
          if ([v25 count]) {
            [v37 objectsAtIndexes:v25];
          }
          else {
          uint64_t v29 = [MEMORY[0x263EFF8C0] array];
          }
          [(COMeshController *)v9 setSentCommands:v29];

          uint64_t v30 = v9;
          objc_sync_enter(v30);
          [(COMeshController *)v30 setLeader:0];
          objc_sync_exit(v30);

          if (!v42)
          {
            uint64_t v31 = [(COMeshController *)v30 label];
            v44[0] = MEMORY[0x263EF8330];
            v44[1] = 3221225472;
            v44[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_6;
            v44[3] = &unk_2645CBF40;
            id v45 = v31;
            id v32 = v31;
            id v42 = (id)MEMORY[0x223C8B4A0](v44);
          }
          id v33 = [(COMeshController *)v30 recorder];
          ((void (**)(void, uint64_t, id))v33)[2](v33, 0x26D3D6188, v42);

          id v34 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v66 = v30;
            __int16 v67 = 2112;
            v68 = v40;
            _os_log_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEFAULT, "%p lost leader %@", buf, 0x16u);
          }

          [(COMeshController *)v30 _performElectionGeneration:[(COMeshController *)v30 generation] source:0 allowingPostTransition:1];
        }
        else if (v11 == 2 && [(COMeshController *)v9 _isElectionComplete])
        {
          [(COMeshController *)v9 _transitionToPostElection];
        }
      }
    }
  }

  _Block_object_dispose(&v61, 8);
}

uint64_t __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 state];
  if (result == 4) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

uint64_t __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didChangeNodesForMeshController:*(void *)(a1 + 32)];
}

BOOL __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    id v4 = [v3 destination];
    BOOL v5 = v4 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  [v3 invokeCallbackWithError:*(void *)(a1 + 40)];
}

void __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v8 destination];
    BOOL v6 = *(void **)(a1 + 40);

    if (v5 == v6) {
      goto LABEL_7;
    }
    uint64_t v7 = (id *)(a1 + 48);
  }
  else
  {
    uint64_t v7 = (id *)(a1 + 32);
  }
  [*v7 addIndex:a3];
LABEL_7:
}

id __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_6(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D63A8;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

uint64_t __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_181(uint64_t a1, void *a2)
{
  return [a2 didStopMeshController:*(void *)(a1 + 32)];
}

- (void)_performStopOfNode:(id)a3 error:(id)a4 eventProvider:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218240;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    id v20 = v8;
    _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p stopping %p", (uint8_t *)&v17, 0x16u);
  }

  char v13 = self;
  objc_sync_enter(v13);
  uint64_t v14 = [(COMeshController *)v13 trackers];
  uint64_t v15 = v14;
  if (v9)
  {
    [v14 setNodeDormant:v8 withState:0 error:v9];
  }
  else
  {
    id v16 = [v14 nodeStateTrackerForNode:v8];
    [v16 setState:0];
  }
  objc_sync_exit(v13);

  [(COMeshController *)v13 _finalizeCompletionOfNode:v8 memberOfMesh:1 eventProvider:v10];
}

- (void)_performInvalidationOfNode:(id)a3 error:(id)a4 eventProvider:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v8 delegate];
  BOOL v13 = v12 == 0;

  uint64_t v14 = COCoreLogForCategory(0);
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[COMeshController _performInvalidationOfNode:error:eventProvider:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134218240;
      long long v28 = self;
      __int16 v29 = 2048;
      id v30 = v8;
      _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%p invalidating %p", (uint8_t *)&v27, 0x16u);
    }

    id v16 = self;
    objc_sync_enter(v16);
    int v17 = [(COMeshController *)v16 trackers];
    uint64_t v18 = [v17 nodeStateTrackerForNode:v8];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      __int16 v26 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[COMeshController _performInvalidationOfNode:error:eventProvider:]();
      }

      objc_sync_exit(v16);
    }
    else
    {
      objc_sync_exit(v16);

      [v8 setDelegate:0];
      [(COMeshController *)v16 willInvalidateNode:v8 error:v9];
      id v20 = v16;
      objc_sync_enter(v20);
      uint64_t v21 = [(COMeshController *)v20 trackers];
      id v22 = [v21 nodeStateTrackerForNode:v8];
      uint64_t v23 = [v22 status];

      objc_sync_exit(v20);
      [v8 invalidate];
      id v24 = v20;
      objc_sync_enter(v24);
      id v25 = [(COMeshController *)v24 trackers];
      [v25 removeNodeStateTrackerForNode:v8];

      objc_sync_exit(v24);
      [(COMeshController *)v24 _finalizeCompletionOfNode:v8 memberOfMesh:v23 == 1 eventProvider:v10];
    }
  }
}

- (void)didAddNode:(id)a3
{
  id v8 = a3;
  id v4 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    [(COMeshController *)self _handleNodeChanges];
  }
  else
  {
    BOOL v5 = [[COMeshNodeStateTracker alloc] initWithNode:v8];
    [(COMeshNodeStateTracker *)v5 setDelegate:self];
    BOOL v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(COMeshController *)v6 trackers];
    [v7 addNodeStateTracker:v5];

    objc_sync_exit(v6);
    [(COMeshController *)v6 willActivateNode:v8];
    [v8 setDelegate:v6];
    [v8 activate];
  }
}

- (void)didActivateNode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COMeshController *)self listener];

  if (v6 == v4)
  {
    [(COMeshController *)self _performElectionGeneration:[(COMeshController *)self generation] source:0 allowingPostTransition:1];
  }
  else
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    id v8 = [(COMeshController *)v7 trackers];
    id v9 = [v8 nodeStateTrackerForNode:v4];

    objc_sync_exit(v7);
    uint64_t v10 = [v9 status];
    uint64_t v11 = COCoreLogForCategory(0);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10 == 1)
    {
      if (v12) {
        -[COMeshController didActivateNode:]();
      }
    }
    else
    {
      if (v12) {
        -[COMeshController didActivateNode:]();
      }

      [v9 setState:1];
      BOOL v13 = [(COMeshController *)v7 ballot];
      uint64_t v11 = [(COMeshController *)v7 _electionRequestWithBallot:v13 generation:[(COMeshController *)v7 generation]];

      [v9 setElectionStage:1];
      [v9 setOutstandingRequest:1];
      objc_msgSend(v9, "setLastGenerationSent:", -[COMeshController generation](v7, "generation"));
      uint64_t v14 = [(COMeshController *)v7 ballot];
      [v9 setLastBallotSent:v14];

      [v4 sendMeshRequest:v11];
    }
  }
}

- (void)node:(id)a3 didSendCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(COMeshController *)self label];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__COMeshController_node_didSendCommand___block_invoke;
    v11[3] = &unk_2645CBF40;
    id v12 = v9;
    id v10 = v9;
    [(COMeshController *)self _performStopOfNode:v6 error:0 eventProvider:v11];
  }
  else
  {
    [(COMeshController *)self _removeSentCommand:v7 fromNode:v6 withResponse:0 error:0];
  }
}

id __40__COMeshController_node_didSendCommand___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D62E8;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)node:(id)a3 didReceiveCommand:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    id v9 = (objc_class *)objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(COMeshController *)self notificationHandlers];
    }
    else {
    int v17 = [(COMeshController *)self commandHandlers];
    }
    uint64_t v18 = [v17 objectForKey:v9];
    uint64_t v15 = MEMORY[0x223C8B4A0]();

    if (v18) {
      ((void (**)(void, id))v18)[2](v18, v7);
    }

    if (!v15)
    {
      id v16 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  else
  {
    id v10 = [(COMeshController *)self trackers];
    uint64_t v11 = [v10 nodeStateTrackerForNode:v6];
    id v12 = [MEMORY[0x263EFF910] now];
    [v12 timeIntervalSinceReferenceDate];
    objc_msgSend(v11, "setLastHeard:");

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v13 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[COMeshController node:didReceiveCommand:]();
      }

      uint64_t v14 = [(COMeshController *)self label];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __43__COMeshController_node_didReceiveCommand___block_invoke;
      v22[3] = &unk_2645CBF40;
      uint64_t v23 = v14;
      uint64_t v15 = v14;
      [(COMeshController *)self _performStopOfNode:v6 error:0 eventProvider:v22];
      id v16 = v23;
      goto LABEL_21;
    }
    id v9 = (objc_class *)objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(COMeshController *)self notificationHandlers];
    }
    else {
    BOOL v19 = [(COMeshController *)self commandHandlers];
    }
    id v20 = [v19 objectForKey:v9];
    uint64_t v15 = MEMORY[0x223C8B4A0]();

    if (v20) {
      ((void (**)(void, id))v20)[2](v20, v7);
    }

    if (!v15)
    {
      id v16 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:
        uint64_t v21 = NSStringFromClass(v9);
        *(_DWORD *)buf = 134218498;
        id v25 = self;
        __int16 v26 = 2112;
        int v27 = v21;
        __int16 v28 = 2048;
        id v29 = v6;
        _os_log_debug_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEBUG, "%p found no handler for %@ from %p", buf, 0x20u);
      }
LABEL_21:
    }
  }
}

id __43__COMeshController_node_didReceiveCommand___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D62C8;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)unknownNodeForCommand:(id)a3 result:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = objc_opt_class();
  id v10 = [v6 _sendingConstituent];
  uint64_t v11 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 134218754;
    BOOL v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    BOOL v19 = v10;
    _os_log_error_impl(&dword_2217C1000, v11, OS_LOG_TYPE_ERROR, "%p disregarding command %@ (%@) from unknown node %@", (uint8_t *)&v12, 0x2Au);
  }

  v7[2](v7, 0);
}

- (void)node:(id)a3 didReceiveRequest:(id)a4 responseCallBack:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, COMeshResponse *, void))a5;
  id v10 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled]) {
    goto LABEL_2;
  }
  BOOL v13 = [(COMeshController *)self trackers];
  __int16 v14 = [v13 nodeStateTrackerForNode:v16];
  uint64_t v15 = [MEMORY[0x263EFF910] now];
  [v15 timeIntervalSinceReferenceDate];
  objc_msgSend(v14, "setLastHeard:");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(COMeshController *)self _handleElectionRequest:v8 onNode:v16 responseCallBack:v9];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = objc_alloc_init(COMeshResponse);
        v9[2](v9, v12, 0);
LABEL_4:

        goto LABEL_9;
      }
LABEL_2:
      uint64_t v11 = [(COMeshController *)self requestHandlers];
      int v12 = [v11 objectForKey:objc_opt_class()];

      if (v12) {
        ((void (*)(COMeshResponse *, id, id))v12[1].super.super.isa)(v12, v8, v9);
      }
      goto LABEL_4;
    }
    [(COMeshController *)self _handleVoteRequest:v8 onNode:v16 responseCallBack:v9];
  }
LABEL_9:
}

- (void)node:(id)a3 didReceiveResponse:(id)a4 toRequest:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(COMeshController *)self trackers];
  int v12 = [v11 nodeStateTrackerForNode:v14];
  BOOL v13 = [MEMORY[0x263EFF910] now];
  [v13 timeIntervalSinceReferenceDate];
  objc_msgSend(v12, "setLastHeard:");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(COMeshController *)self _handleBallotResponse:v8 onNode:v14];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(COMeshController *)self _handleAcceptResponse:v8 onNode:v14];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(COMeshController *)self setPendingPing:0];
      }
      else {
        [(COMeshController *)self _removeSentCommand:v9 fromNode:v14 withResponse:v8 error:0];
      }
    }
  }
}

- (void)node:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v11);

  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    [(COMeshController *)self _removeSentCommand:v10 fromNode:v8 withResponse:0 error:v9];
    goto LABEL_62;
  }
  id v12 = [(COMeshController *)self listener];

  if (v12 != v8)
  {
    BOOL v13 = self;
    objc_sync_enter(v13);
    id v14 = [(COMeshController *)v13 trackers];
    id v44 = [v14 nodeStateTrackerForNode:v8];

    objc_sync_exit(v13);
    uint64_t v15 = [v9 code];
    id v45 = [v9 domain];
    int v16 = [v45 isEqualToString:@"COMeshNodeErrorDomain"];
    if (v15 == -4000) {
      int v17 = v16;
    }
    else {
      int v17 = 0;
    }
    unsigned __int8 isKindOfClass = 0;
    int v43 = [v45 isEqualToString:*MEMORY[0x263F62C18]];
    if (v43 && v15 == -6722)
    {
      objc_opt_class();
      unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      int v42 = 1;
    }
    else
    {
      objc_opt_class();
      int v42 = objc_opt_isKindOfClass();
    }
    char v20 = v17 | isKindOfClass;
    if (((v17 | isKindOfClass) & 1) != 0 || v43 && v15 == -6714 && ((v42 ^ 1) & 1) == 0)
    {
      int v41 = v17;
      if (isKindOfClass)
      {
        uint64_t v21 = [(COMeshController *)v13 label];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __52__COMeshController_node_didReceiveError_forCommand___block_invoke;
        v51[3] = &unk_2645CBF68;
        id v22 = v10;
        id v52 = v22;
        id v53 = v21;
        id v23 = v21;
        id v24 = (void *)MEMORY[0x223C8B4A0](v51);
        id v25 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[COMeshController node:didReceiveError:forCommand:].cold.5((uint64_t)v13, v22, v25);
        }

        [(COMeshController *)v13 setPendingPing:0];
      }
      else
      {
        id v24 = 0;
      }
      __int16 v26 = [v8 remote];
      if (v26)
      {
        int v27 = [(COMeshController *)v13 ballot];
        __int16 v28 = [v27 candidates];
        id v29 = [v28 firstObject];

        if ([v26 isEqual:v29])
        {
          uint64_t v30 = (uint64_t)v24;
          if (!v24)
          {
            uint64_t v31 = [(COMeshController *)v13 label];
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v48[2] = __52__COMeshController_node_didReceiveError_forCommand___block_invoke_186;
            v48[3] = &unk_2645CBF90;
            char v50 = v41;
            id v49 = v31;
            id v32 = v31;
            uint64_t v30 = MEMORY[0x223C8B4A0](v48);

            id v24 = (void *)v30;
          }
          goto LABEL_32;
        }
        if (v20)
        {
          uint64_t v30 = 0;
LABEL_32:
          [(COMeshController *)v13 _performStopOfNode:v8 error:v9 eventProvider:v30];
LABEL_33:

          goto LABEL_62;
        }
      }
      if (v41)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v44 state] == 1)
        {
          id v33 = [(COMeshController *)v13 ballot];
          id v29 = [(COMeshController *)v13 _electionRequestWithBallot:v33 generation:[(COMeshController *)v13 generation]];

          [v44 setOutstandingRequest:1];
          objc_msgSend(v44, "setLastGenerationSent:", -[COMeshController generation](v13, "generation"));
          id v34 = [(COMeshController *)v13 ballot];
          [v44 setLastBallotSent:v34];

          [v8 sendMeshRequest:v29];
          goto LABEL_33;
        }
      }
    }
    [(COMeshController *)v13 _removeSentCommand:v10 fromNode:v8 withResponse:0 error:v9];
    uint64_t v35 = [v44 state];
    switch(v35)
    {
      case 4:
        id v38 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[COMeshController node:didReceiveError:forCommand:].cold.4();
        }

        id v39 = [(COMeshController *)v13 label];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __52__COMeshController_node_didReceiveError_forCommand___block_invoke_187;
        v46[3] = &unk_2645CBF40;
        id v47 = v39;
        id v40 = v39;
        [(COMeshController *)v13 _performStopOfNode:v8 error:v9 eventProvider:v46];

        goto LABEL_61;
      case 2:
        if ((v43 & v42) != 1) {
          goto LABEL_61;
        }
        uint64_t v37 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          id v55 = v8;
          __int16 v56 = 2112;
          id v57 = v9;
          _os_log_impl(&dword_2217C1000, v37, OS_LOG_TYPE_DEFAULT, "electing node %p failed with %@", buf, 0x16u);
        }
        break;
      case 1:
        uint64_t v36 = COCoreLogForCategory(0);
        uint64_t v37 = v36;
        if ((v42 & 1) == 0)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[COMeshController node:didReceiveError:forCommand:]();
          }
          goto LABEL_47;
        }
        if (v43)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v55 = v8;
            __int16 v56 = 2112;
            id v57 = v9;
            _os_log_impl(&dword_2217C1000, v37, OS_LOG_TYPE_DEFAULT, "starting node %p failed with %@", buf, 0x16u);
          }
LABEL_47:

          [v44 setState:0];
          goto LABEL_61;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[COMeshController node:didReceiveError:forCommand:]();
        }
        break;
      default:
LABEL_61:

        goto LABEL_62;
    }

    [(COMeshController *)v13 _performStopOfNode:v8 error:v9 eventProvider:0];
    goto LABEL_61;
  }
  BOOL v19 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[COMeshController node:didReceiveError:forCommand:]();
  }

  [(COMeshController *)self stop];
LABEL_62:
}

id __52__COMeshController_node_didReceiveError_forCommand___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v8[0] = 0x26D3D62A8;
  v7[0] = 0x26D3D5648;
  v7[1] = 0x26D3D62A8;
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) responseTimeout];
  id v3 = objc_msgSend(v2, "numberWithDouble:");
  v7[2] = 0x26D3D61E8;
  uint64_t v4 = *(void *)(a1 + 40);
  v8[1] = v3;
  v8[2] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id __52__COMeshController_node_didReceiveError_forCommand___block_invoke_186(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)COMeshControllerLostLeaderReasonGone;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = &COMeshControllerLostLeaderReasonRoll;
  }
  uint64_t v2 = *v1;
  v6[0] = 0x26D3D5648;
  v6[1] = 0x26D3D61E8;
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = v2;
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  return v4;
}

id __52__COMeshController_node_didReceiveError_forCommand___block_invoke_187(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D5E48;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)unknownNodeForRequest:(id)a3 result:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(COMeshController *)self _handleDiscoveryUsingElectionRequest:v6];
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v6 _sendingConstituent];
    id v12 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134218754;
      id v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      char v20 = v11;
      _os_log_error_impl(&dword_2217C1000, v12, OS_LOG_TYPE_ERROR, "%p disregarding request %@ (%@) from unknown node %@", (uint8_t *)&v13, 0x2Au);
    }

    id v9 = 0;
  }
  v7[2](v7, v9);
}

- (void)didInvalidateNode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COMeshController *)self listener];

  if (v6 == v4)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    uint64_t v11 = [(COMeshController *)v10 state];
    objc_sync_exit(v10);

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      [(COMeshController *)v10 stop];
      goto LABEL_8;
    }
    id v12 = [(COMeshController *)v10 label];
    int v13 = [(COMeshController *)v10 recorder];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    id v24 = __38__COMeshController_didInvalidateNode___block_invoke_2;
    id v25 = &unk_2645CBF40;
    __int16 v26 = v12;
    id v14 = (void (*)(void *, uint64_t, uint64_t *))v13[2];
    id v8 = v12;
    v14(v13, 0x26D3D6188, &v22);

    __int16 v15 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[COMeshController didInvalidateNode:](v10, v15);
    }

    uint64_t v16 = [(COMeshController *)v10 trackers];
    [v16 removeAllNodeStateTrackers];

    __int16 v17 = [(COMeshController *)v10 me];
    id v18 = [[COBallot alloc] initWithCandidate:v17];
    [(COMeshController *)v10 setBallot:v18];

    id v19 = [(COMeshController *)v10 _newCompanionLinkClient];
    char v20 = [[COMeshLocalNode alloc] initWithCompanionLinkClient:v19 source:v17];
    uint64_t v21 = [(COMeshController *)v10 companionLinkClientFactory];
    [(COMeshLocalNode *)v20 setCompanionLinkClientFactory:v21];

    [(COMeshController *)v10 setListener:v20];
    [(COMeshController *)v10 _performElectionGeneration:[(COMeshController *)v10 generation] + 1 source:0 allowingPostTransition:0];

    id v9 = v26;
  }
  else
  {
    id v7 = [(COMeshController *)self label];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __38__COMeshController_didInvalidateNode___block_invoke;
    v27[3] = &unk_2645CBF40;
    __int16 v28 = v7;
    id v8 = v7;
    [(COMeshController *)self _performInvalidationOfNode:v4 error:0 eventProvider:v27];
    id v9 = v28;
  }

LABEL_8:
}

id __38__COMeshController_didInvalidateNode___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D6348;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

id __38__COMeshController_didInvalidateNode___block_invoke_2(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D6388;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)didRemoveNode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    [(COMeshController *)self _handleNodeChanges];
  }
  else
  {
    id v6 = [(COMeshController *)self label];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__COMeshController_didRemoveNode___block_invoke;
    v8[3] = &unk_2645CBF40;
    id v9 = v6;
    id v7 = v6;
    [(COMeshController *)self _performInvalidationOfNode:v4 error:0 eventProvider:v8];
  }
}

id __34__COMeshController_didRemoveNode___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D3D5648;
  v4[1] = 0x26D3D61E8;
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = 0x26D3D6368;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)nodeBecameAvailable:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(COMeshController *)v6 addOns];
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__COMeshController_nodeBecameAvailable___block_invoke;
  v8[3] = &unk_2645CBBD0;
  void v8[4] = v6;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __40__COMeshController_nodeBecameAvailable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didChangeNodesForMeshController:*(void *)(a1 + 32)];
}

- (void)nodeShouldRetryAfterBackoff:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 electionStage] == 4 && objc_msgSend(v4, "state") == 2)
  {
    BOOL v5 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 backoffBucket] - 1;
      id v7 = [v4 node];
      int v16 = 134218496;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p back off (%ld) firing for %p", (uint8_t *)&v16, 0x20u);
    }
    id v8 = [(COMeshController *)self ballot];
    unint64_t v9 = [(COMeshController *)self generation];
    uint64_t v10 = [v4 backoffResponse];
    if (v10)
    {
      [v4 setLastGenerationSent:v9];
      [v4 setLastBallotSent:v8];
      uint64_t v11 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v4 node];
        int v16 = 134218496;
        __int16 v17 = self;
        __int16 v18 = 2048;
        unint64_t v19 = v9;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p delayed BALLOT (%llu) to %p", (uint8_t *)&v16, 0x20u);
      }
      int v13 = [(COMeshController *)self _ballotResponseWithBallot:v8 generation:v9];
      ((void (**)(void, void *, void))v10)[2](v10, v13, 0);

      [v4 setBackoffResponse:0];
    }
    else if (([v4 hasOutstandingRequest] & 1) == 0)
    {
      [v4 setLastGenerationSent:v9];
      [v4 setLastBallotSent:v8];
      [v4 setElectionStage:1];
      id v14 = [(COMeshBaseBallotRequest *)[COMeshElectionRequest alloc] initWithBallot:v8 generation:v9];
      __int16 v15 = [v4 node];
      [v15 sendMeshRequest:v14];
    }
  }
}

- (void)backedOffNodeMovedOutOfElection:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 totalBackedOffTime];
  if (v4 > [(COMeshController *)self longestBackOff])
  {
    -[COMeshController setLongestBackOff:](self, "setLongestBackOff:", [v7 totalBackedOffTime]);
    BOOL v5 = [v7 node];
    uint64_t v6 = [v5 remote];
    [(COMeshController *)self setLongestBackedOffConstituent:v6];
  }
}

- (void)discoveryManager:(id)a3 didDiscoverRecords:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(COMeshController *)self dispatchQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__COMeshController_discoveryManager_didDiscoverRecords___block_invoke;
  v8[3] = &unk_2645CAE80;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __56__COMeshController_discoveryManager_didDiscoverRecords___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134218240;
    uint64_t v19 = v3;
    __int16 v20 = 2048;
    uint64_t v21 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p delayed Discovery (IP) - %lu records", buf, 0x16u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "listener", (void)v13);
        id v12 = (id)[v11 _handleDiscoveryRecord:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)didStartElection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t state = v2->_state;
  objc_sync_exit(v2);

  if (state != 2)
  {
    [(COMeshController *)v2 willTransitionToState:2];
    uint64_t v4 = v2;
    objc_sync_enter(v4);
    v2->_unint64_t state = 2;
    objc_sync_exit(v4);

    id v5 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p moved to election state", (uint8_t *)&v6, 0xCu);
    }

    [(COMeshController *)v4 didTransitionToState:2];
  }
}

- (void)didCompleteElection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t state = v2->_state;
  objc_sync_exit(v2);

  if (state != 3)
  {
    [(COMeshController *)v2 willTransitionToState:3];
    uint64_t v4 = v2;
    objc_sync_enter(v4);
    v2->_unint64_t state = 3;
    objc_sync_exit(v4);

    id v5 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p moved to processing state", (uint8_t *)&v6, 0xCu);
    }

    [(COMeshController *)v4 didTransitionToState:3];
    [(COMeshController *)v4 setElectionEnd:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
    [(COMeshController *)v4 _processQueuedCommands];
  }
}

- (void)_handleNodeChanges
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(COMeshController *)v2 addOns];
  objc_sync_exit(v2);

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __38__COMeshController__handleNodeChanges__block_invoke;
  v4[3] = &unk_2645CBBD0;
  v4[4] = v2;
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __38__COMeshController__handleNodeChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didChangeNodesForMeshController:*(void *)(a1 + 32)];
}

- (void)_setupCoordinationPrefsObserver
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = self;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p setting up observers to watch coordination prefs", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = (void *)MEMORY[0x263F33F78];
  id v5 = [MEMORY[0x263F33F78] coordinationBundleID];
  int v6 = [v4 userDefaultsForIdentifer:v5];
  coordinationDefaults = self->_coordinationDefaults;
  self->_coordinationDefaults = v6;

  [(NSUserDefaults *)self->_coordinationDefaults addObserver:self forKeyPath:*MEMORY[0x263F33DC8] options:0 context:0];
  [(NSUserDefaults *)self->_coordinationDefaults addObserver:self forKeyPath:*MEMORY[0x263F33DD0] options:0 context:0];
}

- (void)_tearDownCoordinationPrefsObserver
{
  [(NSUserDefaults *)self->_coordinationDefaults removeObserver:self forKeyPath:*MEMORY[0x263F33DC8]];
  coordinationDefaults = self->_coordinationDefaults;
  uint64_t v4 = *MEMORY[0x263F33DD0];
  [(NSUserDefaults *)coordinationDefaults removeObserver:self forKeyPath:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *MEMORY[0x263F33DC8];
  if ([v9 isEqualToString:*MEMORY[0x263F33DC8]])
  {
    long long v13 = [v10 objectForKey:v12];
    if (v13)
    {
      long long v14 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 134218240;
        id v24 = self;
        __int16 v25 = 1024;
        int v26 = [v13 BOOLValue];
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p observed an update to fast fold enablement. new value = %d", (uint8_t *)&v23, 0x12u);
      }

      int v15 = [v13 BOOLValue];
      if (v15 != [MEMORY[0x263F33F80] isFastFoldEnabled])
      {
        uint64_t v21 = COCoreLogForCategory(0);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        int v23 = 134217984;
        id v24 = self;
        uint64_t v22 = "%p fast fold changed. Exiting process";
        goto LABEL_18;
      }
    }
  }
  uint64_t v16 = *MEMORY[0x263F33DD0];
  if ([v9 isEqualToString:*MEMORY[0x263F33DD0]])
  {
    __int16 v17 = [v10 objectForKey:v16];
    if (!v17) {
      goto LABEL_12;
    }
    __int16 v18 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v17 BOOLValue];
      int v23 = 134218240;
      id v24 = self;
      __int16 v25 = 1024;
      int v26 = v19;
      _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p observed an update to ip diffing enablement. new value = %d", (uint8_t *)&v23, 0x12u);
    }

    int v20 = [v17 BOOLValue];
    if (v20 == [MEMORY[0x263F33F80] isIPDiscoveryDiffingEnabled])
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v21 = COCoreLogForCategory(0);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:

      exit(1);
    }
    int v23 = 134217984;
    id v24 = self;
    uint64_t v22 = "%p ip diffing changed. Exiting process";
LABEL_18:
    _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v23, 0xCu);
    goto LABEL_19;
  }
LABEL_13:
}

- (unint64_t)internalFlags
{
  return self->_internalFlags;
}

- (unint64_t)state
{
  return self->_state;
}

- (COConstituent)me
{
  return self->_me;
}

- (void)setLeader:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)recorder
{
  return self->_recorder;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)clusterOptions
{
  return self->_clusterOptions;
}

- (void)setClusterOptions:(unint64_t)a3
{
  self->_clusterOptions = a3;
}

- (void)setBallot:(id)a3
{
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
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

- (OS_dispatch_source)electionElapsedTimer
{
  return self->_electionElapsedTimer;
}

- (COMeshLocalNode)listener
{
  return self->_listener;
}

- (CORapportBrowser)rapportBrowser
{
  return self->_rapportBrowser;
}

- (void)setRapportBrowser:(id)a3
{
}

- (COBallotBrowser)ballotBrowser
{
  return self->_ballotBrowser;
}

- (void)setBallotBrowser:(id)a3
{
}

- (COIDSBrowser)idsBrowser
{
  return self->_idsBrowser;
}

- (void)setIdsBrowser:(id)a3
{
}

- (COMeshNodeStateTrackerSet)trackers
{
  return self->_trackers;
}

- (CODiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (NSDictionary)commandHandlers
{
  return self->_commandHandlers;
}

- (void)setCommandHandlers:(id)a3
{
}

- (NSDictionary)notificationHandlers
{
  return self->_notificationHandlers;
}

- (void)setNotificationHandlers:(id)a3
{
}

- (NSDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (void)setRequestHandlers:(id)a3
{
}

- (NSArray)queuedCommands
{
  return self->_queuedCommands;
}

- (void)setQueuedCommands:(id)a3
{
}

- (NSArray)sentCommands
{
  return self->_sentCommands;
}

- (void)setSentCommands:(id)a3
{
}

- (NSUserDefaults)coordinationDefaults
{
  return self->_coordinationDefaults;
}

- (void)setCoordinationDefaults:(id)a3
{
}

- (BOOL)hasPendingPing
{
  return self->_pendingPing;
}

- (void)setPendingPing:(BOOL)a3
{
  self->_pendingPing = a3;
}

- (double)pingMinimum
{
  return self->_pingMinimum;
}

- (void)setPingMinimum:(double)a3
{
  self->_pingMinimum = a3;
}

- (double)pingMaximum
{
  return self->_pingMaximum;
}

- (void)setPingMaximum:(double)a3
{
  self->_pingMaximum = a3;
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

- (CONodeManager)nodeManager
{
  return self->_nodeManager;
}

- (NSString)globalServiceName
{
  return self->_globalServiceName;
}

- (void)setGlobalServiceName:(id)a3
{
}

- (void)setCompanionLinkClientFactory:(id)a3
{
}

- (NSString)meshName
{
  return self->_meshName;
}

- (void)setMeshName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_storeStrong((id *)&self->_companionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_globalServiceName, 0);
  objc_storeStrong((id *)&self->_nodeManager, 0);
  objc_storeStrong((id *)&self->_longestBackedOffConstituent, 0);
  objc_storeStrong((id *)&self->_coordinationDefaults, 0);
  objc_storeStrong((id *)&self->_sentCommands, 0);
  objc_storeStrong((id *)&self->_queuedCommands, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
  objc_storeStrong((id *)&self->_commandHandlers, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_idsBrowser, 0);
  objc_storeStrong((id *)&self->_ballotBrowser, 0);
  objc_storeStrong((id *)&self->_rapportBrowser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_electionElapsedTimer, 0);
  objc_storeStrong((id *)&self->_ballot, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_addOns, 0);
}

- (void)setListener:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p listener is now %p", v2, v3);
}

void __52__COMeshController_registerHandler_forCommandClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = (objc_class *)OUTLINED_FUNCTION_7_0(a1);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p handler for %@ command registered", v5, v6, v7, v8, v9);
}

void __53__COMeshController_deregisterHandlerForCommandClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromClass(*(Class *)(a1 + 40));
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p handler for %@ command deregistered", v4, v5, v6, v7, v8);
}

void __57__COMeshController_registerHandler_forNotificationClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = (objc_class *)OUTLINED_FUNCTION_7_0(a1);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p handler for %@ notification registered", v5, v6, v7, v8, v9);
}

void __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromClass(*(Class *)(a1 + 40));
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p handler for %@ notification deregistered", v4, v5, v6, v7, v8);
}

void __52__COMeshController_registerHandler_forRequestClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = (objc_class *)OUTLINED_FUNCTION_7_0(a1);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p handler for %@ request registered", v5, v6, v7, v8, v9);
}

void __53__COMeshController_deregisterHandlerForRequestClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromClass(*(Class *)(a1 + 40));
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p handler for %@ request deregistered", v4, v5, v6, v7, v8);
}

void __54__COMeshController_sendCommand_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p sending %@ to leader", v4, v5, v6, v7, v8);
}

void __54__COMeshController_sendRequest_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p requesting %@ from leader", v4, v5, v6, v7, v8);
}

void __39__COMeshController_sendCommand_toPeer___block_invoke_cold_1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8_0(&dword_2217C1000, v2, v3, "%p sending command %@ to peer %@", v4, v5, v6, v7, 2u);
}

void __39__COMeshController_sendCommand_toPeer___block_invoke_82_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v9 = 134218754;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_6_0();
  __int16 v11 = v8;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_2217C1000, a3, OS_LOG_TYPE_ERROR, "%p failed to send command %@ to peer %@. Error %@", (uint8_t *)&v9, 0x2Au);
}

void __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8_0(&dword_2217C1000, v2, v3, "%p requesting %@ from peer %@", v4, v5, v6, v7, 2u);
}

- (void)_processBackedOffNodesExcludingTracker:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%p legacy nodes don't need to handle backoffs", v1, 0xCu);
}

- (void)_handleDiscoveryUsingElectionRequest:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p unable to perform node discovery from election request %@");
}

- (void)_performInvalidationOfNode:error:eventProvider:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p already invalidated or in the process of invalidating %p", v2, v3);
}

- (void)_performInvalidationOfNode:error:eventProvider:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "Bailing on invalidation of node %p since we're not tracking it", v1, 0xCu);
}

- (void)didActivateNode:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p not probing %p", v2, v3);
}

- (void)didActivateNode:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p probing %p", v2, v3);
}

- (void)node:didReceiveCommand:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p received exit from %p", v2, v3);
}

- (void)node:didReceiveError:forCommand:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "listener failed with %@", v1, 0xCu);
}

- (void)node:didReceiveError:forCommand:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "starting node %p failed with %@");
}

- (void)node:didReceiveError:forCommand:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "starting node %p unsuccessful with %@");
}

- (void)node:didReceiveError:forCommand:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "stopping node %p failed with %@");
}

- (void)node:(uint64_t)a1 didReceiveError:(void *)a2 forCommand:(NSObject *)a3 .cold.5(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [a2 responseTimeout];
  int v6 = 134218240;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_2217C1000, a3, OS_LOG_TYPE_ERROR, "%p ping (%g) failed!", (uint8_t *)&v6, 0x16u);
}

- (void)didInvalidateNode:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 meshName];
  uint64_t v5 = [a1 me];
  int v6 = 134218498;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  __int16 v11 = v5;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%p restarting \"%@\" mesh (%@)", (uint8_t *)&v6, 0x20u);
}

@end