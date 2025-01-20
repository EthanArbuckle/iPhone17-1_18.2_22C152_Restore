@interface BuddyWatchMigrationController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)clearWatchDataForMigrationWithSettingsManager:(id)a3 buddyPreferencesExcludedFromBackup:(id)a4;
+ (void)setWatchDataForMigration:(id)a3 presented:(BOOL)a4 settingsManager:(id)a5 buddyPreferencesExcludedFromBackup:(id)a6;
- (BFFFlowItemDelegate)delegate;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BPSWatchMigrationController)migrationController;
- (BYCapabilities)capabilities;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyExistingSettings)existingSettings;
- (BuddyPendingRestoreState)pendingRestoreState;
- (ProximitySetupController)proximitySetupController;
- (id)viewController;
- (void)controllerItemCompletedWithMigration:(BOOL)a3 preRestoreData:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingSettings:(id)a3;
- (void)setMigrationController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSettingsManager:(id)a3;
@end

@implementation BuddyWatchMigrationController

+ (void)setWatchDataForMigration:(id)a3 presented:(BOOL)a4 settingsManager:(id)a5 buddyPreferencesExcludedFromBackup:(id)a6
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  [v12 stashWatchData:location[0]];
  id v9 = v11;
  v10 = +[NSNumber numberWithBool:v13];
  [v9 setObject:v10 forKey:@"WatchMigrationPresented"];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

+ (void)clearWatchDataForMigrationWithSettingsManager:(id)a3 buddyPreferencesExcludedFromBackup:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(id)objc_opt_class() setWatchDataForMigration:0 presented:0 settingsManager:location[0] buddyPreferencesExcludedFromBackup:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupWatchMigration;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyWatchMigrationController *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 supportsAppleWatch];
  char v6 = 0;
  char v4 = 0;
  if (v3)
  {
    v7 = [(BuddyWatchMigrationController *)self buddyPreferencesExcludedFromBackup];
    char v6 = 1;
    char v4 = [(BYPreferencesController *)v7 BOOLForKey:@"WatchMigrationPresented"] ^ 1;
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyWatchMigrationController *)v20 pendingRestoreState];
  char v4 = [(BuddyPendingRestoreState *)v3 backupItem];
  id v18 = [(RestorableBackupItem *)v4 snapshot];

  id v17 = [v18 deviceName];
  if (!v17)
  {
    id v5 = [(BuddyWatchMigrationController *)v20 proximitySetupController];
    id v17 = [(ProximitySetupController *)v5 deviceName];
  }
  id v6 = [objc_alloc((Class)BPSWatchMigrationController) initWithSourceDeviceName:v17];
  [(BuddyWatchMigrationController *)v20 setMigrationController:v6];

  v7 = v20;
  v8 = [(BuddyWatchMigrationController *)v20 migrationController];
  [(BPSWatchMigrationController *)v8 setMigrationDelegate:v7];

  char v9 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  BOOL v13 = sub_100148838;
  v14 = &unk_1002B0CD0;
  v15 = v20;
  id v16 = location[0];
  dispatch_async(v9, &block);

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return self->_migrationController;
}

- (void)controllerItemCompletedWithMigration:(BOOL)a3 preRestoreData:(id)a4
{
  int v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  if (v10)
  {
    char v4 = [(BuddyWatchMigrationController *)v12 settingsManager];
    [(BFFSettingsManager *)v4 stashWatchData:v9];
  }
  else
  {
    char v4 = [(BuddyWatchMigrationController *)v12 settingsManager];
    [(BFFSettingsManager *)v4 stashWatchData:0];
  }

  id v5 = [(BuddyWatchMigrationController *)v12 paneFeatureAnalyticsManager];
  id v6 = +[NSNumber numberWithBool:v10];
  [(BYPaneFeatureAnalyticsManager *)v5 recordActionWithValue:v6 forFeature:10];

  v7 = [(BuddyWatchMigrationController *)v12 buddyPreferencesExcludedFromBackup];
  [(BYPreferencesController *)v7 setObject:&__kCFBooleanTrue forKey:@"WatchMigrationPresented"];

  id WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
  [WeakRetained flowItemDone:v12];

  objc_storeStrong(&v9, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (BPSWatchMigrationController)migrationController
{
  return self->_migrationController;
}

- (void)setMigrationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end