@interface _DASScheduler
+ (_DASScheduler)schedulerWithClientName:(id)a3;
+ (_DASScheduler)schedulerWithEndpoint:(id)a3;
+ (_DASScheduler)schedulerWithEndpoint:(id)a3 withClientName:(id)a4;
+ (id)log;
+ (id)scheduler;
+ (id)sharedScheduler;
- (BOOL)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deferActivities:(id)a3;
- (BOOL)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4;
- (BOOL)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4;
- (BOOL)evaluateAllActivitiesWithHandle:(id)a3;
- (BOOL)interrupted;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5;
- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5;
- (BOOL)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5;
- (BOOL)submitActivity:(id)a3 inGroup:(id)a4 error:(id *)a5;
- (BOOL)submitActivityInternal:(id)a3;
- (BOOL)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5;
- (BOOL)wasActivityAllowedToRun:(id)a3;
- (NSMutableDictionary)activityToDataMap;
- (NSMutableDictionary)delayedStartTasks;
- (NSMutableDictionary)startedActivities;
- (NSMutableDictionary)submittedActivities;
- (NSString)clientName;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)connectionCreationQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)runQueue;
- (OS_os_log)dasFrameworkLog;
- (_DASActivityBackgroundTasksSchedulerDelegate)backgroundTaskSchedulerDelegate;
- (_DASScheduler)init;
- (_DASScheduler)initWithListenerEndpoint:(id)a3;
- (_DASSubmissionManager)submissionManager;
- (double)balanceForBudgetWithName:(id)a3;
- (double)getRuntimeLimit:(id)a3;
- (id)_resetWidgetBudgets;
- (id)activityContainsOverrides:(id)a3;
- (id)activityRunStatistics;
- (id)allBudgets;
- (id)blockingPoliciesWithParameters:(id)a3;
- (id)clasStatus;
- (id)currentConnection;
- (id)currentPredictions;
- (id)delayedRunningActivities;
- (id)evaluateBytesConsumed:(id)a3 withPreviousParameters:(id)a4;
- (id)evaluatePolicies:(id)a3;
- (id)extendUpdateActivityDictionary:(id)a3;
- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5;
- (id)getBuddyEvents:(id)a3 bgsqlData:(id)a4;
- (id)getConditionsPenalties:(id)a3;
- (id)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4;
- (id)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5;
- (id)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5;
- (id)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5;
- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5;
- (id)getInstallTimeline:(id)a3 bgsqlData:(id)a4;
- (id)getLimiterResponseForActivity:(id)a3;
- (id)inspect:(id)a3;
- (id)policies;
- (id)queryDependenciesOfTaskIdentifier:(id)a3;
- (id)queryStatusOfResultIdentifier:(id)a3;
- (id)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4;
- (id)runProceedableActivities:(id)a3;
- (id)runningActivities;
- (id)runningGroupActivities;
- (id)scoresForActivityWithName:(id)a3;
- (id)statistics;
- (id)submitTaskRequest:(id)a3;
- (id)submittedTaskState;
- (int)resubmitToken;
- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4;
- (void)activity:(id)a3 blockedOnPolicies:(id)a4;
- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)activityStarted:(id)a3;
- (void)activityStartedWithParameters:(id)a3;
- (void)activityStoppedWithParameters:(id)a3;
- (void)addPauseExceptParameter:(id)a3;
- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4;
- (void)cancelActivities:(id)a3;
- (void)cancelAllTaskRequests;
- (void)cancelTaskRequestWithIdentifier:(id)a3;
- (void)completeSystemTaskWithIdentifier:(id)a3;
- (void)completeTaskRequest:(id)a3;
- (void)connectToDaemon:(BOOL)a3;
- (void)createActivityGroup:(id)a3;
- (void)dealloc;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)disableAppRefreshForApps:(id)a3;
- (void)endLaunchWithReason:(id)a3 forApp:(id)a4;
- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4;
- (void)forceResetOfResultIdentifier:(id)a3;
- (void)forceRunActivities:(id)a3;
- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3;
- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5;
- (void)handleEligibleActivities:(id)a3;
- (void)handleLaunchFromDaemonForActivities:(id)a3;
- (void)handleNoLongerRunningActivities:(id)a3;
- (void)pauseWithParameters:(id)a3;
- (void)prewarmApplication:(id)a3;
- (void)prewarmSuspendWithHandler:(id)a3;
- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5;
- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5;
- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8;
- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)resubmitPendingActivities;
- (void)resubmitPendingStartActivities;
- (void)resubmitRunningActivities;
- (void)resubmitRunningActivities:(id)a3;
- (void)resubmitRunningTasks:(id)a3;
- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)runActivities:(id)a3;
- (void)runActivitiesWithDelayedStart:(id)a3;
- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4;
- (void)setActivityToDataMap:(id)a3;
- (void)setBackgroundTaskSchedulerDelegate:(id)a3;
- (void)setBackgroundTasksSchedulerDelegate:(id)a3;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setClientName:(id)a3;
- (void)setConnectionCreationQueue:(id)a3;
- (void)setDasFrameworkLog:(id)a3;
- (void)setDelayedStartTasks:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setQueue:(id)a3;
- (void)setResubmitToken:(int)a3;
- (void)setRunQueue:(id)a3;
- (void)setStartedActivities:(id)a3;
- (void)setSubmissionManager:(id)a3;
- (void)setSubmittedActivities:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setupXPCConnectionWithEndpoint:(id)a3;
- (void)submitActivities:(id)a3;
- (void)submitActivitiesInternal:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitActivity:(id)a3 inGroup:(id)a4;
- (void)submitActivity:(id)a3 inGroupWithName:(id)a4;
- (void)submitRateLimitConfiguration:(id)a3;
- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
- (void)suspendActivities:(id)a3;
- (void)unprotectedEstablishDaemonConnectionIfInterrupted;
- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateActivity:(id)a3 withParameters:(id)a4;
- (void)updateBytesConsumedForActivity:(id)a3 withParameters:(id)a4;
- (void)updateOngoingTask:(id)a3;
- (void)updateProgress:(id)a3 forOngoingTask:(id)a4;
- (void)updateSystemConstraintsWithParameters:(id)a3;
- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
- (void)willExpireBGTaskActivities:(id)a3;
@end

@implementation _DASScheduler

- (void)submitActivity:(id)a3 inGroupWithName:(id)a4
{
  id v6 = a3;
  [v6 setGroupName:a4];
  [(_DASScheduler *)self submitActivity:v6];
}

- (BOOL)submitActivityInternal:(id)a3
{
  id v4 = a3;
  v5 = [v4 limitationResponse];
  BOOL v6 = +[_DASLimiterResponse queryActivityDecision:4 fromResponses:v5];

  if (v6)
  {
    dasFrameworkLog = self->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_ERROR)) {
      -[_DASScheduler submitActivityInternal:](dasFrameworkLog, v4);
    }
  }
  else
  {
    v8 = [v4 limitationResponse];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = self->_dasFrameworkLog;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DASScheduler submitActivityInternal:](v10, v4);
      }
    }
  }
  v11 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setSubmitDate:v11];
  if (self->_clientName) {
    objc_msgSend(v4, "setClientName:");
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  v12 = self;
  objc_sync_enter(v12);
  if (([v4 requestsApplicationLaunch] & 1) != 0
    || [v4 requestsExtensionLaunch])
  {
    v13 = [v4 rateLimitConfigurationName];

    if (!v13)
    {
      int v14 = [v4 keepsPrevious];
      if ((v14 | [v4 overwritesPrevious]) == 1)
      {
        submittedActivities = v12->_submittedActivities;
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __40___DASScheduler_submitActivityInternal___block_invoke;
        v28 = &unk_1E6112F80;
        id v29 = v4;
        v30 = v12;
        v31 = &v39;
        v32 = &v33;
        [(NSMutableDictionary *)submittedActivities enumerateKeysAndObjectsUsingBlock:&v25];
      }
    }
  }
  v16 = objc_msgSend(v4, "rateLimitConfigurationName", v25, v26, v27, v28);

  if (v16)
  {
    *((unsigned char *)v40 + 24) = 1;
  }
  else if (!*((unsigned char *)v40 + 24))
  {
    goto LABEL_18;
  }
  v17 = v12->_submittedActivities;
  v18 = [v4 uuid];
  [(NSMutableDictionary *)v17 setObject:v4 forKeyedSubscript:v18];

LABEL_18:
  v19 = (void *)v34[5];
  if (v19)
  {
    if ([v19 requestsExtensionLaunch])
    {
      v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v34[5]];
      [(_DASScheduler *)v12 cancelActivities:v20];
    }
    v21 = v12->_submittedActivities;
    v22 = [(id)v34[5] uuid];
    [(NSMutableDictionary *)v21 removeObjectForKey:v22];
  }
  objc_sync_exit(v12);

  char v23 = *((unsigned char *)v40 + 24);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v23;
}

+ (id)scheduler
{
  v2 = [[_DASScheduler alloc] initWithListenerEndpoint:0];

  return v2;
}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  id v6 = a4;
  v7 = [(_DASScheduler *)self currentConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58___DASScheduler_setMinimumBackgroundFetchInterval_forApp___block_invoke;
  v9[3] = &unk_1E6113020;
  v9[4] = self;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v9];
  [v8 setMinimumBackgroundFetchInterval:v6 forApp:a3];
}

+ (id)sharedScheduler
{
  if (sharedScheduler_onceToken_0 != -1) {
    dispatch_once(&sharedScheduler_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedScheduler_sharedScheduler;

  return v2;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)unprotectedEstablishDaemonConnectionIfInterrupted
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_interrupted)
  {
    v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL interrupted = self->_interrupted;
      v6[0] = 67109120;
      v6[1] = interrupted;
      _os_log_impl(&dword_1B578B000, v3, OS_LOG_TYPE_DEFAULT, "Establish daemon connection; interrupted: %d",
        (uint8_t *)v6,
        8u);
    }

    [(_DASScheduler *)self setupXPCConnectionWithEndpoint:self->_endpoint];
    [(_DASScheduler *)self resubmitRunningActivities];
    [(_DASScheduler *)self resubmitPendingStartActivities];
    [(_DASScheduler *)self resubmitPendingActivities];
    v5 = [(_DASScheduler *)self backgroundTaskSchedulerDelegate];

    if (v5) {
      [(_DASScheduler *)self connectToDaemon:1];
    }
  }
}

- (void)handleNoLongerRunningActivities:(id)a3
{
  id v15 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  submittedActivities = v4->_submittedActivities;
  id v6 = [v15 uuid];
  [(NSMutableDictionary *)submittedActivities removeObjectForKey:v6];

  delayedStartTasks = v4->_delayedStartTasks;
  v8 = [v15 uuid];
  [(NSMutableDictionary *)delayedStartTasks removeObjectForKey:v8];

  startedActivities = v4->_startedActivities;
  v10 = [v15 uuid];
  [(NSMutableDictionary *)startedActivities removeObjectForKey:v10];

  objc_sync_exit(v4);
  v11 = v4->_activityToDataMap;
  objc_sync_enter(v11);
  v12 = [(NSMutableDictionary *)v4->_activityToDataMap objectForKeyedSubscript:v15];
  if (v12)
  {
    v13 = [(_DASScheduler *)v4 currentConnection];
    int v14 = [v13 remoteObjectProxy];
    [v14 updateActivity:v15 withParameters:v12];

    [(NSMutableDictionary *)v4->_activityToDataMap removeObjectForKey:v15];
  }

  objc_sync_exit(v11);
}

