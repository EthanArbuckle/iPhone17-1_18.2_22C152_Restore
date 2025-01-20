@interface ATXAppIntentMonitor
- (ATXAppIntentMonitor)initWithAppLaunchHistogramManager:(id)a3 appInfoManager:(id)a4 appActionLaunchSequenceManager:(id)a5 dataStore:(id)a6;
- (ATXAppIntentMonitor)initWithAppLaunchHistogramManager:(id)a3 appInfoManager:(id)a4 appActionLaunchSequenceManager:(id)a5 duetHelper:(id)a6 intentStream:(id)a7 activityStream:(id)a8 dataStore:(id)a9 predictionContextBuilder:(id)a10 userDefaults:(id)a11 safariIntentFilter:(id)a12;
- (BOOL)_isAllowedDaemonDonationBundleId:(id)a3;
- (BOOL)sessionStartedBeforeDonationForStartDate:(id)a3 latestDonationDate:(id)a4;
- (BOOL)shouldAcceptMessageDonation:(id)a3;
- (BOOL)shouldProcessIntentDonationsForSessionStartDate:(id)a3;
- (BOOL)shouldProcessNSUADonationsForSessionStartDate:(id)a3;
- (id)_appActionLaunchSequenceManager;
- (id)adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:(id)a3;
- (id)adjustedEndDateForTombstoneStreamQuery:(id)a3;
- (id)adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:(id)a3;
- (id)adjustedStartDateForTombstoneStreamQuery:(id)a3;
- (id)deletionHighWaterMarkForDefaultsKey:(id)a3 currentDate:(id)a4;
- (id)fetchIntentEventsForAppSessionWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)fetchNSUAEventsForAppSessionWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)_displayDonationOnLockscreenWithAction:(id)a3;
- (void)_handleCompletedIntentForForSourceItemID:(id)a3 atxIntentSource:(int64_t)a4;
- (void)_handleDonationImmediatelyForBundleId:(id)a3 sourceItemID:(id)a4 completedSuccessfully:(BOOL)a5 isDonatedBySiri:(BOOL)a6 isAllowedDaemonDonationBundleId:(BOOL)a7;
- (void)_listenToActivityStream;
- (void)_listenToIntentStream;
- (void)_listenToLinkActionStream;
- (void)_logIntentPredictionsForIntentEvent:(id)a3 context:(id)a4;
- (void)_respondToIntentStreamChangingWithIntent:(id)a3;
- (void)_respondToLinkActionStreamChangingWithInvocation:(id)a3;
- (void)_syncForTests;
- (void)_updateActionPredictionHistogramsForIntentEvent:(id)a3 weight:(float)a4 context:(id)a5;
- (void)_updateActionPredictionHistogramsRemovingActionUUIDs:(id)a3;
- (void)coalescedHandleIntentOrActivityDeletion;
- (void)dealloc;
- (void)handleAppRegistrationForBundleIds:(id)a3;
- (void)handleIntentOrActivityDeletion;
- (void)processIntentDonationsDuringAppSessionForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 globals:(id)a6;
- (void)processNSUADonationsDuringAppSessionForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 globals:(id)a6;
- (void)removeDonationFromLockscreenForAction:(id)a3;
- (void)setDeletionHighWaterMark:(id)a3 defaultsKey:(id)a4;
- (void)start;
- (void)stop;
- (void)updateActionPredictionPipelineForAppSession:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)updateActionPredictionPipelineForIntentEvent:(id)a3 weight:(float)a4 appSessionStartDate:(id)a5 appSessionEndDate:(id)a6;
- (void)updateActionPredictionPipelineForIntentEvent:(id)a3 weight:(float)a4 appSessionStartDate:(id)a5 appSessionEndDate:(id)a6 context:(id)a7;
- (void)updateActionPredictionSlotResolutionForIntentEvent:(id)a3 weight:(float)a4 prevLocationUUID:(id)a5 locationUUID:(id)a6 currentMotionType:(int64_t)a7 appSessionStartDate:(id)a8 appSessionEndDate:(id)a9 geohash:(int64_t)a10 coarseGeohash:(int64_t)a11;
@end

@implementation ATXAppIntentMonitor

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v3 eventBody];
    if (v5)
    {
      v6 = (void *)os_transaction_create();
      v7 = __atxlog_handle_default();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [v5 bundleID];
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = 0x4014000000000000;
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Donation Processing - Intent received for %@. Waiting %.02f seconds before responding.", buf, 0x16u);
      }
      v9 = (void *)MEMORY[0x1E4F93B18];
      uint64_t v10 = WeakRetained[11];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_93;
      v12[3] = &unk_1E68AC320;
      v12[4] = WeakRetained;
      id v13 = v5;
      id v14 = v6;
      v11 = v6;
      [v9 runAsyncOnQueue:v10 afterDelaySeconds:v12 block:5.0];
    }
    else
    {
      v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_90_cold_1();
      }
    }
  }
}

- (ATXAppIntentMonitor)initWithAppLaunchHistogramManager:(id)a3 appInfoManager:(id)a4 appActionLaunchSequenceManager:(id)a5 dataStore:(id)a6
{
  id v9 = a6;
  id v21 = a5;
  id v10 = a4;
  id v11 = a3;
  v20 = objc_opt_new();
  v12 = objc_opt_new();
  id v13 = objc_opt_new();
  id v14 = +[ATXPredictionContextBuilder sharedInstance];
  id v15 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v16 = (void *)[v15 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  __int16 v17 = objc_opt_new();
  uint64_t v18 = [(ATXAppIntentMonitor *)self initWithAppLaunchHistogramManager:v11 appInfoManager:v10 appActionLaunchSequenceManager:v21 duetHelper:v20 intentStream:v12 activityStream:v13 dataStore:v9 predictionContextBuilder:v14 userDefaults:v16 safariIntentFilter:v17];

  return v18;
}

- (ATXAppIntentMonitor)initWithAppLaunchHistogramManager:(id)a3 appInfoManager:(id)a4 appActionLaunchSequenceManager:(id)a5 duetHelper:(id)a6 intentStream:(id)a7 activityStream:(id)a8 dataStore:(id)a9 predictionContextBuilder:(id)a10 userDefaults:(id)a11 safariIntentFilter:(id)a12
{
  v74[2] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v53 = a4;
  id v54 = a5;
  id v55 = a6;
  id v56 = a7;
  id v57 = a8;
  id v58 = a9;
  id v59 = a10;
  id v60 = a11;
  id v61 = a12;
  v72.receiver = self;
  v72.super_class = (Class)ATXAppIntentMonitor;
  uint64_t v18 = [(ATXAppIntentMonitor *)&v72 init];
  if (v18)
  {
    uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppIntentHistory", v19);
    appIntentHistoryQueue = v18->_appIntentHistoryQueue;
    v18->_appIntentHistoryQueue = (OS_dispatch_queue *)v20;

    if (!v62)
    {
      v22 = __atxlog_handle_default();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[ATXAppIntentMonitor initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:duetHelper:intentStream:activityStream:dataStore:predictionContextBuilder:userDefaults:safariIntentFilter:]();
      }
    }
    objc_storeStrong((id *)&v18->_appLaunchHistogramManager, a3);
    objc_storeStrong((id *)&v18->_dataStore, a9);
    objc_storeStrong((id *)&v18->_duetHelper, a6);
    objc_storeStrong((id *)&v18->_intentStream, a7);
    objc_storeStrong((id *)&v18->_activityStream, a8);
    objc_storeStrong((id *)&v18->_appInfoManager, a4);
    objc_storeStrong((id *)&v18->_appActionLaunchSequenceManager, a5);
    objc_storeStrong((id *)&v18->_predictionContextBuilder, a10);
    objc_storeStrong((id *)&v18->_userDefaults, a11);
    objc_initWeak(&location, v18);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke;
    aBlock[3] = &unk_1E68AB9B0;
    objc_copyWeak(&v70, &location);
    id obja = _Block_copy(aBlock);
    uint64_t v23 = objc_opt_new();
    appRegistrationListener = v18->_appRegistrationListener;
    v18->_appRegistrationListener = (ATXInternalAppRegistrationNotification *)v23;

    [(ATXInternalAppRegistrationNotification *)v18->_appRegistrationListener registerForNotificationsWithRegisterBlock:obja];
    objc_storeStrong((id *)&v18->_safariIntentQualityFilter, a12);
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v50 = dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_BACKGROUND, -1);

    dispatch_queue_t v26 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.IntentDonations", v50);
    donationQueue = v18->_donationQueue;
    v18->_donationQueue = (OS_dispatch_queue *)v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, -1);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppIntentDonations", v29);
    donationQueueLinkActions = v18->_donationQueueLinkActions;
    v18->_donationQueueLinkActions = (OS_dispatch_queue *)v30;

    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_2;
    v67[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v68, &location);
    id v49 = _Block_copy(v67);
    v18->deletionHandlerToken = [(_ATXDuetHelper *)v18->_duetHelper registerDeletionHandler:v49 queue:v18->_appIntentHistoryQueue];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_3;
    v65[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v66, &location);
    v32 = _Block_copy(v65);
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F93B98]) initWithQueue:v18->_appIntentHistoryQueue leewaySeconds:v32 operation:5.0];
    coalescedIntentOrActivityDeletion = v18->_coalescedIntentOrActivityDeletion;
    v18->_coalescedIntentOrActivityDeletion = (_PASSimpleCoalescingTimer *)v33;

    v35 = [MEMORY[0x1E4F93720] propertyWithName:@"category" possibleValues:&unk_1F27F2C70];
    v36 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ab"];
    v37 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"bundleId"];
    v38 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"activityType"];
    id v39 = objc_alloc(MEMORY[0x1E4F93738]);
    v74[0] = v35;
    v74[1] = v36;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
    uint64_t v41 = [v39 initWithFeatureId:@"ActionPredictions" event:@"action_donated" registerProperties:v40];
    donatedActionsTracker = v18->_donatedActionsTracker;
    v18->_donatedActionsTracker = (PETScalarEventTracker *)v41;

    id v43 = objc_alloc(MEMORY[0x1E4F93718]);
    v73[0] = v37;
    v73[1] = v38;
    v73[2] = v36;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    uint64_t v45 = [v43 initWithFeatureId:@"ActionPredictions" event:@"donation_in_cache" registerProperties:v44];
    donatedActionInCacheTracker = v18->_donatedActionInCacheTracker;
    v18->_donatedActionInCacheTracker = (PETDistributionEventTracker *)v45;

    v47 = v18->_appIntentHistoryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_4;
    block[3] = &unk_1E68AB818;
    v64 = v18;
    dispatch_async(v47, block);

    objc_destroyWeak(&v66);
    objc_destroyWeak(&v68);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleAppRegistrationForBundleIds:v3];
}

