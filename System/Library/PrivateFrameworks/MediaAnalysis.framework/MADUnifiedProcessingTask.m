@interface MADUnifiedProcessingTask
+ (id)taskWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)run:(id *)a3;
- (MADUnifiedProcessingTask)initWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)completeSceneProcessing;
- (void)purgeCachedModels;
@end

@implementation MADUnifiedProcessingTask

- (MADUnifiedProcessingTask)initWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BE19C;
  v21[3] = &unk_1002196A0;
  id v13 = a6;
  id v22 = v13;
  v20.receiver = self;
  v20.super_class = (Class)MADUnifiedProcessingTask;
  v14 = [(MADUnifiedProcessingTask *)&v20 initWithCompletionHandler:v21];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_options, a4);
    id v16 = objc_retainBlock(v12);
    id progressHandler = v15->_progressHandler;
    v15->_id progressHandler = v16;

    v19.receiver = v15;
    v19.super_class = (Class)MADUnifiedProcessingTask;
    [(MADUnifiedProcessingTask *)&v19 setCancelBlock:v10];
  }

  return v15;
}

+ (id)taskWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithCancelBlock:v13 options:v12 progressHandler:v11 andCompletionHandler:v10];

  return v14;
}

- (int)completeSceneProcessing
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BE470;
  v13[3] = &unk_10021CA90;
  v13[4] = self;
  v13[5] = v14;
  v4 = objc_retainBlock(v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BE580;
  v12[3] = &unk_10021CAB8;
  v12[4] = self;
  v12[5] = v14;
  v5 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BE6A0;
  v11[3] = &unk_10021CAE0;
  v11[4] = self;
  v6 = objc_retainBlock(v11);
  v7 = +[VCPPhotoLibraryManager sharedManager];
  v8 = [v7 allPhotoLibraries];

  v9 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:v8 cancelBlock:v6 progressHandler:v4 andCompletionHandler:v5];
  LODWORD(v7) = [v9 run];

  _Block_object_dispose(v14, 8);
  return (int)v7;
}

- (void)purgeCachedModels
{
}

- (BOOL)run:(id *)a3
{
  signed int v5 = [(MADUnifiedProcessingTask *)self completeSceneProcessing];
  if (v5)
  {
    if (a3)
    {
      uint64_t v6 = v5;
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      v7 = "failed";
      if (v5 == -128) {
        v7 = "canceled";
      }
      v8 = +[NSString stringWithFormat:@"[Unified] Pre-Analysis %s", v7];
      v43 = v8;
      v9 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v9];
      id v11 = *a3;
      *a3 = v10;
    }
    [(MADUnifiedProcessingTask *)self purgeCachedModels];
    return 0;
  }
  else
  {
    id v13 = +[VCPPhotoLibraryManager sharedManager];
    id v14 = [v13 allPhotoLibraries];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 134217984;
        id v41 = [v14 count];
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Unified] Initiating processing with %lu photo libraries", buf, 0xCu);
      }
    }
    if ([v14 count])
    {
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      while (1)
      {
        objc_super v20 = (char *)[v14 count];
        uint64_t v21 = (unint64_t)&v20[v17] >= 5 ? 5 : (uint64_t)&v20[v17];
        id v22 = [MADTaskCoordinator alloc];
        v23 = objc_msgSend(v14, "subarrayWithRange:", v18, v21);
        options = self->_options;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1000BEB2C;
        v37[3] = &unk_10021CAE0;
        v37[4] = self;
        v25 = [(MADTaskCoordinator *)v22 initWithPhotoLibraries:v23 taskProviderTypes:&off_100230458 options:options cancelBlock:v37 progressReporter:0];

        if (!v25) {
          break;
        }
        signed int v26 = [(MADTaskCoordinator *)v25 run];
        if (v26)
        {
          if (!a3) {
            goto LABEL_28;
          }
          goto LABEL_25;
        }

        v18 += 5;
        v17 -= 5;
        if (v18 >= (unint64_t)[v14 count]) {
          goto LABEL_19;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v28 = VCPLogInstance();
        os_log_type_t v29 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v28, v29))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "[Unified] Failed to create task coordinator.", buf, 2u);
        }
      }
      signed int v26 = -18;
      if (a3)
      {
LABEL_25:
        uint64_t v30 = v26;
        NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
        v31 = "failed";
        if (v26 == -128) {
          v31 = "canceled";
        }
        v32 = +[NSString stringWithFormat:@"[Unified] Analysis %s", v31];
        v39 = v32;
        v33 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v34 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v30 userInfo:v33];
        id v35 = *a3;
        *a3 = v34;
      }
LABEL_28:
      [(MADUnifiedProcessingTask *)self purgeCachedModels];

      BOOL v12 = 0;
    }
    else
    {
LABEL_19:
      [(MADUnifiedProcessingTask *)self purgeCachedModels];
      v27 = [(MADUnifiedProcessingTask *)self completionHandler];
      v27[2](v27, 0, 0);

      BOOL v12 = 1;
    }
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end