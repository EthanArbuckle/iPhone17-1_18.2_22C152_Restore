@interface HRTFEnrollmentSession
- (BOOL)_verifyCaptureDevice:(id)a3;
- (HRTFEnrollmentSession)init;
- (HRTFEnrollmentSession)initWithCameraSession:(BOOL)a3;
- (HRTFEnrollmentSessionDelegate)delegate;
- (NSDictionary)stateInfo;
- (id)getMovFileName;
- (id)getRecordingFolder;
- (id)getRecordingURL;
- (unint64_t)resultSize;
- (void)dealloc;
- (void)didReceiveVideoData:(id)a3 colorData:(id)a4 depthData:(id)a5 faceObject:(id)a6;
- (void)didStartCaptureSessionWithError:(id)a3;
- (void)downloadHRTFAsset:(unint64_t)a3 withCompletion:(id)a4;
- (void)downloadHRTFAssetV2:(unint64_t)a3 withCompletion:(id)a4;
- (void)initializeDevice;
- (void)pauseSession;
- (void)requestResultDataAtOffset:(unint64_t)a3 forLength:(unint64_t)a4 withCompletion:(id)a5;
- (void)resumeSession;
- (void)sessionStarted:(BOOL)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startSession:(BOOL)a3 then:(id)a4;
- (void)startSession:(BOOL)a3 withAssetPath:(id)a4 then:(id)a5;
- (void)stopSession:(id)a3;
- (void)updateResultSize:(unint64_t)a3;
- (void)updateState:(unint64_t)a3 withProgress:(float)a4 facePoseStatus:(id)a5 earPoseStatus:(id)a6 errorStatus:(id)a7;
@end

@implementation HRTFEnrollmentSession

- (HRTFEnrollmentSession)init
{
  v15.receiver = self;
  v15.super_class = (Class)HRTFEnrollmentSession;
  v2 = [(HRTFEnrollmentSession *)&v15 init];
  if (v2)
  {
    if (init_once != -1) {
      dispatch_once(&init_once, &__block_literal_global);
    }
    objc_storeStrong((id *)&v2->_stateInfo, (id)kHRTFIdleStateInfo);
    v2->_paused = 0;
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.HRTFEnrollmentSession", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(void *)&v2->_preferredPixelFormat = 0x6664657034323066;
    v2->_preferredColorResolution = (CGSize)xmmword_22F0FC6A0;
    v2->_preferredDepthResolution = (CGSize)xmmword_22F0FC6B0;
    recordingManager = v2->_recordingManager;
    v2->_recordingManager = 0;

    v6 = [HRTFSyncedCaptureSource alloc];
    v7 = v2->_queue;
    long long v13 = xmmword_22F0FC6C0;
    uint64_t v14 = 0x1E000000280;
    uint64_t v8 = [(HRTFSyncedCaptureSource *)v6 initWithQueue:v7 options:&v13];
    outputSource = v2->_outputSource;
    v2->_outputSource = (HRTFSyncedCaptureSource *)v8;

    [(HRTFSyncedCaptureSource *)v2->_outputSource setDelegate:v2];
    uint64_t Int64 = CFPrefs_GetInt64();
    if (Int64) {
      LOBYTE(Int64) = MGGetBoolAnswer();
    }
    v2->_videoCaptureEnabled = Int64;
    assetDownloadPath = v2->_assetDownloadPath;
    v2->_assetDownloadPath = 0;

    [(HRTFEnrollmentSession *)v2 initializeDevice];
  }
  return v2;
}

void __29__HRTFEnrollmentSession_init__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = kHRTFStateInfoStateKey;
  v2[1] = kHRTFStateInfoProgressKey;
  v3[0] = &unk_26E28B6C8;
  v3[1] = &unk_26E28B6E0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)kHRTFIdleStateInfo;
  kHRTFIdleStateInfo = v0;
}

- (HRTFEnrollmentSession)initWithCameraSession:(BOOL)a3
{
  if (a3)
  {
    dispatch_queue_t v3 = [(HRTFEnrollmentSession *)self init];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HRTFEnrollmentSession;
    dispatch_queue_t v3 = [(HRTFEnrollmentSession *)&v8 init];
    if (v3)
    {
      if (initWithCameraSession__once != -1) {
        dispatch_once(&initWithCameraSession__once, &__block_literal_global_39);
      }
      objc_storeStrong((id *)&v3->_stateInfo, (id)kHRTFIdleStateInfo);
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.HRTFEnrollmentSession", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;
    }
  }
  v6 = v3;

  return v6;
}

