@interface VCPMADQuickFaceIDAssetBatch
+ (BOOL)_allowConcurrentFaceProcessing;
+ (id)batchWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5;
+ (unint64_t)_concurrentQueueCount;
- (VCPMADQuickFaceIDAssetBatch)initWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)_processAssetEntry:(id)a3;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation VCPMADQuickFaceIDAssetBatch

+ (BOOL)_allowConcurrentFaceProcessing
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100252500, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100252500))
  {
    byte_1002524F8 = DeviceHasANE();
    __cxa_guard_release(&qword_100252500);
  }
  return byte_1002524F8;
}

+ (unint64_t)_concurrentQueueCount
{
  v2 = &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100252510, memory_order_acquire) & 1) == 0)
  {
    int v4 = __cxa_guard_acquire(&qword_100252510);
    v2 = &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol;
    if (v4)
    {
      byte_100252508 = 1;
      __cxa_guard_release(&qword_100252510);
      v2 = &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol;
    }
  }
  if (LOBYTE(v2[17].cb)) {
    return 4;
  }
  else {
    return 0;
  }
}

- (VCPMADQuickFaceIDAssetBatch)initWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VCPMADQuickFaceIDAssetBatch;
  v12 = [(VCPMADQuickFaceIDAssetBatch *)&v28 init];
  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v13 = +[NSMutableArray array];
  assetEntries = v12->_assetEntries;
  v12->_assetEntries = (NSMutableArray *)v13;

  objc_storeStrong((id *)&v12->_analysisDatabase, a3);
  objc_storeStrong((id *)&v12->_quickFaceIDManager, a4);
  id v15 = objc_retainBlock(v11);
  id cancelBlock = v12->_cancelBlock;
  v12->_id cancelBlock = v15;

  v17 = +[VCPMADProcessingJobManager sharedManager];
  v12->_id processQueuesAllowed = 1;
  if ([(id)objc_opt_class() _allowConcurrentFaceProcessing])
  {
    id processQueuesAllowed = [(id)objc_opt_class() _concurrentQueueCount];
    v12->_id processQueuesAllowed = (unint64_t)processQueuesAllowed;
  }
  else
  {
    id processQueuesAllowed = (id)v12->_processQueuesAllowed;
  }
  [v17 registerQueueGroupWithName:@"QuickFaceID" andNumberOfQueues:processQueuesAllowed];
  dispatch_group_t v19 = dispatch_group_create();
  processGroup = v12->_processGroup;
  v12->_processGroup = (OS_dispatch_group *)v19;

  uint64_t v21 = [v17 getJobScheduler];
  id scheduler = v12->_scheduler;
  v12->_id scheduler = (id)v21;

  if (v12->_scheduler)
  {

LABEL_7:
    v23 = v12;
    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v24 = VCPLogInstance();
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to get job scheduler to dispatch analysis jobs onto global queues across batches", v27, 2u);
    }
  }
  v23 = 0;
LABEL_13:

  return v23;
}

+ (id)batchWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v8 quickFaceIDManager:v9 cancelBlock:v10];

  return v11;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
  id v8 = a3;
  id v23 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = self->_assetEntries;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) asset];
        v14 = [v13 localIdentifier];
        id v15 = [v8 localIdentifier];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v18 = VCPLogInstance();
            os_log_type_t v19 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v18, v19))
            {
              v20 = [v8 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v29 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, v19, "[QuickFaceID][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_14;
        }
      }
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  assetEntries = self->_assetEntries;
  id v9 = +[VCPMADQuickFaceIDAssetEntry entryWithAsset:v8 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v23];
  [(NSMutableArray *)assetEntries addObject:v9];
LABEL_14:
}

