@interface VCPHomeKitAnalysisServiceTask
+ (BOOL)isPerFrameAnalysisEnabled;
+ (id)taskForFragmentData:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (id)taskForFragmentSurface:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)autoCancellable;
- (VCPHomeKitAnalysisServiceTask)init;
- (VCPHomeKitAnalysisServiceTask)initWithFragmentData:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (VCPHomeKitAnalysisServiceTask)initWithFragmentSurface:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)runFragmentLevelAnalysis;
- (void)runFrameLevelAnalysis;
@end

@implementation VCPHomeKitAnalysisServiceTask

+ (BOOL)isPerFrameAnalysisEnabled
{
  return 0;
}

- (VCPHomeKitAnalysisServiceTask)init
{
  return 0;
}

- (VCPHomeKitAnalysisServiceTask)initWithFragmentData:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v29.receiver = self;
  v29.super_class = (Class)VCPHomeKitAnalysisServiceTask;
  v15 = [(VCPHomeKitAnalysisServiceTask *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fragmentData, a3);
    *(_WORD *)&v16->_cancel = 0;
    v16->_requestID = -1;
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &stru_10021A1C8;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v14) {
      v20 = v14;
    }
    else {
      v20 = &stru_10021A208;
    }
    v21 = objc_retainBlock(v20);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v21;

    objc_storeStrong((id *)&v16->_properties, a4);
    v23 = (HMIAnalysisService *)objc_alloc_init((Class)sub_10001DD64());
    analysisService = v16->_analysisService;
    v16->_analysisService = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.mediaanalysisd.homekittaskmanagment", 0);
    managementQueue = v16->_managementQueue;
    v16->_managementQueue = (OS_dispatch_queue *)v25;

    v27 = v16;
  }

  return v16;
}

- (VCPHomeKitAnalysisServiceTask)initWithFragmentSurface:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v29.receiver = self;
  v29.super_class = (Class)VCPHomeKitAnalysisServiceTask;
  v15 = [(VCPHomeKitAnalysisServiceTask *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fragmentSurface, a3);
    *(_WORD *)&v16->_cancel = 0;
    v16->_requestID = -1;
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &stru_10021A228;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v14) {
      v20 = v14;
    }
    else {
      v20 = &stru_10021A248;
    }
    v21 = objc_retainBlock(v20);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v21;

    objc_storeStrong((id *)&v16->_properties, a4);
    v23 = (HMIAnalysisService *)objc_alloc_init((Class)sub_10001DD64());
    analysisService = v16->_analysisService;
    v16->_analysisService = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.mediaanalysisd.homekittaskmanagment", 0);
    managementQueue = v16->_managementQueue;
    v16->_managementQueue = (OS_dispatch_queue *)v25;

    v27 = v16;
  }

  return v16;
}

+ (id)taskForFragmentData:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9) {
    id v13 = [objc_alloc((Class)objc_opt_class()) initWithFragmentData:v9 properties:v10 progressHandler:v11 completionHandler:v12];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)taskForFragmentSurface:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9) {
    id v13 = [objc_alloc((Class)objc_opt_class()) initWithFragmentSurface:v9 properties:v10 progressHandler:v11 completionHandler:v12];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (float)resourceRequirement
{
  return 0.25;
}

- (void)cancel
{
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E1D4;
  block[3] = &unk_100219FC8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

- (void)runFragmentLevelAnalysis
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_10001E390;
  id v9 = sub_10001E3A0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  managementQueue = self->_managementQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E3A8;
  v4[3] = &unk_100219F08;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(managementQueue, v4);
  dispatch_semaphore_wait((dispatch_semaphore_t)v6[5], 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v5, 8);
}

- (void)runFrameLevelAnalysis
{
  id progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](0.0);
  }
  CFStringRef v37 = kCVPixelBufferPixelFormatTypeKey;
  v38 = &off_10022D960;
  v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, context);
  v18 = +[VCPInMemoryAVAsset assetWithData:self->_fragmentData];
  v19 = objc_msgSend(v18, "vcp_firstEnabledTrackWithMediaType:", AVMediaTypeVideo);
  v4 = +[AVAssetReader assetReaderWithAsset:v18 error:0];
  uint64_t v5 = +[AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:v19 outputSettings:v20];
  if (([v4 canAddOutput:v5] & 1) != 0
    && ([v4 addOutput:v5], objc_msgSend(v4, "startReading")))
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_10001E390;
    v35 = sub_10001E3A0;
    id v36 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    while (1)
    {
      CMSampleBufferRef sbuf = (CMSampleBufferRef)[v5 copyNextSampleBuffer];
      if (!sbuf) {
        break;
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001EB3C;
      v22[3] = &unk_10021A298;
      v24 = &v27;
      dispatch_queue_t v25 = &v31;
      v6 = v21;
      v23 = v6;
      uint64_t v7 = objc_retainBlock(v22);
      self->_requestID = [(HMIAnalysisService *)self->_analysisService requestAnalysisForPixelBuffer:CMSampleBufferGetImageBuffer(sbuf) withProperties:self->_properties andCompletionHandler:v7];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v8 = *((unsigned char *)v28 + 24) == 0;

      if (!v8) {
        break;
      }
      sub_100004484((const void **)&sbuf);
    }
    sub_100004484((const void **)&sbuf);
    dispatch_semaphore_t v10 = +[NSDictionary dictionaryWithObject:v32[5] forKey:@"frameResults"];
    if ([v4 status] == (id)2)
    {
      id v11 = (void (**)(double))self->_progressHandler;
      if (v11) {
        v11[2](100.0);
      }
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      if (*((unsigned char *)v28 + 24))
      {
        id v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:0];
        completionHandler[2](completionHandler, 0, v13);
      }
      else
      {
        ((void (**)(id, void *, void *))completionHandler)[2](self->_completionHandler, v10, 0);
      }
      int v9 = 0;
    }
    else
    {
      int v9 = -18;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    int v9 = -19;
  }

  if (v9)
  {
    v14 = (void (**)(id, void, void *))self->_completionHandler;
    v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:0];
    v14[2](v14, 0, v15);
  }
}

- (int)run
{
  if ([(id)objc_opt_class() isPerFrameAnalysisEnabled]) {
    [(VCPHomeKitAnalysisServiceTask *)self runFrameLevelAnalysis];
  }
  else {
    [(VCPHomeKitAnalysisServiceTask *)self runFragmentLevelAnalysis];
  }
  return 0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_analysisService, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_fragmentSurface, 0);
  objc_storeStrong((id *)&self->_fragmentData, 0);
}

@end