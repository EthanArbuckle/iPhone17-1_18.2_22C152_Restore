@interface ATXComplicationSuggestionHeuristics
+ (id)_countedHomeAccessoryEvents;
+ (int64_t)scoreFromConfidence:(unsigned __int8)a3;
+ (unint64_t)_fetchNumberOfCalendarEventsForStartDate:(id)a3 endDate:(id)a4;
+ (unint64_t)_numBluetoothConnectionsOverLastWeek;
+ (unint64_t)_numCalendarEventsOverLastAndNextWeek;
+ (unint64_t)_numRemindersOverLastWeek;
+ (unint64_t)getClimateCountGivenHomeCounts:(id)a3;
+ (unint64_t)getLightCountGivenHomeCounts:(id)a3;
+ (unint64_t)getSecurityCountGivenHomeCounts:(id)a3;
+ (unint64_t)numberOfRemindersSinceDate:(id)a3;
- (ATXComplicationSuggestionHeuristics)init;
- (BOOL)_confidenceIsValidForPrediction:(unsigned __int8)a3;
- (id)_homeHeuristics;
- (id)complicationHeuristicsDictionary;
- (id)description;
- (unsigned)_batteryHeuristic;
- (unsigned)_calendarHeuristic;
- (unsigned)_reminderHeuristic;
- (void)flushCache;
@end

@implementation ATXComplicationSuggestionHeuristics

- (ATXComplicationSuggestionHeuristics)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXComplicationSuggestionHeuristics;
  v2 = [(ATXComplicationSuggestionHeuristics *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ATXComplicationSuggestionHeuristics *)v2 flushCache];
  }
  return v3;
}

- (void)flushCache
{
  self->_cache = (_PASLazyPurgeableResult *)[objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_8 idleTimeout:3600.0];
  MEMORY[0x1F41817F8]();
}

ATXComplicationSuggestionHeuristicsCache *__49__ATXComplicationSuggestionHeuristics_flushCache__block_invoke()
{
  v0 = objc_alloc_init(ATXComplicationSuggestionHeuristicsCache);
  [(ATXComplicationSuggestionHeuristicsCache *)v0 setNumBluetoothConnectionsOverLastWeek:+[ATXComplicationSuggestionHeuristics _numBluetoothConnectionsOverLastWeek]];
  [(ATXComplicationSuggestionHeuristicsCache *)v0 setNumCalendarEventsOverLastAndNextWeek:+[ATXComplicationSuggestionHeuristics _numCalendarEventsOverLastAndNextWeek]];
  [(ATXComplicationSuggestionHeuristicsCache *)v0 setNumRemindersOverLastWeek:+[ATXComplicationSuggestionHeuristics _numRemindersOverLastWeek]];
  return v0;
}

- (id)complicationHeuristicsDictionary
{
  v3 = objc_opt_new();
  uint64_t v4 = [(ATXComplicationSuggestionHeuristics *)self _batteryHeuristic];
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v4])
  {
    objc_super v5 = [NSNumber numberWithUnsignedChar:v4];
    v6 = +[ATXComplicationWidgetPersonalities batteryComplicationWidgetPersonality];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  uint64_t v7 = [(ATXComplicationSuggestionHeuristics *)self _calendarHeuristic];
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v7])
  {
    v8 = [NSNumber numberWithUnsignedChar:v7];
    v9 = +[ATXComplicationWidgetPersonalities calendarNextEventComplicationWidgetPersonality];
    [v3 setObject:v8 forKeyedSubscript:v9];
  }
  uint64_t v10 = [(ATXComplicationSuggestionHeuristics *)self _reminderHeuristic];
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v10])
  {
    v11 = [NSNumber numberWithUnsignedChar:v10];
    v12 = +[ATXComplicationWidgetPersonalities remindersComplicationWidgetPersonality];
    [v3 setObject:v11 forKeyedSubscript:v12];
  }
  v13 = +[ATXComplicationWidgetPersonalities weatherConditionsComplicationWidgetPersonality];
  [v3 setObject:&unk_1F27EFFB8 forKeyedSubscript:v13];

  v14 = [(ATXComplicationSuggestionHeuristics *)self _homeHeuristics];
  [v3 addEntriesFromDictionary:v14];

  return v3;
}

