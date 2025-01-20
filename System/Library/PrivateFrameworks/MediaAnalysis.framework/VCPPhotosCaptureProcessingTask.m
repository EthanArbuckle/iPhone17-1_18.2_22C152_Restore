@interface VCPPhotosCaptureProcessingTask
+ (BOOL)_allowProcessingCapturedFace;
+ (BOOL)_cameraFaceOnly;
+ (BOOL)_concurrentFaceProcessing;
+ (id)taskWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4;
- (BOOL)autoCancellable;
- (BOOL)isAssetEligible:(id)a3;
- (BOOL)run:(id *)a3;
- (VCPPhotosCaptureProcessingTask)init;
- (VCPPhotosCaptureProcessingTask)initWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4;
- (float)resourceRequirement;
- (int)faceProcessingForAssets:(id)a3 withManager:(id)a4 onDemandDetection:(BOOL)a5;
- (int)run;
- (void)_persistClassifiedFaces:(id)a3 withDetectedPersons:(id)a4;
- (void)_reportEventPostCapturesProcessing;
- (void)_resetFieldsPostCapturesProcessing;
- (void)cancel;
- (void)dealloc;
- (void)interrupt;
- (void)ocrProcessingForAssets:(id)a3;
- (void)resetInterruption;
@end

@implementation VCPPhotosCaptureProcessingTask

- (VCPPhotosCaptureProcessingTask)init
{
  return 0;
}

- (VCPPhotosCaptureProcessingTask)initWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VCPPhotosCaptureProcessingTask;
  v9 = [(VCPPhotosCaptureProcessingTask *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibraries, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    dispatch_group_t v13 = dispatch_group_create();
    persistGroup = v10->_persistGroup;
    v10->_persistGroup = (OS_dispatch_group *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaanalysisd.VCPPhotosCaptureProcessingTask.persist", v15);
    persistQueue = v10->_persistQueue;
    v10->_persistQueue = (OS_dispatch_queue *)v16;
  }
  return v10;
}

+ (id)taskWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v5 andCompletionHandler:v6];

  return v7;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v4 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v6 = +[NSString stringWithFormat:@"Photos capture processing task cancelled"];
    id v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v7];
    completionHandler[2](completionHandler, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPPhotosCaptureProcessingTask;
  [(VCPPhotosCaptureProcessingTask *)&v9 dealloc];
}

- (float)resourceRequirement
{
  return 0.4;
}

- (BOOL)autoCancellable
{
  return 1;
}

- (void)cancel
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[PhotosCapture] Cancelling processing", v5, 2u);
    }
  }
  atomic_store(1u, (unsigned __int8 *)&self->_cancel);
}

- (void)interrupt
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[PhotosCapture] Interrupting processing", v5, 2u);
    }
  }
  atomic_store(1u, (unsigned __int8 *)&self->_interrupt);
}

- (void)resetInterruption
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[PhotosCapture] Resetting interrupt", v5, 2u);
    }
  }
  atomic_store(0, (unsigned __int8 *)&self->_interrupt);
}

+ (BOOL)_allowProcessingCapturedFace
{
  return 1;
}

+ (BOOL)_concurrentFaceProcessing
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1002525C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1002525C8))
  {
    byte_1002525C0 = DeviceHasANE();
    __cxa_guard_release(&qword_1002525C8);
  }
  return byte_1002525C0;
}

+ (BOOL)_cameraFaceOnly
{
  return 0;
}

- (BOOL)isAssetEligible:(id)a3
{
  id v3 = a3;
  BOOL v4 = ![v3 deferredProcessingNeeded]
    || [v3 deferredProcessingNeeded] == 4
    || [v3 deferredProcessingNeeded] == 8
    || [v3 deferredProcessingNeeded] == 1;

  return v4;
}

