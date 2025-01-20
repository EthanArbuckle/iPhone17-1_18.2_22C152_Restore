@interface MADPhotosFullAssetProcessingTask
+ (BOOL)canDoFullAnalysis:(id)a3 withResources:(id)a4;
+ (id)taskWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9;
+ (void)publishLivePhotoEffectsAnalysis:(id)a3 toAsset:(id)a4;
- (BOOL)doneFullAnalysis:(id)a3;
- (BOOL)hasAdequateAssets:(unint64_t)a3;
- (BOOL)needDownloadForAsset:(id)a3 withResources:(id)a4;
- (MADPhotosFullAssetProcessingTask)initWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9;
- (id)assetLocalIdentifiers;
- (id)downloadResourceForAsset:(id)a3 fromResources:(id)a4;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)status;
- (unint64_t)_processAssetsConcurrently:(int64_t)a3;
- (unint64_t)_processAssetsSerially;
- (unint64_t)concurrentAssetCount;
- (unint64_t)count;
- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5;
- (void)_reportCoreAnalyticsForSession;
- (void)_reportCoreAnalyticsWithEntry:(id)a3 analyticManager:(id)a4;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)dealloc;
- (void)download;
- (void)increaseProcessedJobCountByOne;
- (void)prepare;
- (void)process;
- (void)processAssetEntry:(id)a3;
- (void)publish;
@end

@implementation MADPhotosFullAssetProcessingTask

+ (id)taskWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  LOBYTE(v20) = a9;
  id v18 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v15 photoLibrary:v16 progressReporter:v17 mediaType:a6 mediaSubtype:a7 imageOnlyAnalysis:v9 downloadAllowed:v20];

  return v18;
}

- (MADPhotosFullAssetProcessingTask)initWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9
{
  BOOL v9 = a8;
  id v33 = a3;
  id v16 = a4;
  id v17 = a5;
  v34.receiver = self;
  v34.super_class = (Class)MADPhotosFullAssetProcessingTask;
  id v18 = [(MADProcessingTask *)&v34 init];
  if (!v18)
  {
LABEL_17:
    v26 = v18;
    goto LABEL_18;
  }
  uint64_t v19 = +[NSMutableArray array];
  assetEntries = v18->_assetEntries;
  v18->_assetEntries = (NSMutableArray *)v19;

  v18->_status = 0;
  objc_storeStrong((id *)&v18->_analysisDatabase, a3);
  objc_storeStrong((id *)&v18->_photoLibrary, a4);
  objc_storeStrong((id *)&v18->_progressReporter, a5);
  v18->_int64_t mediaType = a6;
  v18->_mediaSubtype = a7;
  v18->_downloadAllowed = a9;
  v18->_accumulatedVideoDurations = 0.0;
  v18->_imageOnlyAnalysis = v9;
  if (v9)
  {
    logPrefix = v18->_logPrefix;
    CFStringRef v22 = @"Full|ImageOnly";
LABEL_14:
    v18->_logPrefix = &v22->isa;

    uint64_t v27 = 255;
    if (!v18->_imageOnlyAnalysis) {
      uint64_t v27 = 1;
    }
    v18->_processingStatusTaskID = v27;
    dispatch_group_t v28 = dispatch_group_create();
    computeGroup = v18->_computeGroup;
    v18->_computeGroup = (OS_dispatch_group *)v28;

    dispatch_queue_t v30 = dispatch_queue_create("com.apple.mediaanalysisd.mediatype.compute", 0);
    computeQueue = v18->_computeQueue;
    v18->_computeQueue = (OS_dispatch_queue *)v30;

    goto LABEL_17;
  }
  if (a6 == 2)
  {
    logPrefix = v18->_logPrefix;
    CFStringRef v22 = @"Full|Movie";
    goto LABEL_14;
  }
  if (a6 == 1 && a7 == 8)
  {
    logPrefix = v18->_logPrefix;
    CFStringRef v22 = @"Full|LivePhoto";
    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v23 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v23, v24))
    {
      int64_t mediaType = v18->_mediaType;
      *(_DWORD *)buf = 134217984;
      int64_t v36 = mediaType;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[MADPhotosFullAssetProcessingTask] Unsupported media type: %lu", buf, 0xCu);
    }
  }
  v26 = 0;
LABEL_18:

  return v26;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)MADPhotosFullAssetProcessingTask;
  [(MADPhotosFullAssetProcessingTask *)&v4 dealloc];
}

- (BOOL)hasAdequateAssets:(unint64_t)a3
{
  if (self->_imageOnlyAnalysis || self->_mediaType != 2)
  {
    v6.receiver = self;
    v3 = &v6;
  }
  else
  {
    if (self->_accumulatedVideoDurations >= 30.0) {
      return 1;
    }
    v5 = self;
    v3 = (objc_super *)&v5;
  }
  v3->super_class = (Class)MADPhotosFullAssetProcessingTask;
  return -[objc_super hasAdequateAssets:](v3, "hasAdequateAssets:", a3, v5);
}

- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:", v9);
  if (self->_imageOnlyAnalysis
    && ((objc_msgSend(v8, "vcp_isLivePhoto") & 1) != 0 || objc_msgSend(v8, "isVideo")))
  {
    v10 &= 0x3000000000000uLL;
  }
  if (!a5
    && (![v8 isPhoto]
     || objc_msgSend(v9, "vcp_hasLocalPhoto:", objc_msgSend(v8, "hasAdjustments"))))
  {
    v10 |= (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypes") & 0xFFFFFFFFFFEFFFFFLL;
  }

  return v10;
}

- (void)increaseProcessedJobCountByOne
{
  progressReporter = self->_progressReporter;
  if (progressReporter) {
    [(VCPProgressReporter *)progressReporter increaseProcessedJobCountByOne];
  }
}

- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v54 = a5;
  v11 = [v10 localIdentifier];
  v12 = +[NSString stringWithFormat:@"[%@][FMACC]", v11];
  v13 = objc_msgSend(v10, "vcp_modificationDate");

  if (!v13)
  {
    if ((int)MediaAnalysisLogLevel() < 5)
    {
LABEL_42:
      unint64_t v15 = 0;
      goto LABEL_53;
    }
    v40 = VCPLogInstance();
    os_log_type_t v41 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v40, v41))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "%@ Asset missing modification date; skipping all analysis",
        buf,
        0xCu);
    }
LABEL_41:

    goto LABEL_42;
  }
  unint64_t v14 = [(MADPhotosFullAssetProcessingTask *)self possibleAnalysisForAsset:v10 withResources:v54 forLocalResourcesOnly:v6];
  unint64_t v15 = v14 & 0xFFFFFFFFDFFFFFFFLL;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = MediaAnalysisTypeShortDescription(v14 & 0xFFFFFFFFDFFFFFFFLL);
      *(_DWORD *)buf = 138412546;
      v56 = v12;
      __int16 v57 = 2112;
      v58 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Possible analysis: %@", buf, 0x16u);
    }
  }
  if ((v14 & 0x40000) != 0)
  {
    uint64_t v19 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v12);
    id v20 = *a4;
    *a4 = v19;
  }
  if (!*a4)
  {
LABEL_49:
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_53;
    }
    v45 = VCPLogInstance();
    os_log_type_t v46 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v45, v46))
    {
      v47 = MediaAnalysisTypeShortDescription(v14 & 0xFFFFFFFFDFFFFFFFLL);
      *(_DWORD *)buf = 138412546;
      v56 = v12;
      __int16 v57 = 2112;
      v58 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "%@ No existing analysis; analyze all (%@)", buf, 0x16u);
    }
LABEL_52:

    goto LABEL_53;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v21 = VCPLogInstance();
    os_log_type_t v22 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v21, v22))
    {
      v23 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(*a4, "vcp_types"));
      *(_DWORD *)buf = 138412546;
      v56 = v12;
      __int16 v57 = 2112;
      v58 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ Existing analysis: %@", buf, 0x16u);
    }
  }
  unsigned int v24 = objc_msgSend(*a4, "vcp_degraded");
  id v25 = [v10 mediaType];
  v26 = (id *)VCPPhotoAnalyzer_ptr;
  if (v25 != (id)1) {
    v26 = (id *)VCPMovieAnalyzer_ptr;
  }
  unsigned int v27 = [*v26 canAnalyzeUndegraded:v10 withResources:v54];
  if ((objc_msgSend(v10, "vcp_isAnalysisValid:", *a4) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v42 = VCPLogInstance();
      os_log_type_t v43 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v12;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "%@ Asset modified; discarding existing analysis",
          buf,
          0xCu);
      }
    }
    v44 = *a4;
    *a4 = 0;
LABEL_48:

    goto LABEL_49;
  }
  if ((v24 & v27) == 1 && (objc_msgSend(v10, "vcp_isPano") & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_49;
    }
    v44 = VCPLogInstance();
    os_log_type_t v50 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v44, v50))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v44, v50, "%@ Undegraded asset available", buf, 0xCu);
    }
    goto LABEL_48;
  }
  unint64_t v28 = (unint64_t)objc_msgSend(*a4, "vcp_types");
  signed int v29 = objc_msgSend(*a4, "vcp_version");
  if ([v10 isVideo] && objc_msgSend(v10, "vcp_needsImageCaptionProcessing")) {
    v28 &= 0xFFFCFFFFFFFFFFFFLL;
  }
  if (self->_imageOnlyAnalysis)
  {
    dispatch_queue_t v30 = [v10 mediaAnalysisProperties];
    signed int v31 = [v30 mediaAnalysisImageVersion];
    if (v29 <= v31) {
      signed int v29 = v31;
    }
  }
  uint64_t v32 = v15 & MediaAnalysisTypesUpdatedSince(v29, v10) & v28;
  uint64_t v33 = (v28 ^ v14) & v15;
  if (!(v32 | v33))
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_42;
    }
    v40 = VCPLogInstance();
    os_log_type_t v49 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v40, v49))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v40, v49, "%@ Analysis complete and up-to-date", buf, 0xCu);
    }
    goto LABEL_41;
  }
  if (((v24 | v27) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_53;
    }
    v45 = VCPLogInstance();
    os_log_type_t v51 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v45, v51))
    {
      v52 = MediaAnalysisTypeShortDescription(v14 & 0xFFFFFFFFDFFFFFFFLL);
      *(_DWORD *)buf = 138412546;
      v56 = v12;
      __int16 v57 = 2112;
      v58 = v52;
      _os_log_impl((void *)&_mh_execute_header, v45, v51, "%@ Incompatible analysis (asset degraded); re-analyze all (%@)",
        buf,
        0x16u);
    }
    goto LABEL_52;
  }
  if (v32 && (int)MediaAnalysisLogLevel() >= 6)
  {
    objc_super v34 = VCPLogInstance();
    os_log_type_t v35 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v34, v35))
    {
      int64_t v36 = MediaAnalysisTypeShortDescription(v32);
      *(_DWORD *)buf = 138412546;
      v56 = v12;
      __int16 v57 = 2112;
      v58 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "%@ Analysis outdated; need to analyze (%@)", buf, 0x16u);
    }
  }
  if (v33 && (int)MediaAnalysisLogLevel() >= 6)
  {
    v37 = VCPLogInstance();
    os_log_type_t v38 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v37, v38))
    {
      v39 = MediaAnalysisTypeShortDescription(v33);
      *(_DWORD *)buf = 138412546;
      v56 = v12;
      __int16 v57 = 2112;
      v58 = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ Analysis incomplete; need to analyze (%@)", buf, 0x16u);
    }
  }
  unint64_t v15 = v32 | v33;
