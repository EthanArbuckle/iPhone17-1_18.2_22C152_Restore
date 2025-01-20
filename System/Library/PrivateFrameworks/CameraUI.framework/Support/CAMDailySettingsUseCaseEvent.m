@interface CAMDailySettingsUseCaseEvent
+ (PPSTelemetryIdentifier)getCameraCaptureStreamID;
+ (id)eventName;
+ (void)registerForBackgroundTaskWithQueue:(id)a3;
- (BOOL)isMetricSubmissionsCompleted;
- (BSInvalidatable)_associatedAppObserver;
- (CAMDailySettingsUseCaseEvent)initWithQueue:(id)a3 andMetricsSubmittedBlock:(id)a4;
- (OS_dispatch_queue)_metricQueue;
- (SBSCaptureButtonAppConfigurationCoordinator)_appConfigurationController;
- (id)_completion;
- (unint64_t)_numberMetricSubmisions;
- (unint64_t)_numberOfMetricsSubmitted;
- (void)dealloc;
- (void)set_completion:(id)a3;
- (void)set_numberMetricSubmisions:(unint64_t)a3;
- (void)set_numberOfMetricsSubmitted:(unint64_t)a3;
- (void)submitCameraCapturePreferencesWithCompletion:(id)a3;
- (void)submitMetrics;
@end

@implementation CAMDailySettingsUseCaseEvent

+ (void)registerForBackgroundTaskWithQueue:(id)a3
{
  id v3 = a3;
  v4 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent Registering to run in background", buf, 2u);
  }

  v5 = +[BGSystemTaskScheduler sharedScheduler];
  v6 = +[CAMDailySettingsUseCaseEvent eventName];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004CD4;
  v8[3] = &unk_100008298;
  id v9 = v3;
  id v7 = v3;
  [v5 registerForTaskWithIdentifier:v6 usingQueue:v7 launchHandler:v8];
}

- (CAMDailySettingsUseCaseEvent)initWithQueue:(id)a3 andMetricsSubmittedBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CAMDailySettingsUseCaseEvent;
  id v9 = [(CAMDailySettingsUseCaseEvent *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__metricQueue, a3);
    id v11 = objc_retainBlock(v8);
    id completion = v10->__completion;
    v10->__id completion = v11;

    v13 = (SBSCaptureButtonAppConfigurationCoordinator *)objc_alloc_init((Class)SBSCaptureButtonAppConfigurationCoordinator);
    appConfigurationController = v10->__appConfigurationController;
    v10->__appConfigurationController = v13;
  }
  return v10;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->__associatedAppObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CAMDailySettingsUseCaseEvent;
  [(CAMDailySettingsUseCaseEvent *)&v3 dealloc];
}

- (BOOL)isMetricSubmissionsCompleted
{
  objc_super v3 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134349312;
    unint64_t v7 = [(CAMDailySettingsUseCaseEvent *)self _numberOfMetricsSubmitted];
    __int16 v8 = 2050;
    unint64_t v9 = [(CAMDailySettingsUseCaseEvent *)self _numberMetricSubmisions];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent isMetricSubmissionsCompleted _numberOfMetricsSubmitted %{public}lu _numberMetricSubmisions %{public}lu", (uint8_t *)&v6, 0x16u);
  }

  unint64_t v4 = [(CAMDailySettingsUseCaseEvent *)self _numberOfMetricsSubmitted];
  return v4 == [(CAMDailySettingsUseCaseEvent *)self _numberMetricSubmisions];
}

- (void)submitMetrics
{
  objc_initWeak(&location, self);
  unint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  int v6 = sub_100005238;
  unint64_t v7 = &unk_1000082C0;
  objc_copyWeak(&v8, &location);
  objc_super v3 = objc_retainBlock(&v4);
  -[CAMDailySettingsUseCaseEvent submitCameraCapturePreferencesWithCompletion:](self, "submitCameraCapturePreferencesWithCompletion:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)submitCameraCapturePreferencesWithCompletion:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  char v5 = MGGetBoolAnswer();
  int v6 = os_log_create("com.apple.camera", "Nebula");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent submitCameraCapturePreferencesWithCompletion called", buf, 2u);
    }

    [(CAMDailySettingsUseCaseEvent *)self set_numberMetricSubmisions:(char *)[(CAMDailySettingsUseCaseEvent *)self _numberMetricSubmisions] + 1];
    objc_initWeak(&location, self);
    *(void *)buf = 0;
    objc_super v16 = buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v8 = [(CAMDailySettingsUseCaseEvent *)self _appConfigurationController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100005658;
    v11[3] = &unk_100008310;
    objc_copyWeak(&v14, &location);
    v13 = buf;
    v12 = v4;
    unint64_t v9 = [v8 addObserverForAssociatedAppUpdatesUsingBlock:v11];
    associatedAppObserver = self->__associatedAppObserver;
    self->__associatedAppObserver = v9;

    objc_destroyWeak(&v14);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent submitCameraCapturePreferencesWithCompletion not supported", buf, 2u);
    }

    v4[2](v4);
  }
}

+ (PPSTelemetryIdentifier)getCameraCaptureStreamID
{
  if (qword_10000C4C0 != -1) {
    dispatch_once(&qword_10000C4C0, &stru_100008330);
  }
  return (PPSTelemetryIdentifier *)qword_10000C4B8;
}

+ (id)eventName
{
  return @"com.apple.camera.CAMNebulaDaemon.DailySettingsUseCaseEvent";
}

- (unint64_t)_numberMetricSubmisions
{
  return self->__numberMetricSubmisions;
}

- (void)set_numberMetricSubmisions:(unint64_t)a3
{
  self->__numberMetricSubmisions = a3;
}

- (unint64_t)_numberOfMetricsSubmitted
{
  return self->__numberOfMetricsSubmitted;
}

- (void)set_numberOfMetricsSubmitted:(unint64_t)a3
{
  self->__numberOfMetricsSubmitted = a3;
}

- (SBSCaptureButtonAppConfigurationCoordinator)_appConfigurationController
{
  return self->__appConfigurationController;
}

- (BSInvalidatable)_associatedAppObserver
{
  return self->__associatedAppObserver;
}

- (OS_dispatch_queue)_metricQueue
{
  return self->__metricQueue;
}

- (id)_completion
{
  return self->__completion;
}

- (void)set_completion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completion, 0);
  objc_storeStrong((id *)&self->__metricQueue, 0);
  objc_storeStrong((id *)&self->__associatedAppObserver, 0);
  objc_storeStrong((id *)&self->__appConfigurationController, 0);
}

@end