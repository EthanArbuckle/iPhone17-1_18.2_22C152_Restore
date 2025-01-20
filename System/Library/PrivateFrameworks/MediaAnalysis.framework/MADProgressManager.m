@interface MADProgressManager
+ (BOOL)_reportFullAnalysisPerTypeWorkloadProgress:(id)a3;
+ (BOOL)_reportWorkloadProgressForTask:(unint64_t)a3 progressDetail:(id)a4;
+ (id)_calculateCompleteDateWithEvent:(id)a3 progress:(unint64_t)a4 taskID:(unint64_t)a5 checkpoint:(unint64_t)a6 featureAvailableCheck:(BOOL)a7 database:(id)a8 completeTimestampKey:(id)a9 completeThreshold:(unint64_t)a10 checkpointTimestampKey:(id)a11 currentDate:(id)a12 startDate:(id)a13;
+ (id)_featureCodeWithTaskID:(unint64_t)a3;
+ (id)_getStartDateFromDatabase:(id)a3 withStartTimestampKey:(id)a4 coreAnalyticsEventKey:(id)a5 andCurrentDate:(id)a6;
+ (id)_queryAndReportProgressForAnalysis:(unint64_t)a3 photoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5;
+ (id)_queryAndReportProgressForPhotoLibrary:(id)a3 analysisType:(unint64_t)a4 analysisSubtype:(unint64_t)a5 queryKeys:(id)a6 cancelOrExtendTimeoutBlock:(id)a7;
+ (id)_queryAndReportProgressForPrioritizedFaceAnalysisForPhotoLibrary:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
+ (unint64_t)_computeProgressPercentageWithProcessedCount:(unint64_t)a3 andTotalCount:(unint64_t)a4;
+ (void)_prepareBGSTCheckpointWithEvent:(id)a3 taskID:(unint64_t)a4 checkpoint:(unint64_t)a5 featureAvailableCheck:(BOOL)a6 database:(id)a7 databaseModified:(BOOL *)a8 checkpointTimestampKey:(id)a9 currentDate:(id)a10;
+ (void)_queryAndReportProgressForMediaAnalysisImageForPhotoLibrary:(id)a3 reuseCachedValue:(BOOL)a4;
+ (void)_reportMediaAnalysisImageCheckpoint:(unint64_t)a3 withProgressPercentage:(unint64_t)a4 checkpointTimestampKey:(id)a5 photoLibrary:(id)a6;
+ (void)_reportMediaAnalysisSubcategoryWorkloadProgress:(unint64_t)a3 totalAssetCount:(unint64_t)a4 forSubCategory:(id)a5;
+ (void)requestProgressUpdateForTasks:(id)a3;
+ (void)resetProcessingCheckpointForTask:(unint64_t)a3;
+ (void)updateProgressForTask:(unint64_t)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6;
+ (void)updateProgressIfRequestedForTasks:(id)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6;
- (MADProgressManager)initWithPhotoLibrary:(id)a3;
@end

@implementation MADProgressManager

- (MADProgressManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADProgressManager;
  v6 = [(MADProgressManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

+ (unint64_t)_computeProgressPercentageWithProcessedCount:(unint64_t)a3 andTotalCount:(unint64_t)a4
{
  if (a4) {
    return (unint64_t)(float)((float)((float)a3 / (float)a4) * 100.0);
  }
  else {
    return 0;
  }
}

+ (id)_getStartDateFromDatabase:(id)a3 withStartTimestampKey:(id)a4 coreAnalyticsEventKey:(id)a5 andCurrentDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 keyExistsInKeyValueStore:v10])
  {
    id v13 = [v9 valueForKey:v10];
    id v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v13];
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_9;
    }
    v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v16))
    {
      v17 = [v14 description];
      int v23 = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = (uint64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%@] started on %@ (timestamp: %lld)", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    [v12 timeIntervalSinceReferenceDate];
    [v9 setValue:(uint64_t)v18 forKey:v10];
    id v14 = v12;
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_9;
    }
    v15 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v19))
    {
      v20 = [v14 description];
      [v14 timeIntervalSinceReferenceDate];
      int v23 = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      v26 = v20;
      __int16 v27 = 2048;
      uint64_t v28 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v15, v19, "[%@] No previous start date, setting as now (%@, timestamp: %lld)", (uint8_t *)&v23, 0x20u);
    }
  }

LABEL_9:
  return v14;
}

+ (id)_featureCodeWithTaskID:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = &off_100218AF8;
LABEL_5:
    v6 = [(__objc2_class *)*v5 featureCodes];
    return v6;
  }
  if (a3 == 3)
  {
    id v5 = off_100218AF0;
    goto LABEL_5;
  }
  v6 = 0;
  return v6;
}

+ (void)_prepareBGSTCheckpointWithEvent:(id)a3 taskID:(unint64_t)a4 checkpoint:(unint64_t)a5 featureAvailableCheck:(BOOL)a6 database:(id)a7 databaseModified:(BOOL *)a8 checkpointTimestampKey:(id)a9 currentDate:(id)a10
{
  BOOL v12 = a6;
  id v58 = a3;
  id v55 = a7;
  id v56 = a9;
  id v54 = a10;
  v59 = MADTaskIdentifierForBackgroundTask(a4);
  int v16 = BGSystemTaskCustomCheckpointMax;
  int v17 = BGSystemTaskCustomCheckpointMin;
  if (BGSystemTaskCustomCheckpointMax < a5 || BGSystemTaskCustomCheckpointMin > a5)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      os_log_type_t v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[4];
      id v53 = v19;
      if (!os_log_type_enabled(v19, v20)) {
        goto LABEL_52;
      }
      *(_DWORD *)buf = 138413058;
      id v67 = v58;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = a5;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v17;
      *(_WORD *)&v69[10] = 1024;
      *(_DWORD *)&v69[12] = v16;
      double v21 = "[%@] MADBGCheckpoint %d is not within range [%d, %d]";
      v22 = v19;
      os_log_type_t v23 = v20;
      uint32_t v24 = 30;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, v24);
      goto LABEL_52;
    }
  }
  else
  {
    if (v59)
    {
      id v25 = [v55 valueForKey:v56];
      if (v25)
      {
        id v53 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v25];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v26 = VCPLogInstance();
          os_log_type_t v27 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = [v53 description];
            *(_DWORD *)buf = 138412802;
            id v67 = v58;
            __int16 v68 = 2112;
            *(void *)v69 = v28;
            *(_WORD *)&v69[8] = 2048;
            *(void *)&v69[10] = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@] checkpoint reported on %@ (timestamp: %lld)", buf, 0x20u);
          }
        }