- (int)prepare
{
  int v4 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  v5 = VCPSignPostLog();
  v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADQuickFaceIDAssetBatch_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    oslog = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(oslog, v7))
    {
      unsigned int v8 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v9 = qos_class_self();
      v2 = VCPMAQoSDescription(v9);
      *(_DWORD *)buf = 67109378;
      unsigned int v35 = v8;
      __int16 v36 = 2112;
      v37 = v2;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "[QuickFaceID] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  osloga = self->_assetEntries;
  id v10 = [(NSMutableArray *)osloga countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    while (2)
    {
      v12 = 0;
      uint64_t v13 = v2;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(osloga);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        analysisDatabase = self->_analysisDatabase;
        unsigned int v16 = (char *)[v14 previousAttempts];
        v17 = [v14 asset];
        v18 = +[NSDate now];
        id v19 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v16 + 1 asset:v17 taskID:8 status:1 lastAttemptDate:v18];

        if (v19 == -108)
        {
          v2 = v19;
        }
        else
        {
          BOOL v20 = v19 == -36 || v19 == -23;
          v2 = v19;
          if (!v20) {
            v2 = v13;
          }
        }
        if (v19 == -108 || (v19 != -36 ? (BOOL v21 = v19 == -23) : (BOOL v21 = 1), v21))
        {
          p_super = &osloga->super.super;
          goto LABEL_29;
        }
        v12 = (char *)v12 + 1;
        uint64_t v13 = v2;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)osloga countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int result = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  int v24 = result;
  if (result != -108 && result != -36 && result != -23) {
    int result = (int)v2;
  }
  if (v24 != -108 && v24 != -36 && v24 != -23)
  {
    long long v25 = VCPSignPostLog();
    if (spid - 1 >= 0xFFFFFFFFFFFFFFFELL)
    {
      LODWORD(v2) = 0;
      p_super = v25;
    }
    else
    {
      p_super = v25;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, p_super, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADQuickFaceIDAssetBatch_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
      }
      LODWORD(v2) = 0;
    }
LABEL_29:

    return (int)v2;
  }
  return result;
}

- (void)_processAssetEntry:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = [v4 asset];
      unsigned int v8 = [v7 localIdentifier];
      *(_DWORD *)buf = 138412290;
      objc_super v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[QuickFaceID][%@] Processing asset", buf, 0xCu);
    }
  }
  qos_class_t v9 = +[VCPWatchdog sharedWatchdog];
  [v9 pet];

  id v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  v12 = VCPSignPostLog();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPMADQuickFaceIDAssetBatch_ProcessAsset", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  quickFaceIDManager = self->_quickFaceIDManager;
  id v15 = [v4 asset];
  id v25 = 0;
  id v26 = 0;
  id v16 = [(VCPPhotosQuickFaceIdentificationManager *)quickFaceIDManager processAsset:v15 onDemandDetection:1 detectedFaces:&v26 detectedPersons:&v25];
  id v17 = v26;
  id v18 = v25;
  [v4 setStatus:v16];

  id v19 = VCPSignPostLog();
  BOOL v20 = v19;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v11, "VCPMADQuickFaceIDAssetBatch_ProcessAsset", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ([v4 status])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        id v23 = [v4 asset];
        int v24 = [v23 localIdentifier];
        *(_DWORD *)buf = 138412290;
        objc_super v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[QuickFaceID][%@] Failed to process asset", buf, 0xCu);
      }
    }
  }
  else
  {
    [v4 setDetectedFaces:v17];
    [v4 setDetectedPersons:v18];
  }
}

