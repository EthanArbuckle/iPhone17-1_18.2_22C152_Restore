@interface HKHealthChartFactory
- (BOOL)_factorDisplayType:(id)a3 availableForPrimaryDisplayType:(id)a4;
- (BOOL)_factorDisplayTypeHasData:(id)a3;
- (BOOL)turnOffInitialSelectionForTesting;
- (HKAddDataViewControllerProvider)addDataViewControllerProvider;
- (HKChartDataCacheController)chartDataCacheController;
- (HKDateCache)dateCache;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthChartFactory)init;
- (HKHealthChartFactory)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (HKInteractiveChartDataFormatter)sleepChartFormatter;
- (HKSampleTypeDateRangeController)sampleTypeDateRangeController;
- (HKSampleTypeUpdateController)sampleTypeUpdateController;
- (HKSelectedTimeScopeController)selectedTimeScopeController;
- (HKSleepDataSourceProvider)sleepDataSourceProvider;
- (HKUnitPreferenceController)unitPreferenceController;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache;
- (id)CHRRoomApplicationItems;
- (id)_buildApplicationItems;
- (id)_buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:(id)a3 apneaDisplayType:(id)a4 timeScopeRanges:(id)a5 initialTimeScope:(int64_t)a6 firstWeekday:(int64_t)a7 displayDate:(id)a8;
- (id)_buildStandardRemoteChartViewControllerWithDisplayType:(id)a3 timeScopeRanges:(id)a4 initialTimeScope:(int64_t)a5 firstWeekday:(int64_t)a6 displayDate:(id)a7;
- (id)_buildTrendRemoteOverlayChartViewControllerWithDisplayType:(id)a3 timeScopeRanges:(id)a4 initialTimeScope:(int64_t)a5 chartSummaryTrendModel:(id)a6 firstWeekday:(int64_t)a7 displayDate:(id)a8;
- (id)_cardioFitnessDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4;
- (id)_createSleepDisplayTypeForSeriesType:(int64_t)a3;
- (id)_defaultRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4;
- (id)_displayTypeForTypeIdentifier:(id)a3;
- (id)_factorDisplayTypesForPrimaryDisplayType:(id)a3;
- (id)_factorDisplayTypesForPrimaryTypeIdentifier:(id)a3;
- (id)_remoteCalendarOverrideForDisplayType:(id)a3;
- (id)_remoteChartDisplayTypeForTypeIdentifier:(id)a3;
- (id)_remoteCustomFormatterForDisplayType:(id)a3;
- (id)_remoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4;
- (id)_remoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4 audience:(id)a5;
- (id)_remoteDisplayTypeConfigurationFromDataSources:(id)a3 model:(id)a4 originalDisplayType:(id)a5;
- (id)_remoteDisplayTypeConfigurationFromDataSources:(id)a3 model:(id)a4 queryData:(id)a5 originalDisplayType:(id)a6;
- (id)_remoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5;
- (id)_remoteStatisticsIntervalForDisplayType:(id)a3 timeScope:(int64_t)a4;
- (id)_resolvedDisplayDateForDisplayType:(id)a3 displayDate:(id)a4 timeScope:(int64_t)a5 gregorianCalendar:(id)a6;
- (id)_sleepApneaGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5;
- (id)_sleepApneaRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4;
- (id)_sleepRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4 audience:(id)a5;
- (id)_sleepRemoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5;
- (id)_sleepingBreathingDisturbancesGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5;
- (id)_sourceTimeZoneFromModel:(id)a3;
- (id)_standardRemoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5;
- (id)activityChartForActivityMoveMode:(int64_t)a3 displayDate:(id)a4 activityOptions:(unint64_t)a5 chartSharableModel:(id)a6;
- (id)breathingDisturbancesRemoteInteractiveChartWithBreathingDisturbancesModel:(id)a3 sleepApneaEventModel:(id)a4 sleepApneaEventChartData:(id)a5 displayDate:(id)a6;
- (id)chartFactoryViewControllerProviderForType:(id)a3 standardProvider:(id)a4;
- (id)chartForTypeIdentifier:(id)a3 dateRange:(id)a4 minimumSize:(CGSize)a5;
- (id)chartForTypeIdentifier:(id)a3 dateRange:(id)a4 minimumSize:(CGSize)a5 disableXAxis:(BOOL)a6 currentCalendar:(id)a7;
- (id)createDisplayTypeForSleepDuration;
- (id)createDisplayTypeForSleepStages;
- (id)createInteractiveChartForSimpleDisplayType:(id)a3 chartOptions:(unint64_t)a4;
- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (id)interactiveChartForTypeIdentifier:(id)a3 preferredOverlay:(int64_t)a4 chartOptions:(unint64_t)a5 displayDateInterval:(id)a6 restorationUserActivity:(id)a7 chartSummaryTrendModel:(id)a8;
- (id)interactiveChartForTypeIdentifier:(id)a3 preferredOverlay:(int64_t)a4 displayDateInterval:(id)a5 restorationUserActivity:(id)a6 chartSummaryTrendModel:(id)a7;
- (id)remoteInteractiveChartForTypeIdentifier:(id)a3 model:(id)a4 chartSummaryTrendModel:(id)a5 displayDate:(id)a6;
- (id)standardChartDisplayTypeIdentifierForTypeIdentifier:(id)a3;
- (id)staticAudiogramChartViewControllerWithAudiogramSample:(id)a3 hideEnhancedUI:(BOOL)a4;
- (id)supportedTypeIdentifiers;
- (int64_t)_resolvedTimeScopeForTypeIdentifier:(id)a3 displayDateInterval:(id)a4;
- (int64_t)_sourceFirstWeekdayFromModel:(id)a3;
- (unint64_t)_additionalChartOptionsForDisplayDate:(id)a3 displayDateInterval:(id)a4 timeScope:(int64_t)a5;
- (void)_executeFetchOrSkipForTimeScopes:(id)a3 timeScope:(int64_t)a4 audience:(unint64_t)a5 displayType:(id)a6 remoteDateIntervals:(id)a7 dataSources:(id)a8 gregorianCalendar:(id)a9 completion:(id)a10;
- (void)_logFactorsForTypeIdentifier:(id)a3 factorDisplayTypes:(id)a4;
- (void)encodeActivityChartDataForActivityMoveMode:(int64_t)a3 completion:(id)a4;
- (void)encodeChartQueryDataForTypeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)encodeChartQueryDataForTypeIdentifier:(id)a3 forTimeScopes:(id)a4 timeScopeReferenceDate:(id)a5 audience:(unint64_t)a6 completionHandler:(id)a7;
- (void)registerInteractiveChartViewControllerProvider:(id)a3 typeIdentifier:(id)a4;
- (void)setAddDataViewControllerProvider:(id)a3;
- (void)setSleepChartFormatter:(id)a3;
- (void)setSleepDataSourceProvider:(id)a3;
- (void)setTurnOffInitialSelectionForTesting:(BOOL)a3;
- (void)updateChartSummaryTrendModel:(id)a3 viewController:(id)a4;
@end

@implementation HKHealthChartFactory

- (HKHealthChartFactory)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HKHealthChartFactory;
  v6 = [(HKHealthChartFactory *)&v37 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];
    displayTypeController = v7->_displayTypeController;
    v7->_displayTypeController = (HKDisplayTypeController *)v8;

    v10 = [v5 profileIdentifier];
    if ([v10 type] == 2)
    {
    }
    else
    {
      v11 = [v5 profileIdentifier];
      uint64_t v12 = [v11 type];

      if (v12 != 3)
      {
        v17 = [[HKUnitPreferenceController alloc] initWithHealthStore:v5];
        unitPreferenceController = v7->_unitPreferenceController;
        v7->_unitPreferenceController = v17;
        goto LABEL_7;
      }
    }
    v13 = [HKUnitPreferenceController alloc];
    unitPreferenceController = (HKUnitPreferenceController *)objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    uint64_t v15 = [(HKUnitPreferenceController *)v13 initWithHealthStore:unitPreferenceController];
    v16 = v7->_unitPreferenceController;
    v7->_unitPreferenceController = (HKUnitPreferenceController *)v15;

LABEL_7:
    v18 = [[HKSampleTypeUpdateController alloc] initWithHealthStore:v5];
    sampleTypeUpdateController = v7->_sampleTypeUpdateController;
    v7->_sampleTypeUpdateController = v18;

    v20 = [[HKChartDataCacheController alloc] initWithHealthStore:v5 unitController:v7->_unitPreferenceController updateController:v7->_sampleTypeUpdateController];
    chartDataCacheController = v7->_chartDataCacheController;
    v7->_chartDataCacheController = v20;

    v22 = [HKDateCache alloc];
    v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v24 = [(HKDateCache *)v22 initWithCalendar:v23];
    dateCache = v7->_dateCache;
    v7->_dateCache = (HKDateCache *)v24;

    v26 = objc_alloc_init(HKSelectedTimeScopeController);
    selectedTimeScopeController = v7->_selectedTimeScopeController;
    v7->_selectedTimeScopeController = v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F2B980]) initWithHealthStore:v5];
    wheelchairUseCharacteristicCache = v7->_wheelchairUseCharacteristicCache;
    v7->_wheelchairUseCharacteristicCache = (_HKWheelchairUseCharacteristicCache *)v28;

    v30 = [[HKSampleTypeDateRangeController alloc] initWithHealthStore:v5];
    sampleTypeDateRangeController = v7->_sampleTypeDateRangeController;
    v7->_sampleTypeDateRangeController = v30;

    sleepDataSourceProvider = v7->_sleepDataSourceProvider;
    v7->_sleepDataSourceProvider = 0;

    sleepChartFormatter = v7->_sleepChartFormatter;
    v7->_sleepChartFormatter = 0;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customViewControllerProvidersByTypeIdentifier = v7->_customViewControllerProvidersByTypeIdentifier;
    v7->_customViewControllerProvidersByTypeIdentifier = v34;

    v7->_turnOffInitialSelectionForTesting = 0;
  }

  return v7;
}

- (HKHealthChartFactory)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)chartForTypeIdentifier:(id)a3 dateRange:(id)a4 minimumSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v9 = (void *)MEMORY[0x1E4F1C9A8];
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v9 currentCalendar];
  v13 = -[HKHealthChartFactory chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:](self, "chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:", v11, v10, 0, v12, width, height);

  return v13;
}

