@interface JFXVideoCameraController
+ (BOOL)allowsDepthFromDualBackCamera;
+ (double)cameraZoomFactorForUIZoomFactor:(double)a3 captureDeviceType:(id)a4;
+ (id)sharedInstance;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)depthDimensions;
- (BOOL)ARKitEnabled;
- (BOOL)JFX_buildCaptureSessionGraphError:(id *)a3;
- (BOOL)JFX_configureCaptureSessionForCaptureDevice:(id)a3 error:(id *)a4;
- (BOOL)JFX_configureCaptureSesstionForPosition:(int64_t)a3 applyFFCZoom:(BOOL)a4 configureLockedCamera:(id)a5 error:(id *)a6;
- (BOOL)JFX_configureLockedCaptureDeviceCustomFormat:(id)a3 applyFFCZoom:(BOOL)a4;
- (BOOL)JFX_isARKitEnabledCaptureSessionQueue;
- (BOOL)JFX_isAudioEnabledCaptureSessionQueue;
- (BOOL)JFX_isDepthEnabledCaptureSessionQueue;
- (BOOL)JFX_isUsingInternalMicCaptureSessionQueue;
- (BOOL)JFX_setupCaptureSessionAudioError:(id *)a3;
- (BOOL)JFX_setupCaptureSessionDepthError:(id *)a3;
- (BOOL)JFX_setupCaptureSessionPhotoError:(id *)a3;
- (BOOL)JFX_setupCaptureSessionVideoDataOutputError:(id *)a3;
- (BOOL)allowARMetadata;
- (BOOL)allowARMetadata_queryDataQueue;
- (BOOL)audioEnabled;
- (BOOL)cameraSessionRunning;
- (BOOL)captureSessionRunning_queryDataQueue;
- (BOOL)depthEnabled;
- (BOOL)faceTrackingEnabled;
- (BOOL)hasFFCZoomEnabled;
- (BOOL)hasValidFaceData;
- (BOOL)hasValidFaceData_queryDataQueue;
- (BOOL)isFlashScene;
- (BOOL)isFlashScene_queryDataQueue;
- (BOOL)isRecordingMovie_captureSessionQueue;
- (BOOL)sessionRequiresFaceTracking;
- (BOOL)sessionRequiresFaceTracking_queryDataQueue;
- (BOOL)skipARProcessingWhenNoFaceDataIsPresent;
- (BOOL)skipARProcessingWhenNoFaceData_queryDataQueue;
- (CGSize)cameraFrameResolution_dataOutSynchQueue;
- (JFXARKitCameraSessionController)arCameraSessionController;
- (JFXARMetadata)mostRecentARMetadata;
- (JFXARMetadata)mostRecentARMetadata_queryDataQueue;
- (JFXCaptureCallObserver)callObserver;
- (JFXFaceAnchor)JFX_processPixelBufferForFaceTransform:(double)a3 cameraIntrinsics:(float)a4 forNormalizedFaceRect:(CGFloat)a5 withRollAngle:(CGFloat)a6 withTimestamp:(CGFloat)a7 andDuration:(CGFloat)a8 detectionOrientation:(float)a9 interfaceOrientation:(uint64_t)a10 needsMirroring:(__CVBuffer *)a11;
- (JFXFaceAnchor)stillImageFaceAnchor;
- (JFXFaceAnchor)stillImageFaceAnchor_queryDataQueue;
- (JFXVideoCameraController)init;
- (JFXVideoCameraThermalDelegate)thermalDelegate;
- (NSArray)metadataFaceObjectsArray_dataOutSynchQueue;
- (NSArray)metadataTrackedFacesArray_dataOutSynchQueue;
- (NSArray)pvDetectedFacesArray_dataOutSynchQueue;
- (NSNumber)currentlyTrackedFaceID;
- (NSNumber)largestDepthDimension;
- (NSString)cameraType_queryDataQueue;
- (NSString)ownerName;
- (PVFrameSet)capturedPhotoFrameSet_dataOutSynchQueue;
- (PVFrameSet)currentFrameSet_dataOutSynchQueue;
- (VCPCaptureAnalysisSession)vcpAnalyzer;
- (__n128)cameraDeviceIntrinsics_dataOutSynchQueue;
- (__n128)setCameraDeviceIntrinsics_dataOutSynchQueue:(__n128)a3;
- (double)cameraVideoMaxZoomFactor_captureSessionQueue;
- (double)cameraVideoZoomFactor_queryDataQueue;
- (double)zoomFactor;
- (id)JFX_createPVFrameSetFromPixelBuffer:(__CVBuffer *)a3 withMetadata:(id)a4 timeInterval:(double)a5 error:(id *)a6;
- (id)JFX_currentAVMetadataFaceObject:(id)a3;
- (id)JFX_getFormatForCaptureDevice:(id)a3 previewDimensions:(id)a4 colorSpace:(int64_t)a5;
- (id)JFX_updateCurrentlyTrackedFaceID:(id)a3;
- (id)cameraType;
- (id)createLivePlayerCameraSource;
- (id)debugFrameRateLabel;
- (id)updateCurrentlyTrackedFaceID:(id)a3;
- (int64_t)cachedMovieRecordingTorchMode;
- (int64_t)cameraColorSpace;
- (int64_t)cameraColorSpace_queryDataQueue;
- (int64_t)cameraMode;
- (int64_t)cameraMode_captureSessionQueue;
- (int64_t)cameraMode_dataOutSynchQueue;
- (int64_t)cameraMode_queryDataQueue;
- (int64_t)cameraPosition;
- (int64_t)captureVideoOrientation;
- (int64_t)captureVideoOrientation_dataOutSynchQueue;
- (int64_t)captureVideoOrientation_queryDataQueue;
- (int64_t)currentCameraPosition_captureSessionQueue;
- (int64_t)currentCameraPosition_dataOutSynchQueue;
- (int64_t)currentCameraPosition_queryDataQueue;
- (void)JFX_audioSessionRouteChangeNotification:(id)a3;
- (void)JFX_captureSessionDidStartRunningNotification:(id)a3;
- (void)JFX_captureSessionDidStopRunningNotification:(id)a3;
- (void)JFX_captureSessionInterruptionEndedNotification:(id)a3;
- (void)JFX_captureSessionRuntimeErrorNotification:(id)a3;
- (void)JFX_captureSessionWasInterruptedNotification:(id)a3;
- (void)JFX_configureCaptureSessionDataOutputSynchronizer;
- (void)JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery;
- (void)JFX_configureCaptureSessionMetadataForCaptureDevice:(id)a3;
- (void)JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern;
- (void)JFX_configureCaptureSessionMicrophoneForPosition:(int64_t)a3;
- (void)JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:(int64_t)a3;
- (void)JFX_configureCaptureSessionPreset;
- (void)JFX_configureCaptureSessionVideoDataOutput;
- (void)JFX_configureLockedCaptureDevice:(id)a3;
- (void)JFX_configureLockedCaptureDevice:(id)a3 minFrameRate:(int)a4 maxFrameRate:(int)a5;
- (void)JFX_configureLockedCaptureDeviceExposure:(id)a3 exposurePoint:(CGPoint)a4;
- (void)JFX_configureLockedCaptureDeviceFocus:(id)a3 focusPoint:(CGPoint)a4;
- (void)JFX_configureLockedCaptureDeviceForDepth:(id)a3;
- (void)JFX_configureLockedCaptureDeviceFrameRate:(id)a3;
- (void)JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:(id *)a3;
- (void)JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:(id)a3;
- (void)JFX_observeCaptureSessionNotifications:(id)a3;
- (void)JFX_orientationMonitorDeviceInterfaceOrientationNotification:(id)a3;
- (void)JFX_processMetadataObjectsDataOutSynchQueue:(id)a3;
- (void)JFX_rampToZoom:(double)a3 rate:(double)a4 durationCaptureSessionQueue:(double)a5;
- (void)JFX_resetSessionCaptureSessionQueue;
- (void)JFX_setCaptureDeviceType:(id)a3 captureDevicePositionCaptureSessionQueue:(int64_t)a4;
- (void)JFX_setIsFlashScene:(BOOL)a3;
- (void)JFX_setZoomFactor_captureSessionQueue:(double)a3;
- (void)JFX_setupARCameraSessionController;
- (void)JFX_startARCameraSessionController;
- (void)JFX_thermalPolicyOrLevelChangedNotification:(id)a3;
- (void)addAudioRenderDelegate:(id)a3;
- (void)addVideoRenderDelegate:(id)a3;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)capturePhotoWithFlash:(int64_t)a3 completion:(id)a4;
- (void)clear;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)dealloc;
- (void)didUpdateFrame:(id)a3;
- (void)enableRecordingMovieMode:(BOOL)a3 completion:(id)a4;
- (void)minFrameRate:(int *)a3 maxFrameRate:(int *)a4;
- (void)notifyExternalARKitFaceTrackedImageData:(id)a3 completion:(id)a4;
- (void)notifyExternalImageData:(id)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preProcessFrameWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 timestamp:(double)a5 completion:(id)a6;
- (void)prepareCameraForMode:(int64_t)a3 position:(int64_t)a4 completion:(id)a5;
- (void)rampToZoom:(double)a3 duration:(double)a4;
- (void)rampToZoom:(double)a3 rate:(double)a4;
- (void)removeAudioRenderDelegate:(id)a3 async:(BOOL)a4;
- (void)removeLivePlayerCameraSource:(id)a3;
- (void)removeVideoRenderDelegate:(id)a3 async:(BOOL)a4;
- (void)saveToPhotoLibrary:(id)a3;
- (void)scaleCurrentZoomFactor:(double)a3;
- (void)setAllowARMetadata:(BOOL)a3;
- (void)setAllowARMetadata_queryDataQueue:(BOOL)a3;
- (void)setArCameraSessionController:(id)a3;
- (void)setCachedMovieRecordingTorchMode:(int64_t)a3;
- (void)setCameraColorSpace_queryDataQueue:(int64_t)a3;
- (void)setCameraFrameResolution_dataOutSynchQueue:(CGSize)a3;
- (void)setCameraMode_captureSessionQueue:(int64_t)a3;
- (void)setCameraMode_dataOutSynchQueue:(int64_t)a3;
- (void)setCameraMode_queryDataQueue:(int64_t)a3;
- (void)setCameraType_queryDataQueue:(id)a3;
- (void)setCameraVideoMaxZoomFactor_captureSessionQueue:(double)a3;
- (void)setCameraVideoZoomFactor_queryDataQueue:(double)a3;
- (void)setCameraZoomFactorForUIZoomFactor:(double)a3;
- (void)setCaptureSessionRunning_queryDataQueue:(BOOL)a3;
- (void)setCaptureTorchMode:(int64_t)a3 completion:(id)a4;
- (void)setCaptureVideoOrientation_dataOutSynchQueue:(int64_t)a3;
- (void)setCaptureVideoOrientation_queryDataQueue:(int64_t)a3;
- (void)setCapturedPhotoFrameSet_dataOutSynchQueue:(id)a3;
- (void)setCurrentCameraPosition_captureSessionQueue:(int64_t)a3;
- (void)setCurrentCameraPosition_dataOutSynchQueue:(int64_t)a3;
- (void)setCurrentCameraPosition_queryDataQueue:(int64_t)a3;
- (void)setCurrentFrameSet_dataOutSynchQueue:(id)a3;
- (void)setCurrentlyTrackedFaceID:(id)a3;
- (void)setFFCZoom:(BOOL)a3 completion:(id)a4;
- (void)setFocusAndExposurePoint:(CGPoint)a3;
- (void)setHasValidFaceData:(BOOL)a3;
- (void)setHasValidFaceData_queryDataQueue:(BOOL)a3;
- (void)setIsFlashScene_queryDataQueue:(BOOL)a3;
- (void)setIsRecordingMovie_captureSessionQueue:(BOOL)a3;
- (void)setLargestDepthDimension:(id)a3;
- (void)setMetadataFaceObjectsArray_dataOutSynchQueue:(id)a3;
- (void)setMetadataTrackedFacesArray_dataOutSynchQueue:(id)a3;
- (void)setMinFrameRate:(int)a3 maxFrameRate:(int)a4;
- (void)setMostRecentARMetadata:(id)a3;
- (void)setMostRecentARMetadata_queryDataQueue:(id)a3;
- (void)setOwnerName:(id)a3;
- (void)setPvDetectedFacesArray_dataOutSynchQueue:(id)a3;
- (void)setSessionRequiresFaceTracking:(BOOL)a3;
- (void)setSessionRequiresFaceTracking_queryDataQueue:(BOOL)a3;
- (void)setSkipARProcessingWhenNoFaceDataIsPresent:(BOOL)a3;
- (void)setSkipARProcessingWhenNoFaceData_queryDataQueue:(BOOL)a3;
- (void)setStillImageFaceAnchor_queryDataQueue:(id)a3;
- (void)setThermalDelegate:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)startCameraSession:(id)a3;
- (void)stopCameraSession:(id)a3;
- (void)stopRampToZoom:(id)a3;
- (void)supportedFlashModes:(id)a3;
- (void)switchCamera:(id)a3;
- (void)switchCameraToPosition:(int64_t)a3 applyFFCZoom:(BOOL)a4 configureLockedCamera:(id)a5 completion:(id)a6;
- (void)switchCameraToPosition:(int64_t)a3 completion:(id)a4;
- (void)turnOffMicrophone;
- (void)turnOnMicrophone;
- (void)vcpAnalyzer;
- (void)videoAndAudioOutputSettings:(id)a3;
@end

@implementation JFXVideoCameraController

+ (void)initialize
{
  if (JFX_getFrontAndBackCameras_onceToken != -1) {
    dispatch_once(&JFX_getFrontAndBackCameras_onceToken, &__block_literal_global_662);
  }
}

- (JFXVideoCameraController)init
{
  v36.receiver = self;
  v36.super_class = (Class)JFXVideoCameraController;
  v2 = [(JFXVideoCameraController *)&v36 init];
  *((void *)v2 + 31) = 0;
  *((void *)v2 + 32) = 0;
  *((void *)v2 + 30) = 0;
  *((void *)v2 + 35) = 0;
  *((void *)v2 + 36) = 0;
  *((void *)v2 + 34) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v2 + 19) = _Q0;
  v2[190] = 1;
  *(_WORD *)(v2 + 185) = 0;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  v9 = (void *)*((void *)v2 + 17);
  *((void *)v2 + 17) = v8;

  uint64_t v10 = [MEMORY[0x263EFF9C0] set];
  v11 = (void *)*((void *)v2 + 19);
  *((void *)v2 + 19) = v10;

  uint64_t v12 = [MEMORY[0x263EFF9C0] set];
  v13 = (void *)*((void *)v2 + 21);
  *((void *)v2 + 21) = v12;

  dispatch_queue_t v14 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.captureSession", 0);
  v15 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v14;

  dispatch_queue_t v16 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.audioOutput", 0);
  v17 = (void *)*((void *)v2 + 12);
  *((void *)v2 + 12) = v16;

  dispatch_queue_t v18 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.dataOutSync", 0);
  v19 = (void *)*((void *)v2 + 13);
  *((void *)v2 + 13) = v18;

  dispatch_queue_t v20 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.queryDataQueue", MEMORY[0x263EF83A8]);
  v21 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v20;

  dispatch_queue_t v22 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.videoDelegate", 0);
  v23 = (void *)*((void *)v2 + 18);
  *((void *)v2 + 18) = v22;

  dispatch_queue_t v24 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.audioDelegate", 0);
  v25 = (void *)*((void *)v2 + 20);
  *((void *)v2 + 20) = v24;

  dispatch_queue_t v26 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.livePlayerSource", 0);
  v27 = (void *)*((void *)v2 + 22);
  *((void *)v2 + 22) = v26;

  v28 = (void *)*((void *)v2 + 27);
  *((void *)v2 + 27) = 0;

  v2[192] = 0;
  *((void *)v2 + 40) = 0;
  v29 = (void *)*((void *)v2 + 28);
  *((void *)v2 + 28) = 0;

  v2[187] = 1;
  uint64_t v30 = objc_opt_new();
  v31 = (void *)*((void *)v2 + 51);
  *((void *)v2 + 51) = v30;

  v32 = [MEMORY[0x263F08A00] defaultCenter];
  [v32 addObserver:v2 selector:sel_JFX_thermalPolicyOrLevelChangedNotification_ name:@"JFXThermalMonitorLevelChangedNotification" object:0];

  v33 = [MEMORY[0x263F08A00] defaultCenter];
  [v33 addObserver:v2 selector:sel_JFX_thermalPolicyOrLevelChangedNotification_ name:@"JFXThermalPolicyChangedNotification" object:0];

  v34 = [MEMORY[0x263F08A00] defaultCenter];
  [v34 addObserver:v2 selector:sel_JFX_orientationMonitorDeviceInterfaceOrientationNotification_ name:@"kJFXOrientationMonitorDeviceInterfaceOrientationNotification" object:0];

  return (JFXVideoCameraController *)v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a6 == sAVCapturePhotoOutputIsFlashScene)
  {
    dispatch_queue_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    uint64_t v15 = [v14 BOOLValue];

    [(JFXVideoCameraController *)self JFX_setIsFlashScene:v15];
  }
  else if (a6 == sAVCaptureDeviceSystemPressureState)
  {
    [(JFXVideoCameraController *)self JFX_thermalPolicyOrLevelChangedNotification:0];
  }
  else if (a6 == &sAVCaptureDeviceVideoZoomFactor)
  {
    dispatch_queue_t v16 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    [v16 doubleValue];
    uint64_t v18 = v17;

    queryDataQueue = self->_queryDataQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__JFXVideoCameraController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_264C0A3A0;
    block[4] = self;
    block[5] = v18;
    dispatch_barrier_async(queryDataQueue, block);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)JFXVideoCameraController;
    [(JFXVideoCameraController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __75__JFXVideoCameraController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraVideoZoomFactor_queryDataQueue:", *(double *)(a1 + 40));
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)JFXVideoCameraController;
  [(JFXVideoCameraController *)&v2 dealloc];
}

- (VCPCaptureAnalysisSession)vcpAnalyzer
{
  vcpAnalyzer = self->_vcpAnalyzer;
  if (!vcpAnalyzer)
  {
    v4 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoCameraController vcpAnalyzer]();
    }

    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v9[0] = *MEMORY[0x263F000D0];
    v9[1] = v5;
    v9[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    v6 = [MEMORY[0x263F54030] analyzerForAnalysisTypes:2 withPreferredTransform:v9 properties:0];
    v7 = self->_vcpAnalyzer;
    self->_vcpAnalyzer = v6;

    vcpAnalyzer = self->_vcpAnalyzer;
  }
  return vcpAnalyzer;
}

- (void)clear
{
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__JFXVideoCameraController_clear__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(dataOutSynchQueue, block);
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__JFXVideoCameraController_clear__block_invoke_2;
  v5[3] = &unk_264C09FA8;
  v5[4] = self;
  dispatch_barrier_async(queryDataQueue, v5);
}

uint64_t __33__JFXVideoCameraController_clear__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentFrameSet_dataOutSynchQueue:", 0);
  objc_super v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setCapturedPhotoFrameSet_dataOutSynchQueue:", 0);
}

uint64_t __33__JFXVideoCameraController_clear__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentARMetadata_queryDataQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStillImageFaceAnchor_queryDataQueue:", 0);
  objc_super v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setHasValidFaceData_queryDataQueue:", 0);
}

