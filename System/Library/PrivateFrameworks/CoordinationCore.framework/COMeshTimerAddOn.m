@interface COMeshTimerAddOn
- (BOOL)_isTimer:(id)a3 targetingAccessory:(id)a4;
- (BOOL)_isTimer:(id)a3 targetingAccessoryIdentifiers:(id)a4;
- (BOOL)performsLocalActions;
- (COHomeHubAdapter)homehub;
- (COHomeKitAdapter)homekit;
- (COMTActionDirector)actionDirector;
- (COMeshTimerAddOn)init;
- (COMeshTimerAddOn)initWithTimerManager:(id)a3;
- (COMeshTimerAddOn)initWithTimerManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5;
- (COMeshTimerAddOnDelegate)delegate;
- (COTimerReadRequest)mergeRequest;
- (MTTimerManager)observedTimerManager;
- (MTTimerManager)timerManager;
- (NSArray)deletes;
- (NSArray)mergeTimers;
- (NSArray)mergingNodes;
- (NSArray)queuedCommands;
- (NSDictionary)interests;
- (NSDictionary)mergeResponses;
- (NSDictionary)ourInterests;
- (NSMutableDictionary)timerIndex;
- (NSSet)members;
- (id)_commandsForReconciling:(id)a3 toTruth:(id)a4 forNode:(id)a5;
- (id)_currentAccessoryForClient:(id)a3;
- (id)_filteredTimersList:(id)a3 forAccessory:(id)a4;
- (id)_sendRequest:(id)a3 client:(id)a4;
- (id)_timersForAccessories:(id)a3 fromClient:(id)a4 results:(id)a5;
- (id)_timersForAccessory:(id)a3 member:(id)a4;
- (id)_timersForAccessoryIdentifier:(id)a3 allowLocalStorage:(BOOL)a4;
- (id)addTimer:(id)a3;
- (id)addTimer:(id)a3 client:(id)a4 member:(id)a5;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)dismissTimerWithIdentifier:(id)a3 client:(id)a4;
- (id)recorder;
- (id)removeTimer:(id)a3;
- (id)removeTimer:(id)a3 client:(id)a4 member:(id)a5;
- (id)secondaryClusterMemberForAccessory:(id)a3;
- (id)secondaryClusterMemberIfRequiredForAccessory:(id)a3;
- (id)timers;
- (id)updateTimer:(id)a3;
- (id)updateTimer:(id)a3 client:(id)a4 member:(id)a5;
- (void)_abandonMerge;
- (void)_addCompletionsToFuture:(id)a3 withXPCCallback:(id)a4 transactionDescription:(const char *)a5;
- (void)_addTimerDeleteEvent:(id)a3;
- (void)_broadcastMerge:(id)a3 withTruth:(id)a4;
- (void)_continueMerge:(id)a3 withResponse:(id)a4 fromNode:(id)a5;
- (void)_finishMerge:(id)a3;
- (void)_primeMerge:(id)a3 withNodes:(id)a4;
- (void)_processQueuedCommands;
- (void)_reloadIndexWithCompletion:(id)a3;
- (void)_sendNotification:(id)a3;
- (void)_startMerge;
- (void)_timerManagerStateReset:(id)a3;
- (void)_timerManagerTimerFired:(id)a3;
- (void)_timerManagerTimersAdded:(id)a3;
- (void)_timerManagerTimersChanged:(id)a3;
- (void)_timerManagerTimersRemoved:(id)a3;
- (void)_timerManagerTimersUpdated:(id)a3;
- (void)_withLock:(id)a3;
- (void)addTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6;
- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5;
- (void)didAddToMeshController:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)didStopMeshController:(id)a3;
- (void)director:(id)a3 membersChanged:(id)a4;
- (void)director:(id)a3 performAction:(id)a4 from:(id)a5 callback:(id)a6;
- (void)dismissTimerWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5;
- (void)establishSecondaryClusterForAccessory:(id)a3;
- (void)handleTimerCreateRequest:(id)a3 callback:(id)a4;
- (void)handleTimerDeleteRequest:(id)a3 callback:(id)a4;
- (void)handleTimerDismissRequest:(id)a3 callback:(id)a4;
- (void)handleTimerFiredNotification:(id)a3;
- (void)handleTimerFiringTimerDismissedNotification:(id)a3;
- (void)handleTimerManagerStateResetNotification:(id)a3;
- (void)handleTimerReadRequest:(id)a3 callback:(id)a4;
- (void)handleTimerUpdateRequest:(id)a3 callback:(id)a4;
- (void)handleTimersAddedNotification:(id)a3;
- (void)handleTimersRemovedNotification:(id)a3;
- (void)handleTimersUpdatedNotification:(id)a3;
- (void)interestTracker:(id)a3 setInterests:(id)a4 forMember:(id)a5 callback:(id)a6;
- (void)interestTrackerTriggerReset:(id)a3;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)removeTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6;
- (void)setActionDirector:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletes:(id)a3;
- (void)setInterests:(id)a3;
- (void)setInterests:(id)a3 asAccessory:(id)a4 withCallback:(id)a5;
- (void)setMembers:(id)a3;
- (void)setMergeRequest:(id)a3;
- (void)setMergeResponses:(id)a3;
- (void)setMergeTimers:(id)a3;
- (void)setMergingNodes:(id)a3;
- (void)setOurInterests:(id)a3;
- (void)setQueuedCommands:(id)a3;
- (void)setRecorder:(id)a3;
- (void)setTimerIndex:(id)a3;
- (void)timersAsAccessory:(id)a3 fromClient:(id)a4 withCallback:(id)a5;
- (void)timersForAccessories:(id)a3 fromClient:(id)a4 callback:(id)a5;
- (void)updateTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6;
- (void)willRemoveFromMeshController:(id)a3;
- (void)willStartMeshController:(id)a3;
@end

@implementation COMeshTimerAddOn

- (COMeshTimerAddOn)initWithTimerManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)COMeshTimerAddOn;
  v12 = [(COMeshAddOn *)&v33 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v14 = (MTTimerManager *)objc_alloc_init(MEMORY[0x263F55DA0]);
    observedTimerManager = v13->_observedTimerManager;
    v13->_observedTimerManager = v14;

    [(MTTimerManager *)v13->_observedTimerManager checkIn];
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
    v16 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    deletes = v13->_deletes;
    v13->_deletes = v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    mergingNodes = v13->_mergingNodes;
    v13->_mergingNodes = v18;

    v20 = (NSDictionary *)objc_alloc_init(NSDictionary);
    mergeResponses = v13->_mergeResponses;
    v13->_mergeResponses = v20;

    v22 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    queuedCommands = v13->_queuedCommands;
    v13->_queuedCommands = v22;

    objc_storeStrong((id *)&v13->_timerManager, a3);
    id recorder = v13->_recorder;
    v13->_id recorder = &__block_literal_global_3;

    v25 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    members = v13->_members;
    v13->_members = v25;

    v27 = (NSDictionary *)objc_alloc_init(NSDictionary);
    interests = v13->_interests;
    v13->_interests = v27;

    v29 = (NSDictionary *)objc_alloc_init(NSDictionary);
    ourInterests = v13->_ourInterests;
    v13->_ourInterests = v29;

    v31 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v13;
      _os_log_impl(&dword_2217C1000, v31, OS_LOG_TYPE_DEFAULT, "%p mesh add-on created", buf, 0xCu);
    }
  }
  return v13;
}

uint64_t __67__COMeshTimerAddOn_initWithTimerManager_homekitAdapter_hubAdapter___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (COMeshTimerAddOn)initWithTimerManager:(id)a3
{
  id v4 = a3;
  v5 = +[COHomeKitAdapter sharedInstance];
  v6 = +[COHomeHubAdapter sharedInstance];
  v7 = [(COMeshTimerAddOn *)self initWithTimerManager:v4 homekitAdapter:v5 hubAdapter:v6];

  return v7;
}

- (COMeshTimerAddOn)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F55DA0]);
  id v4 = [(COMeshTimerAddOn *)self initWithTimerManager:v3];

  return v4;
}

- (void)didAddToMeshController:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)COMeshTimerAddOn;
  [(COMeshAddOn *)&v48 didAddToMeshController:v4];
  objc_initWeak(&location, self);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke;
  v45[3] = &unk_2645CC318;
  objc_copyWeak(&v46, &location);
  v5 = (void (**)(void, void))MEMORY[0x223C8B4A0](v45);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_4;
  v43[3] = &unk_2645CC368;
  objc_copyWeak(&v44, &location);
  v6 = (void (**)(void, void))MEMORY[0x223C8B4A0](v43);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_7;
  v41[3] = &unk_2645CB778;
  objc_copyWeak(&v42, &location);
  v7 = ((void (**)(void, void *))v5)[2](v5, v41);
  [v4 registerHandler:v7 forRequestClass:objc_opt_class()];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_8;
  v39[3] = &unk_2645CB778;
  objc_copyWeak(&v40, &location);
  v8 = ((void (**)(void, void *))v5)[2](v5, v39);
  [v4 registerHandler:v8 forRequestClass:objc_opt_class()];

  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_9;
  v37[3] = &unk_2645CB778;
  objc_copyWeak(&v38, &location);
  id v9 = ((void (**)(void, void *))v5)[2](v5, v37);
  [v4 registerHandler:v9 forRequestClass:objc_opt_class()];

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_10;
  v35[3] = &unk_2645CB778;
  objc_copyWeak(&v36, &location);
  id v10 = ((void (**)(void, void *))v5)[2](v5, v35);
  [v4 registerHandler:v10 forRequestClass:objc_opt_class()];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_11;
  v33[3] = &unk_2645CB778;
  objc_copyWeak(&v34, &location);
  id v11 = ((void (**)(void, void *))v5)[2](v5, v33);
  [v4 registerHandler:v11 forRequestClass:objc_opt_class()];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_12;
  v31[3] = &unk_2645CB7C8;
  objc_copyWeak(&v32, &location);
  v12 = ((void (**)(void, void *))v6)[2](v6, v31);
  [v4 registerHandler:v12 forNotificationClass:objc_opt_class()];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_13;
  v29[3] = &unk_2645CB7C8;
  objc_copyWeak(&v30, &location);
  v13 = ((void (**)(void, void *))v6)[2](v6, v29);
  [v4 registerHandler:v13 forNotificationClass:objc_opt_class()];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_14;
  v27[3] = &unk_2645CB7C8;
  objc_copyWeak(&v28, &location);
  v14 = ((void (**)(void, void *))v6)[2](v6, v27);
  [v4 registerHandler:v14 forNotificationClass:objc_opt_class()];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_15;
  v25[3] = &unk_2645CB7C8;
  objc_copyWeak(&v26, &location);
  v15 = ((void (**)(void, void *))v6)[2](v6, v25);
  [v4 registerHandler:v15 forNotificationClass:objc_opt_class()];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_16;
  v23[3] = &unk_2645CB7C8;
  objc_copyWeak(&v24, &location);
  v16 = ((void (**)(void, void *))v6)[2](v6, v23);
  [v4 registerHandler:v16 forNotificationClass:objc_opt_class()];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_17;
  v21[3] = &unk_2645CB7C8;
  objc_copyWeak(&v22, &location);
  v17 = ((void (**)(void, void *))v6)[2](v6, v21);
  [v4 registerHandler:v17 forNotificationClass:objc_opt_class()];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_18;
  v19[3] = &unk_2645CB7C8;
  objc_copyWeak(&v20, &location);
  v18 = ((void (**)(void, void *))v6)[2](v6, v19);
  [v4 registerHandler:v18 forNotificationClass:objc_opt_class()];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

id __43__COMeshTimerAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_2;
  v11[3] = &unk_2645CC2F0;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v12 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x223C8B4A0](v11);
  id v9 = (void *)MEMORY[0x223C8B4A0](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained mergeRequest];

    if (v9)
    {
      id v10 = [v8 queuedCommands];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_3;
      v13[3] = &unk_2645CC2C8;
      id v15 = *(id *)(a1 + 32);
      id v14 = v5;
      id v16 = v6;
      id v11 = (void *)MEMORY[0x223C8B4A0](v13);
      id v12 = [v10 arrayByAddingObject:v11];
      [v8 setQueuedCommands:v12];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

id __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_5;
  v11[3] = &unk_2645CC340;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v12 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x223C8B4A0](v11);
  id v9 = (void *)MEMORY[0x223C8B4A0](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained mergeRequest];

    if (v6)
    {
      uint64_t v7 = [v5 queuedCommands];
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      id v12 = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_6;
      id v13 = &unk_2645CB170;
      id v15 = *(id *)(a1 + 32);
      id v14 = v3;
      uint64_t v8 = (void *)MEMORY[0x223C8B4A0](&v10);
      id v9 = objc_msgSend(v7, "arrayByAddingObject:", v8, v10, v11, v12, v13);
      [v5 setQueuedCommands:v9];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerCreateRequest:v8 callback:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerReadRequest:v8 callback:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerUpdateRequest:v8 callback:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerDeleteRequest:v8 callback:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerDismissRequest:v8 callback:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_12(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimersAddedNotification:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_13(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimersRemovedNotification:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_14(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerFiringTimerDismissedNotification:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_15(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerFiredNotification:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_16(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimersChangedNotification:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_17(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimersUpdatedNotification:v5];
  }
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_18(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleTimerManagerStateResetNotification:v5];
  }
}

- (void)willRemoveFromMeshController:(id)a3
{
  v11[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  void v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  uint64_t v5 = 0;
  v11[6] = objc_opt_class();
  do
    [v4 deregisterHandlerForNotificationClass:v11[v5++]];
  while (v5 != 7);
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  uint64_t v6 = 0;
  v10[4] = objc_opt_class();
  do
    [v4 deregisterHandlerForRequestClass:v10[v6++]];
  while (v6 != 5);
  uint64_t v7 = [(COMeshTimerAddOn *)self actionDirector];
  [v7 removeHandler:self];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__COMeshTimerAddOn_willRemoveFromMeshController___block_invoke;
  v9[3] = &unk_2645CB288;
  v9[4] = self;
  [(COMeshTimerAddOn *)self _withLock:v9];
  v8.receiver = self;
  v8.super_class = (Class)COMeshTimerAddOn;
  [(COMeshAddOn *)&v8 willRemoveFromMeshController:v4];
}

uint64_t __49__COMeshTimerAddOn_willRemoveFromMeshController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActionDirector:0];
}

- (void)willStartMeshController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshTimerAddOn *)self observedTimerManager];
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__timerManagerTimersAdded_ name:*MEMORY[0x263F55D18] object:v5];
  [v6 addObserver:self selector:sel__timerManagerTimersRemoved_ name:*MEMORY[0x263F55D30] object:v5];
  [v6 addObserver:self selector:sel__timerManagerTimersUpdated_ name:*MEMORY[0x263F55D38] object:v5];
  [v6 addObserver:self selector:sel__timerManagerTimerFired_ name:*MEMORY[0x263F55D10] object:v5];
  [v6 addObserver:self selector:sel__timerManagerStateReset_ name:*MEMORY[0x263F55D08] object:v5];
  [v6 addObserver:self selector:sel__timerManagerTimersChanged_ name:*MEMORY[0x263F55D20] object:v5];
  [(COMeshTimerAddOn *)self _reloadIndexWithCompletion:0];
  v7.receiver = self;
  v7.super_class = (Class)COMeshTimerAddOn;
  [(COMeshAddOn *)&v7 willStartMeshController:v4];
}

- (void)didStopMeshController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMeshTimerAddOn;
  [(COMeshAddOn *)&v6 didStopMeshController:a3];
  id v4 = [(COMeshTimerAddOn *)self observedTimerManager];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F55D20] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55D08] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55D10] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55D38] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55D30] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55D18] object:v4];
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 didChangeCompositionForTimerAddOn:self];
  }
  v16.receiver = self;
  v16.super_class = (Class)COMeshTimerAddOn;
  [(COMeshAddOn *)&v16 meshController:v6 didTransitionToState:a4];
  objc_super v8 = [v6 nodes];
  if (a4 == 2)
  {
    [(COMeshTimerAddOn *)self _abandonMerge];
  }
  else if (a4 == 3)
  {
    id v9 = [(COMeshTimerAddOn *)self ourInterests];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__COMeshTimerAddOn_meshController_didTransitionToState___block_invoke;
    v14[3] = &unk_2645CC390;
    id v15 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];

    uint64_t v10 = [v6 me];
    uint64_t v11 = [v6 leader];
    if ([v10 isEqual:v11])
    {
      id v12 = [(COMeshTimerAddOn *)self homekit];
      if ([v12 hasOptedToHH2])
      {
        char v13 = [MEMORY[0x263F33F80] isDistributedTimersEnabled];

        if (v13) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      [(COMeshTimerAddOn *)self _startMerge];
    }
    else
    {
    }
  }
