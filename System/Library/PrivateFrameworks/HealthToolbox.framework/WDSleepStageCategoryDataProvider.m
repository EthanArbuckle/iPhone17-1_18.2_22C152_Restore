@interface WDSleepStageCategoryDataProvider
- (id)_anySample;
- (id)_durationFormatter;
- (id)_sleepSampleAtIndex:(unint64_t)a3 section:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
- (unint64_t)numberOfObjectsForSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5;
@end

@implementation WDSleepStageCategoryDataProvider

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (int64_t)cellStyle
{
  return 0;
}

- (unint64_t)numberOfSections
{
  v2 = [(WDSampleListDataProvider *)self samples];
  unint64_t v3 = [v2 count] > 0;

  return v3;
}

- (id)_anySample
{
  v2 = [(WDSampleListDataProvider *)self samples];
  unint64_t v3 = [v2 allSamples];
  v4 = [v3 firstObject];

  return v4;
}

- (id)titleForSection:(unint64_t)a3
{
  unint64_t v3 = [(WDSleepStageCategoryDataProvider *)self _anySample];
  if (v3)
  {
    v4 = +[WDTimePeriod sleep_timePeriodForSample:v3];
    v5 = objc_msgSend(v4, "sleep_titleString");
    switch([v3 value])
    {
      case 1:
        v6 = NSString;
        v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v8 = v7;
        v9 = @"ASLEEP_UNSPECIFIED_INTERVALS";
        break;
      case 2:
        v6 = NSString;
        v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v8 = v7;
        v9 = @"AWAKE_INTERVALS";
        break;
      case 3:
        v6 = NSString;
        v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v8 = v7;
        v9 = @"ASLEEP_CORE_INTERVALS";
        break;
      case 4:
        v6 = NSString;
        v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v8 = v7;
        v9 = @"ASLEEP_DEEP_INTERVALS";
        break;
      case 5:
        v6 = NSString;
        v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v8 = v7;
        v9 = @"ASLEEP_REM_INTERVALS";
        break;
      default:
        v6 = NSString;
        v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v8 = v7;
        v9 = @"IN_BED_INTERVALS";
        break;
    }
    v11 = [v7 localizedStringForKey:v9 value:&stru_26D2EA890 table:@"HealthUI-Localizable-Acacia"];
    v10 = objc_msgSend(v6, "stringWithFormat:", v11, v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  unint64_t v3 = [(WDSampleListDataProvider *)self samples];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)_sleepSampleAtIndex:(unint64_t)a3 section:(unint64_t)a4
{
  v5 = [(WDSampleListDataProvider *)self samples];
  v6 = [v5 allSamples];
  v7 = [v6 objectAtIndexedSubscript:a3];

  return v7;
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  unint64_t v4 = [(WDSleepStageCategoryDataProvider *)self _sleepSampleAtIndex:a3 section:a4];
  v5 = [[_WDSleepStageSampleObject alloc] initWithSample:v4];

  return v5;
}

- (id)_durationFormatter
{
  if (_durationFormatter_onceToken != -1) {
    dispatch_once(&_durationFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_durationFormatter_formatter;

  return v2;
}

uint64_t __54__WDSleepStageCategoryDataProvider__durationFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)_durationFormatter_formatter;
  _durationFormatter_formatter = (uint64_t)v0;

  [(id)_durationFormatter_formatter setUnitsStyle:5];
  v2 = (void *)_durationFormatter_formatter;

  return [v2 setAllowedUnits:96];
}

- (id)textForObject:(id)a3
{
  unint64_t v4 = [a3 dateInterval];
  [v4 duration];
  double v6 = v5;

  v7 = [(WDSleepStageCategoryDataProvider *)self _durationFormatter];
  v8 = [v7 stringFromTimeInterval:v6];

  return v8;
}

- (id)secondaryTextForObject:(id)a3
{
  unint64_t v3 = [a3 dateInterval];
  unint64_t v4 = HKTimeFormatter();
  double v5 = [v3 startDate];
  double v6 = [v4 stringFromDate:v5];

  v7 = HKTimeFormatter();
  v8 = [v3 endDate];
  v9 = [v7 stringFromDate:v8];

  v10 = NSString;
  v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v12 = [v11 localizedStringForKey:@"SLEEP_DATA_TIME_RANGE_FORMAT" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Acacia"];
  v13 = objc_msgSend(v10, "stringWithFormat:", v12, v6, v9);

  return v13;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  id v9 = [(WDSleepStageCategoryDataProvider *)self _sleepSampleAtIndex:a3 section:a4];
  v7 = [(WDSampleListDataProvider *)self samples];
  [v7 removeSample:v9];

  v8 = [(WDSampleListDataProvider *)self samples];
  *a5 = [v8 count] == 0;
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 row];
  uint64_t v14 = [v12 section];

  v15 = [(WDSleepStageCategoryDataProvider *)self _sleepSampleAtIndex:v13 section:v14];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __92__WDSleepStageCategoryDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
  v17[3] = &unk_26458E5C8;
  id v18 = v10;
  id v16 = v10;
  [v15 deleteObjectWithHealthStore:v11 options:a5 completion:v17];
}

uint64_t __92__WDSleepStageCategoryDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  v7 = [(WDSleepStageCategoryDataProvider *)self _sleepSampleAtIndex:v5 section:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x263F466C8]) initWithSample:v7 usingInsetStyling:1 profileName:0 delegate:self];

  return v8;
}

@end