@interface CRDefaultCaptureSessionManager
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)highISOThresholdDuration;
- ($BE317D33594506163345F0F928572BFD)exposure_table;
- (AVCaptureDeviceInput)deviceInput;
- (AVCaptureInputPort)inputPortFormatSender;
- (AVCaptureMetadataOutputObjectsDelegate)captureSessionMetadataDelegate;
- (AVCaptureSession)captureSession;
- (AVCaptureVideoDataOutput)captureVideoDataOutput;
- (AVCaptureVideoDataOutputSampleBufferDelegate)captureSessionDelegate;
- (AVCaptureVideoPreviewLayer)avfPreviewLayer;
- (BOOL)enableMetadataOutput;
- (BOOL)exposureAdjustmentInProgress;
- (BOOL)isAdjustingFocus;
- (BOOL)isFocusPointOfInterestSupported;
- (BOOL)isPreviewVideoMirrored;
- (BOOL)isRearCamera;
- (BOOL)isRunning;
- (BOOL)runningManualExposure;
- (BOOL)switchToCamera:(int64_t)a3;
- (BOOL)switchToCameraWithDeviceID:(id)a3;
- (BOOL)toggleCamera;
- (CALayer)previewLayer;
- (CGPoint)convertCameraPoint:(CGPoint)a3 fromLayer:(id)a4;
- (CGPoint)convertCameraPoint:(CGPoint)a3 toLayer:(id)a4;
- (CGPoint)convertCameraPoint:(CGPoint)a3 toLayer:(id)a4 flipped:(BOOL)a5;
- (CGPoint)convertCameraPointOCR:(CGPoint)a3 toLayer:(id)a4 flipped:(BOOL)a5;
- (CGPoint)focusPointOfInterest;
- (CGRect)convertCameraRect:(CGRect)a3 fromLayer:(id)a4;
- (CGRect)previewVisibleRect;
- (CGSize)cameraResolution;
- (NSString)cameraMode;
- (NSString)currentDeviceID;
- (float)maxISO;
- (float)minISO;
- (id)backFacingCamera;
- (id)captureDeviceWithIdentifier:(id)a3;
- (id)captureDeviceWithPosition:(int64_t)a3;
- (id)frontFacingCamera;
- (id)inputPortFormatObserver;
- (int)exposureAdjustmentInProgressTimeoutCount;
- (int)targetVideoFormat;
- (int64_t)cameraPosition;
- (int64_t)exposureMode;
- (int64_t)focusMode;
- (int64_t)targetFocusDistance;
- (int64_t)torchMode;
- (int64_t)whiteBalanceMode;
- (unint64_t)cameraCount;
- (void)_refocusOnPoint:(CGPoint)a3 focusMode:(int64_t)a4 exposure:(BOOL)a5;
- (void)cacheCameraResolution:(id)a3;
- (void)cameraSessionWasInterrupted:(id)a3;
- (void)changeCameraConfiguration;
- (void)highISOAdjustExposure;
- (void)refocusOnPoint:(CGPoint)a3;
- (void)refocusOnPoint:(CGPoint)a3 exposure:(BOOL)a4;
- (void)resetFocus;
- (void)setAvfPreviewLayer:(id)a3;
- (void)setCameraMode:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCameraResolution:(CGSize)a3;
- (void)setCaptureSession:(id)a3;
- (void)setCaptureSessionDelegate:(id)a3;
- (void)setCaptureSessionMetadataDelegate:(id)a3;
- (void)setCaptureVideoDataOutput:(id)a3;
- (void)setCurrentDeviceID:(id)a3;
- (void)setDeviceInput:(id)a3;
- (void)setEnableMetadataOutput:(BOOL)a3;
- (void)setExposureAdjustmentInProgress:(BOOL)a3;
- (void)setExposureAdjustmentInProgressTimeoutCount:(int)a3;
- (void)setExposureMode:(int64_t)a3;
- (void)setExposure_table:(id *)a3;
- (void)setFocusMode:(int64_t)a3;
- (void)setHighISOThresholdDuration:(id *)a3;
- (void)setInputPortFormatObserver:(id)a3;
- (void)setInputPortFormatSender:(id)a3;
- (void)setMaxISO:(float)a3;
- (void)setMinISO:(float)a3;
- (void)setPreviewOrientation:(int64_t)a3;
- (void)setRunningManualExposure:(BOOL)a3;
- (void)setTargetFocusDistance:(int64_t)a3;
- (void)setTorchMode:(int64_t)a3;
- (void)setWhiteBalanceMode:(int64_t)a3;
- (void)setupCameraSession;
- (void)setupCameraSessionWithCaptureDevice:(id)a3;
- (void)setupHighISO:(id)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)teardownCameraSession;
@end

@implementation CRDefaultCaptureSessionManager

- (CALayer)previewLayer
{
  return (CALayer *)self->_avfPreviewLayer;
}

- (void)stopRunning
{
  v3 = [(CRDefaultCaptureSessionManager *)self inputPortFormatObserver];

  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    v5 = [(CRDefaultCaptureSessionManager *)self inputPortFormatObserver];
    uint64_t v6 = *MEMORY[0x263EF96B0];
    v7 = [(CRDefaultCaptureSessionManager *)self inputPortFormatSender];
    [v4 removeObserver:v5 name:v6 object:v7];

    [(CRDefaultCaptureSessionManager *)self setInputPortFormatObserver:0];
  }
  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x263EF97A0] object:0];

  id v9 = [(CRDefaultCaptureSessionManager *)self captureSession];
  [v9 stopRunning];
}

- (void)cacheCameraResolution:(id)a3
{
  v4 = (const opaqueCMFormatDescription *)[a3 formatDescription];
  if (v4)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v4);
    -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", (double)Dimensions.width, (double)Dimensions.height);
  }
}

- (void)startRunning
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [(CRDefaultCaptureSessionManager *)self inputPortFormatObserver];

  v4 = (uint64_t *)MEMORY[0x263EF96B0];
  if (v3)
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = [(CRDefaultCaptureSessionManager *)self inputPortFormatObserver];
    uint64_t v7 = *v4;
    v8 = [(CRDefaultCaptureSessionManager *)self inputPortFormatSender];
    [v5 removeObserver:v6 name:v7 object:v8];

    [(CRDefaultCaptureSessionManager *)self setInputPortFormatObserver:0];
  }
  [(CRDefaultCaptureSessionManager *)self changeCameraConfiguration];
  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_cameraSessionWasInterrupted_ name:*MEMORY[0x263EF97A0] object:0];

  v10 = [(CRDefaultCaptureSessionManager *)self captureSession];
  [v10 startRunning];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  v12 = [v11 ports];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    uint64_t v16 = *MEMORY[0x263EF9D48];
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v19 = [v18 mediaType];
        int v20 = [v19 isEqualToString:v16];

        if (v20)
        {
          [(CRDefaultCaptureSessionManager *)self cacheCameraResolution:v18];
          [(CRDefaultCaptureSessionManager *)self setInputPortFormatSender:v18];
          v21 = [MEMORY[0x263F08A00] defaultCenter];
          uint64_t v22 = *MEMORY[0x263EF96B0];
          v23 = [MEMORY[0x263F08A48] mainQueue];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __46__CRDefaultCaptureSessionManager_startRunning__block_invoke;
          v25[3] = &unk_26429E088;
          v25[4] = self;
          v25[5] = v18;
          v24 = [v21 addObserverForName:v22 object:v18 queue:v23 usingBlock:v25];
          [(CRDefaultCaptureSessionManager *)self setInputPortFormatObserver:v24];

          goto LABEL_13;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

uint64_t __46__CRDefaultCaptureSessionManager_startRunning__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacheCameraResolution:*(void *)(a1 + 40)];
}

