@interface WDSleepStageListDataProvider
- (NSMutableArray)orderedKeys;
- (NSMutableDictionary)sleepData;
- (id)_durationFormatter;
- (id)_sleepDataDictionaryFromSamples:(id)a3;
- (id)_sleepSampleBucketAtIndex:(unint64_t)a3 section:(unint64_t)a4;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
- (unint64_t)numberOfObjectsForSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_callUpdateHandler;
- (void)deleteAllData;
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5;
@end

@implementation WDSleepStageListDataProvider

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)_callUpdateHandler
{
  v3 = [(WDSampleListDataProvider *)self samples];
  v4 = [v3 allSamples];

  v5 = [(WDSleepStageListDataProvider *)self _sleepDataDictionaryFromSamples:v4];
  v6 = [(NSMutableDictionary *)v5 allKeys];
  v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_8];

  sleepData = self->_sleepData;
  self->_sleepData = v5;
  v9 = v5;

  v10 = (NSMutableArray *)[v7 mutableCopy];
  orderedKeys = self->_orderedKeys;
  self->_orderedKeys = v10;

  v12.receiver = self;
  v12.super_class = (Class)WDSleepStageListDataProvider;
  [(WDSampleListDataProvider *)&v12 _callUpdateHandler];
}

uint64_t __50__WDSleepStageListDataProvider__callUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_sleepDataDictionaryFromSamples:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    p_superclass = WDRemoteFeatureAvailabilityInternalSettingsViewController.superclass;
    v22 = v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v11 = objc_msgSend(p_superclass + 59, "sleep_timePeriodForSample:", v10, v22);
        objc_super v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12)
        {
          objc_super v12 = [MEMORY[0x263EFF980] array];
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v26[0] = __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke;
        v26[1] = &unk_26458E978;
        v26[2] = v10;
        objc_msgSend(v12, "hk_firstObjectPassingTest:", v25);
        v13 = (WDSleepStageSampleBucket *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v24 = [WDSleepStageSampleBucket alloc];
          v14 = v4;
          uint64_t v15 = v7;
          uint64_t v16 = [v10 value];
          v17 = [v10 sourceRevision];
          [v10 device];
          v19 = uint64_t v18 = v6;
          uint64_t v20 = v16;
          uint64_t v7 = v15;
          id v4 = v14;
          v13 = [(WDSleepStageSampleBucket *)v24 initWithSleepStage:v20 timePeriod:v11 sourceRevision:v17 device:v19];

          uint64_t v6 = v18;
          p_superclass = (__objc2_class **)(WDRemoteFeatureAvailabilityInternalSettingsViewController + 8);

          [v12 addObject:v13];
        }
        [(WDSleepStageSampleBucket *)v13 addSample:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_285];

  return v4;
}

uint64_t __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleep_belongsInBucket:", a2);
}

uint64_t __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 sortUsingComparator:&__block_literal_global_288];
}

uint64_t __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 sortNumber];
  if (v6 >= [v5 sortNumber])
  {
    unint64_t v8 = [v4 sortNumber];
    uint64_t v7 = v8 > [v5 sortNumber];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (int64_t)cellStyle
{
  return 1;
}

- (unint64_t)numberOfSections
{
  return [(NSMutableArray *)self->_orderedKeys count];
}

- (id)titleForSection:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_orderedKeys count])
  {
    id v5 = [(NSMutableArray *)self->_orderedKeys objectAtIndexedSubscript:a3];
    objc_msgSend(v5, "sleep_titleString");
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v6 = &stru_26D2EA890;
  }

  return v6;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_orderedKeys objectAtIndexedSubscript:a3];
  id v5 = [(NSMutableDictionary *)self->_sleepData objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

- (id)_sleepSampleBucketAtIndex:(unint64_t)a3 section:(unint64_t)a4
{
  unint64_t v6 = [(NSMutableArray *)self->_orderedKeys objectAtIndexedSubscript:a4];
  uint64_t v7 = [(NSMutableDictionary *)self->_sleepData objectForKeyedSubscript:v6];
  unint64_t v8 = [v7 objectAtIndexedSubscript:a3];

  return v8;
}

- (id)_durationFormatter
{
  if (_durationFormatter_onceToken_0 != -1) {
    dispatch_once(&_durationFormatter_onceToken_0, &__block_literal_global_294);
  }
  v2 = (void *)_durationFormatter_formatter_0;

  return v2;
}

uint64_t __50__WDSleepStageListDataProvider__durationFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)_durationFormatter_formatter_0;
  _durationFormatter_formatter_0 = (uint64_t)v0;

  [(id)_durationFormatter_formatter_0 setUnitsStyle:5];
  v2 = (void *)_durationFormatter_formatter_0;

  return [v2 setAllowedUnits:96];
}

