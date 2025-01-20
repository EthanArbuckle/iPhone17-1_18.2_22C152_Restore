@interface AppInstallObserver
- (AppInstallObserver)init;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorShouldBeginPostProcessing:(id)a3 forApplicationRecord:(id)a4;
@end

@implementation AppInstallObserver

- (AppInstallObserver)init
{
  v22.receiver = self;
  v22.super_class = (Class)AppInstallObserver;
  v2 = [(AppInstallObserver *)&v22 init];
  if (v2)
  {
    v3 = objc_alloc_init(TaskQueue);
    policyQueue = v2->_policyQueue;
    v2->_policyQueue = v3;

    v5 = v2->_policyQueue;
    if (v5) {
      [(NSOperationQueue *)v5->_operationQueue setName:@"com.apple.appstored.AppInstallObserver.policyQueue"];
    }
    uint64_t v6 = sub_1003E0BA4();
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v6;

    uint64_t v8 = sub_1002ED270();
    installScheduler = v2->_installScheduler;
    v2->_installScheduler = (AppInstallScheduler *)v8;

    v10 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Observing installation notifications", buf, 2u);
    }

    v11 = objc_alloc_init(UnfairLock);
    lock = v2->_lock;
    v2->_lock = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    observedCoordinators = v2->_observedCoordinators;
    v2->_observedCoordinators = v13;

    uint64_t v15 = +[NSMutableSet set];
    baObservationSet = v2->_baObservationSet;
    v2->_baObservationSet = (NSMutableSet *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    baInfo = v2->_baInfo;
    v2->_baInfo = v17;

    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_10028FC88;
    v26 = &unk_100525060;
    v27 = v2;
    uint64_t v19 = +[BAAppStoreProgressObserver progressObserverWithConfiguration:buf];
    baObserver = v2->_baObserver;
    v2->_baObserver = (BAAppStoreProgressObserver *)v19;
  }
  return v2;
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
}

- (void)coordinatorShouldBeginPostProcessing:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  v7 = [a4 URL];
  uint64_t v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 bundleID];
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "coordinatorShouldBeginPostProcessing for bundleID: %{public}@ at URL: %{public}@", buf, 0x16u);
  }
  databaseStore = self->_databaseStore;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10028ECAC;
  v13[3] = &unk_100522AB8;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:v13];
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v9 = a3;
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = [v9 uniqueIdentifier];
    if (a5 >= 3)
    {
      id v14 = +[NSString stringWithFormat:@"Unknown progress value %lu", a5];
    }
    else
    {
      id v14 = off_1005250D0[a5];
    }
    *(_DWORD *)buf = 138413058;
    v16 = v13;
    __int16 v17 = 2048;
    double v18 = a4;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2048;
    double v22 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "(AppInstallObserver) Coordinator %@ sent progress: %f for phase: %@ overall: %f", buf, 0x2Au);
  }
  if (a5 == 1)
  {
    id v11 = sub_100388088();
    id v12 = [v9 bundleID];
    sub_10038A4DC((uint64_t)v11, v12, fmin(a4 / 100.0, 1.0));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baInfo, 0);
  objc_storeStrong((id *)&self->_baObservationSet, 0);
  objc_storeStrong((id *)&self->_baObserver, 0);
  objc_storeStrong((id *)&self->_observedCoordinators, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_installScheduler, 0);
  objc_storeStrong((id *)&self->_installObserver, 0);
  objc_storeStrong((id *)&self->_policyQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
}

@end