- (int64_t)cameraMode
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__JFXVideoCameraController_cameraMode__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__JFXVideoCameraController_cameraMode__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "cameraMode_queryDataQueue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)cameraSessionRunning
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_cameraSessionRunning__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__JFXVideoCameraController_cameraSessionRunning__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "captureSessionRunning_queryDataQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)cameraColorSpace
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__JFXVideoCameraController_cameraColorSpace__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__JFXVideoCameraController_cameraColorSpace__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "cameraColorSpace_queryDataQueue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)audioEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__JFXVideoCameraController_audioEnabled__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(captureSessionQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__JFXVideoCameraController_audioEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "JFX_isAudioEnabledCaptureSessionQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)depthEnabled
{
  char v3 = [MEMORY[0x263F1C5C0] currentDevice];
  int v4 = objc_msgSend(v3, "jfx_hasDepthCapableCamera");

  if (!v4) {
    return 0;
  }
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__JFXVideoCameraController_depthEnabled__block_invoke;
  v8[3] = &unk_264C09EE8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(captureSessionQueue, v8);
  BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __40__JFXVideoCameraController_depthEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "JFX_isDepthEnabledCaptureSessionQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)hasFFCZoomEnabled
{
  char v3 = [MEMORY[0x263F1C5C0] currentDevice];
  int v4 = objc_msgSend(v3, "jfx_hasTrueDepthFrontCameraCustomZoomFormat");

  if (!v4) {
    return 0;
  }
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__JFXVideoCameraController_hasFFCZoomEnabled__block_invoke;
  v8[3] = &unk_264C0A668;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(captureSessionQueue, v8);
  BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __45__JFXVideoCameraController_hasFFCZoomEnabled__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  if (objc_msgSend(v3, "jfx_trueDepthCamera"))
  {
    objc_super v2 = [*(id *)(*(void *)(a1 + 32) + 8) sessionPreset];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isEqualToString:*MEMORY[0x263EF9768]];
  }
}

- (BOOL)isFlashScene
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__JFXVideoCameraController_isFlashScene__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__JFXVideoCameraController_isFlashScene__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isFlashScene_queryDataQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)depthDimensions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2810000000;
  char v9 = &unk_234D77F97;
  uint64_t v10 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__JFXVideoCameraController_depthDimensions__block_invoke;
  block[3] = &unk_264C0A668;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  $2825F4736939C4A6D3AD43837233062D v3 = ($2825F4736939C4A6D3AD43837233062D)v7[4];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CMVideoDimensions __43__JFXVideoCameraController_depthDimensions__block_invoke(uint64_t a1)
{
  CMVideoDimensions result = (CMVideoDimensions)objc_msgSend(*(id *)(a1 + 32), "JFX_isDepthEnabledCaptureSessionQueue");
  if (result.width)
  {
    $2825F4736939C4A6D3AD43837233062D v3 = [*(id *)(*(void *)(a1 + 32) + 24) device];
    int v4 = [v3 activeDepthDataFormat];
    long long v5 = (const opaqueCMFormatDescription *)[v4 formatDescription];

    CMVideoDimensions result = CMVideoFormatDescriptionGetDimensions(v5);
    *(CMVideoDimensions *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  }
  return result;
}

- (double)zoomFactor
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__JFXVideoCameraController_zoomFactor__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__JFXVideoCameraController_zoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "cameraVideoZoomFactor_queryDataQueue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  captureSessionQueue = self->_captureSessionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__JFXVideoCameraController_setZoomFactor___block_invoke;
  v4[3] = &unk_264C0A3A0;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(captureSessionQueue, v4);
}

uint64_t __42__JFXVideoCameraController_setZoomFactor___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cameraVideoMaxZoomFactor_captureSessionQueue");
  if (v2 > v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraVideoMaxZoomFactor_captureSessionQueue");
    double v2 = v4;
  }
  long long v5 = *(void **)(a1 + 32);
  return objc_msgSend(v5, "JFX_setZoomFactor_captureSessionQueue:", v2);
}

- (void)setThermalDelegate:(id)a3
{
  id v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__JFXVideoCameraController_setThermalDelegate___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __47__JFXVideoCameraController_setThermalDelegate___block_invoke(uint64_t a1)
{
}

- (BOOL)ARKitEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__JFXVideoCameraController_ARKitEnabled__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(captureSessionQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__JFXVideoCameraController_ARKitEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "JFX_isARKitEnabledCaptureSessionQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMostRecentARMetadata:(id)a3
{
  id v4 = a3;
  queryDataQueue = self->_queryDataQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__JFXVideoCameraController_setMostRecentARMetadata___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queryDataQueue, v7);
}

unsigned char *__52__JFXVideoCameraController_setMostRecentARMetadata___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[187]) {
    return (unsigned char *)objc_msgSend(result, "setMostRecentARMetadata_queryDataQueue:", *(void *)(a1 + 40));
  }
  return result;
}

- (JFXARMetadata)mostRecentARMetadata
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_mostRecentARMetadata__block_invoke;
  v5[3] = &unk_264C0A668;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JFXARMetadata *)v3;
}

unsigned char *__48__JFXVideoCameraController_mostRecentARMetadata__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[187])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(result, "mostRecentARMetadata_queryDataQueue");
    return (unsigned char *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setSessionRequiresFaceTracking:(BOOL)a3
{
  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__JFXVideoCameraController_setSessionRequiresFaceTracking___block_invoke;
  v4[3] = &unk_264C0A0C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

uint64_t __59__JFXVideoCameraController_setSessionRequiresFaceTracking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSessionRequiresFaceTracking_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)sessionRequiresFaceTracking
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__JFXVideoCameraController_sessionRequiresFaceTracking__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__JFXVideoCameraController_sessionRequiresFaceTracking__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "sessionRequiresFaceTracking_queryDataQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setSkipARProcessingWhenNoFaceDataIsPresent:(BOOL)a3
{
  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__JFXVideoCameraController_setSkipARProcessingWhenNoFaceDataIsPresent___block_invoke;
  v4[3] = &unk_264C0A0C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

uint64_t __71__JFXVideoCameraController_setSkipARProcessingWhenNoFaceDataIsPresent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSkipARProcessingWhenNoFaceData_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)skipARProcessingWhenNoFaceDataIsPresent
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__JFXVideoCameraController_skipARProcessingWhenNoFaceDataIsPresent__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__JFXVideoCameraController_skipARProcessingWhenNoFaceDataIsPresent__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "skipARProcessingWhenNoFaceData_queryDataQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (JFXFaceAnchor)stillImageFaceAnchor
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_stillImageFaceAnchor__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JFXFaceAnchor *)v3;
}

uint64_t __48__JFXVideoCameraController_stillImageFaceAnchor__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "stillImageFaceAnchor_queryDataQueue");
  return MEMORY[0x270F9A758]();
}

- (void)setAllowARMetadata:(BOOL)a3
{
  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__JFXVideoCameraController_setAllowARMetadata___block_invoke;
  v4[3] = &unk_264C0A0C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

void __47__JFXVideoCameraController_setAllowARMetadata___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowARMetadata_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 384);
    *(void *)(v2 + 384) = 0;
  }
}

- (BOOL)allowARMetadata
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__JFXVideoCameraController_allowARMetadata__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__JFXVideoCameraController_allowARMetadata__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "allowARMetadata_queryDataQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setHasValidFaceData:(BOOL)a3
{
  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__JFXVideoCameraController_setHasValidFaceData___block_invoke;
  v4[3] = &unk_264C0A0C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

uint64_t __48__JFXVideoCameraController_setHasValidFaceData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasValidFaceData_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)hasValidFaceData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__JFXVideoCameraController_hasValidFaceData__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__JFXVideoCameraController_hasValidFaceData__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "hasValidFaceData_queryDataQueue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)JFX_observeCaptureSessionNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel_JFX_captureSessionDidStartRunningNotification_ name:*MEMORY[0x263EF9700] object:v5];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_JFX_captureSessionDidStopRunningNotification_ name:*MEMORY[0x263EF9708] object:v5];

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_JFX_captureSessionWasInterruptedNotification_ name:*MEMORY[0x263EF97A0] object:v5];

  char v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_JFX_captureSessionInterruptionEndedNotification_ name:*MEMORY[0x263EF9718] object:v5];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_JFX_captureSessionRuntimeErrorNotification_ name:*MEMORY[0x263EF9798] object:v5];
}

- (void)JFX_captureSessionDidStartRunningNotification:(id)a3
{
  id v4 = a3;
  id v5 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[JFXVideoCameraController JFX_captureSessionDidStartRunningNotification:]();
  }

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__JFXVideoCameraController_JFX_captureSessionDidStartRunningNotification___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);
}

uint64_t __74__JFXVideoCameraController_JFX_captureSessionDidStartRunningNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 1);
}

- (void)JFX_captureSessionDidStopRunningNotification:(id)a3
{
  id v4 = a3;
  id v5 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[JFXVideoCameraController JFX_captureSessionDidStopRunningNotification:]();
  }

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_JFX_captureSessionDidStopRunningNotification___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);
}

uint64_t __73__JFXVideoCameraController_JFX_captureSessionDidStopRunningNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 0);
}

- (void)JFX_captureSessionWasInterruptedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263EF9720]];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [v4 userInfo];
  uint64_t v9 = *MEMORY[0x263EF9728];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263EF9728]];

  switch(v7)
  {
    case 1:
      id v11 = kCaptureSessionInterruptionVideoDeviceNotAvailableInBackground;
      goto LABEL_7;
    case 2:
      id v11 = kCaptureSessionInterruptionAudioDeviceInUseByAnotherClient;
      goto LABEL_7;
    case 3:
      id v11 = kCaptureSessionInterruptionVideoDeviceInUseByAnotherClient;
      goto LABEL_7;
    case 4:
      id v11 = kCaptureSessionInterruptionVideoDeviceNotAvailableWithMultipleForegroundApps;
LABEL_7:
      char v12 = *v11;
      break;
    case 5:
      v19 = [v4 userInfo];
      objc_super v20 = [v19 objectForKeyedSubscript:v9];

      char v12 = [NSString stringWithFormat:@"%@(%@)", @"VideoDeviceNotAvailableDueToSystemPressure", v20];

      break;
    default:
      char v12 = 0;
      break;
  }
  v13 = JFXLog_camera();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v4;
    __int16 v26 = 2112;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEFAULT, "AVCaptureSessionWasInterruptedNotification: %@\tReason: %@\tAVCaptureSystemPressureState: %@", buf, 0x20u);
  }

  dispatch_queue_t v14 = +[JFXAnalyticsManager sharedInstance];
  [v14 trackEventWithName:v12];

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_JFX_captureSessionWasInterruptedNotification___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);
  v22[0] = @"JTCaptureSessionInterruptedKey";
  v22[1] = @"JTCaptureSessionReasonInterruptedKey";
  v23[0] = MEMORY[0x263EFFA88];
  dispatch_queue_t v16 = [NSNumber numberWithInteger:v7];
  v23[1] = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 postNotificationName:@"JTCaptureSessionInterruptedNotification" object:self userInfo:v17];
}

uint64_t __73__JFXVideoCameraController_JFX_captureSessionWasInterruptedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 0);
}

- (void)JFX_captureSessionInterruptionEndedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = JFXLog_camera();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "AVCaptureSessionInterruptionEndedNotification: %@", buf, 0xCu);
  }

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__JFXVideoCameraController_JFX_captureSessionInterruptionEndedNotification___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = @"JTCaptureSessionInterruptedKey";
  uint64_t v11 = MEMORY[0x263EFFA80];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 postNotificationName:@"JTCaptureSessionInterruptedNotification" object:self userInfo:v8];
}

uint64_t __76__JFXVideoCameraController_JFX_captureSessionInterruptionEndedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 1);
}

- (void)JFX_captureSessionRuntimeErrorNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = JFXLog_camera();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "AVCaptureSessionRuntimeErrorNotification: %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EF9710]];
  captureSessionQueue = self->_captureSessionQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke;
  v11[3] = &unk_264C09F10;
  id v12 = v7;
  id v13 = self;
  id v9 = v7;
  id v10 = captureSessionQueue;
  dispatch_async(v10, v11);
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) code];
  char v3 = *(void **)(a1 + 40);
  if (v2 == -11819)
  {
    id v4 = (void *)v3[1];
    [v4 startRunning];
  }
  else
  {
    uint64_t v5 = objc_msgSend(v3, "cameraMode_captureSessionQueue");
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "currentCameraPosition_captureSessionQueue");
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(*(void *)(a1 + 40) + 136)];
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(*(void *)(a1 + 40) + 152)];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_2;
    v11[3] = &unk_264C0BA38;
    uint64_t v14 = v5;
    uint64_t v15 = v6;
    id v12 = v7;
    id v13 = v8;
    id v9 = v8;
    id v10 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[JFXVideoCameraController sharedInstance];
  [v2 prepareCameraForMode:0 position:0 completion:0];

  char v3 = +[JFXVideoCameraController sharedInstance];
  [v3 prepareCameraForMode:*(void *)(a1 + 48) position:*(void *)(a1 + 56) completion:0];

  [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_41];
  [*(id *)(a1 + 40) enumerateObjectsUsingBlock:&__block_literal_global_69_0];
  id v4 = +[JFXVideoCameraController sharedInstance];
  [v4 startCameraSession:&__block_literal_global_72];
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[JFXVideoCameraController sharedInstance];
  [v3 addVideoRenderDelegate:v2];
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[JFXVideoCameraController sharedInstance];
  [v3 addAudioRenderDelegate:v2];
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_5_cold_1();
  }
}

- (void)JFX_thermalPolicyOrLevelChangedNotification:(id)a3
{
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

void __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke_2;
  v3[3] = &unk_264C0BA60;
  v3[4] = *(void *)(a1 + 32);
  JFX_configureCaptureDevice(v2, v3);
}

uint64_t __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceFrameRate:", a2);
}

- (void)JFX_orientationMonitorDeviceInterfaceOrientationNotification:(id)a3
{
  int64_t v4 = +[JFXOrientationMonitor deviceInterfaceOrientation];
  captureSessionQueue = self->_captureSessionQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke;
  v6[3] = &unk_264C0A3A0;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(captureSessionQueue, v6);
}

void __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke_2;
  v4[3] = &unk_264C0BA88;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = v1;
  void v4[5] = v3;
  JFX_configureCaptureSession(v2, v4);
}

uint64_t __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:", *(void *)(a1 + 40));
}

- (void)JFX_audioSessionRouteChangeNotification:(id)a3
{
  int64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263EF9268]];
  uint64_t v6 = [v5 integerValue];

  captureSessionQueue = self->_captureSessionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke;
  v8[3] = &unk_264C0A3A0;
  v8[4] = self;
  v8[5] = v6;
  dispatch_async(captureSessionQueue, v8);
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2;
  v4[3] = &unk_264C0BA88;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = v1;
  void v4[5] = v3;
  JFX_configureCaptureSession(v2, v4);
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend(*(id *)(a1 + 32), "JFX_isUsingInternalMicCaptureSessionQueue");
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 == 2)
  {
    if (v4)
    {
      uint64_t v7 = JFXLog_DebugCamera();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_2();
      }

      objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern");
    }
  }
  else if (v5 == 1 && (v4 & 1) == 0)
  {
    uint64_t v6 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_1();
    }

    [v3 setAutomaticallyConfiguresApplicationAudioSession:1];
  }
}

+ (BOOL)allowsDepthFromDualBackCamera
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_msgSend(v3, "jfx_hasDualBackCamera")) {
    char v4 = [v2 BOOLForKey:@"allowsDepthDualBackCamera"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_78);
  }
  [(id)s_sharedInstanceLock lock];
  if (!s_sharedInstance)
  {
    id v2 = objc_alloc_init(JFXVideoCameraController);
    id v3 = (void *)s_sharedInstance;
    s_sharedInstance = (uint64_t)v2;
  }
  [(id)s_sharedInstanceLock unlock];
  char v4 = (void *)s_sharedInstance;
  return v4;
}

uint64_t __42__JFXVideoCameraController_sharedInstance__block_invoke()
{
  s_sharedInstanceLock = (uint64_t)objc_alloc_init(MEMORY[0x263F08958]);
  return MEMORY[0x270F9A758]();
}

- (void)prepareCameraForMode:(int64_t)a3 position:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  captureSessionQueue = self->_captureSessionQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke;
  v14[3] = &unk_264C0BAB0;
  if (a3) {
    BOOL v10 = a4 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int64_t v16 = a3;
  int64_t v17 = a4;
  char v11 = v10;
  if (v10) {
    id v12 = (void (*)(OS_dispatch_queue *, void *))MEMORY[0x263EF8868];
  }
  else {
    id v12 = (void (*)(OS_dispatch_queue *, void *))MEMORY[0x263EF8838];
  }
  v14[4] = self;
  id v15 = v8;
  char v18 = v11;
  id v13 = v8;
  v12(captureSessionQueue, v14);
}

void __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (objc_msgSend(*(id *)(a1 + 32), "cameraMode_captureSessionQueue") == *(void *)(a1 + 48)
    && objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue") == *(void *)(a1 + 56))
  {
LABEL_5:
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      char v4 = MEMORY[0x263EF83A0];
      dispatch_async(v4, v3);
    }
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "JFX_resetSessionCaptureSessionQueue");
  if (*(unsigned char *)(a1 + 64))
  {
    [(id)s_sharedInstanceLock lock];
    id v2 = (void *)s_sharedInstance;
    s_sharedInstance = 0;

    [(id)s_sharedInstanceLock unlock];
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCameraMode_captureSessionQueue:", *(void *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 112);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_3;
  block[3] = &unk_264C0A3A0;
  uint64_t v7 = *(void *)(a1 + 48);
  block[4] = v5;
  void block[5] = v7;
  dispatch_barrier_async(v6, block);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 104);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_4;
  v27[3] = &unk_264C0A3A0;
  uint64_t v10 = *(void *)(a1 + 48);
  v27[4] = v8;
  v27[5] = v10;
  dispatch_async(v9, v27);
  char v11 = *(void **)(a1 + 32);
  id v26 = 0;
  int v12 = objc_msgSend(v11, "JFX_buildCaptureSessionGraphError:", &v26);
  id v13 = v26;
  uint64_t v14 = v13;
  if (!v12)
  {
    id v18 = v13;
LABEL_14:
    objc_super v20 = JFXLog_camera();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromJFXCameraMode(*(void *)(a1 + 48));
      dispatch_queue_t v24 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      v32 = v24;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_error_impl(&dword_234C41000, v20, OS_LOG_TYPE_ERROR, "error building capture graph for camera mode %@ position: %@\n\t%@", buf, 0x20u);
    }
    [(id)s_sharedInstanceLock lock];
    v21 = (void *)s_sharedInstance;
    s_sharedInstance = 0;

    [(id)s_sharedInstanceLock unlock];
    v19 = v18;
    goto LABEL_17;
  }
  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 56);
  id v25 = v14;
  int v17 = objc_msgSend(v15, "JFX_configureCaptureSesstionForPosition:applyFFCZoom:configureLockedCamera:error:", v16, 1, 0, &v25);
  id v18 = v25;

  if (!v17) {
    goto LABEL_14;
  }
  v19 = 0;
  if (v18) {
    goto LABEL_14;
  }
LABEL_17:
  dispatch_queue_t v22 = *(void **)(a1 + 40);
  if (v22) {
    dispatch_async(MEMORY[0x263EF83A0], v22);
  }
}

uint64_t __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraMode_queryDataQueue:", *(void *)(a1 + 40));
}

