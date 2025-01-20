@interface HKOverlayRoomBloodGlucoseViewController
+ (id)_buildPercentInRangeChartCacheWithApplicationItems:(id)a3;
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (BOOL)_isEnhancedChartingEnabledWithHealthStore:(id)a3;
- (HKChartCache)percentInRangeChartCache;
- (HKOverlayRoomBloodGlucoseViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8;
- (NSMutableArray)contextDelegates;
- (id)_buildBloodGlucoseAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5;
- (id)_buildEuglycemicRangeStringWithApplicationItems:(id)a3;
- (id)_buildGranularAverageDataSourceTitleFromTimeScope;
- (id)_buildPercentInRangeDisplayTypeWithApplicationItems:(id)a3 classification:(int64_t)a4;
- (id)_buildPercentInRangeOverlayContextSectionWithApplicationItems:(id)a3 overlayChartController:(id)a4;
- (id)_buildPercentInRangeStackedBarSeriesForClassification:(int64_t)a3;
- (id)chartOverlayVersion;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)getChartSummaryTrendModelToModify;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (int64_t)_initialPillForPreference:(int64_t)a3;
- (int64_t)preferredOverlay;
- (void)setContextDelegates:(id)a3;
- (void)setPercentInRangeChartCache:(id)a3;
@end

@implementation HKOverlayRoomBloodGlucoseViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  v21 = (void *)[objc_alloc((Class)a1) initWithDisplayDate:v19 applicationItems:v20 mode:1 preferredOverlay:a7 trendModel:v17 factorDisplayTypes:v16];

  [v21 setRestorationUserActivity:v18];
  [v21 setAdditionalChartOptions:a11];
  return v21;
}

- (HKOverlayRoomBloodGlucoseViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v16];
  id v19 = (void *)v18;
  if (v18) {
    id v20 = (void *)v18;
  }
  else {
    id v20 = v14;
  }
  id v21 = v20;

  v32.receiver = self;
  v32.super_class = (Class)HKOverlayRoomBloodGlucoseViewController;
  v22 = [(HKOverlayRoomViewController *)&v32 initWithDisplayDate:v21 applicationItems:v15 factorDisplayTypes:v17 mode:a5];

  if (v22)
  {
    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v24;

    uint64_t v26 = +[HKOverlayRoomBloodGlucoseViewController _buildPercentInRangeChartCacheWithApplicationItems:v15];
    percentInRangeChartCache = v22->_percentInRangeChartCache;
    v22->_percentInRangeChartCache = (HKChartCache *)v26;

    objc_storeStrong((id *)&v22->_trendModel, a7);
    if (a5 == 3)
    {
      uint64_t v28 = 0;
    }
    else
    {
      unsigned int v29 = [v16 selectTrendInitially];
      if (a5) {
        BOOL v30 = a6 == 0;
      }
      else {
        BOOL v30 = 1;
      }
      if (v30) {
        uint64_t v28 = v29;
      }
      else {
        uint64_t v28 = 1;
      }
    }
    [(HKOverlayRoomViewController *)v22 setShouldSelectInitialOverlay:v28];
  }

  return v22;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"BLOOD_GLUCOSE" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];

  return v4;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v4 = *MEMORY[0x1E4F2A610];
  id v5 = a3;
  v6 = [v3 quantityTypeForIdentifier:v4];
  v7 = [v5 displayTypeController];

  v8 = [v7 displayTypeForObjectType:v6];

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v84[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HKOverlayRoomBloodGlucoseViewController *)self primaryDisplayTypeWithApplicationItems:v8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E6D51A58;
  id v11 = v9;
  id v73 = v11;
  id v12 = v8;
  id v74 = v12;
  int64_t v75 = a3;
  v13 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v68[3] = &unk_1E6D51A80;
  id v14 = v11;
  id v69 = v14;
  id v15 = v12;
  id v70 = v15;
  int64_t v71 = a3;
  id v16 = _Block_copy(v68);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v63[3] = &unk_1E6D51AA8;
  v63[4] = self;
  id v17 = v15;
  id v64 = v17;
  id v60 = v10;
  id v65 = v60;
  id v61 = v14;
  id v66 = v61;
  int64_t v67 = a3;
  int64_t v57 = a3;
  uint64_t v18 = _Block_copy(v63);
  v58 = v16;
  id v19 = (*((void (**)(void *))v16 + 2))(v16);
  v84[0] = v19;
  id v20 = v13[2](v13, 0, 2);
  v84[1] = v20;
  v59 = v18;
  id v21 = (*((void (**)(void *))v18 + 2))(v18);
  v84[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];

  v62 = v17;
  v23 = [v17 healthStore];
  LODWORD(v19) = [(HKOverlayRoomBloodGlucoseViewController *)self _isEnhancedChartingEnabledWithHealthStore:v23];

  int v56 = (int)v19;
  if (v19)
  {
    v24 = v13[2](v13, 2, 32);
    v83[0] = v24;
    v25 = (void (**)(void, uint64_t, uint64_t))v13;
    uint64_t v26 = v13[2](v13, 6, 128);
    v83[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    uint64_t v28 = [v22 arrayByAddingObjectsFromArray:v27];

    unsigned int v29 = (void *)v28;
  }
  else
  {
    v25 = (void (**)(void, uint64_t, uint64_t))v13;
    unsigned int v29 = v22;
  }
  int64_t v30 = [(HKOverlayRoomBloodGlucoseViewController *)self _initialPillForPreference:[(HKOverlayRoomBloodGlucoseViewController *)self preferredOverlay]];
  if (v30 == 2)
  {
    v31 = v25;
    v25[2](v25, 2, 32);
    goto LABEL_8;
  }
  if (v30 == 1)
  {
    v31 = v25;
    v25[2](v25, 6, 128);
    objc_super v32 = LABEL_8:;
    goto LABEL_10;
  }
  objc_super v32 = (*((void (**)(void))v18 + 2))();
  v31 = v25;
LABEL_10:
  if (self->_trendModel)
  {
    v33 = [[HKOverlayRoomTrendContext alloc] initWithBaseDisplayType:v60 trendModel:self->_trendModel overlayChartController:v61 applicationItems:v62 overlayMode:v57];
    v34 = [(HKOverlayRoomViewController *)self chartController];
    [v34 setTrendAccessibilityDelegate:v33];

    uint64_t v35 = [v29 arrayByAddingObject:v33];
    v36 = v29;
    unsigned int v29 = (void *)v35;

    if ([(HKChartSummaryTrendModel *)self->_trendModel selectTrendInitially])
    {
      v37 = v33;

      objc_super v32 = v37;
    }
    unint64_t v38 = 0x1E4F1C000;
  }
  else
  {
    unint64_t v38 = 0x1E4F1C000uLL;
  }
  if ((unint64_t)(v57 - 1) >= 2)
  {
    if (v57 != 3)
    {
      v51 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_28;
    }
    v48 = v29;
    uint64_t v49 = [v29 indexOfObject:v32];
    if (v49 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = 0;
    }
    else
    {
      v50 = [NSNumber numberWithUnsignedInteger:v49];
    }
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v50);
    if (v49 != 0x7FFFFFFFFFFFFFFFLL) {

    }
    unsigned int v29 = v48;
    v42 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(v52, 0, v48);
    if (!v56)
    {
      v55 = [HKOverlayContextSectionContainer alloc];
      v76 = v42;
      v43 = [*(id *)(v38 + 2424) arrayWithObjects:&v76 count:1];
      v44 = [(HKOverlayContextSectionContainer *)v55 initWithContainerTitle:0 overlayContextSections:v43];
      v77 = v44;
      v51 = [*(id *)(v38 + 2424) arrayWithObjects:&v77 count:1];
      goto LABEL_27;
    }
    v43 = [(HKOverlayRoomBloodGlucoseViewController *)self _buildPercentInRangeOverlayContextSectionWithApplicationItems:v62 overlayChartController:v61];
    v53 = [HKOverlayContextSectionContainer alloc];
    v78[0] = v42;
    v78[1] = v43;
    v44 = [*(id *)(v38 + 2424) arrayWithObjects:v78 count:2];
    v45 = [(HKOverlayContextSectionContainer *)v53 initWithContainerTitle:0 overlayContextSections:v44];
    v79 = v45;
    v46 = *(void **)(v38 + 2424);
    v47 = &v79;
  }
  else
  {
    v39 = [NSNumber numberWithUnsignedInteger:0];
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = v39;

    v41 = [HKOverlayContextSectionContainer alloc];
    v80 = v32;
    v42 = [*(id *)(v38 + 2424) arrayWithObjects:&v80 count:1];
    v43 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v42, 0, v42);
    v81 = v43;
    v44 = [*(id *)(v38 + 2424) arrayWithObjects:&v81 count:1];
    v45 = [(HKOverlayContextSectionContainer *)v41 initWithContainerTitle:0 overlayContextSections:v44];
    v82 = v45;
    v46 = *(void **)(v38 + 2424);
    v47 = &v82;
  }
  v51 = [v46 arrayWithObjects:v47 count:1];