- (void)_persistClassifiedFaces:(id)a3 withDetectedPersons:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 allKeys];
    id v8 = [v7 firstObject];
    objc_super v9 = [v8 photoLibrary];

    NSErrorUserInfoKey v10 = [v9 librarySpecificFetchOptions];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100088E30;
    v18[3] = &unk_10021BF68;
    id v19 = v5;
    id v20 = v6;
    id v11 = v10;
    id v21 = v11;
    v12 = objc_retainBlock(v18);
    id v17 = 0;
    unsigned __int8 v13 = [v9 performChangesAndWait:v12 error:&v17];
    id v14 = v17;
    if ((v13 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "[PhotosCapture] Failed to persist person identification results - %@", buf, 0xCu);
      }
    }
  }
}

- (int)faceProcessingForAssets:(id)a3 withManager:(id)a4 onDemandDetection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    int v10 = 0;
    goto LABEL_37;
  }
  int v10 = [v9 loadPersonsModelAndInitializeFaceAnalyzerWrapper];
  if (!v10)
  {
    v43 = +[NSMutableDictionary dictionary];
    unsigned __int8 v13 = +[NSMutableDictionary dictionary];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100089C44;
    v59[3] = &unk_10021C150;
    id v60 = v9;
    v61 = self;
    v49 = v43;
    v62 = v49;
    id v14 = v13;
    id v63 = v14;
    v50 = objc_retainBlock(v59);
    uint64_t v48 = mach_absolute_time();
    v15 = VCPSignPostLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    id v17 = VCPSignPostLog();
    v18 = v17;
    unint64_t v46 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPJIT_Face_DetectAndIdentifyBatch", (const char *)&unk_1001F3BD3, buf, 2u);
    }
    os_signpost_id_t v47 = v16;

    if ([(id)objc_opt_class() _concurrentFaceProcessing])
    {
      id v44 = v14;
      v42 = +[NSMutableArray array];
      id v19 = [v8 count];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100089DBC;
      block[3] = &unk_10021C178;
      block[4] = self;
      BOOL v58 = v5;
      id v45 = v8;
      id v55 = v45;
      id v20 = v42;
      id v56 = v20;
      id v21 = v50;
      v57 = v21;
      dispatch_apply((size_t)v19, 0, block);
      unsigned __int8 v22 = atomic_load((unsigned __int8 *)&self->_interrupt);
      if (v22 & 1) != 0 || (unsigned __int8 v23 = atomic_load((unsigned __int8 *)&self->_cancel), (v23) && v5)
      {
        int v24 = 6;
      }
      else
      {
        unint64_t v36 = 0;
        v41 = v21 + 16;
        while (v36 < (unint64_t)objc_msgSend(v20, "count", v41))
        {
          unsigned __int8 v38 = atomic_load((unsigned __int8 *)&self->_interrupt);
          if (v38 & 1) != 0 || (unsigned __int8 v39 = atomic_load((unsigned __int8 *)&self->_cancel), (v39) && v5)
          {
            int v24 = 6;
          }
          else
          {
            v40 = [v45 objectAtIndexedSubscript:v36];
            if ([(VCPPhotosCaptureProcessingTask *)self isAssetEligible:v40])
            {
              (*((void (**)(char *, void *, BOOL))v21 + 2))(v21, v40, v5);
              int v24 = 0;
            }
            else
            {
              int v24 = 9;
            }
          }
          if (v24 != 9 && v24) {
            goto LABEL_15;
          }
          ++v36;
        }
        int v24 = 0;
      }
LABEL_15:

      id v14 = v44;
      if (v24) {
        goto LABEL_34;
      }
    }
    else
    {
      unint64_t v25 = 0;
      while (2)
      {
        if (v25 < (unint64_t)[v8 count])
        {
          unsigned __int8 v27 = atomic_load((unsigned __int8 *)&self->_interrupt);
          if (v27 & 1) != 0 || (unsigned __int8 v28 = atomic_load((unsigned __int8 *)&self->_cancel), (v28) && v5)
          {
            int v29 = 3;
          }
          else
          {
            v30 = [v8 objectAtIndexedSubscript:v25];
            if ([(VCPPhotosCaptureProcessingTask *)self isAssetEligible:v30])
            {
              ((void (*)(void *, void *, BOOL))v50[2])(v50, v30, v5);
              int v29 = 0;
            }
            else
            {
              int v29 = 7;
            }
          }
          switch(v29)
          {
            case 0:
            case 7:
              ++v25;
              continue;
            case 3:
              goto LABEL_34;
            case 6:
              goto LABEL_29;
            default:
              goto LABEL_35;
          }
          goto LABEL_35;
        }
        break;
      }
    }
