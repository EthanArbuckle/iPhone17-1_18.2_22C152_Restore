@interface DBApplicationLaunchInfo
+ (id)launchInfoForApplication:(id)a3;
+ (id)launchInfoForApplication:(id)a3 withActivationSettings:(id)a4;
- (DBActivationSettings)activationSettings;
- (DBApplication)application;
- (DBApplicationLaunchInfo)initWithApplication:(id)a3 activationSettings:(id)a4;
@end

@implementation DBApplicationLaunchInfo

+ (id)launchInfoForApplication:(id)a3
{
  id v3 = a3;
  v4 = [[DBApplicationLaunchInfo alloc] initWithApplication:v3 activationSettings:0];

  return v4;
}

+ (id)launchInfoForApplication:(id)a3 withActivationSettings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DBApplicationLaunchInfo alloc] initWithApplication:v6 activationSettings:v5];

  return v7;
}

- (DBApplicationLaunchInfo)initWithApplication:(id)a3 activationSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DBApplicationLaunchInfo;
  v9 = [(DBApplicationLaunchInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_application, a3);
    objc_storeStrong((id *)&v10->_activationSettings, a4);
  }

  return v10;
}

- (DBApplication)application
{
  return self->_application;
}

- (DBActivationSettings)activationSettings
{
  return self->_activationSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end