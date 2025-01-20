@interface CPLBGSTReschedulerManager
+ (NSString)groupNameForAppLibrarySync;
+ (NSString)groupNameForSystemLibrarySync;
+ (NSString)taskIdentifierForSystemLibrary;
+ (id)taskIdentifierForLibraryIdentifier:(id)a3;
- (BOOL)isQuiet;
- (BOOL)isWaitingForAcquiredTaskWithIdentifier:(id)a3;
- (CPLBGSTReschedulerManager)initWithTaskIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5 groupName:(id)a6;
- (CPLBGSystemTaskScheduler)scheduler;
- (Class)requestClass;
- (NSArray)involvedProcesses;
- (NSArray)relatedApplications;
- (NSDate)now;
- (NSString)description;
- (NSString)groupName;
- (NSString)reschedulerDescription;
- (NSString)taskIdentifier;
- (OS_dispatch_queue)queue;
- (double)_expectedDurationFromPrediction:(id)a3;
- (double)minimumRuntime;
- (double)minimumRuntimeLeeway;
- (double)minimumRuntimeWithExtendedTime;
- (double)minimumRuntimeWithVeryLongExtendedTime;
- (id)_persistedSyncSessionForScheduler:(id)a3 startSyncSessionBlock:(id)a4;
- (id)_requestFromUpdatedRequest:(id)a3 updatedPrediction:(id)a4;
- (id)_summaryForTaskRequest:(id)a3;
- (id)newCloudKitReschedulerForSession:(id)a3;
- (id)newReschedulerWithExpectedDuration:(double)a3;
- (id)newTaskRequestForSession:(id)a3;
- (id)newTaskRequestWithExpectedDuration:(double)a3;
- (id)resubmitTaskRequestForRescheduler:(id)a3 updatedPrediction:(id)a4 afterTaskHasBeenDeferred:(id)a5;
- (id)taskStatusesWithNow:(id)a3;
- (id)updateTaskRequest:(id)a3 updatedPrediction:(id)a4;
- (void)_acquiredTask:(id)a3 error:(id)a4;
- (void)_deregisterTaskIdentifier:(id)a3;
- (void)_reallySubmitTaskRequest:(id)a3;
- (void)_registerWithTaskIdentifier:(id)a3;
- (void)activityHasExpired:(id)a3 forRescheduler:(id)a4;
- (void)dropPersistedInitialSyncSession;
- (void)dropTaskRequest:(id)a3 forRescheduler:(id)a4;
- (void)findPersistedSyncSession:(id)a3 forScheduler:(id)a4 completionHandler:(id)a5;
- (void)setMinimumRuntime:(double)a3;
- (void)setMinimumRuntimeLeeway:(double)a3;
- (void)setMinimumRuntimeWithExtendedTime:(double)a3;
- (void)setMinimumRuntimeWithVeryLongExtendedTime:(double)a3;
- (void)setNow:(id)a3;
- (void)setScheduler:(id)a3;
- (void)submitTaskRequestForRescheduler:(id)a3;
@end

@implementation CPLBGSTReschedulerManager

- (CPLBGSTReschedulerManager)initWithTaskIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5 groupName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)CPLBGSTReschedulerManager;
  v14 = [(CPLBGSTReschedulerManager *)&v31 init];
  if (v14)
  {
    v15 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.cpl.bgst.rescheduler", v15);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v16;

    uint64_t v18 = +[BGSystemTaskScheduler sharedScheduler];
    scheduler = v14->_scheduler;
    v14->_scheduler = (CPLBGSystemTaskScheduler *)v18;

    v20 = (NSString *)[v10 copy];
    taskIdentifier = v14->_taskIdentifier;
    v14->_taskIdentifier = v20;

    v22 = (NSArray *)[v11 copy];
    involvedProcesses = v14->_involvedProcesses;
    v14->_involvedProcesses = v22;

    v24 = (NSArray *)[v12 copy];
    relatedApplications = v14->_relatedApplications;
    v14->_relatedApplications = v24;

    v26 = (NSString *)[v13 copy];
    groupName = v14->_groupName;
    v14->_groupName = v26;

    v28 = objc_alloc_init(CPLBGSTActivitiesReport);
    report = v14->_report;
    v14->_report = v28;

    *(_OWORD *)&v14->_minimumRuntime = xmmword_100249FE0;
    *(_OWORD *)&v14->_minimumRuntimeLeeway = xmmword_100249FF0;
  }

  return v14;
}

- (NSDate)now
{
  now = self->_now;
  if (now)
  {
    v3 = now;
  }
  else
  {
    v3 = +[NSDate date];
  }
  return v3;
}

- (Class)requestClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isWaitingForAcquiredTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D348;
  block[3] = &unk_100277240;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)isQuiet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D458;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"[%@ for %@]", objc_opt_class(), self->_taskIdentifier];
  return (NSString *)v2;
}

