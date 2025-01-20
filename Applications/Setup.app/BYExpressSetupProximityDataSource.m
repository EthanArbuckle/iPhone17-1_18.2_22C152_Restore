@interface BYExpressSetupProximityDataSource
- (BOOL)dataAvailable;
- (BYBackupMetadata)backupMetadata;
- (BYExpressSetupProximityDataSource)initWithInformation:(id)a3;
- (SASProximityInformation)information;
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
- (void)setBackupMetadata:(id)a3;
- (void)setInformation:(id)a3;
@end

@implementation BYExpressSetupProximityDataSource

- (BYExpressSetupProximityDataSource)initWithInformation:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  id v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)BYExpressSetupProximityDataSource;
  id v11 = [(BYExpressSetupProximityDataSource *)&v9 init];
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 1, location[0]);
    id v4 = [location[0] backupMetadata];
    id v5 = (id)BYMetadataFromDataArchive();
    v6 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v5;
  }
  v7 = (BYExpressSetupProximityDataSource *)v11;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (BOOL)dataAvailable
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)sourceDeviceClass
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 deviceClass];

  return v3;
}

- (id)locationServicesOptIn
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = +[NSNumber numberWithBool:[(SASProximityInformation *)v2 locationServicesOptIn]];

  return v3;
}

- (id)locationServicesSettings
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 locationServicesData];

  return v3;
}

- (id)appAnalyticsOptIn
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 appAnalyticsOptIn];

  return v3;
}

- (id)deviceAnalyticsOptIn
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 deviceAnalyticsOptIn];

  return v3;
}

- (id)siriOptIn
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 siriOptIn];

  return v3;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 siriVoiceProfileAvailabilityMetadata];

  return v3;
}

- (id)siriDataSharingOptIn
{
  objc_super v9 = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if (location[0] && ([location[0] hasSiriDataSharingOptIn] & 1) != 0)
  {
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[location[0] siriDataSharingOptIn] & 1);
  }
  else
  {
    id v3 = [(BYExpressSetupProximityDataSource *)v9 backupMetadata];
    unsigned __int8 v4 = [(BYBackupMetadata *)v3 hasSiriDataSharingOptIn];

    if (v4)
    {
      id v5 = [(BYExpressSetupProximityDataSource *)v9 backupMetadata];
      v10 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)v5 siriDataSharingOptIn] & 1];
    }
    else
    {
      v10 = 0;
    }
  }
  objc_storeStrong(location, 0);
  v6 = v10;

  return v6;
}

- (id)siriVoiceTriggerEnabled
{
  id location[2] = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if ([location[0] hasSiriVoiceTriggerEnabled]) {
    v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[location[0] siriVoiceTriggerEnabled] & 1);
  }
  else {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  id v3 = v6;

  return v3;
}

- (id)screenTimeEnabled
{
  v6 = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if (location[0] && ([location[0] hasScreenTimeEnabled] & 1) != 0)
  {
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[location[0] screenTimeEnabled] & 1);
  }
  else if ([(BYBackupMetadata *)v6->_backupMetadata hasScreenTimeEnabled])
  {
    v7 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)v6->_backupMetadata screenTimeEnabled] & 1];
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong(location, 0);
  id v3 = v7;

  return v3;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  objc_super v9 = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if ([location[0] hasSoftwareUpdateAutoUpdateEnabled])
  {
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[location[0] softwareUpdateAutoUpdateEnabled] & 1);
  }
  else
  {
    id v3 = [(BYExpressSetupProximityDataSource *)v9 backupMetadata];
    unsigned __int8 v4 = [(BYBackupMetadata *)v3 hasAutoUpdateEnabled];

    if (v4)
    {
      id v5 = [(BYExpressSetupProximityDataSource *)v9 backupMetadata];
      v10 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)v5 autoUpdateEnabled] & 1];
    }
    else
    {
      v10 = 0;
    }
  }
  objc_storeStrong(location, 0);
  v6 = v10;

  return v6;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  objc_super v9 = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if ([location[0] hasSoftwareUpdateAutoDownloadEnabled])
  {
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[location[0] softwareUpdateAutoDownloadEnabled] & 1);
  }
  else
  {
    id v3 = [(BYExpressSetupProximityDataSource *)v9 backupMetadata];
    unsigned __int8 v4 = [(BYBackupMetadata *)v3 hasAutoDownloadEnabled];

    if (v4)
    {
      id v5 = [(BYExpressSetupProximityDataSource *)v9 backupMetadata];
      v10 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)v5 autoDownloadEnabled] & 1];
    }
    else
    {
      v10 = 0;
    }
  }
  objc_storeStrong(location, 0);
  v6 = v10;

  return v6;
}

