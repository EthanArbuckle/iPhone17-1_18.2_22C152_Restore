@interface HBXViewControllerFactory
+ (NSMutableDictionary)factories;
+ (id)sharedInstance;
+ (id)sharedInstanceForHealthStore:(id)a3;
+ (os_unfair_recursive_lock_s)factoriesLock;
+ (void)resetSharedInstances;
- (HBXUnitSupport)unitSupport;
- (HBXViewControllerFactory)init;
- (HBXViewControllerFactory)initWithHealthStore:(id)a3;
- (HKApplicationProviding)applicationProvider;
- (HKHealthChartFactory)chartFactory;
- (WDProfile)profile;
- (id)createActivityChartForActivityMoveMode:(int64_t)a3 displayDate:(id)a4 activityOptions:(unint64_t)a5 chartSharableModel:(id)a6;
- (id)createAppSourcesViewControllerUsingInsetStyling:(BOOL)a3;
- (id)createBuddyViewControllerWithHealthDetailsLast:(BOOL)a3;
- (id)createChartForTypeIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 minimumSize:(CGSize)a6 disableXAxis:(BOOL)a7;
- (id)createClinicalDocumentOverviewViewControllerWithSidebarIdentifier:(id)a3;
- (id)createContactConsolidationControllerInViewController:(id)a3;
- (id)createDataSourcesTableViewController:(id)a3;
- (id)createDeletedSourceMessageViewControllerForSource:(id)a3;
- (id)createDeviceSourcesViewControllerUsingInsetStyling:(BOOL)a3;
- (id)createDeviceStoredDataViewControllerForDevice:(id)a3 displayName:(id)a4 isBluetoothDevice:(BOOL)a5 deviceIdentifier:(id)a6 healthStore:(id)a7 usingInsetStyling:(BOOL)a8;
- (id)createElectrocardiogramDataMetadataViewControllerWithElectrocardiogram:(id)a3 dataProvider:(id)a4;
- (id)createElectrocardiogramListDataProvider;
- (id)createHKUnitPreferenceController;
- (id)createInteractiveChartForType:(id)a3 preferredOverlay:(int64_t)a4 displayDate:(id)a5;
- (id)createInteractiveChartForType:(id)a3 preferredOverlay:(int64_t)a4 displayDateInterval:(id)a5;
- (id)createListViewController:(id)a3;
- (id)createLocalDeviceStoredDataViewControllerForSource:(id)a3 withHealthStore:(id)a4 usingInsetStyling:(BOOL)a5;
- (id)createResearchStudySourcesViewControllerUsingInsetStyling:(BOOL)a3 restorationStudyBundleIdentifier:(id)a4;
- (id)createSingleAppAuthorizationViewControllerUsingInsetStyling:(BOOL)a3 restorationApplicationBundleIdentifier:(id)a4;
- (id)createSourcesViewControllerUsingInsetStyling:(BOOL)a3;
- (id)createUnitPreferencesController:(id)a3;
- (id)createWatchStoredDataViewControllerForSource:(id)a3 withHealthStore:(id)a4 usingInsetStyling:(BOOL)a5;
- (id)detailViewControllerForSourceModel:(id)a3 withHealthStore:(id)a4;
- (id)localizedDisplayNameForUnit:(id)a3;
- (id)localizedPreferredUnitDisplayNameForType:(id)a3;
- (id)localizedPreferredUnitDisplayNameForType:(id)a3 nameContext:(int64_t)a4;
- (id)localizedUnitDisplayNameForDisplayType:(id)a3 nameContext:(int64_t)a4;
- (id)notificationManager;
- (id)preferredUnitForType:(id)a3;
- (id)unitStringForType:(id)a3;
- (void)createAndStartExportForViewController:(id)a3 shareSheetSourceView:(id)a4;
- (void)fetchUserDefaultForKey:(id)a3 withCallback:(id)a4;
- (void)setApplicationProvider:(id)a3;
- (void)setChartFactory:(id)a3;
- (void)setProfile:(id)a3;
- (void)setUnitSupport:(id)a3;
- (void)updatePreferredUnit:(id)a3 forType:(id)a4;
@end

@implementation HBXViewControllerFactory