- (id)description
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 appendString:@"\nHeurstics scores:\n\n"];
  uint64_t v4 = +[ATXComplicationWidgetPersonalities batteryComplicationWidgetPersonality];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "scoreFromConfidence:", -[ATXComplicationSuggestionHeuristics _batteryHeuristic](self, "_batteryHeuristic"));
  v6 = [(_PASLazyPurgeableResult *)self->_cache result];
  uint64_t v7 = [v6 numBluetoothConnectionsOverLastWeek];

  v8 = NSString;
  v9 = [v4 extensionBundleId];
  v65 = v4;
  uint64_t v10 = [v4 kind];
  uint64_t v11 = [v8 stringWithFormat:@"Extension BundleId: %@\nKind: %@\nScore: %lu\nBluetooth connections over last week: %lu\n\n", v9, v10, v5, v7];

  v64 = (void *)v11;
  [v3 appendString:v11];
  v12 = +[ATXComplicationWidgetPersonalities calendarNextEventComplicationWidgetPersonality];
  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "scoreFromConfidence:", -[ATXComplicationSuggestionHeuristics _calendarHeuristic](self, "_calendarHeuristic"));
  v14 = [(_PASLazyPurgeableResult *)self->_cache result];
  uint64_t v15 = [v14 numCalendarEventsOverLastAndNextWeek];

  v16 = NSString;
  v17 = [v12 extensionBundleId];
  v63 = v12;
  v18 = [v12 kind];
  uint64_t v19 = [v16 stringWithFormat:@"Extension BundleId: %@\nKind: %@\nScore: %lu\nCalendar events over last and next week: %lu\n\n", v17, v18, v13, v15];

  v62 = (void *)v19;
  [v3 appendString:v19];
  v20 = +[ATXComplicationWidgetPersonalities remindersComplicationWidgetPersonality];
  uint64_t v21 = [(ATXComplicationSuggestionHeuristics *)self _reminderHeuristic];
  v22 = [(_PASLazyPurgeableResult *)self->_cache result];
  uint64_t v23 = [v22 numRemindersOverLastWeek];

  uint64_t v24 = [(id)objc_opt_class() scoreFromConfidence:v21];
  v25 = NSString;
  v26 = [v20 extensionBundleId];
  v61 = v20;
  v27 = [v20 kind];
  uint64_t v28 = [v25 stringWithFormat:@"Extension BundleId: %@\nKind: %@\nScore: %lu\nReminders over last week: %lu\n\n", v26, v27, v24, v23];

  v60 = (void *)v28;
  [v3 appendString:v28];
  v29 = +[ATXComplicationWidgetPersonalities weatherConditionsComplicationWidgetPersonality];
  uint64_t v30 = [(id)objc_opt_class() scoreFromConfidence:4];
  v31 = NSString;
  v32 = [v29 extensionBundleId];
  v59 = v29;
  v33 = [v29 kind];
  uint64_t v34 = [v31 stringWithFormat:@"Extension BundleId: %@\nKind: %@\nScore: %lu\n\n", v32, v33, v30];

  v58 = (void *)v34;
  [v3 appendString:v34];
  uint64_t v35 = [(id)objc_opt_class() _countedHomeAccessoryEvents];
  uint64_t v36 = [(id)objc_opt_class() getClimateCountGivenHomeCounts:v35];
  uint64_t v37 = [(id)objc_opt_class() getLightCountGivenHomeCounts:v35];
  v57 = (void *)v35;
  uint64_t v38 = [(id)objc_opt_class() getSecurityCountGivenHomeCounts:v35];
  [v3 appendString:@"Home Heuristics \n"];
  v39 = objc_msgSend(NSString, "stringWithFormat:", @"Climate Count: %lu\n", v36);
  [v3 appendString:v39];

  v40 = objc_msgSend(NSString, "stringWithFormat:", @"Security Count: %lu\n", v38);
  [v3 appendString:v40];

  v41 = objc_msgSend(NSString, "stringWithFormat:", @"Lights Count: %lu\n", v37);
  [v3 appendString:v41];

  v42 = v3;
  [v3 appendString:@"Scores: \n"];
  v43 = [(ATXComplicationSuggestionHeuristics *)self _homeHeuristics];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v67 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v49 = objc_opt_class();
        v50 = [v43 objectForKeyedSubscript:v48];
        uint64_t v51 = objc_msgSend(v49, "scoreFromConfidence:", objc_msgSend(v50, "unsignedIntegerValue"));

        v52 = NSString;
        v53 = [v48 kind];
        v54 = [v52 stringWithFormat:@"%@: %ld\n", v53, v51];
        [v42 appendString:v54];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v45);
  }
  [v42 appendString:@"\n"];
  v55 = (void *)[v42 copy];

  return v55;
}

