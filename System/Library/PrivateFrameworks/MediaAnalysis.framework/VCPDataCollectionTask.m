@interface VCPDataCollectionTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (BOOL)queryBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double *)a4;
- (VCPDataCollectionTask)initWithPhotoLibrary:(id)a3;
- (int)_collectAndReportProgress;
- (int)mainInternal;
- (int)processAssetBatch:(id)a3 withDatabase:(id)a4 andStatistics:(id)a5 andVersionTime:(int64_t)a6 andCurrentTime:(int64_t)a7;
- (int)resetBackgroundAnalysisMetrics;
- (int)resetDailyBackgroundAnalysisMetrics;
- (int)updateAnalysisProgressMetrics:(id)a3;
- (int)updateLivePhotoEffectsStatistics:(id)a3;
- (int)updateLivePhotoStatistics:(id)a3 withFetchResult:(id)a4 forAnalysisTypes:(id)a5;
- (void)updateAnalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 timeElapsed:(int64_t)a5;
- (void)updateOutdatedProgressStatistics:(id)a3 hasResource:(BOOL)a4;
- (void)updateUnanalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 isNewAsset:(BOOL)a5 timeElapsed:(int64_t)a6;
@end

@implementation VCPDataCollectionTask

- (VCPDataCollectionTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPDataCollectionTask;
  v5 = [(VCPTask *)&v9 initWithPhotoLibrary:v4];
  if (v5)
  {
    uint64_t v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v4];
    database = v5->_database;
    v5->_database = (VCPDatabaseWriter *)v6;
  }
  return v5;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (int)updateLivePhotoStatistics:(id)a3 withFetchResult:(id)a4 forAnalysisTypes:(id)a5
{
  id v32 = a3;
  id v8 = a4;
  id v30 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v38;
    uint64_t v11 = VCPMAFullAnalysisTypesImage;
    uint64_t v12 = VCPMAFullAnalysisTypesLivePhoto;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v14, "vcp_isLivePhoto"))
        {
          v15 = [v14 localIdentifier];
          v16 = [v30 objectForKey:v15];
          unint64_t v17 = (unint64_t)[v16 unsignedIntegerValue];

          if ((v11 & ~v17) == 0) {
            objc_msgSend(v32, "setAnalyzedPhotos:", (char *)objc_msgSend(v32, "analyzedPhotos") + 1);
          }
          if ((v12 & ~v17) == 0)
          {
            database = self->_database;
            id v36 = 0;
            id v19 = (id)[(VCPDatabaseWriter *)database queryAnalysisResultWithType:24 forAsset:v15 result:&v36];
            id v20 = v36;
            v21 = v20;
            if (v19 == -108 || v19 == -36)
            {
              id v22 = v19;
            }
            else
            {
              id v22 = v19;
              if (v19 != -23) {
                id v22 = v5;
              }
            }
            if (v19 != -108 && v19 != -36 && v19 != -23)
            {
              if ([v20 count])
              {
                memset(v35, 0, sizeof(v35));
                long long v34 = 0u;
                v23 = [v21 objectAtIndexedSubscript:0];
                v24 = v23;
                if (v23)
                {
                  objc_msgSend(v23, "vcp_timerange");
                }
                else
                {
                  memset(v35, 0, sizeof(v35));
                  long long v34 = 0u;
                }

                if ((BYTE12(v34) & 1) != 0
                  && (BYTE4(v35[1]) & 1) != 0
                  && !*((void *)&v35[1] + 1)
                  && (*((void *)&v35[0] + 1) & 0x8000000000000000) == 0)
                {
                  CMTime time = *(CMTime *)((char *)v35 + 8);
                  double Seconds = CMTimeGetSeconds(&time);
                  double v26 = Seconds;
                  if (Seconds >= 3.0)
                  {
                    objc_msgSend(v32, "setRecommended3Sec:", (char *)objc_msgSend(v32, "recommended3Sec") + 1);
                  }
                  else if (Seconds >= 2.0)
                  {
                    objc_msgSend(v32, "setRecommended2Sec:", (char *)objc_msgSend(v32, "recommended2Sec") + 1);
                  }
                  else if (Seconds >= 1.0)
                  {
                    objc_msgSend(v32, "setRecommended1Sec:", (char *)objc_msgSend(v32, "recommended1Sec") + 1);
                  }
                  [v32 recommendedSec];
                  [v32 setRecommendedSec:v26 + v27];
                  objc_msgSend(v32, "setRecommended:", (char *)objc_msgSend(v32, "recommended") + 1);
                }
              }
              objc_msgSend(v32, "setAnalyzedMovies:", (char *)objc_msgSend(v32, "analyzedMovies") + 1);
            }

            if (v19 == -108 || v19 == -36 || v19 == -23)
            {

              goto LABEL_43;
            }
            id v5 = v22;
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  LODWORD(v22) = 0;
LABEL_43:

  return (int)v22;
}

- (int)updateLivePhotoEffectsStatistics:(id)a3
{
  id v4 = a3;
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v4, "addCount:toGatingDecisionCounter:", -[VCPDatabaseWriter getAssetCountMatchingAllFlags:](self->_database, "getAssetCountMatchingAllFlags:", (256 << i) | 2), i);
  for (uint64_t j = 0; j != 12; ++j)
    objc_msgSend(v4, "addCount:toActivityDecisionCounter:", -[VCPDatabaseWriter getAssetCountMatchingAllFlags:](self->_database, "getAssetCountMatchingAllFlags:", (0x10000000000 << j) | 2), j);
  for (uint64_t k = 0; k != 8; ++k)
    objc_msgSend(v4, "addCount:toStablizeResultsCounter:", -[VCPDatabaseWriter getAssetCountMatchingAllFlags:](self->_database, "getAssetCountMatchingAllFlags:", (0x10000000000000 << k) | 2), k);
  objc_msgSend(v4, "addCount:toFirstFailedSubClassifierCounter:", -[VCPDatabaseWriter getAssetCountMatchingAllFlags:](self->_database, "getAssetCountMatchingAllFlags:", 0x8000000002), 0);
  uint64_t v8 = 0;
  uint64_t v9 = 1792;
  uint64_t v10 = 1;
  uint64_t v11 = 4;
  do
  {
    objc_msgSend(v4, "addCount:toFirstFailedSubClassifierCounter:", -[VCPDatabaseWriter getAssetCountMatchingAllFlags:andAnyFlags:](self->_database, "getAssetCountMatchingAllFlags:andAnyFlags:", v8 | 2, v9), v10);
    v8 |= 128 << v11;
    v9 *= 16;
    ++v10;
    v11 += 4;
  }
  while (v10 != 8);
  objc_msgSend(v4, "addLivePhotoEffectsAnalyzedCount:", -[VCPDatabaseWriter getAssetCountMatchingAllFlags:](self->_database, "getAssetCountMatchingAllFlags:", 2));

  return 0;
}

