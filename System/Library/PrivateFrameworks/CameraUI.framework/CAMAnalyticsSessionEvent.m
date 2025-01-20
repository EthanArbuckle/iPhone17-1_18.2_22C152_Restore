@interface CAMAnalyticsSessionEvent
+ (id)_bucketCaptureCount:(id)a3;
+ (void)_incrementDictionaryCount:(id)a3 forKey:(id)a4;
- (BOOL)_hadActiveCall;
- (BOOL)_isInCameraRoll;
- (BOOL)_launchEventWithinReasonableTimeInterval;
- (BOOL)_mrcDetectionEnabled;
- (BOOL)_textDetectionEnabled;
- (BOOL)didCapture;
- (CAMAnalyticsSessionEvent)initWithCapabilities:(id)a3 availableCaptureModes:(id)a4 currentCaptureMode:(int64_t)a5 currentCaptureDevice:(int64_t)a6 callStatusMonitor:(id)a7;
- (CAMCallStatusMonitor)_callStatusMonitor;
- (CAMCaptureCapabilities)_capabilities;
- (NSMutableDictionary)_captureCountsByMediaType;
- (NSMutableDictionary)_captureCountsByMode;
- (NSSet)_availableCaptureModes;
- (NSString)_firstCaptureDevicePosition;
- (NSString)_firstCaptureMode;
- (NSString)_hostProcess;
- (NSString)_prewarmLaunchReason;
- (double)_cameraRollStartTime;
- (double)_cameraRollTotalTime;
- (double)_firstCaptureStartTime;
- (double)_previewStartTime;
- (double)_startTime;
- (id)_bucketCaptureCountForMediaType:(int64_t)a3;
- (id)_bucketCaptureCountForMode:(int64_t)a3;
- (id)eventName;
- (int64_t)_cameraRollInteraction;
- (int64_t)_firstConfiguredDevice;
- (int64_t)_firstConfiguredMode;
- (unint64_t)_totalCaptures;
- (unint64_t)_totalControlDrawerOpenings;
- (unint64_t)_totalFocusInteractions;
- (unint64_t)_totalFocusLockInteractions;
- (unint64_t)_totalMRCInteractions;
- (unint64_t)_totalPortraitLightingChanges;
- (unint64_t)_totalTextInteractions;
- (unint64_t)_totalZoomInteractions;
- (void)_endSession;
- (void)_handleCallStatusMonitorDidChangeCallActive:(id)a3;
- (void)_incrementCaptureForGraphConfiguration:(id)a3 analyticsMediaType:(int64_t)a4;
- (void)_setInCameraRoll:(BOOL)a3;
- (void)countEventsFromAnalyticsVisionSession:(id)a3;
- (void)didCaptureTimelapseWithConfiguration:(id)a3;
- (void)didCaptureWithRequest:(id)a3 currentConfiguration:(id)a4;
- (void)didChangePortraitLighting;
- (void)didDismissCameraRoll;
- (void)didFocusInteraction;
- (void)didFocusLockInteraction;
- (void)didPresentCameraRoll;
- (void)didPresentControlDrawerForReason:(int64_t)a3;
- (void)didPrewarmWithReason:(id)a3;
- (void)didStartPreview;
- (void)didZoomInteraction:(int64_t)a3;
- (void)publish;
- (void)setFirstConfiguredCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4;
- (void)set_availableCaptureModes:(id)a3;
- (void)set_cameraRollInteraction:(int64_t)a3;
- (void)set_cameraRollStartTime:(double)a3;
- (void)set_cameraRollTotalTime:(double)a3;
- (void)set_firstCaptureDevicePosition:(id)a3;
- (void)set_firstCaptureMode:(id)a3;
- (void)set_firstCaptureStartTime:(double)a3;
- (void)set_firstConfiguredDevice:(int64_t)a3;
- (void)set_firstConfiguredMode:(int64_t)a3;
- (void)set_hadActiveCall:(BOOL)a3;
- (void)set_previewStartTime:(double)a3;
- (void)set_prewarmLaunchReason:(id)a3;
- (void)set_totalCaptures:(unint64_t)a3;
- (void)set_totalControlDrawerOpenings:(unint64_t)a3;
- (void)set_totalFocusInteractions:(unint64_t)a3;
- (void)set_totalFocusLockInteractions:(unint64_t)a3;
- (void)set_totalMRCInteractions:(unint64_t)a3;
- (void)set_totalPortraitLightingChanges:(unint64_t)a3;
- (void)set_totalTextInteractions:(unint64_t)a3;
- (void)set_totalZoomInteractions:(unint64_t)a3;
- (void)updateForLocationController:(id)a3;
@end