void __47__HRTFEnrollmentSession_initWithCameraSession___block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = kHRTFStateInfoStateKey;
  v2[1] = kHRTFStateInfoProgressKey;
  v3[0] = &unk_26E28B6C8;
  v3[1] = &unk_26E28B6E0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)kHRTFIdleStateInfo;
  kHRTFIdleStateInfo = v0;
}

- (void)initializeDevice
{
  v22[1] = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = (void *)MEMORY[0x263EFA5A8];
  v22[0] = *MEMORY[0x263EF9658];
  dispatch_queue_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v5 = [v3 discoverySessionWithDeviceTypes:v4 mediaType:*MEMORY[0x263EF9D48] position:2];

  v6 = [v5 devices];
  v7 = v6;
  if ((!v6 || ![v6 count]) && os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    -[HRTFSyncedCaptureSource _initialize]();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v8 = v7;
  uint64_t v9 = [(AVCaptureDevice *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  v10 = v8;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      if (-[HRTFEnrollmentSession _verifyCaptureDevice:](self, "_verifyCaptureDevice:", v14, (void)v17)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(AVCaptureDevice *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_7;
        }
        v10 = v8;
        goto LABEL_16;
      }
    }
    objc_super v15 = v14;

    if (!v15) {
      goto LABEL_17;
    }
    device = self->_device;
    self->_device = v15;
    v10 = v15;
  }
LABEL_16:

LABEL_17:
}

- (BOOL)_verifyCaptureDevice:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v5 = [v4 formats];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v52 = v4;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v58;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8 * v11);
        uint64_t v13 = [v12 supportedDepthDataFormats];
        uint64_t v14 = [v13 count];

        if (v14)
        {
          objc_super v15 = (const opaqueCMFormatDescription *)[v12 formatDescription];
          if (CMFormatDescriptionGetMediaSubType(v15) == self->_preferredPixelFormat)
          {
            CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v15);
            double width = (double)Dimensions.width;
            if (self->_preferredColorResolution.width >= (double)Dimensions.width)
            {
              double height = (double)Dimensions.height;
              unint64_t v19 = Dimensions.width * Dimensions.height;
              if (self->_preferredColorResolution.height >= (double)Dimensions.height
                && Dimensions.width * Dimensions.height > v8)
              {
                id v21 = v12;

                if (self->_preferredColorResolution.width == width)
                {
                  unint64_t v8 = v19;
                  uint64_t v9 = v21;
                  if (self->_preferredColorResolution.height == height) {
                    goto LABEL_20;
                  }
                }
                else
                {
                  unint64_t v8 = v19;
                  uint64_t v9 = v21;
                }
              }
            }
          }
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v22 = [v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
      uint64_t v7 = v22;
      id v21 = v9;
    }
    while (v22);
LABEL_20:

    id v4 = v52;
    if (v21)
    {
      objc_storeStrong((id *)&self->_finalColorFormat, v21);
      v23 = (void *)HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        finalColorFormat = self->_finalColorFormat;
        v25 = v23;
        id v26 = [(AVCaptureDeviceFormat *)finalColorFormat description];
        uint64_t v27 = [v26 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v63 = v27;
        _os_log_impl(&dword_22F0F1000, v25, OS_LOG_TYPE_DEFAULT, "capture device color format: %s", buf, 0xCu);
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v28 = [v21 supportedDepthDataFormats];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        v31 = 0;
        unint64_t v32 = 0;
        uint64_t v33 = *(void *)v54;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v28);
            }
            v35 = *(void **)(*((void *)&v53 + 1) + 8 * v34);
            v36 = (const opaqueCMFormatDescription *)[v35 formatDescription];
            if (CMFormatDescriptionGetMediaSubType(v36) == self->_preferredDepthFormat)
            {
              CMVideoDimensions v37 = CMVideoFormatDescriptionGetDimensions(v36);
              double v38 = (double)v37.width;
              if (self->_preferredDepthResolution.width >= (double)v37.width)
              {
                double v39 = (double)v37.height;
                unint64_t v40 = v37.width * v37.height;
                if (self->_preferredDepthResolution.height >= (double)v37.height && v37.width * v37.height > v32)
                {
                  id v42 = v35;

                  if (self->_preferredDepthResolution.width == v38)
                  {
                    unint64_t v32 = v40;
                    v31 = v42;
                    if (self->_preferredDepthResolution.height == v39) {
                      goto LABEL_41;
                    }
                  }
                  else
                  {
                    unint64_t v32 = v40;
                    v31 = v42;
                  }
                }
              }
            }
            ++v34;
          }
          while (v30 != v34);
          uint64_t v43 = [v28 countByEnumeratingWithState:&v53 objects:v61 count:16];
          uint64_t v30 = v43;
          id v42 = v31;
        }
        while (v43);
