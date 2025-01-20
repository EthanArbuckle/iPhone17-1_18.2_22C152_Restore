@interface WOWorkoutExternalProviderObserver
+ (id)sharedInstance;
- (id)_init;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)queue_evaluateRemovedBundleIdentifiers:(id)a3;
@end

@implementation WOWorkoutExternalProviderObserver

+ (id)sharedInstance
{
  if (qword_1A6E8 != -1) {
    dispatch_once(&qword_1A6E8, &stru_14458);
  }
  v2 = (void *)qword_1A6E0;

  return v2;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)WOWorkoutExternalProviderObserver;
  v2 = [(WOWorkoutExternalProviderObserver *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WorkoutHealthPlugin.ExternalProviderWorkerQueue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v3;

    _HKInitializeLogging();
    v5 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[WorkoutExternalProviderObserver] starting workout external provider observer", v8, 2u);
    }
    v6 = +[LSApplicationWorkspace defaultWorkspace];
    [v6 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WOWorkoutExternalProviderObserver;
  [(WOWorkoutExternalProviderObserver *)&v4 dealloc];
}

- (void)queue_evaluateRemovedBundleIdentifiers:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[WorkoutExternalProviderObserver] evaluating uninstalled apps: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v6 = +[WorkoutKitXPCServiceHelper sharedInstance];
  [v6 handleUninstalledAppIds:v4 completion:&stru_14498];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_283C;
  v7[3] = &unk_144C0;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

- (void).cxx_destruct
{
}

@end