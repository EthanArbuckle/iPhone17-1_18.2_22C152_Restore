@interface BuddyMigrationTargetLockscreenController
- (BuddyMigrationTargetLockscreenErrorController)errorController;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)setErrorController:(id)a3;
@end

@implementation BuddyMigrationTargetLockscreenController

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  v14.receiver = v17;
  v14.super_class = (Class)BuddyMigrationTargetLockscreenController;
  [(BuddyMigrationLockscreenController *)&v14 deviceMigrationManager:location[0] didCompleteWithError:v15];
  if (v15)
  {
    v5 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    v9 = sub_10008B020;
    v10 = &unk_1002B12F0;
    v11 = v17;
    id v12 = v15;
    dispatch_async((dispatch_queue_t)v5, &block);

    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
    int v13 = 0;
  }
  else
  {
    int v13 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (BuddyMigrationTargetLockscreenErrorController)errorController
{
  return self->_errorController;
}

- (void)setErrorController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end