LABEL_13:
}

void __56__COMeshTimerAddOn_meshController_didTransitionToState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  COMeshNodeForIDSIdentifier(v4, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setPrimaryAvailable:v6 != 0];
}

- (void)didChangeNodesForMeshController:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didChangeCompositionForTimerAddOn:self];
  }
  v26.receiver = self;
  v26.super_class = (Class)COMeshTimerAddOn;
  [(COMeshAddOn *)&v26 didChangeNodesForMeshController:v4];
  id v6 = [v4 nodes];
  objc_super v7 = [(COMeshAddOn *)self meshController];
  BOOL v8 = [v7 state] == 3;

  id v9 = [(COMeshTimerAddOn *)self ourInterests];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __52__COMeshTimerAddOn_didChangeNodesForMeshController___block_invoke;
  v23 = &unk_2645CC3B8;
  id v10 = v6;
  id v24 = v10;
  BOOL v25 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:&v20];

  uint64_t v11 = [(COMeshTimerAddOn *)self mergingNodes];
  id v12 = [MEMORY[0x263EFF9C0] setWithArray:v11];
  char v13 = (void *)MEMORY[0x263EFFA08];
  id v14 = [v4 nodes];
  id v15 = [v13 setWithArray:v14];

  [v12 minusSet:v15];
  if ([v12 count])
  {
    objc_super v16 = (void *)[v11 mutableCopy];
    v17 = [v12 allObjects];
    [v16 removeObjectsInArray:v17];

    [(COMeshTimerAddOn *)self setMergingNodes:v16];
    if (![v16 count])
    {
      v18 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[COMeshTimerAddOn didChangeNodesForMeshController:]((uint64_t)v4, self);
      }

      v19 = [(COMeshTimerAddOn *)self mergeRequest];
      [(COMeshTimerAddOn *)self _finishMerge:v19];
    }
  }
}

void __52__COMeshTimerAddOn_didChangeNodesForMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = COMeshNodeForIDSIdentifier(*(void **)(a1 + 32), a2);
  id v6 = (void *)v5;
  if (!v5 || *(unsigned char *)(a1 + 40)) {
    [v7 setPrimaryAvailable:v5 != 0];
  }
}

- (COMeshTimerAddOnDelegate)delegate
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__11;
  id v9 = __Block_byref_object_dispose__11;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__COMeshTimerAddOn_delegate__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMeshTimerAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMeshTimerAddOnDelegate *)v2;
}

uint64_t __28__COMeshTimerAddOn_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__COMeshTimerAddOn_setDelegate___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  BOOL v8 = self;
  id v5 = v4;
  [(COMeshTimerAddOn *)self _withLock:v6];
}

void __32__COMeshTimerAddOn_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));

  if (v2 != WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id *)(*(void *)(a1 + 40) + 32);
    objc_storeWeak(v5, v4);
  }
}

- (COMTActionDirector)actionDirector
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__11;
  id v9 = __Block_byref_object_dispose__11;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__COMeshTimerAddOn_actionDirector__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMeshTimerAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMTActionDirector *)v2;
}

void __34__COMeshTimerAddOn_actionDirector__block_invoke(uint64_t a1)
{
}

- (BOOL)performsLocalActions
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 processName];
  char v4 = [v3 isEqualToString:@"xctest"];

  return v4;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  char v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_sendRequest:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(COMeshAddOn *)self meshController];
  id v9 = objc_alloc_init(MEMORY[0x263F58190]);
  id v10 = [(COMeshAddOn *)self meshControllerQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__COMeshTimerAddOn__sendRequest_client___block_invoke;
  v18[3] = &unk_2645CB458;
  id v19 = v7;
  id v20 = v6;
  id v21 = v8;
  id v11 = v9;
  id v22 = v11;
  id v12 = v8;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(v10, v18);

  id v15 = v22;
  id v16 = v11;

  return v16;
}

void __40__COMeshTimerAddOn__sendRequest_client___block_invoke(id *a1)
{
  id v2 = [a1[4] clientLifetimeActivity];
  id v3 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:v2];

  if (v3)
  {
    [a1[5] setActivity:v3];
    nw_activity_activate();
  }
  id v5 = a1[5];
  id v4 = a1[6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__COMeshTimerAddOn__sendRequest_client___block_invoke_2;
  v7[3] = &unk_2645CC3E0;
  id v8 = v3;
  id v9 = v5;
  id v10 = a1[4];
  id v11 = a1[7];
  id v12 = a1[6];
  id v6 = v3;
  [v4 sendRequest:v5 withCompletionHandler:v7];
}

void __40__COMeshTimerAddOn__sendRequest_client___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    id v13 = [v12 error];
  }
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    if (v14)
    {
      id v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v14, "command", (const char *)[v16 UTF8String]);

      v17 = [*(id *)(a1 + 48) clientBundleIdentifier];
      v18 = v17;
      if (!v17)
      {
        id v5 = [MEMORY[0x263F086E0] mainBundle];
        v18 = [v5 bundleIdentifier];
      }
      xpc_dictionary_set_string(v14, "client", (const char *)[v18 UTF8String]);
      if (!v17)
      {
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v13)
  {
    id v19 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 64);
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      int v23 = 134218498;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      objc_super v26 = v22;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_error_impl(&dword_2217C1000, v19, OS_LOG_TYPE_ERROR, "%p %@ from leader failed (%@)", (uint8_t *)&v23, 0x20u);
    }
    [*(id *)(a1 + 56) finishWithError:v13];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

- (void)_addCompletionsToFuture:(id)a3 withXPCCallback:(id)a4 transactionDescription:(const char *)a5
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__11;
  void v18[4] = __Block_byref_object_dispose__11;
  id v19 = (id)os_transaction_create();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke;
  v15[3] = &unk_2645CC408;
  id v8 = v7;
  id v16 = v8;
  v17 = v18;
  id v9 = (id)[v6 addFailureBlock:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2;
  v12[3] = &unk_2645CC430;
  id v10 = v8;
  id v13 = v10;
  xpc_object_t v14 = v18;
  id v11 = (id)[v6 addSuccessBlock:v12];

  _Block_object_dispose(v18, 8);
}

void __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)_filteredTimersList:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _filteredTimersList:forAccessory:]();
  }

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __53__COMeshTimerAddOn__filteredTimersList_forAccessory___block_invoke;
  v17 = &unk_2645CC458;
  id v9 = v7;
  id v18 = v9;
  id v19 = self;
  id v10 = [v6 indexesOfObjectsPassingTest:&v14];
  if (objc_msgSend(v10, "count", v14, v15, v16, v17))
  {
    id v11 = (void *)[v6 mutableCopy];
    [v11 removeObjectsAtIndexes:v10];

    id v6 = v11;
  }
  id v12 = v6;

  return v12;
}

uint64_t __53__COMeshTimerAddOn__filteredTimersList_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 40), "_isTimer:targetingAccessory:", a2);
  }
  else
  {
    id v3 = [a2 siriContext];
    id v4 = [v3 objectForKey:*MEMORY[0x263F33F28]];
    int v2 = v4 == 0;
  }
  return v2 ^ 1u;
}

- (id)_timersForAccessoryIdentifier:(id)a3 allowLocalStorage:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(COMeshAddOn *)self meshController];
  id v8 = objc_alloc_init(MEMORY[0x263F58190]);
  id v9 = [(COMeshTimerAddOn *)self timerManager];
  id v10 = [MEMORY[0x263F08D68] currentConnection];
  id v11 = objc_msgSend(v10, "co_ClientBundleIdentifier");

  if (![v11 length])
  {
    id v12 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];

    id v11 = (void *)v13;
  }
  uint64_t v14 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke;
  block[3] = &unk_2645CC540;
  BOOL v29 = a4;
  block[4] = self;
  id v24 = v7;
  id v25 = v6;
  id v26 = v9;
  id v15 = v8;
  id v27 = v15;
  id v28 = v11;
  id v16 = v11;
  id v17 = v9;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(v14, block);

  uint64_t v20 = v28;
  id v21 = v15;

  return v21;
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 80)
    && [*(id *)(a1 + 32) performsLocalActions]
    && ([*(id *)(a1 + 40) leader], int v2 = objc_claimAutoreleasedReturnValue(),
                                                  v2,
                                                  !v2))
  {
    uint64_t v14 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v41 = v15;
      __int16 v42 = 2112;
      uint64_t v43 = v16;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using local list of timers for %@", buf, 0x16u);
    }

    id v17 = [*(id *)(a1 + 56) timers];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_96;
    v35[3] = &unk_2645CC480;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(a1 + 40);
    id v36 = v18;
    uint64_t v37 = v19;
    id v38 = v20;
    id v39 = *(id *)(a1 + 64);
    id v21 = (id)[v17 addCompletionBlock:v35];

    id v22 = [*(id *)(a1 + 32) recorder];
    ((void (**)(void, uint64_t, void *))v22)[2](v22, 0x26D3D5C68, &__block_literal_global_102);

    id v12 = v36;
  }
  else
  {
    id v3 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v41 = v4;
      __int16 v42 = 2112;
      uint64_t v43 = v5;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p requesting list of timers for %@ from the leader ", buf, 0x16u);
    }

    id v6 = [[COTimerReadRequest alloc] initWithAccessoryUniqueIdentifier:*(void *)(a1 + 48) requiresFilter:1];
    id v7 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:0];
    if (v7)
    {
      [(COMeshRequest *)v6 setActivity:v7];
      nw_activity_activate();
    }
    id v8 = *(void **)(a1 + 40);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    id v25 = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_103;
    id v26 = &unk_2645CC518;
    id v27 = v7;
    id v28 = v6;
    id v29 = *(id *)(a1 + 72);
    id v30 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v31 = v9;
    uint64_t v32 = v10;
    id v33 = *(id *)(a1 + 64);
    id v34 = *(id *)(a1 + 56);
    id v11 = v6;
    id v12 = v7;
    [v8 sendRequest:v11 withCompletionHandler:&v23];
    objc_msgSend(*(id *)(a1 + 32), "recorder", v23, v24, v25, v26);
    uint64_t v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, uint64_t, void *))v13)[2](v13, 0x26D3D5C68, &__block_literal_global_108);
  }
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_96_cold_2();
    }

    [*(id *)(a1 + 56) finishWithError:v7];
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 32)) {
    goto LABEL_8;
  }
  id v9 = [*(id *)(a1 + 40) homekit];
  uint64_t v10 = [v9 accessoryWithUniqueIdentifier:*(void *)(a1 + 32)];
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = [*(id *)(a1 + 40) _filteredTimersList:v5 forAccessory:v10];

    id v5 = (id)v12;
LABEL_8:
    uint64_t v13 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      int v17 = 134218242;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p local timers list: %@", (uint8_t *)&v17, 0x16u);
    }

    [*(id *)(a1 + 56) finishWithResult:v5];
    goto LABEL_14;
  }
  uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
  uint64_t v16 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_96_cold_1();
  }

  [*(id *)(a1 + 56) finishWithError:v15];
LABEL_14:
}

id __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_99()
{
  return COCoreAnalyticsCreateActionEvent(@"timer", @"read", 0);
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_103(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    id v12 = [v11 error];
    if (!v12)
    {
      if (*(void *)(a1 + 32))
      {
        xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
        if (v17)
        {
          uint64_t v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          id v19 = objc_claimAutoreleasedReturnValue();
          xpc_dictionary_set_string(v17, "command", (const char *)[v19 UTF8String]);

          xpc_dictionary_set_string(v17, "client", (const char *)[*(id *)(a1 + 48) UTF8String]);
          nw_activity_submit_metrics();
        }
        nw_activity_complete_with_reason();
      }
      uint64_t v39 = 0;
      id v40 = &v39;
      uint64_t v41 = 0x3032000000;
      __int16 v42 = __Block_byref_object_copy__11;
      uint64_t v43 = __Block_byref_object_dispose__11;
      id v44 = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v11 timers];
        uint64_t v21 = (void *)v40[5];
        v40[5] = v20;

        if (!*(void *)(a1 + 56)
          || ![*(id *)(a1 + 40) requiresFilter]
          || ([v11 isFiltered] & 1) != 0)
        {
          goto LABEL_25;
        }
        id v22 = COCoreLogForCategory(3);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 134217984;
          uint64_t v46 = v23;
          _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_INFO, "%p timer results from leader not filtered!", buf, 0xCu);
        }

        uint64_t v24 = [*(id *)(a1 + 72) homekit];
        id v25 = [v24 accessoryWithUniqueIdentifier:*(void *)(a1 + 56)];
        if (!v25)
        {
          id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
          id v34 = COCoreLogForCategory(3);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_103_cold_1();
          }

          [*(id *)(a1 + 80) finishWithError:v12];
          goto LABEL_28;
        }
        uint64_t v26 = [*(id *)(a1 + 72) _filteredTimersList:v40[5] forAccessory:v25];
        id v27 = (void *)v40[5];
        v40[5] = v26;
      }
      else
      {
        uint64_t v28 = [MEMORY[0x263EFF8C0] array];
        uint64_t v24 = (void *)v40[5];
        v40[5] = v28;
      }

LABEL_25:
      id v29 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 64);
        uint64_t v31 = v40[5];
        *(_DWORD *)buf = 134218242;
        uint64_t v46 = v30;
        __int16 v47 = 2112;
        uint64_t v48 = v31;
        _os_log_impl(&dword_2217C1000, v29, OS_LOG_TYPE_DEFAULT, "%p timers list from leader: %@", buf, 0x16u);
      }

      uint64_t v32 = [*(id *)(a1 + 88) timers];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_105;
      v35[3] = &unk_2645CC4F0;
      id v38 = &v39;
      id v36 = *(id *)(a1 + 64);
      id v37 = *(id *)(a1 + 80);
      id v33 = (id)[v32 addCompletionBlock:v35];

      id v12 = 0;
      uint64_t v24 = v36;
LABEL_28:

      _Block_object_dispose(&v39, 8);
      goto LABEL_10;
    }
  }
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    if (v13)
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v13, "command", (const char *)[v15 UTF8String]);

      xpc_dictionary_set_string(v13, "client", (const char *)[*(id *)(a1 + 48) UTF8String]);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  uint64_t v16 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_103_cold_2();
  }

  [*(id *)(a1 + 80) finishWithError:v12];
LABEL_10:
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v8 isFiring])
        {
          id v9 = [v8 timerID];
          id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_2;
          v20[3] = &unk_2645CC4C8;
          id v11 = v9;
          id v21 = v11;
          uint64_t v12 = [v10 indexOfObjectPassingTest:v20];
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v13 = v12;
            uint64_t v14 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutableCopy];
            [v14 replaceObjectAtIndex:v13 withObject:v8];
            uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v5);
  }
  xpc_object_t v17 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v19;
    _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%p timers list after merge: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 timerID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_106()
{
  return COCoreAnalyticsCreateActionEvent(@"timer", @"read", 1);
}

- (id)_timersForAccessory:(id)a3 member:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshAddOn *)self meshController];
  id v9 = objc_alloc_init(MEMORY[0x263F58190]);
  id v10 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke;
  block[3] = &unk_2645CB038;
  id v19 = v8;
  id v20 = v6;
  id v21 = self;
  id v11 = v9;
  id v22 = v11;
  id v23 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v8;
  dispatch_async(v10, block);

  uint64_t v15 = v23;
  id v16 = v11;

  return v16;
}

void __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v22 = v3;
    __int16 v23 = 2114;
    uint64_t v24 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster timers for %{public}@", buf, 0x16u);
  }

  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = +[COMTReadAction actionWithTargetType:v6 targetMemento:*(void *)(a1 + 40)];

  id v8 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:0];
  if (v8) {
    nw_activity_activate();
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 48));
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_111;
  id v16 = &unk_2645CC590;
  id v17 = *(id *)(a1 + 32);
  objc_copyWeak(&v20, (id *)buf);
  id v9 = v8;
  id v18 = v9;
  id v19 = *(id *)(a1 + 56);
  id v10 = (void *)MEMORY[0x223C8B4A0](&v13);
  id v11 = objc_msgSend(*(id *)(a1 + 48), "actionDirector", v13, v14, v15, v16);
  id v12 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
  [v11 requestAction:v7 members:v12 activity:v9 withCompletion:v10];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_111(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_2;
  block[3] = &unk_2645CC568;
  objc_copyWeak(&v15, a1 + 7);
  id v11 = v6;
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v10 = WeakRetained;
    if (v3)
    {
      if (*(void *)(a1 + 40))
      {
        nw_activity_complete_with_reason();
        uint64_t v3 = *(void *)(a1 + 32);
      }
      [*(id *)(a1 + 48) finishWithError:v3];
    }
    else
    {
      uint64_t v5 = a1 + 48;
      uint64_t v4 = *(void **)(a1 + 48);
      id v6 = *(id *)(v5 + 8);
      uint64_t v7 = [v6 timers];
      id v8 = (void *)v7;
      if (v7) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = MEMORY[0x263EFFA68];
      }
      [v4 finishWithResult:v9];
    }
    id WeakRetained = v10;
  }
}

