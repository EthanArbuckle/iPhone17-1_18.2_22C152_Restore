@interface MADPhotosFullTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (BOOL)assetsDownloadAllowed;
- (BOOL)bypassDownload;
- (BOOL)checkCompatibilityForAsset:(id)a3;
- (MADPhotosFullTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (id)logDescription;
- (id)mediaTypePredicatesString;
- (id)nextAssetProcessingTask;
- (id)nextClusterProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (unint64_t)batchAssetCount;
- (unint64_t)iterations;
- (unint64_t)photosMediaProcessingTaskID;
- (unint64_t)priority;
- (unint64_t)processingStatusTaskID;
- (void)increaseProcessedJobCountByOne;
- (void)retireTask:(id)a3;
@end

@implementation MADPhotosFullTaskProvider

+ (id)name
{
  return @"Full";
}

+ (unint64_t)taskID
{
  return 1;
}

- (unint64_t)priority
{
  if (self->_imageOnlyAnalysis) {
    uint64_t v3 = 10;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = [(MADPhotosTaskProvider *)self photoLibrary];
  unsigned int v5 = [v4 isSystemPhotoLibrary];

  if (v5) {
    return v3 + 2;
  }
  v7 = [(MADPhotosTaskProvider *)self photoLibrary];
  unsigned int v8 = objc_msgSend(v7, "vcp_isSyndicationLibrary");

  return v3 | v8;
}

- (unint64_t)iterations
{
  if (self->_imageOnlyAnalysis) {
    return 30;
  }
  else {
    return 1;
  }
}

- (unint64_t)batchAssetCount
{
  if (self->_imageOnlyAnalysis) {
    return 100;
  }
  else {
    return 10;
  }
}

- (unint64_t)processingStatusTaskID
{
  if (self->_imageOnlyAnalysis) {
    return 255;
  }
  else {
    return 1;
  }
}

- (unint64_t)photosMediaProcessingTaskID
{
  if (self->_imageOnlyAnalysis) {
    return 17;
  }
  else {
    return 1;
  }
}

- (BOOL)checkCompatibilityForAsset:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_imageOnlyAnalysis
    || (id v7 = self->_mediaType, v7 == [v4 mediaType])
    && !objc_msgSend(v5, "mad_isNonLivePhotoImage"))
  {
    BOOL v6 = 1;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unsigned int v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v8, v9))
      {
        logPrefix = self->_logPrefix;
        v11 = [v5 localIdentifier];
        id v12 = [v5 mediaType];
        id v13 = [v5 mediaSubtypes];
        int64_t mediaType = self->_mediaType;
        unint64_t mediaSubtype = self->_mediaSubtype;
        int v17 = 138413570;
        v18 = logPrefix;
        __int16 v19 = 2112;
        v20 = v11;
        __int16 v21 = 2048;
        id v22 = v12;
        __int16 v23 = 2048;
        id v24 = v13;
        __int16 v25 = 2048;
        int64_t v26 = mediaType;
        __int16 v27 = 2048;
        unint64_t v28 = mediaSubtype;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@][%@] Incompatible asset(mediaType %ld, mediaSubtypes %ld) for taskProvider(mediaType %ld, mediaSubtypes %ld)", (uint8_t *)&v17, 0x3Eu);
      }
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (MADPhotosFullTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v28 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MADPhotosFullTaskProvider;
  v16 = [(MADPhotosTaskProvider *)&v29 initWithPhotoLibrary:v14 cancelBlock:v15];
  int v17 = v16;
  if (v16)
  {
    v16->_int64_t mediaType = a6;
    v16->_unint64_t mediaSubtype = a7;
    v16->_imageOnlyAnalysis = v8;
    objc_storeStrong((id *)&v16->_progressReporter, a5);
    v18 = objc_msgSend(v14, "vcp_description");
    uint64_t v19 = +[NSString stringWithFormat:@"[%@][%@]", v18, objc_opt_class()];
    logPrefix = v17->_logPrefix;
    v17->_logPrefix = (NSString *)v19;

    atomic_store(0, (unsigned __int8 *)&v17->_shouldPerformClustering);
    int64_t mediaType = v17->_mediaType;
    if (mediaType == 2)
    {
      CFStringRef v25 = &stru_10021F768;
      if (v8) {
        CFStringRef v25 = @"|ImageOnly";
      }
      uint64_t v24 = +[NSString stringWithFormat:@"Full|Movie%@", v25];
      goto LABEL_13;
    }
    if (mediaType == 1)
    {
      CFStringRef v22 = @"Image";
      if (v17->_mediaSubtype == 8) {
        CFStringRef v22 = @"LivePhoto";
      }
      if (v17->_mediaSubtype == 8 && v8) {
        CFStringRef v23 = @"|ImageOnly";
      }
      else {
        CFStringRef v23 = &stru_10021F768;
      }
      uint64_t v24 = +[NSString stringWithFormat:@"Full|%@%@", v22, v23];
LABEL_13:
      logDescription = v17->_logDescription;
      v17->_logDescription = (NSString *)v24;
    }
  }

  return v17;
}