uint64_t __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraMode_dataOutSynchQueue:", *(void *)(a1 + 40));
}

- (void)startCameraSession:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__JFXVideoCameraController_startCameraSession___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __47__JFXVideoCameraController_startCameraSession___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 8) isRunning] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "JFX_startARCameraSessionController");
    kdebug_trace();
    [*(id *)(*(void *)(a1 + 32) + 8) startRunning];
    kdebug_trace();
  }
  id v2 = +[JTMotionData sharedInstance];
  [v2 startMotion];

  kdebug_trace();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__JFXVideoCameraController_startCameraSession___block_invoke_2;
  block[3] = &unk_264C0A3F0;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__JFXVideoCameraController_startCameraSession___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopCameraSession:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__JFXVideoCameraController_stopCameraSession___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __46__JFXVideoCameraController_stopCameraSession___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) isRunning])
  {
    kdebug_trace();
    [*(id *)(*(void *)(a1 + 32) + 8) stopRunning];
    kdebug_trace();
  }
  id v2 = +[JTMotionData sharedInstance];
  [v2 stopMotion];

  id v3 = [*(id *)(a1 + 32) arCameraSessionController];
  [v3 stopARSession];

  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__JFXVideoCameraController_stopCameraSession___block_invoke_2;
    block[3] = &unk_264C0A3F0;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __46__JFXVideoCameraController_stopCameraSession___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (id)cameraType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__JFXVideoCameraController_cameraType__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__JFXVideoCameraController_cameraType__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "cameraType_queryDataQueue");
  return MEMORY[0x270F9A758]();
}

- (int64_t)cameraPosition
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__JFXVideoCameraController_cameraPosition__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__JFXVideoCameraController_cameraPosition__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_queryDataQueue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)captureVideoOrientation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__JFXVideoCameraController_captureVideoOrientation__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__JFXVideoCameraController_captureVideoOrientation__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "captureVideoOrientation_queryDataQueue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)switchCamera:(id)a3
{
  id v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__JFXVideoCameraController_switchCamera___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __41__JFXVideoCameraController_switchCamera___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue") == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__JFXVideoCameraController_switchCamera___block_invoke_2;
  v4[3] = &unk_264C0BAD8;
  uint64_t v6 = v2;
  int64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 switchCameraToPosition:v2 completion:v4];
}

uint64_t __41__JFXVideoCameraController_switchCamera___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (a2) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v5;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v6, a2);
  }
  return result;
}

- (void)switchCameraToPosition:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke;
  block[3] = &unk_264C0B6A0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(captureSessionQueue, block);
}

void __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue") == *(void *)(a1 + 48))
  {
    if (*(void *)(a1 + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke_2;
      block[3] = &unk_264C0A3F0;
      id v4 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "switchCameraToPosition:applyFFCZoom:configureLockedCamera:completion:");
  }
}

uint64_t __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)switchCameraToPosition:(int64_t)a3 applyFFCZoom:(BOOL)a4 configureLockedCamera:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke;
  block[3] = &unk_264C0BB00;
  BOOL v19 = a4;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a3;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(captureSessionQueue, block);
}

void __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v17 = 0;
  uint64_t v6 = objc_msgSend(v4, "JFX_configureCaptureSesstionForPosition:applyFFCZoom:configureLockedCamera:error:", v2, v3, v5, &v17);
  id v7 = v17;
  id v8 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
    int v12 = [NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138413058;
    BOOL v19 = v10;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_debug_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEBUG, "[JFX_configureCaptureSesstionForPosition:%@ applyFFCZoom:%@ configureLockedCamera:error:] result: %@, error: %@", buf, 0x2Au);
  }
  if (v7) {
    int v9 = 0;
  }
  else {
    int v9 = v6;
  }
  if (v9 == 1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_83;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = *(void *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  [*(id *)(a1 + 32) setMostRecentARMetadata:0];
  if (*(void *)(a1 + 48))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_2;
    v13[3] = &unk_264C0AF38;
    id v15 = *(id *)(a1 + 48);
    id v14 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

void __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_83(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setInteger:*(void *)(a1 + 32) forKey:@"JTLastCameraPositionDefault"];
}

uint64_t __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (double)cameraZoomFactorForUIZoomFactor:(double)a3 captureDeviceType:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:*MEMORY[0x263EF9648]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x263EF9628]])
  {
    a3 = a3 + a3;
  }

  return a3;
}

- (void)setCameraZoomFactorForUIZoomFactor:(double)a3
{
  captureSessionQueue = self->_captureSessionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke;
  v4[3] = &unk_264C0A3A0;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(captureSessionQueue, v4);
}

void __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  uint64_t v3 = [v2 deviceType];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke_2;
  block[3] = &unk_264C0A6E0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  void block[4] = v4;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke_2(uint64_t a1)
{
  [(id)objc_opt_class() cameraZoomFactorForUIZoomFactor:*(void *)(a1 + 40) captureDeviceType:*(double *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setZoomFactor:");
}

- (void)scaleCurrentZoomFactor:(double)a3
{
  [(JFXVideoCameraController *)self zoomFactor];
  double v6 = v5 * a3;
  [(JFXVideoCameraController *)self setZoomFactor:v6];
}

- (void)setFFCZoom:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__JFXVideoCameraController_setFFCZoom_completion___block_invoke;
  v8[3] = &unk_264C0BB28;
  id v9 = v6;
  id v7 = v6;
  [(JFXVideoCameraController *)self switchCameraToPosition:2 applyFFCZoom:v4 configureLockedCamera:0 completion:v8];
}

uint64_t __50__JFXVideoCameraController_setFFCZoom_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rampToZoom:(double)a3 rate:(double)a4
{
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__JFXVideoCameraController_rampToZoom_rate___block_invoke;
  block[3] = &unk_264C0BB50;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  *(double *)&void block[6] = a4;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __44__JFXVideoCameraController_rampToZoom_rate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_rampToZoom:rate:durationCaptureSessionQueue:", *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);
}

- (void)rampToZoom:(double)a3 duration:(double)a4
{
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__JFXVideoCameraController_rampToZoom_duration___block_invoke;
  block[3] = &unk_264C0BB50;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  *(double *)&void block[6] = a4;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __48__JFXVideoCameraController_rampToZoom_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_rampToZoom:rate:durationCaptureSessionQueue:", *(double *)(a1 + 40), 0.0, *(double *)(a1 + 48));
}

- (void)stopRampToZoom:(id)a3
{
  id v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__JFXVideoCameraController_stopRampToZoom___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __43__JFXVideoCameraController_stopRampToZoom___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  JFX_configureCaptureDevice(v2, &__block_literal_global_86);

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__JFXVideoCameraController_stopRampToZoom___block_invoke_3;
  v4[3] = &unk_264C0A3C8;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __43__JFXVideoCameraController_stopRampToZoom___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancelVideoZoomRamp];
}

uint64_t __43__JFXVideoCameraController_stopRampToZoom___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) zoomFactor];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)minFrameRate:(int *)a3 maxFrameRate:(int *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3810000000;
  int64_t v18 = &unk_234D77F97;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3810000000;
  id v11 = &unk_234D77F97;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__JFXVideoCameraController_minFrameRate_maxFrameRate___block_invoke;
  block[3] = &unk_264C0BB98;
  void block[4] = self;
  void block[5] = &v15;
  void block[6] = &v8;
  dispatch_sync(captureSessionQueue, block);
  *a3 = *((int *)v9 + 10) / v9[4];
  *a4 = *((int *)v16 + 10) / v16[4];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v15, 8);
}

void __54__JFXVideoCameraController_minFrameRate_maxFrameRate___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) device];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 activeVideoMinFrameDuration];
  }
  else
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
  }
  uint64_t v4 = *(void *)(a1[5] + 8);
  *(_OWORD *)(v4 + 32) = v10;
  *(void *)(v4 + 48) = v11;

  id v5 = [*(id *)(a1[4] + 24) device];
  id v6 = v5;
  if (v5)
  {
    [v5 activeVideoMaxFrameDuration];
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  *(_OWORD *)(v7 + 32) = v8;
  *(void *)(v7 + 48) = v9;
}

- (void)setMinFrameRate:(int)a3 maxFrameRate:(int)a4
{
  captureSessionQueue = self->_captureSessionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke;
  v5[3] = &unk_264C0A3A0;
  v5[4] = self;
  int v6 = a3;
  int v7 = a4;
  dispatch_async(captureSessionQueue, v5);
}

void __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke_2;
  v3[3] = &unk_264C0BBC0;
  v3[4] = *(void *)(a1 + 32);
  void v3[5] = *(void *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);
}

uint64_t __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDevice:minFrameRate:maxFrameRate:", a2, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (void)setFocusAndExposurePoint:(CGPoint)a3
{
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke;
  block[3] = &unk_264C0BB50;
  void block[4] = self;
  CGPoint v5 = a3;
  dispatch_async(captureSessionQueue, block);
}

void __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke_2;
  v3[3] = &unk_264C0BBE8;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);
}

void __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  id v6 = a2;
  objc_msgSend(v3, "JFX_configureLockedCaptureDeviceFocus:focusPoint:", v6, v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)debugFrameRateLabel
{
  uint64_t v7 = 0;
  [(JFXVideoCameraController *)self minFrameRate:(char *)&v7 + 4 maxFrameRate:&v7];
  if (HIDWORD(v7) == v7)
  {
    id v2 = objc_msgSend(NSNumber, "numberWithInt:");
    uint64_t v3 = [v2 stringValue];
  }
  else
  {
    double v4 = NSString;
    id v2 = objc_msgSend(NSNumber, "numberWithInt:");
    double v5 = [NSNumber numberWithInt:v7];
    uint64_t v3 = [v4 stringWithFormat:@"%@-%@", v2, v5];
  }
  return v3;
}

- (void)videoAndAudioOutputSettings:(id)a3
{
  id v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF9898];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) recommendedVideoSettingsForAssetWriterWithOutputFileType:*MEMORY[0x263EF9898]];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 48) recommendedAudioSettingsForAssetWriterWithOutputFileType:v2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke_2;
  block[3] = &unk_264C0A5A8;
  id v5 = *(id *)(a1 + 40);
  id v10 = v4;
  id v11 = v5;
  id v9 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setCaptureTorchMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke;
  block[3] = &unk_264C0B6A0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(captureSessionQueue, block);
}

void __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  if ([v2 hasTorch])
  {
    int v3 = [v2 isTorchModeSupported:*(void *)(a1 + 48)];
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    if (v3)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_2;
      v8[3] = &unk_264C0BC10;
      uint64_t v4 = *(void *)(a1 + 48);
      void v8[4] = &v9;
      v8[5] = v4;
      JFX_configureCaptureDevice(v2, v8);
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
  }
  if (*(void *)(a1 + 40))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_3;
    v5[3] = &unk_264C0BC38;
    id v6 = *(id *)(a1 + 40);
    id v7 = &v9;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 setTorchMode:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)enableRecordingMovieMode:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke;
  block[3] = &unk_264C0BC80;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(captureSessionQueue, block);
}

void __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend(*(id *)(a1 + 32), "isRecordingMovie_captureSessionQueue");
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 == v2)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v4 = *(void **)(a1 + 40);
      id v5 = MEMORY[0x263EF83A0];
      dispatch_async(v5, v4);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRecordingMovie_captureSessionQueue:", v3 != 0);
    id v6 = [*(id *)(*(void *)(a1 + 32) + 24) device];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_2;
    v12[3] = &__block_descriptor_33_e25_v16__0__AVCaptureDevice_8l;
    char v13 = *(unsigned char *)(a1 + 48);
    JFX_configureCaptureDevice(v6, v12);
    uint64_t v7 = [v6 torchMode];
    id v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      [v8 setCachedMovieRecordingTorchMode:v7];
      if (v7 == 2)
      {
        if ([*(id *)(*(void *)(a1 + 32) + 72) isFlashScene]) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = 2;
        }
      }
    }
    else
    {
      uint64_t v7 = [v8 cachedMovieRecordingTorchMode];
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_3;
    v10[3] = &unk_264C0B058;
    uint64_t v9 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v9 setCaptureTorchMode:v7 completion:v10];
  }
}

void __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isSmoothAutoFocusSupported])
  {
    [v4 setSmoothAutoFocusEnabled:*(unsigned __int8 *)(a1 + 32)];
    uint64_t v3 = [v4 focusMode];
    if ([v4 isFocusModeSupported:v3]) {
      [v4 setFocusMode:v3];
    }
  }
}

void __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 32));
  }
}

- (void)supportedFlashModes:(id)a3
{
  id v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__JFXVideoCameraController_supportedFlashModes___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionQueue, v7);
}

void __48__JFXVideoCameraController_supportedFlashModes___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 72) supportedFlashModes];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_supportedFlashModes___block_invoke_2;
  v5[3] = &unk_264C0AF38;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __48__JFXVideoCameraController_supportedFlashModes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)capturePhotoWithFlash:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke;
  block[3] = &unk_264C0B6A0;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(captureSessionQueue, block);
}

void __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke(uint64_t a1)
{
  v44[2] = *MEMORY[0x263EF8340];
  char v2 = objc_msgSend(*(id *)(a1 + 32), "JFX_isARKitEnabledCaptureSessionQueue");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 112);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_2;
  block[3] = &unk_264C0A0C0;
  char v36 = v2;
  void block[4] = v3;
  dispatch_barrier_async(v4, block);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 104);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_3;
  v34[3] = &unk_264C09FA8;
  v34[4] = v5;
  dispatch_async(v6, v34);
  uint64_t v7 = MEMORY[0x237DD15A0](*(void *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 128);
  *(void *)(v8 + 128) = v7;

  uint64_t v10 = *MEMORY[0x263EFA380];
  v44[0] = *MEMORY[0x263EFA370];
  v44[1] = v10;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v31 != v14) {
        objc_enumerationMutation(v11);
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(*((void *)&v30 + 1) + 8 * v15));
      id v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "availablePhotoCodecTypes", (void)v30);
      char v17 = [v16 containsObject:*(void *)(*(void *)(a1 + 32) + 120)];

      if (v17) {
        break;
      }
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void **)(v18 + 120);
      *(void *)(v18 + 120) = 0;

      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v43 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v23 = (void *)MEMORY[0x263EFA628];
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 120);
    uint64_t v41 = *MEMORY[0x263EFA338];
    uint64_t v42 = v24;
    id v25 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    __int16 v22 = [v23 photoSettingsWithFormat:v25];

    if (!v22) {
      goto LABEL_15;
    }
    uint64_t v26 = [*(id *)(a1 + 32) ownerName];

    if (v26)
    {
      uint64_t v39 = *MEMORY[0x263F0F248];
      uint64_t v37 = *MEMORY[0x263F0F218];
      v27 = [*(id *)(a1 + 32) ownerName];
      v38 = v27;
      __int16 v28 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v40 = v28;
      v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [v22 setMetadata:v29];
    }
    objc_msgSend(v22, "setMaxPhotoDimensions:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "maxPhotoDimensions"));
    [v22 setFlashMode:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "capturePhotoWithSettings:delegate:", v22);
  }
  else
  {
LABEL_9:
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(v20 + 120);
    *(void *)(v20 + 120) = 0;

    __int16 v22 = v11;
  }

LABEL_15:
}

void __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mostRecentARMetadata_queryDataQueue");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    char v2 = [v3 faceAnchor];
    objc_msgSend(*(id *)(a1 + 32), "setStillImageFaceAnchor_queryDataQueue:", v2);
  }
}

void __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "currentFrameSet_dataOutSynchQueue");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCapturedPhotoFrameSet_dataOutSynchQueue:", v2);
}

- (id)createLivePlayerCameraSource
{
  id v3 = objc_alloc_init(MEMORY[0x263F612C8]);
  livePlayerSourceQueue = self->_livePlayerSourceQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__JFXVideoCameraController_createLivePlayerCameraSource__block_invoke;
  _OWORD v9[3] = &unk_264C09F10;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_async(livePlayerSourceQueue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

uint64_t __56__JFXVideoCameraController_createLivePlayerCameraSource__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) addObject:*(void *)(a1 + 40)];
}

- (void)removeLivePlayerCameraSource:(id)a3
{
  id v4 = a3;
  livePlayerSourceQueue = self->_livePlayerSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__JFXVideoCameraController_removeLivePlayerCameraSource___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(livePlayerSourceQueue, v7);
}

uint64_t __57__JFXVideoCameraController_removeLivePlayerCameraSource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) removeObject:*(void *)(a1 + 40)];
}

- (void)addVideoRenderDelegate:(id)a3
{
  id v4 = a3;
  videoDelegateQueue = self->_videoDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__JFXVideoCameraController_addVideoRenderDelegate___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(videoDelegateQueue, v7);
}

uint64_t __51__JFXVideoCameraController_addVideoRenderDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(a1 + 40)];
}

- (void)removeVideoRenderDelegate:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  videoDelegateQueue = self->_videoDelegateQueue;
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke;
    block[3] = &unk_264C09F10;
    void block[4] = self;
    uint64_t v9 = &v13;
    id v13 = v6;
    dispatch_async(videoDelegateQueue, block);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke_2;
    v10[3] = &unk_264C09F10;
    void v10[4] = self;
    uint64_t v9 = &v11;
    id v11 = v6;
    dispatch_sync(videoDelegateQueue, v10);
  }
}

uint64_t __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(a1 + 40)];
}

uint64_t __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(a1 + 40)];
}

- (void)addAudioRenderDelegate:(id)a3
{
  id v4 = a3;
  audioDelegateQueue = self->_audioDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__JFXVideoCameraController_addAudioRenderDelegate___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(audioDelegateQueue, v7);
}

uint64_t __51__JFXVideoCameraController_addAudioRenderDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) addObject:*(void *)(a1 + 40)];
}

- (void)removeAudioRenderDelegate:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  audioDelegateQueue = self->_audioDelegateQueue;
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke;
    block[3] = &unk_264C09F10;
    void block[4] = self;
    uint64_t v9 = &v13;
    id v13 = v6;
    dispatch_async(audioDelegateQueue, block);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke_2;
    v10[3] = &unk_264C09F10;
    void v10[4] = self;
    uint64_t v9 = &v11;
    id v11 = v6;
    dispatch_sync(audioDelegateQueue, v10);
  }
}

uint64_t __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) removeObject:*(void *)(a1 + 40)];
}

uint64_t __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) removeObject:*(void *)(a1 + 40)];
}

- (void)saveToPhotoLibrary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoCameraController saveToPhotoLibrary:]();
    }

    id v6 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke;
    v11[3] = &unk_264C09FA8;
    id v12 = v3;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke_2;
    v8[3] = &unk_264C0BCA8;
    id v9 = v12;
    dispatch_semaphore_t v10 = v4;
    id v7 = v4;
    [v6 performChanges:v11 completionHandler:v8];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F14D20] creationRequestForAssetFromVideoAtFileURL:*(void *)(a1 + 32)];
}

void __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"Success";
    if (!a2) {
      id v8 = v5;
    }
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_debug_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEBUG, "Finished saving %@. %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)preProcessFrameWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 timestamp:(double)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  CMTimeMakeWithSeconds(&v20, a5, 1000000000);
  CMTime time = v20;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  CVPixelBufferRetain(a3);
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke;
  v15[3] = &unk_264C0BCD0;
  v15[4] = self;
  id v16 = v10;
  double v19 = a5;
  id v17 = v11;
  uint64_t v18 = a3;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(dataOutSynchQueue, v15);
}