- (id)_timersForAccessories:(id)a3 fromClient:(id)a4 results:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMeshAddOn *)self meshController];
  unint64_t v12 = 0x263F58000uLL;
  if ([(COMeshTimerAddOn *)self performsLocalActions]
    && ([v11 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    __int16 v28 = [(COMeshTimerAddOn *)self timerManager];
    id v24 = [v28 timers];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    id v15 = objc_alloc_init(COTimerReadRequest);
    id v16 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:0];
    if (v16)
    {
      [(COMeshRequest *)v15 setActivity:v16];
      nw_activity_activate();
    }
    id v17 = [v9 clientBundleIdentifier];
    if (![v17 length])
    {
      [MEMORY[0x263F086E0] mainBundle];
      id v39 = v14;
      id v18 = v10;
      id v19 = v8;
      id v20 = v11;
      uint64_t v22 = v21 = v9;
      uint64_t v23 = [v22 bundleIdentifier];

      id v9 = v21;
      id v11 = v20;
      id v8 = v19;
      id v10 = v18;
      id v14 = v39;
      id v17 = (void *)v23;
    }
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke;
    v47[3] = &unk_2645CC5B8;
    id v48 = v16;
    uint64_t v49 = v15;
    id v50 = v17;
    id v24 = v14;
    id v51 = v24;
    id v25 = v17;
    uint64_t v26 = v15;
    id v27 = v16;
    [v11 sendRequest:v26 withCompletionHandler:v47];

    unint64_t v12 = 0x263F58000;
  }
  id v29 = objc_alloc_init(*(Class *)(v12 + 400));
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_2;
  v42[3] = &unk_2645CC630;
  id v43 = v8;
  id v44 = self;
  id v45 = v10;
  id v30 = v29;
  id v46 = v30;
  id v31 = v10;
  id v32 = v8;
  id v33 = (id)[v24 addSuccessBlock:v42];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_5;
  v40[3] = &unk_2645CB308;
  id v34 = v30;
  id v41 = v34;
  id v35 = (id)[v24 addFailureBlock:v40];
  id v36 = v41;
  id v37 = v34;

  return v37;
}

void __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v18 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v11 = [v10 error];
  }
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    if (v12)
    {
      id v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v12, "command", (const char *)[v14 UTF8String]);

      xpc_dictionary_set_string(v12, "client", (const char *)[*(id *)(a1 + 48) UTF8String]);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v11)
  {
    [*(id *)(a1 + 56) finishWithError:v11];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v16 = *(void **)(a1 + 56);
    if (isKindOfClass)
    {
      id v17 = [v10 timers];
      [v16 finishWithResult:v17];
    }
    else
    {
      [v16 finishWithResult:MEMORY[0x263EFFA68]];
    }
  }
}

void __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_3;
  v8[3] = &unk_2645CC608;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
  [*(id *)(a1 + 56) finishWithNoResult];
}

void __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_4;
  uint64_t v10 = &unk_2645CC5E0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_filter:", &v7);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, v5, v7, v8, v9, v10, v11);
}

uint64_t __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  uint64_t v6 = objc_msgSend(v2, "_isTimer:targetingAccessoryIdentifiers:", v4, v5, v8, v9);

  return v6;
}

uint64_t __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (BOOL)_isTimer:(id)a3 targetingAccessoryIdentifiers:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 siriContext];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F33F28]];
  uint64_t v9 = (void *)v8;
  BOOL v10 = v8 == 0;
  if (v6 && v8)
  {
    uint64_t v11 = [MEMORY[0x263F08BA0] componentsWithString:v8];
    id v12 = [v11 scheme];
    if ([v12 isEqualToString:@"siri-hk-target"])
    {
      id v13 = [v11 path];
      int v14 = [v13 isEqualToString:@"accessory"];

      if (v14)
      {
        id v15 = COCoreLogForCategory(3);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          id v27 = [v5 timerID];
          __int16 v28 = [v11 query];
          *(_DWORD *)buf = 138412802;
          id v39 = v27;
          __int16 v40 = 2112;
          id v41 = v28;
          __int16 v42 = 2112;
          id v43 = v6;
          _os_log_debug_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEBUG, "checking if timer (%@) target (%@) contains %@", buf, 0x20u);
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v16 = [v11 queryItems];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          id v29 = v11;
          id v30 = v9;
          id v31 = v7;
          id v32 = v5;
          uint64_t v19 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v34 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v22 = objc_msgSend(v21, "name", v29, v30, v31, v32);
              int v23 = [@"identifier" isEqualToString:v22];

              if (v23)
              {
                id v24 = [v21 value];
                if (v24)
                {
                  id v25 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v24];
                  if (v25 && ([v6 containsObject:v25] & 1) != 0)
                  {

                    BOOL v10 = 1;
                    goto LABEL_30;
                  }
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v18) {
              continue;
            }
            break;
          }
          BOOL v10 = 0;
LABEL_30:
          uint64_t v7 = v31;
          id v5 = v32;
          uint64_t v11 = v29;
          uint64_t v9 = v30;
          goto LABEL_27;
        }
LABEL_26:
        BOOL v10 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
    }
    id v16 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:]();
    }
    goto LABEL_26;
  }
  uint64_t v11 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:](v5);
  }
LABEL_28:

  return v10;
}

- (id)_currentAccessoryForClient:(id)a3
{
  id v4 = [a3 connection];
  id v5 = objc_msgSend(v4, "co_PeerInstance");

  if (v5)
  {
    id v6 = [(COMeshTimerAddOn *)self homehub];
    uint64_t v7 = [(COMeshTimerAddOn *)self homekit];
    uint64_t v8 = [v6 accessoryForPeerInstance:v5 usingHomeKitAdapter:v7];
  }
  else
  {
    id v6 = [(COMeshTimerAddOn *)self homekit];
    uint64_t v8 = [v6 currentAccessory];
  }

  return v8;
}

- (void)_sendNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F55D28]];

  uint64_t v8 = [v4 name];

  uint64_t v9 = [(COMeshAddOn *)self meshController];
  BOOL v10 = [(COMeshTimerAddOn *)self interests];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__COMeshTimerAddOn__sendNotification___block_invoke;
  v14[3] = &unk_2645CC680;
  id v15 = v7;
  id v16 = self;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
}

void __38__COMeshTimerAddOn__sendNotification___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __38__COMeshTimerAddOn__sendNotification___block_invoke_2;
  v20[3] = &unk_2645CC458;
  id v7 = a1[4];
  void v20[4] = a1[5];
  id v8 = v6;
  id v21 = v8;
  uint64_t v9 = [v7 indexesOfObjectsPassingTest:v20];
  if ([v9 count])
  {
    BOOL v10 = [COMTTimerNotificationAction alloc];
    id v11 = a1[6];
    id v12 = [a1[4] objectsAtIndexes:v9];
    id v13 = [(COMTTimerNotificationAction *)v10 initWithReason:v11 timers:v12];

    int v14 = [a1[5] actionDirector];
    id v15 = [MEMORY[0x263EFFA08] setWithObject:v5];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__COMeshTimerAddOn__sendNotification___block_invoke_3;
    v16[3] = &unk_2645CC658;
    id v17 = a1[7];
    id v18 = a1[6];
    id v19 = v5;
    [v14 requestAction:v13 members:v15 withCompletion:v16];
  }
}

uint64_t __38__COMeshTimerAddOn__sendNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isTimer:a2 targetingAccessoryIdentifiers:*(void *)(a1 + 40)];
}

void __38__COMeshTimerAddOn__sendNotification___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38__COMeshTimerAddOn__sendNotification___block_invoke_3_cold_1();
    }
  }
}

- (void)_timerManagerTimersAdded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F55D28]];

  id v7 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__COMeshTimerAddOn__timerManagerTimersAdded___block_invoke;
  block[3] = &unk_2645CAEF8;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v7, block);

  BOOL v10 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 timerAddOn:self didAddTimers:v8];
  }
}

uint64_t __45__COMeshTimerAddOn__timerManagerTimersAdded___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isCurrentTimer", (void)v12) & 1) == 0)
        {
          id v8 = [v7 lastModifiedDate];
          if (!v8)
          {
            id v8 = [MEMORY[0x263EFF910] distantPast];
          }
          id v9 = [*(id *)(a1 + 40) timerIndex];
          BOOL v10 = [v7 timerID];
          [v9 setObject:v8 forKey:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _sendNotification:*(void *)(a1 + 48)];
}

- (void)_timerManagerTimersRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F55D28]];

  id v7 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timerManagerTimersRemoved___block_invoke;
  block[3] = &unk_2645CAEF8;
  id v8 = v6;
  id v12 = v8;
  long long v13 = self;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v7, block);

  BOOL v10 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 timerAddOn:self didRemoveTimers:v8];
  }
}

uint64_t __47__COMeshTimerAddOn__timerManagerTimersRemoved___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isCurrentTimer", (void)v11) & 1) == 0)
        {
          id v8 = [*(id *)(a1 + 40) timerIndex];
          id v9 = [v7 timerID];
          [v8 removeObjectForKey:v9];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _sendNotification:*(void *)(a1 + 48)];
}

- (void)_timerManagerTimersUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F55D28]];

  id v7 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timerManagerTimersUpdated___block_invoke;
  block[3] = &unk_2645CAEF8;
  id v8 = v6;
  id v12 = v8;
  long long v13 = self;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v7, block);

  BOOL v10 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 timerAddOn:self didUpdateTimers:v8];
  }
}

uint64_t __47__COMeshTimerAddOn__timerManagerTimersUpdated___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isCurrentTimer", (void)v12) & 1) == 0)
        {
          id v8 = [v7 lastModifiedDate];
          if (!v8)
          {
            id v8 = [MEMORY[0x263EFF910] distantPast];
          }
          id v9 = [*(id *)(a1 + 40) timerIndex];
          BOOL v10 = [v7 timerID];
          [v9 setObject:v8 forKey:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _sendNotification:*(void *)(a1 + 48)];
}

- (void)_timerManagerTimerFired:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F55D28]];

  id v6 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 timerAddOn:self didFireTimers:v5];
  }
  if ([(COMeshTimerAddOn *)self performsLocalActions])
  {
    id v7 = [(COMeshAddOn *)self meshController];
    id v8 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn _timerManagerTimerFired:]();
    }

    id v9 = [(COTimerNotification *)[COTimerFiredNotification alloc] initWithTimers:v5];
    [v7 sendNotification:v9];
  }
}

- (void)_timerManagerStateReset:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke;
  v5[3] = &unk_2645CC1E0;
  objc_copyWeak(&v6, &location);
  [(COMeshTimerAddOn *)self _reloadIndexWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained meshController];
    if (a2)
    {
      id v6 = objc_alloc_init(COTimerManagerStateResetNotification);
      id v7 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke_cold_1();
      }

      [v5 sendNotification:v6];
      id v8 = [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        [v8 didResetTimerAddOn:v4];
      }
    }
    else
    {
      COCoreLogForCategory(3);
      id v6 = (COTimerManagerStateResetNotification *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        BOOL v10 = v5;
        _os_log_impl(&dword_2217C1000, &v6->super.super.super, OS_LOG_TYPE_DEFAULT, "%p not emitting state reset, timers not updated", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)_timerManagerTimersChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x263F55D28]];

  uint64_t v5 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 timerAddOn:self didChangeTimers:v6];
  }
}

- (void)_startMerge
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COMeshAddOn *)self meshController];
  id v4 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v4);
  id v5 = [[COTimerReadRequest alloc] initForMerge];
  [(COMeshTimerAddOn *)self setMergeRequest:v5];
  id v6 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v3;
    __int16 v18 = 2048;
    id v19 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p starting merge for %p...", buf, 0x16u);
  }

  if ([(COMeshTimerAddOn *)self performsLocalActions])
  {
    id v7 = [(COMeshTimerAddOn *)self timerManager];
    id v8 = [v7 timers];
  }
  else
  {
    id v8 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__COMeshTimerAddOn__startMerge__block_invoke;
  v12[3] = &unk_2645CC6D0;
  int v9 = v4;
  long long v13 = v9;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v5;
  id v14 = v10;
  id v11 = (id)[v8 addCompletionBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __31__COMeshTimerAddOn__startMerge__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__COMeshTimerAddOn__startMerge__block_invoke_2;
  block[3] = &unk_2645CC6A8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __31__COMeshTimerAddOn__startMerge__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = MEMORY[0x263EFFA68];
  }
  [WeakRetained _broadcastMerge:*(void *)(a1 + 32) withTruth:v3];
}

- (void)_broadcastMerge:(id)a3 withTruth:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  id v7 = [(COMeshAddOn *)self meshController];
  id v8 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(COMeshTimerAddOn *)self mergeRequest];

  if (v9 == v6)
  {
    id v10 = eTagForTimers(v20);
    [v6 setETag:v10];
    id v11 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v28 = v7;
      __int16 v29 = 2048;
      id v30 = v6;
      __int16 v31 = 2114;
      id v32 = v10;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p broadcasting merge %p with eTag %{public}@", buf, 0x20u);
    }

    id v12 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    [(COMeshTimerAddOn *)self setMergingNodes:v12];

    id v13 = objc_alloc_init(NSDictionary);
    [(COMeshTimerAddOn *)self setMergeResponses:v13];

    [(COMeshTimerAddOn *)self setMergeTimers:v20];
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke;
    v24[3] = &unk_2645CC6F8;
    objc_copyWeak(&v26, (id *)buf);
    id v14 = v6;
    id v25 = v14;
    id v15 = (void *)MEMORY[0x223C8B4A0](v24);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2;
    v21[3] = &unk_2645CC720;
    objc_copyWeak(&v23, (id *)buf);
    id v16 = v14;
    id v22 = v16;
    uint64_t v17 = (void *)MEMORY[0x223C8B4A0](v21);
    id v18 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    [(COMeshTimerAddOn *)self setMergingNodes:v18];

    id v19 = objc_alloc_init(NSDictionary);
    [(COMeshTimerAddOn *)self setMergeResponses:v19];

    [v7 broadcastRequest:v16 includingSelf:0 recipientsCallback:v15 completionHandler:v17];
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      __int16 v28 = v7;
      __int16 v29 = 2048;
      id v30 = v6;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p ignoring broadcast for merge %p", buf, 0x16u);
    }
  }
}

void __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _primeMerge:*(void *)(a1 + 32) withNodes:v5];
  }
}

void __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      [WeakRetained _continueMerge:v7 withResponse:v9 fromNode:v8];
    }
    else
    {
      id v12 = [WeakRetained mergingNodes];
      id v13 = (void *)[v12 mutableCopy];

      [v13 removeObject:v8];
      [v11 setMergingNodes:v13];
      if (![v13 count])
      {
        id v14 = COCoreLogForCategory(3);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1();
        }

        [v11 _finishMerge:*(void *)(a1 + 32)];
      }
    }
  }
}

