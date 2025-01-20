@interface HKOverlayRoomSleepDurationStackedContext
- (HKOverlayRoomSleepDurationStackedContext)initWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5 primaryDisplayType:(id)a6 uniqueIdentifier:(id)a7 firstWeekdayOverride:(id)a8 currentCalendarOverride:(id)a9 isInfoButtonHidden:(BOOL)a10;
- (HKOverlayRoomSleepDurationStackedContext)initWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5 primarySampleType:(id)a6 uniqueIdentifier:(id)a7 firstWeekdayOverride:(id)a8 currentCalendarOverride:(id)a9 isInfoButtonHidden:(BOOL)a10;
- (NSNumber)firstWeekdayOverride;
- (NSString)uniqueIdentifier;
- (id)_generateNamedDataSourceWithTemplateDisplayType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5;
- (id)_generateSleepDurationStackedDisplayTypeWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5;
- (id)_generateSleepSeriesWithTemplateDisplayType:(id)a3 applicationItems:(id)a4;
- (void)setFirstWeekdayOverride:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation HKOverlayRoomSleepDurationStackedContext

- (HKOverlayRoomSleepDurationStackedContext)initWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5 primaryDisplayType:(id)a6 uniqueIdentifier:(id)a7 firstWeekdayOverride:(id)a8 currentCalendarOverride:(id)a9 isInfoButtonHidden:(BOOL)a10
{
  v16 = (NSString *)a7;
  v17 = (NSNumber *)a8;
  id v18 = a9;
  id v19 = a6;
  id v20 = a4;
  id v21 = a3;
  v22 = [(HKOverlayRoomSleepDurationStackedContext *)self _generateSleepDurationStackedDisplayTypeWithApplicationItems:v21 overlayChartController:v20 sleepChartFormatter:a5];
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v16;
  v24 = v16;

  firstWeekdayOverride = self->_firstWeekdayOverride;
  self->_firstWeekdayOverride = v17;
  v26 = v17;

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomSleepDurationStackedContext;
  v27 = [(HKOverlayRoomStackedContext *)&v30 initWithDisplayType:v19 overlayDisplayType:0 stackedDisplayType:v22 overlayChartController:v20 currentCalendarOverride:v18 applicationItems:v21 isInfoButtonHidden:a10];

  return v27;
}

- (HKOverlayRoomSleepDurationStackedContext)initWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5 primarySampleType:(id)a6 uniqueIdentifier:(id)a7 firstWeekdayOverride:(id)a8 currentCalendarOverride:(id)a9 isInfoButtonHidden:(BOOL)a10
{
  v16 = (NSString *)a7;
  v17 = (NSNumber *)a8;
  id v18 = a9;
  id v19 = a6;
  id v20 = a4;
  id v21 = a3;
  v22 = [(HKOverlayRoomSleepDurationStackedContext *)self _generateSleepDurationStackedDisplayTypeWithApplicationItems:v21 overlayChartController:v20 sleepChartFormatter:a5];
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v16;
  v24 = v16;

  firstWeekdayOverride = self->_firstWeekdayOverride;
  self->_firstWeekdayOverride = v17;
  v26 = v17;

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomSleepDurationStackedContext;
  v27 = [(HKOverlayRoomStackedContext *)&v30 initWithSampleType:v19 overlayDisplayType:0 stackedDisplayType:v22 overlayChartController:v20 currentCalendarOverride:v18 applicationItems:v21 isInfoButtonHidden:a10];

  return v27;
}

- (id)_generateSleepDurationStackedDisplayTypeWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 displayTypeController];
  v12 = [v11 displayTypeWithIdentifier:&unk_1F3C21F40];

  v13 = [(HKOverlayRoomSleepDurationStackedContext *)self _generateSleepSeriesWithTemplateDisplayType:v12 applicationItems:v10];
  v14 = [(HKOverlayRoomSleepDurationStackedContext *)self _generateNamedDataSourceWithTemplateDisplayType:v12 overlayChartController:v9 applicationItems:v10];

  v15 = [HKInteractiveChartDisplayType alloc];
  v16 = [v12 sampleType];
  v17 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v15, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v12, v8, [v16 code]);

  id v18 = [v9 displayTypeForGraphSeries:v13 namedDataSource:v14 templateDisplayType:v17 timeScope:3 formatter:v8];

  return v18;
}

- (id)_generateSleepSeriesWithTemplateDisplayType:(id)a3 applicationItems:(id)a4
{
  id v5 = a3;
  v6 = [a4 unitController];
  v7 = +[HKOverlayContextUtilities stackedAxisConfiguration];
  id v8 = +[HKSleepUtilities buildSleepGraphSeriesForSleepSeriesType:0 sleepDisplayType:v5 unitController:v6 numericAxisConfigurationOverrides:v7 timeScope:3];

  id v9 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C21F58 maxValue:&unk_1F3C21F70];
  id v10 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C21F58 maxValue:&unk_1F3C21F88];
  v11 = +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:v9 axisBoundsOverrides:0];
  [v11 setNoDataAxisBounds:v10];
  [v8 setAxisScalingRule:v11];
  v12 = [v5 localization];

  v13 = [v12 shortenedDisplayName];
  +[HKOverlayContextUtilities setStackedSeriesLegend:v8 title:v13];

  return v8;
}

- (id)_generateNamedDataSourceWithTemplateDisplayType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F1C9A8];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_msgSend(v7, "hk_gregorianCalendar");
  v11 = [(HKOverlayRoomSleepDurationStackedContext *)self firstWeekdayOverride];

  if (v11)
  {
    v12 = [(HKOverlayRoomSleepDurationStackedContext *)self firstWeekdayOverride];
    objc_msgSend(v10, "setFirstWeekday:", objc_msgSend(v12, "integerValue"));
  }
  v13 = NSString;
  v14 = [(HKOverlayRoomSleepDurationStackedContext *)self uniqueIdentifier];
  v15 = [(HKOverlayRoomSleepDurationStackedContext *)self firstWeekdayOverride];
  if (v15)
  {
    v16 = [(HKOverlayRoomSleepDurationStackedContext *)self firstWeekdayOverride];
    v17 = [v16 stringValue];
    id v18 = [v13 stringWithFormat:@"%@%@", v14, v17];
  }
  else
  {
    id v18 = [v13 stringWithFormat:@"%@%@", v14, &stru_1F3B9CF20];
  }

  id v19 = [NSString stringWithFormat:@"HKSleepQueryCacheIdentifier%@", v18];
  id v20 = [NSString stringWithFormat:@"HKSleepQueryIdentifier%@", v18];
  id v21 = [NSString stringWithFormat:@"HKOverlayRoomStackedContextSleepDuration%@", v18];
  v22 = [HKSleepChartDataSource alloc];
  v23 = [v8 healthStore];

  v24 = [(HKSleepChartDataSource *)v22 initWithHealthStore:v23 representativeDisplayType:v9 queryOptions:2 cacheIdentifier:v19 queryIdentifier:v20 calendar:v10];
  v25 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v24 named:v21 withContextTitleForTimeScope:0];

  return v25;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSNumber)firstWeekdayOverride
{
  return self->_firstWeekdayOverride;
}

- (void)setFirstWeekdayOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstWeekdayOverride, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end