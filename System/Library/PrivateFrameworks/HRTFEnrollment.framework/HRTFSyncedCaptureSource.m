@interface HRTFSyncedCaptureSource
- (BOOL)_configureVideoOutputsForDevice:(id)a3 inSession:(id)a4;
- (BOOL)_initialize;
- (BOOL)_verifyCaptureDevice:(id)a3;
- (HRTFSyncedCaptureSource)initWithQueue:(id)a3 options:(id *)a4;
- (HRTFSyncedCaptureSourceDelegate)delegate;
- (void)_handleCaptureSessionNotification:(id)a3;
- (void)_initialize;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startCaptureSession;
- (void)stopCaptureSession;
@end

@implementation HRTFSyncedCaptureSource

- (BOOL)_verifyCaptureDevice:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v5 = [v4 formats];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (!v6)
  {

    goto LABEL_48;
  }
  uint64_t v7 = v6;
  id v47 = v4;
  unint64_t v8 = 0;
  v49 = 0;
  uint64_t v9 = *(void *)v56;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v56 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      v12 = [v11 supportedDepthDataFormats];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        v14 = (const opaqueCMFormatDescription *)[v11 formatDescription];
        if (CMFormatDescriptionGetMediaSubType(v14) == self->_preferredPixelFormat)
        {
          unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v14);
          CMVideoDimensions v16 = (CMVideoDimensions)Dimensions;
          if (self->_preferredColorResolutionX >= Dimensions)
          {
            unint64_t v17 = HIDWORD(Dimensions);
            if (self->_preferredColorResolutionY >= HIDWORD(Dimensions) && (int)Dimensions * HIDWORD(Dimensions) > v8)
            {
              id v19 = v11;

              if (self->_preferredColorResolutionX == v16.width)
              {
                unint64_t v8 = v16.width * v16.height;
                v49 = v19;
                if (self->_preferredColorResolutionY == v17) {
                  goto LABEL_20;
                }
              }
              else
              {
                unint64_t v8 = v16.width * v16.height;
                v49 = v19;
              }
            }
          }
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
    id v19 = v49;
  }
  while (v7);
LABEL_20:

  id v4 = v47;
  if (!v19)
  {
LABEL_48:
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
      -[HRTFSyncedCaptureSource _verifyCaptureDevice:]();
    }
    BOOL v45 = 0;
    goto LABEL_56;
  }
  objc_storeStrong((id *)&self->_finalColorFormat, v19);
  v20 = (void *)HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    finalColorFormat = self->_finalColorFormat;
    v22 = v20;
    id v23 = [(AVCaptureDeviceFormat *)finalColorFormat description];
    uint64_t v24 = [v23 UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v61 = v24;
    _os_log_impl(&dword_22F0F1000, v22, OS_LOG_TYPE_DEFAULT, "capture device color format: %s", buf, 0xCu);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v25 = [v19 supportedDepthDataFormats];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (!v26)
  {

    goto LABEL_52;
  }
  uint64_t v27 = v26;
  v48 = 0;
  unint64_t v50 = 0;
  uint64_t v28 = *(void *)v52;
  do
  {
    for (uint64_t j = 0; j != v27; ++j)
    {
      if (*(void *)v52 != v28) {
        objc_enumerationMutation(v25);
      }
      v30 = *(void **)(*((void *)&v51 + 1) + 8 * j);
      v31 = (const opaqueCMFormatDescription *)[v30 formatDescription];
      if (CMFormatDescriptionGetMediaSubType(v31) == self->_preferredDepthFormat)
      {
        unint64_t v32 = (unint64_t)CMVideoFormatDescriptionGetDimensions(v31);
        CMVideoDimensions v33 = (CMVideoDimensions)v32;
        if (self->_preferredDepthResolutionX >= v32)
        {
          id v34 = v19;
          unint64_t v35 = HIDWORD(v32);
          if (self->_preferredDepthResolutionY < HIDWORD(v32) || (int)v32 * HIDWORD(v32) <= v50) {
            goto LABEL_40;
          }
          id v37 = v30;

          if (self->_preferredDepthResolutionX != v33.width)
          {
            v48 = v37;
            unint64_t v50 = v33.width * v33.height;
LABEL_40:
            id v19 = v34;
            continue;
          }
          v48 = v37;
          unint64_t v50 = v33.width * v33.height;
          BOOL v38 = self->_preferredDepthResolutionY == v35;
          id v19 = v34;
          if (v38) {
            goto LABEL_43;
          }
        }
      }
    }
    uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v59 count:16];
    id v37 = v48;
  }
  while (v27);
