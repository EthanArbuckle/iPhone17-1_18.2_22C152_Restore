@interface AXCameraVisionEngine
+ (BOOL)_isContainedWithinScreenBoundsForNormalizedFrame:(CGRect)a3;
+ (CGAffineTransform)_scaleNormalizedCoordinatesToSceneCoordinates:(SEL)a3;
+ (id)sharedEngine;
- (AVCaptureSession)captureSession;
- (AXCameraHapticEngine)hapticEngine;
- (AXCameraLevelingMotionAnalyzer)_levelingMotionAnalyzer;
- (AXCameraVisionEngine)init;
- (AXMAVCaptureSessionNode)captureSessionNode;
- (AXMCameraFrameContext)lastCameraFrameContext;
- (AXMVisionAnalysisOptions)lastDesiredAnalysisOptions;
- (AXMVisionEngine)visionEngine;
- (BOOL)_attemptAnnouncement:(id)a3 type:(int64_t)a4 isPartial:(BOOL)a5 timestamp:(double)a6;
- (BOOL)_canCreateAccessibilityElementForFeature:(id)a3 correctedFrame:(CGRect)a4 allFeatures:(id)a5;
- (BOOL)_canPostAnnouncement:(id)a3 type:(int64_t)a4 isPartial:(BOOL)a5 timestamp:(double)a6;
- (BOOL)_hasDetectedFaces;
- (BOOL)_hasRealtimeFacesWithoutNames;
- (BOOL)_isLevelingNeededForZone:(int64_t)a3;
- (BOOL)_isMirrored;
- (BOOL)_queue_appActive;
- (BOOL)_shouldReuseExistingElement:(id)a3 forFeature:(id)a4 correctedFrame:(CGRect)a5;
- (BOOL)_updateAccessibilityElements:(id)a3 forIncomingFeature:(id)a4 correctedFrame:(CGRect)a5 evaluatedFeatureTypes:(id)a6;
- (BOOL)isAppActive;
- (BOOL)isLastAnnouncementPartial;
- (BOOL)useThirdsForLocation;
- (CGRect)_motionCorrectedNormalizedFrame:(CGRect)a3 frameContext:(id)a4 targetAttitude:(id)a5;
- (CGRect)_motionCorrectedNormalizedFrameForFeature:(id)a3;
- (CGRect)_normalizedFrameForAccessibilityElements:(id)a3;
- (CGRect)_sceneObjectFrameForNormalizedFrame:(CGRect)a3 inSceneFrame:(CGRect)a4;
- (CGSize)_lastSampleBufferSize;
- (CMDeviceMotion)lastDeviceMotion;
- (NSArray)_accessibilityElementCandidates;
- (NSMutableDictionary)_mostRecentVisionFeatures;
- (NSMutableDictionary)_mostRecentVisionFeaturesUpdateTimes;
- (NSString)inflightAnnouncement;
- (NSString)lastAnnouncement;
- (NSString)lastSceneAnnouncement;
- (NSString)lastSceneAnnouncementFull;
- (NSString)lastSceneAnnouncementWithoutLocation;
- (NSString)previousSceneAnnouncementCandidateWithoutLocation;
- (OS_dispatch_queue)axResultsQueue;
- (UIView)sceneObjectElementContainerView;
- (double)_expirationTimeForFeatureType:(unint64_t)a3;
- (double)lastAnnouncementTime;
- (double)lastLevelAnnouncementTime;
- (double)lastLevelZoneChangedTime;
- (double)lastSceneAnnouncementFullTime;
- (double)lastSceneAnnouncementTime;
- (double)previousSceneAnnouncementCandidateWithoutLocationChangedTime;
- (id)_analysisOptionsForIncomingFrame;
- (id)_announcementStringForFeedbackZone:(int64_t)a3;
- (id)_filterElements:(id)a3 usingRelativeAreaThreshold:(double)a4 referenceElement:(id)a5;
- (id)_filterElements:(id)a3 usingRelativeWidthThreshold:(double)a4 referenceElement:(id)a5;
- (id)_sceneDescriptionAnnouncementForVisionFeatures:(id)a3 previousAnnouncementLocation:(int64_t)a4 locationForAnnouncement:(int64_t *)a5 announcementType:(int64_t *)a6;
- (int64_t)_priorityForAnnouncementType:(int64_t)a3;
- (int64_t)cameraDevicePosition;
- (int64_t)cameraMode;
- (int64_t)interfaceOrientation;
- (int64_t)lastAnnouncementType;
- (int64_t)lastLevelAnnouncementZone;
- (int64_t)lastLevelZone;
- (int64_t)lastSceneAnnouncementLocation;
- (unint64_t)currentFrameCount;
- (void)_applyMotionCorrectionToElement:(id)a3 updatedFrameContext:(id)a4;
- (void)_attemptLevelingAnnouncementForZone:(int64_t)a3 previousZone:(int64_t)a4;
- (void)_attemptSceneDescriptionAnnouncement:(id)a3 locationForAnnouncement:(int64_t)a4 type:(int64_t)a5;
- (void)_clearCachedVisionResults;
- (void)_createAccessibilityElementCandidatesForVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4;
- (void)_dispatchToResultsQueueWithBlock:(id)a3;
- (void)_generateAnnouncementsForVisionFeatures:(id)a3;
- (void)_handleAnnouncementDidFinish:(id)a3;
- (void)_handleCameraMetadataObjects:(id)a3 fromConnection:(id)a4;
- (void)_handleDeviceMotion:(id)a3;
- (void)_handleUpdatedVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4 fromMotionUpdate:(BOOL)a5;
- (void)_handleVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4 userContext:(id)a5;
- (void)_performBecameLevelFeedback;
- (void)_performBecameUnlevelFeedback;
- (void)_performOnMainQueueWithBlock:(id)a3;
- (void)_performScreenEdgeHaptic;
- (void)_purgeExpiredVisionFeaturesUsingTime:(double)a3;
- (void)_resetAccessiblityElements;
- (void)_resetAnnouncementState;
- (void)_resetScheduling;
- (void)_setCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4;
- (void)_setupCaptureSessionNode;
- (void)_setupEngine;
- (void)_setupHaptics;
- (void)_setupLeveling;
- (void)_sortedAndFilteredAccessibilityElements:(id)a3 faces:(id *)a4 persons:(id *)a5 prominentObjects:(id *)a6 objectClassifications:(id *)a7;
- (void)_updateLevelFeedbackForDeviceMotion:(id)a3;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6;
- (void)captureSessionNode:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
- (void)motionManagerDidUpdateDeviceMotion:(id)a3 captureOrientation:(int64_t)a4;
- (void)setAppActive:(BOOL)a3;
- (void)setCameraDevicePosition:(int64_t)a3;
- (void)setCameraMode:(int64_t)a3;
- (void)setCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4;
- (void)setCaptureSession:(id)a3;
- (void)setCaptureSessionNode:(id)a3;
- (void)setCurrentFrameCount:(unint64_t)a3;
- (void)setInflightAnnouncement:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setLastAnnouncement:(id)a3;
- (void)setLastAnnouncementPartial:(BOOL)a3;
- (void)setLastAnnouncementTime:(double)a3;
- (void)setLastAnnouncementType:(int64_t)a3;
- (void)setLastCameraFrameContext:(id)a3;
- (void)setLastDesiredAnalysisOptions:(id)a3;
- (void)setLastDeviceMotion:(id)a3;
- (void)setLastLevelAnnouncementTime:(double)a3;
- (void)setLastLevelAnnouncementZone:(int64_t)a3;
- (void)setLastLevelZone:(int64_t)a3;
- (void)setLastLevelZoneChangedTime:(double)a3;
- (void)setLastSceneAnnouncement:(id)a3;
- (void)setLastSceneAnnouncementFull:(id)a3;
- (void)setLastSceneAnnouncementFullTime:(double)a3;
- (void)setLastSceneAnnouncementLocation:(int64_t)a3;
- (void)setLastSceneAnnouncementTime:(double)a3;
- (void)setLastSceneAnnouncementWithoutLocation:(id)a3;
- (void)setPreviousSceneAnnouncementCandidateWithoutLocation:(id)a3;
- (void)setPreviousSceneAnnouncementCandidateWithoutLocationChangedTime:(double)a3;
- (void)setSceneObjectElementContainerView:(id)a3;
- (void)setVisionEngine:(id)a3;
- (void)set_accessibilityElementCandidates:(id)a3;
- (void)set_lastSampleBufferSize:(CGSize)a3;
- (void)set_queue_appActive:(BOOL)a3;
@end

@implementation AXCameraVisionEngine

+ (id)sharedEngine
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__AXCameraVisionEngine_sharedEngine__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedEngine_onceToken != -1) {
      dispatch_once(&sharedEngine_onceToken, block);
    }
  }
  v3 = (void *)sharedEngine_sharedVisionEngine;

  return v3;
}

uint64_t __36__AXCameraVisionEngine_sharedEngine__block_invoke(uint64_t a1)
{
  sharedEngine_sharedVisionEngine = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (AXCameraVisionEngine)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXCameraVisionEngine;
  v2 = [(AXCameraVisionEngine *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("AXCameraVisionEngine", v3);
    axResultsQueue = v2->_axResultsQueue;
    v2->_axResultsQueue = (OS_dispatch_queue *)v4;

    [(AXCameraVisionEngine *)v2 _setupEngine];
    [(AXCameraVisionEngine *)v2 _setupHaptics];
    [(AXCameraVisionEngine *)v2 _setupLeveling];
    [(AXCameraVisionEngine *)v2 _resetAnnouncementState];
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    mostRecentVisionFeatures = v2->__mostRecentVisionFeatures;
    v2->__mostRecentVisionFeatures = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    mostRecentVisionFeaturesUpdateTimes = v2->__mostRecentVisionFeaturesUpdateTimes;
    v2->__mostRecentVisionFeaturesUpdateTimes = (NSMutableDictionary *)v8;

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel__handleAnnouncementDidFinish_ name:*MEMORY[0x263F1CDB0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXCameraVisionEngine;
  [(AXCameraVisionEngine *)&v4 dealloc];
}

- (void)setAppActive:(BOOL)a3
{
  self->_appActive = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__AXCameraVisionEngine_setAppActive___block_invoke;
  v3[3] = &unk_26509FD30;
  v3[4] = self;
  BOOL v4 = a3;
  [(AXCameraVisionEngine *)self _dispatchToResultsQueueWithBlock:v3];
}

uint64_t __37__AXCameraVisionEngine_setAppActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_queue_appActive:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    [(AXCameraVisionEngine *)self _resetScheduling];
    [(AXCameraVisionEngine *)self _clearCachedVisionResults];
    [(AXCameraVisionEngine *)self _resetAccessiblityElements];
    [(AXCameraVisionEngine *)self _resetAnnouncementState];
  }
}

- (void)setCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__AXCameraVisionEngine_setCaptureDevicePosition_mode___block_invoke;
  v4[3] = &unk_26509FD58;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(AXCameraVisionEngine *)self _dispatchToResultsQueueWithBlock:v4];
}

uint64_t __54__AXCameraVisionEngine_setCaptureDevicePosition_mode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCaptureDevicePosition:*(void *)(a1 + 40) mode:*(void *)(a1 + 48)];
}