- (int)process
{
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = VCPSignPostLog();
  os_log_type_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPMADQuickFaceIDAssetBatch_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      os_signpost_id_t v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      LODWORD(v42[0]) = v9;
      WORD2(v42[0]) = 2112;
      *(void *)((char *)v42 + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[QuickFaceID] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  v12 = +[VCPWatchdog sharedWatchdog];
  [v12 pet];

  uint64_t v13 = +[NSMutableArray array];
  unint64_t v14 = 0;
  os_log_type_t v15 = VCPLogToOSLogType[5];
  *(void *)&long long v16 = 138412290;
  long long v38 = v16;
  while (v14 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    id v18 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v14];
    id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (cancelBlock && cancelBlock[2]())
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        BOOL v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, v15))
        {
          BOOL v21 = [v18 asset];
          os_log_type_t v22 = [v21 localIdentifier];
          *(_DWORD *)buf = v38;
          v42[0] = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, v15, "[QuickFaceID][%@] Processing canceled; skipping asset",
            buf,
            0xCu);
        }
      }
      [v18 setStatus:4294967168];
    }
    else
    {
      id v23 = [v18 asset];
      unsigned int v24 = objc_msgSend(v23, "vcp_isPano");

      if (v24)
      {
        [v13 addObject:v18];
      }
      else
      {
        processGroup = self->_processGroup;
        id scheduler = (void (**)(id, const __CFString *, OS_dispatch_group *, void *))self->_scheduler;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100052F40;
        v39[3] = &unk_100219D70;
        v39[4] = self;
        id v40 = v18;
        scheduler[2](scheduler, @"QuickFaceID", processGroup, v39);
      }
    }

    ++v14;
  }
  dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v27 = 0;
  while (v27 < (unint64_t)[v13 count])
  {
    long long v29 = [v13 objectAtIndexedSubscript:v27];
    long long v30 = (unsigned int (**)(void))self->_cancelBlock;
    if (v30 && v30[2]())
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        long long v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, v15))
        {
          long long v32 = [v29 asset];
          v33 = [v32 localIdentifier];
          *(_DWORD *)buf = v38;
          v42[0] = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, v15, "[QuickFaceID][%@] Processing canceled; skipping asset",
            buf,
            0xCu);
        }
      }
      [v29 setStatus:4294967168];
      char v34 = 0;
    }
    else
    {
      [(VCPMADQuickFaceIDAssetBatch *)self _processAssetEntry:v29];
      char v34 = 1;
    }

    ++v27;
    if ((v34 & 1) == 0) {
      goto LABEL_35;
    }
  }
  unsigned int v35 = (uint64_t (**)(void))self->_cancelBlock;
  if (v35 && (v35[2]() & 1) != 0)
  {
LABEL_35:
    int v36 = -128;
    goto LABEL_37;
  }
  int v36 = 0;
LABEL_37:

  return v36;
}