LABEL_29:
    v31 = VCPSignPostLog();
    v32 = v31;
    if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v47, "VCPJIT_Face_DetectAndIdentifyBatch", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v48)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
LABEL_34:
    persistGroup = self->_persistGroup;
    persistQueue = self->_persistQueue;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100089ED4;
    v51[3] = &unk_10021BF68;
    v51[4] = self;
    v52 = v49;
    id v53 = v14;
    dispatch_group_async(persistGroup, persistQueue, v51);

LABEL_35:
    int v10 = 0;
    id v11 = v49;
LABEL_36:

    goto LABEL_37;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, " QuickFaceID Persons Model is not ready; skip processing",
        buf,
        2u);
    }
    goto LABEL_36;
  }
LABEL_37:

  return v10;
}

- (void)ocrProcessingForAssets:(id)a3
{
  id v4 = a3;
  uint64_t v32 = mach_absolute_time();
  BOOL v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = VCPSignPostLog();
  id v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v31 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPJIT_OCR_Batch", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v9 = [v4 firstObject];
  int v10 = [v9 photoLibrary];
  v33 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10008A5D8;
  v35[3] = &unk_100219D98;
  v35[4] = self;
  v34 = objc_retainBlock(v35);
  id v11 = +[VCPMADOCRAssetBatch batchWithAnalysisDatabase:v33 allowDownload:0 cancelBlock:v34];
  unint64_t v12 = 0;
  os_log_type_t v13 = VCPLogToOSLogType[7];
  os_log_type_t type = VCPLogToOSLogType[6];
  while (v12 < (unint64_t)[v4 count])
  {
    unsigned __int8 v15 = atomic_load((unsigned __int8 *)&self->_interrupt);
    if ((v15 & 1) == 0)
    {
      unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->_cancel);
      if ((v16 & 1) == 0)
      {
        id v17 = [v4 objectAtIndexedSubscript:v12];
        if ([(VCPPhotosCaptureProcessingTask *)self isAssetEligible:v17])
        {
          v18 = objc_msgSend(v17, "vcp_passedOCRGating");
          if ([v18 BOOLValue])
          {
            id v19 = +[NSDate now];
            [v11 addPhotosAsset:v17 withPreviousStatus:0 attempts:0 andAttemptDate:v19];
            goto LABEL_11;
          }
          if (v18)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              id v19 = VCPLogInstance();
              if (os_log_type_enabled(v19, v13))
              {
                unsigned __int8 v22 = [v17 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v37 = v22;
                _os_log_impl((void *)&_mh_execute_header, v19, v13, "[PhotosCapture][%@] OCR gating did not pass; skipping",
                  buf,
                  0xCu);
              }
              goto LABEL_11;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v19 = VCPLogInstance();
            if (os_log_type_enabled(v19, type))
            {
              unsigned __int8 v23 = [v17 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v37 = v23;
              _os_log_impl((void *)&_mh_execute_header, v19, type, "[PhotosCapture][%@] OCR gating not available; skipping",
                buf,
                0xCu);
            }
LABEL_11:
          }
LABEL_23:
        }
        else if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, v13))
          {
            id v21 = [v17 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v37 = v21;
            _os_log_impl((void *)&_mh_execute_header, v18, v13, "[PhotosCapture][%@] Asset not ready for OCR; skipping",
              buf,
              0xCu);
          }
          goto LABEL_23;
        }

        char v20 = 1;
        goto LABEL_25;
      }
    }
    char v20 = 0;