LABEL_41:

        id v4 = v52;
        if (v42)
        {
          p_finalDepthFormat = &self->_finalDepthFormat;
          objc_storeStrong((id *)p_finalDepthFormat, v42);
          v45 = (void *)HRTFEnrollmentLog;
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
          {
            v46 = *p_finalDepthFormat;
            v47 = v45;
            id v48 = [(AVCaptureDeviceFormat *)v46 description];
            uint64_t v49 = [v48 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v63 = v49;
            _os_log_impl(&dword_22F0F1000, v47, OS_LOG_TYPE_DEFAULT, "capture device depth format: %s", buf, 0xCu);
          }
          BOOL v50 = 1;
LABEL_53:

          goto LABEL_54;
        }
      }
      else
      {
      }
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
        -[HRTFSyncedCaptureSource _verifyCaptureDevice:]();
      }
      BOOL v50 = 0;
      goto LABEL_53;
    }
  }
  else
  {
  }
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    -[HRTFSyncedCaptureSource _verifyCaptureDevice:]();
  }
  BOOL v50 = 0;
LABEL_54:

  return v50;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HRTFEnrollmentSession;
  [(HRTFEnrollmentSession *)&v5 dealloc];
}

- (void)pauseSession
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HRTFEnrollmentSession_pauseSession__block_invoke;
  block[3] = &unk_2649FC810;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__HRTFEnrollmentSession_pauseSession__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 1;
  v1 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22F0F1000, v1, OS_LOG_TYPE_DEFAULT, "session paused", v2, 2u);
  }
}

- (void)resumeSession
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HRTFEnrollmentSession_resumeSession__block_invoke;
  block[3] = &unk_2649FC810;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __38__HRTFEnrollmentSession_resumeSession__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
  v1 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22F0F1000, v1, OS_LOG_TYPE_DEFAULT, "session resumed", v2, 2u);
  }
}