+ (int64_t)scoreFromConfidence:(unsigned __int8)a3
{
  if (a3 > 5u) {
    return -10000;
  }
  else {
    return qword_1D142B000[(char)a3];
  }
}

- (unsigned)_batteryHeuristic
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v4 = [(_PASLazyPurgeableResult *)self->_cache result];
  unint64_t v5 = [v4 numBluetoothConnectionsOverLastWeek];

  if (v5 <= 0x14)
  {
    if (v5 <= 5) {
      char v7 = 2;
    }
    else {
      char v7 = 3;
    }
    if (v5 <= 0xA) {
      unsigned __int8 v6 = v7;
    }
    else {
      unsigned __int8 v6 = 4;
    }
  }
  else
  {
    unsigned __int8 v6 = 5;
  }
  return v6;
}

- (unsigned)_calendarHeuristic
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v4 = [(_PASLazyPurgeableResult *)self->_cache result];
  unint64_t v5 = [v4 numCalendarEventsOverLastAndNextWeek];

  if (v5 <= 0x32)
  {
    if (v5 <= 8) {
      char v7 = 2;
    }
    else {
      char v7 = 3;
    }
    if (v5 <= 0x14) {
      unsigned __int8 v6 = v7;
    }
    else {
      unsigned __int8 v6 = 4;
    }
  }
  else
  {
    unsigned __int8 v6 = 5;
  }
  return v6;
}

- (unsigned)_reminderHeuristic
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v4 = [(_PASLazyPurgeableResult *)self->_cache result];
  unint64_t v5 = [v4 numRemindersOverLastWeek];

  if (v5 <= 0xA)
  {
    if (v5 <= 1) {
      char v7 = 2;
    }
    else {
      char v7 = 3;
    }
    if (v5 <= 5) {
      unsigned __int8 v6 = v7;
    }
    else {
      unsigned __int8 v6 = 4;
    }
  }
  else
  {
    unsigned __int8 v6 = 5;
  }
  return v6;
}

- (id)_homeHeuristics
{
  v3 = [(id)objc_opt_class() _countedHomeAccessoryEvents];
  unint64_t v4 = [(id)objc_opt_class() getClimateCountGivenHomeCounts:v3];
  unint64_t v5 = [(id)objc_opt_class() getLightCountGivenHomeCounts:v3];
  unint64_t v6 = [(id)objc_opt_class() getSecurityCountGivenHomeCounts:v3];
  char v7 = objc_opt_new();
  if (v4 && v5 && v6)
  {
    unint64_t v8 = v5 + v4 + v6;
    if (v8) {
      int v9 = 3;
    }
    else {
      int v9 = 1;
    }
    if (v8 <= 5) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = 4;
    }
    if (v8 <= 0xF) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 5;
    }
    uint64_t v12 = 1;
    uint64_t v13 = 1;
    uint64_t v14 = 1;
  }
  else
  {
    if (v4) {
      unsigned int v15 = 3;
    }
    else {
      unsigned int v15 = 1;
    }
    if (v4 > 5) {
      unsigned int v15 = 4;
    }
    if (v4 <= 0xF) {
      uint64_t v12 = v15;
    }
    else {
      uint64_t v12 = 5;
    }
    if (v5) {
      unsigned int v16 = 3;
    }
    else {
      unsigned int v16 = 1;
    }
    if (v5 > 5) {
      unsigned int v16 = 4;
    }
    if (v5 <= 0xF) {
      uint64_t v13 = v16;
    }
    else {
      uint64_t v13 = 5;
    }
    if (v6) {
      unsigned int v17 = 3;
    }
    else {
      unsigned int v17 = 1;
    }
    if (v6 > 5) {
      unsigned int v17 = 4;
    }
    BOOL v18 = v6 > 0xF;
    uint64_t v11 = 1;
    if (v18) {
      uint64_t v14 = 5;
    }
    else {
      uint64_t v14 = v17;
    }
  }
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v11])
  {
    uint64_t v19 = [NSNumber numberWithUnsignedChar:v11];
    v20 = +[ATXComplicationWidgetPersonalities homeSummaryComplicationWidgetPersonality];
    [v7 setObject:v19 forKeyedSubscript:v20];
  }
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v12])
  {
    uint64_t v21 = [NSNumber numberWithUnsignedChar:v12];
    v22 = +[ATXComplicationWidgetPersonalities homeClimateComplicationWidgetPersonality];
    [v7 setObject:v21 forKeyedSubscript:v22];
  }
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v14])
  {
    uint64_t v23 = [NSNumber numberWithUnsignedChar:v14];
    uint64_t v24 = +[ATXComplicationWidgetPersonalities homeSecurityComplicationWidgetPersonality];
    [v7 setObject:v23 forKeyedSubscript:v24];
  }
  if ([(ATXComplicationSuggestionHeuristics *)self _confidenceIsValidForPrediction:v13])
  {
    v25 = [NSNumber numberWithUnsignedChar:v13];
    v26 = +[ATXComplicationWidgetPersonalities homeLightsComplicationWidgetPersonality];
    [v7 setObject:v25 forKeyedSubscript:v26];
  }
  v27 = +[ATXComplicationWidgetPersonalities homeSecuritySingleSensorComplicationWidgetPersonality];
  [v7 setObject:&unk_1F27EFFD0 forKeyedSubscript:v27];

  uint64_t v28 = +[ATXComplicationWidgetPersonalities homeClimateSingleSensorComplicationWidgetPersonality];
  [v7 setObject:&unk_1F27EFFD0 forKeyedSubscript:v28];

  return v7;
}