- (_DASScheduler)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_DASScheduler;
  v5 = [(_DASScheduler *)&v30 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.duet.activityscheduler.client.taskrunqueue", MEMORY[0x1E4F14430]);
    runQueue = v5->_runQueue;
    v5->_runQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.duet.activityscheduler.client.xpcqueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.duet.activityscheduler.client.connectionReestablish", 0);
    connectionCreationQueue = v5->_connectionCreationQueue;
    v5->_connectionCreationQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    submittedActivities = v5->_submittedActivities;
    v5->_submittedActivities = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    startedActivities = v5->_startedActivities;
    v5->_startedActivities = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    delayedStartTasks = v5->_delayedStartTasks;
    v5->_delayedStartTasks = (NSMutableDictionary *)v16;

    v18 = objc_alloc_init(_DASSubmissionManager);
    submissionManager = v5->_submissionManager;
    v5->_submissionManager = v18;

    os_log_t v20 = os_log_create((const char *)[@"com.apple.duetactivityscheduler" UTF8String], (const char *)objc_msgSend(@"client", "UTF8String"));
    dasFrameworkLog = v5->_dasFrameworkLog;
    v5->_dasFrameworkLog = (OS_os_log *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    activityToDataMap = v5->_activityToDataMap;
    v5->_activityToDataMap = (NSMutableDictionary *)v22;

    [(_DASScheduler *)v5 setupXPCConnectionWithEndpoint:v4];
    objc_initWeak(&location, v5);
    v24 = (const char *)[@"com.appple.duet.activityscheduler.requestActivityResubmission" UTF8String];
    uint64_t v25 = v5->_queue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __42___DASScheduler_initWithListenerEndpoint___block_invoke;
    v27[3] = &unk_1E6112F30;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch(v24, &v5->_resubmitToken, v25, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)setupXPCConnectionWithEndpoint:(id)a3
{
  v128[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  id v6 = objc_alloc(MEMORY[0x1E4F29268]);
  if (v5) {
    uint64_t v7 = (NSXPCConnection *)[v6 initWithListenerEndpoint:v5];
  }
  else {
    uint64_t v7 = (NSXPCConnection *)[v6 initWithMachServiceName:@"com.apple.duetactivityscheduler" options:4096];
  }
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v7;

  objc_storeStrong((id *)&self->_endpoint, a3);
  uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E79570];
  dispatch_queue_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v128[0] = objc_opt_class();
  v128[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
  uint64_t v12 = [v10 setWithArray:v11];
  [v9 setClasses:v12 forSelector:sel_submittedActivitiesWithHandler_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v127[0] = objc_opt_class();
  v127[1] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
  id v15 = [v13 setWithArray:v14];
  [v9 setClasses:v15 forSelector:sel_delayedRunningActivitiesWithHandler_ argumentIndex:0 ofReply:1];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v126[0] = objc_opt_class();
  v126[1] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:2];
  v18 = [v16 setWithArray:v17];
  [v9 setClasses:v18 forSelector:sel_runningActivitiesWithHandler_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  os_log_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
  v21 = [v19 setWithArray:v20];
  [v9 setClasses:v21 forSelector:sel_runningGroupActivitiesWithHandler_ argumentIndex:0 ofReply:1];

  uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
  v124[0] = objc_opt_class();
  v124[1] = objc_opt_class();
  v124[2] = objc_opt_class();
  v124[3] = objc_opt_class();
  char v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:4];
  v24 = [v22 setWithArray:v23];
  [v9 setClasses:v24 forSelector:sel_currentPredictionsWithHandler_ argumentIndex:0 ofReply:1];

  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  v123[0] = objc_opt_class();
  v123[1] = objc_opt_class();
  v123[2] = objc_opt_class();
  v123[3] = objc_opt_class();
  v123[4] = objc_opt_class();
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:5];
  v27 = [v25 setWithArray:v26];
  [v9 setClasses:v27 forSelector:sel_statisticsWithHandler_ argumentIndex:0 ofReply:1];

  id v28 = (void *)MEMORY[0x1E4F1CAD0];
  v122[0] = objc_opt_class();
  v122[1] = objc_opt_class();
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
  objc_super v30 = [v28 setWithArray:v29];
  [v9 setClasses:v30 forSelector:sel_submitActivities_ argumentIndex:0 ofReply:0];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  v121[0] = objc_opt_class();
  v121[1] = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
  uint64_t v33 = [v31 setWithArray:v32];
  [v9 setClasses:v33 forSelector:sel_startedActivities_ argumentIndex:0 ofReply:0];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  v120[0] = objc_opt_class();
  v120[1] = objc_opt_class();
  v120[2] = objc_opt_class();
  v120[3] = objc_opt_class();
  v120[4] = objc_opt_class();
  v120[5] = objc_opt_class();
  uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:6];
  v36 = [v34 setWithArray:v35];
  [v9 setClasses:v36 forSelector:sel_updateSystemConstraintsWithParameters_ argumentIndex:0 ofReply:0];

  v37 = (void *)MEMORY[0x1E4F1CAD0];
  v119[0] = objc_opt_class();
  v119[1] = objc_opt_class();
  v119[2] = objc_opt_class();
  v119[3] = objc_opt_class();
  v119[4] = objc_opt_class();
  v119[5] = objc_opt_class();
  id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:6];
  uint64_t v39 = [v37 setWithArray:v38];
  [v9 setClasses:v39 forSelector:sel_enterTestModeWithParameters_reset_handler_ argumentIndex:0 ofReply:0];

  v40 = (void *)MEMORY[0x1E4F1CAD0];
  v118[0] = objc_opt_class();
  v118[1] = objc_opt_class();
  v118[2] = objc_opt_class();
  uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
  char v42 = [v40 setWithArray:v41];
  [v9 setClasses:v42 forSelector:sel_blockingPoliciesWithParameters_handler_ argumentIndex:0 ofReply:0];

  v43 = (void *)MEMORY[0x1E4F1CAD0];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  v117[2] = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
  v45 = [v43 setWithArray:v44];
  [v9 setClasses:v45 forSelector:sel_pauseWithParameters_handler_ argumentIndex:0 ofReply:0];

  v46 = (void *)MEMORY[0x1E4F1CAD0];
  v116[0] = objc_opt_class();
  v116[1] = objc_opt_class();
  v116[2] = objc_opt_class();
  v116[3] = objc_opt_class();
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:4];
  v48 = [v46 setWithArray:v47];
  [v9 setClasses:v48 forSelector:sel_submitRateLimitConfiguration_handler_ argumentIndex:0 ofReply:0];

  v49 = (void *)MEMORY[0x1E4F1CAD0];
  v115[0] = objc_opt_class();
  v115[1] = objc_opt_class();
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
  v51 = [v49 setWithArray:v50];
  [v9 setClasses:v51 forSelector:sel_delayedStartActivities_ argumentIndex:0 ofReply:0];

  v52 = (void *)MEMORY[0x1E4F1CAD0];
  v114[0] = objc_opt_class();
  v114[1] = objc_opt_class();
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
  v54 = [v52 setWithArray:v53];
  [v9 setClasses:v54 forSelector:sel_submitActivity_inGroup_withHandler_ argumentIndex:0 ofReply:0];

  v55 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v9 setClasses:v55 forSelector:sel_submitTaskRequest_withHandler_ argumentIndex:0 ofReply:0];

  v56 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v9 setClasses:v56 forSelector:sel_updateProgressForOngoingTask_completionHandler_ argumentIndex:0 ofReply:0];

  v57 = (void *)MEMORY[0x1E4F1CAD0];
  v113[0] = objc_opt_class();
  v113[1] = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:2];
  v59 = [v57 setWithArray:v58];
  [v9 setClasses:v59 forSelector:sel_getPendingTaskRequestsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v60 = (void *)MEMORY[0x1E4F1CAD0];
  v112[0] = objc_opt_class();
  v112[1] = objc_opt_class();
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
  v62 = [v60 setWithArray:v61];
  [v9 setClasses:v62 forSelector:sel_disableAppRefreshForApps_ argumentIndex:0 ofReply:0];

  [v9 setXPCType:MEMORY[0x1E4F14590] forSelector:sel_submitTaskRequestWithIdentifier_descriptor_completionHandler_ argumentIndex:1 ofReply:0];
  [v9 setXPCType:MEMORY[0x1E4F14590] forSelector:sel_updateTaskRequestWithIdentifier_descriptor_completionHandler_ argumentIndex:1 ofReply:0];
  v63 = (void *)MEMORY[0x1E4F1CAD0];
  v111[0] = objc_opt_class();
  v111[1] = objc_opt_class();
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
  v65 = [v63 setWithArray:v64];
  [v9 setClasses:v65 forSelector:sel_reportSystemTaskWithIdentifier_producedResults_completionHandler_ argumentIndex:1 ofReply:0];

  v66 = (void *)MEMORY[0x1E4F1CAD0];
  v110[0] = objc_opt_class();
  v110[1] = objc_opt_class();
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
  v68 = [v66 setWithArray:v67];
  [v9 setClasses:v68 forSelector:sel_reportSystemTaskWithIdentifier_consumedResults_completionHandler_ argumentIndex:1 ofReply:0];

  v69 = (void *)MEMORY[0x1E4F1CAD0];
  v109[0] = objc_opt_class();
  v109[1] = objc_opt_class();
  v109[2] = objc_opt_class();
  v109[3] = objc_opt_class();
  v109[4] = objc_opt_class();
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:5];
  v71 = [v69 setWithArray:v70];
  [v9 setClasses:v71 forSelector:sel_inspect_withHandler_ argumentIndex:0 ofReply:1];

  v72 = (void *)MEMORY[0x1E4F1CAD0];
  v108[0] = objc_opt_class();
  v108[1] = objc_opt_class();
  v108[2] = objc_opt_class();
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:3];
  v74 = [v72 setWithArray:v73];
  [v9 setClasses:v74 forSelector:sel_resetFastPassActivities_resetAll_withHandler_ argumentIndex:0 ofReply:1];

  v75 = (void *)MEMORY[0x1E4F1CAD0];
  v107[0] = objc_opt_class();
  v107[1] = objc_opt_class();
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
  v77 = [v75 setWithArray:v76];
  [v9 setClasses:v77 forSelector:sel_resubmitRunningTasks_ argumentIndex:0 ofReply:0];

  v78 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E74B98];
  v79 = (void *)MEMORY[0x1E4F1CAD0];
  v106[0] = objc_opt_class();
  v106[1] = objc_opt_class();
  v106[2] = objc_opt_class();
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:3];
  v81 = [v79 setWithArray:v80];
  [v78 setClasses:v81 forSelector:sel_runActivities_ argumentIndex:0 ofReply:0];

  v82 = (void *)MEMORY[0x1E4F1CAD0];
  v105[0] = objc_opt_class();
  v105[1] = objc_opt_class();
  v105[2] = objc_opt_class();
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:3];
  v84 = [v82 setWithArray:v83];
  [v78 setClasses:v84 forSelector:sel_suspendActivities_ argumentIndex:0 ofReply:0];

  v85 = (void *)MEMORY[0x1E4F1CAD0];
  v104[0] = objc_opt_class();
  v104[1] = objc_opt_class();
  v104[2] = objc_opt_class();
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:3];
  v87 = [v85 setWithArray:v86];
  [v78 setClasses:v87 forSelector:sel_cancelActivities_ argumentIndex:0 ofReply:0];

  v88 = (void *)MEMORY[0x1E4F1CAD0];
  v103[0] = objc_opt_class();
  v103[1] = objc_opt_class();
  v103[2] = objc_opt_class();
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
  v90 = [v88 setWithArray:v89];
  [v78 setClasses:v90 forSelector:sel_runActivitiesWithDelayedStart_ argumentIndex:0 ofReply:0];

  v91 = (void *)MEMORY[0x1E4F1CAD0];
  v102[0] = objc_opt_class();
  v102[1] = objc_opt_class();
  v102[2] = objc_opt_class();
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:3];
  v93 = [v91 setWithArray:v92];
  [v78 setClasses:v93 forSelector:sel_handleLaunchFromDaemonForActivities_ argumentIndex:0 ofReply:0];

  v94 = (void *)MEMORY[0x1E4F1CAD0];
  v101[0] = objc_opt_class();
  v101[1] = objc_opt_class();
  v101[2] = objc_opt_class();
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:3];
  v96 = [v94 setWithArray:v95];
  [v78 setClasses:v96 forSelector:sel_willExpireBGTaskActivities_ argumentIndex:0 ofReply:0];

  [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
  objc_initWeak(&location, self);
  v97 = self->_xpcConnection;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __48___DASScheduler_setupXPCConnectionWithEndpoint___block_invoke;
  v98[3] = &unk_1E6112F08;
  objc_copyWeak(&v99, &location);
  [(NSXPCConnection *)v97 setInterruptionHandler:v98];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v9];
  [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v78];
  [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
  [(NSXPCConnection *)self->_xpcConnection resume];
  [(_DASScheduler *)self setInterrupted:0];
  objc_destroyWeak(&v99);
  objc_destroyWeak(&location);
}

