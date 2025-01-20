@interface COMeshAlarmAddOn
- (BOOL)_isAlarm:(id)a3 targetingAccessory:(id)a4;
- (BOOL)_isAlarm:(id)a3 targetingAccessoryIdentifiers:(id)a4;
- (BOOL)performsLocalActions;
- (COAlarmReadRequest)mergeRequest;
- (COHomeHubAdapter)homehub;
- (COHomeKitAdapter)homekit;
- (COMTActionDirector)actionDirector;
- (COMeshAlarmAddOn)init;
- (COMeshAlarmAddOn)initWithAlarmManager:(id)a3;
- (COMeshAlarmAddOn)initWithAlarmManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5;
- (COMeshAlarmAddOnDelegate)delegate;
- (MTAlarmManager)alarmManager;
- (MTAlarmManager)observedAlarmManager;
- (NSArray)deletes;
- (NSArray)mergeAlarms;
- (NSArray)mergingNodes;
- (NSArray)queuedCommands;
- (NSDictionary)interests;
- (NSDictionary)mergeResponses;
- (NSDictionary)ourInterests;
- (NSMutableDictionary)alarmIndex;
- (NSSet)members;
- (OS_dispatch_source)reaper;
- (id)_alarmsForAccessory:(id)a3 allowLocalStorage:(BOOL)a4 usingLeader:(BOOL)a5 member:(id)a6 client:(id)a7;
- (id)_commandsForReconciling:(id)a3 toTruth:(id)a4 forNode:(id)a5;
- (id)_currentAccessoryForConnection:(id)a3;
- (id)_filteredAlarmsList:(id)a3 forAccessory:(id)a4;
- (id)_sendRequest:(id)a3 client:(id)a4;
- (id)addAlarm:(id)a3;
- (id)addAlarm:(id)a3 member:(id)a4 client:(id)a5;
- (id)alarms;
- (id)alarmsForAccessory:(id)a3;
- (id)dismissAlarmWithIdentifier:(id)a3;
- (id)dismissAlarmWithIdentifier:(id)a3 client:(id)a4;
- (id)mediaSystemUpdateRegistration;
- (id)recorder;
- (id)removeAlarm:(id)a3;
- (id)removeAlarm:(id)a3 member:(id)a4 client:(id)a5;
- (id)secondaryClusterMemberForAccessory:(id)a3;
- (id)secondaryClusterMemberIfRequiredForAccessory:(id)a3;
- (id)snoozeAlarmWithIdentifier:(id)a3;
- (id)snoozeAlarmWithIdentifier:(id)a3 client:(id)a4;
- (id)updateAlarm:(id)a3;
- (id)updateAlarm:(id)a3 member:(id)a4 client:(id)a5;
- (void)_abandonMerge;
- (void)_accessorySettingValueUpdated:(id)a3;
- (void)_addAlarmDeleteEvent:(id)a3;
- (void)_addCompletionsToFuture:(id)a3 withXPCCallback:(id)a4 transactionDescription:(const char *)a5;
- (void)_alarmManagerAlarmFired:(id)a3;
- (void)_alarmManagerAlarmsAdded:(id)a3;
- (void)_alarmManagerAlarmsChanged:(id)a3;
- (void)_alarmManagerAlarmsRemoved:(id)a3;
- (void)_alarmManagerAlarmsUpdated:(id)a3;
- (void)_alarmManagerFiringAlarmChanged:(id)a3;
- (void)_alarmManagerFiringAlarmDismissed:(id)a3;
- (void)_alarmManagerStateReset:(id)a3;
- (void)_broadcastMerge:(id)a3 withTruth:(id)a4;
- (void)_continueMerge:(id)a3 withResponse:(id)a4 fromNode:(id)a5;
- (void)_finishMerge:(id)a3;
- (void)_primeMerge:(id)a3 withNodes:(id)a4;
- (void)_processQueuedCommands;
- (void)_reaperFired;
- (void)_reloadIndexWithCompletion:(id)a3;
- (void)_replicateToMobileTimerFromHomeKit;
- (void)_sendNotification:(id)a3;
- (void)_startMerge;
- (void)_withLock:(id)a3;
- (void)addAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6;
- (void)alarmsAsAccessory:(id)a3 fromClient:(id)a4 withCallback:(id)a5;
- (void)alarmsForAccessories:(id)a3 fromClient:(id)a4 callback:(id)a5;
- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)didAddToMeshController:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)didStopMeshController:(id)a3;
- (void)director:(id)a3 membersChanged:(id)a4;
- (void)director:(id)a3 performAction:(id)a4 from:(id)a5 callback:(id)a6;
- (void)dismissAlarmWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5;
- (void)establishSecondaryClusterForAccessory:(id)a3;
- (void)handleAlarmCreateRequest:(id)a3 callback:(id)a4;
- (void)handleAlarmDeleteRequest:(id)a3 callback:(id)a4;
- (void)handleAlarmDismissRequest:(id)a3 callback:(id)a4;
- (void)handleAlarmFiredNotification:(id)a3;
- (void)handleAlarmFiringAlarmDismissedNotification:(id)a3;
- (void)handleAlarmManagerStateResetNotification:(id)a3;
- (void)handleAlarmReadRequest:(id)a3 callback:(id)a4;
- (void)handleAlarmSnoozeNotification:(id)a3;
- (void)handleAlarmSnoozeRequest:(id)a3 callback:(id)a4;
- (void)handleAlarmUpdateRequest:(id)a3 callback:(id)a4;
- (void)handleAlarmsAddedNotification:(id)a3;
- (void)handleAlarmsRemovedNotification:(id)a3;
- (void)handleAlarmsUpdatedNotification:(id)a3;
- (void)interestTracker:(id)a3 setInterests:(id)a4 forMember:(id)a5 callback:(id)a6;
- (void)interestTrackerTriggerReset:(id)a3;
- (void)mediaSystemCompanionTransitionedFrom:(id)a3 to:(id)a4;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)reapNonRepeatingAlarmsOlderThanDate:(id)a3 accessory:(id)a4 home:(id)a5;
- (void)removeAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6;
- (void)setActionDirector:(id)a3;
- (void)setAlarmIndex:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletes:(id)a3;
- (void)setInterests:(id)a3;
- (void)setInterests:(id)a3 asAccessory:(id)a4 withCallback:(id)a5;
- (void)setMembers:(id)a3;
- (void)setMergeAlarms:(id)a3;
- (void)setMergeRequest:(id)a3;
- (void)setMergeResponses:(id)a3;
- (void)setMergingNodes:(id)a3;
- (void)setOurInterests:(id)a3;
- (void)setQueuedCommands:(id)a3;
- (void)setRecorder:(id)a3;
- (void)snoozeAlarmWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5;
- (void)updateAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6;
- (void)willRemoveFromMeshController:(id)a3;
- (void)willStartMeshController:(id)a3;
@end

@implementation COMeshAlarmAddOn

- (COMeshAlarmAddOn)initWithAlarmManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v48.receiver = self;
  v48.super_class = (Class)COMeshAlarmAddOn;
  v12 = [(COMeshAddOn *)&v48 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v14 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x263F55D50]);
    observedAlarmManager = v13->_observedAlarmManager;
    v13->_observedAlarmManager = v14;

    [(MTAlarmManager *)v13->_observedAlarmManager checkIn];
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
    objc_initWeak(&location, v13);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke;
    v45[3] = &unk_2645CDD60;
    objc_copyWeak(&v46, &location);
    uint64_t v16 = [v10 registerMediaSystemUpdateHandler:v45];
    id mediaSystemUpdateRegistration = v13->_mediaSystemUpdateRegistration;
    v13->_id mediaSystemUpdateRegistration = (id)v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    deletes = v13->_deletes;
    v13->_deletes = v18;

    v20 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    mergingNodes = v13->_mergingNodes;
    v13->_mergingNodes = v20;

    v22 = (NSDictionary *)objc_alloc_init(NSDictionary);
    mergeResponses = v13->_mergeResponses;
    v13->_mergeResponses = v22;

    v24 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    queuedCommands = v13->_queuedCommands;
    v13->_queuedCommands = v24;

    objc_storeStrong((id *)&v13->_alarmManager, a3);
    id recorder = v13->_recorder;
    v13->_id recorder = &__block_literal_global_10;

    v27 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    members = v13->_members;
    v13->_members = v27;

    v29 = (NSDictionary *)objc_alloc_init(NSDictionary);
    interests = v13->_interests;
    v13->_interests = v29;

    v31 = (NSDictionary *)objc_alloc_init(NSDictionary);
    ourInterests = v13->_ourInterests;
    v13->_ourInterests = v31;

    v33 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v50 = v13;
      _os_log_impl(&dword_2217C1000, v33, OS_LOG_TYPE_DEFAULT, "%p mesh add-on created", buf, 0xCu);
    }

    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v13 selector:sel__accessorySettingValueUpdated_ name:*MEMORY[0x263F0B5B0] object:0];
    [v34 addObserver:v13 selector:sel__alarmManagerAlarmsAdded_ name:*MEMORY[0x263F55CA0] object:v13->_observedAlarmManager];
    [v34 addObserver:v13 selector:sel__alarmManagerAlarmsRemoved_ name:*MEMORY[0x263F55CB8] object:v13->_observedAlarmManager];
    [v34 addObserver:v13 selector:sel__alarmManagerAlarmsUpdated_ name:*MEMORY[0x263F55CC0] object:v13->_observedAlarmManager];
    [v34 addObserver:v13 selector:sel__alarmManagerFiringAlarmDismissed_ name:*MEMORY[0x263F55CD0] object:v13->_observedAlarmManager];
    v35 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v35 doubleForKey:@"ReapCadence"];
    if (v36 <= 0.0) {
      double v37 = 6.048e14;
    }
    else {
      double v37 = v36 * 1000000000.0;
    }
    dispatch_time_t v38 = dispatch_walltime(0, (uint64_t)v37);
    dispatch_source_t v39 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, 0);
    reaper = v13->_reaper;
    v13->_reaper = (OS_dispatch_source *)v39;

    dispatch_source_set_timer((dispatch_source_t)v13->_reaper, v38, (unint64_t)v37, 0x3B9ACA00uLL);
    v41 = v13->_reaper;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke_54;
    handler[3] = &unk_2645CB2E0;
    objc_copyWeak(&v44, &location);
    dispatch_source_set_event_handler(v41, handler);
    dispatch_activate((dispatch_object_t)v13->_reaper);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained mediaSystemCompanionTransitionedFrom:v8 to:v5];
  }
}

uint64_t __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke_2()
{
  return AnalyticsSendEventLazy();
}

void __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke_54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reaperFired];
    id WeakRetained = v2;
  }
}

- (COMeshAlarmAddOn)initWithAlarmManager:(id)a3
{
  id v4 = a3;
  id v5 = +[COHomeKitAdapter sharedInstance];
  v6 = +[COHomeHubAdapter sharedInstance];
  v7 = [(COMeshAlarmAddOn *)self initWithAlarmManager:v4 homekitAdapter:v5 hubAdapter:v6];

  return v7;
}

- (COMeshAlarmAddOn)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F55D50]);
  id v4 = [(COMeshAlarmAddOn *)self initWithAlarmManager:v3];

  return v4;
}

- (void)dealloc
{
  id v3 = [(COMeshAlarmAddOn *)self homekit];
  id v4 = [(COMeshAlarmAddOn *)self mediaSystemUpdateRegistration];
  [v3 unregisterMediaSystemUpdateHandler:v4];

  v5.receiver = self;
  v5.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAlarmAddOn *)&v5 dealloc];
}

- (void)didAddToMeshController:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAddOn *)&v53 didAddToMeshController:v4];
  objc_initWeak(&location, self);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke;
  v50[3] = &unk_2645CC318;
  objc_copyWeak(&v51, &location);
  objc_super v5 = (void (**)(void, void))MEMORY[0x223C8B4A0](v50);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_4;
  v48[3] = &unk_2645CC368;
  objc_copyWeak(&v49, &location);
  v6 = (void (**)(void, void))MEMORY[0x223C8B4A0](v48);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_7;
  v46[3] = &unk_2645CB778;
  objc_copyWeak(&v47, &location);
  v7 = ((void (**)(void, void *))v5)[2](v5, v46);
  [v4 registerHandler:v7 forRequestClass:objc_opt_class()];

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_8;
  v44[3] = &unk_2645CB778;
  objc_copyWeak(&v45, &location);
  id v8 = ((void (**)(void, void *))v5)[2](v5, v44);
  [v4 registerHandler:v8 forRequestClass:objc_opt_class()];

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_9;
  v42[3] = &unk_2645CB778;
  objc_copyWeak(&v43, &location);
  id v9 = ((void (**)(void, void *))v5)[2](v5, v42);
  [v4 registerHandler:v9 forRequestClass:objc_opt_class()];

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_10;
  v40[3] = &unk_2645CB778;
  objc_copyWeak(&v41, &location);
  id v10 = ((void (**)(void, void *))v5)[2](v5, v40);
  [v4 registerHandler:v10 forRequestClass:objc_opt_class()];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_11;
  v38[3] = &unk_2645CB778;
  objc_copyWeak(&v39, &location);
  id v11 = ((void (**)(void, void *))v5)[2](v5, v38);
  [v4 registerHandler:v11 forRequestClass:objc_opt_class()];

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_12;
  v36[3] = &unk_2645CB778;
  objc_copyWeak(&v37, &location);
  v12 = ((void (**)(void, void *))v5)[2](v5, v36);
  [v4 registerHandler:v12 forRequestClass:objc_opt_class()];

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_13;
  v34[3] = &unk_2645CB7C8;
  objc_copyWeak(&v35, &location);
  v13 = ((void (**)(void, void *))v6)[2](v6, v34);
  [v4 registerHandler:v13 forNotificationClass:objc_opt_class()];

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_14;
  v32[3] = &unk_2645CB7C8;
  objc_copyWeak(&v33, &location);
  v14 = ((void (**)(void, void *))v6)[2](v6, v32);
  [v4 registerHandler:v14 forNotificationClass:objc_opt_class()];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_15;
  v30[3] = &unk_2645CB7C8;
  objc_copyWeak(&v31, &location);
  v15 = ((void (**)(void, void *))v6)[2](v6, v30);
  [v4 registerHandler:v15 forNotificationClass:objc_opt_class()];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_16;
  v28[3] = &unk_2645CB7C8;
  objc_copyWeak(&v29, &location);
  [v4 registerHandler:v28 forNotificationClass:objc_opt_class()];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_17;
  v26[3] = &unk_2645CB7C8;
  objc_copyWeak(&v27, &location);
  uint64_t v16 = ((void (**)(void, void *))v6)[2](v6, v26);
  [v4 registerHandler:v16 forNotificationClass:objc_opt_class()];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_18;
  v24[3] = &unk_2645CB7C8;
  objc_copyWeak(&v25, &location);
  v17 = ((void (**)(void, void *))v6)[2](v6, v24);
  [v4 registerHandler:v17 forNotificationClass:objc_opt_class()];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_19;
  v22[3] = &unk_2645CB7C8;
  objc_copyWeak(&v23, &location);
  v18 = ((void (**)(void, void *))v6)[2](v6, v22);
  [v4 registerHandler:v18 forNotificationClass:objc_opt_class()];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_20;
  v20[3] = &unk_2645CB7C8;
  objc_copyWeak(&v21, &location);
  v19 = ((void (**)(void, void *))v6)[2](v6, v20);
  [v4 registerHandler:v19 forNotificationClass:objc_opt_class()];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
}

id __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_2;
  v11[3] = &unk_2645CC2F0;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v12 = v3;
  id v4 = v3;
  objc_super v5 = (void *)MEMORY[0x223C8B4A0](v11);
  id v9 = (void *)MEMORY[0x223C8B4A0](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
      v13[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_3;
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

uint64_t __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

id __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_5;
  v11[3] = &unk_2645CC340;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v12 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x223C8B4A0](v11);
  id v9 = (void *)MEMORY[0x223C8B4A0](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_5(uint64_t a1, void *a2)
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
      id v12 = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_6;
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

uint64_t __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmCreateRequest:v8 callback:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmReadRequest:v8 callback:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmUpdateRequest:v8 callback:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmDeleteRequest:v8 callback:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmSnoozeRequest:v8 callback:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmDismissRequest:v8 callback:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_13(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmsAddedNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_14(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmsRemovedNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_15(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmFiringAlarmDismissedNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_16(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmFiredNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_17(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmsChangedNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_18(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmsUpdatedNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_19(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmManagerStateResetNotification:v5];
  }
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_20(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleAlarmSnoozeNotification:v5];
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
  v10[4] = objc_opt_class();
  uint64_t v6 = 0;
  v10[5] = objc_opt_class();
  do
    [v4 deregisterHandlerForRequestClass:v10[v6++]];
  while (v6 != 6);
  uint64_t v7 = [(COMeshAlarmAddOn *)self actionDirector];
  [v7 removeHandler:self];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__COMeshAlarmAddOn_willRemoveFromMeshController___block_invoke;
  v9[3] = &unk_2645CB288;
  v9[4] = self;
  [(COMeshAlarmAddOn *)self _withLock:v9];
  v8.receiver = self;
  v8.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAddOn *)&v8 willRemoveFromMeshController:v4];
}

uint64_t __49__COMeshAlarmAddOn_willRemoveFromMeshController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActionDirector:0];
}

- (void)willStartMeshController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshAlarmAddOn *)self observedAlarmManager];
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__alarmManagerAlarmFired_ name:*MEMORY[0x263F55C98] object:v5];
  [v6 addObserver:self selector:sel__alarmManagerStateReset_ name:*MEMORY[0x263F55CE0] object:v5];
  [v6 addObserver:self selector:sel__alarmManagerAlarmsChanged_ name:*MEMORY[0x263F55CA8] object:v5];
  [v6 addObserver:self selector:sel__alarmManagerFiringAlarmChanged_ name:*MEMORY[0x263F55CC8] object:v5];
  [(COMeshAlarmAddOn *)self _reloadIndexWithCompletion:0];
  v7.receiver = self;
  v7.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAddOn *)&v7 willStartMeshController:v4];
}

- (void)didStopMeshController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAddOn *)&v6 didStopMeshController:a3];
  id v4 = [(COMeshAlarmAddOn *)self observedAlarmManager];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F55CC8] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55CA8] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55CE0] object:v4];
  [v5 removeObserver:self name:*MEMORY[0x263F55C98] object:v4];
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAddOn *)&v16 meshController:v6 didTransitionToState:a4];
  objc_super v7 = [v6 nodes];
  if (a4 == 3)
  {
    objc_super v8 = [(COMeshAlarmAddOn *)self ourInterests];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__COMeshAlarmAddOn_meshController_didTransitionToState___block_invoke;
    v14[3] = &unk_2645CC390;
    id v15 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
  }
  id v9 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 didChangeCompositionForAlarmAddOn:self];
  }
  if (a4 == 3)
  {
    uint64_t v10 = [v6 me];
    uint64_t v11 = [v6 leader];
    if ([v10 isEqual:v11])
    {
      id v12 = [(COMeshAlarmAddOn *)self homekit];
      if ([v12 hasOptedToHH2])
      {
        char v13 = [MEMORY[0x263F33F80] isDistributedTimersEnabled];

        if (v13) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      [(COMeshAlarmAddOn *)self _startMerge];
    }
    else
    {
    }
  }
  else if (a4 == 2)
  {
    [(COMeshAlarmAddOn *)self _abandonMerge];
  }
LABEL_15:
}

void __56__COMeshAlarmAddOn_meshController_didTransitionToState___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v24.receiver = self;
  v24.super_class = (Class)COMeshAlarmAddOn;
  [(COMeshAddOn *)&v24 didChangeNodesForMeshController:v4];
  id v5 = [v4 nodes];
  id v6 = [(COMeshAddOn *)self meshController];
  BOOL v7 = [v6 state] == 3;

  objc_super v8 = [(COMeshAlarmAddOn *)self ourInterests];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __52__COMeshAlarmAddOn_didChangeNodesForMeshController___block_invoke;
  id v21 = &unk_2645CC3B8;
  id v9 = v5;
  id v22 = v9;
  BOOL v23 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v18];

  uint64_t v10 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 didChangeCompositionForAlarmAddOn:self];
  }
  uint64_t v11 = [(COMeshAlarmAddOn *)self mergingNodes];
  id v12 = [MEMORY[0x263EFF9C0] setWithArray:v11];
  char v13 = [MEMORY[0x263EFFA08] setWithArray:v9];
  [v12 minusSet:v13];
  if ([v12 count])
  {
    id v14 = (void *)[v11 mutableCopy];
    id v15 = [v12 allObjects];
    [v14 removeObjectsInArray:v15];

    [(COMeshAlarmAddOn *)self setMergingNodes:v14];
    if (![v14 count])
    {
      objc_super v16 = [(COMeshAlarmAddOn *)self mergeRequest];
      v17 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[COMeshAlarmAddOn didChangeNodesForMeshController:]();
      }

      [(COMeshAlarmAddOn *)self _finishMerge:v16];
    }
  }
}

void __52__COMeshAlarmAddOn_didChangeNodesForMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = COMeshNodeForIDSIdentifier(*(void **)(a1 + 32), a2);
  id v6 = (void *)v5;
  if (!v5 || *(unsigned char *)(a1 + 40)) {
    [v7 setPrimaryAvailable:v5 != 0];
  }
}

- (COMeshAlarmAddOnDelegate)delegate
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__24;
  id v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__COMeshAlarmAddOn_delegate__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMeshAlarmAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMeshAlarmAddOnDelegate *)v2;
}

uint64_t __28__COMeshAlarmAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__COMeshAlarmAddOn_setDelegate___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [(COMeshAlarmAddOn *)self _withLock:v6];
}

void __32__COMeshAlarmAddOn_setDelegate___block_invoke(uint64_t a1)
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
  objc_super v8 = __Block_byref_object_copy__24;
  id v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__COMeshAlarmAddOn_actionDirector__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMeshAlarmAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMTActionDirector *)v2;
}

void __34__COMeshAlarmAddOn_actionDirector__block_invoke(uint64_t a1)
{
}

- (BOOL)performsLocalActions
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v3 = [v2 processName];
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
  objc_super v8 = [(COMeshAddOn *)self meshController];
  id v9 = objc_alloc_init(MEMORY[0x263F58190]);
  id v10 = [(COMeshAddOn *)self meshControllerQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__COMeshAlarmAddOn__sendRequest_client___block_invoke;
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

void __40__COMeshAlarmAddOn__sendRequest_client___block_invoke(id *a1)
{
  id v2 = [a1[4] clientLifetimeActivity];
  uint64_t v3 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v2];

  if (v3)
  {
    [a1[5] setActivity:v3];
    nw_activity_activate();
  }
  id v5 = a1[5];
  id v4 = a1[6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__COMeshAlarmAddOn__sendRequest_client___block_invoke_2;
  v7[3] = &unk_2645CC3E0;
  id v8 = v3;
  id v9 = v5;
  id v10 = a1[4];
  id v11 = a1[7];
  id v12 = a1[6];
  id v6 = v3;
  [v4 sendRequest:v5 withCompletionHandler:v7];
}

void __40__COMeshAlarmAddOn__sendRequest_client___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
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
      uint64_t v18 = v17;
      if (!v17)
      {
        id v5 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v18 = [v5 bundleIdentifier];
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
    id v19 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 64);
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      int v23 = 134218498;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      v26 = v22;
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
  v18[3] = __Block_byref_object_copy__24;
  void v18[4] = __Block_byref_object_dispose__24;
  id v19 = (id)os_transaction_create();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke;
  v15[3] = &unk_2645CC408;
  id v8 = v7;
  id v16 = v8;
  v17 = v18;
  id v9 = (id)[v6 addFailureBlock:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2;
  v12[3] = &unk_2645CC430;
  id v10 = v8;
  id v13 = v10;
  xpc_object_t v14 = v18;
  id v11 = (id)[v6 addSuccessBlock:v12];

  _Block_object_dispose(v18, 8);
}

void __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_sendNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKey:*MEMORY[0x263F55CB0]];

  id v8 = [(COMeshAlarmAddOn *)self interests];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__COMeshAlarmAddOn__sendNotification___block_invoke;
  v11[3] = &unk_2645CDDA8;
  id v12 = v7;
  id v13 = self;
  id v14 = v4;
  id v9 = v4;
  id v10 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
}