- (id)chartForTypeIdentifier:(id)a3 dateRange:(id)a4 minimumSize:(CGSize)a5 disableXAxis:(BOOL)a6 currentCalendar:(id)a7
{
  BOOL v8 = a6;
  double height = a5.height;
  double width = a5.width;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [(HKHealthChartFactory *)self standardChartDisplayTypeIdentifierForTypeIdentifier:a3];
  if (v15)
  {
    v16 = [(HKHealthChartFactory *)self displayTypeController];
    v17 = [v16 displayTypeWithIdentifier:v15];

    if (v17)
    {
      BOOL v32 = v8;
      uint64_t v18 = [v14 firstWeekday];
      id v33 = [MEMORY[0x1E4F1C9C8] date];
      if (v13)
      {
        v19 = [v13 startDate];
        v20 = [v13 endDate];
        v21 = HKUIMidDate(v19, v20);

        int64_t v22 = +[HKGraphZoomLevelConfiguration timeScopeForDateRange:v13];
        uint64_t v23 = 1;
      }
      else
      {
        int64_t v22 = 6;
        uint64_t v23 = 3;
        v21 = v33;
      }
      v25 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:v22 anchorDate:v21 alignment:v23 dataRange:0 calendar:v14 firstWeekday:v18 cadence:0 level:0];
      v26 = +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", [v17 categoryIdentifier]);
      v27 = [(HKHealthChartFactory *)self unitPreferenceController];
      uint64_t v28 = [(HKHealthChartFactory *)self chartDataCacheController];
      v29 = objc_msgSend(v17, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", v22, v26, v27, v28);

      uint64_t v24 = [[_HKStaticDateGraphViewController alloc] initWithFixedRange:v25 currentCalendar:v14];
      -[HKDateGraphViewController setMinimumSize:](v24, "setMinimumSize:", width, height);
      v34[0] = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      [(_HKStaticDateGraphViewController *)v24 addStackedSeries:v30];

      [(HKDateGraphViewController *)v24 setDisableXAxis:v32];
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)interactiveChartForTypeIdentifier:(id)a3 preferredOverlay:(int64_t)a4 displayDateInterval:(id)a5 restorationUserActivity:(id)a6 chartSummaryTrendModel:(id)a7
{
  return [(HKHealthChartFactory *)self interactiveChartForTypeIdentifier:a3 preferredOverlay:a4 chartOptions:0 displayDateInterval:a5 restorationUserActivity:a6 chartSummaryTrendModel:a7];
}

- (id)interactiveChartForTypeIdentifier:(id)a3 preferredOverlay:(int64_t)a4 chartOptions:(unint64_t)a5 displayDateInterval:(id)a6 restorationUserActivity:(id)a7 chartSummaryTrendModel:(id)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v33 = a8;
  uint64_t v15 = [v13 endDate];
  int64_t v16 = [(HKHealthChartFactory *)self _resolvedTimeScopeForTypeIdentifier:v12 displayDateInterval:v13];
  v17 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  [v17 setSelectedTimeScope:v16];

  uint64_t v18 = [(HKHealthChartFactory *)self _buildApplicationItems];
  v19 = [v14 userInfo];
  v20 = [v19 objectForKeyedSubscript:@"HKOverlayRoomViewControllerRestorationModeKey"];
  v34 = (void *)v15;
  if (v20) {
    v21 = 0;
  }
  else {
    v21 = (void *)v15;
  }
  id v22 = v21;

  uint64_t v23 = [(NSMutableDictionary *)self->_customViewControllerProvidersByTypeIdentifier objectForKeyedSubscript:v12];
  if (!v23)
  {
    uint64_t v23 = [(HKHealthChartFactory *)self chartFactoryViewControllerProviderForType:v12 standardProvider:self];
  }
  BOOL v24 = [(HKHealthChartFactory *)self turnOffInitialSelectionForTesting];
  if (v24) {
    unint64_t v25 = a5 | 0x2000;
  }
  else {
    unint64_t v25 = a5;
  }
  if (v24 && a4 == 11) {
    int64_t v26 = 0;
  }
  else {
    int64_t v26 = a4;
  }
  unint64_t v27 = v25 | [(HKHealthChartFactory *)self _additionalChartOptionsForDisplayDate:v22 displayDateInterval:v13 timeScope:v16];
  uint64_t v28 = [(HKHealthChartFactory *)self _factorDisplayTypesForPrimaryTypeIdentifier:v12];
  [(HKHealthChartFactory *)self _logFactorsForTypeIdentifier:v12 factorDisplayTypes:v28];
  v29 = [v23 createInteractiveChartViewControllerForTypeIdentifier:v12 chartFactory:self applicationItems:v18 displayDate:v22 preferredOverlay:v26 restorationUserActivity:v14 trendModel:v33 factorDisplayTypes:v28 additionalChartOptions:v27];

  return v29;
}

- (void)_logFactorsForTypeIdentifier:(id)a3 factorDisplayTypes:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(a4, "hk_map:", &__block_literal_global_2);
  v7 = [v6 componentsJoinedByString:@", "];
  _HKInitializeLogging();
  BOOL v8 = *MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_INFO, "Factors for %@: [%@]", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t __72__HKHealthChartFactory__logFactorsForTypeIdentifier_factorDisplayTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayTypeIdentifierString];
}

- (unint64_t)_additionalChartOptionsForDisplayDate:(id)a3 displayDateInterval:(id)a4 timeScope:(int64_t)a5
{
  unint64_t v5 = 0;
  if (a3 && a5 == 4)
  {
    v7 = (void *)MEMORY[0x1E4F1C9A8];
    id v8 = a4;
    id v9 = a3;
    id v10 = objc_msgSend(v7, "hk_gregorianCalendarWithLocalTimeZone");
    [v10 rangeOfUnit:16 inUnit:8 forDate:v9];
    uint64_t v12 = v11;
    uint64_t v13 = objc_msgSend(v10, "hk_startOfMonthForDate:", v9);

    id v14 = [v8 startDate];
    uint64_t v15 = [v10 components:30 fromDate:v14];

    int64_t v16 = [v8 endDate];

    v17 = [v10 components:30 fromDate:v16];

    uint64_t v18 = [v10 components:30 fromDate:v13];
    v19 = (void *)[v18 copy];
    [v19 setDay:v12];
    if ([v15 isEqual:v18])
    {
      if ([v17 isEqual:v19]) {
        unint64_t v5 = 0x100000;
      }
      else {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)_remoteChartDisplayTypeForTypeIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HKHealthChartFactory *)self standardChartDisplayTypeIdentifierForTypeIdentifier:v4];
  if (v5)
  {
    v6 = [(HKHealthChartFactory *)self displayTypeController];
    uint64_t v7 = [v6 displayTypeWithIdentifier:v5];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_INFO, "Falling back to default chart for %@", (uint8_t *)&v12, 0xCu);
    }
    displayTypeController = self->_displayTypeController;
    v6 = [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:v4];
    uint64_t v7 = [(HKDisplayTypeController *)displayTypeController displayTypeForObjectType:v6];
  }
  id v10 = (void *)v7;

  return v10;
}

- (id)_remoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  return [(HKHealthChartFactory *)self _remoteDataSourcesForDisplayType:a3 forTimeScopes:a4 audience:0];
}

- (id)_remoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4 audience:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 displayTypeIdentifier];
  if (v11 == 276)
  {
    uint64_t v12 = [(HKHealthChartFactory *)self _sleepApneaRemoteDataSourcesForDisplayType:v8 forTimeScopes:v9];
  }
  else if (v11 == 124)
  {
    uint64_t v12 = [(HKHealthChartFactory *)self _cardioFitnessDataSourcesForDisplayType:v8 forTimeScopes:v9];
  }
  else
  {
    if (v11 == 63) {
      [(HKHealthChartFactory *)self _sleepRemoteDataSourcesForDisplayType:v8 forTimeScopes:v9 audience:v10];
    }
    else {
    uint64_t v12 = [(HKHealthChartFactory *)self _defaultRemoteDataSourcesForDisplayType:v8 forTimeScopes:v9];
    }
  }
  id v13 = (void *)v12;

  return v13;
}

- (id)_sleepRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4 audience:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HKHealthChartFactory *)self sleepDataSourceProvider];

  if (!v11)
  {
    id v16 = [[_HKRemoteDataSources alloc] initSupportsChartQueryDataGeneration:0];
    goto LABEL_22;
  }
  id v27 = v8;
  if (!v10 || (uint64_t v12 = [v10 integerValue], v12 == 1))
  {
    id v13 = [(HKHealthChartFactory *)self sleepDataSourceProvider];
    uint64_t v14 = [(HKHealthChartFactory *)self healthStore];
    uint64_t v15 = [v13 makeSleepDataSourceFromHealthStore:v14 representativeDisplayType:v8];
  }
  else
  {
    if (v12)
    {
      v17 = 0;
      goto LABEL_10;
    }
    id v13 = [(HKHealthChartFactory *)self sleepDataSourceProvider];
    uint64_t v14 = [(HKHealthChartFactory *)self healthStore];
    uint64_t v15 = [v13 makeSleepStagesDataSourceFromHealthStore:v14 representativeDisplayType:v8];
  }
  v17 = (void *)v15;

LABEL_10:
  id v16 = [[_HKRemoteDataSources alloc] initSupportsChartQueryDataGeneration:1];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = v9;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    id v22 = (os_log_t *)MEMORY[0x1E4F29FB0];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v24, "integerValue", v26) > 7)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR)) {
            -[HKHealthChartFactory _sleepRemoteDataSourcesForDisplayType:forTimeScopes:audience:](&v28, v29);
          }
        }
        else
        {
          objc_msgSend(v16, "setDataSource:forTimeScope:", v17, objc_msgSend(v24, "integerValue"));
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }

  id v9 = v26;
  id v8 = v27;
LABEL_22:

  return v16;
}