LABEL_27:
LABEL_28:

  return v51;
}

HKOverlayContextSection *__115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [[HKOverlayContextSection alloc] initWithSectionTitle:v5 overlayContextItems:v4];

  return v6;
}

id __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:a2 namedPredicate:0 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 options:a3 mode:a1[6]];
}

HKOverlayRoomViewControllerLastQuantityContext *__115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(void *a1)
{
  v1 = [[HKOverlayRoomViewControllerLastQuantityContext alloc] initWithOverlayChartController:a1[4] applicationItems:a1[5] mode:a1[6]];
  return v1;
}

id __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) unitController];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) healthStore];
  v6 = [v2 _buildBloodGlucoseAverageDataSourceWithUnitController:v3 displayType:v4 healthStore:v5];

  v7 = [[_HKBloodGlucoseQuantityContextDelegate alloc] initWithCustomDataSource:v6 primaryDisplayType:*(void *)(a1 + 48)];
  if (v7) {
    [*(id *)(*(void *)(a1 + 32) + 1360) addObject:v7];
  }
  id v8 = +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:*MEMORY[0x1E4F2A610] overlayChartController:*(void *)(a1 + 56) applicationItems:*(void *)(a1 + 40) optionalDelegate:v7 seriesOptions:0 mode:*(void *)(a1 + 64)];

  return v8;
}