void __38__COMeshAlarmAddOn__sendNotification___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __38__COMeshAlarmAddOn__sendNotification___block_invoke_2;
  id v19 = &unk_2645CD640;
  id v7 = a1[4];
  id v20 = a1[5];
  id v8 = v6;
  id v21 = v8;
  id v9 = [v7 indexesOfObjectsPassingTest:&v16];
  if (objc_msgSend(v9, "count", v16, v17, v18, v19, v20))
  {
    id v10 = [COMTAlarmNotificationAction alloc];
    id v11 = [a1[6] name];
    id v12 = [a1[4] objectsAtIndexes:v9];
    id v13 = [(COMTAlarmNotificationAction *)v10 initWithReason:v11 alarms:v12];

    id v14 = [a1[5] actionDirector];
    id v15 = [MEMORY[0x263EFFA08] setWithObject:v5];
    [v14 requestAction:v13 members:v15 withCompletion:&__block_literal_global_120];
  }
}

uint64_t __38__COMeshAlarmAddOn__sendNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isAlarm:a2 targetingAccessoryIdentifiers:*(void *)(a1 + 40)];
}

- (void)_alarmManagerAlarmsAdded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F55CB0]];

  id v7 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__COMeshAlarmAddOn__alarmManagerAlarmsAdded___block_invoke;
  block[3] = &unk_2645CAEF8;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v7, block);

  id v10 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 alarmAddOn:self didAddAlarms:v8];
  }
}

uint64_t __45__COMeshAlarmAddOn__alarmManagerAlarmsAdded___block_invoke(uint64_t a1)
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
        id v8 = objc_msgSend(v7, "lastModifiedDate", (void)v12);
        if (!v8)
        {
          id v8 = [MEMORY[0x263EFF910] distantPast];
        }
        id v9 = [*(id *)(a1 + 40) alarmIndex];
        id v10 = [v7 alarmID];
        [v9 setObject:v8 forKey:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _sendNotification:*(void *)(a1 + 48)];
}

- (void)_alarmManagerAlarmsRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F55CB0]];

  id v7 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COMeshAlarmAddOn__alarmManagerAlarmsRemoved___block_invoke;
  block[3] = &unk_2645CAEF8;
  id v8 = v6;
  id v12 = v8;
  long long v13 = self;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v7, block);

  id v10 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 alarmAddOn:self didRemoveAlarms:v8];
  }
}

uint64_t __47__COMeshAlarmAddOn__alarmManagerAlarmsRemoved___block_invoke(uint64_t a1)
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
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "alarmIndex", (void)v11);
        id v9 = [v7 alarmID];
        [v8 removeObjectForKey:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _sendNotification:*(void *)(a1 + 48)];
}

- (void)_alarmManagerAlarmsUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F55CB0]];

  id v7 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COMeshAlarmAddOn__alarmManagerAlarmsUpdated___block_invoke;
  block[3] = &unk_2645CAEF8;
  id v8 = v6;
  id v12 = v8;
  long long v13 = self;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v7, block);

  id v10 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 alarmAddOn:self didUpdateAlarms:v8];
  }
}

uint64_t __47__COMeshAlarmAddOn__alarmManagerAlarmsUpdated___block_invoke(uint64_t a1)
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
        id v8 = objc_msgSend(v7, "lastModifiedDate", (void)v12);
        if (!v8)
        {
          id v8 = [MEMORY[0x263EFF910] distantPast];
        }
        id v9 = [*(id *)(a1 + 40) alarmIndex];
        id v10 = [v7 alarmID];
        [v9 setObject:v8 forKey:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _sendNotification:*(void *)(a1 + 48)];
}

- (void)_alarmManagerFiringAlarmDismissed:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x263F55CB0]];

  uint64_t v5 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 alarmAddOn:self didDismissAlarms:v6];
  }
}

- (void)_startMerge
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COMeshAddOn *)self meshController];
  uint64_t v4 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v4);
  id v5 = [[COAlarmReadRequest alloc] initForMerge];
  [(COMeshAlarmAddOn *)self setMergeRequest:v5];
  id v6 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v3;
    __int16 v18 = 2048;
    id v19 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p starting merge for %p...", buf, 0x16u);
  }

  if ([(COMeshAlarmAddOn *)self performsLocalActions])
  {
    id v7 = [(COMeshAlarmAddOn *)self alarmManager];
    id v8 = [v7 alarms];
  }
  else
  {
    id v8 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__COMeshAlarmAddOn__startMerge__block_invoke;
  v12[3] = &unk_2645CC6D0;
  id v9 = v4;
  long long v13 = v9;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v5;
  id v14 = v10;
  id v11 = (id)[v8 addCompletionBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __31__COMeshAlarmAddOn__startMerge__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__COMeshAlarmAddOn__startMerge__block_invoke_2;
  block[3] = &unk_2645CC6A8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __31__COMeshAlarmAddOn__startMerge__block_invoke_2(uint64_t a1)
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
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshAddOn *)self meshController];
  id v9 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(COMeshAlarmAddOn *)self mergeRequest];

  if (v10 == v6)
  {
    id v11 = eTagForAlarms(v7);
    [v6 setETag:v11];
    long long v12 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v29 = v8;
      __int16 v30 = 2048;
      id v31 = v6;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p broadcasting merge %p with eTag %{public}@", buf, 0x20u);
    }

    id v13 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    [(COMeshAlarmAddOn *)self setMergingNodes:v13];

    id v14 = objc_alloc_init(NSDictionary);
    [(COMeshAlarmAddOn *)self setMergeResponses:v14];

    [(COMeshAlarmAddOn *)self setMergeAlarms:v7];
    objc_initWeak((id *)buf, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke;
    v25[3] = &unk_2645CC6F8;
    objc_copyWeak(&v27, (id *)buf);
    id v15 = v6;
    id v26 = v15;
    uint64_t v16 = (void *)MEMORY[0x223C8B4A0](v25);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2;
    id v22 = &unk_2645CC720;
    objc_copyWeak(&v24, (id *)buf);
    id v17 = v15;
    id v23 = v17;
    __int16 v18 = (void *)MEMORY[0x223C8B4A0](&v19);
    objc_msgSend(v8, "broadcastRequest:includingSelf:recipientsCallback:completionHandler:", v17, 0, v16, v18, v19, v20, v21, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v11 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v29 = v8;
      __int16 v30 = 2048;
      id v31 = v6;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p ignoring broadcast for merge %p", buf, 0x16u);
    }
  }
}

void __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _primeMerge:*(void *)(a1 + 32) withNodes:v5];
  }
}

void __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
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
      long long v12 = [WeakRetained mergingNodes];
      id v13 = (void *)[v12 mutableCopy];

      [v13 removeObject:v8];
      [v11 setMergingNodes:v13];
      if (![v13 count])
      {
        id v14 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1();
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
  id v9 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(COMeshAlarmAddOn *)self mergeRequest];

  if (v10 == v6)
  {
    [(COMeshAlarmAddOn *)self setMergingNodes:v7];
    uint64_t v12 = [v7 count];
    id v13 = COCoreLogForCategory(2);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        int v15 = 134218496;
        uint64_t v16 = v8;
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
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        id v18 = v6;
        _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p is solo, so %p is finished.", (uint8_t *)&v15, 0x16u);
      }

      [(COMeshAlarmAddOn *)self _finishMerge:v6];
    }
  }
  else
  {
    id v11 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      uint64_t v16 = v8;
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
  uint64_t v12 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(COMeshAlarmAddOn *)self mergeRequest];

  if (v13 == v8)
  {
    int v15 = [(COMeshAlarmAddOn *)self mergingNodes];
    BOOL v14 = [v15 mutableCopy];

    [v14 removeObject:v10];
    [(COMeshAlarmAddOn *)self setMergingNodes:v14];
    if ([v9 skipInMerge])
    {
      uint64_t v16 = COCoreLogForCategory(2);
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
      __int16 v17 = [(COMeshAlarmAddOn *)self mergeResponses];
      id v18 = (void *)[v17 mutableCopy];

      [v18 setObject:v9 forKey:v10];
      [(COMeshAlarmAddOn *)self setMergeResponses:v18];
    }
    uint64_t v19 = [v14 count];
    uint64_t v20 = COCoreLogForCategory(2);
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
        -[COMeshAlarmAddOn _continueMerge:withResponse:fromNode:]();
      }

      [(COMeshAlarmAddOn *)self _finishMerge:v8];
    }
  }
  else
  {
    BOOL v14 = COCoreLogForCategory(2);
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
  id v4 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(COMeshAlarmAddOn *)self mergeRequest];
  id v6 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218240;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p abandoning merge %p", (uint8_t *)&v9, 0x16u);
  }

  [(COMeshAlarmAddOn *)self setMergeRequest:0];
  id v7 = objc_alloc_init(NSDictionary);
  [(COMeshAlarmAddOn *)self setMergeResponses:v7];

  id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  [(COMeshAlarmAddOn *)self setMergingNodes:v8];

  [(COMeshAlarmAddOn *)self _processQueuedCommands];
}

- (id)_commandsForReconciling:(id)a3 toTruth:(id)a4 forNode:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF8C0] array];
  v54 = v8;
  __int16 v11 = (void *)[v8 mutableCopy];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v12 = (COAlarmsRemovedNotification *)v7;
  uint64_t v13 = [(COAlarmsRemovedNotification *)v12 countByEnumeratingWithState:&v55 objects:v66 count:16];
  objc_super v53 = v11;
  if (!v13)
  {
    int v15 = 0;
    id v51 = 0;
    __int16 v32 = v12;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v14 = v13;
  id v49 = v10;
  id v50 = v9;
  int v15 = 0;
  id v51 = 0;
  obj = v12;
  uint64_t v16 = *(void *)v56;
  unint64_t v17 = 0x263EFF000uLL;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v56 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      uint64_t v20 = [v19 alarmID];
      uint64_t v21 = [v54 objectForKey:v20];
      int v22 = (void *)v21;
      if (v21)
      {
        id v23 = (void *)MEMORY[0x263F55D40];
        v65[0] = v21;
        v65[1] = v19;
        __int16 v24 = [*(id *)(v17 + 2240) arrayWithObjects:v65 count:2];
        id v25 = [v23 mostRecentlyUpdatedAlarmForAlarms:v24];

        if (v19 != v25 && ([v19 isEqualIgnoringLastModifiedDate:v25] & 1) == 0)
        {
          if (v51)
          {
            uint64_t v26 = [v51 arrayByAddingObject:v25];

            id v51 = (void *)v26;
            unint64_t v17 = 0x263EFF000;
          }
          else
          {
            id v51 = [MEMORY[0x263EFF8C0] arrayWithObject:v25];
            unint64_t v17 = 0x263EFF000uLL;
          }
        }

        __int16 v11 = v53;
      }
      else if (v15)
      {
        uint64_t v27 = [v15 arrayByAddingObject:v19];

        int v15 = (void *)v27;
      }
      else
      {
        int v15 = [*(id *)(v17 + 2240) arrayWithObject:v19];
      }
      uint64_t v28 = [v19 alarmID];
      [v11 removeObjectForKey:v28];
    }
    uint64_t v12 = obj;
    uint64_t v14 = [(COAlarmsRemovedNotification *)obj countByEnumeratingWithState:&v55 objects:v66 count:16];
  }
  while (v14);

  if (!v51)
  {
    id v10 = v49;
    id v9 = v50;
    if (!v15) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  uint64_t v29 = [(COAlarmNotification *)[COAlarmsUpdatedNotification alloc] initWithAlarms:v51];
  __int16 v30 = COCoreLogForCategory(2);
  id v9 = v50;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v44 = [(COMeshAddOn *)self meshController];
    id v45 = [(COAlarmNotification *)v29 alarms];
    *(_DWORD *)buf = 134218498;
    v60 = v44;
    __int16 v61 = 2112;
    id v62 = v50;
    __int16 v63 = 2112;
    v64 = v45;
    _os_log_debug_impl(&dword_2217C1000, v30, OS_LOG_TYPE_DEBUG, "%p %@ updating %@", buf, 0x20u);

    __int16 v11 = v53;
  }

  uint64_t v31 = [v49 arrayByAddingObject:v29];

  id v10 = (void *)v31;
  if (v15)
  {
LABEL_25:
    __int16 v32 = [(COAlarmNotification *)[COAlarmsRemovedNotification alloc] initWithAlarms:v15];
    id v33 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      id v46 = [(COMeshAddOn *)self meshController];
      id v47 = [(COAlarmNotification *)v32 alarms];
      *(_DWORD *)buf = 134218498;
      v60 = v46;
      __int16 v61 = 2112;
      id v62 = v9;
      __int16 v63 = 2112;
      v64 = v47;
      _os_log_debug_impl(&dword_2217C1000, v33, OS_LOG_TYPE_DEBUG, "%p %@ removing %@", buf, 0x20u);

      __int16 v11 = v53;
    }

    uint64_t v34 = [v10 arrayByAddingObject:v32];

    id v10 = (void *)v34;
    goto LABEL_28;
  }
LABEL_29:
  if ([v11 count])
  {
    id v35 = [COAlarmsAddedNotification alloc];
    double v36 = [v11 allValues];
    id v37 = [(COAlarmNotification *)v35 initWithAlarms:v36];

    dispatch_time_t v38 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v42 = [(COMeshAddOn *)self meshController];
      id v43 = [(COAlarmNotification *)v37 alarms];
      *(_DWORD *)buf = 134218498;
      v60 = v42;
      __int16 v61 = 2112;
      id v62 = v9;
      __int16 v63 = 2112;
      v64 = v43;
      _os_log_debug_impl(&dword_2217C1000, v38, OS_LOG_TYPE_DEBUG, "%p %@ requires %@", buf, 0x20u);

      __int16 v11 = v53;
    }

    uint64_t v39 = [v10 arrayByAddingObject:v37];

    id v10 = (void *)v39;
  }
  id v40 = v10;

  return v40;
}

- (void)_finishMerge:(id)a3
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v80 = [(COMeshAddOn *)self meshController];
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COMeshAlarmAddOn *)self mergeRequest];

  if (v6 != v4)
  {
    id v7 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v146 = v80;
      __int16 v147 = 2048;
      id v148 = v4;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p ignoring conclusion of merge %p", buf, 0x16u);
    }
    goto LABEL_87;
  }
  id v79 = v4;
  id v8 = [(COMeshAlarmAddOn *)self mergeAlarms];
  v94 = self;
  id v9 = [(COMeshAlarmAddOn *)self mergeResponses];
  id v95 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v132 objects:v144 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v133;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v133 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v132 + 1) + 8 * i);
        uint64_t v16 = [v15 alarmID];
        [v95 setObject:v15 forKey:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v132 objects:v144 count:16];
    }
    while (v12);
  }

  id v97 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  unint64_t v17 = [(COMeshAlarmAddOn *)self deletes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v128 objects:v143 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v129;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v129 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = *(void **)(*((void *)&v128 + 1) + 8 * j);
        id v23 = [v22 identifier];
        [v97 setObject:v22 forKey:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v128 objects:v143 count:16];
    }
    while (v19);
  }
  v81 = v10;

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  obuint64_t j = v9;
  unint64_t v24 = 0x263EFF000uLL;
  id v86 = (id)[obj countByEnumeratingWithState:&v124 objects:v142 count:16];
  if (v86)
  {
    uint64_t v84 = *(void *)v125;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v125 != v84) {
          objc_enumerationMutation(obj);
        }
        uint64_t v90 = v25;
        uint64_t v26 = [obj objectForKey:*(void *)(*((void *)&v124 + 1) + 8 * v25)];
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        v92 = v26;
        uint64_t v27 = [v26 alarms];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v120 objects:v141 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v121;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v121 != v30) {
                objc_enumerationMutation(v27);
              }
              __int16 v32 = *(void **)(*((void *)&v120 + 1) + 8 * k);
              id v33 = [v32 alarmID];
              uint64_t v34 = [v95 objectForKey:v33];
              id v35 = (void *)v34;
              if (!v34) {
                goto LABEL_30;
              }
              double v36 = (void *)MEMORY[0x263F55D40];
              v140[0] = v34;
              v140[1] = v32;
              id v37 = [*(id *)(v24 + 2240) arrayWithObjects:v140 count:2];
              dispatch_time_t v38 = [v36 mostRecentlyUpdatedAlarmForAlarms:v37];

              if (v32 == v38) {
LABEL_30:
              }
                [v95 setObject:v32 forKey:v33];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v120 objects:v141 count:16];
          }
          while (v29);
        }

        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        uint64_t v39 = [v92 deletes];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v116 objects:v139 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v117;
          do
          {
            for (uint64_t m = 0; m != v41; ++m)
            {
              if (*(void *)v117 != v42) {
                objc_enumerationMutation(v39);
              }
              id v44 = *(void **)(*((void *)&v116 + 1) + 8 * m);
              id v45 = [v44 identifier];
              id v46 = [v97 objectForKey:v45];
              if (!v46
                || ([v44 date],
                    id v47 = objc_claimAutoreleasedReturnValue(),
                    [v46 date],
                    objc_super v48 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v49 = [v47 compare:v48],
                    v48,
                    v47,
                    v49 == -1))
              {
                [v97 setObject:v44 forKey:v45];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v116 objects:v139 count:16];
          }
          while (v41);
        }

        uint64_t v25 = v90 + 1;
        unint64_t v24 = 0x263EFF000;
      }
      while ((id)(v90 + 1) != v86);
      id v86 = (id)[obj countByEnumeratingWithState:&v124 objects:v142 count:16];
    }
    while (v86);
  }

  id v50 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _finishMerge:]();
  }

  v114[0] = MEMORY[0x263EF8330];
  v114[1] = 3221225472;
  v114[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke;
  v114[3] = &unk_2645CDDD0;
  id v51 = v95;
  id v115 = v51;
  [v97 enumerateKeysAndObjectsUsingBlock:v114];
  v52 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _finishMerge:]();
  }

  v96 = [MEMORY[0x263EFF980] array];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v83 = v51;
  objc_super v53 = [(COMeshAlarmAddOn *)v94 _commandsForReconciling:v81 toTruth:v51 forNode:0];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v110 objects:v138 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v111;
    do
    {
      for (uint64_t n = 0; n != v55; ++n)
      {
        if (*(void *)v111 != v56) {
          objc_enumerationMutation(v53);
        }
        uint64_t v58 = *(void *)(*((void *)&v110 + 1) + 8 * n);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v59 = v109;
          v109[0] = MEMORY[0x263EF8330];
          v109[1] = 3221225472;
          v60 = __33__COMeshAlarmAddOn__finishMerge___block_invoke_137;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v59 = v108;
            v108[0] = MEMORY[0x263EF8330];
            v108[1] = 3221225472;
            v60 = __33__COMeshAlarmAddOn__finishMerge___block_invoke_2;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            v59 = v107;
            v107[0] = MEMORY[0x263EF8330];
            v107[1] = 3221225472;
            v60 = __33__COMeshAlarmAddOn__finishMerge___block_invoke_3;
          }
        }
        v59[2] = v60;
        v59[3] = &unk_2645CAE80;
        v59[4] = v94;
        v59[5] = v58;
        __int16 v61 = (void *)MEMORY[0x223C8B4A0]();
        [v96 addObject:v61];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v110 objects:v138 count:16];
    }
    while (v55);
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v104 = 0u;
  long long v103 = 0u;
  id v87 = obj;
  unint64_t v62 = 0x263EFF000;
  uint64_t v85 = [v87 countByEnumeratingWithState:&v103 objects:v137 count:16];
  if (v85)
  {
    uint64_t v82 = *(void *)v104;
    do
    {
      uint64_t v63 = 0;
      do
      {
        if (*(void *)v104 != v82) {
          objc_enumerationMutation(v87);
        }
        v64 = *(void **)(*((void *)&v103 + 1) + 8 * v63);
        v65 = [v87 objectForKey:v64];
        v91 = v65;
        uint64_t v93 = v63;
        if ([v65 notModified])
        {
          v66 = v81;
          uint64_t v67 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v146 = v80;
            __int16 v147 = 2112;
            id v148 = v64;
            _os_log_debug_impl(&dword_2217C1000, v67, OS_LOG_TYPE_DEBUG, "%p response is not-modified for %@", buf, 0x16u);
          }
        }
        else
        {
          v66 = [v65 alarms];
        }
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        obja = v66;
        v68 = [(COMeshAlarmAddOn *)v94 _commandsForReconciling:v66 toTruth:v83 forNode:v64];
        uint64_t v69 = [v68 countByEnumeratingWithState:&v99 objects:v136 count:16];
        if (v69)
        {
          uint64_t v70 = v69;
          uint64_t v71 = *(void *)v100;
          do
          {
            for (iuint64_t i = 0; ii != v70; ++ii)
            {
              if (*(void *)v100 != v71) {
                objc_enumerationMutation(v68);
              }
              uint64_t v73 = *(void *)(*((void *)&v99 + 1) + 8 * ii);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v98[0] = MEMORY[0x263EF8330];
                v98[1] = 3221225472;
                v98[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke_139;
                v98[3] = &unk_2645CAEF8;
                v98[4] = v94;
                v98[5] = v73;
                v98[6] = v64;
                v74 = (void *)MEMORY[0x223C8B4A0](v98);
                [v96 addObject:v74];
              }
            }
            uint64_t v70 = [v68 countByEnumeratingWithState:&v99 objects:v136 count:16];
          }
          while (v70);
        }

        uint64_t v63 = v93 + 1;
        unint64_t v62 = 0x263EFF000uLL;
      }
      while (v93 + 1 != v85);
      uint64_t v85 = [v87 countByEnumeratingWithState:&v103 objects:v137 count:16];
    }
    while (v85);
  }

  [(COMeshAlarmAddOn *)v94 setMergeRequest:0];
  [(COMeshAlarmAddOn *)v94 setMergeAlarms:0];
  id v75 = objc_alloc_init(NSDictionary);
  [(COMeshAlarmAddOn *)v94 setMergeResponses:v75];

  id v76 = objc_alloc_init(*(Class *)(v62 + 2240));
  [(COMeshAlarmAddOn *)v94 setMergingNodes:v76];

  v77 = [(COMeshAlarmAddOn *)v94 queuedCommands];
  [v96 addObjectsFromArray:v77];

  [(COMeshAlarmAddOn *)v94 setQueuedCommands:v96];
  v78 = COCoreLogForCategory(2);
  id v4 = v79;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v146 = v80;
    __int16 v147 = 2048;
    id v148 = v79;
    _os_log_impl(&dword_2217C1000, v78, OS_LOG_TYPE_DEFAULT, "%p concluded merge %p", buf, 0x16u);
  }

  [(COMeshAlarmAddOn *)v94 _processQueuedCommands];
  id v7 = v81;
LABEL_87:
}

void __33__COMeshAlarmAddOn__finishMerge___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3) {
    [*(id *)(a1 + 32) removeObjectForKey:v4];
  }
}

uint64_t __33__COMeshAlarmAddOn__finishMerge___block_invoke_137(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAlarmsUpdatedNotification:*(void *)(a1 + 40)];
}

uint64_t __33__COMeshAlarmAddOn__finishMerge___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAlarmsAddedNotification:*(void *)(a1 + 40)];
}

uint64_t __33__COMeshAlarmAddOn__finishMerge___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAlarmsRemovedNotification:*(void *)(a1 + 40)];
}

void __33__COMeshAlarmAddOn__finishMerge___block_invoke_139(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) meshController];
  [v2 sendCommand:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 48)];
}

- (void)_reloadIndexWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshAlarmAddOn *)self observedAlarmManager];
  id v6 = [v5 alarms];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke;
  v14[3] = &unk_2645CB3E0;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v15 = v7;
  id v8 = (id)[v6 addFailureBlock:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_2;
  v11[3] = &unk_2645CC770;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = (id)[v6 addSuccessBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_cold_1();
    }

    id v6 = [WeakRetained meshControllerQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_140;
    v7[3] = &unk_2645CBA10;
    void v7[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

uint64_t __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_140(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlarmIndex:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
          id v13 = objc_msgSend(v12, "alarmID", v17);
          uint64_t v14 = [v12 lastModifiedDate];
          if (!v14)
          {
            uint64_t v14 = [MEMORY[0x263EFF910] distantPast];
          }
          [v6 setObject:v14 forKey:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v15 = [WeakRetained meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_3;
    block[3] = &unk_2645CB330;
    void block[4] = WeakRetained;
    id v19 = v6;
    id v20 = *(id *)(a1 + 32);
    id v16 = v6;
    dispatch_async(v15, block);

    id v3 = v17;
  }
}

uint64_t __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) alarmIndex];
  int v3 = [v2 isEqualToDictionary:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setAlarmIndex:*(void *)(a1 + 40)];
  id v4 = COCoreLogForCategory(2);
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
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p alarm index reloaded; updated: %s",
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
  int v3 = [(COMeshAlarmAddOn *)self queuedCommands];
  [(COMeshAlarmAddOn *)self setQueuedCommands:MEMORY[0x263EFFA68]];
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

- (void)_addAlarmDeleteEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshAlarmAddOn *)self deletes];
  uint64_t v6 = [v5 arrayByAddingObject:v4];

  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v8 = [MEMORY[0x263EFF910] now];
  long long v9 = [v7 dateByAddingUnit:16 value:-7 toDate:v8 options:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__COMeshAlarmAddOn__addAlarmDeleteEvent___block_invoke;
  v14[3] = &unk_2645CDDF8;
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
  [(COMeshAlarmAddOn *)self setDeletes:v13];
}