- (void)_setCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4
{
  self->_cameraDevicePosition = a3;
  self->_cameraMode = a4;
  [(AXCameraVisionEngine *)self _resetScheduling];
  [(AXCameraVisionEngine *)self _clearCachedVisionResults];
  [(AXCameraVisionEngine *)self _resetAccessiblityElements];
  [(AXCameraVisionEngine *)self _resetAnnouncementState];
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);

  -[AXCameraVisionEngine set_lastSampleBufferSize:](self, "set_lastSampleBufferSize:", v5, v6);
}

- (BOOL)_isMirrored
{
  return [(AXCameraVisionEngine *)self cameraDevicePosition] == 1;
}

- (void)_resetScheduling
{
  [(AXCameraVisionEngine *)self setLastDesiredAnalysisOptions:0];

  [(AXCameraVisionEngine *)self setCurrentFrameCount:0];
}

- (void)_clearCachedVisionResults
{
  id v2 = [(AXCameraVisionEngine *)self _mostRecentVisionFeatures];
  [v2 removeAllObjects];
}

- (void)_resetAccessiblityElements
{
  [(AXCameraVisionEngine *)self set_accessibilityElementCandidates:0];
  v3 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];
  [v3 setAccessibilityElements:0];

  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v4, 0);
}

- (void)_resetAnnouncementState
{
  [(AXCameraVisionEngine *)self setLastAnnouncement:0];
  [(AXCameraVisionEngine *)self setLastAnnouncementType:0];
  [(AXCameraVisionEngine *)self setLastAnnouncementTime:CFAbsoluteTimeGetCurrent()];
  [(AXCameraVisionEngine *)self setInflightAnnouncement:0];
  [(AXCameraVisionEngine *)self setPreviousSceneAnnouncementCandidateWithoutLocation:0];
  [(AXCameraVisionEngine *)self setLastSceneAnnouncement:0];
  [(AXCameraVisionEngine *)self setLastSceneAnnouncementFull:0];
  [(AXCameraVisionEngine *)self setLastSceneAnnouncementWithoutLocation:0];
  [(AXCameraVisionEngine *)self setLastSceneAnnouncementLocation:0];
  [(AXCameraVisionEngine *)self setLastSceneAnnouncementTime:0.0];
  [(AXCameraVisionEngine *)self setLastSceneAnnouncementFullTime:0.0];
  v3 = [(AXCameraVisionEngine *)self _levelingMotionAnalyzer];
  [v3 reset];

  [(AXCameraVisionEngine *)self setLastLevelZone:0];
  [(AXCameraVisionEngine *)self setLastLevelZoneChangedTime:0.0];
  [(AXCameraVisionEngine *)self setLastLevelAnnouncementZone:0];

  [(AXCameraVisionEngine *)self setLastLevelAnnouncementTime:0.0];
}

- (BOOL)useThirdsForLocation
{
  return 1;
}

- (void)_dispatchToResultsQueueWithBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(AXCameraVisionEngine *)self axResultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AXCameraVisionEngine__dispatchToResultsQueueWithBlock___block_invoke;
  block[3] = &unk_26509FD80;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __57__AXCameraVisionEngine__dispatchToResultsQueueWithBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x2455E1C40]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)_performOnMainQueueWithBlock:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  if (v3)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      id v4 = (void *)MEMORY[0x2455E1C40]();
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__AXCameraVisionEngine__performOnMainQueueWithBlock___block_invoke;
      block[3] = &unk_26509FD80;
      id v6 = v3;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __53__AXCameraVisionEngine__performOnMainQueueWithBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x2455E1C40]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)_setupEngine
{
  id obj = (id)[objc_alloc(MEMORY[0x263F21558]) initWithIdentifier:@"CameraEngine"];
  [obj setMaximumQueueSize:0];
  [obj setDiagnosticsEnabled:1];
  [obj setPrioritySchedulingEnabled:0];
  objc_storeStrong((id *)&self->_visionEngine, obj);
  if ([obj canAddEvaluationNodeClass:objc_opt_class()])
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F21508]) initWithIdentifier:@"face"];
    [obj addEvaluationNode:v3];
  }
  if ([obj canAddEvaluationNodeClass:objc_opt_class()])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F21538]) initWithIdentifier:@"prominentObject"];
    [obj addEvaluationNode:v4];
  }
  if ([obj canAddEvaluationNodeClass:objc_opt_class()])
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x263F21540]) initWithIdentifier:@"sceneDetector"];
    [v5 setTaxonomyOptions:7];
    [obj addEvaluationNode:v5];
  }
  if ([obj canAddEvaluationNodeClass:objc_opt_class()])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F21510]) initWithIdentifier:@"horizon"];
    [obj addEvaluationNode:v6];
  }
  if ([obj canAddEvaluationNodeClass:objc_opt_class()])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F21520]) initWithIdentifier:@"aesthetics"];
    [obj addEvaluationNode:v7];
  }
  self->_interfaceOrientation = 0;
  [(AXCameraVisionEngine *)self setCameraDevicePosition:0];
  [(AXCameraVisionEngine *)self setCameraMode:0];
}

- (void)_setupHaptics
{
  uint64_t v3 = objc_alloc_init(AXCameraHapticEngine);
  hapticEngine = self->_hapticEngine;
  self->_hapticEngine = v3;

  double v5 = self->_hapticEngine;

  [(AXCameraHapticEngine *)v5 setScreenEdgeFeedbackCooldownTime:0.2];
}

- (void)_setupLeveling
{
  self->__levelingMotionAnalyzer = objc_alloc_init(AXCameraLevelingMotionAnalyzer);

  MEMORY[0x270F9A758]();
}

- (AVCaptureSession)captureSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);

  return (AVCaptureSession *)WeakRetained;
}

- (void)setCaptureSession:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = [(AXCameraVisionEngine *)self visionEngine];
    int v7 = [v6 canAddSourceNodeClass:objc_opt_class()];

    double v5 = obj;
    if (v7)
    {
      objc_storeWeak((id *)&self->_captureSession, obj);
      [(AXCameraVisionEngine *)self _setupCaptureSessionNode];
      double v5 = obj;
    }
  }
}

- (void)_setupCaptureSessionNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);

  if (WeakRetained)
  {
    if (!self->_captureSessionNode)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x263F214C0]) initWithIdentifier:@"captureSession"];
      [(AXCameraVisionEngine *)self setCaptureSessionNode:v4];

      double v5 = [(AXCameraVisionEngine *)self visionEngine];
      id v6 = [(AXCameraVisionEngine *)self captureSessionNode];
      [v5 addSourceNode:v6];
    }
    int v7 = v15;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    id v8 = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke;
    goto LABEL_7;
  }
  v9 = [(AXCameraVisionEngine *)self captureSessionNode];

  if (v9)
  {
    int v7 = block;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    id v8 = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_2;
LABEL_7:
    v7[2] = v8;
    v7[3] = &unk_26509FB38;
    v7[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  objc_initWeak(&location, self);
  v10 = [(AXCameraVisionEngine *)self visionEngine];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_3;
  v11[3] = &unk_26509FDD0;
  objc_copyWeak(&v12, &location);
  [v10 addResultHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) captureSessionNode];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 axResultsQueue];
  [v5 beginFrameEventsWithAVCaptureSession:WeakRetained delegate:v3 queue:v4];
}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) captureSessionNode];
  [v1 endVideoFrameEvents];
}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = [a3 localizedDescription];
    _AXLogWithFacility();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_4;
      v8[3] = &unk_26509FDA8;
      v8[4] = WeakRetained;
      id v9 = v5;
      [v6 _dispatchToResultsQueueWithBlock:v8];
    }
  }
}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) features];
  uint64_t v3 = [*(id *)(a1 + 40) evaluatedFeatureTypes];
  id v4 = [*(id *)(a1 + 40) userContext];
  [v2 _handleVisionFeatures:v5 evaluatedFeatureTypes:v3 userContext:v4];
}

- (id)_analysisOptionsForIncomingFrame
{
  id v3 = objc_alloc_init(MEMORY[0x263F21550]);
  BOOL v4 = [(AXCameraVisionEngine *)self _hasRealtimeFacesWithoutNames];
  if (v4 || ![(AXCameraVisionEngine *)self _hasDetectedFaces])
  {
    [v3 setDetectFaceNames:1];
    [v3 setDetectFaceRectangles:!v4];
  }
  unint64_t v5 = [(AXCameraVisionEngine *)self currentFrameCount] % 0x1E;
  unint64_t v6 = [(AXCameraVisionEngine *)self currentFrameCount];
  int v7 = [(AXCameraVisionEngine *)self lastDesiredAnalysisOptions];
  id v8 = objc_alloc_init(MEMORY[0x263F21550]);
  if ([v3 detectFaceNames])
  {
    unsigned int v9 = [v7 detectFaceNames] ^ 1;
    if (v5) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v8 setDetectFaceNames:v10];
  if ([v3 detectFaceRectangles])
  {
    unsigned int v11 = [v7 detectFaceRectangles] ^ 1;
    if (v5) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v8 setDetectFaceRectangles:v12];
  if ([v3 detectProminentObjects])
  {
    unsigned int v13 = [v7 detectProminentObjects] ^ 1;
    if (v5) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  [v8 setDetectProminentObjects:v14];
  if ([v3 detectScenes])
  {
    unsigned int v15 = [v7 detectScenes] ^ 1;
    if (v6 % 0x1E) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v8 setDetectScenes:v16];
  if ([v3 detectHorizon])
  {
    unsigned int v17 = [v7 detectHorizon] ^ 1;
    if (v5) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  [v8 setDetectHorizon:v18];
  if ([v3 detectAesthetics])
  {
    unsigned int v19 = [v7 detectAesthetics] ^ 1;
    if (v5) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 1;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  [v8 setDetectAesthetics:v20];
  [(AXCameraVisionEngine *)self setCurrentFrameCount:[(AXCameraVisionEngine *)self currentFrameCount] + 1];
  [(AXCameraVisionEngine *)self setLastDesiredAnalysisOptions:v3];

  return v8;
}

- (BOOL)_hasRealtimeFacesWithoutNames
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(AXCameraVisionEngine *)self _mostRecentVisionFeatures];
  BOOL v4 = [v3 objectForKeyedSubscript:&unk_26F4116F0];

  if (v4)
  {
    [(AXCameraVisionEngine *)self _accessibilityElementCandidates];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          unsigned int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "isFace", (void)v13))
          {
            uint64_t v10 = [v9 faceName];
            uint64_t v11 = [v10 length];

            if (!v11)
            {
              LOBYTE(v6) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_hasDetectedFaces
{
  id v3 = [(AXCameraVisionEngine *)self _mostRecentVisionFeatures];
  BOOL v4 = [v3 objectForKeyedSubscript:&unk_26F411708];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(AXCameraVisionEngine *)self _mostRecentVisionFeatures];
    uint64_t v7 = [v6 objectForKeyedSubscript:&unk_26F4116F0];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)_performBecameLevelFeedback
{
  id v2 = [(AXCameraVisionEngine *)self hapticEngine];
  [v2 performLevelFeedback];
}

- (void)_performBecameUnlevelFeedback
{
  id v2 = [(AXCameraVisionEngine *)self hapticEngine];
  [v2 performUnlevelFeedback];
}

- (void)_performScreenEdgeHaptic
{
  id v2 = [(AXCameraVisionEngine *)self hapticEngine];
  [v2 performSubjectHitScreenEdgeFeedback];
}

- (void)_handleVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4 userContext:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [(AXCameraVisionEngine *)self lastCameraFrameContext];
    if (!v10) {
      goto LABEL_4;
    }
    uint64_t v11 = (void *)v10;
    [v9 presentationTimestamp];
    double v13 = v12;
    long long v14 = [(AXCameraVisionEngine *)self lastCameraFrameContext];
    [v14 presentationTimestamp];
    double v16 = v15;

    if (v13 > v16) {
LABEL_4:
    }
      [(AXCameraVisionEngine *)self setLastCameraFrameContext:v9];
  }
  v28 = v9;
  unsigned int v17 = [MEMORY[0x263EFF9A0] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v23 isMotion])
        {
          v24 = AXMediaLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
            -[AXCameraVisionEngine _handleVisionFeatures:evaluatedFeatureTypes:userContext:](&v32, v33, v24);
          }
        }
        if ([v23 isCameraMetadata])
        {
          v25 = AXMediaLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            -[AXCameraVisionEngine _handleVisionFeatures:evaluatedFeatureTypes:userContext:](&buf, v31, v25);
          }
        }
        v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "featureType"));
        id v27 = [v17 objectForKeyedSubscript:v26];
        if (!v27)
        {
          id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v17 setObject:v27 forKeyedSubscript:v26];
        }
        [v27 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v20);
  }

  if ([v29 count]) {
    [(AXCameraVisionEngine *)self _handleUpdatedVisionFeatures:v17 evaluatedFeatureTypes:v29 fromMotionUpdate:0];
  }
}

