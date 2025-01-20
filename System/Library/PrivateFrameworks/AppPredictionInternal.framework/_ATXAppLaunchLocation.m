@interface _ATXAppLaunchLocation
+ (id)defaultPath;
+ (id)sortTimeIntervals:(id)a3;
+ (id)visitsWithLOI:(id)a3 startDate:(id)a4;
+ (void)joinLaunchEvents:(id)a3 withVisits:(id)a4 block:(id)a5;
+ (void)writeModel:(id)a3;
- (_ATXAppLaunchLocation)init;
- (_ATXAppLaunchLocation)initWithDuetHelper:(id)a3 combinedIntentStream:(id)a4 locationManager:(id)a5;
- (double)launchProbabilityAtLOI:(id)a3 appForAllIntentsBundleId:(id)a4;
- (double)launchProbabilityAtLOI:(id)a3 appIntent:(id)a4;
- (double)launchProbabilityAtLOI:(id)a3 bundleId:(id)a4;
- (id)locationManager;
- (int)launchCountAtLOI:(id)a3 bundleId:(id)a4;
- (unint64_t)loadModel;
- (unint64_t)loadModelAtPath:(id)a3;
- (void)_trainModelWithLOI:(id)a3 startDate:(id)a4;
- (void)resetAppIntentLocationData;
- (void)train;
- (void)trainWithCallback:(id)a3;
@end

@implementation _ATXAppLaunchLocation

- (_ATXAppLaunchLocation)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(_ATXAppLaunchLocation *)self initWithDuetHelper:v3 combinedIntentStream:v4 locationManager:0];

  return v5;
}

- (_ATXAppLaunchLocation)initWithDuetHelper:(id)a3 combinedIntentStream:(id)a4 locationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_ATXAppLaunchLocation;
  v12 = [(_ATXAppLaunchLocation *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationManager, a5);
    objc_storeStrong((id *)&v13->_duetHelper, a3);
    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    v15 = objc_opt_new();
    uint64_t v16 = [v14 initWithGuardedData:v15];
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v16;

    objc_storeStrong((id *)&v13->_combinedIntentStream, a4);
    [(_ATXAppLaunchLocation *)v13 loadModel];
  }

  return v13;
}

- (id)locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = [MEMORY[0x1E4F935D0] sharedInstance];
    v5 = self->_locationManager;
    self->_locationManager = v4;

    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)resetAppIntentLocationData
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51___ATXAppLaunchLocation_resetAppIntentLocationData__block_invoke;
  v3[3] = &unk_1E68B0228;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