void __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = *(double *)(a1 + 64);
  id v11 = 0;
  id v6 = objc_msgSend(v3, "JFX_createPVFrameSetFromPixelBuffer:withMetadata:timeInterval:error:", v2, v4, &v11, v5);
  id v7 = v11;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  CMTimeMakeWithSeconds(&v10, *(Float64 *)(a1 + 64), 1000000000);
  CMTime time = v10;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  if (v7)
  {
    id v8 = JFXLog_camera();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:", v6);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
  }
}

- (void)notifyExternalARKitFaceTrackedImageData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 cameraIntrinsics];
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__JFXVideoCameraController_notifyExternalARKitFaceTrackedImageData_completion___block_invoke;
  v17[3] = &unk_264C0BCF8;
  uint64_t v26 = self;
  id v27 = v6;
  int v18 = v9;
  v17[4] = v10;
  int v19 = 0;
  int v21 = v11;
  uint64_t v20 = v12;
  int v22 = 0;
  int v24 = v13;
  uint64_t v23 = v14;
  int v25 = 0;
  id v28 = v7;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(dataOutSynchQueue, v17);
}

uint64_t __79__JFXVideoCameraController_notifyExternalARKitFaceTrackedImageData_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 80), "setCaptureVideoOrientation_dataOutSynchQueue:", objc_msgSend(*(id *)(a1 + 88), "orientation"));
  objc_msgSend(*(id *)(a1 + 80), "setCameraDeviceIntrinsics_dataOutSynchQueue:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[*(id *)(a1 + 88) pixelBuffer]);
  objc_msgSend(*(id *)(a1 + 80), "setCameraFrameResolution_dataOutSynchQueue:", Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 88), "pixelBuffer")));
  objc_msgSend(*(id *)(a1 + 80), "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", 0, objc_msgSend(*(id *)(a1 + 88), "cameraPosition"));
  if ([*(id *)(a1 + 88) hasValidFaceData]) {
    uint64_t v3 = [*(id *)(a1 + 80) faceTrackingEnabled];
  }
  else {
    uint64_t v3 = 0;
  }
  [*(id *)(a1 + 80) setHasValidFaceData:v3];
  if ([*(id *)(a1 + 80) sessionRequiresFaceTracking]) {
    int v4 = 0;
  }
  else {
    int v4 = [*(id *)(a1 + 88) requiresFaceTracking] ^ 1;
  }
  int v5 = [*(id *)(a1 + 80) skipARProcessingWhenNoFaceDataIsPresent];
  id v6 = *(void **)(a1 + 80);
  if (v5 && v4 | v3 ^ 1)
  {
    uint64_t v7 = [*(id *)(a1 + 88) pixelBuffer];
    [*(id *)(a1 + 88) timestamp];
    return objc_msgSend(v6, "preProcessFrameWithPixelBuffer:metadata:timestamp:completion:", v7, 0, 0);
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 80), "JFX_isARKitEnabledCaptureSessionQueue") & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 80), "JFX_setupARCameraSessionController");
    }
    objc_msgSend(*(id *)(a1 + 80), "JFX_startARCameraSessionController");
    uint64_t result = *(void *)(a1 + 96);
    if (result)
    {
      int v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  return result;
}

- (void)notifyExternalImageData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 cameraIntrinsics];
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke;
  v17[3] = &unk_264C0BCF8;
  uint64_t v26 = self;
  id v27 = v6;
  int v18 = v9;
  v17[4] = v10;
  int v19 = 0;
  int v21 = v11;
  uint64_t v20 = v12;
  int v22 = 0;
  int v24 = v13;
  uint64_t v23 = v14;
  int v25 = 0;
  id v28 = v7;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(dataOutSynchQueue, v17);
}

void __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke(uint64_t a1)
{
  v42[1] = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 80), "setCaptureVideoOrientation_dataOutSynchQueue:", objc_msgSend(*(id *)(a1 + 88), "orientation"));
  objc_msgSend(*(id *)(a1 + 80), "setCameraDeviceIntrinsics_dataOutSynchQueue:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[*(id *)(a1 + 88) pixelBuffer]);
  objc_msgSend(*(id *)(a1 + 80), "setCameraFrameResolution_dataOutSynchQueue:", Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 88), "pixelBuffer")));
  objc_msgSend(*(id *)(a1 + 80), "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", 0, objc_msgSend(*(id *)(a1 + 88), "cameraPosition"));
  if ([*(id *)(a1 + 88) hasValidFaceData]) {
    uint64_t v3 = [*(id *)(a1 + 80) faceTrackingEnabled];
  }
  else {
    uint64_t v3 = 0;
  }
  [*(id *)(a1 + 80) setHasValidFaceData:v3];
  if ([*(id *)(a1 + 80) sessionRequiresFaceTracking])
  {
    if (!v3)
    {
LABEL_6:
      int v4 = 0;
      goto LABEL_10;
    }
  }
  else if ((v3 & [*(id *)(a1 + 88) requiresFaceTracking] & 1) == 0)
  {
    goto LABEL_6;
  }
  [*(id *)(a1 + 88) normalizedFaceRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [*(id *)(a1 + 88) rollAngle];
  memset(&v40, 0, sizeof(v40));
  [*(id *)(a1 + 88) timestamp];
  CMTimeMakeWithSeconds(&v40, v13, 1000000);
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, 1, [*(id *)(a1 + 88) captureFramesPerSecond]);
  v43.origin.x = v6;
  v43.origin.y = v8;
  v43.size.width = v10;
  v43.size.height = v12;
  int v4 = 0;
  if (!CGRectEqualToRect(v43, *MEMORY[0x263F001A8]))
  {
    uint64_t v14 = *(void **)(a1 + 80);
    uint64_t v15 = [*(id *)(a1 + 88) pixelBuffer];
    [*(id *)(a1 + 88) cameraIntrinsics];
    CMTime v38 = v40;
    CMTime v37 = v39;
    int v4 = objc_msgSend(v14, "JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:", v15, &v38, &v37, 4, 1, 1);
  }
LABEL_10:
  [*(id *)(a1 + 88) cameraIntrinsics];
  HIDWORD(v16) = 0;
  HIDWORD(v17) = 0;
  long long v33 = v17;
  long long v34 = v16;
  HIDWORD(v18) = 0;
  long long v32 = v18;
  int v19 = [JFXARMetadata alloc];
  uint64_t v20 = v19;
  if (v4)
  {
    uint64_t v21 = -[JFXARMetadata initWithFaceAnchor:cameraIntrinsics:](v19, "initWithFaceAnchor:cameraIntrinsics:", v4, *(double *)&v34, *(double *)&v33, *(double *)&v32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "cameraFrameResolution_dataOutSynchQueue");
    uint64_t v21 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](v20, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48), *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48), v34, v33, v32, v22, v23);
  }
  int v24 = (void *)v21;
  int v25 = *(void **)(a1 + 80);
  uint64_t v26 = [*(id *)(a1 + 88) pixelBuffer];
  uint64_t v41 = @"PVFrameSetMetadataARMetadataKey";
  v42[0] = v24;
  id v27 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
  [*(id *)(a1 + 88) timestamp];
  double v29 = v28;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke_2;
  v35[3] = &unk_264C0BD20;
  v35[4] = *(void *)(a1 + 80);
  id v30 = v24;
  id v36 = v30;
  [v25 preProcessFrameWithPixelBuffer:v26 metadata:v27 timestamp:v35 completion:v29];

  uint64_t v31 = *(void *)(a1 + 96);
  if (v31) {
    (*(void (**)(void))(v31 + 16))();
  }
}

uint64_t __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setMostRecentARMetadata:*(void *)(result + 40)];
  }
  return result;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  CFRetain(a4);
  audioDelegateQueue = self->_audioDelegateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
  v8[3] = &unk_264C0A3A0;
  void v8[4] = self;
  v8[5] = a4;
  dispatch_async(audioDelegateQueue, v8);
}

void __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) allObjects];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2;
  v5[3] = &unk_264C0BD48;
  long long v6 = *(_OWORD *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v5];

  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 160);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_4;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v3, block);
}

void __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 160);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3;
  v7[3] = &unk_264C0A3A0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) processAudioSample:*(void *)(a1 + 40)];
}

void __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_4(uint64_t a1)
{
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:self->_videoOutput];

  if (!v6) {
    goto LABEL_64;
  }
  kdebug_trace();
  double v7 = [v5 objectForKeyedSubscript:self->_videoOutput];
  int v8 = [v7 sampleBufferWasDropped];
  uint64_t v9 = (opaqueCMSampleBuffer *)[v7 sampleBuffer];
  CGFloat v10 = v9;
  if (v8)
  {
    CFTypeRef v11 = CMGetAttachment(v9, (CFStringRef)*MEMORY[0x263F01040], 0);
    CGFloat v12 = v11;
    if (v11 && !CFEqual(v11, (CFTypeRef)*MEMORY[0x263F01078]) && !CFEqual(v12, (CFTypeRef)*MEMORY[0x263F01080])) {
      CFEqual(v12, (CFTypeRef)*MEMORY[0x263F01070]);
    }
    kdebug_trace();
    Float64 v13 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.5();
    }

    memset(&v84, 0, sizeof(v84));
    CMSampleBufferGetPresentationTimeStamp(&v84, v10);
    CMTime v83 = v84;
    [(JFXVideoCameraController *)self JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:&v83];
    CGFloat v10 = 0;
  }
  if (self->_depthOutput)
  {
    uint64_t v14 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ([v14 depthDataWasDropped])
    {
      [v14 droppedReason];
      kdebug_trace();
      uint64_t v15 = JFXLog_DebugCamera();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.4(v14);
      }

      id v16 = 0;
      LOBYTE(v8) = 1;
    }
    else
    {
      id v16 = [v14 depthData];
    }
  }
  else
  {
    id v16 = 0;
  }
  [(JFXVideoCameraController *)self setPvDetectedFacesArray_dataOutSynchQueue:0];
  [(JFXVideoCameraController *)self setMetadataFaceObjectsArray_dataOutSynchQueue:0];
  [(JFXVideoCameraController *)self setMetadataTrackedFacesArray_dataOutSynchQueue:0];
  long long v17 = [v5 objectForKeyedSubscript:self->_metadataOutput];
  long long v18 = [(AVCaptureMetadataOutput *)self->_metadataOutput metadataObjectTypes];
  v79 = v18;
  if (v17)
  {
    int v19 = [v17 metadataObjects];
    [(JFXVideoCameraController *)self JFX_processMetadataObjectsDataOutSynchQueue:v19];
LABEL_26:

    goto LABEL_27;
  }
  if ([v18 containsObject:*MEMORY[0x263EF9F58]])
  {
    int v19 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:]();
    }
    LOBYTE(v8) = 1;
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v21 = [(JFXVideoCameraController *)self pvDetectedFacesArray_dataOutSynchQueue];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = [(JFXVideoCameraController *)self pvDetectedFacesArray_dataOutSynchQueue];
    int v24 = (void *)[v23 copy];
    [v20 setObject:v24 forKeyedSubscript:*MEMORY[0x263F616B0]];
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v25 = [objc_alloc(MEMORY[0x263F61228]) initWithSampleBuffer:v10];
    uint64_t v26 = (void *)v25;
    if (v16)
    {
      id v27 = (void *)v25;
      double v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v29 = [v28 BOOLForKey:@"JFXDepthPreQuantization"];

      if (v29)
      {
        id v16 = v16;
        id v30 = (__CVBuffer *)[v16 depthDataMap];
        if (v30)
        {
          CVPixelBufferRef v31 = copySimulatedL010RoundtripImage(v30);
          if (v31)
          {
            long long v32 = v31;
            id v82 = 0;
            long long v33 = [v16 depthDataByReplacingDepthDataMapWithPixelBuffer:v31 error:&v82];
            id v77 = v82;
            if (v77)
            {
              v75 = v33;
              long long v34 = JFXLog_camera();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:]();
              }

              long long v33 = v75;
            }
            else
            {

              id v16 = v33;
            }
            CVPixelBufferRelease(v32);
          }
        }
      }
      uint64_t v26 = v27;
    }
    v78 = (void *)[objc_alloc(MEMORY[0x263F61258]) initWithColorBuffer:v26 depthData:v16 metadata:v20];
    if (self->_runningARKit_dataOutSynchQueue)
    {
      if ([v79 containsObject:*MEMORY[0x263EF9F58]])
      {
        uint64_t v35 = [(JFXVideoCameraController *)self metadataTrackedFacesArray_dataOutSynchQueue];
        uint64_t v36 = [v35 count];

        if (v36)
        {
          CMTime v37 = [(JFXVideoCameraController *)self arCameraSessionController];
          CMTime v38 = [(JFXVideoCameraController *)self metadataTrackedFacesArray_dataOutSynchQueue];
          CMTime v39 = (void *)[v38 copy];
          [MEMORY[0x263EFF8C0] array];
          id v40 = v16;
          uint64_t v41 = v7;
          v43 = uint64_t v42 = v26;
          [v37 provideSensorFrameSet:v78 trackedFacesMetadata:v39 faceObjectsMetadata:v43];

          uint64_t v26 = v42;
          double v7 = v41;
          id v16 = v40;
        }
        else
        {
          v71 = JFXLog_DebugCamera();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
            -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:]();
          }
        }
      }
    }
    else
    {
      v76 = v26;
      if ([(JFXVideoCameraController *)self faceTrackingEnabled])
      {
        v44 = [(JFXVideoCameraController *)self metadataFaceObjectsArray_dataOutSynchQueue];
        v45 = (void *)[v44 copy];
        v46 = [(JFXVideoCameraController *)self JFX_currentAVMetadataFaceObject:v45];

        float v47 = 0.0;
        if ([v46 hasRollAngle])
        {
          [v46 rollAngle];
          float v47 = v48;
        }
        [(JFXVideoCameraController *)self cameraDeviceIntrinsics_dataOutSynchQueue];
        HIDWORD(v49) = 0;
        HIDWORD(v50) = 0;
        long long v73 = v50;
        long long v74 = v49;
        HIDWORD(v51) = 0;
        long long v72 = v51;
        [v46 bounds];
        double x = v85.origin.x;
        double y = v85.origin.y;
        double width = v85.size.width;
        double height = v85.size.height;
        if (CGRectEqualToRect(v85, *MEMORY[0x263F001A8])) {
          goto LABEL_51;
        }
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v10);
        memset(&v84, 0, sizeof(v84));
        CMSampleBufferGetPresentationTimeStamp(&v84, v10);
        memset(&v83, 0, sizeof(v83));
        CMSampleBufferGetDuration(&v83, v10);
        int64_t v57 = +[JFXOrientationMonitor interfaceOrientation];
        int64_t v58 = [(JFXVideoCameraController *)self captureVideoOrientation_dataOutSynchQueue];
        CMTime v81 = v84;
        CMTime v80 = v83;
        *(float *)&double v59 = v47;
        uint64_t v60 = -[JFXVideoCameraController JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:](self, "JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:", ImageBuffer, &v81, &v80, v58, v57, 1, *(double *)&v74, *(double *)&v73, *(double *)&v72, x, y, width, height, v59);
        if (!v60)
        {
LABEL_51:
          v63 = [JFXARMetadata alloc];
          [(JFXVideoCameraController *)self cameraFrameResolution_dataOutSynchQueue];
          v62 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](v63, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48), *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48), v74, v73, v72, v64, v65);
        }
        else
        {
          v61 = (void *)v60;
          v62 = -[JFXARMetadata initWithFaceAnchor:cameraIntrinsics:]([JFXARMetadata alloc], "initWithFaceAnchor:cameraIntrinsics:", v60, *(double *)&v74, *(double *)&v73, *(double *)&v72);
        }
        [v20 setObject:v62 forKeyedSubscript:@"PVFrameSetMetadataARMetadataKey"];
        [(JFXVideoCameraController *)self setMostRecentARMetadata:v62];
      }
      v66 = CMSampleBufferGetImageBuffer(v10);
      CFDictionaryRef v67 = CVBufferCopyAttachments(v66, kCVAttachmentMode_ShouldPropagate);
      Value = CFDictionaryGetValue(v67, (const void *)*MEMORY[0x263F03ED8]);
      v69 = CFDictionaryGetValue(v67, (const void *)*MEMORY[0x263F03FC0]);
      if (!Value || !v69)
      {
        v70 = [MEMORY[0x263F61230] rec709GammaColorSpace];
        objc_msgSend(v70, "jfx_attachColorSpaceToPixelBuffer:", v66);
      }
      uint64_t v26 = v76;
      if (v67) {
        CFRelease(v67);
      }
      [v78 setMetadataDict:v20];
      [(JFXVideoCameraController *)self JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:v78];
    }
  }
  kdebug_trace();

LABEL_64:
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke;
  block[3] = &unk_264C0A888;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(captureSessionQueue, block);
}

void __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  BOOL v4 = v3 == (void *)*MEMORY[0x263EFA370];
  *(void *)(v2 + 120) = 0;

  id v5 = (void *)MEMORY[0x237DD15A0](*(void *)(*(void *)(a1 + 32) + 128));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_2;
  block[3] = &unk_264C0BD70;
  void block[4] = v8;
  id v12 = *(id *)(a1 + 40);
  BOOL v15 = v4;
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v10 = v5;
  dispatch_async(v9, block);
}

void __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "capturedPhotoFrameSet_dataOutSynchQueue");
  objc_msgSend(*(id *)(a1 + 32), "setCapturedPhotoFrameSet_dataOutSynchQueue:", 0);
  id v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_3;
  block[3] = &unk_264C0BD70;
  id v6 = v2;
  id v7 = *(id *)(a1 + 40);
  char v10 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v4 = v2;
  dispatch_async(v3, block);
}

void __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v3)
  {
    id v4 = v3;
LABEL_5:

    id v5 = 0;
    id v2 = 0;
    goto LABEL_6;
  }
  id v11 = 0;
  id v5 = +[JFXMediaURLManager capturedPhotoURL:&v11 isHEIF:*(unsigned __int8 *)(a1 + 64)];
  id v6 = v11;
  if (v6)
  {
    id v4 = v6;

    goto LABEL_5;
  }
  id v7 = [*(id *)(a1 + 48) fileDataRepresentation];
  id v10 = 0;
  int v8 = [v7 writeToURL:v5 options:1 error:&v10];
  id v9 = v10;
  id v4 = v9;
  if (!v8 || v9)
  {

    id v5 = 0;
    id v2 = 0;
  }

LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)JFX_processMetadataObjectsDataOutSynchQueue:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263EFF980] array];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__16;
  uint64_t v36 = __Block_byref_object_dispose__16;
  id v37 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke;
  v25[3] = &unk_264C0BDC0;
  id v8 = v6;
  id v26 = v8;
  id v27 = self;
  id v9 = v5;
  id v28 = v9;
  id v30 = v38;
  CVPixelBufferRef v31 = &v32;
  id v10 = v7;
  id v29 = v10;
  [v4 enumerateObjectsUsingBlock:v25];
  if ([(JFXVideoCameraController *)self currentCameraPosition_dataOutSynchQueue] == 2)
  {
    id v11 = (void *)v33[5];
    if (v11)
    {
      [v11 bounds];
      CGFloat x = v40.origin.x;
      CGFloat y = v40.origin.y;
      CGFloat width = v40.size.width;
      CGFloat height = v40.size.height;
      CGFloat MidX = CGRectGetMidX(v40);
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = height;
      CGFloat MidY = CGRectGetMidY(v41);
      captureSessionQueue = self->_captureSessionQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_3;
      block[3] = &unk_264C0BB50;
      void block[4] = self;
      *(CGFloat *)&void block[5] = MidX;
      *(CGFloat *)&void block[6] = MidY;
      dispatch_async(captureSessionQueue, block);
    }
  }
  queryDataQueue = self->_queryDataQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  void v23[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_5;
  v23[3] = &unk_264C0A668;
  v23[4] = self;
  v23[5] = v38;
  dispatch_barrier_async(queryDataQueue, v23);
  uint64_t v20 = (void *)[v9 copy];
  [(JFXVideoCameraController *)self setPvDetectedFacesArray_dataOutSynchQueue:v20];

  uint64_t v21 = (void *)[v8 copy];
  [(JFXVideoCameraController *)self setMetadataFaceObjectsArray_dataOutSynchQueue:v21];

  uint64_t v22 = (void *)[v10 copy];
  [(JFXVideoCameraController *)self setMetadataTrackedFacesArray_dataOutSynchQueue:v22];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);
}