- (id)_cardioFitnessDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [HKRemoteCardioFitnessDataSource alloc];
  id v9 = [(HKHealthChartFactory *)self unitPreferenceController];
  id v10 = [(HKHealthChartFactory *)self healthStore];
  uint64_t v11 = [(HKRemoteCardioFitnessDataSource *)v8 initWithUnitController:v9 displayType:v6 healthStore:v10];

  id v12 = [[_HKRemoteDataSources alloc] initSupportsChartQueryDataGeneration:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    v17 = (os_log_t *)MEMORY[0x1E4F29FB0];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v19 integerValue] > 7)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR)) {
            -[HKHealthChartFactory _cardioFitnessDataSourcesForDisplayType:forTimeScopes:](&v21, v22);
          }
        }
        else
        {
          objc_msgSend(v12, "setDataSource:forTimeScope:", v11, objc_msgSend(v19, "integerValue"));
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)_sleepApneaRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [HKRemoteNotificationLevelCategoryDataSource alloc];
  id v9 = [(HKHealthChartFactory *)self healthStore];
  id v10 = [(HKRemoteNotificationLevelCategoryDataSource *)v8 initWithDisplayType:v6 healthStore:v9];

  id v11 = [[_HKRemoteDataSources alloc] initSupportsChartQueryDataGeneration:1];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    uint64_t v16 = (os_log_t *)MEMORY[0x1E4F29FB0];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v18 integerValue] > 7)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
            -[HKHealthChartFactory _sleepApneaRemoteDataSourcesForDisplayType:forTimeScopes:](&v20, v21);
          }
        }
        else
        {
          objc_msgSend(v11, "setDataSource:forTimeScope:", v10, objc_msgSend(v18, "integerValue"));
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)_defaultRemoteDataSourcesForDisplayType:(id)a3 forTimeScopes:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(_HKRemoteDataSources);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    char v21 = &v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v13, "integerValue", v21) > 7)
        {
          _HKInitializeLogging();
          id v18 = (void *)*MEMORY[0x1E4F29FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
            [(HKHealthChartFactory *)v27 _defaultRemoteDataSourcesForDisplayType:v22 forTimeScopes:v21];
          }
        }
        else
        {
          uint64_t v14 = [v13 integerValue];
          uint64_t v15 = [(HKHealthChartFactory *)self healthStore];
          uint64_t v16 = [(HKHealthChartFactory *)self unitPreferenceController];
          v17 = objc_msgSend(v22, "hk_healthQueryChartCacheDataSourceForTimeScope:healthStore:unitController:", v14, v15, v16);

          -[_HKRemoteDataSources setDataSource:forTimeScope:](v7, "setDataSource:forTimeScope:", v17, [v13 integerValue]);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v19 = [(_HKRemoteDataSources *)v7 allDataSources];
  if ([v19 count]) {
    -[_HKRemoteDataSources setSupportsChartQueryDataGeneration:](v7, "setSupportsChartQueryDataGeneration:", objc_msgSend(v19, "hk_allObjectsPassTest:", &__block_literal_global_306));
  }

  return v7;
}

uint64_t __78__HKHealthChartFactory__defaultRemoteDataSourcesForDisplayType_forTimeScopes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsChartQueryDataGeneration];
}

- (id)_remoteStatisticsIntervalForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 chartingRules];
  id v7 = [v6 remoteChartConfiguration];

  if (!v7) {
    goto LABEL_10;
  }
  id v8 = [v5 chartingRules];
  uint64_t v9 = [v8 remoteChartConfiguration];
  uint64_t v10 = [v9 statisticIntervalComponentsForTimeScope:a4];

  if (!v10)
  {
LABEL_10:
    uint64_t v10 = objc_msgSend(v5, "hk_customSeriesPointIntervalComponentsForTimeScope:resolution:", a4, 0);
    if (!v10)
    {
      uint64_t v11 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a4];
      uint64_t v10 = [v11 seriesPointIntervalComponentsAtResolution:0];
    }
  }

  return v10;
}

- (void)encodeChartQueryDataForTypeIdentifier:(id)a3 forTimeScopes:(id)a4 timeScopeReferenceDate:(id)a5 audience:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [v13 allObjects];
  v17 = objc_msgSend(v16, "hk_map:", &__block_literal_global_309);
  uint64_t v35 = [v17 componentsJoinedByString:@", "];

  _HKInitializeLogging();
  id v18 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = v18;
    char v20 = HKStringForChartDataSourceQueryRequestAudience(a6);
    *(_DWORD *)buf = 138412802;
    v48 = v20;
    __int16 v49 = 2112;
    id v50 = v12;
    __int16 v51 = 2112;
    v52 = v35;
    _os_log_impl(&dword_1E0B26000, v19, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: Starting query for timeScopes: %@", buf, 0x20u);
  }
  char v21 = [(HKHealthChartFactory *)self _remoteChartDisplayTypeForTypeIdentifier:v12];
  if (v21)
  {
    id v22 = [NSNumber numberWithUnsignedInteger:a6];
    [(HKHealthChartFactory *)self _remoteDataSourcesForDisplayType:v21 forTimeScopes:v13 audience:v22];
    long long v24 = v23 = self;

    long long v25 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    long long v26 = [[HKRemoteDateIntervals alloc] initWithDisplayType:v21 fromEndDate:v14];
    v34 = v26;
    if ([v24 supportsChartQueryDataGeneration])
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_317;
      v36[3] = &unk_1E6D51118;
      unint64_t v46 = a6;
      id v37 = v12;
      v38 = v23;
      id v39 = v13;
      id v40 = v21;
      v41 = v26;
      id v42 = v24;
      id v43 = v25;
      id v44 = v35;
      id v45 = v15;
      [(HKHealthChartFactory *)v23 _executeFetchOrSkipForTimeScopes:v39 timeScope:6 audience:a6 displayType:v40 remoteDateIntervals:v41 dataSources:v42 gregorianCalendar:v43 completion:v36];

      uint64_t v27 = v37;
    }
    else
    {
      unint64_t v33 = a6;
      uint64_t v27 = [NSString stringWithFormat:@"Type %@ does not support chart query data generation", v12];
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
      {
        long long v31 = v29;
        long long v32 = HKStringForChartDataSourceQueryRequestAudience(v33);
        *(_DWORD *)buf = 138412802;
        v48 = v32;
        __int16 v49 = 2112;
        id v50 = v12;
        __int16 v51 = 2112;
        v52 = v27;
        _os_log_error_impl(&dword_1E0B26000, v31, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: %@", buf, 0x20u);
      }
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, v27);
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v30);
    }
    int v28 = v25;
  }
  else
  {
    long long v24 = [NSString stringWithFormat:@"Type %@ does not have a valid display type.", v12];
    int v28 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, v24);
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v28);
  }
}

id __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (int)[a2 intValue];
  return HKStringForHKTimeScope(v2, 0);
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_317(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_alloc_init(HKCodableChartSharableModel);
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_317_cold_1();
    }
  }
  id v22 = v9;
  if (v7 && v8)
  {
    uint64_t v11 = objc_msgSend(v7, "hk_codableDateInterval");
    [(HKCodableChartSharableModel *)v10 setDayDateInterval:v11];

    [(HKCodableChartSharableModel *)v10 setDayData:v8];
  }
  id v13 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  char v21 = v8;
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 80);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_319;
  v23[3] = &unk_1E6D510F0;
  uint64_t v34 = v14;
  id v24 = *(id *)(a1 + 32);
  long long v25 = v10;
  uint64_t v19 = *(void **)(a1 + 48);
  uint64_t v26 = *(void *)(a1 + 40);
  id v27 = v19;
  id v28 = *(id *)(a1 + 56);
  id v29 = *(id *)(a1 + 64);
  id v30 = *(id *)(a1 + 72);
  id v31 = *(id *)(a1 + 80);
  id v32 = *(id *)(a1 + 88);
  id v33 = *(id *)(a1 + 96);
  char v20 = v10;
  [v13 _executeFetchOrSkipForTimeScopes:v12 timeScope:5 audience:v14 displayType:v15 remoteDateIntervals:v16 dataSources:v18 gregorianCalendar:v17 completion:v23];
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_319(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_319_cold_1();
    }
  }
  char v21 = v9;
  if (v7 && v8)
  {
    uint64_t v10 = objc_msgSend(v7, "hk_codableDateInterval");
    [*(id *)(a1 + 40) setWeekDateInterval:v10];

    [*(id *)(a1 + 40) setWeekData:v8];
  }
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 88);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_320;
  v22[3] = &unk_1E6D510F0;
  uint64_t v33 = v13;
  id v23 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  char v20 = *(void **)(a1 + 56);
  id v24 = v18;
  uint64_t v25 = v19;
  id v26 = v20;
  id v27 = *(id *)(a1 + 64);
  id v28 = *(id *)(a1 + 72);
  id v29 = *(id *)(a1 + 80);
  id v30 = *(id *)(a1 + 88);
  id v31 = *(id *)(a1 + 96);
  id v32 = *(id *)(a1 + 104);
  [v11 _executeFetchOrSkipForTimeScopes:v12 timeScope:4 audience:v13 displayType:v14 remoteDateIntervals:v15 dataSources:v17 gregorianCalendar:v16 completion:v22];
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_320(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_320_cold_1();
    }
  }
  id v18 = v9;
  if (v7 && v8)
  {
    uint64_t v10 = objc_msgSend(v7, "hk_codableDateInterval");
    [*(id *)(a1 + 40) setMonthDateInterval:v10];

    [*(id *)(a1 + 40) setMonthData:v8];
  }
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 88);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_321;
  v19[3] = &unk_1E6D510C8;
  uint64_t v24 = v13;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 96);
  id v23 = *(id *)(a1 + 104);
  [v11 _executeFetchOrSkipForTimeScopes:v12 timeScope:3 audience:v13 displayType:v14 remoteDateIntervals:v15 dataSources:v17 gregorianCalendar:v16 completion:v19];
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_321(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F29FB0];
  if (v9 && (_HKInitializeLogging(), os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)))
  {
    __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_321_cold_1();
    if (!v7) {
      goto LABEL_6;
    }
  }
  else if (!v7)
  {
    goto LABEL_6;
  }
  if (v8)
  {
    uint64_t v11 = objc_msgSend(v7, "hk_codableDateInterval");
    [*(id *)(a1 + 40) setSixMonthDateInterval:v11];

    [*(id *)(a1 + 40) setSixMonthData:v8];
  }