- (BOOL)isRunning
{
  v2 = [(CRDefaultCaptureSessionManager *)self captureSession];
  char v3 = [v2 isRunning];

  return v3;
}

- (int)targetVideoFormat
{
  return 875704422;
}

- (void)setupCameraSession
{
  if ([(CRDefaultCaptureSessionManager *)self cameraPosition]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = [(CRDefaultCaptureSessionManager *)self captureDeviceWithPosition:v3];
  if (!v4)
  {
    uint64_t v4 = [(CRDefaultCaptureSessionManager *)self captureDeviceWithPosition:0];
  }
  id v5 = (id)v4;
  [(CRDefaultCaptureSessionManager *)self setupCameraSessionWithCaptureDevice:v4];
}

- (void)setupCameraSessionWithCaptureDevice:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CRDefaultCaptureSessionManager *)self targetVideoFormat];
  [(CRDefaultCaptureSessionManager *)self stopRunning];
  -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  uint64_t v6 = [(CRDefaultCaptureSessionManager *)self captureSession];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFA638]);
    [(CRDefaultCaptureSessionManager *)self setCaptureSession:v7];
  }
  v8 = [(CRDefaultCaptureSessionManager *)self captureSession];
  int v9 = [v8 isMultitaskingCameraAccessSupported];

  if (v9)
  {
    v10 = [(CRDefaultCaptureSessionManager *)self captureSession];
    [v10 setMultitaskingCameraAccessEnabled:1];
  }
  id v90 = 0;
  int v11 = [v4 lockForConfiguration:&v90];
  id v12 = v90;
  uint64_t v13 = v12;
  if (!v11)
  {
    NSLog(&cfstr_FailedToObtain.isa, v12);
LABEL_50:
    v77 = [(CRDefaultCaptureSessionManager *)self deviceInput];
    v78 = [v77 device];
    -[CRDefaultCaptureSessionManager setCameraPosition:](self, "setCameraPosition:", [v78 position]);

    v51 = [(CRDefaultCaptureSessionManager *)self deviceInput];
    v79 = [v51 device];
    v80 = [v79 uniqueID];
    [(CRDefaultCaptureSessionManager *)self setCurrentDeviceID:v80];

    goto LABEL_51;
  }
  id v84 = v12;
  uint64_t v14 = [(CRDefaultCaptureSessionManager *)self captureSession];
  [v14 beginConfiguration];

  uint64_t v15 = [(CRDefaultCaptureSessionManager *)self captureSession];
  uint64_t v16 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  [v15 removeInput:v16];

  v17 = [(CRDefaultCaptureSessionManager *)self captureSession];
  v18 = [(CRDefaultCaptureSessionManager *)self captureVideoDataOutput];
  [v17 removeOutput:v18];

  id v89 = 0;
  v19 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v4 error:&v89];
  id v83 = v89;
  [(CRDefaultCaptureSessionManager *)self setDeviceInput:v19];

  int v20 = [(CRDefaultCaptureSessionManager *)self captureSession];
  v21 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  int v22 = [v20 canAddInput:v21];

  if (v22)
  {
    v23 = [(CRDefaultCaptureSessionManager *)self captureSession];
    v24 = [(CRDefaultCaptureSessionManager *)self deviceInput];
    [v23 addInput:v24];
  }
  v25 = [(CRDefaultCaptureSessionManager *)self cameraMode];
  long long v26 = (void *)*MEMORY[0x263EF9780];

  if (v25 == v26)
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v82 = v4;
    v35 = [v4 formats];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (!v36)
    {
      id v38 = 0;
LABEL_36:

LABEL_37:
      id v32 = v38;
      id v38 = v32;
      if (!v32) {
        goto LABEL_40;
      }
LABEL_38:
      [v82 setActiveFormat:v32];
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v32 formatDescription]);
      -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", (double)Dimensions.width, (double)Dimensions.height);
      [v82 setProvidesStortorgetMetadata:1];
      [(CRDefaultCaptureSessionManager *)self setupHighISO:v32];

LABEL_39:
LABEL_40:
      id v53 = objc_alloc(MEMORY[0x263EFA6B0]);
      v54 = [(CRDefaultCaptureSessionManager *)self captureSession];
      v55 = (void *)[v53 initWithSession:v54];
      [(CRDefaultCaptureSessionManager *)self setAvfPreviewLayer:v55];

      id v56 = objc_alloc_init(MEMORY[0x263EFA6A0]);
      v57 = NSDictionary;
      v58 = [NSNumber numberWithUnsignedInt:v5];
      v59 = [v57 dictionaryWithObject:v58 forKey:*MEMORY[0x263F04180]];
      [v56 setVideoSettings:v59];

      [v56 setAlwaysDiscardsLateVideoFrames:1];
      [(CRDefaultCaptureSessionManager *)self setCaptureVideoDataOutput:v56];
      dispatch_queue_t v60 = dispatch_queue_create("com.apple.CoreRecognition.videoQueue", 0);
      v61 = [(CRDefaultCaptureSessionManager *)self captureVideoDataOutput];
      v62 = [(CRDefaultCaptureSessionManager *)self captureSessionDelegate];
      [v61 setSampleBufferDelegate:v62 queue:v60];

      id v4 = v82;
      if ([(CRDefaultCaptureSessionManager *)self enableMetadataOutput])
      {
        id v63 = objc_alloc_init(MEMORY[0x263EFA5F0]);
        v64 = [(CRDefaultCaptureSessionManager *)self captureSession];
        int v65 = [v64 canAddOutput:v63];

        if (v65)
        {
          v66 = [(CRDefaultCaptureSessionManager *)self captureSession];
          [v66 addOutput:v63];
        }
        v67 = [(CRDefaultCaptureSessionManager *)self captureSessionMetadataDelegate];
        [v63 setMetadataObjectsDelegate:v67 queue:v60];

        uint64_t v91 = *MEMORY[0x263EF9F40];
        v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
        [v63 setMetadataObjectTypes:v68];
      }
      v69 = [(CRDefaultCaptureSessionManager *)self captureSession];
      v70 = [(CRDefaultCaptureSessionManager *)self captureVideoDataOutput];
      int v71 = [v69 canAddOutput:v70];

      if (v71)
      {
        v72 = [(CRDefaultCaptureSessionManager *)self captureSession];
        v73 = [(CRDefaultCaptureSessionManager *)self captureVideoDataOutput];
        [v72 addOutput:v73];
      }
      v74 = [(CRDefaultCaptureSessionManager *)self captureVideoDataOutput];
      v75 = [v74 connectionWithMediaType:*MEMORY[0x263EF9D48]];

      if ([v75 isCameraIntrinsicMatrixDeliverySupported]) {
        [v75 setCameraIntrinsicMatrixDeliveryEnabled:1];
      }
      else {
        NSLog(&cfstr_Cameraintrisic.isa);
      }
      v76 = [(CRDefaultCaptureSessionManager *)self captureSession];
      [v76 commitConfiguration];

      [v82 unlockForConfiguration];
      uint64_t v13 = v84;
      goto LABEL_50;
    }
    uint64_t v37 = v36;
    id v38 = 0;
    uint64_t v39 = *(void *)v86;
    uint64_t v81 = *(void *)v86;