- (double)launchProbabilityAtLOI:(id)a3 bundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  double v9 = 0.0;
  if (v6 && [v7 length])
  {
    uint64_t v22 = 0;
    v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v18 = 0;
    objc_super v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    lock = self->_lock;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57___ATXAppLaunchLocation_launchProbabilityAtLOI_bundleId___block_invoke;
    v13[3] = &unk_1E68B0250;
    uint64_t v16 = &v22;
    id v14 = v6;
    id v15 = v8;
    v17 = &v18;
    [(_PASLock *)lock runWithLockAcquired:v13];
    double v11 = v19[3];
    if (v11 != 0.0) {
      double v9 = v23[3] / v11;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (int)launchCountAtLOI:(id)a3 bundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && [v7 length])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    lock = self->_lock;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51___ATXAppLaunchLocation_launchCountAtLOI_bundleId___block_invoke;
    v12[3] = &unk_1E68B0278;
    id v15 = &v16;
    id v13 = v6;
    id v14 = v8;
    [(_PASLock *)lock runWithLockAcquired:v12];
    int v10 = *((_DWORD *)v17 + 6);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (double)launchProbabilityAtLOI:(id)a3 appIntent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  double v9 = 0.0;
  if (v6 && [v7 length])
  {
    uint64_t v22 = 0;
    v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v18 = 0;
    int v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    lock = self->_lock;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58___ATXAppLaunchLocation_launchProbabilityAtLOI_appIntent___block_invoke;
    v13[3] = &unk_1E68B0250;
    uint64_t v16 = &v22;
    id v14 = v6;
    id v15 = v8;
    v17 = &v18;
    [(_PASLock *)lock runWithLockAcquired:v13];
    double v11 = v19[3];
    if (v11 != 0.0) {
      double v9 = v23[3] / v11;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (double)launchProbabilityAtLOI:(id)a3 appForAllIntentsBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  double v9 = 0.0;
  if (v6 && [v7 length])
  {
    uint64_t v22 = 0;
    v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v18 = 0;
    int v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    lock = self->_lock;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73___ATXAppLaunchLocation_launchProbabilityAtLOI_appForAllIntentsBundleId___block_invoke;
    v13[3] = &unk_1E68B0250;
    uint64_t v16 = &v22;
    id v14 = v6;
    id v15 = v8;
    v17 = &v18;
    [(_PASLock *)lock runWithLockAcquired:v13];
    double v11 = v19[3];
    if (v11 != 0.0) {
      double v9 = v23[3] / v11;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (void)train
{
}

- (void)trainWithCallback:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  sel_getName(a2);
  id v6 = (void *)os_transaction_create();
  id v7 = __atxlog_handle_default();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  double v9 = __atxlog_handle_default();
  int v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 136446210;
    int v19 = "_ATXAppLaunchLocation";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

  double v11 = [(_ATXAppLaunchLocation *)self locationManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43___ATXAppLaunchLocation_trainWithCallback___block_invoke;
  v14[3] = &unk_1E68B02A0;
  id v16 = v5;
  os_signpost_id_t v17 = v8;
  v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  id v13 = v5;
  [v11 fetchAllLocationsOfInterest:v14];
}

- (void)_trainModelWithLOI:(id)a3 startDate:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  v28 = objc_opt_new();
  os_signpost_id_t v8 = objc_opt_new();
  v27 = objc_opt_new();
  double v9 = objc_opt_new();
  int v10 = objc_opt_new();
  context = (void *)MEMORY[0x1D25F6CC0]();
  v30 = [MEMORY[0x1E4F1C9C8] date];
  v32 = v6;
  double v11 = +[_ATXAppLaunchLocation visitsWithLOI:v33 startDate:v6];
  v26 = [(_ATXDuetHelper *)self->_duetHelper getAppLaunchesBetweenStartDate:v6 endDate:v30 batchSize:800];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke;
  v48[3] = &unk_1E68B02C8;
  id v12 = v7;
  id v49 = v12;
  id v13 = v9;
  id v50 = v13;
  +[_ATXAppLaunchLocation joinLaunchEvents:v26 withVisits:v11 block:v48];
  id v14 = [(ATXCombinedIntentStream *)self->_combinedIntentStream getActivityAndIntentEventsFromLastMonth];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_2;
  v42[3] = &unk_1E68B02F0;
  SEL v47 = a2;
  v42[4] = self;
  id v15 = v28;
  id v43 = v15;
  id v16 = v8;
  id v44 = v16;
  id v17 = v27;
  id v45 = v17;
  id v18 = v10;
  id v46 = v18;
  +[_ATXAppLaunchLocation joinLaunchEvents:v14 withVisits:v11 block:v42];

  lock = self->_lock;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_3;
  v34[3] = &unk_1E68B0318;
  id v35 = v12;
  id v36 = v15;
  id v37 = v16;
  id v38 = v17;
  id v39 = v13;
  id v40 = v18;
  v41 = self;
  id v20 = v18;
  id v21 = v13;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v12;
  [(_PASLock *)lock runWithLockAcquired:v34];
}

+ (id)visitsWithLOI:(id)a3 startDate:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        int v10 = [v9 visits];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              uint64_t v16 = [v15 rangeValue];
              double v18 = (double)(unint64_t)(v16 + v17);
              [v6 timeIntervalSinceReferenceDate];
              if (v19 <= v18)
              {
                id v20 = [v9 uuid];
                [v7 setObject:v20 forKeyedSubscript:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v12);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }

  return v7;
}

+ (void)joinLaunchEvents:(id)a3 withVisits:(id)a4 block:(id)a5
{
  id v29 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = (void (**)(id, void *, void *))a5;
  double v9 = [v7 allKeys];
  int v10 = +[_ATXAppLaunchLocation sortTimeIntervals:v9];

  uint64_t v11 = [v10 count];
  uint64_t v12 = v29;
  if (v11)
  {
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    long long v28 = (char *)(v8 + 2);
    while (1)
    {
      if (v14 >= objc_msgSend(v12, "count", v28)) {
        goto LABEL_10;
      }
      id v15 = [v29 objectAtIndexedSubscript:v14];
      uint64_t v16 = [v10 objectAtIndexedSubscript:v13];
      unint64_t v17 = [v16 rangeValue];
      uint64_t v19 = v18;
      id v20 = [v15 startDate];
      [v20 timeIntervalSinceReferenceDate];
      double v22 = v21;

      if (v22 < (double)v17) {
        goto LABEL_8;
      }
      uint64_t v23 = [v15 startDate];
      [v23 timeIntervalSinceReferenceDate];
      double v25 = v24;

      if (v25 <= (double)(v17 + v19)) {
        break;
      }
      ++v13;
LABEL_9:

      unint64_t v27 = [v10 count];
      uint64_t v12 = v29;
      if (v13 >= v27) {
        goto LABEL_10;
      }
    }
    long long v26 = [v7 objectForKeyedSubscript:v16];
    v8[2](v8, v15, v26);

LABEL_8:
    ++v14;
    goto LABEL_9;
  }
LABEL_10:
}

+ (id)sortTimeIntervals:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_90];
}

+ (id)defaultPath
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXAppLaunchLocation"];
}