@implementation CAMAnalyticsSessionEvent

- (CAMAnalyticsSessionEvent)initWithCapabilities:(id)a3 availableCaptureModes:(id)a4 currentCaptureMode:(int64_t)a5 currentCaptureDevice:(int64_t)a6 callStatusMonitor:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsSessionEvent;
  v16 = [(CAMAnalyticsEvent *)&v29 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->__capabilities, a3);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    captureCountsByMode = v17->__captureCountsByMode;
    v17->__captureCountsByMode = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    captureCountsByMediaType = v17->__captureCountsByMediaType;
    v17->__captureCountsByMediaType = v20;

    v17->__cameraRollInteraction = 0;
    v17->__startTime = CFAbsoluteTimeGetCurrent();
    unint64_t v22 = [v13 hostProcess];
    v23 = 0;
    if (v22 <= 5) {
      v23 = off_263FA63C8[v22];
    }
    hostProcess = v17->__hostProcess;
    v17->__hostProcess = &v23->isa;

    v25 = +[CAMUserPreferences preferences];
    v17->__textDetectionEnabled = [v25 isImageAnalysisEnabled];

    v26 = +[CAMUserPreferences preferences];
    v17->__mrcDetectionEnabled = [v26 shouldShowQRBanners];

    objc_storeStrong((id *)&v17->__availableCaptureModes, a4);
    v17->__firstConfiguredMode = a5;
    v17->__firstConfiguredDevice = a6;
    objc_storeStrong((id *)&v17->__callStatusMonitor, a7);
    if ([v15 isCallActive]) {
      [(CAMAnalyticsSessionEvent *)v17 set_hadActiveCall:1];
    }
    v27 = +[CAMPriorityNotificationCenter defaultCenter];
    [v27 addObserver:v17 selector:sel__handleCallStatusMonitorDidChangeCallActive_ name:@"CAMCallStatusMonitorDidChangeCallActiveNotification" object:0];
  }
  return v17;
}

- (id)eventName
{
  return @"session";
}