- (void)_primeMerge:(id)a3 withNodes:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshAddOn *)self meshController];
  id v9 = [v8 dispatchQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(COMeshTimerAddOn *)self mergeRequest];

  if (v10 == v6)
  {
    [(COMeshTimerAddOn *)self setMergingNodes:v7];
    uint64_t v12 = [v7 count];
    id v13 = COCoreLogForCategory(3);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        int v15 = 134218496;
        id v16 = v8;
        __int16 v17 = 2048;
        id v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v12;
        _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p merge %p with %ld others.", (uint8_t *)&v15, 0x20u);
      }
    }
    else
    {
      if (v14)
      {
        int v15 = 134218240;
        id v16 = v8;
        __int16 v17 = 2048;
        id v18 = v6;
        _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p is solo, so %p is finished.", (uint8_t *)&v15, 0x16u);
      }

      [(COMeshTimerAddOn *)self _finishMerge:v6];
    }
  }
  else
  {
    id v11 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      id v16 = v8;
      __int16 v17 = 2048;
      id v18 = v6;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p ignoring prime of merge %p", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_continueMerge:(id)a3 withResponse:(id)a4 fromNode:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMeshAddOn *)self meshController];
  uint64_t v12 = [v11 dispatchQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(COMeshTimerAddOn *)self mergeRequest];

  if (v13 == v8)
  {
    int v15 = [(COMeshTimerAddOn *)self mergingNodes];
    BOOL v14 = [v15 mutableCopy];

    [v14 removeObject:v10];
    [(COMeshTimerAddOn *)self setMergingNodes:v14];
    if ([v9 skipInMerge])
    {
      id v16 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 134218496;
        id v23 = v11;
        __int16 v24 = 2048;
        id v25 = v10;
        __int16 v26 = 2048;
        uint64_t v27 = (uint64_t)v8;
        _os_log_debug_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEBUG, "%p skipping node %p in merge %p", (uint8_t *)&v22, 0x20u);
      }
    }
    else
    {
      __int16 v17 = [(COMeshTimerAddOn *)self mergeResponses];
      id v18 = (void *)[v17 mutableCopy];

      [v18 setObject:v9 forKey:v10];
      [(COMeshTimerAddOn *)self setMergeResponses:v18];
    }
    uint64_t v19 = [v14 count];
    uint64_t v20 = COCoreLogForCategory(3);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
      {
        int v22 = 134218496;
        id v23 = v11;
        __int16 v24 = 2048;
        id v25 = v8;
        __int16 v26 = 2048;
        uint64_t v27 = v19;
        _os_log_debug_impl(&dword_2217C1000, v20, OS_LOG_TYPE_DEBUG, "%p merge %p still waiting on %ld others.", (uint8_t *)&v22, 0x20u);
      }
    }
    else
    {
      if (v21) {
        -[COMeshTimerAddOn _continueMerge:withResponse:fromNode:]();
      }

      [(COMeshTimerAddOn *)self _finishMerge:v8];
    }
  }
  else
  {
    BOOL v14 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218240;
      id v23 = v11;
      __int16 v24 = 2048;
      id v25 = v8;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p ignoring continuation of merge %p", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)_abandonMerge
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COMeshAddOn *)self meshController];
  id v4 = [v3 dispatchQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(COMeshTimerAddOn *)self mergeRequest];
  id v6 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218240;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p abandoning merge %p", (uint8_t *)&v9, 0x16u);
  }

  [(COMeshTimerAddOn *)self setMergeRequest:0];
  id v7 = objc_alloc_init(NSDictionary);
  [(COMeshTimerAddOn *)self setMergeResponses:v7];

  id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  [(COMeshTimerAddOn *)self setMergingNodes:v8];

  [(COMeshTimerAddOn *)self _processQueuedCommands];
}

- (id)_commandsForReconciling:(id)a3 toTruth:(id)a4 forNode:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v46 = [MEMORY[0x263EFF8C0] array];
  id v10 = (void *)[v8 mutableCopy];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  __int16 v11 = (COTimersRemovedNotification *)v7;
  uint64_t v12 = [(COTimersRemovedNotification *)v11 countByEnumeratingWithState:&v50 objects:v60 count:16];
  id v47 = v8;
  if (!v12)
  {
    BOOL v14 = 0;
    id v48 = 0;
    uint64_t v28 = v11;
    uint64_t v27 = v46;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v13 = v12;
  id v48 = 0;
  uint64_t v49 = v10;
  id v45 = v9;
  BOOL v14 = 0;
  uint64_t v15 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v51 != v15) {
        objc_enumerationMutation(v11);
      }
      __int16 v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      if (([v17 isCurrentTimer] & 1) == 0)
      {
        id v18 = v11;
        uint64_t v19 = [v17 timerID];
        uint64_t v20 = [v8 objectForKey:v19];
        if (v20)
        {
          BOOL v21 = objc_msgSend(v17, "co_preferredTimer:", v20);
          if (v17 != v21 && ([v17 isEqualIgnoringLastModifiedDate:v21] & 1) == 0)
          {
            if (v48)
            {
              uint64_t v22 = [v48 arrayByAddingObject:v21];

              id v48 = (void *)v22;
              id v8 = v47;
            }
            else
            {
              id v48 = [MEMORY[0x263EFF8C0] arrayWithObject:v21];
            }
          }
        }
        else if (v14)
        {
          uint64_t v23 = [v14 arrayByAddingObject:v17];

          BOOL v14 = (void *)v23;
        }
        else
        {
          BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
        }
        __int16 v24 = [v17 timerID];
        [v49 removeObjectForKey:v24];

        __int16 v11 = v18;
      }
    }
    uint64_t v13 = [(COTimersRemovedNotification *)v11 countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v13);

  if (v48)
  {
    id v25 = [(COTimerNotification *)[COTimersUpdatedNotification alloc] initWithTimers:v48];
    __int16 v26 = COCoreLogForCategory(3);
    id v9 = v45;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      __int16 v40 = [(COMeshAddOn *)self meshController];
      id v41 = [(COTimerNotification *)v25 timers];
      *(_DWORD *)buf = 134218498;
      v55 = v40;
      __int16 v56 = 2112;
      id v57 = v45;
      __int16 v58 = 2112;
      v59 = v41;
      _os_log_debug_impl(&dword_2217C1000, v26, OS_LOG_TYPE_DEBUG, "%p %@ updating %@", buf, 0x20u);

      id v8 = v47;
    }

    uint64_t v27 = [v46 arrayByAddingObject:v25];
  }
  else
  {
    id v9 = v45;
    uint64_t v27 = v46;
  }
  id v10 = v49;
  if (v14)
  {
    uint64_t v28 = [(COTimerNotification *)[COTimersRemovedNotification alloc] initWithTimers:v14];
    __int16 v29 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      __int16 v42 = [(COMeshAddOn *)self meshController];
      id v43 = [(COTimerNotification *)v28 timers];
      *(_DWORD *)buf = 134218498;
      v55 = v42;
      __int16 v56 = 2112;
      id v57 = v9;
      __int16 v58 = 2112;
      v59 = v43;
      _os_log_debug_impl(&dword_2217C1000, v29, OS_LOG_TYPE_DEBUG, "%p %@ removing %@", buf, 0x20u);

      id v8 = v47;
    }

    uint64_t v30 = [v27 arrayByAddingObject:v28];

    uint64_t v27 = (void *)v30;
    goto LABEL_30;
  }
LABEL_31:
  if ([v10 count])
  {
    __int16 v31 = [COTimersAddedNotification alloc];
    id v32 = [v10 allValues];
    uint64_t v33 = [(COTimerNotification *)v31 initWithTimers:v32];

    long long v34 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      id v38 = [(COMeshAddOn *)self meshController];
      id v39 = [(COTimerNotification *)v33 timers];
      *(_DWORD *)buf = 134218498;
      v55 = v38;
      __int16 v56 = 2112;
      id v57 = v9;
      __int16 v58 = 2112;
      v59 = v39;
      _os_log_debug_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEBUG, "%p %@ requires %@", buf, 0x20u);

      id v8 = v47;
    }

    uint64_t v35 = [v27 arrayByAddingObject:v33];

    uint64_t v27 = (void *)v35;
  }
  id v36 = v27;

  return v36;
}

- (void)_finishMerge:(id)a3
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v78 = [(COMeshAddOn *)self meshController];
  id v5 = [v78 dispatchQueue];
  dispatch_assert_queue_V2(v5);
  id v6 = [(COMeshTimerAddOn *)self mergeRequest];

  log = COCoreLogForCategory(3);
  BOOL v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v6 != v4)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218240;
      v143 = v78;
      __int16 v144 = 2048;
      id v145 = v4;
      _os_log_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEFAULT, "%p ignoring conclusion of merge %p", buf, 0x16u);
    }
    goto LABEL_92;
  }
  v76 = v5;
  if (v7)
  {
    *(_DWORD *)buf = 134218240;
    v143 = v78;
    __int16 v144 = 2048;
    id v145 = v4;
    _os_log_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEFAULT, "%p completing merge %p...", buf, 0x16u);
  }
  id v77 = v4;

  id v8 = [(COMeshTimerAddOn *)self mergeTimers];
  v92 = self;
  id v9 = [(COMeshTimerAddOn *)self mergeResponses];
  id v94 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  log = v8;
  uint64_t v10 = [log countByEnumeratingWithState:&v130 objects:v141 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v131;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v131 != v12) {
          objc_enumerationMutation(log);
        }
        BOOL v14 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isCurrentTimer", v76) & 1) == 0)
        {
          uint64_t v15 = [v14 timerID];
          [v94 setObject:v14 forKey:v15];
        }
      }
      uint64_t v11 = [log countByEnumeratingWithState:&v130 objects:v141 count:16];
    }
    while (v11);
  }

  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  __int16 v17 = [(COMeshTimerAddOn *)self deletes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v126 objects:v140 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v127;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v127 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v126 + 1) + 8 * j);
        uint64_t v23 = objc_msgSend(v22, "identifier", v76);
        [v16 setObject:v22 forKey:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v126 objects:v140 count:16];
    }
    while (v19);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  obuint64_t j = v9;
  id v93 = v16;
  id v84 = (id)[obj countByEnumeratingWithState:&v122 objects:v139 count:16];
  if (v84)
  {
    uint64_t v81 = *(void *)v123;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v123 != v81) {
          objc_enumerationMutation(obj);
        }
        uint64_t v88 = v24;
        id v25 = objc_msgSend(obj, "objectForKey:", *(void *)(*((void *)&v122 + 1) + 8 * v24), v76);
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        v90 = v25;
        __int16 v26 = [v25 timers];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v118 objects:v138 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v119;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v119 != v29) {
                objc_enumerationMutation(v26);
              }
              __int16 v31 = *(void **)(*((void *)&v118 + 1) + 8 * k);
              if (([v31 isCurrentTimer] & 1) == 0)
              {
                id v32 = [v31 timerID];
                uint64_t v33 = [v94 objectForKey:v32];
                long long v34 = objc_msgSend(v31, "co_preferredTimer:", v33);

                if (v31 == v34) {
                  [v94 setObject:v31 forKey:v32];
                }
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v118 objects:v138 count:16];
          }
          while (v28);
        }

        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        uint64_t v35 = [v90 deletes];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v114 objects:v137 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v115;
          do
          {
            for (uint64_t m = 0; m != v37; ++m)
            {
              if (*(void *)v115 != v38) {
                objc_enumerationMutation(v35);
              }
              __int16 v40 = *(void **)(*((void *)&v114 + 1) + 8 * m);
              id v41 = [v40 identifier];
              __int16 v42 = [v16 objectForKey:v41];
              if (!v42) {
                goto LABEL_45;
              }
              id v43 = [v40 date];
              uint64_t v44 = [v42 date];
              uint64_t v45 = [v43 compare:v44];

              id v16 = v93;
              if (v45 == -1) {
LABEL_45:
              }
                [v16 setObject:v40 forKey:v41];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v114 objects:v137 count:16];
          }
          while (v37);
        }

        uint64_t v24 = v88 + 1;
      }
      while ((id)(v88 + 1) != v84);
      id v84 = (id)[obj countByEnumeratingWithState:&v122 objects:v139 count:16];
    }
    while (v84);
  }

  id v46 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _finishMerge:]();
  }

  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3221225472;
  v112[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke;
  v112[3] = &unk_2645CC748;
  id v47 = v94;
  id v113 = v47;
  [v16 enumerateKeysAndObjectsUsingBlock:v112];
  id v48 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _finishMerge:]();
  }

  v95 = [MEMORY[0x263EFF980] array];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v80 = v47;
  uint64_t v49 = [(COMeshTimerAddOn *)v92 _commandsForReconciling:log toTruth:v47 forNode:0];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v108 objects:v136 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v109;
    do
    {
      for (uint64_t n = 0; n != v51; ++n)
      {
        if (*(void *)v109 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v54 = *(void *)(*((void *)&v108 + 1) + 8 * n);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = v107;
          v107[0] = MEMORY[0x263EF8330];
          v107[1] = 3221225472;
          __int16 v56 = __33__COMeshTimerAddOn__finishMerge___block_invoke_143;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v55 = v106;
            v106[0] = MEMORY[0x263EF8330];
            v106[1] = 3221225472;
            __int16 v56 = __33__COMeshTimerAddOn__finishMerge___block_invoke_2;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            v55 = v105;
            v105[0] = MEMORY[0x263EF8330];
            v105[1] = 3221225472;
            __int16 v56 = __33__COMeshTimerAddOn__finishMerge___block_invoke_3;
          }
        }
        v55[2] = v56;
        v55[3] = &unk_2645CAE80;
        v55[4] = v92;
        v55[5] = v54;
        id v57 = (void *)MEMORY[0x223C8B4A0]();
        [v95 addObject:v57];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v108 objects:v136 count:16];
    }
    while (v51);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v102 = 0u;
  long long v101 = 0u;
  id v85 = obj;
  v59 = v92;
  __int16 v58 = v93;
  uint64_t v82 = [v85 countByEnumeratingWithState:&v101 objects:v135 count:16];
  if (v82)
  {
    uint64_t v79 = *(void *)v102;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v102 != v79) {
          objc_enumerationMutation(v85);
        }
        uint64_t v61 = *(void **)(*((void *)&v101 + 1) + 8 * v60);
        v62 = objc_msgSend(v85, "objectForKey:", v61, v76);
        v89 = v62;
        uint64_t v91 = v60;
        if ([v62 notModified])
        {
          v63 = log;
          v64 = COCoreLogForCategory(3);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v143 = v78;
            __int16 v144 = 2112;
            id v145 = v61;
            _os_log_debug_impl(&dword_2217C1000, v64, OS_LOG_TYPE_DEBUG, "%p response is not-modified for %@", buf, 0x16u);
          }
        }
        else
        {
          v63 = [v62 timers];
        }
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        obja = v63;
        v65 = [(COMeshTimerAddOn *)v59 _commandsForReconciling:v63 toTruth:v80 forNode:v61];
        uint64_t v66 = [v65 countByEnumeratingWithState:&v97 objects:v134 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v68 = *(void *)v98;
          do
          {
            for (iuint64_t i = 0; ii != v67; ++ii)
            {
              if (*(void *)v98 != v68) {
                objc_enumerationMutation(v65);
              }
              uint64_t v70 = *(void *)(*((void *)&v97 + 1) + 8 * ii);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v96[0] = MEMORY[0x263EF8330];
                v96[1] = 3221225472;
                v96[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke_145;
                v96[3] = &unk_2645CAEF8;
                v96[4] = v59;
                v96[5] = v70;
                v96[6] = v61;
                v71 = (void *)MEMORY[0x223C8B4A0](v96);
                [v95 addObject:v71];

                v59 = v92;
              }
            }
            uint64_t v67 = [v65 countByEnumeratingWithState:&v97 objects:v134 count:16];
          }
          while (v67);
        }

        uint64_t v60 = v91 + 1;
        __int16 v58 = v93;
      }
      while (v91 + 1 != v82);
      uint64_t v82 = [v85 countByEnumeratingWithState:&v101 objects:v135 count:16];
    }
    while (v82);
  }

  [(COMeshTimerAddOn *)v59 setMergeRequest:0];
  [(COMeshTimerAddOn *)v59 setMergeTimers:0];
  id v72 = objc_alloc_init(NSDictionary);
  [(COMeshTimerAddOn *)v59 setMergeResponses:v72];

  id v73 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  [(COMeshTimerAddOn *)v59 setMergingNodes:v73];

  v74 = [(COMeshTimerAddOn *)v59 queuedCommands];
  [v95 addObjectsFromArray:v74];

  [(COMeshTimerAddOn *)v59 setQueuedCommands:v95];
  v75 = COCoreLogForCategory(3);
  id v4 = v77;
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v143 = v78;
    __int16 v144 = 2048;
    id v145 = v77;
    _os_log_impl(&dword_2217C1000, v75, OS_LOG_TYPE_DEFAULT, "%p concluded merge %p", buf, 0x16u);
  }

  [(COMeshTimerAddOn *)v59 _processQueuedCommands];
  id v5 = v76;
LABEL_92:
}

void __33__COMeshTimerAddOn__finishMerge___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3) {
    [*(id *)(a1 + 32) removeObjectForKey:v4];
  }
}

uint64_t __33__COMeshTimerAddOn__finishMerge___block_invoke_143(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTimersUpdatedNotification:*(void *)(a1 + 40)];
}

uint64_t __33__COMeshTimerAddOn__finishMerge___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTimersAddedNotification:*(void *)(a1 + 40)];
}

uint64_t __33__COMeshTimerAddOn__finishMerge___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTimersRemovedNotification:*(void *)(a1 + 40)];
}

void __33__COMeshTimerAddOn__finishMerge___block_invoke_145(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) meshController];
  [v2 sendCommand:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 48)];
}