- (id)newTaskRequestWithExpectedDuration:(double)a3
{
  id v5 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:self->_taskIdentifier];
  [v5 setExpectedDuration:a3];
  [v5 setInvolvedProcesses:self->_involvedProcesses];
  [v5 setRelatedApplications:self->_relatedApplications];
  if (self->_groupName)
  {
    objc_msgSend(v5, "setGroupName:");
    [v5 setGroupConcurrencyLimit:1];
  }
  [v5 setPriority:1];
  [v5 setRequiresExternalPower:0];
  [v5 setRequiresNetworkConnectivity:1];
  [v5 setScheduleAfter:0.0];
  [v5 setTrySchedulingBefore:3600.0];
  [v5 setOverrideRateLimiting:1];
  return v5;
}

- (double)_expectedDurationFromPrediction:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastPrediction, a3);
  +[CPLBGSTActivity estimatedRunningTimeFromPrediction:v5 minimumRuntime:self->_minimumRuntime minimumRuntimeWithExtendedTime:self->_minimumRuntimeWithExtendedTime minimumRuntimeWithVeryLongExtendedTime:self->_minimumRuntimeWithVeryLongExtendedTime];
  double v7 = v6 + self->_minimumRuntimeLeeway;
  if (v7 >= self->_minimumRuntime) {
    double minimumRuntime = v7;
  }
  else {
    double minimumRuntime = self->_minimumRuntime;
  }
  self->_double lastEstimatedRunningTime = minimumRuntime;
  if (!_CPLSilentLogging)
  {
    char v9 = sub_10002A598();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double lastEstimatedRunningTime = self->_lastEstimatedRunningTime;
      int v12 = 134217984;
      double v13 = lastEstimatedRunningTime;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Estimated running time from predictions: %.0fs", (uint8_t *)&v12, 0xCu);
    }

    double minimumRuntime = self->_lastEstimatedRunningTime;
  }

  return minimumRuntime;
}

- (id)newTaskRequestForSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 predictor];
  double v6 = [v5 currentPrediction];

  LODWORD(v5) = [v4 shouldRequestMoreTime];
  if (v5)
  {
    if (self->_lastEstimatedRunningTime + self->_lastEstimatedRunningTime >= self->_minimumRuntimeWithVeryLongExtendedTime) {
      double minimumRuntimeWithVeryLongExtendedTime = self->_minimumRuntimeWithVeryLongExtendedTime;
    }
    else {
      double minimumRuntimeWithVeryLongExtendedTime = self->_lastEstimatedRunningTime + self->_lastEstimatedRunningTime;
    }
    [(CPLBGSTReschedulerManager *)self _expectedDurationFromPrediction:v6];
    if (minimumRuntimeWithVeryLongExtendedTime >= v8) {
      double v8 = minimumRuntimeWithVeryLongExtendedTime;
    }
    self->_double lastEstimatedRunningTime = v8;
    BOOL v9 = 1;
  }
  else
  {
    [(CPLBGSTReschedulerManager *)self _expectedDurationFromPrediction:v6];
    BOOL v9 = 0;
  }
  self->_lastSessionWasExplicitlyExtended = v9;
  id v10 = -[CPLBGSTReschedulerManager newTaskRequestWithExpectedDuration:](self, "newTaskRequestWithExpectedDuration:");
  [v10 updateWithPrediction:v6];

  return v10;
}

- (void)_registerWithTaskIdentifier:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_registeredTaskIdentifier = &self->_registeredTaskIdentifier;
  if (!self->_registeredTaskIdentifier) {
    goto LABEL_5;
  }
  if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    [(CPLBGSystemTaskScheduler *)self->_scheduler deregisterTaskWithIdentifier:self->_registeredTaskIdentifier];
    registeredTaskIdentifier = self->_registeredTaskIdentifier;
    self->_registeredTaskIdentifier = 0;
  }
  BOOL v9 = *p_registeredTaskIdentifier;
  if (!*p_registeredTaskIdentifier)
  {
LABEL_5:
    objc_storeStrong((id *)&self->_registeredTaskIdentifier, a3);
    scheduler = self->_scheduler;
    uint64_t v11 = self->_registeredTaskIdentifier;
    queue = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002D9D4;
    v17[3] = &unk_100277268;
    v17[4] = self;
    if (([(CPLBGSystemTaskScheduler *)scheduler registerForTaskWithIdentifier:v11 usingQueue:queue launchHandler:v17] & 1) == 0)sub_1001C5DE0(&self->_registeredTaskIdentifier, a2, self); {
    BOOL v9 = *p_registeredTaskIdentifier;
    }
  }
  if (![(NSString *)v9 isEqualToString:v6])
  {
    if (!_CPLSilentLogging)
    {
      double v13 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        char v14 = *p_registeredTaskIdentifier;
        *(_DWORD *)buf = 138412546;
        v19 = v14;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unexpected registered task identifier %@ after registering %@", buf, 0x16u);
      }
    }
    v15 = +[NSAssertionHandler currentHandler];
    dispatch_queue_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v15 handleFailureInMethod:a2, self, v16, 655, @"Unexpected registered task identifier %@ after registering %@", self->_registeredTaskIdentifier, v6 object file lineNumber description];

    abort();
  }
}

