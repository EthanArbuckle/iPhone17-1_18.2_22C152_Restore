@interface OSAStabilityMonitor
+ (BOOL)hasSupplementalBuild;
+ (BOOL)isAvailable;
+ (id)baselineCrashCount;
+ (id)baselineUptime;
+ (id)baselineVersions;
+ (id)calculateStabilityRateWithAppUsage:(id)a3 crashCounts:(id)a4;
+ (id)monitorQueue;
+ (void)dateRangeOnBuild:(id)a3 from:(id)a4 to:(id)a5 completionHandler:(id)a6;
+ (void)evaluateStabilityOfBundleID:(id)a3 coalitionName:(id)a4 parameters:(id)a5 completionHandler:(id)a6;
+ (void)evaluateStabilityWithParameters:(id)a3;
+ (void)evaluateStabilityWithParameters:(id)a3 targetBundleID:(id)a4 coalitionName:(id)a5 completionHandler:(id)a6;
- (BOOL)excludeThirdParty;
- (BOOL)isRollbackEnabledForBundleID:(id)a3;
- (BOOL)isRollbackSupportedForBundleID:(id)a3 reason:(unint64_t *)a4;
- (BOOL)isValidBundleID:(id)a3;
- (BOOL)recommendRollbackForBundleID:(id)a3 reason:(unint64_t *)a4;
- (NSString)targetBundleID;
- (OSAStabilityMonitor)initWithParameters:(id)a3 targetBundleID:(id)a4 completionHandler:(id)a5;
- (id)coalitionBasedBundleIDs;
- (id)loadParameterForKey:(id)a3;
- (id)maximumDays;
- (id)maximumMTBF;
- (id)maximumMTBFIfNoBaselineCrashes;
- (id)minimumCrashCount;
- (id)minimumMTBFDelta;
- (id)minimumMTBFFactor;
- (id)minimumUptime;
- (void)addCrashEvent:(id)a3 to:(id)a4;
- (void)checkForOSUpdate;
- (void)evaluateStability;
- (void)reportResultsForBundleID:(id)a3 crashes:(id)a4 uptime:(id)a5 MTBF:(id)a6 result:(BOOL)a7 status:(id)a8;
- (void)setTargetBundleID:(id)a3;
- (void)totalCrashesFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 appVersions:(id)a6 isBaseline:(BOOL)a7 completionHandler:(id)a8;
- (void)totalUptimeFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 targetAppVersions:(id)a6 firstPartyBundleIDs:(id)a7 completionHandler:(id)a8;
@end

@implementation OSAStabilityMonitor

- (OSAStabilityMonitor)initWithParameters:(id)a3 targetBundleID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (+[OSAStabilityMonitor isAvailable])
  {
    v17.receiver = self;
    v17.super_class = (Class)OSAStabilityMonitor;
    v12 = [(OSAStabilityMonitor *)&v17 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_parameters, a3);
      objc_storeStrong((id *)&v13->_targetBundleID, a4);
      id v14 = objc_retainBlock(v11);
      id completionHandler = v13->_completionHandler;
      v13->_id completionHandler = v14;
    }
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

+ (void)evaluateStabilityWithParameters:(id)a3
{
}

+ (void)evaluateStabilityOfBundleID:(id)a3 coalitionName:(id)a4 parameters:(id)a5 completionHandler:(id)a6
{
}

+ (void)evaluateStabilityWithParameters:(id)a3 targetBundleID:(id)a4 coalitionName:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[OSAStabilityMonitor monitorQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008C60;
  v18[3] = &unk_100020CB8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v13, v18);
}

