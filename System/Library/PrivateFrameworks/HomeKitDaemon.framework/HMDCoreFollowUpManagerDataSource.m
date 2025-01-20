@interface HMDCoreFollowUpManagerDataSource
- (BOOL)currentDeviceSupportsDeviceSetup;
- (id)followUpActionForDeviceSetupManager:(id)a3;
- (id)followUpControllerForDeviceSetupManager:(id)a3;
- (id)followUpItemForDeviceSetupManager:(id)a3;
- (id)followUpPreferencesBundleIdentifierForDeviceSetupManager:(id)a3;
@end

@implementation HMDCoreFollowUpManagerDataSource

- (BOOL)currentDeviceSupportsDeviceSetup
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 supportsDeviceSetup];

  return v3;
}

- (id)followUpPreferencesBundleIdentifierForDeviceSetupManager:(id)a3
{
  return (id)*MEMORY[0x263F35290];
}

- (id)followUpActionForDeviceSetupManager:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F35378]);
  return v3;
}

- (id)followUpItemForDeviceSetupManager:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F35388]);
  return v3;
}

- (id)followUpControllerForDeviceSetupManager:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.HomeKit"];
  return v3;
}

@end