void __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained coalescedHandleIntentOrActivityDeletion];
}

void __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleIntentOrActivityDeletion];
}

uint64_t __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleIntentOrActivityDeletion];
}

- (void)dealloc
{
  [(ATXAppIntentMonitor *)self stop];
  if (self->deletionHandlerToken) {
    -[_ATXDuetHelper deregisterDeletionHandlerWithToken:](self->_duetHelper, "deregisterDeletionHandlerWithToken:");
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXAppIntentMonitor;
  [(ATXAppIntentMonitor *)&v3 dealloc];
}

- (void)handleAppRegistrationForBundleIds:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(_ATXDataStore *)self->_dataStore regenerateSlotSetKeyForBundleId:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_listenToActivityStream
{
  objc_super v3 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"ATXAppIntentMonitor.NSUA" targetQueue:self->_donationQueue];
  nsuaScheduler = self->_nsuaScheduler;
  self->_nsuaScheduler = v3;

  BiomeLibrary();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v11 App];
  uint64_t v6 = [v5 Activity];
  uint64_t v7 = objc_msgSend(v6, "atx_DSLPublisher");
  uint64_t v8 = [v7 subscribeOn:self->_nsuaScheduler];
  long long v9 = [v8 sinkWithCompletion:&__block_literal_global_98 receiveInput:&__block_literal_global_84_0];
  nsuaSink = self->_nsuaSink;
  self->_nsuaSink = v9;
}

void __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke_cold_1(v2);
    }
  }
}

void __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke_81()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Donation Processing - NSUA Received. No further processing until the end of the current app session.", v1, 2u);
  }
}

- (void)_listenToIntentStream
{
  objc_initWeak(&location, self);
  objc_super v3 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"ATXAppIntentMonitor.Intent" targetQueue:self->_donationQueue];
  intentScheduler = self->_intentScheduler;
  self->_intentScheduler = v3;

  uint64_t v5 = BiomeLibrary();
  uint64_t v6 = [v5 App];
  uint64_t v7 = [v6 Intent];
  uint64_t v8 = objc_msgSend(v7, "atx_DSLPublisher");
  long long v9 = [v8 subscribeOn:self->_intentScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_90;
  v12[3] = &unk_1E68AE228;
  objc_copyWeak(&v13, &location);
  long long v10 = [v9 sinkWithCompletion:&__block_literal_global_89_1 receiveInput:v12];
  intentSink = self->_intentSink;
  self->_intentSink = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_cold_1(v2);
    }
  }
}

id __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_93(uint64_t a1)
{
  return self;
}

- (void)_listenToLinkActionStream
{
  objc_initWeak(&location, self);
  objc_super v3 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"ATXAppIntentMonitor.Link" targetQueue:self->_donationQueueLinkActions];
  linkActionScheduler = self->_linkActionScheduler;
  self->_linkActionScheduler = v3;

  uint64_t v5 = BiomeLibrary();
  uint64_t v6 = [v5 App];
  uint64_t v7 = [v6 Intents];
  uint64_t v8 = [v7 Transcript];
  long long v9 = objc_msgSend(v8, "atx_DSLPublisher");
  long long v10 = [v9 subscribeOn:self->_linkActionScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_99;
  v13[3] = &unk_1E68AE228;
  objc_copyWeak(&v14, &location);
  id v11 = [v10 sinkWithCompletion:&__block_literal_global_98_0 receiveInput:v13];
  linkActionSink = self->_linkActionSink;
  self->_linkActionSink = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_cold_1(v2);
    }
  }
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 eventBody];
    uint64_t v6 = [v5 executionUUID];

    if (v6)
    {
      uint64_t v7 = [v5 predictions];
      uint64_t v8 = [v7 count];

      if (!v8)
      {
LABEL_17:

        goto LABEL_18;
      }
      long long v9 = (void *)os_transaction_create();
      long long v10 = (void *)MEMORY[0x1E4F4B2B8];
      uint64_t v11 = [v5 bundleID];
      long long v12 = (void *)v11;
      if (v11) {
        id v13 = (__CFString *)v11;
      }
      else {
        id v13 = &stru_1F2740B58;
      }
      id v14 = [v5 action];
      id v15 = [v14 identifier];
      int v16 = [v10 isActionEligibleForSettingsSuggestionsWithBundleIdentifier:v13 actionIdentifier:v15];

      if (v16)
      {
        __int16 v17 = __atxlog_handle_settings_actions();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Posting distributed notification about settings action recents refresh", buf, 2u);
        }

        uint64_t v18 = [MEMORY[0x1E4F28C40] defaultCenter];
        [v18 postNotificationName:*MEMORY[0x1E4F4ADD8] object:0];
      }
      uint64_t v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v20 = [v5 bundleID];
        *(_DWORD *)buf = 138412546;
        v28 = v20;
        __int16 v29 = 2048;
        uint64_t v30 = 0x4014000000000000;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "Donation Processing - Link action received for %@. Waiting %.02f seconds before responding.", buf, 0x16u);
      }
      id v21 = (void *)MEMORY[0x1E4F93B18];
      uint64_t v22 = WeakRetained[11];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_106;
      v24[3] = &unk_1E68AC320;
      v24[4] = WeakRetained;
      id v25 = v5;
      id v26 = v9;
      uint64_t v23 = v9;
      [v21 runAsyncOnQueue:v22 afterDelaySeconds:v24 block:5.0];
    }
    else
    {
      uint64_t v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_99_cold_1();
      }
    }

    goto LABEL_17;
  }