- (void)checkForOSUpdate
{
  v3 = [(OSAStabilityMonitor *)self maximumDays];
  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v5 = [v4 BOOLForKey:@"stability-monitor.lastBuild-hasSupplementalBuild"];

    v6 = +[NSUserDefaults standardUserDefaults];
    v7 = [v6 objectForKey:@"stability-monitor.lastBuild"];

    v8 = +[OSASystemConfiguration sharedInstance];
    id v9 = [v8 buildVersion];

    id v10 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking for OS update.", buf, 2u);
    }

    if (([v7 isEqualToString:v9] & 1) == 0)
    {
      id v11 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v7;
        __int16 v32 = 2114;
        v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Detected build version change from (%{public}@) to (%{public}@)", buf, 0x16u);
      }

      id v12 = +[NSUserDefaults standardUserDefaults];
      [v12 setObject:v9 forKey:@"stability-monitor.lastBuild"];

      v13 = +[NSUserDefaults standardUserDefaults];
      objc_msgSend(v13, "setBool:forKey:", +[OSAStabilityMonitor hasSupplementalBuild](OSAStabilityMonitor, "hasSupplementalBuild"), @"stability-monitor.lastBuild-hasSupplementalBuild");

      if (v7) {
        char v14 = v5;
      }
      else {
        char v14 = 1;
      }
      if ((v14 & 1) == 0)
      {
        id v15 = OSAStabilityMonitorLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Calculating baseline.", buf, 2u);
        }

        id v16 = +[NSUserDefaults standardUserDefaults];
        [v16 removeObjectForKey:@"stability-monitor.baselineUptime"];

        id v17 = +[NSUserDefaults standardUserDefaults];
        [v17 removeObjectForKey:@"stability-monitor.baselineCrashCount"];

        v18 = +[NSUserDefaults standardUserDefaults];
        [v18 removeObjectForKey:@"stability-monitor.baselineVersions"];

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100009218;
        v26[3] = &unk_100020D30;
        id v27 = v3;
        v28 = self;
        id v29 = v7;
        +[OSAStabilityMonitor dateRangeOnBuild:v29 from:0 to:0 completionHandler:v26];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100014C58((uint64_t)self, v19, v20, v21, v22, v23, v24, v25);
  }
}

- (BOOL)isRollbackSupportedForBundleID:(id)a3 reason:(unint64_t *)a4
{
  id v6 = a3;
  if (![(id)objc_opt_class() hasSupplementalBuild])
  {
    BOOL v9 = 0;
    unint64_t v10 = 3;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (![(OSAStabilityMonitor *)self isRollbackEnabledForBundleID:v6])
  {
    BOOL v9 = 0;
    unint64_t v10 = 4;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  targetBundleID = self->_targetBundleID;
  BOOL v8 = targetBundleID == 0;
  BOOL v9 = targetBundleID != 0;
  unint64_t v10 = 6;
  if (!v8) {
    unint64_t v10 = 0;
  }
  if (a4) {
LABEL_8:
  }
    *a4 = v10;
LABEL_9:

  return v9;
}

- (BOOL)recommendRollbackForBundleID:(id)a3 reason:(unint64_t *)a4
{
  id v6 = a3;
  targetBundleID = self->_targetBundleID;
  if (!targetBundleID) {
    goto LABEL_15;
  }
  if ([(NSString *)targetBundleID isEqualToString:v6])
  {
    if (objc_opt_class() && objc_opt_class() && objc_opt_class())
    {
      id v8 = [objc_alloc((Class)SURollbackSuggestionProcessInfo) initWithProcessID:v6];
      BOOL v9 = +[NSError errorWithDomain:@"OSAnalytics" code:1 userInfo:0];
      [v8 setRollbackSuggestionError:v9];

      id v10 = objc_alloc_init((Class)SURollbackSuggestionInfo);
      [v10 setClientIdentifier:@"com.apple.osanalytics"];
      id v26 = v8;
      id v11 = +[NSArray arrayWithObjects:&v26 count:1];
      [v10 setResponsibleProcessesInfo:v11];

      id v12 = objc_alloc((Class)SUManagerClient);
      v13 = +[OSAStabilityMonitor monitorQueue];
      id v14 = [v12 initWithDelegate:0 queue:v13 clientType:0];

      id v23 = 0;
      LODWORD(v13) = [v14 securityResponseRollbackSuggested:v10 error:&v23];
      id v15 = v23;

      if (v13)
      {
        id v16 = OSAStabilityMonitorLogDomain();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v25 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Recommended rollback for %{public}@.", buf, 0xCu);
        }

        BOOL v17 = 1;
        if (!a4) {
          goto LABEL_24;
        }
        unint64_t v18 = 1;
LABEL_23:
        *a4 = v18;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v20 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rollback recommendations are not supported because SoftwareUpdateServices is not available.", buf, 2u);
      }

      id v15 = 0;
    }
    uint64_t v21 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100014E14();
    }

    BOOL v17 = 0;
    if (!a4) {
      goto LABEL_24;
    }
    unint64_t v18 = 5;
    goto LABEL_23;
  }
  if (self->_targetBundleID)
  {
    uint64_t v19 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100014E7C();
    }

    BOOL v17 = 0;
  }
  else
  {
LABEL_15:
    [(OSAStabilityMonitor *)self isRollbackSupportedForBundleID:v6 reason:a4];
    BOOL v17 = 1;
  }
LABEL_25:

  return v17;
}

