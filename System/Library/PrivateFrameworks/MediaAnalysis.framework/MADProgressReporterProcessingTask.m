@interface MADProgressReporterProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADProgressReporterProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADProgressReporterProcessingTask

- (MADProgressReporterProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MADProgressReporterProcessingTask;
  v11 = [(MADProgressReporterProcessingTask *)&v18 initWithCompletionHandler:v10];
  v12 = v11;
  if (v11)
  {
    reportingTaskIDs = v11->_reportingTaskIDs;
    v11->_reportingTaskIDs = (NSArray *)&off_100230410;

    if (v9) {
      v14 = v9;
    }
    else {
      v14 = &stru_10021C898;
    }
    v15 = objc_retainBlock(v14);
    id progressHandler = v12->_progressHandler;
    v12->_id progressHandler = v15;

    [(MADProgressReporterProcessingTask *)v12 setCancelBlock:v8];
  }

  return v12;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 completionHandler:v10];

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
      CFStringRef v35 = @"[ProgressReport]";
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Running MADProgressReporterProcessingTask ... ", buf, 0xCu);
    }
  }
  v6 = +[VCPPhotoLibraryManager sharedManager];
  v7 = [v6 allPhotoLibraries];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v11 isSystemPhotoLibrary])
        {
          if ([(MADProgressReporterProcessingTask *)self isCanceled])
          {
            v16 = +[NSString stringWithFormat:@"%@ Processed canceled", @"[ProgressReport]"];
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v17 = VCPLogInstance();
              os_log_type_t v18 = VCPLogToOSLogType[5];
              if (os_log_type_enabled(v17, v18))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v35 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@", buf, 0xCu);
              }
            }
            if (a3)
            {
              NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
              v19 = +[NSString stringWithFormat:@"%@", v16];
              v32 = v19;
              v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
              v21 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v20];
              id v22 = *a3;
              *a3 = v21;
            }
            BOOL v15 = 0;
            v14 = (void (**)(void, void, void))obj;
            goto LABEL_23;
          }
          v12 = +[VCPWatchdog sharedWatchdog];
          [v12 pet];

          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1000AEF54;
          v26[3] = &unk_100219D98;
          v26[4] = self;
          v13 = objc_retainBlock(v26);
          +[MADProgressManager updateProgressIfRequestedForTasks:self->_reportingTaskIDs photoLibrary:v11 reuseCachedValue:0 cancelOrExtendTimeoutBlock:v13];
          MediaAnalysisDaemonReleaseSharedDataStores(v11);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v14 = [(MADProgressReporterProcessingTask *)self completionHandler];
  v14[2](v14, 0, 0);
  BOOL v15 = 1;
LABEL_23:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingTaskIDs, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end