LABEL_52:

        goto LABEL_53;
      }
      id v65 = 0;
      uint64_t v31 = +[BGSystemTaskCheckpoints reportCustomCheckpoint:forTask:error:](BGSystemTaskCheckpoints, "reportCustomCheckpoint:forTask:error:", a5, v59, &v65, 0);
      id v53 = v65;
      if (v31)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v32 = VCPLogInstance();
          os_log_type_t v33 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v32, v33))
          {
            *(_DWORD *)buf = 138412802;
            id v67 = v58;
            __int16 v68 = 1024;
            *(_DWORD *)v69 = a5;
            *(_WORD *)&v69[4] = 2112;
            *(void *)&v69[6] = v59;
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%@] Reported BGST Custom Checkpoint %d for task taskIdentifier %@", buf, 0x1Cu);
          }
        }
        objc_msgSend(v54, "timeIntervalSinceReferenceDate", v53);
        [v55 setValue:(uint64_t)v34 forKey:v56];
        *a8 = 1;
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v35 = VCPLogInstance();
        os_log_type_t v36 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v35, v36))
        {
          *(_DWORD *)buf = 138413058;
          id v67 = v58;
          __int16 v68 = 1024;
          *(_DWORD *)v69 = a5;
          *(_WORD *)&v69[4] = 2112;
          *(void *)&v69[6] = v59;
          *(_WORD *)&v69[14] = 2112;
          *(void *)&v69[16] = v53;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] Failed to report BGST Custom Checkpoint %d for taskIdentifier %@ - %@", buf, 0x26u);
        }
      }
      if (!v12) {
        goto LABEL_52;
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v37 = [a1 _featureCodeWithTaskID:a4];
      id v38 = [v37 countByEnumeratingWithState:&v61 objects:v72 count:16];
      if (!v38) {
        goto LABEL_51;
      }
      uint64_t v39 = *(void *)v62;
      os_log_type_t type = VCPLogToOSLogType[3];
      os_log_type_t v40 = VCPLogToOSLogType[5];
      os_log_type_t v41 = VCPLogToOSLogType[7];
LABEL_32:
      uint64_t v42 = 0;
      while (1)
      {
        if (*(void *)v62 != v39) {
          objc_enumerationMutation(v37);
        }
        v43 = *(void **)(*((void *)&v61 + 1) + 8 * v42);
        if ([v43 unsignedIntegerValue]) {
          break;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v47 = VCPLogInstance();
          if (os_log_type_enabled(v47, v41))
          {
            *(_DWORD *)buf = 138412546;
            id v67 = v58;
            __int16 v68 = 2112;
            *(void *)v69 = v59;
            _os_log_impl((void *)&_mh_execute_header, v47, v41, "[%@] Skip reporting BGST Checkpoint for %@: no feature code", buf, 0x16u);
          }
          goto LABEL_48;
        }
LABEL_49:
        if (v38 == (id)++v42)
        {
          id v38 = [v37 countByEnumeratingWithState:&v61 objects:v72 count:16];
          if (!v38)
          {
LABEL_51:

            goto LABEL_52;
          }
          goto LABEL_32;
        }
      }
      id v45 = [v43 unsignedIntegerValue];
      id v60 = 0;
      unsigned __int8 v46 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:50 forFeature:v45 error:&v60];
      v47 = v60;
      if (v46)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v48 = VCPLogInstance();
          if (os_log_type_enabled(v48, v40))
          {
            *(_DWORD *)buf = 138413058;
            id v67 = v58;
            __int16 v68 = 1024;
            *(_DWORD *)v69 = 50;
            *(_WORD *)&v69[4] = 2112;
            *(void *)&v69[6] = v43;
            *(_WORD *)&v69[14] = 2112;
            *(void *)&v69[16] = v59;
            v49 = v48;
            os_log_type_t v50 = v40;
            v51 = "[%@] Reported BGST Checkpoint %d for feature code %@ - %@";
            uint32_t v52 = 38;
LABEL_46:
            _os_log_impl((void *)&_mh_execute_header, v49, v50, v51, buf, v52);
            goto LABEL_47;
          }
          goto LABEL_47;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v48 = VCPLogInstance();
        if (os_log_type_enabled(v48, type))
        {
          *(_DWORD *)buf = 138413314;
          id v67 = v58;
          __int16 v68 = 1024;
          *(_DWORD *)v69 = 50;
          *(_WORD *)&v69[4] = 2112;
          *(void *)&v69[6] = v43;
          *(_WORD *)&v69[14] = 2112;
          *(void *)&v69[16] = v59;
          __int16 v70 = 2112;
          v71 = v47;
          v49 = v48;
          os_log_type_t v50 = type;
          v51 = "[%@] Failed to report BGST Checkpoint %d for feature code %@ - %@ - %@";
          uint32_t v52 = 48;
          goto LABEL_46;
        }
LABEL_47:
      }
LABEL_48:

      goto LABEL_49;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[4];
      id v53 = v29;
      if (!os_log_type_enabled(v29, v30)) {
        goto LABEL_52;
      }
      *(_DWORD *)buf = 138412290;
      id v67 = v58;
      double v21 = "[%@] taskIdentifier not found";
      v22 = v29;
      os_log_type_t v23 = v30;
      uint32_t v24 = 12;
      goto LABEL_18;
    }
  }
LABEL_53:
}

+ (id)_calculateCompleteDateWithEvent:(id)a3 progress:(unint64_t)a4 taskID:(unint64_t)a5 checkpoint:(unint64_t)a6 featureAvailableCheck:(BOOL)a7 database:(id)a8 completeTimestampKey:(id)a9 completeThreshold:(unint64_t)a10 checkpointTimestampKey:(id)a11 currentDate:(id)a12 startDate:(id)a13
{
  BOOL v37 = a7;
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  id v18 = a11;
  id v19 = a12;
  id v38 = a13;
  unsigned __int8 v39 = 0;
  if (a4 < a10)
  {
    [v16 removeKey:v17];
    if (a10 == 90)
    {
      [v16 removeKey:v18];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v20, v21))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%@] not completed yet", buf, 0xCu);
        }
      }
    }
    id v22 = 0;
    unsigned __int8 v39 = 1;