void __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 type];
  int v6 = [v5 isEqualToString:*MEMORY[0x263EF9F08]];

  id v7 = [v4 type];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EF9F58]];

  if (v6)
  {
    id v9 = (AVMetadataFaceObject *)v4;
    [*(id *)(a1 + 32) addObject:v9];
    id v10 = MakePVFaceDetection(v9, (AVCaptureVideoOrientation)objc_msgSend(*(id *)(a1 + 40), "captureVideoOrientation_dataOutSynchQueue"));
    [*(id *)(a1 + 48) addObject:v10];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    id v12 = (id *)(v11 + 40);
    if (!v13) {
      objc_storeStrong(v12, a2);
    }
  }
  else if (v8)
  {
    id v14 = v4;
    [*(id *)(a1 + 56) addObject:v14];
    BOOL v15 = [v14 payload];
    if ([v15 count])
    {
      id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F26AB8]];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_2;
      v17[3] = &unk_264C0BD98;
      v17[4] = *(void *)(a1 + 64);
      [v16 enumerateObjectsUsingBlock:v17];
    }
  }
}

void __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *MEMORY[0x263F26A18];
  id v11 = v6;
  int v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F26A18]];

  if (v8)
  {
    id v9 = [v11 objectForKeyedSubscript:v7];
    int v10 = [v9 intValue];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 == 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_4;
  v3[3] = &unk_264C0BBE8;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);
}

uint64_t __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasValidFaceData_queryDataQueue:", *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:(id *)a3
{
  videoDelegateQueue = self->_videoDelegateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke;
  v4[3] = &unk_264C0A300;
  void v4[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  dispatch_async(videoDelegateQueue, v4);
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 136) allObjects];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_2;
  v3[3] = &unk_264C0BDE8;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_3;
  v6[3] = &unk_264C0A300;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    long long v4 = *(_OWORD *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 droppedVideoFrame:&v4];
  }
  return result;
}

- (void)JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:(id)a3
{
  id v4 = a3;
  AVCaptureDevicePosition v5 = [(JFXVideoCameraController *)self cameraPosition];
  int64_t v6 = +[JFXOrientationMonitor interfaceOrientation];
  int64_t v7 = +[JFXOrientationMonitor deviceInterfaceOrientation];
  if ([(JFXVideoCameraController *)self cameraMode])
  {
    UIInterfaceOrientation v8 = v6;
  }
  else
  {
    int64_t v7 = 1;
    UIInterfaceOrientation v8 = UIInterfaceOrientationPortrait;
  }
  uint64_t v9 = +[JTMotionData sharedInstance];
  [v9 currentOrientation];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v9 rollRadians];
  double v19 = v18;
  AVCaptureVideoOrientation v20 = [(JFXVideoCameraController *)self captureVideoOrientation_dataOutSynchQueue];
  v38.CGFloat x = v11;
  v38.CGFloat y = v13;
  v38.z = v15;
  v38.w = v17;
  uint64_t v21 = MakePVCameraFrameMetadata(v5, v38, v19, v8, v20);
  [v4 setMetadataObject:v21 forKey:*MEMORY[0x263F61650]];
  uint64_t v22 = [NSNumber numberWithInteger:v7];
  [v4 setMetadataObject:v22 forKey:@"PVFrameSetMetadataDeviceOrientationkey"];

  uint64_t v23 = [v4 colorImageBuffer];
  [v23 size];
  uint64_t v25 = v24;
  uint64_t v27 = v26;

  v37[0] = v25;
  v37[1] = v27;
  id v28 = [MEMORY[0x263F08D40] valueWithBytes:v37 objCType:"{CGSize=dd}"];
  [v4 setMetadataObject:v28 forKey:@"PVFrameSetMetadataOriginalBufferSizeKey"];

  [(JFXVideoCameraController *)self setCurrentFrameSet_dataOutSynchQueue:v4];
  videoDelegateQueue = self->_videoDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke;
  block[3] = &unk_264C09F10;
  void block[4] = self;
  id v30 = v4;
  id v36 = v30;
  dispatch_async(videoDelegateQueue, block);
  livePlayerSourceQueue = self->_livePlayerSourceQueue;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_4;
  v33[3] = &unk_264C09F10;
  v33[4] = self;
  id v34 = v30;
  id v32 = v30;
  dispatch_async(livePlayerSourceQueue, v33);
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 136) allObjects];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_2;
  v4[3] = &unk_264C0BE10;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 enumerateObjectsUsingBlock:v4];
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_3;
  v6[3] = &unk_264C09F10;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderVideoFrame:*(void *)(a1 + 40)];
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 168) allObjects];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_5;
  v4[3] = &unk_264C0BE38;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 enumerateObjectsUsingBlock:v4];
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_6;
  v6[3] = &unk_264C09F10;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraFrameSetRecieved:*(void *)(a1 + 40)];
}

- (void)didUpdateFrame:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  CMTimeMakeWithSeconds(&v26, v5, 1000000000);
  CMTime time = v26;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  int64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v7 = +[JFXOrientationMonitor deviceInterfaceOrientation];
  uint64_t v8 = +[JFXOrientationMonitor interfaceOrientation];
  uint64_t v9 = JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice(v8);
  if (![(JFXVideoCameraController *)self cameraMode]) {
    uint64_t v9 = 1;
  }
  +[JFXFaceTrackingUtilities faceRectScaleFactorForInterfaceOrientation:v8 andDeviceInterfaceOrientation:v7];
  double v10 = +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:](JFXFaceAnchor, "faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:", v4, v9);
  if (!JFXIsVideoCameraMode([(JFXVideoCameraController *)self cameraMode_dataOutSynchQueue])
    && [(JFXVideoCameraController *)self cameraMode_dataOutSynchQueue]
    && [(JFXVideoCameraController *)self currentCameraPosition_dataOutSynchQueue] == 2&& v10)
  {
    [v10 normalizedFaceRect];
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    CGFloat MidX = CGRectGetMidX(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v29);
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__JFXVideoCameraController_didUpdateFrame___block_invoke;
    block[3] = &unk_264C0BB50;
    void block[4] = self;
    *(CGFloat *)&void block[5] = MidX;
    *(CGFloat *)&void block[6] = MidY;
    dispatch_async(captureSessionQueue, block);
  }
  double v18 = [[JFXARMetadata alloc] initWithARFrame:v4 faceAnchor:v10];
  [v6 setObject:v18 forKeyedSubscript:@"PVFrameSetMetadataARMetadataKey"];
  uint64_t v19 = [v4 capturedImage];
  [v4 timestamp];
  double v21 = v20;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  void v23[2] = __43__JFXVideoCameraController_didUpdateFrame___block_invoke_3;
  v23[3] = &unk_264C0BD20;
  v23[4] = self;
  uint64_t v24 = v18;
  uint64_t v22 = v18;
  [(JFXVideoCameraController *)self preProcessFrameWithPixelBuffer:v19 metadata:v6 timestamp:v23 completion:v21];
}

void __43__JFXVideoCameraController_didUpdateFrame___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) device];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__JFXVideoCameraController_didUpdateFrame___block_invoke_2;
  v3[3] = &unk_264C0BBE8;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);
}

uint64_t __43__JFXVideoCameraController_didUpdateFrame___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __43__JFXVideoCameraController_didUpdateFrame___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setMostRecentARMetadata:*(void *)(result + 40)];
  }
  return result;
}

- (BOOL)faceTrackingEnabled
{
  char v3 = isFaceTrackingEnabledOnBackCamera();
  if ([(JFXVideoCameraController *)self cameraPosition] != 1) {
    return [(JFXVideoCameraController *)self cameraPosition] != 0;
  }
  return v3;
}

- (id)updateCurrentlyTrackedFaceID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__16;
  double v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__JFXVideoCameraController_updateCurrentlyTrackedFaceID___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v10 = v4;
  double v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(dataOutSynchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __57__JFXVideoCameraController_updateCurrentlyTrackedFaceID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "JFX_updateCurrentlyTrackedFaceID:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (BOOL)JFX_buildCaptureSessionGraphError:(id *)a3
{
  Float64 v5 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x263EFA638]);
  captureSession = self->_captureSession;
  self->_captureSession = v5;

  id v7 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x263EFA638]);
  audioSession = self->_audioSession;
  self->_audioSession = v7;

  if ([(JFXVideoCameraController *)self cameraMode_captureSessionQueue] == 1)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = [(JFXVideoCameraController *)self callObserver];
    BOOL v9 = [v10 callCount] > 0;
  }
  BOOL v11 = [(JFXVideoCameraController *)self JFX_setupCaptureSessionVideoDataOutputError:a3];
  if (v11)
  {
    BOOL v11 = [(JFXVideoCameraController *)self JFX_setupCaptureSessionPhotoError:a3];
    if (!v11 || v9)
    {
      if (!v11) {
        return v11;
      }
    }
    else if (![(JFXVideoCameraController *)self JFX_setupCaptureSessionAudioError:a3])
    {
      LOBYTE(v11) = 0;
      return v11;
    }
    [(JFXVideoCameraController *)self JFX_observeCaptureSessionNotifications:self->_captureSession];
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (BOOL)JFX_setupCaptureSessionVideoDataOutputError:(id *)a3
{
  Float64 v5 = (AVCaptureVideoDataOutput *)objc_alloc_init(MEMORY[0x263EFA6A0]);
  videoOutput = self->_videoOutput;
  self->_videoOutput = v5;

  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v8 = [v7 BOOLForKey:@"alwaysDiscardsLateVideoFrames"];

  BOOL v9 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[JFXVideoCameraController JFX_setupCaptureSessionVideoDataOutputError:](v8, v9);
  }

  [(AVCaptureVideoDataOutput *)self->_videoOutput setAlwaysDiscardsLateVideoFrames:v8];
  BOOL v10 = [(AVCaptureSession *)self->_captureSession canAddOutput:self->_videoOutput];
  if (v10)
  {
    [(AVCaptureSession *)self->_captureSession addOutput:self->_videoOutput];
  }
  else if (*a3)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11861 userInfo:0];
  }
  return v10;
}

- (BOOL)JFX_setupCaptureSessionPhotoError:(id *)a3
{
  Float64 v5 = (AVCapturePhotoOutput *)objc_alloc_init(MEMORY[0x263EFA620]);
  photoOutput = self->_photoOutput;
  self->_photoOutput = v5;

  id v7 = [MEMORY[0x263EFA628] photoSettings];
  [v7 setFlashMode:2];
  [(AVCapturePhotoOutput *)self->_photoOutput setPhotoSettingsForSceneMonitoring:v7];
  [(JFXVideoCameraController *)self JFX_setIsFlashScene:[(AVCapturePhotoOutput *)self->_photoOutput isFlashScene]];
  [(AVCapturePhotoOutput *)self->_photoOutput addObserver:self forKeyPath:@"isFlashScene" options:1 context:sAVCapturePhotoOutputIsFlashScene];
  BOOL v8 = [(AVCaptureSession *)self->_captureSession canAddOutput:self->_photoOutput];
  if (v8)
  {
    [(AVCaptureSession *)self->_captureSession addOutput:self->_photoOutput];
  }
  else if (*a3)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11861 userInfo:0];
  }

  return v8;
}

- (BOOL)JFX_setupCaptureSessionDepthError:(id *)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  int v5 = objc_msgSend(v4, "jfx_hasDepthCapableCamera");

  if (v5)
  {
    id v6 = (AVCaptureDepthDataOutput *)objc_alloc_init(MEMORY[0x263EFA588]);
    depthOutput = self->_depthOutput;
    self->_depthOutput = v6;

    [(AVCaptureDepthDataOutput *)self->_depthOutput setAlwaysDiscardsLateDepthData:1];
    [(AVCaptureDepthDataOutput *)self->_depthOutput setFilteringEnabled:0];
    if ([(AVCaptureSession *)self->_captureSession canAddOutput:self->_depthOutput])
    {
      [(AVCaptureSession *)self->_captureSession addOutput:self->_depthOutput];
      return 1;
    }
    BOOL v9 = self->_depthOutput;
    self->_depthOutput = 0;

    BOOL v10 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoCameraController JFX_setupCaptureSessionDepthError:]();
    }
  }
  return 0;
}

- (BOOL)JFX_setupCaptureSessionAudioError:(id *)a3
{
  uint64_t v5 = *MEMORY[0x263EF98B0];
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11814 userInfo:0];
  id v7 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9CE8]];
  if (v7)
  {
    id v20 = 0;
    BOOL v8 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v7 error:&v20];
    id v9 = v20;
    audioInput = self->_audioInput;
    self->_audioInput = v8;

    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      BOOL v11 = 0;
      uint64_t v12 = self->_audioInput;
      self->_audioInput = 0;
      goto LABEL_19;
    }
    double v13 = self->_captureSession;
    uint64_t v12 = (AVCaptureDeviceInput *)v13;
    if (self->_audioInput && -[AVCaptureSession canAddInput:](v13, "canAddInput:"))
    {
      [(AVCaptureDeviceInput *)v12 addInput:self->_audioInput];
      uint64_t v14 = (AVCaptureAudioDataOutput *)objc_alloc_init(MEMORY[0x263EFA550]);
      audioOutput = self->_audioOutput;
      self->_audioOutput = v14;

      if ([(AVCaptureDeviceInput *)v12 canAddOutput:self->_audioOutput])
      {
        [(AVCaptureDeviceInput *)v12 addOutput:self->_audioOutput];
        [(AVCaptureAudioDataOutput *)self->_audioOutput setSampleBufferDelegate:self queue:self->_audioOutQueue];
        BOOL v11 = 1;
LABEL_19:

        goto LABEL_20;
      }
      [(AVCaptureDeviceInput *)v12 removeInput:self->_audioInput];
      id v17 = self->_audioInput;
      self->_audioInput = 0;

      double v18 = self->_audioOutput;
      self->_audioOutput = 0;

      if (a3)
      {
        id v16 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:-11861 userInfo:0];
        goto LABEL_14;
      }
    }
    else if (a3)
    {
      id v16 = v6;
LABEL_14:
      BOOL v11 = 0;
      *a3 = v16;
      goto LABEL_19;
    }
    BOOL v11 = 0;
    goto LABEL_19;
  }
  BOOL v11 = 0;
  if (*a3) {
    *a3 = v6;
  }
LABEL_20:

  return v11;
}

- (void)turnOnMicrophone
{
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__JFXVideoCameraController_turnOnMicrophone__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __44__JFXVideoCameraController_turnOnMicrophone__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) startRunning];
}

- (void)turnOffMicrophone
{
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__JFXVideoCameraController_turnOffMicrophone__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __45__JFXVideoCameraController_turnOffMicrophone__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) stopRunning];
}

- (BOOL)JFX_configureCaptureSesstionForPosition:(int64_t)a3 applyFFCZoom:(BOOL)a4 configureLockedCamera:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v42 = 0;
  v43[0] = 0;
  JFX_getFrontAndBackCameras((unint64_t)v43, (unint64_t)&v42);
  id v11 = v43[0];
  id v12 = v42;
  double v13 = v12;
  if (a3 == 2) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v12;
  }
  id v15 = v14;
  if (objc_msgSend(v15, "jfx_trueDepthCamera")) {
    char v16 = objc_msgSend(v15, "jfx_supportsDepth");
  }
  else {
    char v16 = 0;
  }
  if (objc_msgSend(v15, "jfx_trueDepthCamera") && (objc_msgSend(v15, "jfx_supportsDepth") & 1) == 0)
  {
    id v17 = JFXLog_camera();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[JFXVideoCameraController JFX_configureCaptureSesstionForPosition:applyFFCZoom:configureLockedCamera:error:]();
    }
  }
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_sync(dataOutSynchQueue, block);
  uint64_t v37 = 0;
  CMQuaternion v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__16;
  uint64_t v35 = __Block_byref_object_dispose__16;
  id v36 = 0;
  captureSession = self->_captureSession;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2;
  v24[3] = &unk_264C0BE88;
  v24[4] = self;
  uint64_t v27 = &v37;
  id v20 = v15;
  id v25 = v20;
  CGRect v28 = &v31;
  char v29 = v16;
  BOOL v30 = a4;
  id v21 = v10;
  id v26 = v21;
  JFX_configureCaptureSession(captureSession, v24);
  if (a6) {
    *a6 = (id) v32[5];
  }
  char v22 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = 0;
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = (id *)(a1 + 32);
  id v4 = *(id **)(a1 + 32);
  if (v4[7])
  {
    objc_msgSend(v4[1], "removeOutput:");
    id v6 = (void *)*((void *)*v5 + 7);
    *((void *)*v5 + 7) = 0;

    id v4 = (id *)*v5;
  }
  if (v4[8])
  {
    objc_msgSend(v4[1], "removeOutput:");
    id v7 = (void *)*((void *)*v5 + 8);
    *((void *)*v5 + 8) = 0;

    id v4 = (id *)*v5;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v29 = *(id *)(v9 + 40);
  int v10 = objc_msgSend(v4, "JFX_configureCaptureSessionForCaptureDevice:error:", v8, &v29);
  objc_storeStrong((id *)(v9 + 40), v29);
  if (v10)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v12 + 40);
      char v13 = objc_msgSend(v11, "JFX_setupCaptureSessionDepthError:", &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_3;
    char v22 = &unk_264C0BE60;
    id v15 = v3;
    uint64_t v16 = *(void *)(a1 + 32);
    id v23 = v15;
    uint64_t v24 = v16;
    char v26 = *(unsigned char *)(a1 + 73);
    char v27 = *(unsigned char *)(a1 + 72);
    id v25 = *(id *)(a1 + 48);
    JFX_configureCaptureDevice(v14, &v19);
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionVideoDataOutput", v19, v20, v21, v22);
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:", +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionMetadataForCaptureDevice:", *(void *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionMicrophoneForPosition:", objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue"));
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery");
    id v17 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 72))
    {
      objc_msgSend(v17, "JFX_setupARCameraSessionController");
      objc_msgSend(*v5, "JFX_startARCameraSessionController");
    }
    else
    {
      [v17 setArCameraSessionController:0];
    }
    objc_msgSend(*v5, "JFX_configureCaptureSessionDataOutputSynchronizer");
    double v18 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2_cold_1((uint64_t)v5);
    }
  }
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setAutomaticallyConfiguresCaptureDeviceForWideColor:0];
  if ((objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceCustomFormat:applyFFCZoom:", v3, *(unsigned __int8 *)(a1 + 56)) & 1) == 0)
  {
    [*(id *)(a1 + 32) setAutomaticallyConfiguresCaptureDeviceForWideColor:1];
    objc_msgSend(*(id *)(a1 + 40), "JFX_configureCaptureSessionPreset");
  }
  if (*(unsigned char *)(a1 + 57)) {
    objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceForDepth:", v3);
  }
  [v3 setSpatialOverCaptureEnabled:0];
  uint64_t v4 = [v3 activeColorSpace];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(NSObject **)(v5 + 112);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_4;
  v8[3] = &unk_264C0A3A0;
  void v8[4] = v5;
  v8[5] = v4;
  dispatch_barrier_async(v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDevice:", v3);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceFocus:focusPoint:", v3, 3.40282347e38, 3.40282347e38);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", v3, 3.40282347e38, 3.40282347e38);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceFrameRate:", v3);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraColorSpace_queryDataQueue:", *(void *)(a1 + 40));
}