LABEL_43:

  id v4 = v47;
  if (v37)
  {
    p_finalDepthFormat = &self->_finalDepthFormat;
    objc_storeStrong((id *)p_finalDepthFormat, v37);
    v40 = (void *)HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *p_finalDepthFormat;
      v42 = v40;
      id v43 = [(AVCaptureDeviceFormat *)v41 description];
      uint64_t v44 = [v43 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v61 = v44;
      _os_log_impl(&dword_22F0F1000, v42, OS_LOG_TYPE_DEFAULT, "capture device depth format: %s", buf, 0xCu);
    }
    BOOL v45 = 1;
    goto LABEL_55;
  }
LABEL_52:
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
    -[HRTFSyncedCaptureSource _verifyCaptureDevice:]();
  }
  BOOL v45 = 0;
LABEL_55:

LABEL_56:
  return v45;
}

- (BOOL)_configureVideoOutputsForDevice:(id)a3 inSession:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  [v5 beginConfiguration];
  id v6 = objc_alloc_init(MEMORY[0x263EFA6A0]);
  [v6 setAlwaysDiscardsLateVideoFrames:1];
  if ([v5 canAddOutput:v6])
  {
    [v5 addOutput:v6];
    uint64_t v7 = [v6 connectionWithMediaType:*MEMORY[0x263EF9D48]];
    unint64_t v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setCameraIntrinsicMatrixDeliveryEnabled:", objc_msgSend(v7, "isCameraIntrinsicMatrixDeliverySupported"));
      if ([v8 isVideoOrientationSupported]) {
        [v8 setVideoOrientation:1];
      }
      [v8 setEnabled:1];
    }
  }
  objc_storeStrong((id *)&self->_colorDataOutput, v6);
  id v9 = objc_alloc_init(MEMORY[0x263EFA588]);
  [v9 setFilteringEnabled:0];
  [v9 setAlwaysDiscardsLateDepthData:1];
  if ([v5 canAddOutput:v9])
  {
    [v5 addOutput:v9];
    v10 = [v9 connectionWithMediaType:*MEMORY[0x263EF9CF8]];
    v11 = v10;
    if (v10)
    {
      if ([v10 isVideoOrientationSupported]) {
        [v11 setVideoOrientation:1];
      }
      [v11 setEnabled:1];
    }
  }
  objc_storeStrong((id *)&self->_depthDataOutput, v9);
  v12 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x263EFA5F0]);
  if ([v5 canAddOutput:v12])
  {
    [v5 addOutput:v12];
    uint64_t v13 = [(AVCaptureMetadataOutput *)v12 availableMetadataObjectTypes];
    uint64_t v14 = *MEMORY[0x263EF9F08];
    int v15 = [v13 containsObject:*MEMORY[0x263EF9F08]];

    if (v15)
    {
      v24[0] = v14;
      CMVideoDimensions v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      [(AVCaptureMetadataOutput *)v12 setMetadataObjectTypes:v16];
    }
  }
  metadataOutput = self->_metadataOutput;
  self->_metadataOutput = v12;
  v18 = v12;

  [v5 commitConfiguration];
  id v19 = objc_alloc(MEMORY[0x263EFA570]);
  v20 = [v5 outputs];
  v21 = (AVCaptureDataOutputSynchronizer *)[v19 initWithDataOutputs:v20];

  [(AVCaptureDataOutputSynchronizer *)v21 setDelegate:self queue:self->_queue];
  outputSynchronizer = self->_outputSynchronizer;
  self->_outputSynchronizer = v21;

  return 1;
}