- (BOOL)_isEnhancedChartingEnabledWithHealthStore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 profileIdentifier];
  uint64_t v6 = [v5 type];

  if (v6 == 1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2B040]);
    id v8 = (void *)[v7 initWithFeatureIdentifier:*MEMORY[0x1E4F29D40] healthStore:v4];
    id v15 = 0;
    id v9 = [v8 onboardedCountryCodeSupportedStateWithError:&v15];
    id v10 = v15;
    if (v9)
    {
      unint64_t v11 = [v9 integerValue];
      if (v11 <= 5) {
        unsigned int v12 = (5u >> v11) & 1;
      }
      else {
        LOBYTE(v12) = 1;
      }
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        [(HKOverlayRoomBloodGlucoseViewController *)v13 _isEnhancedChartingEnabledWithHealthStore:(uint64_t)v10];
      }
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  int64_t result = 0;
  if (a3 > 9)
  {
    if (a3 == 11) {
      return result;
    }
    if (a3 == 10) {
      return 2;
    }
  }
  else
  {
    if (!a3) {
      return result;
    }
    if (a3 == 9) {
      return 1;
    }
  }
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
    -[HKOverlayRoomBloodGlucoseViewController _initialPillForPreference:](a3, v5);
  }
  return 0;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [HKOverlayRoomBloodGlucoseViewController alloc];
  int64_t v11 = [(HKOverlayRoomBloodGlucoseViewController *)self preferredOverlay];
  trendModel = self->_trendModel;
  v13 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v14 = [(HKOverlayRoomBloodGlucoseViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 mode:a3 preferredOverlay:v11 trendModel:trendModel factorDisplayTypes:v13];

  [(HKOverlayRoomViewController *)v14 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v14;
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    int64_t v3 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:self->_trendModel];
    if (v3 != 8)
    {
      int64_t v4 = v3;
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      uint64_t v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayRoomBloodGlucoseViewController;
  id v7 = [(HKOverlayRoomViewController *)&v9 createChartOverlayViewController];
  return v7;
}

- (id)getChartSummaryTrendModelToModify
{
  return self->_trendModel;
}

- (id)_buildPercentInRangeOverlayContextSectionWithApplicationItems:(id)a3 overlayChartController:(id)a4
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke;
  aBlock[3] = &unk_1E6D51AF8;
  void aBlock[4] = self;
  v27 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_3;
  v29[3] = &unk_1E6D51B20;
  v29[4] = self;
  id v30 = v6;
  id v31 = v7;
  id v28 = v7;
  id v26 = v6;
  id v8 = (void (**)(void *, uint64_t))_Block_copy(v29);
  objc_super v9 = v8[2](v8, 3);
  v33[0] = v9;
  id v10 = v8[2](v8, 2);
  v33[1] = v10;
  int64_t v11 = v8[2](v8, 1);
  v33[2] = v11;
  unsigned int v12 = v8[2](v8, 0);
  v33[3] = v12;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];

  v13 = NSString;
  id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v15 = [v14 localizedStringForKey:@"GLUCOSE_OVERLAY_PERCENT_IN_RANGE_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v16 = [(HKOverlayRoomBloodGlucoseViewController *)self _buildEuglycemicRangeStringWithApplicationItems:v26];
  id v17 = objc_msgSend(v13, "stringWithFormat:", v15, v16);

  uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v19 = [v18 localizedStringForKey:@"GLUCOSE_OVERLAY_PERCENT_IN_RANGE_SECTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v21 = [v20 localizedStringForKey:@"GLUCOSE_OVERLAY_LEARN_MORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v22 = v27[2](v27, v19, v17, v21, v24);

  return v22;
}

HKOverlayContextSection *__128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v13 = [HKOverlayContextSection alloc];
  id v14 = (void *)MEMORY[0x1E4FB13F0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_2;
  v21[3] = &unk_1E6D51AD0;
  objc_copyWeak(&v25, &location);
  id v15 = v9;
  id v22 = v15;
  id v16 = v10;
  uint64_t v17 = *(void *)(a1 + 32);
  id v23 = v16;
  uint64_t v24 = v17;
  uint64_t v18 = [v14 actionWithTitle:v11 image:0 identifier:0 handler:v21];
  id v19 = [(HKOverlayContextSection *)v13 initWithSectionTitle:v15 overlayContextItems:v12 accessoryButtonAction:v18];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v19;
}

void __128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_2(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    int64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2990], 2);
    int64_t v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v24 = *MEMORY[0x1E4FB06F8];
    uint64_t v7 = v24;
    v25[0] = v3;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v9 = (void *)[v5 initWithString:v6 attributes:v8];

    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v22 = v7;
    id v23 = v4;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v13 = (void *)[v10 initWithString:v11 attributes:v12];

    id v14 = [[HKInfographicContentItem alloc] initWithTitle:v9 description:v13];
    id v15 = [HKInfographicViewController alloc];
    id v21 = v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v17 = [(HKInfographicViewController *)v15 initWithContentItems:v16];

    uint64_t v18 = HKHealthKitFrameworkBundle();
    id v19 = [v18 localizedStringForKey:@"BLOOD_GLUCOSE" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];
    [(HKInfographicViewController *)v17 setTitle:v19];

    id v20 = [[HKModalNavigationController alloc] initWithRootViewController:v17];
    objc_msgSend(*(id *)(a1 + 48), "hk_presentModalCardViewController:fullScreen:animated:completion:", v20, 0, 1, 0);
  }
}

_HKBloodGlucosePercentInRangeContext *__128__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeOverlayContextSectionWithApplicationItems_overlayChartController___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int64_t v4 = [*(id *)(a1 + 32) _buildPercentInRangeDisplayTypeWithApplicationItems:*(void *)(a1 + 40) classification:a2];
  id v5 = [_HKBloodGlucosePercentInRangeContext alloc];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) unitController];
  id v8 = [*(id *)(a1 + 40) displayTypeController];
  id v9 = [(_HKBloodGlucosePercentInRangeContext *)v5 initWithBaseDisplayType:v4 classification:a2 overlayChartController:v6 unitController:v7 displayTypeController:v8];

  return v9;
}

