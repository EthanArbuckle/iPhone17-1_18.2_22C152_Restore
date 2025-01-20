@interface _ATXAppDailyDose
+ (id)_defaultCurrentDosePath;
+ (id)_defaultHistoricalDosePath;
+ (void)deleteCurrentDoseFile;
- (BOOL)_loadHistoricalDoseFrom:(id)a3;
- (OS_dispatch_queue)queue;
- (_ATXAppDailyDose)init;
- (_ATXAppDailyDose)initWithDuetHelper:(id)a3;
- (_ATXAppDailyDose)initWithDuetHelper:(id)a3 timeZone:(id)a4 today:(id)a5 alpha:(double)a6 historicalDosePath:(id)a7 completion:(id)a8;
- (double)alpha;
- (double)getCurrentDoseForApp:(id)a3;
- (id)currentDoseStore;
- (id)getDoseForApp:(id)a3;
- (id)now;
- (id)previousBundleId;
- (id)todayWithTimeZone:(id)a3;
- (void)_asyncStopAppUsageAtDate:(id)a3 completion:(id)a4;
- (void)_backfillAppDurationMapDBForToday;
- (void)_doTrainingOn:(id)a3 timeZone:(id)a4 completion:(id)a5;
- (void)_recordAppDurationForApp:(id)a3 withStartTime:(id)a4 andEndTime:(id)a5;
- (void)_writeHistoricalDoseWithCompletion:(id)a3;
- (void)addLaunchForBundleId:(id)a3 date:(id)a4 completion:(id)a5;
- (void)stopAppUsageAtDate:(id)a3;
- (void)train;
@end

@implementation _ATXAppDailyDose

- (_ATXAppDailyDose)init
{
  v3 = objc_opt_new();
  v4 = [(_ATXAppDailyDose *)self initWithDuetHelper:v3];

  return v4;
}

- (_ATXAppDailyDose)initWithDuetHelper:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 147, @"Invalid parameter not satisfying: %@", @"duetHelper" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  v7 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
  v8 = [v7 objectForKeyedSubscript:@"SmoothingAlpha"];
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_ATXAppDailyDose.m" lineNumber:151 description:@"No alpha parameter for AppDailyDose found in asset"];
  }
  [v8 doubleValue];
  double v10 = v9;
  v11 = [(_ATXAppDailyDose *)self todayWithTimeZone:v6];
  v12 = [(_ATXAppDailyDose *)self initWithDuetHelper:v5 timeZone:v6 today:v11 alpha:0 historicalDosePath:0 completion:v10];

  return v12;
}

- (_ATXAppDailyDose)initWithDuetHelper:(id)a3 timeZone:(id)a4 today:(id)a5 alpha:(double)a6 historicalDosePath:(id)a7 completion:(id)a8
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  if (!v16)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 168, @"Invalid parameter not satisfying: %@", @"duetHelper" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)_ATXAppDailyDose;
  v21 = [(_ATXAppDailyDose *)&v42 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_duetHelper, a3);
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    v25 = (const char *)[v24 UTF8String];
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create(v25, v26);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v27;

    v29 = [_ATXAppDailyDoseCurrentStore alloc];
    v30 = +[_ATXAppDailyDose _defaultCurrentDosePath];
    uint64_t v31 = [(_ATXAppDailyDoseCurrentStore *)v29 initWithPath:v30];
    currentDoseStore = v22->_currentDoseStore;
    v22->_currentDoseStore = (_ATXAppDailyDoseCurrentStore *)v31;

    v22->_alpha = a6;
    v33 = (void *)MEMORY[0x1E4F93B10];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke;
    v36[3] = &unk_1E68AF230;
    v37 = v22;
    id v38 = v19;
    id v39 = v18;
    id v40 = v17;
    id v41 = v20;
    [v33 runBlockWhenDeviceIsClassCUnlocked:v36];
  }
  return v22;
}

- (id)currentDoseStore
{
  return self->_currentDoseStore;
}

- (id)getDoseForApp:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__34;
  id v16 = __Block_byref_object_dispose__34;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___ATXAppDailyDose_getDoseForApp___block_invoke;
  block[3] = &unk_1E68AF258;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)getCurrentDoseForApp:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___ATXAppDailyDose_getCurrentDoseForApp___block_invoke;
    block[3] = &unk_1E68AF258;
    v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    double v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)todayWithTimeZone:(id)a3
{
  return +[ATXTimeUtil todayWithTimeZone:a3];
}

- (id)now
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (void)train
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25___ATXAppDailyDose_train__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_doTrainingOn:(id)a3 timeZone:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = __atxlog_handle_default();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  v13 = __atxlog_handle_default();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "_ATXAppDailyDose";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v15 = (void *)os_transaction_create();
  id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);

  id v18 = dispatch_queue_create("ATXAppDailyDose-train", v17);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke;
  v23[3] = &unk_1E68AF2A8;
  v23[4] = self;
  id v24 = v8;
  id v27 = v10;
  os_signpost_id_t v28 = v12;
  id v25 = v9;
  id v26 = v15;
  id v19 = v15;
  id v20 = v10;
  id v21 = v9;
  id v22 = v8;
  dispatch_async(v18, v23);
}

- (void)addLaunchForBundleId:(id)a3 date:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 305, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 306, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___ATXAppDailyDose_addLaunchForBundleId_date_completion___block_invoke;
  block[3] = &unk_1E68AF208;
  block[4] = self;
  id v19 = v10;
  id v20 = v9;
  id v21 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(queue, block);
}

