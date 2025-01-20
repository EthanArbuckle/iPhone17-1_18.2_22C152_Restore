@interface ATXHeroDataServerHelper
+ (BOOL)canPredictClipsGivenRecentMotion;
+ (BOOL)isPredictionInRadius:(id)a3 currentLocation:(id)a4;
+ (id)bundleIdForPrediction:(id)a3;
+ (id)heroAppPredictionsSortedByDistance:(id)a3 currentLocation:(id)a4;
+ (id)inRadiusPredictionsFrom:(id)a3 currentLocation:(id)a4;
@end

@implementation ATXHeroDataServerHelper

+ (id)bundleIdForPrediction:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 bundleId];
  v5 = (void *)*MEMORY[0x1E4F67E90];
  char v6 = [v4 isEqualToString:*MEMORY[0x1E4F67E90]];

  if ((v6 & 1) == 0)
  {
    id v8 = [v3 bundleId];
    goto LABEL_5;
  }
  uint64_t v7 = [v3 adamId];
  if (v7 == *MEMORY[0x1E4F67E88])
  {
    id v8 = v5;
LABEL_5:
    id v9 = v8;
    goto LABEL_15;
  }
  v10 = objc_msgSend(MEMORY[0x1E4F4AF00], "bundleIdForAdamIdIfInstalled:", objc_msgSend(v3, "adamId"));
  if (!v10)
  {
    v13 = __atxlog_handle_hero();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "adamId"));
      int v17 = 138412290;
      v18 = v14;
      v15 = "Adam id: %@ is not installed or is restricted.";
      goto LABEL_12;
    }
LABEL_13:

    v12 = v5;
    goto LABEL_14;
  }
  int v11 = [MEMORY[0x1E4F4AF00] isAppClipForBundleId:v10];
  v12 = v10;
  if (v11)
  {
    v13 = __atxlog_handle_hero();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v3 bundleId];
      int v17 = 138412290;
      v18 = v14;
      v15 = "App clip predicted as a Hero App. Ignoring. BundleId: %@";
LABEL_12:
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:
  id v9 = v12;

LABEL_15:
  return v9;
}

+ (id)inRadiusPredictionsFrom:(id)a3 currentLocation:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__ATXHeroDataServerHelper_inRadiusPredictionsFrom_currentLocation___block_invoke;
  v10[3] = &unk_1E68B6898;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v10);

  return v8;
}

uint64_t __67__ATXHeroDataServerHelper_inRadiusPredictionsFrom_currentLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) isPredictionInRadius:a2 currentLocation:*(void *)(a1 + 32)];
}

+ (BOOL)isPredictionInRadius:(id)a3 currentLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[ATXHeroAndClipConstants sharedInstance];
  [v5 latitude];
  double v8 = *MEMORY[0x1E4F67E80];
  if (v9 == *MEMORY[0x1E4F67E80] && ([v5 longitude], v10 == v8))
  {
    BOOL v11 = 1;
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v5 latitude];
    double v14 = v13;
    [v5 longitude];
    v16 = (void *)[v12 initWithLatitude:v14 longitude:v15];
    [v6 distanceFromLocation:v16];
    double v18 = v17;

    [v6 horizontalAccuracy];
    if (v19 < 0.0 || (double v20 = v19, [v7 heroAppWorstCaseLocationAccuracy], v20 > v21))
    {
      [v7 heroAppWorstCaseLocationAccuracy];
      double v20 = v22;
    }
    BOOL v11 = v18 <= v20 + (double)(unint64_t)[v5 radiusInMeters];
  }

  return v11;
}

+ (BOOL)canPredictClipsGivenRecentMotion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[_ATXGlobals sharedInstance];
  int v3 = [v2 disableLocationQualityChecksForHeroApp];

  if (v3)
  {
    __atxlog_handle_hero();
    v4 = (ATXPredictionContextBuilder *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D0FA3000, &v4->super, OS_LOG_TYPE_DEFAULT, "Not filtering by motion because testing mode is enabled", (uint8_t *)&v12, 2u);
    }
    LOBYTE(v5) = 1;
  }
  else
  {
    v4 = objc_alloc_init(ATXPredictionContextBuilder);
    id v6 = [(ATXPredictionContextBuilder *)v4 predictionContextForCurrentContext];
    id v7 = v6;
    if (v6)
    {
      double v8 = [v6 locationMotionContext];
      int v5 = [v8 canPredictClipsGivenRecentMotion];

      double v9 = __atxlog_handle_hero();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = @"NO";
        if (v5) {
          double v10 = @"YES";
        }
        int v12 = 138412290;
        double v13 = v10;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Are clips eligible according to motion: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (id)heroAppPredictionsSortedByDistance:(id)a3 currentLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_hero();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Sorting predictions based on distance.", buf, 2u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__ATXHeroDataServerHelper_heroAppPredictionsSortedByDistance_currentLocation___block_invoke;
    v11[3] = &unk_1E68B68C0;
    id v12 = v6;
    id v9 = [v5 sortedArrayUsingComparator:v11];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Cant sort predictions with nil location. Returning as is", buf, 2u);
    }

    id v9 = v5;
  }

  return v9;
}

uint64_t __78__ATXHeroDataServerHelper_heroAppPredictionsSortedByDistance_currentLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 alloc];
  [v8 latitude];
  double v11 = v10;
  [v8 longitude];
  double v13 = v12;

  uint64_t v14 = (void *)[v9 initWithLatitude:v11 longitude:v13];
  [v5 distanceFromLocation:v14];
  double v16 = v15;

  double v17 = *(void **)(a1 + 32);
  id v18 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [v7 latitude];
  double v20 = v19;
  [v7 longitude];
  double v22 = v21;

  v23 = (void *)[v18 initWithLatitude:v20 longitude:v22];
  [v17 distanceFromLocation:v23];
  double v25 = v24;

  if (v16 < v25) {
    return -1;
  }
  else {
    return v16 > v25;
  }
}

@end