- (void)_endSession
{
  id v63 = [(CAMAnalyticsEvent *)self _eventMap];
  v3 = [(CAMAnalyticsSessionEvent *)self _hostProcess];
  [v63 setObject:v3 forKeyedSubscript:@"hostProcess"];

  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsSessionEvent *)self _startTime];
  double v6 = Current - v5;
  v7 = [NSNumber numberWithDouble:v6];
  [v63 setObject:v7 forKeyedSubscript:@"totalDuration"];

  if ([(CAMAnalyticsSessionEvent *)self _isInCameraRoll]) {
    [(CAMAnalyticsSessionEvent *)self didDismissCameraRoll];
  }
  v8 = [(CAMAnalyticsSessionEvent *)self _firstCaptureMode];
  [v63 setObject:v8 forKeyedSubscript:@"firstCaptureMode"];

  v9 = [(CAMAnalyticsSessionEvent *)self _firstCaptureDevicePosition];
  [v63 setObject:v9 forKeyedSubscript:@"firstCaptureDevice"];

  [(CAMAnalyticsSessionEvent *)self _cameraRollTotalTime];
  if (v10 > 0.0)
  {
    v11 = NSNumber;
    [(CAMAnalyticsSessionEvent *)self _cameraRollTotalTime];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v63 setObject:v12 forKeyedSubscript:@"totalCameraRollDuration"];
  }
  id v13 = NSNumber;
  [(CAMAnalyticsSessionEvent *)self _cameraRollTotalTime];
  id v15 = [v13 numberWithDouble:v6 - v14];
  [v63 setObject:v15 forKeyedSubscript:@"totalCameraDuration"];

  [(CAMAnalyticsSessionEvent *)self _previewStartTime];
  if (v16 > 0.0)
  {
    [(CAMAnalyticsSessionEvent *)self _previewStartTime];
    double v18 = v17;
    [(CAMAnalyticsSessionEvent *)self _startTime];
    v20 = [NSNumber numberWithDouble:v18 - v19];
    [v63 setObject:v20 forKeyedSubscript:@"timeToPreview"];
  }
  if ([(CAMAnalyticsSessionEvent *)self _cameraRollInteraction])
  {
    unint64_t v21 = [(CAMAnalyticsSessionEvent *)self _cameraRollInteraction];
    if (v21 > 3) {
      unint64_t v22 = 0;
    }
    else {
      unint64_t v22 = off_263FA63F8[v21];
    }
    [v63 setObject:v22 forKeyedSubscript:@"didInteractWithCameraRoll"];
  }
  if ([(CAMAnalyticsSessionEvent *)self _totalCaptures])
  {
    [(CAMAnalyticsSessionEvent *)self _firstCaptureStartTime];
    double v24 = v23;
    [(CAMAnalyticsSessionEvent *)self _startTime];
    v26 = [NSNumber numberWithDouble:v24 - v25];
    [v63 setObject:v26 forKeyedSubscript:@"timeToFirstCapture"];
  }
  BOOL v27 = 1;
  v28 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:1];
  [v63 setObject:v28 forKeyedSubscript:@"captureCountVideoMode"];

  objc_super v29 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:0];
  [v63 setObject:v29 forKeyedSubscript:@"captureCountPhotoMode"];

  v30 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:4];
  [v63 setObject:v30 forKeyedSubscript:@"captureCountSquareMode"];

  v31 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:2];
  [v63 setObject:v31 forKeyedSubscript:@"captureCountSlomoMode"];

  v32 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:6];
  [v63 setObject:v32 forKeyedSubscript:@"captureCountPortraitMode"];

  v33 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:7];
  [v63 setObject:v33 forKeyedSubscript:@"captureCountCinematicMode"];

  v34 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:3];
  [v63 setObject:v34 forKeyedSubscript:@"captureCountPanoramaMode"];

  v35 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:5];
  [v63 setObject:v35 forKeyedSubscript:@"captureCountTimelapseMode"];

  v36 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:8];
  [v63 setObject:v36 forKeyedSubscript:@"captureCountSpatialVideoMode"];

  v37 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMode:9];
  [v63 setObject:v37 forKeyedSubscript:@"captureCountSpatialPhotoMode"];

  v38 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMediaType:1];
  [v63 setObject:v38 forKeyedSubscript:@"mediaTypeCountVideo"];

  v39 = [(CAMAnalyticsSessionEvent *)self _bucketCaptureCountForMediaType:0];
  [v63 setObject:v39 forKeyedSubscript:@"mediaTypeCountPhoto"];

  v40 = objc_opt_class();
  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures"));
  v42 = [v40 _bucketCaptureCount:v41];
  [v63 setObject:v42 forKeyedSubscript:@"captureCountTotal"];

  v43 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsSessionEvent _totalCaptures](self, "_totalCaptures") != 0);
  [v63 setObject:v43 forKeyedSubscript:@"didCapture"];

  v44 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsSessionEvent _totalZoomInteractions](self, "_totalZoomInteractions") != 0);
  [v63 setObject:v44 forKeyedSubscript:@"didZoom"];

  v45 = NSNumber;
  if (![(CAMAnalyticsSessionEvent *)self _totalFocusInteractions]) {
    BOOL v27 = [(CAMAnalyticsSessionEvent *)self _totalFocusLockInteractions] != 0;
  }
  v46 = [v45 numberWithInt:v27];
  [v63 setObject:v46 forKeyedSubscript:@"didTapToFocus"];

  v47 = [(CAMAnalyticsSessionEvent *)self _capabilities];
  int v48 = [v47 arePortraitEffectsSupported];

  if (v48)
  {
    v49 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsSessionEvent _totalPortraitLightingChanges](self, "_totalPortraitLightingChanges") != 0);
    [v63 setObject:v49 forKeyedSubscript:@"didChangePortraitLighting"];
  }
  if ([(CAMAnalyticsSessionEvent *)self _textDetectionEnabled])
  {
    v50 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsSessionEvent _totalTextInteractions](self, "_totalTextInteractions") != 0);
    [v63 setObject:v50 forKeyedSubscript:@"didInteractWithText"];
  }
  if ([(CAMAnalyticsSessionEvent *)self _mrcDetectionEnabled])
  {
    v51 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsSessionEvent _totalMRCInteractions](self, "_totalMRCInteractions") != 0);
    [v63 setObject:v51 forKeyedSubscript:@"didInteractWithMRC"];
  }
  v52 = [(CAMAnalyticsSessionEvent *)self _capabilities];
  int v53 = [v52 hasSystemTelephonyOfAnyKind];

  if (v53)
  {
    v54 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMAnalyticsSessionEvent _hadActiveCall](self, "_hadActiveCall"));
    [v63 setObject:v54 forKeyedSubscript:@"hadActiveCall"];
  }
  v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAMAnalyticsSessionEvent _totalControlDrawerOpenings](self, "_totalControlDrawerOpenings"));
  [v63 setObject:v55 forKeyedSubscript:@"totalControlDrawerOpenings"];

  v56 = [(CAMAnalyticsSessionEvent *)self _prewarmLaunchReason];

  if (v56)
  {
    v57 = [(CAMAnalyticsSessionEvent *)self _prewarmLaunchReason];
    [v63 setObject:v57 forKeyedSubscript:@"launchMethod"];
  }
  unint64_t v58 = [(CAMAnalyticsSessionEvent *)self _firstConfiguredDevice];
  if (v58 > 0xB) {
    v59 = 0;
  }
  else {
    v59 = off_263FA6418[v58];
  }
  [v63 setObject:v59 forKeyedSubscript:@"firstConfiguredDevice"];
  unint64_t v60 = [(CAMAnalyticsSessionEvent *)self _firstConfiguredMode];
  if (v60 > 9) {
    v61 = 0;
  }
  else {
    v61 = off_263FA6478[v60];
  }
  [v63 setObject:v61 forKeyedSubscript:@"firstConfiguredMode"];
  v62 = +[CAMPriorityNotificationCenter defaultCenter];
  [v62 removeObserver:self];
}