LABEL_14:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v86 != v39) {
        objc_enumerationMutation(v35);
      }
      v41 = *(void **)(*((void *)&v85 + 1) + 8 * v40);
      v42 = (const opaqueCMFormatDescription *)[v41 formatDescription];
      FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v42);
      CMVideoDimensions v44 = CMVideoFormatDescriptionGetDimensions(v42);
      if (v38 || MediaSubType != v5)
      {
        if (MediaSubType != v5) {
          goto LABEL_29;
        }
        if (v44.width > CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v38 formatDescription]).width)
        {
          v46 = self;
          uint64_t v47 = v5;
          v48 = v35;
          id v49 = v41;

          id v38 = v49;
          v35 = v48;
          uint64_t v5 = v47;
          self = v46;
          uint64_t v39 = v81;
        }
      }
      else
      {
        id v38 = v41;
      }
      if (v44 == 0x99000000CC0 && MediaSubType == v5)
      {
        id v32 = v41;

        if (v32) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
LABEL_29:
      if (v37 == ++v40)
      {
        uint64_t v37 = [v35 countByEnumeratingWithState:&v85 objects:v92 count:16];
        if (v37) {
          goto LABEL_14;
        }
        goto LABEL_36;
      }
    }
  }
  long long v27 = [(CRDefaultCaptureSessionManager *)self captureSession];
  long long v28 = [(CRDefaultCaptureSessionManager *)self cameraMode];
  int v29 = [v27 canSetSessionPreset:v28];

  if (v29)
  {
    v30 = [(CRDefaultCaptureSessionManager *)self captureSession];
    uint64_t v31 = [(CRDefaultCaptureSessionManager *)self cameraMode];
    [v30 setSessionPreset:v31];

    v82 = v4;
    id v32 = [v4 activeFormat];
    v33 = (const opaqueCMFormatDescription *)[v32 formatDescription];
    [(CRDefaultCaptureSessionManager *)self setupHighISO:v32];
    CMVideoDimensions v34 = CMVideoFormatDescriptionGetDimensions(v33);
    -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", (double)v34.width, (double)v34.height);
    goto LABEL_39;
  }
  NSLog(&cfstr_NotSupported.isa);
  v50 = [(CRDefaultCaptureSessionManager *)self captureSession];
  [v50 commitConfiguration];

  [v4 unlockForConfiguration];
  v51 = v83;
  uint64_t v13 = v84;
LABEL_51:
}

- (void)teardownCameraSession
{
  uint64_t v3 = [(CRDefaultCaptureSessionManager *)self captureSession];
  id v4 = [(CRDefaultCaptureSessionManager *)self captureVideoDataOutput];
  [v3 removeOutput:v4];

  uint64_t v5 = [(CRDefaultCaptureSessionManager *)self captureSession];
  uint64_t v6 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  [v5 removeInput:v6];

  [(CRDefaultCaptureSessionManager *)self setCaptureSession:0];
  [(CRDefaultCaptureSessionManager *)self setAvfPreviewLayer:0];
  if ([(CRDefaultCaptureSessionManager *)self exposure_table])
  {
    free(*(void **)[(CRDefaultCaptureSessionManager *)self exposure_table]);
    free([(CRDefaultCaptureSessionManager *)self exposure_table]);
    [(CRDefaultCaptureSessionManager *)self setExposure_table:0];
  }
}

- (void)changeCameraConfiguration
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  uint64_t v3 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  id v4 = [v3 device];

  uint64_t v5 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  uint64_t v6 = [v5 device];
  id v11 = 0;
  [v6 lockForConfiguration:&v11];
  id v7 = v11;

  if ([v4 hasTorch]
    && objc_msgSend(v4, "isTorchModeSupported:", -[CRDefaultCaptureSessionManager torchMode](self, "torchMode"))&& -[CRDefaultCaptureSessionManager isRearCamera](self, "isRearCamera"))
  {
    objc_msgSend(v4, "setTorchMode:", -[CRDefaultCaptureSessionManager torchMode](self, "torchMode"));
  }
  if ([v4 isFocusPointOfInterestSupported]
    && objc_msgSend(v4, "isFocusModeSupported:", -[CRDefaultCaptureSessionManager focusMode](self, "focusMode")))
  {
    objc_msgSend(v4, "setFocusPointOfInterest:", 0.5, 0.5);
    objc_msgSend(v4, "setFocusMode:", -[CRDefaultCaptureSessionManager focusMode](self, "focusMode"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v4 isAutoFocusRangeRestrictionSupported])
  {
    [v4 setAutoFocusRangeRestriction:1];
  }
  if (objc_msgSend(v4, "isWhiteBalanceModeSupported:", -[CRDefaultCaptureSessionManager whiteBalanceMode](self, "whiteBalanceMode")))objc_msgSend(v4, "setWhiteBalanceMode:", -[CRDefaultCaptureSessionManager whiteBalanceMode](self, "whiteBalanceMode")); {
  if ([v4 isExposurePointOfInterestSupported]
  }
    && objc_msgSend(v4, "isExposureModeSupported:", -[CRDefaultCaptureSessionManager exposureMode](self, "exposureMode")))
  {
    objc_msgSend(v4, "setExposurePointOfInterest:", 0.5, 0.5);
    objc_msgSend(v4, "setExposureMode:", -[CRDefaultCaptureSessionManager exposureMode](self, "exposureMode"));
  }
  uint64_t v8 = *MEMORY[0x263EF9C78];
  int v9 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  [v9 setVideoGravity:v8];

  v10 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  [v10 setOpaque:1];

  [v4 unlockForConfiguration];
  [MEMORY[0x263F158F8] commit];
}

- (BOOL)isRearCamera
{
  v2 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  uint64_t v3 = [v2 device];
  BOOL v4 = [v3 position] == 1;

  return v4;
}

- (unint64_t)cameraCount
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFA5A8];
  uint64_t v3 = *MEMORY[0x263EF9660];
  v9[0] = *MEMORY[0x263EF9670];
  v9[1] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  uint64_t v5 = [v2 discoverySessionWithDeviceTypes:v4 mediaType:*MEMORY[0x263EF9D48] position:0];

  uint64_t v6 = [v5 devices];
  unint64_t v7 = [v6 count];

  return v7;
}

- (id)frontFacingCamera
{
  return [(CRDefaultCaptureSessionManager *)self captureDeviceWithPosition:2];
}

- (id)backFacingCamera
{
  return [(CRDefaultCaptureSessionManager *)self captureDeviceWithPosition:1];
}

