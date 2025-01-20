@interface GCMicrosoftXboxControllerProfile
@end

@implementation GCMicrosoftXboxControllerProfile

void __50___GCMicrosoftXboxControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  v6 = [[_GCDevicePIDVIDMatchingFilter alloc] initWithVendorID:&unk_26D286630 productIDs:&unk_26D2879E0];
  v2 = [_GCDefaultDeviceManager alloc];
  v3 = NSStringFromClass(*(Class *)(a1 + 32));
  uint64_t v4 = [(_GCDefaultDeviceManager *)v2 initWithIdentifier:v3 matchingFilter:v6 probeScore:GCPhysicalDeviceProbeScoreHighPriority];
  v5 = (void *)deviceManager_deviceManager_2;
  deviceManager_deviceManager_2 = v4;

  [(id)deviceManager_deviceManager_2 setDelegate:*(void *)(a1 + 32)];
}

void __72___GCMicrosoftXboxControllerProfile_physicalDevice_getBatteryWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [[GCDeviceBattery alloc] initWithLevel:a2 isCharging:a3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end