LABEL_18:
}

id __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_106(uint64_t a1)
{
  return self;
}

- (void)_handleDonationImmediatelyForBundleId:(id)a3 sourceItemID:(id)a4 completedSuccessfully:(BOOL)a5 isDonatedBySiri:(BOOL)a6 isAllowedDaemonDonationBundleId:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a4;
  if (v9 && v8 || v7)
  {
    long long v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Donation Processing - Received either a completed Siri intent, or a donation from an allowed daemon donation.", v13, 2u);
    }

    if (v11) {
      [(ATXAppIntentMonitor *)self _handleCompletedIntentForForSourceItemID:v11 atxIntentSource:!v8];
    }
  }
}

- (void)_respondToIntentStreamChangingWithIntent:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 bundleID];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = &stru_1F2740B58;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  BOOL v7 = v6;

  uint64_t v8 = [v12 donatedBySiri];
  BOOL v9 = [(ATXAppIntentMonitor *)self _isAllowedDaemonDonationBundleId:v7];
  BOOL v10 = v9;
  if ((v8 & 1) != 0 || v9)
  {
    id v11 = [v12 itemID];
    -[ATXAppIntentMonitor _handleDonationImmediatelyForBundleId:sourceItemID:completedSuccessfully:isDonatedBySiri:isAllowedDaemonDonationBundleId:](self, "_handleDonationImmediatelyForBundleId:sourceItemID:completedSuccessfully:isDonatedBySiri:isAllowedDaemonDonationBundleId:", v7, v11, [v12 handlingStatus] == 4, v8, v10);
  }
}

- (void)_respondToLinkActionStreamChangingWithInvocation:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 bundleID];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = &stru_1F2740B58;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  BOOL v7 = v6;

  int v8 = [v13 source];
  BOOL v9 = [(ATXAppIntentMonitor *)self _isAllowedDaemonDonationBundleId:v7];
  BOOL v10 = v9;
  if (v8 == 3 || v9)
  {
    id v11 = [v13 executionUUID];
    id v12 = [v11 UUIDString];
    [(ATXAppIntentMonitor *)self _handleDonationImmediatelyForBundleId:v7 sourceItemID:v12 completedSuccessfully:1 isDonatedBySiri:v8 == 3 isAllowedDaemonDonationBundleId:v10];
  }
}

- (void)_handleCompletedIntentForForSourceItemID:(id)a3 atxIntentSource:(int64_t)a4
{
  uint64_t v5 = [(ATXIntentStream *)self->_intentStream getIntentEventForSourceItemID:a3 forSource:a4];
  uint64_t v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1.0;
    uint64_t v8 = v5;
    uint64_t v5 = [(ATXAppIntentMonitor *)self updateActionPredictionPipelineForIntentEvent:v5 weight:0 appSessionStartDate:0 appSessionEndDate:v6];
    uint64_t v7 = v8;
  }
  MEMORY[0x1F41817F8](v5, v7);
}

- (BOOL)_isAllowedDaemonDonationBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_ATXGlobals sharedInstance];
  uint64_t v5 = [v4 whitelistedDonationDaemonBundleIds];
  char v6 = [v5 containsObject:v3];

  return v6;
}

- (void)_displayDonationOnLockscreenWithAction:(id)a3
{
  id v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F4B688];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"displayDonationsOnLockscreen", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat);
  Boolean v12 = 0;
  int v6 = CFPreferencesGetAppBooleanValue(@"displayLastDonationOnCoverSheet", v4, &v12);
  if (AppBooleanValue) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = +[ATXActionNotificationServer sharedInstance];
    [v8 removeAllActionPredictionNotificationsAndTrackEvent:1 recordFeedback:0];
    [v8 postDemoOrDebugNotificationForATXAction:v3];
    BOOL v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Posting notification for DEVELOPER switch", v10, 2u);
    }
  }
}

- (void)removeDonationFromLockscreenForAction:(id)a3
{
  id v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F4B688];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"displayDonationsOnLockscreen", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat);
  Boolean v8 = 0;
  if (!(AppBooleanValue | CFPreferencesGetAppBooleanValue(@"displayLastDonationOnCoverSheet", v4, &v8)))
  {
    int v6 = +[ATXActionNotificationServer sharedInstance];
    [v6 removeActionPredictionNotificationsMatchingAction:v3];
  }
}

- (id)adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:-2.0];
}

- (id)adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:2.0];
}

- (id)fetchIntentEventsForAppSessionWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  Boolean v8 = (__CFString *)a3;
  id v9 = a5;
  BOOL v10 = [(ATXAppIntentMonitor *)self adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:a4];
  id v11 = [(ATXAppIntentMonitor *)self adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:v9];

  Boolean v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppIntentMonitor fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:]();
  }

  id v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppIntentMonitor fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:]();
  }

  if (([(__CFString *)v8 isEqualToString:@"com.apple.mobilephone"] & 1) != 0
    || [(__CFString *)v8 isEqualToString:@"com.apple.facetime"])
  {
    intentStream = self->_intentStream;
    id v15 = @"com.apple.InCallService";
    int v16 = v10;
    __int16 v17 = v11;
  }
  else
  {
    intentStream = self->_intentStream;
    int v16 = v10;
    __int16 v17 = v11;
    id v15 = v8;
  }
  uint64_t v18 = [(ATXIntentStream *)intentStream getIntentEventsBetweenStartDate:v16 endDate:v17 forSource:1 bundleIdFilter:v15 allowMissingTitles:0];

  return v18;
}

- (BOOL)sessionStartedBeforeDonationForStartDate:(id)a3 latestDonationDate:(id)a4
{
  return objc_msgSend(a3, "atx_isBeforeDate:", a4);
}