BOOL __41__COMeshAlarmAddOn__addAlarmDeleteEvent___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 date];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == -1;

  return v4;
}

- (void)_alarmManagerAlarmFired:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  BOOL v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F55CB0]];

  uint64_t v6 = [(COMeshAlarmAddOn *)self homekit];
  uint64_t v7 = [v6 currentAccessory];
  if (([v6 hasOptedToHH2] & 1) != 0 || !v7) {
    goto LABEL_45;
  }
  uint64_t v8 = [v6 homeForAccessory:v7];
  long long v57 = v6;
  uint64_t v58 = v5;
  uint64_t v63 = v7;
  if (!v8)
  {
    long long v9 = 0;
    goto LABEL_18;
  }
  long long v9 = [v6 mediaSystemForAccessory:v7 inHome:v8];
  if (!v9
    || ([v6 accessoriesInMediaSystem:v9 inHome:v8],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_18:
    long long v11 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[COMeshAlarmAddOn _alarmManagerAlarmFired:].cold.4();
    }
    goto LABEL_20;
  }
  long long v11 = v10;
  long long v12 = [v10 firstObject];
  v60 = v8;
  v59 = v9;
  if ([v12 isEqual:v7])
  {
    uint64_t v13 = [v11 objectAtIndex:1];

    long long v12 = (void *)v13;
  }
  uint64_t v56 = v12;
  uint64_t v14 = [v12 device];
  id v15 = [v14 idsIdentifier];
  id v16 = [v15 UUIDString];

  [(COMeshAddOn *)self meshController];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  __int16 v61 = v78 = 0u;
  id v17 = [v61 nodes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (!v18)
  {
LABEL_56:

    uint64_t v5 = v58;
    long long v9 = v59;
    uint64_t v7 = v63;
    uint64_t v8 = v60;
LABEL_20:

    uint64_t v25 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[COMeshAlarmAddOn _alarmManagerAlarmFired:]();
    }

    uint64_t v26 = [MEMORY[0x263EFF980] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v27 = v5;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v72;
      id v62 = v27;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v72 != v30) {
            objc_enumerationMutation(v27);
          }
          __int16 v32 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if (([v32 isEnabled] & 1) == 0
            && [(COMeshAlarmAddOn *)self _isAlarm:v32 targetingAccessory:v7])
          {
            id v33 = v26;
            uint64_t v34 = COCoreLogForCategory(2);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v41 = [v32 alarmID];
              *(_DWORD *)buf = 134218242;
              v80 = self;
              __int16 v81 = 2112;
              uint64_t v82 = v41;
              _os_log_debug_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEBUG, "%p %@ is not enabled, so will update.", buf, 0x16u);
            }
            id v35 = (void *)[v32 mutableCopy];
            [v35 setFiredDate:0];
            [v35 setSnoozeFireDate:0];
            [v35 setEnabled:0];
            id v36 = objc_alloc_init(MEMORY[0x263F58190]);
            id v37 = [(COAlarmRequest *)[COAlarmUpdateRequest alloc] initWithAlarm:v35];
            dispatch_time_t v38 = [(COMeshAddOn *)self meshControllerQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke;
            block[3] = &unk_2645CDE48;
            void block[4] = self;
            uint64_t v67 = v37;
            uint64_t v69 = v32;
            uint64_t v70 = self;
            id v68 = v36;
            id v39 = v36;
            uint64_t v40 = v37;
            dispatch_async(v38, block);

            uint64_t v26 = v33;
            [v33 addObject:v39];

            id v27 = v62;
            uint64_t v7 = v63;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v29);
    }

    if ([v26 count])
    {
      uint64_t v42 = (void *)MEMORY[0x263F581B8];
      id v43 = [(COMeshAddOn *)self meshControllerQueue];
      id v44 = [v42 schedulerWithDispatchQueue:v43];

      id v45 = [MEMORY[0x263F58190] combineAllFutures:v26 ignoringErrors:1 scheduler:v44];

      uint64_t v6 = v57;
      uint64_t v5 = v58;
    }
    else
    {
      id v46 = COCoreLogForCategory(2);
      uint64_t v6 = v57;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[COMeshAlarmAddOn _alarmManagerAlarmFired:]();
      }

      id v45 = [MEMORY[0x263F58190] futureWithNoResult];
      uint64_t v5 = v58;
    }
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_152;
    v64[3] = &unk_2645CDE70;
    v64[4] = self;
    id v65 = v27;
    id v47 = (id)[v45 addCompletionBlock:v64];

LABEL_53:
    goto LABEL_54;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v76;
LABEL_10:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v76 != v20) {
      objc_enumerationMutation(v17);
    }
    long long v22 = *(void **)(*((void *)&v75 + 1) + 8 * v21);
    long long v23 = [v22 IDSIdentifier];
    int v24 = [v16 isEqual:v23];

    if (v24) {
      break;
    }
    if (v19 == ++v21)
    {
      uint64_t v19 = [v17 countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v19) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }
  objc_super v48 = [v61 me];
  uint64_t v49 = [v22 remote];
  if ([v49 compare:v48] != -1)
  {
    id v50 = [v49 software];
    int v51 = [v50 hasPrefix:@"14."];

    if (!v51)
    {

      goto LABEL_56;
    }
  }
  v52 = COCoreLogForCategory(2);
  uint64_t v6 = v57;
  uint64_t v5 = v58;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn _alarmManagerAlarmFired:].cold.5((uint64_t)self);
  }

  uint64_t v7 = v63;
LABEL_45:
  objc_super v53 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v80 = self;
    _os_log_impl(&dword_2217C1000, v53, OS_LOG_TYPE_DEFAULT, "%p posting fired notification.", buf, 0xCu);
  }

  uint64_t v26 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v26 alarmAddOn:self didFireAlarms:v5];
  }
  if ([(COMeshAlarmAddOn *)self performsLocalActions])
  {
    id v45 = [(COMeshAddOn *)self meshController];
    uint64_t v54 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn _timerManagerTimerFired:]();
    }

    uint64_t v55 = [(COAlarmNotification *)[COAlarmFiredNotification alloc] initWithAlarms:v5];
    [v45 sendNotification:v55];

    goto LABEL_53;
  }
LABEL_54:
}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2;
  v4[3] = &unk_2645CDE20;
  id v5 = *(id *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 56);
  [v2 handleAlarmUpdateRequest:v3 callback:v4];
}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_152(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 134217984;
    uint64_t v9 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p done synchronizing, so posting notification.", (uint8_t *)&v8, 0xCu);
  }

  BOOL v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 alarmAddOn:*(void *)(a1 + 32) didFireAlarms:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 32) performsLocalActions])
  {
    id v5 = [*(id *)(a1 + 32) meshController];
    id v6 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn _timerManagerTimerFired:]();
    }

    uint64_t v7 = [(COAlarmNotification *)[COAlarmFiredNotification alloc] initWithAlarms:*(void *)(a1 + 40)];
    [v5 sendNotification:v7];
  }
}

- (void)_alarmManagerStateReset:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__COMeshAlarmAddOn__alarmManagerStateReset___block_invoke;
  v5[3] = &unk_2645CC1E0;
  objc_copyWeak(&v6, &location);
  [(COMeshAlarmAddOn *)self _reloadIndexWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__COMeshAlarmAddOn__alarmManagerStateReset___block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained meshController];
    if (a2)
    {
      id v6 = objc_alloc_init(COAlarmManagerStateResetNotification);
      uint64_t v7 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke_cold_1();
      }

      [v5 sendNotification:v6];
      int v8 = [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        [v8 didResetAlarmAddOn:v4];
      }
    }
    else
    {
      COCoreLogForCategory(2);
      id v6 = (COAlarmManagerStateResetNotification *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        uint64_t v10 = v5;
        _os_log_impl(&dword_2217C1000, &v6->super.super.super, OS_LOG_TYPE_DEFAULT, "%p not emitting state reset, alarms not updated", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)_alarmManagerAlarmsChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x263F55CB0]];

  id v5 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 alarmAddOn:self didChangeAlarms:v6];
  }
}

- (void)_alarmManagerFiringAlarmChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x263F55CB0]];

  id v5 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 alarmAddOn:self didChangeFiringAlarms:v6];
  }
}

- (void)_accessorySettingValueUpdated:(id)a3
{
  id v9 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v9 keyPath];
    int v5 = [v4 isEqualToString:@"root.mobileTimer.alarms"];

    if (v5)
    {
      id v6 = [(COMeshAlarmAddOn *)self homekit];
      uint64_t v7 = [v6 currentAccessory];
      if (v7)
      {
        int v8 = [v6 homeForAccessory:v7];
        if (v8 && [v6 isAlarmsCollectionSetting:v9 forAccessory:v7 inHome:v8]) {
          [(COMeshAlarmAddOn *)self _replicateToMobileTimerFromHomeKit];
        }
      }
      else
      {
        int v8 = [(COMeshAlarmAddOn *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v8 didResetAlarmAddOn:self];
        }
      }
    }
  }
}

- (id)_currentAccessoryForConnection:(id)a3
{
  id v4 = objc_msgSend(a3, "co_PeerInstance");
  if (v4)
  {
    int v5 = [(COMeshAlarmAddOn *)self homehub];
    id v6 = [(COMeshAlarmAddOn *)self homekit];
    uint64_t v7 = [v5 accessoryForPeerInstance:v4 usingHomeKitAdapter:v6];
  }
  else
  {
    int v5 = [(COMeshAlarmAddOn *)self homekit];
    uint64_t v7 = [v5 currentAccessory];
  }

  return v7;
}

- (void)_replicateToMobileTimerFromHomeKit
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(COMeshAlarmAddOn *)self performsLocalActions])
  {
    uint64_t v3 = [(COMeshAlarmAddOn *)self homekit];
    char v4 = [v3 hasOptedToHH2];

    if ((v4 & 1) == 0)
    {
      int v5 = [(COMeshAddOn *)self meshController];
      id v6 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        long long v23 = v5;
        _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p starting replication of alarms...", buf, 0xCu);
      }

      uint64_t v7 = [(COMeshAlarmAddOn *)self homekit];
      int v8 = [v7 currentAccessory];
      if (v8)
      {
        id v9 = [v7 homeForAccessory:v8];
        if (v9)
        {
          uint64_t v10 = [v7 alarmsForAccessory:v8 inHome:v9];
          if (v10)
          {
            uint64_t v11 = [(COMeshAlarmAddOn *)self alarmManager];
            long long v12 = [v11 alarms];
            v15[0] = MEMORY[0x263EF8330];
            v15[1] = 3221225472;
            v15[2] = __54__COMeshAlarmAddOn__replicateToMobileTimerFromHomeKit__block_invoke;
            v15[3] = &unk_2645CDE98;
            void v15[4] = self;
            id v16 = v8;
            id v17 = v10;
            id v18 = v5;
            id v19 = v11;
            id v20 = v7;
            id v21 = v9;
            id v13 = v11;
            id v14 = (id)[v12 addSuccessBlock:v15];
          }
        }
      }
    }
  }
}

void __54__COMeshAlarmAddOn__replicateToMobileTimerFromHomeKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v80 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) _isAlarm:v11 targetingAccessory:*(void *)(a1 + 40)])
        {
          [v4 addObject:v11];
          long long v12 = [v11 alarmID];
          [v5 setObject:v11 forKey:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v79 objects:v92 count:16];
    }
    while (v8);
  }
  __int16 v61 = v4;

  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v75 objects:v91 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v76 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        id v20 = [v19 alarmID];
        [v13 setObject:v19 forKey:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v75 objects:v91 count:16];
    }
    while (v16);
  }
  v60 = v6;

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v21 = v13;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v71 objects:v90 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v66 = *(void *)v72;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v72 != v66) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v71 + 1) + 8 * v24);
        uint64_t v26 = objc_msgSend(v21, "objectForKey:", v25, v60, v61);
        id v27 = [v5 objectForKey:v25];
        if (v27)
        {
          uint64_t v28 = [v26 COPreferredAlarm:v27];
          if (v27 == (void *)v28)
          {
          }
          else
          {
            uint64_t v29 = (void *)v28;
            char v30 = [v26 isEqualIgnoringLastModifiedDate:v27];

            if ((v30 & 1) == 0)
            {
              if (objc_msgSend(v27, "co_isMediaSystemOriginating")
                && !objc_msgSend(v26, "co_isMediaSystemOriginating"))
              {
                id v39 = objc_msgSend(v26, "co_HomeKitAlarmCopy");
                uint64_t v40 = COCoreLogForCategory(2);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v62 = *(void *)(a1 + 56);
                  v64 = [v39 alarmID];
                  [v26 alarmID];
                  uint64_t v41 = v63 = v39;
                  *(_DWORD *)buf = 134218498;
                  uint64_t v85 = v62;
                  __int16 v86 = 2112;
                  id v87 = v64;
                  __int16 v88 = 2112;
                  v89 = v41;
                  _os_log_impl(&dword_2217C1000, v40, OS_LOG_TYPE_DEFAULT, "%p swapping %@ for %@", buf, 0x20u);

                  id v39 = v63;
                }

                id v42 = (id)[*(id *)(a1 + 72) removeAlarm:v26 fromAccessory:*(void *)(a1 + 40) inHome:*(void *)(a1 + 80)];
                id v43 = (id)[*(id *)(a1 + 72) addAlarm:v39 toAccessory:*(void *)(a1 + 40) inHome:*(void *)(a1 + 80)];
              }
              else
              {
                uint64_t v31 = COCoreLogForCategory(2);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v65 = *(void *)(a1 + 56);
                  id v46 = [v26 alarmID];
                  *(_DWORD *)buf = 134218242;
                  uint64_t v85 = v65;
                  __int16 v86 = 2112;
                  id v87 = v46;
                  _os_log_debug_impl(&dword_2217C1000, v31, OS_LOG_TYPE_DEBUG, "%p updating alarm %@", buf, 0x16u);
                }
                id v32 = (id)[*(id *)(a1 + 64) updateAlarm:v26];
              }
LABEL_41:
              [v5 removeObjectForKey:v25];
              goto LABEL_42;
            }
          }
          if (([v27 isFiring] & 1) != 0 || objc_msgSend(v27, "isSnoozed"))
          {
            id v35 = objc_msgSend(v27, "co_alarmUpdatedWithHomeKitAlarm:", v26);
            if (v35)
            {
              id v36 = COCoreLogForCategory(2);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v37 = *(void *)(a1 + 56);
                *(_DWORD *)buf = 134218242;
                uint64_t v85 = v37;
                __int16 v86 = 2112;
                id v87 = v35;
                _os_log_impl(&dword_2217C1000, v36, OS_LOG_TYPE_DEFAULT, "%p targeted updating alarm %@", buf, 0x16u);
              }

              id v38 = (id)[*(id *)(a1 + 64) updateAlarm:v35];
            }
          }
          goto LABEL_41;
        }
        id v33 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v44 = *(void *)(a1 + 56);
          id v45 = [v26 alarmID];
          *(_DWORD *)buf = 134218242;
          uint64_t v85 = v44;
          __int16 v86 = 2112;
          id v87 = v45;
          _os_log_debug_impl(&dword_2217C1000, v33, OS_LOG_TYPE_DEBUG, "%p adding alarm %@", buf, 0x16u);
        }
        id v34 = (id)[*(id *)(a1 + 64) addAlarm:v26];
LABEL_42:

        ++v24;
      }
      while (v23 != v24);
      uint64_t v47 = [v21 countByEnumeratingWithState:&v71 objects:v90 count:16];
      uint64_t v23 = v47;
    }
    while (v47);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v48 = v5;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v68 != v51) {
          objc_enumerationMutation(v48);
        }
        objc_super v53 = objc_msgSend(v48, "objectForKey:", *(void *)(*((void *)&v67 + 1) + 8 * k), v60);
        if ([*(id *)(a1 + 32) _isAlarm:v53 targetingAccessory:*(void *)(a1 + 40)])
        {
          uint64_t v54 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v56 = *(void *)(a1 + 56);
            long long v57 = [v53 alarmID];
            *(_DWORD *)buf = 134218242;
            uint64_t v85 = v56;
            __int16 v86 = 2112;
            id v87 = v57;
            _os_log_debug_impl(&dword_2217C1000, v54, OS_LOG_TYPE_DEBUG, "%p removing alarm %@", buf, 0x16u);
          }
          id v55 = (id)[*(id *)(a1 + 64) removeAlarm:v53];
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v50);
  }

  uint64_t v58 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v59 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    uint64_t v85 = v59;
    _os_log_impl(&dword_2217C1000, v58, OS_LOG_TYPE_DEFAULT, "... %p finished replication of alarms.", buf, 0xCu);
  }
}

- (id)_filteredAlarmsList:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[COMeshTimerAddOn _filteredTimersList:forAccessory:]();
  }

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __53__COMeshAlarmAddOn__filteredAlarmsList_forAccessory___block_invoke;
  uint64_t v17 = &unk_2645CD640;
  id v9 = v7;
  id v18 = v9;
  id v19 = self;
  uint64_t v10 = [v6 indexesOfObjectsPassingTest:&v14];
  if (objc_msgSend(v10, "count", v14, v15, v16, v17))
  {
    uint64_t v11 = (void *)[v6 mutableCopy];
    [v11 removeObjectsAtIndexes:v10];

    id v6 = v11;
  }
  id v12 = v6;

  return v12;
}

uint64_t __53__COMeshAlarmAddOn__filteredAlarmsList_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", a2);
  }
  else
  {
    id v3 = [a2 siriContext];
    char v4 = [v3 objectForKey:*MEMORY[0x263F33D90]];
    int v2 = v4 == 0;
  }
  return v2 ^ 1u;
}

- (id)_alarmsForAccessory:(id)a3 allowLocalStorage:(BOOL)a4 usingLeader:(BOOL)a5 member:(id)a6 client:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [(COMeshAddOn *)self meshController];
  id v16 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v17 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke;
  block[3] = &unk_2645CDF60;
  id v27 = v13;
  id v28 = v15;
  id v29 = v12;
  id v30 = v14;
  uint64_t v31 = self;
  id v18 = v16;
  id v32 = v18;
  BOOL v33 = a4;
  BOOL v34 = a5;
  id v19 = v14;
  id v20 = v12;
  id v21 = v15;
  id v22 = v13;
  dispatch_async(v17, block);

  uint64_t v23 = v32;
  id v24 = v18;

  return v24;
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    int v2 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v69 = v3;
      __int16 v70 = 2114;
      uint64_t v71 = v4;
      _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster alarms for %{public}@", buf, 0x16u);
    }

    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = +[COMTReadAction actionWithTargetType:v6 targetMemento:*(void *)(a1 + 48)];

    uint64_t v8 = [*(id *)(a1 + 56) clientLifetimeActivity];
    id v9 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v8];

    if (v9) {
      nw_activity_activate();
    }
    uint64_t v10 = [*(id *)(a1 + 64) meshControllerQueue];
    objc_initWeak((id *)buf, *(id *)(a1 + 64));
    uint64_t v11 = [*(id *)(a1 + 64) actionDirector];
    id v12 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_167;
    v61[3] = &unk_2645CDEE8;
    id v13 = v10;
    id v62 = v13;
    objc_copyWeak(&v67, (id *)buf);
    id v14 = v9;
    id v63 = v14;
    uint64_t v15 = v7;
    v64 = v15;
    id v65 = *(id *)(a1 + 56);
    id v66 = *(id *)(a1 + 72);
    [v11 requestAction:v15 members:v12 activity:v14 withCompletion:v61];

    id v16 = [*(id *)(a1 + 64) recorder];
    ((void (**)(void, uint64_t, void *))v16)[2](v16, 0x26D3D5C68, &__block_literal_global_170);

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);
  }
  else if (*(unsigned char *)(a1 + 80) {
         && [*(id *)(a1 + 64) performsLocalActions]
  }
         && ([*(id *)(a1 + 40) leader],
             uint64_t v17 = objc_claimAutoreleasedReturnValue(),
             v17,
             !v17))
  {
    BOOL v34 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)(a1 + 40);
      uint64_t v36 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v69 = v35;
      __int16 v70 = 2112;
      uint64_t v71 = v36;
      _os_log_impl(&dword_2217C1000, v34, OS_LOG_TYPE_DEFAULT, "%p using local list of alarms for %@", buf, 0x16u);
    }

    uint64_t v37 = [*(id *)(a1 + 64) alarmManager];
    id v38 = [v37 alarms];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_171;
    v56[3] = &unk_2645CC480;
    id v39 = (COAlarmReadRequest *)*(id *)(a1 + 48);
    uint64_t v40 = *(void *)(a1 + 64);
    long long v57 = v39;
    uint64_t v58 = v40;
    id v59 = *(id *)(a1 + 40);
    id v60 = *(id *)(a1 + 72);
    id v41 = (id)[v38 addCompletionBlock:v56];

    id v42 = [*(id *)(a1 + 64) recorder];
    ((void (**)(void, uint64_t, void *))v42)[2](v42, 0x26D3D5C68, &__block_literal_global_175);

    uint64_t v15 = v57;
  }
  else
  {
    id v18 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v69 = v19;
      __int16 v70 = 2112;
      uint64_t v71 = v20;
      _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p requesting list of alarms for %@ from the leader", buf, 0x16u);
    }

    id v21 = [COAlarmReadRequest alloc];
    id v22 = [*(id *)(a1 + 48) uniqueIdentifier];
    uint64_t v23 = [(COAlarmReadRequest *)v21 initWithAccessoryUniqueIdentifier:v22 requiresFilter:1];

    if (*(unsigned char *)(a1 + 81))
    {
      id v24 = [*(id *)(a1 + 56) clientLifetimeActivity];
      uint64_t v25 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v24];

      if (v25)
      {
        [(COMeshRequest *)v23 setActivity:v25];
        nw_activity_activate();
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_176;
    v48[3] = &unk_2645CDF10;
    id v26 = v25;
    id v49 = v26;
    id v50 = *(id *)(a1 + 56);
    id v51 = *(id *)(a1 + 48);
    uint64_t v15 = v23;
    v52 = v15;
    id v27 = *(id *)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 64);
    id v29 = *(void **)(a1 + 72);
    id v53 = v27;
    uint64_t v54 = v28;
    id v55 = v29;
    id v30 = (void *)MEMORY[0x223C8B4A0](v48);
    uint64_t v31 = v30;
    if (*(unsigned char *)(a1 + 81))
    {
      [*(id *)(a1 + 40) sendRequest:v15 withCompletionHandler:v30];
    }
    else
    {
      id v32 = *(void **)(a1 + 64);
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_180;
      v45[3] = &unk_2645CDF38;
      id v47 = v30;
      id v46 = v15;
      [v32 handleAlarmReadRequest:v46 callback:v45];
    }
    BOOL v33 = [*(id *)(a1 + 64) recorder];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2_181;
    v43[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
    char v44 = *(unsigned char *)(a1 + 81);
    ((void (**)(void, uint64_t, void *))v33)[2](v33, 0x26D3D5C68, v43);
  }
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2;
  block[3] = &unk_2645CDEC0;
  objc_copyWeak(&v17, (id *)(a1 + 72));
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = v6;
  id v15 = v5;
  id v16 = *(id *)(a1 + 64);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v17);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v17 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      if (v4)
      {
        id v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        id v6 = objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_string(v4, "command", (const char *)[v6 UTF8String]);

        id v7 = [*(id *)(a1 + 48) clientBundleIdentifier];
        id v8 = v7;
        if (!v7)
        {
          v1 = [MEMORY[0x263F086E0] mainBundle];
          id v8 = [v1 bundleIdentifier];
        }
        xpc_dictionary_set_string(v4, "client", (const char *)[v8 UTF8String]);
        if (!v7)
        {
        }
        nw_activity_submit_metrics();
      }
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      if (v10)
      {
        nw_activity_complete_with_reason();
        uint64_t v9 = *(void *)(a1 + 56);
      }
      [*(id *)(a1 + 72) finishWithError:v9];
    }
    else
    {
      if (v10) {
        nw_activity_complete_with_reason();
      }
      id v11 = *(void **)(a1 + 64);
      id v12 = *(void **)(a1 + 72);
      id v13 = v11;
      uint64_t v14 = [v13 alarms];
      id v15 = (void *)v14;
      if (v14) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = MEMORY[0x263EFFA68];
      }
      [v12 finishWithResult:v16];
    }
    id WeakRetained = v17;
  }
}

