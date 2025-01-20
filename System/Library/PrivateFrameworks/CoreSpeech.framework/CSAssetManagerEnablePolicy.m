@interface CSAssetManagerEnablePolicy
- (BOOL)_shouldCheckNetworkAvailability;
- (CSAssetManagerEnablePolicy)init;
- (void)_addAssetManagerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSAssetManagerEnablePolicy

- (BOOL)_shouldCheckNetworkAvailability
{
  if (CSIsIOS() & 1) != 0 || (CSIsWatch()) {
    return 1;
  }
  return CSIsHorseman();
}

- (void)_addAssetManagerEnabledConditions
{
  if ([(CSAssetManagerEnablePolicy *)self _shouldCheckNetworkAvailability])
  {
    [(CSAssetManagerEnablePolicy *)self addConditions:&stru_100251390];
  }
}

- (void)_subscribeEventMonitors
{
  if ([(CSAssetManagerEnablePolicy *)self _shouldCheckNetworkAvailability])
  {
    id v3 = +[CSNetworkAvailabilityMonitor sharedInstance];
    [(CSAssetManagerEnablePolicy *)self subscribeEventMonitor:v3];
  }
}

- (CSAssetManagerEnablePolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSAssetManagerEnablePolicy;
  v2 = [(CSAssetManagerEnablePolicy *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(CSAssetManagerEnablePolicy *)v2 _addAssetManagerEnabledConditions];
    [(CSAssetManagerEnablePolicy *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end