LABEL_6:
  _HKInitializeLogging();
  os_log_t v12 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = v12;
    uint64_t v15 = HKStringForChartDataSourceQueryRequestAudience(v13);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    _os_log_impl(&dword_1E0B26000, v14, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: Returning chart model for timeScopes: %@", (uint8_t *)&v18, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_executeFetchOrSkipForTimeScopes:(id)a3 timeScope:(int64_t)a4 audience:(unint64_t)a5 displayType:(id)a6 remoteDateIntervals:(id)a7 dataSources:(id)a8 gregorianCalendar:(id)a9 completion:(id)a10
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v47 = a6;
  id v16 = a7;
  id v17 = a8;
  id v46 = a9;
  id v18 = a10;
  uint64_t v19 = NSNumber;
  id v20 = a3;
  uint64_t v21 = [v19 numberWithInteger:a4];
  __int16 v22 = [v20 member:v21];

  id v45 = v17;
  if (v22)
  {
    unint64_t v43 = a5;
    uint64_t v23 = [(HKHealthChartFactory *)self _remoteStatisticsIntervalForDisplayType:v47 timeScope:a4];
    uint64_t v24 = [v17 dataSourceForTimeScope:a4];
    id v53 = 0;
    uint64_t v25 = [v16 dateIntervalForTimeScope:a4 withGregorianCalendar:v46 error:&v53];
    id v26 = v53;
    id v27 = v16;
    if (!v26 || v25)
    {
      id v41 = v26;
      id v29 = [HKHealthQueryChartCacheQueryRequest alloc];
      [v25 startDate];
      id v30 = v24;
      id v32 = v31 = v23;
      uint64_t v33 = [v25 endDate];
      id v44 = [(HKHealthQueryChartCacheQueryRequest *)v29 initWithStartDate:v32 endDate:v33 statisticsInterval:v31 audience:v43];

      id v27 = v16;
      uint64_t v23 = v31;
      uint64_t v24 = v30;
      uint64_t v34 = [(HKHealthChartFactory *)self healthStore];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __149__HKHealthChartFactory__executeFetchOrSkipForTimeScopes_timeScope_audience_displayType_remoteDateIntervals_dataSources_gregorianCalendar_completion___block_invoke;
      v48[3] = &unk_1E6D51140;
      id v49 = v25;
      id v50 = v47;
      id v51 = v46;
      id v52 = v18;
      id v35 = (id)[v30 generateSharableQueryDataForRequest:v44 healthStore:v34 completionHandler:v48];

      id v26 = v41;
    }
    else
    {
      _HKInitializeLogging();
      id v28 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
      {
        v36 = v28;
        id v37 = HKStringForChartDataSourceQueryRequestAudience(v43);
        [v47 objectType];
        v38 = id v42 = v26;
        id v39 = [v38 identifier];
        id v40 = [v42 description];
        *(_DWORD *)buf = 138412802;
        v55 = v37;
        __int16 v56 = 2112;
        v57 = v39;
        __int16 v58 = 2112;
        v59 = v40;
        _os_log_error_impl(&dword_1E0B26000, v36, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@ Error: %@", buf, 0x20u);

        id v26 = v42;
      }
      (*((void (**)(id, void, void, id))v18 + 2))(v18, 0, 0, v26);
    }
  }
  else
  {
    (*((void (**)(id, void, void, void))v18 + 2))(v18, 0, 0, 0);
    id v27 = v16;
  }
}

void __149__HKHealthChartFactory__executeFetchOrSkipForTimeScopes_timeScope_audience_displayType_remoteDateIntervals_dataSources_gregorianCalendar_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 behavior];
  objc_msgSend(v5, "hk_dateIntervalUnshiftedFromQueryAlignment:calendar:", objc_msgSend(v9, "preferredCalendarDayAlignment"), a1[6]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[7] + 16))();
}

- (void)encodeChartQueryDataForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v6, "setWithObjects:", &unk_1F3C20068, &unk_1F3C20080, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  [(HKHealthChartFactory *)self encodeChartQueryDataForTypeIdentifier:v8 forTimeScopes:v10 timeScopeReferenceDate:v9 audience:0 completionHandler:v7];
}

- (id)remoteInteractiveChartForTypeIdentifier:(id)a3 model:(id)a4 chartSummaryTrendModel:(id)a5 displayDate:(id)a6
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(HKHealthChartFactory *)self _remoteChartDisplayTypeForTypeIdentifier:v11];
  if (v15)
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3C20068, &unk_1F3C20080, 0);
    id v17 = [(HKHealthChartFactory *)self _remoteDataSourcesForDisplayType:v15 forTimeScopes:v16];

    if ([v17 supportsChartQueryDataGeneration])
    {
      id v38 = v11;
      id v42 = v17;
      id v43 = v14;
      id v44 = [(HKHealthChartFactory *)self _remoteDisplayTypeConfigurationFromDataSources:v17 model:v12 originalDisplayType:v15];
      uint64_t v18 = [(HKHealthChartFactory *)self _sourceTimeZoneFromModel:v12];
      int64_t v39 = [(HKHealthChartFactory *)self _sourceFirstWeekdayFromModel:v12];
      uint64_t v19 = (void *)MEMORY[0x1E4F28C18];
      id v20 = [v12 monthDateInterval];
      uint64_t v21 = objc_msgSend(v19, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v20, v18);

      __int16 v22 = (void *)MEMORY[0x1E4F28C18];
      uint64_t v23 = [v12 sixMonthDateInterval];
      id v41 = (void *)v18;
      uint64_t v24 = objc_msgSend(v22, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v23, v18);

      uint64_t v25 = [v21 startDate];
      id v40 = v21;
      id v26 = [v21 endDate];
      id v27 = +[HKValueRange valueRangeWithMinValue:v25 maxValue:v26];

      id v28 = [v24 startDate];
      id v29 = [v24 endDate];
      id v30 = +[HKValueRange valueRangeWithMinValue:v28 maxValue:v29];

      v45[0] = &unk_1F3C20068;
      v45[1] = &unk_1F3C20080;
      v46[0] = v27;
      v46[1] = v30;
      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
      id v32 = [v44 remoteDisplayType];
      uint64_t v33 = [v44 initialTimeScope];
      id v14 = v43;
      if (v13) {
        [(HKHealthChartFactory *)self _buildTrendRemoteOverlayChartViewControllerWithDisplayType:v32 timeScopeRanges:v31 initialTimeScope:v33 chartSummaryTrendModel:v13 firstWeekday:v39 displayDate:v43];
      }
      else {
      id v35 = [(HKHealthChartFactory *)self _buildStandardRemoteChartViewControllerWithDisplayType:v32 timeScopeRanges:v31 initialTimeScope:v33 firstWeekday:v39 displayDate:v43];
      }

      id v17 = v42;
      id v11 = v38;
    }
    else
    {
      _HKInitializeLogging();
      v36 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[HKHealthChartFactory remoteInteractiveChartForTypeIdentifier:model:chartSummaryTrendModel:displayDate:]((uint64_t)v11, v36);
      }
      id v35 = 0;
    }
  }
  else
  {
    uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HKHealthChartFactory.m", 626, @"Type %@ does not have a valid display type.", v11 object file lineNumber description];

    id v35 = 0;
  }

  return v35;
}

- (id)breathingDisturbancesRemoteInteractiveChartWithBreathingDisturbancesModel:(id)a3 sleepApneaEventModel:(id)a4 sleepApneaEventChartData:(id)a5 displayDate:(id)a6
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (id)*MEMORY[0x1E4F2A5D8];
  id v16 = [(HKHealthChartFactory *)self _remoteChartDisplayTypeForTypeIdentifier:v15];
  if (v16)
  {
    id v17 = (id)*MEMORY[0x1E4F29878];
    id v53 = [(HKHealthChartFactory *)self _remoteChartDisplayTypeForTypeIdentifier:v17];
    if (v53)
    {
      id v50 = v14;
      id v47 = v15;
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3C20068, &unk_1F3C20080, 0);
      v48 = [(HKHealthChartFactory *)self _remoteDataSourcesForDisplayType:v16 forTimeScopes:v18];

      id v43 = [(HKHealthChartFactory *)self _remoteDisplayTypeConfigurationFromDataSources:v48 model:v11 originalDisplayType:v16];
      uint64_t v19 = [(HKHealthChartFactory *)self _sourceTimeZoneFromModel:v11];
      int64_t v45 = [(HKHealthChartFactory *)self _sourceFirstWeekdayFromModel:v11];
      id v20 = (void *)MEMORY[0x1E4F28C18];
      [v11 monthDateInterval];
      uint64_t v21 = v51 = v13;
      id v46 = (void *)v19;
      __int16 v22 = objc_msgSend(v20, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v21, v19);

      uint64_t v23 = (void *)MEMORY[0x1E4F28C18];
      [v11 sixMonthDateInterval];
      uint64_t v24 = v52 = v12;
      uint64_t v25 = objc_msgSend(v23, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v24, v19);

      id v44 = v22;
      id v26 = [v22 startDate];
      [v22 endDate];
      id v27 = v49 = v17;
      id v41 = +[HKValueRange valueRangeWithMinValue:v26 maxValue:v27];

      id v42 = v25;
      id v28 = [v25 startDate];
      id v29 = [v25 endDate];
      id v30 = +[HKValueRange valueRangeWithMinValue:v28 maxValue:v29];

      v54[0] = &unk_1F3C20068;
      v54[1] = &unk_1F3C20080;
      v55[0] = v41;
      v55[1] = v30;
      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
      id v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3C20068, &unk_1F3C20080, 0);
      uint64_t v33 = [(HKHealthChartFactory *)self _remoteDataSourcesForDisplayType:v53 forTimeScopes:v32];

      uint64_t v34 = [(HKHealthChartFactory *)self _remoteDisplayTypeConfigurationFromDataSources:v33 model:v52 queryData:v51 originalDisplayType:v53];
      id v35 = [v43 remoteDisplayType];
      v36 = [v34 remoteDisplayType];
      id v37 = -[HKHealthChartFactory _buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:apneaDisplayType:timeScopeRanges:initialTimeScope:firstWeekday:displayDate:](self, "_buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:apneaDisplayType:timeScopeRanges:initialTimeScope:firstWeekday:displayDate:", v35, v36, v31, [v43 initialTimeScope], v45, v50);

      id v13 = v51;
      id v15 = v47;
      id v14 = v50;

      id v12 = v52;
      id v17 = v49;
    }
    else
    {
      int64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, self, @"HKHealthChartFactory.m", 689, @"Type %@ does not have a valid display type.", v17 object file lineNumber description];

      id v37 = 0;
    }
  }
  else
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"HKHealthChartFactory.m", 681, @"Type %@ does not have a valid display type.", v15 object file lineNumber description];

    id v37 = 0;
  }

  return v37;
}