LABEL_25:
    ++v12;
    if ((v20 & 1) == 0) {
      goto LABEL_38;
    }
  }
  id v24 = [v11 count];
  if (v24 && sub_10008A604((uint64_t)v24, v11) && (int)MediaAnalysisLogLevel() >= 4)
  {
    unint64_t v25 = VCPLogInstance();
    os_log_type_t v26 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v25, v26))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "[PhotosCapture] OCR processing failed", buf, 2u);
    }
  }
  unsigned __int8 v27 = VCPSignPostLog();
  unsigned __int8 v28 = v27;
  if (v31 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "VCPJIT_OCR_Batch", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if (v32)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
LABEL_38:
}

- (BOOL)run:(id *)a3
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obj = self->_photoLibraries;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v137 count:16];
  v110 = self;
  if (v4)
  {
    uint64_t v101 = *(void *)v112;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v102 = VCPLogToOSLogType[6];
    do
    {
      id v100 = v4;
      for (i = 0; i != v100; i = (char *)i + 1)
      {
        if (*(void *)v112 != v101) {
          objc_enumerationMutation(obj);
        }
        v103 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        unsigned __int8 v5 = atomic_load((unsigned __int8 *)&v110->_interrupt);
        if (v5 & 1) != 0 || (unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v110->_cancel), (v6))
        {
          if (!a3)
          {
            char v106 = 0;
            int v39 = 1;
            goto LABEL_45;
          }
          NSErrorUserInfoKey v135 = NSLocalizedDescriptionKey;
          unsigned __int8 v35 = atomic_load((unsigned __int8 *)&v110->_interrupt);
          BOOL v36 = (v35 & 1) == 0;
          CFStringRef v37 = @"Interrupted";
          if (v36) {
            CFStringRef v37 = @"Canceled";
          }
          id v108 = +[NSString stringWithFormat:@"[PhotosCapture] %@ at task start", v37];
          id v136 = v108;
          v105 = +[NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];
          unsigned __int8 v38 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
          char v106 = 0;
          id v11 = *a3;
          *a3 = v38;
LABEL_41:
          int v39 = 1;
LABEL_42:

          goto LABEL_43;
        }
        id v108 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v103];
        v105 = +[PHAsset vcp_fetchOptionsForLibrary:v103 forTaskID:8];
        id v7 = +[NSPredicate predicateWithFormat:@"faceAdjustmentVersion = nil"];
        [v105 setInternalPredicate:v7];

        id v8 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
        v134 = v8;
        id v9 = +[NSArray arrayWithObjects:&v134 count:1];
        [v105 setSortDescriptors:v9];

        if (![(id)objc_opt_class() _allowProcessingCapturedFace]) {
          goto LABEL_58;
        }
        int v10 = +[PHAsset fetchAssetsFromCameraSinceDate:0 options:v105];
        id v11 = [v10 fetchedObjects];

        unint64_t v12 = v11;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          os_log_type_t v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, type))
          {
            id v14 = [v11 count];
            *(_DWORD *)buf = 134217984;
            unint64_t v131 = (unint64_t)v14;
            _os_log_impl((void *)&_mh_execute_header, v13, type, "[PhotosCapture] Quick Face ID: %lu captured assets; start fast track process",
              buf,
              0xCu);
          }

          unint64_t v12 = v11;
        }
        v110->_numberOfNewCaptures = (unint64_t)[v12 count];
        uint64_t v95 = mach_absolute_time();
        unsigned __int8 v15 = VCPSignPostLog();
        os_signpost_id_t spid = os_signpost_id_generate(v15);

        unsigned __int8 v16 = VCPSignPostLog();
        id v17 = v16;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPJIT_CameraFace_EndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        BOOL v18 = 0;
        id v19 = 0;
        unint64_t v20 = 0;
        while (!v18)
        {
          unsigned __int8 v22 = v11;
          unsigned __int8 v23 = (char *)[v11 count];
          if ((unint64_t)&v23[-v20] >= 0x32) {
            uint64_t v24 = 50;
          }
          else {
            uint64_t v24 = (uint64_t)&v23[-v20];
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            unint64_t v25 = VCPLogInstance();
            if (os_log_type_enabled(v25, v102))
            {
              ++v19;
              *(_DWORD *)buf = 134218240;
              unint64_t v131 = (unint64_t)v19;
              __int16 v132 = 2048;
              uint64_t v133 = v24;
              _os_log_impl((void *)&_mh_execute_header, v25, v102, "[PhotosCapture] Quick Face ID fast track batch %lu, jobs: %lu", buf, 0x16u);
            }

            unsigned __int8 v22 = v11;
          }
          os_log_type_t v26 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v20, v24);
          unsigned __int8 v27 = [v22 objectsAtIndexes:v26];
          signed int v28 = [(VCPPhotosCaptureProcessingTask *)v110 faceProcessingForAssets:v27 withManager:v108 onDemandDetection:0];
          if (v28)
          {
            if (a3)
            {
              NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
              int v29 = +[NSString stringWithFormat:@"[PhotosCapture] Error during fast track face processing"];
              v129 = v29;
              v30 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
              unint64_t v31 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v28 userInfo:v30];
              BOOL v18 = 0;
              goto LABEL_33;
            }
            BOOL v18 = 0;
            goto LABEL_34;
          }
          v20 += v24;
          BOOL v18 = v20 >= (unint64_t)[v11 count];
          unsigned __int8 v32 = atomic_load((unsigned __int8 *)&v110->_interrupt);
          if (v32)
          {
            if (a3)
            {
              NSErrorUserInfoKey v126 = NSLocalizedDescriptionKey;
              int v29 = +[NSString stringWithFormat:@"[PhotosCapture] Interrupted with %lu fast track face job done", v20];
              v127 = v29;
              v30 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
              unint64_t v31 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v30];
LABEL_33:
              id v34 = *a3;
              *a3 = v31;
            }