- (BOOL)_initialize
{
  v37[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFA5A8];
  v37[0] = *MEMORY[0x263EF9658];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  id v5 = [v3 discoverySessionWithDeviceTypes:v4 mediaType:*MEMORY[0x263EF9D48] position:2];

  id v6 = [v5 devices];
  uint64_t v7 = v6;
  if (!v6 || ![v6 count])
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
      -[HRTFSyncedCaptureSource _initialize]();
    }
    goto LABEL_14;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      if ([(HRTFSyncedCaptureSource *)self _verifyCaptureDevice:v13])
      {
        id v16 = v13;

        if (!v16) {
          goto LABEL_14;
        }
        id v31 = 0;
        unint64_t v17 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v16 error:&v31];
        id v18 = v31;
        if (v17) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (!v19)
        {
          v20 = v18;
          v21 = (void *)HRTFEnrollmentLog;
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
            [(HRTFSyncedCaptureSource *)v21 _initialize];
          }
          BOOL v14 = 0;
          goto LABEL_33;
        }
        id v22 = objc_alloc_init(MEMORY[0x263EFA638]);
        [v22 beginConfiguration];
        if ([v22 canAddInput:v17])
        {
          [v22 addInput:v17];
          id v30 = 0;
          [v16 lockForConfiguration:&v30];
          id v23 = v30;
          if (v23)
          {
            v20 = v23;
            uint64_t v24 = (void *)HRTFEnrollmentLog;
            if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
              [(HRTFSyncedCaptureSource *)v24 _initialize];
            }
            goto LABEL_31;
          }
          [v16 setActiveFormat:self->_finalColorFormat];
          [v16 setActiveDepthDataFormat:self->_finalDepthFormat];
          [v16 unlockForConfiguration];
          BOOL v25 = [(HRTFSyncedCaptureSource *)self _configureVideoOutputsForDevice:v16 inSession:v22];
          [v22 commitConfiguration];
          if (v25)
          {
            uint64_t v26 = (AVCaptureVideoPreviewLayer *)[objc_alloc(MEMORY[0x263EFA6B0]) initWithSession:v22];
            previewLayer = self->_previewLayer;
            self->_previewLayer = v26;

            objc_storeStrong((id *)&self->_captureSession, v22);
            uint64_t v28 = HRTFEnrollmentLog;
            if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_22F0F1000, v28, OS_LOG_TYPE_DEFAULT, "successfully configured capture session", v29, 2u);
            }
            v20 = 0;
            BOOL v14 = 1;
            goto LABEL_32;
          }
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
            -[HRTFSyncedCaptureSource _initialize]();
          }
        }
        else
        {
          [v22 commitConfiguration];
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
            -[HRTFSyncedCaptureSource _initialize].cold.5();
          }
        }
        v20 = 0;
LABEL_31:
        BOOL v14 = 0;
LABEL_32:

LABEL_33:
        goto LABEL_15;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_11:

LABEL_14:
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (HRTFSyncedCaptureSource)initWithQueue:(id)a3 options:(id *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HRTFSyncedCaptureSource;
  id v8 = [(HRTFSyncedCaptureSource *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_preferredPixelFormat = a4->var0;
    v9->_preferredDepthFormat = a4->var1;
    v9->_preferredColorResolutionX = a4->var2;
    v9->_preferredColorResolutionY = a4->var3;
    v9->_preferredDepthResolutionX = a4->var4;
    v9->_preferredDepthResolutionY = a4->var5;
    if (![(HRTFSyncedCaptureSource *)v9 _initialize])
    {

      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:self->_colorDataOutput];
  id v7 = [v5 objectForKeyedSubscript:self->_depthDataOutput];
  id v8 = [v5 objectForKeyedSubscript:self->_metadataOutput];
  uint64_t v9 = v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v11 = [v8 metadataObjects];
    if (!v11) {
      goto LABEL_17;
    }
    v12 = (void *)v11;
    uint64_t v13 = [v9 metadataObjects];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      obuint64_t j = [v9 metadataObjects];
      int v15 = (void *)[obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              colorDataOutput = self->_colorDataOutput;
              uint64_t v20 = *MEMORY[0x263EF9D48];
              id v21 = v18;
              id v22 = [(AVCaptureVideoDataOutput *)colorDataOutput connectionWithMediaType:v20];
              int v15 = [(AVCaptureVideoDataOutput *)self->_colorDataOutput transformedMetadataObjectForMetadataObject:v21 connection:v22];

              goto LABEL_19;
            }
          }
          int v15 = (void *)[obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
    else
    {
LABEL_17:
      int v15 = 0;
    }
    id v23 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEBUG)) {
      -[HRTFSyncedCaptureSource dataOutputSynchronizer:didOutputSynchronizedDataCollection:]((uint64_t)v15, v23);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      [v25 didReceiveVideoData:self->_previewLayer colorData:v6 depthData:v7 faceObject:v15];
    }
  }
}

- (void)_handleCaptureSessionNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 name];
  int v6 = [v5 isEqualToString:*MEMORY[0x263EF9700]];

  if (v6)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 didStartCaptureSessionWithError:0];
    }
  }
  else
  {
    BOOL v10 = [v4 name];
    int v11 = [v10 isEqualToString:*MEMORY[0x263EF9798]];

    if (v11)
    {
      v12 = [v4 userInfo];
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263EF9710]];

      uint64_t v14 = HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        BOOL v19 = v13;
        _os_log_impl(&dword_22F0F1000, v14, OS_LOG_TYPE_DEFAULT, "received AVCaptureSessionRuntimeErrorNotification: %@", (uint8_t *)&v18, 0xCu);
      }
      if (v13)
      {
        int v15 = &self->_delegate;
        id v16 = objc_loadWeakRetained((id *)v15);

        if (v16)
        {
          id v17 = objc_loadWeakRetained((id *)v15);
          [v17 didStartCaptureSessionWithError:v13];
        }
      }
    }
  }
}

- (void)startCaptureSession
{
  v3 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_22F0F1000, v3, OS_LOG_TYPE_DEFAULT, "starting capture session\n", v6, 2u);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__handleCaptureSessionNotification_ name:*MEMORY[0x263EF9700] object:self->_captureSession];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__handleCaptureSessionNotification_ name:*MEMORY[0x263EF9798] object:self->_captureSession];

  [(AVCaptureSession *)self->_captureSession startRunning];
}

- (void)stopCaptureSession
{
  if ([(AVCaptureSession *)self->_captureSession isRunning])
  {
    v3 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_22F0F1000, v3, OS_LOG_TYPE_DEFAULT, "stopping capture session\n", v6, 2u);
    }
    [(AVCaptureSession *)self->_captureSession stopRunning];
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263EF9700] object:self->_captureSession];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x263EF9798] object:self->_captureSession];
  }
}

- (HRTFSyncedCaptureSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRTFSyncedCaptureSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_depthDataOutput, 0);
  objc_storeStrong((id *)&self->_colorDataOutput, 0);
  objc_storeStrong((id *)&self->_outputSynchronizer, 0);
  objc_storeStrong((id *)&self->_finalDepthFormat, 0);
  objc_storeStrong((id *)&self->_finalColorFormat, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)_verifyCaptureDevice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "failed to verify color format for capture device", v2, v3, v4, v5, v6);
}

- (void)_verifyCaptureDevice:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "failed to verify depth format for capture device", v2, v3, v4, v5, v6);
}

- (void)_initialize
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22F0F1000, v0, v1, "input device not usable", v2, v3, v4, v5, v6);
}

- (void)dataOutputSynchronizer:(uint64_t)a1 didOutputSynchronizedDataCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 != 0;
  _os_log_debug_impl(&dword_22F0F1000, a2, OS_LOG_TYPE_DEBUG, "received synced output frame, has face object: %u", (uint8_t *)v2, 8u);
}

@end