- (id)getMovFileName
{
  v2 = objc_opt_new();
  [v2 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
  dispatch_queue_t v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

- (id)getRecordingFolder
{
  dispatch_queue_t v3 = NSString;
  id v4 = NSTemporaryDirectory();
  objc_super v5 = [v3 stringWithFormat:@"%@/testHRTF", v4];

  uint64_t v6 = [NSURL fileURLWithPath:v5];
  uint64_t v7 = NSString;
  unint64_t v8 = [(HRTFEnrollmentSession *)self getMovFileName];
  uint64_t v9 = [v7 stringWithFormat:@"HRTFEnrollmentRecordings/%@", v8];

  uint64_t v10 = [v6 URLByAppendingPathComponent:v9];
  uint64_t v11 = [v10 path];

  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  char v13 = [v12 fileExistsAtPath:v11];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
    [v14 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
  }
  NSLog(&cfstr_Hrtfenrollment_1.isa, v11);
  id v15 = v11;

  return v15;
}

- (id)getRecordingURL
{
  dispatch_queue_t v3 = [(HRTFEnrollmentSession *)self getMovFileName];
  id v4 = [(HRTFEnrollmentSession *)self getRecordingFolder];
  if (!v4)
  {
    id v4 = NSTemporaryDirectory();
  }
  objc_super v5 = [NSString stringWithFormat:@"%@/%@.MOV", v4, v3];
  NSLog(&cfstr_Hrtfenrollment_2.isa, v5);
  uint64_t v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (void)startSession:(BOOL)a3 withAssetPath:(id)a4 then:(id)a5
{
  objc_storeStrong((id *)&self->_assetDownloadPath, a4);
  id v7 = a4;
  NSLog(&cfstr_StartsessionWi.isa, self->_assetDownloadPath);

  [(HRTFEnrollmentSession *)self startSession:1 then:&__block_literal_global_75];
}

void __57__HRTFEnrollmentSession_startSession_withAssetPath_then___block_invoke()
{
}

- (void)startSession:(BOOL)a3 then:(id)a4
{
  id v6 = a4;
  if (self->_videoCaptureEnabled)
  {
    id v7 = [(HRTFEnrollmentSession *)self getRecordingURL];
    unint64_t v8 = [v7 absoluteString];
    NSLog(&cfstr_HrtfappHrtfman.isa, v8);

    uint64_t v9 = objc_opt_new();
    uint64_t v10 = NSString;
    uint64_t v11 = [v9 framework];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"version"];
    char v13 = [v10 stringWithFormat:@"HRTFEnrollment-Visage-%@", v12];

    uint64_t v14 = [[RecordingManager alloc] initWithFileURL:v7 expectedFrameRate:@"AVCaptureDeviceTypeBuiltInWideAngleCamera.2" colorStreamId:@"AVCaptureDeviceTypeBuiltInTrueDepthCamera.2" depthStreamId:v13 appName:30.0];
    recordingManager = self->_recordingManager;
    self->_recordingManager = v14;

    [(RecordingManager *)self->_recordingManager setDelegate:self];
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke;
  block[3] = &unk_2649FC880;
  block[4] = self;
  id v17 = v6;
  BOOL v21 = a3;
  id v19 = v17;
  long long v20 = &v22;
  dispatch_sync(queue, block);
  if (v17 && *((unsigned char *)v23 + 24)) {
    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }

  _Block_object_dispose(&v22, 8);
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.HRTFEnrollmentService"];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    objc_super v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E28E6E0];
    [*(id *)(*(void *)(a1 + 32) + 32) setRemoteObjectInterface:v5];

    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E28D148];
    [*(id *)(*(void *)(a1 + 32) + 32) setExportedInterface:v6];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_2;
    v17[3] = &unk_2649FC858;
    objc_copyWeak(&v18, &location);
    [v7 setInterruptionHandler:v17];
    unint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_179;
    v15[3] = &unk_2649FC858;
    objc_copyWeak(&v16, &location);
    [v8 setInvalidationHandler:v15];
    [*(id *)(*(void *)(a1 + 32) + 32) resume];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 32);
    if (*(void *)(v9 + 152))
    {
      uint64_t v11 = [v10 remoteObjectProxy];
      [v11 startSessionWithTerminationCallback:*(void *)(*(void *)(a1 + 32) + 152) withCallback:&__block_literal_global_182];
    }
    else
    {
      uint64_t v11 = [v10 remoteObjectProxy];
      [v11 startSessionWithTerminationCallback:&__block_literal_global_185];
    }

    uint64_t v12 = MEMORY[0x230FB1110](*(void *)(a1 + 40));
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v12;

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(*(void *)(a1 + 32) + 16) & 0xFE | *(unsigned char *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 16) |= 1u;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[6];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_177;
    block[3] = &unk_2649FC810;
    id v6 = WeakRetained;
    dispatch_async(v4, block);
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_177(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    id v3 = (id)[v2 initWithDomain:kHRTFEnrollmentErrorDomain code:1 userInfo:0];
    [*(id *)(a1 + 32) updateState:5 withProgress:0 facePoseStatus:0 earPoseStatus:v3 errorStatus:0.0];
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_179(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[6];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_3;
    block[3] = &unk_2649FC810;
    objc_super v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_FAULT)) {
      __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1();
    }
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    id v3 = (void *)[v2 initWithDomain:kHRTFEnrollmentErrorDomain code:1 userInfo:0];
    [*(id *)(a1 + 32) updateState:5 withProgress:0 facePoseStatus:0 earPoseStatus:v3 errorStatus:0.0];
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_180()
{
  uint64_t v0 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22F0F1000, v0, OS_LOG_TYPE_DEFAULT, "session terminated", v1, 2u);
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_183()
{
  uint64_t v0 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22F0F1000, v0, OS_LOG_TYPE_DEFAULT, "session terminated", v1, 2u);
  }
}

