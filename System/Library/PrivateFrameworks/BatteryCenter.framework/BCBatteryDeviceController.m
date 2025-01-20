@interface BCBatteryDeviceController
+ (id)_sharedPowerSourceController;
- (BCBatteryDeviceController)init;
- (NSArray)connectedDevices;
- (void)addBatteryDeviceObserver:(id)a3 queue:(id)a4;
- (void)removeBatteryDeviceObserver:(id)a3;
@end

@implementation BCBatteryDeviceController

- (NSArray)connectedDevices
{
  v2 = [(id)objc_opt_class() _sharedPowerSourceController];
  v3 = [v2 connectedDevices];

  return (NSArray *)v3;
}

+ (id)_sharedPowerSourceController
{
  if (_sharedPowerSourceController_onceToken != -1) {
    dispatch_once(&_sharedPowerSourceController_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_sharedPowerSourceController___sharedPowerSourceController;
  return v2;
}

uint64_t __57__BCBatteryDeviceController__sharedPowerSourceController__block_invoke()
{
  _sharedPowerSourceController___sharedPowerSourceController = objc_alloc_init(_BCPowerSourceController);
  return MEMORY[0x270F9A758]();
}

- (BCBatteryDeviceController)init
{
  v4.receiver = self;
  v4.super_class = (Class)BCBatteryDeviceController;
  v2 = [(BCBatteryDeviceController *)&v4 init];
  if (v2) {
    BCRegisterUserNotificationsLogging();
  }
  return v2;
}

- (void)addBatteryDeviceObserver:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _sharedPowerSourceController];
  [v7 addBatteryDeviceObserver:v6 queue:v5];
}

- (void)removeBatteryDeviceObserver:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _sharedPowerSourceController];
  [v4 removeBatteryDeviceObserver:v3];
}

@end