- (void)_deregisterTaskIdentifier:(id)a3
{
  *((void *)&v19 + 1) = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_registeredTaskIdentifier = &self->_registeredTaskIdentifier;
  if (self->_registeredTaskIdentifier)
  {
    if (self->_interestedRescheduler)
    {
      if (!_CPLSilentLogging)
      {
        int v12 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          registeredTaskIdentifier = self->_registeredTaskIdentifier;
          interestedRescheduler = self->_interestedRescheduler;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = registeredTaskIdentifier;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = interestedRescheduler;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Trying to deregister %@ while we are waiting for a task for %@", buf, 0x16u);
        }
      }
      v15 = +[NSAssertionHandler currentHandler];
      dispatch_queue_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
      [v15 handleFailureInMethod:a2, self, v16, 661, @"Trying to deregister %@ while we are waiting for a task for %@", self->_registeredTaskIdentifier, self->_interestedRescheduler object file lineNumber description];

      abort();
    }
    if ((objc_msgSend(*((id *)&v19 + 1), "isEqualToString:") & 1) == 0) {
      sub_1001C5FA0(*((uint64_t *)&v19 + 1), (uint64_t)self, (uint64_t)a2, v6, v7, v8, v9, v10, v17, v18, v19, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], v21, v22, v23, v24, v25,
    }
        vars0,
        vars8);
    if (([(CPLBGSystemTaskScheduler *)self->_scheduler deregisterTaskWithIdentifier:self->_registeredTaskIdentifier] & 1) == 0)sub_1001C5EC0(&self->_registeredTaskIdentifier, a2, self); {
    uint64_t v11 = *p_registeredTaskIdentifier;
    }
    *p_registeredTaskIdentifier = 0;
  }
}

- (void)_reallySubmitTaskRequest:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentTaskRequest, a3);
  lastTaskRequest = self->_lastTaskRequest;
  self->_lastTaskRequest = 0;

  uint64_t v7 = [v5 identifier];
  [(CPLBGSTReschedulerManager *)self _registerWithTaskIdentifier:v7];

  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"CPLAlwaysFailBackgroundTask"];

  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v10 = sub_10002A598();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Automatically failing %@", buf, 0xCu);
      }
    }
    id v11 = +[CPLErrors cplErrorWithCode:150 description:@"Automatically failing background task"];
LABEL_13:
    self->_currentTaskRequestHasBeenSubmitted = 0;
    [(CPLBGSTReschedulerManager *)self _acquiredTask:0 error:v11];
    goto LABEL_14;
  }
  scheduler = self->_scheduler;
  id v17 = 0;
  int v13 = [(CPLBGSystemTaskScheduler *)scheduler submitTaskRequest:v5 error:&v17];
  id v11 = v17;
  if ((v13 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_queue_t v16 = sub_10002A598();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to submit %@: %@", buf, 0x16u);
      }
    }
    goto LABEL_13;
  }
  report = self->_report;
  v15 = [v5 identifier];
  [(CPLBGSTActivitiesReport *)report didSubmitTaskWithIdentifier:v15];

  self->_currentTaskRequestHasBeenSubmitted = 1;
LABEL_14:
}

- (void)_acquiredTask:(id)a3 error:(id)a4
{
  id v25 = a3;
  id v7 = a4;
  currentTaskRequest = self->_currentTaskRequest;
  if (!currentTaskRequest) {
    sub_1001C609C();
  }
  if (!self->_registeredTaskIdentifier) {
    sub_1001C6150();
  }
  unsigned int v9 = [(BGNonRepeatingSystemTaskRequest *)currentTaskRequest identifier];
  unsigned __int8 v10 = [v9 isEqualToString:self->_registeredTaskIdentifier];

  if ((v10 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v18 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        registeredTaskIdentifier = self->_registeredTaskIdentifier;
        id v19 = self->_currentTaskRequest;
        *(_DWORD *)buf = 138412546;
        v27 = v19;
        __int16 v28 = 2112;
        v29 = registeredTaskIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Acquired %@ mismatches task identifier %@", buf, 0x16u);
      }
    }
    id v21 = +[NSAssertionHandler currentHandler];
    uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v21 handleFailureInMethod:a2, self, v22, 692, @"Acquired %@ mismatches task identifier %@", self->_currentTaskRequest, self->_registeredTaskIdentifier object file lineNumber description];
    goto LABEL_26;
  }
  interestedRescheduler = self->_interestedRescheduler;
  if (!interestedRescheduler) {
    sub_1001C6204();
  }
  int v12 = interestedRescheduler;
  self->_currentTaskRequestHasBeenSubmitted = 0;
  objc_storeStrong((id *)&self->_runningRescheduler, self->_interestedRescheduler);
  int v13 = self->_interestedRescheduler;
  self->_interestedRescheduler = 0;

  if (v25)
  {
    char v14 = [v25 identifier];
    unsigned __int8 v15 = [v14 isEqualToString:self->_registeredTaskIdentifier];

    if (v15)
    {
      report = self->_report;
      id v17 = [(BGNonRepeatingSystemTaskRequest *)self->_currentTaskRequest identifier];
      [(CPLBGSTActivitiesReport *)report didAcquireTaskWithIdentifier:v17];

      [(CPLBGSTRescheduler *)v12 acquiredTask:v25];
      goto LABEL_10;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v23 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = self->_registeredTaskIdentifier;
        *(_DWORD *)buf = 138412546;
        v27 = (BGNonRepeatingSystemTaskRequest *)v25;
        __int16 v28 = 2112;
        v29 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Acquired %@ mismatches registered task identifier %@", buf, 0x16u);
      }
    }
    id v21 = +[NSAssertionHandler currentHandler];
    uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v21 handleFailureInMethod:a2, self, v22, 700, @"Acquired %@ mismatches registered task identifier %@", v25, self->_registeredTaskIdentifier object file lineNumber description];