- (void)evaluateStability
{
  v3 = OSAStabilityMonitorLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef targetBundleID = (const __CFString *)self->_targetBundleID;
    if (!targetBundleID) {
      CFStringRef targetBundleID = @"telemetry mode";
    }
    parameters = self->_parameters;
    *(_DWORD *)buf = 138543618;
    CFStringRef v46 = targetBundleID;
    __int16 v47 = 2114;
    v48 = parameters;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Evaluating stability for %{public}@ with parameters: %{public}@", buf, 0x16u);
  }

  id v6 = [(OSAStabilityMonitor *)self maximumDays];
  v7 = [(OSAStabilityMonitor *)self minimumUptime];
  id v8 = [(OSAStabilityMonitor *)self minimumCrashCount];
  BOOL v9 = [(OSAStabilityMonitor *)self maximumMTBF];
  id v10 = [(OSAStabilityMonitor *)self maximumMTBFIfNoBaselineCrashes];
  id v11 = [(OSAStabilityMonitor *)self minimumMTBFDelta];
  uint64_t v12 = [(OSAStabilityMonitor *)self minimumMTBFFactor];
  v13 = (void *)v12;
  if (v6 && v7 && v8 && v9 && v11 && v12 && v10)
  {
    v33 = v9;
    v34 = v8;
    v30 = v7;
    __int16 v32 = +[NSDate now];
    uint64_t v31 = objc_msgSend(v32, "dateByAddingTimeInterval:", -(double)(unint64_t)(86400 * (void)objc_msgSend(v6, "unsignedIntegerValue")));
    id v14 = +[OSAStabilityMonitor baselineCrashCount];
    id v15 = +[OSAStabilityMonitor baselineUptime];
    id v16 = +[OSAStabilityMonitor baselineVersions];
    BOOL v17 = OSAStabilityMonitorLogDomain();
    unint64_t v18 = v17;
    uint64_t v19 = v14;
    if (v14 && v15 && v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100014F58();
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100009FB4;
      v35[3] = &unk_100020DA8;
      v35[4] = self;
      id v36 = v16;
      id v37 = v14;
      id v38 = v15;
      v7 = v30;
      id v39 = v30;
      id v40 = v34;
      id v41 = v33;
      id v42 = v11;
      id v43 = v13;
      id v44 = v10;
      uint64_t v21 = (void *)v31;
      uint64_t v20 = v32;
      +[OSAStabilityMonitor dateRangeOnBuild:0 from:v31 to:v32 completionHandler:v35];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100014FD0(v18);
      }

      [(OSAStabilityMonitor *)self reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"Error retrieving baseline values"];
      uint64_t v21 = (void *)v31;
      uint64_t v20 = v32;
      v7 = v30;
    }

    BOOL v9 = v33;
    id v8 = v34;
  }
  else
  {
    uint64_t v22 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100014EE8((uint64_t)self, v22, v23, v24, v25, v26, v27, v28);
    }

    id completionHandler = (void (**)(id, void))self->_completionHandler;
    if (completionHandler) {
      completionHandler[2](completionHandler, 0);
    }
  }
}

- (void)totalUptimeFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 targetAppVersions:(id)a6 firstPartyBundleIDs:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  uint64_t v19 = [[OSAAppUsageAccumulator alloc] initWithStartDate:v13 endDate:v14 targetAppVersions:v18 firstPartyBundleIDs:v17];

  if (v15) {
    [(OSAAccumulator *)v19 setTargetKey:v15];
  }
  uint64_t v20 = +[_DKQuery predicateForEventsIntersectingDateRangeFrom:to:](_DKQuery, "predicateForEventsIntersectingDateRangeFrom:to:", v13, v14, self);
  uint64_t v21 = +[_DKSystemEventStreams appInFocusStream];
  id v44 = v21;
  id v36 = v15;
  uint64_t v22 = +[NSArray arrayWithObjects:&v44 count:1];
  uint64_t v23 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
  id v43 = v23;
  uint64_t v24 = +[NSArray arrayWithObjects:&v43 count:1];
  uint64_t v25 = +[_DKEventQuery eventQueryWithPredicate:v20 eventStreams:v22 offset:0 limit:0 sortDescriptors:v24];

  id v26 = objc_alloc((Class)BMCoreDuetStream);
  uint64_t v27 = +[_DKKnowledgeStore knowledgeStore];
  id v28 = [v26 initWithKnowledgeStore:v27 clientContext:0 identifier:0];

  id v29 = [v28 publisherForQuery:v25];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10000B0D0;
  v42[3] = &unk_100020DD0;
  v42[4] = v35;
  v30 = [v29 filterWithIsIncluded:v42];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000B174;
  v39[3] = &unk_100020DF8;
  id v41 = v16;
  id v40 = v19;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000B210;
  v37[3] = &unk_100020E20;
  id v38 = v40;
  uint64_t v31 = v40;
  id v32 = v16;
  id v33 = [v30 sinkWithCompletion:v39 receiveInput:v37];
}