- (void)_handleUpdatedVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4 fromMotionUpdate:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(AXCameraVisionEngine *)self _mostRecentVisionFeatures];
  uint64_t v20 = self;
  uint64_t v10 = [(AXCameraVisionEngine *)self _mostRecentVisionFeaturesUpdateTimes];
  double Current = CFAbsoluteTimeGetCurrent();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v18 = [v7 objectForKeyedSubscript:v17];
        if ([v18 count])
        {
          [v9 setObject:v18 forKeyedSubscript:v17];
          uint64_t v19 = [NSNumber numberWithDouble:Current];
          [v10 setObject:v19 forKeyedSubscript:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [(AXCameraVisionEngine *)v20 _purgeExpiredVisionFeaturesUsingTime:Current];
  [(AXCameraVisionEngine *)v20 _createAccessibilityElementCandidatesForVisionFeatures:v9 evaluatedFeatureTypes:v12];
  [(AXCameraVisionEngine *)v20 _generateAnnouncementsForVisionFeatures:v9];
}

- (void)_purgeExpiredVisionFeaturesUsingTime:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v5 = [(AXCameraVisionEngine *)self _mostRecentVisionFeatures];
  uint64_t v6 = [(AXCameraVisionEngine *)self _mostRecentVisionFeaturesUpdateTimes];
  id v7 = [v5 allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 integerValue];
        uint64_t v14 = [v6 objectForKeyedSubscript:v12];
        [v14 doubleValue];
        double v16 = v15;

        [(AXCameraVisionEngine *)self _expirationTimeForFeatureType:v13];
        if (a3 - v16 >= v17)
        {
          [v5 setObject:0 forKeyedSubscript:v12];
          [v6 setObject:0 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (double)_expirationTimeForFeatureType:(unint64_t)a3
{
  return 4.0;
}

- (void)_createAccessibilityElementCandidatesForVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];

  if (v8)
  {
    uint64_t v9 = [(AXCameraVisionEngine *)self lastDeviceMotion];
    uint64_t v10 = [v9 attitude];

    uint64_t v11 = [(AXCameraVisionEngine *)self lastCameraFrameContext];
    id v90 = v7;
    v83 = (void *)v10;
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263F214D8]);
      [v11 videoFieldOfView];
      int v14 = v13;
      [v11 videoZoomFactor];
      int v16 = v15;
      uint64_t v17 = [v11 videoSourceWidth];
      uint64_t v18 = [v11 videoSourceHeight];
      [v11 presentationTimestamp];
      double v20 = v19;
      LODWORD(v19) = v14;
      LODWORD(v21) = v16;
      v94 = (void *)[v12 initWithVideoFieldOfView:v17 zoomFactor:v18 sourceWidth:v10 sourceHeight:v19 presentationTimestamp:v21 attitude:v20];
    }
    else
    {
      v94 = 0;
    }
    v89 = [MEMORY[0x263EFF980] array];
    long long v22 = [(AXCameraVisionEngine *)self _accessibilityElementCandidates];
    uint64_t v23 = (void *)[v22 mutableCopy];

    v91 = [MEMORY[0x263EFF9C0] set];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = v23;
    uint64_t v24 = [obj countByEnumeratingWithState:&v107 objects:v114 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v108 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          id v29 = objc_opt_class();
          [v28 normalizedFrame];
          if ((objc_msgSend(v29, "_isContainedWithinScreenBoundsForNormalizedFrame:") & 1) == 0) {
            [v91 addObject:v28];
          }
          [(AXCameraVisionEngine *)self _applyMotionCorrectionToElement:v28 updatedFrameContext:v94];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v107 objects:v114 count:16];
      }
      while (v25);
    }
    v82 = v11;

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v30 = v89;
    id v7 = v90;
    uint64_t v85 = [&unk_26F411798 countByEnumeratingWithState:&v103 objects:v113 count:16];
    if (v85)
    {
      uint64_t v84 = *(void *)v104;
      uint64_t v87 = *MEMORY[0x263F1CF68];
      id v88 = v6;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v104 != v84) {
            objc_enumerationMutation(&unk_26F411798);
          }
          uint64_t v86 = v31;
          uint8_t v32 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v103 + 1) + 8 * v31)];
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v99 objects:v112 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v100;
            v93 = v32;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v100 != v35) {
                  objc_enumerationMutation(v32);
                }
                long long v37 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                [(AXCameraVisionEngine *)self _motionCorrectedNormalizedFrameForFeature:v37];
                double v39 = v38;
                double v41 = v40;
                double v43 = v42;
                double v45 = v44;
                if (!-[AXCameraVisionEngine _updateAccessibilityElements:forIncomingFeature:correctedFrame:evaluatedFeatureTypes:](self, "_updateAccessibilityElements:forIncomingFeature:correctedFrame:evaluatedFeatureTypes:", v30, v37, v7)&& -[AXCameraVisionEngine _canCreateAccessibilityElementForFeature:correctedFrame:allFeatures:](self, "_canCreateAccessibilityElementForFeature:correctedFrame:allFeatures:", v37, v6, v39, v41, v43, v45))
                {
                  long long v97 = 0u;
                  long long v98 = 0u;
                  long long v95 = 0u;
                  long long v96 = 0u;
                  id v46 = obj;
                  uint64_t v47 = [v46 countByEnumeratingWithState:&v95 objects:v111 count:16];
                  if (v47)
                  {
                    uint64_t v48 = v47;
                    uint64_t v49 = *(void *)v96;
LABEL_28:
                    uint64_t v50 = 0;
                    while (1)
                    {
                      if (*(void *)v96 != v49) {
                        objc_enumerationMutation(v46);
                      }
                      v51 = *(void **)(*((void *)&v95 + 1) + 8 * v50);
                      if (-[AXCameraVisionEngine _shouldReuseExistingElement:forFeature:correctedFrame:](self, "_shouldReuseExistingElement:forFeature:correctedFrame:", v51, v37, v39, v41, v43, v45))
                      {
                        break;
                      }
                      if (v48 == ++v50)
                      {
                        uint64_t v48 = [v46 countByEnumeratingWithState:&v95 objects:v111 count:16];
                        if (v48) {
                          goto LABEL_28;
                        }
                        goto LABEL_34;
                      }
                    }
                    v52 = v51;

                    if (!v52) {
                      goto LABEL_37;
                    }
                    [v46 removeObject:v52];
                    [(AXCameraAccessibilityElement *)v52 setDidReuse:1];
                  }
                  else
                  {
LABEL_34:

LABEL_37:
                    v53 = [AXCameraAccessibilityElement alloc];
                    v54 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];
                    v52 = [(AXCameraAccessibilityElement *)v53 initWithAccessibilityContainer:v54];
                  }
                  v55 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];
                  [v55 bounds];
                  -[AXCameraVisionEngine _sceneObjectFrameForNormalizedFrame:inSceneFrame:](self, "_sceneObjectFrameForNormalizedFrame:inSceneFrame:", v39, v41, v43, v45, v56, v57, v58, v59);
                  double v61 = v60;
                  double v63 = v62;
                  double v65 = v64;
                  double v67 = v66;

                  uint64_t v68 = objc_msgSend(MEMORY[0x263F21560], "locationForNormalizedFrame:previousLocation:usingThirds:", -[AXCameraAccessibilityElement location](v52, "location"), -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v39, v41, v43, v45);
                  -[AXCameraAccessibilityElement setFeatureType:](v52, "setFeatureType:", [v37 featureType]);
                  -[AXCameraAccessibilityElement setNormalizedFrame:](v52, "setNormalizedFrame:", v39, v41, v43, v45);
                  [(AXCameraAccessibilityElement *)v52 setLocation:v68];
                  [v37 confidence];
                  -[AXCameraAccessibilityElement setConfidence:](v52, "setConfidence:");
                  [(AXCameraAccessibilityElement *)v52 setAccessibilityTraits:v87 | [(AXCameraAccessibilityElement *)v52 accessibilityTraits]];
                  -[AXCameraAccessibilityElement setAccessibilityFrameInContainerSpace:](v52, "setAccessibilityFrameInContainerSpace:", v61, v63, v65, v67);
                  v69 = [v37 classificationLocalizedValue];
                  [(AXCameraAccessibilityElement *)v52 setClassificationLocalizedValue:v69];

                  v70 = [v37 classificationLabel];
                  [(AXCameraAccessibilityElement *)v52 setClassificationLabel:v70];

                  [(AXCameraAccessibilityElement *)v52 setCameraFrameContext:v94];
                  if ([v91 containsObject:v52])
                  {
                    uint64_t v71 = 0;
                  }
                  else
                  {
                    v72 = objc_opt_class();
                    [(AXCameraAccessibilityElement *)v52 normalizedFrame];
                    uint64_t v71 = objc_msgSend(v72, "_isContainedWithinScreenBoundsForNormalizedFrame:") ^ 1;
                  }
                  [(AXCameraAccessibilityElement *)v52 setDidCrossEdge:v71];
                  v73 = [(AXCameraAccessibilityElement *)v52 faceName];
                  if ([v73 length])
                  {
LABEL_44:
                  }
                  else
                  {
                    v74 = [v37 faceDetectionResult];
                    v75 = [v74 name];
                    uint64_t v76 = [v75 length];

                    if (v76)
                    {
                      v73 = [v37 faceDetectionResult];
                      v77 = [v73 name];
                      [(AXCameraAccessibilityElement *)v52 setFaceName:v77];

                      goto LABEL_44;
                    }
                  }
                  if (!-[AXCameraAccessibilityElement faceID](v52, "faceID") && [v37 faceId]) {
                    -[AXCameraAccessibilityElement setFaceID:](v52, "setFaceID:", [v37 faceId]);
                  }
                  v78 = [v37 faceDetectionResult];
                  v79 = [v78 attributes];

                  id v6 = v88;
                  if (v79)
                  {
                    v80 = [v37 faceDetectionResult];
                    v81 = [v80 attributes];
                    [(AXCameraAccessibilityElement *)v52 setFaceAttributes:v81];
                  }
                  v30 = v89;
                  [v89 addObject:v52];

                  id v7 = v90;
                  uint8_t v32 = v93;
                  continue;
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v99 objects:v112 count:16];
            }
            while (v34);
          }

          uint64_t v31 = v86 + 1;
        }
        while (v86 + 1 != v85);
        uint64_t v85 = [&unk_26F411798 countByEnumeratingWithState:&v103 objects:v113 count:16];
      }
      while (v85);
    }
    [(AXCameraVisionEngine *)self set_accessibilityElementCandidates:v30];
  }
}