LABEL_26:

    abort();
  }
  if (!v7) {
    sub_1001C62B8();
  }
  [(CPLBGSTRescheduler *)v12 failedToAcquireTaskWithError:v7];
LABEL_10:
}

- (id)_requestFromUpdatedRequest:(id)a3 updatedPrediction:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    [(CPLBGSTReschedulerManager *)self _expectedDurationFromPrediction:v7];
    objc_msgSend(v6, "setExpectedDuration:");
    [v6 updateWithPrediction:v7];
  }
  return v6;
}

- (void)submitTaskRequestForRescheduler:(id)a3
{
  id v5 = (CPLBGSTRescheduler *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_interestedRescheduler)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        registeredTaskIdentifier = self->_registeredTaskIdentifier;
        interestedRescheduler = self->_interestedRescheduler;
        *(_DWORD *)buf = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = registeredTaskIdentifier;
        __int16 v20 = 2112;
        id v21 = interestedRescheduler;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Trying to register %@ for %@ twice (already registered: %@)", buf, 0x20u);
      }
    }
    unsigned __int8 v10 = +[NSAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v10 handleFailureInMethod:a2, self, v11, 720, @"Trying to register %@ for %@ twice (already registered: %@)", v5, self->_registeredTaskIdentifier, self->_interestedRescheduler object file lineNumber description];
LABEL_17:

    abort();
  }
  if (self->_runningRescheduler)
  {
    if (!_CPLSilentLogging)
    {
      int v12 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = self->_registeredTaskIdentifier;
        char v14 = self->_interestedRescheduler;
        *(_DWORD *)buf = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v13;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Trying to register %@ for %@ while %@ is running", buf, 0x20u);
      }
    }
    unsigned __int8 v10 = +[NSAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v10 handleFailureInMethod:a2, self, v11, 721, @"Trying to register %@ for %@ while %@ is running", v5, self->_registeredTaskIdentifier, self->_interestedRescheduler object file lineNumber description];
    goto LABEL_17;
  }
  if (self->_registeredTaskIdentifier) {
    sub_1001C636C(v5, a2, self);
  }
  self->_interestedRescheduler = v5;
  id v6 = v5;

  id v15 = [(CPLBGSTRescheduler *)v6 request];

  [(CPLBGSTReschedulerManager *)self _reallySubmitTaskRequest:v15];
}