- (HBXViewControllerFactory)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HBXViewControllerFactory;
  v5 = [(HBXViewControllerFactory *)&v18 init];
  if (v5)
  {
    v6 = [[HBXShimWDProfile alloc] initWithHealthStore:v4];
    [(HBXViewControllerFactory *)v5 setProfile:v6];

    v7 = [HBXUnitSupport alloc];
    v8 = [(HBXViewControllerFactory *)v5 profile];
    v9 = [v8 unitController];
    v10 = [(HBXViewControllerFactory *)v5 profile];
    v11 = [v10 displayTypeController];
    v12 = [(HBXUnitSupport *)v7 initWithUnitPreferenceController:v9 displayTypeController:v11];
    [(HBXViewControllerFactory *)v5 setUnitSupport:v12];

    id v13 = objc_alloc(MEMORY[0x263F46780]);
    v14 = [(HBXViewControllerFactory *)v5 profile];
    v15 = [v14 healthStore];
    v16 = (void *)[v13 initWithHealthStore:v15];
    [(HBXViewControllerFactory *)v5 setChartFactory:v16];
  }
  return v5;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (id)createHKUnitPreferenceController
{
  v2 = [(HBXViewControllerFactory *)self profile];
  v3 = [v2 unitController];

  return v3;
}

+ (id)sharedInstanceForHealthStore:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [a1 factories];
  v6 = [v4 identifier];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v7 = [[HBXViewControllerFactory alloc] initWithHealthStore:v4];
    v8 = [a1 factories];
    v9 = [v4 identifier];
    [v8 setObject:v7 forKey:v9];
  }
  os_unfair_recursive_lock_unlock();

  return v7;
}

+ (NSMutableDictionary)factories
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_factoriesLock);
  v2 = (void *)_factories;
  if (!_factories)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = (void *)_factories;
    _factories = (uint64_t)v3;

    v2 = (void *)_factories;
  }

  return (NSMutableDictionary *)v2;
}

- (void)setUnitSupport:(id)a3
{
}

- (void)setProfile:(id)a3
{
}

- (void)setChartFactory:(id)a3
{
}

- (void)setApplicationProvider:(id)a3
{
}

+ (os_unfair_recursive_lock_s)factoriesLock
{
  return (os_unfair_recursive_lock_s)_factoriesLock;
}

+ (id)sharedInstance
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [a1 factories];
  id v4 = [MEMORY[0x263F0A420] primaryStoreIdentifier];
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F0A410]);
    v5 = [[HBXViewControllerFactory alloc] initWithHealthStore:v6];
    v7 = [a1 factories];
    v8 = [MEMORY[0x263F0A420] primaryStoreIdentifier];
    [v7 setObject:v5 forKey:v8];
  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

+ (void)resetSharedInstances
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [a1 factories];
  [v3 removeAllObjects];

  os_unfair_recursive_lock_unlock();
}

- (HBXViewControllerFactory)init
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)notificationManager
{
  return [(WDProfile *)self->_profile notificationManager];
}

- (id)createBuddyViewControllerWithHealthDetailsLast:(BOOL)a3
{
  id v3 = [[WDBuddyFlowUserInfoViewController alloc] initWithProfile:self->_profile isLastScreen:a3];

  return v3;
}

- (id)createSourcesViewControllerUsingInsetStyling:(BOOL)a3
{
  id v3 = [[WDSourcesViewController alloc] initWithProfile:self->_profile usingInsetStyling:a3];

  return v3;
}

- (id)createAppSourcesViewControllerUsingInsetStyling:(BOOL)a3
{
  id v3 = [[WDAppSourcesViewController alloc] initWithProfile:self->_profile usingInsetStyling:a3];

  return v3;
}

- (id)createSingleAppAuthorizationViewControllerUsingInsetStyling:(BOOL)a3 restorationApplicationBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [[WDAppSourcesViewController alloc] initWithProfile:self->_profile usingInsetStyling:v4];
  [(WDSourcesViewController *)v7 setRestorationSourceBundleIdentifier:v6];

  return v7;
}

- (id)createDeviceSourcesViewControllerUsingInsetStyling:(BOOL)a3
{
  id v3 = [[WDDeviceSourcesViewController alloc] initWithProfile:self->_profile usingInsetStyling:a3];

  return v3;
}

