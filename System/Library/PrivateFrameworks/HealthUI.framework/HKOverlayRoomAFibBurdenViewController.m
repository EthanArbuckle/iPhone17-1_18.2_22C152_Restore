@interface HKOverlayRoomAFibBurdenViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (BOOL)supportsHealthFactors;
- (BOOL)supportsShowAllFilters;
- (HKAddDataViewControllerProvider)addDataViewControllerProvider;
- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager;
- (HKInteractiveChartDataFormatter)sleepChartFormatter;
- (HKInteractiveChartDisplayType)afibBurdenDisplayType;
- (HKOverlayRoomAFibBurdenViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6 sleepDataSourceProvider:(id)a7 sleepChartFormatter:(id)a8 preferredOverlay:(int64_t)a9 addDataViewControllerProvider:(id)a10;
- (HKSleepDataSourceProvider)sleepDataSourceProvider;
- (NSCalendar)currentCalendar;
- (NSNumber)preferredOverlayIndex;
- (OS_dispatch_queue)analyticsSubmissionQueue;
- (id)_aFibBurdenSeriesForTimeScope:(int64_t)a3 displayType:(id)a4 mode:(int64_t)a5 applicationItems:(id)a6;
- (id)_contextItemOrder;
- (id)_displayTypeForOverlayContextItem:(unint64_t)a3;
- (id)_generateAFibBurdenDisplayTypeWithApplicationItems:(id)a3 mode:(int64_t)a4;
- (id)_generateOverlayContextsWithPrimaryDisplayType:(id)a3 sleepDataSourceProvider:(id)a4 sleepChartFormatter:(id)a5 overlayChartController:(id)a6 applicationItems:(id)a7;
- (id)_infographicViewControllerForDisplayType:(id)a3 secondaryDisplayType:(id)a4 addDataViewControllerProvider:(id)a5 healthStore:(id)a6;
- (id)_lifeFactorViewControllerForKey:(id)a3 logButtonAction:(id)a4;
- (id)_overlayContextForOverlayContextItem:(unint64_t)a3 sleepDataSourceProvider:(id)a4 sleepChartFormatter:(id)a5 overlayChartController:(id)a6 applicationItems:(id)a7;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)preferredInitialOverlayIndex;
- (id)showAllFiltersButtonTitle;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (int64_t)preferredOverlay;
- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4;
- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4;
- (void)processSelectedRangeData:(id)a3 displayType:(id)a4;
- (void)viewDidLoad;
@end

@implementation HKOverlayRoomAFibBurdenViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v36 = a9;
  id v18 = a10;
  id v19 = a8;
  v20 = [v15 sleepDataSourceProvider];

  if (!v20)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:a1 file:@"HKOverlayRoomAFibBurdenViewController.m" lineNumber:80 description:@"The AFib Burden experience requires an externally provided data source provider."];
  }
  v21 = [v15 sleepChartFormatter];

  if (!v21)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:a1 file:@"HKOverlayRoomAFibBurdenViewController.m" lineNumber:81 description:@"The AFib Burden experience requires an externally provided sleep chart formatter."];
  }
  v22 = [HKOverlayRoomAFibBurdenViewController alloc];
  v23 = [v15 sleepDataSourceProvider];
  v24 = [v15 sleepChartFormatter];
  v25 = [v15 addDataViewControllerProvider];
  v26 = v22;
  v27 = v17;
  v28 = [(HKOverlayRoomAFibBurdenViewController *)v26 initWithDisplayDate:v17 applicationItems:v16 factorDisplayTypes:v18 mode:0 sleepDataSourceProvider:v23 sleepChartFormatter:v24 preferredOverlay:a7 addDataViewControllerProvider:v25];

  [(HKOverlayRoomViewController *)v28 setRestorationUserActivity:v19];
  [(HKOverlayRoomViewController *)v28 setAdditionalChartOptions:a11];
  if (v36)
  {
    v29 = [(HKOverlayRoomAFibBurdenViewController *)v28 primaryDisplayTypeWithApplicationItems:v16];
    v30 = [[HKOverlayRoomFactorAndTrendViewController alloc] initWithBaseChartDisplayType:v29 trendModel:v36 factorDisplayTypes:v18 displayDate:v27 applicationItems:v16 mode:1 timeScopeRanges:0 initialTimeScope:8 wrappedOverlay:v28 overrideFirstWeekday:-1 overrideCalendar:0 additionalChartOptions:a11];
  }
  else
  {
    v30 = v28;
  }

  return v30;
}

- (HKOverlayRoomAFibBurdenViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6 sleepDataSourceProvider:(id)a7 sleepChartFormatter:(id)a8 preferredOverlay:(int64_t)a9 addDataViewControllerProvider:(id)a10
{
  id v16 = a4;
  id v36 = a7;
  id v17 = a8;
  id v18 = a10;
  v37.receiver = self;
  v37.super_class = (Class)HKOverlayRoomAFibBurdenViewController;
  id v19 = [(HKOverlayRoomViewController *)&v37 initWithDisplayDate:a3 applicationItems:v16 factorDisplayTypes:a5 mode:a6];
  v20 = v19;
  if (v19)
  {
    preferredOverlayIndex = v19->_preferredOverlayIndex;
    v19->_preferredOverlayIndex = 0;

    v20->_preferredOverlay = a9;
    objc_storeStrong((id *)&v20->_sleepDataSourceProvider, a7);
    objc_storeStrong((id *)&v20->_sleepChartFormatter, a8);
    objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    v22 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    [(NSCalendar *)v22 setFirstWeekday:2];
    currentCalendar = v20->_currentCalendar;
    v20->_currentCalendar = v22;
    v24 = v22;

    [(HKOverlayRoomViewController *)v20 setShouldSelectInitialOverlay:a6 == 3];
    v25 = [(HKOverlayRoomAFibBurdenViewController *)v20 _generateAFibBurdenDisplayTypeWithApplicationItems:v16 mode:a6];
    afibBurdenDisplayType = v20->_afibBurdenDisplayType;
    v20->_afibBurdenDisplayType = v25;
    v27 = v25;

    objc_storeStrong((id *)&v20->_addDataViewControllerProvider, a10);
    uint64_t v28 = HKCreateSerialDispatchQueue();
    analyticsSubmissionQueue = v20->_analyticsSubmissionQueue;
    v20->_analyticsSubmissionQueue = (OS_dispatch_queue *)v28;

    id v30 = objc_alloc(MEMORY[0x1E4F2ABE8]);
    v31 = HKLogAFibBurden();
    v32 = [v16 healthStore];
    uint64_t v33 = [v30 initWithLoggingCategory:v31 healthDataSource:v32];
    analyticsEventSubmissionManager = v20->_analyticsEventSubmissionManager;
    v20->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v33;
  }
  return v20;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomAFibBurdenViewController;
  [(HKOverlayRoomViewController *)&v2 viewDidLoad];
}

- (id)_generateAFibBurdenDisplayTypeWithApplicationItems:(id)a3 mode:(int64_t)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F2B3B8];
  id v7 = a3;
  v8 = [v6 _quantityTypeWithCode:248];
  v9 = [v7 displayTypeController];
  v10 = [v9 displayTypeForObjectType:v8];

  v11 = objc_alloc_init(HKInteractiveChartAFibBurdenFormatter);
  v12 = [(HKOverlayRoomAFibBurdenViewController *)self _aFibBurdenSeriesForTimeScope:4 displayType:v10 mode:a4 applicationItems:v7];
  v13 = [(HKOverlayRoomAFibBurdenViewController *)self _aFibBurdenSeriesForTimeScope:3 displayType:v10 mode:a4 applicationItems:v7];

  v17[0] = &unk_1F3C20170;
  v17[1] = &unk_1F3C20188;
  v18[0] = v12;
  v18[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v15 = [[HKInteractiveChartDisplayType alloc] initWithBaseDisplayType:v10 valueFormatter:v11 dataTypeCode:248 seriesForTimeScopeMapping:v14];

  return v15;
}