- (int64_t)userInterfaceStyleModeValue
{
  v8 = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if (location[0] && ([location[0] hasAppearanceMode] & 1) != 0)
  {
    id v9 = [location[0] buddy_userInterfaceStyleModeValue];
  }
  else
  {
    id v3 = [(BYExpressSetupProximityDataSource *)v8 backupMetadata];
    unsigned __int8 v4 = [(BYBackupMetadata *)v3 hasUserInterfaceStyleMode];

    if (v4)
    {
      id v5 = [(BYExpressSetupProximityDataSource *)v8 backupMetadata];
      id v9 = [(BYBackupMetadata *)v5 userInterfaceStyleMode];
    }
    else
    {
      id v9 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return (int64_t)v9;
}

- (id)watchMigrationData
{
  v7 = self;
  location[1] = (id)a2;
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  location[0] = [(BYBackupMetadata *)v2 expressSettings];

  if ([location[0] hasWatchMigrationData])
  {
    id v8 = [location[0] watchMigrationData];
  }
  else
  {
    id v3 = [(BYExpressSetupProximityDataSource *)v7 backupMetadata];
    id v8 = [(BYBackupMetadata *)v3 nanoRegistryData];
  }
  objc_storeStrong(location, 0);
  unsigned __int8 v4 = v8;

  return v4;
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  id v3 = [(BYBackupMetadata *)v2 expressSettings];
  unsigned __int8 v4 = [v3 hasWalletData];

  if (v4)
  {
    id v5 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
    id v6 = [(BYBackupMetadata *)v5 expressSettings];
    id v12 = [v6 walletData];
  }
  else
  {
    v7 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
    unsigned __int8 v8 = [(BYBackupMetadata *)v7 hasWalletData];

    if (v8)
    {
      id v9 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
      id v12 = [(BYBackupMetadata *)v9 walletData];
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)actionButtonData
{
  v2 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
  unsigned __int8 v3 = [(BYBackupMetadata *)v2 hasActionButtonData];

  if (v3)
  {
    unsigned __int8 v4 = [(BYExpressSetupProximityDataSource *)self backupMetadata];
    id v7 = [(BYBackupMetadata *)v4 actionButtonData];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)stolenDeviceProtectionEnabled
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 expressSettings];
  unsigned __int8 v4 = [v3 hasStolenDeviceProtectionEnabled];

  if (v4)
  {
    id v5 = [(BYExpressSetupProximityDataSource *)self information];
    id v6 = [(SASProximityInformation *)v5 expressSettings];
    id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[v6 stolenDeviceProtectionEnabled] & 1);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)stolenDeviceProtectionStrictModeEnabled
{
  v2 = [(BYExpressSetupProximityDataSource *)self information];
  id v3 = [(SASProximityInformation *)v2 expressSettings];
  unsigned __int8 v4 = [v3 hasStolenDeviceProtectionStrictModeEnabled];

  if (v4)
  {
    id v5 = [(BYExpressSetupProximityDataSource *)self information];
    id v6 = [(SASProximityInformation *)v5 expressSettings];
    id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[v6 stolenDeviceProtectionStrictModeEnabled] & 1);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (SASProximityInformation)information
{
  return self->_information;
}

- (void)setInformation:(id)a3
{
}

- (BYBackupMetadata)backupMetadata
{
  return self->_backupMetadata;
}

- (void)setBackupMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end