- (id)mediaTypePredicatesString
{
  return +[VCPDatabaseWriter assetTypePredicatesStringWithMediaType:self->_mediaType mediaSubtypes:self->_mediaSubtype imageOnlyAnalysis:self->_imageOnlyAnalysis];
}

- (void)increaseProcessedJobCountByOne
{
  progressReporter = self->_progressReporter;
  if (progressReporter) {
    [(VCPProgressReporter *)progressReporter increaseProcessedJobCountByOne];
  }
}

- (BOOL)bypassDownload
{
  return self->_imageOnlyAnalysis;
}

- (id)assetPriorities
{
  if (self->_imageOnlyAnalysis) {
    return &off_1002303C8;
  }
  int64_t mediaType = self->_mediaType;
  if (mediaType == 2) {
    return &off_1002303F8;
  }
  if (mediaType == 1 && self->_mediaSubtype == 8) {
    return &off_1002303E0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unsigned int v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v5, v6))
    {
      logPrefix = self->_logPrefix;
      logDescription = self->_logDescription;
      int64_t v9 = self->_mediaType;
      unint64_t mediaSubtype = self->_mediaSubtype;
      BOOL imageOnlyAnalysis = self->_imageOnlyAnalysis;
      int v12 = 138413314;
      id v13 = logPrefix;
      __int16 v14 = 2112;
      id v15 = logDescription;
      __int16 v16 = 2048;
      int64_t v17 = v9;
      __int16 v18 = 2048;
      unint64_t v19 = mediaSubtype;
      __int16 v20 = 1024;
      BOOL v21 = imageOnlyAnalysis;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@[%@] Invalid task provider, mediaType %lu, mediaSubtype %lu, imageOnly %d", (uint8_t *)&v12, 0x30u);
    }
  }
  return 0;
}

- (BOOL)assetsDownloadAllowed
{
  if (self->_imageOnlyAnalysis)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v3, v4))
      {
        logPrefix = self->_logPrefix;
        logDescription = self->_logDescription;
        int v17 = 138412546;
        __int16 v18 = logPrefix;
        __int16 v19 = 2112;
        __int16 v20 = logDescription;
        id v7 = " %@[%@] Asset downloading is not allowed: image only analysis";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v3, v4, v7, (uint8_t *)&v17, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v8 = [(MADPhotosTaskProvider *)self photoLibrary];
    unsigned __int8 v9 = objc_msgSend(v8, "vcp_isCPLEnabled");

    if (v9)
    {
      v10 = +[VCPInternetReachability sharedInstance];
      unsigned __int8 v11 = [v10 hasWifiOrEthernetConnection];

      if (v11) {
        return 1;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v3 = VCPLogInstance();
        os_log_type_t v4 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v3, v4))
        {
          id v15 = self->_logPrefix;
          __int16 v16 = self->_logDescription;
          int v17 = 138412546;
          __int16 v18 = v15;
          __int16 v19 = 2112;
          __int16 v20 = v16;
          id v7 = " %@[%@] Asset downloading is not allowed: Wifi/Ethernet connection unavailable";
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v3, v4))
      {
        id v13 = self->_logPrefix;
        __int16 v14 = self->_logDescription;
        int v17 = 138412546;
        __int16 v18 = v13;
        __int16 v19 = 2112;
        __int16 v20 = v14;
        id v7 = " %@[%@] Asset downloading is not allowed: iCPL disabled";
        goto LABEL_14;
      }