- (BOOL)shouldProcessIntentDonationsForSessionStartDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BiomeLibrary();
  int v6 = [v5 App];
  BOOL v7 = [v6 Intent];
  Boolean v8 = objc_msgSend(v7, "atx_dateOfLastEvent");

  id v9 = BiomeLibrary();
  BOOL v10 = [v9 App];
  id v11 = [v10 Intents];
  Boolean v12 = [v11 Transcript];
  id v13 = objc_msgSend(v12, "atx_dateOfLastEvent");

  id v14 = ATXMaxDate(v8, v13);
  if (v14)
  {
    id v15 = [(ATXAppIntentMonitor *)self adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:v4];
    BOOL v16 = [(ATXAppIntentMonitor *)self sessionStartedBeforeDonationForStartDate:v15 latestDonationDate:v14];
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)shouldProcessNSUADonationsForSessionStartDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BiomeLibrary();
  int v6 = [v5 App];
  BOOL v7 = [v6 Activity];
  Boolean v8 = objc_msgSend(v7, "atx_dateOfLastEvent");

  if (v8)
  {
    id v9 = [(ATXAppIntentMonitor *)self adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:v4];
    BOOL v10 = [(ATXAppIntentMonitor *)self sessionStartedBeforeDonationForStartDate:v9 latestDonationDate:v8];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)processIntentDonationsDuringAppSessionForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 globals:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v51 = a6;
  if ([(ATXAppIntentMonitor *)self shouldProcessIntentDonationsForSessionStartDate:v11])
  {
    id v13 = [(ATXAppIntentMonitor *)self fetchIntentEventsForAppSessionWithBundleId:v10 startDate:v11 endDate:v12];
    uint64_t v14 = [v13 count];
    id v15 = __atxlog_handle_default();
    BOOL v16 = v15;
    if (v14)
    {
      v47 = self;
      id v48 = v12;
      id v49 = v11;
      id v50 = v10;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:](v13);
      }

      uint64_t v17 = [v13 count];
      BOOL v16 = objc_opt_new();
      uint64_t v54 = v17;
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v46 = v13;
      obuint64_t j = v13;
      uint64_t v19 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v57 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = [*(id *)(*((void *)&v56 + 1) + 8 * i) intent];
            v24 = v23;
            if (v23)
            {
              id v25 = objc_msgSend(v23, "atx_hashApproximately");
              id v26 = [v25 base64EncodedStringWithOptions:0];
            }
            else
            {
              id v26 = &stru_1F2740B58;
            }
            [v18 addObject:v26];
            v27 = NSNumber;
            v28 = [v16 objectForKeyedSubscript:v26];
            __int16 v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") + 1);
            [v16 setObject:v29 forKeyedSubscript:v26];
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v20);
      }

      uint64_t v30 = __atxlog_handle_default();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:]();
      }

      id v12 = v48;
      id v11 = v49;
      if (v54)
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          v32 = (void *)MEMORY[0x1D25F6CC0]();
          uint64_t v33 = [obj objectAtIndexedSubscript:j];
          if (v33)
          {
            id v53 = v32;
            v34 = __atxlog_handle_default();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              v44 = [v33 intentType];
              uint64_t v45 = [v33 startDate];
              *(_DWORD *)buf = 138412546;
              id v61 = v44;
              __int16 v62 = 2112;
              v63 = v45;
              _os_log_debug_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEBUG, "Donation Processing - Intent Event: %@ at Date:%@", buf, 0x16u);
            }
            uint64_t v52 = (int)[v51 donationWeighingScheme];
            [v51 donationWeighingStrength];
            double v36 = v35;
            v37 = [v18 objectAtIndexedSubscript:j];
            v38 = [v16 objectForKeyedSubscript:v37];
            uint64_t v39 = [v38 unsignedIntegerValue];
            duetHelper = v47->_duetHelper;
            uint64_t v41 = [v18 objectAtIndexedSubscript:j];
            +[_ATXActionUtils calculateWeightWith:v52 strength:v39 termFreq:[(_ATXDuetHelper *)duetHelper getDocFreqFor:v50 contentKey:v41] docFreq:v54 docLength:v36];
            *(float *)&double v36 = v42;

            LODWORD(v43) = LODWORD(v36);
            id v12 = v48;
            id v11 = v49;
            [(ATXAppIntentMonitor *)v47 updateActionPredictionPipelineForIntentEvent:v33 weight:v49 appSessionStartDate:v48 appSessionEndDate:v43];
            v32 = v53;
          }
        }
      }

      id v13 = v46;
      id v10 = v50;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "Donation Processing - Didn't find any Intent events for query.", buf, 2u);
    }
  }
  else
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v10;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_INFO, "Donation Processing - == Don't need to process intent donations for %@ since no intents were received recently. ==", buf, 0xCu);
    }
  }
}

- (id)fetchNSUAEventsForAppSessionWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ATXAppIntentMonitor *)self adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:a4];
  id v11 = [(ATXAppIntentMonitor *)self adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:v8];

  id v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppIntentMonitor fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:]();
  }

  id v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppIntentMonitor fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:]();
  }

  uint64_t v14 = [(ATXUserActivityStream *)self->_activityStream getActivityIntentEventsBetweenStartDate:v10 endDate:v11 bundleIdFilter:v9];

  return v14;
}

- (void)processNSUADonationsDuringAppSessionForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 globals:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v53 = a6;
  if ([(ATXAppIntentMonitor *)self shouldProcessNSUADonationsForSessionStartDate:v11])
  {
    id v13 = [(ATXAppIntentMonitor *)self fetchNSUAEventsForAppSessionWithBundleId:v10 startDate:v11 endDate:v12];
    uint64_t v14 = [v13 count];
    id v15 = __atxlog_handle_default();
    BOOL v16 = v15;
    if (v14)
    {
      id v51 = self;
      id v52 = v10;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppIntentMonitor processNSUADonationsDuringAppSessionForBundleId:startDate:endDate:globals:](v13);
      }

      uint64_t v50 = [v13 count];
      long long v56 = objc_opt_new();
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v47 = v13;
      uint64_t v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v62 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [*(id *)(*((void *)&v61 + 1) + 8 * i) action];
            uint64_t v23 = [v22 userActivityString];

            if (v23)
            {
              v24 = NSNumber;
              id v25 = [v56 objectForKeyedSubscript:v23];
              id v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + 1);
              [v56 setObject:v26 forKeyedSubscript:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v61 objects:v70 count:16];
        }
        while (v19);
      }

      v27 = __atxlog_handle_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:]();
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      obuint64_t j = v17;
      uint64_t v55 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v55)
      {
        uint64_t v54 = *(void *)v58;
        id v49 = v12;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v58 != v54) {
              objc_enumerationMutation(obj);
            }
            __int16 v29 = *(void **)(*((void *)&v57 + 1) + 8 * v28);
            if (v29)
            {
              id v30 = v11;
              uint64_t v31 = [*(id *)(*((void *)&v57 + 1) + 8 * v28) action];
              uint64_t v32 = [v31 userActivityString];
              uint64_t v33 = (void *)v32;
              v34 = &stru_1F2740B58;
              if (v32) {
                v34 = (__CFString *)v32;
              }
              double v35 = v34;

              double v36 = __atxlog_handle_default();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v45 = [v29 intentType];
                v46 = [v29 startDate];
                *(_DWORD *)buf = 138412546;
                id v66 = v45;
                __int16 v67 = 2112;
                id v68 = v46;
                _os_log_debug_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEBUG, "Donation Processing - NSUA Event: %@ at Date: %@", buf, 0x16u);
              }
              uint64_t v37 = (int)[v53 donationWeighingScheme];
              [v53 donationWeighingStrength];
              double v39 = v38;
              v40 = [v56 objectForKeyedSubscript:v35];
              +[_ATXActionUtils calculateWeightWith:strength:termFreq:docFreq:docLength:](_ATXActionUtils, "calculateWeightWith:strength:termFreq:docFreq:docLength:", v37, [v40 unsignedIntegerValue], -[_ATXDuetHelper getDocFreqFor:contentKey:](v51->_duetHelper, "getDocFreqFor:contentKey:", v52, v35), v50, v39);
              *(float *)&double v39 = v41;

              [v53 nsuaDonationWeight];
              double v43 = v42 * *(float *)&v39;
              *(float *)&double v43 = v43;
              id v11 = v30;
              id v44 = v30;
              id v12 = v49;
              [(ATXAppIntentMonitor *)v51 updateActionPredictionPipelineForIntentEvent:v29 weight:v44 appSessionStartDate:v49 appSessionEndDate:v43];
            }
            ++v28;
          }
          while (v55 != v28);
          uint64_t v55 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v55);
      }

      id v10 = v52;
      id v13 = v47;
      BOOL v16 = v56;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "Donation Processing - Didn't find any NSUA events for query.", buf, 2u);
    }
  }
  else
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v10;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_INFO, "Donation Processing - == Don't need to process NSUA donations for %@ since no NSUAs were received recently. == ", buf, 0xCu);
    }
  }
}

- (void)updateActionPredictionPipelineForAppSession:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  id v12 = +[_ATXGlobals sharedInstance];
  BOOL v13 = [(ATXAppIntentMonitor *)self _isAllowedDaemonDonationBundleId:v8];
  uint64_t v14 = __atxlog_handle_default();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Donation Processing - Skipping back-query for %@ app session because it was an allowed app.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "Donation Processing - %@ is not an allowed bundle. Continuing with processing steps...", (uint8_t *)&v16, 0xCu);
    }

    [(ATXAppIntentMonitor *)self processIntentDonationsDuringAppSessionForBundleId:v8 startDate:v9 endDate:v10 globals:v12];
    [(ATXAppIntentMonitor *)self processNSUADonationsDuringAppSessionForBundleId:v8 startDate:v9 endDate:v10 globals:v12];
  }
}

