@interface HMDAccessoryFirmwareUpdateManagerWingman
- (HMDAccessoryFirmwareUpdateManagerWingman)init;
- (UARPController)defaultUARPController;
- (UARPController)matterUARPController;
- (double)registerDelay;
- (id)newAccessoryFirmwareUpdateSessionWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6;
@end

@implementation HMDAccessoryFirmwareUpdateManagerWingman

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterUARPController, 0);
  objc_storeStrong((id *)&self->_defaultUARPController, 0);
}

- (double)registerDelay
{
  return self->_registerDelay;
}

- (UARPController)matterUARPController
{
  return self->_matterUARPController;
}

- (UARPController)defaultUARPController
{
  return self->_defaultUARPController;
}

- (id)newAccessoryFirmwareUpdateSessionWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[HMDAccessoryFirmwareUpdateSession alloc] initWithHAPAccessory:v12 uarpAccessory:v11 accessoryFirmwareUpdateManager:v10 logEventManager:v9];

  return v13;
}

- (HMDAccessoryFirmwareUpdateManagerWingman)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryFirmwareUpdateManagerWingman;
  v2 = [(HMDAccessoryFirmwareUpdateManagerWingman *)&v8 init];
  if (v2)
  {
    v3 = (UARPController *)objc_alloc_init(MEMORY[0x263F38328]);
    defaultUARPController = v2->_defaultUARPController;
    v2->_defaultUARPController = v3;

    v2->_registerDelay = 6.0e10;
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      v5 = (UARPController *)objc_alloc_init(MEMORY[0x263F38328]);
      matterUARPController = v2->_matterUARPController;
      v2->_matterUARPController = v5;
    }
  }
  return v2;
}

@end