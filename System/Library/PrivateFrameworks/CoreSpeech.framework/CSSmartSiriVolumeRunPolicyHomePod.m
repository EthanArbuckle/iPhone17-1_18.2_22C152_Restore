@interface CSSmartSiriVolumeRunPolicyHomePod
- (void)_addSmartSiriVolumeEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSSmartSiriVolumeRunPolicyHomePod

- (void)_addSmartSiriVolumeEnabledConditions
{
  v3.receiver = self;
  v3.super_class = (Class)CSSmartSiriVolumeRunPolicyHomePod;
  [(CSSmartSiriVolumeRunPolicy *)&v3 _addSmartSiriVolumeEnabledConditions];
  [(CSSmartSiriVolumeRunPolicyHomePod *)self addConditions:&stru_10024E550];
}

- (void)_subscribeEventMonitors
{
  v4.receiver = self;
  v4.super_class = (Class)CSSmartSiriVolumeRunPolicyHomePod;
  [(CSSmartSiriVolumeRunPolicy *)&v4 _subscribeEventMonitors];
  objc_super v3 = +[CSHomePodSettingsMonitor sharedInstance];
  [(CSSmartSiriVolumeRunPolicyHomePod *)self subscribeEventMonitor:v3];
}

@end