LABEL_34:
            char v33 = 0;
            char v106 = 0;
            goto LABEL_35;
          }
          char v33 = 1;
LABEL_35:

          if ((v33 & 1) == 0) {
            goto LABEL_41;
          }
        }
        v40 = VCPSignPostLog();
        v41 = v40;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, spid, "VCPJIT_CameraFace_EndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v95)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        v42 = v11;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v43 = VCPLogInstance();
          if (os_log_type_enabled(v43, type))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v131 = v20;
            _os_log_impl((void *)&_mh_execute_header, v43, type, "[PhotosCapture] Quick Face ID: %lu fast track face job done", buf, 0xCu);
          }

          v42 = v11;
        }

LABEL_58:
        dispatch_group_wait((dispatch_group_t)v110->_persistGroup, 0xFFFFFFFFFFFFFFFFLL);
        if (![(id)objc_opt_class() _cameraFaceOnly])
        {
          unsigned __int8 v45 = atomic_load((unsigned __int8 *)&v110->_interrupt);
          if (v45 & 1) != 0 || (unsigned __int8 v46 = atomic_load((unsigned __int8 *)&v110->_cancel), (v46))
          {
            if (!a3)
            {
              char v106 = 0;
              int v39 = 1;
              goto LABEL_43;
            }
            NSErrorUserInfoKey v124 = NSLocalizedDescriptionKey;
            unsigned __int8 v79 = atomic_load((unsigned __int8 *)&v110->_interrupt);
            BOOL v36 = (v79 & 1) == 0;
            CFStringRef v80 = @"Interrupted";
            if (v36) {
              CFStringRef v80 = @"Canceled";
            }
            uint64_t v125 = +[NSString stringWithFormat:@"[PhotosCapture] %@ after fast track job", v80];
            spida = (void *)v125;
            v94 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
            v81 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
            char v106 = 0;
            id v82 = *a3;
            *a3 = v81;
            int v39 = 1;
          }
          else
          {
            spida = +[PHAsset fetchAssetsFromCameraSinceDate:0 options:v105];
            v94 = +[PHAsset vcp_fetchOptionsForLibrary:v103 forTaskID:10];
            [v94 setPredicate:0];
            os_signpost_id_t v47 = +[NSPredicate predicateWithFormat:@"mediaAnalysisAttributes.characterRecognitionAttributes.algorithmVersion = nil && kindSubtype != %d", 1];
            [v94 setInternalPredicate:v47];

            uint64_t v48 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
            v123 = v48;
            v49 = +[NSArray arrayWithObjects:&v123 count:1];
            [v94 setSortDescriptors:v49];

            v96 = +[PHAsset fetchAssetsFromCameraSinceDate:0 options:v94];
            uint64_t v87 = mach_absolute_time();
            v50 = VCPSignPostLog();
            os_signpost_id_t v88 = os_signpost_id_generate(v50);

            v51 = VCPSignPostLog();
            v52 = v51;
            if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, v88, "VCPJIT_AssetFaceAndOCR_EndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            unint64_t v53 = 0;
            uint64_t v89 = 0;
            uint64_t v90 = 0;
            unint64_t v54 = 0;
            BOOL v55 = 0;
            BOOL v56 = 0;
            while (!v55 || !v56)
            {
              if (v55)
              {
                BOOL v55 = 1;
              }
              else
              {
                v57 = (char *)[spida count];
                if ((unint64_t)&v57[-v53] >= 0x19) {
                  uint64_t v58 = 25;
                }
                else {
                  uint64_t v58 = (uint64_t)&v57[-v53];
                }
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  v59 = VCPLogInstance();
                  if (os_log_type_enabled(v59, v102))
                  {
                    *(_DWORD *)buf = 134218240;
                    unint64_t v131 = ++v90;
                    __int16 v132 = 2048;
                    uint64_t v133 = v58;
                    _os_log_impl((void *)&_mh_execute_header, v59, v102, "[PhotosCapture] Quick Face ID batch %lu, jobs: %lu", buf, 0x16u);
                  }
                }
                id v60 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v53, v58);
                v61 = [spida objectsAtIndexes:v60];
                signed int v62 = [(VCPPhotosCaptureProcessingTask *)v110 faceProcessingForAssets:v61 withManager:v108 onDemandDetection:1];
                if (v62)
                {
                  if (a3)
                  {
                    NSErrorUserInfoKey v121 = NSLocalizedDescriptionKey;
                    id v63 = +[NSString stringWithFormat:@"[PhotosCapture] Error during face processing"];
                    v122 = v63;
                    v64 = +[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
                    v65 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v62 userInfo:v64];
                    id v66 = *a3;
                    *a3 = v65;
                  }
                  char v106 = 0;
                  BOOL v55 = 0;
                }
                else
                {
                  v53 += v58;
                  BOOL v55 = v53 >= (unint64_t)[spida count];
                }

                if (v62) {
                  goto LABEL_119;
                }
              }
              unsigned __int8 v67 = atomic_load((unsigned __int8 *)&v110->_interrupt);
              if (v67)
              {
                if (a3)
                {
                  NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
                  v76 = +[NSString stringWithFormat:@"[PhotosCapture] Interrupted with %lu face and %lu OCR job done", v53, v54];
                  v120 = v76;
                  v77 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
                  v78 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v77];
                  goto LABEL_117;
                }
LABEL_118:
                char v106 = 0;
LABEL_119:
                int v39 = 1;
                goto LABEL_120;
              }
              if (v56)
              {
                BOOL v56 = 1;
              }
              else
              {
                v69 = (char *)[v96 count];
                if ((unint64_t)&v69[-v54] >= 0x19) {
                  uint64_t v70 = 25;
                }
                else {
                  uint64_t v70 = (uint64_t)&v69[-v54];
                }
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  v71 = VCPLogInstance();
                  if (os_log_type_enabled(v71, v102))
                  {
                    *(_DWORD *)buf = 134218240;
                    unint64_t v131 = ++v89;
                    __int16 v132 = 2048;
                    uint64_t v133 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v71, v102, "[PhotosCapture] Quick OCR batch %lu, jobs: %lu", buf, 0x16u);
                  }
                }
                v72 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v54, v70);
                v73 = [v96 objectsAtIndexes:v72];
                [(VCPPhotosCaptureProcessingTask *)v110 ocrProcessingForAssets:v73];

                v54 += v70;
                BOOL v56 = v54 >= (unint64_t)[v96 count];
              }
              unsigned __int8 v74 = atomic_load((unsigned __int8 *)&v110->_interrupt);
              if (v74)
              {
                if (a3)
                {
                  NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
                  v76 = +[NSString stringWithFormat:@"[PhotosCapture] Interrupted with %lu face and %lu OCR job done", v53, v54];
                  v118 = v76;
                  v77 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
                  v78 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v77];
LABEL_117:
                  id v85 = *a3;
                  *a3 = v78;
                }
                goto LABEL_118;
              }
              unsigned __int8 v75 = atomic_load((unsigned __int8 *)&v110->_cancel);
              if (v75)
              {
                if (a3)
                {
                  NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
                  v76 = +[NSString stringWithFormat:@"[PhotosCapture] Canceled after screening %lu assets for face and %lu assets for OCR", v53, v54];
                  v116 = v76;
                  v77 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
                  v78 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v77];
                  goto LABEL_117;
                }
                goto LABEL_118;
              }
            }
            v83 = VCPSignPostLog();
            v84 = v83;
            if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v84, OS_SIGNPOST_INTERVAL_END, v88, "VCPJIT_AssetFaceAndOCR_EndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            if (v87)
            {
              mach_absolute_time();
              VCPPerformance_LogMeasurement();
            }
            MediaAnalysisDaemonReleaseSharedDataStores(v103);
            int v39 = 0;