- (void)didStartPreview
{
  [(CAMAnalyticsSessionEvent *)self _previewStartTime];
  if (v3 == 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(CAMAnalyticsSessionEvent *)self set_previewStartTime:Current];
  }
}

- (void)didPresentCameraRoll
{
  [(CAMAnalyticsSessionEvent *)self _setInCameraRoll:1];
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsSessionEvent *)self set_cameraRollStartTime:Current];
}

- (void)didDismissCameraRoll
{
  if (![(CAMAnalyticsSessionEvent *)self _isInCameraRoll]) {
    return;
  }
  [(CAMAnalyticsSessionEvent *)self _setInCameraRoll:0];
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsSessionEvent *)self _cameraRollStartTime];
  double v5 = Current - v4;
  [(CAMAnalyticsSessionEvent *)self _cameraRollTotalTime];
  [(CAMAnalyticsSessionEvent *)self set_cameraRollTotalTime:v6 + v5];
  int64_t v7 = [(CAMAnalyticsSessionEvent *)self _cameraRollInteraction];
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 != 1) {
      goto LABEL_10;
    }
    uint64_t v9 = 3;
  }
  else
  {
    uint64_t v9 = 2;
  }
  if ([(CAMAnalyticsSessionEvent *)self _totalCaptures]) {
    uint64_t v8 = v9;
  }
  else {
    uint64_t v8 = 1;
  }
LABEL_10:
  [(CAMAnalyticsSessionEvent *)self set_cameraRollInteraction:v8];
}

+ (void)_incrementDictionaryCount:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  double v6 = [v9 objectForKeyedSubscript:v5];
  int64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "unsignedIntValue") + 1);
    [v9 setObject:v8 forKeyedSubscript:v5];
  }
  else
  {
    [v9 setObject:&unk_26BDDEEE0 forKeyedSubscript:v5];
  }
}

+ (id)_bucketCaptureCount:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_class();
  [v3 doubleValue];
  double v6 = v5;

  [v4 bucketedPowerOf2ForValue:1 allowZero:v6 minPositiveValue:1.0 maxValue:1024.0];
  int64_t v7 = NSNumber;
  return (id)objc_msgSend(v7, "numberWithDouble:");
}

