@interface BuddySourceMigrationFlow
+ (id)allowedFlowItems;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddySourceMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (unint64_t)allowedTerminationSources;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)presentWiFiPaneForFlowItem:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)startFlowAnimated:(BOOL)a3;
@end

@implementation BuddySourceMigrationFlow

- (BuddySourceMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
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
  v14.super_class = (Class)BuddySourceMigrationFlow;
  v10 = [(BuddySourceMigrationFlow *)&v14 initWithNavigationController:location[0] flowDelegate:v17 flowStarter:v16 dependencyInjector:v15];
  id v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    uint64_t v20 = objc_opt_class();
    v11 = +[NSArray arrayWithObjects:&v20 count:1];
    [v19 setClassList:v11];
  }
  v12 = (BuddySourceMigrationFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

- (void)startFlowAnimated:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddySourceMigrationFlow;
  [(BuddySourceMigrationFlow *)&v4 startFlowAnimated:a3];
  v3 = [(BuddySourceMigrationFlow *)v7 buddyPreferencesExcludedFromBackup];
  +[BuddyMigrationState removeFromPreferences:v3];
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = location[0];
    id v14 = [v15 error];
    BOOL v13 = 0;
    id v5 = [v14 domain];
    BOOL v6 = 0;
    if ([v5 isEqualToString:@"MBErrorDomain"]) {
      BOOL v6 = [v14 code] == (id)202;
    }

    BOOL v13 = v6;
    if (!v6)
    {
      if (v14)
      {
        id obj = [[BuddyMigrationSourceErrorController alloc] initWithError:v14];
        objc_storeStrong(&v16, obj);
        objc_storeStrong(&obj, 0);
      }
      else
      {
        id v11 = objc_alloc_init(BuddyMigrationSourceFinished);
        id v7 = [v15 internalStatistics];
        [v11 setInternalStatistics:v7];

        objc_storeStrong(&v16, v11);
        objc_storeStrong(&v11, 0);
      }
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_alloc_init(BuddyMigrationSourceEraseController);
      id v9 = v16;
      id v16 = v8;
    }
  }
  [v16 setDelegate:v18];
  v10.receiver = v18;
  v10.super_class = (Class)BuddySourceMigrationFlow;
  [(BuddySourceMigrationFlow *)&v10 flowItemDone:location[0] nextItem:v16];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:4];
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (void)presentWiFiPaneForFlowItem:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddySourceMigrationFlow *)v7 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(BuddySourceMigrationFlow *)v7 delegate];
    [v5 presentWiFiPaneForFlow:v7];
  }
  objc_storeStrong(location, 0);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end