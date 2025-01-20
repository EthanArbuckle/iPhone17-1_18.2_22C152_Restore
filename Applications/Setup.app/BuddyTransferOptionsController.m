@interface BuddyTransferOptionsController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)hasMegaBackup;
- (BOOL)isEphemeral;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMiscState)miscState;
- (BuddyTransferOptionsController)init;
- (NSString)estimatedMigrationDuration;
- (NSString)sourceDeviceClass;
- (ProximitySetupController)proximitySetupController;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)startDeviceMigrationBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_otherOptionsTapped:(id)a3;
- (void)_updateAnalyticsWithChoice:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEstimatedMigrationDuration:(id)a3;
- (void)setHasMegaBackup:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSourceDeviceClass:(id)a3;
- (void)setStartDeviceMigrationBlock:(id)a3;
- (void)startOver;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyTransferOptionsController

- (BuddyTransferOptionsController)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"TRANSFER_OPTIONS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"TRANSFER_OPTIONS_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyTransferOptionsController;
  id location = [(BuddyTransferOptionsController *)&v9 initWithTitle:v4 detailText:v6 icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);

  v7 = (BuddyTransferOptionsController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  v20 = self;
  SEL v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)BuddyTransferOptionsController;
  [(BuddyTransferOptionsController *)&v18 viewDidLoad];
  if ([(BuddyTransferOptionsController *)v20 hasMegaBackup])
  {
    id v2 = [(BuddyTransferOptionsController *)v20 headerView];
    v3 = +[NSBundle mainBundle];
    v4 = [(BuddyTransferOptionsController *)v20 sourceDeviceClass];
    id v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"TRANSFER_OPTIONS_BACKUP_DESCRIPTION" deviceClass:v4];
    v6 = [(NSBundle *)v3 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];
    [v2 setDetailText:v6];
  }
  id v7 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyTransferOptionsController *)v20 setTableView:v7];

  v8 = v20;
  id v9 = [(BuddyTransferOptionsController *)v20 tableView];
  [v9 setDelegate:v8];

  SEL v10 = v20;
  id v11 = [(BuddyTransferOptionsController *)v20 tableView];
  [v11 setDataSource:v10];

  id v12 = [(BuddyTransferOptionsController *)v20 tableView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v13 = [(BuddyTransferOptionsController *)v20 tableView];
  [v13 setSeparatorStyle:0];

  id location = +[OBLinkTrayButton linkButton];
  v14 = +[NSBundle mainBundle];
  v15 = [(NSBundle *)v14 localizedStringForKey:@"TRANSFER_OPTIONS_OTHER_OPTIONS" value:&stru_1002B4E18 table:@"Localizable"];
  [location setTitle:v15 forState:0];

  [location addTarget:v20 action:"_otherOptionsTapped:" forControlEvents:64];
  id v16 = [(BuddyTransferOptionsController *)v20 buttonTray];
  [v16 addButton:location];

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyTransferOptionsController;
  [(BuddyTransferOptionsController *)&v4 viewWillAppear:a3];
  id v3 = [(BuddyTransferOptionsController *)v7 tableView];
  [v3 reloadData];
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (void)startOver
{
  id v2 = [(BuddyTransferOptionsController *)self proximitySetupController];
  [(ProximitySetupController *)v2 setSkipExpressRestore:0];
}

- (BOOL)isEphemeral
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v78 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v76 = 0;
  objc_storeStrong(&v76, a4);
  id v75 = [location[0] dequeueReusableCellWithIdentifier:@"cell"];
  uint64_t v68 = 0;
  v69 = (id *)&v68;
  int v70 = 838860800;
  int v71 = 48;
  v72 = sub_10016ACA4;
  v73 = sub_10016ACE8;
  id v74 = 0;
  BOOL v67 = [v76 section] == 0;
  id v5 = +[BYDevice currentDevice];
  unsigned __int8 v6 = [v5 hasHomeButton];

  char v66 = v6 & 1;
  id v7 = [(BuddyTransferOptionsController *)v78 proximitySetupController];
  v8 = [(ProximitySetupController *)v7 information];
  unsigned __int8 v9 = [(SASProximityInformation *)v8 hasHomeButton];

  char v65 = v9 & 1;
  if (!v75)
  {
    SEL v10 = [[BuddyTransferOptionsTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    id v11 = v75;
    id v75 = v10;
  }
  if (v67)
  {
    id v12 = +[NSBundle mainBundle];
    id v13 = [(NSBundle *)v12 localizedStringForKey:@"TRANSFER_OPTIONS_RESTORE_OPTION_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    id v14 = [v75 nameLabel];
    [v14 setText:v13];

    v15 = +[NSBundle mainBundle];
    id v16 = (id)SFLocalizableWAPIStringKeyForKey();
    id v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v16];
    objc_super v18 = [(NSBundle *)v15 localizedStringForKey:v17 value:&stru_1002B4E18 table:@"Localizable"];
    id v19 = [v75 descriptionLabel];
    [v19 setText:v18];

    if (v66) {
      objc_storeStrong(v69 + 5, @"Transfer Option Cloud with Home Button");
    }
    else {
      objc_storeStrong(v69 + 5, @"Transfer Option Cloud without Home Button");
    }
  }
  else
  {
    v20 = +[NSBundle mainBundle];
    id v21 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"TRANSFER_OPTIONS_MIGRATE_OPTION_TITLE"];
    v22 = [(NSBundle *)v20 localizedStringForKey:v21 value:&stru_1002B4E18 table:@"Localizable"];
    id v23 = [v75 nameLabel];
    [v23 setText:v22];

    v24 = +[NSBundle mainBundle];
    id v25 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"TRANSFER_OPTIONS_MIGRATE_OPTION_DETAIL"];
    v26 = [(NSBundle *)v24 localizedStringForKey:v25 value:&stru_1002B4E18 table:@"Localizable"];
    id v27 = [v75 descriptionLabel];
    [v27 setText:v26];

    v28 = +[NSBundle mainBundle];
    v29 = [(NSBundle *)v28 localizedStringForKey:@"TRANSFER_OPTIONS_MIGRATE_OPTION_TIME_ESTIMATE_PREFIX" value:&stru_1002B4E18 table:@"Localizable"];
    v30 = [(BuddyTransferOptionsController *)v78 estimatedMigrationDuration];
    v31 = [(NSString *)v29 stringByAppendingString:v30];
    id v32 = [v75 footnoteLabel];
    [v32 setText:v31];

    if (v66)
    {
      if (v65) {
        objc_storeStrong(v69 + 5, @"Transfer Options Migration Wireless Both with Home Button");
      }
      else {
        objc_storeStrong(v69 + 5, @"Transfer Options Migration Wireless with Home Button");
      }
    }
    else if (v65)
    {
      objc_storeStrong(v69 + 5, @"Transfer Options Migration Wireless without Home Button");
    }
    else
    {
      objc_storeStrong(v69 + 5, @"Transfer Options Migration Wireless Both without Home Button");
    }
    v33 = [(BuddyTransferOptionsController *)v78 miscState];
    v34 = [(BuddyMiscState *)v33 migrationManager];
    id v35 = [(BuddyTargetDeviceMigrationManager *)v34 connectionInfo];
    id v36 = [v35 connectionType];

    if (v36 == (id)1)
    {
      id v37 = [v69[5] stringByReplacingOccurrencesOfString:@"Wireless" withString:@"Wired"];
      id v38 = v69[5];
      v69[5] = v37;
    }
  }
  id v39 = [(BuddyTransferOptionsController *)v78 view];
  id v40 = [v39 traitCollection];
  v59 = _NSConcreteStackBlock;
  int v60 = -1073741824;
  int v61 = 0;
  v62 = sub_10016ACF4;
  v63 = &unk_1002B29C8;
  v64[0] = v78;
  v64[1] = &v68;
  [v40 performAsCurrentTraitCollection:&v59];

  v41 = [(BuddyTransferOptionsController *)v78 proximitySetupController];
  v42 = [(ProximitySetupController *)v41 productVersion];
  unsigned __int8 v43 = [(NSString *)v42 hasPrefix:@"iPhone15,"];

  char v58 = v43 & 1;
  if (v67)
  {
    if (SBUIIsSystemApertureEnabled())
    {
      id v44 = [v69[5] stringByAppendingString:@" D7X"];
      id v45 = v69[5];
      v69[5] = v44;
    }
  }
  else if (SBUIIsSystemApertureEnabled())
  {
    id v57 = @" D7X";
    if ((v65 & 1) == 0 && (v58 & 1) == 0) {
      objc_storeStrong(&v57, @" D3X-D7X");
    }
    id v46 = [v69[5] stringByAppendingString:v57];
    id v47 = v69[5];
    v69[5] = v46;

    objc_storeStrong(&v57, 0);
  }
  else if ((v58 & 1) != 0 && (v66 & 1) == 0)
  {
    id v48 = [v69[5] stringByAppendingString:@" D7X-D3X"];
    id v49 = v69[5];
    v69[5] = v48;
  }
  id v50 = objc_alloc((Class)NSDataAsset);
  id v56 = [v50 initWithName:v69[5]];
  id v51 = v75;
  id v52 = [v56 data];
  id v53 = +[CALayer buddy_layerForPackageWithData:v52 geometryFlipped:0 scale:3.0];
  [v51 setIconLayer:v53];

  id v54 = v75;
  objc_storeStrong(&v56, 0);
  objc_storeStrong(v64, 0);
  _Block_object_dispose(&v68, 8);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(location, 0);

  return v54;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 == 1) {
    double v7 = 16.0;
  }
  else {
    double v7 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a4];
  objc_storeStrong(location, 0);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  if ([v8 section])
  {
    [(BuddyTransferOptionsController *)v10 _updateAnalyticsWithChoice:@"migration"];
    id v5 = (BuddyMiscState *)[(BuddyTransferOptionsController *)v10 startDeviceMigrationBlock];
    (*(void (**)(BuddyMiscState *))&v5->_launchedWithCombinedAnalyticsMismatch)(v5);
  }
  else
  {
    [(BuddyTransferOptionsController *)v10 _updateAnalyticsWithChoice:@"cloud"];
    id v5 = [(BuddyTransferOptionsController *)v10 miscState];
    unsigned __int8 v6 = [(BuddyMiscState *)v5 migrationManager];
    [(BuddyTargetDeviceMigrationManager *)v6 cancelWithCause:3];
  }
  [location[0] deselectRowAtIndexPath:v8 animated:1];
  double v7 = [(BuddyTransferOptionsController *)v10 delegate];
  [(BFFFlowItemDelegate *)v7 flowItemDone:v10];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v7 = [v20 contentView];
  [v7 _setContinuousCornerRadius:10.0];

  id v8 = [v20 selectedBackgroundView];
  id v9 = [v8 layer];
  [v9 setMasksToBounds:1];

  id v10 = [v20 contentView];
  [v10 _continuousCornerRadius];
  double v12 = v11;
  id v13 = [v20 selectedBackgroundView];
  [v13 _setContinuousCornerRadius:v12];

  id v14 = +[UIColor secondarySystemBackgroundColor];
  id v15 = [v20 contentView];
  [v15 setBackgroundColor:v14];

  id v16 = +[UIColor systemGray5Color];
  id v17 = [v20 selectedBackgroundView];
  [v17 setBackgroundColor:v16];

  objc_super v18 = +[UIColor clearColor];
  [v20 setBackgroundColor:v18];

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_otherOptionsTapped:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyTransferOptionsController *)v8 miscState];
  objc_super v4 = [(BuddyMiscState *)v3 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v4 cancelWithCause:3];

  id v5 = [(BuddyTransferOptionsController *)v8 proximitySetupController];
  [(ProximitySetupController *)v5 setSkipExpressRestore:1];

  [(BuddyTransferOptionsController *)v8 _updateAnalyticsWithChoice:@"other"];
  unsigned __int8 v6 = [(BuddyTransferOptionsController *)v8 delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:v8];

  objc_storeStrong(location, 0);
}

- (void)_updateAnalyticsWithChoice:(id)a3
{
  unsigned __int8 v6 = self;
  v5[1] = (id)a2;
  v5[0] = 0;
  objc_storeStrong(v5, a3);
  id v3 = [(BuddyTransferOptionsController *)v6 analyticsManager];
  v7[0] = @"choice";
  v8[0] = v5[0];
  v7[1] = @"type";
  v8[1] = @"light";
  objc_super v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
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

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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