- (id)captureDeviceWithPosition:(int64_t)a3
{
  v54[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263EFA5A8];
  v54[0] = *MEMORY[0x263EF9670];
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
  uint64_t v39 = *MEMORY[0x263EF9D48];
  unint64_t v7 = objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v6);

  uint64_t v40 = v7;
  [v7 devices];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v15 = [v14 position];
        if (!a3 || v15 == a3)
        {
          if ([(CRDefaultCaptureSessionManager *)self targetFocusDistance] < 1
            || (uint64_t v16 = [v14 minimumFocusDistance],
                v16 <= [(CRDefaultCaptureSessionManager *)self targetFocusDistance]))
          {
            int v20 = CROSLogForCategory(8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = [v14 localizedName];
              *(_DWORD *)buf = 138412290;
              v52 = v21;
              _os_log_impl(&dword_217750000, v20, OS_LOG_TYPE_DEFAULT, "Selecting device %@", buf, 0xCu);
            }
            id v22 = v14;

            v23 = v40;
            goto LABEL_38;
          }
          v17 = CROSLogForCategory(8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [v14 localizedName];
            *(_DWORD *)buf = 138412290;
            v52 = v18;
            _os_log_impl(&dword_217750000, v17, OS_LOG_TYPE_DEFAULT, "%@ does not meet focus requirements", buf, 0xCu);
          }
          id v19 = v14;

          id v11 = v19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  v24 = (void *)MEMORY[0x263EFA5A8];
  uint64_t v50 = *MEMORY[0x263EF9660];
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
  v23 = [v24 discoverySessionWithDeviceTypes:v25 mediaType:v39 position:a3];

  long long v26 = [v23 devices];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v26;
  uint64_t v27 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    while (2)
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v8);
        }
        uint64_t v31 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        uint64_t v32 = [v31 position];
        if (!a3 || v32 == a3)
        {
          if ([(CRDefaultCaptureSessionManager *)self targetFocusDistance] < 1
            || (uint64_t v33 = [v31 minimumFocusDistance],
                v33 <= [(CRDefaultCaptureSessionManager *)self targetFocusDistance]))
          {
            if ([v31 isFocusPointOfInterestSupported])
            {
              uint64_t v36 = CROSLogForCategory(8);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v37 = [v31 localizedName];
                *(_DWORD *)buf = 138412290;
                v52 = v37;
                _os_log_impl(&dword_217750000, v36, OS_LOG_TYPE_DEFAULT, "Selecting device %@", buf, 0xCu);
              }
              id v22 = v31;

              goto LABEL_38;
            }
          }
        }
      }
      uint64_t v28 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  CMVideoDimensions v34 = CROSLogForCategory(8);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [v11 localizedName];
    *(_DWORD *)buf = 138412290;
    v52 = v35;
    _os_log_impl(&dword_217750000, v34, OS_LOG_TYPE_DEFAULT, "Falling back to device %@", buf, 0xCu);
  }
  id v11 = v11;
  id v22 = v11;
LABEL_38:

  return v22;
}

- (id)captureDeviceWithIdentifier:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x263EFA5A8];
  uint64_t v5 = *MEMORY[0x263EF9660];
  v21[0] = *MEMORY[0x263EF9670];
  v21[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  unint64_t v7 = [v4 discoverySessionWithDeviceTypes:v6 mediaType:*MEMORY[0x263EF9D48] position:0];

  [v7 devices];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "uniqueID", (void)v16);
        char v14 = [v13 isEqualToString:v3];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)toggleCamera
{
  id v3 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  BOOL v4 = [v3 device];
  uint64_t v5 = [v4 position];

  if (v5 == 1)
  {
    uint64_t v6 = 2;
  }
  else
  {
    if (v5 != 2) {
      return 0;
    }
    uint64_t v6 = 1;
  }
  return [(CRDefaultCaptureSessionManager *)self switchToCamera:v6];
}

- (BOOL)switchToCameraWithDeviceID:(id)a3
{
  BOOL v4 = [(CRDefaultCaptureSessionManager *)self captureDeviceWithIdentifier:a3];
  if (v4) {
    [(CRDefaultCaptureSessionManager *)self setupCameraSessionWithCaptureDevice:v4];
  }

  return v4 != 0;
}

- (BOOL)switchToCamera:(int64_t)a3
{
  if ([(CRDefaultCaptureSessionManager *)self cameraCount] < 2) {
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x263EFA5B8]);
    uint64_t v6 = [(CRDefaultCaptureSessionManager *)self backFacingCamera];
    uint64_t v42 = 0;
    unint64_t v7 = (id *)&v42;
    id v8 = &v42;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
LABEL_5:
    LOBYTE(v9) = 0;
    return v9;
  }
  id v5 = objc_alloc(MEMORY[0x263EFA5B8]);
  uint64_t v6 = [(CRDefaultCaptureSessionManager *)self frontFacingCamera];
  uint64_t v43 = 0;
  unint64_t v7 = (id *)&v43;
  id v8 = &v43;
