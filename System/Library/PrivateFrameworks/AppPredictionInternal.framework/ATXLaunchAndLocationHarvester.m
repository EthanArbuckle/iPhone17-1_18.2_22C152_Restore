@interface ATXLaunchAndLocationHarvester
+ (BOOL)_passedAppOrClipSpecificFiltersGivenBundleId:(id)a3 date:(id)a4 isClip:(BOOL)a5 counterKey:(id)a6 samplingRate:(double)a7 maxSamples:(unint64_t)a8;
+ (BOOL)_passedGeneralFiltersGivenLocation:(id)a3 date:(id)a4;
+ (id)_awdMetricsObjectWithLocation:(id)a3 date:(id)a4 bundleId:(id)a5 urlHash:(id)a6 isClip:(BOOL)a7 launchReason:(int)a8 isNegativeSession:(BOOL)a9;
+ (void)_postAwdMetrics:(id)a3;
+ (void)logAppOrClipLaunch:(id)a3 isNegativeSession:(BOOL)a4;
@end

@implementation ATXLaunchAndLocationHarvester

+ (void)logAppOrClipLaunch:(id)a3 isNegativeSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = __atxlog_handle_hero();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      v8 = @"negative";
    }
    else {
      v8 = @"positive";
    }
    v9 = [v6 bundleId];
    v10 = [v6 urlHash];
    if (v10)
    {
      v11 = [v6 urlHash];
    }
    else
    {
      v11 = @"NULL URL hash";
    }
    *(_DWORD *)buf = 138412802;
    v39 = v8;
    __int16 v40 = 2112;
    v41 = v9;
    __int16 v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, ": Received %@ session to harvest. Bundle Id: %@ URLHash: %@", buf, 0x20u);
    if (v10) {
  }
    }
  [v6 latitude];
  double v12 = *MEMORY[0x1E4F67E80];
  if (v13 == *MEMORY[0x1E4F67E80] && ([v6 longitude], v14 == v12))
  {
    v28 = [MEMORY[0x1E4F935D0] sharedInstance];
    v19 = [v28 getCurrentLocation];

    if (v19)
    {
LABEL_14:
      v20 = +[_ATXGlobals sharedInstance];
      if ([v6 isClip])
      {
        v21 = +[ATXHeroAndClipConstants sharedInstance];
        uint64_t v22 = [v21 appClipShadowLogSamplesPerDay];

        [v20 launchAndLocationHarvesterSamplingRate];
        double v24 = v23;
        v25 = [@"LaunchAndLocationHavester" stringByAppendingString:@".appClip"];
        if ([v6 launchReason] == 3 || objc_msgSend(v6, "launchReason") == 2)
        {
          if (v4) {
            v26 = @".negativeSession";
          }
          else {
            v26 = @".positiveSession";
          }
          uint64_t v29 = [v25 stringByAppendingString:v26];
LABEL_30:

          int v30 = 0;
          v25 = (void *)v29;
LABEL_31:
          v31 = [MEMORY[0x1E4F1C9C8] now];
          if (!v30
            || [a1 _passedGeneralFiltersGivenLocation:v19 date:v31]
            && ([v6 bundleId],
                v32 = objc_claimAutoreleasedReturnValue(),
                int v33 = objc_msgSend(a1, "_passedAppOrClipSpecificFiltersGivenBundleId:date:isClip:counterKey:samplingRate:maxSamples:", v32, v31, objc_msgSend(v6, "isClip"), v25, v22, v24), v32, v33))
          {
            v34 = [v6 bundleId];
            v35 = [v6 urlHash];
            LOBYTE(v37) = v4;
            v36 = objc_msgSend(a1, "_awdMetricsObjectWithLocation:date:bundleId:urlHash:isClip:launchReason:isNegativeSession:", v19, v31, v34, v35, objc_msgSend(v6, "isClip"), objc_msgSend(v6, "launchReason"), v37);

            [a1 _postAwdMetrics:v36];
            +[ATXLaunchAndLocationFilterer incrementOnDeviceDailySamplesWithCounterKey:v25 date:v31];
          }
          goto LABEL_35;
        }
        if (!v4)
        {
          int v30 = 1;
          goto LABEL_31;
        }
        v31 = __atxlog_handle_hero();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
LABEL_39:
        }
          +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:isNegativeSession:](v31);
      }
      else
      {
        v25 = [@"LaunchAndLocationHavester" stringByAppendingString:@".app"];
        if ([v6 launchReason] == 3 || objc_msgSend(v6, "launchReason") == 2)
        {
          if (v4) {
            v27 = @".negativeSession";
          }
          else {
            v27 = @".positiveSession";
          }
          uint64_t v29 = [v25 stringByAppendingString:v27];
          double v24 = 1.0;
          uint64_t v22 = -1;
          goto LABEL_30;
        }
        if (!v4)
        {
          int v30 = 0;
          double v24 = 1.0;
          uint64_t v22 = -1;
          goto LABEL_31;
        }
        v31 = __atxlog_handle_hero();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
      }
LABEL_35:

      goto LABEL_36;
    }
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v6 latitude];
    double v17 = v16;
    [v6 longitude];
    v19 = (void *)[v15 initWithLatitude:v17 longitude:v18];
    if (v19) {
      goto LABEL_14;
    }
  }
  v20 = __atxlog_handle_hero();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, ": Received nil location. Ignoring", buf, 2u);
  }
LABEL_36:
}

+ (BOOL)_passedAppOrClipSpecificFiltersGivenBundleId:(id)a3 date:(id)a4 isClip:(BOOL)a5 counterKey:(id)a6 samplingRate:(double)a7 maxSamples:(unint64_t)a8
{
  return +[ATXLaunchAndLocationFilterer shouldSampleWithCounterKey:a6 date:a4 samplingRate:a8 maxSamples:a7];
}

+ (BOOL)_passedGeneralFiltersGivenLocation:(id)a3 date:(id)a4
{
  return !+[ATXLaunchAndLocationFilterer locationIsStaleOrNotAccurateEnough:a3 now:a4];
}

+ (id)_awdMetricsObjectWithLocation:(id)a3 date:(id)a4 bundleId:(id)a5 urlHash:(id)a6 isClip:(BOOL)a7 launchReason:(int)a8 isNegativeSession:(BOOL)a9
{
  BOOL v9 = a7;
  double v13 = (void *)MEMORY[0x1E4F1C9A8];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  double v18 = [v13 currentCalendar];
  v19 = [v18 components:32 fromDate:v16];

  v20 = objc_opt_new();
  v21 = (void *)[v15 copy];

  [v20 setBundleId:v21];
  [v17 coordinate];
  *(float *)&double v22 = v22;
  [v20 setLatitude:v22];
  [v17 coordinate];
  *(float *)&double v24 = v23;
  [v20 setLongitude:v24];
  [v17 horizontalAccuracy];
  double v26 = v25;

  [v20 setLocationAccuracy:v26];
  objc_msgSend(v20, "setTimeBucket:", objc_msgSend(v19, "hour"));
  v27 = [MEMORY[0x1E4F935D0] sharedInstance];
  objc_msgSend(v20, "setIsTourist:", objc_msgSend(v27, "isTourist"));

  [v20 setUrlHash:v14];
  [v20 setIsClip:v9];
  [v20 setLaunchReason:a8];
  [v20 setIsNegativeSession:a9];

  return v20;
}

+ (void)_postAwdMetrics:(id)a3
{
}

+ (void)logAppOrClipLaunch:(os_log_t)log isNegativeSession:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Received negative session from a non-proactive UI", v1, 2u);
}

@end