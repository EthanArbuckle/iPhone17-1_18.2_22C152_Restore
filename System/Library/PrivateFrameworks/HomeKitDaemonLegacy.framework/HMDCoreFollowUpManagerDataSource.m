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
  return (id)*MEMORY[0x1E4F5B710];
}

- (id)followUpActionForDeviceSetupManager:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5B760]);
  return v3;
}

- (id)followUpItemForDeviceSetupManager:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5B770]);
  return v3;
}

- (id)followUpControllerForDeviceSetupManager:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.HomeKit"];
  return v3;
}

@end