- (void)_reloadIndexWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshTimerAddOn *)self observedTimerManager];
  id v6 = [v5 timers];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke;
  v14[3] = &unk_2645CB3E0;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v15 = v7;
  id v8 = (id)[v6 addFailureBlock:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_2;
  v11[3] = &unk_2645CC770;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = (id)[v6 addSuccessBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_cold_1();
    }

    id v6 = [WeakRetained meshControllerQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_146;
    v7[3] = &unk_2645CBA10;
    void v7[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

uint64_t __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_146(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimerIndex:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v17 = v3;
    id v5 = v3;
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isCurrentTimer", v17) & 1) == 0)
          {
            id v13 = [v12 timerID];
            BOOL v14 = [v12 lastModifiedDate];
            if (!v14)
            {
              BOOL v14 = [MEMORY[0x263EFF910] distantPast];
            }
            [v6 setObject:v14 forKey:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v15 = [WeakRetained meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_3;
    block[3] = &unk_2645CB330;
    void block[4] = WeakRetained;
    id v19 = v6;
    id v20 = *(id *)(a1 + 32);
    id v16 = v6;
    dispatch_async(v15, block);

    id v3 = v17;
  }
}

uint64_t __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) timerIndex];
  int v3 = [v2 isEqualToDictionary:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setTimerIndex:*(void *)(a1 + 40)];
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = "yes";
    uint64_t v6 = *(void *)(a1 + 32);
    if (v3) {
      id v5 = "no";
    }
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    uint64_t v11 = v5;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p timer index reloaded; updated: %s",
      (uint8_t *)&v8,
      0x16u);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, v3 ^ 1u);
  }
  return result;
}

- (void)_processQueuedCommands
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = [(COMeshTimerAddOn *)self queuedCommands];
  [(COMeshTimerAddOn *)self setQueuedCommands:MEMORY[0x263EFFA68]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_addTimerDeleteEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshTimerAddOn *)self deletes];
  uint64_t v6 = [v5 arrayByAddingObject:v4];

  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v8 = [MEMORY[0x263EFF910] now];
  long long v9 = [v7 dateByAddingUnit:16 value:-2 toDate:v8 options:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__COMeshTimerAddOn__addTimerDeleteEvent___block_invoke;
  v14[3] = &unk_2645CC798;
  id v15 = v9;
  id v10 = v9;
  long long v11 = [v6 indexesOfObjectsPassingTest:v14];
  if ([v11 count])
  {
    long long v12 = (void *)[v6 mutableCopy];
    [v12 removeObjectsAtIndexes:v11];

    uint64_t v6 = v12;
  }
  id v13 = [v6 sortedArrayUsingSelector:sel_compare_];
  [(COMeshTimerAddOn *)self setDeletes:v13];
}

BOOL __41__COMeshTimerAddOn__addTimerDeleteEvent___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 date];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == -1;

  return v4;
}

- (id)timers
{
  BOOL v3 = [(COMeshTimerAddOn *)self performsLocalActions];
  return [(COMeshTimerAddOn *)self _timersForAccessoryIdentifier:0 allowLocalStorage:v3];
}

- (id)addTimer:(id)a3
{
  return [(COMeshTimerAddOn *)self addTimer:a3 client:0 member:0];
}

- (id)addTimer:(id)a3 client:(id)a4 member:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(COTimerRequest *)[COTimerCreateRequest alloc] initWithTimer:v8];
  long long v12 = [(COMeshAddOn *)self meshController];
  id v43 = v8;
  if ([(COMeshTimerAddOn *)self performsLocalActions]
    && ([v12 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    long long v34 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [(COMeshAddOn *)self meshController];
      uint64_t v36 = [v43 timerID];
      *(_DWORD *)buf = 134218242;
      id v57 = v35;
      __int16 v58 = 2112;
      v59 = v36;
      _os_log_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEFAULT, "%p directly add a timer %@", buf, 0x16u);
    }
    id v37 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v38 = [v12 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    uint64_t v26 = &off_22188F000;
    block[1] = 3221225472;
    block[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    long long v53 = v11;
    id v27 = v37;
    id v54 = v27;
    id v55 = v12;
    dispatch_async(v38, block);

    char v31 = 1;
  }
  else
  {
    uint64_t v14 = COCoreLogForCategory(3);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      id v41 = v11;
      if (v15)
      {
        id v16 = [v8 timerID];
        *(_DWORD *)buf = 134218242;
        id v57 = v12;
        __int16 v58 = 2112;
        v59 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to add %@", buf, 0x16u);
      }
      id v17 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v18 = [[COMTTimerCreateAction alloc] initWithTimer:v8];
      id v19 = [v9 clientLifetimeActivity];
      id v20 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:v19];

      if (v20) {
        nw_activity_activate();
      }
      id v42 = v9;
      long long v21 = [v9 clientBundleIdentifier];
      if (![v21 length])
      {
        long long v22 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v23 = [v22 bundleIdentifier];

        long long v21 = (void *)v23;
      }
      long long v24 = [(COMeshTimerAddOn *)self actionDirector];
      id v25 = [MEMORY[0x263EFFA08] setWithObject:v10];
      v46[0] = MEMORY[0x263EF8330];
      uint64_t v26 = &off_22188F000;
      v46[1] = 3221225472;
      v46[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_155;
      v46[3] = &unk_2645CAF48;
      id v47 = v20;
      id v48 = v18;
      id v49 = v21;
      id v27 = v17;
      id v50 = v27;
      id v51 = v12;
      id v28 = v21;
      uint64_t v29 = v18;
      id v30 = v20;
      [v24 requestAction:v29 members:v25 activity:v30 withCompletion:v46];

      char v31 = 0;
      long long v11 = v41;
      id v9 = v42;
    }
    else
    {
      if (v15)
      {
        id v32 = [(COMeshAddOn *)self meshController];
        uint64_t v33 = [v8 timerID];
        *(_DWORD *)buf = 134218242;
        id v57 = v32;
        __int16 v58 = 2112;
        v59 = v33;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to add a timer %@", buf, 0x16u);
      }
      id v27 = [(COMeshTimerAddOn *)self _sendRequest:v11 client:v9];
      char v31 = 0;
      uint64_t v26 = &off_22188F000;
    }
  }
  id v39 = [(COMeshTimerAddOn *)self recorder];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = *((void *)v26 + 441);
  v44[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_156;
  v44[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v45 = v31;
  ((void (**)(void, uint64_t, void *))v39)[2](v39, 0x26D3D5C68, v44);

  return v27;
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleTimerCreateRequest:v3 callback:v4];
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v7, "command", (const char *)[v9 UTF8String]);

      xpc_dictionary_set_string(v7, "client", (const char *)[*(id *)(a1 + 48) UTF8String]);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v6)
  {
    id v10 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_155_cold_1();
    }

    [*(id *)(a1 + 56) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

id __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_156(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"timer", @"create", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)updateTimer:(id)a3
{
  return [(COMeshTimerAddOn *)self updateTimer:a3 client:0 member:0];
}

- (id)updateTimer:(id)a3 client:(id)a4 member:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(COTimerRequest *)[COTimerUpdateRequest alloc] initWithTimer:v8];
  long long v12 = [(COMeshAddOn *)self meshController];
  id v43 = v8;
  if ([(COMeshTimerAddOn *)self performsLocalActions]
    && ([v12 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    long long v34 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [(COMeshAddOn *)self meshController];
      uint64_t v36 = [v43 timerID];
      *(_DWORD *)buf = 134218242;
      id v57 = v35;
      __int16 v58 = 2112;
      v59 = v36;
      _os_log_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEFAULT, "%p directly update a timer %@", buf, 0x16u);
    }
    id v37 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v38 = [v12 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    uint64_t v26 = &off_22188F000;
    block[1] = 3221225472;
    block[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    long long v53 = v11;
    id v27 = v37;
    id v54 = v27;
    id v55 = v12;
    dispatch_async(v38, block);

    char v31 = 1;
  }
  else
  {
    uint64_t v14 = COCoreLogForCategory(3);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      id v41 = v11;
      if (v15)
      {
        id v16 = [v8 timerID];
        *(_DWORD *)buf = 134218242;
        id v57 = v12;
        __int16 v58 = 2112;
        v59 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to update %@", buf, 0x16u);
      }
      id v17 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v18 = [[COMTTimerUpdateAction alloc] initWithTimer:v8];
      id v19 = [v9 clientLifetimeActivity];
      id v20 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:v19];

      if (v20) {
        nw_activity_activate();
      }
      id v42 = v9;
      long long v21 = [v9 clientBundleIdentifier];
      if (![v21 length])
      {
        long long v22 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v23 = [v22 bundleIdentifier];

        long long v21 = (void *)v23;
      }
      long long v24 = [(COMeshTimerAddOn *)self actionDirector];
      id v25 = [MEMORY[0x263EFFA08] setWithObject:v10];
      v46[0] = MEMORY[0x263EF8330];
      uint64_t v26 = &off_22188F000;
      v46[1] = 3221225472;
      v46[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_158;
      v46[3] = &unk_2645CAF48;
      id v47 = v20;
      id v48 = v18;
      id v49 = v21;
      id v27 = v17;
      id v50 = v27;
      id v51 = v12;
      id v28 = v21;
      uint64_t v29 = v18;
      id v30 = v20;
      [v24 requestAction:v29 members:v25 activity:v30 withCompletion:v46];

      char v31 = 0;
      long long v11 = v41;
      id v9 = v42;
    }
    else
    {
      if (v15)
      {
        id v32 = [(COMeshAddOn *)self meshController];
        uint64_t v33 = [v8 timerID];
        *(_DWORD *)buf = 134218242;
        id v57 = v32;
        __int16 v58 = 2112;
        v59 = v33;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to update a timer %@", buf, 0x16u);
      }
      id v27 = [(COMeshTimerAddOn *)self _sendRequest:v11 client:v9];
      char v31 = 0;
      uint64_t v26 = &off_22188F000;
    }
  }
  id v39 = [(COMeshTimerAddOn *)self recorder];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = *((void *)v26 + 441);
  v44[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_159;
  v44[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v45 = v31;
  ((void (**)(void, uint64_t, void *))v39)[2](v39, 0x26D3D5C68, v44);

  return v27;
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleTimerUpdateRequest:v3 callback:v4];
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    xpc_object_t v7 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v7, "command", (const char *)[v9 UTF8String]);

      xpc_dictionary_set_string(v7, "client", (const char *)[*(id *)(a1 + 48) UTF8String]);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v6)
  {
    id v10 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_158_cold_1();
    }

    [*(id *)(a1 + 56) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

id __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_159(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"timer", @"update", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)removeTimer:(id)a3
{
  return [(COMeshTimerAddOn *)self removeTimer:a3 client:0 member:0];
}

- (id)removeTimer:(id)a3 client:(id)a4 member:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(COTimerRequest *)[COTimerDeleteRequest alloc] initWithTimer:v8];
  long long v12 = [(COMeshAddOn *)self meshController];
  id v47 = v8;
  if ([(COMeshTimerAddOn *)self performsLocalActions]
    && ([v12 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    uint64_t v38 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = [(COMeshAddOn *)self meshController];
      __int16 v40 = [v8 timerID];
      *(_DWORD *)buf = 134218242;
      uint64_t v61 = v39;
      __int16 v62 = 2112;
      v63 = v40;
      _os_log_impl(&dword_2217C1000, v38, OS_LOG_TYPE_DEFAULT, "%p directly remove a timer %@", buf, 0x16u);
    }
    id v41 = objc_alloc_init(MEMORY[0x263F58190]);
    id v42 = [v12 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    id v25 = v12;
    id v30 = &off_22188F000;
    block[1] = 3221225472;
    block[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    id v57 = v11;
    id v31 = v41;
    id v58 = v31;
    id v59 = v25;
    dispatch_async(v42, block);

    char v35 = 1;
  }
  else
  {
    uint64_t v14 = COCoreLogForCategory(3);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      char v45 = v11;
      if (v15)
      {
        id v16 = [v8 timerID];
        *(_DWORD *)buf = 134218242;
        uint64_t v61 = v12;
        __int16 v62 = 2112;
        v63 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to remove %@", buf, 0x16u);
      }
      id v17 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      id v20 = [v8 timerID];
      long long v21 = +[COMTDeleteAction actionWithTargetType:v19 targetIdentifier:v20];

      long long v22 = [v9 clientLifetimeActivity];
      uint64_t v23 = +[CONetworkActivityFactory activityWithLabel:4 parentActivity:v22];

      if (v23) {
        nw_activity_activate();
      }
      id v46 = v9;
      long long v24 = [v9 clientBundleIdentifier];
      id v25 = v12;
      if (![v24 length])
      {
        uint64_t v26 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v27 = [v26 bundleIdentifier];

        long long v24 = (void *)v27;
      }
      id v28 = [(COMeshTimerAddOn *)self actionDirector];
      uint64_t v29 = [MEMORY[0x263EFFA08] setWithObject:v10];
      v50[0] = MEMORY[0x263EF8330];
      id v30 = &off_22188F000;
      v50[1] = 3221225472;
      v50[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_161;
      v50[3] = &unk_2645CAF48;
      id v51 = v23;
      id v52 = v21;
      id v53 = v24;
      id v31 = v17;
      id v54 = v31;
      id v55 = v25;
      id v32 = v24;
      id v33 = v21;
      id v34 = v23;
      [v28 requestAction:v33 members:v29 activity:v34 withCompletion:v50];

      char v35 = 0;
      long long v11 = v45;
      id v9 = v46;
    }
    else
    {
      id v25 = v12;
      if (v15)
      {
        uint64_t v36 = [(COMeshAddOn *)self meshController];
        id v37 = [v47 timerID];
        *(_DWORD *)buf = 134218242;
        uint64_t v61 = v36;
        __int16 v62 = 2112;
        v63 = v37;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to remove a timer %@", buf, 0x16u);
      }
      id v31 = [(COMeshTimerAddOn *)self _sendRequest:v11 client:v9];
      char v35 = 0;
      id v30 = &off_22188F000;
    }
  }
  id v43 = [(COMeshTimerAddOn *)self recorder];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = *((void *)v30 + 441);
  v48[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_162;
  v48[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v49 = v35;
  ((void (**)(void, uint64_t, void *))v43)[2](v43, 0x26D3D5C68, v48);

  return v31;
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleTimerDeleteRequest:v3 callback:v4];
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    xpc_object_t v7 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v7, "command", (const char *)[v9 UTF8String]);

      xpc_dictionary_set_string(v7, "client", (const char *)[*(id *)(a1 + 48) UTF8String]);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v6)
  {
    id v10 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_161_cold_1();
    }

    [*(id *)(a1 + 56) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

id __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_162(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"timer", @"delete", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  return [(COMeshTimerAddOn *)self dismissTimerWithIdentifier:a3 client:0];
}

- (id)dismissTimerWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[COTimerDismissRequest alloc] initWithTimerIdentifier:v6];
  id v9 = [(COMeshAddOn *)self meshController];
  if ([(COMeshTimerAddOn *)self performsLocalActions]
    && ([v9 leader], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    long long v22 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [(COMeshAddOn *)self meshController];
      *(_DWORD *)buf = 134218242;
      char v35 = v23;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "%p directly dismiss a timer %@", buf, 0x16u);
    }
    id v24 = objc_alloc_init(MEMORY[0x263F58190]);
    id v25 = [v9 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    id v13 = (id *)&v31;
    id v31 = v8;
    id v18 = v24;
    id v32 = v18;
    id v33 = v9;
    dispatch_async(v25, block);

    char v19 = 1;
  }
  else
  {
    long long v11 = [(COMeshTimerAddOn *)self timerManager];
    long long v12 = [v11 dismissTimerWithIdentifier:v6];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_163;
    v28[3] = &unk_2645CC7E0;
    v28[4] = self;
    id v13 = &v29;
    id v14 = v6;
    id v29 = v14;
    id v15 = (id)[v12 addCompletionBlock:v28];

    id v16 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(COMeshAddOn *)self meshController];
      *(_DWORD *)buf = 134218242;
      char v35 = v17;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%p requesting leader to dismiss a timer %@", buf, 0x16u);
    }
    id v18 = [(COMeshTimerAddOn *)self _sendRequest:v8 client:v7];
    char v19 = 0;
  }

  id v20 = [(COMeshTimerAddOn *)self recorder];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_165;
  v26[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v27 = v19;
  ((void (**)(void, uint64_t, void *))v20)[2](v20, 0x26D3D5C68, v26);

  return v18;
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleTimerDismissRequest:v3 callback:v4];
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_163(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COCoreLogForCategory(3);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_163_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) meshController];
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134218242;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p early dismissed %@.", (uint8_t *)&v9, 0x16u);
  }
}

id __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_165(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"timer", @"dismiss", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (BOOL)_isTimer:(id)a3 targetingAccessory:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = [(COMeshTimerAddOn *)self homekit];
    int v9 = [v8 homeForAccessory:v6];
    if (v9)
    {
      id v10 = [v8 identifiersForAccessoriesAssociatedWithAccessory:v6 inHome:v9];
    }
    else
    {
      uint64_t v12 = [v6 uniqueIdentifier];
      v14[0] = v12;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    }
    BOOL v11 = [(COMeshTimerAddOn *)self _isTimer:v7 targetingAccessoryIdentifiers:v10];
  }
  else
  {
    BOOL v11 = [(COMeshTimerAddOn *)self _isTimer:v7 targetingAccessoryIdentifiers:0];
    uint64_t v8 = v7;
  }

  return v11;
}

