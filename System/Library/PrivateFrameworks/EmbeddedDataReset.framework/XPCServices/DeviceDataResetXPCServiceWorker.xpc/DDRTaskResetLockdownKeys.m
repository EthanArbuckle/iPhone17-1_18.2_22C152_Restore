@interface DDRTaskResetLockdownKeys
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetLockdownKeys

- (void)run
{
  uint64_t v2 = lockdown_connect();
  if (v2)
  {
    uint64_t v3 = v2;
    lockdown_remove_value();
    lockdown_remove_value();
    lockdown_remove_value();
    lockdown_remove_value();
    lockdown_remove_value();
    _lockdown_disconnect(v3);
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.15;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetLockdownKeys";
}

@end