LABEL_53:

  return v15;
}

- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v61 = a5;
  uint64_t v12 = [v10 localIdentifier];
  v62 = (void *)v12;
  v60 = +[NSString stringWithFormat:@"[%@][FMA]", v12];
  v13 = objc_msgSend(v10, "vcp_modificationDate");

  context = v11;
  if (v13)
  {
    unint64_t v14 = [(MADPhotosFullAssetProcessingTask *)self possibleAnalysisForAsset:v10 withResources:v61 forLocalResourcesOnly:v6];
    unint64_t v59 = v14 & 0xFFFFFFFFDFFFFFFFLL;
    if ((v14 & 0xFFFFFFFFDFFFFFFFLL) != 0)
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_16;
      }
      unint64_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        MediaAnalysisTypeShortDescription(v59);
        os_log_type_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v60;
        __int16 v66 = 2112;
        CFStringRef v67 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Possible analysis: %@", buf, 0x16u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_16;
      }
      unint64_t v15 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v15, v20))
      {
        CFStringRef v21 = &stru_10021F768;
        if (v6) {
          CFStringRef v21 = @"(local only)";
        }
        *(_DWORD *)buf = 138412546;
        v65 = v60;
        __int16 v66 = 2112;
        CFStringRef v67 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, v20, "%@ No resource to analyze %@", buf, 0x16u);
      }
    }

    uint64_t v12 = (uint64_t)v62;
LABEL_16:
    analysisDatabase = self->_analysisDatabase;
    id v63 = 0;
    [(VCPDatabaseWriter *)analysisDatabase analysisForAsset:v12 analysis:&v63];
    id v23 = v63;
    __int16 v57 = v63;
    objc_storeStrong(a4, v23);
    if ((v14 & 0x40000) != 0)
    {
      unsigned int v24 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v60);
      id v25 = *a4;
      *a4 = v24;
    }
    v26 = v62;
    if (!*a4) {
      goto LABEL_52;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      unsigned int v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v27, v28))
      {
        MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(*a4, "vcp_types"));
        signed int v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v60;
        __int16 v66 = 2112;
        CFStringRef v67 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Existing analysis: %@", buf, 0x16u);
      }
      v26 = v62;
    }
    unsigned int v30 = objc_msgSend(*a4, "vcp_degraded");
    id v31 = [v10 mediaType];
    uint64_t v32 = (id *)VCPPhotoAnalyzer_ptr;
    if (v31 != (id)1) {
      uint64_t v32 = (id *)VCPMovieAnalyzer_ptr;
    }
    unsigned int v33 = [*v32 canAnalyzeUndegraded:v10 withResources:v61];
    if (objc_msgSend(v10, "vcp_isAnalysisValid:", *a4))
    {
      if (v30 & v33) != 1 || (objc_msgSend(v10, "vcp_isPano"))
      {
        unint64_t v34 = (unint64_t)objc_msgSend(*a4, "vcp_types");
        signed int v35 = objc_msgSend(*a4, "vcp_version");
        if ([v10 isVideo]
          && objc_msgSend(v10, "vcp_needsImageCaptionProcessing"))
        {
          v34 &= 0xFFFCFFFFFFFFFFFFLL;
        }
        if (self->_imageOnlyAnalysis)
        {
          int64_t v36 = [v10 mediaAnalysisProperties];
          signed int v37 = [v36 mediaAnalysisImageVersion];
          if (v35 <= v37) {
            signed int v35 = v37;
          }
        }
        uint64_t v38 = v59 & MediaAnalysisTypesUpdatedSince(v35, v10) & v34;
        uint64_t v39 = (v34 ^ v14) & v59;
        if (!(v38 | v39))
        {
          id v18 = v57;
          if ((int)objc_msgSend(*a4, "vcp_version") < 70
            && (!self->_imageOnlyAnalysis || ([v10 isVideo] & 1) == 0))
          {
            [(VCPDatabaseWriter *)self->_analysisDatabase bumpAnalysisVersionForAsset:v62];
          }
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_68;
          }
          os_log_type_t v43 = VCPLogInstance();
          os_log_type_t v53 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v43, v53))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v60;
            _os_log_impl((void *)&_mh_execute_header, v43, v53, "%@ Analysis complete and up-to-date", buf, 0xCu);
          }
          goto LABEL_67;
        }
        if ((v30 | v33))
        {
          id v18 = v57;
          if (v38 && (int)MediaAnalysisLogLevel() >= 6)
          {
            v40 = VCPLogInstance();
            os_log_type_t v41 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v40, v41))
            {
              MediaAnalysisTypeShortDescription(v38);
              v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v65 = v60;
              __int16 v66 = 2112;
              CFStringRef v67 = v42;
              _os_log_impl((void *)&_mh_execute_header, v40, v41, "%@ Analysis outdated; need to analyze (%@)",
                buf,
                0x16u);
            }
            id v18 = v57;
          }
          if (!v39 || (int)MediaAnalysisLogLevel() < 6) {
            goto LABEL_68;
          }
          os_log_type_t v43 = VCPLogInstance();
          os_log_type_t v44 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v43, v44))
          {
            MediaAnalysisTypeShortDescription(v39);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v65 = v60;
            __int16 v66 = 2112;
            CFStringRef v67 = v45;
            _os_log_impl((void *)&_mh_execute_header, v43, v44, "%@ Analysis incomplete; need to analyze (%@)",
              buf,
              0x16u);
          }
LABEL_67:

          id v18 = v57;
LABEL_68:
          unint64_t v59 = v38 | v39;
          goto LABEL_57;
        }
        id v18 = v57;
        if ((int)MediaAnalysisLogLevel() < 7) {
          goto LABEL_57;
        }
        os_log_type_t v49 = VCPLogInstance();
        os_log_type_t v55 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v49, v55))
        {
          MediaAnalysisTypeShortDescription(v59);
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v60;
          __int16 v66 = 2112;
          CFStringRef v67 = v56;
          _os_log_impl((void *)&_mh_execute_header, v49, v55, "%@ Incompatible analysis (asset degraded); re-analyze all (%@)",
            buf,
            0x16u);
        }
        goto LABEL_55;
      }
      if ((int)MediaAnalysisLogLevel() < 6)
      {
LABEL_52:
        if ((int)MediaAnalysisLogLevel() < 6)
        {
LABEL_56:
          id v18 = v57;
          goto LABEL_57;
        }
        os_log_type_t v49 = VCPLogInstance();
        os_log_type_t v50 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v49, v50))
        {
          MediaAnalysisTypeShortDescription(v59);
          os_log_type_t v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v60;
          __int16 v66 = 2112;
          CFStringRef v67 = v51;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "%@ No existing analysis; analyze all (%@)", buf, 0x16u);
        }
LABEL_55:

        goto LABEL_56;
      }
      v48 = VCPLogInstance();
      os_log_type_t v54 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v48, v54))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v60;
        _os_log_impl((void *)&_mh_execute_header, v48, v54, "%@ Undegraded asset available", buf, 0xCu);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v46 = VCPLogInstance();
        os_log_type_t v47 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v46, v47))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v60;
          _os_log_impl((void *)&_mh_execute_header, v46, v47, "%@ Asset modified; discarding existing analysis",
            buf,
            0xCu);
        }

        v26 = v62;
      }
      [(VCPDatabaseWriter *)self->_analysisDatabase deleteAnalysisForAsset:v26];
      v48 = *a4;
      *a4 = 0;
    }

    goto LABEL_52;
  }
  if ((int)MediaAnalysisLogLevel() < 5)
  {
    unint64_t v59 = 0;
    goto LABEL_58;
  }
  id v18 = VCPLogInstance();
  os_log_type_t v19 = VCPLogToOSLogType[5];
  if (os_log_type_enabled(v18, v19))
  {
    *(_DWORD *)buf = 138412290;
    v65 = v60;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Asset missing modification date; skipping all analysis",
      buf,
      0xCu);
  }
  unint64_t v59 = 0;
LABEL_57:

LABEL_58:

  return v59;
}

+ (BOOL)canDoFullAnalysis:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "vcp_fullAnalysisTypes");
  LOBYTE(v7) = v7 == objc_msgSend(v5, "vcp_fullAnalysisTypesForResources:", v6);

  return (char)v7;
}

- (BOOL)doneFullAnalysis:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 asset];
  unint64_t v5 = (unint64_t)objc_msgSend(v4, "vcp_fullAnalysisTypes");

  id v6 = [v3 analysisResults];
  unint64_t v7 = (unint64_t)objc_msgSend(v6, "vcp_types");

  return (v5 & ~v7 & 0xFFFFFFFFFFEFFFFFLL) == 0;
}

- (BOOL)needDownloadForAsset:(id)a3 withResources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_imageOnlyAnalysis
    && [(PHPhotoLibrary *)self->_photoLibrary vcp_isCPLEnabled]
    && ((objc_msgSend(v6, "vcp_isLivePhoto") & 1) != 0
     || [v6 isVideo]
     && (objc_msgSend(v6, "vcp_isVideoSlowmo") & 1) == 0
     && (objc_msgSend(v6, "vcp_isLongMovie") & 1) == 0))
  {
    unsigned int v8 = [(id)objc_opt_class() canDoFullAnalysis:v6 withResources:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)downloadResourceForAsset:(id)a3 fromResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "vcp_smallMovieDerivativeResource");
  if (!v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v12, v13))
      {
        unint64_t v14 = [v5 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v30 = (unint64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] Asset has no small video derivative; skipping",
          buf,
          0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() <= 6)
    {
      os_log_type_t v17 = VCPLogToOSLogType[7];
    }
    else
    {
      os_log_type_t v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = [v5 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v30 = (unint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Asset all acceptable resources:", buf, 0xCu);
      }
    }
    unint64_t v19 = 0;
    *(void *)&long long v15 = 134218242;
    long long v28 = v15;
    while (v19 < (unint64_t)objc_msgSend(v6, "count", v28))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, v17))
        {
          CFStringRef v21 = [v6 objectAtIndexedSubscript:v19];
          *(_DWORD *)buf = v28;
          unint64_t v30 = v19;
          __int16 v31 = 2112;
          uint64_t v32 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, v17, "[%lu] acceptable resource: %@", buf, 0x16u);
        }
      }
      ++v19;
    }
    goto LABEL_35;
  }
  if ([v5 isVideo])
  {
    id v8 = [v7 fileSize];
    if (v8 > +[VCPDownloadManager maxSizeBytes])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v9 = VCPLogInstance();
        os_log_type_t v10 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v9, v10))
        {
          v11 = [v5 localIdentifier];
          *(_DWORD *)buf = 138412290;
          unint64_t v30 = (unint64_t)v11;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@] File size exceeds download threshold; skipping",
            buf,
            0xCu);
        }
LABEL_34:

        goto LABEL_35;
      }
      goto LABEL_35;
    }
    if (!v8 && objc_msgSend(v5, "vcp_isLongMovie"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v9 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v9, v22))
        {
          id v23 = [v5 localIdentifier];
          *(_DWORD *)buf = 138412290;
          unint64_t v30 = (unint64_t)v23;
          _os_log_impl((void *)&_mh_execute_header, v9, v22, "[%@] Duration exceeds download threshold; skipping",
            buf,
            0xCu);
        }
        goto LABEL_34;
      }