- (id)detailViewControllerForSourceModel:(id)a3 withHealthStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HBXShimWDProfile alloc] initWithHealthStore:v5];

  v8 = [(id)objc_opt_class() detailViewControllerForSourceModel:v6 withProfile:v7];

  return v8;
}

- (id)createWatchStoredDataViewControllerForSource:(id)a3 withHealthStore:(id)a4 usingInsetStyling:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [(HKTableViewController *)[WDWatchStoredDataViewController alloc] initWithUsingInsetStyling:v5];
  [(WDSourceStoredDataViewController *)v9 setSource:v8];

  v10 = [[HBXShimWDProfile alloc] initWithHealthStore:v7];
  [(WDStoredDataByCategoryViewController *)v9 setProfile:v10];

  return v9;
}

- (id)createLocalDeviceStoredDataViewControllerForSource:(id)a3 withHealthStore:(id)a4 usingInsetStyling:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [(HKTableViewController *)[WDLocalDeviceStoredDataViewController alloc] initWithUsingInsetStyling:v5];
  [(WDSourceStoredDataViewController *)v9 setSource:v8];

  v10 = [[HBXShimWDProfile alloc] initWithHealthStore:v7];
  [(WDStoredDataByCategoryViewController *)v9 setProfile:v10];

  return v9;
}

- (id)createDeviceStoredDataViewControllerForDevice:(id)a3 displayName:(id)a4 isBluetoothDevice:(BOOL)a5 deviceIdentifier:(id)a6 healthStore:(id)a7 usingInsetStyling:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = [(HKTableViewController *)[WDDeviceStoredDataViewController alloc] initWithUsingInsetStyling:v8];
  [(WDDeviceStoredDataViewController *)v17 setDevice:v16];

  [(WDDeviceStoredDataViewController *)v17 setDisplayName:v15];
  objc_super v18 = [[HBXShimWDProfile alloc] initWithHealthStore:v13];

  [(WDStoredDataByCategoryViewController *)v17 setProfile:v18];
  [(WDStoredDataByCategoryViewController *)v17 setIsBluetoothDevice:v10];
  [(WDStoredDataByCategoryViewController *)v17 setDeviceIdentifier:v14];

  return v17;
}

- (id)createContactConsolidationControllerInViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[WDContactConsolidationController alloc] initWithProfile:self->_profile presentingViewController:v4];

  return v5;
}

- (id)createResearchStudySourcesViewControllerUsingInsetStyling:(BOOL)a3 restorationStudyBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [[WDResearchStudySourcesViewController alloc] initWithProfile:self->_profile usingInsetStyling:v4];
  [(WDSourcesViewController *)v7 setRestorationSourceBundleIdentifier:v6];

  return v7;
}

- (id)createDeletedSourceMessageViewControllerForSource:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[WDSourceMessageViewController alloc] initWithStyle:1 source:v3];

  return v4;
}

- (id)createChartForTypeIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 minimumSize:(CGSize)a6 disableXAxis:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = 0;
  if (a4 && a5)
  {
    id v14 = [MEMORY[0x263F46A50] valueRangeWithMinValue:a4 maxValue:a5];
  }
  chartFactory = self->_chartFactory;
  id v16 = [MEMORY[0x263EFF8F0] currentCalendar];
  v17 = -[HKHealthChartFactory chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:](chartFactory, "chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:", v13, v14, v7, v16, width, height);

  return v17;
}

- (id)createInteractiveChartForType:(id)a3 preferredOverlay:(int64_t)a4 displayDate:(id)a5
{
  BOOL v8 = (void *)MEMORY[0x263F08798];
  id v9 = a3;
  BOOL v10 = objc_msgSend(v8, "hk_instantaneousDateIntervalWithDate:", a5);
  v11 = [(HBXViewControllerFactory *)self createInteractiveChartForType:v9 preferredOverlay:a4 displayDateInterval:v10];

  return v11;
}

- (id)createInteractiveChartForType:(id)a3 preferredOverlay:(int64_t)a4 displayDateInterval:(id)a5
{
  chartFactory = self->_chartFactory;
  id v8 = a5;
  id v9 = [a3 identifier];
  BOOL v10 = [(HKHealthChartFactory *)chartFactory interactiveChartForTypeIdentifier:v9 preferredOverlay:a4 displayDateInterval:v8 restorationUserActivity:0 chartSummaryTrendModel:0];

  return v10;
}