- (void)setInterrupted:(BOOL)a3
{
  self->_BOOL interrupted = a3;
}

- (void)cancelAllTaskRequests
{
  v3 = [(_DASScheduler *)self currentConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __38___DASScheduler_cancelAllTaskRequests__block_invoke;
  v6[3] = &unk_1E6113020;
  v6[4] = self;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___DASScheduler_cancelAllTaskRequests__block_invoke_348;
  v5[3] = &unk_1E6112A70;
  v5[4] = self;
  [v4 cancelAllTaskRequestsWithCompletionHandler:v5];
}

- (void)cancelTaskRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke;
  v10[3] = &unk_1E6113020;
  v10[4] = self;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke_347;
  v8[3] = &unk_1E6112B60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 cancelTaskRequestWithIdentifier:v7 completionHandler:v8];
}

- (void)connectToDaemon:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to daemon; reconnect: %d", buf, 8u);
  }

  if (v3) {
    [(_DASScheduler *)self xpcConnection];
  }
  else {
  id v6 = [(_DASScheduler *)self currentConnection];
  }
  id v7 = [v6 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33___DASScheduler_connectToDaemon___block_invoke;
  v8[3] = &unk_1E6112A70;
  v8[4] = self;
  [v7 establishConnection:v8];
}

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_343);
  }
  v2 = (void *)log_log;

  return v2;
}

- (void)activityStartedWithParameters:(id)a3
{
  id v4 = a3;
  id v6 = [(_DASScheduler *)self currentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 activityStartedWithParameters:v4];
}

- (void)activityCanceled:(id)a3
{
  id v9 = a3;
  [(_DASScheduler *)self handleNoLongerRunningActivities:v9];
  if (![v9 preClearedMode])
  {
    submissionManager = self->_submissionManager;
    id v5 = [(_DASScheduler *)self currentConnection];
    id v6 = [v5 remoteObjectProxy];
    [(_DASSubmissionManager *)submissionManager activityCanceled:v9 withScheduler:v6];

    id v7 = [(_DASScheduler *)self currentConnection];
    dispatch_queue_t v8 = [v7 remoteObjectProxy];
    [v8 activityCanceled:v9];
  }
}

- (id)currentConnection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  BOOL v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  connectionCreationQueue = self->_connectionCreationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34___DASScheduler_currentConnection__block_invoke;
  v5[3] = &unk_1E6112F58;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(connectionCreationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)submitActivity:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_DASScheduler *)self submitActivityInternal:v4];
  uint64_t v6 = [(_DASScheduler *)self dasFrameworkLog];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1B578B000, v6, OS_LOG_TYPE_DEFAULT, "SUBMITTING: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    if ([v4 preClearedMode])
    {
      uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
      [(_DASScheduler *)self runActivities:v6];
    }
    else
    {
      submissionManager = self->_submissionManager;
      uint64_t v6 = [(_DASScheduler *)self currentConnection];
      id v9 = [v6 remoteObjectProxy];
      [(_DASSubmissionManager *)submissionManager submitActivity:v4 withScheduler:v9];
    }
  }
  else if (v7)
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B578B000, v6, OS_LOG_TYPE_DEFAULT, "Duplicate Activity: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (OS_os_log)dasFrameworkLog
{
  return self->_dasFrameworkLog;
}

- (void)setBackgroundTasksSchedulerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundTaskSchedulerDelegate, a3);

  [(_DASScheduler *)self connectToDaemon:0];
}

- (void)setClientName:(id)a3
{
}

+ (_DASScheduler)schedulerWithClientName:(id)a3
{
  id v3 = a3;
  id v4 = [[_DASScheduler alloc] initWithListenerEndpoint:0];
  [(_DASScheduler *)v4 setClientName:v3];

  return v4;
}

- (_DASScheduler)init
{
  return [(_DASScheduler *)self initWithListenerEndpoint:0];
}

- (void)dealloc
{
  notify_cancel(self->_resubmitToken);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_DASScheduler;
  [(_DASScheduler *)&v3 dealloc];
}

+ (_DASScheduler)schedulerWithEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = [[_DASScheduler alloc] initWithListenerEndpoint:v3];

  return v4;
}

+ (_DASScheduler)schedulerWithEndpoint:(id)a3 withClientName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[_DASScheduler alloc] initWithListenerEndpoint:v6];

  [(_DASScheduler *)v7 setClientName:v5];

  return v7;
}

- (id)submittedTaskState
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableDictionary *)v2->_submittedActivities copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)resubmitRunningActivities
{
  v2 = self;
  objc_sync_enter(v2);
  id v5 = [(NSMutableDictionary *)v2->_startedActivities allValues];
  objc_sync_exit(v2);

  if ([v5 count])
  {
    id v3 = [(_DASScheduler *)v2 xpcConnection];
    id v4 = [v3 remoteObjectProxy];
    [v4 startedActivities:v5];
  }
}

- (void)resubmitPendingActivities
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_submittedActivities allValues];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.requestsApplicationLaunch == NO && self.preClearedMode == 0"];
  id v5 = [v3 filteredArrayUsingPredicate:v4];
  id v9 = (id)[v5 mutableCopy];

  objc_sync_exit(v2);
  if ([v9 count])
  {
    [(_DASSubmissionManager *)v2->_submissionManager removeAllObjects];
    submissionManager = v2->_submissionManager;
    BOOL v7 = [(_DASScheduler *)v2 xpcConnection];
    uint64_t v8 = [v7 remoteObjectProxy];
    [(_DASSubmissionManager *)submissionManager submitActivities:v9 withScheduler:v8];
  }
}

- (void)resubmitPendingStartActivities
{
  v2 = self;
  objc_sync_enter(v2);
  id v4 = [(NSMutableDictionary *)v2->_delayedStartTasks allValues];
  objc_sync_exit(v2);

  if ([v4 count])
  {
    id v3 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectProxy];
    [v3 delayedStartActivities:v4];
  }
}

- (void)handleEligibleActivities:(id)a3
{
  id v4 = a3;
  id v6 = [(_DASScheduler *)self currentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 handleEligibleActivities:v4];
}

- (void)submitActivitiesInternal:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = self;
  objc_sync_enter(v6);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v8 = 138412546;
    long long v23 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "limitationResponse", v23);
        BOOL v13 = +[_DASLimiterResponse queryActivityDecision:4 fromResponses:v12];

        if (v13)
        {
          uint64_t v14 = v6->_dasFrameworkLog;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v15 = [v11 name];
            uint64_t v16 = [v11 limitationResponse];
            *(_DWORD *)buf = v23;
            id v30 = v15;
            __int16 v31 = 2112;
            v32 = v16;
            _os_log_error_impl(&dword_1B578B000, v14, OS_LOG_TYPE_ERROR, "ERROR Submitting %@: Please contact das-core@group.apple.com to prevent this activity from getting rejected. Configuration: %@", buf, 0x16u);
          }
        }
        else
        {
          v17 = [v11 limitationResponse];
          uint64_t v18 = [v17 count];

          if (!v18) {
            goto LABEL_13;
          }
          uint64_t v14 = v6->_dasFrameworkLog;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v21 = [v11 name];
            uint64_t v22 = [v11 limitationResponse];
            *(_DWORD *)buf = v23;
            id v30 = v21;
            __int16 v31 = 2112;
            v32 = v22;
            _os_log_error_impl(&dword_1B578B000, v14, OS_LOG_TYPE_ERROR, "WARNING Submitting %@: %@", buf, 0x16u);
          }
        }

LABEL_13:
        if (v6->_clientName) {
          objc_msgSend(v11, "setClientName:");
        }
        submittedActivities = v6->_submittedActivities;
        os_log_t v20 = [v11 uuid];
        [(NSMutableDictionary *)submittedActivities setObject:v11 forKeyedSubscript:v20];

        [v11 setSubmitDate:v5];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v6);
}

- (void)submitActivities:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  [(_DASScheduler *)self submitActivitiesInternal:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "preClearedMode", (void)v16)) {
          BOOL v13 = v5;
        }
        else {
          BOOL v13 = v6;
        }
        [v13 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [(_DASScheduler *)self runActivities:v5];
  uint64_t v14 = [(_DASScheduler *)self currentConnection];
  id v15 = [v14 remoteObjectProxy];
  [v15 submitActivities:v6];
}

- (void)activityStarted:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  delayedStartTasks = v5->_delayedStartTasks;
  id v7 = [v4 uuid];
  uint64_t v8 = [(NSMutableDictionary *)delayedStartTasks objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = v5->_delayedStartTasks;
    uint64_t v10 = [v4 uuid];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    startedActivities = v5->_startedActivities;
    uint64_t v12 = [v4 uuid];
    [(NSMutableDictionary *)startedActivities setObject:v4 forKeyedSubscript:v12];
  }
  else
  {
    dasFrameworkLog = v5->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1B578B000, dasFrameworkLog, OS_LOG_TYPE_DEFAULT, "startActivity: %@ activity was not found", (uint8_t *)&v18, 0xCu);
    }
  }

  objc_sync_exit(v5);
  if (v8)
  {
    uint64_t v14 = [(_DASScheduler *)v5 dasFrameworkLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1B578B000, v14, OS_LOG_TYPE_DEFAULT, "STARTING: %@", (uint8_t *)&v18, 0xCu);
    }

    id v15 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setStartDate:v15];

    long long v16 = [(_DASScheduler *)v5 currentConnection];
    long long v17 = [v16 remoteObjectProxy];
    [v17 activityStarted:v4];
  }
}

- (id)_resetWidgetBudgets
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v2 = [(_DASScheduler *)self currentConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __36___DASScheduler__resetWidgetBudgets__block_invoke;
  v6[3] = &unk_1E6112FA8;
  v6[4] = &v7;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  [v3 _resetWidgetBudgets];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)activityCompleted:(id)a3
{
  id v9 = a3;
  [(_DASScheduler *)self handleNoLongerRunningActivities:v9];
  if (![v9 preClearedMode])
  {
    submissionManager = self->_submissionManager;
    id v5 = [(_DASScheduler *)self currentConnection];
    id v6 = [v5 remoteObjectProxy];
    [(_DASSubmissionManager *)submissionManager activityCompleted:v9 withScheduler:v6];

    uint64_t v7 = [(_DASScheduler *)self currentConnection];
    uint64_t v8 = [v7 remoteObjectProxy];
    [v8 activityCompleted:v9];
  }
}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  v34[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 allKeys];
  v34[0] = @"DownloadedOnWifi";
  v34[1] = @"DownloadedOnCell";
  v34[2] = @"UploadedOnWifi";
  v34[3] = @"UploadedOnCell";
  v34[4] = @"Cell";
  v34[5] = @"WiFi";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    long long v25 = self;
    id v26 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v14, v25, v26, (void)v27))
        {
          id v15 = [v7 objectForKeyedSubscript:v14];
          [v15 doubleValue];
          if (v16 > 0.0 || ([v8 containsObject:@"Cell"] & 1) != 0)
          {

LABEL_17:
            self = v25;
            id v6 = v26;
            [(_DASScheduler *)v25 updateBytesConsumedForActivity:v26 withParameters:v7];
            goto LABEL_18;
          }
          char v17 = [v8 containsObject:@"WiFi"];

          if (v17) {
            goto LABEL_17;
          }
        }
        else if (([v8 containsObject:@"Cell"] & 1) != 0 {
               || [v8 containsObject:@"WiFi"])
        }
        {
          goto LABEL_17;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
      self = v25;
      id v6 = v26;
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if ([v8 containsObject:@"PercentCompleted"])
  {
    int v18 = [v7 objectForKeyedSubscript:@"PercentCompleted"];
    [v18 doubleValue];
    double v20 = v19;

    if (v20 >= 0.0)
    {
      uint64_t v21 = [(_DASScheduler *)self currentConnection];
      uint64_t v22 = [v21 remoteObjectProxy];
      __int16 v31 = @"PercentCompleted";
      long long v23 = [v7 objectForKeyedSubscript:@"PercentCompleted"];
      v32 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      [v22 updateActivity:v6 withParameters:v24];
    }
  }
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  id v4 = a3;
  id v6 = [(_DASScheduler *)self currentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 updateSystemConstraintsWithParameters:v4];
}