- (id)_buildEuglycemicRangeStringWithApplicationItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HKOverlayRoomBloodGlucoseViewController *)self primaryDisplayTypeWithApplicationItems:v4];
  uint64_t v6 = [v4 unitController];
  uint64_t v7 = [v6 unitForDisplayType:v5];

  id v8 = [v4 unitController];
  id v9 = [v8 localizedDisplayNameForDisplayType:v5];

  id v10 = [MEMORY[0x1E4F2B380] ATTDEuglycemicRangeWithUnit:v7];
  uint64_t v11 = [v10 minimum];
  [v11 doubleValueForUnit:v7];
  double v13 = v12;

  id v14 = [NSNumber numberWithDouble:v13];
  id v15 = [v4 unitController];
  id v16 = HKFormattedStringFromValue(v14, v5, v15, 0, 0);

  uint64_t v17 = [v10 maximum];
  [v17 doubleValueForUnit:v7];
  double v19 = v18;

  id v20 = [NSNumber numberWithDouble:v19];
  id v21 = [v4 unitController];

  uint64_t v22 = HKFormattedStringFromValue(v20, v5, v21, 0, 0);

  id v23 = NSString;
  uint64_t v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v25 = [v24 localizedStringForKey:@"OVERLAY_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v26 = objc_msgSend(v23, "stringWithFormat:", v25, v16, v22);

  v27 = HKFormatValueAndUnit(v26, v9);

  return v27;
}

- (id)_buildPercentInRangeDisplayTypeWithApplicationItems:(id)a3 classification:(int64_t)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v7 = *MEMORY[0x1E4F2A610];
  id v8 = a3;
  id v9 = [v6 quantityTypeForIdentifier:v7];
  id v10 = [v8 displayTypeController];

  uint64_t v11 = [v10 displayTypeForObjectType:v9];

  double v12 = [(HKOverlayRoomBloodGlucoseViewController *)self _buildPercentInRangeStackedBarSeriesForClassification:a4];
  double v13 = objc_alloc_init(HKInteractiveChartBloodGlucosePercentInRangeFormatter);
  [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)v13 setHighlightedClassification:a4];
  id v14 = [[HKInteractiveChartDisplayType alloc] initWithGraphSeries:v12 baseDisplayType:v11 valueFormatter:v13 dataTypeCode:15];

  return v14;
}

- (id)_buildPercentInRangeStackedBarSeriesForClassification:(int64_t)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(HKStackedBarSeries);
  uint64_t v6 = objc_alloc_init(HKStrokeStyle);
  uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  [(HKStrokeStyle *)v6 setStrokeColor:v7];

  [(HKStrokeStyle *)v6 setLineWidth:3.0];
  [(HKStrokeStyle *)v6 setBlendMode:22];
  [(HKBarSeries *)v5 setUnselectedStrokeStyle:v6];
  id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  id v9 = +[HKStrokeStyle strokeStyleWithColor:v8 lineWidth:3.0];
  [(HKBarSeries *)v5 setTiledStrokeStyle:v9];

  -[HKBarSeries setCornerRadii:](v5, "setCornerRadii:", 1.5, 1.5);
  [(HKStackedBarSeries *)v5 setShouldRoundBottomCorners:1];
  id v10 = objc_alloc_init(HKSolidFillStyle);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_stackedBarSeriesUnselectedColor");
  [(HKSolidFillStyle *)v10 setColor:v11];

  double v12 = objc_alloc_init(HKSolidFillStyle);
  double v13 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsKeyColor");
  [(HKSolidFillStyle *)v12 setColor:v13];

  id v14 = (void *)MEMORY[0x1E4F1CA48];
  v23[0] = v10;
  v23[1] = v10;
  v23[2] = v10;
  v23[3] = v10;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  id v16 = [v14 arrayWithArray:v15];

  [v16 setObject:v12 atIndexedSubscript:a3];
  uint64_t v17 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
  if (a3 == 1)
  {
    [v16 setObject:v12 atIndexedSubscript:0];
    [v17 addIndex:0];
  }
  [(HKStackedBarSeries *)v5 setUnseparatedSegmentIndices:v17];
  [(HKStackedBarSeries *)v5 setUnselectedFillStyles:v16];
  double v18 = objc_alloc_init(HKNumericAxisConfiguration);
  double v19 = objc_alloc_init(_HKAxisLabelDimensionBloodGlucosePercentInRange);
  [(HKNumericAxisConfiguration *)v18 setLabelDimension:v19];

  id v20 = +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:v18];
  [(HKGraphSeries *)v5 setYAxis:v20];

  id v21 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v21 setChartCache:self->_percentInRangeChartCache];
  [(HKGraphSeries *)v5 setDataSource:v21];

  return v5;
}