LABEL_35:
      id v26 = 0;
      goto LABEL_37;
    }
  }
  if (objc_msgSend(v5, "vcp_isVideoSlowmo"))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v9 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v9, v24))
      {
        id v25 = [v5 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v30 = (unint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v9, v24, "[%@] No download for slow-mo video; skipping", buf, 0xCu);
      }
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  id v26 = v7;
LABEL_37:

  return v26;
}

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  id v12 = a3;
  v82.receiver = self;
  v82.super_class = (Class)MADPhotosFullAssetProcessingTask;
  unint64_t v73 = a5;
  unint64_t v74 = a6;
  id v75 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:](&v82, "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:", v12, a4, a5, a6);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  os_log_type_t v13 = self->_assetEntries;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v78 objects:v90 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v79;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v79 != v15) {
          objc_enumerationMutation(v13);
        }
        os_log_type_t v17 = [*(id *)(*((void *)&v78 + 1) + 8 * i) asset];
        id v18 = [v17 localIdentifier];
        unint64_t v19 = [v12 localIdentifier];
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            os_log_type_t v24 = VCPLogInstance();
            os_log_type_t v25 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v24, v25))
            {
              logPrefix = self->_logPrefix;
              unsigned int v27 = [v12 localIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = logPrefix;
              __int16 v84 = 2112;
              v85 = v27;
              _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@][%@] Batch already contains asset; ignoring",
                buf,
                0x16u);
            }
          }
          goto LABEL_61;
        }
      }
      id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v78 objects:v90 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (self->_imageOnlyAnalysis || !objc_msgSend(v12, "vcp_isLongMovie"))
  {
    os_log_type_t v13 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v12];
    unsigned int v28 = [(MADPhotosFullAssetProcessingTask *)self needDownloadForAsset:v12 withResources:v13];
    if (v28)
    {
      uint64_t v29 = [(MADPhotosFullAssetProcessingTask *)self downloadResourceForAsset:v12 fromResources:v13];
      if (!v29)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          unint64_t v30 = VCPLogInstance();
          os_log_type_t v31 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v32 = self->_logPrefix;
            unsigned int v33 = [v12 localIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v32;
            __int16 v84 = 2112;
            v85 = v33;
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "[%@][%@] Can not perform the required download; ignoring",
              buf,
              0x16u);
          }
        }
        [(MADPhotosFullAssetProcessingTask *)self increaseProcessedJobCountByOne];
        goto LABEL_61;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    v71 = (void *)v29;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      unint64_t v34 = VCPLogInstance();
      os_log_type_t v35 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v34, v35))
      {
        int64_t v36 = self->_logPrefix;
        signed int v37 = [v12 localIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v84 = 2112;
        v85 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "[%@][%@] Adding asset to processing batch ...", buf, 0x16u);
      }
    }
    id location = 0;
    unsigned int v72 = v28;
    uint64_t v38 = v28 ^ 1;
    uint64_t v39 = [(MADPhotosFullAssetProcessingTask *)self missingAnalysisForAsset:v12 existingAnalysis:&location resources:v13 forLocalResourcesOnly:v38];
    if (v39)
    {
      v40 = VCPSignPostLog();
      os_signpost_id_t v41 = os_signpost_id_generate(v40);

      v42 = VCPSignPostLog();
      os_log_type_t v43 = v42;
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "MADPhotosFullAssetProcessingTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v70 = [(NSMutableArray *)v13 mad_computeSyncResource];
      os_log_type_t v44 = [(MADProcessingTask *)self cancelBlock];
      v45 = objc_msgSend(v70, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v12, 0, v44);

      os_log_type_t v46 = VCPSignPostLog();
      os_log_type_t v47 = v46;
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, v41, "MADPhotosFullAssetProcessingTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      BOOL v48 = v45 != 0;
      if (v45)
      {
        objc_storeStrong(&location, v45);
        uint64_t v39 = [(MADPhotosFullAssetProcessingTask *)self missingAnalysisForAsset:v12 withExistingComputeSyncAnalysis:&location resources:v13 forLocalResourcesOnly:v38];
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          os_log_type_t v49 = VCPLogInstance();
          os_log_type_t v50 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v49, v50))
          {
            v69 = v49;
            os_log_type_t v51 = self->_logPrefix;
            v52 = [v12 localIdentifier];
            v68 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(location, "vcp_types"));
            os_log_type_t v53 = MediaAnalysisTypeShortDescription(v39);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v51;
            __int16 v84 = 2112;
            v85 = v52;
            __int16 v86 = 2112;
            v87 = v68;
            __int16 v88 = 2112;
            v89 = v53;
            _os_log_impl((void *)&_mh_execute_header, v69, v50, "[%@][%@] Reusing analysis results from compute sync (existing: %@, missing: %@)", buf, 0x2Au);

            os_log_type_t v49 = v69;
          }
        }
      }
    }
    else
    {
      BOOL v48 = 0;
    }
    unsigned int v54 = v72;
    if (v39 != VCPMAFullAnalysisTypesThumbnail) {
      unsigned int v54 = 0;
    }
    if (v54 == 1)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v55 = VCPLogInstance();
        os_log_type_t v56 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v55, v56))
        {
          __int16 v57 = self->_logPrefix;
          v58 = [v12 localIdentifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v57;
          __int16 v84 = 2112;
          v85 = v58;
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "[%@][%@] No analysis needs to perform; ignoring",
            buf,
            0x16u);
        }
      }
      [(MADPhotosFullAssetProcessingTask *)self increaseProcessedJobCountByOne];
    }
    else
    {
      if (!self->_imageOnlyAnalysis && v39 && [v12 isVideo])
      {
        [v12 duration];
        self->_accumulatedVideoDurations = v59 + self->_accumulatedVideoDurations;
      }
      *(void *)buf = 0;
      uint64_t v76 = 0;
      analysisDatabase = self->_analysisDatabase;
      unint64_t processingStatusTaskID = self->_processingStatusTaskID;
      v62 = [v12 localIdentifier];
      [(VCPDatabaseWriter *)analysisDatabase fetchProcessingErrorCode:buf errorLine:&v76 taskID:processingStatusTaskID localIndentifier:v62];

      assetEntries = self->_assetEntries;
      if (v72) {
        v64 = v13;
      }
      else {
        v64 = 0;
      }
      LOBYTE(v67) = v72;
      LOBYTE(v66) = v48;
      v65 = +[MADFullAssetEntry entryWithAsset:v12 previousStatus:v73 previousAttempts:v74 lastAttemptDate:v75 analysisTypes:v39 imageOnlyAnalysis:self->_imageOnlyAnalysis existingAnalysis:location isAnalysisFromComputeSync:v66 downloadResource:v71 needDownload:v67 acceptableResources:v64 previousErrorCode:*(void *)buf previousErrorLine:v76];
      [(NSMutableArray *)assetEntries addObject:v65];
    }
    goto LABEL_61;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    VCPLogInstance();
    os_log_type_t v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v21 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(&v13->super.super, v21))
    {
      os_log_type_t v22 = self->_logPrefix;
      id v23 = [v12 localIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v84 = 2112;
      v85 = v23;
      _os_log_impl((void *)&_mh_execute_header, &v13->super.super, v21, "[%@][%@] Long duration movie shall not be processed in the unified path; ignoring",
        buf,
        0x16u);
    }
LABEL_61:
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (id)assetLocalIdentifiers
{
  id v3 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = self->_assetEntries;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        os_log_type_t v10 = objc_msgSend(v8, "asset", (void)v13);
        v11 = [v10 localIdentifier];
        [v3 addObject:v11];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (int)status
{
  return self->_status;
}

- (int)_prepare
{
  id v33 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v33 start];
  v2 = VCPSignPostLog();
  id v3 = (char *)os_signpost_id_generate(v2);

  objc_super v4 = VCPSignPostLog();
  id v5 = v4;
  unint64_t v31 = (unint64_t)(v3 - 1);
  os_signpost_id_t spid = (os_signpost_id_t)v3;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v3, "MADPhotosFullAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      logPrefix = self->_logPrefix;
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      VCPMAQoSDescription(v10);
      id v3 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      os_log_type_t v47 = logPrefix;
      __int16 v48 = 1024;
      unsigned int v49 = v9;
      __int16 v50 = 2112;
      os_log_type_t v51 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Preparing %d assets (QoS: %@)", buf, 0x1Cu);
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_assetEntries;
  id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    uint64_t v36 = *(void *)v42;
LABEL_10:
    id v12 = 0;
    int v13 = (int)v3;
    id v35 = v11;
    while (1)
    {
      int v37 = v13;
      if (*(void *)v42 != v36) {
        objc_enumerationMutation(obj);
      }
      long long v14 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v12);
      analysisDatabase = self->_analysisDatabase;
      long long v16 = (char *)[v14 previousAttempts];
      uint64_t v39 = [v14 asset];
      unint64_t processingStatusTaskID = self->_processingStatusTaskID;
      v40 = +[NSDate now];
      id v18 = [v14 asset];
      id v19 = [v18 mediaType];
      unsigned int v20 = [v14 asset];
      unsigned int v21 = -[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:](analysisDatabase, "setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:", v16 + 1, v39, processingStatusTaskID, 1, v40, v19, [v20 mediaSubtypes], objc_msgSend(v14, "previousErrorCode"), objc_msgSend(v14, "previousErrorLine"));

      if (v21 == -108 || v21 == -36)
      {
        LODWORD(v3) = v21;
      }
      else
      {
        LODWORD(v3) = v21;
        if (v21 != -23) {
          LODWORD(v3) = v37;
        }
      }
      if (v21 == -108 || v21 == -36 || v21 == -23) {
        goto LABEL_41;
      }
      id v12 = (char *)v12 + 1;
      int v13 = (int)v3;
      if (v35 == v12)
      {
        id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v11) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  unsigned int v22 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v22 == -108 || v22 == -36)
  {
    int v23 = v22;
  }
  else
  {
    int v23 = v22;
    if (v22 != -23) {
      int v23 = (int)v3;
    }
  }
  if (v22 != -108 && v22 != -36 && v22 != -23)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v24, v25))
      {
        id v26 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        os_log_type_t v47 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] Preparing assets done", buf, 0xCu);
      }
    }
    unsigned int v27 = VCPSignPostLog();
    unsigned int v28 = v27;
    if (v31 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFullAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [v33 stop];
    obj = +[VCPMADCoreAnalyticsManager sharedManager];
    [v33 elapsedTimeSeconds];
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:](obj, "accumulateDoubleValue:forField:andEvent:", @"TotalPrepareTimeInSeconds", @"com.apple.mediaanalysisd.FullAnalysisRunSession");
    uint64_t v29 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 2);
    if (v29)
    {
      [v33 elapsedTimeSeconds];
      -[NSMutableArray accumulateDoubleValue:forField:andEvent:](obj, "accumulateDoubleValue:forField:andEvent:", v29, @"com.apple.mediaanalysisd.FullAnalysisRunSession");
    }

    LODWORD(v3) = 0;
LABEL_41:

    int v23 = (int)v3;
  }

  return v23;
}

- (void)prepare
{
  self->_status = [(MADPhotosFullAssetProcessingTask *)self _prepare];
}