- (BOOL)JFX_configureCaptureSessionForCaptureDevice:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v6 error:a4];
  uint64_t v8 = (void *)v7;
  if (a4)
  {
    if (*a4) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (v9) {
      goto LABEL_30;
    }
  }
  else if (!v7)
  {
    goto LABEL_30;
  }
  cameraDeviceInput = self->_cameraDeviceInput;
  if (cameraDeviceInput)
  {
    id v11 = [(AVCaptureDeviceInput *)cameraDeviceInput device];
    [v11 removeObserver:self forKeyPath:@"systemPressureState" context:sAVCaptureDeviceSystemPressureState];
    [v11 removeObserver:self forKeyPath:@"videoZoomFactor" context:&sAVCaptureDeviceVideoZoomFactor];
    [(AVCaptureSession *)self->_captureSession removeInput:self->_cameraDeviceInput];
    uint64_t v12 = self->_cameraDeviceInput;
    self->_cameraDeviceInput = 0;

    [(AVCaptureSession *)self->_captureSession setSessionPreset:*MEMORY[0x263EF9758]];
  }
  BOOL v13 = [(AVCaptureSession *)self->_captureSession canAddInput:v8];
  if (v13)
  {
    [v6 addObserver:self forKeyPath:@"systemPressureState" options:1 context:sAVCaptureDeviceSystemPressureState];
    [v6 addObserver:self forKeyPath:@"videoZoomFactor" options:1 context:&sAVCaptureDeviceVideoZoomFactor];
    [(AVCaptureSession *)self->_captureSession addInput:v8];
    objc_storeStrong((id *)&self->_cameraDeviceInput, v8);
    uint64_t v14 = [v8 device];
    id v15 = [v14 activeFormat];
    uint64_t v16 = [v15 supportedMaxPhotoDimensions];

    if ([v16 count])
    {
      id v17 = [v16 firstObject];
      unint64_t v18 = [v17 CMVideoDimensionsValue];
      unsigned int v19 = v18;
      unint64_t v20 = HIDWORD(v18);

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v34 = v16;
      id v21 = v16;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [*(id *)(*((void *)&v35 + 1) + 8 * i) CMVideoDimensionsValue];
            int v27 = v19 * v20;
            if (HIDWORD(v26) * (int)v26 <= (int)(v19 * v20)) {
              unint64_t v20 = v20;
            }
            else {
              unint64_t v20 = HIDWORD(v26);
            }
            if (HIDWORD(v26) * (int)v26 > v27) {
              unsigned int v19 = v26;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v23);
      }

      [(AVCapturePhotoOutput *)self->_photoOutput setMaxPhotoDimensions:v19 | (v20 << 32)];
      uint64_t v16 = v34;
    }
    CGRect v28 = [v6 deviceType];
    -[JFXVideoCameraController JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:](self, "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", v28, [v6 position]);
    goto LABEL_29;
  }
  if (!a4)
  {
LABEL_30:
    LOBYTE(v13) = 0;
    goto LABEL_31;
  }
  id v29 = (void *)MEMORY[0x263F087E8];
  uint64_t v30 = *MEMORY[0x263EF98B0];
  uint64_t v39 = *MEMORY[0x263EF9810];
  uint64_t v31 = NSString;
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "position"));
  CGRect v28 = [v31 stringWithFormat:@"AVCaptureDevicePosition:%@", v16];
  char v40 = v28;
  id v32 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  *a4 = [v29 errorWithDomain:v30 code:-11814 userInfo:v32];

LABEL_29:
LABEL_31:

  return v13;
}

- (void)JFX_configureCaptureSessionPreset
{
  int64_t v3 = [(JFXVideoCameraController *)self cameraMode_captureSessionQueue];
  if (v3 == 3)
  {
    captureSession = self->_captureSession;
    uint64_t v5 = (void *)MEMORY[0x263EF9738];
LABEL_5:
    id v6 = (void *)*v5;
    if (![(AVCaptureSession *)captureSession canSetSessionPreset:*v5]) {
      return;
    }
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    captureSession = self->_captureSession;
    uint64_t v5 = (void *)MEMORY[0x263EF9730];
    goto LABEL_5;
  }
  id v6 = (void *)*MEMORY[0x263EF9780];
  if (![(AVCaptureSession *)self->_captureSession canSetSessionPreset:*MEMORY[0x263EF9780]]) {
    return;
  }
LABEL_8:
  id v7 = v6;
  if (v7)
  {
    id v8 = v7;
    [(AVCaptureSession *)self->_captureSession setSessionPreset:v7];
  }
}

- (void)JFX_configureCaptureSessionVideoDataOutput
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  [(AVCaptureVideoDataOutput *)self->_videoOutput setVideoSettings:0];
  int64_t v3 = [(AVCaptureVideoDataOutput *)self->_videoOutput videoSettings];
  long long v51 = (void *)[v3 mutableCopy];

  uint64_t v4 = [(JFXVideoCameraController *)self cameraMode_captureSessionQueue];
  unint64_t v5 = JFXMinimumVideoDimensionsForCameraMode(2);
  unint64_t v6 = JFXMaximumVideoDimensionsForCameraMode(6);
  unint64_t v7 = JFXMinimumVideoDimensionsForCameraMode(v4);
  unint64_t v47 = HIDWORD(v7);
  unint64_t v8 = JFXMaximumVideoDimensionsForCameraMode(v4);
  BOOL v9 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
  int v10 = [v9 activeFormat];

  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v10 formatDescription]);
  log = JFXLog_camera();
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v48 = v8;
    unint64_t v50 = v5;
    uint64_t v12 = NSString;
    uint64_t v45 = v4;
    [NSNumber numberWithInt:Dimensions];
    BOOL v13 = v46 = v7;
    [NSNumber numberWithInt:HIDWORD(Dimensions)];
    uint64_t v14 = v49 = v6;
    v44 = [v12 stringWithFormat:@"{%@, %@}", v13, v14];

    id v15 = NSString;
    uint64_t v16 = NSNumber;
    id v43 = v44;
    id v17 = [v16 numberWithInt:v50];
    unint64_t v18 = [NSNumber numberWithInt:HIDWORD(v50)];
    uint64_t v42 = [v15 stringWithFormat:@"{%@, %@}", v17, v18];

    unsigned int v19 = NSString;
    unint64_t v20 = NSNumber;
    id v41 = v42;
    id v21 = [v20 numberWithInt:v49];
    uint64_t v22 = [NSNumber numberWithInt:HIDWORD(v49)];
    char v40 = [v19 stringWithFormat:@"{%@, %@}", v21, v22];

    uint64_t v23 = NSString;
    uint64_t v24 = NSNumber;
    id v39 = v40;
    id v25 = [v24 numberWithInt:v46];
    uint64_t v26 = [NSNumber numberWithInt:v47];
    int v27 = [v23 stringWithFormat:@"{%@, %@}", v25, v26];

    unint64_t v28 = HIDWORD(v8);
    id v29 = NSString;
    uint64_t v30 = NSNumber;
    id v31 = v27;
    id v32 = [v30 numberWithInt:v48];
    uint64_t v33 = [NSNumber numberWithInt:v28];
    id v34 = [v29 stringWithFormat:@"{%@, %@}", v32, v33];

    unint64_t v8 = v48;
    *(_DWORD *)buf = 134219266;
    uint64_t v54 = v45;
    __int16 v55 = 2114;
    v56 = v44;
    __int16 v57 = 2114;
    int64_t v58 = v42;
    __int16 v59 = 2114;
    uint64_t v60 = v40;
    __int16 v61 = 2114;
    v62 = v27;
    unint64_t v7 = v46;
    __int16 v63 = 2114;
    uint64_t v64 = v34;
    _os_log_impl(&dword_234C41000, log, OS_LOG_TYPE_DEFAULT, "cameraMode: %ld, videoDimensions: %{public}@, absoluteMinVideoDimensions: %{public}@, absoluteMaxVideoDimensions: %{public}@, cameraModeMinVideoDimensions: %{public}@, cameraModeMaxVideoDimensions: %{public}@", buf, 0x3Eu);

    unint64_t v5 = v50;
    unint64_t v6 = v49;
  }
  videoOutput = self->_videoOutput;
  if (Dimensions == v5 || Dimensions == v6 || Dimensions == v7 || Dimensions == v8)
  {
    [(AVCaptureVideoDataOutput *)videoOutput setAutomaticallyConfiguresOutputBufferDimensions:1];
  }
  else
  {
    [(AVCaptureVideoDataOutput *)videoOutput setAutomaticallyConfiguresOutputBufferDimensions:0];
    [(AVCaptureVideoDataOutput *)self->_videoOutput setDeliversPreviewSizedOutputBuffers:0];
    if (Dimensions && HIDWORD(Dimensions))
    {
      float v36 = (float)(int)v7 / (float)(int)Dimensions;
      if (v36 >= (float)((float)(int)v47 / (float)SHIDWORD(Dimensions))) {
        float v36 = (float)(int)v47 / (float)SHIDWORD(Dimensions);
      }
      if (v36 > 1.0) {
        float v36 = 1.0;
      }
      if (v36 < 1.0)
      {
        long long v37 = [NSNumber numberWithInt:v7];
        [v51 setObject:v37 forKeyedSubscript:*MEMORY[0x263F04240]];

        long long v38 = [NSNumber numberWithInt:v47];
        [v51 setObject:v38 forKeyedSubscript:*MEMORY[0x263F04118]];

        [(AVCaptureVideoDataOutput *)self->_videoOutput setVideoSettings:v51];
      }
    }
  }
}

- (void)JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:(int64_t)a3
{
  id v6 = [(AVCapturePhotoOutput *)self->_photoOutput connectionWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v6 isVideoOrientationSupported])
  {
    if ((unint64_t)(a3 - 2) >= 3) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = a3;
    }
    [v6 setVideoOrientation:v5];
  }
  if ([v6 isVideoMirroringSupported]) {
    objc_msgSend(v6, "setVideoMirrored:", -[JFXVideoCameraController currentCameraPosition_captureSessionQueue](self, "currentCameraPosition_captureSessionQueue") == 2);
  }
  if ([v6 isCameraIntrinsicMatrixDeliverySupported]) {
    [v6 setCameraIntrinsicMatrixDeliveryEnabled:1];
  }
}

- (void)JFX_configureCaptureSessionMetadataForCaptureDevice:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFA5F0]);
  if ([(AVCaptureSession *)self->_captureSession canAddOutput:v4])
  {
    [(AVCaptureSession *)self->_captureSession addOutput:v4];
    uint64_t v5 = [v10 position];
    id v6 = [MEMORY[0x263EFF980] array];
    if (v5 == 2)
    {
      if (objc_msgSend(v10, "jfx_trueDepthCamera"))
      {
        int v7 = objc_msgSend(v10, "jfx_supportsDepth");
        int v8 = [v4 isFaceTrackingSupported];
        BOOL v9 = (void *)MEMORY[0x263EF9F08];
        if (v8 && v7)
        {
          [v4 setFaceTrackingMetadataObjectTypesAvailable:1];
          BOOL v9 = (void *)MEMORY[0x263EF9F58];
        }
        goto LABEL_9;
      }
      [v4 isFaceTrackingSupported];
    }
    BOOL v9 = (void *)MEMORY[0x263EF9F08];
LABEL_9:
    [v6 addObject:*v9];
    [v4 setMetadataObjectTypes:v6];
    if ([v6 count]) {
      objc_storeStrong((id *)&self->_metadataOutput, v4);
    }
    else {
      [(AVCaptureSession *)self->_captureSession removeOutput:v4];
    }
  }
}

- (void)JFX_configureCaptureSessionMicrophoneForPosition:(int64_t)a3
{
  if (a3 == 2)
  {
    if (self->_observingAudioRouteChanges)
    {
      id v4 = [MEMORY[0x263F08A00] defaultCenter];
      [v4 removeObserver:self name:*MEMORY[0x263EF9248] object:0];

      self->_observingAudioRouteChanges = 0;
    }
    captureSession = self->_captureSession;
    [(AVCaptureSession *)captureSession setAutomaticallyConfiguresApplicationAudioSession:1];
  }
  else if (a3 == 1)
  {
    [(JFXVideoCameraController *)self JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern];
  }
}

- (void)JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "mic: [cam] not using the internal mic - not configurng polar pattern", v2, v3, v4, v5, v6);
}

- (void)JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(JFXVideoCameraController *)self JFX_isDepthEnabledCaptureSessionQueue])
  {
    depthOutput = self->_depthOutput;
    videoOutput = self->_videoOutput;
    id v10 = depthOutput;
    uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
    p_videoOutput = &videoOutput;
    uint64_t v6 = 2;
  }
  else
  {
    int v8 = self->_videoOutput;
    uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
    p_videoOutput = &v8;
    uint64_t v6 = 1;
  }
  int v7 = objc_msgSend(v4, "arrayWithObjects:count:", p_videoOutput, v6, v8, videoOutput, v10);
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_146];
}

void __90__JFXVideoCameraController_JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v2 isCameraIntrinsicMatrixDeliverySupported]) {
    [v2 setCameraIntrinsicMatrixDeliveryEnabled:1];
  }
}

- (void)JFX_configureCaptureSessionDataOutputSynchronizer
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = [(JFXVideoCameraController *)self JFX_isDepthEnabledCaptureSessionQueue];
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = v4;
  if (self->_videoOutput) {
    objc_msgSend(v4, "addObject:");
  }
  if (v3) {
    [v5 addObject:self->_depthOutput];
  }
  if (self->_metadataOutput) {
    objc_msgSend(v5, "addObject:");
  }
  uint64_t v6 = [(AVCaptureVideoDataOutput *)self->_videoOutput connectionWithMediaType:*MEMORY[0x263EF9D48]];
  uint64_t v7 = [v6 videoOrientation];
  int v8 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
  BOOL v9 = [v8 activeFormat];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v9 formatDescription]);
  int32_t v11 = Dimensions;
  unint64_t v12 = HIDWORD(Dimensions);
  [v9 videoFieldOfView];
  pv_intrinsics_from_fov_side_and_resolution();
  v38.columns[0].i32[3] = 0;
  v38.columns[1].i32[3] = 0;
  simd_float3 v20 = v38.columns[1];
  simd_float3 v21 = v38.columns[0];
  v38.columns[2].i32[3] = 0;
  simd_float3 v19 = v38.columns[2];
  JFX_logCameraIntrinsics(v38);
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke;
  block[3] = &unk_264C0BED0;
  uint64_t v26 = self;
  uint64_t v27 = v7;
  BOOL v30 = v3;
  simd_float3 v23 = v21;
  simd_float3 v24 = v20;
  simd_float3 v25 = v19;
  int32_t v28 = v11;
  int v29 = v12;
  dispatch_async(dataOutSynchQueue, block);
  uint64_t v14 = (AVCaptureDataOutputSynchronizer *)[objc_alloc(MEMORY[0x263EFA570]) initWithDataOutputs:v5];
  dataOutputSynchronizer = self->_dataOutputSynchronizer;
  self->_dataOutputSynchronizer = v14;

  [(AVCaptureDataOutputSynchronizer *)self->_dataOutputSynchronizer setDelegate:self queue:self->_dataOutSynchQueue];
  uint64_t v16 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = self->_dataOutputSynchronizer;
    unint64_t v18 = self->_dataOutSynchQueue;
    *(_DWORD *)buf = 138412802;
    id v32 = v17;
    __int16 v33 = 2112;
    id v34 = v5;
    __int16 v35 = 2112;
    float v36 = v18;
    _os_log_debug_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEBUG, "created %@ with capture outputs %@ and placing on Q %@", buf, 0x20u);
  }
}

uint64_t __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 80), "setCaptureVideoOrientation_dataOutSynchQueue:", *(void *)(a1 + 88));
  uint64_t v2 = *(void *)(a1 + 80);
  BOOL v3 = *(NSObject **)(v2 + 112);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke_2;
  v6[3] = &unk_264C0A3A0;
  uint64_t v4 = *(void *)(a1 + 88);
  void v6[4] = v2;
  v6[5] = v4;
  dispatch_barrier_async(v3, v6);
  *(unsigned char *)(*(void *)(a1 + 80) + 185) = *(unsigned char *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 80), "setCameraDeviceIntrinsics_dataOutSynchQueue:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 80), "setCameraFrameResolution_dataOutSynchQueue:", (double)*(int *)(a1 + 96), (double)*(int *)(a1 + 100));
}

uint64_t __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureVideoOrientation_queryDataQueue:", *(void *)(a1 + 40));
}

- (BOOL)JFX_configureLockedCaptureDeviceCustomFormat:(id)a3 applyFFCZoom:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (JFXLowResolutionDevice()) {
    char v9 = 1;
  }
  else {
    char v9 = JFXMediumResolutionDevice();
  }
  int v10 = objc_msgSend(v6, "jfx_trueDepthCamera");
  uint64_t v11 = [(JFXVideoCameraController *)self cameraMode_captureSessionQueue];
  BOOL v12 = JFXIsCTMCameraMode(v11);
  int v13 = 0;
  if (v4 && !v8 && (v9 & 1) == 0 && v10 && v12)
  {
    uint64_t v14 = [MEMORY[0x263F1C5C0] currentDevice];
    int v13 = objc_msgSend(v14, "jfx_hasTrueDepthFrontCameraCustomZoomFormat");
  }
  switch(v11)
  {
    case 4:
      uint64_t v16 = 0x2D000000000;
      uint64_t v17 = 2;
      uint64_t v15 = 1280;
      break;
    case 5:
      uint64_t v16 = 0x43800000000;
      uint64_t v17 = 2;
      uint64_t v15 = 1920;
      break;
    case 7:
      uint64_t v15 = 3088;
      if (!v13) {
        uint64_t v15 = 1920;
      }
      uint64_t v16 = 0x5A000000000;
      if (v13) {
        uint64_t v16 = 0x90C00000000;
      }
      uint64_t v17 = 2;
      break;
    default:
      if (!v13)
      {
        BOOL v19 = 0;
        goto LABEL_23;
      }
      uint64_t v16 = 0x90C00000000;
      uint64_t v17 = 1;
      uint64_t v15 = 3088;
      break;
  }
  unint64_t v18 = [(JFXVideoCameraController *)self JFX_getFormatForCaptureDevice:v6 previewDimensions:v16 | v15 colorSpace:v17];
  [v6 setActiveFormat:v18];
  [v6 setActiveColorSpace:v17];

  BOOL v19 = 1;
LABEL_23:

  return v19;
}

