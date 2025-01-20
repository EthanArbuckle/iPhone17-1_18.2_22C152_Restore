@interface StoreKitAppLaunchObserver
- (StoreKitAppLaunchObserver)init;
- (StoreKitAppLaunchObserverDelegate)delegate;
- (void)_appDidLaunch:(id)a3;
- (void)_startObservingIfNecessary;
- (void)_stopObserving;
- (void)_stopObservingIfNecessary;
- (void)observeAppLaunchForBundleIDs:(id)a3;
- (void)removeObservationForBundleIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopObserving;
@end

@implementation StoreKitAppLaunchObserver

- (StoreKitAppLaunchObserver)init
{
  v18.receiver = self;
  v18.super_class = (Class)StoreKitAppLaunchObserver;
  v2 = [(StoreKitAppLaunchObserver *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreKit.StoreKitAppLaunchObserver.observations", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreKit.StoreKitAppLaunchObserver.notifyQueue", 0);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v5;

    v7 = (BMBiomeScheduler *)[objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.StoreKit.StoreKitAppLaunchObserver.scheduler" targetQueue:v2->_observerQueue waking:1];
    scheduler = v2->_scheduler;
    v2->_scheduler = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    bundleIDsToObserve = v2->_bundleIDsToObserve;
    v2->_bundleIDsToObserve = v9;

    sink = v2->_sink;
    v2->_sink = 0;

    v12 = +[NSUUID UUID];
    v13 = [v12 UUIDString];
    v14 = [v13 componentsSeparatedByString:@"-"];
    uint64_t v15 = [v14 firstObject];
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v15;
  }
  return v2;
}

- (void)observeAppLaunchForBundleIDs:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008898C;
  v7[3] = &unk_1003580D0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

- (void)removeObservationForBundleIDs:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088BE8;
  v7[3] = &unk_1003580D0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

- (void)stopObserving
{
  observerQueue = self->_observerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088E20;
  block[3] = &unk_100358170;
  block[4] = self;
  dispatch_async(observerQueue, block);
}

- (void)_stopObserving
{
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  if (qword_1003A0420 != -1) {
    dispatch_once(&qword_1003A0420, &stru_10035A3F0);
  }
  if (os_log_type_enabled((os_log_t)qword_1003A03E0, OS_LOG_TYPE_DEBUG)) {
    sub_1002C9924();
  }
  [(NSMutableSet *)self->_bundleIDsToObserve removeAllObjects];
}

- (void)_startObservingIfNecessary
{
  if (self->_sink)
  {
    if (qword_1003A0420 != -1) {
      dispatch_once(&qword_1003A0420, &stru_10035A3F0);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A03E0, OS_LOG_TYPE_DEBUG)) {
      sub_1002C9A5C();
    }
  }
  else if ([(NSMutableSet *)self->_bundleIDsToObserve count])
  {
    if (qword_1003A0420 != -1) {
      dispatch_once(&qword_1003A0420, &stru_10035A3F0);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A03E0, OS_LOG_TYPE_DEBUG)) {
      sub_1002C99F4();
    }
    objc_initWeak(&location, self);
    id v3 = [(NSString *)self->_logKey copy];
    id v4 = +[BMStreams appLaunch];
    dispatch_queue_t v5 = [v4 publisher];
    id v6 = [v5 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:self->_bundleIDsToObserve];
    v7 = [v6 filterWithKeyPath:@"eventBody.isStarting" value:&__kCFBooleanTrue];
    id v8 = [v7 subscribeOn:self->_scheduler];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000891C4;
    v16[3] = &unk_10035A380;
    objc_copyWeak(&v18, &location);
    id v9 = v3;
    id v17 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008939C;
    v13[3] = &unk_10035A3D0;
    objc_copyWeak(&v15, &location);
    id v10 = v9;
    id v14 = v10;
    v11 = [v8 sinkWithCompletion:v16 receiveInput:v13];
    sink = self->_sink;
    self->_sink = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_1003A0420 != -1) {
      dispatch_once(&qword_1003A0420, &stru_10035A3F0);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A03E0, OS_LOG_TYPE_DEBUG)) {
      sub_1002C998C();
    }
  }
}

- (void)_stopObservingIfNecessary
{
  if (![(NSMutableSet *)self->_bundleIDsToObserve count])
  {
    [(StoreKitAppLaunchObserver *)self _stopObserving];
  }
}

- (void)_appDidLaunch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(StoreKitAppLaunchObserver *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(StoreKitAppLaunchObserver *)self delegate],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = [(StoreKitAppLaunchObserver *)self delegate];
    [v9 appDidLaunchWithBundleID:v4];
  }
  else
  {
    if (qword_1003A0420 != -1) {
      dispatch_once(&qword_1003A0420, &stru_10035A3F0);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A03E0, OS_LOG_TYPE_ERROR)) {
      sub_1002C9AC4();
    }
  }
}

- (StoreKitAppLaunchObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StoreKitAppLaunchObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_bundleIDsToObserve, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong((id *)&self->_observerQueue, 0);
}

@end