+ (unint64_t)getClimateCountGivenHomeCounts:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 countForObject:@"0000008A-0000-1000-8000-0026BB765291"];
  uint64_t v5 = [v3 countForObject:@"0000004A-0000-1000-8000-0026BB765291"] + v4;
  uint64_t v6 = [v3 countForObject:@"000000BC-0000-1000-8000-0026BB765291"];
  uint64_t v7 = v5 + v6 + [v3 countForObject:@"000000BD-0000-1000-8000-0026BB765291"];
  uint64_t v8 = [v3 countForObject:@"0000008D-0000-1000-8000-0026BB765291"];
  uint64_t v9 = [v3 countForObject:@"00000082-0000-1000-8000-0026BB765291"];

  return v7 + v8 + v9;
}

+ (unint64_t)getSecurityCountGivenHomeCounts:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 countForObject:@"00000041-0000-1000-8000-0026BB765291"];
  uint64_t v5 = [v3 countForObject:@"00000081-0000-1000-8000-0026BB765291"] + v4;
  uint64_t v6 = [v3 countForObject:@"0000008B-0000-1000-8000-0026BB765291"];
  uint64_t v7 = v5 + v6 + [v3 countForObject:@"00000080-0000-1000-8000-0026BB765291"];
  uint64_t v8 = [v3 countForObject:@"00000045-0000-1000-8000-0026BB765291"];
  uint64_t v9 = [v3 countForObject:@"0000007E-0000-1000-8000-0026BB765291"];

  return v7 + v8 + v9;
}

+ (unint64_t)getLightCountGivenHomeCounts:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 countForObject:@"00000043-0000-1000-8000-0026BB765291"];
  uint64_t v5 = [v3 countForObject:@"00000049-0000-1000-8000-0026BB765291"] + v4;
  uint64_t v6 = [v3 countForObject:@"00000047-0000-1000-8000-0026BB765291"];

  return v5 + v6;
}

+ (unint64_t)_numBluetoothConnectionsOverLastWeek
{
  v2 = (void *)MEMORY[0x1D25F6CC0](a1, a2);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
  uint64_t v4 = objc_opt_new();
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v5 = BiomeLibrary();
  uint64_t v6 = [v5 Device];
  uint64_t v7 = [v6 Wireless];
  uint64_t v8 = [v7 Bluetooth];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v3 endDate:0 maxEvents:0 lastN:0 reversed:0];
  unsigned int v10 = [v8 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_133;
  v15[3] = &unk_1E68ABB20;
  id v11 = v4;
  id v16 = v11;
  unsigned int v17 = &v18;
  id v12 = (id)[v10 sinkWithCompletion:&__block_literal_global_132 receiveInput:v15];

  unint64_t v13 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_cold_1(v2);
    }
  }
}

