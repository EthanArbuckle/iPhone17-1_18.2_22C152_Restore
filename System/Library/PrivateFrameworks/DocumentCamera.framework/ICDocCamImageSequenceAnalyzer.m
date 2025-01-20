@interface ICDocCamImageSequenceAnalyzer
- (ICDocCamImageSequenceAnalyzer)initWithOptions:(id)a3 callback:(id)a4;
- (void)addFrame:(__CVBuffer *)a3 metaData:(id)a4 frameOptions:(id)a5 rectangleRequest:(id)a6 pixelFocalLength:(float)a7 cameraIntrinsicData:(__CFData *)a8;
- (void)dealloc;
- (void)finish;
@end

@implementation ICDocCamImageSequenceAnalyzer

- (ICDocCamImageSequenceAnalyzer)initWithOptions:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICDocCamImageSequenceAnalyzer;
  v8 = [(ICDocCamImageSequenceAnalyzer *)&v32 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    frameArray = v8->_frameArray;
    v8->_frameArray = (NSMutableArray *)v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
    frameArraySem = v8->_frameArraySem;
    v8->_frameArraySem = (OS_dispatch_semaphore *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.VisionKit", v13);
    dq = v8->_dq;
    v8->_dq = (OS_dispatch_queue *)v14;

    uint64_t v16 = MEMORY[0x21D44FA30](v7);
    id callback = v8->_callback;
    v8->_id callback = (id)v16;

    v18 = (VNSequenceRequestHandler *)objc_alloc_init(MEMORY[0x263F1EFF8]);
    seqHandler = v8->_seqHandler;
    v8->_seqHandler = v18;

    uint64_t v20 = [v6 mutableCopy];
    sessionOptions = v8->_sessionOptions;
    v8->_sessionOptions = (NSDictionary *)v20;

    v22 = [(NSDictionary *)v8->_sessionOptions objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_MaxBufferQueueSize"];

    if (v22)
    {
      v23 = [(NSDictionary *)v8->_sessionOptions objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_MaxBufferQueueSize"];
      int v24 = [v23 intValue];

      dispatch_semaphore_t v25 = dispatch_semaphore_create(v24);
      queueSizeSem = v8->_queueSizeSem;
      v8->_queueSizeSem = (OS_dispatch_semaphore *)v25;
    }
    else
    {
      queueSizeSem = v8->_queueSizeSem;
      v8->_queueSizeSem = 0;
    }

    v8->_bRealTime = 0;
    v27 = [(NSDictionary *)v8->_sessionOptions objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_RealTime"];

    if (v27)
    {
      v28 = [(NSDictionary *)v8->_sessionOptions objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_RealTime"];
      v8->_bRealTime = [v28 BOOLValue];
    }
    v8->_bSynchronous = 0;
    v29 = [(NSDictionary *)v8->_sessionOptions objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Synchronous"];

    if (v29)
    {
      v30 = [(NSDictionary *)v8->_sessionOptions objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Synchronous"];
      v8->_bSynchronous = [v30 BOOLValue];
    }
    perfInit();
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ICDocCamImageSequenceAnalyzer;
  [(ICDocCamImageSequenceAnalyzer *)&v2 dealloc];
}

- (void)addFrame:(__CVBuffer *)a3 metaData:(id)a4 frameOptions:(id)a5 rectangleRequest:(id)a6 pixelFocalLength:(float)a7 cameraIntrinsicData:(__CFData *)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a5;
  v17 = objc_alloc_init(ICDocCamImageSequenceFrame);
  [(ICDocCamImageSequenceFrame *)v17 setPb:CVPixelBufferRetain(a3)];
  [(ICDocCamImageSequenceFrame *)v17 setFrameOptions:v16];

  if (!self->_bSynchronous)
  {
    queueSizeSem = self->_queueSizeSem;
    if (queueSizeSem) {
      dispatch_semaphore_wait(queueSizeSem, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameArraySem, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)self->_frameArray addObject:v17];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameArraySem);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke;
  v26[3] = &unk_2642A9A40;
  v26[4] = self;
  v29 = a8;
  float v30 = a7;
  id v19 = v15;
  id v27 = v19;
  id v20 = v14;
  id v28 = v20;
  v21 = (void (**)(void))MEMORY[0x21D44FA30](v26);
  v22 = v21;
  if (self->_bSynchronous)
  {
    v21[2](v21);
  }
  else
  {
    dq = self->_dq;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_3;
    v24[3] = &unk_2642A9530;
    dispatch_semaphore_t v25 = v21;
    dispatch_async(dq, v24);
  }
}

void __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke(uint64_t a1)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (*(unsigned char *)(v2 + 64))
  {
    v4 = [v3 lastObject];
    [*(id *)(*(void *)(a1 + 32) + 8) removeLastObject];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v98 objects:v108 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v99 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          if (v10 != v4)
          {
            CVPixelBufferRelease((CVPixelBufferRef)[v10 pb]);
            dispatch_semaphore_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 48);
            if (v11) {
              dispatch_semaphore_signal(v11);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v98 objects:v108 count:16];
      }
      while (v7);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  }
  else
  {
    v4 = [v3 firstObject];
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];
  }
  intptr_t v12 = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
  if (v4)
  {
    context = (void *)MEMORY[0x21D44F7D0](v12);
    uint64_t v13 = [v4 pb];
    if (!v13) {
      __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_cold_1();
    }
    id v14 = (__CVBuffer *)v13;
    uint64_t v15 = [v4 frameOptions];
    if (!v15) {
      goto LABEL_19;
    }
    id v16 = (void *)v15;
    v17 = [v4 frameOptions];
    v18 = [v17 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_Orientation"];

    if (v18)
    {
      id v19 = [v4 frameOptions];
      id v20 = [v19 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_Orientation"];
      uint64_t v21 = [v20 intValue];
    }
    else
    {
LABEL_19:
      uint64_t v21 = 1;
    }
    uint64_t v22 = *(void *)(a1 + 56);
    if (v22)
    {
      uint64_t v106 = *MEMORY[0x263F1F258];
      uint64_t v107 = v22;
      v23 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    }
    else
    {
      size_t Width = CVPixelBufferGetWidth(v14);
      long long v96 = 0u;
      long long v97 = 0u;
      *(_OWORD *)bytes = 0u;
      *(float *)&double v25 = (float)CVPixelBufferGetHeight(v14);
      LODWORD(v26) = *(_DWORD *)(a1 + 64);
      +[ICDocCamViewController cameraIntrinsicMatrixForWidth:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)Width)) height:v25 pixelFocalLength:v26];
      *(_DWORD *)&bytes[8] = v27;
      DWORD2(v96) = v28;
      *(void *)bytes = v29;
      *(void *)&long long v96 = v30;
      DWORD2(v97) = v31;
      *(void *)&long long v97 = v32;
      CFDataRef v33 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 48);
      uint64_t v104 = *MEMORY[0x263F1F258];
      CFDataRef v105 = v33;
      v23 = [NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    }
    v34 = (void *)[objc_alloc(MEMORY[0x263F1EF40]) initWithCVPixelBuffer:v14 orientation:v21 options:v23];
    v90 = [MEMORY[0x263EFF980] array];
    v35 = [MEMORY[0x263EFF980] array];
    uint64_t v36 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Rectangles"];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Rectangles"];
      int v39 = [v38 BOOLValue];

      if (v39)
      {
        if (*(void *)(a1 + 40)) {
          objc_msgSend(v90, "addObject:");
        }
      }
    }
    uint64_t v40 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Registration"];
    if (!v40) {
      goto LABEL_31;
    }
    v41 = (void *)v40;
    v42 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Registration"];
    int v43 = [v42 BOOLValue];

    if (!v43) {
      goto LABEL_31;
    }
    id v44 = objc_alloc(MEMORY[0x263F1F008]);
    uint64_t v45 = [v44 initWithTargetedCVPixelBuffer:v14 options:MEMORY[0x263EFFA78]];
    if (v45)
    {
      v46 = v35;
      v89 = (void *)v45;
      [v35 addObject:v45];
    }
    else
    {
LABEL_31:
      v89 = 0;
      v46 = v35;
    }
    uint64_t v47 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_SceneClassification"];
    if (v47
      && (v48 = (void *)v47,
          [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_SceneClassification"], v49 = objc_claimAutoreleasedReturnValue(), int v50 = objc_msgSend(v49, "BOOLValue"), v49, v48, v50))
    {
      id v51 = objc_alloc_init(MEMORY[0x263F1EFE0]);
      v52 = v90;
      if (v51) {
        [v90 addObject:v51];
      }
    }
    else
    {
      id v51 = 0;
      v52 = v90;
    }
    if (![v52 count]) {
      goto LABEL_64;
    }
    double v53 = timeElapsedSinceInit();
    id v94 = 0;
    int v54 = [v34 performRequests:v52 error:&v94];
    id v55 = v94;
    uint64_t v56 = [v46 count];
    if (v56 && v54)
    {
      v57 = *(void **)(*(void *)(a1 + 32) + 56);
      id v93 = v55;
      char v58 = [v57 performRequests:v46 onCVPixelBuffer:v14 error:&v93];
      id v87 = v93;

      double v59 = timeElapsedSinceInit();
      if ((v58 & 1) == 0) {
        goto LABEL_62;
      }
      double v60 = v59;
    }
    else
    {
      v61 = v34;
      v62 = v23;
      if (v56) {
        int v63 = 0;
      }
      else {
        int v63 = v54;
      }
      double v64 = timeElapsedSinceInit();
      if (v63 != 1)
      {
        id v87 = v55;
        v23 = v62;
        v34 = v61;
        v46 = v35;
        goto LABEL_62;
      }
      double v60 = v64;
      id v87 = v55;
      v23 = v62;
      v34 = v61;
      v46 = v35;
    }
    v52 = v90;
    if (!*(void *)(*(void *)(a1 + 32) + 40))
    {
LABEL_63:

LABEL_64:
      CVPixelBufferRelease(v14);

      goto LABEL_65;
    }
    v65 = [MEMORY[0x263EFF9A0] dictionary];
    v66 = [*(id *)(a1 + 40) results];
    if (v66) {
      [v65 setObject:v66 forKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Rectangles"];
    }
    v86 = v23;
    uint64_t v67 = [v89 results];
    if (v67) {
      [v65 setObject:v67 forKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Registration"];
    }
    v68 = (void *)MEMORY[0x263EFF9A0];
    v102 = @"ICDocCamImageSequenceAnalyzerResults";
    v103 = v65;
    v85 = v65;
    v69 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1, v67);
    v70 = [v68 dictionaryWithDictionary:v69];

    v71 = [v4 frameOptions];
    v72 = [v71 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_Timestamp"];

    if (v72)
    {
      v73 = [v4 frameOptions];
      [v73 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_Timestamp"];
      v75 = v74 = v34;
      [v70 setObject:v75 forKeyedSubscript:@"ICDocCamImageSequenceFrame_Timestamp"];

      v34 = v74;
    }
    v76 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Debug"];

    if (v76)
    {
      v77 = [NSNumber numberWithDouble:v60 - v53];
      [v70 setObject:v77 forKeyedSubscript:@"ICDocCamImageSequenceFrame_RequestTime"];
    }
    v78 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_SceneClassification"];

    if (v78)
    {
      v79 = [v51 results];
      [v70 setObject:v79 forKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_SceneClassification"];
    }
    uint64_t v80 = *(void *)(a1 + 48);
    if (v80) {
      [v70 setObject:v80 forKeyedSubscript:@"ICDocCamImageSequenceFrame_MetaData"];
    }
    v81 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_2;
    block[3] = &unk_2642A9360;
    block[4] = *(void *)(a1 + 32);
    id v92 = v70;
    id v82 = v70;
    dispatch_async(v81, block);

    v23 = v86;
LABEL_62:
    v52 = v90;
    goto LABEL_63;
  }
LABEL_65:
  v83 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (v83) {
    dispatch_semaphore_signal(v83);
  }
}

uint64_t __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finish
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seqHandler, 0);
  objc_storeStrong((id *)&self->_queueSizeSem, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_sessionOptions, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_frameArraySem, 0);

  objc_storeStrong((id *)&self->_frameArray, 0);
}

void __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_cold_1()
{
}

@end