LABEL_120:
            id v82 = v96;
          }

          id v11 = spida;
          goto LABEL_42;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v44 = VCPLogInstance();
          if (os_log_type_enabled(v44, v102))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v44, v102, "[PhotosCapture] Stop processing after camera faces are processed", buf, 2u);
          }
        }
        (*((void (**)(void))v110->_completionHandler + 2))();
        int v39 = 1;
        char v106 = 1;
LABEL_43:

LABEL_45:
        if (v39)
        {

          goto LABEL_125;
        }
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v137 count:16];
    }
    while (v4);
  }

  dispatch_group_wait((dispatch_group_t)v110->_persistGroup, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(void))v110->_completionHandler + 2))();
  char v106 = 1;
LABEL_125:
  return v106 & 1;
}

- (void)_resetFieldsPostCapturesProcessing
{
  *(_OWORD *)&self->_numberOfCapturesHaveFaces = 0u;
  *(_OWORD *)&self->_numberOfPositiveFaces = 0u;
  *(_OWORD *)&self->_numberOfNewCaptures = 0u;
}

- (void)_reportEventPostCapturesProcessing
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t numberOfNewCaptures = v2->_numberOfNewCaptures;
  if (numberOfNewCaptures)
  {
    unint64_t numberOfFaces = v2->_numberOfFaces;
    if (numberOfFaces) {
      float v5 = (float)v2->_numberOfPositiveFaces / (float)numberOfFaces;
    }
    else {
      float v5 = 0.0;
    }
    unint64_t numberOfNewCapturesProcessed = v2->_numberOfNewCapturesProcessed;
    unint64_t numberOfCapturesHaveFaces = v2->_numberOfCapturesHaveFaces;
    unint64_t numberOfNewCapturesWithFaceHaveFaceprintFromCamera = v2->_numberOfNewCapturesWithFaceHaveFaceprintFromCamera;
    uint64_t v24 = +[VCPMADCoreAnalyticsManager sharedManager];
    v25[0] = @"NumberOfNewCaptures";
    unsigned __int8 v23 = +[NSNumber numberWithUnsignedInteger:v2->_numberOfNewCaptures];
    v26[0] = v23;
    v25[1] = @"NumberOfNewCapturesProcessed";
    id v9 = +[NSNumber numberWithUnsignedInteger:v2->_numberOfNewCapturesProcessed];
    float v10 = (float)numberOfNewCaptures;
    *(float *)&double v11 = (float)numberOfNewCapturesProcessed / (float)numberOfNewCaptures;
    v26[1] = v9;
    v25[2] = @"PercentageOfNewCapturesProcessed";
    unint64_t v12 = +[NSNumber numberWithFloat:v11];
    v26[2] = v12;
    v25[3] = @"NumberOfCapturesHaveFace";
    os_log_type_t v13 = +[NSNumber numberWithUnsignedInteger:v2->_numberOfCapturesHaveFaces];
    *(float *)&double v14 = (float)numberOfCapturesHaveFaces / v10;
    v26[3] = v13;
    v25[4] = @"PercentageOfCapturesHaveFace";
    unsigned __int8 v15 = +[NSNumber numberWithFloat:v14];
    v26[4] = v15;
    v25[5] = @"NumberOfNewCapturesWithFaceFullFromCamera";
    unsigned __int8 v16 = +[NSNumber numberWithUnsignedInteger:v2->_numberOfNewCapturesWithFaceHaveFaceprintFromCamera];
    *(float *)&double v17 = (float)numberOfNewCapturesWithFaceHaveFaceprintFromCamera / v10;
    v26[5] = v16;
    v25[6] = @"PercentageOfNewCapturesWithFaceFullFromCamera";
    BOOL v18 = +[NSNumber numberWithFloat:v17];
    v26[6] = v18;
    v25[7] = @"NumberOfPositiveFace";
    id v19 = +[NSNumber numberWithUnsignedInteger:v2->_numberOfPositiveFaces];
    v26[7] = v19;
    v25[8] = @"PercentageOfPositiveFaces";
    *(float *)&double v20 = v5;
    id v21 = +[NSNumber numberWithFloat:v20];
    v26[8] = v21;
    unsigned __int8 v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:9];
    [v24 sendEvent:@"com.apple.mediaanalysisd.photos.postcapturefaceprocessing" withAnalytics:v22];

    [(VCPPhotosCaptureProcessingTask *)v2 _resetFieldsPostCapturesProcessing];
  }
  else
  {
    [(VCPPhotosCaptureProcessingTask *)v2 _resetFieldsPostCapturesProcessing];
  }
  objc_sync_exit(v2);
}

