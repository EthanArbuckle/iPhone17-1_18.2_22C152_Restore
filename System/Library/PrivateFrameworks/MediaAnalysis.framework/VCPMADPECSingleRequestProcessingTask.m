@interface VCPMADPECSingleRequestProcessingTask
+ (double)currentScheduleDelay;
+ (id)taskWithPhotoLibraries:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6;
+ (void)reschedule;
- (BOOL)_isAssetEligible:(id)a3 withAnalysisDatabase:(id)a4 previousStatus:(unint64_t *)a5 previousAttempts:(int *)a6 lastAttemptDate:(id *)a7 allowDownload:(BOOL)a8;
- (BOOL)autoCancellable;
- (VCPMADPECSingleRequestProcessingTask)initWithPhotoLibraries:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6;
- (float)resourceRequirement;
- (id)resultFromVISearchResults:(id)a3 entityStore:(id)a4;
- (int)_checkHardFailuresForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4;
- (int)_publishEntries:(id)a3 photoLibrary:(id)a4;
- (int)entriesByLibraryPointerAddEntry:(id)a3;
- (int)prepareEntry:(id)a3 withDatabase:(id)a4;
- (int)processAssetEntry:(id)a3 entityStore:(id)a4 hasFiredServerRequest:(BOOL *)a5;
- (int)publishEntries;
- (int)run;
- (unint64_t)entryCount;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPMADPECSingleRequestProcessingTask

- (VCPMADPECSingleRequestProcessingTask)initWithPhotoLibraries:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6
{
  id v11 = a3;
  v12 = (Block_layout *)a4;
  id v13 = a5;
  v14 = (Block_layout *)a6;
  v38.receiver = self;
  v38.super_class = (Class)VCPMADPECSingleRequestProcessingTask;
  v15 = [(VCPMADPECSingleRequestProcessingTask *)&v38 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibraries, a3);
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = &stru_10021D378;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v14) {
      v20 = v14;
    }
    else {
      v20 = &stru_10021D398;
    }
    v21 = objc_retainBlock(v20);
    id cancelBlock = v16->_cancelBlock;
    v16->_id cancelBlock = v21;

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    processSemaphore = v16->_processSemaphore;
    v16->_processSemaphore = (OS_dispatch_semaphore *)v23;

    v25 = (VIService *)objc_alloc_init((Class)VIService);
    service = v16->_service;
    v16->_service = v25;

    uint64_t v27 = +[NSMutableDictionary dictionary];
    domainProcessedCounts = v16->_domainProcessedCounts;
    v16->_domainProcessedCounts = (NSMutableDictionary *)v27;

    uint64_t v29 = +[NSMutableDictionary dictionary];
    domainSuccessesCounts = v16->_domainSuccessesCounts;
    v16->_domainSuccessesCounts = (NSMutableDictionary *)v29;

    uint64_t v31 = +[NSMutableDictionary dictionary];
    entriesByLibraryPointer = v16->_entriesByLibraryPointer;
    v16->_entriesByLibraryPointer = (NSMutableDictionary *)v31;

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000D7700;
    v36[3] = &unk_10021D3C0;
    id v37 = v13;
    v33 = objc_retainBlock(v36);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v33;
  }
  return v16;
}

+ (id)taskWithPhotoLibraries:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v9 progressHandler:v10 completionHandler:v11 cancelBlock:v12];

  return v13;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPMADPECSingleRequestProcessingTask;
  [(VCPMADPECSingleRequestProcessingTask *)&v4 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

+ (double)currentScheduleDelay
{
  uint32_t v2 = arc4random_uniform(0x8Cu);
  LOBYTE(v13) = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enhancedVisualSearchEnabled", @"com.apple.mobileslideshow", (Boolean *)&v13);
  if ((_BYTE)v13) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return 86400.0;
  }
  v5 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v5];

  id v7 = [v6 valueForKey:@"PECAnalysisIsInProgress"];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v8, v9))
    {
      CFStringRef v10 = @"short";
      if (!v7) {
        CFStringRef v10 = @"long";
      }
      int v13 = 138412290;
      CFStringRef v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[PECSingleRequest] reschedule will be %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v7) {
    double v11 = (double)(v2 + 1);
  }
  else {
    double v11 = 86400.0;
  }

  return v11;
}

+ (void)reschedule
{
  uint32_t v2 = +[MADPhotosPECBackgroundSystemTask identifier];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unsigned __int8 v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[PECSingleRequest] Attempting reschedule for %@", buf, 0xCu);
    }
  }
  v5 = +[BGSystemTaskScheduler sharedScheduler];
  v6 = [v5 taskRequestForIdentifier:v2];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    v8 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:v2];
    [v8 setGroupName:@"com.apple.mediaanalysisd"];
    [v8 setGroupConcurrencyLimit:1];
    [v8 setRequiresInexpensiveNetworkConnectivity:1];
    [v8 setRequiresExternalPower:1];
    [v8 setRequiresUserInactivity:1];
    [v8 setPriority:1];
    [v8 setBacklogged:1];
    [v8 setRateLimitConfigurationName:_BGSTPECRateLimitConfigurationName];
    +[VCPMADPECSingleRequestProcessingTask currentScheduleDelay];
    -[NSObject setScheduleAfter:](v8, "setScheduleAfter:");
    [v8 setExpectedDuration:600.0];
    CFStringRef v10 = +[BGSystemTaskScheduler sharedScheduler];
    id v16 = 0;
    unsigned __int8 v11 = [v10 submitTaskRequest:v8 error:&v16];
    id v12 = v16;

    if (v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v2;
          v15 = "Successfully submitted task %@";
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v13, v14, v15, buf, 0xCu);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      int v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        v15 = "Failed to submit task with error: %@";
        goto LABEL_16;
      }
LABEL_17:
    }
