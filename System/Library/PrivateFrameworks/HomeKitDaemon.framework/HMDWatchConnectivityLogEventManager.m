@interface HMDWatchConnectivityLogEventManager
+ (HMDWatchConnectivityLogEventManager)sharedInstance;
- (BOOL)hasCompleteReport;
- (HMDWatchConnectivityLogEventManager)init;
- (HMDWatchConnectivityLogEventManagerSnapshot)currentWatchConnectivitySnapshot;
- (HMFTimer)watchConnectivityLogEventManagerTimer;
- (unint64_t)watchAddedNotificationCountForCurrentIncompleteReport;
- (unint64_t)watchAddedNotificationCountForLastCompleteReport;
- (unint64_t)watchRemovedNotificationCountForCurrentIncompleteReport;
- (unint64_t)watchRemovedNotificationCountForLastCompleteReport;
- (void)completeCurrentReport;
- (void)incrementWatchAddedNotificationCount;
- (void)incrementWatchRemovedNotificationCount;
- (void)setHasCompleteReport:(BOOL)a3;
- (void)setWatchAddedNotificationCountForCurrentIncompleteReport:(unint64_t)a3;
- (void)setWatchAddedNotificationCountForLastCompleteReport:(unint64_t)a3;
- (void)setWatchConnectivityLogEventManagerTimer:(id)a3;
- (void)setWatchRemovedNotificationCountForCurrentIncompleteReport:(unint64_t)a3;
- (void)setWatchRemovedNotificationCountForLastCompleteReport:(unint64_t)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDWatchConnectivityLogEventManager

- (void).cxx_destruct
{
}

- (void)setWatchConnectivityLogEventManagerTimer:(id)a3
{
}

- (HMFTimer)watchConnectivityLogEventManagerTimer
{
  return self->_watchConnectivityLogEventManagerTimer;
}

- (void)setWatchRemovedNotificationCountForLastCompleteReport:(unint64_t)a3
{
  self->_watchRemovedNotificationCountForLastCompleteReport = a3;
}

- (unint64_t)watchRemovedNotificationCountForLastCompleteReport
{
  return self->_watchRemovedNotificationCountForLastCompleteReport;
}

- (void)setWatchAddedNotificationCountForLastCompleteReport:(unint64_t)a3
{
  self->_watchAddedNotificationCountForLastCompleteReport = a3;
}

- (unint64_t)watchAddedNotificationCountForLastCompleteReport
{
  return self->_watchAddedNotificationCountForLastCompleteReport;
}

- (void)setWatchRemovedNotificationCountForCurrentIncompleteReport:(unint64_t)a3
{
  self->_watchRemovedNotificationCountForCurrentIncompleteReport = a3;
}

- (unint64_t)watchRemovedNotificationCountForCurrentIncompleteReport
{
  return self->_watchRemovedNotificationCountForCurrentIncompleteReport;
}

- (void)setWatchAddedNotificationCountForCurrentIncompleteReport:(unint64_t)a3
{
  self->_watchAddedNotificationCountForCurrentIncompleteReport = a3;
}

- (unint64_t)watchAddedNotificationCountForCurrentIncompleteReport
{
  return self->_watchAddedNotificationCountForCurrentIncompleteReport;
}

- (void)setHasCompleteReport:(BOOL)a3
{
  self->_hasCompleteReport = a3;
}

- (BOOL)hasCompleteReport
{
  return self->_hasCompleteReport;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDWatchConnectivityLogEventManager *)self watchConnectivityLogEventManagerTimer];

  if (v5 == v4)
  {
    [(HMDWatchConnectivityLogEventManager *)self completeCurrentReport];
  }
}

- (HMDWatchConnectivityLogEventManagerSnapshot)currentWatchConnectivitySnapshot
{
  *(void *)&retstr->var0 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL hasCompleteReport = self->_hasCompleteReport;
  v7 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchAddedNotificationCountForLastCompleteReport;
  if (hasCompleteReport)
  {
    v8 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchRemovedNotificationCountForLastCompleteReport;
  }
  else
  {
    v7 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchAddedNotificationCountForCurrentIncompleteReport;
    v8 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchRemovedNotificationCountForCurrentIncompleteReport;
  }
  unint64_t v9 = *(unint64_t *)((char *)&self->super.super.isa + *v8);
  retstr->var1 = *(unint64_t *)((char *)&self->super.super.isa + *v7);
  retstr->var2 = v9;
  retstr->var0 = hasCompleteReport;
  os_unfair_lock_unlock(p_lock);
  return result;
}

- (void)completeCurrentReport
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  uint64_t v4 = os_unfair_lock_lock_with_options();
  self->_BOOL hasCompleteReport = 1;
  self->_unint64_t watchAddedNotificationCountForLastCompleteReport = self->_watchAddedNotificationCountForCurrentIncompleteReport;
  self->_unint64_t watchRemovedNotificationCountForLastCompleteReport = self->_watchRemovedNotificationCountForCurrentIncompleteReport;
  self->_watchAddedNotificationCountForCurrentIncompleteReport = 0;
  self->_watchRemovedNotificationCountForCurrentIncompleteReport = 0;
  id v5 = (void *)MEMORY[0x230FBD990](v4);
  HMFGetOSLogHandle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    unint64_t watchAddedNotificationCountForLastCompleteReport = self->_watchAddedNotificationCountForLastCompleteReport;
    unint64_t watchRemovedNotificationCountForLastCompleteReport = self->_watchRemovedNotificationCountForLastCompleteReport;
    BOOL hasCompleteReport = self->_hasCompleteReport;
    int v11 = 138544130;
    v12 = v7;
    __int16 v13 = 2048;
    unint64_t v14 = watchAddedNotificationCountForLastCompleteReport;
    __int16 v15 = 2048;
    unint64_t v16 = watchRemovedNotificationCountForLastCompleteReport;
    __int16 v17 = 1024;
    BOOL v18 = hasCompleteReport;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@WatchConnectivityLogEventManagerTimer fired: Watch added: %lu Watch removed: %lu reportComplete: %d", (uint8_t *)&v11, 0x26u);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementWatchRemovedNotificationCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_watchRemovedNotificationCountForCurrentIncompleteReport;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementWatchAddedNotificationCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_watchAddedNotificationCountForCurrentIncompleteReport;
  os_unfair_lock_unlock(p_lock);
}

- (HMDWatchConnectivityLogEventManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDWatchConnectivityLogEventManager;
  v2 = [(HMDWatchConnectivityLogEventManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:13 options:86400.0];
    watchConnectivityLogEventManagerTimer = v2->_watchConnectivityLogEventManagerTimer;
    v2->_watchConnectivityLogEventManagerTimer = (HMFTimer *)v3;

    [(HMFTimer *)v2->_watchConnectivityLogEventManagerTimer setDelegate:v2];
    [(HMFTimer *)v2->_watchConnectivityLogEventManagerTimer resume];
  }
  return v2;
}

+ (HMDWatchConnectivityLogEventManager)sharedInstance
{
  if (sharedInstance_onceToken_83665 != -1) {
    dispatch_once(&sharedInstance_onceToken_83665, &__block_literal_global_83666);
  }
  v2 = (void *)sharedInstance_watchConnectivityLogEventManager;
  return (HMDWatchConnectivityLogEventManager *)v2;
}

void __53__HMDWatchConnectivityLogEventManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMDWatchConnectivityLogEventManager);
  v1 = (void *)sharedInstance_watchConnectivityLogEventManager;
  sharedInstance_watchConnectivityLogEventManager = (uint64_t)v0;
}

@end