- (id)_bucketCaptureCountForMediaType:(int64_t)a3
{
  double v4 = [(CAMAnalyticsSessionEvent *)self _captureCountsByMediaType];
  double v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  int64_t v7 = [(id)objc_opt_class() _bucketCaptureCount:v6];

  return v7;
}

- (id)_bucketCaptureCountForMode:(int64_t)a3
{
  double v5 = [(CAMAnalyticsSessionEvent *)self _availableCaptureModes];
  double v6 = [NSNumber numberWithInteger:a3];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = [(CAMAnalyticsSessionEvent *)self _captureCountsByMode];
    id v9 = [NSNumber numberWithInteger:a3];
    double v10 = [v8 objectForKeyedSubscript:v9];

    v11 = [(id)objc_opt_class() _bucketCaptureCount:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_incrementCaptureForGraphConfiguration:(id)a3 analyticsMediaType:(int64_t)a4
{
  uint64_t v6 = [a3 mode];
  int v7 = objc_opt_class();
  uint64_t v8 = [(CAMAnalyticsSessionEvent *)self _captureCountsByMode];
  id v9 = [NSNumber numberWithInteger:v6];
  [v7 _incrementDictionaryCount:v8 forKey:v9];

  double v10 = objc_opt_class();
  v11 = [(CAMAnalyticsSessionEvent *)self _captureCountsByMediaType];
  v12 = [NSNumber numberWithInteger:a4];
  [v10 _incrementDictionaryCount:v11 forKey:v12];

  if (![(CAMAnalyticsSessionEvent *)self _totalCaptures]) {
    [(CAMAnalyticsSessionEvent *)self set_firstCaptureStartTime:CFAbsoluteTimeGetCurrent()];
  }
  unint64_t v13 = [(CAMAnalyticsSessionEvent *)self _totalCaptures] + 1;
  [(CAMAnalyticsSessionEvent *)self set_totalCaptures:v13];
}

- (void)didCaptureWithRequest:(id)a3 currentConfiguration:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v12 type];
  if (v7 == 1)
  {
    BOOL v8 = 1;
  }
  else if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [v12 ctmCaptureType] == 2;
  }
  [(CAMAnalyticsSessionEvent *)self _incrementCaptureForGraphConfiguration:v6 analyticsMediaType:v8];
  id v9 = [(CAMAnalyticsSessionEvent *)self _firstCaptureMode];

  if (!v9)
  {
    double v10 = [v6 modeDescription];
    [(CAMAnalyticsSessionEvent *)self set_firstCaptureMode:v10];

    v11 = [v6 devicePositionDescription];
    [(CAMAnalyticsSessionEvent *)self set_firstCaptureDevicePosition:v11];
  }
}

- (void)didCaptureTimelapseWithConfiguration:(id)a3
{
}

- (void)didZoomInteraction:(int64_t)a3
{
  unint64_t v4 = [(CAMAnalyticsSessionEvent *)self _totalZoomInteractions] + 1;
  [(CAMAnalyticsSessionEvent *)self set_totalZoomInteractions:v4];
}

- (void)didFocusInteraction
{
  unint64_t v3 = [(CAMAnalyticsSessionEvent *)self _totalFocusInteractions] + 1;
  [(CAMAnalyticsSessionEvent *)self set_totalFocusInteractions:v3];
}

- (void)didFocusLockInteraction
{
  unint64_t v3 = [(CAMAnalyticsSessionEvent *)self _totalFocusLockInteractions] + 1;
  [(CAMAnalyticsSessionEvent *)self set_totalFocusLockInteractions:v3];
}

- (void)didChangePortraitLighting
{
  unint64_t v3 = [(CAMAnalyticsSessionEvent *)self _totalPortraitLightingChanges] + 1;
  [(CAMAnalyticsSessionEvent *)self set_totalPortraitLightingChanges:v3];
}

- (void)didPresentControlDrawerForReason:(int64_t)a3
{
  if (a3 != 2)
  {
    unint64_t v5 = [(CAMAnalyticsSessionEvent *)self _totalControlDrawerOpenings] + 1;
    [(CAMAnalyticsSessionEvent *)self set_totalControlDrawerOpenings:v5];
  }
}

