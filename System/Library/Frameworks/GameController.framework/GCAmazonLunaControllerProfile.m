@interface GCAmazonLunaControllerProfile
@end

@implementation GCAmazonLunaControllerProfile

void __47___GCAmazonLunaControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  v6 = [[_GCDevicePIDVIDMatchingFilter alloc] initWithVendorID:&unk_26D287578 productIDs:&unk_26D287A28];
  v2 = [_GCDefaultDeviceManager alloc];
  v3 = NSStringFromClass(*(Class *)(a1 + 32));
  uint64_t v4 = [(_GCDefaultDeviceManager *)v2 initWithIdentifier:v3 matchingFilter:v6 probeScore:GCPhysicalDeviceProbeScoreHighPriority];
  v5 = (void *)deviceManager_deviceManager_4;
  deviceManager_deviceManager_4 = v4;

  [(id)deviceManager_deviceManager_4 setDelegate:*(void *)(a1 + 32)];
}

@end