- (int)run
{
  unsigned __int8 v15 = 0;
  if ([(VCPPhotosCaptureProcessingTask *)self run:&v15]) {
    goto LABEL_16;
  }
  if ([(__CFString *)v15 code] == (id)-128)
  {
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_14;
    }
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_13;
    }
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_interrupt);
    if (v5) {
      CFStringRef v6 = @"interrupted";
    }
    else {
      CFStringRef v6 = @"canceled";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v17 = v6;
    __int16 v18 = 2112;
    id v19 = v15;
    id v7 = "[PhotosCapture] Task %@ (%@)";
    id v8 = v3;
    os_log_type_t v9 = v4;
    uint32_t v10 = 22;
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    goto LABEL_14;
  }
  id v3 = VCPLogInstance();
  os_log_type_t v11 = VCPLogToOSLogType[3];
  if (os_log_type_enabled(v3, v11))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = v15;
    id v7 = "[PhotosCapture] Task failed (%@)";
    id v8 = v3;
    os_log_type_t v9 = v11;
    uint32_t v10 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
  }
LABEL_13:

LABEL_14:
  dispatch_group_wait((dispatch_group_t)self->_persistGroup, 0xFFFFFFFFFFFFFFFFLL);
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_interrupt);
  if (v12)
  {
LABEL_16:
    int v13 = 0;
    goto LABEL_17;
  }
  (*((void (**)(void))self->_completionHandler + 2))();
  int v13 = [(__CFString *)v15 code];
LABEL_17:
  [(VCPPhotosCaptureProcessingTask *)self _reportEventPostCapturesProcessing];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistQueue, 0);
  objc_storeStrong((id *)&self->_persistGroup, 0);
  objc_storeStrong((id *)&self->_photoLibraries, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end