- (id)_buildBreathingDisturbancesRemoteChartViewControllerWithDisplayType:(id)a3 apneaDisplayType:(id)a4 timeScopeRanges:(id)a5 initialTimeScope:(int64_t)a6 firstWeekday:(int64_t)a7 displayDate:(id)a8
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v32 = a5;
  id v37 = a8;
  id v15 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  [v15 setSelectedTimeScope:a6];

  uint64_t v30 = objc_msgSend(v13, "hk_interactiveChartOptions") | 0xA0000;
  uint64_t v33 = [(HKHealthChartFactory *)self _remoteCalendarOverrideForDisplayType:v13];
  id v29 = [HKInteractiveChartOverlayViewController alloc];
  uint64_t v34 = v14;
  id v39 = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v40[0] = v16;
  id v35 = v13;
  id v38 = v13;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v40[1] = v31;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  id v17 = +[HKInteractiveChartStackHeight percentStackHeights:&unk_1F3C1F0D8];
  uint64_t v18 = [(HKHealthChartFactory *)self healthStore];
  uint64_t v19 = [(HKHealthChartFactory *)self unitPreferenceController];
  id v20 = [(HKHealthChartFactory *)self dateCache];
  uint64_t v21 = [(HKHealthChartFactory *)self chartDataCacheController];
  __int16 v22 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  uint64_t v23 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
  if (v37)
  {
    uint64_t v24 = v32;
    uint64_t v25 = [(HKInteractiveChartOverlayViewController *)v29 initWithStackedDisplayTypes:v36 primaryDisplayTypeStackIndex:&unk_1F3C20098 stackedDisplayTypeHeights:v17 healthStore:v18 unitPreferenceController:v19 dateCache:v20 chartDataCacheController:v21 selectedTimeScopeController:v22 sampleTypeDateRangeController:v23 initialXValue:v37 currentCalendarOverride:0 options:v30 timeScopeRanges:v32];
  }
  else
  {
    id v26 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v25 = [(HKInteractiveChartOverlayViewController *)v29 initWithStackedDisplayTypes:v36 primaryDisplayTypeStackIndex:&unk_1F3C20098 stackedDisplayTypeHeights:v17 healthStore:v18 unitPreferenceController:v19 dateCache:v20 chartDataCacheController:v21 selectedTimeScopeController:v22 sampleTypeDateRangeController:v23 initialXValue:v26 currentCalendarOverride:0 options:v30 timeScopeRanges:v32];

    uint64_t v24 = v32;
  }

  if (!v33) {
    [(HKInteractiveChartViewController *)v25 setAnnotationDataSourceFirstWeekday:a7];
  }

  return v25;
}

- (id)_sourceTimeZoneFromModel:(id)a3
{
  id v3 = a3;
  if ([v3 hasMonthData])
  {
    id v4 = [v3 monthData];
    int v5 = [v4 hasTimeZoneName];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
      id v7 = [v3 monthData];
LABEL_7:
      id v10 = v7;
      id v11 = [v7 timeZoneName];
      id v12 = (void *)[v6 initWithName:v11];

      goto LABEL_9;
    }
  }
  if ([v3 hasSixMonthData])
  {
    id v8 = [v3 sixMonthData];
    int v9 = [v8 hasTimeZoneName];

    if (v9)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
      id v7 = [v3 sixMonthData];
      goto LABEL_7;
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (int64_t)_sourceFirstWeekdayFromModel:(id)a3
{
  id v3 = a3;
  if ([v3 hasMonthData]
    && ([v3 monthData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 hasFirstWeekday],
        v4,
        v5))
  {
    id v6 = [v3 monthData];
  }
  else
  {
    if (![v3 hasSixMonthData]
      || ([v3 sixMonthData],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 hasFirstWeekday],
          v7,
          !v8))
    {
      int64_t v10 = -1;
      goto LABEL_9;
    }
    id v6 = [v3 sixMonthData];
  }
  int v9 = v6;
  int64_t v10 = [v6 firstWeekday];

LABEL_9:
  return v10;
}

- (id)_remoteDisplayTypeConfigurationFromDataSources:(id)a3 model:(id)a4 originalDisplayType:(id)a5
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 monthData];
  uint64_t v12 = [v9 sixMonthData];

  id v13 = [v10 dataSourceForTimeScope:4];
  id v14 = [v10 dataSourceForTimeScope:3];

  id v44 = (void *)v11;
  uint64_t v15 = [v13 chartPointsFromQueryData:v11 dataIsFromRemoteSource:1];
  int64_t v45 = v14;
  id v43 = (void *)v12;
  uint64_t v16 = v12;
  id v17 = (void *)v15;
  uint64_t v18 = [v14 chartPointsFromQueryData:v16 dataIsFromRemoteSource:1];
  uint64_t v19 = [v17 chartPoints];
  if (v19
    && (id v20 = (void *)v19,
        [v17 chartPoints],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = [v21 count],
        v21,
        v20,
        v22))
  {
    uint64_t v23 = 4;
  }
  else
  {
    uint64_t v23 = 3;
  }
  uint64_t v42 = v23;
  uint64_t v24 = objc_alloc_init(HKRemoteChartDataSource);
  uint64_t v25 = objc_alloc_init(HKRemoteChartDataSource);
  id v41 = v24;
  id v26 = [(HKHealthChartFactory *)self _remoteGraphSeriesForDisplayType:v8 graphSeriesDataSource:v24 timeScope:4];
  id v27 = [(HKHealthChartFactory *)self _remoteGraphSeriesForDisplayType:v8 graphSeriesDataSource:v25 timeScope:3];
  id v28 = [v26 seriesDataSourceContext];
  [(HKRemoteChartDataSource *)v24 setDataForTimeScope:4 seriesData:v17 dataSourceForMapping:v13 seriesDataSourceContext:v28];

  id v29 = [v27 seriesDataSourceContext];
  uint64_t v30 = (void *)v18;
  [(HKRemoteChartDataSource *)v25 setDataForTimeScope:3 seriesData:v18 dataSourceForMapping:v45 seriesDataSourceContext:v29];

  id v31 = [(HKHealthChartFactory *)self _remoteCustomFormatterForDisplayType:v8];
  id v32 = [HKInteractiveChartDisplayType alloc];
  uint64_t v33 = [v8 objectType];
  id v40 = v17;
  uint64_t v34 = [v33 code];
  v46[0] = &unk_1F3C20068;
  v46[1] = &unk_1F3C20080;
  v47[0] = v26;
  v47[1] = v27;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  id v35 = v39 = v13;
  v36 = [(HKInteractiveChartDisplayType *)v32 initWithBaseDisplayType:v8 valueFormatter:v31 dataTypeCode:v34 seriesForTimeScopeMapping:v35];

  id v37 = [[_HKRemoteDisplayTypeConfiguration alloc] initWithInitialTimeScope:v42 remoteDisplayType:v36];
  return v37;
}

- (id)_remoteDisplayTypeConfigurationFromDataSources:(id)a3 model:(id)a4 queryData:(id)a5 originalDisplayType:(id)a6
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 dataSourceForTimeScope:4];
  uint64_t v15 = [v13 dataSourceForTimeScope:3];

  uint64_t v16 = [(HKHealthChartFactory *)self _sourceTimeZoneFromModel:v12];
  id v17 = [v14 chartPointsFromNotificationQueryData:v11 sourceTimeZoneFromModel:v16];

  uint64_t v18 = [(HKHealthChartFactory *)self _sourceTimeZoneFromModel:v12];

  int64_t v45 = v15;
  uint64_t v19 = [v15 chartPointsFromNotificationQueryData:v11 sourceTimeZoneFromModel:v18];

  uint64_t v20 = [v17 chartPoints];
  if (v20
    && (uint64_t v21 = (void *)v20,
        [v17 chartPoints],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v23 = [v22 count],
        v22,
        v21,
        v23))
  {
    uint64_t v24 = 4;
  }
  else
  {
    uint64_t v24 = 3;
  }
  uint64_t v44 = v24;
  uint64_t v25 = objc_alloc_init(HKRemoteChartDataSource);
  id v26 = objc_alloc_init(HKRemoteChartDataSource);
  id v27 = v25;
  uint64_t v42 = v25;
  id v28 = [(HKHealthChartFactory *)self _remoteGraphSeriesForDisplayType:v10 graphSeriesDataSource:v25 timeScope:4];
  id v29 = [(HKHealthChartFactory *)self _remoteGraphSeriesForDisplayType:v10 graphSeriesDataSource:v26 timeScope:3];
  uint64_t v30 = [v28 seriesDataSourceContext];
  id v43 = v17;
  [(HKRemoteChartDataSource *)v27 setDataForTimeScope:4 seriesData:v17 dataSourceForMapping:v14 seriesDataSourceContext:v30];

  id v31 = [v29 seriesDataSourceContext];
  id v32 = (void *)v19;
  [(HKRemoteChartDataSource *)v26 setDataForTimeScope:3 seriesData:v19 dataSourceForMapping:v45 seriesDataSourceContext:v31];

  uint64_t v33 = [HKInteractiveChartDisplayType alloc];
  uint64_t v34 = [(HKHealthChartFactory *)self _remoteCustomFormatterForDisplayType:v10];
  id v35 = [v10 objectType];
  id v41 = v14;
  uint64_t v36 = [v35 code];
  v46[0] = &unk_1F3C20068;
  v46[1] = &unk_1F3C20080;
  v47[0] = v28;
  v47[1] = v29;
  id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  id v38 = [(HKInteractiveChartDisplayType *)v33 initWithBaseDisplayType:v10 valueFormatter:v34 dataTypeCode:v36 seriesForTimeScopeMapping:v37];

  id v39 = [[_HKRemoteDisplayTypeConfiguration alloc] initWithInitialTimeScope:v44 remoteDisplayType:v38];
  return v39;
}

