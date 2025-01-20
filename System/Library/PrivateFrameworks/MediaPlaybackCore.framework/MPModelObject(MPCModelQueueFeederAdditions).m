@interface MPModelObject(MPCModelQueueFeederAdditions)
+ (uint64_t)mqf_requiredItemPlaybackProperties;
+ (uint64_t)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelObject(MPCModelQueueFeederAdditions)

+ (uint64_t)mqf_requiredSectionPlaybackProperties
{
  if (MSVDeviceOSIsInternalInstall())
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    v5 = NSStringFromClass(a1);
    [v4 handleFailureInMethod:a2, a1, @"MPCModelQueueFeeder.m", 1311, @"Could not discern required properties for %@", v5 object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x263F12180];

  return [v6 emptyPropertySet];
}

+ (uint64_t)mqf_requiredItemPlaybackProperties
{
  if (MSVDeviceOSIsInternalInstall())
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    v5 = NSStringFromClass(a1);
    [v4 handleFailureInMethod:a2, a1, @"MPCModelQueueFeeder.m", 1304, @"Could not discern required properties for %@", v5 object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x263F12180];

  return [v6 emptyPropertySet];
}

@end