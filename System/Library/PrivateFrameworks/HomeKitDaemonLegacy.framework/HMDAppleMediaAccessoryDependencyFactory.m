@interface HMDAppleMediaAccessoryDependencyFactory
- (id)accountManagerForAccessory:(id)a3;
- (id)darwinNotificationProviderForAccessory:(id)a3;
- (id)deviceController;
- (id)deviceControllerWithDevice:(id)a3;
- (id)deviceControllerWithDeviceIdentifier:(id)a3;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceWithAddress:(id)a3;
- (id)symptomsHandlerForAccessory:(id)a3;
@end

@implementation HMDAppleMediaAccessoryDependencyFactory

- (id)accountManagerForAccessory:(id)a3
{
  return +[HMDAppleAccountManager sharedManager];
}

- (id)darwinNotificationProviderForAccessory:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F2E788]);
  return v3;
}

- (id)symptomsHandlerForAccessory:(id)a3
{
  id v3 = a3;
  v4 = [[HMDAccessorySymptomHandler alloc] initWithAccessory:v3];

  return v4;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[HMDAccountRegistry sharedRegistry];
  v5 = [v4 deviceForIDSIdentifier:v3];

  return v5;
}

- (id)deviceWithAddress:(id)a3
{
  id v3 = a3;
  v4 = +[HMDAccountRegistry sharedRegistry];
  v5 = [v4 deviceForAddress:v3];

  return v5;
}

- (id)deviceControllerWithDevice:(id)a3
{
  return +[HMDDeviceController deviceControllerForDevice:a3];
}

- (id)deviceControllerWithDeviceIdentifier:(id)a3
{
  return +[HMDDeviceController placeholderDeviceControllerWithIdentifier:a3];
}

- (id)deviceController
{
  return +[HMDDeviceController deviceControllerForCurrentDevice];
}

@end