- (id)_remoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 displayTypeIdentifier];
  if (v10 == 276)
  {
    uint64_t v11 = [(HKHealthChartFactory *)self _sleepApneaGraphSeriesForDisplayType:v8 graphSeriesDataSource:v9 timeScope:a5];
  }
  else if (v10 == 275)
  {
    uint64_t v11 = [(HKHealthChartFactory *)self _sleepingBreathingDisturbancesGraphSeriesForDisplayType:v8 graphSeriesDataSource:v9 timeScope:a5];
  }
  else
  {
    if (v10 == 63) {
      [(HKHealthChartFactory *)self _sleepRemoteGraphSeriesForDisplayType:v8 graphSeriesDataSource:v9 timeScope:a5];
    }
    else {
    uint64_t v11 = [(HKHealthChartFactory *)self _standardRemoteGraphSeriesForDisplayType:v8 graphSeriesDataSource:v9 timeScope:a5];
    }
  }
  id v12 = (void *)v11;

  return v12;
}

- (id)_standardRemoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 displayCategory];
  uint64_t v11 = [(HKHealthChartFactory *)self unitPreferenceController];
  id v12 = [(HKHealthChartFactory *)self chartDataCacheController];
  id v13 = objc_msgSend(v9, "hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:", a5, v8, v10, v11, v12);

  return v13;
}

- (id)_sleepRemoteGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(HKHealthChartFactory *)self unitPreferenceController];
  uint64_t v11 = +[HKSleepUtilities buildSleepGraphSeriesForSleepSeriesType:0 sleepDisplayType:v9 unitController:v10 numericAxisConfigurationOverrides:0 timeScope:a5];

  [v11 setDataSource:v8];
  return v11;
}

- (id)_sleepingBreathingDisturbancesGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(HKHealthChartFactory *)self _standardRemoteGraphSeriesForDisplayType:v8 graphSeriesDataSource:a4 timeScope:a5];
  uint64_t v10 = [[HKBreathingDisturbancesAxis alloc] initWithDisplayType:v8];

  [v9 setYAxis:v10];
  return v9;
}

- (id)_sleepApneaGraphSeriesForDisplayType:(id)a3 graphSeriesDataSource:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(HKHealthChartFactory *)self _standardRemoteGraphSeriesForDisplayType:v8 graphSeriesDataSource:a4 timeScope:a5];
  uint64_t v10 = [[HKSleepApneaEventAxis alloc] initWithDisplayType:v8];

  [v9 setYAxis:v10];
  return v9;
}

- (id)_remoteCustomFormatterForDisplayType:(id)a3
{
  uint64_t v4 = [a3 displayTypeIdentifier];
  int v5 = 0;
  if (v4 <= 274)
  {
    if (v4 == 63)
    {
      uint64_t v10 = [(HKHealthChartFactory *)self sleepChartFormatter];
LABEL_11:
      int v5 = v10;
      goto LABEL_12;
    }
    if (v4 != 124) {
      goto LABEL_12;
    }
    id v6 = HKInteractiveChartCardioFitnessFormatter;
LABEL_10:
    uint64_t v10 = (HKSleepApneaEventInteractiveChartFormatter *)objc_alloc_init(v6);
    goto LABEL_11;
  }
  if (v4 == 275)
  {
    id v6 = HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter;
    goto LABEL_10;
  }
  if (v4 == 276)
  {
    id v7 = [HKSleepApneaEventInteractiveChartFormatter alloc];
    id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = [v8 localizedStringForKey:@"SLEEP_APNEA_ALERTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];
    int v5 = [(HKSleepApneaEventInteractiveChartFormatter *)v7 initWithLocalizedCategoryName:v9];
  }
LABEL_12:
  return v5;
}

- (id)_buildStandardRemoteChartViewControllerWithDisplayType:(id)a3 timeScopeRanges:(id)a4 initialTimeScope:(int64_t)a5 firstWeekday:(int64_t)a6 displayDate:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v28 = a4;
  id v31 = a7;
  id v12 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  [v12 setSelectedTimeScope:a5];

  uint64_t v26 = objc_msgSend(v11, "hk_interactiveChartOptions") | 0xA0000;
  id v13 = [(HKHealthChartFactory *)self _remoteCalendarOverrideForDisplayType:v11];
  id v27 = [HKInteractiveChartViewController alloc];
  id v29 = v11;
  id v32 = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v33[0] = v14;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v15 = [(HKHealthChartFactory *)self healthStore];
  uint64_t v16 = [(HKHealthChartFactory *)self unitPreferenceController];
  id v17 = [(HKHealthChartFactory *)self dateCache];
  uint64_t v18 = [(HKHealthChartFactory *)self chartDataCacheController];
  uint64_t v19 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  uint64_t v20 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
  if (v31)
  {
    uint64_t v21 = v28;
    uint64_t v22 = [(HKInteractiveChartViewController *)v27 initWithStackedDisplayTypes:v30 primaryDisplayTypeStackIndex:0 stackedDisplayTypeHeights:0 healthStore:v15 unitPreferenceController:v16 dateCache:v17 chartDataCacheController:v18 selectedTimeScopeController:v19 sampleTypeDateRangeController:v20 initialXValue:v31 currentCalendarOverride:v13 options:v26 timeScopeRanges:v28];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v22 = [(HKInteractiveChartViewController *)v27 initWithStackedDisplayTypes:v30 primaryDisplayTypeStackIndex:0 stackedDisplayTypeHeights:0 healthStore:v15 unitPreferenceController:v16 dateCache:v17 chartDataCacheController:v18 selectedTimeScopeController:v19 sampleTypeDateRangeController:v20 initialXValue:v23 currentCalendarOverride:v13 options:v26 timeScopeRanges:v28];

    uint64_t v21 = v28;
  }

  if (!v13) {
    [(HKInteractiveChartViewController *)v22 setAnnotationDataSourceFirstWeekday:a6];
  }

  return v22;
}

- (id)_buildTrendRemoteOverlayChartViewControllerWithDisplayType:(id)a3 timeScopeRanges:(id)a4 initialTimeScope:(int64_t)a5 chartSummaryTrendModel:(id)a6 firstWeekday:(int64_t)a7 displayDate:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(HKHealthChartFactory *)self _buildApplicationItems];
  uint64_t v19 = [(HKHealthChartFactory *)self _remoteCalendarOverrideForDisplayType:v17];
  uint64_t v20 = [[HKOverlayRoomFactorAndTrendViewController alloc] initWithBaseChartDisplayType:v17 trendModel:v15 factorDisplayTypes:0 displayDate:v14 applicationItems:v18 mode:1 timeScopeRanges:v16 initialTimeScope:a5 wrappedOverlay:0 overrideFirstWeekday:a7 overrideCalendar:v19 additionalChartOptions:0];

  return v20;
}

- (id)_remoteCalendarOverrideForDisplayType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 displayTypeIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v3 baseDisplayType];
    uint64_t v4 = [v5 displayTypeIdentifier];
  }
  if (v4 == 248)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    [v6 setFirstWeekday:2];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)createDisplayTypeForSleepDuration
{
  return [(HKHealthChartFactory *)self _createSleepDisplayTypeForSeriesType:0];
}

- (id)createDisplayTypeForSleepStages
{
  return [(HKHealthChartFactory *)self _createSleepDisplayTypeForSeriesType:4];
}

- (id)_createSleepDisplayTypeForSeriesType:(int64_t)a3
{
  int v5 = [(HKHealthChartFactory *)self displayTypeController];
  id v6 = [v5 displayTypeWithIdentifier:&unk_1F3C200B0];

  id v7 = [(HKHealthChartFactory *)self sleepDataSourceProvider];
  id v8 = [(HKHealthChartFactory *)self chartDataCacheController];
  id v9 = [(HKHealthChartFactory *)self healthStore];
  uint64_t v10 = +[HKSleepUtilities buildSleepChartCachesWithDisplayType:v6 dataSourceProvider:v7 cacheController:v8 healthStore:v9];

  id v11 = [(HKHealthChartFactory *)self healthStore];
  id v12 = [(HKHealthChartFactory *)self unitPreferenceController];
  id v13 = [(HKHealthChartFactory *)self displayTypeController];
  id v14 = [(HKHealthChartFactory *)self chartDataCacheController];
  id v15 = [(HKHealthChartFactory *)self sleepChartFormatter];
  LOBYTE(v19) = 0;
  id v16 = +[HKSleepUtilities sleepDisplayTypesWithHealthStore:v11 sleepDisplayType:v6 unitController:v12 displayTypeController:v13 chartCacheController:v14 sleepChartFormatter:v15 sleepSeriesType:a3 sleepChartCaches:v10 customSleepSeries:0 isStackedChart:v19];

  id v17 = [v16 firstObject];

  return v17;
}

- (id)createInteractiveChartForSimpleDisplayType:(id)a3 chartOptions:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [HKInteractiveChartViewController alloc];
  v17[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  id v9 = [(HKHealthChartFactory *)self healthStore];
  uint64_t v10 = [(HKHealthChartFactory *)self unitPreferenceController];
  id v11 = [(HKHealthChartFactory *)self dateCache];
  id v12 = [(HKHealthChartFactory *)self chartDataCacheController];
  id v13 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  id v14 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
  id v15 = [(HKInteractiveChartViewController *)v7 initWithDisplayTypes:v8 healthStore:v9 unitPreferenceController:v10 dateCache:v11 chartDataCacheController:v12 selectedTimeScopeController:v13 sampleTypeDateRangeController:v14 initialXValue:0 currentCalendarOverride:0 options:a4];

  return v15;
}