LABEL_19:

    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Attempted reschedule while task already exists", buf, 2u);
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (int)_checkHardFailuresForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    BOOL v7 = VCPLogInstance();
    unint64_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, (os_log_type_t)VCPLogToOSLogType[5]))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v4, "[PECSingleRequest] Checking processing status from previous runs", buf, 2u);
    }
  }
  id v31 = 0;
  [v6 fetchLocalIdentifiers:&v31 withTaskID:16 andProcessingStatus:1];
  id v30 = v31;
  v8 = (char *)[v30 count];
  if (v8)
  {
    uint64_t v27 = +[PHAsset vcp_fetchOptionsForLibrary:v29 forTaskID:16];
    os_log_type_t v9 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v30);
    unint64_t v10 = 0;
    os_log_type_t type = VCPLogToOSLogType[6];
    *(void *)&long long v11 = 138412290;
    long long v26 = v11;
    while (v10 < (unint64_t)objc_msgSend(v9, "count", v26))
    {
      int v13 = [v9 objectAtIndexedSubscript:v10];
      if (objc_msgSend(v13, "vcp_needsPECProcessing"))
      {
        char v14 = 1;
        unint64_t v15 = v4;
      }
      else
      {
        id v16 = [v13 localIdentifier];
        id v17 = [v6 removeProcessingStatusForLocalIdentifier:v16 andTaskID:16];

        if (v17 == -108 || v17 == -36)
        {
          unint64_t v15 = (unint64_t)v17;
        }
        else
        {
          unint64_t v15 = (unint64_t)v17;
          if (v17 != -23) {
            unint64_t v15 = v4;
          }
        }
        char v14 = 0;
        if (v17 != -108 && v17 != -36 && v17 != -23)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v18 = VCPLogInstance();
            if (os_log_type_enabled(v18, type))
            {
              v19 = [v13 localIdentifier];
              *(_DWORD *)buf = v26;
              v33 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, type, "[PECSingleRequest][%@] Asset is processed; clearing failure status",
                buf,
                0xCu);
            }
          }
          --v8;
          char v14 = 1;
        }
      }

      ++v10;
      unint64_t v4 = v15;
      if ((v14 & 1) == 0) {
        goto LABEL_37;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, type, "[PECSingleRequest] %lu assets processing status changed to Hard Failure", buf, 0xCu);
      }
    }
    unsigned int v21 = [v6 hardFailAllRunningProcessingStatusForTaskID:16];
    if (v21 == -108 || v21 == -36)
    {
      LODWORD(v15) = v21;
    }
    else
    {
      LODWORD(v15) = v21;
      if (v21 != -23) {
        LODWORD(v15) = v4;
      }
    }
    if (v21 == -108
      || v21 == -36
      || v21 == -23
      || (unsigned int v22 = [v6 commit], LODWORD(v15) = v22, v22 == -108)
      || v22 == -36
      || v22 == -23)
    {
LABEL_37:

      goto LABEL_46;
    }
  }
  if ((int)MediaAnalysisLogLevel() < 7)
  {
    LODWORD(v15) = 0;
  }
  else
  {
    dispatch_semaphore_t v23 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[7];
    uint64_t v27 = v23;
    if (os_log_type_enabled(v23, v24))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[PECSingleRequest] Processing status is up-to-date", buf, 2u);
    }
    LODWORD(v15) = 0;
LABEL_46:
  }
  return v15;
}

- (BOOL)_isAssetEligible:(id)a3 withAnalysisDatabase:(id)a4 previousStatus:(unint64_t *)a5 previousAttempts:(int *)a6 lastAttemptDate:(id *)a7 allowDownload:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v31 = 0;
  unint64_t v15 = [v13 localIdentifier];
  unsigned int v16 = [v14 queryProcessingStatus:a5 attempts:a6 lastAttemptDate:a7 andNextAttemptDate:&v31 forLocalIdentifier:v15 andTaskID:16];
  id v17 = v31;

  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        v20 = [v13 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v33 = v20;
        __int16 v34 = 1024;
        LODWORD(v35) = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[PECSingleRequest][%@] Failed to query processing status due to DB error %d", buf, 0x12u);
      }
LABEL_5:
    }
  }
  else
  {
    if (!*a6
      || (+[NSDate date],
          unsigned int v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = [v17 compare:v22] == (id)1,
          v22,
          !v23)
      || v8 && *a6 == 1 && *a5 == 2)
    {
      BOOL v21 = 1;
      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v18 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v25))
      {
        long long v26 = [v13 localIdentifier];
        VCPProcessingStatusDescription(*a5);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        int v28 = *a6;
        id v29 = +[VCPLogManager dateFormatter];
        id v30 = [v29 stringFromDate:v17];
        *(_DWORD *)buf = 138413058;
        v33 = v26;
        __int16 v34 = 2112;
        id v35 = v27;
        __int16 v36 = 1024;
        int v37 = v28;
        __int16 v38 = 2112;
        v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v18, v25, "[PECSingleRequest][%@] Asset skipped (%@|%d); revisit date: %@",
          buf,
          0x26u);
      }
      goto LABEL_5;
    }
  }
  BOOL v21 = 0;
LABEL_13:

  return v21;
}

- (id)resultFromVISearchResults:(id)a3 entityStore:(id)a4
{
  id v5 = a3;
  id v42 = a4;
  id v40 = objc_alloc_init((Class)NSMutableDictionary);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  id v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16, v5);
  if (v35)
  {
    uint64_t v34 = *(void *)v46;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v43 = VCPLogToOSLogType[3];
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        v39 = [*(id *)(*((void *)&v45 + 1) + 8 * i) regionOfInterestResults];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v6 = VCPLogInstance();
          if (os_log_type_enabled(v6, type))
          {
            unsigned int v7 = [v39 count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v50 = v7;
            _os_log_impl((void *)&_mh_execute_header, v6, type, "[PECSingleRequest] %d ROIs", buf, 8u);
          }
        }
        unint64_t v41 = 0;
        while (2)
        {
          if (v41 < (unint64_t)[v39 count])
          {
            BOOL v8 = [v39 objectAtIndexedSubscript:v41];
            os_log_type_t v9 = [v8 resultItems];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              unint64_t v10 = VCPLogInstance();
              if (os_log_type_enabled(v10, type))
              {
                unsigned int v11 = [v9 count];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v50 = v11;
                *(_WORD *)&v50[4] = 1024;
                *(_DWORD *)&v50[6] = v41;
                _os_log_impl((void *)&_mh_execute_header, v10, type, "[PECSingleRequest] %d items in ROI-%d", buf, 0xEu);
              }
            }
            unint64_t v12 = 0;
LABEL_17:
            if (v12 >= (unint64_t)[v9 count])
            {

              ++v41;
              continue;
            }
            id v13 = [v9 objectAtIndexedSubscript:v12];
            id v14 = [v13 searchableKnowledgeObject];

            if (!v14)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                unsigned int v16 = VCPLogInstance();
                if (os_log_type_enabled(v16, v43))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v50 = v41;
                  *(_WORD *)&v50[4] = 1024;
                  *(_DWORD *)&v50[6] = v12;
                  id v18 = v16;
                  os_log_type_t v19 = v43;
                  v20 = "[PECSingleRequest] ROI-%d item-%d: Empty CSUSearchableKnowledgeObject";
                  uint32_t v21 = 14;
LABEL_26:
                  _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, v21);
                }
LABEL_35:
              }
LABEL_36:

              ++v12;
              goto LABEL_17;
            }
            id v15 = +[PHSceneClassification mad_typeFromCSUIdType:](PHSceneClassification, "mad_typeFromCSUIdType:", [v14 idType]);
            if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                unsigned int v16 = VCPLogInstance();
                if (os_log_type_enabled(v16, v43))
                {
                  unsigned int v17 = [v14 idType];
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v50 = v17;
                  id v18 = v16;
                  os_log_type_t v19 = v43;
                  v20 = "[PECSingleRequest] Unexpected CSUSearchableKnowledgeObjectIdType %d";
                  uint32_t v21 = 8;
                  goto LABEL_26;
                }
                goto LABEL_35;
              }
              goto LABEL_36;
            }
            id v44 = 0;
            [v42 storeEntity:v14 uniqueIdWriteback:0 error:&v44];
            unsigned int v16 = v44;
            if (v16)
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_35;
              }
              unsigned int v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, v43))
              {
                id v23 = [v14 qid];
                os_log_type_t v24 = [v14 localizedLabelDictionary];
                os_log_type_t v25 = [v24 allValues];
                *(_DWORD *)buf = 134218498;
                *(void *)v50 = v23;
                *(_WORD *)&v50[8] = 2112;
                v51 = v25;
                __int16 v52 = 2112;
                v53 = v16;
                _os_log_impl((void *)&_mh_execute_header, v22, v43, "[PECSingleRequest] Failed to store entity (%llu, %@) with error (%@)", buf, 0x20u);
              }
              goto LABEL_34;
            }
            id v26 = objc_alloc((Class)PHSceneClassification);
            id v27 = [v14 qid];
            [v14 confidenceValue];
            unsigned int v22 = objc_msgSend(v26, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v27, v15);
            if (v22)
            {
              int v28 = +[NSNumber numberWithInteger:v15];
              id v29 = [v40 objectForKeyedSubscript:v28];
              id v30 = +[NSMutableArray arrayWithArray:v29];

              [v30 addObject:v22];
              id v31 = +[NSNumber numberWithInteger:v15];
              [v40 setObject:v30 forKeyedSubscript:v31];

              goto LABEL_33;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              id v30 = VCPLogInstance();
              if (os_log_type_enabled(v30, v43))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v30, v43, "[PECSingleRequest] failed to create the sceneClassification object", buf, 2u);
              }
