@interface VCPCompoundMADTask
+ (id)taskWithPhotoLibrary:(id)a3 forVCPTaskIDs:(id)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7 andCancelBlock:(id)a8;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (BOOL)run:(id *)a3;
- (VCPCompoundMADTask)initWithVCPMADTasks:(id)a3 andCompletionHandler:(id)a4 andCancelBlock:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPCompoundMADTask

+ (id)taskWithPhotoLibrary:(id)a3 forVCPTaskIDs:(id)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7 andCancelBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v58 = a5;
  id v15 = a6;
  id v59 = a7;
  id v16 = a8;
  id v17 = [v14 count];
  if (v17)
  {
    v18 = +[NSMutableArray arrayWithCapacity:v17];
    float v19 = 1.0 / (float)(unint64_t)v17;
    if ([v14 containsObject:&off_10022D738])
    {
      *(void *)buf = 0;
      v103 = buf;
      uint64_t v104 = 0x3032000000;
      v105 = sub_10000AFF8;
      v106 = sub_10000B008;
      id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_10000B010;
      v97[3] = &unk_100219B18;
      v99 = buf;
      float v101 = 1.0 / (float)(unint64_t)v17;
      id v98 = v15;
      uint64_t v100 = 0;
      v20 = objc_retainBlock(v97);
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_10000B13C;
      v96[3] = &unk_100219B40;
      v96[4] = buf;
      v21 = objc_retainBlock(v96);
      id v117 = v13;
      v22 = +[NSArray arrayWithObjects:&v117 count:1];
      v23 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:v22 cancelBlock:v16 progressHandler:v20 andCompletionHandler:v21];
      [v18 addObject:v23];

      _Block_object_dispose(buf, 8);
      uint64_t v24 = 1;
    }
    else
    {
      uint64_t v24 = 0;
    }
    if ([v14 containsObject:&off_10022D750])
    {
      *(void *)buf = 0;
      v103 = buf;
      uint64_t v104 = 0x3032000000;
      v105 = sub_10000AFF8;
      v106 = sub_10000B008;
      id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_10000B238;
      v91[3] = &unk_100219B18;
      v93 = buf;
      float v95 = v19;
      id v92 = v15;
      uint64_t v94 = v24;
      v25 = objc_retainBlock(v91);
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10000B364;
      v90[3] = &unk_100219B40;
      v90[4] = buf;
      v26 = objc_retainBlock(v90);
      id v116 = v13;
      v27 = +[NSArray arrayWithObjects:&v116 count:1];
      v28 = +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:v27 andOptions:0 andProgressHandler:v25 andCompletionHandler:v26 andCancelBlock:v16];
      [v18 addObject:v28];

      _Block_object_dispose(buf, 8);
      ++v24;
    }
    if ([v14 containsObject:&off_10022D768])
    {
      *(void *)buf = 0;
      v103 = buf;
      uint64_t v104 = 0x3032000000;
      v105 = sub_10000AFF8;
      v106 = sub_10000B008;
      id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_10000B460;
      v85[3] = &unk_100219B18;
      v87 = buf;
      float v89 = v19;
      id v86 = v15;
      uint64_t v88 = v24;
      v29 = objc_retainBlock(v85);
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_10000B58C;
      v84[3] = &unk_100219B40;
      v84[4] = buf;
      v30 = objc_retainBlock(v84);
      id v115 = v13;
      v31 = +[NSArray arrayWithObjects:&v115 count:1];
      v32 = +[VCPMADOCRLibraryProcessingTask taskWithPhotoLibraries:v31 cancelBlock:v16 progressHandler:v29 andCompletionHandler:v30];
      [v18 addObject:v32];

      _Block_object_dispose(buf, 8);
      ++v24;
    }
    if ([v14 containsObject:&off_10022D780])
    {
      *(void *)buf = 0;
      v103 = buf;
      uint64_t v104 = 0x3032000000;
      v105 = sub_10000AFF8;
      v106 = sub_10000B008;
      id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_10000B688;
      v79[3] = &unk_100219B18;
      v81 = buf;
      float v83 = v19;
      id v80 = v15;
      uint64_t v82 = v24;
      v33 = objc_retainBlock(v79);
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_10000B7B4;
      v78[3] = &unk_100219B40;
      v78[4] = buf;
      v34 = objc_retainBlock(v78);
      id v114 = v13;
      v35 = +[NSArray arrayWithObjects:&v114 count:1];
      v36 = +[VCPMADVisualSearchLibraryProcessingTask taskWithPhotoLibraries:v35 cancelBlock:v16 progressHandler:v33 andCompletionHandler:v34];
      [v18 addObject:v36];

      _Block_object_dispose(buf, 8);
      ++v24;
    }
    if ([v14 containsObject:&off_10022D798])
    {
      *(void *)buf = 0;
      v103 = buf;
      uint64_t v104 = 0x3032000000;
      v105 = sub_10000AFF8;
      v106 = sub_10000B008;
      id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10000B8B0;
      v73[3] = &unk_100219B18;
      v75 = buf;
      float v77 = v19;
      id v74 = v15;
      uint64_t v76 = v24;
      v37 = objc_retainBlock(v73);
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_10000B9DC;
      v72[3] = &unk_100219B40;
      v72[4] = buf;
      v38 = objc_retainBlock(v72);
      id v113 = v13;
      v39 = +[NSArray arrayWithObjects:&v113 count:1];
      v40 = +[VCPLibraryProcessingTask taskWithPhotoLibraries:v39 andOptions:v58 andProgressHandler:v37 andCompletionHandler:v38 andCancelBlock:v16];
      [v18 addObject:v40];

      _Block_object_dispose(buf, 8);
      ++v24;
    }
    if ([v14 containsObject:&off_10022D7B0])
    {
      *(void *)buf = 0;
      v103 = buf;
      uint64_t v104 = 0x3032000000;
      v105 = sub_10000AFF8;
      v106 = sub_10000B008;
      id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_10000BAD8;
      v67[3] = &unk_100219B68;
      v69 = buf;
      float v71 = v19;
      id v68 = v15;
      uint64_t v70 = v24;
      v41 = objc_retainBlock(v67);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_10000BC04;
      v66[3] = &unk_100219B40;
      v66[4] = buf;
      v42 = objc_retainBlock(v66);
      CFStringRef v111 = @"SkipSyncGallery";
      v112 = &__kCFBooleanFalse;
      v43 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      v44 = +[MADUnifiedProcessingTask taskWithCancelBlock:v16 options:v43 progressHandler:v41 andCompletionHandler:v42];
      [v18 addObject:v44];

      _Block_object_dispose(buf, 8);
      ++v24;
    }
    if ([v14 containsObject:&off_10022D7C8])
    {
      if (_os_feature_enabled_impl())
      {
        *(void *)buf = 0;
        v103 = buf;
        uint64_t v104 = 0x3032000000;
        v105 = sub_10000AFF8;
        v106 = sub_10000B008;
        id v107 = objc_alloc_init((Class)VCPTimeMeasurement);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10000BD00;
        v61[3] = &unk_100219B18;
        v63 = buf;
        float v65 = v19;
        id v62 = v15;
        uint64_t v64 = v24;
        v45 = objc_retainBlock(v61);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10000BE2C;
        v60[3] = &unk_100219B40;
        v60[4] = buf;
        v46 = objc_retainBlock(v60);
        id v110 = v13;
        v47 = +[NSArray arrayWithObjects:&v110 count:1];
        v48 = +[VCPMADPECLibraryProcessingTask taskWithPhotoLibraries:v47 cancelBlock:v16 progressHandler:v45 andCompletionHandler:v46];

        if (v48)
        {
          [v18 addObject:v48];
        }
        else if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v51 = VCPLogInstance();
          os_log_type_t v52 = VCPLogToOSLogType[4];
          log = v51;
          if (os_log_type_enabled(v51, v52))
          {
            v56 = [v13 photoLibraryURL];
            uint64_t v53 = [v56 path];
            *(_DWORD *)v108 = 138412290;
            uint64_t v109 = v53;
            v54 = (void *)v53;
            _os_log_impl((void *)&_mh_execute_header, log, v52, "[VCPCompoundMADTask] Failed to create pecLibraryProcessingTask for Photo Library %@; skipping",
              v108,
              0xCu);
          }
        }

        _Block_object_dispose(buf, 8);
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v49 = VCPLogInstance();
        os_log_type_t v50 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "The PEC feature flag must be enabled to schedule the PEC analysis", buf, 2u);
        }
      }
    }
    id v17 = [objc_alloc((Class)objc_opt_class()) initWithVCPMADTasks:v18 andCompletionHandler:v59 andCancelBlock:v16];
  }
  return v17;
}