id __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_3()
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"read", 0);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_171_cold_2();
    }

    [*(id *)(a1 + 56) finishWithError:v7];
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 32)) {
    goto LABEL_8;
  }
  uint64_t v9 = [*(id *)(a1 + 40) homekit];
  uint64_t v10 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v11 = [v9 accessoryWithUniqueIdentifier:v10];

  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 40) _filteredAlarmsList:v5 forAccessory:v11];

    id v5 = (id)v12;
LABEL_8:
    id v13 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      int v17 = 134218242;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p local alarms list: %@", (uint8_t *)&v17, 0x16u);
    }

    [*(id *)(a1 + 56) finishWithResult:v5];
    goto LABEL_14;
  }
  id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
  uint64_t v16 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_171_cold_1();
  }

  [*(id *)(a1 + 56) finishWithError:v15];
LABEL_14:
}

id __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_173()
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"read", 0);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_176(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v14)
  {
    id v14 = [v13 error];
    if (!v14)
    {
      if (*(void *)(a1 + 32))
      {
        xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
        if (v21)
        {
          id v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          id v23 = objc_claimAutoreleasedReturnValue();
          xpc_dictionary_set_string(v21, "command", (const char *)[v23 UTF8String]);

          id v24 = [*(id *)(a1 + 40) clientBundleIdentifier];
          uint64_t v25 = v24;
          if (!v24)
          {
            id v5 = [MEMORY[0x263F086E0] mainBundle];
            uint64_t v25 = [v5 bundleIdentifier];
          }
          xpc_dictionary_set_string(v21, "client", (const char *)[v25 UTF8String]);
          if (!v24)
          {
          }
          nw_activity_submit_metrics();
        }
        nw_activity_complete_with_reason();
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = [v13 alarms];
        if (*(void *)(a1 + 48)
          && [*(id *)(a1 + 56) requiresFilter]
          && ([v13 isFiltered] & 1) == 0)
        {
          id v27 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            uint64_t v52 = v28;
            _os_log_impl(&dword_2217C1000, v27, OS_LOG_TYPE_INFO, "%p alarm results from leader not filtered!", buf, 0xCu);
          }

          id v29 = [*(id *)(a1 + 72) homekit];
          id v30 = [*(id *)(a1 + 48) uniqueIdentifier];
          uint64_t v31 = [v29 accessoryWithUniqueIdentifier:v30];

          if (!v31)
          {
            id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
            id v42 = COCoreLogForCategory(2);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_176_cold_1();
            }

            [*(id *)(a1 + 80) finishWithError:v14];
            goto LABEL_38;
          }
          uint64_t v32 = [*(id *)(a1 + 72) _filteredAlarmsList:v26 forAccessory:v31];

          id v26 = (id)v32;
        }
      }
      else
      {
        id v26 = [MEMORY[0x263EFF8C0] array];
      }
      BOOL v33 = [*(id *)(a1 + 72) homekit];
      int v34 = [v33 hasOptedToHH2];

      if (v34)
      {
        uint64_t v35 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 134218242;
          uint64_t v52 = v36;
          __int16 v53 = 2112;
          id v54 = v26;
          _os_log_impl(&dword_2217C1000, v35, OS_LOG_TYPE_DEFAULT, "%p alarms list from leader: %@", buf, 0x16u);
        }

        [*(id *)(a1 + 80) finishWithResult:v26];
      }
      else
      {
        uint64_t v37 = [*(id *)(a1 + 72) alarmManager];
        id v38 = [v37 alarms];
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_178;
        v47[3] = &unk_2645CCA38;
        id v39 = v26;
        id v48 = v39;
        id v49 = *(id *)(a1 + 64);
        id v50 = *(id *)(a1 + 80);
        id v40 = (id)[v38 addSuccessBlock:v47];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_179;
        v43[3] = &unk_2645CD618;
        id v44 = *(id *)(a1 + 64);
        id v26 = v39;
        id v45 = v26;
        id v46 = *(id *)(a1 + 80);
        id v41 = (id)[v38 addFailureBlock:v43];
      }
      id v14 = 0;
LABEL_38:

      goto LABEL_14;
    }
  }
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    if (v15)
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v17 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v15, "command", (const char *)[v17 UTF8String]);

      uint64_t v18 = [*(id *)(a1 + 40) clientBundleIdentifier];
      __int16 v19 = v18;
      if (!v18)
      {
        id v6 = [MEMORY[0x263F086E0] mainBundle];
        __int16 v19 = [v6 bundleIdentifier];
      }
      xpc_dictionary_set_string(v15, "client", (const char *)[v19 UTF8String]);
      if (!v18)
      {
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  id v20 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_176_cold_2();
  }

  [*(id *)(a1 + 80) finishWithError:v14];
LABEL_14:
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263EFF980] array];
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v25 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v12 = [v11 alarmID];
          [v5 setObject:v11 forKey:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v8);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          __int16 v19 = [v18 alarmID];
          id v20 = [v5 objectForKey:v19];

          xpc_object_t v21 = [v18 COPreferredAlarm:v20];
          [v4 addObject:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v15);
    }

    id v3 = v25;
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
  }
  id v22 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v35 = v23;
    __int16 v36 = 2112;
    id v37 = v4;
    __int16 v38 = 2112;
    uint64_t v39 = v24;
    _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "%p alarms list after local merge: %@ [list from leader: %@]", buf, 0x20u);
  }

  [*(id *)(a1 + 48) finishWithResult:v4];
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_179(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_179_cold_1();
  }

  [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, a2, a3);
}

id __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2_181(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"read", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)_isAlarm:(id)a3 targetingAccessoryIdentifiers:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 siriContext];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F33D90]];
  uint64_t v9 = (void *)v8;
  BOOL v10 = v8 == 0;
  if (v6 && v8)
  {
    id v11 = [MEMORY[0x263F08BA0] componentsWithString:v8];
    id v12 = [v11 scheme];
    if ([v12 isEqualToString:@"siri-hk-target"])
    {
      id v13 = [v11 path];
      int v14 = [v13 isEqualToString:@"accessory"];

      if (v14)
      {
        uint64_t v15 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          long long v27 = [v5 alarmID];
          long long v28 = [v11 query];
          *(_DWORD *)buf = 138412802;
          uint64_t v39 = v27;
          __int16 v40 = 2112;
          id v41 = v28;
          __int16 v42 = 2112;
          id v43 = v6;
          _os_log_debug_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEBUG, "checking if alarm (%@) target (%@) contains %@", buf, 0x20u);
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v16 = [v11 queryItems];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          long long v29 = v11;
          long long v30 = v9;
          long long v31 = v7;
          id v32 = v5;
          uint64_t v19 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v34 != v19) {
                objc_enumerationMutation(v16);
              }
              xpc_object_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              id v22 = objc_msgSend(v21, "name", v29, v30, v31, v32);
              int v23 = [@"identifier" isEqualToString:v22];

              if (v23)
              {
                uint64_t v24 = [v21 value];
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
          id v11 = v29;
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
    uint64_t v16 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:]();
    }
    goto LABEL_26;
  }
  id v11 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn _isAlarm:targetingAccessoryIdentifiers:](v5);
  }
LABEL_28:

  return v10;
}

- (id)alarms
{
  return [(COMeshAlarmAddOn *)self alarmsForAccessory:0];
}

- (id)alarmsForAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F33F88]) initWithHomeKitAccessory:v4];
    if (v5)
    {
      id v6 = [(COMeshAlarmAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v5];
      goto LABEL_6;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = 0;
LABEL_6:
  uint64_t v7 = [(COMeshAlarmAddOn *)self _alarmsForAccessory:v5 allowLocalStorage:[(COMeshAlarmAddOn *)self performsLocalActions] usingLeader:1 member:v6 client:0];

  return v7;
}

- (id)addAlarm:(id)a3
{
  return [(COMeshAlarmAddOn *)self addAlarm:a3 member:0 client:0];
}

- (id)addAlarm:(id)a3 member:(id)a4 client:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COAlarmRequest *)[COAlarmCreateRequest alloc] initWithAlarm:v8];
  id v12 = [(COMeshAddOn *)self meshController];
  id v41 = v8;
  if ([(COMeshAlarmAddOn *)self performsLocalActions]
    && ([v12 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    uint64_t v19 = v10;
    uint64_t v24 = v9;
    id v32 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      long long v33 = [(COMeshAddOn *)self meshController];
      long long v34 = [v8 alarmID];
      *(_DWORD *)buf = 134218242;
      uint64_t v55 = v33;
      __int16 v56 = 2112;
      long long v57 = v34;
      _os_log_impl(&dword_2217C1000, v32, OS_LOG_TYPE_DEFAULT, "%p directly add an alarm %@", buf, 0x16u);
    }
    id v35 = objc_alloc_init(MEMORY[0x263F58190]);
    long long v36 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    id v25 = &off_22188F000;
    block[1] = 3221225472;
    block[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    id v51 = v11;
    id v26 = v35;
    id v52 = v26;
    id v53 = v12;
    dispatch_async(v36, block);

    char v29 = 1;
  }
  else
  {
    int v14 = COCoreLogForCategory(2);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      uint64_t v39 = v11;
      if (v15)
      {
        uint64_t v16 = [v8 alarmID];
        *(_DWORD *)buf = 134218242;
        uint64_t v55 = v12;
        __int16 v56 = 2112;
        long long v57 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to add %@", buf, 0x16u);
      }
      id v17 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v18 = [[COMTAlarmCreateAction alloc] initWithAlarm:v8];
      uint64_t v19 = v10;
      id v20 = [v10 clientLifetimeActivity];
      xpc_object_t v21 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v20];

      if (v21) {
        nw_activity_activate();
      }
      id v22 = [(COMeshAlarmAddOn *)self actionDirector];
      int v23 = [MEMORY[0x263EFFA08] setWithObject:v9];
      v44[0] = MEMORY[0x263EF8330];
      uint64_t v24 = v9;
      id v25 = &off_22188F000;
      v44[1] = 3221225472;
      v44[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_192;
      v44[3] = &unk_2645CAF48;
      id v45 = v21;
      id v46 = v18;
      id v47 = v19;
      id v26 = v17;
      id v48 = v26;
      id v49 = v12;
      long long v27 = v18;
      id v28 = v21;
      [v22 requestAction:v27 members:v23 activity:v28 withCompletion:v44];

      char v29 = 0;
      id v11 = v40;
    }
    else
    {
      uint64_t v19 = v10;
      uint64_t v24 = 0;
      if (v15)
      {
        long long v30 = [(COMeshAddOn *)self meshController];
        long long v31 = [v8 alarmID];
        *(_DWORD *)buf = 134218242;
        uint64_t v55 = v30;
        __int16 v56 = 2112;
        long long v57 = v31;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to add an alarm %@", buf, 0x16u);
      }
      id v26 = [(COMeshAlarmAddOn *)self _sendRequest:v11 client:v19];
      char v29 = 0;
      id v25 = &off_22188F000;
    }
  }
  id v37 = [(COMeshAlarmAddOn *)self recorder];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = *((void *)v25 + 441);
  v42[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_193;
  v42[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v43 = v29;
  ((void (**)(void, uint64_t, void *))v37)[2](v37, 0x26D3D5C68, v42);

  return v26;
}

void __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleAlarmCreateRequest:v3 callback:v4];
}

void __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = COCoreLogForCategory(2);
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

void __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      id v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v8, "command", (const char *)[v10 UTF8String]);

      id v11 = [*(id *)(a1 + 48) clientBundleIdentifier];
      id v12 = v11;
      if (!v11)
      {
        uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
        id v12 = [v3 bundleIdentifier];
      }
      xpc_dictionary_set_string(v8, "client", (const char *)[v12 UTF8String]);
      if (!v11)
      {
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v7)
  {
    id v13 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_155_cold_1();
    }

    [*(id *)(a1 + 56) finishWithError:v7];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

id __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_193(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"create", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)updateAlarm:(id)a3
{
  return [(COMeshAlarmAddOn *)self updateAlarm:a3 member:0 client:0];
}

- (id)updateAlarm:(id)a3 member:(id)a4 client:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COAlarmRequest *)[COAlarmUpdateRequest alloc] initWithAlarm:v8];
  id v12 = [(COMeshAddOn *)self meshController];
  id v41 = v8;
  if ([(COMeshAlarmAddOn *)self performsLocalActions]
    && ([v12 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    uint64_t v19 = v10;
    uint64_t v24 = v9;
    id v32 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      long long v33 = [(COMeshAddOn *)self meshController];
      long long v34 = [v8 alarmID];
      *(_DWORD *)buf = 134218242;
      uint64_t v55 = v33;
      __int16 v56 = 2112;
      long long v57 = v34;
      _os_log_impl(&dword_2217C1000, v32, OS_LOG_TYPE_DEFAULT, "%p directly update an alarm %@", buf, 0x16u);
    }
    id v35 = objc_alloc_init(MEMORY[0x263F58190]);
    long long v36 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    id v25 = &off_22188F000;
    block[1] = 3221225472;
    block[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    id v51 = v11;
    id v26 = v35;
    id v52 = v26;
    id v53 = v12;
    dispatch_async(v36, block);

    char v29 = 1;
  }
  else
  {
    int v14 = COCoreLogForCategory(2);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      uint64_t v39 = v11;
      if (v15)
      {
        uint64_t v16 = [v8 alarmID];
        *(_DWORD *)buf = 134218242;
        uint64_t v55 = v12;
        __int16 v56 = 2112;
        long long v57 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to update %@", buf, 0x16u);
      }
      id v17 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v18 = [[COMTAlarmUpdateAction alloc] initWithAlarm:v8];
      uint64_t v19 = v10;
      id v20 = [v10 clientLifetimeActivity];
      xpc_object_t v21 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v20];

      if (v21) {
        nw_activity_activate();
      }
      id v22 = [(COMeshAlarmAddOn *)self actionDirector];
      int v23 = [MEMORY[0x263EFFA08] setWithObject:v9];
      v44[0] = MEMORY[0x263EF8330];
      uint64_t v24 = v9;
      id v25 = &off_22188F000;
      v44[1] = 3221225472;
      v44[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_195;
      v44[3] = &unk_2645CAF48;
      id v45 = v21;
      id v46 = v18;
      id v47 = v19;
      id v26 = v17;
      id v48 = v26;
      id v49 = v12;
      long long v27 = v18;
      id v28 = v21;
      [v22 requestAction:v27 members:v23 activity:v28 withCompletion:v44];

      char v29 = 0;
      id v11 = v40;
    }
    else
    {
      uint64_t v19 = v10;
      uint64_t v24 = 0;
      if (v15)
      {
        long long v30 = [(COMeshAddOn *)self meshController];
        long long v31 = [v8 alarmID];
        *(_DWORD *)buf = 134218242;
        uint64_t v55 = v30;
        __int16 v56 = 2112;
        long long v57 = v31;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to update an alarm %@", buf, 0x16u);
      }
      id v26 = [(COMeshAlarmAddOn *)self _sendRequest:v11 client:v19];
      char v29 = 0;
      id v25 = &off_22188F000;
    }
  }
  id v37 = [(COMeshAlarmAddOn *)self recorder];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = *((void *)v25 + 441);
  v42[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_196;
  v42[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v43 = v29;
  ((void (**)(void, uint64_t, void *))v37)[2](v37, 0x26D3D5C68, v42);

  return v26;
}

void __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleAlarmUpdateRequest:v3 callback:v4];
}

void __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = COCoreLogForCategory(2);
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

void __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      id v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v8, "command", (const char *)[v10 UTF8String]);

      id v11 = [*(id *)(a1 + 48) clientBundleIdentifier];
      id v12 = v11;
      if (!v11)
      {
        uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
        id v12 = [v3 bundleIdentifier];
      }
      xpc_dictionary_set_string(v8, "client", (const char *)[v12 UTF8String]);
      if (!v11)
      {
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v7)
  {
    id v13 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_158_cold_1();
    }

    [*(id *)(a1 + 56) finishWithError:v7];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

id __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_196(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"update", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)removeAlarm:(id)a3
{
  return [(COMeshAlarmAddOn *)self removeAlarm:a3 member:0 client:0];
}

- (id)removeAlarm:(id)a3 member:(id)a4 client:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COAlarmRequest *)[COAlarmDeleteRequest alloc] initWithAlarm:v8];
  id v12 = [(COMeshAddOn *)self meshController];
  uint64_t v44 = v8;
  if ([(COMeshAlarmAddOn *)self performsLocalActions]
    && ([v12 leader], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    id v22 = v10;
    long long v27 = v9;
    id v35 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      long long v36 = [(COMeshAddOn *)self meshController];
      id v37 = [v8 alarmID];
      *(_DWORD *)buf = 134218242;
      uint64_t v58 = v36;
      __int16 v59 = 2112;
      id v60 = v37;
      _os_log_impl(&dword_2217C1000, v35, OS_LOG_TYPE_DEFAULT, "%p directly remove an alarm %@", buf, 0x16u);
    }
    id v38 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v39 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    id v28 = &off_22188F000;
    block[1] = 3221225472;
    block[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    id v54 = v11;
    id v29 = v38;
    id v55 = v29;
    id v56 = v12;
    dispatch_async(v39, block);

    char v32 = 1;
  }
  else
  {
    int v14 = COCoreLogForCategory(2);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      __int16 v42 = v11;
      if (v15)
      {
        uint64_t v16 = [v8 alarmID];
        *(_DWORD *)buf = 134218242;
        uint64_t v58 = v12;
        __int16 v59 = 2112;
        id v60 = v16;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to remove %@", buf, 0x16u);
      }
      id v17 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      id v20 = [v8 alarmID];
      xpc_object_t v21 = +[COMTDeleteAction actionWithTargetType:v19 targetIdentifier:v20];

      id v22 = v10;
      int v23 = [v10 clientLifetimeActivity];
      uint64_t v24 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v23];

      if (v24) {
        nw_activity_activate();
      }
      id v25 = [(COMeshAlarmAddOn *)self actionDirector];
      id v26 = [MEMORY[0x263EFFA08] setWithObject:v9];
      v47[0] = MEMORY[0x263EF8330];
      long long v27 = v9;
      id v28 = &off_22188F000;
      v47[1] = 3221225472;
      v47[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_198;
      v47[3] = &unk_2645CAF48;
      id v48 = v24;
      id v49 = v21;
      id v50 = v22;
      id v29 = v17;
      id v51 = v29;
      id v52 = v12;
      id v30 = v21;
      id v31 = v24;
      [v25 requestAction:v30 members:v26 activity:v31 withCompletion:v47];

      char v32 = 0;
      id v11 = v43;
    }
    else
    {
      id v22 = v10;
      long long v27 = 0;
      if (v15)
      {
        long long v33 = [(COMeshAddOn *)self meshController];
        long long v34 = [v8 alarmID];
        *(_DWORD *)buf = 134218242;
        uint64_t v58 = v33;
        __int16 v59 = 2112;
        id v60 = v34;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to remove an alarm %@", buf, 0x16u);
      }
      id v29 = [(COMeshAlarmAddOn *)self _sendRequest:v11 client:v22];
      char v32 = 0;
      id v28 = &off_22188F000;
    }
  }
  __int16 v40 = [(COMeshAlarmAddOn *)self recorder];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = *((void *)v28 + 441);
  v45[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_199;
  v45[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v46 = v32;
  ((void (**)(void, uint64_t, void *))v40)[2](v40, 0x26D3D5C68, v45);

  return v29;
}

void __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleAlarmDeleteRequest:v3 callback:v4];
}

void __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = COCoreLogForCategory(2);
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

void __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_198(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      id v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v8, "command", (const char *)[v10 UTF8String]);

      id v11 = [*(id *)(a1 + 48) clientBundleIdentifier];
      id v12 = v11;
      if (!v11)
      {
        uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
        id v12 = [v3 bundleIdentifier];
      }
      xpc_dictionary_set_string(v8, "client", (const char *)[v12 UTF8String]);
      if (!v11)
      {
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  if (v7)
  {
    id v13 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_161_cold_1();
    }

    [*(id *)(a1 + 56) finishWithError:v7];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
}

id __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_199(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"delete", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)snoozeAlarmWithIdentifier:(id)a3
{
  return [(COMeshAlarmAddOn *)self snoozeAlarmWithIdentifier:a3 client:0];
}

- (id)snoozeAlarmWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = [[COAlarmSnoozeRequest alloc] initWithAlarmIdentifier:v6];
  id v9 = [(COMeshAddOn *)self meshController];
  if ([(COMeshAlarmAddOn *)self performsLocalActions]
    && ([v9 leader], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    id v17 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(COMeshAddOn *)self meshController];
      *(_DWORD *)buf = 134218242;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%p directly snooze an alarm %@", buf, 0x16u);
    }
    id v19 = objc_alloc_init(MEMORY[0x263F58190]);
    id v20 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    uint64_t v24 = v8;
    id v13 = v19;
    id v25 = v13;
    id v26 = v9;
    dispatch_async(v20, block);

    char v14 = 1;
  }
  else
  {
    id v11 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(COMeshAddOn *)self meshController];
      *(_DWORD *)buf = 134218242;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p requesting leader to snooze an alarm %@", buf, 0x16u);
    }
    id v13 = [(COMeshAlarmAddOn *)self _sendRequest:v8 client:v7];
    char v14 = 0;
  }
  BOOL v15 = [(COMeshAlarmAddOn *)self recorder];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_200;
  v21[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v22 = v14;
  ((void (**)(void, uint64_t, void *))v15)[2](v15, 0x26D3D5C68, v21);

  return v13;
}

void __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleAlarmSnoozeRequest:v3 callback:v4];
}

void __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

id __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_200(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"snooze", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)dismissAlarmWithIdentifier:(id)a3
{
  return [(COMeshAlarmAddOn *)self dismissAlarmWithIdentifier:a3 client:0];
}

- (id)dismissAlarmWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = [[COAlarmDismissRequest alloc] initWithAlarmIdentifier:v6];
  id v9 = [(COMeshAddOn *)self meshController];
  if ([(COMeshAlarmAddOn *)self performsLocalActions]
    && ([v9 leader], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    char v22 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [(COMeshAddOn *)self meshController];
      *(_DWORD *)buf = 134218242;
      id v35 = v23;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "%p directly dismiss an alarm %@", buf, 0x16u);
    }
    id v24 = objc_alloc_init(MEMORY[0x263F58190]);
    id v25 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke;
    block[3] = &unk_2645CB458;
    void block[4] = self;
    id v13 = (id *)&v31;
    uint64_t v31 = v8;
    id v18 = v24;
    id v32 = v18;
    id v33 = v9;
    dispatch_async(v25, block);

    char v19 = 1;
  }
  else
  {
    id v11 = [(COMeshAlarmAddOn *)self alarmManager];
    id v12 = [v11 dismissAlarmWithIdentifier:v6];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_201;
    v28[3] = &unk_2645CC7E0;
    void v28[4] = self;
    id v13 = &v29;
    id v14 = v6;
    id v29 = v14;
    id v15 = (id)[v12 addCompletionBlock:v28];

    uint64_t v16 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(COMeshAddOn *)self meshController];
      *(_DWORD *)buf = 134218242;
      id v35 = v17;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%p requesting leader to dismiss an alarm %@", buf, 0x16u);
    }
    id v18 = [(COMeshAlarmAddOn *)self _sendRequest:v8 client:v7];
    char v19 = 0;
  }

  id v20 = [(COMeshAlarmAddOn *)self recorder];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_203;
  v26[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  char v27 = v19;
  ((void (**)(void, uint64_t, void *))v20)[2](v20, 0x26D3D5C68, v26);

  return v18;
}

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_2;
  v4[3] = &unk_2645CBD88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleAlarmDismissRequest:v3 callback:v4];
}

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = COCoreLogForCategory(2);
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

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_201(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COCoreLogForCategory(2);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_201_cold_1(a1);
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

id __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_203(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(@"alarm", @"dismiss", *(unsigned __int8 *)(a1 + 32) == 0);
}

- (BOOL)_isAlarm:(id)a3 targetingAccessory:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = [(COMeshAlarmAddOn *)self homekit];
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
    BOOL v11 = [(COMeshAlarmAddOn *)self _isAlarm:v7 targetingAccessoryIdentifiers:v10];
  }
  else
  {
    BOOL v11 = [(COMeshAlarmAddOn *)self _isAlarm:v7 targetingAccessoryIdentifiers:0];
    uint64_t v8 = v7;
  }

  return v11;
}