- (void)totalCrashesFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 appVersions:(id)a6 isBaseline:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a8;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [[OSACrashAccumulator alloc] initWithTargetAppVersions:v16 isBaseline:v9];

  if (v14) {
    [(OSAAccumulator *)v19 setTargetKey:v14];
  }
  id v20 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:v18 endDate:v17 maxEvents:0 lastN:0 reversed:0];

  uint64_t v21 = BiomeLibrary();
  uint64_t v22 = [v21 OSAnalytics];
  uint64_t v23 = [v22 Stability];
  uint64_t v24 = [v23 Crash];
  uint64_t v25 = [v24 publisherWithOptions:v20];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000B440;
  v31[3] = &unk_100020DF8;
  id v33 = v15;
  id v32 = v19;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000B4DC;
  v29[3] = &unk_100020E48;
  v29[4] = self;
  v30 = v32;
  id v26 = v32;
  id v27 = v15;
  id v28 = [v25 sinkWithCompletion:v31 receiveInput:v29];
}

- (void)addCrashEvent:(id)a3 to:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = [(OSAStabilityMonitor *)self coalitionBasedBundleIDs];
  id v8 = [v16 eventBody];
  BOOL v9 = [v8 bundleID];
  unsigned __int8 v10 = [v7 containsObject:v9];
  id v11 = [v16 eventBody];
  uint64_t v12 = v11;
  if (v10) {
    [v11 coalitionName];
  }
  else {
  id v13 = [v11 bundleID];
  }

  if ([(OSAStabilityMonitor *)self isValidBundleID:v13])
  {
    if (![(OSAStabilityMonitor *)self excludeThirdParty]
      || ([v16 eventBody],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 isFirstParty],
          v14,
          v15))
    {
      [v6 addEvent:v16 withBundleID:v13];
    }
  }
}

+ (void)dateRangeOnBuild:(id)a3 from:(id)a4 to:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[BMStreams deviceMetadataStream];
  if (v11)
  {
    [v11 timeIntervalSinceReferenceDate];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = 0;
    if (v10)
    {
LABEL_3:
      [v10 timeIntervalSinceReferenceDate];
      unsigned int v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v16 = [v13 publisherWithStartTime:v14 endTime:v15 maxEvents:0 reversed:1];

      if (!v11) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  id v16 = [v13 publisherWithStartTime:v14 endTime:0 maxEvents:0 reversed:1];
  if (v11) {
LABEL_4:
  }

LABEL_5:
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10000587C;
  void v39[4] = sub_10000586C;
  id v40 = 0;
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_10000587C;
  id v37 = sub_10000586C;
  id v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  if (v9)
  {
    id v17 = v9;
  }
  else
  {
    id v18 = +[OSASystemConfiguration sharedInstance];
    id v17 = [v18 buildVersion];

    objc_storeStrong(v34 + 5, a5);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000B96C;
  v27[3] = &unk_100020E70;
  id v19 = v12;
  id v28 = v19;
  id v29 = v39;
  v30 = &v33;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000BA1C;
  v22[3] = &unk_100020E98;
  id v20 = v17;
  id v23 = v20;
  uint64_t v24 = &v33;
  uint64_t v25 = v31;
  id v26 = v39;
  id v21 = [v16 sinkWithCompletion:v27 shouldContinue:v22];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
}

+ (id)calculateStabilityRateWithAppUsage:(id)a3 crashCounts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v38;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v14 = [v5 objectForKeyedSubscript:v13];
        [v14 doubleValue];
        double v16 = v15;

        id v17 = [v6 objectForKeyedSubscript:v13];
        id v18 = [v17 unsignedIntegerValue];

        if (v18)
        {
          double v19 = v16 / (double)(unint64_t)v18;
          if (!v9 || v19 < v11)
          {
            id v20 = v13;

            id v9 = v20;
            double v11 = v19;
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v5;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v34;
    double v26 = 0.0;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v21);
        }
        id v28 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        if ((objc_msgSend(v28, "isEqualToDate:", v9, (void)v33) & 1) == 0)
        {
          id v29 = [v21 objectForKeyedSubscript:v28];
          [v29 doubleValue];
          double v26 = v26 + v30;

          uint64_t v31 = [v6 objectForKeyedSubscript:v28];
          uint64_t v24 = (OSAStabilityRate *)((char *)v24 + (void)[v31 unsignedIntegerValue]);
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);

    if (v24) {
      uint64_t v24 = [[OSAStabilityRate alloc] initWithAppUptime:v24 crashCount:v26 / 3600.0];
    }
  }
  else
  {

    uint64_t v24 = 0;
  }

  return v24;
}