LABEL_7:
  uint64_t v10 = (void *)[v5 initWithDevice:v6 error:v8];
  id v11 = *v7;

  if (v10)
  {
    [(CRDefaultCaptureSessionManager *)self stopRunning];
    uint64_t v12 = [v10 device];
    id v41 = 0;
    int v9 = [v12 lockForConfiguration:&v41];
    id v13 = v41;

    if (v9)
    {
      char v14 = [(CRDefaultCaptureSessionManager *)self captureSession];
      [v14 beginConfiguration];

      uint64_t v15 = [(CRDefaultCaptureSessionManager *)self captureSession];
      long long v16 = [(CRDefaultCaptureSessionManager *)self deviceInput];
      [v15 removeInput:v16];

      long long v17 = [v10 device];
      uint64_t v18 = *MEMORY[0x263EF9750];
      int v19 = [v17 supportsAVCaptureSessionPreset:*MEMORY[0x263EF9750]];

      if (v19
        || ([v10 device],
            int v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v18 = *MEMORY[0x263EF9730],
            int v21 = [v20 supportsAVCaptureSessionPreset:*MEMORY[0x263EF9730]],
            v20,
            v21))
      {
        id v22 = [(CRDefaultCaptureSessionManager *)self captureSession];
        [v22 setSessionPreset:v18];
      }
      if ([(CRDefaultCaptureSessionManager *)self enableMetadataOutput])
      {
        v23 = [v10 device];
        uint64_t v24 = *MEMORY[0x263EF9730];
        int v25 = [v23 supportsAVCaptureSessionPreset:*MEMORY[0x263EF9730]];

        long long v26 = [(CRDefaultCaptureSessionManager *)self captureSession];
        uint64_t v27 = v26;
        if (v25) {
          uint64_t v28 = v24;
        }
        else {
          uint64_t v28 = *MEMORY[0x263EF9758];
        }
        [v26 setSessionPreset:v28];
      }
      uint64_t v29 = [(CRDefaultCaptureSessionManager *)self captureSession];
      int v30 = [v29 canAddInput:v10];

      uint64_t v31 = [(CRDefaultCaptureSessionManager *)self captureSession];
      uint64_t v32 = v31;
      if (v30)
      {
        [v31 addInput:v10];

        [(CRDefaultCaptureSessionManager *)self setDeviceInput:v10];
      }
      else
      {
        uint64_t v33 = [(CRDefaultCaptureSessionManager *)self deviceInput];
        [v32 addInput:v33];
      }
      CMVideoDimensions v34 = [v10 device];
      v35 = [v34 activeFormat];

      [(CRDefaultCaptureSessionManager *)self setupHighISO:v35];
      uint64_t v36 = [(CRDefaultCaptureSessionManager *)self captureSession];
      [v36 commitConfiguration];

      uint64_t v37 = [v10 device];
      [v37 unlockForConfiguration];

      id v38 = [(CRDefaultCaptureSessionManager *)self deviceInput];
      uint64_t v39 = [v38 device];
      -[CRDefaultCaptureSessionManager setCameraPosition:](self, "setCameraPosition:", [v39 position]);

      [(CRDefaultCaptureSessionManager *)self startRunning];
    }
    else
    {
      NSLog(&cfstr_FailedToObtain.isa, v13);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_refocusOnPoint:(CGPoint)a3 focusMode:(int64_t)a4 exposure:(BOOL)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  id v11 = [v10 device];

  if (([v11 isAdjustingFocus] & 1) == 0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__CRDefaultCaptureSessionManager__refocusOnPoint_focusMode_exposure___block_invoke;
    v12[3] = &unk_26429E0B0;
    v12[4] = self;
    id v13 = v11;
    int64_t v14 = a4;
    CGFloat v15 = x;
    CGFloat v16 = y;
    BOOL v17 = a5;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __69__CRDefaultCaptureSessionManager__refocusOnPoint_focusMode_exposure___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deviceInput];
  id v3 = [v2 device];
  id v6 = 0;
  int v4 = [v3 lockForConfiguration:&v6];
  id v5 = v6;

  if (v4)
  {
    if ([*(id *)(a1 + 40) isFocusPointOfInterestSupported]
      && [*(id *)(a1 + 40) isFocusModeSupported:*(void *)(a1 + 48)])
    {
      objc_msgSend(*(id *)(a1 + 40), "setFocusPointOfInterest:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      [*(id *)(a1 + 40) setFocusMode:*(void *)(a1 + 48)];
    }
    if (*(unsigned char *)(a1 + 72)
      && [*(id *)(a1 + 40) isExposurePointOfInterestSupported]
      && objc_msgSend(*(id *)(a1 + 40), "isExposureModeSupported:", objc_msgSend(*(id *)(a1 + 32), "exposureMode")))
    {
      objc_msgSend(*(id *)(a1 + 40), "setExposurePointOfInterest:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "setExposureMode:", objc_msgSend(*(id *)(a1 + 32), "exposureMode"));
    }
    [*(id *)(a1 + 40) unlockForConfiguration];
  }
  else
  {
    NSLog(&cfstr_FailedToLockCo.isa, v5);
  }
}

- (void)refocusOnPoint:(CGPoint)a3
{
}

- (void)refocusOnPoint:(CGPoint)a3 exposure:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  int v9 = [v8 device];
  int v10 = [v9 isFocusPointOfInterestSupported];

  if (v10)
  {
    id v11 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
    objc_msgSend(v11, "captureDevicePointOfInterestForPoint:", x, y);
    double v13 = v12;
    double v15 = v14;

    CGFloat v16 = [(CRDefaultCaptureSessionManager *)self deviceInput];
    BOOL v17 = [v16 device];
    [v17 focusPointOfInterest];
    *(float *)&double v18 = (v19 - v15) * (v19 - v15) + (v18 - v13) * (v18 - v13);
    double v20 = sqrtf(*(float *)&v18);

    if (v20 <= 0.05)
    {
      id v22 = [(CRDefaultCaptureSessionManager *)self deviceInput];
      v23 = [v22 device];
      char v24 = [v23 isAdjustingFocus];

      if ((v24 & 1) == 0)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__CRDefaultCaptureSessionManager_refocusOnPoint_exposure___block_invoke;
        block[3] = &unk_26429E0D8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
      int64_t v21 = [(CRDefaultCaptureSessionManager *)self focusMode];
      -[CRDefaultCaptureSessionManager _refocusOnPoint:focusMode:exposure:](self, "_refocusOnPoint:focusMode:exposure:", v21, v4, v13, v15);
    }
  }
}

void __58__CRDefaultCaptureSessionManager_refocusOnPoint_exposure___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deviceInput];
  id v3 = [v2 device];
  id v13 = 0;
  int v4 = [v3 lockForConfiguration:&v13];
  id v5 = v13;

  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) deviceInput];
    unint64_t v7 = [v6 device];
    int v8 = [v7 isFocusModeSupported:1];

    if (v8)
    {
      int v9 = [*(id *)(a1 + 32) deviceInput];
      int v10 = [v9 device];
      [v10 setFocusMode:1];
    }
    id v11 = [*(id *)(a1 + 32) deviceInput];
    double v12 = [v11 device];
    [v12 unlockForConfiguration];
  }
}

- (void)resetFocus
{
  id v3 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  int v4 = [v3 device];
  int v5 = [v4 isFocusPointOfInterestSupported];

  if (v5)
  {
    id v13 = [(CRDefaultCaptureSessionManager *)self deviceInput];
    id v6 = [v13 device];
    [v6 focusPointOfInterest];
    if (v7 == 0.5)
    {
    }
    else
    {
      int v8 = [(CRDefaultCaptureSessionManager *)self deviceInput];
      int v9 = [v8 device];
      [v9 focusPointOfInterest];
      double v11 = v10;

      if (v11 != 0.5)
      {
        int64_t v12 = [(CRDefaultCaptureSessionManager *)self focusMode];
        -[CRDefaultCaptureSessionManager _refocusOnPoint:focusMode:exposure:](self, "_refocusOnPoint:focusMode:exposure:", v12, 1, 0.5, 0.5);
      }
    }
  }
}

- (void)setPreviewOrientation:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v7 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
      int v4 = [v7 connection];
      int v5 = v4;
      uint64_t v6 = 1;
      goto LABEL_6;
    case 2:
      id v7 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
      int v4 = [v7 connection];
      int v5 = v4;
      uint64_t v6 = 2;
      goto LABEL_6;
    case 3:
      id v7 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
      int v4 = [v7 connection];
      int v5 = v4;
      uint64_t v6 = 3;
      goto LABEL_6;
    case 4:
      id v7 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
      int v4 = [v7 connection];
      int v5 = v4;
      uint64_t v6 = 4;
LABEL_6:
      [v4 setVideoOrientation:v6];

      break;
    default:
      return;
  }
}

- (BOOL)isAdjustingFocus
{
  v2 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  uint64_t v3 = [v2 device];
  char v4 = [v3 isAdjustingFocus];

  return v4;
}

- (CGPoint)convertCameraPoint:(CGPoint)a3 fromLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  int v8 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  id v13 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v13, "captureDevicePointOfInterestForPoint:", v10, v12);
  double v15 = v14;
  double v17 = v16;

  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v19 = v15 * v18;
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v21 = v17 * v20;
  double v22 = v19;
  result.double y = v21;
  result.double x = v22;
  return result;
}