LABEL_33:
            }
LABEL_34:

            goto LABEL_35;
          }
          break;
        }
      }
      id v35 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v35);
  }

  return v40;
}

- (int)prepareEntry:(id)a3 withDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[NSDate now];
  BOOL v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  unint64_t v10 = VCPSignPostLog();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPMADServerSearch_Prepare", (const char *)&unk_1001F3BD3, (uint8_t *)&v27, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = [v5 asset];
      id v15 = [v14 localIdentifier];
      int v27 = 138412290;
      int v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[PECSingleRequest][%@] Preparing asset", (uint8_t *)&v27, 0xCu);
    }
  }
  unsigned int v16 = (char *)[v5 previousAttempts];
  unsigned int v17 = [v5 asset];
  id v18 = +[NSDate now];
  unsigned int v19 = [v6 setAttempts:v16 + 1 asset:v17 taskID:16 status:1 lastAttemptDate:v18];

  if (v19 == -108 || v19 == -36 || v19 == -23)
  {
    int v20 = v19;
  }
  else
  {
    unsigned int v22 = [v6 commit];
    if (v22 == -108 || v22 == -36)
    {
      int v20 = v22;
    }
    else
    {
      int v20 = v22;
      if (v22 != -23) {
        int v20 = v19;
      }
    }
    if (v22 != -108 && v22 != -36 && v22 != -23)
    {
      id v23 = VCPSignPostLog();
      os_log_type_t v24 = v23;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        LOWORD(v27) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v9, "VCPMADServerSearch_Prepare", (const char *)&unk_1001F3BD3, (uint8_t *)&v27, 2u);
      }

      os_log_type_t v25 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v7 timeIntervalSinceNow];
      [v25 accumulateDoubleValue:@"TotalPrepareTimeInSeconds" forField:@"com.apple.mediaanalysisd.PECAnalysisRunSession" andEvent:-v26];

      int v20 = 0;
    }
  }

  return v20;
}

- (int)entriesByLibraryPointerAddEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  id v6 = [v5 photoLibrary];
  unsigned int v7 = +[NSValue valueWithPointer:v6];

  BOOL v8 = [(NSMutableDictionary *)self->_entriesByLibraryPointer objectForKeyedSubscript:v7];
  if (!v8)
  {
    BOOL v8 = +[NSMutableArray array];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entriesByLibraryPointer, "setObject:forKeyedSubscript:");
  }
  [v8 addObject:v4];
  if ([(VCPMADPECSingleRequestProcessingTask *)self entryCount] < 0x64) {
    int v9 = 0;
  }
  else {
    int v9 = [(VCPMADPECSingleRequestProcessingTask *)self publishEntries];
  }

  return v9;
}

- (unint64_t)entryCount
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint32_t v2 = [(NSMutableDictionary *)self->_entriesByLibraryPointer allValues];
  unint64_t v3 = 0;
  id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 += (unint64_t)[*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) count];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (int)publishEntries
{
  if ([(VCPMADPECSingleRequestProcessingTask *)self entryCount])
  {
    id v30 = +[NSDate now];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v4 = VCPLogInstance();
      os_log_type_t v5 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v4, v5))
      {
        unsigned int v6 = [(VCPMADPECSingleRequestProcessingTask *)self entryCount];
        qos_class_t v7 = qos_class_self();
        uint32_t v2 = VCPMAQoSDescription(v7);
        *(_DWORD *)buf = 67109378;
        unsigned int v38 = v6;
        __int16 v39 = 2112;
        id v40 = v2;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "[PECSingleRequest] Persisting %d assets (QoS: %@)", buf, 0x12u);
      }
    }
    long long v8 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v8);

    long long v9 = VCPSignPostLog();
    long long v10 = v9;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServerSearch_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v11 = [(NSMutableDictionary *)self->_entriesByLibraryPointer allValues];
    id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v33;
      id obj = v11;
      while (2)
      {
        id v14 = 0;
        id v15 = v2;
        do
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          unsigned int v16 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v14);
          id v18 = [v16 firstObject];
          unsigned int v19 = [v18 asset];
          int v20 = [v19 photoLibrary];

          uint32_t v21 = (void *)[(VCPMADPECSingleRequestProcessingTask *)self _publishEntries:v16 photoLibrary:v20];
          int v22 = (int)v21;
          if (v21 == -108)
          {
            uint32_t v2 = v21;
          }
          else
          {
            BOOL v23 = v21 == -36 || v21 == -23;
            uint32_t v2 = v21;
            if (!v23) {
              uint32_t v2 = v15;
            }
          }

          if (v22 == -108 || v22 == -36 || v22 == -23)
          {
            double v26 = obj;
            goto LABEL_31;
          }
          id v14 = (char *)v14 + 1;
          id v15 = v2;
        }
        while (v12 != v14);
        long long v11 = obj;
        id v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [(NSMutableDictionary *)self->_entriesByLibraryPointer removeAllObjects];
    os_log_type_t v24 = VCPSignPostLog();
    os_log_type_t v25 = v24;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServerSearch_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    double v26 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v30 timeIntervalSinceNow];
    [v26 accumulateDoubleValue:@"TotalPublishTimeInSeconds" forField:@"com.apple.mediaanalysisd.PECAnalysisRunSession" andEvent:-v27];
    LODWORD(v2) = 0;
LABEL_31:
  }
  else
  {
    LODWORD(v2) = 0;
  }
  return (int)v2;
}