- (int)publish
{
  v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  os_signpost_id_t v4 = VCPSignPostLog();
  v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADQuickFaceIDAssetBatch_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  os_log_type_t v6 = buf;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    oslog = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    os_log_type_t v8 = oslog;
    if (os_log_type_enabled(oslog, v7))
    {
      id v9 = [(NSMutableArray *)self->_assetEntries count];
      *(_DWORD *)buf = 134217984;
      id v65 = v9;
      os_log_type_t v8 = oslog;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "[QuickFaceID] Persisting %lu assets", buf, 0xCu);
    }
  }
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    os_log_t oslogb = [(NSMutableArray *)self->_assetEntries firstObject];
    qos_class_t v10 = [oslogb asset];
    uint64_t v11 = [v10 photoLibrary];

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100053770;
    v60[3] = &unk_100219D70;
    os_log_t osloga = (os_log_t)(id)v11;
    os_log_t v61 = osloga;
    v62 = self;
    v48 = objc_retainBlock(v60);
    id cancelBlock = self->_cancelBlock;
    id v59 = 0;
    LOBYTE(v11) = [osloga mad_performChangesAndWait:v48 cancelBlock:cancelBlock extendTimeoutBlock:&stru_10021B3D8 error:&v59];
    id v50 = v59;
    if (v11)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      obj = self->_assetEntries;
      id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v13)
      {
        uint64_t v51 = *(void *)v56;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v56 != v51) {
              objc_enumerationMutation(obj);
            }
            os_log_type_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            if ([v15 status])
            {
              if ([v15 status] == -128)
              {
                id v16 = [v15 previousAttempts];
                analysisDatabase = self->_analysisDatabase;
                if (v16)
                {
                  id v18 = [v15 previousAttempts];
                  id v19 = [v15 asset];
                  id v20 = [v15 previousStatus];
                  BOOL v21 = [v15 lastAttemptDate];
                  id v22 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v18 asset:v19 taskID:8 status:v20 lastAttemptDate:v21];

                  if (v22 == -108 || v22 == -36)
                  {
                    id v23 = (uint8_t *)v22;
                  }
                  else
                  {
                    id v23 = (uint8_t *)v22;
                    if (v22 != -23) {
                      id v23 = v6;
                    }
                  }
                  if (v22 == -108) {
                    goto LABEL_72;
                  }
                  if (v22 == -36) {
                    goto LABEL_72;
                  }
                  os_log_type_t v6 = v23;
                  if (v22 == -23) {
                    goto LABEL_72;
                  }
                }
                else
                {
                  v37 = [v15 asset];
                  long long v38 = [v37 localIdentifier];
                  id v39 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v38 andTaskID:8];

                  if (v39 == -108 || v39 == -36)
                  {
                    id v23 = (uint8_t *)v39;
                  }
                  else
                  {
                    id v23 = (uint8_t *)v39;
                    if (v39 != -23) {
                      id v23 = v6;
                    }
                  }
                  if (v39 == -108) {
                    goto LABEL_72;
                  }
                  if (v39 == -36) {
                    goto LABEL_72;
                  }
                  os_log_type_t v6 = v23;
                  if (v39 == -23) {
                    goto LABEL_72;
                  }
                }
              }
              else
              {
                if ([v15 status] == -23802)
                {
                  uint64_t v29 = 2;
                }
                else if ([v15 status] == -23808)
                {
                  uint64_t v29 = 7;
                }
                else
                {
                  uint64_t v29 = 3;
                }
                long long v30 = [v15 asset];
                long long v31 = [v15 currentAttemptDate];
                long long v32 = objc_msgSend(v30, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v29, v31, (char *)objc_msgSend(v15, "previousAttempts") + 1);

                v33 = self->_analysisDatabase;
                char v34 = [v15 asset];
                unsigned int v35 = [v34 localIdentifier];
                id v36 = (id)[(VCPDatabaseWriter *)v33 updateProcessingStatus:v29 andNextAttemptDate:v32 forLocalIdentifier:v35 andTaskID:8];

                if (v36 == -108 || v36 == -36)
                {
                  id v23 = (uint8_t *)v36;
                }
                else
                {
                  id v23 = (uint8_t *)v36;
                  if (v36 != -23) {
                    id v23 = v6;
                  }
                }

                if (v36 == -108) {
                  goto LABEL_72;
                }
                if (v36 == -36) {
                  goto LABEL_72;
                }
                os_log_type_t v6 = v23;
                if (v36 == -23) {
                  goto LABEL_72;
                }
              }
            }
            else
            {
              unsigned int v24 = self->_analysisDatabase;
              id v25 = [v15 asset];
              id v26 = [v25 localIdentifier];
              id v27 = (id)[(VCPDatabaseWriter *)v24 removeProcessingStatusForLocalIdentifier:v26 andTaskID:8];

              if (v27 == -108)
              {
                id v23 = (uint8_t *)v27;
              }
              else
              {
                BOOL v28 = v27 == -36 || v27 == -23;
                id v23 = (uint8_t *)v27;
                if (!v28) {
                  id v23 = v6;
                }
              }
              if (v27 == -108 || (v27 != -36 ? (v40 = v27 == -23) : (v40 = 1), os_log_type_t v6 = v23, v40))
              {
LABEL_72:

                goto LABEL_73;
              }
            }
          }
          id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      unsigned int v44 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      if (v44 == -108 || v44 == -36)
      {
        LODWORD(v23) = v44;
      }
      else
      {
        LODWORD(v23) = v44;
        if (v44 != -23) {
          LODWORD(v23) = v6;
        }
      }
      if (v44 != -108 && v44 != -36 && v44 != -23)
      {
        v45 = VCPSignPostLog();
        v46 = v45;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADQuickFaceIDAssetBatch_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        LODWORD(v23) = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v41 = VCPLogInstance();
        os_log_type_t v42 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v41, v42))
        {
          *(_DWORD *)buf = 138412290;
          id v65 = v50;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "[QuickFaceID] Failed to persist person identification results to Photos (%@)", buf, 0xCu);
        }
      }
      LODWORD(v23) = [v50 code];
    }
LABEL_73:
  }
  else
  {
    LODWORD(v23) = 0;
  }
  return (int)v23;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_waitForProcessToComplete, 0);
  objc_storeStrong(&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_processGroup, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_quickFaceIDManager, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end