- (id)_aFibBurdenSeriesForTimeScope:(int64_t)a3 displayType:(id)a4 mode:(int64_t)a5 applicationItems:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (a5 == 3) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 5;
  }
  id v12 = a6;
  v13 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v13 setMinLabels:v11];
  [(HKAxisConfiguration *)v13 setMaxLabels:v11];
  if ([(HKOverlayRoomViewController *)self controllerMode] == 3)
  {
    [(HKNumericAxisConfiguration *)v13 setTopVerticalLabelPadding:4.0];
    [(HKNumericAxisConfiguration *)v13 setBottomVerticalLabelPadding:2.0];
  }
  v14 = [v10 displayCategory];
  id v15 = [v12 unitController];
  id v16 = [v12 chartDataCacheController];

  id v17 = objc_msgSend(v10, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:", a3, v14, v15, v16, v13);

  id v18 = [MEMORY[0x1E4F2B618] percentUnit];
  double v19 = 50.0;
  if (a5 != 3) {
    double v19 = 100.0;
  }
  v20 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:v19];
  v21 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:0.0];
  v22 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:100.0];
  uint64_t v23 = +[HKValueRange valueRangeWithMinValue:v21 maxValue:v22];
  v24 = +[HKQuantityMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:v20 minimumValue:v21 maximumValue:v22 axisRangeOverrides:0];
  v40 = (void *)v23;
  [v24 setNoDataAxisBounds:v23];
  [v24 setUnit:v18];
  [v17 setAxisScalingRule:v24];
  id v41 = v17;
  v25 = [v17 yAxis];
  if (v25)
  {
    if ([(HKOverlayRoomViewController *)self controllerMode] == 3)
    {
      [v10 localization];
      v26 = v38 = v20;
      v27 = [v26 shortenedDisplayName];
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
      v29 = id v28 = v10;
      +[HKLegendEntry legendEntryWithTitle:v27 labelColor:v29];
      id v30 = v37 = v21;

      id v10 = v28;
      v20 = v38;
      v42[0] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      [v41 setTitleLegendEntries:v31];

      v21 = v37;
    }
  }
  else
  {
    v39 = v20;
    v32 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v33 = [v32 showSensitiveLogItems];

    if (v33)
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E4F29FB0];
      v20 = v39;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
        -[HKOverlayRoomAFibBurdenViewController _aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:](v34);
      }
    }
    else
    {
      v35 = os_log_create("com.apple.Health.AFibBurden", "default");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[HKOverlayRoomAFibBurdenViewController _aFibBurdenSeriesForTimeScope:displayType:mode:applicationItems:](v35);
      }

      v20 = v39;
    }
  }

  return v41;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (id)_contextItemOrder
{
  return &unk_1F3C1F108;
}

- (id)_overlayContextForOverlayContextItem:(unint64_t)a3 sleepDataSourceProvider:(id)a4 sleepChartFormatter:(id)a5 overlayChartController:(id)a6 applicationItems:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke;
  aBlock[3] = &unk_1E6D51250;
  aBlock[4] = self;
  id v14 = v12;
  id v32 = v14;
  id v15 = v13;
  id v33 = v15;
  id v16 = (void (**)(void *, void *))_Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke_2;
  v26[3] = &unk_1E6D51278;
  id v17 = v15;
  id v27 = v17;
  id v18 = v14;
  id v28 = v18;
  id v19 = v11;
  id v29 = v19;
  id v30 = self;
  v20 = _Block_copy(v26);
  v21 = v20;
  switch(a3)
  {
    case 0uLL:
      a3 = (*((void (**)(void *))v20 + 2))(v20);
      break;
    case 1uLL:
      v22 = (void *)MEMORY[0x1E4F2B448];
      uint64_t v23 = 251;
      goto LABEL_7;
    case 2uLL:
      v22 = (void *)MEMORY[0x1E4F2B448];
      uint64_t v23 = 75;
      goto LABEL_7;
    case 3uLL:
      v22 = (void *)MEMORY[0x1E4F2B448];
      uint64_t v23 = 99;
      goto LABEL_7;
    case 4uLL:
      v22 = (void *)MEMORY[0x1E4F2B448];
      uint64_t v23 = 3;
LABEL_7:
      v24 = [v22 dataTypeWithCode:v23];
      a3 = v16[2](v16, v24);

      break;
    default:
      break;
  }

  return (id)a3;
}

HKOverlayRoomStackedContext *__162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  LOBYTE(v6) = 0;
  v4 = [[HKOverlayRoomStackedContext alloc] initWithDisplayType:*(void *)(a1[4] + 1336) overlayDisplayType:0 stackedSampleType:v3 overlayChartController:a1[5] currentCalendarOverride:*(void *)(a1[4] + 1384) applicationItems:a1[6] isInfoButtonHidden:v6];

  return v4;
}