- (int)_publishEntries:(id)a3 photoLibrary:(id)a4
{
  id v48 = a3;
  id v50 = a4;
  qos_class_t v7 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v7, "addBreadcrumb:", @"[PECSingleRequest] Persisting %d assets to Photos", objc_msgSend(v48, "count"));

  long long v8 = +[VCPWatchdog sharedWatchdog];
  [v8 pet];

  long long v9 = +[MADStateHandler sharedStateHandler];
  [v9 enterKnownTimeoutRisk:1];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000D9FCC;
  v61[3] = &unk_100219FC8;
  id v49 = v48;
  id v62 = v49;
  long long v47 = objc_retainBlock(v61);
  id cancelBlock = self->_cancelBlock;
  id v60 = 0;
  LOBYTE(self) = objc_msgSend(v50, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v47, cancelBlock, &stru_10021D3E0, &v60);
  id v51 = v60;
  long long v11 = +[MADStateHandler sharedStateHandler];
  [v11 exitKnownTimeoutRisk];

  id v12 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v12, "addBreadcrumb:", @"[PECSingleRequest] Finished persisting %d assets to Photos", objc_msgSend(v49, "count"));

  if (self)
  {
    v53 = +[VCPMADCoreAnalyticsManager sharedManager];
    v55 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v50];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v49;
    id v13 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v13)
    {
      uint64_t v54 = *(void *)v57;
LABEL_4:
      id v14 = 0;
      id v15 = v4;
      while (1)
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v14);
        if ([v16 status])
        {
          if ([v16 status] != -128)
          {
            unsigned int v31 = [v16 status];
            if (v31 == -23802) {
              uint64_t v32 = 2;
            }
            else {
              uint64_t v32 = 3;
            }
            long long v33 = [v16 asset];
            long long v34 = [v16 currentAttemptDate];
            long long v35 = objc_msgSend(v33, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v32, v34, (char *)objc_msgSend(v16, "previousAttempts") + 1);

            __int16 v36 = [v16 asset];
            int v37 = [v36 localIdentifier];
            id v22 = [v55 updateProcessingStatus:v32 andNextAttemptDate:v35 forLocalIdentifier:v37 andTaskID:16];

            if (v22 == -108 || v22 == -36)
            {
              id v4 = v22;
            }
            else
            {
              id v4 = v22;
              if (v22 != -23) {
                id v4 = v15;
              }
            }
            if (v22 != -108 && v22 != -36 && v22 != -23)
            {
              if (v31 == -23802) {
                CFStringRef v38 = @"NumberOfAssetsNoResource";
              }
              else {
                CFStringRef v38 = @"NumberOfAssetsSoftFailure";
              }
              [v53 accumulateInt64Value:1 forField:v38 andEvent:@"com.apple.mediaanalysisd.PECAnalysisRunSession"];
            }

LABEL_46:
            int v41 = 0;
            if (v22 == -108 || v22 == -36 || v22 == -23) {
              goto LABEL_50;
            }
            goto LABEL_49;
          }
          if ([v16 previousAttempts])
          {
            id v18 = [v16 previousAttempts];
            unsigned int v19 = [v16 asset];
            id v20 = [v16 previousStatus];
            uint32_t v21 = [v16 lastAttemptDate];
            id v22 = [v55 setAttempts:v18 asset:v19 taskID:16 status:v20 lastAttemptDate:v21];

            if (v22 == -108 || v22 == -36)
            {
              id v4 = v22;
            }
            else
            {
              id v4 = v22;
              if (v22 != -23) {
                id v4 = v15;
              }
            }
            goto LABEL_46;
          }
          __int16 v39 = [v16 asset];
          id v40 = [v39 localIdentifier];
          id v30 = [v55 removeProcessingStatusForLocalIdentifier:v40 andTaskID:16];
        }
        else
        {
          BOOL v23 = [v16 result];
          BOOL v24 = [v23 count] == 0;

          CFStringRef v25 = @"NumberOfAssetsLabeled";
          if (v24)
          {
            double v26 = [v16 result];
            BOOL v27 = v26 == 0;

            if (v27) {
              CFStringRef v25 = @"NumberOfAssetsIneligibleDomains";
            }
            else {
              CFStringRef v25 = @"NumberOfAssetsMissingCSUObject";
            }
          }
          [v53 accumulateInt64Value:1 forField:v25 andEvent:@"com.apple.mediaanalysisd.PECAnalysisRunSession"];
          [v53 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.PECAnalysisRunSession"];
          int v28 = [v16 asset];
          id v29 = [v28 localIdentifier];
          id v30 = [v55 removeProcessingStatusForLocalIdentifier:v29 andTaskID:16];
        }
        if (v30 == -108 || v30 == -36)
        {
          id v4 = v30;
        }
        else
        {
          id v4 = v30;
          if (v30 != -23) {
            id v4 = v15;
          }
        }
        int v41 = 0;
        if (v30 == -108 || v30 == -36 || v30 == -23) {
          goto LABEL_50;
        }
LABEL_49:
        int v41 = 1;
LABEL_50:
        if (!v41)
        {

          int v44 = (int)v4;
          goto LABEL_60;
        }
        id v14 = (char *)v14 + 1;
        id v15 = v4;
        if (v13 == v14)
        {
          id v13 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    unsigned int v46 = [v55 commit];
    if (v46 == -108 || v46 == -36)
    {
      int v44 = v46;
    }
    else
    {
      int v44 = v46;
      if (v46 != -23) {
        int v44 = (int)v4;
      }
    }
    if (v46 != -108 && v46 != -36 && v46 != -23) {
      int v44 = 0;
    }
LABEL_60:
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v42 = VCPLogInstance();
      os_log_type_t v43 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v51;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "[PECSingleRequest] Failed to persist results to Photos (%@)", buf, 0xCu);
      }
    }
    int v44 = [v51 code];
  }

  return v44;
}

