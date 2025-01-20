@interface VCPDataCollection
+ (id)sharedDataCollection;
+ (unint64_t)truncate:(unint64_t)a3;
+ (void)reportMetric:(const __CFString *)a3 withValue:(unint64_t)a4;
- (void)reportBackgroundAnalysisProgressMetrics:(id)a3;
- (void)reportBlacklistedAssetCount:(unint64_t)a3;
- (void)reportDailyBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double)a4;
- (void)reportDatabaseCorruption;
- (void)reportDatabaseSizeBytes:(unint64_t)a3;
- (void)reportLivePhotoStatistics:(id)a3 forPhotoLibrary:(id)a4;
- (void)reportMovieStatistics:(id)a3 forPhotoLibrary:(id)a4;
- (void)reportPhotoStatistics:(id)a3 forPhotoLibrary:(id)a4;
- (void)reportStatistics:(id)a3 forMediaType:(int64_t)a4 forPhotoLibrary:(id)a5;
@end

@implementation VCPDataCollection

+ (id)sharedDataCollection
{
  if (qword_1002524E0 != -1) {
    dispatch_once(&qword_1002524E0, &stru_10021ADD0);
  }
  v2 = (void *)qword_1002524D8;
  return v2;
}

+ (unint64_t)truncate:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 0x64)
  {
    double v4 = floor(log10((double)a3));
    unint64_t v5 = vcvtad_u64_f64(__exp10((double)((int)(v4 + -1.0) & ~((int)(v4 + -1.0) >> 31))));
    return v3 / v5 * v5;
  }
  return v3;
}

+ (void)reportMetric:(const __CFString *)a3 withValue:(unint64_t)a4
{
  unint64_t v6 = +[VCPDataCollection truncate:a4];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = 136315650;
      id v10 = [(__CFString *) (id) (id) a3 UTF8String];
      __int16 v11 = 2048;
      unint64_t v12 = v6;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "  %-73s  %zu (Actual: %zu)", (uint8_t *)&v9, 0x20u);
    }
  }
  ADClientSetValueForScalarKey();
}

- (void)reportStatistics:(id)a3 forMediaType:(int64_t)a4 forPhotoLibrary:(id)a5
{
  id v18 = a3;
  v7 = +[PHAsset vcp_fetchOptionsForLibrary:a5 forTaskID:1];
  os_log_type_t v8 = +[PHAsset fetchAssetsWithMediaType:a4 options:v7];
  unint64_t v9 = (unint64_t)[v8 count];

  if (v9)
  {
    BOOL v10 = a4 == 2;
    +[VCPDataCollection reportMetric:off_10021ADF0[v10] withValue:v9];
    __int16 v11 = (char *)[v18 analyzedDegraded];
    id v12 = [v18 analyzedUndegraded];
    id v13 = [v18 analyzedUndegraded];
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021AE00[v10], [v18 analyzedDegraded]);
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021AE10[v10], [v18 analyzedUndegraded]);
    unint64_t v14 = &v11[(void)v12];
    +[VCPDataCollection reportMetric:off_10021AE20[v10] withValue:v14];
    unint64_t v15 = (100 * (void)v14 + (v9 >> 1)) / v9;
    unint64_t v16 = ((v9 >> 1) + 100 * (void)v13) / v9;
    +[VCPDataCollection reportMetric:off_10021AE30[v10] withValue:v15 - v16];
    +[VCPDataCollection reportMetric:off_10021AE40[v10] withValue:v16];
    +[VCPDataCollection reportMetric:off_10021AE50[v10] withValue:v15];
    if (v9 >= qword_1001F2060[v10])
    {
      if (v9 >= qword_1001F2070[v10])
      {
        +[VCPDataCollection reportMetric:off_10021AEC0[v10] withValue:v15 - v16];
        +[VCPDataCollection reportMetric:off_10021AED0[v10] withValue:v16];
        v17 = off_10021AEE0;
      }
      else
      {
        +[VCPDataCollection reportMetric:off_10021AE90[v10] withValue:v15 - v16];
        +[VCPDataCollection reportMetric:off_10021AEA0[v10] withValue:v16];
        v17 = off_10021AEB0;
      }
    }
    else
    {
      +[VCPDataCollection reportMetric:off_10021AE60[v10] withValue:v15 - v16];
      +[VCPDataCollection reportMetric:off_10021AE70[v10] withValue:v16];
      v17 = off_10021AE80;
    }
    +[VCPDataCollection reportMetric:v17[v10] withValue:v15];
  }
}

