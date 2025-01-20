@interface BuddyMigrationTargetProgressController
- (BuddyMigrationTargetProgressController)init;
- (NSString)sourceDeviceName;
- (id)createLockscreenController;
- (void)cancelMigration;
- (void)confirmCancellation:(id)a3;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setSourceDeviceName:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMigrationTargetProgressController

- (BuddyMigrationTargetProgressController)init
{
  SEL v7 = a2;
  v3 = +[UIImage imageNamed:@"Transfer Progress Target"];
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationTargetProgressController;
  id location = [(BuddyMigrationProgressController *)&v6 initWithTitle:&stru_1002B4E18 icon:v3];
  v4 = (BuddyMigrationTargetProgressController *)location;

  objc_storeStrong(&location, 0);
  return v4;
}

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationTargetProgressController;
  [(BuddyMigrationTargetProgressController *)&v6 viewDidLoad];
  v2 = +[NSBundle mainBundle];
  v3 = [(NSBundle *)v2 localizedStringForKey:@"MIGRATING_TITLE_DESTINATION" value:&stru_1002B4E18 table:@"Migration"];
  v4 = [(BuddyMigrationTargetProgressController *)v8 sourceDeviceName];
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v4);
  [(BuddyMigrationProgressController *)v8 setProgressTitle:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationTargetProgressController;
  [(BuddyMigrationProgressController *)&v5 viewDidAppear:a3];
  if ([(BuddyMigrationTargetProgressController *)v8 isMovingToParentViewController])
  {
    v3 = [(BuddyMigrationProgressController *)v8 miscState];
    v4 = [(BuddyMiscState *)v3 migrationManager];
    [(BuddyTargetDeviceMigrationManager *)v4 addDelegate:v8];
  }
}

- (void)confirmCancellation:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  BOOL v6 = sub_10015471C;
  SEL v7 = &unk_1002B2070;
  id v8 = location[0];
  id v9 = +[BuddyMigrationCancelAlertController alertControllerForTargetWithNeedsErase:1 completion:&v3];
  [(BuddyMigrationTargetProgressController *)v11 presentViewController:v9 animated:1 completion:0];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelMigration
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)BuddyMigrationTargetProgressController;
  [(BuddyMigrationProgressController *)&v8 cancelMigration];
  v2 = [(BuddyMigrationProgressController *)v10 miscState];
  v3 = [(BuddyMiscState *)v2 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v3 cancelWithCause:2];

  int v4 = [(BuddyMigrationProgressController *)v10 analyticsManager];
  [(BYAnalyticsManager *)v4 commitThenUpload];

  id location = objc_alloc_init((Class)DDRResetOptions);
  id v6 = [objc_alloc((Class)DDRResetRequest) initWithMode:4 options:location reason:@"Migration Cancellation Erase"];
  int v5 = +[DDRResetService sharedInstance];
  [(DDRResetService *)v5 resetWithRequest:v6 completion:&stru_1002B3AF8];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&location, 0);
}

- (id)createLockscreenController
{
  v2 = [BuddyMigrationTargetLockscreenController alloc];
  v3 = [(BuddyMigrationProgressController *)self progressTitle];
  int v4 = [(BuddyMigrationLockscreenController *)v2 initWithProgressTitle:v3];

  return v4;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMigrationProgressController *)v18 miscState];
  int v4 = [(BuddyMiscState *)v3 migrationManager];
  char v5 = [(BuddyTargetDeviceMigrationManager *)v4 willMigrate] ^ 1;

  if (v5)
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v16 = 1;
  }
  else
  {
    id v6 = [(BuddyMigrationProgressController *)v18 proximitySetupController];
    SEL v7 = [(ProximitySetupController *)v6 deviceName];
    [(BuddyMigrationTargetProgressController *)v18 setSourceDeviceName:v7];

    objc_super v8 = dispatch_get_global_queue(0, 0);
    SEL v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_100154D0C;
    v13 = &unk_1002B0CD0;
    v14 = v18;
    id v15 = location[0];
    dispatch_async(v8, &v9);

    objc_storeStrong(&v15, 0);
    objc_storeStrong((id *)&v14, 0);
    int v16 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)BuddyMigrationTargetProgressController;
  [(BuddyMigrationProgressController *)&v16 deviceMigrationManager:location[0] didCompleteWithError:v17];
  char v5 = [(BuddyMigrationProgressController *)v19 miscState];
  id v6 = [(BuddyMiscState *)v5 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v6 removeDelegate:v19];

  if (v17)
  {
    SEL v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    int v11 = sub_100154FDC;
    v12 = &unk_1002B15F0;
    id v13 = v17;
    id v14 = location[0];
    id v15 = v19;
    dispatch_async((dispatch_queue_t)v7, &block);

    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (NSString)sourceDeviceName
{
  return self->_sourceDeviceName;
}

- (void)setSourceDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end