- (CGPoint)convertCameraPoint:(CGPoint)a3 toLayer:(id)a4
{
  -[CRDefaultCaptureSessionManager convertCameraPoint:toLayer:flipped:](self, "convertCameraPoint:toLayer:flipped:", a4, 0, a3.x, a3.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertCameraPoint:(CGPoint)a3 toLayer:(id)a4 flipped:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if (v5)
  {
    [(CRDefaultCaptureSessionManager *)self cameraResolution];
    double y = v10 - y;
  }
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v12 = x / v11;
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v14 = y / v13;
  double v15 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v15, "pointForCaptureDevicePointOfInterest:", v12, v14);
  double v17 = v16;
  double v19 = v18;

  double v20 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v20, "convertPoint:toLayer:", v9, v17, v19);
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (CGPoint)convertCameraPointOCR:(CGPoint)a3 toLayer:(id)a4 flipped:(BOOL)a5
{
  double x = a3.x;
  if (a5) {
    double y = 1.0 - a3.y;
  }
  else {
    double y = a3.y;
  }
  id v8 = a4;
  id v9 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v9, "pointForCaptureDevicePointOfInterest:", x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v14, "convertPoint:toLayer:", v8, v11, v13);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGRect)convertCameraRect:(CGRect)a3 fromLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  objc_msgSend(v10, "convertRect:fromLayer:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v35.origin.double x = v12;
  v35.origin.double y = v14;
  v35.size.double width = v16;
  v35.size.double height = v18;
  if (!CGRectIsEmpty(v35))
  {
    double v19 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
    objc_msgSend(v19, "metadataOutputRectOfInterestForRect:", v12, v14, v16, v18);
    double v12 = v20;
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
  }
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v25 = v12 * v24;
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v27 = v14 * v26;
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v29 = v16 * v28;
  [(CRDefaultCaptureSessionManager *)self cameraResolution];
  double v31 = v18 * v30;
  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  result.size.double height = v31;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (void)setupHighISO:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 maxISO];
  -[CRDefaultCaptureSessionManager setMaxISO:](self, "setMaxISO:");
  [v4 minISO];
  -[CRDefaultCaptureSessionManager setMinISO:](self, "setMinISO:");
  CMTimeMakeWithSeconds(&v70, 0.00207900208, 1000000000);
  CMTime v69 = v70;
  [(CRDefaultCaptureSessionManager *)self setHighISOThresholdDuration:&v69];
  uint64_t v5 = 0;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  *(_OWORD *)values = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  *(_OWORD *)v76 = 0u;
  long long v77 = 0u;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    values[v5] = CFNumberCreate(v6, kCFNumberDoubleType, (char *)&gDefaultExposureTable + v5 * 8);
    v76[v5] = CFNumberCreate(v6, kCFNumberDoubleType, (char *)&gDefaultExposureTable + v5 * 8 + 80);
    ++v5;
  }
  while (v5 != 10);
  id v7 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  CFArrayRef v8 = CFArrayCreate(v6, (const void **)values, 10, MEMORY[0x263EFFF70]);
  CFArrayRef v9 = CFArrayCreate(v6, (const void **)v76, 10, v7);
  *(_OWORD *)keys = xmmword_26429E0F8;
  v74[0] = v8;
  v74[1] = v9;
  CFDictionaryRef v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)v74, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if ([(CRDefaultCaptureSessionManager *)self exposure_table])
  {
    free(*(void **)[(CRDefaultCaptureSessionManager *)self exposure_table]);
    free([(CRDefaultCaptureSessionManager *)self exposure_table]);
    [(CRDefaultCaptureSessionManager *)self setExposure_table:0];
  }
  [(CRDefaultCaptureSessionManager *)self setExposure_table:malloc_type_malloc(0x20uLL, 0x1020040A02120EAuLL)];
  double v11 = [(CRDefaultCaptureSessionManager *)self exposure_table];
  *(_OWORD *)&v11->var2 = xmmword_2177A1680;
  p_var2 = &v11->var2;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v10, @"ExposureDelta");
  if (Value)
  {
    CFNumberRef v14 = Value;
    CFTypeID v15 = CFGetTypeID(Value);
    if (v15 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v14, kCFNumberDoubleType, p_var2);
      if (*p_var2 > 1.0) {
        double *p_var2 = 1.0 / *p_var2;
      }
    }
  }
  CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(v10, @"StabilityZone");
  if (v16)
  {
    CFNumberRef v17 = v16;
    CFTypeID v18 = CFGetTypeID(v16);
    if (v18 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v17, kCFNumberDoubleType, &v11->var3);
      if (v11->var3 > 1.0) {
        v11->var3 = 1.0 / v11->var3;
      }
    }
  }
  CFArrayRef v19 = (const __CFArray *)CFDictionaryGetValue(v10, @"IntegrationTime");
  if (v19 && (CFArrayRef v20 = v19, v21 = CFGetTypeID(v19), v21 == CFArrayGetTypeID()))
  {
    CFArrayRef v22 = (const __CFArray *)CFDictionaryGetValue(v10, @"MaxGain");
    if (v22 && (v23 = v22, CFTypeID v24 = CFGetTypeID(v22), v24 == CFArrayGetTypeID()))
    {
      CFIndex Count = CFArrayGetCount(v20);
      CFIndex v26 = CFArrayGetCount(v23);
      if (Count == v26)
      {
        theArradouble y = v23;
        uint64_t v68 = Count;
        uint64_t v65 = 2 * Count;
        double v27 = (double *)malloc_type_calloc(0x18uLL, 2 * Count, 0x976DDF42uLL);
        ValueAtIndedouble x = CFArrayGetValueAtIndex(v20, 0);
        CFTypeID v29 = CFGetTypeID(ValueAtIndex);
        if (v29 == CFNumberGetTypeID())
        {
          double valuePtr = 0.0;
          CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberDoubleType, &valuePtr);
          if (valuePtr > 1.0) {
            double valuePtr = 1.0 / valuePtr;
          }
          v66 = v27;
          id v63 = v11;
          CFArrayRef v64 = v8;
          if (v68 < 1)
          {
            int v46 = -1;
LABEL_52:
            double v51 = *p_var2;
            double v27 = v66;
            double v52 = v66[1];
            id v53 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(24 * SLODWORD(v66[3 * v65 - 3]) + 24, 0x1000040D315E998uLL);
            uint64_t v54 = 0;
            LODWORD(v55) = 0;
            do
            {
              id v56 = &v66[3 * v54];
              int v57 = *((_DWORD *)v56 + 6);
              if ((int)v55 < v57)
              {
                int v58 = *((_DWORD *)v56 + 1);
                double v59 = v56[1];
                uint64_t v55 = (int)v55;
                do
                {
                  double v60 = 1.0;
                  if (v55 >= 1)
                  {
                    int v61 = v55;
                    do
                    {
                      double v60 = (v51 + 1.0) * v60;
                      --v61;
                    }
                    while (v61);
                  }
                  v62 = (char *)v53 + 24 * v55;
                  *(_DWORD *)v62 = v55;
                  *((_DWORD *)v62 + 1) = v58;
                  *((double *)v62 + 1) = v59;
                  *((double *)v62 + 2) = v52 / v59 * v60;
                  ++v55;
                }
                while (v55 != v57);
              }
              ++v54;
              LODWORD(v55) = v57;
            }
            while (v54 != v65 - 1);
            v63->var0 = v53;
            v63->var1 = v46;
            CFArrayRef v8 = v64;
          }
          else
          {
            CFIndex v30 = 0;
            int v31 = 0;
            while (1)
            {
              double v71 = 0.0;
              double v72 = 0.0;
              double v32 = CFArrayGetValueAtIndex(v20, v30);
              CFTypeID v33 = CFGetTypeID(v32);
              if (v33 != CFNumberGetTypeID())
              {
                CFArrayRef v8 = v64;
                NSLog(&cfstr_ExposuretableI.isa, v30);
                goto LABEL_63;
              }
              CFNumberRef v34 = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v30);
              CFTypeID v35 = CFGetTypeID(v32);
              if (v35 != CFNumberGetTypeID()) {
                break;
              }
              CFNumberGetValue((CFNumberRef)v32, kCFNumberDoubleType, &v72);
              CFNumberGetValue(v34, kCFNumberDoubleType, &v71);
              double v36 = v72;
              double v37 = 1.0;
              if (v72 > 1.0) {
                double v36 = 1.0 / v72;
              }
              double v38 = *p_var2 + 1.0;
              if (v31 >= 1)
              {
                int v39 = v31;
                do
                {
                  double v37 = v38 * v37;
                  --v39;
                }
                while (v39);
              }
              double v40 = v71;
              double v41 = valuePtr / v36 * v37;
              if (v31 <= 4095) {
                int v42 = 4095;
              }
              else {
                int v42 = v31;
              }
              int v43 = v31;
              do
              {
                if (v43 == v42)
                {
                  int v46 = -1;
                  goto LABEL_42;
                }
                double v44 = v41;
                double v45 = 1.0;
                int v46 = v43;
                if ((v43 & 0x80000000) == 0)
                {
                  int v47 = -1;
                  do
                  {
                    double v45 = v38 * v45;
                    ++v47;
                  }
                  while (v46 != v47);
                }
                int v43 = v46 + 1;
                double v41 = valuePtr / v36 * v45;
              }
              while (v41 < v71);
              if (v71 - v44 >= v41 - v71) {
                ++v46;
              }
LABEL_42:
              long long v48 = &v66[6 * v30];
              *(_DWORD *)long long v48 = v31;
              *((_DWORD *)v48 + 1) = 0;
              v48[1] = v36;
              v48[2] = v40;
              id v49 = &v66[3 * ((2 * v30) | 1)];
              *(_DWORD *)id v49 = v46;
              *((_DWORD *)v49 + 1) = 0;
              v49[1] = v36;
              v49[2] = v40;
              int v31 = v46 + 1;
              if (++v30 == v68) {
                goto LABEL_52;
              }
            }
            CFArrayRef v8 = v64;
            NSLog(&cfstr_ExposuretableM.isa, v30);
LABEL_63:
            double v27 = v66;
          }
        }
        else
        {
          NSLog(&cfstr_ExposuretableI.isa, 0);
        }
        if (v27) {
          free(v27);
        }
      }
      else
      {
        NSLog(&cfstr_ExposuretableT.isa, Count, v26);
      }
    }
    else
    {
      NSLog(&cfstr_ExposuretableN_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_ExposuretableN.isa);
  }
  CFRelease(v10);
  CFRelease(v8);
  CFRelease(v9);
  for (uint64_t i = 0; i != 10; ++i)
  {
    CFRelease(values[i]);
    CFRelease(v76[i]);
  }
}

