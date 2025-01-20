@interface BYExpressSetupBackupSource
- (BOOL)dataAvailable;
- (BYExpressSetupBackupSource)initWithBackupItem:(id)a3 backupMetadata:(id)a4;
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
@end

@implementation BYExpressSetupBackupSource

- (BYExpressSetupBackupSource)initWithBackupItem:(id)a3 backupMetadata:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v13;
  id v13 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)BYExpressSetupBackupSource;
  id v13 = [(BYExpressSetupBackupSource *)&v10 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)v13 + 1, location[0]);
    objc_storeStrong((id *)v13 + 2, obj);
    id v6 = [obj expressSettings];
    v7 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v6;
  }
  v8 = (BYExpressSetupBackupSource *)v13;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (BOOL)dataAvailable
{
  return 1;
}

- (id)sourceDeviceClass
{
  v2 = [(RestorableBackupItem *)self->_backupItem backup];
  id v3 = [(MBBackup *)v2 deviceClass];

  return v3;
}

- (id)locationServicesOptIn
{
  if ([(SASExpressSettings *)self->_expressSettings hasLocationServicesOptIn])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings locationServicesOptIn] & 1];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasLocationServicesOptIn])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)self->_backupMetadata locationServicesOptIn] & 1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)appAnalyticsOptIn
{
  if ([(SASExpressSettings *)self->_expressSettings hasAppAnalyticsOptIn])
  {
    id v5 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings appAnalyticsOptIn] & 1];
  }
  else
  {
    unsigned int v2 = [(BYBackupMetadata *)self->_backupMetadata appAnalyticsOptIn];
    if (v2)
    {
      if (v2 == 1) {
        id v5 = &__kCFBooleanTrue;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = &__kCFBooleanFalse;
    }
  }

  return v5;
}

- (id)deviceAnalyticsOptIn
{
  if ([(SASExpressSettings *)self->_expressSettings hasDeviceAnalyticsOptIn])
  {
    id v5 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings deviceAnalyticsOptIn] & 1];
  }
  else
  {
    unsigned int v2 = [(BYBackupMetadata *)self->_backupMetadata deviceAnalyticsOptIn];
    if (v2)
    {
      if (v2 == 1) {
        id v5 = &__kCFBooleanTrue;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = &__kCFBooleanFalse;
    }
  }

  return v5;
}

- (id)siriOptIn
{
  if ([(SASExpressSettings *)self->_expressSettings hasSiriOptIn])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings siriOptIn] & 1];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasSiriOptIn])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)self->_backupMetadata siriOptIn] & 1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)locationServicesSettings
{
  return 0;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  return 0;
}

- (id)siriDataSharingOptIn
{
  if ([(SASExpressSettings *)self->_expressSettings hasSiriDataSharingOptIn])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings siriDataSharingOptIn] & 1];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasSiriDataSharingOptIn])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)self->_backupMetadata siriDataSharingOptIn] & 1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)siriVoiceTriggerEnabled
{
  if ([(SASExpressSettings *)self->_expressSettings hasSiriVoiceTriggerEnabled])v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings siriVoiceTriggerEnabled] & 1]; {
  else
  }
    v4 = 0;

  return v4;
}

- (id)screenTimeEnabled
{
  if ([(SASExpressSettings *)self->_expressSettings hasScreenTimeEnabled])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings screenTimeEnabled] & 1];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasScreenTimeEnabled])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)self->_backupMetadata screenTimeEnabled] & 1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  if ([(SASExpressSettings *)self->_expressSettings hasSoftwareUpdateAutoUpdateEnabled])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings softwareUpdateAutoUpdateEnabled] & 1];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasAutoUpdateEnabled])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)self->_backupMetadata autoUpdateEnabled] & 1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  if ([(SASExpressSettings *)self->_expressSettings hasSoftwareUpdateAutoDownloadEnabled])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings softwareUpdateAutoDownloadEnabled] & 1];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasAutoDownloadEnabled])
  {
    v4 = +[NSNumber numberWithBool:(unint64_t)[(BYBackupMetadata *)self->_backupMetadata autoDownloadEnabled] & 1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)userInterfaceStyleModeValue
{
  if ([(SASExpressSettings *)self->_expressSettings hasAppearanceMode]) {
    return [(SASExpressSettings *)self->_expressSettings buddy_userInterfaceStyleModeValue];
  }
  if ([(BYBackupMetadata *)self->_backupMetadata hasUserInterfaceStyleMode]) {
    return (int64_t)[(BYBackupMetadata *)self->_backupMetadata userInterfaceStyleMode];
  }
  return 0;
}

- (id)watchMigrationData
{
  if ([(SASExpressSettings *)self->_expressSettings hasWatchMigrationData]) {
    id v4 = [(SASExpressSettings *)self->_expressSettings watchMigrationData];
  }
  else {
    id v4 = [(BYBackupMetadata *)self->_backupMetadata nanoRegistryData];
  }

  return v4;
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  if ([(SASExpressSettings *)self->_expressSettings hasWalletData])
  {
    id v4 = [(SASExpressSettings *)self->_expressSettings walletData];
  }
  else if ([(BYBackupMetadata *)self->_backupMetadata hasWalletData])
  {
    id v4 = [(BYBackupMetadata *)self->_backupMetadata walletData];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)actionButtonData
{
  if ([(BYBackupMetadata *)self->_backupMetadata hasActionButtonData]) {
    id v4 = [(BYBackupMetadata *)self->_backupMetadata actionButtonData];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)stolenDeviceProtectionEnabled
{
  if ([(SASExpressSettings *)self->_expressSettings hasStolenDeviceProtectionEnabled])id v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings stolenDeviceProtectionEnabled] & 1]; {
  else
  }
    id v4 = 0;

  return v4;
}

- (id)stolenDeviceProtectionStrictModeEnabled
{
  if ([(SASExpressSettings *)self->_expressSettings hasStolenDeviceProtectionStrictModeEnabled])id v4 = +[NSNumber numberWithBool:(unint64_t)[(SASExpressSettings *)self->_expressSettings stolenDeviceProtectionStrictModeEnabled] & 1]; {
  else
  }
    id v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
}

@end