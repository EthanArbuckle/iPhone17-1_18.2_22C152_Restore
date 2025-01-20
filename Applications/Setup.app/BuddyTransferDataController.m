@interface BuddyTransferDataController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)hasMegaBackup;
- (BOOL)isEphemeral;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMiscState)miscState;
- (BuddyTransferDataController)init;
- (NSString)estimatedMigrationDuration;
- (NSString)sourceDeviceClass;
- (ProximitySetupController)proximitySetupController;
- (id)startDeviceMigrationBlock;
- (void)_continueTapped:(id)a3;
- (void)_otherOptionsTapped:(id)a3;
- (void)_setupButtons;
- (void)_updateAnalyticsWithChoice:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setEstimatedMigrationDuration:(id)a3;
- (void)setHasMegaBackup:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSourceDeviceClass:(id)a3;
- (void)setStartDeviceMigrationBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyTransferDataController

- (BuddyTransferDataController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyTransferDataController;
  id location = [(BuddyTransferDataController *)&v4 initWithTitle:&stru_1002B4E18 detailText:0 icon:0];
  v2 = (BuddyTransferDataController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  v33 = self;
  SEL v32 = a2;
  v31.receiver = self;
  v31.super_class = (Class)BuddyTransferDataController;
  [(BuddyTransferDataController *)&v31 viewDidLoad];
  id v30 = 0;
  id v2 = +[BYDevice currentDevice];
  unsigned __int8 v3 = [v2 hasHomeButton];

  unsigned __int8 v29 = v3;
  objc_super v4 = [(BuddyTransferDataController *)v33 proximitySetupController];
  SEL v5 = [(ProximitySetupController *)v4 information];
  unsigned __int8 v6 = [(SASProximityInformation *)v5 hasHomeButton];

  unsigned __int8 v28 = v6;
  v7 = [(BuddyTransferDataController *)v33 miscState];
  v8 = [(BuddyMiscState *)v7 migrationManager];
  id v9 = [(BuddyTargetDeviceMigrationManager *)v8 connectionInfo];
  id v10 = [v9 connectionType];

  if (v10 == (id)1)
  {
    if (v29)
    {
      if (v28) {
        v11 = +[UIImage imageNamed:@"Transfer Data Migration Wired Both with Home Button"];
      }
      else {
        v11 = +[UIImage imageNamed:@"Transfer Data Migration Wired with Home Button"];
      }
    }
    else if (v28)
    {
      v11 = +[UIImage imageNamed:@"Transfer Data Migration Wired without Home Button"];
    }
    else
    {
      v11 = +[UIImage imageNamed:@"Transfer Data Migration Wired Both without Home Button"];
    }
    id v12 = v30;
    id v30 = v11;
  }
  else
  {
    v13 = +[UIImage imageNamed:@"Transfer Options Migrate Wireless"];
    id v14 = v30;
    id v30 = v13;
  }
  id v15 = [(BuddyTransferDataController *)v33 headerView];
  [v15 setIcon:v30 accessibilityLabel:0];

  v16 = [(BuddyTransferDataController *)v33 proximitySetupController];
  id location = [(ProximitySetupController *)v16 deviceName];

  v17 = +[NSBundle mainBundle];
  v18 = [(NSBundle *)v17 localizedStringForKey:@"TRANSFER_DATA_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, location);
  id v20 = [(BuddyTransferDataController *)v33 headerView];
  [v20 setTitle:v19];

  v21 = +[NSBundle mainBundle];
  id v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"TRANSFER_DATA_DESCRIPTION"];
  v23 = [(NSBundle *)v21 localizedStringForKey:v22 value:&stru_1002B4E18 table:@"Localizable"];
  v24 = [(BuddyTransferDataController *)v33 estimatedMigrationDuration];
  v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, location, v24);
  id v26 = [(BuddyTransferDataController *)v33 headerView];
  [v26 setDetailText:v25];

  [(BuddyTransferDataController *)v33 _setupButtons];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v30, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (void)_setupButtons
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = +[OBBoldTrayButton boldButton];
  id v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [(NSBundle *)v2 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [location[0] setTitle:v3 forState:0];

  [location[0] addTarget:v10 action:"_continueTapped:" forControlEvents:64];
  id v4 = [(BuddyTransferDataController *)v10 buttonTray];
  [v4 addButton:location[0]];

  id v8 = +[OBLinkTrayButton linkButton];
  SEL v5 = +[NSBundle mainBundle];
  unsigned __int8 v6 = [(NSBundle *)v5 localizedStringForKey:@"TRANSFER_OPTIONS_OTHER_OPTIONS" value:&stru_1002B4E18 table:@"Localizable"];
  [v8 setTitle:v6 forState:0];

  [v8 addTarget:v10 action:"_otherOptionsTapped:" forControlEvents:64];
  id v7 = [(BuddyTransferDataController *)v10 buttonTray];
  [v7 addButton:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_continueTapped:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = (void (**)(void))[(BuddyTransferDataController *)v6 startDeviceMigrationBlock];
  v3[2](v3);

  [(BuddyTransferDataController *)v6 _updateAnalyticsWithChoice:@"migration"];
  id v4 = [(BuddyWelcomeController *)v6 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v6];

  objc_storeStrong(location, 0);
}

- (void)_otherOptionsTapped:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyTransferDataController *)v7 miscState];
  id v4 = [(BuddyMiscState *)v3 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v4 cancelWithCause:3];

  [(BuddyTransferDataController *)v7 _updateAnalyticsWithChoice:@"other"];
  SEL v5 = [(BuddyWelcomeController *)v7 delegate];
  [(BFFFlowItemDelegate *)v5 flowItemDone:v7];

  objc_storeStrong(location, 0);
}

- (void)_updateAnalyticsWithChoice:(id)a3
{
  unsigned __int8 v6 = self;
  v5[1] = (id)a2;
  v5[0] = 0;
  objc_storeStrong(v5, a3);
  unsigned __int8 v3 = [(BuddyTransferDataController *)v6 analyticsManager];
  v7[0] = @"choice";
  v8[0] = v5[0];
  v7[1] = @"type";
  v8[1] = @"heavy";
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(BYAnalyticsManager *)v3 addEvent:@"com.apple.setupassistant.ios.migrationUpsell" withPayload:v4 persist:1];

  objc_storeStrong(v5, 0);
}

- (NSString)estimatedMigrationDuration
{
  return self->estimatedMigrationDuration;
}

- (void)setEstimatedMigrationDuration:(id)a3
{
}

- (BOOL)hasMegaBackup
{
  return self->hasMegaBackup;
}

- (void)setHasMegaBackup:(BOOL)a3
{
  self->hasMegaBackup = a3;
}

- (NSString)sourceDeviceClass
{
  return self->sourceDeviceClass;
}

- (void)setSourceDeviceClass:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (id)startDeviceMigrationBlock
{
  return self->_startDeviceMigrationBlock;
}

- (void)setStartDeviceMigrationBlock:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end