- (void)JFX_configureLockedCaptureDeviceForDepth:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = __Block_byref_object_copy__16;
  int v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2810000000;
  v8[3] = &unk_234D77F97;
  void v8[4] = 0;
  uint64_t v5 = [v4 activeFormat];
  id v6 = [v5 supportedDepthDataFormats];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__JFXVideoCameraController_JFX_configureLockedCaptureDeviceForDepth___block_invoke;
  v7[3] = &unk_264C0BEF8;
  void v7[4] = self;
  void v7[5] = &v9;
  v7[6] = v8;
  [v6 enumerateObjectsUsingBlock:v7];
  if (v10[5]) {
    objc_msgSend(v4, "setActiveDepthDataFormat:");
  }

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
}

void __69__JFXVideoCameraController_JFX_configureLockedCaptureDeviceForDepth___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  id v4 = (const opaqueCMFormatDescription *)[v13 formatDescription];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v4);
  int32_t v6 = Dimensions;
  unint64_t v7 = HIDWORD(Dimensions);
  uint64_t v8 = *(void **)(a1[4] + 200);
  if ((!v8
     || (int)[v8 intValue] >= v6 && (int)objc_msgSend(*(id *)(a1[4] + 200), "intValue") >= (int)v7)
    && CMFormatDescriptionGetMediaSubType(v4) == 1717855600)
  {
    uint64_t v9 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    int v10 = (id *)(v9 + 40);
    if (!v11 || *(_DWORD *)(*(void *)(a1[6] + 8) + 32) < v6)
    {
      objc_storeStrong(v10, a2);
      uint64_t v12 = *(void *)(a1[6] + 8);
      *(_DWORD *)(v12 + 32) = v6;
      *(_DWORD *)(v12 + 36) = v7;
    }
  }
}

- (void)JFX_configureLockedCaptureDevice:(id)a3
{
  id v5 = a3;
  [v5 setVideoZoomFactor:1.0];
  id v4 = [v5 activeFormat];
  [v4 videoMaxZoomFactor];
  -[JFXVideoCameraController setCameraVideoMaxZoomFactor_captureSessionQueue:](self, "setCameraVideoMaxZoomFactor_captureSessionQueue:");

  if ([v5 isSmoothAutoFocusSupported]) {
    [v5 setSmoothAutoFocusEnabled:0];
  }
  if ([v5 position] == 2 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 performSelector:sel_setFaceDetectionDrivenImageProcessingEnabled_ withObject:MEMORY[0x263EFFA88]];
  }
}

- (void)JFX_configureLockedCaptureDeviceFocus:(id)a3 focusPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  if ([v11 isFocusPointOfInterestSupported])
  {
    v14.origin.double x = 0.0;
    v14.origin.double y = 0.0;
    v14.size.CGFloat width = 1.0;
    v14.size.CGFloat height = 1.0;
    v13.double x = x;
    v13.double y = y;
    BOOL v6 = CGRectContainsPoint(v14, v13);
    double v7 = 0.5;
    if (v6) {
      double v8 = y;
    }
    else {
      double v8 = 0.5;
    }
    if (v6) {
      double v7 = x;
    }
    objc_msgSend(v11, "setFocusPointOfInterest:", v7, v8);
  }
  uint64_t v9 = [v11 focusMode];
  uint64_t v10 = 2;
  if (([v11 isFocusModeSupported:2] & 1) == 0)
  {
    if ([v11 isFocusModeSupported:1]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
  }
  if ([v11 isFocusModeSupported:v10]) {
    [v11 setFocusMode:v10];
  }
}

- (void)JFX_configureLockedCaptureDeviceExposure:(id)a3 exposurePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  if ([v6 isExposurePointOfInterestSupported])
  {
    v15.origin.double x = 0.0;
    v15.origin.double y = 0.0;
    v15.size.CGFloat width = 1.0;
    v15.size.CGFloat height = 1.0;
    v14.double x = x;
    v14.double y = y;
    BOOL v7 = CGRectContainsPoint(v15, v14);
    double v8 = 0.5;
    if (v7) {
      double v9 = y;
    }
    else {
      double v9 = 0.5;
    }
    if (v7) {
      double v8 = x;
    }
    objc_msgSend(v6, "setExposurePointOfInterest:", v8, v9);
  }
  long long v12 = *MEMORY[0x263F01090];
  uint64_t v13 = *(void *)(MEMORY[0x263F01090] + 16);
  [v6 setActiveMaxExposureDuration:&v12];
  uint64_t v10 = [v6 exposureMode];
  uint64_t v11 = 2;
  if (([v6 isExposureModeSupported:2] & 1) == 0)
  {
    if ([v6 isExposureModeSupported:1]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
  }
  if ([v6 isExposureModeSupported:v11]) {
    [v6 setExposureMode:v11];
  }
}

- (void)JFX_configureLockedCaptureDeviceFrameRate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(JFXVideoCameraController *)self thermalDelegate];

  if (v5)
  {
    id v6 = +[JFXThermalMonitor sharedInstance];
    uint64_t v7 = [v6 thermalLevel];

    uint64_t v11 = 0;
    double v8 = [(JFXVideoCameraController *)self thermalDelegate];
    double v9 = [v4 deviceType];
    [v8 cameraFPSForThermalLevel:v7 deviceType:v9 minRate:(char *)&v11 + 4 maxRate:&v11];

    [(JFXVideoCameraController *)self JFX_configureLockedCaptureDevice:v4 minFrameRate:HIDWORD(v11) maxFrameRate:v11];
    uint64_t v10 = JFXLog_DebugThermals();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      int v13 = v7;
      __int16 v14 = 1024;
      int v15 = HIDWORD(v11);
      __int16 v16 = 1024;
      int v17 = v11;
      _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, "Thermal Level Changes to %d with throttling [%d - %d]", buf, 0x14u);
    }
  }
}

- (void)JFX_configureLockedCaptureDevice:(id)a3 minFrameRate:(int)a4 maxFrameRate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  memset(&v40, 0, sizeof(v40));
  CMTimeMake(&v40, 1, v5);
  if (v8) {
    [v8 activeVideoMinFrameDuration];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime time2 = v40;
  if (CMTimeCompare(&time1, &time2))
  {
    CMTime v38 = v40;
    [v8 setActiveVideoMinFrameDuration:&v38];
  }
  memset(&v37, 0, sizeof(v37));
  CMTimeMake(&v37, 1, a4);
  if (v8) {
    [v8 activeVideoMaxFrameDuration];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }
  CMTime time2 = v37;
  if (CMTimeCompare(&v36, &time2))
  {
    CMTime v35 = v37;
    [v8 setActiveVideoMaxFrameDuration:&v35];
  }
  double v9 = [v8 systemPressureState];
  uint64_t v10 = [v9 factors];
  int v29 = [v9 level];
  if (objc_msgSend(v8, "jfx_trueDepthCamera")
    && objc_msgSend(v8, "jfx_supportsDepth")
    && self->_depthOutput
    && ([v8 activeDepthDataFormat],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__JFXVideoCameraController_JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate___block_invoke;
    block[3] = &unk_264C09FA8;
    id v12 = v8;
    id v34 = v12;
    if (JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__onceToken != -1) {
      dispatch_once(&JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__onceToken, block);
    }
    uint64_t v13 = v5;
    if ((v10 & 4) != 0)
    {
      __int16 v14 = [(id)JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__depthSystemPressureLevelFPSLookup objectForKeyedSubscript:v29];
      int v15 = v14;
      uint64_t v13 = v5;
      if (v14)
      {
        int v16 = [v14 intValue];
        if (v16 >= (int)v5) {
          uint64_t v13 = v5;
        }
        else {
          uint64_t v13 = v16;
        }
      }
    }
    memset(&time2, 0, sizeof(time2));
    CMTimeMake(&time2, 1, v13);
    if (v8) {
      [v12 activeDepthDataMinFrameDuration];
    }
    else {
      memset(&v32, 0, sizeof(v32));
    }
    CMTime v31 = time2;
    if (CMTimeCompare(&v32, &v31))
    {
      CMTime v30 = time2;
      [v12 setActiveDepthDataMinFrameDuration:&v30];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  int v17 = [v8 deviceType];
  uint64_t v18 = +[JFXThermalMonitor sharedInstance];
  uint64_t v19 = [v18 thermalLevel];

  simd_float3 v20 = JFXLog_DebugCamera();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = NSStringFromJFXCameraMode([(JFXVideoCameraController *)self cameraMode_captureSessionQueue]);
    uint64_t v26 = [NSNumber numberWithInt:a4];
    simd_float3 v25 = [NSNumber numberWithInt:v5];
    if ((int)v13 < 1)
    {
      int32_t v28 = &stru_26E7CDB50;
    }
    else
    {
      simd_float3 v21 = NSString;
      simd_float3 v24 = [NSNumber numberWithInt:v13];
      int32_t v28 = [v21 stringWithFormat:@" depth %@ fps", v24];
    }
    uint64_t v22 = +[JFXThermalMonitor stringFromThermalPressureLevel:v19];
    simd_float3 v23 = [NSNumber numberWithUnsignedInteger:v10];
    LODWORD(time2.value) = 138414082;
    *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v17;
    LOWORD(time2.flags) = 2112;
    *(void *)((char *)&time2.flags + 2) = v27;
    HIWORD(time2.epoch) = 2112;
    uint64_t v42 = v26;
    __int16 v43 = 2112;
    v44 = v25;
    __int16 v45 = 2112;
    unint64_t v46 = v28;
    __int16 v47 = 2112;
    unint64_t v48 = v22;
    __int16 v49 = 2112;
    unint64_t v50 = v29;
    __int16 v51 = 2112;
    v52 = v23;
    _os_log_debug_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEBUG, "configuring camera %@ (mode: %@) to [%@, %@] fps%@ system thermal: %@ avf thermal: %@ avf thermal factors: %@", (uint8_t *)&time2, 0x52u);

    if ((int)v13 >= 1)
    {
    }
  }
}

void __87__JFXVideoCameraController_JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 activeDepthDataMinFrameDuration];
    uint64_t v2 = *(void **)(v1 + 32);
    uint64_t v1 = (int)v21 / v20;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = objc_msgSend(v2, "activeDepthDataFormat", 0);
  id v4 = [v3 videoSupportedFrameRateRanges];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 minFrameRate];
        if (v10 <= (double)(int)v1)
        {
          [v9 minFrameRate];
          uint64_t v1 = (int)v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v12 = *MEMORY[0x263EF97A8];
  v23[0] = *MEMORY[0x263EF97B8];
  v23[1] = v12;
  v24[0] = &unk_26E8019B0;
  v24[1] = &unk_26E8019C8;
  void v23[2] = *MEMORY[0x263EF97C0];
  uint64_t v13 = [NSNumber numberWithInt:v1];
  v24[2] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  int v15 = (void *)JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__depthSystemPressureLevelFPSLookup;
  JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__depthSystemPressureLevelFPSLookup = v14;
}

- (BOOL)JFX_isAudioEnabledCaptureSessionQueue
{
  return self->_audioInput && self->_audioOutput != 0;
}

- (BOOL)JFX_isDepthEnabledCaptureSessionQueue
{
  return self->_depthOutput != 0;
}

- (void)JFX_setCaptureDeviceType:(id)a3 captureDevicePositionCaptureSessionQueue:(int64_t)a4
{
  id v6 = a3;
  [(JFXVideoCameraController *)self setCurrentCameraPosition_captureSessionQueue:a4];
  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke;
  block[3] = &unk_264C0A6E0;
  void block[4] = self;
  id v12 = v6;
  int64_t v13 = a4;
  id v8 = v6;
  dispatch_barrier_async(queryDataQueue, block);
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke_2;
  v10[3] = &unk_264C0A3A0;
  void v10[4] = self;
  void v10[5] = a4;
  dispatch_async(dataOutSynchQueue, v10);
}

uint64_t __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCameraType_queryDataQueue:", *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "setCurrentCameraPosition_queryDataQueue:", v2);
}

uint64_t __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentCameraPosition_dataOutSynchQueue:", *(void *)(a1 + 40));
}

- (id)JFX_getFormatForCaptureDevice:(id)a3 previewDimensions:(id)a4 colorSpace:(int64_t)a5
{
  id v7 = a3;
  uint64_t v12 = 0;
  int64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__16;
  long long v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  id v8 = [v7 formats];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__JFXVideoCameraController_JFX_getFormatForCaptureDevice_previewDimensions_colorSpace___block_invoke;
  v11[3] = &unk_264C0BF20;
  v11[5] = a5;
  v11[6] = a4;
  void v11[4] = &v12;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __87__JFXVideoCameraController_JFX_getFormatForCaptureDevice_previewDimensions_colorSpace___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = [v13 supportedColorSpaces];
  id v8 = [NSNumber numberWithInteger:a1[5]];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    double v10 = (const opaqueCMFormatDescription *)[v13 formatDescription];
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v10);
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v10);
    if (a1[6] == Dimensions && MediaSubType != 2016686642)
    {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)JFX_setIsFlashScene:(BOOL)a3
{
  [(JFXVideoCameraController *)self willChangeValueForKey:@"isFlashScene"];
  queryDataQueue = self->_queryDataQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke;
  v6[3] = &unk_264C0A0C0;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(queryDataQueue, v6);
}

void __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsFlashScene_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke_2;
  block[3] = &unk_264C09FA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didChangeValueForKey:@"isFlashScene"];
}

- (void)JFX_resetSessionCaptureSessionQueue
{
  if ([(AVCaptureSession *)self->_captureSession isRunning]) {
    [(AVCaptureSession *)self->_captureSession stopRunning];
  }
  BOOL v3 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
  [v3 removeObserver:self forKeyPath:@"systemPressureState" context:sAVCaptureDeviceSystemPressureState];

  id v4 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
  [v4 removeObserver:self forKeyPath:@"videoZoomFactor" context:&sAVCaptureDeviceVideoZoomFactor];

  [(AVCapturePhotoOutput *)self->_photoOutput removeObserver:self forKeyPath:@"isFlashScene" context:sAVCapturePhotoOutputIsFlashScene];
  captureSession = self->_captureSession;
  self->_captureSession = 0;

  [(JFXVideoCameraController *)self JFX_setCaptureDeviceType:0 captureDevicePositionCaptureSessionQueue:0];
  cameraDeviceInput = self->_cameraDeviceInput;
  self->_cameraDeviceInput = 0;

  audioInput = self->_audioInput;
  self->_audioInput = 0;

  videoOutput = self->_videoOutput;
  self->_videoOutput = 0;

  photoOutput = self->_photoOutput;
  self->_photoOutput = 0;

  depthOutput = self->_depthOutput;
  self->_depthOutput = 0;

  metadataOutput = self->_metadataOutput;
  self->_metadataOutput = 0;

  [(AVCaptureAudioDataOutput *)self->_audioOutput setSampleBufferDelegate:0 queue:0];
  audioOutput = self->_audioOutput;
  self->_audioOutput = 0;

  dataOutputSynchronizer = self->_dataOutputSynchronizer;
  self->_dataOutputSynchronizer = 0;

  arCameraSessionController = self->_arCameraSessionController;
  self->_arCameraSessionController = 0;

  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_async(dataOutSynchQueue, block);
  queryDataQueue = self->_queryDataQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke_2;
  v17[3] = &unk_264C09FA8;
  v17[4] = self;
  dispatch_barrier_async(queryDataQueue, v17);
}

uint64_t __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 185) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setPvDetectedFacesArray_dataOutSynchQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMetadataFaceObjectsArray_dataOutSynchQueue:", 0);
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setMetadataTrackedFacesArray_dataOutSynchQueue:", 0);
}

uint64_t __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentARMetadata_queryDataQueue:", 0);
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setStillImageFaceAnchor_queryDataQueue:", 0);
}

- (void)JFX_setZoomFactor_captureSessionQueue:(double)a3
{
  int64_t v5 = [(JFXVideoCameraController *)self currentCameraPosition_captureSessionQueue];
  if (a3 >= 1.0 && v5 == 1)
  {
    [(JFXVideoCameraController *)self cameraVideoMaxZoomFactor_captureSessionQueue];
    if (v7 >= a3)
    {
      id v8 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __66__JFXVideoCameraController_JFX_setZoomFactor_captureSessionQueue___block_invoke;
      _OWORD v9[3] = &__block_descriptor_40_e25_v16__0__AVCaptureDevice_8l;
      *(double *)&v9[4] = a3;
      JFX_configureCaptureDevice(v8, v9);
    }
  }
}

uint64_t __66__JFXVideoCameraController_JFX_setZoomFactor_captureSessionQueue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVideoZoomFactor:*(double *)(a1 + 32)];
}

- (void)JFX_rampToZoom:(double)a3 rate:(double)a4 durationCaptureSessionQueue:(double)a5
{
  id v8 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__JFXVideoCameraController_JFX_rampToZoom_rate_durationCaptureSessionQueue___block_invoke;
  _OWORD v9[3] = &__block_descriptor_56_e25_v16__0__AVCaptureDevice_8l;
  *(double *)&v9[4] = a5;
  *(double *)&void v9[5] = a3;
  *(double *)&v9[6] = a4;
  JFX_configureCaptureDevice(v8, v9);
}

uint64_t __76__JFXVideoCameraController_JFX_rampToZoom_rate_durationCaptureSessionQueue___block_invoke(double *a1, void *a2)
{
  double v2 = a1[5];
  if (a1[4] == 0.0)
  {
    double v3 = a1[6];
    *(float *)&double v3 = v3;
    return [a2 rampToVideoZoomFactor:v2 withRate:v3];
  }
  else
  {
    *(float *)&double v2 = v2;
    return objc_msgSend(a2, "rampExponentiallyToVideoZoomFactor:withDuration:", v2);
  }
}

- (BOOL)JFX_isUsingInternalMicCaptureSessionQueue
{
  double v2 = [MEMORY[0x263EF93E0] sharedInstance];
  double v3 = [v2 currentRoute];
  id v4 = [v3 inputs];
  int64_t v5 = [v4 firstObject];

  id v6 = [v5 portType];
  LOBYTE(v4) = [v6 isEqualToString:*MEMORY[0x263EF91E0]];

  return (char)v4;
}

- (BOOL)JFX_isARKitEnabledCaptureSessionQueue
{
  double v2 = [(JFXVideoCameraController *)self arCameraSessionController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)JFX_setupARCameraSessionController
{
  if (!self->_arCameraSessionController)
  {
    BOOL v3 = [JFXARKitCameraSessionController alloc];
    captureSession = self->_captureSession;
    int64_t v5 = [(AVCaptureDeviceInput *)self->_cameraDeviceInput device];
    id v6 = [(JFXARKitCameraSessionController *)v3 initWithAVCaptureSession:captureSession captureDevice:v5 arSessionDelegateQueue:self->_dataOutSynchQueue];
    [(JFXVideoCameraController *)self setArCameraSessionController:v6];

    id v7 = [(JFXVideoCameraController *)self arCameraSessionController];
    [v7 setFrameDelegate:self];
  }
}

- (void)JFX_startARCameraSessionController
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "starting ARKit", v2, v3, v4, v5, v6);
}