- (int)processAssetEntry:(id)a3 entityStore:(id)a4 hasFiredServerRequest:(BOOL *)a5
{
  id v132 = a3;
  id v131 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    qos_class_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = [v132 asset];
      long long v10 = [v9 localIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[PECSingleRequest][%@] processing asset.", buf, 0xCu);
    }
  }
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_cancel);
  if ((v11 & 1) == 0)
  {
    id v12 = [v132 asset];
    id v13 = [v12 photoLibrary];
    v127 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v13];

    [(VCPMADPECSingleRequestProcessingTask *)self prepareEntry:v132 withDatabase:v127];
    id v14 = [v132 asset];
    v126 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v14];

    id v15 = objc_msgSend(v126, "vcp_thumbnailResource");
    v125 = v15;
    if (v15)
    {
      if ([v15 isLocallyAvailable])
      {
        unsigned int v16 = VCPSignPostLog();
        os_signpost_id_t v17 = os_signpost_id_generate(v16);

        id v18 = VCPSignPostLog();
        unsigned int v19 = v18;
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMADPECAssetBatch_Decode", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        id v20 = +[VCPImageManager sharedImageManager];
        uint32_t v21 = [v125 privateFileURL];
        id v158 = [v20 pixelBufferWithFormat:875704438 fromImageURL:v21 flushCache:0];

        id v22 = VCPSignPostLog();
        BOOL v23 = v22;
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v17, "VCPMADPECAssetBatch_Decode", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (!v158)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            __int16 v52 = VCPLogInstance();
            os_log_type_t v53 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v52, v53))
            {
              uint64_t v54 = [v132 asset];
              v55 = [v54 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v55;
              _os_log_impl((void *)&_mh_execute_header, v52, v53, "[PECSingleRequest][%@] Failed to decode thumbnail", buf, 0xCu);
            }
          }
          int v44 = -23802;
          [v132 setStatus:4294943494];
          goto LABEL_119;
        }
        BOOL v24 = [v132 asset];
        v122 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v24 clientBundleID:0 clientTeamID:0];

        if (!v122)
        {
          long long v56 = 0;
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            long long v57 = VCPLogInstance();
            os_log_type_t v58 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v57, v58))
            {
              long long v59 = [v132 asset];
              id v60 = [v59 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v60;
              _os_log_impl((void *)&_mh_execute_header, v57, v58, "[PECSingleRequest][%@] Failed to create imageAsset", buf, 0xCu);
            }
            long long v56 = 0;
          }
          int v44 = -18;
          [v132 setStatus:4294967278];
          goto LABEL_118;
        }
        v120 = objc_msgSend(v122, "vcp_annotationWithTypes:", 7);
        if (!v120)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v61 = VCPLogInstance();
            os_log_type_t v62 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v61, v62))
            {
              v63 = [v132 asset];
              v64 = [v63 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v64;
              _os_log_impl((void *)&_mh_execute_header, v61, v62, "[PECSingleRequest][%@] Failed to create annotation", buf, 0xCu);
            }
          }
          int v44 = -18;
          [v132 setStatus:4294967278];
          goto LABEL_117;
        }
        v121 = +[NSMutableDictionary dictionary];
        CFStringRef v25 = [v122 location];
        BOOL v26 = v25 == 0;

        if (!v26)
        {
          BOOL v27 = [v122 location];
          [v121 setObject:v27 forKeyedSubscript:VIQueryContextLocationKey];
        }
        if ([v122 isScreenshot]) {
          [v121 setObject:&off_10022F0E8 forKeyedSubscript:VIQueryContextImageTypeKey];
        }
        id v157 = 0;
        int v28 = +[VIQueryContext contextWithDictionary:v121 error:&v157];
        id v119 = v157;
        if (v119 || !v28)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v118 = v28;
            id v65 = VCPLogInstance();
            os_log_type_t v66 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v65, v66))
            {
              v67 = [v132 asset];
              v68 = [v67 localIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v68;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v119;
              _os_log_impl((void *)&_mh_execute_header, v65, v66, "[PECSingleRequest][%@] Failed to create query context (%@)", buf, 0x16u);
            }
            int v28 = v118;
          }
          int v44 = -18;
          [v132 setStatus:4294967278];
          goto LABEL_116;
        }
        v117 = v28;
        id v29 = +[VIVisualQuery queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:](VIVisualQuery, "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:", v158, 1, v120, v28, 0.0, 0.0, 1.0, 1.0);
        if (!v29)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v69 = VCPLogInstance();
            os_log_type_t v70 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v69, v70))
            {
              v71 = [v132 asset];
              v72 = [v71 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v72;
              _os_log_impl((void *)&_mh_execute_header, v69, v70, "[PECSingleRequest][%@] Failed to create the query", buf, 0xCu);
            }
            id v29 = 0;
          }
          int v44 = -18;
          [v132 setStatus:4294967278];
          goto LABEL_115;
        }
        v116 = v29;
        id v30 = [v132 asset];
        v114 = [v30 visualSearchProperties];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v168 = sub_1000DBC74;
        v169 = sub_1000DBC84;
        id v170 = 0;
        uint64_t v151 = 0;
        v152 = &v151;
        uint64_t v153 = 0x3032000000;
        v154 = sub_1000DBC74;
        v155 = sub_1000DBC84;
        id v156 = 0;
        unsigned int v31 = VCPSignPostLog();
        os_signpost_id_t v32 = os_signpost_id_generate(v31);

        long long v33 = VCPSignPostLog();
        long long v34 = v33;
        if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(v162) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "VIService_PECParsing", (const char *)&unk_1001F3BD3, (uint8_t *)&v162, 2u);
        }

        service = self->_service;
        __int16 v36 = [v114 visualSearchData];
        v144[0] = _NSConcreteStackBlock;
        v144[1] = 3221225472;
        v144[2] = sub_1000DBC8C;
        v144[3] = &unk_10021D408;
        os_signpost_id_t v149 = v32;
        uint64_t v150 = 0;
        v147 = buf;
        v148 = &v151;
        id v129 = v132;
        id v145 = v129;
        v146 = self;
        id v37 = [(VIService *)service getEncryptedSearchDomainsWithVisualQuery:v29 cachedResults:v36 completion:v144];

        dispatch_semaphore_wait((dispatch_semaphore_t)self->_processSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        if ([v129 status])
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            CFStringRef v38 = VCPLogInstance();
            os_log_type_t v39 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v38, v39))
            {
              id v40 = [v129 asset];
              int v41 = [v40 localIdentifier];
              LODWORD(v162) = 138412290;
              *(void *)((char *)&v162 + 4) = v41;
              _os_log_impl((void *)&_mh_execute_header, v38, v39, "[PECSingleRequest][%@] Failed with parseWithVisualQuery", (uint8_t *)&v162, 0xCu);
            }
          }
        }
        else
        {
          v73 = *(void **)(*(void *)&buf[8] + 40);
          if (!v73
            || ([v73 visualUnderstanding],
                v74 = objc_claimAutoreleasedReturnValue(),
                BOOL v75 = v74 == 0,
                v74,
                v75))
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v103 = VCPLogInstance();
              os_log_type_t v104 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v103, v104))
              {
                v105 = [v129 asset];
                v106 = [v105 localIdentifier];
                LODWORD(v162) = 138412290;
                *(void *)((char *)&v162 + 4) = v106;
                _os_log_impl((void *)&_mh_execute_header, v103, v104, "[PECSingleRequest][%@] Failed to obtain VI parsing result", (uint8_t *)&v162, 0xCu);
              }
            }
            int v44 = -18;
            objc_msgSend(v129, "setStatus:", 4294967278, v114);
            goto LABEL_114;
          }
          if (![(id)v152[5] count])
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v110 = VCPLogInstance();
              os_log_type_t v111 = VCPLogToOSLogType[7];
              if (os_log_type_enabled(v110, v111))
              {
                v112 = [v129 asset];
                v113 = [v112 localIdentifier];
                LODWORD(v162) = 138412290;
                *(void *)((char *)&v162 + 4) = v113;
                _os_log_impl((void *)&_mh_execute_header, v110, v111, "[PECSingleRequest][%@] getEncryptedSearchDomainsWithVisualQuery found no supported encrypted search domain", (uint8_t *)&v162, 0xCu);
              }
            }
            objc_msgSend(v129, "setVersion:", 5, v114);
            int v44 = 0;
            goto LABEL_114;
          }
        }
        v76 = v158;
        v77 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "visualUnderstanding", v114);
        v78 = [v77 imageRegions];
        v79 = [*(id *)(*(void *)&buf[8] + 40) visualUnderstanding];
        v80 = [v79 payload];
        v128 = +[VIParsedVisualQuery queryWithPixelBuffer:v76 orientation:1 imageRegions:v78 textBlockAnnotation:0 queryContext:v117 payload:v80];

        if (v128)
        {
          unsigned __int8 v81 = atomic_load((unsigned __int8 *)&self->_cancel);
          if (v81)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v107 = VCPLogInstance();
              os_log_type_t v108 = VCPLogToOSLogType[7];
              if (os_log_type_enabled(v107, v108))
              {
                LOWORD(v162) = 0;
                _os_log_impl((void *)&_mh_execute_header, v107, v108, "[PECSingleRequest] Processing has been canceled", (uint8_t *)&v162, 2u);
              }
            }
            int v44 = -128;
            [v129 setStatus:4294967168];
          }
          else
          {
            *(void *)&long long v162 = 0;
            *((void *)&v162 + 1) = &v162;
            uint64_t v163 = 0x3032000000;
            v164 = sub_1000DBC74;
            v165 = sub_1000DBC84;
            id v166 = +[NSMutableArray array];
            long long v142 = 0u;
            long long v143 = 0u;
            long long v140 = 0u;
            long long v141 = 0u;
            id obj = (id)v152[5];
            id v82 = [obj countByEnumeratingWithState:&v140 objects:v161 count:16];
            if (v82)
            {
              uint64_t v83 = *(void *)v141;
              uint64_t v84 = kVIDomainLandmark;
              uint64_t v85 = kVIDomainStorefront;
              os_log_type_t type = VCPLogToOSLogType[7];
              do
              {
                for (i = 0; i != v82; i = (char *)i + 1)
                {
                  if (*(void *)v141 != v83) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v87 = *(void *)(*((void *)&v140 + 1) + 8 * i);
                  if (v87 == v84 || v87 == v85)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      v89 = VCPLogInstance();
                      if (os_log_type_enabled(v89, type))
                      {
                        *(_DWORD *)v159 = 138412290;
                        uint64_t v160 = v87;
                        _os_log_impl((void *)&_mh_execute_header, v89, type, "[PECSingleRequest] Detected server request domain: %@", v159, 0xCu);
                      }
                    }
                    *a5 = 1;
                  }
                  v90 = [(NSMutableDictionary *)self->_domainProcessedCounts objectForKeyedSubscript:v87];
                  v91 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v90 integerValue] + 1);
                  [(NSMutableDictionary *)self->_domainProcessedCounts setObject:v91 forKeyedSubscript:v87];

                  v92 = VCPSignPostLog();
                  os_signpost_id_t v93 = os_signpost_id_generate(v92);

                  v94 = VCPSignPostLog();
                  v95 = v94;
                  if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
                  {
                    *(_WORD *)v159 = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_BEGIN, v93, "VIService_ServerSearchVISearch", (const char *)&unk_1001F3BD3, v159, 2u);
                  }

                  v96 = self->_service;
                  v133[0] = _NSConcreteStackBlock;
                  v133[1] = 3221225472;
                  v133[2] = sub_1000DBF78;
                  v133[3] = &unk_10021D430;
                  os_signpost_id_t v138 = v93;
                  uint64_t v139 = 0;
                  id v134 = v129;
                  uint64_t v135 = v87;
                  v136 = self;
                  v137 = &v162;
                  id v97 = [(VIService *)v96 encryptedSearchWithParsedVisualQuery:v128 domain:v87 completion:v133];
                  dispatch_semaphore_wait((dispatch_semaphore_t)self->_processSemaphore, 0xFFFFFFFFFFFFFFFFLL);
                }
                id v82 = [obj countByEnumeratingWithState:&v140 objects:v161 count:16];
              }
              while (v82);
            }

            if ([(id)v152[5] count])
            {
              v98 = [(VCPMADPECSingleRequestProcessingTask *)self resultFromVISearchResults:*(void *)(*((void *)&v162 + 1) + 40) entityStore:v131];
              [v129 setResult:v98];
            }
            int v44 = [v129 status];
            _Block_object_dispose(&v162, 8);
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v99 = VCPLogInstance();
            os_log_type_t v100 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v99, v100))
            {
              v101 = [v129 asset];
              v102 = [v101 localIdentifier];
              LODWORD(v162) = 138412290;
              *(void *)((char *)&v162 + 4) = v102;
              _os_log_impl((void *)&_mh_execute_header, v99, v100, "[PECSingleRequest][%@] Failed to create the parsed query", (uint8_t *)&v162, 0xCu);
            }
          }
          int v44 = -18;
          [v129 setStatus:4294967278];
        }