- (id)extendUpdateActivityDictionary:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v70 = [MEMORY[0x1E4F1CA60] dictionary];
  v78 = v3;
  [v3 allKeys];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (!v4)
  {
    double v71 = 0.0;
    double v72 = 0.0;
    double v6 = 0.0;
    double v76 = 0.0;
    double v77 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    goto LABEL_23;
  }
  uint64_t v5 = v4;
  double v71 = 0.0;
  double v72 = 0.0;
  double v6 = 0.0;
  uint64_t v7 = *(void *)v80;
  double v76 = 0.0;
  double v77 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v80 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      if ([v14 isEqualToString:@"Cell"])
      {
        id v15 = [v78 objectForKeyedSubscript:v14];
        double v16 = [v15 objectForKeyedSubscript:@"Inexpensive"];
        char v17 = v16;
        if (v16)
        {
          int v18 = [v16 objectForKeyedSubscript:@"Upload"];
          [v18 doubleValue];
          double v20 = v19;

          double v21 = v8 + v20;
          double v12 = v12 + v20;
          double v22 = v10 + v20;
          double v23 = v77 + v20;
          v24 = [v17 objectForKeyedSubscript:@"Download"];
          [v24 doubleValue];
          double v26 = v25;

          double v8 = v21 + v26;
          double v11 = v11 + v26;
          double v10 = v22 + v26;
          double v77 = v23 + v26;
        }
        long long v27 = [v15 objectForKeyedSubscript:@"Expensive"];
        long long v28 = v27;
        if (v27)
        {
          long long v29 = [v27 objectForKeyedSubscript:@"Upload"];
          [v29 doubleValue];
          double v31 = v30;

          double v32 = v9 + v31;
          double v12 = v12 + v31;
          double v33 = v10 + v31;
          double v34 = v6 + v31;
          uint64_t v35 = [v28 objectForKeyedSubscript:@"Download"];
          [v35 doubleValue];
          double v37 = v36;

          double v11 = v11 + v37;
          double v9 = v32 + v37;
          double v10 = v33 + v37;
          double v6 = v34 + v37;
        }
      }
      else
      {
        if (![v14 isEqualToString:@"WiFi"]) {
          continue;
        }
        double v73 = v10;
        double v74 = v6;
        id v15 = [v78 objectForKeyedSubscript:v14];
        id v38 = [v15 objectForKeyedSubscript:@"Inexpensive"];
        char v17 = v38;
        if (v38)
        {
          uint64_t v39 = [v38 objectForKeyedSubscript:@"Upload"];
          [v39 doubleValue];
          double v41 = v40;

          double v42 = v8 + v41;
          double v12 = v12 + v41;
          double v43 = v76 + v41;
          double v44 = v72 + v41;
          v45 = [v17 objectForKeyedSubscript:@"Download"];
          [v45 doubleValue];
          double v47 = v46;

          double v48 = v42 + v47;
          double v11 = v11 + v47;
          double v76 = v43 + v47;
          double v72 = v44 + v47;
        }
        else
        {
          double v48 = v8;
        }
        v49 = [v15 objectForKeyedSubscript:@"Expensive"];
        long long v28 = v49;
        if (v49)
        {
          v50 = [v49 objectForKeyedSubscript:@"Upload"];
          [v50 doubleValue];
          double v52 = v51;

          double v53 = v9 + v52;
          double v12 = v12 + v52;
          double v54 = v76 + v52;
          double v55 = v71 + v52;
          v56 = [v28 objectForKeyedSubscript:@"Download"];
          [v56 doubleValue];
          double v58 = v57;

          double v9 = v53 + v58;
          double v11 = v11 + v58;
          double v76 = v54 + v58;
          double v71 = v55 + v58;
        }
        double v8 = v48;
        double v10 = v73;
        double v6 = v74;
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
  }
  while (v5);
LABEL_23:
  v59 = [NSNumber numberWithDouble:v10];
  [v70 setObject:v59 forKeyedSubscript:@"Cell"];

  v60 = [NSNumber numberWithDouble:v76];
  [v70 setObject:v60 forKeyedSubscript:@"WiFi"];

  v61 = [NSNumber numberWithDouble:v12];
  [v70 setObject:v61 forKeyedSubscript:@"Upload"];

  v62 = [NSNumber numberWithDouble:v11];
  [v70 setObject:v62 forKeyedSubscript:@"Download"];

  v63 = [NSNumber numberWithDouble:v9];
  [v70 setObject:v63 forKeyedSubscript:@"Expensive"];

  v64 = [NSNumber numberWithDouble:v8];
  [v70 setObject:v64 forKeyedSubscript:@"Inexpensive"];

  v65 = [NSNumber numberWithDouble:v6];
  [v70 setObject:v65 forKeyedSubscript:@"CellExpensive"];

  v66 = [NSNumber numberWithDouble:v71];
  [v70 setObject:v66 forKeyedSubscript:@"WiFiExpensive"];

  v67 = [NSNumber numberWithDouble:v77];
  [v70 setObject:v67 forKeyedSubscript:@"CellInexpensive"];

  v68 = [NSNumber numberWithDouble:v72];
  [v70 setObject:v68 forKeyedSubscript:@"WiFiInexpensive"];

  return v70;
}

- (id)evaluateBytesConsumed:(id)a3 withPreviousParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F1CA60] dictionary];
  double v9 = v6;
  double v10 = [v6 objectForKeyedSubscript:@"Cell"];
  if (v10)
  {
  }
  else
  {
    double v11 = [v6 objectForKeyedSubscript:@"WiFi"];

    if (!v11)
    {
      uint64_t v84 = [v9 objectForKeyedSubscript:@"DownloadedOnWifi"];
      [v84 doubleValue];
      double v86 = v85;

      v87 = [v9 objectForKeyedSubscript:@"DownloadedOnCell"];
      [v87 doubleValue];
      double v89 = v88;

      v90 = [v9 objectForKeyedSubscript:@"UploadedOnWifi"];
      [v90 doubleValue];
      double v92 = v91;

      v93 = [v9 objectForKeyedSubscript:@"UploadedOnCell"];
      [v93 doubleValue];
      double v95 = v94;

      v96 = [v7 objectForKeyedSubscript:@"Expensive"];
      if (v96)
      {
        v97 = NSNumber;
        v98 = [v7 objectForKeyedSubscript:@"Expensive"];
        [v98 doubleValue];
        id v99 = objc_msgSend(v97, "numberWithDouble:");
        [v8 setObject:v99 forKeyedSubscript:@"Expensive"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"Expensive"];
      }

      v100 = [v7 objectForKeyedSubscript:@"Inexpensive"];
      if (v100)
      {
        v101 = NSNumber;
        v102 = [v7 objectForKeyedSubscript:@"Inexpensive"];
        [v102 doubleValue];
        v103 = objc_msgSend(v101, "numberWithDouble:");
        [v8 setObject:v103 forKeyedSubscript:@"Inexpensive"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"Inexpensive"];
      }

      v104 = [v7 objectForKeyedSubscript:@"Upload"];
      if (v104)
      {
        v105 = NSNumber;
        v106 = [v7 objectForKeyedSubscript:@"Upload"];
        [v106 doubleValue];
        v107 = objc_msgSend(v105, "numberWithDouble:");
        [v8 setObject:v107 forKeyedSubscript:@"Upload"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"Upload"];
      }

      v108 = [v7 objectForKeyedSubscript:@"Download"];
      if (v108)
      {
        v109 = NSNumber;
        v110 = [v7 objectForKeyedSubscript:@"Download"];
        [v110 doubleValue];
        v111 = objc_msgSend(v109, "numberWithDouble:");
        [v8 setObject:v111 forKeyedSubscript:@"Download"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"Download"];
      }

      v112 = [v7 objectForKeyedSubscript:@"WiFiExpensive"];
      if (v112)
      {
        v113 = NSNumber;
        v114 = [v7 objectForKeyedSubscript:@"WiFiExpensive"];
        [v114 doubleValue];
        v115 = objc_msgSend(v113, "numberWithDouble:");
        [v8 setObject:v115 forKeyedSubscript:@"WiFiExpensive"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"WiFiExpensive"];
      }

      v116 = [v7 objectForKeyedSubscript:@"WiFiInexpensive"];
      if (v116)
      {
        v117 = NSNumber;
        v118 = [v7 objectForKeyedSubscript:@"WiFiInexpensive"];
        [v118 doubleValue];
        v119 = objc_msgSend(v117, "numberWithDouble:");
        [v8 setObject:v119 forKeyedSubscript:@"WiFiInexpensive"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"WiFiInexpensive"];
      }

      v120 = [v7 objectForKeyedSubscript:@"CellExpensive"];
      if (v120)
      {
        v121 = NSNumber;
        v122 = [v7 objectForKeyedSubscript:@"CellExpensive"];
        [v122 doubleValue];
        v123 = objc_msgSend(v121, "numberWithDouble:");
        [v8 setObject:v123 forKeyedSubscript:@"CellExpensive"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"CellExpensive"];
      }

      v124 = [v7 objectForKeyedSubscript:@"CellInexpensive"];
      if (v124)
      {
        v125 = NSNumber;
        v126 = [v7 objectForKeyedSubscript:@"CellInexpensive"];
        [v126 doubleValue];
        v127 = objc_msgSend(v125, "numberWithDouble:");
        [v8 setObject:v127 forKeyedSubscript:@"CellInexpensive"];
      }
      else
      {
        [v8 setObject:&unk_1F0E6ED40 forKeyedSubscript:@"CellInexpensive"];
      }

      v128 = NSNumber;
      v129 = [v7 objectForKeyedSubscript:@"Upload"];
      [v129 doubleValue];
      v131 = [v128 numberWithDouble:v95 + v92 + v130];
      [v8 setObject:v131 forKeyedSubscript:@"Upload"];

      v132 = NSNumber;
      v133 = [v7 objectForKeyedSubscript:@"Download"];
      [v133 doubleValue];
      v135 = [v132 numberWithDouble:v89 + v86 + v134];
      [v8 setObject:v135 forKeyedSubscript:@"Download"];

      double v71 = v89 + v95;
      double v74 = v86 + v92;
      goto LABEL_5;
    }
  }
  double v12 = [(_DASScheduler *)self extendUpdateActivityDictionary:v9];
  BOOL v13 = [v12 objectForKeyedSubscript:@"Expensive"];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = [v12 objectForKeyedSubscript:@"Inexpensive"];
  [v16 doubleValue];
  double v18 = v17;

  double v19 = [v12 objectForKeyedSubscript:@"Upload"];
  [v19 doubleValue];
  double v21 = v20;

  double v22 = [v12 objectForKeyedSubscript:@"Download"];
  [v22 doubleValue];
  double v24 = v23;

  double v25 = [v12 objectForKeyedSubscript:@"CellExpensive"];
  [v25 doubleValue];
  double v27 = v26;

  long long v28 = objc_msgSend(v12, "objectForKeyedSubscript:");
  [v28 doubleValue];
  double v30 = v29;

  double v31 = objc_msgSend(v12, "objectForKeyedSubscript:");
  [v31 doubleValue];
  double v33 = v32;

  double v34 = objc_msgSend(v12, "objectForKeyedSubscript:");
  [v34 doubleValue];
  double v36 = v35;

  double v37 = NSNumber;
  id v38 = [v7 objectForKeyedSubscript:@"Expensive"];
  [v38 doubleValue];
  double v40 = [v37 numberWithDouble:v15 + v39];
  [v8 setObject:v40 forKeyedSubscript:@"Expensive"];

  double v41 = NSNumber;
  double v42 = [v7 objectForKeyedSubscript:@"Inexpensive"];
  [v42 doubleValue];
  double v44 = [v41 numberWithDouble:v18 + v43];
  [v8 setObject:v44 forKeyedSubscript:@"Inexpensive"];

  v45 = NSNumber;
  double v46 = [v7 objectForKeyedSubscript:@"Upload"];
  [v46 doubleValue];
  double v48 = [v45 numberWithDouble:v21 + v47];
  [v8 setObject:v48 forKeyedSubscript:@"Upload"];

  v49 = NSNumber;
  v50 = [v7 objectForKeyedSubscript:@"Download"];
  [v50 doubleValue];
  double v52 = [v49 numberWithDouble:v24 + v51];
  [v8 setObject:v52 forKeyedSubscript:@"Download"];

  double v53 = NSNumber;
  double v54 = [v7 objectForKeyedSubscript:@"CellExpensive"];
  [v54 doubleValue];
  v56 = [v53 numberWithDouble:v27 + v55];
  [v8 setObject:v56 forKeyedSubscript:@"CellExpensive"];

  double v57 = NSNumber;
  double v58 = [v7 objectForKeyedSubscript:@"CellInexpensive"];
  [v58 doubleValue];
  v60 = [v57 numberWithDouble:v30 + v59];
  [v8 setObject:v60 forKeyedSubscript:@"CellInexpensive"];

  v61 = NSNumber;
  v62 = [v7 objectForKeyedSubscript:@"WiFiExpensive"];
  [v62 doubleValue];
  v64 = [v61 numberWithDouble:v33 + v63];
  [v8 setObject:v64 forKeyedSubscript:@"WiFiExpensive"];

  v65 = NSNumber;
  v66 = [v7 objectForKeyedSubscript:@"WiFiInexpensive"];
  [v66 doubleValue];
  v68 = [v65 numberWithDouble:v36 + v67];
  [v8 setObject:v68 forKeyedSubscript:@"WiFiInexpensive"];

  v69 = [v12 objectForKeyedSubscript:@"Cell"];
  [v69 doubleValue];
  double v71 = v70;

  double v72 = [v12 objectForKeyedSubscript:@"WiFi"];
  [v72 doubleValue];
  double v74 = v73;

