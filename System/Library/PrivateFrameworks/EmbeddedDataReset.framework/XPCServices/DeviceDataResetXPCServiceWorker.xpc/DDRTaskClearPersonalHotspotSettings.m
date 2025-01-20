@interface DDRTaskClearPersonalHotspotSettings
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskClearPersonalHotspotSettings

- (void)run
{
  uint64_t v2 = _NETRBClientCreate();
  if (v2)
  {
    uint64_t v3 = v2;
    _NETRBClientSetGlobalServiceState();
    __NETRBClientDestroy(v3);
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.1;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.clearPersonalHotspotSettings";
}

@end