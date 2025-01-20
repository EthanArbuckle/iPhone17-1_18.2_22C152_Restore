@interface WDSourcesViewController
+ (id)tableViewSectionClasses;
- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate;
- (NSString)restorationSourceBundleIdentifier;
- (WDSourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4;
- (id)uniqueUserActivityType;
- (void)_updateActivityForViewDidAppear;
- (void)applicationWillEnterForeground;
- (void)pushViewController:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setRestorationSourceBundleIdentifier:(id)a3;
- (void)setSettingsNavigationDonatingDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDSourcesViewController

+ (id)tableViewSectionClasses
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];

  return v2;
}

- (WDSourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WDSourcesViewController;
  v7 = [(WDHealthTableViewController *)&v24 initWithProfile:v6 usingInsetStyling:v4];
  if (v7)
  {
    v8 = WDBundle();
    v9 = [v8 localizedStringForKey:@"SOURCES" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(WDSourcesViewController *)v7 setTitle:v9];

    v10 = (void *)MEMORY[0x263F1C6B0];
    v11 = WDBundle();
    v12 = [v10 imageNamed:@"sources" inBundle:v11];
    v13 = [v12 _imageThatSuppressesAccessibilityHairlineThickening];
    v14 = [(WDSourcesViewController *)v7 tabBarItem];
    [v14 setImage:v13];

    id v15 = objc_alloc(MEMORY[0x263F469C8]);
    v16 = [v6 healthStore];
    uint64_t v17 = [v15 initWithHealthStore:v16];
    appsDataSource = v7->_appsDataSource;
    v7->_appsDataSource = (HKSourceListDataSource *)v17;

    [(HKSourceListDataSource *)v7->_appsDataSource setDeliverUpdates:1];
    [(HKSourceListDataSource *)v7->_appsDataSource setShouldFetchAppIcons:0];
    [(HKSourceListDataSource *)v7->_appsDataSource setShouldFetchPurposeStrings:1];
    [(HKSourceListDataSource *)v7->_appsDataSource setShouldIncludeSpecialSources:1];
    id v19 = objc_alloc(MEMORY[0x263F469C8]);
    v20 = [v6 healthStore];
    uint64_t v21 = [v19 initWithHealthStore:v20];
    devicesDataSource = v7->_devicesDataSource;
    v7->_devicesDataSource = (HKSourceListDataSource *)v21;

    [(HKSourceListDataSource *)v7->_devicesDataSource setDeliverUpdates:1];
    [(HKSourceListDataSource *)v7->_devicesDataSource setShouldIncludeSpecialSources:1];
  }

  return v7;
}

- (void)viewDidLoad
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)WDSourcesViewController;
  [(WDTableViewController *)&v20 viewDidLoad];
  v3 = [(WDSourcesViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(WDTableViewController *)self tableSections];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        v11 = [(WDTableViewController *)self tableSections];
        objc_msgSend(v10, "setShouldHideHeader:", objc_msgSend(v11, "count") == 1);

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = &OBJC_IVAR___WDSourcesViewController__devicesDataSource;
        }
        else {
          v12 = &OBJC_IVAR___WDSourcesViewController__appsDataSource;
        }
        restorationSourceBundleIdentifier = self->_restorationSourceBundleIdentifier;
        id v14 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v12);
        [v10 setRestorationSourceBundleIdentifier:restorationSourceBundleIdentifier];
        [v10 setSourceListDataSource:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDSourcesViewController;
  [(WDTableViewController *)&v4 viewWillAppear:a3];
  [(HKSourceListDataSource *)self->_appsDataSource fetchSources];
  [(HKSourceListDataSource *)self->_devicesDataSource fetchSources];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(WDSourcesViewController *)self _updateActivityForViewDidAppear];
  v7.receiver = self;
  v7.super_class = (Class)WDSourcesViewController;
  [(WDSourcesViewController *)&v7 viewDidAppear:v3];
  v5 = [(WDSourcesViewController *)self settingsNavigationDonatingDelegate];
  uint64_t v6 = [NSURL URLWithString:@"prefs://root=HEALTH&path=SOURCES"];
  [v5 donateWithDeepLink:v6 andTitle:@"Sources"];
}

- (void)pushViewController:(id)a3
{
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [v6 navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  v8.receiver = self;
  v8.super_class = (Class)WDSourcesViewController;
  [(WDTableViewController *)&v8 pushViewController:v6 animated:v4];
}

- (void)applicationWillEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)WDSourcesViewController;
  [(WDTableViewController *)&v3 applicationWillEnterForeground];
  [(HKSourceListDataSource *)self->_appsDataSource fetchSources];
  [(HKSourceListDataSource *)self->_devicesDataSource fetchSources];
}

- (id)uniqueUserActivityType
{
  return @"com.apple.Health.tab";
}

- (void)_updateActivityForViewDidAppear
{
  objc_super v3 = [(WDTableViewController *)self profile];
  id v5 = [v3 userActivityManager];

  BOOL v4 = [(WDSourcesViewController *)self title];
  [v5 changeActivityForResponder:self activityDictionary:0 title:v4 keywords:0];
}

- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsNavigationDonatingDelegate);

  return (HKHealthSettingsNavigationDonating *)WeakRetained;
}

- (void)setSettingsNavigationDonatingDelegate:(id)a3
{
}

- (NSString)restorationSourceBundleIdentifier
{
  return self->_restorationSourceBundleIdentifier;
}

- (void)setRestorationSourceBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorationSourceBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_settingsNavigationDonatingDelegate);
  objc_storeStrong((id *)&self->_devicesDataSource, 0);

  objc_storeStrong((id *)&self->_appsDataSource, 0);
}

@end