- (id)resubmitTaskRequestForRescheduler:(id)a3 updatedPrediction:(id)a4 afterTaskHasBeenDeferred:(id)a5
{
  unsigned __int8 v10 = (CPLBGSTRescheduler *)a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_registeredTaskIdentifier = &self->_registeredTaskIdentifier;
  registeredTaskIdentifier = self->_registeredTaskIdentifier;
  if (!registeredTaskIdentifier
    || ([(CPLBGSTRescheduler *)v10 taskIdentifier],
        id v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [(NSString *)registeredTaskIdentifier isEqualToString:v15],
        v15,
        (v16 & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      v32 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [(CPLBGSTRescheduler *)v10 taskIdentifier];
        v34 = *p_registeredTaskIdentifier;
        *(_DWORD *)buf = 138412546;
        v50 = v33;
        __int16 v51 = 2112;
        id v52 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Trying to resubmit request for %@ while we are currently registered for %@", buf, 0x16u);
      }
    }
    v35 = +[NSAssertionHandler currentHandler];
    v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    v37 = [(CPLBGSTRescheduler *)v10 taskIdentifier];
    [v35 handleFailureInMethod:a2, self, v36, 732, @"Trying to resubmit request for %@ while we are currently registered for %@", v37, self->_registeredTaskIdentifier object file lineNumber description];

LABEL_38:
    abort();
  }
  if (self->_currentTaskRequestHasBeenSubmitted)
  {
    sub_1001C6524(&self->_registeredTaskIdentifier, a2, self);
    goto LABEL_32;
  }
  if (self->_interestedRescheduler)
  {
LABEL_32:
    sub_1001C6444(&self->_registeredTaskIdentifier, a2, self);
    goto LABEL_33;
  }
  if (self->_runningRescheduler != v10)
  {
LABEL_33:
    if (!_CPLSilentLogging)
    {
      v38 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = self->_registeredTaskIdentifier;
        runningRescheduler = self->_runningRescheduler;
        *(_DWORD *)buf = 138412802;
        v50 = (BGNonRepeatingSystemTaskRequest *)v39;
        __int16 v51 = 2112;
        id v52 = v10;
        __int16 v53 = 2112;
        v54 = runningRescheduler;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Trying to resubmit %@ for %@ but current running one is %@", buf, 0x20u);
      }
    }
    v35 = +[NSAssertionHandler currentHandler];
    v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v35 handleFailureInMethod:a2, self, v36, 735, @"Trying to resubmit %@ for %@ but current running one is %@", self->_registeredTaskIdentifier, v10, self->_runningRescheduler object file lineNumber description];
    goto LABEL_38;
  }
  objc_storeStrong((id *)&self->_interestedRescheduler, a3);
  id v17 = self->_runningRescheduler;
  self->_runningRescheduler = 0;

  __int16 v18 = [(CPLBGSTRescheduler *)v10 request];
  id v19 = [(CPLBGSTReschedulerManager *)self _requestFromUpdatedRequest:v18 updatedPrediction:v11];
  if (v19 != v18)
  {
    [v12 setTaskCompleted];
    [(CPLBGSTReschedulerManager *)self _reallySubmitTaskRequest:v19];
    if (self->_currentTaskRequest == v19)
    {
      __int16 v20 = *p_registeredTaskIdentifier;
      id v21 = [(BGNonRepeatingSystemTaskRequest *)v19 identifier];
      LOBYTE(v20) = [(NSString *)v20 isEqualToString:v21];

      if (v20)
      {
        uint64_t v22 = v19;
        goto LABEL_23;
      }
      if (!_CPLSilentLogging)
      {
        v45 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = *p_registeredTaskIdentifier;
          *(_DWORD *)buf = 138412546;
          v50 = v19;
          __int16 v51 = 2112;
          id v52 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "New %@ should be our current registered task identifier (%@)", buf, 0x16u);
        }
      }
      v43 = +[NSAssertionHandler currentHandler];
      v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
      [v43 handleFailureInMethod:a2, self, v44, 747, @"New %@ should be our current registered task identifier (%@)", v19, self->_registeredTaskIdentifier object file lineNumber description];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v41 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          currentTaskRequest = self->_currentTaskRequest;
          *(_DWORD *)buf = 138412546;
          v50 = v19;
          __int16 v51 = 2112;
          id v52 = currentTaskRequest;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "New %@ should be our current task request (%@)", buf, 0x16u);
        }
      }
      v43 = +[NSAssertionHandler currentHandler];
      v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
      [v43 handleFailureInMethod:a2, self, v44, 746, @"New %@ should be our current task request (%@)", v19, self->_currentTaskRequest object file lineNumber description];
    }

    abort();
  }
  id v48 = 0;
  unsigned __int8 v23 = [v12 setTaskExpiredWithRetryAfter:&v48 error:0.0];
  id v24 = v48;
  if (v23)
  {
    report = self->_report;
    uint64_t v26 = [(BGNonRepeatingSystemTaskRequest *)v18 identifier];
    [(CPLBGSTActivitiesReport *)report didDeferTaskWithIdentifier:v26];

    scheduler = self->_scheduler;
    id v47 = 0;
    LOBYTE(v26) = [(CPLBGSystemTaskScheduler *)scheduler updateTaskRequest:v18 error:&v47];
    id v28 = v47;
    if ((v26 & 1) == 0 && !_CPLSilentLogging)
    {
      v29 = sub_10002A598();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v50 = v18;
        __int16 v51 = 2112;
        id v52 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to update task request %@: %@", buf, 0x16u);
      }
    }
    self->_currentTaskRequestHasBeenSubmitted = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v30 = sub_10002A598();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v50 = (BGNonRepeatingSystemTaskRequest *)v12;
        __int16 v51 = 2112;
        id v52 = v24;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to reschedule expired %@: %@", buf, 0x16u);
      }
    }
    self->_currentTaskRequestHasBeenSubmitted = 0;
    [v12 setTaskCompleted];
    [(CPLBGSTReschedulerManager *)self _acquiredTask:0 error:v24];
  }
  uint64_t v22 = v18;

LABEL_23:
  return v22;
}