LABEL_114:
        _Block_object_dispose(&v151, 8);

        _Block_object_dispose(buf, 8);
        id v29 = v116;
LABEL_115:

        int v28 = v117;
LABEL_116:

LABEL_117:
        long long v56 = v122;
LABEL_118:

LABEL_119:
        sub_100004484((const void **)&v158);
        goto LABEL_120;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        long long v45 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v45, v49))
        {
          id v50 = [v132 asset];
          id v51 = [v50 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v51;
          _os_log_impl((void *)&_mh_execute_header, v45, v49, "[PECSingleRequest][%@] Thumbnail resource not locally available", buf, 0xCu);
        }
LABEL_43:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      long long v45 = VCPLogInstance();
      os_log_type_t v46 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v45, v46))
      {
        long long v47 = [v132 asset];
        id v48 = [v47 localIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "[PECSingleRequest][%@] No thumbnail resource", buf, 0xCu);
      }
      goto LABEL_43;
    }
    int v44 = -23802;
    [v132 setStatus:4294943494];
LABEL_120:

    goto LABEL_121;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v42 = VCPLogInstance();
    os_log_type_t v43 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v42, v43))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "[PECSingleRequest] Processing has been canceled", buf, 2u);
    }
  }
  int v44 = -128;
  [v132 setStatus:4294967168];
LABEL_121:

  return v44;
}

- (int)run
{
  v91 = +[NSDate now];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint32_t v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "[PECSingleRequest] Running", buf, 2u);
    }
  }
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  char v119 = 0;
  buf[0] = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enhancedVisualSearchEnabled", @"com.apple.mobileslideshow", buf);
  if (buf[0] && !AppBooleanValue)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      os_log_type_t v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[PECSingleRequest] PEC settings toggle is off. Skipping processing", buf, 2u);
      }
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_164;
  }
  qos_class_t v7 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  os_signpost_id_t v93 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v7];

  if (![v93 valueForKey:@"PECAnalysisIsInProgress"])
  {
    [v93 setValue:1 forKey:@"PECAnalysisIsInProgress"];
    [v93 commit];
  }
  unint64_t v103 = 0;
  char v87 = 0;
  os_log_type_t v8 = VCPLogToOSLogType[7];
  os_log_type_t v92 = VCPLogToOSLogType[3];
  os_log_type_t v88 = VCPLogToOSLogType[6];
  os_log_type_t type = VCPLogToOSLogType[4];
  uint64_t v9 = VCPLogToOSLogType[5];
  os_log_type_t v105 = v8;
  while (1)
  {
    if ([(NSArray *)self->_photoLibraries count] <= v103) {
      goto LABEL_130;
    }
    uint64_t v10 = v9;
    unsigned __int8 v11 = +[VCPWatchdog sharedWatchdog];
    [v11 pet];

    unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_cancel);
    if ((v12 & 1) == 0)
    {
      id v13 = [(NSArray *)self->_photoLibraries objectAtIndexedSubscript:v103];
      v95 = +[CSUSearchableKnowledgeObjectStore mad_sharedStoreForPhotoLibrary:v13];
      if (!v95)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v27 = 8;
LABEL_124:

LABEL_125:
          os_log_type_t v8 = v105;
          uint64_t v9 = v10;
          goto LABEL_126;
        }
        int v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, v92))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, v92, "[PECSingleRequest] Failed to get entity store", buf, 2u);
        }
        int v27 = 8;
