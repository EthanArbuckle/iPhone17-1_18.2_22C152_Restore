@interface GCMFiControllerProfile
@end

@implementation GCMFiControllerProfile

uint64_t __40___GCMFiControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  v2 = [_GCDefaultDeviceManager alloc];
  v3 = NSStringFromClass(*(Class *)(a1 + 32));
  uint64_t v4 = [(_GCDefaultDeviceManager *)v2 initWithIdentifier:v3 matchingFilter:*(void *)(a1 + 32) probeScore:GCPhysicalDeviceProbeScoreLowPriority];
  v5 = (void *)deviceManager_deviceManager_0;
  deviceManager_deviceManager_0 = v4;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = (void *)deviceManager_deviceManager_0;

  return [v7 setDelegate:v6];
}

BOOL __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"Max"];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"Min"];

  BOOL v5 = 0;
  if (v3 && v4)
  {
    int v6 = [v3 intValue];
    BOOL v5 = v6 - [v4 intValue] == 1;
  }

  return v5;
}

uint64_t __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke_2(uint64_t a1, int a2)
{
  if ((a2 - 1) > 0xF) {
    return 22;
  }
  else {
    return qword_220A91EF8[a2 - 1];
  }
}

@end