LABEL_5:
  v75 = NSNumber;
  double v76 = [v7 objectForKeyedSubscript:@"WiFi"];
  [v76 doubleValue];
  v78 = [v75 numberWithDouble:v74 + v77];
  [v8 setObject:v78 forKeyedSubscript:@"WiFi"];

  long long v79 = NSNumber;
  long long v80 = [v7 objectForKeyedSubscript:@"Cell"];
  [v80 doubleValue];
  long long v82 = [v79 numberWithDouble:v71 + v81];
  [v8 setObject:v82 forKeyedSubscript:@"Cell"];

  return v8;
}

- (void)updateBytesConsumedForActivity:(id)a3 withParameters:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 dataBudgetingEnabled])
  {
    double v8 = self->_activityToDataMap;
    objc_sync_enter(v8);
    double v9 = [(NSMutableDictionary *)self->_activityToDataMap objectForKeyedSubscript:v6];
    if (!v9)
    {
      double v9 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    double v10 = [(_DASScheduler *)self dasFrameworkLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412802;
      id v24 = v6;
      __int16 v25 = 2112;
      double v26 = v9;
      __int16 v27 = 2112;
      long long v28 = v7;
      _os_log_debug_impl(&dword_1B578B000, v10, OS_LOG_TYPE_DEBUG, "Activity %@ had %@. Updating with new parameter: %@", (uint8_t *)&v23, 0x20u);
    }

    double v11 = [(_DASScheduler *)self evaluateBytesConsumed:v7 withPreviousParameters:v9];

    [(NSMutableDictionary *)self->_activityToDataMap setObject:v11 forKeyedSubscript:v6];
    double v12 = [v11 objectForKeyedSubscript:@"WiFi"];
    [v12 doubleValue];
    double v14 = v13;
    double v15 = [v11 objectForKeyedSubscript:@"Cell"];
    [v15 doubleValue];
    double v17 = v16;

    double v18 = v14 + v17;
    if (v18 > 1048576.0)
    {
      double v19 = [(_DASScheduler *)self dasFrameworkLog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        double v20 = [NSNumber numberWithDouble:v18];
        int v23 = 138412802;
        id v24 = v6;
        __int16 v25 = 2112;
        double v26 = v20;
        __int16 v27 = 2112;
        long long v28 = &unk_1F0E6ED58;
        _os_log_impl(&dword_1B578B000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ > %@", (uint8_t *)&v23, 0x20u);
      }
      double v21 = [(_DASScheduler *)self currentConnection];
      double v22 = [v21 remoteObjectProxy];
      [v22 updateActivity:v6 withParameters:v11];

      [v11 removeAllObjects];
    }
    objc_sync_exit(v8);
  }
}

- (void)createActivityGroup:(id)a3
{
  submissionManager = self->_submissionManager;
  id v5 = a3;
  [(_DASSubmissionManager *)submissionManager createActivityGroup:v5];
  id v7 = [(_DASScheduler *)self currentConnection];
  id v6 = [v7 remoteObjectProxy];
  [v6 createActivityGroup:v5];
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(_DASScheduler *)self submitActivityInternal:v6];
  double v8 = [v7 name];
  [v6 setGroupName:v8];

  double v9 = [(_DASScheduler *)self dasFrameworkLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [v7 name];
    int v14 = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    double v17 = v10;
    _os_log_impl(&dword_1B578B000, v9, OS_LOG_TYPE_DEFAULT, "SUBMITTING: %{public}@ in group %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if ([v6 preClearedMode])
  {
    double v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    [(_DASScheduler *)self runActivities:v11];
  }
  else
  {
    submissionManager = self->_submissionManager;
    double v11 = [(_DASScheduler *)self currentConnection];
    double v13 = [v11 remoteObjectProxy];
    [(_DASSubmissionManager *)submissionManager submitActivity:v6 inGroup:v7 withScheduler:v13];
  }
}

- (BOOL)submitActivity:(id)a3 inGroup:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [v8 setClientName:self->_clientName];
  double v10 = [MEMORY[0x1E4F1C9C8] now];
  [v8 setSubmitDate:v10];

  double v11 = self;
  objc_sync_enter(v11);
  if ([v8 requestsApplicationLaunch] && objc_msgSend(v8, "keepsPrevious"))
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    double v12 = v11->_submittedActivities;
    uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(v12);
          }
          __int16 v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (([v16 requestsApplicationLaunch] & 1) != 0
            && [v16 isIdenticalLaunchTo:v8])
          {
            if (os_log_type_enabled((os_log_t)v11->_dasFrameworkLog, OS_LOG_TYPE_ERROR)) {
              -[_DASScheduler submitActivity:inGroup:error:]();
            }
            if (a5)
            {
              *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_DASActivitySchedulerErrorDomain" code:5 userInfo:&unk_1F0E6EC28];
            }

            objc_sync_exit(v11);
            BOOL v30 = 0;
            goto LABEL_21;
          }
        }
        uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  objc_sync_exit(v11);

  double v17 = [(_DASScheduler *)v11 dasFrameworkLog];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1B578B000, v17, OS_LOG_TYPE_DEFAULT, "SUBMITTING: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v18 = +[_DASSubmissionRateLimiter sharedLimiter];
  [v18 trackActivity:v8];

  double v19 = v11;
  objc_sync_enter(v19);
  submittedActivities = v19->_submittedActivities;
  double v21 = [v8 uuid];
  [(NSMutableDictionary *)submittedActivities setObject:v8 forKeyedSubscript:v21];

  objc_sync_exit(v19);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v53 = 0x3032000000;
  double v54 = __Block_byref_object_copy__0;
  double v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  double v22 = [(_DASScheduler *)v19 currentConnection];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46___DASScheduler_submitActivity_inGroup_error___block_invoke;
  v40[3] = &unk_1E6112FD0;
  double v42 = &v44;
  v40[4] = v19;
  id v23 = v8;
  id v41 = v23;
  p_long long buf = &buf;
  id v24 = [v22 synchronousRemoteObjectProxyWithErrorHandler:v40];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  double v34 = __46___DASScheduler_submitActivity_inGroup_error___block_invoke_311;
  double v35 = &unk_1E6112FF8;
  id v38 = &v44;
  double v36 = v19;
  id v25 = v23;
  id v37 = v25;
  double v39 = &buf;
  [v24 submitActivity:v25 inGroup:v9 withHandler:&v32];

  if (!*((unsigned char *)v45 + 24))
  {
    double v26 = v19;
    objc_sync_enter(v26);
    __int16 v27 = v19->_submittedActivities;
    long long v28 = objc_msgSend(v25, "uuid", v32, v33, v34, v35, v36);
    [(NSMutableDictionary *)v27 removeObjectForKey:v28];

    objc_sync_exit(v26);
  }
  if (a5)
  {
    uint64_t v29 = *(void **)(*((void *)&buf + 1) + 40);
    if (v29) {
      *a5 = v29;
    }
  }
  BOOL v30 = *((unsigned char *)v45 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v44, 8);
LABEL_21:

  return v30;
}

- (BOOL)deferActivities:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33___DASScheduler_deferActivities___block_invoke;
  v9[3] = &unk_1E6113020;
  v9[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33___DASScheduler_deferActivities___block_invoke_313;
  v8[3] = &unk_1E6113048;
  v8[4] = &v10;
  [v6 deferActivities:v4 withHandler:v8];

  LOBYTE(v5) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v5;
}

- (NSMutableDictionary)submittedActivities
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  char v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v3 = [(_DASScheduler *)self currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36___DASScheduler_submittedActivities__block_invoke;
  v8[3] = &unk_1E6113020;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36___DASScheduler_submittedActivities__block_invoke_315;
  v7[3] = &unk_1E6113070;
  v7[4] = &v9;
  [v4 submittedActivitiesWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSMutableDictionary *)v5;
}

- (id)delayedRunningActivities
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  __int16 v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41___DASScheduler_delayedRunningActivities__block_invoke;
  v9[3] = &unk_1E6113098;
  uint64_t v11 = &v12;
  id v5 = v3;
  uint64_t v10 = v5;
  [v4 delayedRunningActivitiesWithHandler:v9];

  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)runningActivities
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(_DASScheduler *)self currentConnection];
  id v5 = [v4 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34___DASScheduler_runningActivities__block_invoke;
  v10[3] = &unk_1E6113098;
  uint64_t v12 = &v13;
  dispatch_time_t v6 = v3;
  uint64_t v11 = v6;
  [v5 runningActivitiesWithHandler:v10];

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)runningGroupActivities
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(_DASScheduler *)self currentConnection];
  id v5 = [v4 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39___DASScheduler_runningGroupActivities__block_invoke;
  v10[3] = &unk_1E6113098;
  uint64_t v12 = &v13;
  dispatch_time_t v6 = v3;
  uint64_t v11 = v6;
  [v5 runningGroupActivitiesWithHandler:v10];

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)forceRunActivities:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36___DASScheduler_forceRunActivities___block_invoke;
  v7[3] = &unk_1E6113020;
  v7[4] = self;
  dispatch_time_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 forceRunActivities:v4];
}

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = [(_DASScheduler *)self currentConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53___DASScheduler_runActivitiesWithUrgency_activities___block_invoke;
  v9[3] = &unk_1E6113020;
  void v9[4] = self;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v9];
  [v8 runActivitiesWithUrgency:a3 activities:v6];
}

