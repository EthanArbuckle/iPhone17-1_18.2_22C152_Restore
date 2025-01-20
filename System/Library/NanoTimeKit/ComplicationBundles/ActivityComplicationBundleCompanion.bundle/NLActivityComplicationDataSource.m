@interface NLActivityComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)appIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
+ (id)widgetExtensionBundleIdentifier;
+ (id)widgetKindForFamily:(int64_t)a3;
- (NLActivityComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_activityStatisticsForData:(id)a3 unit:(id)a4;
- (id)_activityStatisticsForStandHours:(id)a3;
- (id)_timelineEntryFromModel:(id)a3 family:(int64_t)a4;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (id)sampleTemplate;
- (void)activityDataProviderCurrentDataModelUpdated:(id)a3;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation NLActivityComplicationDataSource

+ (id)legacyNTKComplicationType
{
  return &off_110C8;
}

+ (id)appIdentifier
{
  return @"com.apple.ActivityMonitorApp";
}

+ (id)widgetExtensionBundleIdentifier
{
  return @"com.apple.ActivityMonitorApp.ActivityComplication";
}

+ (id)widgetKindForFamily:(int64_t)a3
{
  CFStringRef v3 = @"ActivityRingsComplication";
  if (a3 == 3) {
    CFStringRef v3 = @"ActivityComplication";
  }
  if (a3 == 11) {
    return @"ActivityGraphComplication";
  }
  else {
    return (id)v3;
  }
}

+ (id)localizedAppName
{
  return (id)_NTKComplicationTypeLocalizedLabelTextFromTypeKey(@"WELLNESS", a2);
}

- (NLActivityComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  v10 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEBUG)) {
    sub_9948(v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)NLActivityComplicationDataSource;
  v11 = [(NLActivityComplicationDataSource *)&v14 initWithComplication:v8 family:a4 forDevice:v9];
  if (v11)
  {
    v12 = +[FIUIActivityDataProvider sharedModel];
    [v12 addSubscriber:v11];
  }
  return v11;
}

- (void)dealloc
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEBUG)) {
    sub_998C(v3);
  }
  v4 = +[FIUIActivityDataProvider sharedModel];
  [v4 removeSubscriber:self];

  v5.receiver = self;
  v5.super_class = (Class)NLActivityComplicationDataSource;
  [(NLActivityComplicationDataSource *)&v5 dealloc];
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  v6 = (void (**)(id, id))a5;
  _HKInitializeLogging();
  v7 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    objc_super v14 = "-[NLActivityComplicationDataSource fetchWidgetMigrationForDescriptor:family:completion:]";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }
  id v8 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
  id v9 = +[NLActivityComplicationDataSource widgetExtensionBundleIdentifier];
  v10 = +[NLActivityComplicationDataSource appIdentifier];
  v11 = +[NLActivityComplicationDataSource widgetKindForFamily:a4];
  id v12 = [v8 initWithExtensionBundleIdentifier:v9 containerBundleIdentifier:v10 kind:v11 intent:0];

  v6[2](v6, v12);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v4 = a4;
  _HKInitializeLogging();
  objc_super v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "+[NLActivityComplicationDataSource hasMigratedToWidgetForFamily:device:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"8DD39CF2-0515-442A-99FD-06F9AAA59249"];
  unsigned __int8 v7 = [v4 supportsCapability:v6];

  return v7;
}

- (void)activityDataProviderCurrentDataModelUpdated:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received updated current activity data model: %@, appending to timeline entries", buf, 0xCu);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_636C;
  v7[3] = &unk_10600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 7;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (unint64_t)a3 < 0xD && ((0x1F9Fu >> a3) & 1) != 0 || CLKComplicationFamilyCircularMedium == a3;
}

- (id)currentSwitcherTemplate
{
  return [(NLActivityComplicationDataSource *)self sampleTemplate];
}

