@interface ATXModeFaceComplicationHeuristicDataSource
- (ATXModeFaceComplicationHeuristicDataSource)init;
- (BOOL)_hasSignificantHomeAccessoryEvents;
- (BOOL)_hasSignificantRemindersEvents;
- (BOOL)_hasSignificantStocksEvents;
- (BOOL)_hasTVInterest;
- (id)_complicationsForDrivingMode;
- (id)_complicationsForExerciseMode;
- (id)_complicationsForGamingMode;
- (id)_complicationsForMindfulnessMode;
- (id)_complicationsForPersonalMode;
- (id)_complicationsForReadingMode;
- (id)_complicationsForReduceInterruptions;
- (id)_complicationsForSleepMode;
- (id)_complicationsForWorkMode;
- (id)_landscapeComplicationsForDrivingMode;
- (id)_landscapeComplicationsForExerciseMode;
- (id)_landscapeComplicationsForGamingMode;
- (id)_landscapeComplicationsForMindfulnessMode;
- (id)_landscapeComplicationsForPersonalMode;
- (id)_landscapeComplicationsForReadingMode;
- (id)_landscapeComplicationsForReduceInterruptions;
- (id)_landscapeComplicationsForSleepMode;
- (id)_landscapeComplicationsForWorkMode;
- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
- (void)_addComplicationWithFamily:(int64_t)a3 extension:(id)a4 kind:(id)a5 container:(id)a6 score:(double)a7 to:(id)a8;
- (void)_addSystemSmallWidgetWithExtension:(id)a3 kind:(id)a4 container:(id)a5 score:(double)a6 to:(id)a7;
- (void)init;
@end

@implementation ATXModeFaceComplicationHeuristicDataSource

- (ATXModeFaceComplicationHeuristicDataSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXModeFaceComplicationHeuristicDataSource;
  v2 = [(ATXModeFaceComplicationHeuristicDataSource *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4B430] sharedInstance];
    uint64_t v4 = [v3 complicationWidgetDescriptors];
    allComplicationDescriptors = v2->_allComplicationDescriptors;
    v2->_allComplicationDescriptors = (NSSet *)v4;

    v6 = [MEMORY[0x1E4F4B430] sharedInstance];
    uint64_t v7 = [v6 homeScreenDescriptors];
    allWidgetDescriptors = v2->_allWidgetDescriptors;
    v2->_allWidgetDescriptors = (NSSet *)v7;

    uint64_t v9 = objc_opt_new();
    suggestedPagesTunableConstants = v2->_suggestedPagesTunableConstants;
    v2->_suggestedPagesTunableConstants = (ATXSuggestedPagesTunableConstants *)v9;

    if (![(NSSet *)v2->_allComplicationDescriptors count])
    {
      v11 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[ATXModeFaceComplicationHeuristicDataSource init](v11);
      }
    }
  }
  return v2;
}

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      break;
    case 3:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForSleepMode];
      goto LABEL_14;
    case 4:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForDrivingMode];
      goto LABEL_14;
    case 5:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForExerciseMode];
      goto LABEL_14;
    case 6:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForWorkMode];
      goto LABEL_14;
    case 7:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForPersonalMode];
      goto LABEL_14;
    case 8:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForReadingMode];
      goto LABEL_14;
    case 9:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForGamingMode];
      goto LABEL_14;
    case 10:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForMindfulnessMode];
      goto LABEL_14;
    case 11:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _complicationsForReduceInterruptions];
LABEL_14:
      uint64_t v7 = (void *)v8;
      break;
    default:
      uint64_t v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[ATXModeFaceComplicationHeuristicDataSource provideComplicationsForSuggestedFaceType:environment:]();
      }

      uint64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)_complicationsForSleepMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_complicationsForDrivingMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_complicationsForExerciseMode
{
  v3 = objc_opt_new();
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Fitness.FitnessWidget" kind:@"com.apple.Fitness.Complication" container:@"com.apple.Fitness" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.Fitness.FitnessWidget" kind:@"com.apple.Fitness.Complication" container:@"com.apple.Fitness" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:12 extension:@"com.apple.Fitness.FitnessWidget" kind:@"com.apple.Fitness.Complication" container:@"com.apple.Fitness" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.conditions" container:@"com.apple.weather" score:v3 to:0.6];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.temperature" container:@"com.apple.weather" score:v3 to:0.6];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.Batteries.BatteriesWidget" kind:@"com.apple.Batteries.complication" container:@"com.apple.Batteries" score:v3 to:0.4];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Batteries.BatteriesWidget" kind:@"com.apple.Batteries.complication" container:@"com.apple.Batteries" score:v3 to:0.4];
  return v3;
}