- (id)scoresForActivityWithName:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)activityRunStatistics
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)currentPredictions
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = (id)MEMORY[0x1E4F1CC08];
  dispatch_semaphore_t v3 = [(_DASScheduler *)self currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35___DASScheduler_currentPredictions__block_invoke;
  v8[3] = &unk_1E6113020;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35___DASScheduler_currentPredictions__block_invoke_317;
  v7[3] = &unk_1E61130C0;
  v7[4] = &v9;
  [v4 currentPredictionsWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)statistics
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  dispatch_semaphore_t v3 = [(_DASScheduler *)self currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27___DASScheduler_statistics__block_invoke;
  v8[3] = &unk_1E6113020;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27___DASScheduler_statistics__block_invoke_319;
  v7[3] = &unk_1E61130C0;
  v7[4] = &v9;
  [v4 statisticsWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  dispatch_time_t v7 = [(_DASScheduler *)self currentConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke;
  v12[3] = &unk_1E6113020;
  v12[4] = self;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke_320;
  v11[3] = &unk_1E61130E8;
  v11[4] = &v13;
  [v8 resetFastPassActivities:v6 resetAll:v4 withHandler:v11];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)inspect:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25___DASScheduler_inspect___block_invoke;
  v10[3] = &unk_1E6113020;
  void v10[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25___DASScheduler_inspect___block_invoke_322;
  v9[3] = &unk_1E6113070;
  void v9[4] = &v11;
  [v6 inspect:v4 withHandler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)resubmitRunningTasks:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __38___DASScheduler_resubmitRunningTasks___block_invoke;
  uint64_t v11 = &unk_1E6113110;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "resubmitRunningTasks:", v6, v8, v9, v10, v11, v12);
}

- (void)forceResetOfResultIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46___DASScheduler_forceResetOfResultIdentifier___block_invoke;
  v7[3] = &unk_1E6113020;
  v7[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 forceResetOfResultIdentifier:v4];
}

- (id)queryStatusOfResultIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke;
  v11[3] = &unk_1E6113110;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke_323;
  v10[3] = &unk_1E61130C0;
  void v10[4] = &v13;
  [v7 queryStatusOfResultIdentifier:v6 withHandler:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)queryDependenciesOfTaskIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke;
  v11[3] = &unk_1E6113110;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke_324;
  v10[3] = &unk_1E61130C0;
  void v10[4] = &v13;
  [v7 queryDependenciesOfTaskIdentifier:v6 withHandler:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)allBudgets
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  dispatch_semaphore_t v3 = [(_DASScheduler *)self currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27___DASScheduler_allBudgets__block_invoke;
  v8[3] = &unk_1E6113020;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27___DASScheduler_allBudgets__block_invoke_325;
  v7[3] = &unk_1E6113070;
  v7[4] = &v9;
  [v4 allBudgetsWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42___DASScheduler_balanceForBudgetWithName___block_invoke;
  v11[3] = &unk_1E6113110;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42___DASScheduler_balanceForBudgetWithName___block_invoke_326;
  v10[3] = &unk_1E6113138;
  void v10[4] = &v13;
  [v7 balanceForBudgetWithName:v6 withHandler:v10];

  double v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  id v7 = [(_DASScheduler *)self currentConnection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __46___DASScheduler_setBalance_forBudgetWithName___block_invoke;
  uint64_t v13 = &unk_1E6113110;
  id v14 = self;
  id v15 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "setBalance:forBudgetWithName:", v8, a3, v10, v11, v12, v13, v14);
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  id v7 = [(_DASScheduler *)self currentConnection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __47___DASScheduler_decrementBy_forBudgetWithName___block_invoke;
  uint64_t v13 = &unk_1E6113110;
  id v14 = self;
  id v15 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "decrementBy:forBudgetWithName:", v8, a3, v10, v11, v12, v13, v14);
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  id v7 = [(_DASScheduler *)self currentConnection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __47___DASScheduler_setCapacity_forBudgetWithName___block_invoke;
  uint64_t v13 = &unk_1E6113110;
  id v14 = self;
  id v15 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "setCapacity:forBudgetWithName:", v8, a3, v10, v11, v12, v13, v14);
}

- (id)policies
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  dispatch_semaphore_t v3 = [(_DASScheduler *)self currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25___DASScheduler_policies__block_invoke;
  v8[3] = &unk_1E6113020;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25___DASScheduler_policies__block_invoke_328;
  v7[3] = &unk_1E61130C0;
  v7[4] = &v9;
  [v4 policiesWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)clasStatus
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  dispatch_semaphore_t v3 = [(_DASScheduler *)self currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27___DASScheduler_clasStatus__block_invoke;
  v8[3] = &unk_1E6113020;
  v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27___DASScheduler_clasStatus__block_invoke_329;
  v7[3] = &unk_1E61130C0;
  v7[4] = &v9;
  [v4 clasStatusWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)evaluatePolicies:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34___DASScheduler_evaluatePolicies___block_invoke;
  v11[3] = &unk_1E6113110;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34___DASScheduler_evaluatePolicies___block_invoke_330;
  v10[3] = &unk_1E61130C0;
  void v10[4] = &v13;
  [v7 evaluatePolicies:v6 handler:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)evaluateAllActivitiesWithHandle:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v5 = [(_DASScheduler *)self currentConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke;
  v9[3] = &unk_1E6113160;
  void v9[4] = self;
  void v9[5] = &v10;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_331;
  v8[3] = &unk_1E6113188;
  v8[4] = self;
  void v8[5] = &v10;
  [v6 evaluateAllActivities:v4 handler:v8];

  LOBYTE(self) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)self;
}

- (id)runProceedableActivities:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42___DASScheduler_runProceedableActivities___block_invoke;
  v11[3] = &unk_1E6113110;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42___DASScheduler_runProceedableActivities___block_invoke_332;
  v10[3] = &unk_1E61130C0;
  void v10[4] = &v13;
  [v7 runProceedableActivities:v6 handler:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)blockingPoliciesWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48___DASScheduler_blockingPoliciesWithParameters___block_invoke;
  v10[3] = &unk_1E6113020;
  void v10[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___DASScheduler_blockingPoliciesWithParameters___block_invoke_333;
  v9[3] = &unk_1E6113070;
  void v9[4] = &v11;
  [v6 blockingPoliciesWithParameters:v4 handler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (id)activityContainsOverrides:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___DASScheduler_activityContainsOverrides___block_invoke;
  v10[3] = &unk_1E6113020;
  void v10[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43___DASScheduler_activityContainsOverrides___block_invoke_334;
  v9[3] = &unk_1E61130C0;
  void v9[4] = &v11;
  [v6 activityContainsOverrides:v4 handler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_DASScheduler *)self currentConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke;
  v12[3] = &unk_1E6113020;
  v12[4] = self;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_335;
  v10[3] = &unk_1E61131B0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 enterTestModeWithParameters:v9 reset:v4 handler:v10];
}

- (BOOL)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v7 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke;
  v11[3] = &unk_1E61131D8;
  v11[4] = self;
  char v12 = v4;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke_336;
  v10[3] = &unk_1E6113048;
  void v10[4] = &v13;
  [v8 enableTaskRegistryMode:v4 processes:v6 handler:v10];

  LOBYTE(v4) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v4;
}

- (void)submitRateLimitConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46___DASScheduler_submitRateLimitConfiguration___block_invoke;
  v10[3] = &unk_1E6113020;
  void v10[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46___DASScheduler_submitRateLimitConfiguration___block_invoke_337;
  v8[3] = &unk_1E61131B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 submitRateLimitConfiguration:v7 handler:v8];
}

- (void)pauseWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37___DASScheduler_pauseWithParameters___block_invoke;
  v10[3] = &unk_1E6113020;
  void v10[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37___DASScheduler_pauseWithParameters___block_invoke_338;
  v8[3] = &unk_1E61131B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 pauseWithParameters:v7 handler:v8];
}

- (void)addPauseExceptParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41___DASScheduler_addPauseExceptParameter___block_invoke;
  v10[3] = &unk_1E6113020;
  void v10[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41___DASScheduler_addPauseExceptParameter___block_invoke_339;
  v8[3] = &unk_1E61131B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 addPauseExceptParameter:v7 handler:v8];
}

- (void)runActivitiesWithDelayedStart:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  double v31 = (void *)[v4 mutableCopy];
  uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
  id v6 = self;
  objc_sync_enter(v6);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        submittedActivities = v6->_submittedActivities;
        char v12 = [v10 uuid];
        uint64_t v13 = [(NSMutableDictionary *)submittedActivities objectForKeyedSubscript:v12];

        if (v13)
        {
          if ([v10 delayedStart]) {
            id v14 = v5;
          }
          else {
            id v14 = v32;
          }
          [v14 addObject:v13];
          [v31 removeObject:v13];
          uint64_t v15 = v6->_submittedActivities;
          char v16 = [v10 uuid];
          [(NSMutableDictionary *)v15 removeObjectForKey:v16];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v7);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v29 = v5;
  uint64_t v17 = [v29 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v29);
        }
        double v20 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        delayedStartTasks = v6->_delayedStartTasks;
        double v22 = [v20 uuid];
        [(NSMutableDictionary *)delayedStartTasks setObject:v20 forKeyedSubscript:v22];

        runQueue = [v20 handlerQueue];
        id v24 = runQueue;
        if (!runQueue) {
          runQueue = v6->_runQueue;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47___DASScheduler_runActivitiesWithDelayedStart___block_invoke;
        block[3] = &unk_1E6112B60;
        block[4] = v6;
        block[5] = v20;
        dispatch_async(runQueue, block);
      }
      uint64_t v17 = [v29 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v17);
  }

  objc_sync_exit(v6);
  if ([v31 count])
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = NSNumber;
      __int16 v27 = dasFrameworkLog;
      long long v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
      *(_DWORD *)long long buf = 138412546;
      double v43 = v28;
      __int16 v44 = 2112;
      v45 = v31;
      _os_log_impl(&dword_1B578B000, v27, OS_LOG_TYPE_DEFAULT, "runActivitiesWithDelayedStart: %@ activities were not found: %@", buf, 0x16u);
    }
  }
  if ([v32 count]) {
    [(_DASScheduler *)v6 runActivities:v32];
  }
}