+ (id)_buildPercentInRangeChartCacheWithApplicationItems:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A610]];
  id v5 = [v3 displayTypeController];
  uint64_t v6 = [v5 displayTypeForObjectType:v4];

  uint64_t v7 = [v3 chartDataCacheController];
  id v8 = [v7 findCustomCachesForDisplayType:v6];

  objc_msgSend(v8, "hk_firstObjectPassingTest:", &__block_literal_global_344);
  id v9 = (HKChartCache *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v9 = objc_alloc_init(HKChartCache);
    id v10 = [HKBloodGlucosePercentInRangeDataSource alloc];
    uint64_t v11 = [v3 healthStore];
    double v12 = [v3 unitController];
    double v13 = [(HKBloodGlucosePercentInRangeDataSource *)v10 initWithHealthStore:v11 unitController:v12];

    [(HKChartCache *)v9 setDataSource:v13];
    id v14 = +[HKOutstandingFetchOperationManager sharedOperationManager];
    [(HKChartCache *)v9 setOperationManager:v14];

    id v15 = [v3 chartDataCacheController];
    [v15 addCustomChartCache:v9 forDisplayType:v6];
  }
  return v9;
}

uint64_t __94__HKOverlayRoomBloodGlucoseViewController__buildPercentInRangeChartCacheWithApplicationItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_buildBloodGlucoseAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HKQuantityTypeDataSource *)[HKSingleDailyValueQuantityTypeDataSource alloc] initWithUnitController:v8 options:2 displayType:v9 healthStore:v10];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  double v19 = __121__HKOverlayRoomBloodGlucoseViewController__buildBloodGlucoseAverageDataSourceWithUnitController_displayType_healthStore___block_invoke;
  id v20 = &unk_1E6D51B68;
  id v21 = v8;
  id v22 = v9;
  id v12 = v9;
  id v13 = v8;
  [(HKQuantityTypeDataSource *)v11 setUserInfoCreationBlock:&v17];
  id v14 = [(HKOverlayRoomBloodGlucoseViewController *)self _buildGranularAverageDataSourceTitleFromTimeScope];
  id v15 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v11 named:@"HKOverlayRoomNamedChartCacheDataSource_BloodGlucose" withContextTitleForTimeScope:v14];

  return v15;
}

HKInteractiveChartSinglePointData *__121__HKOverlayRoomBloodGlucoseViewController__buildBloodGlucoseAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 unitForDisplayType:v3];
  uint64_t v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  uint64_t v7 = [v4 averageQuantity];
  [v7 doubleValueForUnit:v5];
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  [(HKInteractiveChartSinglePointData *)v6 setUnit:v5];
  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", [v4 recordCount]);
  id v8 = [v4 statisticsInterval];

  [(HKInteractiveChartSinglePointData *)v6 setStatisticsInterval:v8];
  return v6;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__HKOverlayRoomBloodGlucoseViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E6D51B90;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  uint64_t v3 = _Block_copy(v2);

  return v3;
}

__CFString *__92__HKOverlayRoomBloodGlucoseViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 7:
    case 8:
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"HKOverlayRoomBloodGlucoseViewController.m", 549, @"Unsupported zoom level (%ld)", a2);
      id v5 = &stru_1F3B9CF20;
      goto LABEL_8;
    case 2:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_MONTHLY";
      goto LABEL_7;
    case 3:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_WEEKLY";
      goto LABEL_7;
    case 4:
    case 5:
    case 6:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_DAILY";
LABEL_7:
      id v5 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_8:

      break;
    default:
      id v5 = &stru_1F3B9CF20;
      break;
  }
  return v5;
}

- (id)chartOverlayVersion
{
  v2 = self;
  uint64_t v3 = [(HKOverlayRoomViewController *)self applicationItems];
  id v4 = [v3 healthStore];
  LODWORD(v2) = [(HKOverlayRoomBloodGlucoseViewController *)v2 _isEnhancedChartingEnabledWithHealthStore:v4];

  id v5 = &HKChartOverlayVersionEnhancedOverlays;
  if (!v2) {
    id v5 = HKChartOverlayVersionOverlays;
  }
  uint64_t v6 = *v5;
  return v6;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
}

- (HKChartCache)percentInRangeChartCache
{
  return self->_percentInRangeChartCache;
}

- (void)setPercentInRangeChartCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentInRangeChartCache, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

- (void)_isEnhancedChartingEnabledWithHealthStore:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Error determining enhanced glucose charting availability: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_initialPillForPreference:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "HKOverlayRoomBloodGlucoseViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end