LABEL_22:
    [v16 commit];
    goto LABEL_23;
  }
  if ([v16 keyExistsInKeyValueStore:v17])
  {
    id v23 = [v16 valueForKey:v17];
    id v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v23];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint32_t v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v24, v25))
      {
        [v22 description];
        *(_DWORD *)buf = 138412802;
        id v41 = v15;
        v43 = __int16 v42 = 2112;
        __int16 v44 = 2048;
        id v45 = v23;
        v26 = (void *)v43;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] completed on %@ (timestamp: %lld)", buf, 0x20u);
      }
    }
    int v27 = 0;
  }
  else
  {
    [v19 timeIntervalSinceReferenceDate];
    [v16 setValue:(uint64_t)v28 forKey:v17];
    id v22 = v19;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = [v22 description];
        [v22 timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 138413058;
        id v41 = v15;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v17;
        __int16 v44 = 2112;
        id v45 = v31;
        __int16 v46 = 2048;
        uint64_t v47 = (uint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%@] No previous completion date, setting %@ as now (%@, timestamp: %lld)", buf, 0x2Au);
      }
    }
    int v27 = 1;
    unsigned __int8 v39 = 1;
  }
  if (a10 == 90)
  {
    [a1 _prepareBGSTCheckpointWithEvent:v15 taskID:a5 checkpoint:a6 featureAvailableCheck:v37 database:v16 databaseModified:&v39 checkpointTimestampKey:v18 currentDate:v19];
    int v27 = v39;
  }
  if (v27) {
    goto LABEL_22;
  }
LABEL_23:

  return v22;
}

+ (id)_queryAndReportProgressForPhotoLibrary:(id)a3 analysisType:(unint64_t)a4 analysisSubtype:(unint64_t)a5 queryKeys:(id)a6 cancelOrExtendTimeoutBlock:(id)a7
{
  id v11 = a3;
  id v78 = a6;
  id v68 = a7;
  v69 = v11;
  v77 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v11];
  v76 = +[NSDate now];
  id v79 = 0;
  LODWORD(a7) = +[VCPAnalysisProgressQuery queryProgressDetail:&v79 photoLibrary:v11 taskID:a4 cancelOrExtendTimeoutBlock:v68];
  id v70 = v79;
  if (!a7)
  {
    id v16 = [v78 objectForKeyedSubscript:@"countProcessedQueryKey"];
    id v17 = [v70 objectForKeyedSubscript:v16];
    id v65 = (char *)[v17 unsignedIntegerValue];

    id v18 = [v78 objectForKeyedSubscript:@"countTotalAllowedQueryKey"];
    id v19 = [v70 objectForKeyedSubscript:v18];
    id v67 = [v19 unsignedIntegerValue];

    id v74 = [a1 _computeProgressPercentageWithProcessedCount:v65 andTotalCount:v67];
    switch(a4)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        signed int v20 = VCPPhotosSceneProcessingVersionInternal();
        goto LABEL_20;
      case 3uLL:
        signed int v20 = objc_msgSend(v69, "mad_faceProcessingInternalVersion");
        goto LABEL_20;
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xBuLL:
        goto LABEL_12;
      case 0xAuLL:
        os_log_type_t v21 = &VCPPhotosOCRProcessingVersion;
        goto LABEL_22;
      case 0xCuLL:
        signed int v20 = VCPPhotosVisualSearchAlgorithmVersion();
LABEL_20:
        uint64_t v25 = v20;
        goto LABEL_23;
      default:
        if (a4 == 16)
        {
          os_log_type_t v21 = &VCPPhotosPECProcessingVersion;
        }
        else
        {
          if (a4 != 255)
          {
LABEL_12:
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              id v22 = VCPLogInstance();
              os_log_type_t v23 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v22, v23))
              {
                uint32_t v24 = [v78 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"];
                *(_DWORD *)buf = 138412546;
                v81 = v24;
                __int16 v82 = 1024;
                int v83 = a4;
                _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@] Unsupported analysis type %d", buf, 0x12u);
              }
            }
            uint64_t v25 = 0;
LABEL_23:
            [v77 storeProgressForActivityID:a4 withAnalysisSubtype:a5 version:v25 processedAssetCount:v65 totalAssetCount:v67];
            os_log_t log = +[NSUserDefaults standardUserDefaults];
            long long v64 = [log persistentDomainForName:@"com.apple.mediaanalysisd"];
            v26 = [v78 objectForKeyedSubscript:@"progressPercentageQueryKey"];
            int v27 = [v64 objectForKey:v26];
            BOOL v28 = v74 == (id)[v27 unsignedIntValue];

            if (!v28)
            {
              v29 = +[NSNumber numberWithUnsignedInteger:v74];
              os_log_type_t v30 = [v78 objectForKeyedSubscript:@"progressPercentageQueryKey"];
              [log setObject:v29 forKey:v30];
            }
            uint64_t v31 = [v78 objectForKeyedSubscript:@"startTimestampQueryKey"];
            double v32 = [v78 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"];
            v73 = [a1 _getStartDateFromDatabase:v77 withStartTimestampKey:v31 coreAnalyticsEventKey:v32 andCurrentDate:v76];

            os_log_type_t v33 = +[NSCalendar currentCalendar];
            double v34 = [v33 components:16 fromDate:v73 toDate:v76 options:0];
            id v63 = [v34 day];

            [v78 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"];
            uint64_t v35 = 0;
            v71 = 0;
            v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v72 == @"PrioritizedFaceAnalysis") {
              uint64_t v36 = 501;
            }
            else {
              uint64_t v36 = 509;
            }
            v92[0] = 50;
            v92[1] = 90;
            v92[2] = 99;
            do
            {
              uint64_t v38 = v92[v35];
              unsigned __int8 v39 = VCPPercentCompleteTimestampKeyForTask(a4, v38, 1);
              os_log_type_t v40 = [v78 objectForKeyedSubscript:@"checkpointWithFailureTimestampQueryKey"];
              id v41 = [a1 _calculateCompleteDateWithEvent:v72 progress:v74 taskID:a4 checkpoint:v36 featureAvailableCheck:0 database:v77 completeTimestampKey:v39 completeThreshold:v38 checkpointTimestampKey:v40 currentDate:v76 startDate:v73];

              __int16 v42 = VCPPercentCompleteTimestampKeyForTask(a4, v38, 0);
              uint64_t v43 = [v78 objectForKeyedSubscript:@"checkpointTimestampQueryKey"];
              __int16 v44 = [a1 _calculateCompleteDateWithEvent:v72 progress:v74 taskID:a4 checkpoint:v36 featureAvailableCheck:1 database:v77 completeTimestampKey:v42 completeThreshold:v38 checkpointTimestampKey:v43 currentDate:v76 startDate:v73];

              if (v38 == 99)
              {
                id v45 = v41;

                v71 = v45;
              }

              ++v35;
            }
            while (v35 != 3);
            if (v71)
            {
              __int16 v46 = +[NSCalendar currentCalendar];
              uint64_t v47 = [v46 components:16 fromDate:v73 toDate:v71 options:0];
              uint64_t v48 = (uint64_t)[v47 day];
            }
            else
            {
              uint64_t v48 = -1;
            }
            [v77 commit];
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v49 = VCPLogInstance();
              os_log_type_t v50 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v49, v50))
              {
                v51 = [v78 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"];
                *(_DWORD *)buf = 138413570;
                v81 = v51;
                __int16 v82 = 1024;
                int v83 = (int)v74;
                __int16 v84 = 1024;
                int v85 = (int)v65;
                __int16 v86 = 1024;
                int v87 = (int)v67;
                __int16 v88 = 1024;
                int v89 = (int)v63;
                __int16 v90 = 1024;
                int v91 = v48;
                _os_log_impl((void *)&_mh_execute_header, v49, v50, "[%@] progress %du%% (%du analyzed assets, %du total assets, %du days since start, %du days spent to complete)", buf, 0x2Au);
              }
            }
            uint32_t v52 = [v78 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"];
            VCPCoreAnalyticsReportEventAnalysisProgress(v52, (uint64_t)v63, v48, (uint64_t)v74, (uint64_t)v67);

            id v53 = [v78 objectForKeyedSubscript:@"countFailedQueryKey"];
            id v54 = [v70 objectForKeyedSubscript:v53];
            id v55 = [v54 unsignedIntegerValue];

            id v56 = [a1 _computeProgressPercentageWithProcessedCount:&v65[(void)v55] andTotalCount:v67];
            v57 = [v78 objectForKeyedSubscript:@"progressPercentageWithFailureQueryKey"];
            id v58 = [v64 objectForKey:v57];
            BOOL v59 = v56 == (id)[v58 unsignedIntValue];

            if (!v59)
            {
              id v60 = +[NSNumber numberWithUnsignedInteger:v56];
              long long v61 = [v78 objectForKeyedSubscript:@"progressPercentageWithFailureQueryKey"];
              [log setObject:v60 forKey:v61];
            }
            id v15 = v70;

            goto LABEL_42;
          }