- (void)download
{
  id v76 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v76 start];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  objc_super v4 = VCPSignPostLog();
  id v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v75 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADPhotosFullAssetProcessingTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      logPrefix = self->_logPrefix;
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      id v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 138412802;
      v92 = logPrefix;
      __int16 v93 = 1024;
      *(_DWORD *)v94 = v9;
      *(_WORD *)&v94[4] = 2112;
      *(void *)&v94[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Downloading %d assets (QoS: %@)", buf, 0x1Cu);
    }
  }
  id v12 = +[MADStateHandler sharedStateHandler];
  [v12 addBreadcrumb:@"[%@] Downloading %d assets", self->_logPrefix, -[NSMutableArray count](self->_assetEntries, "count")];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obj = self->_assetEntries;
  id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v97 count:16];
  if (!v13)
  {
    *(void *)&type[4] = 0;
    goto LABEL_68;
  }
  *(_DWORD *)&type[8] = 0;
  uint64_t v14 = *(void *)v88;
  os_log_type_t v81 = VCPLogToOSLogType[4];
  *(void *)type = VCPLogToOSLogType[5];
  os_log_type_t v82 = VCPLogToOSLogType[3];
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v88 != v14) {
        objc_enumerationMutation(obj);
      }
      long long v16 = *(void **)(*((void *)&v87 + 1) + 8 * i);
      id v18 = +[VCPWatchdog sharedWatchdog];
      [v18 pet];

      if (![v16 analysisTypes])
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_64;
        }
        unsigned int v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, v82))
        {
          unsigned int v28 = self->_logPrefix;
          uint64_t v29 = [v16 asset];
          unint64_t v30 = [v29 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v92 = v28;
          __int16 v93 = 2112;
          *(void *)v94 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, v82, "[%@][%@] analysisTypes is nil and download is not needed; skipping",
            buf,
            0x16u);
        }
        goto LABEL_63;
      }
      if (([v16 needDownload] & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_64;
        }
        unsigned int v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, v81))
        {
          unint64_t v31 = self->_logPrefix;
          uint64_t v32 = [v16 asset];
          id v33 = [v32 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v92 = v31;
          __int16 v93 = 2112;
          *(void *)v94 = v33;
          _os_log_impl((void *)&_mh_execute_header, v27, v81, "[%@][%@] Download is not needed; skipping", buf, 0x16u);
        }
        goto LABEL_63;
      }
      if (!self->_downloadAllowed)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          uint64_t v26 = 4294943488;
          goto LABEL_56;
        }
        unsigned int v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, v82))
        {
          os_log_type_t v56 = self->_logPrefix;
          __int16 v57 = [v16 asset];
          v58 = [v57 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v92 = v56;
          __int16 v93 = 2112;
          *(void *)v94 = v58;
          _os_log_impl((void *)&_mh_execute_header, v22, v82, "[%@][%@] Download is not allowed; skipping", buf, 0x16u);
        }
        uint64_t v26 = 4294943488;
LABEL_53:

        goto LABEL_56;
      }
      id v19 = [(MADProcessingTask *)self cancelBlock];
      if (v19)
      {
        unsigned int v20 = [(MADProcessingTask *)self cancelBlock];
        int v21 = v20[2]();

        if (v21)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            unsigned int v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, (os_log_type_t)type[0]))
            {
              int v23 = self->_logPrefix;
              os_log_type_t v24 = [v16 asset];
              os_log_type_t v25 = [v24 localIdentifier];
              *(_DWORD *)buf = 138412546;
              v92 = v23;
              __int16 v93 = 2112;
              *(void *)v94 = v25;
              _os_log_impl((void *)&_mh_execute_header, v22, (os_log_type_t)type[0], "[%@][%@] Download is canceled; skipping",
                buf,
                0x16u);
            }
            uint64_t v26 = 4294967168;
            goto LABEL_53;
          }
          uint64_t v26 = 4294967168;
LABEL_56:
          [v16 setStatus:v26];
          [v16 setDownloadResource:0];
          goto LABEL_64;
        }
      }
      unint64_t v34 = [v16 downloadResource];
      BOOL v35 = v34 == 0;

      if (v35)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          uint64_t v26 = 4294943494;
          goto LABEL_56;
        }
        unsigned int v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, v82))
        {
          double v59 = self->_logPrefix;
          v60 = [v16 asset];
          id v61 = [v60 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v92 = v59;
          __int16 v93 = 2112;
          *(void *)v94 = v61;
          _os_log_impl((void *)&_mh_execute_header, v22, v82, "[%@][%@] Asset resource not found; skipping", buf, 0x16u);
        }
        uint64_t v26 = 4294943494;
        goto LABEL_53;
      }
      uint64_t v36 = VCPSignPostLog();
      os_signpost_id_t v37 = os_signpost_id_generate(v36);

      uint64_t v38 = VCPSignPostLog();
      uint64_t v39 = v38;
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "MADPhotosFullAssetProcessingTask_DownloadUnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v40 = [v16 acceptableResources];
      unsigned int v27 = objc_msgSend(v40, "mad_computeSyncResource");

      long long v41 = [v16 asset];
      long long v42 = [(MADProcessingTask *)self cancelBlock];
      id v86 = [v27 mad_existingAnalysisFromComputeSyncForAsset:v41 allowDownload:1 cancel:v42];

      long long v43 = VCPSignPostLog();
      long long v44 = v43;
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v37, "MADPhotosFullAssetProcessingTask_DownloadUnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v86)
      {
        v45 = [v16 asset];
        os_log_type_t v46 = [v16 acceptableResources];
        uint64_t v47 = -[MADPhotosFullAssetProcessingTask missingAnalysisForAsset:withExistingComputeSyncAnalysis:resources:forLocalResourcesOnly:](self, "missingAnalysisForAsset:withExistingComputeSyncAnalysis:resources:forLocalResourcesOnly:", v45, &v86, v46, [v16 needDownload] ^ 1);

        if (!v47)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v62 = VCPLogInstance();
            if (os_log_type_enabled(v62, (os_log_type_t)type[0]))
            {
              id v63 = self->_logPrefix;
              long long v79 = [v16 asset];
              v64 = [v79 localIdentifier];
              v65 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v86, "vcp_types"));
              *(_DWORD *)buf = 138412802;
              v92 = v63;
              __int16 v93 = 2112;
              *(void *)v94 = v64;
              *(_WORD *)&v94[8] = 2112;
              *(void *)&v94[10] = v65;
              _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)type[0], "[%@][%@] Reusing complete analysis results (%@) from downloaded compute sync, skipping media resource download", buf, 0x20u);
            }
          }
          [v16 setExistingAnalysis:v86];
          [v16 setAnalysisTypes:0];
          [v16 setIsAnalysisFromComputeSync:1];
          [v16 setStatus:0];
          [v16 setDownloadResource:0];
          ++*(void *)&type[4];
          goto LABEL_62;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          __int16 v48 = VCPLogInstance();
          if (os_log_type_enabled(v48, (os_log_type_t)type[0]))
          {
            unsigned int v49 = self->_logPrefix;
            v77 = [v16 asset];
            long long v78 = [v77 localIdentifier];
            MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v86, "vcp_types"));
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            os_log_type_t v51 = MediaAnalysisTypeShortDescription(v47);
            *(_DWORD *)buf = 138413058;
            v92 = v49;
            __int16 v93 = 2112;
            *(void *)v94 = v78;
            *(_WORD *)&v94[8] = 2112;
            *(void *)&v94[10] = v50;
            __int16 v95 = 2112;
            v96 = v51;
            _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)type[0], "[%@][%@] Incomplete analysis results from downloaded compute sync (existing: %@, missing: %@), falling back to download media resource", buf, 0x2Au);
          }
        }
      }
      v52 = [v16 downloadResource];
      id v85 = 0;
      os_log_type_t v53 = [(MADProcessingTask *)self cancelBlock];
      uint64_t v54 = +[PHAssetResourceManager vcp_requestInMemoryDownload:v52 taskID:1 data:&v85 cancel:v53];
      id v55 = v85;
      [v16 setStatus:v54];

      if (![v16 status])
      {
        [v16 setDownloadedData:v55];
        ++*(void *)&type[4];
      }
      [v16 setDownloadResource:0];

LABEL_62:
LABEL_63:

LABEL_64:
    }
    id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v97 count:16];
  }
  while (v13);
LABEL_68:

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v66 = VCPLogInstance();
    os_log_type_t v67 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v66, v67))
    {
      v68 = self->_logPrefix;
      *(_DWORD *)buf = 138412546;
      v92 = v68;
      __int16 v93 = 1024;
      *(_DWORD *)v94 = *(_DWORD *)&type[4];
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "[%@] Downloaded %d assets", buf, 0x12u);
    }
  }
  v69 = +[MADStateHandler sharedStateHandler];
  [v69 addBreadcrumb:@"[%@] Downloaded %d assets", self->_logPrefix, *(void *)&type[4]];

  v70 = VCPSignPostLog();
  v71 = v70;
  if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFullAssetProcessingTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  [v76 stop];
  unsigned int v72 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v76 elapsedTimeSeconds];
  objc_msgSend(v72, "accumulateDoubleValue:forField:andEvent:", @"TotalDownloadTimeInSeconds", @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  unint64_t v73 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 1);
  if (v73)
  {
    [v76 elapsedTimeSeconds];
    objc_msgSend(v72, "accumulateDoubleValue:forField:andEvent:", v73, @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  }
}

