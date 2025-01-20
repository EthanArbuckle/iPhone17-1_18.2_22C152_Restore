@interface DDRTaskResetCommCenterSettings
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetCommCenterSettings

- (void)run
{
  uint64_t v2 = _CTServerConnectionCreateWithIdentifier();
  if (v2)
  {
    v3 = (const void *)v2;
    _CTServerConnectionEraseCommCentersPreferences();
    CFRelease(v3);
  }
  else
  {
    v4 = DDRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100008E04(v4);
    }
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.05;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetCommCenterSettings";
}

@end