void __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_133(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 eventBody];
  uint64_t v4 = [v3 address];

  if ([v4 length])
  {
    uint64_t v5 = [v13 eventBody];
    int v6 = [v5 starting];

    if (v6)
    {
      uint64_t v7 = NSNumber;
      [v13 timestamp];
      uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      [v9 doubleValue];
      double v11 = v10;

      if (v11 != 0.0)
      {
        [v13 timestamp];
        if (v12 - v11 >= 60.0) {
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
        [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v4];
      }
    }
  }
}

+ (unint64_t)_numRemindersOverLastWeek
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
  unint64_t v4 = [a1 numberOfRemindersSinceDate:v3];

  return v4;
}

+ (unint64_t)numberOfRemindersSinceDate:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[_ATXDataStore sharedInstance];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  unint64_t v6 = [v4 numBundleIdOccurrencesForBundleId:@"com.apple.reminders" startDate:v3 endDate:v5];

  return v6;
}

+ (unint64_t)_numCalendarEventsOverLastAndNextWeek
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:604800.0];
  unint64_t v4 = [(id)objc_opt_class() _fetchNumberOfCalendarEventsForStartDate:v2 endDate:v3];

  return v4;
}

+ (unint64_t)_fetchNumberOfCalendarEventsForStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F576D0]) initWithStartDate:v5 endDate:v6];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __88__ATXComplicationSuggestionHeuristics__fetchNumberOfCalendarEventsForStartDate_endDate___block_invoke;
  v24[3] = &unk_1E68ABB48;
  v26 = &v27;
  double v11 = v10;
  v25 = v11;
  [v8 fetchEventCountsInRange:v9 inCalendars:0 exclusionOptions:0 completion:v24];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v11 timeoutSeconds:5.0];
  double v12 = (void *)v28[5];
  if (!v12)
  {
    id v13 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ATXComplicationSuggestionHeuristics _fetchNumberOfCalendarEventsForStartDate:endDate:](v13);
    }
    goto LABEL_12;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v33 count:16];
  if (!v14)
  {
LABEL_12:
    unint64_t v15 = 0;
    goto LABEL_13;
  }
  uint64_t v19 = v7;
  unint64_t v15 = 0;
  uint64_t v16 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v21 != v16) {
        objc_enumerationMutation(v13);
      }
      v15 += [(id)v28[5] countForObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
    }
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v33 count:16];
  }
  while (v14);
  uint64_t v7 = v19;
LABEL_13:

  _Block_object_dispose(&v27, 8);

  return v15;
}

void __88__ATXComplicationSuggestionHeuristics__fetchNumberOfCalendarEventsForStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_countedHomeAccessoryEvents
{
  id v2 = objc_opt_new();
  id v3 = BiomeLibrary();
  id v4 = [v3 HomeKit];
  id v5 = [v4 Client];
  id v6 = [v5 AccessoryControl];

  uint64_t v7 = objc_msgSend(v6, "atx_publisherFromStartDate:", 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_146;
  v11[3] = &unk_1E68ABB70;
  id v8 = v2;
  id v12 = v8;
  id v9 = (id)[v7 sinkWithCompletion:&__block_literal_global_145 receiveInput:v11];

  return v8;
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_cold_1(v2);
    }
  }
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_146(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 eventBody];
    uint64_t v7 = [v6 serviceType];

    if (v7)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v6 serviceType];
      [v8 addObject:v9];
    }
  }
  else
  {
    dispatch_semaphore_t v10 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_146_cold_1(v3);
    }
  }
}

- (BOOL)_confidenceIsValidForPrediction:(unsigned __int8)a3
{
  return (a3 & 0xFD) != 0;
}

- (void).cxx_destruct
{
}

void __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Could not query Bluetooth connected events for complication heuristics: %@", v4, v5, v6, v7, 2u);
}

+ (void)_fetchNumberOfCalendarEventsForStartDate:(os_log_t)log endDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Failed to fetch count of calendar events", v1, 2u);
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Could not fetch Home accessory events: %@", v4, v5, v6, v7, 2u);
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_146_cold_1(void *a1)
{
  v1 = [a1 eventBody];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v4, v5, "Incorrect class received while fetching home accessory events: %@", v6, v7, v8, v9, 2u);
}

@end