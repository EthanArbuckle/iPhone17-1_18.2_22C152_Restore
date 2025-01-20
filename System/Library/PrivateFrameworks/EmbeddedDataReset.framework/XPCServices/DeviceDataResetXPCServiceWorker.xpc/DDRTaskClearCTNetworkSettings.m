@interface DDRTaskClearCTNetworkSettings
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskClearCTNetworkSettings

- (void)run
{
  uint64_t v2 = _CTServerConnectionCreateWithIdentifier();
  if (v2)
  {
    v3 = (const void *)v2;
    _CTServerConnectionEraseNetworkSettings();
    CFRelease(v3);
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.1;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.clearCTNetworkSettings";
}

@end