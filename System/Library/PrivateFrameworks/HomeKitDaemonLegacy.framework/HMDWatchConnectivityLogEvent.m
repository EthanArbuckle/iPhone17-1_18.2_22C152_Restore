@interface HMDWatchConnectivityLogEvent
- (BOOL)isReportComplete;
- (HMDWatchConnectivityLogEvent)init;
- (unint64_t)watchAddedNotificationCount;
- (unint64_t)watchRemovedNotificationCount;
- (void)setReportComplete:(BOOL)a3;
- (void)setWatchAddedNotificationCount:(unint64_t)a3;
- (void)setWatchRemovedNotificationCount:(unint64_t)a3;
@end

@implementation HMDWatchConnectivityLogEvent

- (void)setReportComplete:(BOOL)a3
{
  self->_reportComplete = a3;
}

- (BOOL)isReportComplete
{
  return self->_reportComplete;
}

- (void)setWatchRemovedNotificationCount:(unint64_t)a3
{
  self->_watchRemovedNotificationCount = a3;
}

- (unint64_t)watchRemovedNotificationCount
{
  return self->_watchRemovedNotificationCount;
}

- (void)setWatchAddedNotificationCount:(unint64_t)a3
{
  self->_watchAddedNotificationCount = a3;
}

- (unint64_t)watchAddedNotificationCount
{
  return self->_watchAddedNotificationCount;
}

- (HMDWatchConnectivityLogEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDWatchConnectivityLogEvent;
  v2 = [(HMMLogEvent *)&v6 init];
  if (v2)
  {
    v3 = +[HMDWatchConnectivityLogEventManager sharedInstance];
    v4 = v3;
    if (v3) {
      [v3 currentWatchConnectivitySnapshot];
    }

    v2->_reportComplete = 0;
    v2->_watchAddedNotificationCount = 0;
    v2->_watchRemovedNotificationCount = 0;
  }
  return v2;
}

@end