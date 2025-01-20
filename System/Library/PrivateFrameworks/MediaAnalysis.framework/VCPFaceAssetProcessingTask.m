@interface VCPFaceAssetProcessingTask
+ (id)taskWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5;
- (VCPFaceAssetProcessingTask)initWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)main;
- (int)run;
@end

@implementation VCPFaceAssetProcessingTask

- (VCPFaceAssetProcessingTask)initWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (Block_layout *)a5;
  if ([v9 count])
  {
    v12 = [(VCPFaceProcessingTask *)self photoLibrary];
    v13 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v12];

    v14 = [v9 firstObject];
    v15 = [v14 photoLibrary];
    v24.receiver = self;
    v24.super_class = (Class)VCPFaceAssetProcessingTask;
    v16 = [(VCPFaceProcessingTask *)&v24 initWithPhotoLibrary:v15 andContext:v13 andCancelBlock:&stru_10021DB20];

    if (v16)
    {
      id v17 = objc_retainBlock(v10);
      id progressHandler = v16->_progressHandler;
      v16->_id progressHandler = v17;

      if (v11) {
        v19 = v11;
      }
      else {
        v19 = &stru_10021DB40;
      }
      v20 = objc_retainBlock(v19);
      id completionHandler = v16->_completionHandler;
      v16->_id completionHandler = v20;

      objc_storeStrong((id *)&v16->_assets, a3);
    }
    self = v16;

    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)taskWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithAssets:v7 andProgressHandler:v8 andCompletionHandler:v9];

  return v10;
}

- (int)main
{
  if (![(NSArray *)self->_assets count]) {
    return -50;
  }
  if (self->_progressHandler)
  {
    v22 = +[VCPProgressReporter reporterWithIntervalSeconds:1 andTotalJobCount:[(NSArray *)self->_assets count] andBlock:self->_progressHandler];
  }
  else
  {
    v22 = 0;
  }
  v4 = [(NSArray *)self->_assets firstObject];
  v5 = [v4 photoLibrary];
  -[VCPFaceProcessingTask setAllowStreaming:](self, "setAllowStreaming:", objc_msgSend(v5, "vcp_allowInMemoryDownload"));

  v6 = +[NSMutableSet set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_assets;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v10 = *(void *)v24;
  os_log_type_t type = VCPLogToOSLogType[5];
  *(void *)&long long v9 = 138412290;
  long long v20 = v9;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if ([(VCPFaceProcessingTask *)self isCancelled])
      {
        int v3 = -128;
LABEL_33:

        goto LABEL_34;
      }
      v13 = [v12 photoLibrary];
      if (objc_msgSend(v13, "mad_pauseFCPeopleFurtherProcessing"))
      {
        unsigned int v14 = [v12 faceAnalysisVersion];
        if (_os_feature_enabled_impl()) {
          int v15 = 14;
        }
        else {
          int v15 = 11;
        }
        BOOL v16 = v15 == v14;

        if (v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            id v17 = VCPLogInstance();
            if (os_log_type_enabled(v17, type))
            {
              v18 = [v12 localIdentifier];
              *(_DWORD *)buf = v20;
              v28 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, type, "[%@] already with FC version; skip", buf, 0xCu);
            }
          }
          continue;
        }
      }
      else
      {
      }
      if (objc_msgSend(v12, "vcp_needsFaceProcessing"))
      {
        [v22 increaseProcessedJobCountByOne];
        [v6 addObject:v12];
        if ((unint64_t)[v6 count] >= 0x64)
        {
          int v3 = [(VCPFaceProcessingTask *)self processAssets:v6];
          if (v3) {
            goto LABEL_33;
          }
          [v6 removeAllObjects];
        }
      }
    }
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_28:

  if ([v6 count])
  {
    int v3 = [(VCPFaceProcessingTask *)self processAssets:v6];
    if (!v3)
    {
      [v6 removeAllObjects];
      goto LABEL_31;
    }
  }
  else
  {
LABEL_31:
    int v3 = 0;
  }
LABEL_34:

  return v3;
}

- (int)run
{
  unsigned int v3 = [(VCPFaceAssetProcessingTask *)self main];
  signed int v4 = [(VCPFaceProcessingTask *)self flush] | v3;
  if (v4)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Face asset processing failed", v11, 2u);
      }
    }
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Face asset processing failed";
    id v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    long long v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v4 userInfo:v7];
    completionHandler[2](completionHandler, 0, v9);
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end