- (void)highISOAdjustExposure
{
  memset(&v40, 0, sizeof(v40));
  uint64_t v3 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  id v4 = [v3 device];

  [v4 ISO];
  float v6 = v5;
  memset(&v39, 0, sizeof(v39));
  if (v4) {
    [v4 exposureDuration];
  }
  CMTime time = v39;
  double Seconds = CMTimeGetSeconds(&time);
  [v4 exposureTargetOffset];
  float v9 = v8;
  [v4 lensAperture];
  float v11 = v10;
  if ([(CRDefaultCaptureSessionManager *)self exposureAdjustmentInProgress])
  {
    [(CRDefaultCaptureSessionManager *)self setExposureAdjustmentInProgressTimeoutCount:[(CRDefaultCaptureSessionManager *)self exposureAdjustmentInProgressTimeoutCount]- 1];
    if (![(CRDefaultCaptureSessionManager *)self exposureAdjustmentInProgressTimeoutCount])[(CRDefaultCaptureSessionManager *)self setExposureAdjustmentInProgress:0]; {
  }
    }
  if ([(CRDefaultCaptureSessionManager *)self exposureAdjustmentInProgress]) {
    goto LABEL_15;
  }
  [(CRDefaultCaptureSessionManager *)self highISOThresholdDuration];
  CMTime time = v39;
  if (CMTimeCompare(&time, &time2) < 0)
  {
    if ([(CRDefaultCaptureSessionManager *)self runningManualExposure])
    {
      id v36 = 0;
      [v4 lockForConfiguration:&v36];
      id v24 = v36;
      [v4 setExposureMode:2];
      [(CRDefaultCaptureSessionManager *)self setRunningManualExposure:0];
LABEL_24:
      [v4 unlockForConfiguration];
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  double v12 = v11 * v11;
  double v13 = log2(v12 / ((double)(int)v6 / 100.0 * Seconds));
  double v14 = v13 + v9;
  if (vabdd_f64(v13, v14) <= (double)[(CRDefaultCaptureSessionManager *)self exposure_table][24])
  {
LABEL_15:
    id v24 = 0;
    goto LABEL_16;
  }
  [(CRDefaultCaptureSessionManager *)self minISO];
  double v16 = v15;
  uint64_t v17 = *(void *)[(CRDefaultCaptureSessionManager *)self exposure_table];
  uint64_t v18 = v17 + 24 * (int)[(CRDefaultCaptureSessionManager *)self exposure_table][8];
  double v19 = log2(v12 / (*(double *)(v17 + 8) * ((double)(int)(*(double *)(v17 + 16) * v16) / 100.0)));
  int v20 = (int)((double)*(int *)v17
            + (v14 - v19)
            * ((double)(*(_DWORD *)(v18 - 24) - *(_DWORD *)v17)
             / (log2(v12 / (*(double *)(v18 - 16) * ((double)(int)(*(double *)(v18 - 8) * v16) / 100.0))) - v19))
            + 0.5);
  if (v20 < 0)
  {
    [(CRDefaultCaptureSessionManager *)self minISO];
    double v26 = v12 / (exp2(v14) * (v25 / 100.0));
    double v23 = 1.0;
    Float64 v22 = 0.00001;
    if (v26 >= 0.00001) {
      Float64 v22 = v26;
    }
  }
  else
  {
    if ([(CRDefaultCaptureSessionManager *)self exposure_table][8] <= v20) {
      int v20 = [(CRDefaultCaptureSessionManager *)self exposure_table][8] - 1;
    }
    uint64_t v21 = *(void *)[(CRDefaultCaptureSessionManager *)self exposure_table] + 24 * v20;
    Float64 v22 = *(double *)(v21 + 8);
    double v23 = *(double *)(v21 + 16);
  }
  CMTimeMakeWithSeconds(&v40, v22, 1000000000);
  [(CRDefaultCaptureSessionManager *)self maxISO];
  double v28 = v27;
  [(CRDefaultCaptureSessionManager *)self minISO];
  if (v23 * v29 <= v28)
  {
    [(CRDefaultCaptureSessionManager *)self minISO];
    float v31 = v23 * v32;
  }
  else
  {
    [(CRDefaultCaptureSessionManager *)self maxISO];
    float v31 = v30;
  }
  id v35 = 0;
  int v33 = [v4 lockForConfiguration:&v35];
  id v24 = v35;
  if (v33)
  {
    [(CRDefaultCaptureSessionManager *)self setExposureAdjustmentInProgressTimeoutCount:10];
    [(CRDefaultCaptureSessionManager *)self setExposureAdjustmentInProgress:1];
    [(CRDefaultCaptureSessionManager *)self setRunningManualExposure:1];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __55__CRDefaultCaptureSessionManager_highISOAdjustExposure__block_invoke;
    v34[3] = &unk_26429E110;
    v34[4] = self;
    CMTime time = v40;
    objc_msgSend(v4, "setExposureModeCustomWithDuration:ISO:completionHandler:", &time, v34, COERCE_DOUBLE(__PAIR64__(HIDWORD(v40.value), LODWORD(v31))));
    goto LABEL_24;
  }
LABEL_16:
}

uint64_t __55__CRDefaultCaptureSessionManager_highISOAdjustExposure__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExposureAdjustmentInProgress:0];
}

