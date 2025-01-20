@interface HMDAnalyticsLocationEventData
- (BOOL)notifyOnEntry;
- (BOOL)notifyOnExit;
- (void)setNotifyOnEntry:(BOOL)a3;
- (void)setNotifyOnExit:(BOOL)a3;
@end

@implementation HMDAnalyticsLocationEventData

- (void)setNotifyOnExit:(BOOL)a3
{
  self->_notifyOnExit = a3;
}

- (BOOL)notifyOnExit
{
  return self->_notifyOnExit;
}

- (void)setNotifyOnEntry:(BOOL)a3
{
  self->_notifyOnEntry = a3;
}

- (BOOL)notifyOnEntry
{
  return self->_notifyOnEntry;
}

@end