- (void)handleTimerReadRequest:(id)a3 callback:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, COMeshResponse *, void))a4;
  uint64_t v8 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [v6 accessoryUniqueIdentifier];
  id v10 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [(COMeshAddOn *)self meshController];
    *(_DWORD *)buf = 134218242;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p retrieving timers for %@...", buf, 0x16u);
  }
  int v12 = [v6 requiresFilter];
  char v13 = v12;
  id v14 = 0;
  if (v12 && v9)
  {
    id v15 = [(COMeshTimerAddOn *)self homekit];
    uint64_t v16 = [v15 accessoryWithUniqueIdentifier:v9];
    if (!v16)
    {
      id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
      long long v22 = [[COMeshResponse alloc] initWithError:v18];
      v7[2](v7, v22, 0);
      goto LABEL_11;
    }
    id v14 = (void *)v16;
  }
  if ([(COMeshTimerAddOn *)self performsLocalActions])
  {
    id v17 = [(COMeshTimerAddOn *)self timerManager];
    id v18 = [v17 timers];
  }
  else
  {
    id v18 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke;
  v29[3] = &unk_2645CC808;
  char v19 = v7;
  id v30 = v19;
  id v20 = (id)[v18 addFailureBlock:v29];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_167;
  v23[3] = &unk_2645CC830;
  char v28 = v13;
  id v24 = v14;
  id v25 = self;
  id v26 = v6;
  char v27 = v19;
  id v15 = v14;
  id v21 = (id)[v18 addSuccessBlock:v23];

  long long v22 = v30;
LABEL_11:
}

void __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_167(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_2;
    char v27 = &unk_2645CC458;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v28 = v4;
    uint64_t v29 = v5;
    id v6 = [v3 indexesOfObjectsPassingTest:&v24];
    if (objc_msgSend(v6, "count", v24, v25, v26, v27))
    {
      id v7 = (void *)[v3 mutableCopy];
      [v7 removeObjectsAtIndexes:v6];

      id v3 = v7;
    }
    uint64_t v8 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v3;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "... returning filtered timers list\n%@", buf, 0xCu);
    }

    int v9 = [[COTimerReadResponse alloc] initWithFilteredTimers:v3];
    goto LABEL_17;
  }
  if (([*(id *)(a1 + 48) isForMerge] & 1) == 0)
  {
    int v12 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v3;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "... returning timers list\n%@", buf, 0xCu);
    }

    BOOL v11 = [[COTimerReadResponse alloc] initWithTimers:v3];
    goto LABEL_16;
  }
  if (![*(id *)(a1 + 40) performsLocalActions]
    || [MEMORY[0x263F33F80] isDistributedTimersEnabled])
  {
    id v10 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "... returning skip-in-merge", buf, 2u);
    }

    BOOL v11 = [[COTimerReadResponse alloc] initWithSkipInMerge];
LABEL_16:
    int v9 = v11;
    goto LABEL_17;
  }
  uint64_t v13 = [*(id *)(a1 + 48) eTag];
  if (!v13) {
    goto LABEL_23;
  }
  id v14 = (void *)v13;
  id v15 = [*(id *)(a1 + 48) eTag];
  uint64_t v16 = eTagForTimers(v3);
  int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    id v18 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "... returning not-modified", buf, 2u);
    }

    char v19 = [COTimerReadResponse alloc];
    id v20 = [*(id *)(a1 + 40) deletes];
    uint64_t v21 = [(COTimerReadResponse *)v19 initNotModifiedWithDeletes:v20];
  }
  else
  {
LABEL_23:
    long long v22 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v3;
      _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "... returning alarms list and deletes\n%@", buf, 0xCu);
    }

    uint64_t v23 = [COTimerReadResponse alloc];
    id v20 = [*(id *)(a1 + 40) deletes];
    uint64_t v21 = [(COTimerReadResponse *)v23 initWithTimers:v3 deletes:v20];
  }
  int v9 = (COTimerReadResponse *)v21;

LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 40), "_isTimer:targetingAccessory:", a2);
  }
  else
  {
    id v3 = [a2 siriContext];
    id v4 = [v3 objectForKey:*MEMORY[0x263F33F28]];
    int v2 = v4 == 0;
  }
  return v2 ^ 1u;
}

- (void)handleTimerCreateRequest:(id)a3 callback:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  int v9 = [v8 dispatchQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [v7 timer];

  BOOL v11 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v10 timerID];
    *(_DWORD *)buf = 134218242;
    id v31 = v8;
    __int16 v32 = 2112;
    __int16 v33 = v12;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p adding timer %@...", buf, 0x16u);
  }
  if ([(COMeshTimerAddOn *)self performsLocalActions])
  {
    uint64_t v13 = [(COMeshTimerAddOn *)self timerManager];
    [v13 addTimer:v10];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F58190];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    [v14 futureWithError:v13];
  id v15 = };

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke;
  v27[3] = &unk_2645CC858;
  id v16 = v10;
  id v28 = v16;
  id v17 = v6;
  id v29 = v17;
  id v18 = (id)[v15 addFailureBlock:v27];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_168;
  v23[3] = &unk_2645CC880;
  id v25 = v8;
  id v26 = v17;
  id v24 = v16;
  id v19 = v8;
  id v20 = v17;
  id v21 = v16;
  id v22 = (id)[v15 addSuccessBlock:v23];
}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_168(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) timerID];
    *(_DWORD *)buf = 138412290;
    int v12 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "... timer (%@) create completed", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v4 + 16))(v4, v5, 0);

  id v6 = [COTimersAddedNotification alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  uint64_t v8 = [(COTimerNotification *)v6 initWithTimers:v7];

  int v9 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_168_cold_1(a1, (id *)(a1 + 32));
  }

  [*(id *)(a1 + 40) sendNotification:v8];
}

- (void)handleTimerUpdateRequest:(id)a3 callback:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  int v9 = [v8 dispatchQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v7 timer];

  BOOL v11 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v10 timerID];
    *(_DWORD *)buf = 134218242;
    id v31 = v8;
    __int16 v32 = 2112;
    __int16 v33 = v12;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p updating timer %@...", buf, 0x16u);
  }
  if ([(COMeshTimerAddOn *)self performsLocalActions])
  {
    uint64_t v13 = [(COMeshTimerAddOn *)self timerManager];
    [v13 updateTimer:v10];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F58190];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    [v14 futureWithError:v13];
  id v15 = };

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke;
  v27[3] = &unk_2645CC858;
  id v16 = v10;
  id v28 = v16;
  id v17 = v6;
  id v29 = v17;
  id v18 = (id)[v15 addFailureBlock:v27];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_169;
  v23[3] = &unk_2645CC880;
  id v25 = v8;
  id v26 = v17;
  id v24 = v16;
  id v19 = v8;
  id v20 = v17;
  id v21 = v16;
  id v22 = (id)[v15 addSuccessBlock:v23];
}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_169(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) timerID];
    *(_DWORD *)buf = 138412290;
    int v12 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "... timer (%@) update completed", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v4 + 16))(v4, v5, 0);

  id v6 = [COTimersUpdatedNotification alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  uint64_t v8 = [(COTimerNotification *)v6 initWithTimers:v7];

  int v9 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_169_cold_1(a1, (id *)(a1 + 32));
  }

  [*(id *)(a1 + 40) sendNotification:v8];
}

- (void)handleTimerDeleteRequest:(id)a3 callback:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  int v9 = [v8 dispatchQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v7 timer];

  BOOL v11 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v10 timerID];
    *(_DWORD *)buf = 134218242;
    __int16 v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v12;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p delete timer %@...", buf, 0x16u);
  }
  if ([(COMeshTimerAddOn *)self performsLocalActions])
  {
    uint64_t v13 = [(COMeshTimerAddOn *)self timerManager];
    [v13 removeTimer:v10];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F58190];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    [v14 futureWithError:v13];
  id v15 = };

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke;
  v28[3] = &unk_2645CC858;
  id v16 = v10;
  id v29 = v16;
  id v17 = v6;
  id v30 = v17;
  id v18 = (id)[v15 addFailureBlock:v28];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_170;
  v23[3] = &unk_2645CC8A8;
  id v24 = v16;
  id v25 = self;
  id v26 = v8;
  id v27 = v17;
  id v19 = v8;
  id v20 = v17;
  id v21 = v16;
  id v22 = (id)[v15 addSuccessBlock:v23];
}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_170(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) timerID];
  uint64_t v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "... timer (%@) delete completed", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [COTimerDeleteEvent alloc];
  id v7 = [MEMORY[0x263EFF910] now];
  uint64_t v8 = [(COTimerDeleteEvent *)v6 initWithIdentifier:v3 date:v7];
  [v5 _addTimerDeleteEvent:v8];

  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v9 + 16))(v9, v10, 0);

  BOOL v11 = [COTimersRemovedNotification alloc];
  uint64_t v15 = *(void *)(a1 + 32);
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  uint64_t v13 = [(COTimerNotification *)v11 initWithTimers:v12];

  id v14 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_170_cold_1(a1, v2);
  }

  [*(id *)(a1 + 48) sendNotification:v13];
}

- (void)handleTimerDismissRequest:(id)a3 callback:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  uint64_t v9 = [v8 dispatchQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v6 identifier];
  BOOL v11 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p dismiss timer %@...", buf, 0x16u);
  }

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v47 = __Block_byref_object_copy__11;
  id v48 = __Block_byref_object_dispose__11;
  id v49 = 0;
  int v12 = [(COMeshTimerAddOn *)self timerManager];
  uint64_t v13 = [v12 dismissTimerWithIdentifier:v10];
  id v14 = [v12 timers];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke;
  v39[3] = &unk_2645CC8D0;
  id v42 = v44;
  id v43 = buf;
  id v15 = v8;
  id v40 = v15;
  id v41 = self;
  id v16 = (void *)MEMORY[0x223C8B4A0](v39);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_174;
  v36[3] = &unk_2645CC858;
  id v17 = v10;
  id v37 = v17;
  id v18 = v7;
  id v38 = v18;
  id v19 = (id)[v13 addFailureBlock:v36];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_175;
  v31[3] = &unk_2645CC8F8;
  id v20 = v17;
  id v32 = v20;
  id v21 = v18;
  id v33 = v21;
  uint64_t v35 = v44;
  id v22 = v16;
  id v34 = v22;
  id v23 = (id)[v13 addSuccessBlock:v31];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_176;
  v27[3] = &unk_2645CC948;
  id v24 = v20;
  id v28 = v24;
  id v30 = buf;
  id v25 = v22;
  id v29 = v25;
  id v26 = (id)[v14 addSuccessBlock:v27];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v44, 8);
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = a1 + 56;
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v3 = [COTimerFiringTimerDismissedNotification alloc];
      v11[0] = *(void *)(*(void *)(*(void *)v2 + 8) + 40);
      uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      uint64_t v5 = [(COTimerNotification *)v3 initWithTimers:v4];

      id v6 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_cold_1(a1, v2);
      }

      [*(id *)(a1 + 32) sendNotification:v5];
      id v7 = [*(id *)(a1 + 40) delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
        [v7 timerAddOn:v8 didDismissTimers:v9];
      }
    }
  }
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_174(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_174_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

uint64_t __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_175(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "... timer (%@) dismiss completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = a1[5];
  uint64_t v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v4 + 16))(v4, v5, 0);

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_176(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_2;
  v6[3] = &unk_2645CC920;
  id v7 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 timerIDString];
  int v8 = [v7 isEqualToString:a1[4]];
  *a4 = v8;

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)handleTimersAddedNotification:(id)a3
{
  id v4 = a3;
  long long v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  id v6 = [v4 timers];

  if ([v6 count])
  {
    if ([(COMeshTimerAddOn *)self performsLocalActions])
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      int v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
      id v9 = [(COMeshTimerAddOn *)self timerManager];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke;
      v16[3] = &unk_2645CC970;
      void v16[4] = self;
      id v17 = v7;
      id v18 = v9;
      id v10 = v9;
      id v11 = v7;
      [v6 enumerateObjectsUsingBlock:v16];
      int v12 = [MEMORY[0x263F58190] combineAllFutures:v11 ignoringErrors:1 scheduler:v8];
    }
    else
    {
      int v12 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke_179;
    v14[3] = &unk_2645CC998;
    void v14[4] = self;
    id v15 = v6;
    id v13 = (id)[v12 addSuccessBlock:v14];
  }
  else
  {
    int v12 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn handleTimersAddedNotification:]();
    }
  }
}

void __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 timerID];
    int v9 = 134218242;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    int v12 = v6;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p adding local timer %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = *(void **)(a1 + 40);
  int v8 = [*(id *)(a1 + 48) addTimer:v3];
  [v7 addObject:v8];
}

void __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke_179(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished adding local timers", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 timerAddOn:*(void *)(a1 + 32) didAddTimers:*(void *)(a1 + 40)];
  }
}

- (void)handleTimersRemovedNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  uint64_t v6 = [v4 timers];

  if ([v6 count])
  {
    if ([(COMeshTimerAddOn *)self performsLocalActions])
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      int v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
      int v9 = [MEMORY[0x263EFF910] now];
      uint64_t v10 = [(COMeshTimerAddOn *)self timerManager];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke;
      v18[3] = &unk_2645CC9C0;
      void v18[4] = self;
      id v19 = v9;
      id v20 = v7;
      id v21 = v10;
      id v11 = v10;
      id v12 = v7;
      id v13 = v9;
      [v6 enumerateObjectsUsingBlock:v18];
      id v14 = [MEMORY[0x263F58190] combineAllFutures:v12 ignoringErrors:1 scheduler:v8];
    }
    else
    {
      id v14 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke_181;
    v16[3] = &unk_2645CC998;
    void v16[4] = self;
    id v17 = v6;
    id v15 = (id)[v14 addSuccessBlock:v16];
  }
  else
  {
    id v14 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn handleTimersRemovedNotification:]();
    }
  }
}

void __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 timerID];
  int v5 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 134218242;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p removing local timer %@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = *(void **)(a1 + 32);
  int v8 = [[COTimerDeleteEvent alloc] initWithIdentifier:v4 date:*(void *)(a1 + 40)];
  [v7 _addTimerDeleteEvent:v8];

  int v9 = *(void **)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 56) removeTimer:v3];

  [v9 addObject:v10];
}

void __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke_181(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished removing local timers", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 timerAddOn:*(void *)(a1 + 32) didRemoveTimers:*(void *)(a1 + 40)];
  }
}

- (void)handleTimersUpdatedNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  uint64_t v6 = [v4 timers];

  if ([v6 count])
  {
    if ([(COMeshTimerAddOn *)self performsLocalActions])
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      int v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
      int v9 = [(COMeshTimerAddOn *)self timerManager];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke;
      v16[3] = &unk_2645CC970;
      void v16[4] = self;
      id v17 = v7;
      id v18 = v9;
      id v10 = v9;
      id v11 = v7;
      [v6 enumerateObjectsUsingBlock:v16];
      uint64_t v12 = [MEMORY[0x263F58190] combineAllFutures:v11 ignoringErrors:1 scheduler:v8];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke_182;
    v14[3] = &unk_2645CC998;
    void v14[4] = self;
    id v15 = v6;
    id v13 = (id)[v12 addSuccessBlock:v14];
  }
  else
  {
    uint64_t v12 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn handleTimersUpdatedNotification:]();
    }
  }
}

void __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 timerID];
    int v9 = 134218242;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p updating local timer %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = *(void **)(a1 + 40);
  int v8 = [*(id *)(a1 + 48) updateTimer:v3];
  [v7 addObject:v8];
}

void __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke_182(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished updating local timers", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 timerAddOn:*(void *)(a1 + 32) didUpdateTimers:*(void *)(a1 + 40)];
  }
}

- (void)handleTimerFiredNotification:(id)a3
{
  id v6 = a3;
  if (![(COMeshTimerAddOn *)self performsLocalActions])
  {
    id v4 = [(COMeshTimerAddOn *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      int v5 = [v6 timers];
      [v4 timerAddOn:self didUpdateTimers:v5];
    }
  }
}

- (void)handleTimerFiringTimerDismissedNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  id v6 = [v4 timers];

  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
    int v9 = [(COMeshTimerAddOn *)self timerManager];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke;
    v16[3] = &unk_2645CC970;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v9;
    id v10 = v9;
    id v11 = v7;
    [v6 enumerateObjectsUsingBlock:v16];
    uint64_t v12 = [MEMORY[0x263F58190] combineAllFutures:v11 ignoringErrors:1 scheduler:v8];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke_183;
    v14[3] = &unk_2645CC998;
    void v14[4] = self;
    id v15 = v6;
    id v13 = (id)[v12 addSuccessBlock:v14];
  }
  else
  {
    int v8 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn handleTimerFiringTimerDismissedNotification:]();
    }
  }
}