- (void)dropTaskRequest:(id)a3 forRescheduler:(id)a4
{
  id v7 = (BGNonRepeatingSystemTaskRequest *)a3;
  uint64_t v8 = (CPLBGSTRescheduler *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v7) {
    sub_1001C6604();
  }
  if (self->_currentTaskRequest != v7)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v22 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        currentTaskRequest = self->_currentTaskRequest;
        *(_DWORD *)buf = 138412546;
        v37 = v7;
        __int16 v38 = 2112;
        v39 = currentTaskRequest;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Cancelling an unknown task request %@ (current: %@)", buf, 0x16u);
      }
    }
    id v24 = +[NSAssertionHandler currentHandler];
    id v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v24 handleFailureInMethod:a2, self, v25, 774, @"Cancelling an unknown task request %@ (current: %@)", v7, self->_currentTaskRequest object file lineNumber description];

    abort();
  }
  unsigned int v9 = [(BGNonRepeatingSystemTaskRequest *)v7 identifier];
  unsigned __int8 v10 = [(CPLBGSTRescheduler *)v8 currentActivity];

  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v26 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v7;
        __int16 v38 = 2112;
        v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Trying to unregister %@ for %@ while a task is running", buf, 0x16u);
      }
    }
    v27 = +[NSAssertionHandler currentHandler];
    id v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v27 handleFailureInMethod:a2, self, v28, 776, @"Trying to unregister %@ for %@ while a task is running", v7, v8 object file lineNumber description];

    abort();
  }
  interestedRescheduler = self->_interestedRescheduler;
  if (!interestedRescheduler)
  {
    if (self->_runningRescheduler == v8)
    {
      self->_runningRescheduler = 0;

      [(CPLBGSTActivitiesReport *)self->_report didFinishTaskWithIdentifier:v9];
      goto LABEL_13;
    }
    if (!_CPLSilentLogging)
    {
      v33 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        runningRescheduler = self->_runningRescheduler;
        *(_DWORD *)buf = 138412546;
        v37 = v8;
        __int16 v38 = 2112;
        v39 = runningRescheduler;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Trying to drop task request for %@ but the currently active one is %@", buf, 0x16u);
      }
    }
    objc_super v31 = +[NSAssertionHandler currentHandler];
    v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v31 handleFailureInMethod:a2, self, v32, 798, @"Trying to drop task request for %@ but the currently active one is %@", v8, self->_runningRescheduler object file lineNumber description];
LABEL_36:

    abort();
  }
  if (interestedRescheduler != v8)
  {
    if (!_CPLSilentLogging)
    {
      v29 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_interestedRescheduler;
        *(_DWORD *)buf = 138412546;
        v37 = v8;
        __int16 v38 = 2112;
        v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Trying to drop task request for %@ but the currently active one is %@", buf, 0x16u);
      }
    }
    objc_super v31 = +[NSAssertionHandler currentHandler];
    v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
    [v31 handleFailureInMethod:a2, self, v32, 779, @"Trying to drop task request for %@ but the currently active one is %@", v8, self->_interestedRescheduler object file lineNumber description];
    goto LABEL_36;
  }
  if (!self->_currentTaskRequestHasBeenSubmitted)
  {
LABEL_13:
    [(CPLBGSTReschedulerManager *)self _deregisterTaskIdentifier:v9];
    goto LABEL_14;
  }
  scheduler = self->_scheduler;
  registeredTaskIdentifier = self->_registeredTaskIdentifier;
  id v35 = 0;
  unsigned __int8 v14 = [(CPLBGSystemTaskScheduler *)scheduler cancelTaskRequestWithIdentifier:registeredTaskIdentifier error:&v35];
  id v15 = v35;
  unsigned __int8 v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v17 = v15;
    __int16 v18 = [v17 domain];
    if ([v18 isEqualToString:BGSystemTaskSchedulerErrorDomain])
    {
      id v19 = [v17 code];

      if (v19 == (id)6) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    sub_1001C66B8(&self->_currentTaskRequest, (uint64_t)a2, (uint64_t)self, (uint64_t)v17);
  }
LABEL_10:
  [(CPLBGSTActivitiesReport *)self->_report didCancelTaskWithIdentifier:v9];
  __int16 v20 = self->_interestedRescheduler;
  self->_interestedRescheduler = 0;

  [(CPLBGSTReschedulerManager *)self _deregisterTaskIdentifier:v9];
  self->_currentTaskRequestHasBeenSubmitted = 0;

LABEL_14:
  objc_storeStrong((id *)&self->_lastTaskRequest, self->_currentTaskRequest);
  id v21 = self->_currentTaskRequest;
  self->_currentTaskRequest = 0;
}