- (id)createActivityChartForActivityMoveMode:(int64_t)a3 displayDate:(id)a4 activityOptions:(unint64_t)a5 chartSharableModel:(id)a6
{
  return (id)[(HKHealthChartFactory *)self->_chartFactory activityChartForActivityMoveMode:a3 displayDate:a4 activityOptions:a5 chartSharableModel:a6];
}

- (id)createClinicalDocumentOverviewViewControllerWithSidebarIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  BOOL v4 = (void *)MEMORY[0x263F466E8];
  id v5 = a3;
  id v6 = [v4 categoryWithID:9];
  BOOL v7 = [(WDProfile *)self->_profile displayTypeController];
  id v8 = [v7 displayTypeWithIdentifier:&unk_26D2FD080];

  id v9 = HKHealthKitFrameworkBundle();
  BOOL v10 = [v9 localizedStringForKey:@"CLINICAL_DOCUMENTS" value:&stru_26D2EA890 table:*MEMORY[0x263F09880]];

  v11 = [WDDocumentOverviewViewController alloc];
  v15[0] = v8;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [(WDDocumentOverviewViewController *)v11 initWithDisplayTypes:v12 profile:self->_profile title:v10 category:v6 sidebarIdentifier:v5];

  return v13;
}

- (id)createUnitPreferencesController:(id)a3
{
  profile = self->_profile;
  id v5 = a3;
  id v6 = [(WDProfile *)profile displayTypeController];
  BOOL v7 = [v6 displayTypeForObjectType:v5];

  id v8 = HKUnitPreferenceControllerAvailableUnitsForDisplayType();
  id v9 = [WDUnitPreferenceViewController alloc];
  BOOL v10 = [(WDProfile *)self->_profile unitController];
  v11 = [(WDUnitPreferenceViewController *)v9 initWithUnits:v8 displayType:v7 unitController:v10];

  return v11;
}

- (id)createElectrocardiogramListDataProvider
{
  id v3 = [(WDProfile *)self->_profile displayTypeController];
  BOOL v4 = [MEMORY[0x263F0A358] electrocardiogramType];
  id v5 = [v3 displayTypeForObjectType:v4];

  id v6 = [[WDElectrocardiogramListDataProvider alloc] initWithDisplayType:v5 profile:self->_profile];

  return v6;
}

- (id)createElectrocardiogramDataMetadataViewControllerWithElectrocardiogram:(id)a3 dataProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[WDElectrocardiogramDataMetadataViewController alloc] initWithSample:v6 delegate:v5 mode:0 activeAlgorithmVersion:0];

  return v7;
}

- (id)createListViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [MEMORY[0x263F0A708] workoutRouteType];
  BOOL v7 = [v6 identifier];

  if (v5 == v7)
  {
    v12 = [MEMORY[0x263F466F0] displayTypeWithIdentifier:102];
    id v16 = WDWorkoutRouteListDataProvider;
  }
  else
  {
    id v8 = [v4 identifier];
    id v9 = [MEMORY[0x263F0A708] heartbeatSeriesType];
    BOOL v10 = [v9 identifier];

    if (v8 != v10)
    {
      v11 = [(WDProfile *)self->_profile displayTypeController];
      v12 = [v11 displayTypeForObjectType:v4];

      profile = self->_profile;
      id v14 = [(WDProfile *)profile unitController];
      objc_msgSend(v12, "wd_dataListViewControllerWithProfile:unitController:", profile, v14);
      id v15 = (WDDataListViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v12 = [MEMORY[0x263F466F0] displayTypeWithIdentifier:119];
    id v16 = WDHeartbeatSequenceListDataProvider;
  }
  id v17 = [v16 alloc];
  objc_super v18 = [(HBXViewControllerFactory *)self profile];
  id v14 = (void *)[v17 initWithDisplayType:v12 profile:v18];

  v19 = [WDDataListViewController alloc];
  v20 = [(HBXViewControllerFactory *)self profile];
  id v15 = [(WDDataListViewController *)v19 initWithDisplayType:v12 profile:v20 dataProvider:v14 usingInsetStyling:1];

LABEL_7:

  return v15;
}

- (id)createDataSourcesTableViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [MEMORY[0x263F0A708] workoutRouteType];
  BOOL v7 = [v6 identifier];

  if (v5 == v7)
  {
    id v17 = (void *)MEMORY[0x263F466F0];
    uint64_t v18 = 102;
  }
  else
  {
    id v8 = [v4 identifier];
    id v9 = [MEMORY[0x263F0A708] heartbeatSeriesType];
    BOOL v10 = [v9 identifier];

    if (v8 != v10)
    {
      v11 = [(WDProfile *)self->_profile displayTypeController];
      v12 = [v11 displayTypeForObjectType:v4];

      id v13 = [WDDisplayTypeDataSourcesTableViewController alloc];
      id v14 = [v12 displayCategory];
      id v15 = [(WDProfile *)self->_profile sourceOrderController];
      id v16 = [(WDDisplayTypeDataSourcesTableViewController *)v13 initWithDisplayType:v12 displayCategory:v14 sourceOrderController:v15 profile:self->_profile];
      goto LABEL_7;
    }
    id v17 = (void *)MEMORY[0x263F466F0];
    uint64_t v18 = 119;
  }
  v12 = [v17 displayTypeWithIdentifier:v18];
  id v14 = objc_msgSend(MEMORY[0x263F466E8], "categoryWithID:", objc_msgSend(v12, "categoryIdentifier"));
  v19 = [WDDisplayTypeDataSourcesTableViewController alloc];
  id v15 = [(HBXViewControllerFactory *)self profile];
  v20 = [v15 sourceOrderController];
  v21 = [(HBXViewControllerFactory *)self profile];
  id v16 = [(WDDisplayTypeDataSourcesTableViewController *)v19 initWithDisplayType:v12 displayCategory:v14 sourceOrderController:v20 profile:v21];

LABEL_7:

  return v16;
}