- (BOOL)_canCreateAccessibilityElementForFeature:(id)a3 correctedFrame:(CGRect)a4 allFeatures:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  if (CGRectGetMinX(v15) < -1.0) {
    goto LABEL_5;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (CGRectGetMaxX(v16) > 2.0) {
    goto LABEL_5;
  }
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  if (CGRectGetMinY(v17) < -1.0) {
    goto LABEL_5;
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  if (CGRectGetMaxY(v18) > 2.0) {
    goto LABEL_5;
  }
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v12 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v13 = CGRectGetHeight(v20);
  if ([v10 isPerson])
  {
    LOBYTE(self) = [(AXCameraVisionEngine *)self cameraDevicePosition] != 1;
    goto LABEL_6;
  }
  double v14 = v12 * v13;
  if ([v10 isProminentObject])
  {
LABEL_12:
    LOBYTE(self) = v14 >= 0.005;
    goto LABEL_6;
  }
  if (([v10 isSceneClassification] & 1) == 0)
  {
    if (![v10 isObjectClassification])
    {
      LODWORD(self) = [v10 isFace] ^ 1;
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_5:
  LOBYTE(self) = 0;
LABEL_6:

  return (char)self;
}

- (BOOL)_updateAccessibilityElements:(id)a3 forIncomingFeature:(id)a4 correctedFrame:(CGRect)a5 evaluatedFeatureTypes:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  if ([v9 isFace] && !objc_msgSend(v10, "containsObject:", &unk_26F411708))
  {
    BOOL v39 = 1;
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v61;
      double v55 = 1.3;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(v11);
        }
        CGRect v16 = *(void **)(*((void *)&v60 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(v9, "featureType", *(void *)&v55);
        if (v17 != [v16 featureType])
        {
          [v16 normalizedFrame];
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          v73.origin.CGFloat x = v18;
          v73.origin.CGFloat y = v20;
          v73.size.CGFloat width = v22;
          v73.size.CGFloat height = v24;
          CGRect v66 = CGRectIntersection(a5, v73);
          CGFloat x = v66.origin.x;
          CGFloat y = v66.origin.y;
          CGFloat width = v66.size.width;
          CGFloat height = v66.size.height;
          if (!CGRectIsNull(v66))
          {
            if ([v16 isPerson]
              && (([v9 isFace] & 1) != 0 || objc_msgSend(v9, "isRealtimeFace")))
            {
              v67.origin.CGFloat x = x;
              v67.origin.CGFloat y = y;
              v67.size.CGFloat width = width;
              v67.size.CGFloat height = height;
              double v30 = CGRectGetWidth(v67);
              v68.origin.CGFloat x = x;
              v68.origin.CGFloat y = y;
              v68.size.CGFloat width = width;
              v68.size.CGFloat height = height;
              double v31 = v30 * CGRectGetHeight(v68);
              double v32 = CGRectGetWidth(a5);
              if (v31 >= v32 * CGRectGetHeight(a5) * 0.2)
              {
                double v40 = [v16 faceName];
                if ([v40 length])
                {
LABEL_33:
                }
                else
                {
                  double v41 = [v9 faceDetectionResult];
                  double v42 = [v41 name];
                  uint64_t v43 = [v42 length];

                  if (v43)
                  {
                    double v40 = [v9 faceDetectionResult];
                    double v44 = [v40 name];
                    [v16 setFaceName:v44];

                    goto LABEL_33;
                  }
                }
                if (![v16 faceID] && objc_msgSend(v9, "faceId")) {
                  objc_msgSend(v16, "setFaceID:", objc_msgSend(v9, "faceId"));
                }
                goto LABEL_42;
              }
            }
            else if ([v16 featureType] == 6 && objc_msgSend(v9, "isFace"))
            {
              v69.origin.CGFloat x = v19;
              v69.origin.CGFloat y = v21;
              v69.size.CGFloat width = v23;
              v69.size.CGFloat height = v25;
              double v57 = CGRectGetWidth(v69);
              v70.origin.CGFloat x = v19;
              v70.origin.CGFloat y = v21;
              v70.size.CGFloat width = v23;
              v70.size.CGFloat height = v25;
              double v58 = v57 * CGRectGetHeight(v70);
              double v56 = CGRectGetWidth(a5);
              double v33 = v56 * CGRectGetHeight(a5);
              v71.origin.CGFloat x = x;
              v71.origin.CGFloat y = y;
              v71.size.CGFloat width = width;
              v71.size.CGFloat height = height;
              double v34 = CGRectGetWidth(v71);
              v72.origin.CGFloat x = x;
              v72.origin.CGFloat y = y;
              v72.size.CGFloat width = width;
              v72.size.CGFloat height = height;
              double v35 = CGRectGetHeight(v72);
              if (v33 == 0.0)
              {
                double v36 = v58;
                if (v58 == 0.0) {
                  goto LABEL_22;
                }
              }
              else
              {
                double v36 = v58;
                if (v58 / v33 > 0.7 && v58 / v33 < v55)
                {
LABEL_22:
                  double v37 = v34 * v35;
                  if (v37 >= v36 * 0.65 && v37 >= v33 * 0.65)
                  {
                    double v45 = [v16 faceName];
                    if ([v45 length])
                    {
LABEL_41:
                    }
                    else
                    {
                      id v46 = [v9 faceDetectionResult];
                      uint64_t v47 = [v46 name];
                      uint64_t v48 = [v47 length];

                      if (v48)
                      {
                        double v45 = [v9 faceDetectionResult];
                        uint64_t v49 = [v45 name];
                        [v16 setFaceName:v49];

                        goto LABEL_41;
                      }
                    }
LABEL_42:
                    uint64_t v50 = [v9 faceDetectionResult];
                    v51 = [v50 attributes];

                    if (v51)
                    {
                      v52 = [v9 faceDetectionResult];
                      v53 = [v52 attributes];
                      [v16 setFaceAttributes:v53];
                    }
                    BOOL v39 = 1;
                    goto LABEL_45;
                  }
                }
              }
            }
          }
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v64 count:16];
          if (v13) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    BOOL v39 = 0;
LABEL_45:
  }
  return v39;
}

- (BOOL)_shouldReuseExistingElement:(id)a3 forFeature:(id)a4 correctedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v11 featureType];
  if (v12 != [v10 featureType]) {
    goto LABEL_6;
  }
  if ([v10 faceID])
  {
    uint64_t v13 = [v10 faceID];
    if (v13 == [v11 faceId])
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
  }
  [v10 normalizedFrame];
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGRect v35 = CGRectIntersection(v34, v42);
  CGFloat v15 = v35.origin.x;
  CGFloat v16 = v35.origin.y;
  CGFloat v17 = v35.size.width;
  CGFloat v18 = v35.size.height;
  if (CGRectIsNull(v35))
  {
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_7;
  }
  CGFloat v29 = v18;
  CGFloat v30 = v17;
  CGFloat v31 = v16;
  CGFloat v32 = v15;
  [v10 normalizedFrame];
  CGFloat v20 = v36.origin.x;
  CGFloat v21 = v36.origin.y;
  CGFloat v22 = v36.size.width;
  CGFloat v23 = v36.size.height;
  double v33 = CGRectGetWidth(v36);
  v37.origin.CGFloat x = v20;
  v37.origin.CGFloat y = v21;
  v37.size.CGFloat width = v22;
  v37.size.CGFloat height = v23;
  double v24 = v33 * CGRectGetHeight(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v25 = CGRectGetWidth(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v26 = v25 * CGRectGetHeight(v39);
  if (v26 == 0.0)
  {
    if (v24 != 0.0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  BOOL v14 = 0;
  if (v24 / v26 > 0.7 && v24 / v26 < 1.3)
  {
LABEL_13:
    v40.origin.CGFloat x = v32;
    v40.origin.CGFloat y = v31;
    v40.size.CGFloat width = v30;
    v40.size.CGFloat height = v29;
    double v27 = CGRectGetWidth(v40);
    v41.origin.CGFloat x = v32;
    v41.origin.CGFloat y = v31;
    v41.size.CGFloat width = v30;
    v41.size.CGFloat height = v29;
    double v28 = v27 * CGRectGetHeight(v41);
    BOOL v14 = v28 >= v26 * 0.65 && v28 >= v24 * 0.65;
  }
LABEL_7:

  return v14;
}

- (void)_generateAnnouncementsForVisionFeatures:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];

  if (v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    id v6 = [(AXCameraVisionEngine *)self _sceneDescriptionAnnouncementForVisionFeatures:v4 previousAnnouncementLocation:[(AXCameraVisionEngine *)self lastSceneAnnouncementLocation] locationForAnnouncement:&v8 announcementType:&v7];
    [(AXCameraVisionEngine *)self _attemptSceneDescriptionAnnouncement:v6 locationForAnnouncement:v8 type:v7];
  }
}

- (id)_sceneDescriptionAnnouncementForVisionFeatures:(id)a3 previousAnnouncementLocation:(int64_t)a4 locationForAnnouncement:(int64_t *)a5 announcementType:(int64_t *)a6
{
  v134[2] = *MEMORY[0x263EF8340];
  id v9 = [a3 objectForKeyedSubscript:&unk_26F411768];
  id v10 = [(AXCameraVisionEngine *)self _accessibilityElementCandidates];
  id v127 = 0;
  id v128 = 0;
  id v125 = 0;
  id v126 = 0;
  [(AXCameraVisionEngine *)self _sortedAndFilteredAccessibilityElements:v10 faces:&v128 persons:&v127 prominentObjects:&v126 objectClassifications:&v125];
  id v11 = v128;
  id v12 = v127;
  id v105 = v126;
  id v107 = v125;

  long long v108 = [v11 arrayByAddingObjectsFromArray:v12];
  uint64_t v13 = [v108 count];
  uint64_t v14 = [v12 count];
  uint64_t v15 = [v11 count];
  CGFloat v16 = NSString;
  if (!v15 || v14)
  {
    CGFloat v17 = accessibilityCameraUILocalizedString(@"people.count");
    long long v106 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v13);
  }
  else
  {
    CGFloat v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CGFloat v18 = [v17 localizedStringForKey:@"face.count" value:&stru_26F403C30 table:@"Accessibility"];
    long long v106 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v13);
  }
  long long v103 = v11;
  long long v104 = a5;
  long long v102 = v12;
  if (v13)
  {
    if (v13 == 1)
    {
      CGFloat v19 = [v108 firstObject];
      CGFloat v20 = [v19 faceName];
      if ([v20 length])
      {
        id v21 = [v19 faceName];
      }
      else
      {
        id v21 = v106;
      }
      double v45 = v21;

      if ([v107 count] == 1)
      {
        [v107 firstObject];
        id v46 = v98 = a6;
        [v46 classificationLocalizedValue];
        uint64_t v47 = v100 = v9;
        v134[0] = v19;
        v134[1] = v46;
        int64_t v26 = 2;
        id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:2];
        [(AXCameraVisionEngine *)self _normalizedFrameForAccessibilityElements:v25];
        double v49 = v48;
        double v51 = v50;
        double v53 = v52;
        double v55 = v54;
        double v56 = NSString;
        double v57 = accessibilityCameraUILocalizedString(@"subjects.first.and.second");
        objc_msgSend(v56, "localizedStringWithFormat:", v57, v45, v47);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v24 = objc_msgSend(MEMORY[0x263F21560], "locationForNormalizedFrame:previousLocation:usingThirds:", a4, -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v49, v51, v53, v55);
        id v9 = v100;

        a6 = v98;
      }
      else
      {
        id v23 = v45;
        uint64_t v24 = [v19 location];
        id v25 = v108;
        int64_t v26 = 1;
      }

      goto LABEL_57;
    }
    long long v97 = a6;
    long long v99 = v9;
    double v27 = [MEMORY[0x263F08760] set];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v28 = v108;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v121 objects:v133 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v122 != v31) {
            objc_enumerationMutation(v28);
          }
          double v33 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          CGRect v34 = [v33 faceName];
          uint64_t v35 = [v34 length];

          if (v35)
          {
            CGRect v36 = [v33 faceName];
            [v27 addObject:v36];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v121 objects:v133 count:16];
      }
      while (v30);
    }

    if ([v27 count])
    {
      CGRect v37 = [v27 allObjects];
      CGRect v38 = [v37 sortedArrayUsingComparator:&__block_literal_global_6];

      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v39 = v27;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v117 objects:v132 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = 0;
        uint64_t v43 = *(void *)v118;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v118 != v43) {
              objc_enumerationMutation(v39);
            }
            v42 += [v39 countForObject:*(void *)(*((void *)&v117 + 1) + 8 * j)];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v117 objects:v132 count:16];
        }
        while (v41);
      }
      else
      {
        uint64_t v42 = 0;
      }

      uint64_t v73 = v13 - v42;
      if (v13 - v42 >= 1)
      {
        v74 = NSString;
        v75 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
        uint64_t v76 = [v75 localizedStringForKey:@"people.count" value:&stru_26F403C30 table:@"Accessibility"];
        v77 = objc_msgSend(v74, "localizedStringWithFormat:", v76, v73);

        uint64_t v78 = [v38 arrayByAddingObject:v77];

        CGRect v38 = (void *)v78;
      }
      int64_t v72 = a4;
      uint64_t v79 = [v38 count];
      if (v79 == 2)
      {
        v81 = NSString;
        v82 = accessibilityCameraUILocalizedString(@"subjects.first.and.second");
        v83 = [v38 objectAtIndexedSubscript:0];
        uint64_t v84 = [v38 objectAtIndexedSubscript:1];
        objc_msgSend(v81, "localizedStringWithFormat:", v82, v83, v84);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v79 == 1)
        {
          id v80 = [v38 firstObject];
        }
        else
        {
          id v80 = v106;
        }
        id v23 = v80;
      }
      a6 = v97;
      id v9 = v99;
    }
    else
    {
      id v23 = v106;
      a6 = v97;
      id v9 = v99;
      int64_t v72 = a4;
    }
    [(AXCameraVisionEngine *)self _normalizedFrameForAccessibilityElements:v28];
    uint64_t v24 = objc_msgSend(MEMORY[0x263F21560], "locationForNormalizedFrame:previousLocation:usingThirds:", v72, -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v85, v86, v87, v88);
    id v25 = v28;

