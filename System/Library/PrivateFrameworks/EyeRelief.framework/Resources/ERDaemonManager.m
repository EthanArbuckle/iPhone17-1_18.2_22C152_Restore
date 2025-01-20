@interface ERDaemonManager
+ (BOOL)isEyeReliefSupported;
+ (void)reportAnalyticsDistanceEvent:(id)a3;
+ (void)reportAnalyticsInterventionOutcome:(int64_t)a3;
- (BOOL)isDemoModeActive;
- (BOOL)isSamplingActive;
- (BOOL)isSamplingEnabled;
- (ERDaemonManager)init;
- (EREyeReliefEngine)engine;
- (EREyeReliefServer)server;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSBackgroundActivityScheduler)distanceSampleActivity;
- (NSDate)inactivityTimestamp;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)samplingStateQueue;
- (id)nonPermissibleOnscreenContent;
- (void)dealloc;
- (void)disablePermissibleOnscreenContentMonitoring;
- (void)enablePermissibleOnscreenContentMonitoring;
- (void)handleDistanceSample:(id)a3 interventionType:(int64_t)a4 withBackgroundActivityCompletionHandler:(id)a5;
- (void)handleTransitionForLayout:(id)a3;
- (void)interveneWithType:(int64_t)a3 withCompletion:(id)a4;
- (void)scheduleSampling;
- (void)setDistanceSampleActivity:(id)a3;
- (void)setEngine:(id)a3;
- (void)setInactivityTimestamp:(id)a3;
- (void)setIsDemoModeActive:(BOOL)a3;
- (void)setIsSamplingActive:(BOOL)a3;
- (void)setIsSamplingEnabled:(BOOL)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setSamplingStateQueue:(id)a3;
- (void)setServer:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)start;
- (void)unscheduleSamplingWithReason:(int64_t)a3;
@end

@implementation ERDaemonManager

- (ERDaemonManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)ERDaemonManager;
  v2 = [(ERDaemonManager *)&v23 init];
  if (v2)
  {
    uint64_t v3 = +[EREyeReliefServer sharedServer];
    server = v2->_server;
    v2->_server = (EREyeReliefServer *)v3;

    if (!v2->_server)
    {
      v16 = +[NSString stringWithFormat:@"Failed to initialize mach service. Going idle..."];
      +[ERLogging log:v16 withType:1];

      v15 = 0;
      goto LABEL_8;
    }
    objc_initWeak(&location, v2);
    v5 = v2->_server;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000044AC;
    v20[3] = &unk_100008210;
    objc_copyWeak(&v21, &location);
    [(EREyeReliefServer *)v5 setDistanceSamplingToggleHandler:v20];
    v6 = v2->_server;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100004698;
    v18[3] = &unk_100008238;
    objc_copyWeak(&v19, &location);
    [(EREyeReliefServer *)v6 setIsDistanceSamplingEnabledHandler:v18];
    uint64_t v7 = objc_opt_new();
    engine = v2->_engine;
    v2->_engine = (EREyeReliefEngine *)v7;

    v9 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.eyereliefd.distanceSampling"];
    distanceSampleActivity = v2->_distanceSampleActivity;
    v2->_distanceSampleActivity = v9;

    [(NSBackgroundActivityScheduler *)v2->_distanceSampleActivity setRepeats:1];
    [(NSBackgroundActivityScheduler *)v2->_distanceSampleActivity setTolerance:5.0];
    [(NSBackgroundActivityScheduler *)v2->_distanceSampleActivity setInterval:80.0];
    [(NSBackgroundActivityScheduler *)v2->_distanceSampleActivity setQualityOfService:17];
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.eyerelief.samplingstatequeue", 0);
    samplingStateQueue = v2->_samplingStateQueue;
    v2->_samplingStateQueue = (OS_dispatch_queue *)v11;

    v13 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.EyeRelief"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v13;

    if (os_variant_has_internal_content()) {
      v2->_isDemoModeActive = [(NSUserDefaults *)v2->_userDefaults BOOLForKey:@"demoMode"];
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  v15 = v2;
LABEL_8:

  return v15;
}

- (void)dealloc
{
  uint64_t v3 = [(ERDaemonManager *)self layoutMonitor];

  if (v3)
  {
    v4 = [(ERDaemonManager *)self layoutMonitor];
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)ERDaemonManager;
  [(ERDaemonManager *)&v5 dealloc];
}

- (void)start
{
  id v9 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.eyereliefd.startup"];
  [v9 setPreregistered:1];
  [v9 scheduleWithBlock:&stru_100008278];
  if (+[ERDaemonManager isEyeReliefSupported])
  {
    uint64_t v3 = [(ERDaemonManager *)self userDefaults];
    -[ERDaemonManager setIsSamplingEnabled:](self, "setIsSamplingEnabled:", [v3 BOOLForKey:@"samplingEnabled"]);
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"Eye Relief is not supported on this device."];
    +[ERLogging log:v4 withType:1];

    [(ERDaemonManager *)self setIsSamplingEnabled:0];
  }
  if ([(ERDaemonManager *)self isSamplingEnabled])
  {
    [(ERDaemonManager *)self enablePermissibleOnscreenContentMonitoring];
    [(ERDaemonManager *)self scheduleSampling];
  }
  unsigned int v5 = [(ERDaemonManager *)self isSamplingEnabled];
  v6 = "disabled";
  if (v5) {
    v6 = "enabled";
  }
  uint64_t v7 = +[NSString stringWithFormat:@"Distance sampling is currently %s", v6];
  +[ERLogging log:v7 withType:0];

  v8 = [(ERDaemonManager *)self server];
  [v8 startServer];
}