- (id)activityChartForActivityMoveMode:(int64_t)a3 displayDate:(id)a4 activityOptions:(unint64_t)a5 chartSharableModel:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  [v12 setSelectedTimeScope:6];

  uint64_t v13 = *MEMORY[0x1E4F29640];
  id v14 = [(HKHealthChartFactory *)self _factorDisplayTypesForPrimaryTypeIdentifier:*MEMORY[0x1E4F29640]];
  [(HKHealthChartFactory *)self _logFactorsForTypeIdentifier:v13 factorDisplayTypes:v14];
  uint64_t v15 = [v14 count];
  if (v10 || !v15)
  {
    uint64_t v33 = [HKInteractiveChartActivityController alloc];
    uint64_t v32 = [(HKHealthChartFactory *)self healthStore];
    uint64_t v20 = [(HKHealthChartFactory *)self unitPreferenceController];
    uint64_t v31 = [(HKHealthChartFactory *)self dateCache];
    uint64_t v23 = [(HKHealthChartFactory *)self chartDataCacheController];
    [(HKHealthChartFactory *)self selectedTimeScopeController];
    v25 = id v24 = v10;
    uint64_t v26 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
    id v27 = [(HKHealthChartFactory *)self wheelchairUseCharacteristicCache];
    unint64_t v29 = a5;
    uint64_t v21 = (void *)v32;
    uint64_t v22 = [(HKInteractiveChartActivityController *)v33 initWithHealthStore:v32 unitPreferenceController:v20 dateCache:v31 chartDataCacheController:v23 selectedTimeScopeController:v25 sampleTypeDateRangeController:v26 wheelchairUseCharacteristicCache:v27 initialXValue:v11 activityMoveMode:a3 activityOptions:v29 chartSharableModel:v24];

    id v10 = v24;
    id v11 = (id)v31;
  }
  else
  {
    id v16 = [(HKHealthChartFactory *)self displayTypeController];
    id v17 = [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:v13];
    uint64_t v18 = [v16 displayTypeForObjectType:v17];

    uint64_t v19 = [HKOverlayRoomFactorAndTrendViewController alloc];
    uint64_t v20 = [(HKHealthChartFactory *)self _buildApplicationItems];
    unint64_t v30 = a5;
    uint64_t v21 = (void *)v18;
    uint64_t v22 = [(HKOverlayRoomFactorAndTrendViewController *)v19 initWithBaseChartDisplayType:v18 trendModel:0 factorDisplayTypes:v14 displayDate:v11 applicationItems:v20 mode:1 timeScopeRanges:0 initialTimeScope:8 wrappedOverlay:0 overrideFirstWeekday:-1 overrideCalendar:0 additionalChartOptions:0 activityMoveMode:a3 activityOptions:v30];
  }

  return v22;
}

- (id)staticAudiogramChartViewControllerWithAudiogramSample:(id)a3 hideEnhancedUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x1E4F2B2C0];
  id v7 = a3;
  id v8 = [v6 audiogramSampleType];
  id v9 = [v8 identifier];

  id v10 = [HKSingleAudiogramChartViewController alloc];
  id v11 = [(HKHealthChartFactory *)self _buildApplicationItems];
  id v12 = [(HKHealthChartFactory *)self _factorDisplayTypesForPrimaryTypeIdentifier:v9];
  uint64_t v13 = [(HKSingleAudiogramChartViewController *)v10 initWithApplicationItems:v11 staticAudiogram:v7 factorDisplayTypes:v12 hideEnhancedUI:v4];

  return v13;
}

- (void)encodeActivityChartDataForActivityMoveMode:(int64_t)a3 completion:(id)a4
{
  id v19 = a4;
  context = (void *)MEMORY[0x1E4E40740]();
  int v5 = [(HKHealthChartFactory *)self displayTypeController];
  id v6 = [v5 displayTypeWithIdentifier:&unk_1F3C200C8];

  id v7 = [HKRemoteDateIntervals alloc];
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  id v9 = [(HKRemoteDateIntervals *)v7 initWithDisplayType:v6 fromEndDate:v8];

  id v10 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
  id v11 = [(HKRemoteDateIntervals *)v9 dateIntervalForTimeScope:4 withGregorianCalendar:v10 error:0];
  id v12 = [(HKRemoteDateIntervals *)v9 dateIntervalForTimeScope:3 withGregorianCalendar:v10 error:0];
  uint64_t v13 = [(HKHealthChartFactory *)self healthStore];
  id v14 = [(HKHealthChartFactory *)self dateCache];
  uint64_t v15 = [(HKHealthChartFactory *)self displayTypeController];
  id v16 = [(HKHealthChartFactory *)self unitPreferenceController];
  +[HKInteractiveChartActivityController encodeChartDataWithHealthStore:v13 dateCache:v14 displayTypeController:v15 unitController:v16 activityMoveMode:a3 monthDateInterval:v11 sixMonthDateInterval:v12 completion:v19];
}

- (void)updateChartSummaryTrendModel:(id)a3 viewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 conformsToProtocol:&unk_1F3C50E88])
  {
    id v7 = [v6 getChartSummaryTrendModelToModify];
    id v8 = v7;
    if (v7) {
      [v7 updateChartSummaryTrendModel:v5];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKHealthChartFactory updateChartSummaryTrendModel:viewController:]((uint64_t)v6, v9);
    }
  }
}

- (int64_t)_resolvedTimeScopeForTypeIdentifier:(id)a3 displayDateInterval:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HKHealthChartFactory *)self _displayTypeForTypeIdentifier:v7];
  if (v9)
  {
    [v8 duration];
    if (v10 >= 2.22507386e-308)
    {
      uint64_t v13 = [v8 startDate];
      id v14 = [v8 endDate];
      id v11 = +[HKValueRange valueRangeWithMinValue:v13 maxValue:v14];

      int64_t v12 = +[HKGraphZoomLevelConfiguration timeScopeForDateRange:v11];
      if ((objc_msgSend(v9, "hk_isSupportedTimeScope:", v12) & 1) == 0)
      {
        uint64_t v15 = [v9 chartingRules];
        int64_t v12 = [v15 preferredTimeScope];
      }
    }
    else
    {
      id v11 = [v9 chartingRules];
      int64_t v12 = [v11 preferredTimeScope];
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKHealthChartFactory.m", 1197, @"Type %@ does not have a valid display type.", v7 object file lineNumber description];
    int64_t v12 = 8;
  }

  return v12;
}

- (id)_resolvedDisplayDateForDisplayType:(id)a3 displayDate:(id)a4 timeScope:(int64_t)a5 gregorianCalendar:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [a3 behavior];
  uint64_t v12 = [v11 preferredCalendarDayAlignment];

  if (v12 != 1
    || (a5 & 0xFFFFFFFFFFFFFFFELL) == 6
    || (uint64_t v13 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v10),
        uint64_t v14 = objc_msgSend(v9, "hk_morningIndexWithCalendar:", v10),
        v13 == v14))
  {
    id v15 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v14, 6, v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v16 = v15;

  return v16;
}

- (id)_displayTypeForTypeIdentifier:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:a3];
  if (v4)
  {
    id v5 = [(HKHealthChartFactory *)self displayTypeController];
    id v6 = [v5 displayTypeForObjectType:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)CHRRoomApplicationItems
{
  id v3 = objc_alloc_init(HKSelectedTimeScopeController);
  [(HKSelectedTimeScopeController *)v3 setSelectedTimeScope:1];
  BOOL v4 = objc_alloc_init(HKOverlayRoomApplicationItems);
  id v5 = [(HKHealthChartFactory *)self healthStore];
  [(HKOverlayRoomApplicationItems *)v4 setHealthStore:v5];

  [(HKOverlayRoomApplicationItems *)v4 setTimeScopeController:v3];
  id v6 = [(HKHealthChartFactory *)self dateCache];
  [(HKOverlayRoomApplicationItems *)v4 setDateCache:v6];

  id v7 = [(HKHealthChartFactory *)self unitPreferenceController];
  [(HKOverlayRoomApplicationItems *)v4 setUnitController:v7];

  id v8 = [(HKHealthChartFactory *)self chartDataCacheController];
  [(HKOverlayRoomApplicationItems *)v4 setChartDataCacheController:v8];

  id v9 = [(HKHealthChartFactory *)self sampleTypeUpdateController];
  [(HKOverlayRoomApplicationItems *)v4 setSampleTypeUpdateController:v9];

  id v10 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
  [(HKOverlayRoomApplicationItems *)v4 setSampleDateRangeController:v10];

  id v11 = [(HKHealthChartFactory *)self displayTypeController];
  [(HKOverlayRoomApplicationItems *)v4 setDisplayTypeController:v11];

  return v4;
}

- (void)registerInteractiveChartViewControllerProvider:(id)a3 typeIdentifier:(id)a4
{
}

- (id)_buildApplicationItems
{
  id v3 = objc_alloc_init(HKOverlayRoomApplicationItems);
  BOOL v4 = [(HKHealthChartFactory *)self healthStore];
  [(HKOverlayRoomApplicationItems *)v3 setHealthStore:v4];

  id v5 = [(HKHealthChartFactory *)self selectedTimeScopeController];
  [(HKOverlayRoomApplicationItems *)v3 setTimeScopeController:v5];

  id v6 = [(HKHealthChartFactory *)self dateCache];
  [(HKOverlayRoomApplicationItems *)v3 setDateCache:v6];

  id v7 = [(HKHealthChartFactory *)self unitPreferenceController];
  [(HKOverlayRoomApplicationItems *)v3 setUnitController:v7];

  id v8 = [(HKHealthChartFactory *)self chartDataCacheController];
  [(HKOverlayRoomApplicationItems *)v3 setChartDataCacheController:v8];

  id v9 = [(HKHealthChartFactory *)self sampleTypeUpdateController];
  [(HKOverlayRoomApplicationItems *)v3 setSampleTypeUpdateController:v9];

  id v10 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
  [(HKOverlayRoomApplicationItems *)v3 setSampleDateRangeController:v10];

  id v11 = [(HKHealthChartFactory *)self displayTypeController];
  [(HKOverlayRoomApplicationItems *)v3 setDisplayTypeController:v11];

  return v3;
}

- (id)_factorDisplayTypesForPrimaryTypeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthChartFactory *)self displayTypeController];
  id v6 = [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:v4];

  id v7 = [v5 displayTypeForObjectType:v6];

  id v8 = [(HKHealthChartFactory *)self _factorDisplayTypesForPrimaryDisplayType:v7];

  return v8;
}

- (id)_factorDisplayTypesForPrimaryDisplayType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = +[HKDisplayType hk_chartFactorDisplayTypes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(HKHealthChartFactory *)self _factorDisplayType:v11 availableForPrimaryDisplayType:v4]&& [(HKHealthChartFactory *)self _factorDisplayTypeHasData:v11])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_factorDisplayType:(id)a3 availableForPrimaryDisplayType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "hk_chartExcludedFactorDisplayTypes");
  char v8 = [v7 containsObject:v6];
  char v9 = [v6 isEqual:v5];

  return (v8 | v9) ^ 1;
}