LABEL_56:
    int64_t v26 = 1;
    goto LABEL_57;
  }
  if ([v105 count])
  {
    CGFloat v22 = [v105 firstObject];
    accessibilityCameraUILocalizedString(@"prominent.object");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v22 location];
    v131 = v22;
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];

    int64_t v26 = 3;
    goto LABEL_57;
  }
  if (![v107 count])
  {
    if ([v9 count])
    {
      long long v96 = [MEMORY[0x263F21500] builderWithOptions:0];
      [v96 addDetectedClassificationFeatures:v9];
      id v23 = [v96 buildSpeakableDescription];

      id v25 = 0;
      uint64_t v24 = 0;
      int64_t v26 = 5;
      goto LABEL_57;
    }
    id v23 = v106;
    id v25 = 0;
    uint64_t v24 = 0;
    goto LABEL_56;
  }
  double v58 = a6;
  double v59 = [MEMORY[0x263F21500] builderWithOptions:0];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v60 = v107;
  uint64_t v61 = [v60 countByEnumeratingWithState:&v113 objects:v130 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v114;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v114 != v63) {
          objc_enumerationMutation(v60);
        }
        uint64_t v65 = *(void **)(*((void *)&v113 + 1) + 8 * k);
        CGRect v66 = [v65 classificationLocalizedValue];
        CGRect v67 = [v65 classificationLabel];
        [v59 addDetectedClassificationLocalizedValue:v66 forLabel:v67];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v113 objects:v130 count:16];
    }
    while (v62);
  }

  if ((unint64_t)[v60 count] > 2)
  {
    uint64_t v24 = 0;
  }
  else
  {
    [(AXCameraVisionEngine *)self _normalizedFrameForAccessibilityElements:v60];
    uint64_t v24 = objc_msgSend(MEMORY[0x263F21560], "locationForNormalizedFrame:previousLocation:usingThirds:", a4, -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v68, v69, v70, v71);
  }
  a6 = v58;
  id v23 = [v59 buildSpeakableDescription];
  id v25 = v60;

  int64_t v26 = 4;
LABEL_57:
  v89 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];
  [v89 setAccessibilityElements:v25];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v90 = v25;
  uint64_t v91 = [v90 countByEnumeratingWithState:&v109 objects:v129 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v110;
    while (2)
    {
      for (uint64_t m = 0; m != v92; ++m)
      {
        if (*(void *)v110 != v93) {
          objc_enumerationMutation(v90);
        }
        if ([*(id *)(*((void *)&v109 + 1) + 8 * m) didCrossEdge])
        {
          [(AXCameraVisionEngine *)self _performScreenEdgeHaptic];
          goto LABEL_67;
        }
      }
      uint64_t v92 = [v90 countByEnumeratingWithState:&v109 objects:v129 count:16];
      if (v92) {
        continue;
      }
      break;
    }
  }
LABEL_67:

  if (v104) {
    *long long v104 = v24;
  }
  if (a6) {
    *a6 = v26;
  }

  return v23;
}

uint64_t __141__AXCameraVisionEngine__sceneDescriptionAnnouncementForVisionFeatures_previousAnnouncementLocation_locationForAnnouncement_announcementType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_attemptSceneDescriptionAnnouncement:(id)a3 locationForAnnouncement:(int64_t)a4 type:(int64_t)a5
{
  id v27 = a3;
  [(AXCameraVisionEngine *)self setPreviousSceneAnnouncementCandidateWithoutLocation:"setPreviousSceneAnnouncementCandidateWithoutLocation:"];
  double Current = CFAbsoluteTimeGetCurrent();
  [(AXCameraVisionEngine *)self lastSceneAnnouncementTime];
  double v10 = Current - v9;
  [(AXCameraVisionEngine *)self lastSceneAnnouncementFullTime];
  double v12 = v11;
  [(AXCameraVisionEngine *)self previousSceneAnnouncementCandidateWithoutLocationChangedTime];
  if (Current - v13 >= 1.5 || v10 >= 4.5)
  {
    uint64_t v15 = [(AXCameraVisionEngine *)self lastSceneAnnouncementWithoutLocation];
    int v16 = [v27 isEqualToString:v15];

    if (v16)
    {
      double v17 = Current - v12;
      int64_t v18 = [(AXCameraVisionEngine *)self lastSceneAnnouncementLocation];
      double v19 = 30.0;
      if (v18 == a4)
      {
        if (v17 >= 30.0) {
          goto LABEL_14;
        }
LABEL_10:
        BOOL v20 = 0;
        BOOL v21 = 0;
        goto LABEL_15;
      }
      if (v17 < 30.0)
      {
        double v19 = 2.0;
        if (v10 >= 2.0)
        {
          int64_t v22 = [(AXCameraVisionEngine *)self lastAnnouncementType];
          BOOL v21 = v22 == a5;
          BOOL v20 = v22 != a5;
          goto LABEL_15;
        }
        goto LABEL_10;
      }
    }
    else
    {
      double v19 = 4.0;
      if (v10 < 4.0) {
        goto LABEL_10;
      }
    }
LABEL_14:
    BOOL v21 = 0;
    BOOL v20 = 1;
LABEL_15:
    if (a4)
    {
      id v23 = objc_msgSend(MEMORY[0x263F21560], "localizedStringForLocation:isSubjectImplicit:", a4, 0, v19);
      objc_msgSend(NSString, "localizedStringWithFormat:", v23, v27);
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
LABEL_17:
        id v25 = [MEMORY[0x263F21560] localizedStringForLocation:a4 isSubjectImplicit:1];
        goto LABEL_20;
      }
    }
    else
    {
      id v24 = v27;
      if (v21) {
        goto LABEL_17;
      }
    }
    id v25 = v24;
    if (!v20)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_20:
    int v26 = [v25 isEqualToString:v24];
    if ([(AXCameraVisionEngine *)self _attemptAnnouncement:v25 type:a5 isPartial:v26 ^ 1u timestamp:Current])
    {
      [(AXCameraVisionEngine *)self setLastSceneAnnouncement:v25];
      [(AXCameraVisionEngine *)self setLastSceneAnnouncementFull:v24];
      [(AXCameraVisionEngine *)self setLastSceneAnnouncementWithoutLocation:v27];
      [(AXCameraVisionEngine *)self setLastSceneAnnouncementLocation:a4];
      [(AXCameraVisionEngine *)self setLastSceneAnnouncementTime:Current];
      if (v26) {
        [(AXCameraVisionEngine *)self setLastSceneAnnouncementFullTime:Current];
      }
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (BOOL)_attemptAnnouncement:(id)a3 type:(int64_t)a4 isPartial:(BOOL)a5 timestamp:(double)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  if (v10
    && [(AXCameraVisionEngine *)self _canPostAnnouncement:v10 type:a4 isPartial:v7 timestamp:a6])
  {
    [(AXCameraVisionEngine *)self setInflightAnnouncement:v10];
    [(AXCameraVisionEngine *)self setLastAnnouncement:v10];
    [(AXCameraVisionEngine *)self setLastAnnouncementType:a4];
    [(AXCameraVisionEngine *)self setLastAnnouncementPartial:v7];
    [(AXCameraVisionEngine *)self setLastAnnouncementTime:a6];
    UIAccessibilitySpeakIfNotSpeaking();
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_canPostAnnouncement:(id)a3 type:(int64_t)a4 isPartial:(BOOL)a5 timestamp:(double)a6
{
  double v9 = [(AXCameraVisionEngine *)self inflightAnnouncement];
  if (!v9 || ([(AXCameraVisionEngine *)self lastAnnouncementTime], a6 - v10 > 7.0))
  {
LABEL_6:
    BOOL v14 = 1;
    goto LABEL_7;
  }
  int64_t v11 = [(AXCameraVisionEngine *)self lastAnnouncementType];
  int64_t v12 = [(AXCameraVisionEngine *)self _priorityForAnnouncementType:a4];
  int64_t v13 = [(AXCameraVisionEngine *)self _priorityForAnnouncementType:v11];
  if (v12 >= v13)
  {
    if (v12 <= v13)
    {
      BOOL v14 = [(AXCameraVisionEngine *)self isLastAnnouncementPartial];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)_handleAnnouncementDidFinish:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__AXCameraVisionEngine__handleAnnouncementDidFinish___block_invoke;
  v6[3] = &unk_26509FDA8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(AXCameraVisionEngine *)self _dispatchToResultsQueueWithBlock:v6];
}

void __53__AXCameraVisionEngine__handleAnnouncementDidFinish___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1CDB8]];

  id v3 = [*(id *)(a1 + 40) inflightAnnouncement];
  int v4 = [v5 isEqualToString:v3];

  if (v4) {
    [*(id *)(a1 + 40) setInflightAnnouncement:0];
  }
}