- (void)enablePermissibleOnscreenContentMonitoring
{
  uint64_t v3 = +[NSString stringWithFormat:@"Enabling permissible distance sample monitoring"];
  +[ERLogging log:v3 withType:0];

  v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004A58;
  v6[3] = &unk_1000082A0;
  v6[4] = self;
  [v4 setTransitionHandler:v6];
  unsigned int v5 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v4];
  [(ERDaemonManager *)self setLayoutMonitor:v5];
}

- (void)disablePermissibleOnscreenContentMonitoring
{
  uint64_t v3 = +[NSString stringWithFormat:@"Disabling permissible distance sample monitoring"];
  +[ERLogging log:v3 withType:0];

  v4 = [(ERDaemonManager *)self layoutMonitor];
  [v4 invalidate];

  [(ERDaemonManager *)self setLayoutMonitor:0];
}

- (void)handleTransitionForLayout:(id)a3
{
  v4 = [a3 elements];
  unsigned int v5 = [(ERDaemonManager *)self nonPermissibleOnscreenContent];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      dispatch_queue_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "bundleIdentifier", (void)v19);
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [v11 identifier];
      }
      v15 = v14;

      if ([v15 isEqualToString:@"com.apple.lock-screen"]) {
        break;
      }
      if ([v5 containsObject:v15])
      {
        v17 = +[NSString stringWithFormat:@"Onscreen content does not permit distance sampling"];
        +[ERLogging log:v17 withType:3];
        uint64_t v18 = 2;
        goto LABEL_16;
      }

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    v17 = +[NSString stringWithFormat:@"Lock screen does not permit distance sampling"];
    +[ERLogging log:v17 withType:3];
    uint64_t v18 = 1;
LABEL_16:

    [(ERDaemonManager *)self unscheduleSamplingWithReason:v18];
    goto LABEL_17;
  }
LABEL_13:

  v16 = +[NSString stringWithFormat:@"Onscreen content permits distance sampling"];
  +[ERLogging log:v16 withType:3];

  [(ERDaemonManager *)self scheduleSampling];
LABEL_17:
}

- (id)nonPermissibleOnscreenContent
{
  return +[NSSet setWithObjects:@"com.apple.lock-screen", @"com.apple.facetime", @"com.apple.camera", @"com.apple.Preferences", @"com.apple.MobileSMS", @"com.apple.mobilephone", @"com.apple.Photo-Booth", @"com.apple.InCallService", @"com.apple.SOSBuddy", 0];
}