LABEL_11:
          os_log_type_t v21 = &MediaAnalysisVersion;
        }
LABEL_22:
        uint64_t v25 = *v21;
        goto LABEL_23;
    }
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
    id v15 = 0;
    goto LABEL_43;
  }
  BOOL v12 = VCPLogInstance();
  os_log_type_t v13 = VCPLogToOSLogType[3];
  os_log_t log = v12;
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = [v78 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"];
    *(_DWORD *)buf = 138412290;
    v81 = v14;
    _os_log_impl((void *)&_mh_execute_header, log, v13, "[%@] Failed to query progress in default photo library", buf, 0xCu);
  }
  id v15 = 0;
LABEL_42:

LABEL_43:
  return v15;
}

+ (BOOL)_reportWorkloadProgressForTask:(unint64_t)a3 progressDetail:(id)a4
{
  id v5 = a4;
  v6 = VCPTaskIDDescription(a3);
  v7 = MADTaskIdentifierForBackgroundTask(a3);
  if (v7)
  {
    v8 = [v5 objectForKeyedSubscript:@"processed"];
    id v9 = [v8 unsignedIntegerValue];

    id v10 = [v5 objectForKeyedSubscript:@"total-allowed"];
    id v11 = [v10 unsignedIntegerValue];

    BOOL v12 = [v5 objectForKeyedSubscript:@"failed"];
    id v13 = [v12 unsignedIntegerValue];

    if ((unint64_t)v13 >= v11 - v9) {
      unint64_t v14 = v11 - v9;
    }
    else {
      unint64_t v14 = (unint64_t)v13;
    }
    if (v11)
    {
      id v15 = +[BGSystemTaskCheckpoints sharedInstance];
      float v16 = (double)(unint64_t)v9 * 100.0 / (double)(unint64_t)v11;
      id v38 = 0;
      unsigned __int8 v17 = [v15 reportProgressForTaskWithName:v7 withGlobalTarget:v11 completed:vcvtas_u32_f32(v16) atDate:0 category:10 subCategory:0 error:&v38];
      id v18 = v38;

      if (v17)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          id v19 = VCPLogInstance();
          os_log_type_t v20 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v19, v20))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)os_log_type_t v40 = v9;
            *(_WORD *)&v40[4] = 1024;
            *(_DWORD *)&v40[6] = v11;
            *(_WORD *)&v40[10] = 2112;
            *(void *)&v40[12] = v6;
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MADProgressManager] Reported progress (%d/%d) for %@", buf, 0x18u);
          }
        }
        os_log_type_t v21 = +[BGSystemTaskCheckpoints sharedInstance];
        float v22 = (double)v14 * 100.0 / (double)(unint64_t)v11;
        BOOL v37 = v18;
        unsigned __int8 v23 = [v21 reportProgressForTaskWithName:v7 withGlobalTarget:v11 completed:vcvtas_u32_f32(v22) atDate:0 category:10 subCategory:@"failed" error:&v37];
        uint32_t v24 = v37;

        if (v23)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            uint64_t v25 = VCPLogInstance();
            os_log_type_t v26 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v25, v26))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)os_log_type_t v40 = v14;
              *(_WORD *)&v40[4] = 1024;
              *(_DWORD *)&v40[6] = v11;
              *(_WORD *)&v40[10] = 2112;
              *(void *)&v40[12] = v6;
              _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MADProgressManager] Reported failed-assets-percentage (%d/%d) for %@", buf, 0x18u);
            }
            BOOL v27 = 1;
LABEL_33:
            id v18 = v24;
LABEL_34:

            goto LABEL_38;
          }
          BOOL v27 = 1;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            uint64_t v25 = VCPLogInstance();
            os_log_type_t v35 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v25, v35))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)os_log_type_t v40 = v14;
              *(_WORD *)&v40[4] = 1024;
              *(_DWORD *)&v40[6] = v11;
              *(_WORD *)&v40[10] = 2112;
              *(void *)&v40[12] = v6;
              __int16 v41 = 2112;
              __int16 v42 = v24;
              _os_log_impl((void *)&_mh_execute_header, v25, v35, "[MADProgressManager] Failed to report failed-assets-precentage (%d/%d) for %@ - %@", buf, 0x22u);
            }
            BOOL v27 = 0;
            goto LABEL_33;
          }
          BOOL v27 = 0;
        }
        id v18 = v24;
        goto LABEL_38;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v25 = VCPLogInstance();
        os_log_type_t v34 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v25, v34))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)os_log_type_t v40 = v9;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v11;
          *(_WORD *)&v40[10] = 2112;
          *(void *)&v40[12] = v6;
          __int16 v41 = 2112;
          __int16 v42 = v18;
          _os_log_impl((void *)&_mh_execute_header, v25, v34, "[MADProgressManager] Failed to report progress (%d/%d) for %@ - %@", buf, 0x22u);
        }
        BOOL v27 = 0;
        goto LABEL_34;
      }