void __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 timerID];
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    int v10 = 134218242;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p dismissing local timer %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = (void *)a1[5];
  id v6 = (void *)a1[6];
  int v8 = [v3 UUIDString];
  int v9 = [v6 dismissTimerWithIdentifier:v8];
  [v7 addObject:v9];
}

void __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke_183(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished dismissing local timers", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 timerAddOn:*(void *)(a1 + 32) didDismissTimers:*(void *)(a1 + 40)];
  }
}

- (void)handleTimerManagerStateResetNotification:(id)a3
{
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn handleTimerManagerStateResetNotification:](self);
  }

  int v5 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didResetTimerAddOn:self];
  }
}

- (void)timersAsAccessory:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn timersAsAccessory:fromClient:withCallback:](self);
  }

  if (v8)
  {
    BOOL v12 = 0;
LABEL_5:
    id v13 = [(COMeshTimerAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v8];
    goto LABEL_6;
  }
  BOOL v12 = [(COMeshTimerAddOn *)self performsLocalActions];
  id v13 = [(COMeshTimerAddOn *)self _currentAccessoryForClient:v9];
  if (v13)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x263F33F88]) initWithHomeKitAccessory:v13];

    if (v8) {
      goto LABEL_5;
    }
    id v13 = 0;
  }
  else
  {
    id v8 = 0;
  }
LABEL_6:
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__11;
  void v26[4] = __Block_byref_object_dispose__11;
  id v27 = (id)os_transaction_create();
  if (v13)
  {
    uint64_t v14 = [(COMeshTimerAddOn *)self _timersForAccessory:v8 member:v13];
  }
  else
  {
    id v15 = [v8 uniqueIdentifier];
    uint64_t v14 = [(COMeshTimerAddOn *)self _timersForAccessoryIdentifier:v15 allowLocalStorage:v12];
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke;
  v23[3] = &unk_2645CC408;
  id v16 = v10;
  id v24 = v16;
  id v25 = v26;
  id v17 = (id)[v14 addFailureBlock:v23];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2;
  v20[3] = &unk_2645CC9E8;
  id v18 = v16;
  id v21 = v18;
  id v22 = v26;
  id v19 = (id)[v14 addSuccessBlock:v20];

  _Block_object_dispose(v26, 8);
}

void __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)timersForAccessories:(id)a3 fromClient:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshAddOn *)self meshController];
  BOOL v12 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn timersForAccessories:fromClient:callback:]((uint64_t)v11, v8, v12);
  }

  id v13 = [MEMORY[0x263EFF980] array];
  uint64_t v14 = [MEMORY[0x263EFF980] array];
  id v15 = [(COMeshAddOn *)self meshController];
  id v16 = [v15 nodeManager];
  id v17 = [v16 activeNodesWithSelfNode:1];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke;
  v38[3] = &unk_2645CCA10;
  id v18 = v17;
  id v39 = v18;
  id v19 = v13;
  id v40 = v19;
  id v41 = self;
  id v20 = v14;
  id v42 = v20;
  id v21 = v11;
  id v43 = v21;
  [v8 enumerateObjectsUsingBlock:v38];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__11;
  void v36[4] = __Block_byref_object_dispose__11;
  id v37 = (id)os_transaction_create();
  id v22 = [v21 dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_187;
  block[3] = &unk_2645CCA88;
  id v29 = v19;
  id v30 = self;
  id v31 = v9;
  id v32 = v20;
  id v33 = v21;
  id v34 = v10;
  uint64_t v35 = v36;
  id v23 = v10;
  id v24 = v21;
  id v25 = v20;
  id v26 = v9;
  id v27 = v19;
  dispatch_async(v22, block);

  _Block_object_dispose(v36, 8);
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 categoryType];
  uint64_t v5 = [v3 IDSIdentifier];
  if (![v4 isEqualToString:*MEMORY[0x263F0B0A0]]
    || (COMeshNodeForIDSIdentifier(*(void **)(a1 + 32), v5),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = *(void **)(a1 + 40);
LABEL_4:
    [v7 addObject:v3];
    goto LABEL_5;
  }
  id v8 = [*(id *)(a1 + 48) secondaryClusterMemberForAccessory:v3];

  if (v8)
  {
    uint64_t v7 = *(void **)(a1 + 56);
    goto LABEL_4;
  }
  id v9 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = 134218242;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p not getting timers for %@, accessory unavailable", (uint8_t *)&v11, 0x16u);
  }

LABEL_5:
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_187(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = [MEMORY[0x263EFF980] array];
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = [*(id *)(a1 + 40) _timersForAccessories:*(void *)(a1 + 32) fromClient:*(void *)(a1 + 48) results:v2];
    [v3 addObject:v4];
  }
  if ([*(id *)(a1 + 56) count])
  {
    uint64_t v5 = *(void **)(a1 + 56);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_2;
    v25[3] = &unk_2645CC608;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 40);
    id v26 = v6;
    uint64_t v27 = v7;
    id v28 = v2;
    [v5 enumerateObjectsUsingBlock:v25];
  }
  id v8 = (void *)MEMORY[0x263F581B8];
  id v9 = [*(id *)(a1 + 64) dispatchQueue];
  uint64_t v10 = [v8 schedulerWithDispatchQueue:v9];

  int v11 = [MEMORY[0x263F58190] combineAllFutures:v3 ignoringErrors:1 scheduler:v10];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_5;
  v21[3] = &unk_2645CCA60;
  id v12 = *(id *)(a1 + 72);
  id v22 = v2;
  id v23 = v12;
  uint64_t v24 = *(void *)(a1 + 80);
  id v13 = v2;
  id v14 = (id)[v11 addSuccessBlock:v21];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_6;
  v18[3] = &unk_2645CC408;
  id v15 = *(id *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  id v19 = v15;
  uint64_t v20 = v16;
  id v17 = (id)[v11 addFailureBlock:v18];
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  [a1[4] addObject:v4];
  uint64_t v5 = [a1[5] secondaryClusterMemberForAccessory:v3];
  id v6 = [a1[5] _timersForAccessory:v3 member:v5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_3;
  v14[3] = &unk_2645CCA38;
  id v15 = a1[6];
  id v16 = v3;
  id v7 = v4;
  id v17 = v7;
  id v8 = v3;
  id v9 = (id)[v6 addSuccessBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_4;
  v12[3] = &unk_2645CB308;
  id v13 = v7;
  id v10 = v7;
  id v11 = (id)[v6 addFailureBlock:v12];
}

uint64_t __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_3(void *a1, void *a2)
{
  if (a2) {
    id v3 = a2;
  }
  else {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = (void *)a1[4];
  uint64_t v5 = (void *)a1[5];
  id v6 = a2;
  id v7 = [v5 uniqueIdentifier];
  [v4 setObject:v3 forKey:v7];

  id v8 = (void *)a1[6];
  return [v8 finishWithNoResult];
}

uint64_t __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)addTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn addTimer:asAccessory:fromClient:withCallback:]();
  }

  id v15 = [v10 siriContext];
  id v16 = [v15 objectForKey:*MEMORY[0x263F33F28]];
  if (v11)
  {
    id v17 = [(COMeshTimerAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v11];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = [(COMeshTimerAddOn *)self addTimer:v10 client:v12 member:v17];
  [(COMeshTimerAddOn *)self _addCompletionsToFuture:v18 withXPCCallback:v13 transactionDescription:"com.apple.CoordinationCore.timers.create"];
}

- (void)updateTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn updateTimer:asAccessory:fromClient:withCallback:]();
  }

  if (v11)
  {
    id v15 = [(COMeshTimerAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v11];
  }
  else
  {
    id v15 = 0;
  }
  id v16 = [(COMeshTimerAddOn *)self updateTimer:v10 client:v12 member:v15];
  [(COMeshTimerAddOn *)self _addCompletionsToFuture:v16 withXPCCallback:v13 transactionDescription:"com.apple.CoordinationCore.timers.update"];
}

- (void)removeTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn removeTimer:asAccessory:fromClient:withCallback:]();
  }

  if (v11)
  {
    id v15 = [(COMeshTimerAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v11];
  }
  else
  {
    id v15 = 0;
  }
  id v16 = [(COMeshTimerAddOn *)self removeTimer:v10 client:v12 member:v15];
  [(COMeshTimerAddOn *)self _addCompletionsToFuture:v16 withXPCCallback:v13 transactionDescription:"com.apple.CoordinationCore.timers.delete"];
}

- (void)dismissTimerWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn dismissTimerWithIdentifier:fromClient:withCallback:]();
  }

  id v10 = [(COMeshTimerAddOn *)self dismissTimerWithIdentifier:v7];
  [(COMeshTimerAddOn *)self _addCompletionsToFuture:v10 withXPCCallback:v8 transactionDescription:"com.apple.CoordinationCore.timers.dismiss"];
}

- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMeshAddOn *)self meshControllerQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke;
  v15[3] = &unk_2645CB4D0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v3 = [*(id *)(a1 + 32) IDSIdentifier];
  id v4 = [*(id *)(a1 + 32) categoryType];
  uint64_t v5 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    uint64_t v50 = v6;
    __int16 v51 = 2112;
    id v52 = v7;
    __int16 v53 = 2112;
    uint64_t v54 = v2;
    __int16 v55 = 2112;
    uint64_t v56 = (uint64_t)v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p as %@ checking dispatch for %@ of %@...", buf, 0x2Au);
  }

  if (*(void *)(a1 + 48) | v2)
  {
    if ([v4 isEqualToString:*MEMORY[0x263F0B0A0]])
    {
      id v9 = [*(id *)(a1 + 40) meshController];
      uint64_t v10 = [v9 state];

      id v11 = [*(id *)(a1 + 40) ourInterests];
      id v12 = [v11 objectForKey:v3];

      if (v12)
      {
        id v8 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = *(void *)(a1 + 32);
          uint64_t v38 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          uint64_t v50 = v38;
          __int16 v51 = 2048;
          id v52 = v12;
          __int16 v53 = 2112;
          uint64_t v54 = v39;
          _os_log_debug_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEBUG, "%p using interest tracker %p for can dispatch of %@", buf, 0x20u);
        }

        LODWORD(v8) = [v12 canDispatchWithPrimary:v10 == 3];
      }
      else if (v10 == 3)
      {
        id v40 = v3;
        id v19 = COCoreLogForCategory(3);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1(a1 + 40, v19, v20, v21, v22, v23, v24, v25);
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v26 = [*(id *)(a1 + 40) meshController];
        id v8 = [v26 nodes];

        uint64_t v27 = [v8 countByEnumeratingWithState:&v45 objects:v60 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v46 != v29) {
                objc_enumerationMutation(v8);
              }
              id v31 = [*(id *)(*((void *)&v45 + 1) + 8 * i) IDSIdentifier];
              char v32 = [v31 isEqual:v40];

              if (v32)
              {

                LODWORD(v8) = 1;
                goto LABEL_36;
              }
            }
            uint64_t v28 = [v8 countByEnumeratingWithState:&v45 objects:v60 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        id v33 = [*(id *)(a1 + 40) secondaryClusterMemberForAccessory:*(void *)(a1 + 32)];
        LODWORD(v8) = v33 != 0;

LABEL_36:
        id v3 = v40;
      }
      else
      {
        LODWORD(v8) = 0;
      }
    }
    else
    {
      id v13 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2();
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v14 = [*(id *)(a1 + 40) meshController];
      id v12 = [v14 nodes];

      id v8 = [v12 countByEnumeratingWithState:&v41 objects:v59 count:16];
      if (v8)
      {
        uint64_t v15 = *(void *)v42;
        while (2)
        {
          for (uint64_t j = 0; j != v8; uint64_t j = ((char *)j + 1))
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) remote];
            uint64_t v18 = [v17 type];

            if (v18 != -1)
            {
              LODWORD(v8) = 1;
              goto LABEL_37;
            }
          }
          id v8 = [v12 countByEnumeratingWithState:&v41 objects:v59 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
LABEL_37:
  }
  else
  {
    LODWORD(v8) = 1;
  }
  id v34 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = *(void *)(a1 + 40);
    __int16 v36 = *(void **)(a1 + 48);
    id v37 = " not";
    if (v8) {
      id v37 = "";
    }
    *(_DWORD *)buf = 134219010;
    uint64_t v50 = v35;
    __int16 v51 = 2112;
    id v52 = v36;
    __int16 v53 = 2080;
    uint64_t v54 = (uint64_t)v37;
    __int16 v55 = 2112;
    uint64_t v56 = v2;
    __int16 v57 = 2112;
    id v58 = v4;
    _os_log_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEFAULT, "%p as %@ can%s dispatch for %@ of %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)establishSecondaryClusterForAccessory:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F33F80] isHomeKitUsingAlarmsAndTimersIDSService])
  {
    uint64_t v5 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v9 = self;
      __int16 v10 = 2112;
      id v11 = @"com.apple.private.alloy.alarms-timers";
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p HomeKit is making use of IDS Service %@ for timers", buf, 0x16u);
    }
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__COMeshTimerAddOn_establishSecondaryClusterForAccessory___block_invoke;
    v6[3] = &unk_2645CAE80;
    void v6[4] = self;
    id v7 = v4;
    [(COMeshTimerAddOn *)self _withLock:v6];
  }
}

void __58__COMeshTimerAddOn_establishSecondaryClusterForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F33F80] isGlobalTimersEnabled]
    && !*(void *)(*(void *)(a1 + 32) + 80))
  {
    Class v2 = NSClassFromString(&cfstr_Coclusterrealm.isa);
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = [v3 homeUniqueIdentifier];
      uint64_t v5 = [(objc_class *)v2 realmWithHomeKitHomeIdentifier:v4];
    }
    else
    {
      uint64_t v5 = [(objc_class *)v2 realmForCurrent];
    }
    uint64_t v6 = [MEMORY[0x263F33F48] configurationWithDomain:@"com.apple.alarms-timers" requiredServices:12 options:0 realm:v5 globalServiceName:@"com.apple.private.alloy.alarms-timers"];
    id v7 = [MEMORY[0x263F33F40] clusterWithConfiguration:v6];
    id v8 = +[COMTActionDirector directorForCluster:v7];
    id v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:3];
    id v11 = objc_msgSend(v9, "setWithArray:", v10, v18, v19);

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    uint64_t v15 = [*(id *)(a1 + 32) meshControllerQueue];
    [v8 registerHandler:v12 forType:v14 actions:v11 queue:v15];

    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 80);
    *(void *)(v16 + 80) = v8;
  }
}

- (id)secondaryClusterMemberForAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [a3 IDSIdentifier];
  if ([v4 length] && objc_msgSend(MEMORY[0x263F33F80], "isGlobalMessagingEnabled"))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obuint64_t j = [(COMeshTimerAddOn *)self members];
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          __int16 v10 = [v9 member];
          id v11 = [v10 deviceMetadata];
          uint64_t v12 = [v11 objectForKey:@"IDS"];
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            id v14 = [v9 member];
            goto LABEL_14;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_14:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)secondaryClusterMemberIfRequiredForAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 categoryType];
  if ([v5 isEqualToString:*MEMORY[0x263F0B0A0]])
  {
    uint64_t v6 = [v4 IDSIdentifier];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(COMeshAddOn *)self meshController];
    id v8 = [v7 nodes];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) IDSIdentifier];
          char v14 = [v13 isEqual:v6];

          if (v14)
          {

            uint64_t v15 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = [(COMeshTimerAddOn *)self secondaryClusterMemberForAccessory:v4];
LABEL_13:
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)setInterests:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshAddOn *)self meshControllerQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke;
  v15[3] = &unk_2645CCAB0;
  id v16 = v9;
  long long v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  Class v2 = [*(id *)(a1 + 32) IDSIdentifier];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) ourInterests];
    id v4 = [v3 objectForKey:v2];

    if (!v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) meshController];
      uint64_t v6 = [v5 nodes];

      uint64_t v7 = COMeshNodeForIDSIdentifier(v6, v2);
      id v8 = [*(id *)(a1 + 40) secondaryClusterMemberForAccessory:*(void *)(a1 + 32)];
      id v4 = [[COInterestTracker alloc] initWithAccessory:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40) primaryAvailable:v7 != 0 secondary:v8];
      id v9 = [*(id *)(a1 + 40) ourInterests];
      id v10 = (void *)[v9 mutableCopy];

      [v10 setObject:v4 forKey:v2];
      [*(id *)(a1 + 40) setOurInterests:v10];
      uint64_t v11 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        int v20 = 134218498;
        uint64_t v21 = v12;
        __int16 v22 = 2048;
        uint64_t v23 = v4;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p using %p to track our interests for accessory %@", (uint8_t *)&v20, 0x20u);
      }
    }
    [(COInterestTracker *)v4 setInterests:*(void *)(a1 + 48)];
    if (![*(id *)(a1 + 48) count])
    {
      id v14 = COCoreLogForCategory(3);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 40);
        int v20 = 134218498;
        uint64_t v21 = v15;
        __int16 v22 = 2048;
        uint64_t v23 = v4;
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p removing tracker %p for accessory %@", (uint8_t *)&v20, 0x20u);
      }

      long long v17 = [*(id *)(a1 + 40) ourInterests];
      id v18 = (void *)[v17 mutableCopy];

      [v18 removeObjectForKey:v2];
      [*(id *)(a1 + 40) setOurInterests:v18];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v19 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)interestTracker:(id)a3 setInterests:(id)a4 forMember:(id)a5 callback:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  long long v17 = [v11 allObjects];
  id v18 = +[COMTUpdateInterestAction actionWithTargetType:v16 targetIdentifiers:v17];

  id v19 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v38 = self;
    __int16 v39 = 2048;
    id v40 = v10;
    __int16 v41 = 2114;
    long long v42 = v18;
    __int16 v43 = 2114;
    id v44 = v11;
    _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%p setting interests for tracker %p via %{public}@ to %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke;
  v32[3] = &unk_2645CCAD8;
  objc_copyWeak(&v36, (id *)buf);
  id v20 = v10;
  id v33 = v20;
  id v21 = v18;
  id v34 = v21;
  id v22 = v13;
  id v35 = v22;
  uint64_t v23 = (void *)MEMORY[0x223C8B4A0](v32);
  __int16 v24 = [(COMeshAddOn *)self meshControllerQueue];
  uint64_t v25 = [(COMeshTimerAddOn *)self actionDirector];
  uint64_t v26 = [MEMORY[0x263EFFA08] setWithObject:v12];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_205;
  v29[3] = &unk_2645CCB00;
  id v27 = v24;
  id v30 = v27;
  id v28 = v23;
  id v31 = v28;
  [v25 requestAction:v21 members:v26 activity:0 withCompletion:v29];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

