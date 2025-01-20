@interface VCPBackgroundProcessingMetrics
+ (id)sharedMetricsWithPhotoLibrary:(id)a3;
- (VCPBackgroundProcessingMetrics)initWithPhotoLibrary:(id)a3;
- (int)loadMetrics;
- (int)persist;
- (int)reportAnalyzedAsset:(id)a3 withAnalysis:(id)a4 andProcessingTime:(double)a5;
@end

@implementation VCPBackgroundProcessingMetrics

- (VCPBackgroundProcessingMetrics)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPBackgroundProcessingMetrics;
  v6 = [(VCPBackgroundProcessingMetrics *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photolibrary, a3);
  }

  return v7;
}

+ (id)sharedMetricsWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 photoLibraryURL];
  v7 = [v6 absoluteString];
  v8 = +[NSString stringWithFormat:@"%@-%@", v5, v7];

  objc_super v9 = +[VCPSharedInstanceManager sharedManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A5C6C;
  v13[3] = &unk_10021C5E8;
  id v10 = v3;
  id v14 = v10;
  v11 = [v9 sharedInstanceWithIdentifier:v8 andCreationBlock:v13];

  return v11;
}

- (int)loadMetrics
{
  if (self->_isMetricsLoaded) {
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[VCPBackgroundProcessingMetrics] Loading background processing metrics from database", buf, 2u);
    }
  }
  v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self->_photolibrary];
  database = self->_database;
  self->_database = v6;

  if (self->_database)
  {
    v8 = +[NSMutableDictionary dictionary];
    int v2 = [(VCPDatabaseWriter *)self->_database loadAllKeyValuePairs:v8];
    if (v2)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        objc_super v9 = VCPLogInstance();
        os_log_type_t v10 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v9, v10))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "[VCPBackgroundProcessingMetrics] Failed to load background processing metrics", v47, 2u);
        }
      }
    }
    else
    {
      v12 = [v8 objectForKeyedSubscript:@"NumberOfTimesScheduledDatabaseCreation"];
      self->_numOfTimesScheduledDatabaseCreation = (int64_t)[v12 longLongValue];

      v13 = [v8 objectForKeyedSubscript:@"TotalAnalyzingTimeDatabaseCreation"];
      self->_analyzingTimeDatabaseCreation = (int64_t)[v13 longLongValue];

      id v14 = [v8 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedToday"];
      self->_numImageFullyAnalyzedToday = (int64_t)[v14 longLongValue];

      v15 = [v8 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedToday"];
      self->_numLivePhotoFullyAnalyzedToday = (int64_t)[v15 longLongValue];

      v16 = [v8 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedToday"];
      self->_numMovieFullyAnalyzedToday = (int64_t)[v16 longLongValue];

      v17 = [v8 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedToday"];
      self->_movieDurationFullyAnalyzedToday = (int64_t)[v17 longLongValue];

      v18 = [v8 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedInLatestVersion"];
      self->_numImageFullyAnalyzedLatestVersion = (int64_t)[v18 longLongValue];

      v19 = [v8 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"];
      self->_numLivePhotoFullyAnalyzedLatestVersion = (int64_t)[v19 longLongValue];

      v20 = [v8 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedInLatestVersion"];
      self->_numMovieFullyAnalyzedLatestVersion = (int64_t)[v20 longLongValue];

      v21 = [v8 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedInLatestVersion"];
      self->_movieDurationFullyAnalyzedLatestVersion = (int64_t)[v21 longLongValue];

      v22 = [v8 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"];
      self->_timeFullyAnalyzingImageLatestVersion = (int64_t)[v22 longLongValue];

      v23 = [v8 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"];
      self->_timeFullyAnalyzingLivePhotoLatestVersion = (int64_t)[v23 longLongValue];

      v24 = [v8 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingMovieInLatestVersion"];
      self->_timeFullyAnalyzingMovieLatestVersion = (int64_t)[v24 longLongValue];

      v25 = [v8 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedToday"];
      self->_numImagePartiallyAnalyzedToday = (int64_t)[v25 longLongValue];

      v26 = [v8 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedToday"];
      self->_numLivePhotoPartiallyAnalyzedToday = (int64_t)[v26 longLongValue];

      v27 = [v8 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedToday"];
      self->_numMoviePartiallyAnalyzedToday = (int64_t)[v27 longLongValue];

      v28 = [v8 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedToday"];
      self->_movieDurationPartiallyAnalyzedToday = (int64_t)[v28 longLongValue];

      v29 = [v8 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"];
      self->_numImagePartiallyAnalyzedLatestVersion = (int64_t)[v29 longLongValue];

      v30 = [v8 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"];
      self->_numLivePhotoPartiallyAnalyzedLatestVersion = (int64_t)[v30 longLongValue];

      v31 = [v8 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"];
      self->_numMoviePartiallyAnalyzedLatestVersion = (int64_t)[v31 longLongValue];

      v32 = [v8 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedInLatestVersion"];
      self->_movieDurationPartiallyAnalyzedLatestVersion = (int64_t)[v32 longLongValue];

      v33 = [v8 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"];
      self->_timePartiallyAnalyzingImageLatestVersion = (int64_t)[v33 longLongValue];

      v34 = [v8 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"];
      self->_timePartiallyAnalyzingLivePhotoLatestVersion = (int64_t)[v34 longLongValue];

      v35 = [v8 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingMovieInLatestVersion"];
      self->_timePartiallyAnalyzingMovieLatestVersion = (int64_t)[v35 longLongValue];

      v36 = [v8 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisToday"];
      self->_timeRunningWithPendingToday = (int64_t)[v36 longLongValue];

      v37 = [v8 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
      self->_numOfTimesScheduledWithPendingToday = (int64_t)[v37 longLongValue];

      v38 = [v8 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"];
      self->_timeRunningWithPendingLatestVersion = (int64_t)[v38 longLongValue];

      v39 = [v8 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"];
      self->_numOfTimesScheduledWithPendingLatestVersion = (int64_t)[v39 longLongValue];

      v40 = [v8 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisToday"];
      self->_timeRunningWithoutPendingToday = (int64_t)[v40 longLongValue];

      v41 = [v8 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"];
      self->_numOfTimesScheduledWithoutPendingToday = (int64_t)[v41 longLongValue];

      v42 = [v8 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"];
      self->_timeRunningWithoutPendingLatestVersion = (int64_t)[v42 longLongValue];

      v43 = [v8 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"];
      self->_numOfTimesScheduledWithoutPendingLatestVersion = (int64_t)[v43 longLongValue];

      v44 = +[NSDate now];
      start = self->_start;
      self->_start = v44;

      int v2 = 0;
      *(_DWORD *)&self->_hasFullyAnalyzedMovie = 0;
      *(_DWORD *)&self->_hasPendingAnalysis = 0;
      self->_isMetricsLoaded = 1;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return -18;
    }
    v8 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v11))
    {
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v11, "[VCPBackgroundProcessingMetrics] Failed to open database for background processing metrics", v48, 2u);
    }
    int v2 = -18;
  }

  return v2;
}

- (int)reportAnalyzedAsset:(id)a3 withAnalysis:(id)a4 andProcessingTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  os_log_type_t v10 = v9;
  if (self->_isMetricsLoaded)
  {
    if (v8)
    {
      self->_hasPendingAnalysis = 1;
      if ((objc_msgSend(v9, "vcp_degraded") & 1) != 0
        || (+[PHAssetResource vcp_allAcceptableResourcesForAsset:](PHAssetResource, "vcp_allAcceptableResourcesForAsset:", v8), os_log_type_t v11 = objc_claimAutoreleasedReturnValue(), v12 = objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:", v11), v13 = objc_msgSend(v8, "vcp_fullAnalysisTypes"), v11, v13 != v12))
      {
        if ([v8 isVideo])
        {
          self->_hasPartiallyAnalyzedMovie = 1;
          [v8 duration];
          self->_movieDurationPartiallyAnalyzedToday += vcvtpd_s64_f64(v21);
          [v8 duration];
          int v15 = 0;
          int64_t numMoviePartiallyAnalyzedLatestVersion = self->_numMoviePartiallyAnalyzedLatestVersion;
          int64_t v24 = self->_movieDurationPartiallyAnalyzedLatestVersion + vcvtpd_s64_f64(v22);
          self->_timePartiallyAnalyzingMovieLatestVersion += vcvtpd_s64_f64(a5);
          ++self->_numMoviePartiallyAnalyzedToday;
          self->_int64_t numMoviePartiallyAnalyzedLatestVersion = numMoviePartiallyAnalyzedLatestVersion + 1;
          self->_movieDurationPartiallyAnalyzedLatestVersion = v24;
        }
        else
        {
          unsigned int v25 = objc_msgSend(v8, "vcp_isLivePhoto");
          unint64_t v26 = vcvtpd_s64_f64(a5);
          int v15 = 0;
          if (v25)
          {
            self->_hasPartiallyAnalyzedLivePhoto = 1;
            self->_timePartiallyAnalyzingLivePhotoLatestVersion += v26;
            ++self->_numLivePhotoPartiallyAnalyzedToday;
            ++self->_numLivePhotoPartiallyAnalyzedLatestVersion;
          }
          else
          {
            self->_hasPartiallyAnalyzedImage = 1;
            self->_timePartiallyAnalyzingImageLatestVersion += v26;
            ++self->_numImagePartiallyAnalyzedToday;
            ++self->_numImagePartiallyAnalyzedLatestVersion;
          }
        }
      }
      else if ([v8 isVideo])
      {
        self->_hasFullyAnalyzedMovie = 1;
        [v8 duration];
        self->_movieDurationFullyAnalyzedToday += vcvtpd_s64_f64(v14);
        [v8 duration];
        int v15 = 0;
        int64_t numMovieFullyAnalyzedLatestVersion = self->_numMovieFullyAnalyzedLatestVersion;
        int64_t v18 = self->_movieDurationFullyAnalyzedLatestVersion + vcvtpd_s64_f64(v16);
        self->_timeFullyAnalyzingMovieLatestVersion += vcvtpd_s64_f64(a5);
        ++self->_numMovieFullyAnalyzedToday;
        self->_int64_t numMovieFullyAnalyzedLatestVersion = numMovieFullyAnalyzedLatestVersion + 1;
        self->_movieDurationFullyAnalyzedLatestVersion = v18;
      }
      else
      {
        unsigned int v27 = objc_msgSend(v8, "vcp_isLivePhoto");
        unint64_t v28 = vcvtpd_s64_f64(a5);
        int v15 = 0;
        if (v27)
        {
          self->_hasFullyAnalyzedLivePhoto = 1;
          self->_timeFullyAnalyzingLivePhotoLatestVersion += v28;
          ++self->_numLivePhotoFullyAnalyzedToday;
          ++self->_numLivePhotoFullyAnalyzedLatestVersion;
        }
        else
        {
          self->_hasFullyAnalyzedImage = 1;
          self->_timeFullyAnalyzingImageLatestVersion += v28;
          ++self->_numImageFullyAnalyzedToday;
          ++self->_numImageFullyAnalyzedLatestVersion;
        }
      }
    }
    else
    {
      int v15 = -50;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[VCPBackgroundProcessingMetrics] No existing metrics from database, skip reporting", v30, 2u);
      }
    }
    int v15 = -18;
  }

  return v15;
}

- (int)persist
{
  BOOL isMetricsLoaded = self->_isMetricsLoaded;
  int v4 = MediaAnalysisLogLevel();
  if (isMetricsLoaded)
  {
    if (v4 >= 5)
    {
      os_log_type_t v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v6))
      {
        LOWORD(v19[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "VCPBackgroundProcessingMetrics persisting results ...", (uint8_t *)v19, 2u);
      }
    }
    v7 = +[NSDate now];
    [v7 timeIntervalSinceDate:self->_start];
    double v9 = v8;

    unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numOfTimesScheduledDatabaseCreation + 1 forKey:@"NumberOfTimesScheduledDatabaseCreation"];
    if (v10) {
      goto LABEL_8;
    }
    unint64_t v11 = vcvtpd_s64_f64(v9);
    unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_analyzingTimeDatabaseCreation + v11 forKey:@"TotalAnalyzingTimeDatabaseCreation"];
    if (v10) {
      goto LABEL_8;
    }
    database = self->_database;
    if (self->_hasPendingAnalysis)
    {
      unsigned int v10 = [(VCPDatabaseWriter *)database setValue:self->_timeRunningWithPendingToday + v11 forKey:@"TotalTimeRunningWithPendingAnalysisToday"];
      if (v10) {
        goto LABEL_8;
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numOfTimesScheduledWithPendingToday + 1 forKey:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
      if (v10) {
        goto LABEL_8;
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timeRunningWithPendingLatestVersion + v11 forKey:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"];
      if (v10) {
        goto LABEL_8;
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numOfTimesScheduledWithPendingLatestVersion + 1 forKey:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"];
      if (v10) {
        goto LABEL_8;
      }
      if (self->_hasFullyAnalyzedImage || self->_hasFullyAnalyzedLivePhoto || self->_hasFullyAnalyzedMovie)
      {
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numLivePhotoFullyAnalyzedToday+ self->_numImageFullyAnalyzedToday+ self->_numMovieFullyAnalyzedToday forKey:@"NumberOfAssetsFullyAnalyzedToday"];
        if (v10) {
          goto LABEL_8;
        }
        if (self->_hasFullyAnalyzedImage)
        {
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numImageFullyAnalyzedToday forKey:@"NumberOfImagesFullyAnalyzedToday"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numImageFullyAnalyzedLatestVersion forKey:@"NumberOfImagesFullyAnalyzedInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timeFullyAnalyzingImageLatestVersion forKey:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
        }
        if (self->_hasFullyAnalyzedLivePhoto)
        {
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numLivePhotoFullyAnalyzedToday forKey:@"NumberOfLivePhotosFullyAnalyzedToday"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numLivePhotoFullyAnalyzedLatestVersion forKey:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timeFullyAnalyzingLivePhotoLatestVersion forKey:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
        }
        if (self->_hasFullyAnalyzedMovie)
        {
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numMovieFullyAnalyzedToday forKey:@"NumberOfMoviesFullyAnalyzedToday"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numMovieFullyAnalyzedLatestVersion forKey:@"NumberOfMoviesFullyAnalyzedInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_movieDurationFullyAnalyzedToday forKey:@"MovieDurationFullyAnalyzedToday"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timeFullyAnalyzingMovieLatestVersion forKey:@"TotalTimeSpentFullyAnalyzingMovieInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
          unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_movieDurationFullyAnalyzedLatestVersion forKey:@"MovieDurationFullyAnalyzedInLatestVersion"];
          if (v10) {
            goto LABEL_8;
          }
        }
      }
      if (!self->_hasPartiallyAnalyzedImage
        && !self->_hasPartiallyAnalyzedLivePhoto
        && !self->_hasPartiallyAnalyzedMovie)
      {
        return [(VCPDatabaseWriter *)self->_database commit];
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numLivePhotoPartiallyAnalyzedToday+ self->_numImagePartiallyAnalyzedToday+ self->_numMoviePartiallyAnalyzedToday forKey:@"NumberOfAssetsPartiallyAnalyzedToday"];
      if (v10) {
        goto LABEL_8;
      }
      if (self->_hasPartiallyAnalyzedImage)
      {
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numImagePartiallyAnalyzedToday forKey:@"NumberOfImagesPartiallyAnalyzedToday"];
        if (v10) {
          goto LABEL_8;
        }
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numImagePartiallyAnalyzedLatestVersion forKey:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"];
        if (v10) {
          goto LABEL_8;
        }
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timePartiallyAnalyzingImageLatestVersion forKey:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"];
        if (v10) {
          goto LABEL_8;
        }
      }
      if (self->_hasPartiallyAnalyzedLivePhoto)
      {
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numLivePhotoPartiallyAnalyzedToday forKey:@"NumberOfLivePhotosPartiallyAnalyzedToday"];
        if (v10) {
          goto LABEL_8;
        }
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numLivePhotoPartiallyAnalyzedLatestVersion forKey:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"];
        if (v10) {
          goto LABEL_8;
        }
        unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timePartiallyAnalyzingLivePhotoLatestVersion forKey:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"];
        if (v10) {
          goto LABEL_8;
        }
      }
      if (!self->_hasPartiallyAnalyzedMovie) {
        return [(VCPDatabaseWriter *)self->_database commit];
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numMoviePartiallyAnalyzedToday forKey:@"NumberOfMoviesPartiallyAnalyzedToday"];
      if (v10
        || (unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numMoviePartiallyAnalyzedLatestVersion forKey:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"]) != 0|| (unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_movieDurationPartiallyAnalyzedToday forKey:@"MovieDurationPartiallyAnalyzedToday"]) != 0|| (unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timePartiallyAnalyzingMovieLatestVersion forKey:@"TotalTimeSpentPartiallyAnalyzingMovieInLatestVersion"]) != 0)
      {
LABEL_8:
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v12 = VCPLogInstance();
          os_log_type_t v13 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v12, v13))
          {
            v19[0] = 67109120;
            v19[1] = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to persist VCPBackgroundProcessingMetrics - %d", (uint8_t *)v19, 8u);
          }
        }
        return [(VCPDatabaseWriter *)self->_database commit];
      }
      unsigned int v18 = [(VCPDatabaseWriter *)self->_database setValue:self->_movieDurationPartiallyAnalyzedLatestVersion forKey:@"MovieDurationPartiallyAnalyzedInLatestVersion"];
    }
    else
    {
      unsigned int v10 = [(VCPDatabaseWriter *)database setValue:self->_timeRunningWithoutPendingToday + v11 forKey:@"TotalTimeRunningWithoutPendingAnalysisToday"];
      if (v10) {
        goto LABEL_8;
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_numOfTimesScheduledWithoutPendingToday + 1 forKey:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"];
      if (v10) {
        goto LABEL_8;
      }
      unsigned int v10 = [(VCPDatabaseWriter *)self->_database setValue:self->_timeRunningWithoutPendingLatestVersion + v11 forKey:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"];
      if (v10) {
        goto LABEL_8;
      }
      unsigned int v18 = [(VCPDatabaseWriter *)self->_database setValue:self->_numOfTimesScheduledWithoutPendingLatestVersion + 1 forKey:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"];
    }
    unsigned int v10 = v18;
    if (!v18) {
      return [(VCPDatabaseWriter *)self->_database commit];
    }
    goto LABEL_8;
  }
  if (v4 >= 3)
  {
    int v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v15, v16))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[VCPBackgroundProcessingMetrics] No existing metrics from database, skip persisting", (uint8_t *)v19, 2u);
    }
  }
  return -18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photolibrary, 0);
}

@end