- (void)countEventsFromAnalyticsVisionSession:(id)a3
{
  id v4 = a3;
  -[CAMAnalyticsSessionEvent set_totalMRCInteractions:](self, "set_totalMRCInteractions:", -[CAMAnalyticsSessionEvent _totalMRCInteractions](self, "_totalMRCInteractions")+ [v4 totalMRCInteractions]);
  uint64_t v5 = [v4 totalTextInteractions];

  unint64_t v6 = [(CAMAnalyticsSessionEvent *)self _totalTextInteractions] + v5;
  [(CAMAnalyticsSessionEvent *)self set_totalTextInteractions:v6];
}

- (void)publish
{
  [(CAMAnalyticsSessionEvent *)self _endSession];
  v3.receiver = self;
  v3.super_class = (Class)CAMAnalyticsSessionEvent;
  [(CAMAnalyticsEvent *)&v3 publish];
}

- (BOOL)didCapture
{
  return [(CAMAnalyticsSessionEvent *)self _totalCaptures] != 0;
}

- (void)_handleCallStatusMonitorDidChangeCallActive:(id)a3
{
  id v4 = [(CAMAnalyticsSessionEvent *)self _callStatusMonitor];
  int v5 = [v4 isCallActive];

  if (v5)
  {
    [(CAMAnalyticsSessionEvent *)self set_hadActiveCall:1];
  }
}

- (void)updateForLocationController:(id)a3
{
  if (a3)
  {
    unsigned int v4 = [a3 lastKnownAuthorizationStatus];
    if (v4 > 4) {
      int v5 = 0;
    }
    else {
      int v5 = off_263FA64C8[v4];
    }
    id v6 = [(CAMAnalyticsEvent *)self _eventMap];
    [v6 setObject:v5 forKeyedSubscript:@"locationAuthorizationStatus"];
  }
}

- (BOOL)_launchEventWithinReasonableTimeInterval
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsSessionEvent *)self _startTime];
  return Current - v4 < 0.2;
}

- (void)didPrewarmWithReason:(id)a3
{
  id v5 = a3;
  double v4 = [(CAMAnalyticsSessionEvent *)self _prewarmLaunchReason];

  if (!v4) {
    [(CAMAnalyticsSessionEvent *)self set_prewarmLaunchReason:v5];
  }
}

- (void)setFirstConfiguredCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4
{
  if ([(CAMAnalyticsSessionEvent *)self _launchEventWithinReasonableTimeInterval])
  {
    [(CAMAnalyticsSessionEvent *)self set_firstConfiguredMode:a3];
    [(CAMAnalyticsSessionEvent *)self set_firstConfiguredDevice:a4];
  }
}

- (CAMCaptureCapabilities)_capabilities
{
  return self->__capabilities;
}

- (NSString)_hostProcess
{
  return self->__hostProcess;
}

- (double)_startTime
{
  return self->__startTime;
}

- (NSString)_firstCaptureMode
{
  return self->__firstCaptureMode;
}

- (void)set_firstCaptureMode:(id)a3
{
}

- (NSString)_firstCaptureDevicePosition
{
  return self->__firstCaptureDevicePosition;
}

- (void)set_firstCaptureDevicePosition:(id)a3
{
}

- (double)_cameraRollStartTime
{
  return self->__cameraRollStartTime;
}

- (void)set_cameraRollStartTime:(double)a3
{
  self->__cameraRollStartTime = a3;
}

- (double)_cameraRollTotalTime
{
  return self->__cameraRollTotalTime;
}

- (void)set_cameraRollTotalTime:(double)a3
{
  self->__cameraRollTotalTime = a3;
}

- (BOOL)_isInCameraRoll
{
  return self->__inCameraRoll;
}

- (void)_setInCameraRoll:(BOOL)a3
{
  self->__inCameraRoll = a3;
}

- (int64_t)_cameraRollInteraction
{
  return self->__cameraRollInteraction;
}

- (void)set_cameraRollInteraction:(int64_t)a3
{
  self->__cameraRollInteraction = a3;
}

- (double)_previewStartTime
{
  return self->__previewStartTime;
}