- (void)downloadHRTFAssetV2:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke;
  v9[3] = &unk_2649FC8F8;
  v9[4] = self;
  unint64_t v12 = a3;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v13;
  dispatch_async(queue, v9);
  if (v8 && *((unsigned char *)v14 + 24)) {
    (*((void (**)(id, void, void, void, void))v8 + 2))(v8, 0, 0, 0, 0);
  }

  _Block_object_dispose(&v13, 8);
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.HRTFEnrollmentService"];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    objc_super v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E28E6E0];
    [*(id *)(*(void *)(a1 + 32) + 32) setRemoteObjectInterface:v5];

    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E28D148];
    [*(id *)(*(void *)(a1 + 32) + 32) setExportedInterface:v6];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:&__block_literal_global_187];
    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_188;
    v13[3] = &unk_2649FC858;
    objc_copyWeak(&v14, &location);
    [v7 setInvalidationHandler:v13];
    [*(id *)(*(void *)(a1 + 32) + 32) resume];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_192;
    v10[3] = &unk_2649FC8D0;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 40);
    [v8 downloadAssetV2:v9 withCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1();
  }
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_188(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    dispatch_async(WeakRetained[6], &__block_literal_global_191);
    WeakRetained = v2;
  }
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2_189()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_FAULT)) {
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1();
  }
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_192(uint64_t a1, char a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = WeakRetained[6];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2_193;
    block[3] = &unk_2649FC8A8;
    char v19 = a2;
    id v15 = v9;
    id v16 = v10;
    uint64_t v18 = a5;
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v13, block);
  }
}

uint64_t __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2_193(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v6 = *(void *)(a1 + 56) - 1;
    if (v6 > 3) {
      id v7 = "Unknown";
    }
    else {
      id v7 = off_2649FCA80[v6];
    }
    v9[0] = 67109890;
    v9[1] = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2080;
    id v15 = v7;
    _os_log_impl(&dword_22F0F1000, v2, OS_LOG_TYPE_DEFAULT, "isDownloaded %d status %@ error %@ result %s", (uint8_t *)v9, 0x26u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56));
  }
  return result;
}

- (void)downloadHRTFAsset:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke;
  v9[3] = &unk_2649FC8F8;
  v9[4] = self;
  unint64_t v12 = a3;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v13;
  dispatch_async(queue, v9);
  if (v8 && *((unsigned char *)v14 + 24)) {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
  }

  _Block_object_dispose(&v13, 8);
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.HRTFEnrollmentService"];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E28E6E0];
    [*(id *)(*(void *)(a1 + 32) + 32) setRemoteObjectInterface:v5];

    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E28D148];
    [*(id *)(*(void *)(a1 + 32) + 32) setExportedInterface:v6];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:&__block_literal_global_196];
    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_197;
    v13[3] = &unk_2649FC858;
    objc_copyWeak(&v14, &location);
    [v7 setInvalidationHandler:v13];
    [*(id *)(*(void *)(a1 + 32) + 32) resume];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_201;
    v10[3] = &unk_2649FC948;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 40);
    [v8 downloadAsset:v9 withCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1();
  }
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_197(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    dispatch_async(WeakRetained[6], &__block_literal_global_200);
    WeakRetained = v2;
  }
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2_198()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_FAULT)) {
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1();
  }
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_201(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained[6];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2_202;
    v12[3] = &unk_2649FC920;
    char v16 = a2;
    id v13 = v7;
    id v14 = v8;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(v11, v12);
  }
}

uint64_t __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2_202(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_22F0F1000, v2, OS_LOG_TYPE_DEFAULT, "isDownloaded %d status %@ error %@", (uint8_t *)v7, 0x1Cu);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)stopSession:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F0F1000, v5, OS_LOG_TYPE_DEFAULT, "session stopped, recordingManager", buf, 2u);
  }
  if (self->_videoCaptureEnabled)
  {
    recordingManager = self->_recordingManager;
    if (recordingManager) {
      [(RecordingManager *)recordingManager stopRecording];
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HRTFEnrollmentSession_stopSession___block_invoke;
  block[3] = &unk_2649FC998;
  void block[4] = self;
  uint64_t v11 = &v13;
  __int16 v8 = (void (**)(void))v4;
  id v10 = v8;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v14 + 24)) {
    v8[2](v8);
  }

  _Block_object_dispose(&v13, 8);
}

