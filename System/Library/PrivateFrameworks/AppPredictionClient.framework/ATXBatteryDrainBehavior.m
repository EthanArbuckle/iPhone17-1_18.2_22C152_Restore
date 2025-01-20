@interface ATXBatteryDrainBehavior
+ (id)sharedInstance;
- (NSDate)lastCachedDate;
- (unint64_t)fetchADBLDrainClassification;
- (unint64_t)lastCachedClassification;
- (void)fetchADBLDrainClassification;
- (void)setLastCachedClassification:(unint64_t)a3;
- (void)setLastCachedDate:(id)a3;
@end

@implementation ATXBatteryDrainBehavior

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_61);
  }
  v2 = (void *)sharedInstance_predictor;

  return v2;
}

uint64_t __41__ATXBatteryDrainBehavior_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ATXBatteryDrainBehavior);
  uint64_t v1 = sharedInstance_predictor;
  sharedInstance_predictor = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSDate)lastCachedDate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v4 = [v3 objectForKey:@"lastCachedDrainBehaviorDate"];

  return (NSDate *)v4;
}

- (void)setLastCachedDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (id)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v6 setObject:v4 forKey:@"lastCachedDrainBehaviorDate"];
}

- (unint64_t)lastCachedClassification
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  unint64_t v4 = [v3 integerForKey:@"lastCachedDrainBehaviorClassification"];

  return v4;
}

- (void)setLastCachedClassification:(unint64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (id)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v5 setInteger:a3 forKey:@"lastCachedDrainBehaviorClassification"];
}

- (unint64_t)fetchADBLDrainClassification
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [(ATXBatteryDrainBehavior *)v2 lastCachedDate];
  uint64_t v5 = [(ATXBatteryDrainBehavior *)v2 lastCachedClassification];
  if (v4
    && (unint64_t v6 = v5,
        [MEMORY[0x1E4F1C9A8] currentCalendar],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isDate:v4 inSameDayAsDate:v3],
        v7,
        v8))
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ATXBatteryDrainBehavior: returning cached drain classification: %lu", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1AD0D3C30](v5);
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v11 = (void *)get_OSBatteryDrainPredictorClass_softClass;
    uint64_t v20 = get_OSBatteryDrainPredictorClass_softClass;
    if (!get_OSBatteryDrainPredictorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v22 = __get_OSBatteryDrainPredictorClass_block_invoke;
      v23 = &unk_1E5D04E28;
      v24 = &v17;
      __get_OSBatteryDrainPredictorClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v18[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v17, 8);
    v13 = objc_msgSend(v12, "predictor", v17);
    unint64_t v6 = [v13 historicalClassification];
    if (v6 >= 4)
    {
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        [(ATXBatteryDrainBehavior *)v6 fetchADBLDrainClassification];
      }

      unint64_t v6 = 0;
    }
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "ATXBatteryDrainBehavior: drain classification: %lu", (uint8_t *)&buf, 0xCu);
    }

    [(ATXBatteryDrainBehavior *)v2 setLastCachedDate:v3];
    [(ATXBatteryDrainBehavior *)v2 setLastCachedClassification:v6];
  }

  objc_sync_exit(v2);
  return v6;
}

- (void)fetchADBLDrainClassification
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "Unknown drain behavior: %lu", (uint8_t *)&v2, 0xCu);
}

@end