HKOverlayRoomSleepDurationStackedContext *__162__HKOverlayRoomAFibBurdenViewController__overlayContextForOverlayContextItem_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke_2(void *a1)
{
  LOBYTE(v3) = 0;
  v1 = [[HKOverlayRoomSleepDurationStackedContext alloc] initWithApplicationItems:a1[4] overlayChartController:a1[5] sleepChartFormatter:a1[6] primaryDisplayType:*(void *)(a1[7] + 1336) uniqueIdentifier:@"AFibBurden" firstWeekdayOverride:&unk_1F3C20218 currentCalendarOverride:*(void *)(a1[7] + 1384) isInfoButtonHidden:v3];
  return v1;
}

- (id)_displayTypeForOverlayContextItem:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = [(HKOverlayRoomViewController *)self applicationItems];
      v5 = [v4 healthStore];
      uint64_t v6 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];
      id v7 = v6;
      v8 = &unk_1F3C20230;
      goto LABEL_7;
    case 1uLL:
      v4 = [(HKOverlayRoomViewController *)self applicationItems];
      v5 = [v4 healthStore];
      uint64_t v6 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];
      id v7 = v6;
      v8 = &unk_1F3C20248;
      goto LABEL_7;
    case 2uLL:
      v4 = [(HKOverlayRoomViewController *)self applicationItems];
      v5 = [v4 healthStore];
      uint64_t v6 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];
      id v7 = v6;
      v8 = &unk_1F3C20260;
      goto LABEL_7;
    case 3uLL:
      v4 = [(HKOverlayRoomViewController *)self applicationItems];
      v5 = [v4 healthStore];
      uint64_t v6 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];
      id v7 = v6;
      v8 = &unk_1F3C20278;
      goto LABEL_7;
    case 4uLL:
      v4 = [(HKOverlayRoomViewController *)self applicationItems];
      v5 = [v4 healthStore];
      uint64_t v6 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];
      id v7 = v6;
      v8 = &unk_1F3C20188;
LABEL_7:
      uint64_t v3 = [v6 displayTypeWithIdentifier:v8];

      break;
    default:
      break;
  }
  return v3;
}

- (id)_generateOverlayContextsWithPrimaryDisplayType:(id)a3 sleepDataSourceProvider:(id)a4 sleepChartFormatter:(id)a5 overlayChartController:(id)a6 applicationItems:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(HKOverlayRoomAFibBurdenViewController *)self _contextItemOrder];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __172__HKOverlayRoomAFibBurdenViewController__generateOverlayContextsWithPrimaryDisplayType_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke;
  v22[3] = &unk_1E6D512A0;
  v22[4] = self;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  v20 = objc_msgSend(v15, "hk_map:", v22);

  return v20;
}

uint64_t __172__HKOverlayRoomAFibBurdenViewController__generateOverlayContextsWithPrimaryDisplayType_sleepDataSourceProvider_sleepChartFormatter_overlayChartController_applicationItems___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = (int)[a2 intValue];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  return [v3 _overlayContextForOverlayContextItem:v4 sleepDataSourceProvider:v5 sleepChartFormatter:v6 overlayChartController:v7 applicationItems:v8];
}

- (id)_lifeFactorViewControllerForKey:(id)a3 logButtonAction:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  id v23 = [v5 stringWithFormat:@"%@%@", v7, @"_AND_AFIB_TITLE"];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v21 = objc_msgSend(v8, "localizedStringForKey:value:table:", v23, &stru_1F3B9CF20);

  v22 = [NSString stringWithFormat:@"%@%@", v7, @"_AND_AFIB_BODY"];
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v10 = [v9 localizedStringForKey:v22 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];

  id v11 = [NSString stringWithFormat:@"%@%@", v7, @"_AND_AFIB_LOGGING"];

  id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v12 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];

  id v14 = [[HKInfographicTitleDetailOptionalButtonItem alloc] initWithTitle:v21 detail:v10 buttonTextString:v13 buttonAction:v6];
  id v15 = [HKInfographicViewController alloc];
  v24[0] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v17 = [(HKInfographicViewController *)v15 initWithItems:v16];

  id v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v19 = [v18 localizedStringForKey:@"LIFE_FACTOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];
  [(HKInfographicViewController *)v17 setTitle:v19];

  return v17;
}