void __37__HRTFEnrollmentSession_stopSession___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 40) stopCaptureSession];
  *(unsigned char *)(a1[4] + 16) &= ~1u;
  uint64_t v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
    int v3 = [v2 remoteObjectProxy];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37__HRTFEnrollmentSession_stopSession___block_invoke_2;
    v5[3] = &unk_2649FC970;
    id v4 = (void *)a1[5];
    v5[4] = a1[4];
    id v6 = v4;
    [v3 stopSession:v5];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __37__HRTFEnrollmentSession_stopSession___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F0F1000, v2, OS_LOG_TYPE_DEFAULT, "session stopped, invalidating connection", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HRTFEnrollmentSession_stopSession___block_invoke_204;
  block[3] = &unk_2649FC810;
  void block[4] = v3;
  dispatch_sync(v4, block);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __37__HRTFEnrollmentSession_stopSession___block_invoke_204(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) &= ~1u;
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  id v4 = (void *)kHRTFIdleStateInfo;
  uint64_t v5 = (id *)(*(void *)(a1 + 32) + 8);
  objc_storeStrong(v5, v4);
}

- (void)sessionStarted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__205;
  BOOL v21 = __Block_byref_object_dispose__206;
  id v22 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke;
  block[3] = &unk_2649FC9C0;
  id v14 = &v17;
  uint64_t v15 = &v23;
  void block[4] = self;
  BOOL v16 = v4;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(queue, block);
  uint64_t v9 = v18[5];
  if (v9) {
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, v4);
  }
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 didReceiveStateUpdateForSession:self stateInfo:v24[5]];
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x230FB1110](*(void *)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;

  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 16))
    {
      *(unsigned char *)(v7 + 16) |= 1u;
      uint64_t v12 = HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_22F0F1000, v12, OS_LOG_TYPE_DEFAULT, "session started", v13, 2u);
      }
      [*(id *)(*(void *)(a1 + 32) + 40) startCaptureSession];
    }
    else
    {
      id v8 = HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_22F0F1000, v8, OS_LOG_TYPE_DEFAULT, "session stop requested before started", v13, 2u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
      __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke_cold_1();
    }
    v14[0] = kHRTFStateInfoStateKey;
    v14[1] = kHRTFStateInfoProgressKey;
    v15[0] = &unk_26E28B6F8;
    v15[1] = &unk_26E28B6E0;
    v14[2] = kHRTFStateInfoErrorInfoKey;
    v15[2] = *(void *)(a1 + 40);
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)requestResultDataAtOffset:(unint64_t)a3 forLength:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke;
  block[3] = &unk_2649FC9E8;
  void block[4] = self;
  id v13 = &v16;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  id v10 = v8;
  id v12 = v10;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v17 + 24)) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }

  _Block_object_dispose(&v16, 8);
}

