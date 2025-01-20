@interface BYExpressSetupCloudSource
- (BOOL)dataAvailable;
- (BYExpressSetupCloudSource)initWithSettings:(id)a3;
- (SASExpressSettings)expressSettings;
- (id)actionButtonData;
- (id)appAnalyticsOptIn;
- (id)deviceAnalyticsOptIn;
- (id)locationServicesOptIn;
- (id)locationServicesSettings;
- (id)screenTimeEnabled;
- (id)siriDataSharingOptIn;
- (id)siriOptIn;
- (id)siriVoiceProfileAvailabilityMetadata;
- (id)siriVoiceTriggerEnabled;
- (id)softwareUpdateAutoDownloadEnabled;
- (id)softwareUpdateAutoUpdateEnabled;
- (id)sourceDeviceClass;
- (id)stolenDeviceProtectionEnabled;
- (id)stolenDeviceProtectionStrictModeEnabled;
- (id)walletMetadata;
- (id)walletProvisioningContext;
- (id)watchMigrationData;
- (int64_t)userInterfaceStyleModeValue;
- (void)setExpressSettings:(id)a3;
@end

@implementation BYExpressSetupCloudSource

- (BYExpressSetupCloudSource)initWithSettings:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BYExpressSetupCloudSource;
  id v8 = [(BYExpressSetupCloudSource *)&v6 init];
  objc_storeStrong(&v8, v8);
  if (v8) {
    objc_storeStrong((id *)v8 + 1, location[0]);
  }
  v4 = (BYExpressSetupCloudSource *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (BOOL)dataAvailable
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)sourceDeviceClass
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  id v3 = [(SASExpressSettings *)v2 deviceClass];

  return v3;
}

- (id)locationServicesOptIn
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasLocationServicesOptIn];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 locationServicesOptIn] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)locationServicesSettings
{
  return 0;
}

- (id)appAnalyticsOptIn
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasAppAnalyticsOptIn];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 appAnalyticsOptIn] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)deviceAnalyticsOptIn
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasDeviceAnalyticsOptIn];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 deviceAnalyticsOptIn] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)siriOptIn
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasSiriOptIn];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 siriOptIn] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  return 0;
}

- (id)siriDataSharingOptIn
{
  return 0;
}

- (id)siriVoiceTriggerEnabled
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasSiriVoiceTriggerEnabled];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 siriVoiceTriggerEnabled] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)screenTimeEnabled
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasScreenTimeEnabled];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 screenTimeEnabled] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasSoftwareUpdateAutoUpdateEnabled];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 softwareUpdateAutoUpdateEnabled] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasSoftwareUpdateAutoDownloadEnabled];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 softwareUpdateAutoDownloadEnabled] & 1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)userInterfaceStyleModeValue
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  int64_t v3 = [(SASExpressSettings *)v2 buddy_userInterfaceStyleModeValue];

  return v3;
}

- (id)watchMigrationData
{
  return 0;
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasWalletData];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    id v7 = [(SASExpressSettings *)v4 walletData];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)actionButtonData
{
  return 0;
}

- (id)stolenDeviceProtectionEnabled
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasStolenDeviceProtectionEnabled];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    id v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 stolenDeviceProtectionEnabled] & 1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)stolenDeviceProtectionStrictModeEnabled
{
  v2 = [(BYExpressSetupCloudSource *)self expressSettings];
  unsigned __int8 v3 = [(SASExpressSettings *)v2 hasStolenDeviceProtectionStrictModeEnabled];

  if (v3)
  {
    v4 = [(BYExpressSetupCloudSource *)self expressSettings];
    id v7 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)v4 stolenDeviceProtectionStrictModeEnabled] & 1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SASExpressSettings)expressSettings
{
  return self->_expressSettings;
}

- (void)setExpressSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end