- (id)updateTaskRequest:(id)a3 updatedPrediction:(id)a4
{
  id v6 = (BGNonRepeatingSystemTaskRequest *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentTaskRequest != v6) {
    sub_1001C6748();
  }
  if (self->_interestedRescheduler)
  {
    uint64_t v8 = [(CPLBGSTReschedulerManager *)self _requestFromUpdatedRequest:v6 updatedPrediction:v7];
    if (v8 == v6)
    {
      scheduler = self->_scheduler;
      id v18 = 0;
      unsigned __int8 v14 = [(CPLBGSystemTaskScheduler *)scheduler updateTaskRequest:v6 error:&v18];
      id v15 = v18;
      if ((v14 & 1) == 0 && !_CPLSilentLogging)
      {
        unsigned __int8 v16 = sub_10002A598();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v20 = v6;
          __int16 v21 = 2112;
          id v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to update task request %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      unsigned int v9 = self->_interestedRescheduler;
      [(CPLBGSTReschedulerManager *)self dropTaskRequest:v6 forRescheduler:self->_interestedRescheduler];
      [(CPLBGSTReschedulerManager *)self _reallySubmitTaskRequest:v8];
      interestedRescheduler = self->_interestedRescheduler;
      self->_interestedRescheduler = v9;
      id v11 = v9;

      id v12 = v8;
      id v6 = v12;
    }
  }
  return v6;
}

- (void)activityHasExpired:(id)a3 forRescheduler:(id)a4
{
  queue = self->_queue;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v7 = [v6 request];

  id v8 = [v7 identifier];

  [(CPLBGSTActivitiesReport *)self->_report didExpireTaskWithIdentifier:v8];
}

- (id)_persistedSyncSessionForScheduler:(id)a3 startSyncSessionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(CPLBGSTReschedulerManager *)self _registerWithTaskIdentifier:self->_taskIdentifier];
  unsigned int v9 = [(CPLBGSystemTaskScheduler *)self->_scheduler taskRequestForIdentifier:self->_taskIdentifier];
  if (v9)
  {
    unsigned __int8 v10 = [[CPLBGSTRescheduler alloc] initWithRequest:v9 reschedulerManager:self];
    if (![(NSString *)self->_registeredTaskIdentifier isEqualToString:self->_taskIdentifier])
    {
      if (!_CPLSilentLogging)
      {
        unsigned __int8 v16 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          registeredTaskIdentifier = self->_registeredTaskIdentifier;
          taskIdentifier = self->_taskIdentifier;
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = registeredTaskIdentifier;
          __int16 v25 = 2112;
          uint64_t v26 = taskIdentifier;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid registered task identifier %@ - expecting %@", location, 0x16u);
        }
      }
      id v19 = +[NSAssertionHandler currentHandler];
      __int16 v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"];
      [v19 handleFailureInMethod:a2, self, v20, 852, @"Invalid registered task identifier %@ - expecting %@", self->_registeredTaskIdentifier, self->_taskIdentifier object file lineNumber description];

      abort();
    }
    objc_storeStrong((id *)&self->_currentTaskRequest, v9);
    self->_currentTaskRequestHasBeenSubmitted = 1;
    objc_storeStrong((id *)&self->_interestedRescheduler, v10);
    id v11 = objc_alloc((Class)CPLSyncSession);
    id v12 = [v7 configuration];
    id v13 = [v11 initWithSequenceNumber:0 expectedDate:0 scheduler:v7 configuration:v12 scopeFilter:0];

    objc_initWeak((id *)location, v13);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002F5A4;
    v21[3] = &unk_100277290;
    objc_copyWeak(&v23, (id *)location);
    id v22 = v8;
    [(CPLBGSTRescheduler *)v10 _registerFromPersistentSyncSessionWithLaunchBlock:v21];
    [v13 setRescheduler:v10];
    id v14 = v13;

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    [(CPLBGSTReschedulerManager *)self _deregisterTaskIdentifier:self->_taskIdentifier];
    id v14 = 0;
  }

  return v14;
}

- (void)findPersistedSyncSession:(id)a3 forScheduler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002F7B4;
  v18[3] = &unk_1002772B8;
  v18[4] = self;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v12 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v23 = v12;
  id v13 = queue;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

- (void)dropPersistedInitialSyncSession
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FA10;
  v6[3] = &unk_100275EC8;
  v6[4] = self;
  v6[5] = a2;
  char v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (id)newCloudKitReschedulerForSession:(id)a3
{
  id v4 = [(CPLBGSTReschedulerManager *)self newTaskRequestForSession:a3];
  dispatch_block_t v5 = [[CPLBGSTRescheduler alloc] initWithRequest:v4 reschedulerManager:self];

  return v5;
}

- (id)newReschedulerWithExpectedDuration:(double)a3
{
  id v4 = [(CPLBGSTReschedulerManager *)self newTaskRequestWithExpectedDuration:a3];
  dispatch_block_t v5 = [[CPLBGSTRescheduler alloc] initWithRequest:v4 reschedulerManager:self];

  return v5;
}