LABEL_123:

        goto LABEL_124;
      }
      if ([(VCPMADPECSingleRequestProcessingTask *)self _checkHardFailuresForPhotoLibrary:v13 withAnalysisDatabase:v93]&& (int)MediaAnalysisLogLevel() >= 4)
      {
        id v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, type))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, type, "[PECSingleRequest] Failed to check hard failures from previous run", buf, 2u);
        }
      }
      v98 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v13];
      v94 = +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:v13];
      +[PHAsset mad_sceneConfidenceThresholdForTask:16];
      int v16 = v15;
      os_signpost_id_t v17 = VCPSignPostLog();
      os_signpost_id_t v18 = os_signpost_id_generate(v17);

      unsigned int v19 = VCPSignPostLog();
      id v20 = v19;
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VCPMADPECSingleAssetTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v118 = 0;
      LODWORD(v21) = v16;
      id v22 = [v13 fetchUnprocessedAssetsForMediaProcessingTaskID:16 priority:0 algorithmVersion:v94 sceneConfidenceThreshold:&v118 error:v21];
      id obj = v118;
      BOOL v23 = VCPSignPostLog();
      BOOL v24 = v23;
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v18, "VCPMADPECSingleAssetTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (obj)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          CFStringRef v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, v92))
          {
            BOOL v26 = [v13 photoLibraryURL];
            *(_DWORD *)buf = 138412546;
            *(void *)v123 = v26;
            *(_WORD *)&v123[8] = 2112;
            *(void *)&v123[10] = obj;
            _os_log_impl((void *)&_mh_execute_header, v25, v92, "[PECSingleRequest] Failed to fetch assets from PL at url: %@. Error: %@", buf, 0x16u);
          }
          int v27 = 8;
          goto LABEL_121;
        }
        int v27 = 8;
LABEL_122:

        int v28 = v98;
        goto LABEL_123;
      }
      if ((unint64_t)[v22 count] <= 0x3E7)
      {
        if ([v22 count])
        {
          id obj = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, v105))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, v105, "[PECSingleRequest] Zero non-failed assets. Fetching previously failed assets", buf, 2u);
            }
          }
          id v117 = 0;
          LODWORD(v29) = v16;
          uint64_t v31 = [v13 fetchAssetsForMediaProcessingTaskID:16 priority:0 algorithmVersion:v94 sceneConfidenceThreshold:&v117 error:v29];
          id obj = v117;

          id v22 = (void *)v31;
        }
      }
      else
      {
        id obj = 0;
        char v87 = 1;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        os_signpost_id_t v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, v88))
        {
          unsigned int v33 = [v22 count];
          long long v34 = [v13 photoLibraryURL];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v123 = v33;
          *(_WORD *)&v123[4] = 2112;
          *(void *)&v123[6] = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, v88, "[PECSingleRequest] Fetched %d assets from PL at url: %@", buf, 0x12u);
        }
      }
      CFStringRef v25 = +[NSMutableArray array];
      unint64_t v35 = 0;
      __int16 v36 = v25;
      while (1)
      {
        if (v35 >= (unint64_t)[v22 count])
        {
LABEL_118:
          if ([v25 count])
          {
            os_log_type_t v70 = +[VCPWatchdog sharedWatchdog];
            [v70 pet];

            CFStringRef v25 = v36;
            [v13 mad_markAsProcessedByTask:16 forAssets:v36];
            [v36 removeAllObjects];
          }
          [(VCPMADPECSingleRequestProcessingTask *)self publishEntries];
          MediaAnalysisDaemonReleaseSharedDataStores(v13);
          int v27 = 0;
LABEL_121:

          goto LABEL_122;
        }
        CFStringRef v38 = +[VCPWatchdog sharedWatchdog];
        [v38 pet];

        os_log_type_t v39 = [v22 objectAtIndexedSubscript:v35];
        [v39 fetchPropertySetsIfNeeded];
        unsigned __int8 v40 = atomic_load((unsigned __int8 *)&self->_cancel);
        if ((v40 & 1) == 0) {
          break;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          os_log_type_t v43 = VCPLogInstance();
          if (os_log_type_enabled(v43, v105))
          {
            int v44 = [v39 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v123 = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, v105, "[PECSingleRequest][%@] Asset processing canceled", buf, 0xCu);
          }
        }
        int v27 = 23;
LABEL_85:

        id v51 = v37;
        CFStringRef v25 = v36;
        if (v27 && v27 != 25)
        {
          if (v27 != 23) {
            goto LABEL_121;
          }
          goto LABEL_118;
        }
        ++v35;
      }
      if ((+[PHPhotoLibrary mad_isProcessingNeededOnAsset:v39 forTaskID:16] & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          long long v45 = VCPLogInstance();
          if (os_log_type_enabled(v45, (os_log_type_t)v10))
          {
            os_log_type_t v46 = [v39 localIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)v123 = v46;
            *(_WORD *)&v123[8] = 2048;
            *(void *)&v123[10] = 16;
            _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v10, "[PECSingleRequest][%@] Asset does not need processing in task %lu, ignoring... ", buf, 0x16u);
          }
        }
        [v36 addObject:v39];
        long long v47 = [v39 localIdentifier];
        [v98 removeProcessingStatusForLocalIdentifier:v47 andTaskID:16];

        [v98 commit];
        id v48 = [v36 count];
        if (v48 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed])
        {
          os_log_type_t v49 = +[VCPWatchdog sharedWatchdog];
          [v49 pet];

          [v13 mad_markAsProcessedByTask:16 forAssets:v36];
          [v36 removeAllObjects];
        }
        goto LABEL_84;
      }
      if (objc_msgSend(v39, "vcp_needsPECProcessing"))
      {
        if (!objc_msgSend(v39, "vcp_needsVisualSearchProcessing"))
        {
          uint64_t v116 = 0;
          int v115 = 0;
          id v114 = 0;
          unsigned __int8 v52 = [(VCPMADPECSingleRequestProcessingTask *)self _isAssetEligible:v39 withAnalysisDatabase:v98 previousStatus:&v116 previousAttempts:&v115 lastAttemptDate:&v114 allowDownload:0];
          id v53 = v114;
          if (v52)
          {
            uint64_t v54 = v53;
            +[VCPMADPECAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:](VCPMADPECAssetEntry, "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:", v39, v116, v115);
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            v55 = [v39 adjustmentVersion];
            BOOL v56 = v55 == 0;

            if (!v56)
            {
              v86 = [v39 visualSearchProperties];
              long long v57 = [v86 visualSearchData];
              BOOL v58 = v57 == 0;

              if (v58)
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v68 = VCPLogInstance();
                  if (os_log_type_enabled(v68, v105))
                  {
                    v69 = [v39 localIdentifier];
                    *(_DWORD *)buf = 138412290;
                    *(void *)v123 = v69;
                    _os_log_impl((void *)&_mh_execute_header, v68, v105, "[PECSingleRequest][%@] Asset visual search data is empty", buf, 0xCu);
                  }
                }
                [log setVersion:5];
                [(VCPMADPECSingleRequestProcessingTask *)self entriesByLibraryPointerAddEntry:log];
                int v27 = 25;
              }
              else
              {
                long long v59 = +[NSDate now];
                [(VCPMADPECSingleRequestProcessingTask *)self processAssetEntry:log entityStore:v95 hasFiredServerRequest:&v119];
                id v60 = +[VCPMADCoreAnalyticsManager sharedManager];
                [v59 timeIntervalSinceNow];
                [v60 accumulateDoubleValue:@"TotalProcessTimeInSeconds" forField:@"com.apple.mediaanalysisd.PECAnalysisRunSession" andEvent:-v61];

                [(VCPMADPECSingleRequestProcessingTask *)self entriesByLibraryPointerAddEntry:log];
                if (v119)
                {
                  if ((int)MediaAnalysisLogLevel() >= 6)
                  {
                    os_log_type_t v62 = VCPLogInstance();
                    if (os_log_type_enabled(v62, v88))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v62, v88, "[PECSingleRequest] Sent server request, finishing run", buf, 2u);
                    }
                  }
                  [(VCPMADPECSingleRequestProcessingTask *)self publishEntries];
                  v63 = +[VCPMADCoreAnalyticsManager sharedManager];
                  [v91 timeIntervalSinceNow];
                  [v63 accumulateDoubleValue:@"TotalAnalyzingTimeInSeconds" forField:@"com.apple.mediaanalysisd.PECAnalysisRunSession" andEvent:-v64];

                  MADBMSendPECProcessedCounts(self->_domainProcessedCounts, self->_domainSuccessesCounts);
                  (*((void (**)(void))self->_completionHandler + 2))();
                  int v27 = 1;
                }
                else
                {
                  int v27 = 0;
                }
              }