- (VCPCompoundMADTask)initWithVCPMADTasks:(id)a3 andCompletionHandler:(id)a4 andCancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VCPCompoundMADTask;
  v12 = [(VCPCompoundMADTask *)&v19 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tasks, a3);
    id v14 = objc_retainBlock(v10);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    id v16 = objc_retainBlock(v11);
    id cancelBlock = v13->_cancelBlock;
    v13->_id cancelBlock = v16;
  }
  return v13;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = +[NSString stringWithFormat:@"%@ canceled", v6];
    v12 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v8];
    completionHandler[2](completionHandler, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPCompoundMADTask;
  [(VCPCompoundMADTask *)&v10 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v3 = self->_tasks;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v2)
  {
    LOBYTE(cancelBlock) = 1;
  }
  else
  {
    id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock) {
      LOBYTE(cancelBlock) = cancelBlock[2]();
    }
  }
  return (char)cancelBlock;
}

- (BOOL)run:(id *)a3
{
  if ([(NSArray *)self->_tasks count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      long long v7 = [(NSArray *)self->_tasks objectAtIndexedSubscript:v5];
      if ([(VCPCompoundMADTask *)self isCanceled])
      {
        if (!a3) {
          goto LABEL_12;
        }
        NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
        long long v10 = +[NSString stringWithFormat:@"VCPTask %@ cancelled", v7];
        id v17 = v10;
        NSErrorUserInfoKey v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v11];
        goto LABEL_11;
      }
      signed int v8 = [v7 run];
      if (v8) {
        break;
      }

      if (++v5 >= [(NSArray *)self->_tasks count]) {
        goto LABEL_6;
      }
    }
    if (!a3) {
      goto LABEL_12;
    }
    long long v10 = +[NSString stringWithFormat:@"VCPTask %@ failed", v7, NSLocalizedDescriptionKey];
    id v15 = v10;
    NSErrorUserInfoKey v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 userInfo:v11];
LABEL_11:
    id v13 = *a3;
    *a3 = v12;

LABEL_12:
    return 0;
  }
  else
  {
LABEL_6:
    (*((void (**)(void))self->_completionHandler + 2))();
    return 1;
  }
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  id v11 = 0;
  if ([(VCPCompoundMADTask *)self run:&v11])
  {
    int v4 = 0;
  }
  else
  {
    if ([v11 code] != (id)-128 && (int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v5, v6))
      {
        long long v7 = (objc_class *)objc_opt_class();
        signed int v8 = NSStringFromClass(v7);
        long long v9 = [v11 description];
        *(_DWORD *)buf = 138412546;
        id v13 = v8;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ failed (%@)", buf, 0x16u);
      }
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    int v4 = [v11 code];
  }

  return v4;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end