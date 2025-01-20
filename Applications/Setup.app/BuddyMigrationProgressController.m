@interface BuddyMigrationProgressController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)shouldAllowStartOver;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMigrationBaseDisconnectController)disconnectController;
- (BuddyMigrationLockscreenController)lockscreenController;
- (BuddyMigrationProgressController)initWithTitle:(id)a3 icon:(id)a4;
- (BuddyMiscState)miscState;
- (BuddyTargetDeviceMigrationManager)manager;
- (MBDeviceTransferConnectionInfo)connectionInfo;
- (NSString)progressTitle;
- (OS_dispatch_queue)disconnectionQueue;
- (ProximitySetupController)proximitySetupController;
- (id)createLockscreenController;
- (int64_t)connectionState;
- (void)_cancelTapped:(id)a3;
- (void)cancelMigration;
- (void)confirmCancellation:(id)a3;
- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4;
- (void)loadView;
- (void)setAnalyticsManager:(id)a3;
- (void)setConnectionInfo:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnectController:(id)a3;
- (void)setDisconnectionQueue:(id)a3;
- (void)setLockscreenController:(id)a3;
- (void)setManager:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProgressTitle:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyMigrationProgressController

- (BuddyMigrationProgressController)initWithTitle:(id)a3 icon:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = v15;
  id v6 = location[0];
  v7 = +[NSBundle mainBundle];
  id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROGRESS_DETAIL_WIRELESS"];
  v9 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"Migration"];
  id v15 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)BuddyMigrationProgressController;
  id v15 = [(BuddyMigrationProgressController *)&v12 initWithTitle:v6 detailText:v9 icon:v13];
  objc_storeStrong(&v15, v15);

  if (v15) {
    objc_storeStrong((id *)v15 + 1, location[0]);
  }
  v10 = (BuddyMigrationProgressController *)v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v10;
}

- (void)loadView
{
  id v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationProgressController;
  [(BuddyMigrationProgressController *)&v6 loadView];
  id v2 = objc_alloc((Class)UIBarButtonItem);
  id location = [v2 initWithBarButtonSystemItem:1 target:v8 action:"_cancelTapped:"];
  id v3 = [(BuddyMigrationProgressController *)v8 navigationItem];
  [v3 setLeftBarButtonItem:location animated:0];

  dispatch_queue_t v4 = dispatch_queue_create("Disconnection Queue", 0);
  [(BuddyMigrationProgressController *)v8 setDisconnectionQueue:v4];

  [(BuddyMigrationProgressController *)v8 setConnectionState:0];
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyMigrationProgressController;
  [(BuddyMigrationProgressController *)&v12 viewDidAppear:a3];
  id v3 = [(BuddyMigrationProgressController *)v15 lockscreenController];

  if (!v3)
  {
    id v4 = [(BuddyMigrationProgressController *)v15 createLockscreenController];
    [(BuddyMigrationProgressController *)v15 setLockscreenController:v4];

    id v5 = [(BuddyMigrationProgressController *)v15 lockscreenController];
    [(BuddyMigrationLockscreenController *)v5 activate];

    objc_super v6 = [(BuddyMigrationProgressController *)v15 lockscreenController];
    SEL v7 = [(BuddyMigrationProgressController *)v15 miscState];
    [(BuddyMiscState *)v7 setMigrationLockscreenController:v6];

    id v8 = [(BuddyMigrationProgressController *)v15 connectionInfo];
    if (v8)
    {
      v9 = [(BuddyMigrationProgressController *)v15 lockscreenController];
      v10 = [(BuddyMigrationProgressController *)v15 manager];
      v11 = [(BuddyMigrationProgressController *)v15 connectionInfo];
      [(BuddyMigrationLockscreenController *)v9 deviceMigrationManager:v10 didChangeConnectionInformation:v11];

      [(BuddyMigrationProgressController *)v15 setManager:0];
      [(BuddyMigrationProgressController *)v15 setConnectionInfo:0];
    }
  }
}

- (void)setProgressTitle:(id)a3
{
  objc_super v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_progressTitle, location[0]);
  id v3 = [(BuddyMigrationProgressController *)v6 headerView];
  [v3 setTitle:location[0]];

  id v4 = [(BuddyMigrationProgressController *)v6 lockscreenController];
  [(BuddyMigrationLockscreenController *)v4 setProgressTitle:location[0]];

  objc_storeStrong(location, 0);
}

- (id)createLockscreenController
{
  return v3;
}

- (void)confirmCancellation:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)cancelMigration
{
  id v2 = [(BuddyMigrationProgressController *)self navigationItem];
  id v3 = [v2 leftBarButtonItem];
  [v3 setEnabled:0];
}

- (void)_cancelTapped:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_100141544;
  id v8 = &unk_1002B0D20;
  v9 = v11;
  [(BuddyMigrationProgressController *)v3 confirmCancellation:&v4];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  int v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_1001417CC;
  v18 = &unk_1002B15F0;
  v19 = v24;
  id v20 = location[0];
  id v21 = v22;
  dispatch_async((dispatch_queue_t)v5, &block);

  int v6 = [(BuddyMigrationProgressController *)v24 disconnectionQueue];
  SEL v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100141A00;
  v11 = &unk_1002B12F0;
  id v12 = v22;
  BOOL v13 = v24;
  dispatch_async(v6, &v7);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  int v5 = [(BuddyMigrationProgressController *)v16 lockscreenController];
  [(BuddyMigrationLockscreenController *)v5 deviceMigrationManager:location[0] didUpdateProgress:v14];

  int v6 = &_dispatch_main_q;
  SEL v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_1001420C0;
  v11 = &unk_1002B12F0;
  id v12 = v16;
  id v13 = v14;
  dispatch_async((dispatch_queue_t)v6, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
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
  int v5 = [(BuddyMigrationProgressController *)v8 lockscreenController];
  [(BuddyMigrationLockscreenController *)v5 deviceMigrationManager:location[0] didCompleteWithError:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (NSString)progressTitle
{
  return self->_progressTitle;
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

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BuddyMigrationLockscreenController)lockscreenController
{
  return self->_lockscreenController;
}

- (void)setLockscreenController:(id)a3
{
}

- (BuddyMigrationBaseDisconnectController)disconnectController
{
  return self->_disconnectController;
}

- (void)setDisconnectController:(id)a3
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

- (BuddyTargetDeviceMigrationManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (MBDeviceTransferConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end