- (int64_t)_priorityForAnnouncementType:(int64_t)a3
{
  return 0;
}

- (CGRect)_normalizedFrameForAccessibilityElements:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  double v17 = &unk_2401C37DE;
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v18 = *MEMORY[0x263F001A8];
  long long v19 = v4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__AXCameraVisionEngine__normalizedFrameForAccessibilityElements___block_invoke;
  v13[3] = &unk_26509FE18;
  v13[4] = &v14;
  [v3 enumerateObjectsUsingBlock:v13];
  double v5 = v15[4];
  double v6 = v15[5];
  double v7 = v15[6];
  double v8 = v15[7];
  _Block_object_dispose(&v14, 8);

  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

void __65__AXCameraVisionEngine__normalizedFrameForAccessibilityElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = a1 + 32;
    double v5 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    [a2 normalizedFrame];
    v11.origin.CGFloat x = v6;
    v11.origin.CGFloat y = v7;
    v11.size.CGFloat width = v8;
    v11.size.CGFloat height = v9;
    CGRect v10 = CGRectUnion(v5[1], v11);
  }
  else
  {
    [a2 normalizedFrame];
    uint64_t v4 = a1 + 32;
  }
  *(CGRect *)(*(void *)(*(void *)v4 + 8) + 32) = v10;
}

- (void)_sortedAndFilteredAccessibilityElements:(id)a3 faces:(id *)a4 persons:(id *)a5 prominentObjects:(id *)a6 objectClassifications:(id *)a7
{
  id v11 = a3;
  double v12 = [v11 axFilterObjectsUsingBlock:&__block_literal_global_386];
  int64_t v13 = [v11 axFilterObjectsUsingBlock:&__block_literal_global_388];
  uint64_t v14 = [v11 axFilterObjectsUsingBlock:&__block_literal_global_390];
  uint64_t v15 = [v11 axFilterObjectsUsingBlock:&__block_literal_global_392];

  uint64_t v16 = [v12 sortedArrayUsingComparator:&__block_literal_global_395];

  double v17 = [v13 sortedArrayUsingComparator:&__block_literal_global_397];

  long long v18 = [v14 sortedArrayUsingComparator:&__block_literal_global_399];

  long long v19 = [v15 sortedArrayUsingComparator:&__block_literal_global_401];

  BOOL v20 = [v16 firstObject];
  BOOL v21 = [(AXCameraVisionEngine *)self _filterElements:v16 usingRelativeAreaThreshold:v20 referenceElement:0.110889];

  int64_t v22 = [v17 firstObject];
  id v23 = [(AXCameraVisionEngine *)self _filterElements:v17 usingRelativeWidthThreshold:v22 referenceElement:0.333];

  id v24 = [v18 firstObject];
  id v25 = [(AXCameraVisionEngine *)self _filterElements:v18 usingRelativeAreaThreshold:v24 referenceElement:0.110889];

  int v26 = [v19 firstObject];
  id v27 = [(AXCameraVisionEngine *)self _filterElements:v19 usingRelativeAreaThreshold:v26 referenceElement:0.110889];

  id v28 = [v21 firstObject];
  uint64_t v29 = [(AXCameraVisionEngine *)self _filterElements:v23 usingRelativeAreaThreshold:v28 referenceElement:0.665334];

  uint64_t v30 = [v29 firstObject];
  uint64_t v31 = [(AXCameraVisionEngine *)self _filterElements:v21 usingRelativeAreaThreshold:v30 referenceElement:0.0184815];

  CGFloat v32 = [v27 firstObject];
  id v39 = [(AXCameraVisionEngine *)self _filterElements:v31 usingRelativeAreaThreshold:v32 referenceElement:0.0833333333];

  double v33 = [(AXCameraVisionEngine *)self _filterElements:v29 usingRelativeAreaThreshold:v32 referenceElement:0.5];

  CGRect v34 = [v33 firstObject];
  uint64_t v35 = [(AXCameraVisionEngine *)self _filterElements:v27 usingRelativeAreaThreshold:v34 referenceElement:0.25];

  CGRect v36 = [v39 firstObject];
  CGRect v37 = [(AXCameraVisionEngine *)self _filterElements:v35 usingRelativeAreaThreshold:v36 referenceElement:0.0416666667];

  if (a4) {
    *a4 = v39;
  }
  if (a5) {
    *a5 = v33;
  }
  if (a6) {
    *a6 = v25;
  }
  if (a7) {
    *a7 = v37;
  }
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFace];
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isPerson];
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isProminentObject];
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isObjectClassification];
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  [a3 normalizedFrame];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double v10 = CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  id v11 = [v4 numberWithDouble:v10 * CGRectGetHeight(v26)];
  double v12 = NSNumber;
  [v5 normalizedFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v16;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v20;
  double v21 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = v14;
  v28.origin.CGFloat y = v16;
  v28.size.CGFloat width = v18;
  v28.size.CGFloat height = v20;
  int64_t v22 = [v12 numberWithDouble:v21 * CGRectGetHeight(v28)];
  uint64_t v23 = [v11 compare:v22];

  return v23;
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  [a3 normalizedFrame];
  CGFloat v6 = [v4 numberWithDouble:CGRectGetWidth(v19)];
  CGFloat v7 = NSNumber;
  [v5 normalizedFrame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v20.origin.CGFloat x = v9;
  v20.origin.CGFloat y = v11;
  v20.size.CGFloat width = v13;
  v20.size.CGFloat height = v15;
  CGFloat v16 = [v7 numberWithDouble:CGRectGetWidth(v20)];
  uint64_t v17 = [v6 compare:v16];

  return v17;
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  [a3 normalizedFrame];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double v10 = CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v11 = [v4 numberWithDouble:v10 * CGRectGetHeight(v26)];
  double v12 = NSNumber;
  [v5 normalizedFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v16;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v20;
  double v21 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = v14;
  v28.origin.CGFloat y = v16;
  v28.size.CGFloat width = v18;
  v28.size.CGFloat height = v20;
  int64_t v22 = [v12 numberWithDouble:v21 * CGRectGetHeight(v28)];
  uint64_t v23 = [v11 compare:v22];

  return v23;
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  [a3 normalizedFrame];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double v10 = CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v11 = [v4 numberWithDouble:v10 * CGRectGetHeight(v26)];
  double v12 = NSNumber;
  [v5 normalizedFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v16;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v20;
  double v21 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = v14;
  v28.origin.CGFloat y = v16;
  v28.size.CGFloat width = v18;
  v28.size.CGFloat height = v20;
  int64_t v22 = [v12 numberWithDouble:v21 * CGRectGetHeight(v28)];
  uint64_t v23 = [v11 compare:v22];

  return v23;
}

- (id)_filterElements:(id)a3 usingRelativeAreaThreshold:(double)a4 referenceElement:(id)a5
{
  id v7 = a3;
  double v8 = v7;
  if (a5)
  {
    [a5 normalizedFrame];
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
    double v13 = CGRectGetWidth(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat v14 = CGRectGetHeight(v21);
    v18[1] = 3221225472;
    v18[0] = MEMORY[0x263EF8330];
    v18[2] = __84__AXCameraVisionEngine__filterElements_usingRelativeAreaThreshold_referenceElement___block_invoke;
    v18[3] = &__block_descriptor_48_e45_B32__0__AXCameraAccessibilityElement_8Q16_B24l;
    *(double *)&v18[4] = a4;
    *(double *)&v18[5] = v13 * v14;
    double v15 = [v8 indexesOfObjectsPassingTest:v18];
    id v16 = [v8 objectsAtIndexes:v15];
  }
  else
  {
    id v16 = v7;
  }

  return v16;
}

BOOL __84__AXCameraVisionEngine__filterElements_usingRelativeAreaThreshold_referenceElement___block_invoke(uint64_t a1, void *a2)
{
  [a2 normalizedFrame];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double v7 = CGRectGetWidth(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  return v7 * CGRectGetHeight(v10) >= *(double *)(a1 + 32) * *(double *)(a1 + 40);
}

- (id)_filterElements:(id)a3 usingRelativeWidthThreshold:(double)a4 referenceElement:(id)a5
{
  id v7 = a3;
  double v8 = v7;
  if (a5)
  {
    [a5 normalizedFrame];
    CGFloat Width = CGRectGetWidth(v15);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __85__AXCameraVisionEngine__filterElements_usingRelativeWidthThreshold_referenceElement___block_invoke;
    v13[3] = &__block_descriptor_48_e45_B32__0__AXCameraAccessibilityElement_8Q16_B24l;
    *(double *)&v13[4] = a4;
    *(CGFloat *)&void v13[5] = Width;
    CGRect v10 = [v8 indexesOfObjectsPassingTest:v13];
    id v11 = [v8 objectsAtIndexes:v10];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

BOOL __85__AXCameraVisionEngine__filterElements_usingRelativeWidthThreshold_referenceElement___block_invoke(uint64_t a1, void *a2)
{
  [a2 normalizedFrame];
  return CGRectGetWidth(v4) >= *(double *)(a1 + 32) * *(double *)(a1 + 40);
}

- (void)setPreviousSceneAnnouncementCandidateWithoutLocation:(id)a3
{
  CGRect v4 = (NSString *)a3;
  previousSceneAnnouncementCandidateWithoutLocation = self->_previousSceneAnnouncementCandidateWithoutLocation;
  if (previousSceneAnnouncementCandidateWithoutLocation != v4)
  {
    double v8 = v4;
    if (![(NSString *)previousSceneAnnouncementCandidateWithoutLocation isEqualToString:v4])
    {
      CGFloat v6 = (NSString *)[(NSString *)v8 copy];
      id v7 = self->_previousSceneAnnouncementCandidateWithoutLocation;
      self->_previousSceneAnnouncementCandidateWithoutLocation = v6;

      [(AXCameraVisionEngine *)self setPreviousSceneAnnouncementCandidateWithoutLocationChangedTime:CFAbsoluteTimeGetCurrent()];
    }
  }

  MEMORY[0x270F9A758]();
}

- (CGRect)_sceneObjectFrameForNormalizedFrame:(CGRect)a3 inSceneFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  [(AXCameraVisionEngine *)self interfaceOrientation];
  AXMNormalizedFrameTransform();
  memset(v16, 0, sizeof(v16));
  double v12 = objc_opt_class();
  if (v12) {
    objc_msgSend(v12, "_scaleNormalizedCoordinatesToSceneCoordinates:", x, y, width, height);
  }
  else {
    memset(v16, 0, 48);
  }
  CGAffineTransform t1 = v16[1];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransform v13 = v16[0];
  CGAffineTransformConcat(&v15, &t1, &v13);
  CGAffineTransform t1 = v15;
  v17.origin.double x = v11;
  v17.origin.double y = v10;
  v17.size.double width = v9;
  v17.size.double height = v8;
  return CGRectApplyAffineTransform(v17, &t1);
}

+ (CGAffineTransform)_scaleNormalizedCoordinatesToSceneCoordinates:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = CGRectGetWidth(a4);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGFloat v10 = CGRectGetHeight(v13);

  return CGAffineTransformMakeScale(retstr, v9, v10);
}

+ (BOOL)_isContainedWithinScreenBoundsForNormalizedFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectGetMinX(a3) < 0.0) {
    return 0;
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  if (CGRectGetMaxX(v8) > 1.0) {
    return 0;
  }
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  if (CGRectGetMinY(v9) < 0.0) {
    return 0;
  }
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  return CGRectGetMaxY(v10) <= 1.0;
}

- (void)_applyMotionCorrectionToElement:(id)a3 updatedFrameContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 cameraFrameContext];
  uint64_t v8 = [v6 deviceAttitude];
  CGRect v9 = (void *)v8;
  if (v7 && v8)
  {
    [v10 normalizedFrame];
    -[AXCameraVisionEngine _motionCorrectedNormalizedFrame:frameContext:targetAttitude:](self, "_motionCorrectedNormalizedFrame:frameContext:targetAttitude:", v7, v9);
    objc_msgSend(v10, "setNormalizedFrame:");
    [v10 setCameraFrameContext:v6];
  }
}

- (CGRect)_motionCorrectedNormalizedFrameForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userContext];
  [v4 normalizedFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  CGFloat v14 = [(AXCameraVisionEngine *)self lastDeviceMotion];
  CGAffineTransform v15 = [v14 attitude];
  -[AXCameraVisionEngine _motionCorrectedNormalizedFrame:frameContext:targetAttitude:](self, "_motionCorrectedNormalizedFrame:frameContext:targetAttitude:", v5, v15, v7, v9, v11, v13);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)_motionCorrectedNormalizedFrame:(CGRect)a3 frameContext:(id)a4 targetAttitude:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4 && a5)
  {
    id v11 = a5;
    id v12 = a4;
    [v12 videoZoomFactor];
    int v14 = v13;
    int64_t v15 = [(AXCameraVisionEngine *)self interfaceOrientation];
    BOOL v16 = [(AXCameraVisionEngine *)self _isMirrored];
    LODWORD(v17) = v14;
    objc_msgSend(v12, "motionCorrectedNormalizedFrame:targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:", v11, v15, v16, x, y, width, height, v17);
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)_handleDeviceMotion:(id)a3
{
  id v4 = a3;
  [(AXCameraVisionEngine *)self _updateLevelFeedbackForDeviceMotion:v4];
  [(AXCameraVisionEngine *)self setLastDeviceMotion:v4];
}