- (id)_infographicViewControllerForDisplayType:(id)a3 secondaryDisplayType:(id)a4 addDataViewControllerProvider:(id)a5 healthStore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke;
  v35 = &unk_1E6D512F0;
  id v14 = v13;
  id v36 = v14;
  id v15 = v11;
  id v37 = v15;
  id v16 = v12;
  id v38 = v16;
  v39 = &v40;
  id v17 = _Block_copy(&v32);
  if (objc_msgSend(v10, "displayTypeIdentifier", v32, v33, v34, v35) == 248)
  {
    if ([v15 displayTypeIdentifier] == 63)
    {
      id v18 = [(HKOverlayRoomAFibBurdenViewController *)self _lifeFactorViewControllerForKey:@"SLEEP" logButtonAction:v17];
    }
    else
    {
      id v18 = 0;
    }
    if ([v15 displayTypeIdentifier] == 251)
    {
      uint64_t v19 = [(HKOverlayRoomAFibBurdenViewController *)self _lifeFactorViewControllerForKey:@"ALCOHOL" logButtonAction:v17];

      id v18 = (void *)v19;
    }
    if ([v15 displayTypeIdentifier] == 75)
    {
      uint64_t v20 = [(HKOverlayRoomAFibBurdenViewController *)self _lifeFactorViewControllerForKey:@"EXERCISE" logButtonAction:0];

      id v18 = (void *)v20;
    }
    if ([v15 displayTypeIdentifier] == 99)
    {
      uint64_t v21 = [(HKOverlayRoomAFibBurdenViewController *)self _lifeFactorViewControllerForKey:@"MINDFUL_SESSION" logButtonAction:v17];

      id v18 = (void *)v21;
    }
    if ([v15 displayTypeIdentifier] == 3)
    {
      uint64_t v22 = [(HKOverlayRoomAFibBurdenViewController *)self _lifeFactorViewControllerForKey:@"BODY_MASS" logButtonAction:v17];

      id v18 = (void *)v22;
    }
    if (v18)
    {
      id v23 = [[HKModalNavigationController alloc] initWithRootViewController:v18];
      id v24 = (void *)v41[5];
      v41[5] = (uint64_t)v23;

      id v25 = objc_alloc(MEMORY[0x1E4FB14A8]);
      id v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v27 = [v26 localizedStringForKey:@"LIFE_FACTORS_CANCEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v28 = (void *)[v25 initWithTitle:v27 style:2 target:self action:sel_dismissWithAnimation_];
      id v29 = [(id)v41[5] navigationItem];
      [v29 setRightBarButtonItem:v28];

      id v30 = (id)v41[5];
      goto LABEL_17;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v30 = 0;
LABEL_17:

  _Block_object_dispose(&v40, 8);
  return v30;
}

void __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke(uint64_t a1)
{
  objc_super v2 = HKLogAFibBurden();
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F2ABE8]) initWithLoggingCategory:v2 healthDataSource:*(void *)(a1 + 32)];
  uint64_t v4 = [HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent alloc];
  uint64_t v5 = [*(id *)(a1 + 40) sampleType];
  id v6 = [(HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *)v4 initWithSampleType:v5 context:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2;
  v11[3] = &unk_1E6D512C8;
  id v12 = v2;
  id v7 = v2;
  [v3 submitEvent:v6 completion:v11];
  id v8 = objc_alloc(MEMORY[0x1E4FB19E8]);
  v9 = [*(id *)(a1 + 48) addDataViewControllerForDisplayType:*(void *)(a1 + 40)];
  id v10 = (void *)[v8 initWithRootViewController:v9];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "hk_presentModalCardViewController:fullScreen:animated:completion:", v10, 0, 1, 0);
}

void __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    uint64_t v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2_cold_1((uint64_t)v4, v5);
    }
  }
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  uint64_t v3 = HKHealthKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"ATRIAL_FIBRILLATION_BURDEN" value:&stru_1F3B9CF20 table:@"Localizable-AFibBurden"];

  return v4;
}