void __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v5 = COCoreLogForCategory(3);
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        int v12 = 134218754;
        id v13 = WeakRetained;
        __int16 v14 = 2048;
        uint64_t v15 = v7;
        __int16 v16 = 2048;
        uint64_t v17 = v8;
        __int16 v18 = 2112;
        id v19 = v3;
        _os_log_error_impl(&dword_2217C1000, v6, OS_LOG_TYPE_ERROR, "%p failed to set interests for tracker %p via %p: %@", (uint8_t *)&v12, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 134218496;
      id v13 = WeakRetained;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p successfully set interests for tracker %p via %p", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v11 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v11 didChangeCompositionForTimerAddOn:WeakRetained];
    }
  }
}

void __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_205(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2;
  v8[3] = &unk_2645CB170;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)interestTrackerTriggerReset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = COCoreLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn handleTimerManagerStateResetNotification:](self);
  }

  id v7 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v4 accessory];
    id v9 = [v8 uniqueIdentifier];

    [v7 timerAddOn:self resetAccesory:v9];
  }
}

- (void)director:(id)a3 membersChanged:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(COMeshTimerAddOn *)self members];
  id v7 = (void *)[v6 mutableCopy];

  [v7 minusSet:v5];
  [(COMeshTimerAddOn *)self setMembers:v5];
  uint64_t v8 = [(COMeshTimerAddOn *)self interests];
  id v9 = [v8 allKeys];
  id v10 = (void *)[v9 mutableCopy];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = [*(id *)(*((void *)&v48 + 1) + 8 * v15) member];
        [v10 removeObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    uint64_t v17 = [(COMeshTimerAddOn *)self interests];
    __int16 v18 = (void *)[v17 mutableCopy];

    [v18 removeObjectsForKeys:v10];
    [(COMeshTimerAddOn *)self setInterests:v18];
    id v19 = COCoreLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v55 = self;
      __int16 v56 = 2112;
      __int16 v57 = v10;
      _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%p removing interests for %@", buf, 0x16u);
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = v7;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v44 + 1) + 8 * v24) member];
        uint64_t v26 = [v25 IDSIdentifier];

        id v27 = [(COMeshTimerAddOn *)self ourInterests];
        id v28 = [v27 objectForKey:v26];

        if (v28) {
          [v28 setSecondary:0];
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v22);
  }
  __int16 v39 = v20;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v29 = v11;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v41;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = [*(id *)(*((void *)&v40 + 1) + 8 * v33) member];
        id v35 = [v34 IDSIdentifier];
        id v36 = [(COMeshTimerAddOn *)self ourInterests];
        id v37 = [v36 objectForKey:v35];

        if (v37) {
          [v37 setSecondary:v34];
        }

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v31);
  }

  uint64_t v38 = [(COMeshTimerAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v38 didChangeCompositionForTimerAddOn:self];
  }
}

- (void)director:(id)a3 performAction:(id)a4 from:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 actionIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v18 = (COTimerUpdateRequest *)v11;
      id v20 = [(COTimerUpdateRequest *)v18 memento];
      uint64_t v21 = [v20 uniqueIdentifier];

      if (!v21)
      {
        uint64_t v22 = [(COMeshTimerAddOn *)self homekit];
        uint64_t v23 = [v22 currentAccessory];
        uint64_t v21 = [v23 uniqueIdentifier];
      }
      uint64_t v24 = [[COTimerReadRequest alloc] initWithAccessoryUniqueIdentifier:v21];
      objc_initWeak(&location, self);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_2;
      v38[3] = &unk_2645CCB50;
      id v40 = v13;
      objc_copyWeak(&v41, &location);
      id v39 = v14;
      [(COMeshTimerAddOn *)self handleTimerReadRequest:v24 callback:v38];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v11;
        uint64_t v26 = [COTimerUpdateRequest alloc];
        id v27 = [v25 timer];

        __int16 v18 = [(COTimerRequest *)v26 initWithTimer:v27];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_3;
        v35[3] = &unk_2645CCB28;
        id v36 = v14;
        id v37 = v13;
        [(COMeshTimerAddOn *)self handleTimerUpdateRequest:v18 callback:v35];

        id v19 = v36;
        goto LABEL_3;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v18 = [v11 targetIdentifier];
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F55D90]) initWithIdentifier:v18];
        uint64_t v24 = [(COTimerRequest *)[COTimerDeleteRequest alloc] initWithTimer:v21];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_4;
        v32[3] = &unk_2645CCB28;
        id v33 = v14;
        id v34 = v13;
        [(COMeshTimerAddOn *)self handleTimerDeleteRequest:v24 callback:v32];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v18 = [v11 targetIdentifiers];
          id v28 = [(COMeshTimerAddOn *)self interests];
          uint64_t v21 = (void *)[v28 mutableCopy];

          if ([(COTimerUpdateRequest *)v18 count]) {
            [v21 setObject:v18 forKey:v12];
          }
          else {
            [v21 removeObjectForKey:v12];
          }
          [(COMeshTimerAddOn *)self setInterests:v21];
          uint64_t v30 = [[COMTResult alloc] initWithActionIdentifier:v14];
          (*((void (**)(id, COMTResult *, void))v13 + 2))(v13, v30, 0);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        __int16 v18 = (COTimerUpdateRequest *)v11;
        uint64_t v21 = [(COMeshTimerAddOn *)self delegate];
        uint64_t v24 = [(COTimerUpdateRequest *)v18 reason];
        id v29 = [(COTimerUpdateRequest *)v18 timers];
        if ([(COTimerReadRequest *)v24 isEqual:*MEMORY[0x263F55D18]]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v21 timerAddOn:self didAddTimers:v29];
        }
        else if ([(COTimerReadRequest *)v24 isEqual:*MEMORY[0x263F55D30]] {
               && (objc_opt_respondsToSelector() & 1) != 0)
        }
        {
          [v21 timerAddOn:self didRemoveTimers:v29];
        }
        else if ([(COTimerReadRequest *)v24 isEqual:*MEMORY[0x263F55D38]] {
               && (objc_opt_respondsToSelector() & 1) != 0)
        }
        {
          [v21 timerAddOn:self didUpdateTimers:v29];
        }
        uint64_t v31 = [[COMTResult alloc] initWithActionIdentifier:v14];
        (*((void (**)(id, COMTResult *, void))v13 + 2))(v13, v31, 0);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  id v15 = v11;
  __int16 v16 = [COTimerCreateRequest alloc];
  uint64_t v17 = [v15 timer];

  __int16 v18 = [(COTimerRequest *)v16 initWithTimer:v17];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke;
  v43[3] = &unk_2645CCB28;
  id v44 = v14;
  id v45 = v13;
  [(COMeshTimerAddOn *)self handleTimerCreateRequest:v18 callback:v43];

  id v19 = v44;
LABEL_3:

LABEL_14:
LABEL_15:
}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5 || ([a2 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    id v7 = [[COMTResult alloc] initWithActionIdentifier:*(void *)(a1 + 32)];
    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5 || ([v8 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v8 timers];
    }
    else
    {
      id v5 = (id)MEMORY[0x263EFFA68];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v7 = [[COMTTimerReadResult alloc] initWithTimers:v5 actionIdentifier:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5 || ([a2 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    id v7 = [[COMTResult alloc] initWithActionIdentifier:*(void *)(a1 + 32)];
    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5 || ([a2 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    id v7 = [[COMTResult alloc] initWithActionIdentifier:*(void *)(a1 + 32)];
    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (MTTimerManager)observedTimerManager
{
  return self->_observedTimerManager;
}

- (NSSet)members
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMembers:(id)a3
{
}

- (NSDictionary)interests
{
  return self->_interests;
}

- (void)setInterests:(id)a3
{
}

- (NSDictionary)ourInterests
{
  return self->_ourInterests;
}

- (void)setOurInterests:(id)a3
{
}

- (void)setActionDirector:(id)a3
{
}

- (NSMutableDictionary)timerIndex
{
  return self->_timerIndex;
}

- (void)setTimerIndex:(id)a3
{
}

- (COHomeKitAdapter)homekit
{
  return self->_homekit;
}

- (COHomeHubAdapter)homehub
{
  return self->_homehub;
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
}

- (NSArray)mergingNodes
{
  return self->_mergingNodes;
}

- (void)setMergingNodes:(id)a3
{
}

- (COTimerReadRequest)mergeRequest
{
  return self->_mergeRequest;
}

- (void)setMergeRequest:(id)a3
{
}

- (NSArray)mergeTimers
{
  return self->_mergeTimers;
}

- (void)setMergeTimers:(id)a3
{
}

- (NSDictionary)mergeResponses
{
  return self->_mergeResponses;
}

- (void)setMergeResponses:(id)a3
{
}

- (NSArray)queuedCommands
{
  return self->_queuedCommands;
}

- (void)setQueuedCommands:(id)a3
{
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_queuedCommands, 0);
  objc_storeStrong((id *)&self->_mergeResponses, 0);
  objc_storeStrong((id *)&self->_mergeTimers, 0);
  objc_storeStrong((id *)&self->_mergeRequest, 0);
  objc_storeStrong((id *)&self->_mergingNodes, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_homehub, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
  objc_storeStrong((id *)&self->_timerIndex, 0);
  objc_storeStrong((id *)&self->_actionDirector, 0);
  objc_storeStrong((id *)&self->_ourInterests, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_observedTimerManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didChangeNodesForMeshController:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v8 = [a2 mergeRequest];
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p merge %p lost final nodes", v4, v5, v6, v7, 0);
}

- (void)_filteredTimersList:forAccessory:.cold.1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 meshController];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p filtering %@", v4, v5, v6, v7, v8);
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p specified accessory (%@) was not found in order to filter local timers!");
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_96_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p local timers list failed (%@)");
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p specified accessory (%@) was not found in order to filter timers!");
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_103_cold_2()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p timers list from leader failed (%@)");
}

- (void)_isTimer:(void *)a1 targetingAccessoryIdentifiers:.cold.1(void *a1)
{
  os_log_t v1 = [a1 timerID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "timer (%@) is not targeting", v4, v5, v6, v7, v8);
}

- (void)_isTimer:targetingAccessoryIdentifiers:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "Unknown targeting of %@", v2, v3, v4, v5, v6);
}

void __38__COMeshTimerAddOn__sendNotification___block_invoke_3_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_2217C1000, v2, OS_LOG_TYPE_ERROR, "%p failed to send notifiction '%@' to member %@", v3, 0x20u);
}

- (void)_timerManagerTimerFired:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p forwarding local update to the mesh", v2, v3, v4, v5, v6);
}

void __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p forwarding reset to the mesh", v2, v3, v4, v5, v6);
}

void __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 meshController];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p merge %p received an error on the last node", v4, v5, v6, v7, v8);
}

- (void)_continueMerge:withResponse:fromNode:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_2217C1000, v1, OS_LOG_TYPE_DEBUG, "%p merge %p received last response", v2, 0x16u);
}

- (void)_finishMerge:.cold.1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [v0 meshController];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p truth is %@", v4, v5, v6, v7, v8);
}

- (void)_finishMerge:.cold.2()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [v0 meshController];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p deletes is %@", v4, v5, v6, v7, v8);
}

void __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p failed to fetch timers for index: %{public}@");
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p direct add failed (%@)");
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_155_cold_1()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p add failed via secondary cluster (%@)");
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p direct update failed (%@)");
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_158_cold_1()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p update failed via secondary cluster (%@)");
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p direct remove failed (%@)");
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_161_cold_1()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p remove failed via secondary cluster (%@)");
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p direct dismiss failed (%@)");
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_163_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) meshController];
  OUTLINED_FUNCTION_3();
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_2217C1000, a3, OS_LOG_TYPE_ERROR, "%p early dismissing %@ failed (%@).", v7, 0x20u);
}

void __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "... timers list failed (%@)", v1, 0xCu);
}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [*(id *)(v0 + 32) timerID];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "... timer (%@) create failed (%@)", v4, v5, v6, v7, v8);
}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_168_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding creation of %@ to the mesh", v5, v6, v7, v8, v9);
}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [*(id *)(v0 + 32) timerID];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "... timer (%@) update failed (%@)", v4, v5, v6, v7, v8);
}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_169_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding update of %@ to the mesh", v5, v6, v7, v8, v9);
}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [*(id *)(v0 + 32) timerID];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "... timer (%@) delete failed (%@)", v4, v5, v6, v7, v8);
}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_170_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding delete of %@ to the mesh", v5, v6, v7, v8, v9);
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding dismiss of %@ to the mesh", v5, v6, v7, v8, v9);
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_174_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "... timer (%@) dismiss failed (%@)");
}

- (void)handleTimersAddedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p added timers without a list of timers", v2, v3, v4, v5, v6);
}

- (void)handleTimersRemovedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p removed timers without a list of timers", v2, v3, v4, v5, v6);
}

- (void)handleTimersUpdatedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p updated timers without a list of timers", v2, v3, v4, v5, v6);
}

- (void)handleTimerFiringTimerDismissedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p dismissed timers without a list of timers", v2, v3, v4, v5, v6);
}

- (void)handleTimerManagerStateResetNotification:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 meshController];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%p forwarding timer manager reset", v4, v5, v6, v7, v8);
}

- (void)timersAsAccessory:(void *)a1 fromClient:withCallback:.cold.1(void *a1)
{
  uint64_t v1 = [a1 meshController];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p serving request to get timers for %{public}@", v4, v5, v6, v7, v8);
}

void __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "... returning %@", v2, v3, v4, v5, v6);
}

- (void)timersForAccessories:(uint64_t)a1 fromClient:(void *)a2 callback:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 134218498;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  __int16 v9 = 2112;
  __int16 v10 = a2;
  _os_log_debug_impl(&dword_2217C1000, a3, OS_LOG_TYPE_DEBUG, "%p serving request to get timers for %ld:%@", (uint8_t *)&v5, 0x20u);
}

- (void)addTimer:asAccessory:fromClient:withCallback:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = [v1 meshController];
  uint64_t v3 = [v0 timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v4, v5, "%p serving request to add timer %@", v6, v7, v8, v9, v10);
}

- (void)updateTimer:asAccessory:fromClient:withCallback:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = [v1 meshController];
  uint64_t v3 = [v0 timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v4, v5, "%p serving request to update timer %@", v6, v7, v8, v9, v10);
}

- (void)removeTimer:asAccessory:fromClient:withCallback:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = [v1 meshController];
  uint64_t v3 = [v0 timerID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v4, v5, "%p serving request to delete timer %@", v6, v7, v8, v9, v10);
}

- (void)dismissTimerWithIdentifier:fromClient:withCallback:.cold.1()
{
  OUTLINED_FUNCTION_9();
  id v1 = [v0 meshController];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p serving request to dismiss timer %@", v4, v5, v6, v7, v8);
}

void __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p looking for non-ephemeral node...", v2, v3, v4, v5, 0);
}

void __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_2217C1000, v1, OS_LOG_TYPE_ERROR, "%p cannot set interests, IDS identifier missing", (uint8_t *)&v2, 0xCu);
}

@end