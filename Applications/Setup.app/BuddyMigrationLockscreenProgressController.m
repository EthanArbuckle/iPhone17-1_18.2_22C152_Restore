@interface BuddyMigrationLockscreenProgressController
- (BOOL)_canShowWhileLocked;
- (NSString)titleText;
- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4;
- (void)loadView;
- (void)setTitle:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation BuddyMigrationLockscreenProgressController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationLockscreenProgressController;
  [(BuddyMigrationLockscreenProgressController *)&v5 loadView];
  id v2 = [(BuddyMigrationLockscreenProgressController *)v7 headerView];
  v3 = +[UIImage imageNamed:@"Lock"];
  [v2 setIcon:v3 accessibilityLabel:0];

  id v4 = [(BuddyMigrationLockscreenProgressController *)v7 headerView];
  [v4 setIconInheritsTint:1];
}

- (void)setTitle:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyMigrationLockscreenProgressController *)v5 loadViewIfNeeded];
  id v3 = [(BuddyMigrationLockscreenProgressController *)v5 headerView];
  [v3 setTitle:location[0]];

  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  objc_super v5 = &_dispatch_main_q;
  SEL v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1001ED814;
  v10 = &unk_1002B12F0;
  v11 = v15;
  id v12 = v13;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  objc_super v5 = &_dispatch_main_q;
  SEL v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1001EDB04;
  v10 = &unk_1002B12F0;
  v11 = v15;
  id v12 = v13;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end