@interface BuddyMigrationSourceEraseController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddyMigrationSourceEraseController)init;
- (DKEraseFlow)eraseFlow;
- (UIViewController)initialViewController;
- (id)viewController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEraseFlow:(id)a3;
- (void)setInitialViewController:(id)a3;
@end

@implementation BuddyMigrationSourceEraseController

- (BuddyMigrationSourceEraseController)init
{
  SEL v22 = a2;
  id location = 0;
  v21.receiver = self;
  v21.super_class = (Class)BuddyMigrationSourceEraseController;
  id location = [(BuddyMigrationSourceEraseController *)&v21 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = objc_alloc((Class)sub_1001241E4());
    id v3 = [sub_1001242FC() setupAssistantConfiguration];
    id v4 = [v2 initWithConfiguration:v3];
    v5 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v4;

    objc_initWeak(&from, location);
    v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_100124414;
    v18 = &unk_1002B0CA8;
    objc_copyWeak(&v19, &from);
    [*((id *)location + 2) setPresentNetworkSettings:&v14];
    v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_100124480;
    v12 = &unk_1002B0CA8;
    objc_copyWeak(&v13, &from);
    [*((id *)location + 2) setCompletion:&v8];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
  }
  v6 = (BuddyMigrationSourceEraseController *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationSourceEraseController *)v12 eraseFlow];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001245F8;
  v8 = &unk_1002B0CD0;
  int v9 = v12;
  id v10 = location[0];
  [(DKEraseFlow *)v3 prepareFlow:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return [(BuddyMigrationSourceEraseController *)self initialViewController];
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DKEraseFlow)eraseFlow
{
  return self->_eraseFlow;
}

- (void)setEraseFlow:(id)a3
{
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end