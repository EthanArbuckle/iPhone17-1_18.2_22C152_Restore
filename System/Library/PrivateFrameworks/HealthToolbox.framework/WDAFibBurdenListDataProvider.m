@interface WDAFibBurdenListDataProvider
- (WDAFibBurdenListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)_generateFeatureVersionFromUpdateVersion:(id)a3;
- (id)_timeZoneForSample:(id)a3;
- (id)featureVersionForSample:(id)a3;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)updateVersionForSample:(id)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
@end

@implementation WDAFibBurdenListDataProvider

- (WDAFibBurdenListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WDAFibBurdenListDataProvider;
  v4 = [(WDQuantityListDataProvider *)&v8 initWithDisplayType:a3 profile:a4];
  if (v4)
  {
    v5 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x263F0A130]);
    calendarCache = v4->_calendarCache;
    v4->_calendarCache = v5;
  }
  return v4;
}

- (id)textForObject:(id)a3
{
  id v4 = a3;
  v5 = [(WDSampleListDataProvider *)self displayType];
  v6 = [(WDSampleListDataProvider *)self unitController];
  v7 = [v6 unitForDisplayType:v5];

  objc_super v8 = [v4 quantity];
  [v8 doubleValueForUnit:v7];
  double v10 = v9;

  v11 = [v5 presentation];
  v12 = [NSNumber numberWithDouble:v10];
  v13 = [v11 adjustedValueForDaemonValue:v12];

  v14 = [v4 metadata];

  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F09AC8]];
  LODWORD(v12) = [v15 BOOLValue];

  if (v12)
  {
    v16 = HKAFibBurdenClampedLowerBoundLocalizedString();
  }
  else
  {
    v17 = objc_msgSend(v5, "hk_valueFormatterForUnit:", v7);
    v18 = [(WDSampleListDataProvider *)self unitController];
    v16 = [v17 stringFromValue:v13 displayType:v5 unitController:v18];
  }

  return v16;
}

- (id)secondaryTextForObject:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08798];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 startDate];
  objc_super v8 = [v5 endDate];
  double v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];

  double v10 = [v5 _timeZone];

  v11 = [(HKCalendarCache *)self->_calendarCache calendarForTimeZone:v10];
  v12 = (void *)MEMORY[0x263F08798];
  v13 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  v14 = objc_msgSend(v12, "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v9, v11, v13);

  if (v14)
  {
    v15 = objc_msgSend(MEMORY[0x263F087A8], "hk_mediumDateStyleIntervalFormatter");
    v16 = [v15 stringFromDateInterval:v14];
  }
  else
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_FAULT)) {
      -[WDAFibBurdenListDataProvider secondaryTextForObject:](v17);
    }
    v16 = 0;
  }

  return v16;
}

- (id)_timeZoneForSample:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _timeZoneName];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA18]);
    id v6 = [v3 _timeZoneName];
    v7 = (void *)[v5 initWithName:v6];
  }
  else
  {
    v7 = [MEMORY[0x263EFFA18] localTimeZone];
  }

  return v7;
}

- (id)titleForSection:(unint64_t)a3
{
  id v4 = [(WDSampleListDataProvider *)self samples];
  uint64_t v5 = [v4 count];

  if (v5 < 1)
  {
    double v9 = 0;
  }
  else
  {
    id v6 = [(WDSampleListDataProvider *)self displayType];
    v7 = [v6 localization];
    objc_super v8 = [v7 displayName];
    double v9 = [v8 localizedUppercaseString];
  }

  return v9;
}

- (id)updateVersionForSample:(id)a3
{
  id v3 = [a3 metadata];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F0AB68]];

  return v4;
}

- (id)featureVersionForSample:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F09A08]];

  if (v6)
  {
    v7 = [v6 stringValue];
  }
  else
  {
    objc_super v8 = [v4 metadata];
    double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F0AB68]];

    if (v9)
    {
      v7 = [(WDAFibBurdenListDataProvider *)self _generateFeatureVersionFromUpdateVersion:v9];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_generateFeatureVersionFromUpdateVersion:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  v7 = [(WDSampleListDataProvider *)self objectAtIndex:v5 forSection:v6];
  id v8 = objc_alloc(MEMORY[0x263F466C8]);
  double v9 = [(WDSampleListDataProvider *)self profileName];
  double v10 = (void *)[v8 initWithSample:v7 usingInsetStyling:1 profileName:v9 regulatedFeatureInfoProvider:self delegate:self];

  return v10;
}

- (void).cxx_destruct
{
}

- (void)secondaryTextForObject:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2210D2000, log, OS_LOG_TYPE_FAULT, "AFibBurden sample with instantaneous duration detected", v1, 2u);
}

@end