- (BOOL)shouldAcceptMessageDonation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 intentType];
  int v6 = [v5 isEqualToString:@"INSendMessageIntent"];

  if (v6)
  {
    BOOL v7 = [v4 action];

    if (!v7) {
      goto LABEL_15;
    }
    id v8 = [v4 action];
    id v9 = [v8 intent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = +[_ATXActionUtils recipientFromMessageIntent:v9];
      BOOL v11 = v10 != 0;
      if (!v10)
      {
        id v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[ATXAppIntentMonitor shouldAcceptMessageDonation:]();
        }
        goto LABEL_11;
      }
      id v12 = [(_ATXDataStore *)self->_dataStore lastMessageToRecipient:v10];
      BOOL v13 = [v4 startDate];
      BOOL v14 = +[_ATXActionUtils shouldPredictRecipient:v10 withDate:v13 andRecipientDate:v12];

      if (v14)
      {
        dataStore = self->_dataStore;
        int v16 = [v4 startDate];
        [(_ATXDataStore *)dataStore updateOrInsertMessageRecipient:v10 dateMessaged:v16];

LABEL_11:
        goto LABEL_16;
      }
      id v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppIntentMonitor shouldAcceptMessageDonation:]();
      }

LABEL_15:
      BOOL v11 = 0;
      goto LABEL_16;
    }
  }
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (void)updateActionPredictionPipelineForIntentEvent:(id)a3 weight:(float)a4 appSessionStartDate:(id)a5 appSessionEndDate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = [(ATXPredictionContextBuilderProtocol *)self->_predictionContextBuilder predictionContextForCurrentContext];
  if (v13)
  {
    *(float *)&double v14 = a4;
    [(ATXAppIntentMonitor *)self updateActionPredictionPipelineForIntentEvent:v10 weight:v11 appSessionStartDate:v12 appSessionEndDate:v13 context:v14];
  }
  else
  {
    id v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:]();
    }
  }
}

- (void)updateActionPredictionPipelineForIntentEvent:(id)a3 weight:(float)a4 appSessionStartDate:(id)a5 appSessionEndDate:(id)a6 context:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [v12 action];
  if ([(ATXSafariIntentEventQualityFilter *)self->_safariIntentQualityFilter shouldAcceptSafariDonation:v12])
  {
    if (v16)
    {
      [(ATXAppIntentMonitor *)self _displayDonationOnLockscreenWithAction:v16];
      [(ATXAppIntentMonitor *)self removeDonationFromLockscreenForAction:v16];
      if (![(ATXAppIntentMonitor *)self shouldAcceptMessageDonation:v12]
        || !+[_ATXActionUtils shouldAcceptAudioOrVideoCallIntent:v16])
      {
        goto LABEL_27;
      }
    }
    else if (![(ATXAppIntentMonitor *)self shouldAcceptMessageDonation:v12])
    {
      goto LABEL_27;
    }
    uint64_t v17 = [v16 actionUUID];
    if (v17
      && (uint64_t v18 = (void *)v17,
          uint64_t v19 = self->_dataStore,
          [v16 actionUUID],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v19) = [(_ATXDataStore *)v19 alogContainsActionUUID:v20],
          v20,
          v18,
          v19))
    {
      uint64_t v21 = [v16 intent];
      if (v21)
      {
        uint64_t v22 = [v16 intent];
        uint64_t v23 = [v22 intentDescription];
      }
      else
      {
        uint64_t v49 = [v16 userActivityString];
        uint64_t v22 = (void *)v49;
        uint64_t v50 = &stru_1F2740B58;
        if (v49) {
          uint64_t v50 = (__CFString *)v49;
        }
        uint64_t v23 = v50;
      }
      id v48 = v23;

      id v51 = __atxlog_handle_default();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        id v52 = [v16 bundleId];
        id v53 = [v16 actionUUID];
        uint64_t v54 = [v53 description];
        *(_DWORD *)buf = 138412803;
        uint64_t v65 = v52;
        __int16 v66 = 2117;
        __int16 v67 = v48;
        __int16 v68 = 2112;
        v69 = v54;
        _os_log_impl(&dword_1D0FA3000, v51, OS_LOG_TYPE_DEFAULT, "Donation Processing - Tried to add duplicate entry to alog table for BundleId: %@ of Action Type: %{sensitive}@ with UUID: %@", buf, 0x20u);
      }
    }
    else
    {
      dataStore = self->_dataStore;
      id v25 = [v12 intentType];
      if ([(_ATXDataStore *)dataStore containsActionType:v25])
      {
      }
      else
      {
        v27 = self->_dataStore;
        uint64_t v28 = [v12 bundleId];
        __int16 v29 = [(_ATXDataStore *)v27 totalNumberOfActionTypesForBundleId:v28];
        int v60 = [v29 intValue];
        id v30 = +[_ATXGlobals sharedInstance];
        int v58 = [v30 maxNumberOfActionTypesPerApp];

        if (v60 >= v58)
        {
          id v48 = __atxlog_handle_default();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:context:](v12);
          }
          goto LABEL_26;
        }
      }
      *(float *)&double v26 = a4;
      [(ATXAppIntentMonitor *)self _updateActionPredictionHistogramsForIntentEvent:v12 weight:v15 context:v26];
      uint64_t v31 = [v15 locationMotionContext];
      uint64_t v32 = [v31 previousLOI];

      uint64_t v33 = [v15 locationMotionContext];
      v34 = [v33 currentLOI];

      long long v61 = v32;
      long long v56 = [v32 uuid];
      long long v59 = v34;
      double v35 = [v34 uuid];
      long long v57 = [v15 locationMotionContext];
      uint64_t v55 = [v57 motionType];
      double v36 = [v15 locationMotionContext];
      uint64_t v37 = [v36 geohash];
      double v38 = [v15 locationMotionContext];
      uint64_t v39 = [v38 coarseGeohash];
      *(float *)&double v40 = a4;
      [(ATXAppIntentMonitor *)self updateActionPredictionSlotResolutionForIntentEvent:v12 weight:v56 prevLocationUUID:v35 locationUUID:v55 currentMotionType:v13 appSessionStartDate:v14 appSessionEndDate:v40 geohash:v37 coarseGeohash:v39];

      [(ATXAppIntentMonitor *)self _logIntentPredictionsForIntentEvent:v12 context:v15];
      double v41 = +[_ATXAppPredictor sharedInstance];
      double v42 = [v41 abGroupIdentifiers];
      double v43 = [v42 objectAtIndexedSubscript:16];

      uint64_t v44 = [v16 actionType];
      donatedActionsTracker = self->_donatedActionsTracker;
      if (v44 == 1)
      {
        long long v63 = @"nsua";
        v46 = &v63;
      }
      else
      {
        long long v62 = @"intent";
        v46 = &v62;
      }
      v46[1] = v43;
      v47 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
      [(PETScalarEventTracker *)donatedActionsTracker trackEventWithPropertyValues:v47];

      id v48 = v61;
    }
LABEL_26:
  }
LABEL_27:
}