- (void)handleAlarmReadRequest:(id)a3 callback:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [v6 accessoryUniqueIdentifier];
  id v10 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [(COMeshAddOn *)self meshController];
    *(_DWORD *)buf = 134218242;
    id v56 = v11;
    __int16 v57 = 2112;
    *(void *)uint64_t v58 = v9;
    _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p retrieving alarms for %@...", buf, 0x16u);
  }
  int v12 = [v6 requiresFilter];
  uint64_t v13 = [(COMeshAlarmAddOn *)self homekit];
  id v14 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v37 = [(COMeshAddOn *)self meshController];
    int v38 = [v6 isForMerge];
    [v6 eTag];
    uint64_t v39 = v40 = v7;
    *(_DWORD *)buf = 134218754;
    id v56 = v37;
    __int16 v57 = 1024;
    *(_DWORD *)uint64_t v58 = v12;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v38;
    __int16 v59 = 2112;
    id v60 = v39;
    _os_log_debug_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEBUG, "%p request info: filter: %d, merge: %d, eTag: %@", buf, 0x22u);

    id v7 = v40;
  }

  id v15 = 0;
  uint64_t v16 = 0;
  if (!v12 || !v9) {
    goto LABEL_19;
  }
  uint64_t v17 = [v13 accessoryWithUniqueIdentifier:v9];
  if (v17)
  {
    uint64_t v16 = (void *)v17;
    if ([v13 hasOptedToHH2])
    {
      id v15 = 0;
    }
    else
    {
      char v19 = [v13 homeForAccessory:v16];
      id v15 = (COMeshResponse *)MEMORY[0x263EFFA68];
      if (v19)
      {
        uint64_t v20 = [v13 alarmsForAccessory:v16 inHome:v19];
        id v21 = v7;
        char v22 = (void *)v20;
        if (v20) {
          int v23 = (void *)v20;
        }
        else {
          int v23 = v15;
        }
        id v15 = v23;

        id v7 = v21;
      }
    }
LABEL_19:
    if ([(COMeshAlarmAddOn *)self performsLocalActions])
    {
      [(COMeshAlarmAddOn *)self alarmManager];
      id v25 = v24 = v7;
      id v26 = [v25 alarms];

      id v7 = v24;
    }
    else
    {
      id v26 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
    }
    if ([v13 hasOptedToHH2])
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke;
      v53[3] = &unk_2645CC808;
      char v27 = v13;
      id v28 = v9;
      id v29 = v7;
      id v30 = v7;
      id v54 = v30;
      id v31 = (id)[v26 addFailureBlock:v53];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_205;
      v47[3] = &unk_2645CC830;
      char v52 = v12;
      id v48 = v16;
      id v49 = self;
      id v50 = v6;
      id v32 = v30;
      id v7 = v29;
      int v9 = v28;
      uint64_t v13 = v27;
      id v33 = &v54;
      id v51 = v32;
      id v34 = (id)[v26 addSuccessBlock:v47];

      id v35 = v48;
    }
    else
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_206;
      v41[3] = &unk_2645CDF88;
      id v33 = (id *)v42;
      v42[0] = v15;
      v42[1] = self;
      id v43 = v16;
      char v46 = v12;
      id v44 = v6;
      id v45 = v7;
      id v36 = (id)[v26 addCompletionBlock:v41];

      id v35 = v43;
    }

    goto LABEL_26;
  }
  id v18 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[COMeshAlarmAddOn handleAlarmReadRequest:callback:]();
  }

  uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
  id v15 = [[COMeshResponse alloc] initWithError:v16];
  (*((void (**)(id, COMeshResponse *, void))v7 + 2))(v7, v15, 0);
LABEL_26:
}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_205(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2;
    char v27 = &unk_2645CD640;
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
    uint64_t v8 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v3;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "... returning filtered alarms list\n%@", buf, 0xCu);
    }

    int v9 = [[COAlarmReadResponse alloc] initWithFilteredAlarms:v3];
    goto LABEL_17;
  }
  if (([*(id *)(a1 + 48) isForMerge] & 1) == 0)
  {
    int v12 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v3;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "... returning alarms list\n%@", buf, 0xCu);
    }

    BOOL v11 = [[COAlarmReadResponse alloc] initWithAlarms:v3];
    goto LABEL_16;
  }
  if (![*(id *)(a1 + 40) performsLocalActions]
    || [MEMORY[0x263F33F80] isDistributedTimersEnabled])
  {
    id v10 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "... returning skip-in-merge", buf, 2u);
    }

    BOOL v11 = [[COAlarmReadResponse alloc] initWithSkipInMerge];
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
  uint64_t v16 = eTagForAlarms(v3);
  int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    id v18 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "... returning not-modified", buf, 2u);
    }

    char v19 = [COAlarmReadResponse alloc];
    uint64_t v20 = [*(id *)(a1 + 40) deletes];
    uint64_t v21 = [(COAlarmReadResponse *)v19 initNotModifiedWithDeletes:v20];
  }
  else
  {
LABEL_23:
    char v22 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v3;
      _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "... returning alarms list and deletes\n%@", buf, 0xCu);
    }

    int v23 = [COAlarmReadResponse alloc];
    uint64_t v20 = [*(id *)(a1 + 40) deletes];
    uint64_t v21 = [(COAlarmReadResponse *)v23 initWithAlarms:v3 deletes:v20];
  }
  int v9 = (COAlarmReadResponse *)v21;

LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", a2);
  }
  else
  {
    id v3 = [a2 siriContext];
    id v4 = [v3 objectForKey:*MEMORY[0x263F33D90]];
    int v2 = v4 == 0;
  }
  return v2 ^ 1u;
}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 32))
  {

    uint64_t v8 = *(void **)(a1 + 32);
    if (v5)
    {
      id v9 = [v5 arrayByAddingObjectsFromArray:v8];
    }
    else
    {
      id v9 = v8;
    }
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v20 = [v19 alarmID];
          uint64_t v21 = [v13 objectForKey:v20];
          int v22 = [*(id *)(a1 + 40) _isAlarm:v19 targetingAccessory:*(void *)(a1 + 48)];
          int v23 = v22;
          if (v21)
          {
            if (v22 == [*(id *)(a1 + 40) _isAlarm:v21 targetingAccessory:*(void *)(a1 + 48)])goto LABEL_21; {
          }
            }
          else if ((v22 & 1) == 0)
          {
LABEL_21:
            id v25 = [v19 COPreferredAlarm:v21];
            goto LABEL_22;
          }
          if (v23) {
            uint64_t v24 = v19;
          }
          else {
            uint64_t v24 = v21;
          }
          id v25 = v24;
LABEL_22:
          id v26 = v25;
          [v13 setObject:v25 forKey:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v16);
    }

    char v27 = [v13 allValues];
    id v5 = [v27 sortedArrayUsingSelector:sel_compare_];

LABEL_25:
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      uint64_t v39 = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2_207;
      id v40 = &unk_2645CD640;
      id v28 = *(id *)(a1 + 48);
      uint64_t v29 = *(void *)(a1 + 40);
      id v41 = v28;
      uint64_t v42 = v29;
      id v30 = [v5 indexesOfObjectsPassingTest:&v37];
      if (objc_msgSend(v30, "count", v37, v38, v39, v40))
      {
        id v31 = (void *)[v5 mutableCopy];
        [v31 removeObjectsAtIndexes:v30];

        id v5 = v31;
      }
      uint64_t v32 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v5;
        _os_log_impl(&dword_2217C1000, v32, OS_LOG_TYPE_DEFAULT, "... returning filtered alarms list\n%@", buf, 0xCu);
      }

      id v7 = [[COAlarmReadResponse alloc] initWithFilteredAlarms:v5];
    }
    else
    {
      id v33 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v5;
        _os_log_impl(&dword_2217C1000, v33, OS_LOG_TYPE_DEFAULT, "... returning alarms list\n%@", buf, 0xCu);
      }

      char v34 = [*(id *)(a1 + 56) isForMerge];
      id v35 = [COAlarmReadResponse alloc];
      id v36 = v35;
      if ((v34 & 1) == 0)
      {
        id v7 = [(COAlarmReadResponse *)v35 initWithAlarms:v5];
        goto LABEL_36;
      }
      id v30 = [*(id *)(a1 + 40) deletes];
      id v7 = [(COAlarmReadResponse *)v36 initWithAlarms:v5 deletes:v30];
    }

LABEL_36:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_37;
  }
  if (!v6) {
    goto LABEL_25;
  }
  id v10 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_cold_1();
  }

  uint64_t v11 = *(void *)(a1 + 64);
  int v12 = [[COMeshResponse alloc] initWithError:v7];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v11 + 16))(v11, v12, 0);

LABEL_37:
}

uint64_t __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2_207(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", a2);
  }
  else
  {
    id v3 = [a2 siriContext];
    id v4 = [v3 objectForKey:*MEMORY[0x263F33D90]];
    int v2 = v4 == 0;
  }
  return v2 ^ 1u;
}

- (void)handleAlarmCreateRequest:(id)a3 callback:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v37 = a4;
  val = self;
  uint64_t v39 = [(COMeshAddOn *)self meshController];
  id v6 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v6);

  long long v43 = [v38 alarm];
  id v7 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(COMeshAddOn *)self meshController];
    id v9 = [v43 alarmID];
    *(_DWORD *)buf = 134218242;
    uint64_t v61 = v8;
    __int16 v62 = 2112;
    id v63 = v9;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p adding alarm %@...", buf, 0x16u);
  }
  long long v44 = [(COMeshAlarmAddOn *)val homekit];
  id v10 = [v43 siriContext];
  id v40 = [v10 objectForKey:*MEMORY[0x263F33D90]];

  uint64_t v11 = [v40 length];
  if (v11)
  {
    id v35 = [v44 allAccessoriesForSiriContextTargetReference:v40];
  }
  else
  {
    id v35 = 0;
  }
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v36 = [(COMeshAlarmAddOn *)val performsLocalActions];
  if (!v11 || [v44 hasOptedToHH2])
  {
    if (v36)
    {
      int v12 = [(COMeshAlarmAddOn *)val alarmManager];
      [v12 addAlarm:v43];
    }
    else
    {
      int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
      [MEMORY[0x263F58190] futureWithError:v12];
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v13, v35);
LABEL_12:

    if ([v42 count] == 1)
    {
      id v14 = [v42 firstObject];
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x263F581B8];
      uint64_t v16 = [v39 dispatchQueue];
      uint64_t v17 = [v15 schedulerWithDispatchQueue:v16];

      id v14 = [MEMORY[0x263F58190] combineAllFutures:v42 ignoringErrors:1 scheduler:v17];
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke;
    v52[3] = &unk_2645CC858;
    id v18 = v43;
    id v53 = v18;
    id v19 = v37;
    id v54 = v19;
    id v20 = (id)[v14 addFailureBlock:v52];
    objc_initWeak((id *)buf, val);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_208;
    v45[3] = &unk_2645CDFB0;
    long long v46 = v18;
    id v49 = v19;
    id v47 = v39;
    objc_copyWeak(&v50, (id *)buf);
    BOOL v51 = v36;
    id v48 = val;
    id v21 = (id)[v14 addSuccessBlock:v45];
    objc_destroyWeak(&v50);

    objc_destroyWeak((id *)buf);
    int v22 = v53;
    goto LABEL_16;
  }
  if (v35)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v13 = v35;
    int v12 = 0;
    uint64_t v23 = [v13 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v56;
      id v25 = (void *)*MEMORY[0x263F0B0A0];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(v13);
          }
          char v27 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v28 = objc_msgSend(v27, "category", v35);
          uint64_t v29 = [v28 categoryType];
          int v30 = [v25 isEqualToString:v29];

          if (v30)
          {
            id v31 = [v44 homeForAccessory:v27];
            if (v31)
            {
              uint64_t v32 = [v44 addAlarm:v43 toAccessory:v27 inHome:v31];
              [v42 addObject:v32];
            }
          }
          else if (!v12)
          {
            id v33 = [(COMeshAlarmAddOn *)val alarmManager];
            int v12 = [v33 addAlarm:v43];

            [v42 addObject:v12];
          }
        }
        uint64_t v23 = [v13 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v23);
    }
    goto LABEL_12;
  }
  char v34 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[COMeshAlarmAddOn handleAlarmCreateRequest:callback:]((uint64_t)v39);
  }

  id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
  int v22 = [[COMeshResponse alloc] initWithError:v14];
  (*((void (**)(id, COMeshResponse *, void))v37 + 2))(v37, v22, 0);
LABEL_16:
}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_208(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) alarmID];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "... alarm (%@) create completed", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v4 + 16))(v4, v5, 0);

  id v6 = [COAlarmsAddedNotification alloc];
  uint64_t v15 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  uint64_t v8 = [(COAlarmNotification *)v6 initWithAlarms:v7];

  id v9 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_208_cold_1(a1, (id *)(a1 + 32));
  }

  [*(id *)(a1 + 40) sendNotification:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v11 = WeakRetained;
  if (WeakRetained && !*(unsigned char *)(a1 + 72))
  {
    int v12 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [(COAlarmNotification *)v8 alarms];
      [v12 alarmAddOn:v13 didAddAlarms:v14];
    }
  }
}

- (void)handleAlarmUpdateRequest:(id)a3 callback:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v37 = a4;
  val = self;
  uint64_t v39 = [(COMeshAddOn *)self meshController];
  id v6 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v6);

  long long v43 = [v38 alarm];
  id v7 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(COMeshAddOn *)self meshController];
    id v9 = [v43 alarmID];
    *(_DWORD *)buf = 134218242;
    uint64_t v61 = v8;
    __int16 v62 = 2112;
    id v63 = v9;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p updating alarm %@...", buf, 0x16u);
  }
  long long v44 = [(COMeshAlarmAddOn *)val homekit];
  id v10 = [v43 siriContext];
  id v40 = [v10 objectForKey:*MEMORY[0x263F33D90]];

  uint64_t v11 = [v40 length];
  if (v11)
  {
    id v35 = [v44 allAccessoriesForSiriContextTargetReference:v40];
  }
  else
  {
    id v35 = 0;
  }
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v36 = [(COMeshAlarmAddOn *)val performsLocalActions];
  if (!v11 || [v44 hasOptedToHH2])
  {
    if (v36)
    {
      int v12 = [(COMeshAlarmAddOn *)val alarmManager];
      [v12 updateAlarm:v43];
    }
    else
    {
      int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
      [MEMORY[0x263F58190] futureWithError:v12];
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v13, v35);
LABEL_12:

    if ([v42 count] == 1)
    {
      id v14 = [v42 firstObject];
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x263F581B8];
      uint64_t v16 = [v39 dispatchQueue];
      uint64_t v17 = [v15 schedulerWithDispatchQueue:v16];

      id v14 = [MEMORY[0x263F58190] combineAllFutures:v42 ignoringErrors:1 scheduler:v17];
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke;
    v52[3] = &unk_2645CC858;
    uint64_t v18 = v43;
    id v53 = v18;
    id v19 = v37;
    id v54 = v19;
    id v20 = (id)[v14 addFailureBlock:v52];
    objc_initWeak((id *)buf, val);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_210;
    v45[3] = &unk_2645CDFB0;
    long long v46 = v18;
    id v49 = v19;
    id v47 = v39;
    objc_copyWeak(&v50, (id *)buf);
    BOOL v51 = v36;
    id v48 = val;
    id v21 = (id)[v14 addSuccessBlock:v45];
    objc_destroyWeak(&v50);

    objc_destroyWeak((id *)buf);
    int v22 = v53;
    goto LABEL_16;
  }
  if (v35)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v13 = v35;
    int v12 = 0;
    uint64_t v23 = [v13 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v56;
      id v25 = (void *)*MEMORY[0x263F0B0A0];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(v13);
          }
          char v27 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v28 = objc_msgSend(v27, "category", v35);
          uint64_t v29 = [v28 categoryType];
          int v30 = [v25 isEqualToString:v29];

          if (v30)
          {
            id v31 = [v44 homeForAccessory:v27];
            if (v31)
            {
              uint64_t v32 = [v44 updateAlarm:v43 onAccessory:v27 inHome:v31];
              [v42 addObject:v32];
            }
          }
          else if (!v12)
          {
            id v33 = [(COMeshAlarmAddOn *)val alarmManager];
            int v12 = [v33 updateAlarm:v43];

            [v42 addObject:v12];
          }
        }
        uint64_t v23 = [v13 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v23);
    }
    goto LABEL_12;
  }
  char v34 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[COMeshAlarmAddOn handleAlarmUpdateRequest:callback:]((uint64_t)v39);
  }

  id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
  int v22 = [[COMeshResponse alloc] initWithError:v14];
  (*((void (**)(id, COMeshResponse *, void))v37 + 2))(v37, v22, 0);
LABEL_16:
}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_210(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) alarmID];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "... alarm (%@) update completed", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v4 + 16))(v4, v5, 0);

  id v6 = [COAlarmsUpdatedNotification alloc];
  uint64_t v15 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  uint64_t v8 = [(COAlarmNotification *)v6 initWithAlarms:v7];

  id v9 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_210_cold_1(a1, (id *)(a1 + 32));
  }

  [*(id *)(a1 + 40) sendNotification:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v11 = WeakRetained;
  if (WeakRetained && !*(unsigned char *)(a1 + 72))
  {
    int v12 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [(COAlarmNotification *)v8 alarms];
      [v12 alarmAddOn:v13 didUpdateAlarms:v14];
    }
  }
}

- (void)handleAlarmDeleteRequest:(id)a3 callback:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v37 = a4;
  val = self;
  id v38 = [(COMeshAddOn *)self meshController];
  id v6 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v6);

  id v42 = [v39 alarm];
  id v7 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(COMeshAddOn *)self meshController];
    id v9 = [v42 alarmID];
    *(_DWORD *)buf = 134218242;
    __int16 v59 = v8;
    __int16 v60 = 2112;
    uint64_t v61 = v9;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p deleting alarm %@...", buf, 0x16u);
  }
  id v10 = [(COMeshAlarmAddOn *)self homekit];
  uint64_t v11 = [v42 siriContext];
  id v40 = [v11 objectForKey:*MEMORY[0x263F33D90]];

  if ([v40 length])
  {
    int v12 = [v10 accessoriesForSiriContextTargetReference:v40];
  }
  else
  {
    int v12 = 0;
  }
  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = [(COMeshAlarmAddOn *)self alarmManager];
  id v14 = [v13 removeAlarm:v42];
  [v43 addObject:v14];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v54;
    uint64_t v18 = (void *)*MEMORY[0x263F0B0A0];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (([v10 hasOptedToHH2] & 1) == 0)
        {
          id v21 = [v20 category];
          int v22 = [v21 categoryType];
          int v23 = [v18 isEqualToString:v22];

          if (v23)
          {
            uint64_t v24 = [v10 homeForAccessory:v20];
            if (v24)
            {
              id v25 = [v10 removeAlarm:v42 fromAccessory:v20 inHome:v24];
              [v43 addObject:v25];
            }
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v16);
  }

  if ([v43 count] == 1)
  {
    id v26 = [v43 firstObject];
  }
  else
  {
    char v27 = (void *)MEMORY[0x263F581B8];
    id v28 = [v38 dispatchQueue];
    uint64_t v29 = [v27 schedulerWithDispatchQueue:v28];

    id v26 = [MEMORY[0x263F58190] combineAllFutures:v43 ignoringErrors:1 scheduler:v29];
  }
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke;
  v50[3] = &unk_2645CC858;
  id v30 = v42;
  id v51 = v30;
  id v31 = v37;
  id v52 = v31;
  id v32 = (id)[v26 addFailureBlock:v50];
  objc_initWeak((id *)buf, val);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_211;
  v44[3] = &unk_2645CDFD8;
  id v33 = v30;
  id v45 = v33;
  long long v46 = val;
  id v34 = v31;
  id v48 = v34;
  id v35 = v38;
  id v47 = v35;
  objc_copyWeak(&v49, (id *)buf);
  id v36 = (id)[v26 addSuccessBlock:v44];
  objc_destroyWeak(&v49);

  objc_destroyWeak((id *)buf);
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_211(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) alarmID];
  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v22 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "... alarm (%@) delete completed", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [COAlarmDeleteEvent alloc];
  id v7 = [MEMORY[0x263EFF910] now];
  uint64_t v8 = [(COAlarmDeleteEvent *)v6 initWithIdentifier:v3 date:v7];
  [v5 _addAlarmDeleteEvent:v8];

  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v9 + 16))(v9, v10, 0);

  uint64_t v11 = [COAlarmsRemovedNotification alloc];
  uint64_t v20 = *(void *)(a1 + 32);
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  uint64_t v13 = [(COAlarmNotification *)v11 initWithAlarms:v12];

  id v14 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_211_cold_1(a1, v2);
  }

  [*(id *)(a1 + 48) sendNotification:v13];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v16 = WeakRetained;
  if (WeakRetained && ([WeakRetained performsLocalActions] & 1) == 0)
  {
    uint64_t v17 = [v16 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = *(void *)(a1 + 40);
      id v19 = [(COAlarmNotification *)v13 alarms];
      [v17 alarmAddOn:v18 didRemoveAlarms:v19];
    }
  }
}

- (void)handleAlarmSnoozeRequest:(id)a3 callback:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  uint64_t v9 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [v7 identifier];

  uint64_t v11 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p snoozing alarm %@...", buf, 0x16u);
  }

  int v12 = [(COMeshAlarmAddOn *)self alarmManager];
  uint64_t v13 = [v12 snoozeAlarmWithIdentifier:v10];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke;
  v18[3] = &unk_2645CE000;
  id v20 = v8;
  id v21 = v6;
  id v19 = v10;
  id v14 = v8;
  id v15 = v6;
  id v16 = v10;
  id v17 = (id)[v13 addCompletionBlock:v18];
}

void __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = COCoreLogForCategory(2);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v14 = 138412290;
    uint64_t v15 = v9;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "... alarm (%@) snooze completed", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v10 + 16))(v10, v11, 0);

  int v12 = [[COAlarmSnoozeNotification alloc] initWithAlarmIdentifier:*(void *)(a1 + 32)];
  uint64_t v13 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_1();
  }

  [*(id *)(a1 + 40) sendNotification:v12];
}

- (void)handleAlarmDismissRequest:(id)a3 callback:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  uint64_t v9 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v6 identifier];
  uint64_t v11 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p dismissing alarm %@...", buf, 0x16u);
  }

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v49 = __Block_byref_object_copy__24;
  id v50 = __Block_byref_object_dispose__24;
  id v51 = 0;
  int v12 = [(COMeshAlarmAddOn *)self alarmManager];
  uint64_t v13 = [v12 dismissAlarmWithIdentifier:v10];
  int v14 = [v12 alarms];
  objc_initWeak(&location, self);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke;
  v39[3] = &unk_2645CE028;
  id v42 = v46;
  id v43 = buf;
  id v15 = v8;
  id v40 = v15;
  objc_copyWeak(&v44, &location);
  id v41 = self;
  uint64_t v16 = (void *)MEMORY[0x223C8B4A0](v39);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_213;
  v36[3] = &unk_2645CC858;
  id v17 = v10;
  id v37 = v17;
  id v18 = v7;
  id v38 = v18;
  id v19 = (id)[v13 addFailureBlock:v36];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_214;
  v31[3] = &unk_2645CC8F8;
  id v20 = v17;
  id v32 = v20;
  id v21 = v18;
  id v33 = v21;
  id v35 = v46;
  id v22 = v16;
  id v34 = v22;
  id v23 = (id)[v13 addSuccessBlock:v31];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_215;
  v27[3] = &unk_2645CC948;
  id v24 = v20;
  id v28 = v24;
  id v30 = buf;
  id v25 = v22;
  id v29 = v25;
  id v26 = (id)[v14 addSuccessBlock:v27];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v46, 8);
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = a1 + 56;
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v3 = [COAlarmFiringAlarmDismissedNotification alloc];
      v13[0] = *(void *)(*(void *)(*(void *)v2 + 8) + 40);
      uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      id v5 = [(COAlarmNotification *)v3 initWithAlarms:v4];

      id v6 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_cold_1(a1, v2);
      }

      [*(id *)(a1 + 32) sendNotification:v5];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      uint64_t v8 = WeakRetained;
      if (WeakRetained)
      {
        uint64_t v9 = [WeakRetained delegate];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = *(void *)(a1 + 40);
          uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
          [v9 alarmAddOn:v10 didDismissAlarms:v11];
        }
      }
    }
  }
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_213(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_213_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [[COMeshResponse alloc] initWithError:v3];
  (*(void (**)(uint64_t, COMeshResponse *, void))(v5 + 16))(v5, v6, 0);
}