- (BOOL)isFocusPointOfInterestSupported
{
  v2 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  uint64_t v3 = [v2 device];
  char v4 = [v3 isFocusPointOfInterestSupported];

  return v4;
}

- (CGPoint)focusPointOfInterest
{
  v2 = [(CRDefaultCaptureSessionManager *)self deviceInput];
  uint64_t v3 = [v2 device];
  [v3 focusPointOfInterest];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (BOOL)isPreviewVideoMirrored
{
  v2 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  uint64_t v3 = [v2 connection];
  char v4 = [v3 isVideoMirrored];

  return v4;
}

- (CGRect)previewVisibleRect
{
  uint64_t v3 = [(CRDefaultCaptureSessionManager *)self avfPreviewLayer];
  char v4 = [(CRDefaultCaptureSessionManager *)self previewLayer];
  [v4 bounds];
  objc_msgSend(v3, "metadataOutputRectOfInterestForRect:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)cameraSessionWasInterrupted:(id)a3
{
  id v9 = a3;
  uint64_t v3 = [v9 name];
  int v4 = [v3 isEqualToString:*MEMORY[0x263EF97A0]];

  if (v4)
  {
    double v5 = [v9 userInfo];
    double v6 = [v5 valueForKey:*MEMORY[0x263EF9720]];
    uint64_t v7 = [v6 integerValue];

    if ((unint64_t)(v7 - 1) > 3) {
      double v8 = @"CoreRecogntion: Unable to display camera view due to connection inturrupted notification %@";
    }
    else {
      double v8 = off_26429E130[v7 - 1];
    }
    NSLog(&v8->isa, v9);
  }
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (NSString)cameraMode
{
  return self->_cameraMode;
}

- (void)setCameraMode:(id)a3
{
}

- (int64_t)whiteBalanceMode
{
  return self->_whiteBalanceMode;
}

- (void)setWhiteBalanceMode:(int64_t)a3
{
  self->_whiteBalanceMode = a3;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(int64_t)a3
{
  self->_focusMode = a3;
}

- (int64_t)exposureMode
{
  return self->_exposureMode;
}

- (void)setExposureMode:(int64_t)a3
{
  self->_exposureMode = a3;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int64_t)a3
{
  self->_torchMode = a3;
}

- (AVCaptureVideoDataOutputSampleBufferDelegate)captureSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSessionDelegate);
  return (AVCaptureVideoDataOutputSampleBufferDelegate *)WeakRetained;
}

- (void)setCaptureSessionDelegate:(id)a3
{
}

- (AVCaptureMetadataOutputObjectsDelegate)captureSessionMetadataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSessionMetadataDelegate);
  return (AVCaptureMetadataOutputObjectsDelegate *)WeakRetained;
}

- (void)setCaptureSessionMetadataDelegate:(id)a3
{
}

- (NSString)currentDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentDeviceID:(id)a3
{
}

- (BOOL)enableMetadataOutput
{
  return self->_enableMetadataOutput;
}

- (void)setEnableMetadataOutput:(BOOL)a3
{
  self->_enableMetadataOutput = a3;
}

- (int64_t)targetFocusDistance
{
  return self->_targetFocusDistance;
}

- (void)setTargetFocusDistance:(int64_t)a3
{
  self->_targetFocusDistance = a3;
}

- (CGSize)cameraResolution
{
  objc_copyStruct(v4, &self->_cameraResolution, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setCameraResolution:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_cameraResolution, &v3, 16, 1, 0);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)avfPreviewLayer
{
  return self->_avfPreviewLayer;
}

- (void)setAvfPreviewLayer:(id)a3
{
}

- (AVCaptureDeviceInput)deviceInput
{
  return self->_deviceInput;
}

- (void)setDeviceInput:(id)a3
{
}

- (AVCaptureVideoDataOutput)captureVideoDataOutput
{
  return self->_captureVideoDataOutput;
}

- (void)setCaptureVideoDataOutput:(id)a3
{
}

- (id)inputPortFormatObserver
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setInputPortFormatObserver:(id)a3
{
}

- (AVCaptureInputPort)inputPortFormatSender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputPortFormatSender);
  return (AVCaptureInputPort *)WeakRetained;
}

- (void)setInputPortFormatSender:(id)a3
{
}

- (float)maxISO
{
  return self->_maxISO;
}

- (void)setMaxISO:(float)a3
{
  self->_maxISO = a3;
}

- (float)minISO
{
  return self->_minISO;
}

- (void)setMinISO:(float)a3
{
  self->_minISO = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)highISOThresholdDuration
{
  objc_copyStruct(retstr, &self->_highISOThresholdDuration, 24, 1, 0);
  return result;
}

- (void)setHighISOThresholdDuration:(id *)a3
{
}

- (BOOL)exposureAdjustmentInProgress
{
  return self->_exposureAdjustmentInProgress;
}

- (void)setExposureAdjustmentInProgress:(BOOL)a3
{
  self->_exposureAdjustmentInProgress = a3;
}

- (int)exposureAdjustmentInProgressTimeoutCount
{
  return self->_exposureAdjustmentInProgressTimeoutCount;
}

- (void)setExposureAdjustmentInProgressTimeoutCount:(int)a3
{
  self->_exposureAdjustmentInProgressTimeoutCFIndex Count = a3;
}

- (BOOL)runningManualExposure
{
  return self->_runningManualExposure;
}

- (void)setRunningManualExposure:(BOOL)a3
{
  self->_runningManualExposure = a3;
}

- ($BE317D33594506163345F0F928572BFD)exposure_table
{
  return self->_exposure_table;
}

- (void)setExposure_table:(id *)a3
{
  self->_exposure_table = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputPortFormatSender);
  objc_storeStrong(&self->_inputPortFormatObserver, 0);
  objc_storeStrong((id *)&self->_captureVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_avfPreviewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_currentDeviceID, 0);
  objc_destroyWeak((id *)&self->_captureSessionMetadataDelegate);
  objc_destroyWeak((id *)&self->_captureSessionDelegate);
  objc_storeStrong((id *)&self->_cameraMode, 0);
}

@end