- (void)_updateActionPredictionHistogramsForIntentEvent:(id)a3 weight:(float)a4 context:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 dateInterval];
  id v11 = [v10 startDate];

  id v12 = (void *)MEMORY[0x1E4F4AE38];
  id v13 = [v8 bundleId];
  id v14 = [v8 intentType];
  id v15 = [v12 getActionKeyForBundleId:v13 actionType:v14];

  if ([v15 isEqualToString:*MEMORY[0x1E4F4AD60]])
  {
    int v16 = [v8 action];
    uint64_t v17 = [v16 userActivityString];

    if (v17)
    {
      uint64_t v18 = +[_ATXActionUtils markTodayInTitleAndUserActivityString:v8 withActionKey:v15];

      id v8 = (id)v18;
    }
  }
  uint64_t v19 = [v9 userContext];
  uint64_t v20 = [v19 lastAppActionLaunch];

  if (v20)
  {
    appActionLaunchSequenceManager = self->_appActionLaunchSequenceManager;
    uint64_t v22 = [v9 userContext];
    uint64_t v23 = [v22 lastAppActionLaunch];
    v24 = [(_ATXAppLaunchSequenceManager *)appActionLaunchSequenceManager launchSequenceForAppAction:v23];
    [v24 addSubsequentLaunch:v15];
  }
  id v25 = [v9 userContext];
  double v26 = [v25 secondMostRecentAppLaunch];

  if (v26)
  {
    v27 = NSString;
    uint64_t v28 = [v9 userContext];
    __int16 v29 = [v28 secondMostRecentAppLaunch];
    id v30 = [v27 stringWithFormat:@"%@:#AppLaunched", v29];

    uint64_t v31 = [(_ATXAppLaunchSequenceManager *)self->_appActionLaunchSequenceManager launchSequenceForAppAction:v30];
    [v31 addSubsequentLaunch:v15];
  }
  [(_ATXAppInfoManager *)self->_appInfoManager addLaunchForAppAction:v15 date:v11];
  uint64_t v32 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:14];
  *(float *)&double v33 = a4;
  [v32 addLaunchWithBundleId:v15 date:v11 timeZone:0 weight:v33];

  v34 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:16];
  double v35 = [v8 bundleId];
  *(float *)&double v36 = a4;
  [v34 addLaunchWithBundleId:v35 date:v11 timeZone:0 weight:v36];

  uint64_t v37 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:17];
  *(float *)&double v38 = a4;
  [v37 addLaunchWithBundleId:v15 date:v11 timeZone:0 weight:v38];

  uint64_t v39 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:19];
  double v40 = [v8 bundleId];
  *(float *)&double v41 = a4;
  [v39 addLaunchWithBundleId:v40 date:v11 timeZone:0 weight:v41];

  double v42 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:20];
  *(float *)&double v43 = a4;
  [v42 addLaunchWithBundleId:v15 date:v11 timeZone:0 weight:v43];

  uint64_t v44 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:22];
  uint64_t v45 = [v8 bundleId];
  *(float *)&double v46 = a4;
  [v44 addLaunchWithBundleId:v45 date:v11 timeZone:0 weight:v46];

  v47 = [v9 userContext];
  uint64_t v48 = [v47 lastUnlockDate];

  if (v48)
  {
    [v11 timeIntervalSinceDate:v48];
    if (v49 >= 0.0)
    {
      if (v49 >= 3600.0) {
        double v50 = 3599.0;
      }
      else {
        double v50 = v49;
      }
      id v51 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:23];
      *(float *)&double v52 = a4;
      [v51 addLaunchWithBundleId:v15 elapsedTime:v50 weight:v52];

      id v53 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:25];
      uint64_t v54 = [v8 bundleId];
      *(float *)&double v55 = a4;
      [v53 addLaunchWithBundleId:v54 elapsedTime:v50 weight:v55];
    }
  }
  long long v56 = [v9 deviceStateContext];
  int v57 = [v56 inAirplaneMode];

  if (v57)
  {
    int v58 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:26];
    *(float *)&double v59 = a4;
    [v58 addLaunchWithBundleId:v15 date:v11 timeZone:0 weight:v59];

    int v60 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:28];
    long long v61 = [v8 bundleId];
    *(float *)&double v62 = a4;
    [v60 addLaunchWithBundleId:v61 date:v11 timeZone:0 weight:v62];
  }
  v89 = (void *)v48;
  long long v63 = [v9 deviceStateContext];
  long long v64 = [v63 wifiSSID];

  if ([v64 length])
  {
    uint64_t v65 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:29];
    *(float *)&double v66 = a4;
    [v65 addLaunchWithBundleId:v15 date:v11 category:v64 weight:v66];

    __int16 v67 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:31];
    __int16 v68 = [v8 bundleId];
    *(float *)&double v69 = a4;
    [v67 addLaunchWithBundleId:v68 date:v11 category:v64 weight:v69];
  }
  uint64_t v70 = (void *)MEMORY[0x1E4F93608];
  uint64_t v71 = [v9 locationMotionContext];
  objc_super v72 = objc_msgSend(v70, "getMotionStringFromMotionType:", objc_msgSend(v71, "motionType"));

  v73 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:38];
  *(float *)&double v74 = a4;
  [v73 addLaunchWithBundleId:v15 date:v11 category:v72 weight:v74];

  v75 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:39];
  v76 = [v8 bundleId];
  *(float *)&double v77 = a4;
  [v75 addLaunchWithBundleId:v76 date:v11 category:v72 weight:v77];

  v78 = +[_ATXActionUtils partOfWeekStringForDate:v11];
  v79 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:40];
  *(float *)&double v80 = a4;
  [v79 addLaunchWithBundleId:v15 date:v11 category:v78 weight:v80];

  v81 = [v9 ambientLightContext];
  uint64_t v82 = [v81 ambientLightType];

  if (v82 != 7)
  {
    v83 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:41];
    v84 = [NSNumber numberWithInt:v82];
    v85 = [v84 stringValue];
    *(float *)&double v86 = a4;
    [v83 addLaunchWithBundleId:v15 date:v11 category:v85 weight:v86];
  }
  v87 = __atxlog_handle_default();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
  {
    v88 = [v8 startDate];
    *(_DWORD *)buf = 138412802;
    v91 = v15;
    __int16 v92 = 2112;
    v93 = v88;
    __int16 v94 = 2048;
    double v95 = a4;
    _os_log_debug_impl(&dword_1D0FA3000, v87, OS_LOG_TYPE_DEBUG, "Donation Processing - Finished Updating Histograms for Action Event: %@ with Date: %@ with Weight: %f", buf, 0x20u);
  }
}

- (void)updateActionPredictionSlotResolutionForIntentEvent:(id)a3 weight:(float)a4 prevLocationUUID:(id)a5 locationUUID:(id)a6 currentMotionType:(int64_t)a7 appSessionStartDate:(id)a8 appSessionEndDate:(id)a9 geohash:(int64_t)a10 coarseGeohash:(int64_t)a11
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  uint64_t v23 = [v18 action];
  if (v23)
  {
    uint64_t v24 = +[_ATXActionUtils slotSetsForAction:v23];
    dataStore = self->_dataStore;
    uint64_t v32 = (void *)v24;
    id v30 = [v18 intentType];
    [v18 bundleId];
    double v26 = v25 = v19;
    v27 = [v18 startDate];
    uint64_t v28 = [v23 actionUUID];
    [(_ATXDataStore *)dataStore writeActionType:v30 bundleId:v26 date:v27 action:v23 slotSets:v32 timeZone:0 prevLocationUUID:a4 locationUUID:v25 weight:v20 actionUUID:v28 motionType:a7 appSessionStartDate:v21 appSessionEndDate:v22 geohash:a10 coarseGeohash:a11];

    __int16 v29 = __atxlog_handle_default();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v23;
      _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "Donation Processing - Finished Updating Slot Resolution Database for Action: %@", buf, 0xCu);
    }

    id v19 = v25;
  }
}