void __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
    id v3 = [v2 remoteObjectProxy];
    [v3 requestDataWithOffset:a1[7] length:a1[8] withCompletion:a1[5]];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
      __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)updateState:(unint64_t)a3 withProgress:(float)a4 facePoseStatus:(id)a5 earPoseStatus:(id)a6 errorStatus:(id)a7
{
  v33[2] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_alloc(MEMORY[0x263EFF9A0]);
  v32[0] = kHRTFStateInfoStateKey;
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
  v32[1] = kHRTFStateInfoProgressKey;
  v33[0] = v16;
  *(float *)&double v17 = a4;
  uint64_t v18 = [NSNumber numberWithFloat:v17];
  v33[1] = v18;
  char v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  long long v20 = (void *)[v15 initWithDictionary:v19];

  if (a3 == 5)
  {
    uint64_t v21 = kHRTFStateInfoErrorInfoKey;
    id v22 = v20;
    id v23 = v14;
LABEL_8:
    [v22 setObject:v23 forKeyedSubscript:v21];
    goto LABEL_9;
  }
  if (a3 - 1 <= 1)
  {
    if (v12) {
      [v20 setObject:v12 forKeyedSubscript:kHRTFStateInfoFacePoseStatusKey];
    }
    if (v13)
    {
      uint64_t v24 = [v13 leftStatus];
      [v20 setObject:v24 forKeyedSubscript:kHRTFStateInfoLeftEarPoseStatusKey];

      uint64_t v25 = [v13 rightStatus];
      [v20 setObject:v25 forKeyedSubscript:kHRTFStateInfoRightEarPoseStatusKey];

      uint64_t v21 = kHRTFStateInfoEarPoseStatusKey;
      id v22 = v20;
      id v23 = v13;
      goto LABEL_8;
    }
  }
LABEL_9:
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__HRTFEnrollmentSession_updateState_withProgress_facePoseStatus_earPoseStatus_errorStatus___block_invoke;
  block[3] = &unk_2649FCA10;
  void block[4] = self;
  id v27 = v20;
  id v31 = v27;
  dispatch_async(queue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    [v29 didReceiveStateUpdateForSession:self stateInfo:v27];
  }
}

void __91__HRTFEnrollmentSession_updateState_withProgress_facePoseStatus_earPoseStatus_errorStatus___block_invoke(uint64_t a1)
{
}

- (void)updateResultSize:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__HRTFEnrollmentSession_updateResultSize___block_invoke;
  v6[3] = &unk_2649FCA38;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(queue, v6);
  uint64_t v5 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a3;
    _os_log_impl(&dword_22F0F1000, v5, OS_LOG_TYPE_DEFAULT, "result data has a size of %lu", buf, 0xCu);
  }
}

uint64_t __42__HRTFEnrollmentSession_updateResultSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = *(void *)(result + 40);
  return result;
}

- (void)didStartCaptureSessionWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HRTFEnrollmentSession_didStartCaptureSessionWithError___block_invoke;
  block[3] = &unk_2649FCA60;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __57__HRTFEnrollmentSession_didStartCaptureSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = HRTFEnrollmentLog;
  BOOL v4 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_22F0F1000, v3, OS_LOG_TYPE_DEFAULT, "Failed to start AVCaptureSession with error:%@", (uint8_t *)&v8, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v7 = WeakRetained;
    if (WeakRetained)
    {
      if (WeakRetained[16]) {
        [WeakRetained updateState:5 withProgress:0 facePoseStatus:0 earPoseStatus:*(void *)(a1 + 32) errorStatus:0.0];
      }
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_22F0F1000, v3, OS_LOG_TYPE_DEFAULT, "AVCaptureSession started\n", (uint8_t *)&v8, 2u);
  }
}