+ (void)writeModel:(id)a3
{
  v24[7] = *MEMORY[0x1E4F143B8];
  v3 = a3;
  v4 = v3;
  if (v3[2] && v3[3] && v3[4] && v3[5] && v3[6] && v3[7])
  {
    id v5 = (void *)MEMORY[0x1D25F6CC0]();
    v23[0] = @"modelVersion";
    v23[1] = @"appLaunchCountMapKey";
    uint64_t v6 = v4[2];
    uint64_t v7 = v4[3];
    v24[0] = &unk_1F27F0D98;
    v24[1] = v6;
    v23[2] = @"appIntentLaunchCountMapKey";
    v23[3] = @"intentLaunchCountMapKey";
    uint64_t v8 = v4[4];
    uint64_t v9 = v4[5];
    v24[2] = v7;
    v24[3] = v8;
    v23[4] = @"appForAllIntentsLaunchCountMapKey";
    v23[5] = @"totalLaunchCountMapKey";
    uint64_t v10 = v4[6];
    uint64_t v11 = v4[7];
    v24[4] = v9;
    v24[5] = v10;
    v23[6] = @"totalIntentLaunchCountMapKey";
    v24[6] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
    id v22 = 0;
    unint64_t v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v22];
    id v14 = v22;
    if (v13)
    {
      id v15 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v16 = +[_ATXAppLaunchLocation defaultPath];
      unint64_t v17 = [v15 fileURLWithPath:v16];

      id v21 = v14;
      char v18 = [v13 writeToURL:v17 options:805306369 error:&v21];
      id v19 = v21;

      if ((v18 & 1) == 0)
      {
        id v20 = __atxlog_handle_default();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          +[_ATXAppLaunchLocation writeModel:]();
        }
      }
    }
    else
    {
      unint64_t v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[_ATXAppLaunchLocation writeModel:]();
      }
      id v19 = v14;
    }
  }
}

- (unint64_t)loadModel
{
  v3 = +[_ATXAppLaunchLocation defaultPath];
  unint64_t v4 = [(_ATXAppLaunchLocation *)self loadModelAtPath:v3];

  return v4;
}

- (unint64_t)loadModelAtPath:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F93B10] lockState] - 1 > 1)
  {
    uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
    id v30 = 0;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:0 error:&v30];
    id v10 = v30;
    if (!v9)
    {
      double v25 = __atxlog_handle_default();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v4;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Could not open model at %@: %@", buf, 0x16u);
      }

      uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 removeItemAtPath:v4 error:0];
      unint64_t v7 = 2;
      id v19 = v10;
      goto LABEL_18;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    unint64_t v17 = (void *)MEMORY[0x1D25F6CC0]();
    id v29 = v10;
    char v18 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v16 fromData:v9 error:&v29];
    id v19 = v29;

    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v20 = [v18 objectForKeyedSubscript:@"modelVersion"];
      uint64_t v21 = [v20 integerValue];

      if (v21 == 2)
      {
        lock = self->_lock;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_91;
        v27[3] = &unk_1E68B0228;
        long long v28 = v18;
        [(_PASLock *)lock runWithLockAcquired:v27];
        unint64_t v7 = 1;
        uint64_t v23 = v28;
LABEL_14:

LABEL_18:
        goto LABEL_19;
      }
      uint64_t v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchLocation loadModelAtPath:](v21, v23);
      }
    }
    else
    {
      double v24 = __atxlog_handle_default();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchLocation loadModelAtPath:]();
      }

      uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v23 removeItemAtPath:v4 error:0];
    }
    unint64_t v7 = 2;
    goto LABEL_14;
  }
  id v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "Model data data was locked. Waiting...", buf, 2u);
  }

  uint64_t v6 = self->_lock;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke;
  v31[3] = &unk_1E68B03A8;
  v31[4] = self;
  id v32 = v4;
  [(_PASLock *)v6 runWithLockAcquired:v31];

  unint64_t v7 = 0;
LABEL_19:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedIntentStream, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

+ (void)writeModel:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error archiving location model: %@", v2, v3, v4, v5, v6);
}

+ (void)writeModel:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error writing location model: %@", v2, v3, v4, v5, v6);
}

- (void)loadModelAtPath:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "Error unarchiving model at %@: %@", v2, 0x16u);
}

- (void)loadModelAtPath:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = 2;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Expected model version %i, got %i", (uint8_t *)v2, 0xEu);
}

@end