- (id)textForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(WDSleepStageListDataProvider *)self _durationFormatter];
  [v4 totalDuration];
  unint64_t v6 = objc_msgSend(v5, "stringFromTimeInterval:");

  uint64_t v7 = NSString;
  unint64_t v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"INTERVALS_OF_TIME_NUMBERED_UNIT" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  uint64_t v10 = [v4 numberOfSamples];

  v11 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);

  objc_super v12 = NSString;
  v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"SLEEP_DATA_INTERVALS_FORMAT" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Acacia"];
  uint64_t v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v11, v6);

  return v15;
}

- (id)secondaryTextForObject:(id)a3
{
  switch([a3 sleepStage])
  {
    case 1:
      id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v3;
      id v5 = @"ASLEEP_UNSPECIFIED";
      goto LABEL_9;
    case 2:
      id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v3;
      id v5 = @"AWAKE";
      goto LABEL_5;
    case 3:
      id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v3;
      id v5 = @"ASLEEP_CORE";
      goto LABEL_9;
    case 4:
      id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v3;
      id v5 = @"ASLEEP_DEEP";
      goto LABEL_9;
    case 5:
      id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v3;
      id v5 = @"ASLEEP_REM";
LABEL_9:
      unint64_t v6 = @"HealthUI-Localizable-Acacia";
      break;
    default:
      id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v3;
      id v5 = @"IN_BED";
LABEL_5:
      unint64_t v6 = @"HealthUI-Localizable";
      break;
  }
  uint64_t v7 = [v3 localizedStringForKey:v5 value:&stru_26D2EA890 table:v6];

  return v7;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v18 = [(NSMutableArray *)self->_orderedKeys objectAtIndexedSubscript:a4];
  uint64_t v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sleepData, "objectForKeyedSubscript:");
  unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = [v8 samples];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [(WDSampleListDataProvider *)self samples];
        [v15 removeSample:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [v7 removeObjectAtIndex:a3];
  if ([v7 count])
  {
    BOOL v16 = 0;
  }
  else
  {
    [(NSMutableArray *)self->_orderedKeys removeObjectAtIndex:a4];
    BOOL v16 = 1;
  }
  *a5 = v16;
}

- (void)deleteAllData
{
  v7.receiver = self;
  v7.super_class = (Class)WDSleepStageListDataProvider;
  [(WDSampleListDataProvider *)&v7 deleteAllData];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  sleepData = self->_sleepData;
  self->_sleepData = v3;

  id v5 = [MEMORY[0x263EFF980] array];
  orderedKeys = self->_orderedKeys;
  self->_orderedKeys = v5;
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 row];
  uint64_t v14 = [v12 section];

  id v16 = [(WDSleepStageListDataProvider *)self _sleepSampleBucketAtIndex:v13 section:v14];
  uint64_t v15 = [v16 samples];
  [v11 deleteObjects:v15 options:a5 withCompletion:v10];
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [WDSleepStageCategoryDataProvider alloc];
  unint64_t v6 = [(WDSampleListDataProvider *)self displayType];
  objc_super v7 = [(WDSampleListDataProvider *)self profile];
  unint64_t v8 = [(WDSampleListDataProvider *)v5 initWithDisplayType:v6 profile:v7];

  uint64_t v9 = [v4 row];
  uint64_t v10 = [v4 section];

  id v11 = [(WDSleepStageListDataProvider *)self _sleepSampleBucketAtIndex:v9 section:v10];
  id v12 = [v11 predicate];
  [(WDSampleListDataProvider *)v8 setDefaultQueryPredicate:v12];

  uint64_t v13 = [WDDataListViewController alloc];
  uint64_t v14 = [(WDSampleListDataProvider *)self displayType];
  uint64_t v15 = [(WDSampleListDataProvider *)self profile];
  id v16 = [(WDDataListViewController *)v13 initWithDisplayType:v14 profile:v15 dataProvider:v8 usingInsetStyling:1];

  return v16;
}

- (NSMutableDictionary)sleepData
{
  return self->_sleepData;
}

- (NSMutableArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);

  objc_storeStrong((id *)&self->_sleepData, 0);
}

@end