- (void)processAssetEntry:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      logPrefix = self->_logPrefix;
      id v8 = [v4 asset];
      unsigned int v9 = [v8 localIdentifier];
      qos_class_t v10 = MediaAnalysisTypeShortDescription((uint64_t)[v4 analysisTypes]);
      *(_DWORD *)buf = 138412802;
      __int16 v84 = logPrefix;
      __int16 v85 = 2112;
      id v86 = v9;
      __int16 v87 = 2112;
      long long v88 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@][%@] Processing asset (%@)", buf, 0x20u);
    }
  }
  if (![v4 analysisTypes])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v11 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v11, v16))
      {
        os_log_type_t v17 = self->_logPrefix;
        id v18 = [v4 asset];
        id v19 = [v18 localIdentifier];
        *(_DWORD *)buf = 138412546;
        __int16 v84 = v17;
        __int16 v85 = 2112;
        id v86 = v19;
        _os_log_impl((void *)&_mh_execute_header, v11, v16, "[%@][%@] processAssetEntry with nil analysisTypes; skipping",
          buf,
          0x16u);
      }
      goto LABEL_61;
    }
    goto LABEL_62;
  }
  if (![v4 status])
  {
    if ([v4 needDownload])
    {
      unsigned int v20 = [v4 downloadedData];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          os_signpost_id_t v37 = VCPLogInstance();
          os_log_type_t v38 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v37, v38))
          {
            uint64_t v39 = self->_logPrefix;
            v40 = [v4 asset];
            long long v41 = [v40 localIdentifier];
            *(_DWORD *)buf = 138412546;
            __int16 v84 = v39;
            __int16 v85 = 2112;
            id v86 = v41;
            _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%@][%@] Missing required resource data; skipping",
              buf,
              0x16u);
          }
        }
        [v4 setStatus:4294943494];
        goto LABEL_62;
      }
    }
    id v11 = objc_alloc_init((Class)VCPTimeMeasurement);
    [v11 start];
    if (!self->_imageOnlyAnalysis)
    {
      unsigned int v22 = [v4 asset];
      if ([v22 isVideo])
      {
        id v23 = [v4 analysisTypes];
        BOOL v24 = v23 == (id)VCPMAFullAnalysisTypesThumbnail;

        if (!v24)
        {
          id v25 = objc_alloc((Class)VCPMovieAnalyzer);
          uint64_t v26 = [v4 asset];
          unsigned int v27 = [v4 existingAnalysis];
          id v28 = [v4 analysisTypes];
          uint64_t v29 = [v4 downloadedData];
          id v30 = [v25 initWithPHAsset:v26 existingAnalysis:v27 analysisTypes:v28 downloadedData:v29];

          buf[0] = 0;
          [v30 setAllowStreaming:1];
          unint64_t v31 = +[MADStateHandler sharedStateHandler];
          [v31 enterKnownTimeoutRisk:2];

          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_100079008;
          v82[3] = &unk_100219D98;
          v82[4] = self;
          uint64_t v32 = [v30 analyzeAsset:v82 streamed:buf];
          id v33 = +[MADStateHandler sharedStateHandler];
          [v33 exitKnownTimeoutRisk];

          uint64_t v34 = (uint64_t)[v30 status];
          id v35 = [v30 errorCode];
          id v36 = [v30 errorLine];
          [v30 status];
LABEL_50:

          if (v34 == 4) {
            unsigned int v71 = -128;
          }
          else {
            unsigned int v71 = -18;
          }
          if (v34 == 2) {
            uint64_t v72 = 0;
          }
          else {
            uint64_t v72 = v71;
          }
          [v4 setStatus:v72];
          [v4 setErrorCode:v35];
          [v4 setErrorLine:v36];
          [v4 setAnalysisResults:v32];
          [v4 setExistingAnalysis:0];
          [v4 setDownloadedData:0];
          [v11 stop];
          [v11 elapsedTimeSeconds];
          objc_msgSend(v4, "setProcessingInterval:");
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            unint64_t v73 = VCPLogInstance();
            os_log_type_t v74 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v73, v74))
            {
              unint64_t v75 = self->_logPrefix;
              id v76 = [v4 asset];
              v77 = [v76 localIdentifier];
              [v4 processingInterval];
              *(_DWORD *)buf = 138412802;
              __int16 v84 = v75;
              __int16 v85 = 2112;
              id v86 = v77;
              __int16 v87 = 2048;
              long long v88 = v78;
              _os_log_impl((void *)&_mh_execute_header, v73, v74, "[%@][%@] Processing asset done (interval: %.2fs)", buf, 0x20u);
            }
          }

          goto LABEL_61;
        }
      }
      else
      {
      }
    }
    if (((unint64_t)[v4 analysisTypes] & 0xFFFFFFFFCBFFFFFFLL) != 0)
    {
      id v42 = objc_alloc((Class)VCPPhotoAnalyzer);
      long long v43 = [v4 asset];
      long long v44 = [v4 existingAnalysis];
      unint64_t v45 = (unint64_t)[v4 analysisTypes];
      os_log_type_t v46 = [v4 downloadedData];
      id v47 = [v42 initWithPHAsset:v43 existingAnalysis:v44 analysisTypes:v45 & 0xFFFFFFFFCBFFFFFFLL downloadedData:v46];

      [v47 setAllowStreaming:1];
      __int16 v48 = +[VCPPhotoAnalyzerSharedContext sharedContext];
      [v47 setSharedContext:v48];

      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1000790B8;
      v81[3] = &unk_100219D98;
      v81[4] = self;
      unsigned int v49 = [v47 analyzeAsset:v81 withOptions:0];
      id v30 = [v49 mutableCopy];

      uint64_t v34 = (uint64_t)[v47 status];
      id v35 = [v47 errorCode];
      id v36 = [v47 errorLine];

      if (v34 != 2)
      {
LABEL_42:
        if (v30)
        {
          if (self->_imageOnlyAnalysis)
          {
            v65 = [v4 asset];
            unsigned int v66 = [v65 isVideo];

            if (v66)
            {
              os_log_type_t v67 = [v4 existingAnalysis];
              BOOL v68 = v67 == 0;

              if (v68)
              {
                objc_msgSend(v30, "vcp_setFlags:", 0x40000);
              }
              else
              {
                v69 = [v4 existingAnalysis];
                objc_msgSend(v30, "vcp_setFlags:", (unint64_t)objc_msgSend(v69, "vcp_flags") & 0x40000);

                v70 = [v4 existingAnalysis];
                objc_msgSend(v30, "vcp_setVersion:", objc_msgSend(v70, "vcp_version"));
              }
            }
          }
          id v30 = v30;
          uint64_t v32 = v30;
        }
        else
        {
          uint64_t v32 = 0;
        }
        goto LABEL_50;
      }
    }
    else
    {
      id v50 = [v4 existingAnalysis];
      id v30 = [v50 mutableCopy];

      id v36 = 0;
      id v35 = 0;
    }
    if (((unint64_t)[v4 analysisTypes] & 0x34000000) != 0)
    {
      os_log_type_t v51 = objc_msgSend(v30, "vcp_results");
      long long v79 = [v51 objectForKeyedSubscript:@"MovieSummaryResults"];

      if ([v79 count]
        && ([v79 objectAtIndexedSubscript:0],
            v52 = objc_claimAutoreleasedReturnValue(),
            BOOL v53 = ((unint64_t)objc_msgSend(v52, "vcp_flags") & 0x80000) == 0,
            v52,
            !v53))
      {
        id v58 = objc_alloc((Class)VCPPhotoAnalyzer);
        double v59 = [v4 asset];
        unsigned int v60 = [v4 analysisTypes];
        id v61 = [v4 downloadedData];
        id v62 = [v58 initWithPHAsset:v59 existingAnalysis:0 analysisTypes:v60 & 0x34000000 downloadedData:v61];

        [v62 setAllowStreaming:1];
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_100079168;
        v80[3] = &unk_100219D98;
        v80[4] = self;
        id v63 = [v62 analyzeAsset:v80 withOptions:0];
        uint64_t v34 = (uint64_t)[v62 status];
        id v35 = [v62 errorCode];
        id v36 = [v62 errorLine];
        if (v34 == 2)
        {
          v64 = objc_msgSend(v63, "vcp_results");
          objc_msgSend(v30, "vcp_addEntriesFromResults:", v64);

          objc_msgSend(v30, "vcp_addTypes:", (unint64_t)objc_msgSend(v4, "analysisTypes") & 0x34000000);
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          uint64_t v54 = VCPLogInstance();
          os_log_type_t v55 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v54, v55))
          {
            os_log_type_t v56 = [v4 asset];
            __int16 v57 = [v56 localIdentifier];
            *(_DWORD *)buf = 138412290;
            __int16 v84 = v57;
            _os_log_impl((void *)&_mh_execute_header, v54, v55, "  [%@] Pre-gating for stabilization not passed.", buf, 0xCu);
          }
        }
        objc_msgSend(v30, "vcp_addTypes:", (unint64_t)objc_msgSend(v4, "analysisTypes") & 0x34000000);
        uint64_t v34 = 2;
      }
    }
    else
    {
      uint64_t v34 = 2;
    }
    goto LABEL_42;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = self->_logPrefix;
      uint64_t v14 = [v4 asset];
      long long v15 = [v14 localIdentifier];
      *(_DWORD *)buf = 138412546;
      __int16 v84 = v13;
      __int16 v85 = 2112;
      id v86 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%@][%@] Asset has failure status; skipping", buf, 0x16u);
    }
LABEL_61:
  }
LABEL_62:
}

- (unint64_t)concurrentAssetCount
{
  if (self->_imageOnlyAnalysis && (DeviceHasANE() & 1) != 0) {
    return 4;
  }
  else {
    return 1;
  }
}

- (unint64_t)_processAssetsConcurrently:(int64_t)a3
{
  id v4 = dispatch_semaphore_create(a3);
  group = dispatch_group_create();
  qos_class_t v5 = qos_class_self();
  BOOL v21 = dispatch_get_global_queue(v5, 0);
  unint64_t v6 = 0;
  os_log_type_t type = VCPLogToOSLogType[5];
  *(void *)&long long v7 = 138412290;
  long long v19 = v7;
  while (v6 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    unsigned int v9 = +[VCPWatchdog sharedWatchdog];
    [v9 pet];

    qos_class_t v10 = [(MADProcessingTask *)self cancelBlock];
    if (!v10) {
      goto LABEL_10;
    }
    id v11 = [(MADProcessingTask *)self cancelBlock];
    int v12 = v11[2]();

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, type))
        {
          logPrefix = self->_logPrefix;
          *(_DWORD *)buf = v19;
          unsigned int v27 = logPrefix;
          _os_log_impl((void *)&_mh_execute_header, v13, type, "[%@] Processing canceled", buf, 0xCu);
        }
      }
      dispatch_semaphore_signal(v4);
      int v15 = 0;
    }
    else
    {
LABEL_10:
      os_log_type_t v16 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v6];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007953C;
      block[3] = &unk_10021BF68;
      block[4] = self;
      id v24 = v16;
      id v25 = v4;
      id v17 = v16;
      dispatch_group_async(group, v21, block);

      int v15 = 1;
    }
    if (!v15) {
      break;
    }
    ++v6;
  }
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);

  return v6;
}

- (unint64_t)_processAssetsSerially
{
  unint64_t v3 = 0;
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    while (1)
    {
      qos_class_t v5 = +[VCPWatchdog sharedWatchdog];
      [v5 pet];

      unint64_t v6 = [(MADProcessingTask *)self cancelBlock];
      if (v6)
      {
        long long v7 = [(MADProcessingTask *)self cancelBlock];
        int v8 = v7[2]();

        if (v8) {
          break;
        }
      }
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v3];
      qos_class_t v10 = VCPSignPostLog();
      os_signpost_id_t v11 = os_signpost_id_generate(v10);

      int v12 = VCPSignPostLog();
      id v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        LOWORD(v20) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MADPhotosFullAssetProcessingTask_ProcessAsset", (const char *)&unk_1001F3BD3, (uint8_t *)&v20, 2u);
      }

      [(MADPhotosFullAssetProcessingTask *)self processAssetEntry:v9];
      uint64_t v14 = VCPSignPostLog();
      int v15 = v14;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        LOWORD(v20) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v11, "MADPhotosFullAssetProcessingTask_ProcessAsset", (const char *)&unk_1001F3BD3, (uint8_t *)&v20, 2u);
      }

      if (++v3 >= (unint64_t)[(NSMutableArray *)self->_assetEntries count]) {
        return v3;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      os_log_type_t v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v16, v17))
      {
        logPrefix = self->_logPrefix;
        int v20 = 138412290;
        BOOL v21 = logPrefix;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Processing canceled", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  return v3;
}

- (int)_process
{
  id v34 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v34 start];
  unint64_t v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  qos_class_t v5 = VCPSignPostLog();
  unint64_t v6 = v5;
  os_signpost_id_t v32 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPhotosFullAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    long long v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      os_signpost_id_t v9 = v4;
      logPrefix = self->_logPrefix;
      unsigned int v11 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v12 = qos_class_self();
      id v13 = VCPMAQoSDescription(v12);
      *(_DWORD *)buf = 138412802;
      os_signpost_id_t v37 = logPrefix;
      __int16 v38 = 1024;
      LODWORD(v39[0]) = v11;
      WORD2(v39[0]) = 2112;
      *(void *)((char *)v39 + 6) = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Processing %d assets (QoS: %@)", buf, 0x1Cu);

      os_signpost_id_t v4 = v9;
    }
  }
  unint64_t v14 = [(MADPhotosFullAssetProcessingTask *)self concurrentAssetCount];
  if (v14 < 2) {
    unint64_t v15 = [(MADPhotosFullAssetProcessingTask *)self _processAssetsSerially];
  }
  else {
    unint64_t v15 = [(MADPhotosFullAssetProcessingTask *)self _processAssetsConcurrently:v14];
  }
  unint64_t v16 = v15;
  os_log_type_t type = VCPLogToOSLogType[7];
  while (v16 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    id v18 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v16];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      long long v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, type))
      {
        os_signpost_id_t v20 = v4;
        BOOL v21 = self->_logPrefix;
        unsigned int v22 = [v18 asset];
        id v23 = [v22 localIdentifier];
        *(_DWORD *)buf = 138412546;
        os_signpost_id_t v37 = v21;
        __int16 v38 = 2112;
        v39[0] = v23;
        _os_log_impl((void *)&_mh_execute_header, v19, type, "[%@][%@] Marking asset as canceled", buf, 0x16u);

        os_signpost_id_t v4 = v20;
      }
    }
    [v18 setStatus:4294967168];
    [v18 setExistingAnalysis:0];
    [v18 setDownloadedData:0];

    ++v16;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v24 = VCPLogInstance();
    os_log_type_t v25 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v37 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] Processing assets done", buf, 0xCu);
    }
  }
  unsigned int v27 = VCPSignPostLog();
  id v28 = v27;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v4, "MADPhotosFullAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  [v34 stop];
  uint64_t v29 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v34 elapsedTimeSeconds];
  objc_msgSend(v29, "accumulateDoubleValue:forField:andEvent:", @"TotalProcessTimeInSeconds", @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  id v30 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 3);
  if (v30)
  {
    [v34 elapsedTimeSeconds];
    objc_msgSend(v29, "accumulateDoubleValue:forField:andEvent:", v30, @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  }

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = [(MADPhotosFullAssetProcessingTask *)self _process];
  }
}