LABEL_28:
      BOOL v27 = 0;
LABEL_38:

      goto LABEL_39;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v18 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v18, v33)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412802;
      *(void *)os_log_type_t v40 = v6;
      *(_WORD *)&v40[8] = 1024;
      *(_DWORD *)&v40[10] = v9;
      *(_WORD *)&v40[14] = 1024;
      *(_DWORD *)&v40[16] = 0;
      v29 = "[MADProgressManagers] totalCount for %@ equal to zero, skipping reporting (%d/%d)";
      os_log_type_t v30 = v18;
      os_log_type_t v31 = v33;
      uint32_t v32 = 24;
      goto LABEL_22;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v18 = VCPLogInstance();
    os_log_type_t v28 = VCPLogToOSLogType[4];
    if (!os_log_type_enabled(v18, v28)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)os_log_type_t v40 = a3;
    *(_WORD *)&v40[4] = 2112;
    *(void *)&v40[6] = v6;
    v29 = "[MADProgressManager] unable to determine BGST identifier for task %d (%@)";
    os_log_type_t v30 = v18;
    os_log_type_t v31 = v28;
    uint32_t v32 = 18;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buf, v32);
    goto LABEL_28;
  }
  BOOL v27 = 0;
LABEL_39:

  return v27;
}

+ (BOOL)_reportFullAnalysisPerTypeWorkloadProgress:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"full-analysis-livephoto-count"];
  id v6 = [v5 unsignedIntegerValue];

  v7 = [v4 objectForKeyedSubscript:@"full-analysis-livephoto-processed"];
  id v8 = [v7 unsignedIntegerValue];

  if (v6)
  {
    float v9 = (double)(unint64_t)v8 * 100.0 / (double)(unint64_t)v6;
    [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:vcvtas_u32_f32(v9) totalAssetCount:v6 forSubCategory:@"livePhotos-processed"];
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADProgressManager] Live Photo count equal to 0, skipping reporting.", buf, 2u);
    }
  }
  BOOL v12 = [v4 objectForKeyedSubscript:@"full-analysis-video-count"];
  id v13 = [v12 unsignedIntegerValue];

  unint64_t v14 = [v4 objectForKeyedSubscript:@"full-analysis-video-processed"];
  id v15 = [v14 unsignedIntegerValue];

  if (v13)
  {
    float v16 = (double)(unint64_t)v15 * 100.0 / (double)(unint64_t)v13;
    [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:vcvtas_u32_f32(v16) totalAssetCount:v13 forSubCategory:@"videos-processed"];
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unsigned __int8 v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)os_log_type_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[MADProgressManager] Video count equal to 0, skipping reporting.", v20, 2u);
    }
  }
  return 1;
}

+ (id)_queryAndReportProgressForPrioritizedFaceAnalysisForPhotoLibrary:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"countProcessedQueryKey";
  v12[1] = @"countTotalAllowedQueryKey";
  v13[0] = @"prioritized-processed";
  v13[1] = @"prioritized-total-allowed";
  v12[2] = @"startTimestampQueryKey";
  id v8 = VCPStartTimestampKeyForTask(3);
  v13[2] = v8;
  v13[3] = @"PrioritizedFaceAnalysisProgressPercentage";
  v12[3] = @"progressPercentageQueryKey";
  v12[4] = @"checkpointTimestampQueryKey";
  v13[4] = @"PrioritizedFaceAnalysisCheckpointReportedTimestamp";
  v13[5] = @"PrioritizedFaceAnalysisProgressPercentageWithFailure";
  v12[5] = @"progressPercentageWithFailureQueryKey";
  v12[6] = @"checkpointWithFailureTimestampQueryKey";
  v12[7] = @"coreAnalyticsEventQueryKey";
  v13[6] = @"PrioritizedFaceAnalysisCheckpointWithFailureReportedTimestamp";
  v13[7] = @"PrioritizedFaceAnalysis";
  float v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];

  id v10 = [a1 _queryAndReportProgressForPhotoLibrary:v6 analysisType:3 analysisSubtype:1 queryKeys:v9 cancelOrExtendTimeoutBlock:v7];

  return v10;
}

+ (id)_queryAndReportProgressForAnalysis:(unint64_t)a3 photoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8 = a4;
  id v21 = a5;
  v22[0] = @"countProcessedQueryKey";
  v22[1] = @"countFailedQueryKey";
  v23[0] = @"processed";
  v23[1] = @"failed";
  v23[2] = @"total-allowed";
  v22[2] = @"countTotalAllowedQueryKey";
  v22[3] = @"startTimestampQueryKey";
  float v9 = VCPStartTimestampKeyForTask(a3);
  v23[3] = v9;
  v22[4] = @"progressPercentageQueryKey";
  id v10 = VCPProgressPercentageKeyForTask(a3, 0);
  v23[4] = v10;
  v22[5] = @"checkpointTimestampQueryKey";
  os_log_type_t v11 = VCPBGSTCheckpointTimestampKeyForTask(a3, 0);
  v23[5] = v11;
  v22[6] = @"progressPercentageWithFailureQueryKey";
  BOOL v12 = VCPProgressPercentageKeyForTask(a3, 1);
  v23[6] = v12;
  v22[7] = @"checkpointWithFailureTimestampQueryKey";
  id v13 = VCPBGSTCheckpointTimestampKeyForTask(a3, 1);
  v23[7] = v13;
  v22[8] = @"coreAnalyticsEventQueryKey";
  unint64_t v14 = VCPTaskIDDescription(a3);
  v23[8] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:9];

  float v16 = [a1 _queryAndReportProgressForPhotoLibrary:v8 analysisType:a3 analysisSubtype:0 queryKeys:v15 cancelOrExtendTimeoutBlock:v21];
  if ([a1 _reportWorkloadProgressForTask:a3 progressDetail:v16])
  {
    unsigned __int8 v17 = VCPRequestBGSTProgressReportKeyForTask(a3);
    os_log_type_t v18 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v8];
    id v19 = v18;
    if (v17)
    {
      [v18 setValue:0 forKey:v17];
      [v19 commit];
    }
  }
  if (a3 == 1) {
    [a1 _reportFullAnalysisPerTypeWorkloadProgress:v16];
  }

  return v16;
}