- (void)_logIntentPredictionsForIntentEvent:(id)a3 context:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25F6CC0]();
  id v9 = objc_opt_new();
  id v10 = [v9 actionPredictionsForConsumerSubType:17 limit:0x7FFFFFFFLL];
  uint64_t v11 = [v6 action];
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "Donation Processing - No response or performedAction Found", buf, 2u);
    }
  }
  else
  {
    id v51 = self;
    double v52 = v9;
    id v53 = v8;
    id v14 = [MEMORY[0x1E4F4B2A0] sharedInstance];
    [v14 recentActions];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v55 != v18) {
            objc_enumerationMutation(v15);
          }
          if (+[_ATXActionUtils isContainmentBetweenAction:v12 other:*(void *)(*((void *)&v54 + 1) + 8 * i)])
          {
            id v30 = __atxlog_handle_default();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_INFO, "Donation Processing - Donated action corresponds to a recently engaged action. Skipping Metric Logging and Shadow Logging.", buf, 2u);
            }

            id v9 = v52;
            goto LABEL_43;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    id v49 = v7;
    id v50 = v6;

    unint64_t v20 = 0;
    while (1)
    {
      id v21 = +[_ATXGlobals sharedInstance];
      int v22 = [v21 maximumSpotlightPredictions];

      uint64_t v23 = [v10 actions];
      unint64_t v24 = [v23 count];

      unint64_t v25 = v22;
      if (v24 < v22) {
        unint64_t v25 = v24;
      }
      if (v20 >= v25) {
        break;
      }
      double v26 = [v10 actions];
      v27 = [v26 objectAtIndexedSubscript:v20];
      BOOL v28 = +[_ATXActionUtils isContainmentBetweenAction:v12 other:v27];

      ++v20;
      if (v28)
      {
        double v29 = (double)v20;
        goto LABEL_26;
      }
    }
    double v29 = 0.0;
LABEL_26:
    uint64_t v31 = [v12 _bundleIdForDisplay];
    uint64_t v32 = [v12 actionKey];
    if (v32)
    {
      double v33 = [v12 actionKey];
      v34 = +[_ATXActionUtils getActionTypeFromActionKey:v33];
    }
    else
    {
      v34 = 0;
    }

    uint64_t v35 = +[_ATXAppPredictor sharedInstance];
    double v36 = [v35 abGroupIdentifiers];
    uint64_t v37 = [v36 objectAtIndexedSubscript:16];

    if (v31 && v34 && v37)
    {
      donatedActionInCacheTracker = v51->_donatedActionInCacheTracker;
      v59[0] = v31;
      v59[1] = v34;
      v59[2] = v37;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
      [(PETDistributionEventTracker *)donatedActionInCacheTracker trackEventWithPropertyValues:v39 value:v29];
    }
    double v40 = +[_ATXGlobals sharedInstance];
    [v40 actionPredictionShadowLogSamplingRate];
    double v42 = v41;

    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      double v43 = +[_ATXGlobals sharedInstance];
      [v43 actionPredictionInternalBuildShadowLogSamplingRate];
      double v42 = v44;
    }
    id v7 = v49;
    id v6 = v50;
    id v9 = v52;
    BOOL v45 = +[_ATXAggregateLogger yesWithProbability:v42];
    double v46 = __atxlog_handle_default();
    v47 = v46;
    if (v45)
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppIntentMonitor _logIntentPredictionsForIntentEvent:context:]();
      }

      uint64_t v48 = objc_opt_new();
      [v10 updateConsumerSubType:17 engagedAction:v12 shownActions:MEMORY[0x1E4F1CBF0] feedbackStage:7 explicitlyDismissedActions:0 searchedActionType:4 engagedAppString:0 uiFeedbackDate:v48];

      +[ATXActionSessionLog performSessionLoggingWithActionResponse:v10 engagementType:9 context:v49 isShadowLog:1 forTestingMode:0];
    }
    else
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v47, OS_LOG_TYPE_INFO, "Donation Processing - Skipping Action Shadow Session Log", buf, 2u);
      }
    }
    id v8 = v53;
LABEL_43:
  }
}

- (void)start
{
  id v3 = [MEMORY[0x1E4F5B6A8] userContext];
  context = self->_context;
  self->_context = v3;

  [(ATXAppIntentMonitor *)self _listenToIntentStream];
  [(ATXAppIntentMonitor *)self _listenToLinkActionStream];
  [(ATXAppIntentMonitor *)self _listenToActivityStream];
}

- (void)stop
{
  [(BPSSink *)self->_intentSink cancel];
  intentSink = self->_intentSink;
  self->_intentSink = 0;

  intentScheduler = self->_intentScheduler;
  self->_intentScheduler = 0;

  [(BPSSink *)self->_linkActionSink cancel];
  linkActionSink = self->_linkActionSink;
  self->_linkActionSink = 0;

  linkActionScheduler = self->_linkActionScheduler;
  self->_linkActionScheduler = 0;

  [(BPSSink *)self->_nsuaSink cancel];
  nsuaSink = self->_nsuaSink;
  self->_nsuaSink = 0;

  nsuaScheduler = self->_nsuaScheduler;
  self->_nsuaScheduler = 0;

  context = self->_context;
  self->_context = 0;
}

- (id)_appActionLaunchSequenceManager
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__47;
  id v10 = __Block_byref_object_dispose__47;
  id v11 = 0;
  appIntentHistoryQueue = self->_appIntentHistoryQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXAppIntentMonitor__appActionLaunchSequenceManager__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(appIntentHistoryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXAppIntentMonitor__appActionLaunchSequenceManager__block_invoke(uint64_t a1)
{
}

- (void)_syncForTests
{
}

- (void)coalescedHandleIntentOrActivityDeletion
{
}

- (void)handleIntentOrActivityDeletion
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  sel_getName(a2);
  uint64_t v17 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke;
  aBlock[3] = &unk_1E68B0A78;
  void aBlock[4] = self;
  aBlock[5] = &v25;
  id v4 = _Block_copy(aBlock);
  uint64_t v5 = [(ATXAppIntentMonitor *)self deletionHighWaterMarkForDefaultsKey:@"intentDeletionHighWaterMark" currentDate:v3];
  uint64_t v6 = [(ATXAppIntentMonitor *)self adjustedStartDateForTombstoneStreamQuery:v5];
  id v19 = [(ATXAppIntentMonitor *)self adjustedEndDateForTombstoneStreamQuery:v3];
  duetHelper = self->_duetHelper;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_154;
  v22[3] = &unk_1E68B0AA0;
  id v8 = v4;
  id v23 = v8;
  [(_ATXDuetHelper *)duetHelper enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate:v6 endDate:v19 batchSize:30 block:v22];
  [(ATXAppIntentMonitor *)self setDeletionHighWaterMark:v3 defaultsKey:@"intentDeletionHighWaterMark"];
  id v9 = [(ATXAppIntentMonitor *)self deletionHighWaterMarkForDefaultsKey:@"activityDeletionHighWaterMarkKey" currentDate:v3];
  id v10 = [(ATXAppIntentMonitor *)self adjustedStartDateForTombstoneStreamQuery:v9];
  id v11 = [(ATXAppIntentMonitor *)self adjustedEndDateForTombstoneStreamQuery:v3];
  id v12 = (void *)v5;
  BOOL v13 = self->_duetHelper;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_2_155;
  v20[3] = &unk_1E68B0AA0;
  id v14 = v8;
  id v21 = v14;
  [(_ATXDuetHelper *)v13 enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate:v10 endDate:v11 batchSize:30 block:v20];
  [(ATXAppIntentMonitor *)self setDeletionHighWaterMark:v3 defaultsKey:@"activityDeletionHighWaterMarkKey"];
  id v15 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v26[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = v16;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Processed %lu tombstoned uuids in total", buf, 0xCu);
  }

  if (v26[3]) {
    ATXUpdatePredictionsImmediatelyWithReason(10);
  }

  _Block_object_dispose(&v25, 8);
}