- (id)showAllFiltersButtonTitle
{
  objc_super v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v3 = [v2 localizedStringForKey:@"SHOW_LIFE_FACTORS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];

  return v3;
}

- (BOOL)supportsShowAllFilters
{
  if (![(HKOverlayRoomViewController *)self controllerMode]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomAFibBurdenViewController;
  return [(HKOverlayRoomViewController *)&v4 supportsShowAllFilters];
}

- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    id v8 = [(id)v6 analyticsIdentifier];
    v9 = [(id)v7 analyticsIdentifier];
    char v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      analyticsSubmissionQueue = self->_analyticsSubmissionQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__HKOverlayRoomAFibBurdenViewController_didChangeFromContextItem_toContextItem___block_invoke;
      block[3] = &unk_1E6D51318;
      id v13 = (id)v6;
      id v14 = (id)v7;
      id v15 = self;
      dispatch_async(analyticsSubmissionQueue, block);
    }
  }
}

void __80__HKOverlayRoomAFibBurdenViewController_didChangeFromContextItem_toContextItem___block_invoke(void *a1)
{
  objc_super v4 = [[HKChartOverlaySelectedAnalyticsEventConfiguration alloc] initWithEventName:@"com.apple.health.burden.chart.overlay.selected" previousContextItemPropertyName:@"previousLifeFactor" currentContextItemPropertyName:@"currentLifeFactor"];
  [(HKChartOverlaySelectedAnalyticsEventConfiguration *)v4 setFeatureIdentifier:*MEMORY[0x1E4F29D10]];
  objc_super v2 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BC88]];
  [(HKChartOverlaySelectedAnalyticsEventConfiguration *)v4 setMinimumAge:v2];

  uint64_t v3 = [[HKChartOverlaySelectedAnalyticsEvent alloc] initWithConfiguration:v4 previousItem:a1[4] currentItem:a1[5]];
  [*(id *)(a1[6] + 1400) submitEvent:v3 error:0];
}

