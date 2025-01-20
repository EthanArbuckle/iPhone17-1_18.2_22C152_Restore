@interface BuddyMigrationLockscreenController
- (BuddyMigrationLockscreenController)initWithProgressTitle:(id)a3;
- (BuddyMigrationLockscreenDisconnectController)disconnectController;
- (BuddyMigrationLockscreenProgressController)progressController;
- (BuddyMigrationNavigationController)navigationController;
- (OS_dispatch_queue)disconnectionQueue;
- (SBSSecureAppAssertion)assertion;
- (int64_t)connectionState;
- (void)activate;
- (void)deactivate;
- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4;
- (void)setAssertion:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDisconnectController:(id)a3;
- (void)setDisconnectionQueue:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setProgressController:(id)a3;
- (void)setProgressTitle:(id)a3;
@end

@implementation BuddyMigrationLockscreenController

- (BuddyMigrationLockscreenController)initWithProgressTitle:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v14;
  id v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)BuddyMigrationLockscreenController;
  v4 = [(BuddyMigrationLockscreenController *)&v12 init];
  id v14 = v4;
  objc_storeStrong(&v14, v4);
  if (v4)
  {
    v5 = [BuddyMigrationLockscreenProgressController alloc];
    v6 = [(BuddyMigrationLockscreenProgressController *)v5 initWithTitle:location[0] detailText:0 icon:0];
    v7 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = v6;

    *((void *)v14 + 6) = 0;
    dispatch_queue_t v8 = dispatch_queue_create("Disconnection Queue", 0);
    v9 = (void *)*((void *)v14 + 5);
    *((void *)v14 + 5) = v8;
  }
  v10 = (BuddyMigrationLockscreenController *)v14;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v10;
}

- (void)setProgressTitle:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationLockscreenController *)v5 progressController];
  [(BuddyMigrationLockscreenProgressController *)v3 setTitle:location[0]];

  objc_storeStrong(location, 0);
}

- (void)activate
{
  v2 = objc_alloc_init(BuddyMigrationNavigationController);
  -[BuddyMigrationLockscreenController setNavigationController:](self, "setNavigationController:", v2, a2);

  id v3 = [(BuddyMigrationLockscreenController *)self progressController];
  v11 = v3;
  v4 = +[NSArray arrayWithObjects:&v11 count:1];
  v5 = [(BuddyMigrationLockscreenController *)self navigationController];
  [(BuddyMigrationNavigationController *)v5 setViewControllers:v4];

  id v6 = +[BFFStyle sharedStyle];
  v7 = [(BuddyMigrationLockscreenController *)self navigationController];
  [v6 applyThemeToNavigationController:v7];

  id v8 = +[SBSSecureAppAssertion acquireSecureAppAssertionWithType:10 errorHandler:&stru_1002B3DD8];
  [(BuddyMigrationLockscreenController *)self setAssertion:v8];
}

- (void)deactivate
{
  v2 = [(BuddyMigrationLockscreenController *)self assertion];
  [(SBSSecureAppAssertion *)v2 invalidate];

  [(BuddyMigrationLockscreenController *)self setAssertion:0];
}

- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = [(BuddyMigrationLockscreenController *)v16 progressController];
  [(BuddyMigrationLockscreenProgressController *)v5 deviceMigrationManager:location[0] didChangeConnectionInformation:v14];

  id v6 = [(BuddyMigrationLockscreenController *)v16 disconnectionQueue];
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_10016E1A8;
  v11 = &unk_1002B12F0;
  id v12 = v14;
  v13 = v16;
  dispatch_async(v6, &v7);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = [(BuddyMigrationLockscreenController *)v8 progressController];
  [(BuddyMigrationLockscreenProgressController *)v5 deviceMigrationManager:location[0] didCompleteWithError:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = [(BuddyMigrationLockscreenController *)v8 progressController];
  [(BuddyMigrationLockscreenProgressController *)v5 deviceMigrationManager:location[0] didUpdateProgress:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (BuddyMigrationNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (SBSSecureAppAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (BuddyMigrationLockscreenDisconnectController)disconnectController
{
  return self->_disconnectController;
}

- (void)setDisconnectController:(id)a3
{
}

- (BuddyMigrationLockscreenProgressController)progressController
{
  return self->_progressController;
}

- (void)setProgressController:(id)a3
{
}

- (OS_dispatch_queue)disconnectionQueue
{
  return self->_disconnectionQueue;
}

- (void)setDisconnectionQueue:(id)a3
{
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (void).cxx_destruct
{
}

@end