- (id)JFX_createPVFrameSetFromPixelBuffer:(__CVBuffer *)a3 withMetadata:(id)a4 timeInterval:(double)a5 error:(id *)a6
{
  id v10 = a4;
  memset(&v26, 0, sizeof(v26));
  CMTimeMakeWithSeconds(&v26, a5, 1000000000);
  double v11 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:a3];
  int32_t v12 = +[JFXMediaSettings timeScale];
  id v13 = [v10 objectForKeyedSubscript:@"PVFrameSetMetadataARMetadataKey"];
  uint64_t v14 = [v13 arFrame];
  int v15 = v14;
  if (v14)
  {
    long long v16 = [v14 capturedDepthData];
  }
  else
  {
    long long v16 = 0;
  }
  memset(&v25, 0, sizeof(v25));
  CMTimeMake(&v25, 1, v12);
  CMTime v23 = v26;
  id v24 = 0;
  CMTime v22 = v25;
  id v17 = [MEMORY[0x263F61228] sampleBufferWithPVImageBuffer:v11 timestamp:&v23 frameDuration:&v22 error:&v24];
  id v18 = v24;
  long long v19 = v18;
  if (a6) {
    *a6 = v18;
  }
  if (v19)
  {
    if ([v17 sampleBufferRef])
    {
      memset(&v23, 0, sizeof(v23));
      CMSampleBufferGetPresentationTimeStamp(&v23, (CMSampleBufferRef)[v17 sampleBufferRef]);
      CMTime v22 = v23;
      [(JFXVideoCameraController *)self JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:&v22];
    }
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F61258]) initWithColorBuffer:v17 depthData:v16 metadata:v10];
  }

  return v20;
}

- (id)JFX_updateCurrentlyTrackedFaceID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      int v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      id v10 = [(JFXVideoCameraController *)self currentlyTrackedFaceID];

      if (!v10) {
        [(JFXVideoCameraController *)self setCurrentlyTrackedFaceID:v9];
      }
      double v11 = [(JFXVideoCameraController *)self currentlyTrackedFaceID];
      char v12 = [v9 isEqual:v11];

      if (v12) {
        break;
      }
      id v13 = [v4 lastObject];

      if (v9 == v13) {
        [(JFXVideoCameraController *)self setCurrentlyTrackedFaceID:v9];
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v14 = [(JFXVideoCameraController *)self currentlyTrackedFaceID];

  return v14;
}

- (id)JFX_currentAVMetadataFaceObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke;
  v12[3] = &unk_264C0BF88;
  id v6 = v5;
  id v13 = v6;
  [v4 enumerateObjectsUsingBlock:v12];
  id v7 = [(JFXVideoCameraController *)self JFX_updateCurrentlyTrackedFaceID:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke_2;
  v11[3] = &unk_264C0BFB0;
  void v11[4] = self;
  uint64_t v8 = [v4 indexOfObjectPassingTest:v11];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = [v4 objectAtIndexedSubscript:v8];
  }

  return v9;
}

void __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "faceID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

BOOL __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 faceID];
  id v4 = [*(id *)(a1 + 32) currentlyTrackedFaceID];
  BOOL v5 = v3 == [v4 integerValue];

  return v5;
}

- (JFXFaceAnchor)JFX_processPixelBufferForFaceTransform:(double)a3 cameraIntrinsics:(float)a4 forNormalizedFaceRect:(CGFloat)a5 withRollAngle:(CGFloat)a6 withTimestamp:(CGFloat)a7 andDuration:(CGFloat)a8 detectionOrientation:(float)a9 interfaceOrientation:(uint64_t)a10 needsMirroring:(__CVBuffer *)a11
{
  v88[1] = *MEMORY[0x263EF8340];
  long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v82.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v82.c = v27;
  *(_OWORD *)&v82.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  size_t Width = CVPixelBufferGetWidth(a11);
  size_t Height = CVPixelBufferGetHeight(a11);
  CGAffineTransformMakeTranslation(&v82, (double)Height, 0.0);
  CGAffineTransform v80 = v82;
  CGAffineTransformRotate(&v81, &v80, 3.14159265);
  CGAffineTransform v82 = v81;
  double v30 = a2 / (a4 + a4);
  CMTime v31 = [a1 vcpAnalyzer];

  unsigned int v75 = a16;
  uint64_t v74 = a15;
  if (v31)
  {
    double v32 = v30 * (double)Width;
    __int16 v33 = [a1 vcpAnalyzer];
    uint64_t v87 = *MEMORY[0x263F54078];
    id v34 = [NSNumber numberWithDouble:v32];
    v88[0] = v34;
    CMTime v35 = [NSDictionary dictionaryWithObjects:v88 forKeys:&v87 count:1];
    [v33 updatePreferredTransform:&v82 properties:v35];
  }
  else
  {
    __int16 v33 = JFXLog_camera();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[JFXVideoCameraController JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:]();
    }
  }

  v85[0] = *MEMORY[0x263F54068];
  v90.origin.double x = a5;
  v90.origin.double y = a6;
  v90.size.CGFloat width = a7;
  v90.size.CGFloat height = a8;
  CMTime v36 = NSStringFromCGRect(v90);
  CMTime v84 = v36;
  CMTime v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
  v86[0] = v37;
  v85[1] = *MEMORY[0x263F54070];
  *(float *)&double v38 = a9;
  id v39 = [NSNumber numberWithFloat:v38];
  CMTime v83 = v39;
  CMTime v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
  v86[1] = v40;
  id v41 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];

  uint64_t v42 = [a1 vcpAnalyzer];
  *(_OWORD *)&v81.a = *(_OWORD *)a12;
  v81.c = *(CGFloat *)(a12 + 16);
  *(_OWORD *)&v80.a = *(_OWORD *)a13;
  v80.c = *(CGFloat *)(a13 + 16);
  __int16 v43 = [v42 analyzePixelBuffer:a11 withTimestamp:&v81 andDuration:&v80 properties:v41 error:0];

  v44 = [v43 objectForKeyedSubscript:*MEMORY[0x263F54060]];
  if ([v44 count])
  {
    __int16 v45 = [v44 firstObject];
    [v45 transform];
    double v77 = v46;
    double v72 = v48;
    double v73 = v47;
    double v71 = v49;
    unint64_t v50 = [v45 geometry];
    [v50 vertices];
    double v79 = a8;
    __int16 v51 = [v45 geometry];
    [v51 vertices];

    double SquareWithSize = CGRectMakeSquareWithSize();
    double v68 = v53;
    double v69 = SquareWithSize;
    double v55 = v54;
    double v67 = v56;
    +[JFXFaceTrackingUtilities faceRectScaleFactorForInterfaceOrientation:andDeviceInterfaceOrientation:](JFXFaceTrackingUtilities, "faceRectScaleFactorForInterfaceOrientation:andDeviceInterfaceOrientation:", v74, +[JFXOrientationMonitor deviceInterfaceOrientation]);
    double v70 = a7;
    uint64_t v58 = v57;
    double v59 = a6;
    uint64_t v61 = v60;
    uint64_t v62 = JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice(v74);
    objc_msgSend(a1, "cameraFrameResolution_dataOutSynchQueue");
    uint64_t v65 = -[JFXFaceAnchor initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:]([JFXFaceAnchor alloc], "initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:", v75, v62, 3, v77, v73, v72, v71, v69, v68, v55, v67, v58, v61, v63, v64);
    [(JFXFaceAnchor *)v65 setFocalLength:v30];
    -[JFXFaceAnchor setNormalizedFaceRect:](v65, "setNormalizedFaceRect:", a5, v59, v70, v79);
    if (!+[JFXFaceTrackingUtilities isFaceAnchorInRange:v65])
    {

      uint64_t v65 = 0;
    }
  }
  else
  {
    uint64_t v65 = 0;
  }

  return v65;
}

- (NSNumber)largestDepthDimension
{
  return self->_largestDepthDimension;
}

- (void)setLargestDepthDimension:(id)a3
{
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
}

- (JFXVideoCameraThermalDelegate)thermalDelegate
{
  return self->_thermalDelegate;
}

- (JFXARKitCameraSessionController)arCameraSessionController
{
  return self->_arCameraSessionController;
}

- (void)setArCameraSessionController:(id)a3
{
}

- (int64_t)cameraMode_captureSessionQueue
{
  return self->_cameraMode_captureSessionQueue;
}

- (void)setCameraMode_captureSessionQueue:(int64_t)a3
{
  self->_cameraMode_captureSessionQueue = a3;
}

- (int64_t)cameraMode_dataOutSynchQueue
{
  return self->_cameraMode_dataOutSynchQueue;
}

- (void)setCameraMode_dataOutSynchQueue:(int64_t)a3
{
  self->_cameraMode_dataOutSynchQueue = a3;
}

- (int64_t)cameraMode_queryDataQueue
{
  return self->_cameraMode_queryDataQueue;
}

- (void)setCameraMode_queryDataQueue:(int64_t)a3
{
  self->_cameraMode_queryDataQueue = a3;
}

- (BOOL)captureSessionRunning_queryDataQueue
{
  return self->_captureSessionRunning_queryDataQueue;
}

- (void)setCaptureSessionRunning_queryDataQueue:(BOOL)a3
{
  self->_captureSessionRunning_queryDataQueue = a3;
}

- (NSString)cameraType_queryDataQueue
{
  return self->_cameraType_queryDataQueue;
}

- (void)setCameraType_queryDataQueue:(id)a3
{
}

- (int64_t)currentCameraPosition_captureSessionQueue
{
  return self->_currentCameraPosition_captureSessionQueue;
}

- (void)setCurrentCameraPosition_captureSessionQueue:(int64_t)a3
{
  self->_currentCameraPosition_captureSessionQueue = a3;
}

- (int64_t)currentCameraPosition_dataOutSynchQueue
{
  return self->_currentCameraPosition_dataOutSynchQueue;
}

- (void)setCurrentCameraPosition_dataOutSynchQueue:(int64_t)a3
{
  self->_currentCameraPosition_dataOutSynchQueue = a3;
}

- (int64_t)currentCameraPosition_queryDataQueue
{
  return self->_currentCameraPosition_queryDataQueue;
}

- (void)setCurrentCameraPosition_queryDataQueue:(int64_t)a3
{
  self->_currentCameraPosition_queryDataQueue = a3;
}

- (int64_t)cameraColorSpace_queryDataQueue
{
  return self->_cameraColorSpace_queryDataQueue;
}

- (void)setCameraColorSpace_queryDataQueue:(int64_t)a3
{
  self->_cameraColorSpace_queryDataQueue = a3;
}

- (double)cameraVideoZoomFactor_queryDataQueue
{
  return self->_cameraVideoZoomFactor_queryDataQueue;
}

- (void)setCameraVideoZoomFactor_queryDataQueue:(double)a3
{
  self->_cameraVideoZoomFactor_queryDataQueue = a3;
}

- (double)cameraVideoMaxZoomFactor_captureSessionQueue
{
  return self->_cameraVideoMaxZoomFactor_captureSessionQueue;
}

- (void)setCameraVideoMaxZoomFactor_captureSessionQueue:(double)a3
{
  self->_cameraVideoMaxZoomFactor_captureSessionQueue = a3;
}

- (__n128)cameraDeviceIntrinsics_dataOutSynchQueue
{
  return a1[27];
}

- (__n128)setCameraDeviceIntrinsics_dataOutSynchQueue:(__n128)a3
{
  result[27] = a2;
  result[28] = a3;
  result[29] = a4;
  return result;
}

- (CGSize)cameraFrameResolution_dataOutSynchQueue
{
  double width = self->_cameraFrameResolution_dataOutSynchQueue.width;
  double height = self->_cameraFrameResolution_dataOutSynchQueue.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCameraFrameResolution_dataOutSynchQueue:(CGSize)a3
{
  self->_cameraFrameResolution_dataOutSynchQueue = a3;
}

- (int64_t)cachedMovieRecordingTorchMode
{
  return self->_cachedMovieRecordingTorchMode;
}

- (void)setCachedMovieRecordingTorchMode:(int64_t)a3
{
  self->_cachedMovieRecordingTorchMode = a3;
}

- (NSArray)pvDetectedFacesArray_dataOutSynchQueue
{
  return self->_pvDetectedFacesArray_dataOutSynchQueue;
}

- (void)setPvDetectedFacesArray_dataOutSynchQueue:(id)a3
{
}

- (NSArray)metadataFaceObjectsArray_dataOutSynchQueue
{
  return self->_metadataFaceObjectsArray_dataOutSynchQueue;
}

- (void)setMetadataFaceObjectsArray_dataOutSynchQueue:(id)a3
{
}

- (NSArray)metadataTrackedFacesArray_dataOutSynchQueue
{
  return self->_metadataTrackedFacesArray_dataOutSynchQueue;
}

- (void)setMetadataTrackedFacesArray_dataOutSynchQueue:(id)a3
{
}

- (int64_t)captureVideoOrientation_dataOutSynchQueue
{
  return self->_captureVideoOrientation_dataOutSynchQueue;
}

- (void)setCaptureVideoOrientation_dataOutSynchQueue:(int64_t)a3
{
  self->_captureVideoOrientation_dataOutSynchQueue = a3;
}

- (int64_t)captureVideoOrientation_queryDataQueue
{
  return self->_captureVideoOrientation_queryDataQueue;
}

- (void)setCaptureVideoOrientation_queryDataQueue:(int64_t)a3
{
  self->_captureVideoOrientation_queryDataQueue = a3;
}

- (BOOL)allowARMetadata_queryDataQueue
{
  return self->_allowARMetadata_queryDataQueue;
}

- (void)setAllowARMetadata_queryDataQueue:(BOOL)a3
{
  self->_allowARMetadata_queryDataQueue = a3;
}

- (BOOL)hasValidFaceData_queryDataQueue
{
  return self->_hasValidFaceData_queryDataQueue;
}

- (void)setHasValidFaceData_queryDataQueue:(BOOL)a3
{
  self->_hasValidFaceData_queryDataQueue = a3;
}

- (BOOL)sessionRequiresFaceTracking_queryDataQueue
{
  return self->_sessionRequiresFaceTracking_queryDataQueue;
}

- (void)setSessionRequiresFaceTracking_queryDataQueue:(BOOL)a3
{
  self->_sessionRequiresFaceTracking_queryDataQueue = a3;
}

- (BOOL)skipARProcessingWhenNoFaceData_queryDataQueue
{
  return self->_skipARProcessingWhenNoFaceData_queryDataQueue;
}

- (void)setSkipARProcessingWhenNoFaceData_queryDataQueue:(BOOL)a3
{
  self->_skipARProcessingWhenNoFaceData_queryDataQueue = a3;
}

- (BOOL)isFlashScene_queryDataQueue
{
  return self->_isFlashScene_queryDataQueue;
}

- (void)setIsFlashScene_queryDataQueue:(BOOL)a3
{
  self->_isFlashScene_queryDataQueue = a3;
}

- (PVFrameSet)capturedPhotoFrameSet_dataOutSynchQueue
{
  return self->_capturedPhotoFrameSet_dataOutSynchQueue;
}

- (void)setCapturedPhotoFrameSet_dataOutSynchQueue:(id)a3
{
}

- (PVFrameSet)currentFrameSet_dataOutSynchQueue
{
  return self->_currentFrameSet_dataOutSynchQueue;
}

- (void)setCurrentFrameSet_dataOutSynchQueue:(id)a3
{
}

- (JFXARMetadata)mostRecentARMetadata_queryDataQueue
{
  return self->_mostRecentARMetadata_queryDataQueue;
}

- (void)setMostRecentARMetadata_queryDataQueue:(id)a3
{
}

- (JFXFaceAnchor)stillImageFaceAnchor_queryDataQueue
{
  return self->_stillImageFaceAnchor_queryDataQueue;
}

- (void)setStillImageFaceAnchor_queryDataQueue:(id)a3
{
}

- (BOOL)isRecordingMovie_captureSessionQueue
{
  return self->_isRecordingMovie_captureSessionQueue;
}

- (void)setIsRecordingMovie_captureSessionQueue:(BOOL)a3
{
  self->_isRecordingMovie_captureSessionQueue = a3;
}

- (NSNumber)currentlyTrackedFaceID
{
  return self->_currentlyTrackedFaceID;
}

- (void)setCurrentlyTrackedFaceID:(id)a3
{
}

- (JFXCaptureCallObserver)callObserver
{
  return self->_callObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_currentlyTrackedFaceID, 0);
  objc_storeStrong((id *)&self->_stillImageFaceAnchor_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_mostRecentARMetadata_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_currentFrameSet_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_capturedPhotoFrameSet_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_metadataTrackedFacesArray_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_metadataFaceObjectsArray_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_pvDetectedFacesArray_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_cameraType_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_arCameraSessionController, 0);
  objc_storeStrong((id *)&self->_thermalDelegate, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_vcpAnalyzer, 0);
  objc_storeStrong((id *)&self->_largestDepthDimension, 0);
  objc_storeStrong((id *)&self->_livePlayerSourceQueue, 0);
  objc_storeStrong((id *)&self->_livePlayerSources, 0);
  objc_storeStrong((id *)&self->_audioDelegateQueue, 0);
  objc_storeStrong((id *)&self->_audioDelegates, 0);
  objc_storeStrong((id *)&self->_videoDelegateQueue, 0);
  objc_storeStrong((id *)&self->_videoDelegates, 0);
  objc_storeStrong(&self->_capturePhotoCompletionBlock, 0);
  objc_storeStrong((id *)&self->_photoOutCodec, 0);
  objc_storeStrong((id *)&self->_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_audioOutQueue, 0);
  objc_storeStrong((id *)&self->_captureSessionQueue, 0);
  objc_storeStrong((id *)&self->_dataOutputSynchronizer, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_audioOutput, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_cameraDeviceInput, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)vcpAnalyzer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "creating vcpAnalyzer", v2, v3, v4, v5, v6);
}

- (void)JFX_captureSessionDidStartRunningNotification:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_234C41000, v0, v1, "AVCaptureSessionDidStartRunningNotification: %@", v2);
}

- (void)JFX_captureSessionDidStopRunningNotification:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_234C41000, v0, v1, "AVCaptureSessionDidStopRunningNotification: %@", v2);
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_5_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_234C41000, v0, v1, "AVCaptureSessionRuntimeErrorNotification camera rebuilt and restarted, error: %@", v2);
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "mic: NOT using internal mic. setting to automatic configuration", v2, v3, v4, v5, v6);
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "mic: using internal mic. setting to omni", v2, v3, v4, v5, v6);
}

- (void)saveToPhotoLibrary:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_234C41000, v0, v1, "Saving %@ to photo library", v2);
}

void __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "pre-process frame failed with error: %{public}@", v1, 0xCu);
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Dropping frame due to tracked faces metadata being empty.", v2, v3, v4, v5, v6);
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "-[AVDepthData depthDataByReplacingDepthDataMapWithPixelBuffer:error:] returned an  error=%@", v1, 0xCu);
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Dropping frame due to nil metadata.", v2, v3, v4, v5, v6);
}

- (void)dataOutputSynchronizer:(void *)a1 didOutputSynchronizedDataCollection:.cold.4(void *a1)
{
  [a1 droppedReason];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "Dropping frame due to depth data being dropped (reason: %ld).", v3, v4, v5, v6, v7);
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.5()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_234C41000, v0, v1, "Dropping frame due to video buffer being dropped (reason: %@).", v2);
}

- (void)JFX_setupCaptureSessionVideoDataOutputError:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "alwaysDiscardsLateVideoFrames = %d", (uint8_t *)v2, 8u);
}

- (void)JFX_setupCaptureSessionDepthError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "failure to add depth output to device that is JFXCaptureCapabilitiesIsDepthCapableDevice", v2, v3, v4, v5, v6);
}

- (void)JFX_configureCaptureSesstionForPosition:applyFFCZoom:configureLockedCamera:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "True Depth Camera detected without Depth, must be unsealed/uncalibrated pearl camera module.  Animoji will not function.", v1, 2u);
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)a1 + 8) sessionPreset];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "_captureSession.sessionPreset %@", v4, v5, v6, v7, v8);
}

- (void)JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "VCP Analyzer is nil", v1, 2u);
}

@end