- (id)sampleTemplate
{
  CFStringRef v3 = objc_opt_new();
  id v4 = +[HKUnit kilocalorieUnit];
  objc_super v5 = +[HKQuantity quantityWithUnit:v4 doubleValue:500.0];
  [v3 setActiveEnergyGoal:v5];

  id v6 = [v3 activeEnergyGoal];
  [v3 setActiveEnergyTotal:v6];

  [v3 setAppleStandHoursGoal:12];
  objc_msgSend(v3, "setAppleStandHoursTotal:", objc_msgSend(v3, "appleStandHoursGoal"));
  [v3 setAppleExerciseTimeGoal:30.0];
  [v3 appleExerciseTimeGoal];
  objc_msgSend(v3, "setAppleExerciseTimeTotal:");
  if ([(NLActivityComplicationDataSource *)self family] == (char *)&dword_8 + 3)
  {
    unsigned __int8 v7 = +[HKUnit kilocalorieUnit];
    id v8 = +[HKQuantity quantityWithUnit:v7 doubleValue:345.0];
    [v3 setActiveEnergyTotal:v8];

    [v3 setAppleStandHoursTotal:10];
    [v3 setAppleExerciseTimeTotal:43.0];
    int v9 = +[HKUnit kilocalorieUnit];
    id v10 = [(NLActivityComplicationDataSource *)self _activityStatisticsForData:&off_11548 unit:v9];

    v11 = +[HKUnit minuteUnit];
    id v12 = [(NLActivityComplicationDataSource *)self _activityStatisticsForData:&off_11560 unit:v11];

    int v13 = [(NLActivityComplicationDataSource *)self _activityStatisticsForStandHours:&off_11578];
    [v3 setActiveEnergyChartData:v10];
    [v3 setAppleExerciseTimeChartData:v12];
    [v3 setAppleStandHourChartData:v13];
  }
  objc_super v14 = [(NLActivityComplicationDataSource *)self _timelineEntryFromModel:v3 family:[(NLActivityComplicationDataSource *)self family]];
  v15 = [v14 complicationTemplate];

  return v15;
}

- (id)_activityStatisticsForData:(id)a3 unit:(id)a4
{
  id v5 = a3;
  id v27 = a4;
  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v6 = +[NSCalendar currentCalendar];
  unsigned __int8 v7 = +[NSDate date];
  v25 = v6;
  id v8 = [v6 startOfDayForDate:v7];

  id v9 = v8;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  v11 = v9;
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v29;
    uint64_t v14 = 1;
    v11 = v9;
    do
    {
      v15 = 0;
      uint64_t v23 = v14;
      uint64_t v16 = 30 * v14;
      v17 = v11;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v15);
        v11 = [v25 dateByAddingUnit:64 value:v16 toDate:v9 options:0];
        id v19 = [objc_alloc((Class)_HKActivityStatisticsQuantityInfo) initWithStartDate:v17 endDate:v11];
        [v18 doubleValue];
        v20 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v27);
        [v19 setQuantityValue:v20];
        [v26 addObject:v19];

        v15 = (char *)v15 + 1;
        v16 += 30;
        v17 = v11;
      }
      while (v12 != v15);
      id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v14 = (uint64_t)v15 + v23;
    }
    while (v12);
  }

  id v21 = [v26 copy];

  return v21;
}

- (id)_activityStatisticsForStandHours:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[NSCalendar currentCalendar];
  id v6 = +[NSDate date];
  unsigned __int8 v7 = [v5 startOfDayForDate:v6];

  id v8 = v7;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  v11 = v8;
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v24;
    uint64_t v14 = 1;
    v11 = v8;
    do
    {
      v15 = 0;
      uint64_t v16 = v11;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        unsigned int v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v15), "intValue", (void)v23);
        [v16 timeIntervalSinceReferenceDate];
        if (v17 == 1)
        {
          uint64_t v19 = 0;
        }
        else
        {
          if (v17 != 2) {
            goto LABEL_11;
          }
          uint64_t v19 = 1;
        }
        id v20 = [objc_alloc((Class)_HKActivityStatisticsStandHourInfo) initWithTimeStamp:v19 state:v18];
        [v4 addObject:v20];

LABEL_11:
        v11 = [v5 dateByAddingUnit:32 value:(char *)v15 + v14 toDate:v8 options:0];

        v15 = (char *)v15 + 1;
        uint64_t v16 = v11;
      }
      while (v12 != v15);
      id v12 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      v14 += (uint64_t)v15;
    }
    while (v12);
  }

  id v21 = [v4 copy];

  return v21;
}

- (id)lockedTemplate
{
  _HKInitializeLogging();
  id v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Returning locked template for activity complication", v8, 2u);
  }
  id v4 = +[FIUIActivityDataModel lockedModel];
  id v5 = [(NLActivityComplicationDataSource *)self _timelineEntryFromModel:v4 family:[(NLActivityComplicationDataSource *)self family]];
  id v6 = [v5 complicationTemplate];

  return v6;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Datasource asking for current timeline entry", buf, 2u);
  }
  id v6 = +[FIUIActivityDataProvider sharedModel];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6D18;
  v8[3] = &unk_10628;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getCurrentActivityDataModelWithHandler:v8];
}

- (id)_timelineEntryFromModel:(id)a3 family:(int64_t)a4
{
  id v5 = a3;
  id v6 = [[NLActivityTimelineEntryModel alloc] initWithDataModel:v5];

  id v7 = [(NLActivityTimelineEntryModel *)v6 entryForComplicationFamily:a4];

  return v7;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v6 = a5;
  id v7 = +[NSURL URLWithString:@"ActivityMonitorApp://"];
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

@end