void __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D25F6CC0]();
  id v8 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_151);
  id v9 = [v6 lastObject];
  id v10 = [v9 second];

  if ([v8 count])
  {
    [*(id *)(a1 + 32) _updateActionPredictionHistogramsRemovingActionUUIDs:v8];
    id v11 = *(void **)(*(void *)(a1 + 32) + 40);
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
    [v11 removeActionDataForActionUUIDs:v12];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v8 count];
  }
  if (v10) {
    [*(id *)(a1 + 32) setDeletionHighWaterMark:v10 defaultsKey:v5];
  }
  BOOL v13 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218498;
    uint64_t v15 = [v8 count];
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %lu tombstoned events for deletionHighWaterMarkKey: %@, ending date: %@", (uint8_t *)&v14, 0x20u);
  }
}

uint64_t __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 first];
}

uint64_t __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_154(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_2_155(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateActionPredictionHistogramsRemovingActionUUIDs:(id)a3
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    appLaunchHistogramManager = self->_appLaunchHistogramManager;
    if (appLaunchHistogramManager)
    {
      id v6 = [(_ATXAppLaunchHistogramManager *)appLaunchHistogramManager histogramForLaunchType:14];
      v28[0] = v6;
      id v7 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:16];
      v28[1] = v7;
      id v8 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:17];
      v28[2] = v8;
      id v9 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:19];
      v28[3] = v9;
      id v10 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:20];
      v28[4] = v10;
      id v11 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:22];
      v28[5] = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];

      dataStore = self->_dataStore;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __76__ATXAppIntentMonitor__updateActionPredictionHistogramsRemovingActionUUIDs___block_invoke;
      v25[3] = &unk_1E68B0AC8;
      id v14 = v12;
      id v26 = v14;
      [(_ATXDataStore *)dataStore enumerateActionsInUUIDSet:v4 block:v25];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v21 + 1) + 8 * v19);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v20, "flush", (void)v21);
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v17);
      }
    }
    else
    {
      uint64_t v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[ATXAppIntentMonitor _updateActionPredictionHistogramsRemovingActionUUIDs:]();
      }
    }
  }
}

uint64_t __76__ATXAppIntentMonitor__updateActionPredictionHistogramsRemovingActionUUIDs___block_invoke(uint64_t a1, void *a2, void *a3, double a4, uint64_t a5, void *a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1E4F4AE38];
  BOOL v13 = [a3 bundleId];
  id v14 = [v12 getActionKeyForBundleId:v13 actionType:v10];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v24;
    float v20 = a4;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v15);
        }
        *(float *)&double v17 = v20;
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v21++), "removeLaunchWithBundleId:date:timeZone:weight:", v14, v11, 0, v17, (void)v23);
      }
      while (v18 != v21);
      uint64_t v18 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return 1;
}

- (id)adjustedStartDateForTombstoneStreamQuery:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v5 = [v3 isEqualToDate:v4];

  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [v3 dateByAddingTimeInterval:-2.0];
  }
  id v7 = v6;

  return v7;
}

- (id)adjustedEndDateForTombstoneStreamQuery:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:2.0];
}

- (id)deletionHighWaterMarkForDefaultsKey:(id)a3 currentDate:(id)a4
{
  id v6 = a4;
  id v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:a3];
  if (v7
    || ([(NSUserDefaults *)self->_userDefaults objectForKey:@"deletionHighWaterMark"],
        (id v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v7;
      id v8 = v7;
      if ([v7 compare:v6] == 1)
      {
        id v9 = __atxlog_handle_deletions();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[ATXAppIntentMonitor deletionHighWaterMarkForDefaultsKey:currentDate:]();
        }

        id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
    }
    else
    {
      id v10 = __atxlog_handle_deletions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXAppIntentMonitor deletionHighWaterMarkForDefaultsKey:currentDate:]();
      }

      id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
  }
  else
  {
    id v12 = __atxlog_handle_deletions();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Deletion high water mark not present.", v13, 2u);
    }

    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }

  return v8;
}

- (void)setDeletionHighWaterMark:(id)a3 defaultsKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(NSUserDefaults *)self->_userDefaults setObject:v6 forKey:v7];
  id v8 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Set deletion high water mark of %@ for key %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsuaSink, 0);
  objc_storeStrong((id *)&self->_nsuaScheduler, 0);
  objc_storeStrong((id *)&self->_linkActionSink, 0);
  objc_storeStrong((id *)&self->_linkActionScheduler, 0);
  objc_storeStrong((id *)&self->_intentSink, 0);
  objc_storeStrong((id *)&self->_intentScheduler, 0);
  objc_storeStrong((id *)&self->_safariIntentQualityFilter, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_coalescedIntentOrActivityDeletion, 0);
  objc_storeStrong((id *)&self->_appRegistrationListener, 0);
  objc_storeStrong((id *)&self->_donatedActionInCacheTracker, 0);
  objc_storeStrong((id *)&self->_donatedActionsTracker, 0);
  objc_storeStrong((id *)&self->_donationQueueLinkActions, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_appIntentHistoryQueue, 0);
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_appActionLaunchSequenceManager, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
}

- (void)initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:duetHelper:intentStream:activityStream:dataStore:predictionContextBuilder:userDefaults:safariIntentFilter:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "nil appLaunchHistogramManager passed in", v1, 2u);
}

void __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Could not subscribe to activity stream: %@", v4, v5, v6, v7, v8);
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Could not subscribe to intent stream: %@", v4, v5, v6, v7, v8);
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Donation Processing - Intent body is nil in living publisher", v2, v3, v4, v5, v6);
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Could not subscribe to link action transcript stream: %@", v4, v5, v6, v7, v8);
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_99_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Donation Processing - Link action body execution id is nil in living publisher", v2, v3, v4, v5, v6);
}

- (void)fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Donation Processing - Intent Query End Date: %@", v2, v3, v4, v5, v6);
}

- (void)fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Donation Processing - Intent Query Start Date: %@", v2, v3, v4, v5, v6);
}

- (void)processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Donation Processing - Intent Events Term Frequency stats calculated", v2, v3, v4, v5, v6);
}

- (void)processIntentDonationsDuringAppSessionForBundleId:(void *)a1 startDate:endDate:globals:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Donation Processing - Processing %lu Intent Events", v3, v4, v5, v6, v7);
}

- (void)fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Donation Processing - NSUA Query End Date: %@", v2, v3, v4, v5, v6);
}

- (void)fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Donation Processing - NSUA Query Start Date: %@", v2, v3, v4, v5, v6);
}

- (void)processNSUADonationsDuringAppSessionForBundleId:(void *)a1 startDate:endDate:globals:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Donation Processing - Processing %lu NSUA Events", v3, v4, v5, v6, v7);
}

- (void)shouldAcceptMessageDonation:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Donation Processing - Filtering INSendMessageIntent because you messaged the recipient on %@", v2, v3, v4, v5, v6);
}

- (void)shouldAcceptMessageDonation:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Donation Processing - Filtering INSendMessageIntent because there is no recipientIdentifier", v2, v3, v4, v5, v6);
}

- (void)updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Can't update action prediction pipeline since ATXPredictionContext is nil", v2, v3, v4, v5, v6);
}

- (void)updateActionPredictionPipelineForIntentEvent:(void *)a1 weight:appSessionStartDate:appSessionEndDate:context:.cold.1(void *a1)
{
  uint64_t v1 = [a1 bundleId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "Donation Processing - Skipping processing this action because the upper limit for the number of actionTypes stored for %@ has been reached", v4, v5, v6, v7, v8);
}

- (void)_logIntentPredictionsForIntentEvent:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Donation Processing - Generating Action Shadow Session Log", v2, v3, v4, v5, v6);
}

- (void)_updateActionPredictionHistogramsRemovingActionUUIDs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Tried to delete data from histograms but histogram manager is nil", v1, 2u);
}

- (void)deletionHighWaterMarkForDefaultsKey:currentDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Rejecting deletion high water mark from THE MYSTERIOUS FUTURE.", v2, v3, v4, v5, v6);
}

- (void)deletionHighWaterMarkForDefaultsKey:currentDate:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Rejecting corrupt deletion high water mark.", v2, v3, v4, v5, v6);
}

@end