- (NSString)reschedulerDescription
{
  id v3 = objc_alloc((Class)NSString);
  taskIdentifier = self->_taskIdentifier;
  dispatch_block_t v5 = [(NSArray *)self->_relatedApplications componentsJoinedByString:@","];
  id v6 = [v3 initWithFormat:@"%@ for %@", taskIdentifier, v5];

  return (NSString *)v6;
}

- (id)_summaryForTaskRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  dispatch_block_t v5 = +[CPLBGSTActivityReport simplifiedTaskIdentifierForTaskIdentifier:v4];

  id v6 = [v5 mutableCopy];
  unsigned int v7 = [v3 resourceIntensive];
  if (v7) {
    objc_msgSend(v6, "appendFormat:", @"%s%@", " (", @"resourceIntensive");
  }
  if ([v3 requiresUserInactivity])
  {
    id v8 = " (";
    if (v7) {
      id v8 = " ";
    }
    [v6 appendFormat:@"%s%@", v8, @"requiresUserInactivity"];
    int v9 = 0;
  }
  else
  {
    int v9 = v7 ^ 1;
  }
  if ([v3 requiresSignificantUserInactivity])
  {
    id v10 = " ";
    if (v9) {
      id v10 = " (";
    }
    [v6 appendFormat:@"%s%@", v10, @"requiresSignificantUserInactivity"];
    int v9 = 0;
  }
  if ([v3 powerNap])
  {
    id v11 = " ";
    if (v9) {
      id v11 = " (";
    }
    [v6 appendFormat:@"%s%@", v11, @"powerNap"];
    int v9 = 0;
  }
  if ([v3 requiresExternalPower])
  {
    id v12 = " ";
    if (v9) {
      id v12 = " (";
    }
    [v6 appendFormat:@"%s%@", v12, @"requiresExternalPower"];
    int v9 = 0;
  }
  if ([v3 requiresNetworkConnectivity])
  {
    id v13 = " ";
    id v14 = " (";
    if (!v9) {
      id v14 = " ";
    }
    [v6 appendFormat:@"%s%@", v14, @"requiresNetworkConnectivity"];
    if (([v3 overrideRateLimiting] & 1) == 0) {
      goto LABEL_31;
    }
  }
  else
  {
    if (([v3 overrideRateLimiting] & 1) == 0)
    {
      if (v9) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    if (v9) {
      id v13 = " (";
    }
    else {
      id v13 = " ";
    }
  }
  [v6 appendFormat:@"%s%@", v13, @"overrideRateLimiting"];
LABEL_31:
  [v6 appendString:@""]);
LABEL_32:
  id v15 = [v6 copy];

  return v15;
}

- (id)taskStatusesWithNow:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100029C58;
  id v16 = sub_100029C68;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FFD0;
  block[3] = &unk_100277240;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (NSString)taskIdentifierForSystemLibrary
{
  return (NSString *)@"com.apple.cloudphotod.sync.discretionary";
}

+ (id)taskIdentifierForLibraryIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.cloudphotod.sync.%@", v3];

  return v4;
}

+ (NSString)groupNameForSystemLibrarySync
{
  return (NSString *)@"com.apple.cloudphotod.sync.SystemLibrary";
}

+ (NSString)groupNameForAppLibrarySync
{
  return (NSString *)@"com.apple.cloudphotod.sync.AppLibrary";
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSArray)involvedProcesses
{
  return self->_involvedProcesses;
}

- (NSArray)relatedApplications
{
  return self->_relatedApplications;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setNow:(id)a3
{
}

- (CPLBGSystemTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (double)minimumRuntime
{
  return self->_minimumRuntime;
}

- (void)setMinimumRuntime:(double)a3
{
  self->_double minimumRuntime = a3;
}

- (double)minimumRuntimeWithExtendedTime
{
  return self->_minimumRuntimeWithExtendedTime;
}

- (void)setMinimumRuntimeWithExtendedTime:(double)a3
{
  self->_minimumRuntimeWithExtendedTime = a3;
}

- (double)minimumRuntimeLeeway
{
  return self->_minimumRuntimeLeeway;
}

- (void)setMinimumRuntimeLeeway:(double)a3
{
  self->_minimumRuntimeLeeway = a3;
}

- (double)minimumRuntimeWithVeryLongExtendedTime
{
  return self->_minimumRuntimeWithVeryLongExtendedTime;
}

- (void)setMinimumRuntimeWithVeryLongExtendedTime:(double)a3
{
  self->_double minimumRuntimeWithVeryLongExtendedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_relatedApplications, 0);
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_lastPrediction, 0);
  objc_storeStrong((id *)&self->_lastTaskRequest, 0);
  objc_storeStrong((id *)&self->_runningRescheduler, 0);
  objc_storeStrong((id *)&self->_interestedRescheduler, 0);
  objc_storeStrong((id *)&self->_currentTaskRequest, 0);
  objc_storeStrong((id *)&self->_registeredTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end