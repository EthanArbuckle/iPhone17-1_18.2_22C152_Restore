@interface BuddyMigrationFlow
+ (id)allowedFlowItems;
- (BuddyMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (BuddyMiscState)miscState;
- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setMiscState:(id)a3;
- (void)startFlowAnimated:(BOOL)a3;
@end

@implementation BuddyMigrationFlow

- (BuddyMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v15 = 0;
  objc_storeStrong(&v15, a6);
  id v9 = v19;
  id v19 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)BuddyMigrationFlow;
  v10 = [(BuddyMigrationFlow *)&v14 initWithNavigationController:location[0] flowDelegate:v17 flowStarter:v16 dependencyInjector:v15];
  id v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v11 = +[NSArray arrayWithObjects:v20 count:4];
    [v19 setClassList:v11];
  }
  v12 = (BuddyMigrationFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

- (void)startFlowAnimated:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMigrationFlow;
  [(BuddyMigrationFlow *)&v3 startFlowAnimated:a3];
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  v18 = self;
  SEL v17 = a2;
  Class v16 = a3;
  Class v15 = a4;
  BOOL v4 = [(BuddyMigrationFlow *)self miscState];
  SEL v5 = [(BuddyMiscState *)v4 migrationManager];
  unsigned __int8 v6 = [(BuddyTargetDeviceMigrationManager *)v5 willMigrate];

  char v14 = v6 & 1;
  if ((v6 & 1) != 0 || v16 != (Class)objc_opt_class())
  {
    v11.receiver = v18;
    v11.super_class = (Class)BuddyMigrationFlow;
    id v19 = [(BuddyMigrationFlow *)&v11 controllerFollowingControllerClass:v16 requestedNext:v15];
  }
  else
  {
    id v13 = +[NSError errorWithDomain:@"MBErrorDomain" code:202 userInfo:0];
    id location = [[BuddyMigrationTargetErrorController alloc] initWithError:v13];
    v7 = [(BuddyMigrationFlow *)v18 miscState];
    v8 = [(BuddyMiscState *)v7 migrationManager];
    [location setForceErase:[v8 hasTransferredData]];

    [(BuddyMigrationFlow *)v18 configureFlowItem:location];
    id v19 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v13, 0);
  }
  id v9 = v19;

  return v9;
}

+ (id)allowedFlowItems
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 5, a2, a1);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = (void (**)(id, unint64_t))location[0];
  BOOL v4 = [(BuddyMigrationFlow *)v7 miscState];
  SEL v5 = [(BuddyMiscState *)v4 migrationManager];
  v3[2](v3, [(BuddyTargetDeviceMigrationManager *)v5 migrationInProgressOrCompleted]);

  objc_storeStrong(location, 0);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end