- (void)runActivities:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v42 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v41 = (void *)[v4 mutableCopy];
  id v6 = self;
  objc_sync_enter(v6);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        submittedActivities = v6->_submittedActivities;
        char v12 = [v10 uuid];
        uint64_t v13 = [(NSMutableDictionary *)submittedActivities objectForKeyedSubscript:v12];

        if (v13)
        {
          [v5 addObject:v13];
          [v41 removeObject:v13];
          id v14 = v6->_submittedActivities;
          uint64_t v15 = [v10 uuid];
          [(NSMutableDictionary *)v14 removeObjectForKey:v15];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v7);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v39 = v5;
  uint64_t v16 = [v39 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(v39);
        }
        double v19 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        startedActivities = v6->_startedActivities;
        double v21 = [v19 uuid];
        [(NSMutableDictionary *)startedActivities setObject:v19 forKeyedSubscript:v21];

        double v22 = [v19 handlerQueue];
        runQueue = v22;
        if (!v22) {
          runQueue = v6->_runQueue;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __31___DASScheduler_runActivities___block_invoke;
        block[3] = &unk_1E6113200;
        block[4] = v19;
        id v52 = v42;
        uint64_t v53 = v6;
        dispatch_async(runQueue, block);
      }
      uint64_t v16 = [v39 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v16);
  }

  id v24 = [MEMORY[0x1E4F1CA80] set];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v25 = v41;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v67 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(void **)(*((void *)&v47 + 1) + 8 * k);
        if ([v29 isContinuedProcessingTask]) {
          [v24 addObject:v29];
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v67 count:16];
    }
    while (v26);
  }

  if ([v24 count])
  {
    BOOL v30 = [(_DASScheduler *)v6 backgroundTaskSchedulerDelegate];
    [v30 scheduler:v6 handleLaunchForActivities:v24];
  }
  [v25 minusSet:v24];

  objc_sync_exit(v6);
  if ([v25 count])
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = NSNumber;
      uint64_t v33 = dasFrameworkLog;
      long long v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      *(_DWORD *)long long buf = 138412546;
      v64 = v34;
      __int16 v65 = 2112;
      id v66 = v25;
      _os_log_impl(&dword_1B578B000, v33, OS_LOG_TYPE_DEFAULT, "runActivities: %@ activities were not found: %@", buf, 0x16u);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v35 = v25;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v62 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v44;
      do
      {
        for (uint64_t m = 0; m != v36; ++m)
        {
          if (*(void *)v44 != v37) {
            objc_enumerationMutation(v35);
          }
          [(_DASScheduler *)v6 activityCanceled:*(void *)(*((void *)&v43 + 1) + 8 * m)];
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v62 count:16];
      }
      while (v36);
    }
  }
}

- (void)suspendActivities:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = self;
  objc_sync_enter(v6);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v42;
    *(void *)&long long v9 = 138543362;
    long long v32 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        startedActivities = v6->_startedActivities;
        id v14 = objc_msgSend(v12, "uuid", v32);
        uint64_t v15 = [(NSMutableDictionary *)startedActivities objectForKeyedSubscript:v14];

        if (v15)
        {
          [v5 removeObject:v15];
          uint64_t v16 = [v15 suspendRequestDate];
          BOOL v17 = v16 == 0;

          if (v17)
          {
            double v19 = [v15 handlerQueue];
            runQueue = v19;
            if (!v19) {
              runQueue = v6->_runQueue;
            }
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __35___DASScheduler_suspendActivities___block_invoke;
            block[3] = &unk_1E6113200;
            long long v38 = v15;
            id v39 = v6;
            long long v40 = v12;
            dispatch_async(runQueue, block);

            uint64_t v18 = v38;
          }
          else
          {
            uint64_t v18 = [(_DASScheduler *)v6 dasFrameworkLog];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v32;
              long long v46 = v15;
              _os_log_impl(&dword_1B578B000, v18, OS_LOG_TYPE_DEFAULT, "Already requested suspension for %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v8);
  }

  double v21 = [MEMORY[0x1E4F1CA80] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v5;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if ([v26 isContinuedProcessingTask]) {
          [v21 addObject:v26];
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v23);
  }

  if ([v21 count])
  {
    uint64_t v27 = [(_DASScheduler *)v6 backgroundTaskSchedulerDelegate];
    [v27 scheduler:v6 willExpireActivities:v21];
  }
  [v22 minusSet:v21];

  objc_sync_exit(v6);
  if ([v22 count])
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = NSNumber;
      BOOL v30 = dasFrameworkLog;
      double v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
      *(_DWORD *)long long buf = 138412546;
      long long v46 = v31;
      __int16 v47 = 2112;
      id v48 = v22;
      _os_log_impl(&dword_1B578B000, v30, OS_LOG_TYPE_DEFAULT, "suspendActivities: %@ activities were not running: %@", buf, 0x16u);
    }
  }
}

- (void)cancelActivities:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = self;
  objc_sync_enter(v6);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        submittedActivities = v6->_submittedActivities;
        uint64_t v13 = objc_msgSend(v11, "uuid", (void)v30);
        id v14 = [(NSMutableDictionary *)submittedActivities objectForKeyedSubscript:v13];

        if (v14) {
          goto LABEL_9;
        }
        startedActivities = v6->_startedActivities;
        uint64_t v16 = [v11 uuid];
        id v14 = [(NSMutableDictionary *)startedActivities objectForKeyedSubscript:v16];

        if (v14
          || (BOOL v17 = v6->_delayedStartTasks,
              [v11 uuid],
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              [(NSMutableDictionary *)v17 objectForKeyedSubscript:v18],
              id v14 = objc_claimAutoreleasedReturnValue(),
              v18,
              v14))
        {
LABEL_9:
          double v19 = v6->_submittedActivities;
          double v20 = [v11 uuid];
          [(NSMutableDictionary *)v19 removeObjectForKey:v20];

          double v21 = v6->_startedActivities;
          id v22 = [v11 uuid];
          [(NSMutableDictionary *)v21 removeObjectForKey:v22];

          delayedStartTasks = v6->_delayedStartTasks;
          uint64_t v24 = [v11 uuid];
          [(NSMutableDictionary *)delayedStartTasks removeObjectForKey:v24];
        }
        else
        {
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v25 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
      uint64_t v8 = v25;
    }
    while (v25);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = NSNumber;
      long long v28 = dasFrameworkLog;
      id v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      *(_DWORD *)long long buf = 138412546;
      long long v35 = v29;
      __int16 v36 = 2112;
      uint64_t v37 = v5;
      _os_log_impl(&dword_1B578B000, v28, OS_LOG_TYPE_DEFAULT, "cancelActivities: %@ activities were not found: %@", buf, 0x16u);
    }
  }
}

- (BOOL)wasActivityAllowedToRun:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  delayedStartTasks = v5->_delayedStartTasks;
  id v7 = [v4 uuid];
  uint64_t v8 = [(NSMutableDictionary *)delayedStartTasks objectForKeyedSubscript:v7];
  LOBYTE(delayedStartTasks) = v8 != 0;

  objc_sync_exit(v5);
  return (char)delayedStartTasks;
}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_DASScheduler *)self dasFrameworkLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1B578B000, v8, OS_LOG_TYPE_DEFAULT, "Activity: %@ ignoring policies: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_DASScheduler *)self dasFrameworkLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1B578B000, v8, OS_LOG_TYPE_DEFAULT, "Activity: %@ blocked on policies: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(_DASScheduler *)self currentConnection];
  uint64_t v8 = [v9 remoteObjectProxy];
  [v8 endLaunchWithReason:v7 forApp:v6];
}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(_DASScheduler *)self currentConnection];
  uint64_t v8 = [v9 remoteObjectProxy];
  [v8 backgroundAppRefreshEnabledForApp:v7 withHandler:v6];
}

- (void)disableAppRefreshForApps:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___DASScheduler_disableAppRefreshForApps___block_invoke;
  v7[3] = &unk_1E6113020;
  v7[4] = self;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 disableAppRefreshForApps:v4];
}

- (id)submitTaskRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Submitting task request activity: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setSubmitDate:v6];

  id v7 = [(_DASScheduler *)self currentConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35___DASScheduler_submitTaskRequest___block_invoke;
  v12[3] = &unk_1E6113160;
  v12[4] = self;
  void v12[5] = &buf;
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35___DASScheduler_submitTaskRequest___block_invoke_346;
  v11[3] = &unk_1E6112FA8;
  v11[4] = &buf;
  [v8 submitTaskRequest:v4 withHandler:v11];

  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v9;
}

- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61___DASScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6113228;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61___DASScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6113250;
  id v10 = v6;
  id v8 = v6;
  [v7 getPendingTaskRequestsWithCompletionHandler:v9];
}

- (void)handleLaunchFromDaemonForActivities:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Handling launch from daemon for activities: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(_DASScheduler *)self backgroundTaskSchedulerDelegate];
  [v6 scheduler:self handleLaunchForActivities:v4];
}

- (void)willExpireBGTaskActivities:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Will expire BGTask activities: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(_DASScheduler *)self backgroundTaskSchedulerDelegate];
  [v6 scheduler:self willExpireActivities:v4];
}

- (void)completeTaskRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Complete task request activity: %@", buf, 0xCu);
  }

  id v6 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37___DASScheduler_completeTaskRequest___block_invoke;
  v11[3] = &unk_1E6113020;
  void v11[4] = self;
  int v7 = [v6 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37___DASScheduler_completeTaskRequest___block_invoke_349;
  v9[3] = &unk_1E6112B60;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 completeTaskRequest:v8 completionHandler:v9];
}

- (void)updateOngoingTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(_DASScheduler *)self currentConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35___DASScheduler_updateOngoingTask___block_invoke;
    v9[3] = &unk_1E6113020;
    void v9[4] = self;
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___DASScheduler_updateOngoingTask___block_invoke_350;
    v7[3] = &unk_1E6112B60;
    v7[4] = self;
    id v8 = v4;
    [v6 updateOngoingTask:v8 completionHandler:v7];
  }
}

- (void)updateProgress:(id)a3 forOngoingTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    [v7 setProgress:v6];
    uint64_t v9 = [(_DASScheduler *)self currentConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47___DASScheduler_updateProgress_forOngoingTask___block_invoke;
    v14[3] = &unk_1E6113020;
    v14[4] = self;
    id v10 = [v9 remoteObjectProxyWithErrorHandler:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_351;
    v11[3] = &unk_1E6113200;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v8;
    [v10 updateProgressForOngoingTask:v13 completionHandler:v11];
  }
}

- (BOOL)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  id v7 = [(_DASScheduler *)self currentConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke;
  v17[3] = &unk_1E6113278;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  double v19 = &v21;
  double v20 = &v27;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke_352;
  v13[3] = &unk_1E61132A0;
  uint64_t v16 = &v27;
  uint64_t v15 = &v21;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  [v9 acknowledgeSystemTaskLaunchWithIdentifier:v10 completionHandler:v13];

  if (a4) {
    *a4 = (id) v22[5];
  }
  char v11 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4
{
  id v6 = a3;
  id v7 = [(_DASScheduler *)self currentConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke;
  v13[3] = &unk_1E6113110;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_353;
  v11[3] = &unk_1E6112B60;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 acknowledgeSystemTaskSuspensionWithIdentifier:v10 retryAfter:v11 completionHandler:a4];
}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96___DASScheduler_handleClientLedSystemTaskExpirationWithIdentifier_retryAfter_completionHandler___block_invoke;
  v14[3] = &unk_1E61132C8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 handleClientLedSystemTaskExpirationWithIdentifier:v12 retryAfter:v11 completionHandler:a4];
}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(_DASScheduler *)self currentConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___DASScheduler_submitTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke;
  v15[3] = &unk_1E61132C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 submitTaskRequestWithIdentifier:v13 descriptor:v10 completionHandler:v12];
}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(_DASScheduler *)self currentConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___DASScheduler_updateTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke;
  v15[3] = &unk_1E61132C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 updateTaskRequestWithIdentifier:v13 descriptor:v10 completionHandler:v12];
}

- (void)completeSystemTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke;
  v11[3] = &unk_1E6113110;
  void v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_354;
  v9[3] = &unk_1E6112B60;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 completeSystemTaskWithIdentifier:v8 completionHandler:v9];
}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DASScheduler *)self currentConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70___DASScheduler_unregisterSystemTaskWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E61132C8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 unregisterSystemTaskWithIdentifier:v10 completionHandler:v9];
}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DASScheduler *)self currentConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70___DASScheduler_resumeTaskSchedulingWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E61132C8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 resumeTaskSchedulingWithIdentifier:v10 completionHandler:v9];
}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(_DASScheduler *)self currentConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82___DASScheduler_reportSystemTaskWithIdentifier_consumedResults_completionHandler___block_invoke;
  v15[3] = &unk_1E61132C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 reportSystemTaskWithIdentifier:v13 consumedResults:v10 completionHandler:v12];
}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(_DASScheduler *)self currentConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82___DASScheduler_reportSystemTaskWithIdentifier_producedResults_completionHandler___block_invoke;
  v15[3] = &unk_1E61132C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 reportSystemTaskWithIdentifier:v13 producedResults:v10 completionHandler:v12];
}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_DASScheduler *)self currentConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_1E61132F0;
  v23[4] = self;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  id v14 = v10;
  id v26 = v14;
  id v15 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v23];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_355;
  v19[3] = &unk_1E6113318;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  [v15 resetResultsForIdentifier:v18 byTaskWithIdentifier:v17 completionHandler:v19];
}

- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v17 = [(_DASScheduler *)self currentConnection];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __100___DASScheduler_reportTaskWorkloadProgress_target_completed_category_subCategory_completionHandler___block_invoke;
  uint64_t v23 = &unk_1E6113340;
  id v24 = self;
  id v25 = v14;
  id v18 = v14;
  double v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:&v20];
  objc_msgSend(v19, "reportTaskWorkloadProgress:target:completed:category:subCategory:completionHandler:", v16, a4, a5, a6, v15, v18, v20, v21, v22, v23, v24);
}

- (void)resubmitRunningActivities:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          delayedStartTasks = v5->_delayedStartTasks;
          id v12 = objc_msgSend(v10, "uuid", (void)v19);
          [(NSMutableDictionary *)delayedStartTasks removeObjectForKey:v12];

          submittedActivities = v5->_submittedActivities;
          id v14 = [v10 uuid];
          [(NSMutableDictionary *)submittedActivities removeObjectForKey:v14];

          startedActivities = v5->_startedActivities;
          id v16 = [v10 uuid];
          [(NSMutableDictionary *)startedActivities setObject:v10 forKeyedSubscript:v16];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    objc_sync_exit(v5);
    id v17 = [(_DASScheduler *)v5 xpcConnection];
    id v18 = [v17 remoteObjectProxy];
    [v18 startedActivities:v6];
  }
}

- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke;
  v14[3] = &unk_1E6113368;
  v14[4] = self;
  void v14[5] = &v19;
  v14[6] = &v15;
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_362;
  v13[3] = &unk_1E6113390;
  v13[4] = self;
  void v13[5] = &v19;
  v13[6] = &v15;
  [v10 reportFeatureCheckpoint:a3 forFeature:a4 withHandler:v13];

  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (BOOL)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5
{
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke;
  v14[3] = &unk_1E6113368;
  v14[4] = self;
  void v14[5] = &v19;
  v14[6] = &v15;
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_363;
  v13[3] = &unk_1E6113390;
  v13[4] = self;
  void v13[5] = &v19;
  v13[6] = &v15;
  [v10 reportSystemWorkload:a3 ofCategory:a4 withHandler:v13];

  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (BOOL)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke;
  v14[3] = &unk_1E6113368;
  v14[4] = self;
  void v14[5] = &v19;
  v14[6] = &v15;
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_364;
  v13[3] = &unk_1E6113390;
  v13[4] = self;
  void v13[5] = &v19;
  v13[6] = &v15;
  [v10 reportCustomCheckpoint:a3 forTask:v8 withHandler:v13];

  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (void)activityStoppedWithParameters:(id)a3
{
  id v4 = a3;
  id v6 = [(_DASScheduler *)self currentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 activityStoppedWithParameters:v4];
}

- (void)prewarmApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __36___DASScheduler_prewarmApplication___block_invoke;
  char v11 = &unk_1E6113110;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "prewarmApplication:", v6, v8, v9, v10, v11, v12);
}

- (void)prewarmSuspendWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASScheduler *)self currentConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __43___DASScheduler_prewarmSuspendWithHandler___block_invoke;
  char v11 = &unk_1E6113340;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "prewarmSuspendWithHandler:", v6, v8, v9, v10, v11, v12);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  uint64_t v7 = [v5 interfaceWithProtocol:&unk_1F0E74B98];
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (BOOL)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v8 = [(_DASScheduler *)self currentConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke;
  v18[3] = &unk_1E6113110;
  v18[4] = self;
  id v9 = v7;
  id v19 = v9;
  id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_365;
  v14[3] = &unk_1E61133B8;
  v14[4] = self;
  id v11 = v6;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  uint64_t v17 = &v20;
  [v10 deleteLimitForActivity:v11 forLimiterWithName:v12 handler:v14];

  LOBYTE(v8) = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return (char)v8;
}

- (BOOL)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v10 = [(_DASScheduler *)self currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke;
  v20[3] = &unk_1E6113110;
  v20[4] = self;
  id v11 = v9;
  id v21 = v11;
  id v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_366;
  v16[3] = &unk_1E61133B8;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v11;
  id v18 = v14;
  id v19 = &v22;
  [v12 updateLimit:v13 forActivity:v14 forLimiterWithName:v16 handler:a3];

  LOBYTE(v10) = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v10;
}

- (id)getLimiterResponseForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47___DASScheduler_getLimiterResponseForActivity___block_invoke;
  v14[3] = &unk_1E6113110;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47___DASScheduler_getLimiterResponseForActivity___block_invoke_367;
  v11[3] = &unk_1E61133E0;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v16;
  [v7 getLimiterResponseForActivity:v8 handler:v11];

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (double)getRuntimeLimit:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v19 = 0xBFF0000000000000;
  id v5 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33___DASScheduler_getRuntimeLimit___block_invoke;
  v14[3] = &unk_1E6113110;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33___DASScheduler_getRuntimeLimit___block_invoke_368;
  v11[3] = &unk_1E6113408;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v16;
  [v7 getRuntimeLimit:v8 handler:v11];

  double v9 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (id)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  id v11 = [(_DASScheduler *)self currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke;
  v20[3] = &unk_1E6113110;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_369;
  v17[3] = &unk_1E6113430;
  v17[4] = self;
  id v14 = v12;
  id v18 = v14;
  unint64_t v19 = &v22;
  [v13 getElapsedRuntimes:v14 timeFilter:v9 bgsqlData:v10 handler:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  id v11 = [(_DASScheduler *)self currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke;
  v20[3] = &unk_1E6113110;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_370;
  v17[3] = &unk_1E6113430;
  v17[4] = self;
  id v14 = v12;
  id v18 = v14;
  unint64_t v19 = &v22;
  [v13 getEstimatedRuntimes:v14 timeFilter:v9 bgsqlData:v10 handler:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)getConditionsPenalties:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  unint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v5 = [(_DASScheduler *)self currentConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40___DASScheduler_getConditionsPenalties___block_invoke;
  v14[3] = &unk_1E6113110;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40___DASScheduler_getConditionsPenalties___block_invoke_371;
  v11[3] = &unk_1E6113430;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v16;
  [v7 getConditionsPenalties:v8 handler:v11];

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  id v11 = [(_DASScheduler *)self currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke;
  v20[3] = &unk_1E6113110;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_372;
  v17[3] = &unk_1E6113430;
  v17[4] = self;
  id v14 = v12;
  id v18 = v14;
  unint64_t v19 = &v22;
  [v13 getFeatureTimelines:v14 timeFilter:v9 bgsqlData:v10 handler:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  id v11 = [(_DASScheduler *)self currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke;
  v20[3] = &unk_1E6113110;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_373;
  v17[3] = &unk_1E6113430;
  v17[4] = self;
  id v14 = v12;
  id v18 = v14;
  unint64_t v19 = &v22;
  [v13 getActivityTimelines:v14 timeFilter:v9 bgsqlData:v10 handler:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v8 = [(_DASScheduler *)self currentConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke;
  v13[3] = &unk_1E6113020;
  v13[4] = self;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_374;
  v12[3] = &unk_1E6113458;
  v12[4] = self;
  void v12[5] = &v14;
  [v9 getDeviceConditionTimelines:v6 bgsqlData:v7 handler:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (id)getInstallTimeline:(id)a3 bgsqlData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v8 = [(_DASScheduler *)self currentConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46___DASScheduler_getInstallTimeline_bgsqlData___block_invoke;
  v13[3] = &unk_1E6113020;
  v13[4] = self;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46___DASScheduler_getInstallTimeline_bgsqlData___block_invoke_375;
  v12[3] = &unk_1E6113480;
  v12[4] = self;
  void v12[5] = &v14;
  [v9 getInstallTimeline:v6 bgsqlData:v7 handler:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (id)getBuddyEvents:(id)a3 bgsqlData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v8 = [(_DASScheduler *)self currentConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42___DASScheduler_getBuddyEvents_bgsqlData___block_invoke;
  v13[3] = &unk_1E6113020;
  v13[4] = self;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42___DASScheduler_getBuddyEvents_bgsqlData___block_invoke_376;
  v12[3] = &unk_1E6113480;
  v12[4] = self;
  void v12[5] = &v14;
  [v9 getBuddyEvents:v6 bgsqlData:v7 handler:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (id)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  id v11 = [(_DASScheduler *)self currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke;
  v20[3] = &unk_1E6113110;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_377;
  v17[3] = &unk_1E6113430;
  v17[4] = self;
  id v14 = v12;
  id v18 = v14;
  id v19 = &v22;
  [v13 getEstimatedMADCompletionTimes:v14 endDate:v9 bgsqlData:v10 handler:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (int)resubmitToken
{
  return self->_resubmitToken;
}

- (void)setResubmitToken:(int)a3
{
  self->_resubmitToken = a3;
}

- (void)setSubmittedActivities:(id)a3
{
}

- (NSMutableDictionary)delayedStartTasks
{
  return self->_delayedStartTasks;
}

- (void)setDelayedStartTasks:(id)a3
{
}

- (NSMutableDictionary)startedActivities
{
  return self->_startedActivities;
}

- (void)setStartedActivities:(id)a3
{
}

- (NSMutableDictionary)activityToDataMap
{
  return self->_activityToDataMap;
}

- (void)setActivityToDataMap:(id)a3
{
}

- (_DASSubmissionManager)submissionManager
{
  return self->_submissionManager;
}

- (void)setSubmissionManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)connectionCreationQueue
{
  return self->_connectionCreationQueue;
}

- (void)setConnectionCreationQueue:(id)a3
{
}

- (OS_dispatch_queue)runQueue
{
  return self->_runQueue;
}

- (void)setRunQueue:(id)a3
{
}

- (void)setDasFrameworkLog:(id)a3
{
}

- (_DASActivityBackgroundTasksSchedulerDelegate)backgroundTaskSchedulerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundTaskSchedulerDelegate);

  return (_DASActivityBackgroundTasksSchedulerDelegate *)WeakRetained;
}

- (void)setBackgroundTaskSchedulerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundTaskSchedulerDelegate);
  objc_storeStrong((id *)&self->_dasFrameworkLog, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
  objc_storeStrong((id *)&self->_connectionCreationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_submissionManager, 0);
  objc_storeStrong((id *)&self->_activityToDataMap, 0);
  objc_storeStrong((id *)&self->_startedActivities, 0);
  objc_storeStrong((id *)&self->_delayedStartTasks, 0);
  objc_storeStrong((id *)&self->_submittedActivities, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

- (void)submitActivityInternal:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = a1;
  id v4 = [a2 name];
  id v5 = [a2 limitationResponse];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_1B578B000, v3, v6, "ERROR Submitting %@: Please contact das-core@group.apple.com to prevent this activity from getting rejected. Configuration: %@", v7);
}

- (void)submitActivityInternal:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = a1;
  id v4 = [a2 name];
  id v5 = [a2 limitationResponse];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_1B578B000, v3, v6, "WARNING Submitting %@: %@", v7);
}

- (void)submitActivity:inGroup:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1B578B000, v0, v1, "Not submitting %@, identical to %@");
}

@end