- (id)_complicationsForWorkMode
{
  v3 = objc_opt_new();
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:12 extension:@"com.apple.mobilecal.CalendarWidgetExtension" kind:@"com.apple.CalendarWidget.CalendarNextEventComplication" container:@"com.apple.mobilecal" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.mobilecal.CalendarWidgetExtension" kind:@"com.apple.CalendarWidget.CalendarNextEventComplication" container:@"com.apple.mobilecal" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.mobilecal.CalendarWidgetExtension" kind:@"com.apple.CalendarWidget.CalendarNextEventComplication" container:@"com.apple.mobilecal" score:v3 to:0.8];
  if ([(ATXModeFaceComplicationHeuristicDataSource *)self _hasSignificantRemindersEvents])
  {
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:12 extension:@"com.apple.reminders.WidgetExtension" kind:@"com.apple.reminders.widget.today" container:@"com.apple.reminders" score:v3 to:0.8];
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.reminders.WidgetExtension" kind:@"com.apple.reminders.widget" container:@"com.apple.reminders" score:v3 to:0.8];
  }
  if ([(ATXModeFaceComplicationHeuristicDataSource *)self _hasSignificantStocksEvents]) {
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.stocks.widget" kind:@"overview" container:@"com.apple.stocks" score:v3 to:0.6];
  }
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.conditions" container:@"com.apple.weather" score:v3 to:0.5];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.temperature" container:@"com.apple.weather" score:v3 to:0.5];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.Batteries.BatteriesWidget" kind:@"com.apple.Batteries.complication" container:@"com.apple.Batteries" score:v3 to:0.4];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Batteries.BatteriesWidget" kind:@"com.apple.Batteries.complication" container:@"com.apple.Batteries" score:v3 to:0.4];
  return v3;
}

- (id)_complicationsForPersonalMode
{
  v3 = objc_opt_new();
  if ([(ATXModeFaceComplicationHeuristicDataSource *)self _hasSignificantHomeAccessoryEvents])
  {
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Home.HomeWidget" kind:@"com.apple.Home.widget.summary.category" container:@"com.apple.Home" score:v3 to:0.8];
  }
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:12 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.conditions" container:@"com.apple.weather" score:v3 to:0.4];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.conditions" container:@"com.apple.weather" score:v3 to:0.4];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:10 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.temperature" container:@"com.apple.weather" score:v3 to:0.4];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.news.widget" kind:@"today" container:@"com.apple.news" score:v3 to:0.6];
  return v3;
}

- (id)_complicationsForReadingMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_complicationsForGamingMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_complicationsForMindfulnessMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_complicationsForReduceInterruptions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_addComplicationWithFamily:(int64_t)a3 extension:(id)a4 kind:(id)a5 container:(id)a6 score:(double)a7 to:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  allComplicationDescriptors = self->_allComplicationDescriptors;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __107__ATXModeFaceComplicationHeuristicDataSource__addComplicationWithFamily_extension_kind_container_score_to___block_invoke;
  v29 = &unk_1E68B6098;
  id v19 = v14;
  id v30 = v19;
  id v20 = v15;
  id v31 = v20;
  int64_t v33 = a3;
  id v21 = v16;
  id v32 = v21;
  v22 = [(NSSet *)allComplicationDescriptors objectsPassingTest:&v26];
  if (objc_msgSend(v22, "count", v26, v27, v28, v29))
  {
    id v23 = objc_alloc(MEMORY[0x1E4F4AF50]);
    v24 = [v22 anyObject];
    v25 = [v23 initWithWidgetDescriptor:v24 widgetFamily:a3 intent:0 source:4];

    [v25 setScore:a7];
    [v25 setPredictionSource:@"Heuristic"];
    [v17 addObject:v25];
  }
  else if ([v21 length] {
         && [MEMORY[0x1E4F4AF00] isInstalledAndNotRestrictedForBundle:v21])
  }
  {
    v25 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:]();
    }
  }
  else
  {
    v25 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:]();
    }
  }
}