- (id)createChartOverlayViewController
{
  uint64_t v3 = [(HKInteractiveChartDisplayType *)self->_afibBurdenDisplayType baseDisplayType];
  uint64_t v4 = objc_msgSend(v3, "hk_interactiveChartOptions");

  if ([(HKOverlayRoomViewController *)self controllerMode] == 3) {
    uint64_t v5 = v4 | 0x2020;
  }
  else {
    uint64_t v5 = v4;
  }
  unint64_t v20 = v5 | [(HKOverlayRoomViewController *)self additionalChartOptions];
  uint64_t v19 = [HKInteractiveChartOverlayViewController alloc];
  id v23 = [(HKOverlayRoomViewController *)self applicationItems];
  id v24 = [v23 healthStore];
  id v17 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  uint64_t v22 = [(HKOverlayRoomViewController *)self applicationItems];
  unint64_t v6 = [v22 unitController];
  uint64_t v21 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v7 = [v21 dateCache];
  id v18 = [(HKOverlayRoomViewController *)self applicationItems];
  id v8 = [v18 chartDataCacheController];
  v9 = [(HKOverlayRoomViewController *)self applicationItems];
  char v10 = [v9 timeScopeController];
  id v11 = [(HKOverlayRoomViewController *)self applicationItems];
  id v12 = [v11 sampleDateRangeController];
  id v13 = [(HKOverlayRoomViewController *)self displayDate];
  id v14 = (void *)v7;
  id v15 = [(HKInteractiveChartOverlayViewController *)v19 initWithHealthStore:v24 primaryDisplayType:v17 unitPreferenceController:v6 dateCache:v7 chartDataCacheController:v8 selectedTimeScopeController:v10 sampleTypeDateRangeController:v12 initialXValue:v13 currentCalendarOverride:self->_currentCalendar options:v20];

  [(HKInteractiveChartViewController *)v15 setCurrentValueViewDataSourceDelegate:self];
  return v15;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  char v10 = [(HKOverlayRoomAFibBurdenViewController *)self afibBurdenDisplayType];
  id v11 = [(HKOverlayRoomAFibBurdenViewController *)self sleepDataSourceProvider];
  id v12 = [(HKOverlayRoomAFibBurdenViewController *)self sleepChartFormatter];
  id v13 = [(HKOverlayRoomAFibBurdenViewController *)self _generateOverlayContextsWithPrimaryDisplayType:v10 sleepDataSourceProvider:v11 sleepChartFormatter:v12 overlayChartController:v8 applicationItems:v9];

  id v14 = [(HKOverlayRoomViewController *)self buildFactorContextsAllowingDeselection:0];
  if (v14)
  {
    uint64_t v15 = [(HKOverlayRoomViewController *)self combineFactors:v14 standardFactors:v13];

    id v13 = (void *)v15;
  }
  id v16 = [HKOverlayContextSection alloc];
  id v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v18 = [v17 localizedStringForKey:@"LIFE_FACTORS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];
  uint64_t v19 = [(HKOverlayContextSection *)v16 initWithSectionTitle:v18 overlayContextItems:v13];

  if (a3 == 3)
  {
    unint64_t v20 = [NSNumber numberWithUnsignedInt:0];
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = v20;

    uint64_t v22 = [HKOverlayContextSectionContainer alloc];
    id v28 = v19;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    id v24 = [(HKOverlayContextSectionContainer *)v22 initWithContainerTitle:0 overlayContextSections:v23];
    v29[0] = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  }
  else
  {
    id v26 = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = 0;

    id v25 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  char v10 = v9;
  if (a3 == 3)
  {
    id v11 = [v9 timeScopeController];
    [v11 setSelectedTimeScope:3];
  }
  id v12 = [HKOverlayRoomAFibBurdenViewController alloc];
  id v13 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v14 = [(HKOverlayRoomAFibBurdenViewController *)v12 initWithDisplayDate:v8 applicationItems:v10 factorDisplayTypes:v13 mode:a3 sleepDataSourceProvider:self->_sleepDataSourceProvider sleepChartFormatter:self->_sleepChartFormatter preferredOverlay:self->_preferredOverlay addDataViewControllerProvider:self->_addDataViewControllerProvider];

  [(HKOverlayRoomViewController *)v14 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v14;
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  unint64_t v6 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v7 = [v6 healthStore];
  id v8 = +[HKDisplayTypeController sharedInstanceForHealthStore:v7];
  id v29 = [v8 displayTypeWithIdentifier:&unk_1F3C20290];

  id v9 = [(HKOverlayRoomAFibBurdenViewController *)self _contextItemOrder];
  char v10 = [(HKOverlayRoomViewController *)self buildFactorContextsAllowingDeselection:0];
  id v11 = [v10 activeFactorContexts];
  uint64_t v12 = [v11 count];

  uint64_t v13 = [v9 count];
  id v14 = [v10 inactiveFactorContexts];
  uint64_t v15 = [v14 count];

  int64_t v16 = a4 - v12;
  if (a4 >= v12)
  {
    uint64_t v19 = v13 + v12;
    BOOL v20 = __OFSUB__(a4, v13 + v12);
    int64_t v21 = a4 - (v13 + v12);
    if (v21 < 0 != v20)
    {
      uint64_t v22 = [v9 objectAtIndex:v16];
      id v18 = -[HKOverlayRoomAFibBurdenViewController _displayTypeForOverlayContextItem:](self, "_displayTypeForOverlayContextItem:", (int)[v22 intValue]);

      addDataViewControllerProvider = self->_addDataViewControllerProvider;
      id v24 = [(HKOverlayRoomViewController *)self applicationItems];
      id v25 = [v24 healthStore];
      id v26 = [(HKOverlayRoomAFibBurdenViewController *)self _infographicViewControllerForDisplayType:v29 secondaryDisplayType:v18 addDataViewControllerProvider:addDataViewControllerProvider healthStore:v25];
      goto LABEL_9;
    }
    if (v15 + v19 <= a4) {
      goto LABEL_11;
    }
    id v27 = objc_msgSend(v10, "inactiveFactorContexts", v16);
    id v18 = [v27 objectAtIndexedSubscript:v21];
  }
  else
  {
    id v17 = objc_msgSend(v10, "activeFactorContexts", v16);
    id v18 = [v17 objectAtIndexedSubscript:a4];
  }
  id v24 = [v18 stackedBaseDisplayType];
  id v25 = [(HKOverlayRoomViewController *)self applicationItems];
  id v28 = [v25 healthStore];
  id v26 = +[HKInteractiveChartInfographicFactory infographicViewControllerForDisplayType:v29 factorDisplayType:v24 healthStore:v28];

LABEL_9:
  if (v26)
  {
    [(UIViewController *)self hk_presentModalCardViewController:v26 fullScreen:0 animated:1 completion:0];
  }
LABEL_11:
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKOverlayRoomViewController *)self chartController];
  id v8 = [v7 stringForValueRange:v6 timeScope:a4];

  return v8;
}

- (void)processSelectedRangeData:(id)a3 displayType:(id)a4
{
  id v22 = a3;
  id v7 = a4;
  uint64_t v8 = [v22 statisticsType];
  id v9 = [v7 sampleType];

  uint64_t v10 = [v9 code];
  if (v10 <= 98)
  {
    if (v10 == 3)
    {
      if ([v22 statisticsType] != 3 && v8)
      {
        BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomAFibBurdenViewController.m" lineNumber:579 description:@"Body Mass Should always display average for the interval"];
      }
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v13 = v12;
      id v14 = @"BODY_MASS_LOLLIPOP_TITLE";
    }
    else
    {
      id v11 = v22;
      if (v10 == 63)
      {
        if ([v22 dataType] == 9)
        {
          uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v13 = v12;
          id v14 = @"SLEEP_INBED_LOLLIPOP_TITLE";
        }
        else
        {
          if ([v22 dataType] != 10)
          {
            uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKOverlayRoomAFibBurdenViewController.m", 613, @"Sleep should only contain InBed or Asleep data types. Unrecognized: %ld", objc_msgSend(v22, "dataType"));
            goto LABEL_32;
          }
          uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v13 = v12;
          id v14 = @"SLEEP_ASLEEP_LOLLIPOP_TITLE";
        }
      }
      else
      {
        if (v10 != 75) {
          goto LABEL_33;
        }
        if ([v22 statisticsType] != 8 && v8)
        {
          id v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomAFibBurdenViewController.m" lineNumber:593 description:@"Exercise Minutes Should always display daily average for the interval"];
        }
        uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v13 = v12;
        id v14 = @"EXERCISE_MINUTES_LOLLIPOP_TITLE";
      }
    }
LABEL_31:
    int64_t v16 = [v12 localizedStringForKey:v14 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];
    id v17 = [v16 localizedUppercaseString];
    [v22 setTitleOverride:v17];

LABEL_32:
    id v11 = v22;
    goto LABEL_33;
  }
  if (v10 == 99)
  {
    if ([v22 statisticsType] != 8 && v8)
    {
      int64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomAFibBurdenViewController.m" lineNumber:586 description:@"Mindful Minutes Should always display daily average for the interval"];
    }
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v13 = v12;
    id v14 = @"MINDFUL_MINUTES_LOLLIPOP_TITLE";
    goto LABEL_31;
  }
  id v11 = v22;
  if (v10 != 248)
  {
    if (v10 != 251) {
      goto LABEL_33;
    }
    if ([v22 statisticsType] != 8 && v8)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomAFibBurdenViewController.m" lineNumber:600 description:@"Alcohol Type Should always display daily average for the interval"];
    }
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v13 = v12;
    id v14 = @"ALCOHOL_LOLLIPOP_TITLE";
    goto LABEL_31;
  }
  BOOL v15 = [(HKOverlayRoomViewController *)self controllerMode] == 3;
  id v11 = v22;
  if (v15)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v13 = v12;
    id v14 = @"AFIB_BURDEN_LOLLIPOP_TITLE";
    goto LABEL_31;
  }
