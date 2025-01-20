@interface NDCloudContainer
+ (id)containerIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)initializedForegroundStateFromMonitorCallback;
- (BOOL)isForeground;
- (BRContainersMonitor)monitor;
- (NDCloudContainer)initWithOperationID:(id)a3;
- (void)addObserver:(id)a3;
- (void)containerDidEnterBackground:(id)a3;
- (void)containerDidEnterForeground:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setInitializedForegroundStateFromMonitorCallback:(BOOL)a3;
- (void)setIsForeground:(BOOL)a3;
- (void)setMonitor:(id)a3;
@end

@implementation NDCloudContainer

- (void)containerDidEnterForeground:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Container %{public}@ entered foreground", buf, 0xCu);
  }
  self->_isForeground = 1;
  if (self->_initializedForegroundStateFromMonitorCallback)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDCloudContainer;
    [(NDApplication *)&v6 invokeSelectorForAllObservers:"applicationEnteredForeground:"];
  }
  self->_initializedForegroundStateFromMonitorCallback = 1;
}

+ (id)containerIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v4 = [sub_100004C0C() containerIDFromPrimaryIdentifier:v7 secondaryIdentifier:v6];
  }
  return v4;
}

- (NDCloudContainer)initWithOperationID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NDCloudContainer;
  v3 = [(NDApplication *)&v7 initWithOperationID:a3];
  if (v3)
  {
    id v4 = (BRContainersMonitor *)objc_alloc_init((Class)sub_100004C0C());
    monitor = v3->_monitor;
    v3->_monitor = v4;

    v3->_initializedForegroundStateFromMonitorCallback = 0;
  }
  return v3;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)isForeground
{
  if (!self->_initializedForegroundStateFromMonitorCallback)
  {
    self->_isForeground = [sub_100004C0C() isContainerIDForeground:self->super._bundleIdentifier];
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v3 = ck_log_facility_ckdd;
    if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->super._bundleIdentifier;
      if (self->_isForeground) {
        int v5 = 89;
      }
      else {
        int v5 = 78;
      }
      int v7 = 138543618;
      id v8 = bundleIdentifier;
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Being asked if container with identifier %{public}@ is foreground before getting callback from BRContainersMonitor! Foreground state is %c", (uint8_t *)&v7, 0x12u);
    }
  }
  return self->_isForeground;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (![(NSMutableArray *)v5->super._observers count]) {
    [(BRContainersMonitor *)v5->_monitor addObserver:v5 forContainerID:v5->super._bundleIdentifier];
  }
  v6.receiver = v5;
  v6.super_class = (Class)NDCloudContainer;
  [(NDApplication *)&v6 addObserver:v4];
  objc_sync_exit(v5);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)NDCloudContainer;
  [(NDApplication *)&v6 removeObserver:v4];
  if (![(NSMutableArray *)v5->super._observers count]) {
    [(BRContainersMonitor *)v5->_monitor removeObserver:v5 forContainerID:v5->super._bundleIdentifier];
  }
  objc_sync_exit(v5);
}

- (void)containerDidEnterBackground:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  int v5 = ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Container %{public}@ entered background", buf, 0xCu);
  }
  self->_isForeground = 0;
  if (self->_initializedForegroundStateFromMonitorCallback)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDCloudContainer;
    [(NDApplication *)&v6 invokeSelectorForAllObservers:"applicationNoLongerInForeground:"];
  }
  self->_initializedForegroundStateFromMonitorCallback = 1;
}

- (BRContainersMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

- (BOOL)initializedForegroundStateFromMonitorCallback
{
  return self->_initializedForegroundStateFromMonitorCallback;
}

- (void)setInitializedForegroundStateFromMonitorCallback:(BOOL)a3
{
  self->_initializedForegroundStateFromMonitorCallback = a3;
}

- (void).cxx_destruct
{
}

@end