- (void)set_previewStartTime:(double)a3
{
  self->__previewStartTime = a3;
}

- (double)_firstCaptureStartTime
{
  return self->__firstCaptureStartTime;
}

- (void)set_firstCaptureStartTime:(double)a3
{
  self->__firstCaptureStartTime = a3;
}

- (NSMutableDictionary)_captureCountsByMode
{
  return self->__captureCountsByMode;
}

- (NSMutableDictionary)_captureCountsByMediaType
{
  return self->__captureCountsByMediaType;
}

- (unint64_t)_totalControlDrawerOpenings
{
  return self->__totalControlDrawerOpenings;
}

- (void)set_totalControlDrawerOpenings:(unint64_t)a3
{
  self->__totalControlDrawerOpenings = a3;
}

- (unint64_t)_totalZoomInteractions
{
  return self->__totalZoomInteractions;
}

- (void)set_totalZoomInteractions:(unint64_t)a3
{
  self->__totalZoomInteractions = a3;
}

- (unint64_t)_totalFocusInteractions
{
  return self->__totalFocusInteractions;
}

- (void)set_totalFocusInteractions:(unint64_t)a3
{
  self->__totalFocusInteractions = a3;
}

- (unint64_t)_totalFocusLockInteractions
{
  return self->__totalFocusLockInteractions;
}

- (void)set_totalFocusLockInteractions:(unint64_t)a3
{
  self->__totalFocusLockInteractions = a3;
}

- (unint64_t)_totalPortraitLightingChanges
{
  return self->__totalPortraitLightingChanges;
}

- (void)set_totalPortraitLightingChanges:(unint64_t)a3
{
  self->__totalPortraitLightingChanges = a3;
}

- (unint64_t)_totalCaptures
{
  return self->__totalCaptures;
}

- (void)set_totalCaptures:(unint64_t)a3
{
  self->__totalCaptures = a3;
}

- (unint64_t)_totalTextInteractions
{
  return self->__totalTextInteractions;
}

- (void)set_totalTextInteractions:(unint64_t)a3
{
  self->__totalTextInteractions = a3;
}

- (unint64_t)_totalMRCInteractions
{
  return self->__totalMRCInteractions;
}

- (void)set_totalMRCInteractions:(unint64_t)a3
{
  self->__totalMRCInteractions = a3;
}

- (BOOL)_mrcDetectionEnabled
{
  return self->__mrcDetectionEnabled;
}

- (BOOL)_textDetectionEnabled
{
  return self->__textDetectionEnabled;
}

- (NSSet)_availableCaptureModes
{
  return self->__availableCaptureModes;
}

- (void)set_availableCaptureModes:(id)a3
{
}

- (BOOL)_hadActiveCall
{
  return self->__hadActiveCall;
}

- (void)set_hadActiveCall:(BOOL)a3
{
  self->__hadActiveCall = a3;
}

- (CAMCallStatusMonitor)_callStatusMonitor
{
  return self->__callStatusMonitor;
}

- (NSString)_prewarmLaunchReason
{
  return self->__prewarmLaunchReason;
}

- (void)set_prewarmLaunchReason:(id)a3
{
}

- (int64_t)_firstConfiguredMode
{
  return self->__firstConfiguredMode;
}

- (void)set_firstConfiguredMode:(int64_t)a3
{
  self->__firstConfiguredMode = a3;
}

- (int64_t)_firstConfiguredDevice
{
  return self->__firstConfiguredDevice;
}

- (void)set_firstConfiguredDevice:(int64_t)a3
{
  self->__firstConfiguredDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__prewarmLaunchReason, 0);
  objc_storeStrong((id *)&self->__callStatusMonitor, 0);
  objc_storeStrong((id *)&self->__availableCaptureModes, 0);
  objc_storeStrong((id *)&self->__captureCountsByMediaType, 0);
  objc_storeStrong((id *)&self->__captureCountsByMode, 0);
  objc_storeStrong((id *)&self->__firstCaptureDevicePosition, 0);
  objc_storeStrong((id *)&self->__firstCaptureMode, 0);
  objc_storeStrong((id *)&self->__hostProcess, 0);
  objc_storeStrong((id *)&self->__capabilities, 0);
}

@end