- (void)reportPhotoStatistics:(id)a3 forPhotoLibrary:(id)a4
{
}

- (void)reportMovieStatistics:(id)a3 forPhotoLibrary:(id)a4
{
}

- (void)reportLivePhotoStatistics:(id)a3 forPhotoLibrary:(id)a4
{
  id v19 = a3;
  unint64_t v5 = +[PHAsset vcp_fetchOptionsForLibrary:a4 forTaskID:1];
  unint64_t v6 = +[NSPredicate vcp_livePhotosPredicate:0];
  [v5 setPredicate:v6];

  v7 = +[PHAsset fetchAssetsWithOptions:v5];
  unint64_t v8 = (unint64_t)[v7 count];

  id v9 = [v19 analyzedPhotos];
  id v10 = [v19 analyzedMovies];
  [v19 recommendedSec];
  double v12 = v11;
  id v13 = [v19 recommended];
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.livePhotosInLibrary" withValue:v8];
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.livePhotosAnalyzed", [v19 analyzedPhotos]);
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.livePhotosPercentAnalyzed" withValue:(100 * (void)v9 + (v8 >> 1)) / v8];
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.livePhotoMoviesAnalyzed", [v19 analyzedMovies]);
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.livePhotoMoviesPercentAnalyzed" withValue:((v8 >> 1) + 100 * (void)v10) / v8];
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.livePhotoMoviesRecommended", [v19 recommended]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.livePhotoMoviesRecommendedLengthOneSecOrLonger", [v19 recommended1Sec]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.livePhotoMoviesRecommendedLengthTwoSecOrLonger", [v19 recommended2Sec]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.livePhotoMoviesRecommendedLengthThreeSecOrLonger", [v19 recommended3Sec]);
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.livePhotoMoviesAverageRecommendedLength" withValue:vcvtad_u64_f64(v12 / (double)(unint64_t)v13 * 10.0)];
  for (uint64_t i = 0; i != 32; ++i)
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021AEF0[i], [v19 gatingDecisionCounter:i]);
  uint64_t v15 = 0;
  unint64_t v16 = v19;
  do
  {
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021AFF0[v15], [v16 activityDecisionCounter:v15]);
    ++v15;
    unint64_t v16 = v19;
  }
  while (v15 != 12);
  for (uint64_t j = 0; j != 8; ++j)
  {
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021B050[j], [v16 stablizeResultsCounter:j]);
    unint64_t v16 = v19;
  }
  for (uint64_t k = 0; k != 8; ++k)
  {
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021B090[k], [v16 firstFailedSubClassifierCounter:k]);
    unint64_t v16 = v19;
  }
}

- (void)reportBlacklistedAssetCount:(unint64_t)a3
{
}

- (void)reportDatabaseSizeBytes:(unint64_t)a3
{
}

- (void)reportDatabaseCorruption
{
}