+ (void)_reportMediaAnalysisImageCheckpoint:(unint64_t)a3 withProgressPercentage:(unint64_t)a4 checkpointTimestampKey:(id)a5 photoLibrary:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  os_log_type_t v11 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];
  BOOL v12 = v11;
  if (a4 < 0x5A)
  {
    [v11 removeKey:v9];
    if ((int)MediaAnalysisLogLevel() < 7)
    {
LABEL_36:
      [v12 commit];
      goto LABEL_37;
    }
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v41 = @"MediaAnalysisImage";
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] not completed yet", buf, 0xCu);
    }
LABEL_35:

    goto LABEL_36;
  }
  int v15 = BGSystemTaskCustomCheckpointMax;
  int v16 = BGSystemTaskCustomCheckpointMin;
  if (BGSystemTaskCustomCheckpointMax < a3 || BGSystemTaskCustomCheckpointMin > a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138413058;
        CFStringRef v41 = @"MediaAnalysisImage";
        __int16 v42 = 1024;
        *(_DWORD *)uint64_t v43 = a3;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = v16;
        *(_WORD *)&v43[10] = 1024;
        *(_DWORD *)&v43[12] = v15;
        os_log_type_t v20 = "[%@] MADBGCheckpoint %d is not within range [%d, %d]";
        id v21 = v18;
        os_log_type_t v22 = v19;
        uint32_t v23 = 30;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
      }
LABEL_22:
    }
  }
  else
  {
    uint64_t v24 = MADTaskIdentifierForBackgroundTask(1);
    id v13 = v24;
    if (v24)
    {
      id v25 = [v12 valueForKey:v9];
      if (v25)
      {
        id v26 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v25];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          BOOL v27 = VCPLogInstance();
          os_log_type_t v28 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v27, v28))
          {
            *(_DWORD *)buf = 138412802;
            CFStringRef v41 = @"MediaAnalysisImage";
            __int16 v42 = 2112;
            *(void *)uint64_t v43 = v26;
            *(_WORD *)&v43[8] = 2048;
            *(void *)&v43[10] = v25;
            v29 = "[%@] checkpoint reported on %@ (timestamp: %lld)";
            os_log_type_t v30 = v27;
            os_log_type_t v31 = v28;
            uint32_t v32 = 32;
LABEL_32:
            _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buf, v32);
            goto LABEL_33;
          }
          goto LABEL_33;
        }
      }
      else
      {
        id v39 = 0;
        unsigned __int8 v34 = +[BGSystemTaskCheckpoints reportCustomCheckpoint:a3 forTask:v13 error:&v39];
        id v26 = v39;
        if (v34)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            os_log_type_t v35 = VCPLogInstance();
            os_log_type_t v36 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v35, v36))
            {
              *(_DWORD *)buf = 138412802;
              CFStringRef v41 = @"MediaAnalysisImage";
              __int16 v42 = 1024;
              *(_DWORD *)uint64_t v43 = a3;
              *(_WORD *)&v43[4] = 2112;
              *(void *)&v43[6] = v13;
              _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] Reported BGST Custom Checkpoint %d for task taskIdentifier %@", buf, 0x1Cu);
            }
          }
          BOOL v27 = +[NSDate now];
          [v27 timeIntervalSinceReferenceDate];
          [v12 setValue:(uint64_t)v37 forKey:v9];
          goto LABEL_33;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          BOOL v27 = VCPLogInstance();
          os_log_type_t v38 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v27, v38))
          {
            *(_DWORD *)buf = 138413058;
            CFStringRef v41 = @"MediaAnalysisImage";
            __int16 v42 = 1024;
            *(_DWORD *)uint64_t v43 = a3;
            *(_WORD *)&v43[4] = 2112;
            *(void *)&v43[6] = v13;
            *(_WORD *)&v43[14] = 2112;
            *(void *)&v43[16] = v26;
            v29 = "[%@] Failed to report BGST Custom Checkpoint %d for taskIdentifier %@. Error: %@";
            os_log_type_t v30 = v27;
            os_log_type_t v31 = v38;
            uint32_t v32 = 38;
            goto LABEL_32;
          }
LABEL_33:
        }
      }

      goto LABEL_35;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v18 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v33))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v41 = @"MediaAnalysisImage";
        os_log_type_t v20 = "[%@] task identifier not found";
        id v21 = v18;
        os_log_type_t v22 = v33;
        uint32_t v23 = 12;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
LABEL_37:
}

+ (void)_reportMediaAnalysisSubcategoryWorkloadProgress:(unint64_t)a3 totalAssetCount:(unint64_t)a4 forSubCategory:(id)a5
{
  id v7 = a5;
  id v8 = VCPTaskIDDescription(1);
  id v9 = MADTaskIdentifierForBackgroundTask(1);
  if (a4)
  {
    id v10 = +[BGSystemTaskCheckpoints sharedInstance];
    id v21 = 0;
    unsigned __int8 v11 = [v10 reportProgressForTaskWithName:v9 withGlobalTarget:a4 completed:a3 atDate:0 category:10 subCategory:v7 error:&v21];
    BOOL v12 = v21;

    if (v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)uint32_t v23 = a3;
          *(_WORD *)&v23[4] = 1024;
          *(_DWORD *)&v23[6] = a4;
          *(_WORD *)uint64_t v24 = 2112;
          *(void *)&v24[2] = v8;
          *(_WORD *)id v25 = 2112;
          *(void *)&v25[2] = v7;
          int v15 = "[MADProgressManager] Reported progress (%d percent of %d) for %@ (%@)";
          int v16 = v13;
          os_log_type_t v17 = v14;
          uint32_t v18 = 34;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v13 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v20))
      {
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)uint32_t v23 = a3;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = a4;
        *(_WORD *)uint64_t v24 = 2112;
        *(void *)&v24[2] = v8;
        *(_WORD *)id v25 = 2112;
        *(void *)&v25[2] = v7;
        __int16 v26 = 2112;
        BOOL v27 = v12;
        int v15 = "[MADProgressManager] Failed to report progress (%d percent of %d) for %@ (%@) - %@";
        int v16 = v13;
        os_log_type_t v17 = v20;
        uint32_t v18 = 44;
        goto LABEL_12;
      }
LABEL_13:
    }
LABEL_14:

    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    BOOL v12 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v12, v19))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)uint32_t v23 = v8;
      *(_WORD *)&v23[8] = 2112;
      *(void *)uint64_t v24 = v7;
      *(_WORD *)&v24[8] = 1024;
      *(_DWORD *)id v25 = a3;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v19, "[MADProgressManager] Total assets for %@ (%@) equal to zero, skipping reporting (%u / %u)", buf, 0x22u);
    }
    goto LABEL_14;
  }
LABEL_15:
}