LABEL_115:

LABEL_116:
              goto LABEL_85;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              os_log_type_t v66 = VCPLogInstance();
              if (os_log_type_enabled(v66, type))
              {
                v67 = [v39 localIdentifier];
                *(_DWORD *)buf = 138412290;
                *(void *)v123 = v67;
                _os_log_impl((void *)&_mh_execute_header, v66, type, "[PECSingleRequest][%@] Asset has no adjustment version", buf, 0xCu);
              }
            }
            [log setStatus:4294943493];
            [(VCPMADPECSingleRequestProcessingTask *)self entriesByLibraryPointerAddEntry:log];
          }
          else
          {
            uint64_t v54 = v53;
            if ((int)MediaAnalysisLogLevel() < 7)
            {
              int v27 = 25;
              goto LABEL_116;
            }
            VCPLogInstance();
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, v105))
            {
              id v65 = [v39 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v123 = v65;
              _os_log_impl((void *)&_mh_execute_header, log, v105, "[PECSingleRequest][%@] Asset not eligible for processing; skipping",
                buf,
                0xCu);
            }
          }
          int v27 = 25;
          goto LABEL_115;
        }
        if ((int)MediaAnalysisLogLevel() < 7) {
          goto LABEL_84;
        }
        int v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, v105))
        {
          id v42 = [v39 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)v123 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, v105, "[PECSingleRequest][%@] Asset does not have up-to-date VS Processing. Skipping...", buf, 0xCu);
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 7)
        {
LABEL_84:
          int v27 = 25;
          goto LABEL_85;
        }
        int v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, v105))
        {
          id v50 = [v39 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)v123 = v50;
          _os_log_impl((void *)&_mh_execute_header, v41, v105, "[PECSingleRequest][%@] Asset does not need PEC Processing. Skipping...", buf, 0xCu);
        }
      }

      goto LABEL_84;
    }
    os_log_type_t v8 = v105;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, v105))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v105, "[PECSingleRequest] library processing canceled", buf, 2u);
      }
      int v27 = 6;
      goto LABEL_125;
    }
    uint64_t v9 = v10;
    int v27 = 6;
LABEL_126:
    if (v27)
    {
      if (v27 != 8) {
        break;
      }
    }
    ++v103;
  }
  if (v27 == 6)
  {
LABEL_130:
    unsigned __int8 v71 = atomic_load((unsigned __int8 *)&self->_cancel);
    if (v71)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v73 = VCPLogInstance();
        if (os_log_type_enabled(v73, v8))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v73, v8, "[PECSingleRequest] run canceled", buf, 2u);
        }
      }
      if ([(VCPMADPECSingleRequestProcessingTask *)self entryCount])
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id obja = [(NSMutableDictionary *)self->_entriesByLibraryPointer allValues];
        id contexta = [obja countByEnumeratingWithState:&v110 objects:v121 count:16];
        if (contexta)
        {
          uint64_t v99 = *(void *)v111;
          do
          {
            for (i = 0; i != contexta; i = (char *)i + 1)
            {
              if (*(void *)v111 != v99) {
                objc_enumerationMutation(obja);
              }
              v74 = *(void **)(*((void *)&v110 + 1) + 8 * i);
              long long v106 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              long long v109 = 0u;
              id v75 = v74;
              id v76 = [v75 countByEnumeratingWithState:&v106 objects:v120 count:16];
              if (v76)
              {
                uint64_t v77 = *(void *)v107;
                do
                {
                  for (j = 0; j != v76; j = (char *)j + 1)
                  {
                    if (*(void *)v107 != v77) {
                      objc_enumerationMutation(v75);
                    }
                    v79 = *(void **)(*((void *)&v106 + 1) + 8 * (void)j);
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      v80 = VCPLogInstance();
                      if (os_log_type_enabled(v80, v105))
                      {
                        unsigned __int8 v81 = [v79 asset];
                        id v82 = [v81 localIdentifier];
                        *(_DWORD *)buf = 138412290;
                        *(void *)v123 = v82;
                        _os_log_impl((void *)&_mh_execute_header, v80, v105, "[PECSingleRequest][%@] Marking asset as canceled", buf, 0xCu);
                      }
                    }
                    [v79 setStatus:4294967168];
                  }
                  id v76 = [v75 countByEnumeratingWithState:&v106 objects:v120 count:16];
                }
                while (v76);
              }
            }
            id contexta = [obja countByEnumeratingWithState:&v110 objects:v121 count:16];
          }
          while (contexta);
        }

        [(VCPMADPECSingleRequestProcessingTask *)self publishEntries];
      }
    }
    else if ((v87 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v72 = VCPLogInstance();
        if (os_log_type_enabled(v72, (os_log_type_t)v9))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v72, (os_log_type_t)v9, "[PECSingleRequest] Finished looping through assets, marking PEC analysis as complete", buf, 2u);
        }
      }
      [v93 removeKey:@"PECAnalysisIsInProgress"];
      [v93 commit];
    }
    uint64_t v83 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v91 timeIntervalSinceNow];
    [v83 accumulateDoubleValue:@"TotalAnalyzingTimeInSeconds" forField:@"com.apple.mediaanalysisd.PECAnalysisRunSession" andEvent:-v84];

    MADBMSendPECProcessedCounts(self->_domainProcessedCounts, self->_domainSuccessesCounts);
    (*((void (**)(void))self->_completionHandler + 2))();
  }

LABEL_164:
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_entriesByLibraryPointer, 0);
  objc_storeStrong((id *)&self->_domainSuccessesCounts, 0);
  objc_storeStrong((id *)&self->_domainProcessedCounts, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_processSemaphore, 0);
  objc_storeStrong((id *)&self->_photoLibraries, 0);
}

@end