- (void)didReceiveVideoData:(id)a3 colorData:(id)a4 depthData:(id)a5 faceObject:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEBUG)) {
    -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.6();
  }
  id v14 = (opaqueCMSampleBuffer *)[v11 sampleBuffer];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v14);
  if (ImageBuffer)
  {
    CVImageBufferRef v16 = ImageBuffer;
    id v56 = v10;
    id v17 = [v12 depthData];
    uint64_t v18 = [v17 depthDataMap];
    if (!v18)
    {
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
        -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:]();
      }
      goto LABEL_37;
    }
    uint64_t v19 = v18;
    long long v20 = [v17 cameraCalibrationData];
    if (!v20)
    {
      id v10 = v56;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
        -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:]();
      }
      goto LABEL_36;
    }
    uint64_t v21 = CMGetAttachment(v14, (CFStringRef)*MEMORY[0x263F01028], 0);
    id v22 = v21;
    if (!v21)
    {
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
        -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.4();
      }
      goto LABEL_35;
    }
    long long v23 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    long long v60 = *MEMORY[0x263EF89A0];
    long long v61 = v23;
    *(_OWORD *)v62 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    id v52 = v21;
    [v21 getBytes:&v60 length:48];
    memset(&v59, 0, sizeof(v59));
    if (v11) {
      [v11 timestamp];
    }
    CMTime time = v59;
    double Seconds = CMTimeGetSeconds(&time);
    if (!self->_videoCaptureEnabled || !self->_recordingManager)
    {
LABEL_25:
      [v20 intrinsicMatrix];
      double v54 = v30;
      double v50 = v32;
      double v51 = v31;
      [v20 intrinsicMatrixReferenceDimensions];
      double v34 = v33;
      double v36 = v35;
      [v20 lensDistortionCenter];
      uint64_t v38 = v37;
      uint64_t v40 = v39;
      v41 = [HRTFSerializableCaptureData alloc];
      id v42 = [v20 lensDistortionLookupTable];
      long long v55 = -[HRTFSerializableCaptureData initWithColorPixelBuffer:depthPixelBuffer:colorIntrinsics:depthIntrinsics:distortionLookupTable:referenceDimensions:distortionCenter:timestamp:](v41, "initWithColorPixelBuffer:depthPixelBuffer:colorIntrinsics:depthIntrinsics:distortionLookupTable:referenceDimensions:distortionCenter:timestamp:", v16, v19, v42, *(double *)&v60, *(double *)&v61, v62[0], v54, v51, v50, v34, v36, v38, v40, *(void *)&Seconds);

      if (v13) {
        uint64_t v43 = [[HRTFSerializableFaceData alloc] initWithFaceObject:v13];
      }
      else {
        uint64_t v43 = 0;
      }
      if (!self->_paused)
      {
        v44 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
        [v44 processCaptureData:v55 withFaceData:v43];
      }
      if (*(unsigned char *)&self->_flags)
      {
        v45 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:v16];
        v46 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:v19];
        p_delegate = &self->_delegate;
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

        if (WeakRetained)
        {
          id v49 = objc_loadWeakRetained((id *)p_delegate);
          [v49 didReceiveCaptureVideo:v56 colorImage:v45 depthImage:v46 faceObject:v13];
        }
      }

      id v22 = v52;
LABEL_35:

      id v10 = v56;
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    long long v53 = CMGetAttachment((CMAttachmentBearerRef)[v11 sampleBuffer], @"{Exif}", 0);
    uint64_t v25 = [v53 valueForKey:@"ExposureTime"];
    id v26 = v25;
    if (v25)
    {
      [v25 doubleValue];
    }
    else
    {
      device = self->_device;
      if (!device)
      {
        double v29 = 0.0;
        if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
          -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.5();
        }
        goto LABEL_24;
      }
      memset(&time, 0, sizeof(time));
      [(AVCaptureDevice *)device exposureDuration];
      CMTime v57 = time;
      double v27 = CMTimeGetSeconds(&v57);
    }
    double v29 = v27;
LABEL_24:
    -[RecordingManager process:depthFrame:faceObject:timestamp:intrinsics:calibration:exposureTime:](self->_recordingManager, "process:depthFrame:faceObject:timestamp:intrinsics:calibration:exposureTime:", v16, v19, v13, v20, Seconds, *(double *)&v60, *(double *)&v61, v62[0], v29);

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:]();
  }
LABEL_38:
}

- (NSDictionary)stateInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)resultSize
{
  return self->_resultSize;
}

- (HRTFEnrollmentSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRTFEnrollmentSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetDownloadPath, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_finalDepthFormat, 0);
  objc_storeStrong((id *)&self->_finalColorFormat, 0);
  objc_storeStrong((id *)&self->_colorDataOutput, 0);
  objc_storeStrong((id *)&self->_recordingManager, 0);
  objc_storeStrong(&self->_sessionStartCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_outputSource, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_stateInfo, 0);
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "service connection interrupted", v2, v3, v4, v5, v6);
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_22F0F1000, v0, v1, "service connection invalidated", v2, v3, v4, v5, v6);
}

void __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "session failed to start", v2, v3, v4, v5, v6);
}

void __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "attempting to retrieve result data without an active session", v2, v3, v4, v5, v6);
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "color data is absent", v2, v3, v4, v5, v6);
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "depth data is absent", v2, v3, v4, v5, v6);
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "lense calibration data is absent", v2, v3, v4, v5, v6);
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "color instrinsics data is absent", v2, v3, v4, v5, v6);
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "cannot retrieve exposure time", v2, v3, v4, v5, v6);
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.6()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22F0F1000, v0, OS_LOG_TYPE_DEBUG, "video frame arrived", v1, 2u);
}

@end