- (void)_recordAppDurationForApp:(id)a3 withStartTime:(id)a4 andEndTime:(id)a5
{
  id v15 = a3;
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  dispatch_assert_queue_V2(queue);
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  currentDoseStore = self->_currentDoseStore;
  id v14 = [(_ATXAppDailyDose *)self now];
  LODWORD(currentDoseStore) = [(_ATXAppDailyDoseCurrentStore *)currentDoseStore isExpiredAt:v14];

  if (currentDoseStore) {
    [(_ATXAppDailyDose *)self _backfillAppDurationMapDBForToday];
  }
  [(_ATXAppDailyDoseCurrentStore *)self->_currentDoseStore increaseDoseFor:v15 by:v12];
}

- (void)stopAppUsageAtDate:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 344, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    id v5 = 0;
  }
  [(_ATXAppDailyDose *)self _asyncStopAppUsageAtDate:v5 completion:0];
}

- (void)_asyncStopAppUsageAtDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke;
  block[3] = &unk_1E68AF2D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

+ (id)_defaultHistoricalDosePath
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXAppDailyDose_HistoricalDose"];
}

+ (id)_defaultCurrentDosePath
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXAppDailyDose_CurrentDose"];
}

+ (void)deleteCurrentDoseFile
{
  id v4 = (id)objc_opt_new();
  v3 = [a1 _defaultCurrentDosePath];
  [v4 writeToFile:v3 atomically:0];
}

- (void)_writeHistoricalDoseWithCompletion:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = (void *)MEMORY[0x1D25F6CC0]();
  v21[0] = @"appAverageDurationMapKey";
  v21[1] = @"duetHistoryTimestamp";
  duetHistoryTimestamp = self->_duetHistoryTimestamp;
  v22[0] = self->_appHistoricalDoseMap;
  v22[1] = duetHistoryTimestamp;
  v21[2] = @"modelVersion";
  v22[2] = &unk_1F27F06D8;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v20 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v20];
  id v10 = v20;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 401, @"Archiver error: %@", v10 object file lineNumber description];
  }
  double v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
  id v13 = dispatch_queue_create("daily-dose-write", v12);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke;
  block[3] = &unk_1E68AB528;
  id v18 = v9;
  id v14 = v5;
  id v19 = v14;
  id v15 = v9;
  dispatch_async(v13, block);
}

- (BOOL)_loadHistoricalDoseFrom:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[_ATXAppDailyDose _defaultHistoricalDosePath];
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v40 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:0 error:&v40];
  id v7 = v40;
  id v8 = v7;
  if (v6)
  {
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    id v15 = (void *)MEMORY[0x1D25F6CC0]();
    id v39 = v8;
    id v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v6 error:&v39];
    id v17 = v39;

    if (v16)
    {
      id v18 = [v16 objectForKeyedSubscript:@"modelVersion"];
      uint64_t v19 = [v18 integerValue];

      if (v19 < 1)
      {
        BOOL v23 = 0;
        goto LABEL_18;
      }
      id v20 = [v16 objectForKeyedSubscript:@"duetHistoryTimestamp"];
      id v21 = [(_ATXAppDailyDose *)self now];
      uint64_t v22 = [v20 compare:v21];

      BOOL v23 = v22 != 1;
      if (v22 != 1)
      {
        id v24 = [v16 objectForKeyedSubscript:@"appAverageDurationMapKey"];
        appHistoricalDoseMap = self->_appHistoricalDoseMap;
        self->_appHistoricalDoseMap = v24;

        objc_storeStrong((id *)&self->_duetHistoryTimestamp, v20);
        BOOL v23 = 1;
      }
    }
    else
    {
      id v20 = __atxlog_handle_default();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[_ATXAppDailyDose _loadHistoricalDoseFrom:]((uint64_t)v17, v20, v26, v27, v28, v29, v30, v31);
      }
      BOOL v23 = 0;
    }

LABEL_18:
LABEL_19:

    id v8 = v17;
    goto LABEL_20;
  }
  if ([v7 code] != 260)
  {
    id v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[_ATXAppDailyDose _loadHistoricalDoseFrom:]((uint64_t)v8, v14, v32, v33, v34, v35, v36, v37);
    }
    BOOL v23 = 0;
    id v17 = v8;
    goto LABEL_19;
  }
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (void)_backfillAppDurationMapDBForToday
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v5 = [(_ATXAppDailyDose *)self todayWithTimeZone:v4];

  uint64_t v22 = [(_ATXAppDailyDose *)self now];
  BOOL v23 = (void *)v5;
  id v6 = -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:", v5);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 endDate];
        uint64_t v13 = [v11 startDate];
        [v12 timeIntervalSinceDate:v13];
        double v15 = v14;

        id v16 = [v11 bundleId];
        id v17 = [v3 objectForKeyedSubscript:v16];
        [v17 doubleValue];
        double v19 = v18;

        id v20 = [NSNumber numberWithDouble:v15 + v19];
        id v21 = [v11 bundleId];
        [v3 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  [(_ATXAppDailyDoseCurrentStore *)self->_currentDoseStore resetWithDurationMap:v3 on:v23];
}

- (id)previousBundleId
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__34;
  uint64_t v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___ATXAppDailyDose_previousBundleId__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)alpha
{
  return self->_alpha;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAppLaunchDate, 0);
  objc_storeStrong((id *)&self->_previousAppId, 0);
  objc_storeStrong((id *)&self->_duetHistoryTimestamp, 0);
  objc_storeStrong((id *)&self->_appHistoricalDoseMap, 0);
  objc_storeStrong((id *)&self->_currentDoseStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
}

- (void)_loadHistoricalDoseFrom:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end