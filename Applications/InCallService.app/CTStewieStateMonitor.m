@interface CTStewieStateMonitor
- (BOOL)isAlertActive;
- (BOOL)isAlertTriggerAllowedAndNotActive;
- (int64_t)getStatus;
@end

@implementation CTStewieStateMonitor

- (int64_t)getStatus
{
  v2 = self;
  id v3 = sub_1001E8804();

  return (int64_t)v3;
}

- (BOOL)isAlertTriggerAllowedAndNotActive
{
  v2 = self;
  char v3 = sub_1001E88BC();

  return v3 & 1;
}

- (BOOL)isAlertActive
{
  v2 = self;
  char v3 = sub_1001E8984();

  return v3 & 1;
}

@end