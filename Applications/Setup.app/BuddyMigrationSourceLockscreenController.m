@interface BuddyMigrationSourceLockscreenController
- (BuddyMigrationLockscreenFinishedController)finishedController;
- (BuddyMigrationSourceLockscreenErrorController)errorController;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)setErrorController:(id)a3;
- (void)setFinishedController:(id)a3;
@end

@implementation BuddyMigrationSourceLockscreenController

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  v13.receiver = v16;
  v13.super_class = (Class)BuddyMigrationSourceLockscreenController;
  [(BuddyMigrationLockscreenController *)&v13 deviceMigrationManager:location[0] didCompleteWithError:v14];
  v5 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_100189898;
  v10 = &unk_1002B12F0;
  id v11 = v14;
  v12 = v16;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (BuddyMigrationSourceLockscreenErrorController)errorController
{
  return self->_errorController;
}

- (void)setErrorController:(id)a3
{
}

- (BuddyMigrationLockscreenFinishedController)finishedController
{
  return self->_finishedController;
}

- (void)setFinishedController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end