- (void)_updateLevelFeedbackForDeviceMotion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AXCameraVisionEngine *)self lastLevelZone];
  double v6 = [(AXCameraVisionEngine *)self _levelingMotionAnalyzer];
  uint64_t v7 = [v6 updateWithDeviceMotion:v4 previousZone:v5];

  if ([(AXCameraVisionEngine *)self shouldEmitLevelFeedback] && v7)
  {
    if (!v5 || v7 == v5)
    {
      [(AXCameraVisionEngine *)self setLastLevelZone:v7];
    }
    else
    {
      if (v7 == 1) {
        [(AXCameraVisionEngine *)self _performBecameLevelFeedback];
      }
      else {
        [(AXCameraVisionEngine *)self _performBecameUnlevelFeedback];
      }
      [(AXCameraVisionEngine *)self setLastLevelZone:v7];
      [(AXCameraVisionEngine *)self setLastLevelZoneChangedTime:CFAbsoluteTimeGetCurrent()];
    }
    [(AXCameraVisionEngine *)self _attemptLevelingAnnouncementForZone:v7 previousZone:v5];
  }
  else
  {
    [(AXCameraVisionEngine *)self setLastLevelZone:v7];
    double Current = CFAbsoluteTimeGetCurrent();
    [(AXCameraVisionEngine *)self setLastLevelZoneChangedTime:Current];
  }
}

- (void)_attemptLevelingAnnouncementForZone:(int64_t)a3 previousZone:(int64_t)a4
{
  -[AXCameraVisionEngine _announcementStringForFeedbackZone:](self, "_announcementStringForFeedbackZone:", a3, a4);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21) {
    goto LABEL_25;
  }
  int64_t v6 = [(AXCameraVisionEngine *)self lastAnnouncementType];
  BOOL v7 = [(AXCameraVisionEngine *)self _isLevelingNeededForZone:a3];
  BOOL v8 = [(AXCameraVisionEngine *)self _isLevelingNeededForZone:[(AXCameraVisionEngine *)self lastLevelAnnouncementZone]];
  if (!v7 && !v8) {
    goto LABEL_25;
  }
  if (v6 == 6)
  {
    if (a3 == 1)
    {
      [(AXCameraVisionEngine *)self lastLevelAnnouncementTime];
      double v10 = v12;
      double v11 = 0.0;
      double v13 = 5.0;
      goto LABEL_18;
    }
    int64_t v16 = [(AXCameraVisionEngine *)self lastLevelAnnouncementZone];
    [(AXCameraVisionEngine *)self lastAnnouncementTime];
    double v10 = v17;
    if (v16 == a3)
    {
      double v11 = 10.0;
    }
    else
    {
      [(AXCameraVisionEngine *)self lastLevelZoneChangedTime];
      if (v10 < v18) {
        double v10 = v18;
      }
      double v11 = 3.0;
    }
  }
  else if (v6)
  {
    [(AXCameraVisionEngine *)self lastAnnouncementTime];
    double v10 = v14;
    [(AXCameraVisionEngine *)self lastLevelZoneChangedTime];
    if (v10 < v15) {
      double v10 = v15;
    }
    double v11 = 2.0;
  }
  else
  {
    [(AXCameraVisionEngine *)self lastAnnouncementTime];
    double v10 = v9;
    double v11 = 8.0;
  }
  double v13 = 1.79769313e308;
LABEL_18:
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v20 = Current - v10 >= v11 && Current - v10 <= v13;
  if (v20
    && [(AXCameraVisionEngine *)self _attemptAnnouncement:v21 type:6 isPartial:0 timestamp:Current])
  {
    [(AXCameraVisionEngine *)self setLastLevelAnnouncementZone:a3];
    [(AXCameraVisionEngine *)self setLastLevelAnnouncementTime:Current];
  }
LABEL_25:
}

- (BOOL)_isLevelingNeededForZone:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)_announcementStringForFeedbackZone:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = accessibilityCameraUILocalizedString(off_26509FEE8[a3 - 1]);
  }
  return v4;
}

- (void)motionManagerDidUpdateDeviceMotion:(id)a3 captureOrientation:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(AXCameraVisionEngine *)self sceneObjectElementContainerView];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__AXCameraVisionEngine_motionManagerDidUpdateDeviceMotion_captureOrientation___block_invoke;
    v8[3] = &unk_26509FEA0;
    v8[4] = self;
    int64_t v10 = a4;
    id v9 = v6;
    [(AXCameraVisionEngine *)self _dispatchToResultsQueueWithBlock:v8];
  }
}

void __78__AXCameraVisionEngine_motionManagerDidUpdateDeviceMotion_captureOrientation___block_invoke(uint64_t a1)
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [*(id *)(a1 + 32) setInterfaceOrientation:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleDeviceMotion:");
      id v2 = [*(id *)(a1 + 32) _mostRecentVisionFeatures];
      if ([v2 count])
      {
      }
      else
      {
        uint64_t v3 = [*(id *)(a1 + 32) _accessibilityElementCandidates];
        uint64_t v4 = [v3 count];

        if (!v4) {
          return;
        }
      }
      int64_t v5 = *(void **)(a1 + 32);
      [v5 _handleUpdatedVisionFeatures:0 evaluatedFeatureTypes:0 fromMotionUpdate:1];
    }
  }
}

- (void)captureSessionNode:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (UIAccessibilityIsVoiceOverRunning() && [(AXCameraVisionEngine *)self _queue_appActive])
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    double Width = (double)CVPixelBufferGetWidth(ImageBuffer);
    -[AXCameraVisionEngine set_lastSampleBufferSize:](self, "set_lastSampleBufferSize:", Width, (double)CVPixelBufferGetHeight(ImageBuffer));
    double v12 = [(AXCameraVisionEngine *)self _analysisOptionsForIncomingFrame];
    if ([v12 hasDetectionsEnabled])
    {
      double v13 = [MEMORY[0x263F214D0] videoDeviceFromConnection:v9];
      unsigned int v28 = [MEMORY[0x263F214D0] isMirroredVideoDevice:v13];
      double v26 = v13;
      double v27 = [v13 activeFormat];
      uint64_t v14 = objc_msgSend(MEMORY[0x263F214D0], "videoDimensionsForDeviceFormat:");
      CMSampleBufferGetPresentationTimeStamp(&time, a4);
      double Seconds = CMTimeGetSeconds(&time);
      id v16 = objc_alloc(MEMORY[0x263F214D8]);
      [v27 videoFieldOfView];
      int v18 = v17;
      [v13 videoZoomFactor];
      float v20 = v19;
      id v21 = [(AXCameraVisionEngine *)self lastDeviceMotion];
      double v22 = [v21 attitude];
      LODWORD(v23) = v18;
      *(float *)&double v24 = v20;
      double v25 = (void *)[v16 initWithVideoFieldOfView:(int)v14 zoomFactor:v14 >> 32 sourceWidth:v22 sourceHeight:v23 presentationTimestamp:v24 attitude:Seconds];

      objc_msgSend(v8, "triggerWithSampleBuffer:interfaceOrientation:mirrored:options:userContext:", a4, -[AXCameraVisionEngine interfaceOrientation](self, "interfaceOrientation"), v28, v12, v25);
    }
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  CGAffineTransform v16[2] = __101__AXCameraVisionEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke;
  v16[3] = &unk_26509FEC8;
  objc_copyWeak(&v19, &location);
  id v14 = v11;
  id v17 = v14;
  id v15 = v13;
  id v18 = v15;
  [(AXCameraVisionEngine *)self _dispatchToResultsQueueWithBlock:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __101__AXCameraVisionEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleCameraMetadataObjects:*(void *)(a1 + 32) fromConnection:*(void *)(a1 + 40)];
}

