@interface ATXLaunchAndLocationFilterer
+ (BOOL)appBundleIdIsBlacklisted:(id)a3 blacklist:(id)a4;
+ (BOOL)genreIdIsBlacklistedGivenAppBundleId:(id)a3 blacklist:(id)a4;
+ (BOOL)locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4;
+ (BOOL)shouldSampleWithCounterKey:(id)a3 date:(id)a4 samplingRate:(double)a5 maxSamples:(unint64_t)a6;
+ (id)_formattedStringForDate:(id)a3;
+ (void)incrementOnDeviceDailySamplesWithCounterKey:(id)a3 date:(id)a4;
@end

@implementation ATXLaunchAndLocationFilterer

+ (BOOL)locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 timestamp];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 <= 100.0)
  {
    [v5 horizontalAccuracy];
    if (v12 <= 100.0)
    {
      BOOL v14 = 0;
      goto LABEL_10;
    }
    v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v5 horizontalAccuracy];
      int v16 = 134217984;
      double v17 = v13;
      v11 = ": Location uncertainty too large, horizontalAccuracy, %f. Ignoring.";
      goto LABEL_7;
    }
  }
  else
  {
    v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      double v17 = v9;
      v11 = ": Location is stale. Age: %f. Ignoring.";
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

+ (BOOL)appBundleIdIsBlacklisted:(id)a3 blacklist:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 containsObject:v5];
  if (v6)
  {
    v7 = __atxlog_handle_hero();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, ": Bundle Id is blacklisted. Bundle Id: %@. Ignoring.", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)genreIdIsBlacklistedGivenAppBundleId:(id)a3 blacklist:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[_ATXAppInfoManager sharedInstance];
  double v8 = [v7 genreIdForBundleId:v5];

  int v9 = __atxlog_handle_hero();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    BOOL v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "GenreId: %@, BundleId: %@.", (uint8_t *)&v13, 0x16u);
  }

  if (v8 && ![v6 containsObject:v8])
  {
    BOOL v11 = 0;
  }
  else
  {
    id v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      BOOL v14 = v8;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, ": Genre Id is blacklisted. Genre Id: %@. Ignoring.", (uint8_t *)&v13, 0xCu);
    }

    BOOL v11 = 1;
  }

  return v11;
}

+ (BOOL)shouldSampleWithCounterKey:(id)a3 date:(id)a4 samplingRate:(double)a5 maxSamples:(unint64_t)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  BOOL v11 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v12 = a3;
  id v13 = [v11 alloc];
  BOOL v14 = (void *)[v13 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  __int16 v15 = [v12 stringByAppendingString:@".date"];
  id v16 = [v12 stringByAppendingString:@".dailySamplesCount"];

  unint64_t v17 = [v14 integerForKey:v16];
  uint64_t v18 = [v14 stringForKey:v15];
  if (v18) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v17 == 0;
  }
  if (v19)
  {
    v20 = [a1 _formattedStringForDate:v10];
    v21 = v20;
    if (v18)
    {
      int v22 = [v20 isEqualToString:v18];
      BOOL v23 = +[_ATXAggregateLogger yesWithProbability:a5];
      if (v22) {
        BOOL v24 = v17 >= a6;
      }
      else {
        BOOL v24 = 0;
      }
      if (v24)
      {
        v25 = __atxlog_handle_hero();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 134217984;
          double v32 = *(double *)&v17;
          v26 = ": Already reached per device max daily samples: %lu. Ignoring.";
          goto LABEL_21;
        }
LABEL_22:

        BOOL v29 = 0;
        goto LABEL_23;
      }
      if (!v23)
      {
LABEL_12:
        v25 = __atxlog_handle_hero();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 134217984;
          double v32 = a5;
          v26 = ": Did not pass sampling. Sampling rate: %f. Ignoring.";
LABEL_21:
          _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v31, 0xCu);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else if (!+[_ATXAggregateLogger yesWithProbability:a5])
    {
      goto LABEL_12;
    }
    BOOL v29 = 1;
LABEL_23:

    goto LABEL_24;
  }
  v27 = __atxlog_handle_default();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    +[ATXLaunchAndLocationFilterer shouldSampleWithCounterKey:date:samplingRate:maxSamples:](v27);
  }

  [v14 setInteger:0 forKey:v16];
  BOOL v29 = 0;
LABEL_24:

  return v29;
}

+ (void)incrementOnDeviceDailySamplesWithCounterKey:(id)a3 date:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = (void *)[v9 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  BOOL v11 = [v8 stringByAppendingString:@".date"];
  id v12 = [v8 stringByAppendingString:@".dailySamplesCount"];

  id v13 = [v10 stringForKey:v11];
  BOOL v14 = [a1 _formattedStringForDate:v7];

  if (v13 && [v14 isEqualToString:v13])
  {
    uint64_t v15 = [v10 integerForKey:v12] + 1;
    [v10 setInteger:v15 forKey:v12];
    id v16 = __atxlog_handle_hero();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = v15;
      unint64_t v17 = ": Increased daily sample count to: %lu";
      uint64_t v18 = v16;
      uint32_t v19 = 12;
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
    }
  }
  else
  {
    [v10 setInteger:1 forKey:v12];
    [v10 setObject:v14 forKey:v11];
    id v16 = __atxlog_handle_hero();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      unint64_t v17 = ": Received first sample of the day. Set daily sample count to 1.";
      uint64_t v18 = v16;
      uint32_t v19 = 2;
      goto LABEL_7;
    }
  }
}

+ (id)_formattedStringForDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd"];
  id v6 = [v5 stringFromDate:v4];

  return v6;
}

+ (void)shouldSampleWithCounterKey:(os_log_t)log date:samplingRate:maxSamples:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "HERO: There's no date stored, but daily sample count is greater than 0. Setting daily count to 0", v1, 2u);
}

@end