- (void)reportResultsForBundleID:(id)a3 crashes:(id)a4 uptime:(id)a5 MTBF:(id)a6 result:(BOOL)a7 status:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v9);
  }
  uint64_t v25 = v15;
  double v26 = v16;
  id v27 = v14;
  id v28 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v14;
  id v23 = v16;
  id v24 = v15;
  AnalyticsSendEventLazy();
}

- (BOOL)isValidBundleID:(id)a3
{
  id v3 = a3;
  +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", @"com.apple.AirPlayUIAgent", @"com.apple.AppStoreDaemon.StoreUIService", @"com.apple.BluetoothUIServer", @"com.apple.CoreLocationAgent", @"com.apple.Diagnostics", @"com.apple.DiskImageMounter", @"com.apple.FileProviderUI.ServerAuthUIExtension", @"com.apple.FindMyMacMessenger", @"com.apple.mobileslideshow.photospicker", @"com.apple.SecurityAgent", @"com.apple.ssinvitationagent", @"com.apple.systemevents", @"com.apple.tv.TVNotificationContentExtension", @"com.apple.universalcontrol", @"com.apple.UserNotificationCenter", @"com.apple.VoiceMemos.VoiceMemosShareExtension", @"com.apple.VoiceOver",
    @"com.apple.wifi.WiFiAgent",
  v4 = 0);
  [v4 addObjectsFromArray:&off_100022EE8];
  if (v3 && ([v4 containsObject:v3] & 1) == 0) {
    unsigned int v5 = [v3 containsString:@"/"] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)hasSupplementalBuild
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  id v3 = [v2 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
  v4 = +[OSASystemConfiguration sharedInstance];
  unsigned int v5 = [v4 buildVersion];
  char v6 = [v3 isEqualToString:v5] ^ 1;

  return v6;
}

+ (id)baselineCrashCount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"stability-monitor.baselineCrashCount"];

  return v3;
}

+ (id)baselineUptime
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"stability-monitor.baselineUptime"];

  return v3;
}

+ (id)baselineVersions
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"stability-monitor.baselineVersions"];

  return v3;
}

- (id)loadParameterForKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[OSASystemConfiguration sharedInstance];
  char v6 = [v5 buildVersion];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v20[0] = v6;
  v20[1] = @"default";
  id v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2, 0);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v12 objectForKeyedSubscript:v4];
            if (v13)
            {
              id v14 = (void *)v13;

              goto LABEL_13;
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)isRollbackEnabledForBundleID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(OSAStabilityMonitor *)self loadParameterForKey:@"enabledBundleIDs"];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)maximumDays
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"maximumDays"];
}

- (id)coalitionBasedBundleIDs
{
  v2 = [(OSAStabilityMonitor *)self loadParameterForKey:@"coalitionBasedBundleIDs"];
  if (v2)
  {
    id v3 = +[NSSet setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)minimumUptime
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"minimumUptime"];
}

- (id)minimumCrashCount
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"minimumCrashCount"];
}

- (id)maximumMTBF
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"maximumMTBF"];
}

- (id)maximumMTBFIfNoBaselineCrashes
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"maximumMTBFIfNoBaselineCrashes"];
}

- (id)minimumMTBFDelta
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"minimumMTBFDelta"];
}

- (id)minimumMTBFFactor
{
  return [(OSAStabilityMonitor *)self loadParameterForKey:@"minimumMTBFFactor"];
}

- (BOOL)excludeThirdParty
{
  v2 = [(OSAStabilityMonitor *)self loadParameterForKey:@"excludeThirdParty"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

+ (id)monitorQueue
{
  if (qword_100026288 != -1) {
    dispatch_once(&qword_100026288, &stru_100020EE0);
  }
  v2 = (void *)qword_100026280;

  return v2;
}

+ (BOOL)isAvailable
{
  if (objc_opt_class() && objc_opt_class() && objc_opt_class()) {
    return 1;
  }
  unsigned __int8 v3 = OSAStabilityMonitorLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100015158(v3);
  }

  return 0;
}

- (NSString)targetBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetBundleID, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end