+ (void)_queryAndReportProgressForMediaAnalysisImageForPhotoLibrary:(id)a3 reuseCachedValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v6];
  id v8 = v7;
  id v25 = 0;
  id v26 = 0;
  if (v4
    && [v7 keyExistsInKeyValueStore:@"MediaAnalysisImagePriority1ProgressPercentage"])
  {
    id v26 = [v8 valueForKey:@"MediaAnalysisImagePriority1ProgressPercentage"];
    id v9 = 0;
    id v25 = [v8 valueForKey:@"MediaAnalysisImagePriority1TotalAssetCount"];
    goto LABEL_5;
  }
  id v24 = 0;
  unsigned __int8 v10 = objc_msgSend(v6, "mad_calculateProgressPercentage:totalAssetCount:progressPercentageWithFailure:taskID:phTaskID:priority:failedAssetCount:error:", &v26, &v25, 0, 1, 17, 1, 0, &v24);
  id v9 = v24;
  if (v10)
  {
LABEL_5:
    [a1 _reportMediaAnalysisImageCheckpoint:507 withProgressPercentage:v26 checkpointTimestampKey:@"MediaAnalysisImagePriority1CheckpointReportedTimestamp" photoLibrary:v6];
    [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:v26 totalAssetCount:v25 forSubCategory:@"prioritized"];
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    unint64_t v11 = (int)[v8 queryAssetCountForTaskID:255];
    id v20 = v9;
    unsigned __int8 v12 = objc_msgSend(v6, "mad_calculateProgressPercentage:totalAssetCount:progressPercentageWithFailure:taskID:phTaskID:priority:failedAssetCount:error:", &v23, &v22, &v21, 1, 17, 0, v11, &v20);
    id v13 = v20;

    if (v12)
    {
      unint64_t v14 = v22;
      [a1 _reportMediaAnalysisImageCheckpoint:508 withProgressPercentage:v23 checkpointTimestampKey:@"MediaAnalysisImageCheckpointReportedTimestamp" photoLibrary:v6];
      [a1 _reportMediaAnalysisImageCheckpoint:504 withProgressPercentage:v21 checkpointTimestampKey:@"MediaAnalysisImageCheckpointWithFailureReportedTimestamp" photoLibrary:v6];
      [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:v23 totalAssetCount:v22 forSubCategory:@"image"];
      float v15 = (double)v11 * 100.0 / (double)v14;
      [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:vcvtas_u32_f32(v15) totalAssetCount:v22 forSubCategory:@"failedImage"];
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint32_t v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v28 = @"MediaAnalysisImage";
        __int16 v29 = 1024;
        int v30 = 0;
        __int16 v31 = 2112;
        id v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] Failed to query progress for priority %u: %@", buf, 0x1Cu);
      }
    }
    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v28 = @"MediaAnalysisImage";
      __int16 v29 = 1024;
      int v30 = 1;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Failed to query progress for priority %u: %@", buf, 0x1Cu);
    }
  }
  id v13 = v9;
LABEL_16:
}

+ (void)updateProgressForTask:(unint64_t)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  unint64_t v11 = (unsigned int (**)(void))a6;
  uint64_t v47 = MADTaskIdentifierForBackgroundTask(a3);
  unsigned __int8 v12 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];
  if (a3 == 1)
  {
    uint64_t v22 = mach_absolute_time();
    uint64_t v23 = VCPSignPostLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    id v25 = VCPSignPostLog();
    id v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPMADCollectAndReportAnalysisProgress_MediaAnalysisImage", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [a1 _queryAndReportProgressForMediaAnalysisImageForPhotoLibrary:v10 reuseCachedValue:v7];
    BOOL v27 = VCPSignPostLog();
    CFStringRef v28 = v27;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v24, "VCPMADCollectAndReportAnalysisProgress_MediaAnalysisImage", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v22)
    {
LABEL_33:
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }
  else if (a3 == 3)
  {
    uint64_t v13 = mach_absolute_time();
    unint64_t v14 = VCPSignPostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    int v16 = VCPSignPostLog();
    os_log_type_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPMADCollectAndReportAnalysisProgress_CacheFaceProgress", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (![v12 valueForKey:@"NumberOfAssetsAllowedForPhotosFaceProcessing"]) {
      [v12 cacheCurrentFaceProgress];
    }
    uint32_t v18 = VCPSignPostLog();
    os_log_type_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v15, "VCPMADCollectAndReportAnalysisProgress_CacheFaceProgress", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v13)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if (v11 && v11[2](v11))
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v20, v21))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v47;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%@] User cancelled during updateProgressForTask ...", buf, 0xCu);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      goto LABEL_50;
    }
    uint64_t v29 = mach_absolute_time();
    int v30 = VCPSignPostLog();
    os_signpost_id_t v31 = os_signpost_id_generate(v30);

    id v32 = VCPSignPostLog();
    os_log_type_t v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VCPMADCollectAndReportAnalysisProgress_PrioritizedFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v34 = [a1 _queryAndReportProgressForPrioritizedFaceAnalysisForPhotoLibrary:v10 cancelOrExtendTimeoutBlock:v11];
    os_log_type_t v35 = VCPSignPostLog();
    os_log_type_t v36 = v35;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v31, "VCPMADCollectAndReportAnalysisProgress_PrioritizedFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v29) {
      goto LABEL_33;
    }
  }
  if (v11 && v11[2](v11))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v47;
        goto LABEL_39;
      }
LABEL_40:
    }
  }
  else
  {
    uint64_t v37 = mach_absolute_time();
    os_log_type_t v38 = VCPSignPostLog();
    os_signpost_id_t v39 = os_signpost_id_generate(v38);

    os_log_type_t v40 = VCPSignPostLog();
    CFStringRef v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      __int16 v42 = VCPTaskIDDescription(a3);
      *(_DWORD *)buf = 138412290;
      v49 = v42;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "VCPMADCollectAndReportAnalysisProgress", "_%@", buf, 0xCu);
    }
    id v43 = [a1 _queryAndReportProgressForAnalysis:a3 photoLibrary:v10 cancelOrExtendTimeoutBlock:v11];
    __int16 v44 = VCPSignPostLog();
    id v45 = v44;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      __int16 v46 = VCPTaskIDDescription(a3);
      *(_DWORD *)buf = 138412290;
      v49 = v46;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, v39, "VCPMADCollectAndReportAnalysisProgress", "_%@", buf, 0xCu);
    }
    if (v37)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    [v12 removeProgressEntriesBeyondLimits];
    [v12 commit];
  }
LABEL_50:
}