+ (void)publishLivePhotoEffectsAnalysis:(id)a3 toAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    long long v7 = [v5 objectForKeyedSubscript:@"metadataRanges"];
    os_log_type_t v8 = [v7 objectForKeyedSubscript:@"LivePhotoEffectsResults"];

    if ([v8 count])
    {
      os_signpost_id_t v9 = [v8 objectAtIndexedSubscript:0];
      qos_class_t v10 = [v9 objectForKeyedSubscript:@"attributes"];

      if (v10)
      {
        unsigned int v11 = [v10 objectForKeyedSubscript:@"loopSuggestionState"];
        signed int v12 = [v11 intValue];

        id v13 = [v10 objectForKeyedSubscript:@"longExposureSuggestionState"];
        signed int v14 = [v13 intValue];

        unint64_t v15 = [v6 photoLibrary];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10007A150;
        v22[3] = &unk_10021A408;
        id v23 = v6;
        uint64_t v24 = v12;
        uint64_t v25 = v14;
        id v21 = 0;
        unsigned int v16 = [v15 performChangesAndWait:v22 error:&v21];
        id v17 = v21;

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v18 = VCPLogInstance();
          os_log_type_t v19 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v18, v19))
          {
            CFStringRef v20 = @"NO";
            if (v16) {
              CFStringRef v20 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v27 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "Publish live photo effects suggestion states success: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (int)_publish
{
  id v160 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v160 start];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  os_signpost_id_t v4 = VCPSignPostLog();
  id v5 = v4;
  unint64_t v157 = v3 - 1;
  os_signpost_id_t spid = v3;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADPhotosFullAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  unint64_t v6 = (unint64_t)@"No";
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    long long v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      logPrefix = self->_logPrefix;
      unsigned int v10 = [(NSMutableArray *)self->_assetEntries count];
      if (self->_imageOnlyAnalysis) {
        CFStringRef v11 = @"Yes";
      }
      else {
        CFStringRef v11 = @"No";
      }
      qos_class_t v12 = qos_class_self();
      VCPMAQoSDescription(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v183 = logPrefix;
      __int16 v184 = 1024;
      unsigned int v185 = v10;
      __int16 v186 = 2112;
      CFStringRef v187 = v11;
      __int16 v188 = 2112;
      id v189 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Persisting %d assets (imageOnly:%@) (QoS: %@)", buf, 0x26u);
    }
  }
  signed int v14 = +[MADStateHandler sharedStateHandler];
  unint64_t v15 = self->_logPrefix;
  id v16 = [(NSMutableArray *)self->_assetEntries count];
  if (self->_imageOnlyAnalysis) {
    CFStringRef v17 = @"Yes";
  }
  else {
    CFStringRef v17 = @"No";
  }
  [v14 addBreadcrumb:@"[%@] Persisting %d assets, (imageOnly:%@)", v15, v16, v17];

  if ([(NSMutableArray *)self->_assetEntries count])
  {
    v165 = +[VCPPhotosAssetChangeManager managerForPhotoLibrary:self->_photoLibrary];
    if (v165)
    {
      uint64_t v18 = +[NSMutableArray array];
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      obj = self->_assetEntries;
      v159 = v18;
      id v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v177 objects:v181 count:16];
      if (!v19)
      {
        int v161 = 0;
        goto LABEL_194;
      }
      int v161 = 0;
      uint64_t v170 = *(void *)v178;
      os_log_type_t v162 = VCPLogToOSLogType[3];
      os_log_type_t v166 = VCPLogToOSLogType[6];
      os_log_type_t type = VCPLogToOSLogType[7];
      while (1)
      {
        uint64_t v20 = 0;
        id v171 = v19;
        do
        {
          if (*(void *)v178 != v170) {
            objc_enumerationMutation(obj);
          }
          uint64_t v173 = v20;
          id v21 = *(void **)(*((void *)&v177 + 1) + 8 * v20);
          unsigned int v22 = self->_logPrefix;
          id v23 = [v21 asset];
          uint64_t v24 = [v23 localIdentifier];
          v174 = +[NSString stringWithFormat:@"[%@][%@]", v22, v24];

          if (![v21 analysisTypes])
          {
            if ([v21 isAnalysisFromComputeSync])
            {
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                unint64_t v33 = VCPLogInstance();
                if (os_log_type_enabled(v33, v166))
                {
                  *(_DWORD *)buf = 138412290;
                  v183 = v174;
                  _os_log_impl((void *)&_mh_execute_header, v33, v166, "%@ Storing existing analysis results from compute sync into MA DB", buf, 0xCu);
                }
              }
              analysisDatabase = self->_analysisDatabase;
              id v35 = [v21 asset];
              id v36 = [v21 existingAnalysis];
              id v37 = (id)[(VCPDatabaseWriter *)analysisDatabase storeAnalysisForAsset:v35 analysis:v36];

              if (v37 == -108 || v37 == -36)
              {
                CFStringRef v38 = (const __CFString *)v37;
              }
              else
              {
                CFStringRef v38 = (const __CFString *)v37;
                if (v37 != -23) {
                  CFStringRef v38 = (const __CFString *)v6;
                }
              }
              int v59 = 1;
              if (v37 == -108 || v37 == -36 || v37 == -23)
              {
                unint64_t v6 = (unint64_t)v38;
                goto LABEL_153;
              }
              if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
              {
                __int16 v84 = [v21 asset];
                __int16 v85 = [v84 localIdentifier];
                id v86 = [v21 existingAnalysis];
                __int16 v87 = +[VSKAsset mad_assetsWithLocalIdentifier:v85 mediaAnalysisResults:v86];

                [v159 addObjectsFromArray:v87];
              }
            }
            else
            {
              CFStringRef v38 = (const __CFString *)v6;
            }
            uint64_t v39 = [v21 asset];
            v40 = [v39 mediaAnalysisProperties];

            if (self->_imageOnlyAnalysis)
            {
              if (!v40
                && (int)[0 mediaAnalysisImageVersion] >= 70
                && (int)[0 imageCaptionVersion] >= 70)
              {
                goto LABEL_91;
              }
LABEL_92:
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                unint64_t v73 = VCPLogInstance();
                if (os_log_type_enabled(v73, v166))
                {
                  *(_DWORD *)buf = 138412290;
                  v183 = v174;
                  _os_log_impl((void *)&_mh_execute_header, v73, v166, "%@ Prepare to persist existing results", buf, 0xCu);
                }
              }
              os_log_type_t v74 = [v21 asset];
              unint64_t v75 = [v21 existingAnalysis];
              BOOL v76 = [v165 updateAsset:v74 withAnalysis:v75 imageOnly:self->_imageOnlyAnalysis] == 0;

              if (!v76 && (int)MediaAnalysisLogLevel() >= 3)
              {
                v77 = VCPLogInstance();
                if (os_log_type_enabled(v77, v162))
                {
                  *(_DWORD *)buf = 138412290;
                  v183 = v174;
                  _os_log_impl((void *)&_mh_execute_header, v77, v162, "%@ Failed to update changeManager with existing results", buf, 0xCu);
                }
              }
            }
            else
            {
              if (v40
                || (unint64_t)[0 mediaAnalysisVersion] < 0x46
                || (int)[0 videoCaptionVersion] < 70)
              {
                goto LABEL_92;
              }
LABEL_91:
              v69 = [0 mediaAnalysisTimeStamp];
              v70 = [v21 asset];
              unsigned int v71 = objc_msgSend(v70, "vcp_modificationDate");
              unsigned __int8 v72 = [v69 isEqualToDate:v71];

              if ((v72 & 1) == 0) {
                goto LABEL_92;
              }
            }
            long long v78 = self->_analysisDatabase;
            long long v79 = [v21 asset];
            long long v80 = [v79 localIdentifier];
            unint64_t v81 = [(VCPDatabaseWriter *)v78 removeProcessingStatusForLocalIdentifier:v80 andTaskID:self->_processingStatusTaskID];

            if (v81 == -108 || v81 == -36)
            {
              unint64_t v6 = v81;
            }
            else
            {
              unint64_t v6 = v81;
              if (v81 != -23) {
                unint64_t v6 = (unint64_t)v38;
              }
            }
            int v59 = 1;
            if (v81 != -108 && v81 != -36 && v81 != -23)
            {
              [(MADPhotosFullAssetProcessingTask *)self increaseProcessedJobCountByOne];
              int v59 = 11;
            }

            goto LABEL_153;
          }
          uint64_t v25 = [v21 analysisResults];
          if (!v25 || ![v21 status])
          {
            unsigned int v169 = v6;
LABEL_34:

            goto LABEL_51;
          }
          uint64_t v26 = [v21 asset];
          unsigned int v27 = objc_msgSend(v26, "vcp_isLivePhoto");

          if (v27)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              id v28 = VCPLogInstance();
              if (os_log_type_enabled(v28, type))
              {
                *(_DWORD *)buf = 138412290;
                v183 = v174;
                _os_log_impl((void *)&_mh_execute_header, v28, type, "%@ Partial analysis completed", buf, 0xCu);
              }
            }
            uint64_t v29 = self->_analysisDatabase;
            id v30 = [v21 asset];
            unint64_t v31 = [v21 analysisResults];
            unsigned int v32 = [(VCPDatabaseWriter *)v29 storeAnalysisForAsset:v30 analysis:v31];

            if (v32 == -108 || v32 == -36)
            {
              unsigned int v169 = v32;
            }
            else
            {
              unsigned int v169 = v32;
              if (v32 != -23) {
                unsigned int v169 = v6;
              }
            }
            int v59 = 1;
            if (v32 == -108 || v32 == -36 || v32 == -23)
            {
              unint64_t v6 = v169;
              goto LABEL_153;
            }
            if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
            {
              v113 = [v21 asset];
              v114 = [v113 localIdentifier];
              v115 = [v21 analysisResults];
              uint64_t v25 = +[VSKAsset mad_assetsWithLocalIdentifier:v114 mediaAnalysisResults:v115];

              [v159 addObjectsFromArray:v25];
              goto LABEL_34;
            }
          }
          else
          {
            unsigned int v169 = v6;
          }