- (void)_handleCameraMetadataObjects:(id)a3 fromConnection:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(AXCameraVisionEngine *)self _lastSampleBufferSize];
    double v10 = v9;
    double v11 = v8;
    if (v9 != *MEMORY[0x263F001B0] || v8 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      unint64_t v13 = [(AXCameraVisionEngine *)self interfaceOrientation];
      if (v13 >= 3) {
        double v14 = v11;
      }
      else {
        double v14 = v10;
      }
      if (v13 < 3) {
        double v10 = v11;
      }
      id v15 = objc_msgSend(MEMORY[0x263F214D0], "videoDeviceFromConnection:", v7, v7);
      uint64_t v16 = [MEMORY[0x263F214D0] isMirroredVideoDevice:v15];
      double v50 = v15;
      double v49 = [v15 activeFormat];
      uint64_t v17 = objc_msgSend(MEMORY[0x263F214D0], "videoDimensionsForDeviceFormat:");
      int64_t v18 = [(AXCameraVisionEngine *)self interfaceOrientation];
      if ((unint64_t)(v18 - 2) > 2) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = qword_2401C1950[v18 - 2];
      }
      id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
      double v48 = [MEMORY[0x263EFF9C0] set];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v43 = v6;
      id obj = v6;
      uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v53;
        uint64_t v45 = v17 >> 32;
        uint64_t v46 = (int)v17;
        uint64_t v47 = v20;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(obj);
            }
            double v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            double v26 = objc_msgSend(MEMORY[0x263F21560], "featureWithMetadata:interfaceOrientation:isMirrored:canvasSize:", v25, v19, v16, v10, v14);
            if (v26)
            {
              if (v25) {
                [v25 time];
              }
              else {
                memset(&time, 0, sizeof(time));
              }
              double Seconds = CMTimeGetSeconds(&time);
              id v28 = objc_alloc(MEMORY[0x263F214D8]);
              [v49 videoFieldOfView];
              int v30 = v29;
              [v50 videoZoomFactor];
              float v32 = v31;
              [(AXCameraVisionEngine *)self lastDeviceMotion];
              CGRect v34 = v33 = self;
              uint64_t v35 = [v34 attitude];
              LODWORD(v36) = v30;
              *(float *)&double v37 = v32;
              CGRect v38 = (void *)[v28 initWithVideoFieldOfView:v46 zoomFactor:v45 sourceWidth:v35 sourceHeight:v36 presentationTimestamp:v37 attitude:Seconds];

              [v26 setUserContext:v38];
              id v20 = v47;
              [v47 addObject:v26];
              id v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "featureType"));
              [v48 addObject:v39];

              self = v33;
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v22);
      }

      if (![obj count])
      {
        [v48 addObject:&unk_26F4116F0];
        [v48 addObject:&unk_26F411780];
      }
      id v7 = v42;
      if ([v48 count])
      {
        uint64_t v40 = [v20 firstObject];
        uint64_t v41 = [v40 userContext];

        [(AXCameraVisionEngine *)self _handleVisionFeatures:v20 evaluatedFeatureTypes:v48 userContext:v41];
      }

      id v6 = v43;
    }
  }
}

- (AXMAVCaptureSessionNode)captureSessionNode
{
  return self->_captureSessionNode;
}

- (void)setCaptureSessionNode:(id)a3
{
}

- (UIView)sceneObjectElementContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneObjectElementContainerView);

  return (UIView *)WeakRetained;
}

- (void)setSceneObjectElementContainerView:(id)a3
{
}

- (BOOL)isAppActive
{
  return self->_appActive;
}

- (OS_dispatch_queue)axResultsQueue
{
  return self->_axResultsQueue;
}

- (AXMVisionEngine)visionEngine
{
  return self->_visionEngine;
}

- (void)setVisionEngine:(id)a3
{
}

- (AXMVisionAnalysisOptions)lastDesiredAnalysisOptions
{
  return self->_lastDesiredAnalysisOptions;
}

- (void)setLastDesiredAnalysisOptions:(id)a3
{
}

- (unint64_t)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unint64_t)a3
{
  self->_currentFrameCount = a3;
}

- (BOOL)_queue_appActive
{
  return self->__queue_appActive;
}

- (void)set_queue_appActive:(BOOL)a3
{
  self->__queue_appActive = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (int64_t)cameraDevicePosition
{
  return self->_cameraDevicePosition;
}

- (void)setCameraDevicePosition:(int64_t)a3
{
  self->_cameraDevicePosition = a3;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (void)setCameraMode:(int64_t)a3
{
  self->_cameraMode = a3;
}

- (CGSize)_lastSampleBufferSize
{
  double width = self->__lastSampleBufferSize.width;
  double height = self->__lastSampleBufferSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_lastSampleBufferSize:(CGSize)a3
{
  self->__lastSampleBufferSize = a3;
}

- (NSMutableDictionary)_mostRecentVisionFeatures
{
  return self->__mostRecentVisionFeatures;
}

- (NSMutableDictionary)_mostRecentVisionFeaturesUpdateTimes
{
  return self->__mostRecentVisionFeaturesUpdateTimes;
}

- (NSArray)_accessibilityElementCandidates
{
  return self->__accessibilityElementCandidates;
}

- (void)set_accessibilityElementCandidates:(id)a3
{
}

- (NSString)lastAnnouncement
{
  return self->_lastAnnouncement;
}

- (void)setLastAnnouncement:(id)a3
{
}

- (int64_t)lastAnnouncementType
{
  return self->_lastAnnouncementType;
}

- (void)setLastAnnouncementType:(int64_t)a3
{
  self->_lastAnnouncementType = a3;
}

- (BOOL)isLastAnnouncementPartial
{
  return self->_lastAnnouncementPartial;
}

- (void)setLastAnnouncementPartial:(BOOL)a3
{
  self->_lastAnnouncementPartial = a3;
}

- (double)lastAnnouncementTime
{
  return self->_lastAnnouncementTime;
}

- (void)setLastAnnouncementTime:(double)a3
{
  self->_lastAnnouncementTime = a3;
}

- (NSString)inflightAnnouncement
{
  return self->_inflightAnnouncement;
}

- (void)setInflightAnnouncement:(id)a3
{
}

- (NSString)previousSceneAnnouncementCandidateWithoutLocation
{
  return self->_previousSceneAnnouncementCandidateWithoutLocation;
}

- (double)previousSceneAnnouncementCandidateWithoutLocationChangedTime
{
  return self->_previousSceneAnnouncementCandidateWithoutLocationChangedTime;
}

- (void)setPreviousSceneAnnouncementCandidateWithoutLocationChangedTime:(double)a3
{
  self->_previousSceneAnnouncementCandidateWithoutLocationChangedTime = a3;
}

- (NSString)lastSceneAnnouncement
{
  return self->_lastSceneAnnouncement;
}

- (void)setLastSceneAnnouncement:(id)a3
{
}

- (NSString)lastSceneAnnouncementFull
{
  return self->_lastSceneAnnouncementFull;
}

- (void)setLastSceneAnnouncementFull:(id)a3
{
}

- (NSString)lastSceneAnnouncementWithoutLocation
{
  return self->_lastSceneAnnouncementWithoutLocation;
}

- (void)setLastSceneAnnouncementWithoutLocation:(id)a3
{
}

- (int64_t)lastSceneAnnouncementLocation
{
  return self->_lastSceneAnnouncementLocation;
}

- (void)setLastSceneAnnouncementLocation:(int64_t)a3
{
  self->_lastSceneAnnouncementLocation = a3;
}

- (double)lastSceneAnnouncementTime
{
  return self->_lastSceneAnnouncementTime;
}

- (void)setLastSceneAnnouncementTime:(double)a3
{
  self->_lastSceneAnnouncementTime = a3;
}

- (double)lastSceneAnnouncementFullTime
{
  return self->_lastSceneAnnouncementFullTime;
}

- (void)setLastSceneAnnouncementFullTime:(double)a3
{
  self->_lastSceneAnnouncementFullTime = a3;
}

- (int64_t)lastLevelZone
{
  return self->_lastLevelZone;
}

- (void)setLastLevelZone:(int64_t)a3
{
  self->_lastLevelZone = a3;
}

- (double)lastLevelZoneChangedTime
{
  return self->_lastLevelZoneChangedTime;
}

- (void)setLastLevelZoneChangedTime:(double)a3
{
  self->_lastLevelZoneChangedTime = a3;
}

- (int64_t)lastLevelAnnouncementZone
{
  return self->_lastLevelAnnouncementZone;
}

- (void)setLastLevelAnnouncementZone:(int64_t)a3
{
  self->_lastLevelAnnouncementZone = a3;
}

- (double)lastLevelAnnouncementTime
{
  return self->_lastLevelAnnouncementTime;
}

- (void)setLastLevelAnnouncementTime:(double)a3
{
  self->_lastLevelAnnouncementTime = a3;
}

- (AXCameraLevelingMotionAnalyzer)_levelingMotionAnalyzer
{
  return self->__levelingMotionAnalyzer;
}

- (CMDeviceMotion)lastDeviceMotion
{
  return self->_lastDeviceMotion;
}

- (void)setLastDeviceMotion:(id)a3
{
}

- (AXMCameraFrameContext)lastCameraFrameContext
{
  return self->_lastCameraFrameContext;
}

- (void)setLastCameraFrameContext:(id)a3
{
}

- (AXCameraHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_lastCameraFrameContext, 0);
  objc_storeStrong((id *)&self->_lastDeviceMotion, 0);
  objc_storeStrong((id *)&self->__levelingMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_lastSceneAnnouncementWithoutLocation, 0);
  objc_storeStrong((id *)&self->_lastSceneAnnouncementFull, 0);
  objc_storeStrong((id *)&self->_lastSceneAnnouncement, 0);
  objc_storeStrong((id *)&self->_previousSceneAnnouncementCandidateWithoutLocation, 0);
  objc_storeStrong((id *)&self->_inflightAnnouncement, 0);
  objc_storeStrong((id *)&self->_lastAnnouncement, 0);
  objc_storeStrong((id *)&self->__accessibilityElementCandidates, 0);
  objc_storeStrong((id *)&self->__mostRecentVisionFeaturesUpdateTimes, 0);
  objc_storeStrong((id *)&self->__mostRecentVisionFeatures, 0);
  objc_storeStrong((id *)&self->_lastDesiredAnalysisOptions, 0);
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_axResultsQueue, 0);
  objc_destroyWeak((id *)&self->_sceneObjectElementContainerView);
  objc_storeStrong((id *)&self->_captureSessionNode, 0);

  objc_destroyWeak((id *)&self->_captureSession);
}

- (void)_handleVisionFeatures:(uint8_t *)buf evaluatedFeatureTypes:(unsigned char *)a2 userContext:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_24019A000, log, OS_LOG_TYPE_FAULT, "CameraMetadata feature not expected to be handled on Vision results queue. We would have to account for this here.", buf, 2u);
}

- (void)_handleVisionFeatures:(uint8_t *)buf evaluatedFeatureTypes:(unsigned char *)a2 userContext:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_24019A000, log, OS_LOG_TYPE_FAULT, "Motion feature should not be handled on Vision results queue. We would have to account for this here.", buf, 2u);
}

@end