+ (void)updateProgressIfRequestedForTasks:(id)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  id v32 = a3;
  id v8 = a4;
  id v37 = a6;
  os_log_type_t v38 = v8;
  id v9 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v8];
  id v10 = +[NSDate now];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v32;
  id v13 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v13)
  {
    uint64_t v40 = (uint64_t)v12;
    uint64_t v41 = *(void *)v43;
    os_log_type_t type = VCPLogToOSLogType[4];
    os_log_type_t v33 = VCPLogToOSLogType[3];
    os_log_type_t v34 = VCPLogToOSLogType[6];
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v17 = [v15 unsignedIntegerValue];
        uint32_t v18 = VCPRequestBGSTProgressReportKeyForTask((uint64_t)v17);
        uint64_t v19 = VCPLastBGSTProgressReportAttemptKeyForTask((uint64_t)v17);
        id v20 = (void *)v19;
        if (v18) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_31;
          }
          uint64_t v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, type))
          {
            *(_DWORD *)buf = 67109120;
            int v47 = (int)v17;
            uint64_t v23 = v22;
            os_log_type_t v24 = type;
            id v25 = "[MADProgressManager] Unable to report progress for unknown task %d";
            uint32_t v26 = 8;
            goto LABEL_14;
          }
LABEL_15:

          goto LABEL_31;
        }
        if (v17 == (id)1 && ![v9 valueForKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"])
        {
          os_log_type_t v50 = v38;
          CFStringRef v28 = +[NSArray arrayWithObjects:&v50 count:1];
          uint64_t v29 = +[VCPPhotosMaintenanceProcessingTask taskWithPhotoLibraries:v28 andProgressHandler:0 andCompletionHandler:0 andCancelBlock:v37];

          if ([v29 performForceClusterIfNeededWithPhotoLibrary:v38]
            && (int)MediaAnalysisLogLevel() >= 3)
          {
            int v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, v33))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, v33, "[MADProgressManager] Failed to cluster as needed", buf, 2u);
            }
          }
        }
        if ([v9 keyExistsInKeyValueStore:v20]
          && (uint64_t v31 = v40 - (void)[v9 valueForKey:v20], v31 <= 14399))
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, v34))
            {
              *(_DWORD *)buf = 67109376;
              int v47 = (int)v17;
              __int16 v48 = 2048;
              uint64_t v49 = v31;
              uint64_t v23 = v22;
              os_log_type_t v24 = v34;
              id v25 = "[MADProgressManager] Skipping progress report request for task %d, last report was %lld seconds ago";
              uint32_t v26 = 18;
LABEL_14:
              _os_log_impl((void *)&_mh_execute_header, v23, v24, v25, buf, v26);
            }
            goto LABEL_15;
          }
        }
        else
        {
          [v9 setValue:v40 forKey:v20];
          [v9 commit];
          if ([v9 valueForKey:v18]) {
            [a1 updateProgressForTask:v17 photoLibrary:v38 reuseCachedValue:0 cancelOrExtendTimeoutBlock:v37];
          }
        }
LABEL_31:
      }
      id v13 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v13);
  }
}

+ (void)requestProgressUpdateForTasks:(id)a3
{
  id v16 = a3;
  uint64_t v3 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  BOOL v4 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v3];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v16;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    os_log_type_t v8 = VCPLogToOSLogType[4];
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v10 unsignedIntegerValue];
        int v13 = (int)v12;
        unint64_t v14 = VCPRequestBGSTProgressReportKeyForTask((uint64_t)v12);
        if (v14)
        {
          [v4 setValue:1 forKey:v14];
        }
        else if ((int)MediaAnalysisLogLevel() >= 4)
        {
          os_signpost_id_t v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, v8))
          {
            *(_DWORD *)buf = 67109120;
            int v22 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, v8, "[MADProgressManager] Unable to request progress report for unknown task %d", buf, 8u);
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  [v4 commit];
}

+ (void)resetProcessingCheckpointForTask:(unint64_t)a3
{
  CFStringRef v28 = MADTaskIdentifierForBackgroundTask(a3);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  BOOL v4 = [a1 _featureCodeWithTaskID:a3];
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    os_log_type_t v7 = VCPLogToOSLogType[5];
    os_log_type_t v26 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[7];
    id v25 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v9 unsignedIntegerValue])
        {
          id v11 = [v9 unsignedIntegerValue];
          id v30 = 0;
          unsigned __int8 v12 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:3 forFeature:v11 error:&v30];
          int v13 = v30;
          if (v12)
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              unint64_t v14 = VCPLogInstance();
              if (os_log_type_enabled(v14, v7))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)os_log_type_t v36 = v9;
                *(_WORD *)&v36[8] = 2112;
                *(void *)&v36[10] = v28;
                _os_log_impl((void *)&_mh_execute_header, v14, v7, "[MADProgressManager] Reported BGST Checkpoint reset for feature code %@ - %@", buf, 0x16u);
              }
LABEL_18:
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            unint64_t v14 = VCPLogInstance();
            if (os_log_type_enabled(v14, v26))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)os_log_type_t v36 = v9;
              *(_WORD *)&v36[8] = 2112;
              *(void *)&v36[10] = v28;
              *(_WORD *)&v36[18] = 2112;
              *(void *)&v36[20] = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, v26, "[MADProgressManager] Failed to report BGST Checkpoint reset for feature code %@ - %@ - %@", buf, 0x20u);
            }
            BOOL v4 = v25;
            goto LABEL_18;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_20;
          }
          int v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, type))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)os_log_type_t v36 = v28;
            _os_log_impl((void *)&_mh_execute_header, v13, type, "[MADProgressManager] Skip reporting BGST Checkpoint reset for %@: no feature code", buf, 0xCu);
          }
        }

LABEL_20:
      }
      id v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v5);
  }

  if (a3 == 3)
  {
    id v29 = 0;
    unsigned __int8 v15 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:3 forFeature:802 error:&v29];
    id v16 = v29;
    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        long long v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)os_log_type_t v36 = 802;
          *(_WORD *)&v36[4] = 2112;
          *(void *)&v36[6] = v28;
          long long v19 = "[MADProgressManager] Reported BGST Checkpoint reset for feature code %d - %@";
          long long v20 = v17;
          os_log_type_t v21 = v18;
          uint32_t v22 = 18;
LABEL_30:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v17 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v23))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)os_log_type_t v36 = 802;
        *(_WORD *)&v36[4] = 2112;
        *(void *)&v36[6] = v28;
        *(_WORD *)&v36[14] = 2112;
        *(void *)&v36[16] = v16;
        long long v19 = "[MADProgressManager] Failed to report BGST Checkpoint reset for feature code %d - %@ - %@";
        long long v20 = v17;
        os_log_type_t v21 = v23;
        uint32_t v22 = 28;
        goto LABEL_30;
      }
LABEL_31:
    }
  }
}

- (void).cxx_destruct
{
}

@end