LABEL_51:
          if ([v21 status])
          {
            if ([v21 status] == -128)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                long long v41 = VCPLogInstance();
                if (os_log_type_enabled(v41, type))
                {
                  *(_DWORD *)buf = 138412290;
                  v183 = v174;
                  _os_log_impl((void *)&_mh_execute_header, v41, type, "%@ Analysis canceled", buf, 0xCu);
                }
              }
              id v42 = [v21 previousAttempts];
              long long v43 = self->_analysisDatabase;
              if (v42)
              {
                id v44 = [v21 previousAttempts];
                v164 = [v21 asset];
                unint64_t processingStatusTaskID = self->_processingStatusTaskID;
                id v46 = [v21 previousStatus];
                v163 = [v21 lastAttemptDate];
                id v47 = [v21 asset];
                id v48 = [v47 mediaType];
                unsigned int v49 = [v21 asset];
                unint64_t v50 = -[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:](v43, "setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:", v44, v164, processingStatusTaskID, v46, v163, v48, [v49 mediaSubtypes], objc_msgSend(v21, "previousErrorCode"), objc_msgSend(v21, "previousErrorLine"));
              }
              else
              {
                os_log_type_t v82 = [v21 asset];
                v83 = [v82 localIdentifier];
                unint64_t v50 = [(VCPDatabaseWriter *)v43 removeProcessingStatusForLocalIdentifier:v83 andTaskID:self->_processingStatusTaskID];
              }
              if (v50 == -108 || v50 == -36)
              {
                unint64_t v6 = v50;
              }
              else
              {
                unint64_t v6 = v50;
                if (v50 != -23) {
                  unint64_t v6 = v169;
                }
              }
              int v59 = 1;
              if (v50 != -108 && v50 != -36 && v50 != -23)
              {
                int v161 = -128;
LABEL_139:
                [(MADPhotosFullAssetProcessingTask *)self increaseProcessedJobCountByOne];
                v97 = +[VCPMADCoreAnalyticsManager sharedManager];
                [(MADPhotosFullAssetProcessingTask *)self _reportCoreAnalyticsWithEntry:v21 analyticManager:v97];

                unsigned int v98 = [(MADPhotosFullAssetProcessingTask *)self doneFullAnalysis:v21];
                v99 = [v21 asset];
                unsigned int v100 = [v99 isVideo];

                v101 = [v21 asset];
                unsigned int v102 = objc_msgSend(v101, "vcp_isLivePhoto");

                v103 = [v21 asset];
                if ([v103 isPhoto])
                {
                  v104 = [v21 asset];
                  unsigned int v105 = objc_msgSend(v104, "vcp_isLivePhoto");

                  int v106 = v105 ^ 1;
                }
                else
                {
                  int v106 = 0;
                }

                atomic_fetch_add(&qword_100252538, [v21 needDownload]);
                if (v98)
                {
                  atomic_fetch_add(&qword_100252540, [v21 status] == 2);
                  atomic_fetch_or(&qword_100252548, 0);
                  atomic_fetch_add(&qword_100252550, [v21 status] == 3);
                  atomic_fetch_or(&qword_100252558, 0);
                  unsigned int v107 = [v21 status];
                  BOOL v108 = 0;
                  atomic_fetch_add(&qword_100252560, v107 == 4);
                  unsigned int v109 = v106;
                  unsigned int v110 = v102;
                  unsigned int v111 = v100;
                }
                else
                {
                  atomic_fetch_or(&qword_100252540, 0);
                  atomic_fetch_add(&qword_100252548, [v21 status] == 2);
                  atomic_fetch_or(&qword_100252550, 0);
                  atomic_fetch_add(&qword_100252558, [v21 status] == 3);
                  atomic_fetch_or(&qword_100252560, 0);
                  unsigned int v112 = [v21 status];
                  unsigned int v109 = 0;
                  unsigned int v110 = 0;
                  unsigned int v111 = 0;
                  BOOL v108 = v112 == 4;
                }
                int v59 = 0;
                atomic_fetch_add(&qword_100252568, v108);
                atomic_fetch_add(&qword_100252570, v111);
                atomic_fetch_add(&qword_100252578, (v98 ^ 1) & v100);
                atomic_fetch_add(&qword_100252580, v110);
                atomic_fetch_add(&qword_100252588, (v98 ^ 1) & v102);
                atomic_fetch_add(&qword_100252590, v109);
                atomic_fetch_add(&qword_100252598, (v98 ^ 1) & v106);
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                os_log_type_t v56 = VCPLogInstance();
                if (os_log_type_enabled(v56, v162))
                {
                  unsigned int v57 = [v21 status];
                  *(_DWORD *)buf = 138412546;
                  v183 = v174;
                  __int16 v184 = 1024;
                  unsigned int v185 = v57;
                  _os_log_impl((void *)&_mh_execute_header, v56, v162, "%@ Analysis failed (%d)", buf, 0x12u);
                }
              }
              if ([v21 status] == -23802)
              {
                uint64_t v58 = 2;
              }
              else if ([v21 status] == -23808)
              {
                int v161 = [v21 status];
                uint64_t v58 = 7;
              }
              else
              {
                uint64_t v58 = 3;
              }
              long long v88 = [v21 asset];
              long long v89 = [v21 currentAttemptDate];
              long long v90 = objc_msgSend(v88, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v58, v89, (char *)objc_msgSend(v21, "previousAttempts") + 1);

              v91 = self->_analysisDatabase;
              id v92 = [v21 errorCode];
              id v93 = [v21 errorLine];
              v94 = [v21 asset];
              __int16 v95 = [v94 localIdentifier];
              unint64_t v96 = [(VCPDatabaseWriter *)v91 updateProcessingStatus:v58 andNextAttemptDate:v90 andErrorCode:v92 andErrorLine:v93 forLocalIdentifier:v95 andTaskID:self->_processingStatusTaskID];

              if (v96 == -108 || v96 == -36)
              {
                unint64_t v6 = v96;
              }
              else
              {
                unint64_t v6 = v96;
                if (v96 != -23) {
                  unint64_t v6 = v169;
                }
              }

              int v59 = 1;
              if (v96 != -108 && v96 != -36 && v96 != -23) {
                goto LABEL_139;
              }
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              os_log_type_t v51 = VCPLogInstance();
              if (os_log_type_enabled(v51, type))
              {
                *(_DWORD *)buf = 138412290;
                v183 = v174;
                _os_log_impl((void *)&_mh_execute_header, v51, type, "%@ Analysis completed", buf, 0xCu);
              }
            }
            v52 = self->_analysisDatabase;
            BOOL v53 = [v21 asset];
            uint64_t v54 = [v21 analysisResults];
            unint64_t v55 = [(VCPDatabaseWriter *)v52 storeAnalysisForAsset:v53 analysis:v54];

            if (v55 == -108 || v55 == -36)
            {
              unint64_t v6 = v55;
            }
            else
            {
              unint64_t v6 = v55;
              if (v55 != -23) {
                unint64_t v6 = v169;
              }
            }
            int v59 = 1;
            if (v55 != -108 && v55 != -36 && v55 != -23)
            {
              if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
              {
                unsigned int v60 = [v21 asset];
                id v61 = [v60 localIdentifier];
                id v62 = [v21 analysisResults];
                id v63 = +[VSKAsset mad_assetsWithLocalIdentifier:v61 mediaAnalysisResults:v62];

                [v159 addObjectsFromArray:v63];
              }
              v64 = self->_analysisDatabase;
              v65 = [v21 asset];
              unsigned int v66 = [v65 localIdentifier];
              id v67 = (id)[(VCPDatabaseWriter *)v64 removeProcessingStatusForLocalIdentifier:v66 andTaskID:self->_processingStatusTaskID];

              if (v67 == -108 || v67 == -36)
              {
                CFStringRef v68 = (const __CFString *)v67;
              }
              else
              {
                CFStringRef v68 = (const __CFString *)v67;
                if (v67 != -23) {
                  CFStringRef v68 = (const __CFString *)v6;
                }
              }
              int v59 = 1;
              if (v67 == -108 || v67 == -36 || v67 == -23)
              {
                unint64_t v6 = (unint64_t)v68;
                goto LABEL_153;
              }
              v116 = [v21 asset];
              unsigned int v117 = objc_msgSend(v116, "vcp_isLivePhoto");

              if (v117)
              {
                v118 = objc_opt_class();
                v119 = [v21 analysisResults];
                v120 = [v21 asset];
                [v118 publishLivePhotoEffectsAnalysis:v119 toAsset:v120];
              }
              v121 = self->_analysisDatabase;
              v122 = [v21 asset];
              v123 = [v122 localIdentifier];
              id v176 = 0;
              unint64_t v124 = [(VCPDatabaseWriter *)v121 analysisForAsset:v123 analysis:&v176];
              id v125 = v176;

              if (v124 == -108 || v124 == -36)
              {
                unint64_t v6 = v124;
              }
              else
              {
                unint64_t v6 = v124;
                if (v124 != -23) {
                  unint64_t v6 = (unint64_t)v68;
                }
              }
              if (v124 != -108 && v124 != -36 && v124 != -23)
              {
                v126 = [v21 analysisResults];
                v127 = objc_msgSend(v126, "vcp_results");
                v128 = [v127 objectForKeyedSubscript:@"KeyFrameResourceResults"];

                v129 = MergeKeyFrameResourceResultsIntoExistingAnalysis(v128, v125);
                [v21 setAnalysisResults:v129];

                v130 = [v21 asset];
                v131 = [v130 mediaAnalysisProperties];

                if (!v131) {
                  goto LABEL_174;
                }
                if ((unint64_t)[v131 mediaAnalysisVersion] < 0x46) {
                  goto LABEL_174;
                }
                if ((int)[v131 mediaAnalysisImageVersion] < 70) {
                  goto LABEL_174;
                }
                if ((int)[v131 imageCaptionVersion] < 70) {
                  goto LABEL_174;
                }
                if ((int)[v131 videoCaptionVersion] < 70) {
                  goto LABEL_174;
                }
                v132 = [v131 mediaAnalysisTimeStamp];
                v133 = [v21 asset];
                v134 = objc_msgSend(v133, "vcp_modificationDate");
                unsigned __int8 v135 = [v132 isEqualToDate:v134];

                if ((v135 & 1) == 0)
                {
LABEL_174:
                  v136 = [v21 asset];
                  v137 = [v21 analysisResults];
                  BOOL v138 = [v165 updateAsset:v136 withAnalysis:v137 imageOnly:self->_imageOnlyAnalysis] == 0;

                  if (!v138 && (int)MediaAnalysisLogLevel() >= 3)
                  {
                    v139 = VCPLogInstance();
                    if (os_log_type_enabled(v139, v162))
                    {
                      *(_DWORD *)buf = 138412290;
                      v183 = v174;
                      _os_log_impl((void *)&_mh_execute_header, v139, v162, "%@ Failed to update changeManager", buf, 0xCu);
                    }
                  }
                }
              }
              int v59 = 1;
              if (v124 != -108 && v124 != -36 && v124 != -23) {
                goto LABEL_139;
              }
            }
          }