LABEL_33:
}

- (HKInteractiveChartDisplayType)afibBurdenDisplayType
{
  return self->_afibBurdenDisplayType;
}

- (NSNumber)preferredOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKSleepDataSourceProvider)sleepDataSourceProvider
{
  return self->_sleepDataSourceProvider;
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (HKAddDataViewControllerProvider)addDataViewControllerProvider
{
  return self->_addDataViewControllerProvider;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (OS_dispatch_queue)analyticsSubmissionQueue
{
  return self->_analyticsSubmissionQueue;
}

- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager
{
  return self->_analyticsEventSubmissionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_analyticsSubmissionQueue, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_addDataViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
  objc_storeStrong((id *)&self->_sleepDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
  objc_storeStrong((id *)&self->_afibBurdenDisplayType, 0);
}

- (void)_aFibBurdenSeriesForTimeScope:(os_log_t)log displayType:mode:applicationItems:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E0B26000, log, OS_LOG_TYPE_FAULT, "Numeric Axis missing from AFib Controller", v1, 2u);
}

void __145__HKOverlayRoomAFibBurdenViewController__infographicViewControllerForDisplayType_secondaryDisplayType_addDataViewControllerProvider_healthStore___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "[HKInteractiveChartInfographicFactory] Error sending life factor logging initiated analytics event: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end