- (void)reportDailyBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double)a4
{
  id v88 = a3;
  unint64_t v5 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
  unint64_t v6 = (char *)[v5 longLongValue];
  v7 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"];
  unint64_t v8 = &v6[(void)[v7 longLongValue]];

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.numberOfTimesBackgroundAnalysisScheduled" withValue:(uint64_t)((double)(uint64_t)v8 * a4)];
  id v9 = [v88 objectForKeyedSubscript:@"NumberOfAssetsFullyAnalyzedToday"];
  id v10 = [v9 longLongValue];

  double v11 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
  id v12 = [v11 longLongValue];
  uint64_t v13 = (uint64_t)((double)(uint64_t)v10 * a4);

  double v14 = (double)(uint64_t)v12 * a4;
  uint64_t v15 = (uint64_t)v14;
  if ((uint64_t)v14 >= 1) {
    uint64_t v16 = v13 / (uint64_t)v14;
  }
  else {
    uint64_t v16 = 0;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumAssetsAnalyzedToday" withValue:v13];
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgNumAssetsAnalyzedToday" withValue:v16];
  v17 = [v88 objectForKeyedSubscript:@"NumberOfAssetsPartiallyAnalyzedToday"];
  id v18 = [v17 longLongValue];

  if (v15 >= 1) {
    uint64_t v19 = (uint64_t)((double)(uint64_t)v18 * a4) / v15;
  }
  else {
    uint64_t v19 = 0;
  }
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.totalNumAssetsPartiallyAnalyzedToday");
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgNumAssetsPartiallyAnalyzedToday" withValue:v19];
  v20 = [v88 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisToday"];
  id v21 = [v20 longLongValue];

  v22 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
  id v23 = [v22 longLongValue];

  double v24 = (double)(uint64_t)v23 * a4;
  if ((uint64_t)v24 >= 1) {
    uint64_t v25 = (uint64_t)((double)(uint64_t)v21 * a4) / (uint64_t)v24;
  }
  else {
    uint64_t v25 = 0;
  }
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithPendingAnalysisToday");
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithPendingAnalysisToday" withValue:v25];
  v26 = [v88 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisToday"];
  id v27 = [v26 longLongValue];

  v28 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"];
  id v29 = [v28 longLongValue];

  double v30 = (double)(uint64_t)v29 * a4;
  if ((uint64_t)v30 >= 1) {
    uint64_t v31 = (uint64_t)((double)(uint64_t)v27 * a4) / (uint64_t)v30;
  }
  else {
    uint64_t v31 = 0;
  }
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithoutPendingAnalysisToday");
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithoutPendingAnalysisToday" withValue:v31];
  v32 = [v88 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"];
  uint64_t v33 = (uint64_t)[v32 longLongValue];

  v34 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"];
  uint64_t v35 = (uint64_t)[v34 longLongValue];

  if (v35 < 1) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v33 / v35;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithPendingAnalysisInLatestVersion" withValue:v33];
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithPendingAnalysisInLatestVersion" withValue:v36];
  v37 = [v88 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"];
  uint64_t v38 = (uint64_t)[v37 longLongValue];

  v39 = [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"];
  uint64_t v40 = (uint64_t)[v39 longLongValue];

  if (v40 < 1) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = v38 / v40;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithoutPendingAnalysisInLatestVersion" withValue:v38];
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithoutPendingAnalysisInLatestVersion" withValue:v41];
  v42 = [v88 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedToday"];
  uint64_t v43 = (uint64_t)((double)(uint64_t)[v42 longLongValue] * a4);

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumMovieAssetsAnalyzedToday" withValue:v43];
  v44 = [v88 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedToday"];
  uint64_t v45 = (uint64_t)((double)(uint64_t)[v44 longLongValue] * a4);

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumPhotoAssetsAnalyzedToday" withValue:v45];
  v46 = [v88 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedToday"];
  uint64_t v47 = (uint64_t)((double)(uint64_t)[v46 longLongValue] * a4);

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumLivePhotoAssetsAnalyzedToday" withValue:v47];
  v48 = [v88 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedToday"];
  uint64_t v49 = (uint64_t)((double)(uint64_t)[v48 longLongValue] * a4);

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalMovieDurationAnalyzedToday" withValue:v49];
  v50 = [v88 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedToday"];
  id v51 = [v50 longLongValue];

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumMovieAssetsPartiallyAnalyzedToday" withValue:(unint64_t)((double)(uint64_t)v51 * a4)];
  v52 = [v88 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedToday"];
  id v53 = [v52 longLongValue];

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumPhotoAssetsPartiallyAnalyzedToday" withValue:(unint64_t)((double)(uint64_t)v53 * a4)];
  v54 = [v88 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedToday"];
  id v55 = [v54 longLongValue];

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalNumLivePhotoAssetsPartiallyAnalyzedToday" withValue:(unint64_t)((double)(uint64_t)v55 * a4)];
  v56 = [v88 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedToday"];
  id v57 = [v56 longLongValue];

  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.totalMovieDurationPartiallyAnalyzedToday" withValue:(unint64_t)((double)(uint64_t)v57 * a4)];
  v58 = [v88 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"];
  uint64_t v59 = (uint64_t)[v58 longLongValue];

  v60 = [v88 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedInLatestVersion"];
  uint64_t v61 = (uint64_t)[v60 longLongValue];

  if (v61 < 1) {
    uint64_t v62 = 0;
  }
  else {
    uint64_t v62 = v59 / v61;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeAnalyzingAPhotoInLatestVersion" withValue:v62];
  v63 = [v88 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"];
  uint64_t v64 = (uint64_t)[v63 longLongValue];

  v65 = [v88 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"];
  uint64_t v66 = (uint64_t)[v65 longLongValue];

  if (v66 < 1) {
    uint64_t v67 = 0;
  }
  else {
    uint64_t v67 = v64 / v66;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeAnalyzingALivePhotoInLatestVersion" withValue:v67];
  v68 = [v88 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedInLatestVersion"];
  uint64_t v69 = (uint64_t)[v68 longLongValue];

  v70 = [v88 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedInLatestVersion"];
  uint64_t v71 = (uint64_t)[v70 longLongValue];

  if (v71 < 1) {
    uint64_t v72 = 0;
  }
  else {
    uint64_t v72 = v69 / v71;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimeAnalyzingAMovieSecondInLatestVersion" withValue:v72];
  v73 = [v88 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"];
  uint64_t v74 = (uint64_t)[v73 longLongValue];

  v75 = [v88 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"];
  uint64_t v76 = (uint64_t)[v75 longLongValue];

  if (v76 < 1) {
    uint64_t v77 = 0;
  }
  else {
    uint64_t v77 = v74 / v76;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimePartiallyAnalyzingAPhotoInLatestVersion" withValue:v77];
  v78 = [v88 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"];
  uint64_t v79 = (uint64_t)[v78 longLongValue];

  v80 = [v88 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"];
  uint64_t v81 = (uint64_t)[v80 longLongValue];

  if (v81 < 1) {
    uint64_t v82 = 0;
  }
  else {
    uint64_t v82 = v79 / v81;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimePartiallyAnalyzingALivePhotoInLatestVersion" withValue:v82];
  v83 = [v88 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedInLatestVersion"];
  uint64_t v84 = (uint64_t)[v83 longLongValue];

  v85 = [v88 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"];
  uint64_t v86 = (uint64_t)[v85 longLongValue];

  if (v86 < 1) {
    uint64_t v87 = 0;
  }
  else {
    uint64_t v87 = v84 / v86;
  }
  +[VCPDataCollection reportMetric:@"com.apple.mediaanalysisd.avgTimePartiallyAnalyzingAMovieSecondInLatestVersion" withValue:v87];
}

- (void)reportBackgroundAnalysisProgressMetrics:(id)a3
{
  id v7 = a3;
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numAssetsUnanalyzedWithResources", [v7 numAssetsUnanalyzedWithResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numAssetsUnanalyzedWithoutResources", [v7 numAssetsUnanalyzedWithoutResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numNewAssetsUnanalyzedWithResources", [v7 numNewAssetsUnanalyzedWithResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numNewAssetsUnanalyzedWithoutResources", [v7 numNewAssetsUnanalyzedWithoutResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numExistingAssetsUnanalyzedWithResources", [v7 numExistingAssetsUnanalyzedWithResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numExistingAssetsUnanalyzedWithoutResources", [v7 numExistingAssetsUnanalyzedWithoutResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numExistingAssetsNotUpdatedWithResources", [v7 numExistingAssetsNotUpdatedWithResources]);
  +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", @"com.apple.mediaanalysisd.numExistingAssetsNotUpdatedWithoutResources", [v7 numExistingAssetsNotUpdatedWithoutResources]);
  for (uint64_t i = 0; i != 11; ++i)
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021B0D0[i], [v7 unanalyzedWithResourcesCounter:i]);
  for (uint64_t j = 0; j != 11; ++j)
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021B128[j], [v7 unanalyzedWithoutResourcesCounter:j]);
  for (uint64_t k = 0; k != 11; ++k)
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021B180[k], [v7 analyzedWithResourcesCounter:k]);
  for (uint64_t m = 0; m != 11; ++m)
    +[VCPDataCollection reportMetric:withValue:](VCPDataCollection, "reportMetric:withValue:", off_10021B1D8[m], [v7 analyzedWithoutResourcesCounter:m]);
}

@end