uint64_t __107__ATXModeFaceComplicationHeuristicDataSource__addComplicationWithFamily_extension_kind_container_score_to___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 extensionBundleIdentifier];
  int v5 = [v4 isEqualToString:a1[4]];

  if (v5
    && ([v3 kind],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:a1[5]],
        v6,
        v7)
    && ([v3 supportedFamilies], CHSWidgetFamilyMaskContainsFamily()))
  {
    uint64_t v8 = [v3 extensionIdentity];
    uint64_t v9 = [v8 containerBundleIdentifier];
    if (v9 == (void *)a1[6])
    {
      uint64_t v12 = 1;
    }
    else
    {
      v10 = [v3 extensionIdentity];
      v11 = [v10 containerBundleIdentifier];
      uint64_t v12 = [v11 isEqualToString:a1[6]];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  int v7 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      break;
    case 3:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForSleepMode];
      goto LABEL_14;
    case 4:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForDrivingMode];
      goto LABEL_14;
    case 5:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForExerciseMode];
      goto LABEL_14;
    case 6:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForWorkMode];
      goto LABEL_14;
    case 7:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForPersonalMode];
      goto LABEL_14;
    case 8:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForReadingMode];
      goto LABEL_14;
    case 9:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForGamingMode];
      goto LABEL_14;
    case 10:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForMindfulnessMode];
      goto LABEL_14;
    case 11:
      uint64_t v8 = [(ATXModeFaceComplicationHeuristicDataSource *)self _landscapeComplicationsForReduceInterruptions];
LABEL_14:
      int v7 = (void *)v8;
      break;
    default:
      uint64_t v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[ATXModeFaceComplicationHeuristicDataSource provideComplicationsForSuggestedFaceType:environment:]();
      }

      int v7 = 0;
      break;
  }

  return v7;
}

- (id)_landscapeComplicationsForSleepMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_landscapeComplicationsForDrivingMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_landscapeComplicationsForExerciseMode
{
  id v3 = objc_opt_new();
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.Fitness.FitnessWidget" kind:@"com.apple.Fitness" container:@"com.apple.Fitness" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.weather.widget" kind:@"com.apple.weather" container:@"com.apple.weather" score:v3 to:0.8];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Batteries.BatteriesWidget" kind:@"com.apple.Batteries.complication" container:@"com.apple.Batteries" score:v3 to:0.4];
  return v3;
}

- (id)_landscapeComplicationsForWorkMode
{
  id v3 = objc_opt_new();
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.mobilecal.CalendarWidgetExtension" kind:@"com.apple.CalendarWidget.CalendarUpNextWidget" container:@"com.apple.mobilecal" score:v3 to:0.8];
  if ([(ATXModeFaceComplicationHeuristicDataSource *)self _hasSignificantRemindersEvents])
  {
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.reminders.WidgetExtension" kind:@"com.apple.reminders.widget" container:@"com.apple.reminders" score:v3 to:0.8];
  }
  if ([(ATXModeFaceComplicationHeuristicDataSource *)self _hasSignificantStocksEvents]) {
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.stocks.widget" kind:@"overview" container:@"com.apple.stocks" score:v3 to:0.6];
  }
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.weather.widget" kind:@"com.apple.weather.complication.conditions" container:@"com.apple.weather" score:v3 to:0.5];
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Batteries.BatteriesWidget" kind:@"com.apple.Batteries.complication" container:@"com.apple.Batteries" score:v3 to:0.4];
  return v3;
}

- (id)_landscapeComplicationsForPersonalMode
{
  id v3 = objc_opt_new();
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.weather.widget" kind:@"com.apple.weather" container:@"com.apple.weather" score:v3 to:0.8];
  if ([(ATXModeFaceComplicationHeuristicDataSource *)self _hasSignificantHomeAccessoryEvents])
  {
    [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.Home.HomeWidget" kind:@"com.apple.Home.widget.summary.category" container:@"com.apple.Home" score:v3 to:0.7];
  }
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addComplicationWithFamily:11 extension:@"com.apple.news.widget" kind:@"today" container:@"com.apple.news" score:v3 to:0.6];
  return v3;
}

- (id)_landscapeComplicationsForReadingMode
{
  id v3 = objc_opt_new();
  [(ATXModeFaceComplicationHeuristicDataSource *)self _addSystemSmallWidgetWithExtension:@"com.apple.news.widget" kind:@"today" container:@"com.apple.news" score:v3 to:0.8];
  return v3;
}

- (id)_landscapeComplicationsForGamingMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_landscapeComplicationsForMindfulnessMode
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_landscapeComplicationsForReduceInterruptions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_addSystemSmallWidgetWithExtension:(id)a3 kind:(id)a4 container:(id)a5 score:(double)a6 to:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  allWidgetDescriptors = self->_allWidgetDescriptors;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__ATXModeFaceComplicationHeuristicDataSource__addSystemSmallWidgetWithExtension_kind_container_score_to___block_invoke;
  v24[3] = &unk_1E68B60C0;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = [(NSSet *)allWidgetDescriptors objectsPassingTest:v24];
  if ([v20 count])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F4AF50]);
    v22 = [v20 anyObject];
    id v23 = [v21 initWithWidgetDescriptor:v22 widgetFamily:1 intent:0 source:4];

    [v23 setScore:a6];
    [v23 setPredictionSource:@"Heuristic"];
    [v15 addObject:v23];
  }
  else if ([v19 length] {
         && [MEMORY[0x1E4F4AF00] isInstalledAndNotRestrictedForBundle:v19])
  }
  {
    id v23 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:]();
    }
  }
  else
  {
    id v23 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:]();
    }
  }
}

