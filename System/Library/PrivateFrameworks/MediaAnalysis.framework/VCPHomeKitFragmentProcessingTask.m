@interface VCPHomeKitFragmentProcessingTask
+ (id)taskForAssetData:(id)a3 withAnalyzer:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)autoCancellable;
- (VCPHomeKitFragmentProcessingTask)init;
- (VCPHomeKitFragmentProcessingTask)initWithAssetData:(id)a3 analyzer:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPHomeKitFragmentProcessingTask

- (VCPHomeKitFragmentProcessingTask)init
{
  return 0;
}

- (VCPHomeKitFragmentProcessingTask)initWithAssetData:(id)a3 analyzer:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VCPHomeKitFragmentProcessingTask;
  v15 = [(VCPHomeKitFragmentProcessingTask *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetData, a3);
    atomic_store(0, (unsigned __int8 *)&v16->_started);
    atomic_store(0, (unsigned __int8 *)&v16->_cancel);
    objc_storeStrong((id *)&v16->_analyzer, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    id v17 = objc_retainBlock(v14);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    v19 = v16;
  }

  return v16;
}

+ (id)taskForAssetData:(id)a3 withAnalyzer:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9) {
    id v13 = [objc_alloc((Class)objc_opt_class()) initWithAssetData:v9 analyzer:v10 options:v11 completionHandler:v12];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    v5 = +[NSString stringWithFormat:@"Home video fragment processing task cancelled"];
    id v10 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v6];
    completionHandler[2](completionHandler, 0, v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)VCPHomeKitFragmentProcessingTask;
  [(VCPHomeKitFragmentProcessingTask *)&v8 dealloc];
}

- (float)resourceRequirement
{
  return 0.25;
}

- (void)cancel
{
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_cancel);
  if (v3)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:@"Home video fragment processing task cancelled"];
    v40 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    objc_super v21 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v20];
    completionHandler[2](completionHandler, 0, v21);

    return -128;
  }
  else
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_100021CFC;
    v35 = sub_100021D0C;
    id v36 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100021CFC;
    v29[4] = sub_100021D0C;
    id v30 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v5 = +[VCPWatchdog sharedWatchdog];
    [v5 pet];

    assetData = self->_assetData;
    analyzer = self->_analyzer;
    options = self->_options;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100021D14;
    v25[3] = &unk_10021A298;
    v27 = v29;
    v28 = &v31;
    NSErrorUserInfoKey v9 = v4;
    v26 = v9;
    [(HMIVideoAnalyzer *)analyzer handleAssetData:assetData withOptions:options completionHandler:v25];
    dispatch_time_t v10 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v11, v12))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "HMIVideoAnalyzer handle asset data timed-out", v24, 2u);
        }
      }
      id v13 = (void (**)(id, void, void *))self->_completionHandler;
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      id v14 = +[NSString stringWithFormat:@"HMIVideoAnalyzer handle asset data timed-out"];
      v38 = v14;
      v15 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-23804 userInfo:v15];
      v13[2](v13, 0, v16);

      int v17 = -23804;
    }
    else
    {
      v22 = (void *)v32[5];
      if (v22) {
        int v17 = [v22 code];
      }
      else {
        int v17 = 0;
      }
      (*((void (**)(void))self->_completionHandler + 2))();
    }

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v31, 8);
  }
  return v17;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
}

@end