uint64_t __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_214(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "... alarm (%@) dismiss completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = a1[5];
  uint64_t v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, void))(v4 + 16))(v4, v5, 0);

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_215(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_2;
  v6[3] = &unk_2645CE050;
  id v7 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 alarmIDString];
  int v8 = [v7 isEqualToString:a1[4]];
  *a4 = v8;

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)handleAlarmsAddedNotification:(id)a3
{
  id v4 = a3;
  long long v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  id v6 = [v4 alarms];

  if ([v6 count])
  {
    if ([(COMeshAlarmAddOn *)self performsLocalActions])
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      int v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
      id v9 = [(COMeshAlarmAddOn *)self alarmManager];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke;
      v16[3] = &unk_2645CE078;
      v16[4] = self;
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
    void v14[2] = __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke_217;
    v14[3] = &unk_2645CC998;
    void v14[4] = self;
    id v15 = v6;
    id v13 = (id)[v12 addSuccessBlock:v14];
  }
  else
  {
    uint64_t v12 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[COMeshAlarmAddOn handleAlarmsAddedNotification:]();
    }
  }
}

void __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 alarmID];
    int v9 = 134218242;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p adding local alarm %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = *(void **)(a1 + 40);
  int v8 = [*(id *)(a1 + 48) addAlarm:v3];
  [v7 addObject:v8];
}

void __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke_217(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished adding local alarms", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 alarmAddOn:*(void *)(a1 + 32) didAddAlarms:*(void *)(a1 + 40)];
  }
}

- (void)handleAlarmsRemovedNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  uint64_t v6 = [v4 alarms];

  if ([v6 count])
  {
    if ([(COMeshAlarmAddOn *)self performsLocalActions])
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      int v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
      int v9 = [MEMORY[0x263EFF910] now];
      uint64_t v10 = [(COMeshAlarmAddOn *)self alarmManager];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke;
      v18[3] = &unk_2645CE0A0;
      void v18[4] = self;
      id v19 = v9;
      id v20 = v7;
      id v21 = v10;
      id v11 = v10;
      id v12 = v7;
      id v13 = v9;
      [v6 enumerateObjectsUsingBlock:v18];
      int v14 = [MEMORY[0x263F58190] combineAllFutures:v12 ignoringErrors:1 scheduler:v8];
    }
    else
    {
      int v14 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke_218;
    v16[3] = &unk_2645CC998;
    v16[4] = self;
    id v17 = v6;
    id v15 = (id)[v14 addSuccessBlock:v16];
  }
  else
  {
    int v14 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[COMeshAlarmAddOn handleAlarmsRemovedNotification:]();
    }
  }
}

void __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 alarmID];
  int v5 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 134218242;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p removing local alarm %@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = *(void **)(a1 + 32);
  int v8 = [[COAlarmDeleteEvent alloc] initWithIdentifier:v4 date:*(void *)(a1 + 40)];
  [v7 _addAlarmDeleteEvent:v8];

  int v9 = *(void **)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 56) removeAlarm:v3];

  [v9 addObject:v10];
}

void __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke_218(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished removing local alarms", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 alarmAddOn:*(void *)(a1 + 32) didRemoveAlarms:*(void *)(a1 + 40)];
  }
}

- (void)handleAlarmsUpdatedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  uint64_t v6 = [v4 alarms];

  if ([(COMeshAlarmAddOn *)self performsLocalActions])
  {
    uint64_t v7 = [(COMeshAlarmAddOn *)self alarmManager];
    int v8 = [v7 alarms];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke;
    v12[3] = &unk_2645CC480;
    __int16 v13 = v5;
    id v14 = v6;
    uint64_t v15 = self;
    id v16 = v7;
    id v9 = v7;
    id v10 = (id)[v8 addCompletionBlock:v12];
  }
  else
  {
    int v11 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = self;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p not performing local updates.", buf, 0xCu);
    }

    id v9 = [(COMeshAlarmAddOn *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 alarmAddOn:self didUpdateAlarms:v6];
    }
  }
}

void __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v27 = a3;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v26 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:*(void *)(a1 + 32)];
  id v28 = v5;
  id v31 = objc_msgSend(v5, "na_dictionaryWithKeyGenerator:", &__block_literal_global_221);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v12 = [v11 alarmID];
        __int16 v13 = [v31 objectForKey:v12];
        if ((([v13 isFiring] & 1) != 0 || objc_msgSend(v13, "isSnoozed"))
          && ([*(id *)(a1 + 48) homekit],
              id v14 = objc_claimAutoreleasedReturnValue(),
              int v15 = [v14 hasOptedToHH2],
              v14,
              !v15))
        {
          uint64_t v19 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            uint64_t v40 = v20;
            __int16 v41 = 2112;
            id v42 = v12;
            _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%p not updating busy alarm %@", buf, 0x16u);
          }

          if (!v8) {
            int v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
          }
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", objc_msgSend(v8, "indexOfObject:", v11), v13);
        }
        else
        {
          id v16 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            uint64_t v40 = v17;
            __int16 v41 = 2112;
            id v42 = v12;
            _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%p updating local alarm %@", buf, 0x16u);
          }

          id v18 = [*(id *)(a1 + 56) updateAlarm:v11];
          [v30 addObject:v18];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  if ([v30 count])
  {
    id v21 = (void *)v26;
    id v22 = [MEMORY[0x263F58190] combineAllFutures:v30 ignoringErrors:1 scheduler:v26];
  }
  else
  {
    id v22 = [MEMORY[0x263F58190] futureWithNoResult];
    id v21 = (void *)v26;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke_222;
  v32[3] = &unk_2645CE0E8;
  id v23 = *(void **)(a1 + 40);
  void v32[4] = *(void *)(a1 + 48);
  id v33 = v8;
  id v34 = v23;
  id v24 = v8;
  id v25 = (id)[v22 addSuccessBlock:v32];
}

uint64_t __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 alarmID];
}

void __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke_222(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished updating local alarms", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (!v5) {
      uint64_t v5 = *(void *)(a1 + 48);
    }
    [v4 alarmAddOn:*(void *)(a1 + 32) didUpdateAlarms:v5];
  }
}

- (void)handleAlarmFiredNotification:(id)a3
{
  id v6 = a3;
  if (![(COMeshAlarmAddOn *)self performsLocalActions])
  {
    id v4 = [(COMeshAlarmAddOn *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [v6 alarms];
      [v4 alarmAddOn:self didUpdateAlarms:v5];
    }
  }
}

- (void)handleAlarmFiringAlarmDismissedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);
  id v6 = [v4 alarms];

  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v5];
    uint64_t v9 = [(COMeshAlarmAddOn *)self alarmManager];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke;
    v16[3] = &unk_2645CE078;
    v16[4] = self;
    id v17 = v7;
    id v18 = v9;
    id v10 = v9;
    id v11 = v7;
    [v6 enumerateObjectsUsingBlock:v16];
    uint64_t v12 = [MEMORY[0x263F58190] combineAllFutures:v11 ignoringErrors:1 scheduler:v8];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke_223;
    v14[3] = &unk_2645CC998;
    void v14[4] = self;
    id v15 = v6;
    id v13 = (id)[v12 addSuccessBlock:v14];
  }
  else
  {
    uint64_t v8 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[COMeshAlarmAddOn handleAlarmFiringAlarmDismissedNotification:]();
    }
  }
}

void __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 alarmID];
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    int v10 = 134218242;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p dismissing local alarm %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = (void *)a1[5];
  id v6 = (void *)a1[6];
  uint64_t v8 = [v3 UUIDString];
  uint64_t v9 = [v6 dismissAlarmWithIdentifier:v8];
  [v7 addObject:v9];
}

void __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke_223(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p finished dismissing local alarms", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 alarmAddOn:*(void *)(a1 + 32) didDismissAlarms:*(void *)(a1 + 40)];
  }
}

- (void)handleAlarmSnoozeNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(COMeshAddOn *)self meshController];
  uint64_t v6 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v6);
  uint64_t v7 = [v4 identifier];
  if ([(COMeshAlarmAddOn *)self performsLocalActions])
  {
    uint64_t v8 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p locally snoozing alarm %@...", buf, 0x16u);
    }

    uint64_t v9 = [(COMeshAlarmAddOn *)self alarmManager];
    int v10 = [v9 snoozeAlarmWithIdentifier:v7];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke;
    v17[3] = &unk_2645CE110;
    id v18 = v7;
    id v11 = (id)[v10 addCompletionBlock:v17];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    __int16 v12 = objc_alloc_init(COAlarmReadRequest);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_224;
    v13[3] = &unk_2645CE160;
    objc_copyWeak(&v16, (id *)buf);
    id v14 = v7;
    id v15 = self;
    [v5 sendRequest:v12 withCompletionHandler:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = COCoreLogForCategory(2);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "... local snooze of alarm (%@) complete", (uint8_t *)&v8, 0xCu);
  }
}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_224(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v5 alarms];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_2;
      v10[3] = &unk_2645CE138;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v11 = v8;
      uint64_t v12 = v9;
      [v7 enumerateObjectsUsingBlock:v10];
    }
  }
}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 alarmIDString];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    *a4 = 1;
    uint64_t v9 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = *(void *)(a1 + 40);
      v12[0] = v6;
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      [v9 alarmAddOn:v10 didUpdateAlarms:v11];
    }
  }
}

- (void)handleAlarmManagerStateResetNotification:(id)a3
{
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn handleAlarmManagerStateResetNotification:](self);
  }

  id v5 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didResetAlarmAddOn:self];
  }
}

- (void)alarmsAsAccessory:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn alarmsAsAccessory:fromClient:withCallback:](self);
  }

  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  __int16 v41 = __Block_byref_object_copy__24;
  id v42 = __Block_byref_object_dispose__24;
  id v43 = 0;
  if (v8)
  {
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = [(COMeshAlarmAddOn *)self performsLocalActions];
    id v13 = [v9 connection];
    id v14 = [(COMeshAlarmAddOn *)self _currentAccessoryForConnection:v13];

    if (v14) {
      id v8 = (id)[objc_alloc(MEMORY[0x263F33F88]) initWithHomeKitAccessory:v14];
    }
    else {
      id v8 = 0;
    }
  }
  id v15 = [v8 categoryType];
  if (v8)
  {
    id v16 = [(COMeshAlarmAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v8];
  }
  else
  {
    id v16 = 0;
  }
  id v17 = [(COMeshAlarmAddOn *)self homekit];
  char v18 = [v17 hasOptedToHH2];
  if (v15) {
    char v19 = v18;
  }
  else {
    char v19 = 1;
  }
  if (v19)
  {

LABEL_21:
    uint64_t v26 = os_transaction_create();
    uint64_t v23 = v39[5];
    v39[5] = v26;
    uint64_t v25 = 1;
    goto LABEL_22;
  }
  int v20 = [(id)*MEMORY[0x263F0B0A0] isEqualToString:v15];

  if (!v20) {
    goto LABEL_21;
  }
  uint64_t v21 = os_transaction_create();
  id v22 = (void *)v39[5];
  v39[5] = v21;

  uint64_t v23 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(COMeshAddOn *)self meshController];
    *(_DWORD *)buf = 134217984;
    id v45 = v24;
    _os_log_impl(&dword_2217C1000, v23, OS_LOG_TYPE_DEFAULT, "%p locally reading alarms", buf, 0xCu);
  }
  uint64_t v25 = 0;
LABEL_22:

  id v27 = [(COMeshAlarmAddOn *)self _alarmsForAccessory:v8 allowLocalStorage:v12 usingLeader:v25 member:v16 client:v9];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke;
  v35[3] = &unk_2645CC408;
  id v28 = v10;
  id v36 = v28;
  long long v37 = &v38;
  id v29 = (id)[v27 addFailureBlock:v35];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke_2;
  v32[3] = &unk_2645CC9E8;
  id v30 = v28;
  id v33 = v30;
  id v34 = &v38;
  id v31 = (id)[v27 addSuccessBlock:v32];

  _Block_object_dispose(&v38, 8);
}

void __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)alarmsForAccessories:(id)a3 fromClient:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMeshAddOn *)self meshController];
  BOOL v12 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn alarmsForAccessories:fromClient:callback:]((uint64_t)v11, v8, v12);
  }

  if ([v8 count])
  {
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__24;
    void v41[4] = __Block_byref_object_dispose__24;
    id v42 = (id)MEMORY[0x263EFFA68];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__24;
    void v39[4] = __Block_byref_object_dispose__24;
    id v40 = (id)MEMORY[0x263EFFA68];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__24;
    v37[4] = __Block_byref_object_dispose__24;
    id v38 = (id)MEMORY[0x263EFFA68];
    id v13 = [(COMeshAlarmAddOn *)self homekit];
    char v14 = [v13 hasOptedToHH2];

    if (v14)
    {
      id v15 = [(COMeshAddOn *)self meshController];
      id v16 = [v15 nodeManager];
      id v17 = [v16 activeNodesWithSelfNode:1];

      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2;
      v30[3] = &unk_2645CE1B0;
      id v18 = v17;
      id v31 = v18;
      id v32 = self;
      id v34 = v39;
      long long v35 = v37;
      id v33 = v11;
      [v8 enumerateObjectsUsingBlock:v30];
    }
    else
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke;
      v36[3] = &unk_2645CE188;
      void v36[4] = v41;
      v36[5] = v39;
      [v8 enumerateObjectsUsingBlock:v36];
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__24;
    void v28[4] = __Block_byref_object_dispose__24;
    id v29 = (id)os_transaction_create();
    char v19 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_229;
    block[3] = &unk_2645CE2C8;
    id v24 = v41;
    void block[4] = self;
    uint64_t v25 = v39;
    id v21 = v11;
    id v22 = v9;
    uint64_t v26 = v37;
    id v23 = v10;
    id v27 = v28;
    dispatch_async(v19, block);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v37, 8);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0);
  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)*MEMORY[0x263F0B0A0];
  id v4 = a2;
  uint64_t v5 = [v4 categoryType];
  LODWORD(v3) = [v3 isEqualToString:v5];

  if (v3)
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObject:v4];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:v4];

    uint64_t v7 = *(void *)(a1 + 40);
  }
  uint64_t v8 = *(void *)(v7 + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 categoryType];
  uint64_t v5 = [v3 IDSIdentifier];
  if (![v4 isEqualToString:*MEMORY[0x263F0B0A0]]
    || (COMeshNodeForIDSIdentifier(*(void **)(a1 + 32), v5),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) arrayByAddingObject:v3];
    uint64_t v8 = *(void *)(a1 + 56);
LABEL_4:
    uint64_t v9 = *(void *)(v8 + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    goto LABEL_5;
  }
  id v11 = [*(id *)(a1 + 40) secondaryClusterMemberForAccessory:v3];

  if (v11)
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) arrayByAddingObject:v3];
    uint64_t v8 = *(void *)(a1 + 64);
    goto LABEL_4;
  }
  BOOL v12 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    int v14 = 134218242;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p not getting alarms for %@, accessory unavailable", (uint8_t *)&v14, 0x16u);
  }

LABEL_5:
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_229(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v3 = [*(id *)(a1 + 32) homekit];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2_230;
    v59[3] = &unk_2645CE1D8;
    id v60 = v3;
    id v61 = v2;
    id v5 = v3;
    [v4 enumerateObjectsUsingBlock:v59];
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
  {
    id v7 = objc_alloc_init(MEMORY[0x263F58190]);
    [v6 addObject:v7];
    if ([*(id *)(a1 + 32) performsLocalActions]
      && ([*(id *)(a1 + 40) leader],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      uint64_t v18 = [*(id *)(a1 + 32) alarmManager];
      id v17 = [v18 alarms];

      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_3;
      v55[3] = &unk_2645CE228;
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v58 = *(void *)(a1 + 72);
      v55[4] = v19;
      id v56 = v2;
      id v57 = v7;
      __int16 v16 = (COAlarmReadRequest *)v7;
      id v20 = (id)[v17 addCompletionBlock:v55];
    }
    else
    {
      uint64_t v9 = objc_alloc_init(COAlarmReadRequest);
      id v10 = [*(id *)(a1 + 48) clientLifetimeActivity];
      id v11 = +[CONetworkActivityFactory activityWithLabel:3 parentActivity:v10];

      if (v11)
      {
        [(COMeshRequest *)v9 setActivity:v11];
        nw_activity_activate();
      }
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_6;
      v47[3] = &unk_2645CE250;
      id v48 = v11;
      id v49 = v9;
      BOOL v12 = *(void **)(a1 + 40);
      id v13 = *(id *)(a1 + 48);
      uint64_t v54 = *(void *)(a1 + 72);
      uint64_t v14 = *(void *)(a1 + 32);
      id v50 = v13;
      uint64_t v51 = v14;
      id v52 = v2;
      id v53 = v7;
      id v15 = v7;
      __int16 v16 = v9;
      id v17 = v11;
      [v12 sendRequest:v16 withCompletionHandler:v47];
    }
  }
  id v21 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  void v42[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_9;
  v42[3] = &unk_2645CE2A0;
  uint64_t v22 = *(void *)(a1 + 32);
  id v43 = v6;
  uint64_t v44 = v22;
  id v45 = *(id *)(a1 + 48);
  id v23 = v2;
  id v46 = v23;
  id v24 = v6;
  [v21 enumerateObjectsUsingBlock:v42];
  uint64_t v25 = (void *)MEMORY[0x263F581B8];
  uint64_t v26 = [*(id *)(a1 + 40) dispatchQueue];
  id v27 = [v25 schedulerWithDispatchQueue:v26];

  id v28 = [MEMORY[0x263F58190] combineAllFutures:v24 ignoringErrors:1 scheduler:v27];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_11;
  v38[3] = &unk_2645CCA60;
  id v29 = *(id *)(a1 + 56);
  id v39 = v23;
  id v40 = v29;
  uint64_t v41 = *(void *)(a1 + 88);
  id v30 = v23;
  id v31 = (id)[v28 addSuccessBlock:v38];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_12;
  v35[3] = &unk_2645CC408;
  id v32 = *(id *)(a1 + 56);
  uint64_t v33 = *(void *)(a1 + 88);
  id v36 = v32;
  uint64_t v37 = v33;
  id v34 = (id)[v28 addFailureBlock:v35];
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2_230(uint64_t a1, void *a2)
{
  id v11 = [a2 uniqueIdentifier];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "accessoryWithUniqueIdentifier:");
  uint64_t v4 = [*(id *)(a1 + 32) homeForAccessory:v3];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) alarmsForAccessory:v3 inHome:v4];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = MEMORY[0x263EFFA68];
    }
    [v7 setObject:v10 forKey:v11];
  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 48) finishWithError:a3];
  }
  else
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_4;
    v11[3] = &unk_2645CC608;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 40);
    id v12 = v8;
    uint64_t v13 = v9;
    id v14 = v10;
    [v7 enumerateObjectsUsingBlock:v11];
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_5;
  uint64_t v10 = &unk_2645CE200;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v3;
  id v5 = v3;
  BOOL v6 = objc_msgSend(v4, "na_filter:", &v7);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, v5, v7, v8, v9, v10, v11);
}

uint64_t __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  uint64_t v6 = objc_msgSend(v2, "_isAlarm:targetingAccessoryIdentifiers:", v4, v5, v8, v9);

  return v6;
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
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

      id v17 = [*(id *)(a1 + 48) clientBundleIdentifier];
      uint64_t v18 = v17;
      if (!v17)
      {
        id v5 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v18 = [v5 bundleIdentifier];
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
    [*(id *)(a1 + 72) finishWithError:v13];
  }
  else
  {
    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_7;
    v23[3] = &unk_2645CC608;
    id v20 = v12;
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v22 = *(void **)(a1 + 64);
    id v24 = v20;
    uint64_t v25 = v21;
    id v26 = v22;
    [v19 enumerateObjectsUsingBlock:v23];
    [*(id *)(a1 + 72) finishWithNoResult];
  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) alarms];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_8;
  id v10 = &unk_2645CE200;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_filter:", &v7);

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, v5, v7, v8, v9, v10, v11);
}

uint64_t __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  uint64_t v6 = objc_msgSend(v2, "_isAlarm:targetingAccessoryIdentifiers:", v4, v5, v8, v9);

  return v6;
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  [*(id *)(a1 + 32) addObject:v4];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v5 secondaryClusterMemberForAccessory:v3];
  uint64_t v7 = [v5 _alarmsForAccessory:v3 allowLocalStorage:0 usingLeader:0 member:v6 client:*(void *)(a1 + 48)];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_10;
  v11[3] = &unk_2645CE278;
  id v12 = *(id *)(a1 + 56);
  id v13 = v3;
  id v14 = v4;
  id v8 = v4;
  id v9 = v3;
  id v10 = (id)[v7 addCompletionBlock:v11];
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (a3)
  {
    [*(id *)(a1 + 48) finishWithError:a3];
  }
  else
  {
    if (v5) {
      id v6 = v5;
    }
    else {
      id v6 = (id)MEMORY[0x263EFFA68];
    }
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) uniqueIdentifier];
    [v7 setObject:v6 forKey:v8];

    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_11(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_12(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)addAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v28 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = [v11 categoryType];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn addAlarm:asAccessory:fromClient:withCallback:](self, v10, v14);
  }

  id v15 = [v10 siriContext];
  id v27 = [v15 objectForKey:*MEMORY[0x263F33D90]];
  id v16 = [(COMeshAlarmAddOn *)self homekit];
  char v17 = [v16 hasOptedToHH2];
  if (v13) {
    char v18 = v17;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) != 0 || ![(id)*MEMORY[0x263F0B0A0] isEqualToString:v13])
  {
    if (v11)
    {
      id v24 = [(COMeshAlarmAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v11];
    }
    else
    {
      id v24 = 0;
    }
    uint64_t v25 = [(COMeshAlarmAddOn *)self addAlarm:v10 member:v24 client:v28];
    [(COMeshAlarmAddOn *)self _addCompletionsToFuture:v25 withXPCCallback:v12 transactionDescription:"com.apple.CoordinationCore.alarms.create"];

    if (v11) {
  }
    }
  else
  {
    id v26 = [(COAlarmRequest *)[COAlarmCreateRequest alloc] initWithAlarm:v10];
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__24;
    v33[4] = __Block_byref_object_dispose__24;
    id v34 = (id)os_transaction_create();
    uint64_t v19 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(COMeshAddOn *)self meshController];
      uint64_t v21 = [v10 alarmID];
      *(_DWORD *)buf = 134218242;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v21;
      _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%p locally adding %@", buf, 0x16u);
    }
    uint64_t v22 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke;
    block[3] = &unk_2645CE318;
    void block[4] = self;
    id v30 = v26;
    id v31 = v12;
    id v32 = v33;
    id v23 = v26;
    dispatch_async(v22, block);

    _Block_object_dispose(v33, 8);
  }
}

void __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke_2;
  v6[3] = &unk_2645CE2F0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 handleAlarmCreateRequest:v3 callback:v6];
}