LABEL_153:

          if (v59 != 11 && v59)
          {
            int v161 = v6;
            goto LABEL_191;
          }
          uint64_t v20 = v173 + 1;
        }
        while (v171 != (id)(v173 + 1));
        id v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v177 objects:v181 count:16];
        if (!v19)
        {
LABEL_194:

          unsigned int v142 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
          if (v142 == -108 || v142 == -36)
          {
            unsigned int v143 = v142;
          }
          else
          {
            unsigned int v143 = v142;
            if (v142 != -23) {
              unsigned int v143 = v6;
            }
          }
          if (v142 == -108)
          {
            int v161 = v143;
          }
          else
          {
            v140 = v159;
            if (v142 == -36 || v142 == -23)
            {
              int v161 = v143;
              goto LABEL_204;
            }
            if ([v159 count])
            {
              photoLibrary = self->_photoLibrary;
              v146 = [(MADProcessingTask *)self cancelBlock];
              +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:v159 photoLibrary:photoLibrary cancelBlock:v146 error:0];
            }
            if ([v165 publishPendingChanges] && (int)MediaAnalysisLogLevel() >= 4)
            {
              v147 = VCPLogInstance();
              os_log_type_t v148 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v147, v148))
              {
                v149 = self->_logPrefix;
                *(_DWORD *)buf = 138412290;
                v183 = v149;
                _os_log_impl((void *)&_mh_execute_header, v147, v148, "[%@] Failed to persist full analysis results to Photos", buf, 0xCu);
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v150 = VCPLogInstance();
              os_log_type_t v151 = VCPLogToOSLogType[5];
              if (os_log_type_enabled(v150, v151))
              {
                v152 = self->_logPrefix;
                *(_DWORD *)buf = 138412290;
                v183 = v152;
                _os_log_impl((void *)&_mh_execute_header, v150, v151, "[%@] Finished persisting full analysis results to Photos", buf, 0xCu);
              }
            }
            v153 = +[MADStateHandler sharedStateHandler];
            [v153 addBreadcrumb:@"[%@] Finished persisting %d assets", self->_logPrefix, -[NSMutableArray count](self->_assetEntries, "count")];

            v154 = VCPSignPostLog();
            v155 = v154;
            if (v157 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v155, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFullAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            [v160 stop];
            [(MADPhotosFullAssetProcessingTask *)self _reportCoreAnalyticsForSession];
            obj = +[VCPMADCoreAnalyticsManager sharedManager];
            [v160 elapsedTimeSeconds];
            -[NSMutableArray accumulateDoubleValue:forField:andEvent:](obj, "accumulateDoubleValue:forField:andEvent:", @"TotalPublishTimeInSeconds", @"com.apple.mediaanalysisd.FullAnalysisRunSession");
            v156 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 4);
            if (v156)
            {
              [v160 elapsedTimeSeconds];
              -[NSMutableArray accumulateDoubleValue:forField:andEvent:](obj, "accumulateDoubleValue:forField:andEvent:", v156, @"com.apple.mediaanalysisd.FullAnalysisRunSession");
            }

LABEL_191:
          }
          v140 = v159;
          goto LABEL_204;
        }
      }
    }
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v161 = -18;
    }
    else
    {
      v140 = VCPLogInstance();
      os_log_type_t v141 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v140, v141))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v140, v141, "Failed to create VCPPhotosAssetChangeManager", buf, 2u);
      }
      int v161 = -18;
LABEL_204:
    }
  }
  else
  {
    int v161 = 0;
  }

  return v161;
}

- (void)publish
{
  if (!self->_status) {
    self->_status = [(MADPhotosFullAssetProcessingTask *)self _publish];
  }
}

- (void)_reportCoreAnalyticsWithEntry:(id)a3 analyticManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v8, v9))
    {
      logPrefix = self->_logPrefix;
      CFStringRef v11 = [v6 asset];
      qos_class_t v12 = [v11 localIdentifier];
      *(_DWORD *)buf = 138412546;
      v52 = logPrefix;
      __int16 v53 = 2112;
      uint64_t v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@] Prepare to report CoreAnalytics for asset %@ ... ", buf, 0x16u);
    }
  }
  id v13 = +[NSMutableDictionary dictionary];
  signed int v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 status] == 0);
  [v13 setObject:v14 forKeyedSubscript:@"AnalyzeSuccess"];

  unint64_t v15 = [v6 asset];
  id v16 = objc_msgSend(v15, "vcp_typeDescription");
  [v13 setObject:v16 forKeyedSubscript:@"AssetType"];

  [v6 processingInterval];
  CFStringRef v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v13 setObject:v17 forKeyedSubscript:@"TimeAnalyzing"];

  uint64_t v18 = [v6 asset];
  if (objc_msgSend(v18, "vcp_isLivePhoto"))
  {
  }
  else
  {
    id v19 = [v6 asset];
    unsigned int v20 = [v19 isVideo];

    if (!v20) {
      goto LABEL_10;
    }
  }
  id v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 needDownload]);
  [v13 setObject:v21 forKeyedSubscript:@"IsStreamAnalysis"];

  unsigned int v22 = [v6 asset];
  unsigned int v23 = [v22 isVideo];

  if (v23)
  {
    uint64_t v24 = [v6 asset];
    [v24 duration];
    uint64_t v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v13 setObject:v25 forKeyedSubscript:@"LengthOfMovieContentInSeconds"];
  }
LABEL_10:
  if ([v6 status] == -23802)
  {
    if (self->_imageOnlyAnalysis) {
      CFStringRef v26 = @"ImageOnly";
    }
    else {
      CFStringRef v26 = &stru_10021F768;
    }
    unsigned int v27 = +[NSString stringWithFormat:@"%@-NoResource", v26];
    [v13 setObject:v27 forKeyedSubscript:@"AnalysisStatusExtension"];
  }
  else if ([v6 status] == -23808)
  {
    if (self->_imageOnlyAnalysis) {
      CFStringRef v28 = @"ImageOnly";
    }
    else {
      CFStringRef v28 = &stru_10021F768;
    }
    uint64_t v29 = +[NSString stringWithFormat:@"%@-DownloadThrottled", v28];
    [v13 setObject:v29 forKeyedSubscript:@"AnalysisStatusExtension"];
  }
  else if ([v6 status] == -128)
  {
    if (self->_imageOnlyAnalysis) {
      CFStringRef v30 = @"ImageOnly";
    }
    else {
      CFStringRef v30 = &stru_10021F768;
    }
    unint64_t v31 = +[NSString stringWithFormat:@"%@-Canceled", v30];
    [v13 setObject:v31 forKeyedSubscript:@"AnalysisStatusExtension"];
  }
  else if ([v6 status])
  {
    BOOL imageOnlyAnalysis = self->_imageOnlyAnalysis;
    id v33 = [v6 status];
    CFStringRef v34 = @"ImageOnly";
    if (!imageOnlyAnalysis) {
      CFStringRef v34 = &stru_10021F768;
    }
    id v35 = +[NSString stringWithFormat:@"%@-SoftFailure-%d", v34, v33];
    [v13 setObject:v35 forKeyedSubscript:@"AnalysisStatusExtension"];
  }
  if (self->_imageOnlyAnalysis) {
    id v36 = &off_10022DBB8;
  }
  else {
    id v36 = &off_10022DBD0;
  }
  [v13 setObject:v36 forKeyedSubscript:@"ResourceCondition"];
  id v37 = +[NSNumber numberWithBool:[(MADPhotosFullAssetProcessingTask *)self doneFullAnalysis:v6]];
  [v13 setObject:v37 forKeyedSubscript:@"ResourceCondition"];

  CFStringRef v38 = [v6 analysisResults];
  uint64_t v39 = objc_msgSend(v38, "vcp_dateAnalyzed");
  [v39 timeIntervalSinceReferenceDate];
  double v41 = v40;

  id v42 = [v6 asset];
  long long v43 = objc_msgSend(v42, "vcp_modificationDate");
  [v43 timeIntervalSinceReferenceDate];
  double v45 = v44;

  analysisDatabase = self->_analysisDatabase;
  id v47 = VCPStartTimestampKeyForTask(1);
  int64_t v48 = [(VCPDatabaseWriter *)analysisDatabase valueForKey:v47];

  uint64_t v49 = (uint64_t)v45;
  if (v48 > (uint64_t)v45) {
    uint64_t v49 = v48;
  }
  unint64_t v50 = +[NSNumber numberWithLongLong:(unint64_t)(((((uint64_t)v41 - v49) & (unint64_t)~(((uint64_t)v41 - v49) >> 63))* (unsigned __int128)0x1845C8A0CE512957uLL) >> 64) >> 13];
  [v13 setObject:v50 forKeyedSubscript:@"DaysWaitedBeforeAnalyzed"];

  [v7 sendEvent:@"com.apple.mediaanalysisd.FullAnalysisPerAssetInfo" withAnalytics:v13];
}

- (void)_reportCoreAnalyticsForSession
{
  v2 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v3 = atomic_load((unint64_t *)&qword_100252538);
  [v2 accumulateInt64Value:v3 forField:@"NumberOfAssetsSteamed" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  os_signpost_id_t v4 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v5 = atomic_load((unint64_t *)&qword_100252540);
  [v4 accumulateInt64Value:v5 forField:@"NumberOfAssetsNoResourceFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  id v6 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v7 = atomic_load((unint64_t *)&qword_100252548);
  [v6 accumulateInt64Value:v7 forField:@"NumberOfAssetsNoResourcePartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  os_log_type_t v8 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v9 = atomic_load((unint64_t *)&qword_100252550);
  [v8 accumulateInt64Value:v9 forField:@"NumberOfAssetsSoftFailureFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  unsigned int v10 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v11 = atomic_load((unint64_t *)&qword_100252558);
  [v10 accumulateInt64Value:v11 forField:@"NumberOfAssetsSoftFailurePartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  qos_class_t v12 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v13 = atomic_load((unint64_t *)&qword_100252560);
  [v12 accumulateInt64Value:v13 forField:@"NumberOfAssetsHardFailureFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  signed int v14 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v15 = atomic_load((unint64_t *)&qword_100252568);
  [v14 accumulateInt64Value:v15 forField:@"NumberOfAssetsHardFailurePartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  id v16 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v17 = atomic_load((unint64_t *)&qword_100252570);
  [v16 accumulateInt64Value:v17 forField:@"NumberOfMoviesAnalyzedFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v18 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v19 = atomic_load((unint64_t *)&qword_100252578);
  [v18 accumulateInt64Value:v19 forField:@"NumberOfMoviesAnalyzedPartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  unsigned int v20 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v21 = atomic_load((unint64_t *)&qword_100252580);
  [v20 accumulateInt64Value:v21 forField:@"NumberOfLivePhotosAnalyzedFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  unsigned int v22 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v23 = atomic_load((unint64_t *)&qword_100252588);
  [v22 accumulateInt64Value:v23 forField:@"NumberOfLivePhotosAnalyzedPartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v24 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v25 = atomic_load((unint64_t *)&qword_100252590);
  [v24 accumulateInt64Value:v25 forField:@"NumberOfPhotosAnalyzedFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  CFStringRef v26 = +[VCPMADCoreAnalyticsManager sharedManager];
  unint64_t v27 = atomic_load((unint64_t *)&qword_100252598);
  [v26 accumulateInt64Value:v27 forField:@"NumberOfPhotosAnalyzedPartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  atomic_store(0, (unint64_t *)&qword_100252538);
  atomic_store(0, (unint64_t *)&qword_100252540);
  atomic_store(0, (unint64_t *)&qword_100252548);
  atomic_store(0, (unint64_t *)&qword_100252550);
  atomic_store(0, (unint64_t *)&qword_100252558);
  atomic_store(0, (unint64_t *)&qword_100252560);
  atomic_store(0, (unint64_t *)&qword_100252568);
  atomic_store(0, (unint64_t *)&qword_100252570);
  atomic_store(0, (unint64_t *)&qword_100252578);
  atomic_store(0, (unint64_t *)&qword_100252580);
  atomic_store(0, (unint64_t *)&qword_100252588);
  atomic_store(0, (unint64_t *)&qword_100252590);
  atomic_store(0, (unint64_t *)&qword_100252598);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeQueue, 0);
  objc_storeStrong((id *)&self->_computeGroup, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end