- (void)scheduleSampling
{
  uint64_t v3 = [(ERDaemonManager *)self samplingStateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E48;
  block[3] = &unk_100008368;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)unscheduleSamplingWithReason:(int64_t)a3
{
  unsigned int v5 = [(ERDaemonManager *)self samplingStateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000545C;
  v6[3] = &unk_100008390;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)handleDistanceSample:(id)a3 interventionType:(int64_t)a4 withBackgroundActivityCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    v12 = +[NSString stringWithFormat:@"Distance sample was nil. Will schedule next sample"];
    +[ERLogging log:v12 withType:0];

    goto LABEL_8;
  }
  if ([v8 distanceCategory] == (id)1 || objc_msgSend(v8, "distanceCategory") == (id)2)
  {
    CFStringRef v10 = @"Distance was normal. Will schedule next sample";
  }
  else
  {
    if ((unint64_t)[v8 distanceCategory] | a4)
    {
      id v13 = [v8 distanceCategory];
      if (a4 && !v13)
      {
        id v14 = +[NSString stringWithFormat:@"Distance too close, intervention needed. Will launch EyeReliefUI with intervention type %li", a4];
        +[ERLogging log:v14 withType:0];

        [(id)objc_opt_class() reportAnalyticsDistanceEvent:v8];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100005800;
        v16[3] = &unk_1000083B8;
        v16[4] = self;
        id v17 = v9;
        [(ERDaemonManager *)self interveneWithType:a4 withCompletion:v16];

        goto LABEL_9;
      }
      v15 = +[NSString stringWithFormat:@"Unclear what to do with distance sample. Will ignore it and schedule next sample"];
      +[ERLogging log:v15 withType:0];

      goto LABEL_6;
    }
    CFStringRef v10 = @"Distance too close but intervention not needed. Will schedule next sample";
  }
  dispatch_queue_t v11 = +[NSString stringWithFormat:v10];
  +[ERLogging log:v11 withType:0];

LABEL_6:
  [(id)objc_opt_class() reportAnalyticsDistanceEvent:v8];
LABEL_8:
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_9:
}

+ (BOOL)isEyeReliefSupported
{
  return _MGGetBoolAnswer(@"8olRm6C1xqr7AJGpLRnpSw", a2);
}

- (void)interveneWithType:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.EyeReliefUI" viewControllerClassName:@"EyeReliefUI.ViewController"];
  id v8 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v26[0] = @"Type";
  id v9 = +[NSNumber numberWithInteger:a3];
  v26[1] = @"Distance Threshold";
  v27[0] = v9;
  CFStringRef v10 = [(ERDaemonManager *)self engine];
  dispatch_queue_t v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 tooCloseDistanceThreshold]);
  v27[1] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v8 setUserInfo:v12];

  id v13 = +[SBSRemoteAlertHandle newHandleWithDefinition:v7 configurationContext:v8];
  id v14 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  long long v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  long long v22 = sub_100005B2C;
  objc_super v23 = &unk_1000083E0;
  id v24 = v13;
  id v25 = v6;
  id v15 = v6;
  id v16 = v13;
  id v17 = +[BSActionResponder responderWithHandler:&v20];
  id v18 = [objc_alloc((Class)BSAction) initWithInfo:0 responder:v17];
  long long v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, 0, v20, v21, v22, v23);
  [v14 setActions:v19];

  [v16 activateWithContext:v14];
}

+ (void)reportAnalyticsDistanceEvent:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

+ (void)reportAnalyticsInterventionOutcome:(int64_t)a3
{
}

- (EREyeReliefServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (EREyeReliefEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (NSBackgroundActivityScheduler)distanceSampleActivity
{
  return self->_distanceSampleActivity;
}

- (void)setDistanceSampleActivity:(id)a3
{
}

- (NSDate)inactivityTimestamp
{
  return self->_inactivityTimestamp;
}

- (void)setInactivityTimestamp:(id)a3
{
}

- (BOOL)isSamplingEnabled
{
  return self->_isSamplingEnabled;
}

- (void)setIsSamplingEnabled:(BOOL)a3
{
  self->_isSamplingEnabled = a3;
}

- (BOOL)isSamplingActive
{
  return self->_isSamplingActive;
}

- (void)setIsSamplingActive:(BOOL)a3
{
  self->_isSamplingActive = a3;
}

- (BOOL)isDemoModeActive
{
  return self->_isDemoModeActive;
}

- (void)setIsDemoModeActive:(BOOL)a3
{
  self->_isDemoModeActive = a3;
}

- (OS_dispatch_queue)samplingStateQueue
{
  return self->_samplingStateQueue;
}

- (void)setSamplingStateQueue:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_samplingStateQueue, 0);
  objc_storeStrong((id *)&self->_inactivityTimestamp, 0);
  objc_storeStrong((id *)&self->_distanceSampleActivity, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end