uint64_t __105__ATXModeFaceComplicationHeuristicDataSource__addSystemSmallWidgetWithExtension_kind_container_score_to___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 extensionBundleIdentifier];
  int v5 = [v4 isEqualToString:a1[4]];

  if (v5
    && ([v3 kind],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:a1[5]],
        v6,
        v7)
    && ([v3 supportedFamilies], CHSWidgetFamilyMaskContainsFamily()))
  {
    uint64_t v8 = [v3 extensionIdentity];
    uint64_t v9 = [v8 containerBundleIdentifier];
    if (v9 == (void *)a1[6])
    {
      uint64_t v12 = 1;
    }
    else
    {
      v10 = [v3 extensionIdentity];
      v11 = [v10 containerBundleIdentifier];
      uint64_t v12 = [v11 isEqualToString:a1[6]];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_hasTVInterest
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4B390] getUpcomingMediaForBundle:@"com.apple.tv" isInternalApplication:1];
  id v3 = [v2 sortedUpcomingMedia];
  double v4 = (double)(unint64_t)[v3 count];

  int v5 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.tv" actionType:@"INPlayMediaIntent"];
  id v6 = +[_ATXAppLaunchHistogramManager sharedInstance];
  int v7 = [v6 histogramForLaunchType:17];

  v12[0] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 totalLaunchesForBundleIds:v8];
  double v10 = v9;

  return v10 + v4 > 0.0;
}

- (BOOL)_hasSignificantRemindersEvents
{
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  unint64_t v4 = +[ATXComplicationSuggestionHeuristics numberOfRemindersSinceDate:v3];
  LOBYTE(self) = v4 >= [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants faceComplicationsSignificantRemindersEventCount];

  return (char)self;
}

- (BOOL)_hasSignificantHomeAccessoryEvents
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v3 = BiomeLibrary();
  unint64_t v4 = [v3 HomeKit];
  int v5 = [v4 Client];
  id v6 = [v5 AccessoryControl];

  int v7 = objc_msgSend(v6, "atx_publisherFromStartDate:", 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_115;
  v11[3] = &unk_1E68AC690;
  v11[4] = &v12;
  id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_238 receiveInput:v11];

  unint64_t v9 = v13[3];
  LOBYTE(self) = v9 > [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants faceComplicationsSignificantHomeAccessoryEventCount];

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    unint64_t v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(v2, v4);
    }
  }
}

void __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_115(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];

  if (v3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (BOOL)_hasSignificantStocksEvents
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v3 = BiomeLibrary();
  unint64_t v4 = [v3 App];
  int v5 = [v4 Intent];

  id v6 = objc_msgSend(v5, "atx_publisherFromStartDate:", 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_119;
  v10[3] = &unk_1E68AC690;
  v10[4] = &v11;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_118_1 receiveInput:v10];

  unint64_t v8 = v12[3];
  LOBYTE(self) = v8 > [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants faceComplicationsSignificantStocksEventCount];

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    unint64_t v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_cold_1(v2, v4);
    }
  }
}

void __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_119(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  unint64_t v4 = [v3 bundleID];
  int v5 = [v4 isEqualToString:@"com.apple.stocks"];

  if (v5) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesTunableConstants, 0);
  objc_storeStrong((id *)&self->_allWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_allComplicationDescriptors, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXModeFaceComplicationHeuristicDataSource: no complication descriptors found", v1, 2u);
}

- (void)provideComplicationsForSuggestedFaceType:environment:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "ATXModeFaceComplicationHeuristicDataSource: unhandled face type: %ld", v2, v3, v4, v5, v6);
}

- (void)_addComplicationWithFamily:extension:kind:container:score:to:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, v0, v1, "ATXModeFaceComplicationHeuristicDataSource: could not find descriptor for: %@", v2);
}

- (void)_addComplicationWithFamily:extension:kind:container:score:to:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "ATXModeFaceComplicationHeuristicDataSource: could not find descriptor for: %@", v2, v3, v4, v5, v6);
}

void __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, a2, v4, "Could not fetch Home accessory events: %@", v5);
}

void __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, a2, v4, "Could not fetch Stocks events: %@", v5);
}

@end