- (void)createAndStartExportForViewController:(id)a3 shareSheetSourceView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[WDExportController alloc] initWithProfile:self->_profile];
  id v8 = [(HBXViewControllerFactory *)self applicationProvider];
  [(WDExportController *)v9 setApplicationProvider:v8];

  [(WDExportController *)v9 verifyExportWithPresentingViewController:v7 shareSheetSourceView:v6];
}

- (id)localizedDisplayNameForUnit:(id)a3
{
  id v4 = a3;
  id v5 = [(HBXViewControllerFactory *)self unitSupport];
  id v6 = [v5 localizedDisplayNameForUnit:v4 nameContext:1];

  return v6;
}

- (id)localizedPreferredUnitDisplayNameForType:(id)a3
{
  return [(HBXViewControllerFactory *)self localizedPreferredUnitDisplayNameForType:a3 nameContext:1];
}

- (id)localizedPreferredUnitDisplayNameForType:(id)a3 nameContext:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HBXViewControllerFactory *)self unitSupport];
  id v8 = [v7 localizedPreferredUnitDisplayNameForType:v6 nameContext:a4];

  return v8;
}

- (id)preferredUnitForType:(id)a3
{
  id v4 = a3;
  id v5 = [(HBXViewControllerFactory *)self unitSupport];
  id v6 = [v5 preferredUnitForType:v4];

  return v6;
}

- (void)updatePreferredUnit:(id)a3 forType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HBXViewControllerFactory *)self unitSupport];
  [v8 updatePreferredUnit:v7 forType:v6];
}

- (id)localizedUnitDisplayNameForDisplayType:(id)a3 nameContext:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HBXViewControllerFactory *)self profile];
  id v8 = [v7 unitController];
  id v9 = [v8 localizedDisplayNameForDisplayType:v6 value:0 nameContext:a4];

  return v9;
}

- (void)fetchUserDefaultForKey:(id)a3 withCallback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HBXViewControllerFactory *)self profile];
  id v8 = [v9 userDefaults];
  [v8 valueForKey:v7 callback:v6];
}

- (id)unitStringForType:(id)a3
{
  return [(HBXViewControllerFactory *)self localizedPreferredUnitDisplayNameForType:a3 nameContext:1];
}

- (HKApplicationProviding)applicationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationProvider);

  return (HKApplicationProviding *)WeakRetained;
}

- (HKHealthChartFactory)chartFactory
{
  return self->_chartFactory;
}

- (HBXUnitSupport)unitSupport
{
  return self->_unitSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitSupport, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_chartFactory, 0);

  objc_destroyWeak((id *)&self->_applicationProvider);
}

@end