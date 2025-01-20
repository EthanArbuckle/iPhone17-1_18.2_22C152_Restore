@interface BuddyMigrationSourceProgressController
- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient;
- (BuddyMigrationSourceProgressController)init;
- (NSError)error;
- (NSString)internalStatistics;
- (id)createLockscreenController;
- (void)cancelMigration;
- (void)confirmCancellation:(id)a3;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)setError:(id)a3;
- (void)setMigrationSourceClient:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMigrationSourceProgressController

- (BuddyMigrationSourceProgressController)init
{
  SEL v9 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MIGRATING_TITLE_SOURCE" value:&stru_1002B4E18 table:@"Migration"];
  v5 = +[UIImage imageNamed:@"Transfer Progress Source"];
  id location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyMigrationSourceProgressController;
  id location = [(BuddyMigrationSourceProgressController *)&v8 initWithTitle:v4 detailText:0 icon:v5];
  v6 = (BuddyMigrationSourceProgressController *)location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BuddyMigrationSourceProgressController;
  [(BuddyMigrationSourceProgressController *)&v13 viewWillAppear:a3];
  if ([(BuddyMigrationSourceProgressController *)v16 isMovingToParentViewController])
  {
    id v3 = objc_alloc_init((Class)BYBuddyDaemonMigrationSourceClient);
    [(BuddyMigrationSourceProgressController *)v16 setMigrationSourceClient:v3];

    v4 = v16;
    v5 = [(BuddyMigrationSourceProgressController *)v16 migrationSourceClient];
    [(BYBuddyDaemonMigrationSourceClient *)v5 setDelegate:v4];

    v6 = [(BuddyMigrationSourceProgressController *)v16 migrationSourceClient];
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_10019ACC4;
    v11 = &unk_1002B4420;
    v12 = v16;
    [(BYBuddyDaemonMigrationSourceClient *)v6 registerAsUserInterfaceHost:&v7];

    objc_storeStrong((id *)&v12, 0);
  }
}

- (NSString)internalStatistics
{
  return (NSString *)[(BuddyMigrationSourceProgressController *)self internalProgressText];
}

- (void)confirmCancellation:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BuddyMigrationCancelAlertController alertControllerForSource:location[0]];
  -[BuddyMigrationSourceProgressController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", v3, 1, 0, v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelMigration
{
  objc_super v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyMigrationSourceProgressController;
  [(BuddyMigrationProgressController *)&v11 cancelMigration];
  v2 = dispatch_get_global_queue(2, 0);
  block = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10019B0BC;
  int v9 = &unk_1002B0D20;
  v10 = v13;
  dispatch_async(v2, &block);

  id v3 = v13;
  id v4 = +[NSError errorWithDomain:@"MBErrorDomain" code:202 userInfo:0];
  [(BuddyMigrationSourceProgressController *)v3 deviceMigrationManager:0 didCompleteWithError:v4];

  objc_storeStrong((id *)&v10, 0);
}

- (id)createLockscreenController
{
  v2 = [BuddyMigrationSourceLockscreenController alloc];
  id v3 = [(BuddyMigrationProgressController *)self progressTitle];
  id v4 = [(BuddyMigrationLockscreenController *)v2 initWithProgressTitle:v3];

  return v4;
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  v13.receiver = v16;
  v13.super_class = (Class)BuddyMigrationSourceProgressController;
  [(BuddyMigrationProgressController *)&v13 deviceMigrationManager:location[0] didCompleteWithError:v14];
  v5 = &_dispatch_main_q;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_10019B2E8;
  v10 = &unk_1002B12F0;
  objc_super v11 = v16;
  id v12 = v14;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient
{
  return self->_migrationSourceClient;
}

- (void)setMigrationSourceClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end