- (BOOL)_factorDisplayTypeHasData:(id)a3
{
  id v4 = [a3 sampleType];
  id v5 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
  id v6 = [v5 dateRangeForSampleType:v4];

  uint64_t v7 = [v6 minValue];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    char v9 = [v6 maxValue];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a3;
  uint64_t v21 = [(HKHealthChartFactory *)self displayTypeController];
  uint64_t v22 = [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:v20];

  uint64_t v23 = [v21 displayTypeForObjectType:v22];

  if (v23)
  {
    id v42 = v15;
    id v24 = v19;
    uint64_t v25 = objc_msgSend(v23, "hk_interactiveChartOptions");
    if (v16)
    {
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
      id v27 = [(HKHealthChartFactory *)self selectedTimeScopeController];
      -[HKHealthChartFactory _resolvedDisplayDateForDisplayType:displayDate:timeScope:gregorianCalendar:](self, "_resolvedDisplayDateForDisplayType:displayDate:timeScope:gregorianCalendar:", v23, v16, [v27 selectedTimeScope], v26);
      v29 = id v28 = v17;

      id v16 = (id)v29;
      id v17 = v28;
    }
    if (v17)
    {

      id v16 = 0;
    }
    id v19 = v24;
    unint64_t v30 = v25 | a11;
    id v15 = v42;
    if (v18 || [v19 count])
    {
      uint64_t v31 = [[HKOverlayRoomFactorAndTrendViewController alloc] initWithBaseChartDisplayType:v23 trendModel:v18 factorDisplayTypes:v19 displayDate:v16 applicationItems:v42 mode:1 timeScopeRanges:0 initialTimeScope:8 wrappedOverlay:0 overrideFirstWeekday:-1 overrideCalendar:0 additionalChartOptions:v30];
    }
    else
    {
      id v38 = [HKInteractiveChartViewController alloc];
      v43[0] = v23;
      id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      id v40 = [(HKHealthChartFactory *)self healthStore];
      id v37 = [(HKHealthChartFactory *)self unitPreferenceController];
      [(HKHealthChartFactory *)self dateCache];
      uint64_t v33 = v39 = v17;
      uint64_t v34 = [(HKHealthChartFactory *)self chartDataCacheController];
      id v35 = [(HKHealthChartFactory *)self selectedTimeScopeController];
      uint64_t v36 = [(HKHealthChartFactory *)self sampleTypeDateRangeController];
      uint64_t v31 = [(HKInteractiveChartViewController *)v38 initWithDisplayTypes:v41 healthStore:v40 unitPreferenceController:v37 dateCache:v33 chartDataCacheController:v34 selectedTimeScopeController:v35 sampleTypeDateRangeController:v36 initialXValue:v16 currentCalendarOverride:0 options:v30];

      id v15 = v42;
      id v17 = v39;

      [(HKOverlayRoomViewController *)v31 setRestorationUserActivity:v39];
    }
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKChartDataCacheController)chartDataCacheController
{
  return self->_chartDataCacheController;
}

- (HKSampleTypeUpdateController)sampleTypeUpdateController
{
  return self->_sampleTypeUpdateController;
}

- (HKSampleTypeDateRangeController)sampleTypeDateRangeController
{
  return self->_sampleTypeDateRangeController;
}

- (HKSelectedTimeScopeController)selectedTimeScopeController
{
  return self->_selectedTimeScopeController;
}

- (HKSleepDataSourceProvider)sleepDataSourceProvider
{
  return self->_sleepDataSourceProvider;
}

- (void)setSleepDataSourceProvider:(id)a3
{
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (void)setSleepChartFormatter:(id)a3
{
}

- (HKAddDataViewControllerProvider)addDataViewControllerProvider
{
  return self->_addDataViewControllerProvider;
}

- (void)setAddDataViewControllerProvider:(id)a3
{
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (BOOL)turnOffInitialSelectionForTesting
{
  return self->_turnOffInitialSelectionForTesting;
}

- (void)setTurnOffInitialSelectionForTesting:(BOOL)a3
{
  self->_turnOffInitialSelectionForTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_addDataViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
  objc_storeStrong((id *)&self->_sleepDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_selectedTimeScopeController, 0);
  objc_storeStrong((id *)&self->_sampleTypeDateRangeController, 0);
  objc_storeStrong((id *)&self->_sampleTypeUpdateController, 0);
  objc_storeStrong((id *)&self->_chartDataCacheController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_customViewControllerProvidersByTypeIdentifier, 0);
}

- (id)supportedTypeIdentifiers
{
  return &unk_1F3C1F3C0;
}

- (id)standardChartDisplayTypeIdentifierForTypeIdentifier:(id)a3
{
  return (id)[&unk_1F3C22C60 objectForKeyedSubscript:a3];
}

- (id)chartFactoryViewControllerProviderForType:(id)a3 standardProvider:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    BOOL v8 = 0;
    switch([v6 code])
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 12:
      case 13:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 60:
      case 62:
      case 70:
      case 71:
      case 72:
      case 73:
      case 75:
      case 78:
      case 79:
      case 83:
      case 87:
      case 89:
      case 90:
      case 91:
      case 92:
      case 95:
      case 96:
      case 97:
      case 99:
      case 101:
      case 110:
      case 111:
      case 113:
      case 114:
      case 118:
      case 125:
      case 137:
      case 138:
      case 139:
      case 140:
      case 147:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 178:
      case 179:
      case 183:
      case 186:
      case 189:
      case 191:
      case 192:
      case 193:
      case 194:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 249:
      case 250:
      case 251:
      case 256:
      case 258:
      case 259:
      case 260:
      case 262:
      case 263:
      case 264:
      case 265:
      case 266:
      case 269:
      case 270:
      case 274:
      case 276:
      case 277:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 287:
      case 288:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 301:
      case 302:
      case 303:
      case 304:
      case 313:
      case 314:
        char v9 = (HKHealthChartFactoryViewControllerProviderClassAdaptor *)v5;
        goto LABEL_4;
      case 5:
      case 14:
      case 15:
      case 61:
      case 63:
      case 80:
      case 124:
      case 172:
      case 173:
      case 182:
      case 187:
      case 188:
      case 195:
      case 196:
      case 237:
      case 248:
      case 272:
      case 275:
      case 286:
      case 305:
        uint64_t v11 = [HKHealthChartFactoryViewControllerProviderClassAdaptor alloc];
        goto LABEL_11;
      case 145:
        uint64_t v12 = [MEMORY[0x1E4F2B860] sharedBehavior];
        long long v13 = [v12 features];
        [v13 yodel];

        uint64_t v11 = [HKHealthChartFactoryViewControllerProviderClassAdaptor alloc];
LABEL_11:
        char v9 = [(HKHealthChartFactoryViewControllerProviderClassAdaptor *)v11 initWithProviderClass:objc_opt_class()];
LABEL_4:
        BOOL v8 = v9;
        break;
      default:
        break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_sleepRemoteDataSourcesForDisplayType:(unsigned char *)a1 forTimeScopes:(unsigned char *)a2 audience:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4(&dword_1E0B26000, v2, v3, "Unsupported time scope requested for Sleep", v4);
}

- (void)_cardioFitnessDataSourcesForDisplayType:(unsigned char *)a1 forTimeScopes:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4(&dword_1E0B26000, v2, v3, "Unsupported time scope requested for Cardio Fitness", v4);
}

- (void)_sleepApneaRemoteDataSourcesForDisplayType:(unsigned char *)a1 forTimeScopes:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4(&dword_1E0B26000, v2, v3, "Unsupported time scope requested for Sleep Apnea", v4);
}

- (void)_defaultRemoteDataSourcesForDisplayType:(void *)a3 forTimeScopes:(void *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  BOOL v8 = [a3 localization];
  char v9 = [v8 displayName];
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_error_impl(&dword_1E0B26000, v7, OS_LOG_TYPE_ERROR, "Unsupported time scope requested for %@", a1, 0xCu);
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_317_cold_1()
{
  OUTLINED_FUNCTION_6();
  int v2 = *(void **)(v1 + 104);
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_5();
  HKStringForChartDataSourceQueryRequestAudience(v5);
  objc_claimAutoreleasedReturnValue();
  id v6 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E0B26000, v7, v8, "[RemoteCharting]_%@_%@: Error encoding day time scope chart. %@", v9, v10, v11, v12, v13);
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_319_cold_1()
{
  OUTLINED_FUNCTION_6();
  int v2 = *(void **)(v1 + 112);
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_5();
  HKStringForChartDataSourceQueryRequestAudience(v5);
  objc_claimAutoreleasedReturnValue();
  id v6 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E0B26000, v7, v8, "[RemoteCharting]_%@_%@: Error encoding week time scope chart. %@", v9, v10, v11, v12, v13);
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_320_cold_1()
{
  OUTLINED_FUNCTION_6();
  int v2 = *(void **)(v1 + 112);
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_5();
  HKStringForChartDataSourceQueryRequestAudience(v5);
  objc_claimAutoreleasedReturnValue();
  id v6 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E0B26000, v7, v8, "[RemoteCharting]_%@_%@: Error encoding month time scope chart. %@", v9, v10, v11, v12, v13);
}

void __126__HKHealthChartFactory_encodeChartQueryDataForTypeIdentifier_forTimeScopes_timeScopeReferenceDate_audience_completionHandler___block_invoke_321_cold_1()
{
  OUTLINED_FUNCTION_6();
  int v2 = *(void **)(v1 + 64);
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_5();
  HKStringForChartDataSourceQueryRequestAudience(v5);
  objc_claimAutoreleasedReturnValue();
  id v6 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E0B26000, v7, v8, "[RemoteCharting]_%@_%@: Error encoding six months time scope chart. %@", v9, v10, v11, v12, v13);
}

- (void)remoteInteractiveChartForTypeIdentifier:(uint64_t)a1 model:(NSObject *)a2 chartSummaryTrendModel:displayDate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Type %@ does not support chart query data generation", (uint8_t *)&v2, 0xCu);
}

- (void)updateChartSummaryTrendModel:(uint64_t)a1 viewController:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "HKHealthChartFactory: called updateChartSummaryTrendModel on object that does not conform to HKOverlayRoomTrendModelProviding.  ViewController %@", (uint8_t *)&v2, 0xCu);
}

@end