- (int)resetDailyBackgroundAnalysisMetrics
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Resetting daily background analysis metrics", v9, 2u);
    }
  }
  id v5 = +[NSDate now];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = (uint64_t)v6;

  int result = [(VCPDatabaseWriter *)self->_database setValue:v7 forKey:@"DailyProcessTimeStamp"];
  if (!result)
  {
    int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfAssetsFullyAnalyzedToday"];
    if (!result)
    {
      int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeRunningWithPendingAnalysisToday"];
      if (!result)
      {
        int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeRunningWithoutPendingAnalysisToday"];
        if (!result)
        {
          int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
          if (!result)
          {
            int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"];
            if (!result)
            {
              int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfMoviesFullyAnalyzedToday"];
              if (!result)
              {
                int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfImagesFullyAnalyzedToday"];
                if (!result)
                {
                  int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfLivePhotosFullyAnalyzedToday"];
                  if (!result)
                  {
                    int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"MovieDurationFullyAnalyzedToday"];
                    if (!result)
                    {
                      int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfMoviesPartiallyAnalyzedToday"];
                      if (!result)
                      {
                        int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfImagesPartiallyAnalyzedToday"];
                        if (!result)
                        {
                          int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfLivePhotosPartiallyAnalyzedToday"];
                          if (!result)
                          {
                            int result = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"MovieDurationPartiallyAnalyzedToday"];
                            if (!result) {
                              return [(VCPDatabaseWriter *)self->_database commit];
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (int)resetBackgroundAnalysisMetrics
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Initializing background analysis metrics", v18, 2u);
    }
  }
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  database = self->_database;
  uint64_t v9 = VCPVersionKeyForTask(1);
  int v10 = [(VCPDatabaseWriter *)database setValue:70 forKey:v9];

  if (!v10)
  {
    uint64_t v11 = self->_database;
    uint64_t v12 = VCPStartTimestampKeyForTask(1);
    int v10 = [(VCPDatabaseWriter *)v11 setValue:(uint64_t)v7 forKey:v12];

    if (!v10)
    {
      v13 = self->_database;
      v14 = VCPCompleteTimestampKeyForTask(1, 0);
      int v10 = [(VCPDatabaseWriter *)v13 removeKey:v14];

      if (!v10)
      {
        v15 = self->_database;
        v16 = VCPCompleteTimestampKeyForTask(1, 1);
        int v10 = [(VCPDatabaseWriter *)v15 removeKey:v16];

        if (!v10)
        {
          int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"];
          if (!v10)
          {
            int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"];
            if (!v10)
            {
              int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"];
              if (!v10)
              {
                int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"];
                if (!v10)
                {
                  int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfMoviesFullyAnalyzedInLatestVersion"];
                  if (!v10)
                  {
                    int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfImagesFullyAnalyzedInLatestVersion"];
                    if (!v10)
                    {
                      int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"];
                      if (!v10)
                      {
                        int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeSpentFullyAnalyzingMovieInLatestVersion"];
                        if (!v10)
                        {
                          int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"];
                          if (!v10)
                          {
                            int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"];
                            if (!v10)
                            {
                              int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"MovieDurationFullyAnalyzedInLatestVersion"];
                              if (!v10)
                              {
                                int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"];
                                if (!v10)
                                {
                                  int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"];
                                  if (!v10)
                                  {
                                    int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"];
                                    if (!v10)
                                    {
                                      int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeSpentPartiallyAnalyzingMovieInLatestVersion"];
                                      if (!v10)
                                      {
                                        int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"];
                                        if (!v10)
                                        {
                                          int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"];
                                          if (!v10)
                                          {
                                            int v10 = [(VCPDatabaseWriter *)self->_database setValue:0 forKey:@"MovieDurationPartiallyAnalyzedInLatestVersion"];
                                            if (!v10)
                                            {
                                              int v10 = [(VCPDatabaseWriter *)self->_database commit];
                                              if (!v10) {
                                                return [(VCPDataCollectionTask *)self resetDailyBackgroundAnalysisMetrics];
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

- (void)updateUnanalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 isNewAsset:(BOOL)a5 timeElapsed:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v14 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setNumAssetsUnanalyzedWithResources:", (char *)objc_msgSend(v9, "numAssetsUnanalyzedWithResources") + 1);
    if (v7) {
      objc_msgSend(v14, "setNumNewAssetsUnanalyzedWithResources:", (char *)objc_msgSend(v14, "numNewAssetsUnanalyzedWithResources") + 1);
    }
    else {
      objc_msgSend(v14, "setNumExistingAssetsUnanalyzedWithResources:", (char *)objc_msgSend(v14, "numExistingAssetsUnanalyzedWithResources") + 1);
    }
    uint64_t v10 = 10;
    while (v10 != -1)
    {
      int64_t v11 = qword_1001F20D0[v10--];
      if (v11 <= a6)
      {
        [v14 addUnanalyzedWithResourcesCounter:v10 + 1];
        break;
      }
    }
  }
  else
  {
    objc_msgSend(v9, "setNumAssetsUnanalyzedWithoutResources:", (char *)objc_msgSend(v9, "numAssetsUnanalyzedWithoutResources") + 1);
    if (v7) {
      objc_msgSend(v14, "setNumNewAssetsUnanalyzedWithoutResources:", (char *)objc_msgSend(v14, "numNewAssetsUnanalyzedWithoutResources") + 1);
    }
    else {
      objc_msgSend(v14, "setNumExistingAssetsUnanalyzedWithoutResources:", (char *)objc_msgSend(v14, "numExistingAssetsUnanalyzedWithoutResources") + 1);
    }
    uint64_t v12 = 10;
    while (v12 != -1)
    {
      int64_t v13 = qword_1001F20D0[v12--];
      if (v13 <= a6)
      {
        [v14 addUnanalyzedWithoutResourcesCounter:v12 + 1];
        break;
      }
    }
  }
}

- (void)updateOutdatedProgressStatistics:(id)a3 hasResource:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4) {
    objc_msgSend(v5, "setNumExistingAssetsNotUpdatedWithResources:", (char *)objc_msgSend(v5, "numExistingAssetsNotUpdatedWithResources") + 1);
  }
  else {
    objc_msgSend(v5, "setNumExistingAssetsNotUpdatedWithoutResources:", (char *)objc_msgSend(v5, "numExistingAssetsNotUpdatedWithoutResources") + 1);
  }
}

- (void)updateAnalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 timeElapsed:(int64_t)a5
{
  id v10 = a3;
  uint64_t v7 = 10;
  if (a4)
  {
    while (v7 != -1)
    {
      int64_t v8 = qword_1001F20D0[v7--];
      if (v8 <= a5)
      {
        [v10 addAnalyzedWithResourcesCounter:v7 + 1];
        break;
      }
    }
  }
  else
  {
    while (v7 != -1)
    {
      int64_t v9 = qword_1001F20D0[v7--];
      if (v9 <= a5)
      {
        [v10 addAnalyzedWithoutResourcesCounter:v7 + 1];
        break;
      }
    }
  }
}

- (int)processAssetBatch:(id)a3 withDatabase:(id)a4 andStatistics:(id)a5 andVersionTime:(int64_t)a6 andCurrentTime:(int64_t)a7
{
  id v9 = a3;
  id v40 = a4;
  id v48 = a5;
  v51 = +[NSMutableArray array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(obj);
        }
        int64_t v13 = [*(id *)(*((void *)&v56 + 1) + 8 * i) localIdentifier];
        [v51 addObject:v13];
      }
      id v10 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v10);
  }

  v47 = +[NSMutableDictionary dictionary];
  int v14 = objc_msgSend(v40, "queryHeadersForAssets:analyses:", v51);
  if (!v14)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v43 = obj;
    id v15 = [v43 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v15)
    {
      uint64_t v45 = *(void *)v53;
      id v41 = (id)MediaAnalysisTypeAllInternal;
      do
      {
        v16 = 0;
        id v49 = v15;
        do
        {
          if (*(void *)v53 != v45) {
            objc_enumerationMutation(v43);
          }
          unint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v16);
          id v19 = [v17 creationDate];
          [v19 timeIntervalSinceReferenceDate];
          double v21 = v20;

          id v22 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v17];
          id v23 = objc_msgSend(v17, "vcp_fullAnalysisTypesForResources:", v22);
          id v24 = objc_msgSend(v17, "vcp_fullAnalysisTypes");
          v25 = [v17 localIdentifier];
          double v26 = [v47 objectForKeyedSubscript:v25];

          int64_t v27 = (uint64_t)v21;
          if (v26)
          {
            if (MediaAnalysisTypesUpdatedSince(objc_msgSend(v26, "vcp_version"), v17))
            {
              [(VCPDataCollectionTask *)self updateUnanalyzedProgressStatistics:v48 hasResource:v24 == v23 isNewAsset:v27 > a6 timeElapsed:a7 - a6];
            }
            else
            {
              v29 = objc_msgSend(v26, "vcp_dateModified");
              id v30 = objc_msgSend(v17, "vcp_modificationDate");
              unsigned __int8 v31 = [v29 isEqualToDate:v30];

              if (v31)
              {
                id v32 = objc_msgSend(v26, "vcp_dateAnalyzed");
                [v32 timeIntervalSinceReferenceDate];
                double v34 = v33;

                id v35 = objc_msgSend(v26, "vcp_types");
                int64_t v36 = a6;
                if (v27 > a6) {
                  int64_t v36 = v27;
                }
                BOOL v38 = v35 == v41 || v24 == v23;
                [(VCPDataCollectionTask *)self updateAnalyzedProgressStatistics:v48 hasResource:v38 timeElapsed:((uint64_t)v34 - v36) & ~(((uint64_t)v34 - v36) >> 63)];
              }
              else
              {
                [(VCPDataCollectionTask *)self updateOutdatedProgressStatistics:v48 hasResource:v24 == v23];
              }
            }
          }
          else
          {
            int64_t v28 = a6;
            if (v27 > a6) {
              int64_t v28 = (uint64_t)v21;
            }
            [(VCPDataCollectionTask *)self updateUnanalyzedProgressStatistics:v48 hasResource:v24 == v23 isNewAsset:v27 > a6 timeElapsed:a7 - v28];
          }

          v16 = (char *)v16 + 1;
        }
        while (v49 != v16);
        id v15 = [v43 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v15);
    }

    int v14 = 0;
  }

  return v14;
}

- (int)updateAnalysisProgressMetrics:(id)a3
{
  id v25 = a3;
  id v5 = +[NSDate now];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  database = self->_database;
  id v9 = VCPStartTimestampKeyForTask(1);
  id v24 = [(VCPDatabaseWriter *)database valueForKey:v9];

  id v10 = +[NSMutableArray array];
  uint64_t v11 = [(VCPTask *)self photoLibrary];
  uint64_t v12 = +[PHAsset vcp_fetchOptionsForLibrary:v11 forTaskID:1];

  id v23 = v12;
  int64_t v13 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  double v26 = v13;
  int v14 = +[NSArray arrayWithObjects:&v26 count:1];
  [v12 setSortDescriptors:v14];

  id v15 = +[PHAsset fetchAssetsWithOptions:v12];
  unint64_t v16 = 0;
  while (v16 < (unint64_t)[v15 count])
  {
    v18 = [v15 objectAtIndexedSubscript:v16];
    if ([(VCPTask *)self isCancelled])
    {
      char v19 = 0;
      int v3 = -128;
    }
    else
    {
      double v20 = +[VCPWatchdog sharedWatchdog];
      [v20 pet];

      if (([v18 isPhoto] & 1) != 0 || objc_msgSend(v18, "isVideo")) {
        [v10 addObject:v18];
      }
      if ((unint64_t)[v10 count] < 0x64) {
        goto LABEL_12;
      }
      unsigned int v21 = [(VCPDataCollectionTask *)self processAssetBatch:v10 withDatabase:self->_database andStatistics:v25 andVersionTime:v24 andCurrentTime:(uint64_t)v7];
      if (!v21)
      {
        [v10 removeAllObjects];
LABEL_12:
        char v19 = 1;
        goto LABEL_13;
      }
      char v19 = 0;
      int v3 = v21;
    }
LABEL_13:

    ++v16;
    if ((v19 & 1) == 0) {
      goto LABEL_18;
    }
  }
  if (![v10 count]
    || (int v3 = [(VCPDataCollectionTask *)self processAssetBatch:v10 withDatabase:self->_database andStatistics:v25 andVersionTime:v24 andCurrentTime:(uint64_t)v7]) == 0)
  {
    int v3 = 0;
  }
LABEL_18:

  return v3;
}

- (BOOL)queryBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double *)a4
{
  id v6 = a3;
  *a4 = 0.0;
  if (v6)
  {
    [(VCPDatabaseWriter *)self->_database loadAllKeyValuePairs:v6];
    double v7 = VCPVersionKeyForTask(1);
    int64_t v8 = VCPStartTimestampKeyForTask(1);
    if ([v6 count])
    {
      id v9 = [v6 objectForKeyedSubscript:v7];
      if ([v9 longLongValue])
      {
        id v10 = [v6 objectForKeyedSubscript:v8];
        id v11 = [v10 longLongValue];

        if (v11)
        {
          uint64_t v12 = [v6 objectForKeyedSubscript:v7];
          id v13 = [v12 longLongValue];

          if (v13 != (id)70)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              id v23 = VCPLogInstance();
              os_log_type_t v24 = VCPLogToOSLogType[7];
              if (os_log_type_enabled(v23, v24))
              {
                *(_WORD *)int64_t v28 = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, v24, "Report daily background analysis metrics on MediaAnalysisVersion change", v28, 2u);
              }
            }
            *a4 = 1.0;
            goto LABEL_23;
          }
          int v14 = [v6 objectForKeyedSubscript:@"DailyProcessTimeStamp"];
          id v15 = [v14 longLongValue];

          unint64_t v16 = +[NSDate now];
          [v16 timeIntervalSinceReferenceDate];
          double v18 = v17 - (double)(uint64_t)v15;

          if (v18 >= 86400.0)
          {
            *a4 = 86400.0 / v18;
LABEL_23:
            BOOL v19 = 1;
            goto LABEL_16;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v25 = VCPLogInstance();
            os_log_type_t v26 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v25, v26))
            {
              *(_WORD *)int64_t v27 = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, v26, "Not met condition to report daily background analysis metrics", v27, 2u);
            }
          }
LABEL_15:
          BOOL v19 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      double v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v20, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Initialize background analysis metric", buf, 2u);
      }
    }
    [(VCPDataCollectionTask *)self resetBackgroundAnalysisMetrics];
    goto LABEL_15;
  }
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (int)_collectAndReportProgress
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing data collection...", buf, 2u);
    }
  }
  v46 = objc_alloc_init(VCPAssetStatistics);
  uint64_t v45 = objc_alloc_init(VCPAssetStatistics);
  v47 = objc_alloc_init(VCPLivePhotoStatistics);
  BOOL v4 = [(VCPTask *)self photoLibrary];
  id v5 = +[VCPAnalyzedAssets assetsFromPhotoLibrary:v4];

  unint64_t v6 = 0;
  os_log_type_t type = VCPLogToOSLogType[4];
  do
  {
    if (v6 >= (unint64_t)[v5 count])
    {
      database = self->_database;
      id v53 = 0;
      unsigned int v33 = [(VCPDatabaseWriter *)database getBlacklistedAssetsWithCount:2 localIdentifiers:&v53];
      id v34 = v53;
      id v35 = v34;
      if (v33)
      {
        if ((int)MediaAnalysisLogLevel() < 4)
        {
LABEL_51:

          int v48 = 0;
          break;
        }
        int64_t v36 = VCPLogInstance();
        if (os_log_type_enabled(v36, type))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, type, " Data collection failed (non-fatal)", buf, 2u);
        }
      }
      else
      {
        if ([v34 count])
        {
          long long v37 = [(VCPTask *)self photoLibrary];
          BOOL v38 = +[PHAsset vcp_fetchOptionsForLibrary:v37 forTaskID:1];

          long long v39 = +[PHAsset fetchAssetsWithLocalIdentifiers:v35 options:v38];
          id v40 = [v39 count];
        }
        else
        {
          id v40 = 0;
        }
        int64_t v36 = +[VCPDataCollection sharedDataCollection];
        id v41 = [(VCPTask *)self photoLibrary];
        [v36 reportPhotoStatistics:v46 forPhotoLibrary:v41];

        v42 = [(VCPTask *)self photoLibrary];
        [v36 reportMovieStatistics:v45 forPhotoLibrary:v42];

        id v43 = [(VCPTask *)self photoLibrary];
        [v36 reportLivePhotoStatistics:v47 forPhotoLibrary:v43];

        [v36 reportBlacklistedAssetCount:v40];
        [v36 reportDatabaseSizeBytes:[(VCPDatabaseWriter *)self->_database sizeBytes]];
      }

      goto LABEL_51;
    }
    if ([(VCPTask *)self isCancelled])
    {
      int v48 = -128;
      break;
    }
    double v7 = +[VCPWatchdog sharedWatchdog];
    [v7 pet];

    int64_t v8 = +[NSMutableDictionary dictionary];
    id v9 = +[NSMutableDictionary dictionary];
    unint64_t v10 = v6 + 1000;
    while (1)
    {
      id v11 = [v5 count];
      if ((unint64_t)v11 >= v10) {
        unint64_t v12 = v10;
      }
      else {
        unint64_t v12 = (unint64_t)v11;
      }
      if (v6 >= v12)
      {
        id v22 = [v8 allKeys];
        id v49 = [v9 allKeys];
        id v23 = [(VCPTask *)self photoLibrary];
        os_log_type_t v24 = +[PHAsset vcp_fetchOptionsForLibrary:v23 forTaskID:1];

        id v25 = +[NSPredicate vcp_imagesPredicate:0];
        [v24 setPredicate:v25];

        id v15 = +[PHAsset fetchAssetsWithLocalIdentifiers:v22 options:v24];
        unsigned int v26 = [(VCPDataCollectionTask *)self updateLivePhotoStatistics:v47 withFetchResult:v15 forAnalysisTypes:v8];
        if (!v26)
        {
          -[VCPAssetStatistics setAnalyzedDegraded:](v46, "setAnalyzedDegraded:", (char *)[v15 count] + -[VCPAssetStatistics analyzedDegraded](v46, "analyzedDegraded"));
          int64_t v27 = +[PHAsset fetchAssetsWithLocalIdentifiers:v49 options:v24];

          unsigned int v26 = [(VCPDataCollectionTask *)self updateLivePhotoStatistics:v47 withFetchResult:v27 forAnalysisTypes:v9];
          if (!v26)
          {
            -[VCPAssetStatistics setAnalyzedUndegraded:](v46, "setAnalyzedUndegraded:", (char *)[v27 count] + -[VCPAssetStatistics analyzedUndegraded](v46, "analyzedUndegraded"));
            unsigned int v26 = [(VCPDataCollectionTask *)self updateLivePhotoEffectsStatistics:v47];
            if (!v26)
            {
              v29 = +[NSPredicate vcp_moviesPredicate:0];
              [v24 setPredicate:v29];

              id v30 = +[PHAsset fetchAssetsWithLocalIdentifiers:v22 options:v24];
              -[VCPAssetStatistics setAnalyzedDegraded:](v45, "setAnalyzedDegraded:", (char *)[v30 count] + -[VCPAssetStatistics analyzedDegraded](v45, "analyzedDegraded"));

              unsigned __int8 v31 = +[PHAsset fetchAssetsWithLocalIdentifiers:v49 options:v24];
              -[VCPAssetStatistics setAnalyzedUndegraded:](v45, "setAnalyzedUndegraded:", (char *)[v31 count] + -[VCPAssetStatistics analyzedUndegraded](v45, "analyzedUndegraded"));

              id v15 = v27;
              int v28 = 0;
              unsigned int v26 = v48;
              goto LABEL_31;
            }
          }
          id v15 = v27;
        }
        int v28 = 1;
LABEL_31:

LABEL_36:
        int v48 = v26;
        goto LABEL_38;
      }
      id v54 = 0;
      unsigned int v13 = [v5 next:&v54];
      id v14 = v54;
      id v15 = v14;
      if (v13) {
        break;
      }
      unint64_t v16 = [v14 localIdentifier];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_25;
        }
        double v18 = VCPLogInstance();
        if (os_log_type_enabled(v18, type))
        {
          id v20 = [v5 count];
          *(_DWORD *)buf = 136315650;
          os_log_type_t v21 = "local identifier";
          if (!v15) {
            os_log_type_t v21 = "asset";
          }
          long long v56 = v21;
          __int16 v57 = 2048;
          unint64_t v58 = v6;
          __int16 v59 = 2048;
          id v60 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, type, "Data collection: nil %s at index %zu/%zu", buf, 0x20u);
        }
      }
      else
      {
        if ([v15 isDegraded])
        {
          double v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 types]);
          BOOL v19 = [v15 localIdentifier];
          [v8 setObject:v18 forKey:v19];
        }
        else
        {
          double v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 types]);
          BOOL v19 = [v15 localIdentifier];
          [v9 setObject:v18 forKey:v19];
        }
      }
LABEL_25:

      ++v6;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, type))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, type, " Data collection failed (non-fatal)", buf, 2u);
      }
      unsigned int v26 = 0;
      int v28 = 1;
      goto LABEL_36;
    }
    int v48 = 0;
    int v28 = 1;
LABEL_38:

    unint64_t v6 = v10;
  }
  while (!v28);

  return v48;
}

- (int)mainInternal
{
  os_log_type_t v3 = [(VCPTask *)self photoLibrary];
  unint64_t v4 = (unint64_t)objc_msgSend(v3, "vcp_assetCountForTaskID:", 1);

  id v5 = [(VCPTask *)self photoLibrary];
  unsigned int v6 = [v5 isSystemPhotoLibrary];
  if (v4 >> 4 < 0x271) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 0;
  }

  if (v7 == 1) {
    [(VCPDataCollectionTask *)self _collectAndReportProgress];
  }
  id v9 = +[NSMutableDictionary dictionary];
  double v19 = 0.0;
  if ([(VCPDataCollectionTask *)self queryBackgroundAnalysisMetrics:v9 withNormalizeRatio:&v19])
  {
    if (v7)
    {
      unint64_t v10 = +[VCPDataCollection sharedDataCollection];
      [v10 reportDailyBackgroundAnalysisMetrics:v9 withNormalizeRatio:v19];
      id v11 = objc_alloc_init(VCPProgressStatistics);
      int v12 = [(VCPDataCollectionTask *)self updateAnalysisProgressMetrics:v11];
      if (v12)
      {

        goto LABEL_19;
      }
      [v10 reportBackgroundAnalysisProgressMetrics:v11];
    }
    int v12 = [(VCPDataCollectionTask *)self resetDailyBackgroundAnalysisMetrics];
    if (v12) {
      goto LABEL_19;
    }
  }
  unsigned int v13 = VCPVersionKeyForTask(1);
  id v14 = [v9 objectForKeyedSubscript:v13];
  unsigned int v15 = [v14 intValue];

  if (v15 == 70) {
    goto LABEL_18;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unint64_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v21 = v15;
      __int16 v22 = 1024;
      int v23 = 70;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Re-initializing background analysis metric on MediaAnalysisVersion change (%d -> %d)", buf, 0xEu);
    }
  }
  int v12 = [(VCPDataCollectionTask *)self resetBackgroundAnalysisMetrics];
  if (!v12) {
LABEL_18:
  }
    int v12 = 0;
LABEL_19:

  return v12;
}

- (void).cxx_destruct
{
}

@end