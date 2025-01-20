@interface MADDatabaseRestoreFastPassProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADDatabaseRestoreFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
@end

@implementation MADDatabaseRestoreFastPassProcessingTask

- (MADDatabaseRestoreFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007212C;
  v17[3] = &unk_10021AD08;
  id v10 = a5;
  id v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)MADDatabaseRestoreFastPassProcessingTask;
  v11 = [(MADDatabaseRestoreFastPassProcessingTask *)&v16 initWithCompletionHandler:v17];
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_10021BEC8;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    [(MADDatabaseRestoreFastPassProcessingTask *)v11 setCancelBlock:v8];
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v75 = @"[Restore-FP]";
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Running MADDatabaseRestoreFastPassProcessingTask ... ", buf, 0xCu);
    }
  }
  v6 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v6);

  v7 = VCPSignPostLog();
  id v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADDatabaseRestoreFastPassProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v9 = +[VCPPhotoLibraryManager sharedManager];
  id v10 = +[PHPhotoLibrary systemPhotoLibraryURL];
  v62 = [v9 photoLibraryWithURL:v10];

  if (!v62)
  {
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    v19 = [0 photoLibraryURL];
    v20 = [v19 path];
    v21 = +[NSString stringWithFormat:@"%@ Failed to open Photo Library (%@)", @"[Restore-FP]", v20];
    v88 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    id obj = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v22];

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        v25 = [obj description];
        *(_DWORD *)buf = 138412290;
        CFStringRef v75 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@", buf, 0xCu);
      }
    }
    if (!a3) {
      goto LABEL_30;
    }
LABEL_29:
    objc_storeStrong(a3, obj);
LABEL_30:
    BOOL v33 = 0;
    goto LABEL_31;
  }
  if (([v62 isReadyForAnalysisCPLInitialDownloadCompleted] & 1) == 0)
  {
    NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
    v26 = [v62 photoLibraryURL];
    v27 = [v26 path];
    v28 = +[NSString stringWithFormat:@"%@ Photo Library not ready for analysis (%@)", @"[Restore-FP]", v27];
    v86 = v28;
    v29 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    id obj = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v29];

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v30 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v31))
      {
        v32 = [obj description];
        *(_DWORD *)buf = 138412290;
        CFStringRef v75 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@", buf, 0xCu);
      }
    }
    if (!a3) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  id v11 = [(MADDatabaseRestoreFastPassProcessingTask *)self cancelBlock];
  id obj = +[MADPhotosLibraryRestoreTask taskWithPhotoLibrary:v62 progressHandler:0 completionHandler:0 cancelBlock:v11];

  if ([obj run])
  {
    v12 = +[NSString stringWithFormat:@"%@ Failed to restore database.", @"[Restore-FP]"];
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v75 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@", buf, 0xCu);
      }
    }
    if (a3)
    {
      NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
      v15 = +[NSString stringWithFormat:@"%@", v12];
      v84 = v15;
      objc_super v16 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      v17 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v16];
      id v18 = *a3;
      *a3 = v17;
    }
    goto LABEL_30;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v35 = +[MADDatabaseRestoreFastPassBackgroundSystemTask featureCodes];
  id v36 = [v35 countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (!v36) {
    goto LABEL_48;
  }
  uint64_t v37 = *(void *)v70;
  os_log_type_t v38 = VCPLogToOSLogType[3];
  os_log_type_t v39 = VCPLogToOSLogType[5];
  do
  {
    for (i = 0; i != v36; i = (char *)i + 1)
    {
      if (*(void *)v70 != v37) {
        objc_enumerationMutation(v35);
      }
      v41 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      id v42 = [v41 unsignedIntegerValue];
      id v68 = 0;
      unsigned __int8 v43 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:50 forFeature:v42 error:&v68];
      id v44 = v68;
      if (v43)
      {
        if ((int)MediaAnalysisLogLevel() < 5) {
          goto LABEL_46;
        }
        v45 = VCPLogInstance();
        if (!os_log_type_enabled(v45, v39)) {
          goto LABEL_45;
        }
        *(_DWORD *)buf = 138412802;
        CFStringRef v75 = @"[Restore-FP]";
        __int16 v76 = 2048;
        uint64_t v77 = 50;
        __int16 v78 = 2112;
        v79 = v41;
        v46 = v45;
        os_log_type_t v47 = v39;
        v48 = "%@ MADDatabaseRestoreFastPassProcessingTask Reported checkpoint %lu for %@";
        uint32_t v49 = 32;
        goto LABEL_44;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_46;
      }
      v45 = VCPLogInstance();
      if (os_log_type_enabled(v45, v38))
      {
        *(_DWORD *)buf = 138413058;
        CFStringRef v75 = @"[Restore-FP]";
        __int16 v76 = 2048;
        uint64_t v77 = 50;
        __int16 v78 = 2112;
        v79 = v41;
        __int16 v80 = 2112;
        id v81 = v44;
        v46 = v45;
        os_log_type_t v47 = v38;
        v48 = "%@ MADDatabaseRestoreFastPassProcessingTask Failed to report checkpoint %lu for %@ - %@";
        uint32_t v49 = 42;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v46, v47, v48, buf, v49);
      }
LABEL_45:

LABEL_46:
    }
    id v36 = [v35 countByEnumeratingWithState:&v69 objects:v82 count:16];
  }
  while (v36);
LABEL_48:

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100072D5C;
  v67[3] = &unk_100219D98;
  v67[4] = self;
  v50 = objc_retainBlock(v67);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v51 = [&off_1002303B0 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v64;
    do
    {
      for (j = 0; j != v51; j = (char *)j + 1)
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(&off_1002303B0);
        }
        v54 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
        +[MADProgressManager updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:](MADProgressManager, "updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:", [v54 unsignedIntegerValue], v62, 0, v50);
      }
      id v51 = [&off_1002303B0 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v51);
  }
  (*((void (**)(double))self->_progressHandler + 2))(100.0);
  v56 = VCPSignPostLog();
  v57 = v56;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, spid, "MADDatabaseRestoreFastPassProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v58 = [(MADDatabaseRestoreFastPassProcessingTask *)self completionHandler];
  v58[2](v58, 0, 0);

  BOOL v33 = 1;
LABEL_31:

  return v33;
}

- (void).cxx_destruct
{
}

@end