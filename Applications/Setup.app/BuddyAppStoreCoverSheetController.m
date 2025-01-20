@interface BuddyAppStoreCoverSheetController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddyAppStoreController)appStoreController;
- (BuddyFinishedController)finishedController;
- (BuddySuspendTask)suspendTask;
- (unint64_t)allowedTerminationSources;
- (void)setAppStoreController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinishedController:(id)a3;
- (void)setSuspendTask:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyAppStoreCoverSheetController

- (void)viewDidLoad
{
  v23 = self;
  SEL v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)BuddyAppStoreCoverSheetController;
  [(BuddyCoverSheetController *)&v21 viewDidLoad];
  id v2 = [(BuddyAppStoreCoverSheetController *)v23 navigationItem];
  [v2 setHidesBackButton:1];

  v3 = objc_alloc_init(BuddyFinishedController);
  [(BuddyAppStoreCoverSheetController *)v23 setFinishedController:v3];

  v4 = [(BuddyAppStoreCoverSheetController *)v23 finishedController];
  [(BuddyFinishedController *)v4 setDrawHomeAffordance:1];

  v5 = objc_alloc_init(BuddyAppStoreController);
  [(BuddyAppStoreCoverSheetController *)v23 setAppStoreController:v5];

  v6 = [(BuddyAppStoreCoverSheetController *)v23 suspendTask];
  v7 = [(BuddyAppStoreCoverSheetController *)v23 finishedController];
  [(BuddyFinishedController *)v7 setSuspendTask:v6];

  v8 = [(BuddyAppStoreCoverSheetController *)v23 suspendTask];
  v9 = [(BuddyAppStoreCoverSheetController *)v23 appStoreController];
  [(BuddyAppStoreController *)v9 setSuspendTask:v8];

  v10 = [(BuddyAppStoreCoverSheetController *)v23 finishedController];
  [(BuddyCoverSheetController *)v23 setForegroundViewController:v10];

  v11 = [(BuddyAppStoreCoverSheetController *)v23 appStoreController];
  [(BuddyCoverSheetController *)v23 setBackgroundViewController:v11];

  v12 = [(BuddyAppStoreCoverSheetController *)v23 delegate];
  v13 = [(BuddyAppStoreCoverSheetController *)v23 finishedController];
  [(BuddyFinishedController *)v13 setDelegate:v12];

  objc_initWeak(&location, v23);
  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_1001380F0;
  v18 = &unk_1002B0CA8;
  objc_copyWeak(&v19, &location);
  [(BuddyCoverSheetController *)v23 setBackgroundViewControllerPresented:&v14];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

+ (id)cloudConfigSkipKey
{
  return +[BuddyAppStoreController cloudConfigSkipKey];
}

+ (BOOL)controllerNeedsToRun
{
  id v2 = +[BYDevice currentDevice];
  char v6 = 0;
  char v3 = 0;
  if (![v2 type])
  {
    id v7 = +[BYDevice currentDevice];
    char v6 = 1;
    char v3 = [v7 hasHomeButton] ^ 1;
  }
  if (v6) {

  }
  unsigned __int8 v4 = 0;
  if (v3) {
    unsigned __int8 v4 = +[BuddyFinishedController controllerNeedsToRun];
  }
  return v4 & 1;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
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

- (BuddyFinishedController)finishedController
{
  return self->_finishedController;
}

- (void)setFinishedController:(id)a3
{
}

- (BuddyAppStoreController)appStoreController
{
  return self->_appStoreController;
}

- (void)setAppStoreController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end