void __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void, uint64_t))(v4 + 16))(*(void *)(a1 + 32), a3);
  }
  else
  {
    uint64_t v5 = [a2 error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)updateAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v36 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = [v11 uniqueIdentifier];
    id v14 = [v11 categoryType];
  }
  else
  {
    id v14 = 0;
    id v13 = 0;
  }
  id v15 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn updateAlarm:asAccessory:fromClient:withCallback:](self, v10, v15);
  }

  id v16 = [(COMeshAlarmAddOn *)self homekit];
  if (!v14)
  {
    if (v13)
    {
      id v14 = 0;
      goto LABEL_22;
    }
    char v17 = [v36 connection];
    id v34 = objc_msgSend(v17, "co_PeerInstance");

    if (v34
      && ([(COMeshAlarmAddOn *)self homehub],
          char v18 = objc_claimAutoreleasedReturnValue(),
          [v18 accessoryIdentifierForPeerInstance:v34 usingHomeKitAdapter:v16],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v18,
          v13))
    {
      uint64_t v19 = [v16 accessoryWithUniqueIdentifier:v13];
      if (!v19)
      {
LABEL_12:
        id v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v19 = objc_msgSend(v16, "currentAccessory", v34);
      id v13 = 0;
      if (!v19) {
        goto LABEL_12;
      }
    }
    id v20 = objc_msgSend(v10, "siriContext", v34);
    uint64_t v21 = [v20 objectForKey:*MEMORY[0x263F33D90]];

    if (!v21
      || (COAlarmSiriContextTargetReferenceForAccessory(),
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = [v21 compare:v22 options:1] == 0,
          v22,
          v23))
    {
      id v24 = [v19 category];
      id v14 = [v24 categoryType];
    }
    else
    {
      id v14 = 0;
    }
    if (!v11) {
      id v11 = (id)[objc_alloc(MEMORY[0x263F33F88]) initWithHomeKitAccessory:v19];
    }

    goto LABEL_21;
  }
LABEL_22:
  char v25 = objc_msgSend(v16, "hasOptedToHH2", v34);
  if (v14) {
    char v26 = v25;
  }
  else {
    char v26 = 1;
  }
  if ((v26 & 1) != 0 || ![(id)*MEMORY[0x263F0B0A0] isEqualToString:v14])
  {
    if (v11)
    {
      id v32 = [(COMeshAlarmAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v11];
    }
    else
    {
      id v32 = 0;
    }
    uint64_t v33 = [(COMeshAlarmAddOn *)self updateAlarm:v10 member:v32 client:v36];
    [(COMeshAlarmAddOn *)self _addCompletionsToFuture:v33 withXPCCallback:v12 transactionDescription:"com.apple.CoordinationCore.alarms.update"];

    if (v11) {
  }
    }
  else
  {
    long long v35 = [(COAlarmRequest *)[COAlarmUpdateRequest alloc] initWithAlarm:v10];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__24;
    void v41[4] = __Block_byref_object_dispose__24;
    id v42 = (id)os_transaction_create();
    id v27 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [(COMeshAddOn *)self meshController];
      id v29 = [v10 alarmID];
      *(_DWORD *)buf = 134218242;
      id v44 = v28;
      __int16 v45 = 2112;
      id v46 = v29;
      _os_log_impl(&dword_2217C1000, v27, OS_LOG_TYPE_DEFAULT, "%p locally updating %@", buf, 0x16u);
    }
    id v30 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke;
    block[3] = &unk_2645CE318;
    void block[4] = self;
    id v38 = v35;
    id v39 = v12;
    id v40 = v41;
    id v31 = v35;
    dispatch_async(v30, block);

    _Block_object_dispose(v41, 8);
  }
}

void __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke_2;
  v6[3] = &unk_2645CE2F0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 handleAlarmUpdateRequest:v3 callback:v6];
}

void __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void, uint64_t))(v4 + 16))(*(void *)(a1 + 32), a3);
  }
  else
  {
    uint64_t v5 = [a2 error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)removeAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v36 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = [v11 uniqueIdentifier];
    id v14 = [v11 categoryType];
  }
  else
  {
    id v14 = 0;
    id v13 = 0;
  }
  id v15 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn removeAlarm:asAccessory:fromClient:withCallback:](self, v10, v15);
  }

  id v16 = [(COMeshAlarmAddOn *)self homekit];
  if (!v14)
  {
    if (v13)
    {
      id v14 = 0;
      goto LABEL_22;
    }
    char v17 = [v36 connection];
    id v34 = objc_msgSend(v17, "co_PeerInstance");

    if (v34
      && ([(COMeshAlarmAddOn *)self homehub],
          char v18 = objc_claimAutoreleasedReturnValue(),
          [v18 accessoryIdentifierForPeerInstance:v34 usingHomeKitAdapter:v16],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v18,
          v13))
    {
      uint64_t v19 = [v16 accessoryWithUniqueIdentifier:v13];
      if (!v19)
      {
LABEL_12:
        id v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v19 = objc_msgSend(v16, "currentAccessory", v34);
      id v13 = 0;
      if (!v19) {
        goto LABEL_12;
      }
    }
    id v20 = objc_msgSend(v10, "siriContext", v34);
    uint64_t v21 = [v20 objectForKey:*MEMORY[0x263F33D90]];

    if (!v21
      || (COAlarmSiriContextTargetReferenceForAccessory(),
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = [v21 compare:v22 options:1] == 0,
          v22,
          v23))
    {
      id v24 = [v19 category];
      id v14 = [v24 categoryType];
    }
    else
    {
      id v14 = 0;
    }
    if (!v11) {
      id v11 = (id)[objc_alloc(MEMORY[0x263F33F88]) initWithHomeKitAccessory:v19];
    }

    goto LABEL_21;
  }
LABEL_22:
  char v25 = objc_msgSend(v16, "hasOptedToHH2", v34);
  if (v14) {
    char v26 = v25;
  }
  else {
    char v26 = 1;
  }
  if ((v26 & 1) != 0 || ![(id)*MEMORY[0x263F0B0A0] isEqualToString:v14])
  {
    if (v11)
    {
      id v32 = [(COMeshAlarmAddOn *)self secondaryClusterMemberIfRequiredForAccessory:v11];
    }
    else
    {
      id v32 = 0;
    }
    uint64_t v33 = [(COMeshAlarmAddOn *)self removeAlarm:v10 member:v32 client:v36];
    [(COMeshAlarmAddOn *)self _addCompletionsToFuture:v33 withXPCCallback:v12 transactionDescription:"com.apple.CoordinationCore.alarms.delete"];

    if (v11) {
  }
    }
  else
  {
    long long v35 = [(COAlarmRequest *)[COAlarmDeleteRequest alloc] initWithAlarm:v10];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__24;
    void v41[4] = __Block_byref_object_dispose__24;
    id v42 = (id)os_transaction_create();
    id v27 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [(COMeshAddOn *)self meshController];
      id v29 = [v10 alarmID];
      *(_DWORD *)buf = 134218242;
      id v44 = v28;
      __int16 v45 = 2112;
      id v46 = v29;
      _os_log_impl(&dword_2217C1000, v27, OS_LOG_TYPE_DEFAULT, "%p locally removing %@", buf, 0x16u);
    }
    id v30 = [(COMeshAddOn *)self meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke;
    block[3] = &unk_2645CE318;
    void block[4] = self;
    id v38 = v35;
    id v39 = v12;
    id v40 = v41;
    id v31 = v35;
    dispatch_async(v30, block);

    _Block_object_dispose(v41, 8);
  }
}

void __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke_2;
  v6[3] = &unk_2645CE2F0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 handleAlarmDeleteRequest:v3 callback:v6];
}

void __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void, uint64_t))(v4 + 16))(*(void *)(a1 + 32), a3);
  }
  else
  {
    uint64_t v5 = [a2 error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)snoozeAlarmWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMeshAddOn *)self meshController];
  id v12 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn snoozeAlarmWithIdentifier:fromClient:withCallback:]((uint64_t)v11);
  }

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__24;
  void v38[4] = __Block_byref_object_dispose__24;
  id v39 = (id)os_transaction_create();
  id v13 = [(COMeshAlarmAddOn *)self snoozeAlarmWithIdentifier:v8 client:v9];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke;
  v33[3] = &unk_2645CE340;
  id v14 = v11;
  id v34 = v14;
  id v15 = v8;
  id v35 = v15;
  id v16 = v10;
  id v36 = v16;
  __int16 v37 = v38;
  id v17 = (id)[v13 addFailureBlock:v33];
  char v18 = [(COMeshAlarmAddOn *)self alarmManager];
  uint64_t v19 = [(COMeshAlarmAddOn *)self homekit];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_239;
  v26[3] = &unk_2645CE3E0;
  id v20 = v14;
  id v27 = v20;
  id v21 = v15;
  id v28 = v21;
  id v22 = v16;
  id v31 = v22;
  id v23 = v19;
  id v29 = v23;
  id v24 = v18;
  id v30 = v24;
  id v32 = v38;
  id v25 = (id)[v13 addSuccessBlock:v26];

  _Block_object_dispose(v38, 8);
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_239(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_239_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v3 = [*(id *)(a1 + 48) currentAccessory];
  uint64_t v4 = [*(id *)(a1 + 48) homeForAccessory:v3];
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    uint64_t v6 = [*(id *)(a1 + 56) alarms];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_240;
    v12[3] = &unk_2645CE3B8;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v15 = v3;
    id v16 = v5;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 72);
    id v17 = v7;
    uint64_t v18 = v8;
    id v9 = (id)[v6 addCompletionBlock:v12];

    id v10 = v13;
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_240(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 32)];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      if (([*(id *)(a1 + 40) hasOptedToHH2] & 1) == 0)
      {
        uint64_t v11 = [v10 alarmID];
        int v12 = [v4 isEqual:v11];

        if (v12) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v13 = [*(id *)(a1 + 40) alarmsForAccessory:*(void *)(a1 + 48) inHome:*(void *)(a1 + 56)];
    id v14 = (void *)v13;
    if (v13) {
      id v15 = (void *)v13;
    }
    else {
      id v15 = (void *)MEMORY[0x263EFFA68];
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_2;
    v29[3] = &unk_2645CE368;
    id v30 = v4;
    id v16 = objc_msgSend(v15, "na_firstObjectPassingTest:", v29);

    if (v16 && ([v16 isEnabled] & 1) == 0)
    {
      uint64_t v18 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 64);
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v36 = v19;
        __int16 v37 = 2112;
        uint64_t v38 = v20;
        _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p updating the state of the snoozed alarm %@", buf, 0x16u);
      }

      id v21 = (void *)[v10 mutableCopy];
      [v21 setEnabled:1];
      id v17 = [*(id *)(a1 + 40) updateAlarm:v21 onAccessory:*(void *)(a1 + 48) inHome:*(void *)(a1 + 56)];
    }
    else
    {
      id v17 = 0;
    }

    if (v17) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_10:
  }
  id v17 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_22:
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_241;
  v25[3] = &unk_2645CE390;
  id v26 = *(id *)(a1 + 64);
  id v22 = *(id *)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 72);
  id v27 = v22;
  uint64_t v28 = v23;
  id v24 = (id)[v17 addCompletionBlock:v25];
}

uint64_t __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_241(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v7 = 134218242;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p done updating the state of the snoozed alarm %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)dismissAlarmWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshAddOn *)self meshController];
  int v12 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn dismissAlarmWithIdentifier:fromClient:withCallback:]((uint64_t)v11);
  }

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__24;
  void v33[4] = __Block_byref_object_dispose__24;
  id v34 = (id)os_transaction_create();
  uint64_t v13 = [(COMeshAlarmAddOn *)self dismissAlarmWithIdentifier:v8 client:v9];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke;
  v27[3] = &unk_2645CE458;
  id v14 = v11;
  id v28 = v14;
  id v15 = v8;
  id v29 = v15;
  id v30 = self;
  id v16 = v10;
  id v31 = v16;
  long long v32 = v33;
  id v17 = (id)[v13 addFailureBlock:v27];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_245;
  v22[3] = &unk_2645CE480;
  id v18 = v14;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  id v20 = v16;
  id v25 = v20;
  id v26 = v33;
  id v21 = (id)[v13 addSuccessBlock:v22];

  _Block_object_dispose(v33, 8);
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 48) alarmManager];
  uint64_t v4 = [v3 dismissAlarmWithIdentifier:*(void *)(a1 + 40)];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_243;
  v18[3] = &unk_2645CE340;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v21 = v5;
  uint64_t v22 = v6;
  id v7 = (id)[v4 addFailureBlock:v18];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_244;
  v12[3] = &unk_2645CE430;
  id v13 = v3;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v16 = v8;
  uint64_t v17 = v9;
  id v10 = v3;
  id v11 = (id)[v4 addSuccessBlock:v12];
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_243(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_243_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_244(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) alarms];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2;
  v9[3] = &unk_2645CE408;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v3 = (id)[v2 addSuccessBlock:v9];

  uint64_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_244_cold_1();
  }

  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v5, v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 32)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "alarmID", (void)v17);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = [COAlarmFiringAlarmDismissedNotification alloc];
          id v21 = v10;
          id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
          id v15 = [(COAlarmNotification *)v13 initWithAlarms:v14];

          id v16 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2_cold_1(a1, v10);
          }

          [*(id *)(a1 + 40) sendNotification:v15];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_245(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_245_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMeshAddOn *)self meshControllerQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke;
  v15[3] = &unk_2645CB4D0;
  id v16 = v8;
  long long v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v3 = [*(id *)(a1 + 32) categoryType];
  uint64_t v4 = [*(id *)(a1 + 32) IDSIdentifier];
  id v5 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(NSObject **)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    uint64_t v52 = v6;
    __int16 v53 = 2112;
    uint64_t v54 = v7;
    __int16 v55 = 2112;
    uint64_t v56 = v2;
    __int16 v57 = 2112;
    uint64_t v58 = (uint64_t)v3;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p as %@ checking dispatch for %@ of %@...", buf, 0x2Au);
  }

  if (!(*(void *)(a1 + 48) | v2))
  {
    LODWORD(v8) = 1;
    goto LABEL_43;
  }
  int v9 = [v3 isEqualToString:*MEMORY[0x263F0B0A0]];
  id v11 = (id *)(a1 + 40);
  id v10 = *(void **)(a1 + 40);
  if (v9)
  {
    id v12 = [v10 homekit];
    int v13 = [v12 hasOptedToHH2];

    if (v13)
    {
      id v14 = [*v11 meshController];
      uint64_t v15 = [v14 state];

      id v16 = [*v11 ourInterests];
      long long v17 = [v16 objectForKey:v4];

      if (v17)
      {
        id v8 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = *(void *)(a1 + 32);
          uint64_t v40 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          uint64_t v52 = v40;
          __int16 v53 = 2048;
          uint64_t v54 = v17;
          __int16 v55 = 2112;
          uint64_t v56 = v41;
          _os_log_debug_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEBUG, "%p using interest tracker %p for can dispatch of %@", buf, 0x20u);
        }

        LODWORD(v8) = [v17 canDispatchWithPrimary:v15 == 3];
      }
      else
      {
        if (v15 == 3)
        {
          id v26 = COCoreLogForCategory(2);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1();
          }

          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v27 = [*v11 meshController];
          id v28 = [v27 nodes];

          obuint64_t j = v28;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v62 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v48;
            while (2)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v48 != v31) {
                  objc_enumerationMutation(obj);
                }
                long long v33 = [*(id *)(*((void *)&v47 + 1) + 8 * i) IDSIdentifier];
                char v34 = [v33 isEqual:v4];

                if (v34)
                {

                  goto LABEL_41;
                }
              }
              uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v62 count:16];
              if (v30) {
                continue;
              }
              break;
            }
          }
        }
        id v35 = [*(id *)(a1 + 40) secondaryClusterMemberForAccessory:*(void *)(a1 + 32)];
        LODWORD(v8) = v35 != 0;
      }
    }
    else
    {
      long long v17 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2();
      }
      LODWORD(v8) = 1;
    }
  }
  else
  {
    id v18 = [v10 meshController];
    uint64_t v19 = [v18 state];

    if (v19 != 3)
    {
      LODWORD(v8) = 0;
      goto LABEL_43;
    }
    long long v20 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_3();
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v21 = [*v11 meshController];
    long long v17 = [v21 nodes];

    id v8 = [v17 countByEnumeratingWithState:&v43 objects:v61 count:16];
    if (v8)
    {
      uint64_t v22 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v8; uint64_t j = ((char *)j + 1))
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(v17);
          }
          id v24 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)j) remote];
          uint64_t v25 = [v24 type];

          if (v25 != -1)
          {
LABEL_41:
            LODWORD(v8) = 1;
            goto LABEL_42;
          }
        }
        id v8 = [v17 countByEnumeratingWithState:&v43 objects:v61 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
LABEL_42:

LABEL_43:
  uint64_t v36 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = *(void *)(a1 + 40);
    uint64_t v38 = *(NSObject **)(a1 + 48);
    id v39 = " not";
    if (v8) {
      id v39 = "";
    }
    *(_DWORD *)buf = 134219010;
    uint64_t v52 = v37;
    __int16 v53 = 2112;
    uint64_t v54 = v38;
    __int16 v55 = 2080;
    uint64_t v56 = (uint64_t)v39;
    __int16 v57 = 2112;
    uint64_t v58 = v2;
    __int16 v59 = 2112;
    id v60 = v3;
    _os_log_impl(&dword_2217C1000, v36, OS_LOG_TYPE_DEFAULT, "%p as %@ can%s dispatch for %@ of %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)mediaSystemCompanionTransitionedFrom:(id)a3 to:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COMeshAlarmAddOn *)self homekit];
  if ([v8 hasOptedToHH2])
  {
    char v9 = [v6 isEqual:v7];
    if (v7 != v6 && (v9 & 1) == 0)
    {
      id v10 = [v8 currentAccessory];
      id v11 = v10;
      if (!v10)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v12 = [v10 uniqueIdentifier];
      int v13 = v12;
      if (v7)
      {
        uint64_t v14 = objc_msgSend(v12, "co_compare:", v7);
        uint64_t v15 = COCoreLogForCategory(2);
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14 == 1)
        {
          if (v16)
          {
            *(_DWORD *)buf = 134218498;
            long long v32 = self;
            __int16 v33 = 2112;
            char v34 = v13;
            __int16 v35 = 2112;
            id v36 = v7;
            _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%p system pair alarms deferred by %@ to %@", buf, 0x20u);
          }
          goto LABEL_16;
        }
        if (v16)
        {
          *(_DWORD *)buf = 134218498;
          long long v32 = self;
          __int16 v33 = 2112;
          char v34 = v13;
          __int16 v35 = 2112;
          id v36 = v7;
          _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%p system pair alarms being coalesced for %@ and %@", buf, 0x20u);
        }

        uint64_t v15 = [(COMeshAlarmAddOn *)self alarmManager];
        id v18 = [v15 alarms];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke;
        v27[3] = &unk_2645CCA38;
        id v28 = v13;
        id v29 = v7;
        uint64_t v30 = self;
        id v21 = (id)[v18 addSuccessBlock:v27];

        long long v20 = v28;
      }
      else
      {
        long long v17 = COCoreLogForCategory(2);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          long long v32 = self;
          __int16 v33 = 2112;
          char v34 = v13;
          __int16 v35 = 2112;
          id v36 = v6;
          _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%p system pair alarms splitting %@ from %@", buf, 0x20u);
        }

        uint64_t v15 = [(COMeshAlarmAddOn *)self alarmManager];
        id v18 = [v15 alarms];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_248;
        v22[3] = &unk_2645CC630;
        id v23 = v13;
        id v24 = v6;
        uint64_t v25 = self;
        id v26 = v11;
        id v19 = (id)[v18 addSuccessBlock:v22];

        long long v20 = v23;
      }

LABEL_16:
      goto LABEL_17;
    }
  }
LABEL_18:
}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke(void *a1, void *a2)
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[5];
  v18[0] = a1[4];
  v18[1] = v3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:v18 count:2];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2;
  v16[3] = &unk_2645CD640;
  v16[4] = a1[6];
  id v17 = v6;
  id v7 = v6;
  id v8 = [v5 indexesOfObjectsPassingTest:v16];
  char v9 = [v5 objectsAtIndexes:v8];

  id v10 = UniqueAlarms(v9);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3;
  v13[3] = &unk_2645CE138;
  uint64_t v11 = a1[6];
  id v14 = v10;
  uint64_t v15 = v11;
  id v12 = v10;
  [v9 enumerateObjectsUsingBlock:v13];
}

uint64_t __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isAlarm:a2 targetingAccessoryIdentifiers:*(void *)(a1 + 40)];
}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    id v3 = (id)[*(id *)(a1 + 40) removeAlarm:v4];
  }
}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_248(void *a1, void *a2)
{
  v21[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[5];
  v21[0] = a1[4];
  v21[1] = v3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:v21 count:2];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2_249;
  void v18[3] = &unk_2645CD640;
  void v18[4] = a1[6];
  id v19 = v6;
  id v7 = v6;
  id v8 = [v5 indexesOfObjectsPassingTest:v18];
  char v9 = [v5 objectsAtIndexes:v8];

  id v10 = UniqueAlarms(v9);

  uint64_t v20 = a1[4];
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  id v12 = COAlarmSiriContextTargetReferenceForAccessory();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3_250;
  v15[3] = &unk_2645CE078;
  void v15[4] = a1[6];
  id v16 = v11;
  id v17 = v12;
  id v13 = v12;
  id v14 = v11;
  [v10 enumerateObjectsUsingBlock:v15];
}

uint64_t __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2_249(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "co_targetReference");
  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 32) _isAlarm:v3 targetingAccessoryIdentifiers:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3_250(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F55D68]);
  int v5 = [*(id *)(a1 + 32) _isAlarm:v3 targetingAccessoryIdentifiers:*(void *)(a1 + 40)];
  id v6 = COCoreLogForCategory(2);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      char v9 = [v3 alarmID];
      id v10 = [v4 alarmID];
      int v18 = 134218498;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      uint64_t v11 = "%p replacing %@ with %@";
LABEL_6:
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0x20u);
    }
  }
  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    char v9 = [v3 alarmID];
    id v10 = [v4 alarmID];
    int v18 = 134218498;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    uint64_t v11 = "%p duplicating %@ to %@";
    goto LABEL_6;
  }

  if (v4)
  {
    objc_msgSend(v4, "setHour:", objc_msgSend(v3, "hour"));
    objc_msgSend(v4, "setMinute:", objc_msgSend(v3, "minute"));
    objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
    objc_msgSend(v4, "setRepeatSchedule:", objc_msgSend(v3, "repeatSchedule"));
    id v13 = [v3 title];
    [v4 setTitle:v13];

    id v14 = [v3 sound];
    [v4 setSound:v14];

    uint64_t v15 = [v3 siriContext];
    [v4 setSiriContext:v15];

    objc_msgSend(v4, "co_setTargetReference:", *(void *)(a1 + 48));
    id v16 = (id)[*(id *)(a1 + 32) addAlarm:v4];
    if (v5) {
      id v17 = (id)[*(id *)(a1 + 32) removeAlarm:v3];
    }
  }
}

- (void)establishSecondaryClusterForAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F33F80] isHomeKitUsingAlarmsAndTimersIDSService])
  {
    int v5 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = @"com.apple.private.alloy.alarms-timers";
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p HomeKit is making use of IDS Service %@ for alarms", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    int v5 = [(COMeshAlarmAddOn *)self homekit];
    if (([v5 hasOptedToHH2] & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    actionDirector = self->_actionDirector;

    if (!actionDirector)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __58__COMeshAlarmAddOn_establishSecondaryClusterForAccessory___block_invoke;
      v7[3] = &unk_2645CAE80;
      void v7[4] = self;
      id v8 = v4;
      [(COMeshAlarmAddOn *)self _withLock:v7];
    }
  }
LABEL_9:
}

void __58__COMeshAlarmAddOn_establishSecondaryClusterForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 80))
  {
    Class v2 = NSClassFromString(&cfstr_Coclusterrealm.isa);
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = [v3 homeUniqueIdentifier];
      int v5 = [(objc_class *)v2 realmWithHomeKitHomeIdentifier:v4];
    }
    else
    {
      int v5 = [(objc_class *)v2 realmForCurrent];
    }
    id v6 = [MEMORY[0x263F33F48] configurationWithDomain:@"com.apple.alarms-timers" requiredServices:12 options:0 realm:v5 globalServiceName:@"com.apple.private.alloy.alarms-timers"];
    BOOL v7 = [MEMORY[0x263F33F40] clusterWithConfiguration:v6];
    id v8 = +[COMTActionDirector directorForCluster:v7];
    char v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:3];
    __int16 v11 = objc_msgSend(v9, "setWithArray:", v10, v18, v19);

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = (objc_class *)objc_opt_class();
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
    obuint64_t j = [(COMeshAlarmAddOn *)self members];
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
          char v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v10 = [v9 member];
          __int16 v11 = [v10 deviceMetadata];
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
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![MEMORY[0x263F33F80] isGlobalMessagingEnabled]) {
    goto LABEL_14;
  }
  uint64_t v5 = [(COMeshAlarmAddOn *)self homekit];
  int v6 = [v5 hasOptedToHH2];

  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = [v4 categoryType];
  if (([v7 isEqualToString:*MEMORY[0x263F0B0A0]] & 1) == 0)
  {

LABEL_14:
    long long v17 = 0;
    goto LABEL_15;
  }
  id v8 = [v4 IDSIdentifier];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v9 = [(COMeshAddOn *)self meshController];
  id v10 = [v9 nodes];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) IDSIdentifier];
        char v16 = [v15 isEqual:v8];

        if (v16)
        {

          long long v17 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v17 = [(COMeshAlarmAddOn *)self secondaryClusterMemberForAccessory:v4];
LABEL_19:

LABEL_15:
  return v17;
}