LABEL_15:
    }
  }
  return 0;
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MADPhotosTaskProvider *)self photoLibrary];
  progressReporter = self->_progressReporter;
  int64_t mediaType = self->_mediaType;
  unint64_t mediaSubtype = self->_mediaSubtype;
  BOOL imageOnlyAnalysis = self->_imageOnlyAnalysis;
  LOBYTE(v12) = [(MADPhotosFullTaskProvider *)self assetsDownloadAllowed];
  v10 = +[MADPhotosFullAssetProcessingTask taskWithAnalysisDatabase:v4 photoLibrary:v5 progressReporter:progressReporter mediaType:mediaType mediaSubtype:mediaSubtype imageOnlyAnalysis:imageOnlyAnalysis downloadAllowed:v12];

  return v10;
}

- (id)nextAssetProcessingTask
{
  id v3 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v3 start];
  v10.receiver = self;
  v10.super_class = (Class)MADPhotosFullTaskProvider;
  id v4 = [(MADPhotosTaskProvider *)&v10 nextAssetProcessingTask];
  [v3 stop];
  unsigned int v5 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 0);
  if (v5)
  {
    os_log_type_t v6 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v3 elapsedTimeSeconds];
    objc_msgSend(v6, "accumulateDoubleValue:forField:andEvent:", v5, @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_fetchedP1AssetCount += (unint64_t)[v4 p1AssetCount];
    }
    else
    {
      id v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_1000A19CC((uint64_t)self, v7);
      }
    }
    id v8 = v4;
  }

  return v4;
}

- (id)nextDownloadAssetProcessingTask
{
  if (self->_imageOnlyAnalysis)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v3, v4))
      {
        logPrefix = self->_logPrefix;
        logDescription = self->_logDescription;
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v11 = logPrefix;
        __int16 v12 = 2112;
        id v13 = logDescription;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@[%@] Image only analysis; skip download task", buf, 0x16u);
      }
    }
    id v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MADPhotosFullTaskProvider;
    id v7 = [(MADPhotosTaskProvider *)&v9 nextDownloadAssetProcessingTask];
  }
  return v7;
}

- (id)nextClusterProcessingTask
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldPerformClustering);
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&self->_shouldPerformClustering);
    unsigned int v5 = [(MADPhotosTaskProvider *)self photoLibrary];
    id v3 = +[MADPhotosFullClusterProcessingTask taskWithPhotoLibrary:v5];

    unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_isFullImageP1Processed);
    if (v6)
    {
      id v7 = [(MADPhotosTaskProvider *)self photoLibrary];
      id v8 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v7];

      if (![v8 valueForKey:@"MediaAnalysisImagePriority1LastFullModeClusterTimestamp"]) {
        [v3 setRequiresProgressQuery:1];
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      objc_super v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v9, v10))
      {
        logPrefix = self->_logPrefix;
        logDescription = self->_logDescription;
        unsigned int v13 = [v3 requiresProgressQuery];
        CFStringRef v14 = @"without";
        int v16 = 138412802;
        int v17 = logPrefix;
        __int16 v18 = 2112;
        if (v13) {
          CFStringRef v14 = @"with";
        }
        __int16 v19 = logDescription;
        __int16 v20 = 2112;
        CFStringRef v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@[%@] Requesting cluster processing %@ progress query from Photos database", (uint8_t *)&v16, 0x20u);
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)retireTask:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADPhotosFullTaskProvider;
  [(MADPhotosTaskProvider *)&v11 retireTask:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 p1AssetCount];
    if (v5)
    {
      unint64_t v6 = (unint64_t)v5 + self->_retiredP1AssetCount;
      self->_retiredP1AssetCount = v6;
      if (self->_imageOnlyAnalysis
        && v6 == self->_fetchedP1AssetCount
        && (id)[(MADPhotosTaskProvider *)self currentAssetPriority] != (id)1)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v7 = VCPLogInstance();
          os_log_type_t v8 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v7, v8))
          {
            logPrefix = self->_logPrefix;
            logDescription = self->_logDescription;
            *(_DWORD *)buf = 138412546;
            unsigned int v13 = logPrefix;
            __int16 v14 = 2112;
            id v15 = logDescription;
            _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@[%@] All image-only P1 assets processed", buf, 0x16u);
          }
        }
        atomic_store(1u, (unsigned __int8 *)&self->_isFullImageP1Processed);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    atomic_store(1u, (unsigned __int8 *)&self->_shouldPerformClustering);
  }
}

- (id)logDescription
{
  return self->_logDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReporter, 0);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
}

@end