- (void)setInterests:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(COMeshAddOn *)self meshControllerQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke;
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

void __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke(uint64_t a1)
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
      int v6 = [v5 nodes];

      uint64_t v7 = COMeshNodeForIDSIdentifier(v6, v2);
      id v8 = [*(id *)(a1 + 40) secondaryClusterMemberForAccessory:*(void *)(a1 + 32)];
      id v4 = [[COInterestTracker alloc] initWithAccessory:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40) primaryAvailable:v7 != 0 secondary:v8];
      id v9 = [*(id *)(a1 + 40) ourInterests];
      id v10 = (void *)[v9 mutableCopy];

      [v10 setObject:v4 forKey:v2];
      [*(id *)(a1 + 40) setOurInterests:v10];
      uint64_t v11 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        int v20 = 134218498;
        uint64_t v21 = v12;
        __int16 v22 = 2048;
        id v23 = v4;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p using %p to track our interests for accessory %@", (uint8_t *)&v20, 0x20u);
      }
    }
    [(COInterestTracker *)v4 setInterests:*(void *)(a1 + 48)];
    if (![*(id *)(a1 + 48) count])
    {
      id v14 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 40);
        int v20 = 134218498;
        uint64_t v21 = v15;
        __int16 v22 = 2048;
        id v23 = v4;
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
    id v19 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1();
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

  id v19 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v38 = self;
    __int16 v39 = 2048;
    id v40 = v10;
    __int16 v41 = 2114;
    id v42 = v18;
    __int16 v43 = 2114;
    id v44 = v11;
    _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%p setting interests for tracker %p via %{public}@ to %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke;
  v32[3] = &unk_2645CCAD8;
  objc_copyWeak(&v36, (id *)buf);
  id v20 = v10;
  id v33 = v20;
  id v21 = v18;
  id v34 = v21;
  id v22 = v13;
  id v35 = v22;
  id v23 = (void *)MEMORY[0x223C8B4A0](v32);
  __int16 v24 = [(COMeshAddOn *)self meshControllerQueue];
  uint64_t v25 = [(COMeshAlarmAddOn *)self actionDirector];
  uint64_t v26 = [MEMORY[0x263EFFA08] setWithObject:v12];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_263;
  v29[3] = &unk_2645CCB00;
  id v27 = v24;
  id v30 = v27;
  id v28 = v23;
  id v31 = v28;
  [v25 requestAction:v21 members:v26 activity:0 withCompletion:v29];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

void __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v5 = COCoreLogForCategory(2);
    int v6 = v5;
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
      [v11 didChangeCompositionForAlarmAddOn:WeakRetained];
    }
  }
}

void __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_263(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2;
  v8[3] = &unk_2645CB170;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)interestTrackerTriggerReset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[COMeshAlarmAddOn handleAlarmManagerStateResetNotification:](self);
  }

  id v7 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v4 accessory];
    id v9 = [v8 uniqueIdentifier];

    [v7 alarmAddOn:self resetAccesory:v9];
  }
}

- (void)_reaperFired
{
  id v3 = [(COMeshAlarmAddOn *)self homekit];
  id v4 = [v3 currentAccessory];
  if (v4)
  {
    uint64_t v5 = [v3 homeForAccessory:v4];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v7 doubleForKey:@"ReapExpirationInterval"];
      double v9 = v8;
      id v10 = [(COMeshAddOn *)self meshControllerQueue];
      if (v10)
      {
        v12[1] = 3221225472;
        double v11 = 5184000.0;
        v12[0] = MEMORY[0x263EF8330];
        void v12[2] = __32__COMeshAlarmAddOn__reaperFired__block_invoke;
        v12[3] = &unk_2645CD7D0;
        if (v9 > 0.0) {
          double v11 = v9;
        }
        void v12[4] = self;
        double v15 = v11;
        id v13 = v4;
        id v14 = v6;
        dispatch_async(v10, v12);
      }
    }
  }
}

void __32__COMeshAlarmAddOn__reaperFired__block_invoke(uint64_t a1)
{
  Class v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-*(double *)(a1 + 56)];
  [v2 reapNonRepeatingAlarmsOlderThanDate:v3 accessory:*(void *)(a1 + 40) home:*(void *)(a1 + 48)];
}

- (void)reapNonRepeatingAlarmsOlderThanDate:(id)a3 accessory:(id)a4 home:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(COMeshAlarmAddOn *)self performsLocalActions])
  {
    uint32_t v11 = arc4random();
    int v12 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v44 = v11;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "(%u) Alarm reap started.", buf, 8u);
    }

    id v13 = [(COMeshAlarmAddOn *)self homekit];
    id v14 = &off_22188F000;
    if ([v13 hasOptedToHH2]) {
      goto LABEL_8;
    }
    double v15 = (void *)*MEMORY[0x263F0B0A0];
    __int16 v16 = [v9 category];
    uint64_t v17 = [v16 categoryType];
    LOBYTE(v15) = [v15 isEqual:v17];

    if ((v15 & 1) == 0)
    {
LABEL_8:
      id v19 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v20 = [(COMeshAlarmAddOn *)self alarmManager];
      id v21 = [v20 alarms];

      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke;
      v39[3] = &unk_2645CE278;
      id v22 = v19;
      id v40 = v22;
      __int16 v41 = self;
      id v42 = v9;
      id v23 = (id)[v21 addCompletionBlock:v39];

      id v18 = v40;
    }
    else
    {
      id v18 = [v13 mediaSystemForAccessory:v9 inHome:v10];
      if (v18) {
        [v13 settingsForKeyPath:@"root.mobileTimer.alarms" onMediaObject:v18];
      }
      else {
      uint64_t v25 = [v13 settingsForKeyPath:@"root.mobileTimer.alarms" onAccessory:v9];
      }
      id v21 = [v25 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = COAlarmSiriContextTargetReferenceForAccessory();
        id v30 = (void *)MEMORY[0x263F58190];
        objc_msgSend(v21, "co_rawAlarms");
        id v27 = v31 = v11;
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2;
        v36[3] = &unk_2645CE4A8;
        id v37 = v26;
        id v18 = v18;
        id v38 = v18;
        id v29 = v26;
        id v28 = objc_msgSend(v27, "na_map:", v36);
        id v22 = [v30 futureWithResult:v28];

        id v14 = &off_22188F000;
        uint32_t v11 = v31;
      }
      else
      {
        id v22 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
      }
    }

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = *((void *)v14 + 441);
    v32[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_3;
    v32[3] = &unk_2645CE568;
    uint32_t v35 = v11;
    id v33 = v8;
    id v34 = self;
    id v24 = (id)[v22 addSuccessBlock:v32];
  }
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke(uint64_t a1, uint64_t a2)
{
  Class v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = MEMORY[0x263EFFA68];
  }
  id v4 = [*(id *)(a1 + 40) _filteredAlarmsList:v3 forAccessory:*(void *)(a1 + 48)];
  [v2 finishWithResult:v4];
}

id __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 mutableCopy];
  objc_msgSend(v3, "co_setTargetReference:", *(void *)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "co_setIsMediaSystemOriginating");
  }
  return v3;
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_4;
  void v18[3] = &unk_2645CE4D0;
  id v19 = *(id *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 indexesOfObjectsPassingTest:v18];
  id v6 = [v4 objectsAtIndexes:v5];

  if ([v6 count])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_267;
    v16[3] = &unk_2645CE520;
    v16[4] = *(void *)(a1 + 40);
    int v17 = *(_DWORD *)(a1 + 48);
    id v7 = objc_msgSend(v6, "na_map:", v16);
    id v8 = (void *)MEMORY[0x263F581B8];
    id v9 = [*(id *)(a1 + 40) meshControllerQueue];
    id v10 = [v8 schedulerWithDispatchQueue:v9];

    uint32_t v11 = [MEMORY[0x263F58190] combineAllFutures:v7 ignoringErrors:1 scheduler:v10];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_269;
    v14[3] = &__block_descriptor_36_e20_v24__0_8__NSError_16l;
    int v15 = *(_DWORD *)(a1 + 48);
    id v12 = (id)[v11 addCompletionBlock:v14];
  }
  else
  {
    id v7 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109120;
      int v21 = v13;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "(%u) Alarm reap complete with no alarms.", buf, 8u);
    }
  }
}

BOOL __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 lastModifiedDate];
  if ([v3 isEnabled])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 0;
    if (([v3 repeats] & 1) == 0 && v4)
    {
      id v6 = [v4 earlierDate:*(void *)(a1 + 32)];
      BOOL v5 = v4 == v6;
    }
  }

  return v5;
}

id __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_267(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) removeAlarm:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_268;
  v8[3] = &unk_2645CE4F8;
  int v10 = *(_DWORD *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addCompletionBlock:v8];

  return v4;
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_268(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COCoreLogForCategory(2);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_268_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) alarmID];
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2112;
    uint32_t v11 = v8;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "(%u) Reaped alarm: %@", (uint8_t *)v9, 0x12u);
  }
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_269(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  Class v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "(%u) Alarm reap complete.", (uint8_t *)v4, 8u);
  }
}

- (void)director:(id)a3 membersChanged:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(COMeshAlarmAddOn *)self members];
  int v7 = (void *)[v6 mutableCopy];

  [v7 minusSet:v5];
  [(COMeshAlarmAddOn *)self setMembers:v5];
  id v8 = [(COMeshAlarmAddOn *)self interests];
  id v9 = [v8 allKeys];
  __int16 v10 = (void *)[v9 mutableCopy];

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
    int v17 = [(COMeshAlarmAddOn *)self interests];
    id v18 = (void *)[v17 mutableCopy];

    [v18 removeObjectsForKeys:v10];
    [(COMeshAlarmAddOn *)self setInterests:v18];
    id v19 = COCoreLogForCategory(2);
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

        id v27 = [(COMeshAlarmAddOn *)self ourInterests];
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
        uint32_t v35 = [v34 IDSIdentifier];
        id v36 = [(COMeshAlarmAddOn *)self ourInterests];
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

  id v38 = [(COMeshAlarmAddOn *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v38 didChangeCompositionForAlarmAddOn:self];
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
      int v17 = (COAlarmUpdateRequest *)v11;
      id v19 = [(COAlarmUpdateRequest *)v17 memento];
      id v20 = [v19 uniqueIdentifier];

      if (!v20)
      {
        uint64_t v21 = [(COMeshAlarmAddOn *)self homekit];
        uint64_t v22 = [v21 currentAccessory];
        id v20 = [v22 uniqueIdentifier];
      }
      uint64_t v23 = [[COAlarmReadRequest alloc] initWithAccessoryUniqueIdentifier:v20];
      objc_initWeak(&location, self);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_2;
      v35[3] = &unk_2645CCB50;
      id v37 = v13;
      objc_copyWeak(&v38, &location);
      id v36 = v14;
      [(COMeshAlarmAddOn *)self handleAlarmReadRequest:v23 callback:v35];

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = [COAlarmUpdateRequest alloc];
        uint64_t v25 = [v11 alarm];
        int v17 = [(COAlarmRequest *)v24 initWithAlarm:v25];

        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_3;
        v32[3] = &unk_2645CCB28;
        id v33 = v14;
        id v34 = v13;
        [(COMeshAlarmAddOn *)self handleAlarmUpdateRequest:v17 callback:v32];

        id v18 = v33;
        goto LABEL_3;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v17 = [v11 targetIdentifier];
        id v20 = (void *)[objc_alloc(MEMORY[0x263F55D40]) initWithIdentifier:v17];
        uint64_t v23 = [(COAlarmRequest *)[COAlarmDeleteRequest alloc] initWithAlarm:v20];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_4;
        v29[3] = &unk_2645CCB28;
        id v30 = v14;
        id v31 = v13;
        [(COMeshAlarmAddOn *)self handleAlarmDeleteRequest:v23 callback:v29];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v26 = [(COMeshAlarmAddOn *)self interests];
          int v17 = (COAlarmUpdateRequest *)[v26 mutableCopy];

          id v20 = [v11 targetIdentifiers];
          if ([v20 count]) {
            [(COAlarmUpdateRequest *)v17 setObject:v20 forKey:v12];
          }
          else {
            [(COAlarmUpdateRequest *)v17 removeObjectForKey:v12];
          }
          [(COMeshAlarmAddOn *)self setInterests:v17];
          id v27 = [[COMTResult alloc] initWithActionIdentifier:v14];
          (*((void (**)(id, COMTResult *, void))v13 + 2))(v13, v27, 0);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        int v17 = [(COMeshAlarmAddOn *)self delegate];
        id v20 = [v11 reason];
        uint64_t v23 = [v11 alarms];
        if ([v20 isEqual:*MEMORY[0x263F55CA0]]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [(COAlarmUpdateRequest *)v17 alarmAddOn:self didAddAlarms:v23];
        }
        else if ([v20 isEqual:*MEMORY[0x263F55CB8]] {
               && (objc_opt_respondsToSelector() & 1) != 0)
        }
        {
          [(COAlarmUpdateRequest *)v17 alarmAddOn:self didRemoveAlarms:v23];
        }
        else if ([v20 isEqual:*MEMORY[0x263F55CC0]] {
               && (objc_opt_respondsToSelector() & 1) != 0)
        }
        {
          [(COAlarmUpdateRequest *)v17 alarmAddOn:self didUpdateAlarms:v23];
        }
        id v28 = [[COMTResult alloc] initWithActionIdentifier:v14];
        (*((void (**)(id, COMTResult *, void))v13 + 2))(v13, v28, 0);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v15 = [COAlarmCreateRequest alloc];
  __int16 v16 = [v11 alarm];
  int v17 = [(COAlarmRequest *)v15 initWithAlarm:v16];

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke;
  v40[3] = &unk_2645CCB28;
  id v41 = v14;
  id v42 = v13;
  [(COMeshAlarmAddOn *)self handleAlarmCreateRequest:v17 callback:v40];

  id v18 = v41;
LABEL_3:

LABEL_14:
LABEL_15:
}

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5 || ([a2 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    int v7 = 0;
  }
  else
  {
    int v7 = [[COMTResult alloc] initWithActionIdentifier:*(void *)(a1 + 32)];
    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
      id v5 = [v8 alarms];
    }
    else
    {
      id v5 = (id)MEMORY[0x263EFFA68];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      int v7 = [[COMTAlarmReadResult alloc] initWithAlarms:v5 actionIdentifier:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5 || ([a2 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    int v7 = 0;
  }
  else
  {
    int v7 = [[COMTResult alloc] initWithActionIdentifier:*(void *)(a1 + 32)];
    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5 || ([a2 error], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    int v7 = 0;
  }
  else
  {
    int v7 = [[COMTResult alloc] initWithActionIdentifier:*(void *)(a1 + 32)];
    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (id)mediaSystemUpdateRegistration
{
  return self->_mediaSystemUpdateRegistration;
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

- (OS_dispatch_source)reaper
{
  return self->_reaper;
}

- (NSMutableDictionary)alarmIndex
{
  return self->_alarmIndex;
}

- (void)setAlarmIndex:(id)a3
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

- (COAlarmReadRequest)mergeRequest
{
  return self->_mergeRequest;
}

- (void)setMergeRequest:(id)a3
{
}

- (NSArray)mergeAlarms
{
  return self->_mergeAlarms;
}

- (void)setMergeAlarms:(id)a3
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

- (MTAlarmManager)observedAlarmManager
{
  return self->_observedAlarmManager;
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
  objc_storeStrong((id *)&self->_observedAlarmManager, 0);
  objc_storeStrong((id *)&self->_queuedCommands, 0);
  objc_storeStrong((id *)&self->_mergeResponses, 0);
  objc_storeStrong((id *)&self->_mergeAlarms, 0);
  objc_storeStrong((id *)&self->_mergeRequest, 0);
  objc_storeStrong((id *)&self->_mergingNodes, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_homehub, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
  objc_storeStrong((id *)&self->_alarmIndex, 0);
  objc_storeStrong((id *)&self->_reaper, 0);
  objc_storeStrong((id *)&self->_actionDirector, 0);
  objc_storeStrong((id *)&self->_ourInterests, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong(&self->_mediaSystemUpdateRegistration, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didChangeNodesForMeshController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v0, (uint64_t)v0, "%p merge %p lost final nodes", v1);
}

void __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 meshController];
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p merge %p received an error on the last node", v4, v5, v6, v7, 0);
}

- (void)_continueMerge:withResponse:fromNode:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v0, (uint64_t)v0, "%p merge %p received last response", v1);
}

void __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p failed to fetch alarms for index: %{public}@");
}

- (void)_alarmManagerAlarmFired:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p has no updates for synchronization.", v2, v3, v4, v5, v6);
}

- (void)_alarmManagerAlarmFired:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p alarm firing, but need to synchronize...", v2, v3, v4, v5, v6);
}

- (void)_alarmManagerAlarmFired:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p is solo, so it will write.", v2, v3, v4, v5, v6);
}

- (void)_alarmManagerAlarmFired:(uint64_t)a1 .cold.5(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v1, (uint64_t)v1, "%p will not write because %@ is lower", (uint8_t *)&v2);
}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [*(id *)(v0 + 40) alarmID];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11_0(&dword_2217C1000, v2, v3, "%p failed locally updating %@ (%@)", v4, v5, v6, v7, 2u);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_171_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p specified accessory (%@) was not found in order to filter local alarms!");
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_171_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p local alarms list failed (%@)");
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_176_cold_1()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p specified accessory (%@) was not found in order to filter alarms!");
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_176_cold_2()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p alarms list from leader failed (%@)");
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_179_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_1(&dword_2217C1000, v0, v1, "%p failed to retrieve MT alarms [Error %@] - using list from leader: %@");
}

- (void)_isAlarm:(void *)a1 targetingAccessoryIdentifiers:.cold.1(void *a1)
{
  os_log_t v1 = [a1 alarmID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "alarm (%@) is not targeting", v4, v5, v6, v7, v8);
}

void __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p direct snooze failed (%@)");
}

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_201_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) meshController];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11_0(&dword_2217C1000, v2, v3, "%p early dismissing %@ failed (%@).", v4, v5, v6, v7, v8);
}

- (void)handleAlarmReadRequest:callback:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 meshController];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_2(&dword_2217C1000, v0, v3, "%p read did not find (%@)", v4);
}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "... alarms list failed (%@)", v2, v3, v4, v5, v6);
}

- (void)handleAlarmCreateRequest:(uint64_t)a1 callback:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v1, v2, "%p did not find accessories for %@", (void)v3, DWORD2(v3));
}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t v2 = [*(id *)(v1 + 32) alarmID];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_2(&dword_2217C1000, v0, v3, "... alarm (%@) create failed (%@)", v4);
}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_208_cold_1(uint64_t a1, id *a2)
{
  os_log_t v2 = [*a2 alarmID];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding creation of %@ to the mesh", v5, v6, v7, v8, 2u);
}

- (void)handleAlarmUpdateRequest:(uint64_t)a1 callback:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v1, v2, "%p update did not find accessories for %@", (void)v3, DWORD2(v3));
}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t v2 = [*(id *)(v1 + 32) alarmID];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_2(&dword_2217C1000, v0, v3, "... alarm (%@) update failed (%@)", v4);
}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_210_cold_1(uint64_t a1, id *a2)
{
  os_log_t v2 = [*a2 alarmID];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding update of %@ to the mesh", v5, v6, v7, v8, 2u);
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t v2 = [*(id *)(v1 + 32) alarmID];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_2(&dword_2217C1000, v0, v3, "... alarm (%@) delete failed (%@)", v4);
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_211_cold_1(uint64_t a1, id *a2)
{
  os_log_t v2 = [*a2 alarmID];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding delete of %@ to the mesh", v5, v6, v7, v8, 2u);
}

void __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v0, (uint64_t)v0, "%p forwarding snooze of %@ to the mesh", v1);
}

void __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "... alarm (%@) snooze failed (%@)");
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  os_log_t v2 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) alarmID];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p forwarding dismiss of %@ to the mesh", v5, v6, v7, v8, 2u);
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_213_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "... alarm (%@) dismiss failed (%@)");
}

- (void)handleAlarmsAddedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p added alarms without a list of alarms", v2, v3, v4, v5, v6);
}

- (void)handleAlarmsRemovedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p removed alarms without a list of alarms", v2, v3, v4, v5, v6);
}

- (void)handleAlarmFiringAlarmDismissedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p dismissed alarms without a list of alarms", v2, v3, v4, v5, v6);
}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "... local snooze of alarm (%@) failed (%@)");
}

- (void)handleAlarmManagerStateResetNotification:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 meshController];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%p forwarding alarm manager reset", v4, v5, v6, v7, v8);
}

- (void)alarmsAsAccessory:(void *)a1 fromClient:withCallback:.cold.1(void *a1)
{
  os_log_t v1 = [a1 meshController];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%p serving request to get alarms for %{public}@", v4, v5, v6, v7, v8);
}

- (void)alarmsForAccessories:(uint64_t)a1 fromClient:(void *)a2 callback:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 134218498;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  __int16 v9 = 2112;
  id v10 = a2;
  _os_log_debug_impl(&dword_2217C1000, a3, OS_LOG_TYPE_DEBUG, "%p serving request to get alarms for %ld:%@", (uint8_t *)&v5, 0x20u);
}

- (void)addAlarm:(NSObject *)a3 asAccessory:fromClient:withCallback:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a1 meshController];
  uint64_t v6 = [a2 alarmID];
  int v8 = 134218242;
  __int16 v9 = v5;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, a3, v7, "%p serving request to add alarm %@", (uint8_t *)&v8);
}

- (void)updateAlarm:(NSObject *)a3 asAccessory:fromClient:withCallback:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a1 meshController];
  uint64_t v6 = [a2 alarmID];
  int v8 = 134218242;
  __int16 v9 = v5;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, a3, v7, "%p serving request to update alarm %@", (uint8_t *)&v8);
}

- (void)removeAlarm:(NSObject *)a3 asAccessory:fromClient:withCallback:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a1 meshController];
  uint64_t v6 = [a2 alarmID];
  int v8 = 134218242;
  __int16 v9 = v5;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, a3, v7, "%p serving request to delete alarm %@", (uint8_t *)&v8);
}

- (void)snoozeAlarmWithIdentifier:(uint64_t)a1 fromClient:withCallback:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v1, (uint64_t)v1, "%p serving request to snooze alarm %@", (uint8_t *)&v2);
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_12_1(&dword_2217C1000, v0, v1, "%p failed to snooze alarm %@ (%@)");
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_239_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v0, v1, "%p snoozed alarm %@", v2);
}

- (void)dismissAlarmWithIdentifier:(uint64_t)a1 fromClient:withCallback:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v1, (uint64_t)v1, "%p serving request to dismiss alarm %@", (uint8_t *)&v2);
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_2(&dword_2217C1000, v0, v1, "%p trying locally to dismiss alarm %@", v2);
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_243_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_12_1(&dword_2217C1000, v0, v1, "%p failed to dismiss alarm %@ (%@)");
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_244_cold_1()
{
  OUTLINED_FUNCTION_23(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v0, (uint64_t)v0, "%p locally dismissed alarm %@", v1);
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  int v2 = [a2 alarmID];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v3, v4, "%p sending dismiss of %@ to the mesh", v5, v6, v7, v8, 2u);
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_245_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_2(&dword_2217C1000, v0, v1, "%p dismissed alarm %@", v2);
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_23(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p looking for HomePod...", v2, v3, v4, v5, v6);
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_23(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p is HomePod.", v2, v3, v4, v5, v6);
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_23(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_2217C1000, v0, v1, "%p looking for non-ephemeral node...", v2, v3, v4, v5, v6);
}

void __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "%p cannot set interests, IDS identifier missing", v2, v3, v4, v5, v6);
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_268_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(v2 + 40);
  uint64_t v4 = [*(id *)(v2 + 32) alarmID];
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  __int16 v8 = 2112;
  __int16 v9 = v4;
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "(%u) Reaped failed (%@) for alarm: %@", (uint8_t *)v5, 0x1Cu);
}

@end