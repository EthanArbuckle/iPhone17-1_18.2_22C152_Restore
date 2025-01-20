@interface AXMTCameraBasedLookAtPointTracker
+ (CGPoint)_defaultOnScreenPoint;
- (AXMTCameraBasedLookAtPointTracker)initWithInput:(id)a3 trackingType:(unint64_t)a4;
- (AXMTFaceKitFaceTracker)_faceKitFaceTracker;
- (AXMTLookAtPointTrackerDelegate)delegate;
- (AXMTRelativePointerMovementMapper)_pointerMovementMapper;
- (AXMTTrackingAreaPointMapper)_trackingAreaPointMapper;
- (AXMTVelocityBasedPointMapper)_velocityBasedPointMapper;
- (AXMTVideoCapturer)_videoCapturer;
- (AXMTVideoFileReader)_videoFileReader;
- (AXMTVideoPreviewLayer)_videoPreviewLayer;
- (AXMTVisionKitEyeTracker)_visionKitEyeTracker;
- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration;
- (AXSSMotionTrackingInput)input;
- (BOOL)_hasFace;
- (BOOL)_isStarted;
- (BOOL)_movementDetectedWithNewPoint:(CGPoint)a3;
- (BOOL)_needsRecalibration;
- (BOOL)_trackingTypeSupportsOnDeviceGaze;
- (BOOL)debugOverlayEnabled;
- (CGPoint)_iOSConvertProjectedPointToScreenCoordinates:(CGPoint)a3 useSensitivity:(BOOL)a4;
- (CGPoint)_trackedOnScreenPoint;
- (CGSize)_physicalDisplaySizeMM;
- (NSError)_error;
- (NSMutableArray)_screenLookAtPoints;
- (NSNumber)_calibratedPitch;
- (NSNumber)_calibratedYaw;
- (NSSet)_previousExpressions;
- (OS_dispatch_queue)_controllerQueue;
- (UIView)_rootView;
- (UIView)debugOverlayRootView;
- (double)joystickModeMovementThreshold;
- (double)sensitivity;
- (id)_handleDetectedFaceWithProjectedPoint:(double)a3 pose:(double)a4 poseTranslation:(double)a5;
- (unint64_t)motionTrackingMode;
- (unint64_t)trackingType;
- (void)_clearVideoPreviewLayer;
- (void)_handleDetectedFaceAbsoluteModeWithFaceBounds:(double)a3 pose:(double)a4;
- (void)_handleDetectedFaceHIDModeWithFaceBounds:(CGRect)a3 noseCenter:(CGPoint)a4 imageSize:(CGSize)a5;
- (void)_handleDetectedFaceJoystickModeWithPose:(double)a3 poseTranslation:(float32x4_t)a4;
- (void)_iOSComputeAbsoluteModeForPoint:(CGPoint)a3;
- (void)_iOSComputeAccelerationModeForPoint:(CGPoint)a3;
- (void)_initializeFaceKitFaceTrackerWithInput:(id)a3;
- (void)_loadCalibrationValuesFromDefaults;
- (void)_setUpDebugOverlay;
- (void)_signalTrackedImageRelativePoint:(CGPoint)a3 inBounds:(CGSize)a4;
- (void)_signalTrackedUnboundedOnScreenPoint:(CGPoint)a3 boundPoint:(BOOL)a4;
- (void)_signalTrackedUnboundedOnScreenPoint:(CGPoint)a3 boundPoint:(BOOL)a4 error:(id)a5;
- (void)_storeCalibrationValuesToDefaults;
- (void)_tearDownDebugOverlay;
- (void)_updateAccelerationFactorForPointerMovementMapper;
- (void)_updateDebugOverlay;
- (void)_updateForBacklightState:(int64_t)a3;
- (void)_updateMovementThresholdforPointerMovementMapper;
- (void)axmtUtilities_interfaceOrientationChanged:(int64_t)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)faceKitFaceTracker:(id)a3 updatedResult:(id)a4;
- (void)recalibrateFace;
- (void)setDebugOverlayEnabled:(BOOL)a3;
- (void)setDebugOverlayRootView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressionConfiguration:(id)a3;
- (void)setInput:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)setTrackingType:(unint64_t)a3;
- (void)set_calibratedPitch:(id)a3;
- (void)set_calibratedYaw:(id)a3;
- (void)set_controllerQueue:(id)a3;
- (void)set_error:(id)a3;
- (void)set_faceKitFaceTracker:(id)a3;
- (void)set_hasFace:(BOOL)a3;
- (void)set_needsRecalibration:(BOOL)a3;
- (void)set_physicalDisplaySizeMM:(CGSize)a3;
- (void)set_pointerMovementMapper:(id)a3;
- (void)set_previousExpressions:(id)a3;
- (void)set_rootView:(id)a3;
- (void)set_screenLookAtPoints:(id)a3;
- (void)set_trackedOnScreenPoint:(CGPoint)a3;
- (void)set_trackingAreaPointMapper:(id)a3;
- (void)set_velocityBasedPointMapper:(id)a3;
- (void)set_videoCapturer:(id)a3;
- (void)set_videoFileReader:(id)a3;
- (void)set_videoPreviewLayer:(id)a3;
- (void)set_visionKitEyeTracker:(id)a3;
- (void)startTracking;
- (void)stopTracking;
- (void)updateTrackedOnScreenPoint:(CGPoint)a3;
- (void)velocityBasedPointMapper:(id)a3 updatedPoint:(CGPoint)a4;
- (void)videoCapturer:(id)a3 didCaptureBufferResult:(id)a4;
- (void)videoCapturer:(id)a3 didCaptureTrackedFacesMetadataResult:(id)a4;
- (void)videoCapturer:(id)a3 didUpdateFieldOfView:(float)a4;
- (void)videoCapturer:(id)a3 didUpdateVideoResolution:(CGSize)a4;
- (void)videoCapturer:(id)a3 wasInterruptedWithError:(id)a4;
- (void)videoCapturerDidDropFrame:(id)a3;
- (void)videoCapturerReceivedNoMetadata:(id)a3;
- (void)videoFileReader:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4 withMetadata:(id)a5;
- (void)videoFileReaderDidDropFrame:(id)a3;
- (void)visionKitEyeTracker:(id)a3 detectedGaze:(CGPoint)a4 withNonCriticalError:(id)a5;
- (void)visionKitEyeTrackerLostFace:(id)a3 error:(id)a4;
@end

@implementation AXMTCameraBasedLookAtPointTracker

- (AXMTCameraBasedLookAtPointTracker)initWithInput:(id)a3 trackingType:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 isCamera] & 1) != 0 || objc_msgSend(v6, "isVideoFile"))
  {
    v23.receiver = self;
    v23.super_class = (Class)AXMTCameraBasedLookAtPointTracker;
    v7 = [(AXMTCameraBasedLookAtPointTracker *)&v23 init];
    if (!v7)
    {
LABEL_11:
      self = v7;
      v13 = self;
      goto LABEL_12;
    }
    v8 = (AXSSMotionTrackingInput *)[v6 copy];
    input = v7->_input;
    v7->_input = v8;

    v7->_trackingType = a4;
    if ([v6 isCamera])
    {
      v10 = [[AXMTVideoCapturer alloc] initWithInput:v6];
      p_videoCapturer = (id *)&v7->__videoCapturer;
      videoCapturer = v7->__videoCapturer;
      v7->__videoCapturer = v10;

      [(AXMTVideoCapturer *)v7->__videoCapturer setPixelFormatType:875704438];
    }
    else
    {
      if (![v6 isVideoFile])
      {
LABEL_10:
        [(AXMTCameraBasedLookAtPointTracker *)v7 _initializeFaceKitFaceTrackerWithInput:v6];
        dispatch_queue_t v16 = dispatch_queue_create("com.apple.accessibility.AXMTCameraBasedLookAtPointTracker.queue", 0);
        controllerQueue = v7->__controllerQueue;
        v7->__controllerQueue = (OS_dispatch_queue *)v16;

        v7->_motionTrackingMode = AXSSMotionTrackingDefaultMode;
        *(void *)&v7->_sensitivity = AXSSMotionTrackingDefaultSensitivity;
        *(void *)&v7->_joystickModeMovementThreshold = AXSSMotionTrackingDefaultJoystickModeMovementThreshold;
        uint64_t v18 = +[AXSSMotionTrackingExpressionConfiguration defaultExpressionConfiguration];
        expressionConfiguration = v7->_expressionConfiguration;
        v7->_expressionConfiguration = (AXSSMotionTrackingExpressionConfiguration *)v18;

        v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        screenLookAtPoints = v7->__screenLookAtPoints;
        v7->__screenLookAtPoints = v20;

        goto LABEL_11;
      }
      v14 = [[AXMTVideoFileReader alloc] initWithInput:v6];
      p_videoCapturer = (id *)&v7->__videoFileReader;
      videoFileReader = v7->__videoFileReader;
      v7->__videoFileReader = v14;
    }
    [*p_videoCapturer setDelegate:v7];
    goto LABEL_10;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (void)_initializeFaceKitFaceTrackerWithInput:(id)a3
{
  id v4 = a3;
  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze])
  {
    v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTCameraBasedLookAtPointTracker: Using On Device Eye Tracking with AVCaptureMetadataOutput for iOS!", buf, 2u);
    }

    id v6 = objc_alloc_init(AXMTVisionKitEyeTracker);
    [(AXMTCameraBasedLookAtPointTracker *)self set_visionKitEyeTracker:v6];

    v7 = [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
LABEL_9:
    v10 = v7;
    [v7 setDelegate:self];

    goto LABEL_10;
  }
  if ([v4 isCamera])
  {
    v8 = AXSSLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AXMTCameraBasedLookAtPointTracker: Using FaceTracking with AVCaptureMetadataOutput for iOS!", v15, 2u);
    }

    v9 = [[AXMTFaceKitFaceTracker alloc] initWithFaceKitPipeline:0];
    [(AXMTCameraBasedLookAtPointTracker *)self set_faceKitFaceTracker:v9];

    v7 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
    goto LABEL_9;
  }
  if ([v4 isVideoFile])
  {
    v11 = AXSSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "AXMTCameraBasedLookAtPointTracker: Using FaceKit pipline since input is a video file!", v14, 2u);
    }

    v12 = [[AXMTFaceKitFaceTracker alloc] initWithFaceKitPipeline:1];
    faceKitFaceTracker = self->__faceKitFaceTracker;
    self->__faceKitFaceTracker = v12;

    [(AXMTFaceKitFaceTracker *)self->__faceKitFaceTracker setDelegate:self];
  }
LABEL_10:
}

- (void)setDebugOverlayEnabled:(BOOL)a3
{
  if (self->_debugOverlayEnabled != a3)
  {
    self->_debugOverlayEnabled = a3;
    [(AXMTCameraBasedLookAtPointTracker *)self _updateDebugOverlay];
  }
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  if (self->_motionTrackingMode != a3)
  {
    self->_motionTrackingMode = a3;
    id v4 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
    [v4 reset];

    [(AXMTCameraBasedLookAtPointTracker *)self set_velocityBasedPointMapper:0];
    [(AXMTCameraBasedLookAtPointTracker *)self _clearVideoPreviewLayer];
  }
  id v5 = +[NSMutableArray array];
  [(AXMTCameraBasedLookAtPointTracker *)self set_screenLookAtPoints:v5];
}

- (void)_updateAccelerationFactorForPointerMovementMapper
{
  [(AXMTCameraBasedLookAtPointTracker *)self sensitivity];
  double v4 = (2.0 - 1.0) * v3 + 1.0;
  id v5 = [(AXMTCameraBasedLookAtPointTracker *)self _pointerMovementMapper];
  [v5 setAccelerationFactor:v4];
}

- (void)_updateMovementThresholdforPointerMovementMapper
{
  double v3 = [(AXMTCameraBasedLookAtPointTracker *)self _pointerMovementMapper];

  if (v3)
  {
    [(AXMTCameraBasedLookAtPointTracker *)self joystickModeMovementThreshold];
    double v5 = v4;
    id v6 = [(AXMTCameraBasedLookAtPointTracker *)self _pointerMovementMapper];
    [v6 setNormalizedMovementThreshold:v5];
  }
}

- (void)setSensitivity:(double)a3
{
  if (vabdd_f64(self->_sensitivity, a3) > 2.22044605e-16)
  {
    self->_sensitivity = a3;
    double v5 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];

    if (v5)
    {
      id v6 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
      [v6 setSensitivity:a3];
    }
    [(AXMTCameraBasedLookAtPointTracker *)self _updateAccelerationFactorForPointerMovementMapper];
  }
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  if (vabdd_f64(self->_joystickModeMovementThreshold, a3) > 2.22044605e-16)
  {
    self->_joystickModeMovementThreshold = a3;
    [(AXMTCameraBasedLookAtPointTracker *)self _updateMovementThresholdforPointerMovementMapper];
  }
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  if (([(AXSSMotionTrackingInput *)self->_input isEqual:v4] & 1) != 0
    || ([v4 isCamera] & 1) == 0 && !objc_msgSend(v4, "isVideoFile"))
  {
    goto LABEL_30;
  }
  double v5 = (AXSSMotionTrackingInput *)[v4 copy];
  input = self->_input;
  self->_input = v5;

  [(AXMTCameraBasedLookAtPointTracker *)self _loadCalibrationValuesFromDefaults];
  unsigned int v7 = [(AXMTCameraBasedLookAtPointTracker *)self _isStarted];
  unsigned int v8 = [(AXMTCameraBasedLookAtPointTracker *)self debugOverlayEnabled];
  if ([v4 isCamera])
  {
    v9 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([v4 isVideoFile])
  {
    v11 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if (v10 || v12)
  {
    [(AXMTCameraBasedLookAtPointTracker *)self set_hasFace:0];
    [(AXMTCameraBasedLookAtPointTracker *)self set_error:0];
    [(AXMTCameraBasedLookAtPointTracker *)self set_previousExpressions:0];
    [(id)objc_opt_class() _defaultOnScreenPoint];
    -[AXMTCameraBasedLookAtPointTracker set_trackedOnScreenPoint:](self, "set_trackedOnScreenPoint:");
    [(AXMTCameraBasedLookAtPointTracker *)self set_faceKitFaceTracker:0];
    [(AXMTCameraBasedLookAtPointTracker *)self set_visionKitEyeTracker:0];
    [(AXMTCameraBasedLookAtPointTracker *)self _initializeFaceKitFaceTrackerWithInput:v4];
    if (v10)
    {
      v13 = AXSSLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10001A438(v13, v14, v15, v16, v17, v18, v19, v20);
      }

      v21 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
      [v21 stop];

      v22 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
      [v22 setDelegate:0];

      [(AXMTCameraBasedLookAtPointTracker *)self set_videoFileReader:0];
      objc_super v23 = [[AXMTVideoCapturer alloc] initWithInput:v4];
      [(AXMTCameraBasedLookAtPointTracker *)self set_videoCapturer:v23];

      v24 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
      [v24 setPixelFormatType:875704438];

      v25 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
      [v25 setDelegate:self];

      if (!v7) {
        goto LABEL_28;
      }
      v26 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
    }
    else
    {
      if (!v12) {
        goto LABEL_28;
      }
      v29 = AXSSLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_10001A4B0(v29, v30, v31, v32, v33, v34, v35, v36);
      }

      v37 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
      [v37 stop];

      v38 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
      [v38 setDelegate:0];

      [(AXMTCameraBasedLookAtPointTracker *)self set_videoCapturer:0];
      v39 = [[AXMTVideoFileReader alloc] initWithInput:v4];
      [(AXMTCameraBasedLookAtPointTracker *)self set_videoFileReader:v39];

      v40 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
      [v40 setDelegate:self];

      if (!v7) {
        goto LABEL_28;
      }
      v26 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
    }
    v41 = v26;
    [v26 start];
  }
  else
  {
    v27 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];

    if (v27)
    {
      v28 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
    }
    else
    {
      v42 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];

      if (!v42) {
        goto LABEL_28;
      }
      v28 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
    }
    v41 = v28;
    [v28 setInput:v4];
  }

LABEL_28:
  if (v8)
  {
    v43 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
    [v43 removeFromSuperlayer];

    [(AXMTCameraBasedLookAtPointTracker *)self set_videoPreviewLayer:0];
    [(AXMTCameraBasedLookAtPointTracker *)self _updateDebugOverlay];
  }
LABEL_30:
}

- (void)startTracking
{
  if (![(AXMTCameraBasedLookAtPointTracker *)self _isStarted])
  {
    double v3 = +[AXMTUtilities sharedInstance];
    [v3 registerListener:self needsPhysicalOrientationEvents:0];

    id v4 = +[BLSBacklight sharedBacklight];
    [v4 addObserver:self];

    double v5 = +[BLSBacklight sharedBacklight];
    -[AXMTCameraBasedLookAtPointTracker _updateForBacklightState:](self, "_updateForBacklightState:", [v5 backlightState]);

    [(AXMTCameraBasedLookAtPointTracker *)self set_hasFace:0];
    [(AXMTCameraBasedLookAtPointTracker *)self set_error:0];
    id v6 = +[AXMTUtilities sharedInstance];
    [v6 screenBoundsAccountingForInterfaceOrientation];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = -[AXMTRelativePointerMovementMapper initWithScreenBounds:]([AXMTRelativePointerMovementMapper alloc], "initWithScreenBounds:", v8, v10, v12, v14);
    [(AXMTCameraBasedLookAtPointTracker *)self set_pointerMovementMapper:v15];

    [(AXMTCameraBasedLookAtPointTracker *)self _updateMovementThresholdforPointerMovementMapper];
    [(id)objc_opt_class() _defaultOnScreenPoint];
    -[AXMTCameraBasedLookAtPointTracker set_trackedOnScreenPoint:](self, "set_trackedOnScreenPoint:");
    [(AXMTCameraBasedLookAtPointTracker *)self _updateAccelerationFactorForPointerMovementMapper];
    uint64_t v16 = AXSSLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10001A528(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v24 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];

    if (v24)
    {
      v25 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
    }
    else
    {
      v26 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];

      if (!v26)
      {
LABEL_9:
        [(AXMTCameraBasedLookAtPointTracker *)self _updateDebugOverlay];
        [(AXMTCameraBasedLookAtPointTracker *)self _loadCalibrationValuesFromDefaults];
        return;
      }
      v25 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
    }
    v27 = v25;
    [v25 start];

    goto LABEL_9;
  }
}

- (void)stopTracking
{
  if (![(AXMTCameraBasedLookAtPointTracker *)self _isStarted]) {
    return;
  }
  [(AXMTCameraBasedLookAtPointTracker *)self set_hasFace:0];
  [(AXMTCameraBasedLookAtPointTracker *)self set_error:0];
  [(AXMTCameraBasedLookAtPointTracker *)self set_pointerMovementMapper:0];
  double v3 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
  [v3 reset];

  [(AXMTCameraBasedLookAtPointTracker *)self set_velocityBasedPointMapper:0];
  id v4 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];

  if (v4)
  {
    double v5 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
LABEL_7:
    double v7 = v5;
    [v5 stop];

    goto LABEL_8;
  }
  id v6 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];

  if (v6)
  {
    double v5 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
    goto LABEL_7;
  }
LABEL_8:
  [(AXMTCameraBasedLookAtPointTracker *)self _tearDownDebugOverlay];
  double v8 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
  [v8 setDelegate:0];

  [(AXMTCameraBasedLookAtPointTracker *)self set_faceKitFaceTracker:0];
  double v9 = [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
  [v9 setDelegate:0];

  [(AXMTCameraBasedLookAtPointTracker *)self set_visionKitEyeTracker:0];
  [(AXMTCameraBasedLookAtPointTracker *)self set_screenLookAtPoints:0];
  double v10 = +[BLSBacklight sharedBacklight];
  [v10 removeObserver:self];

  id v11 = +[AXMTUtilities sharedInstance];
  [v11 unregisterListener:self];
}

- (void)recalibrateFace
{
  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze])
  {
    double v3 = [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
    [v3 recalibrateFace];
  }

  [(AXMTCameraBasedLookAtPointTracker *)self set_needsRecalibration:1];
}

- (void)videoCapturer:(id)a3 didCaptureBufferResult:(id)a4
{
  id v5 = a4;
  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze])
  {
    id v9 = [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
    id v6 = [v5 buffer];
    double v7 = [v5 metadataObjects];

    [v9 processSampleBuffer:v6 metadata:v7];
  }
  else
  {
    id v9 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
    id v8 = [v5 buffer];
    double v7 = [v5 metadataObjects];

    [v9 processVideoFrame:v8 metadata:v7];
  }
}

- (void)videoCapturer:(id)a3 didCaptureTrackedFacesMetadataResult:(id)a4
{
  id v5 = a4;
  id v7 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
  id v6 = [v5 metadataObjects];

  [v7 processTrackedFacesMetadata:v6];
}

- (void)videoCapturerDidDropFrame:(id)a3
{
  double v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001A5A0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)videoCapturerReceivedNoMetadata:(id)a3
{
  double v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001A5D8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)videoCapturer:(id)a3 wasInterruptedWithError:(id)a4
{
  id v5 = a4;
  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze]) {
    [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
  }
  else {
  id v6 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
  }
  [v6 failedToTrackFaceWithError:v5];
}

- (void)videoCapturer:(id)a3 didUpdateFieldOfView:(float)a4
{
  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze])
  {
    id v7 = [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
    *(float *)&double v6 = a4;
    [v7 didUpdateFieldOfView:v6];
  }
}

- (void)videoCapturer:(id)a3 didUpdateVideoResolution:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
  objc_msgSend(v6, "didUpdateVideoResolution:", width, height);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
}

- (void)_updateForBacklightState:(int64_t)a3
{
  id v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AXMTCameraBasedLookAtPointTracker _updateForBacklightState:]";
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: backlight state was updated to: %ld", (uint8_t *)&v7, 0x16u);
  }

  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze])
  {
    id v6 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
    [v6 reconfigureCaptureDeviceForBacklightOff:a3 == 0];
  }
}

- (BOOL)_trackingTypeSupportsOnDeviceGaze
{
  return (id)[(AXMTCameraBasedLookAtPointTracker *)self trackingType] == (id)3;
}

- (BOOL)_movementDetectedWithNewPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTCameraBasedLookAtPointTracker *)self _trackedOnScreenPoint];
  if (vabdd_f64(x, v6) > 2.22044605e-16) {
    return 1;
  }
  [(AXMTCameraBasedLookAtPointTracker *)self _trackedOnScreenPoint];
  return vabdd_f64(y, v8) > 2.22044605e-16;
}

- (void)_clearVideoPreviewLayer
{
  double v3 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
  [v3 renderFaceKitResult:0];

  id v4 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
  objc_msgSend(v4, "renderPointOfInterest:trackingArea:", NSZeroPoint.x, NSZeroPoint.y, NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
}

- (BOOL)_isStarted
{
  double v3 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
  if ([v3 isStarted])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];
    unsigned __int8 v4 = [v5 isStarted];
  }
  return v4;
}

- (void)_loadCalibrationValuesFromDefaults
{
  double v3 = +[NSUserDefaults motionTrackingUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"recalibratedValuesDict"];

  if (v4)
  {
    id v5 = [(AXMTCameraBasedLookAtPointTracker *)self input];
    double v6 = [v5 uniqueIdentifier];
    int v7 = [v4 objectForKeyedSubscript:v6];

    if (v7)
    {
      double v8 = [v7 objectForKeyedSubscript:@"recalibratedYaw"];
      __int16 v9 = [v7 objectForKeyedSubscript:@"recalibratedPitch"];
      if (v8)
      {
        int64_t v10 = AXSSLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_10001A698(v8);
        }

        [(AXMTCameraBasedLookAtPointTracker *)self set_calibratedYaw:v8];
      }
      if (v9)
      {
        id v11 = AXSSLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10001A610(v9);
        }

        [(AXMTCameraBasedLookAtPointTracker *)self set_calibratedPitch:v9];
      }
    }
  }
}

- (void)_storeCalibrationValuesToDefaults
{
  double v3 = [(AXMTCameraBasedLookAtPointTracker *)self input];
  unsigned __int8 v4 = [v3 uniqueIdentifier];

  if (v4)
  {
    id v5 = +[NSMutableDictionary dictionary];
    double v6 = +[NSUserDefaults motionTrackingUserDefaults];
    int v7 = [v6 objectForKey:@"recalibratedValuesDict"];

    if (v7) {
      [v5 setDictionary:v7];
    }
    double v8 = +[NSMutableDictionary dictionary];
    __int16 v9 = [(AXMTCameraBasedLookAtPointTracker *)self input];
    int64_t v10 = [v9 uniqueIdentifier];
    id v11 = [v7 objectForKey:v10];

    if (v11) {
      [v8 setDictionary:v11];
    }
    double v12 = AXSSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10001A7A4(self, v12);
    }

    double v13 = [(AXMTCameraBasedLookAtPointTracker *)self _calibratedYaw];
    [v8 setObject:v13 forKeyedSubscript:@"recalibratedYaw"];

    double v14 = [(AXMTCameraBasedLookAtPointTracker *)self _calibratedPitch];
    [v8 setObject:v14 forKeyedSubscript:@"recalibratedPitch"];

    uint64_t v15 = [(AXMTCameraBasedLookAtPointTracker *)self input];
    uint64_t v16 = [v15 uniqueIdentifier];
    [v5 setObject:v8 forKeyedSubscript:v16];

    uint64_t v17 = +[NSUserDefaults motionTrackingUserDefaults];
    [v17 setObject:v5 forKey:@"recalibratedValuesDict"];
  }
  else
  {
    id v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001A720(v5);
    }
  }
}

- (void)axmtUtilities_interfaceOrientationChanged:(int64_t)a3
{
  unsigned __int8 v4 = +[AXMTUtilities sharedInstance];
  [v4 screenBoundsAccountingForInterfaceOrientation];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
  objc_msgSend(v13, "setBounds:", v6, v8, v10, v12);

  id v14 = [(AXMTCameraBasedLookAtPointTracker *)self _pointerMovementMapper];
  objc_msgSend(v14, "setScreenBounds:", v6, v8, v10, v12);
}

- (void)faceKitFaceTracker:(id)a3 updatedResult:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017D98;
  v6[3] = &unk_100048928;
  id v7 = a4;
  double v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)visionKitEyeTracker:(id)a3 detectedGaze:(CGPoint)a4 withNonCriticalError:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  id v10 = a5;
  [(AXMTCameraBasedLookAtPointTracker *)self set_hasFace:1];
  [(AXMTCameraBasedLookAtPointTracker *)self set_error:0];
  objc_initWeak(&location, self);
  double v11 = [(AXMTCameraBasedLookAtPointTracker *)self _controllerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001850C;
  block[3] = &unk_100048E70;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&x;
  v15[2] = *(id *)&y;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)visionKitEyeTrackerLostFace:(id)a3 error:(id)a4
{
  id v5 = a4;
  if ([(AXMTCameraBasedLookAtPointTracker *)self _hasFace])
  {
    double v6 = AXSSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10001A8FC();
    }

    [(AXMTCameraBasedLookAtPointTracker *)self set_hasFace:0];
    goto LABEL_6;
  }
  id v7 = [(AXMTCameraBasedLookAtPointTracker *)self _error];
  unsigned __int8 v8 = [v7 isEqual:v5];

  if ((v8 & 1) == 0)
  {
LABEL_6:
    [(AXMTCameraBasedLookAtPointTracker *)self set_error:v5];
    id v9 = [(AXMTCameraBasedLookAtPointTracker *)self delegate];
    [v9 lookAtPointTrackerLostFace:self error:v5];
  }
  [(AXMTCameraBasedLookAtPointTracker *)self _clearVideoPreviewLayer];
}

- (id)_handleDetectedFaceWithProjectedPoint:(double)a3 pose:(double)a4 poseTranslation:(double)a5
{
  id result = [a1 motionTrackingMode];
  if (result == (id)1)
  {
    return objc_msgSend(a1, "_handleDetectedFaceJoystickModeWithPose:poseTranslation:", a4, a5, a6, a7, a8);
  }
  else if (result != (id)3)
  {
    if (result == (id)2)
    {
      objc_msgSend(a1, "_iOSConvertProjectedPointToScreenCoordinates:useSensitivity:", 0, a2, a3);
      return objc_msgSend(a1, "_iOSComputeAccelerationModeForPoint:", v12, v13, v14, v15, v16);
    }
    else
    {
      objc_msgSend(a1, "_iOSConvertProjectedPointToScreenCoordinates:useSensitivity:", 1, a2, a3);
      return objc_msgSend(a1, "_iOSComputeAbsoluteModeForPoint:", v17, v18, v19, v20, v21);
    }
  }
  return result;
}

- (void)_handleDetectedFaceHIDModeWithFaceBounds:(CGRect)a3 noseCenter:(CGPoint)a4 imageSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v8 = a4.x / a5.width;
  CGFloat v9 = a4.y / a5.height;
  id v10 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
  objc_msgSend(v10, "renderPointOfInterest:trackingArea:", 1.0 - v8, v9, NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);

  objc_initWeak(&location, self);
  double v11 = [(AXMTCameraBasedLookAtPointTracker *)self _controllerQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018874;
  v12[3] = &unk_100048E98;
  objc_copyWeak(v13, &location);
  v13[1] = *(id *)&v8;
  v13[2] = *(id *)&v9;
  v13[3] = *(id *)&width;
  v13[4] = *(id *)&height;
  dispatch_async(v11, v12);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_handleDetectedFaceJoystickModeWithPose:(double)a3 poseTranslation:(float32x4_t)a4
{
  float v5 = AXMTYawUsingPose(a2.n128_f64[0], a3, a4.f32[0]);
  float v6 = AXMTPitchUsingPose(a2.n128_f64[0], a3, a4);
  if ([a1 _needsRecalibration])
  {
    *(float *)&double v7 = v5;
    CGFloat v8 = +[NSNumber numberWithFloat:v7];
    objc_msgSend(a1, "set_calibratedYaw:", v8);

    *(float *)&double v9 = v6;
    id v10 = +[NSNumber numberWithFloat:v9];
    objc_msgSend(a1, "set_calibratedPitch:", v10);

    [a1 _storeCalibrationValuesToDefaults];
    objc_msgSend(a1, "set_needsRecalibration:", 0);
  }
  double v11 = objc_msgSend(a1, "_calibratedYaw", *(_OWORD *)&a2);

  float v12 = 0.0;
  float v13 = 0.0;
  if (v11)
  {
    double v14 = [a1 _calibratedYaw];
    [v14 floatValue];
    float v13 = v15;
  }
  double v16 = [a1 _calibratedPitch];

  if (v16)
  {
    double v17 = [a1 _calibratedPitch];
    [v17 floatValue];
    float v12 = v18;
  }
  double v19 = [a1 _calibratedYaw];
  if (!v19)
  {
    [a1 _calibratedPitch];
  }
  double v20 = +[AXMTUtilities sharedInstance];
  id v21 = [v20 currentInterfaceOrientation];

  float v22 = v5 - v13;
  float v23 = v6 - v12;
  switch((unint64_t)v21)
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
    case 6uLL:
      double v24 = v23;
      float v22 = -v22;
      goto LABEL_11;
    case 2uLL:
      double v24 = (float)-v23;
      goto LABEL_11;
    case 3uLL:
      double v24 = v22;
      double v25 = v23;
      break;
    case 4uLL:
      double v24 = (float)-v22;
      float v22 = -v23;
LABEL_11:
      double v25 = v22;
      break;
    default:
      double v25 = 0.0;
      double v24 = 0.0;
      break;
  }
  v26 = +[AXMTUtilities sharedInstance];
  [v26 screenBoundsAccountingForInterfaceOrientation];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  uint64_t v35 = [a1 _pointerMovementMapper];

  if (!v35)
  {
    uint64_t v36 = -[AXMTRelativePointerMovementMapper initWithScreenBounds:]([AXMTRelativePointerMovementMapper alloc], "initWithScreenBounds:", v28, v30, v32, v34);
    objc_msgSend(a1, "set_pointerMovementMapper:", v36);

    [a1 _updateAccelerationFactorForPointerMovementMapper];
    [a1 _updateMovementThresholdforPointerMovementMapper];
  }
  v37 = [a1 _screenLookAtPoints];
  id v38 = [v37 count];

  if (v38)
  {
    v39 = [a1 _pointerMovementMapper];
    v40 = objc_msgSend(v39, "processPointInNormalizedTrackingSpace:", v24, v25 + 0.05);

    v41 = [a1 _screenLookAtPoints];
    v42 = [v41 lastObject];
    [v42 pointValue];
    double v44 = v43;
    double v46 = v45;

    [v40 delta];
    double v48 = fmin(fmax(v32 * -0.0055844577 + 9.311967, 3.593), 7.0) * v47;
    [v40 delta];
    double v50 = AXMTConstrainPointWithinBounds(v44 + v48, v46 + fmin(fmax(v34 * 0.0108096 + -8.68544, 1.0), 2.384) * v49, v28, v30, v32);
    double v52 = v51;
    *(double *)v62 = v50;
    *(double *)&v62[1] = v51;
    v53 = +[NSValue valueWithBytes:v62 objCType:"{CGPoint=dd}"];
    v54 = +[NSMutableArray arrayWithObject:v53];
    objc_msgSend(a1, "set_screenLookAtPoints:", v54);
  }
  else
  {
    double v50 = v32 * 0.5;
    double v52 = v34 * 0.5;
    *(double *)v63 = v50;
    *(double *)&v63[1] = v52;
    v40 = +[NSValue valueWithBytes:v63 objCType:"{CGPoint=dd}"];
    v53 = +[NSMutableArray arrayWithObject:v40];
    objc_msgSend(a1, "set_screenLookAtPoints:", v53);
  }

  objc_initWeak(&location, a1);
  v55 = [a1 _controllerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018DE4;
  block[3] = &unk_100048EC0;
  objc_copyWeak(v60, &location);
  v60[1] = *(id *)&v50;
  v60[2] = *(id *)&v52;
  dispatch_async(v55, block);

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);
}

- (void)_handleDetectedFaceAbsoluteModeWithFaceBounds:(double)a3 pose:(double)a4
{
  id v10 = +[AXMTUtilities sharedInstance];
  [v10 screenBoundsAccountingForInterfaceOrientation];
  uint64_t v52 = v12;
  uint64_t v54 = v11;
  double v14 = v13;
  double v16 = v15;

  uint64_t v69 = 0;
  int v68 = 0;
  +[VNFaceObservation computeYawPitchRollFromPoseMatrix:outputYaw:outputPitch:outputRoll:](VNFaceObservation, "computeYawPitchRollFromPoseMatrix:outputYaw:outputPitch:outputRoll:", (char *)&v69 + 4, &v69, &v68, a6, a7, a8, a9);
  double v17 = +[AXMTUtilities sharedInstance];
  unint64_t v18 = (unint64_t)[v17 currentInterfaceOrientation];

  if (v18 <= 6)
  {
    if (((1 << v18) & 0x67) != 0) {
      *(float *)&uint64_t v69 = -*(float *)&v69;
    }
    else {
      *((float *)&v69 + 1) = -*((float *)&v69 + 1);
    }
  }
  float64x2_t v19 = vcvtq_f64_f32(vmul_f32((float32x2_t)__PAIR64__(v69, HIDWORD(v69)), (float32x2_t)0xC1A0000040000000));
  __asm { FMOV            V1.2D, #1.0 }
  float64x2_t v25 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v19, _Q1), (int8x16_t)_Q1, (int8x16_t)v19);
  __asm { FMOV            V1.2D, #-1.0 }
  float64x2_t v64 = vmaxnmq_f64(v25, _Q1);
  double v27 = objc_msgSend(a1, "_pointerMovementMapper", v52, v54);
  double v28 = [v27 processPointInNormalizedTrackingSpace:*(_OWORD *)&v64];

  [a1 _trackedOnScreenPoint];
  double v30 = v29;
  double v32 = v31;
  [v28 delta];
  double v34 = v30 + v33;
  [v28 delta];
  double v36 = v32 + v35;
  v37 = [a1 _videoPreviewLayer];
  [v37 bounds];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;

  v70.origin.CGFloat x = v39;
  v70.origin.CGFloat y = v41;
  v70.size.CGFloat width = v43;
  v70.size.CGFloat height = v45;
  if (!CGRectIsEmpty(v70))
  {
    double v46 = AXMTConstrainPointWithinBounds(v34, v36, v55, v53, v14);
    double v48 = v47 / v16;
    double v49 = 1.0 - v46 / v14;
    double v50 = [a1 _videoPreviewLayer];
    objc_msgSend(v50, "renderPointOfInterest:trackingArea:", v49, v48, a2, a3, a4, a5);
  }
  objc_initWeak(&location, a1);
  double v51 = [a1 _controllerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019104;
  block[3] = &unk_100048EC0;
  objc_copyWeak(v66, &location);
  v66[1] = *(id *)&v34;
  v66[2] = *(id *)&v36;
  dispatch_async(v51, block);

  objc_destroyWeak(v66);
  objc_destroyWeak(&location);
}

- (CGPoint)_iOSConvertProjectedPointToScreenCoordinates:(CGPoint)a3 useSensitivity:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  CGFloat v8 = +[AXMTUtilities sharedInstance];
  [v8 screenBoundsAccountingForInterfaceOrientation];
  double v10 = v9;
  double v12 = v11;

  double v13 = +[AXMTUtilities sharedInstance];
  double v14 = (char *)[v13 currentInterfaceOrientation];

  double v15 = v10 * 1.15358884 + -199.61;
  if ((unint64_t)(v14 - 3) >= 2) {
    double v15 = v10 * 1.0676812 + -9.52;
  }
  double v16 = v15 + x * (v10 * 0.00061318 + -0.00385488);
  double v17 = v12 * 0.562768306 + 73.26 + y * (v12 * 0.00032351 + -0.01486606);
  if (v4)
  {
    [(AXMTCameraBasedLookAtPointTracker *)self sensitivity];
    double v19 = v18 * 2.9995 + 1.0005;
    double v16 = v10 * 0.5 + (v16 - v10 * 0.5) / (v10 * 0.5) * v19 * (v10 * 0.5);
    double v17 = v12 * 0.5 + (v17 - v12 * 0.5) / (v12 * 0.5) * v19 * (v12 * 0.5);
  }
  double v20 = v16;
  double v21 = v17;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (void)_iOSComputeAbsoluteModeForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  float v6 = [(AXMTCameraBasedLookAtPointTracker *)self _screenLookAtPoints];
  id v7 = [v6 count];

  if (v7 == (id)5)
  {
    CGFloat v8 = [(AXMTCameraBasedLookAtPointTracker *)self _screenLookAtPoints];
    [v8 removeObjectAtIndex:0];
  }
  double v9 = [(AXMTCameraBasedLookAtPointTracker *)self _screenLookAtPoints];
  *(CGFloat *)double v29 = x;
  *(CGFloat *)&v29[1] = y;
  double v10 = +[NSValue valueWithBytes:v29 objCType:"{CGPoint=dd}"];
  [v9 addObject:v10];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v11 = [(AXMTCameraBasedLookAtPointTracker *)self _screenLookAtPoints];
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) pointValue];
        double v15 = v15 + v17;
        double v14 = v14 + v18;
      }
      id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
  }
  else
  {
    double v14 = 0.0;
    double v15 = 0.0;
  }

  double v19 = [(AXMTCameraBasedLookAtPointTracker *)self _screenLookAtPoints];
  id v20 = [v19 count];

  objc_initWeak(&location, self);
  double v21 = [(AXMTCameraBasedLookAtPointTracker *)self _controllerQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001952C;
  v22[3] = &unk_100048EC0;
  objc_copyWeak(v23, &location);
  *(double *)&v23[1] = v15 / (double)(unint64_t)v20;
  *(double *)&v23[2] = v14 / (double)(unint64_t)v20;
  dispatch_async(v21, v22);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)_iOSComputeAccelerationModeForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  float v6 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];

  if (!v6)
  {
    id v7 = [AXMTVelocityBasedPointMapper alloc];
    CGFloat v8 = +[AXMTUtilities sharedInstance];
    [v8 screenBoundsAccountingForInterfaceOrientation];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(AXMTCameraBasedLookAtPointTracker *)self sensitivity];
    double v18 = -[AXMTVelocityBasedPointMapper initWithBounds:sensitivity:](v7, "initWithBounds:sensitivity:", v10, v12, v14, v16, v17);
    [(AXMTCameraBasedLookAtPointTracker *)self set_velocityBasedPointMapper:v18];

    double v19 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
    [v19 setDelegate:self];
  }
  id v20 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
  objc_msgSend(v20, "processPoint:", x, y);
}

- (void)_signalTrackedImageRelativePoint:(CGPoint)a3 inBounds:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  id v10 = [(AXMTCameraBasedLookAtPointTracker *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v9 = [(AXMTCameraBasedLookAtPointTracker *)self delegate];
    objc_msgSend(v9, "lookAtPointTracker:trackedImageRelativePoint:inBounds:", self, x, y, width, height);
  }
}

- (void)_signalTrackedUnboundedOnScreenPoint:(CGPoint)a3 boundPoint:(BOOL)a4
{
}

- (void)_signalTrackedUnboundedOnScreenPoint:(CGPoint)a3 boundPoint:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  id v19 = a5;
  if (-[AXMTCameraBasedLookAtPointTracker _movementDetectedWithNewPoint:](self, "_movementDetectedWithNewPoint:", x, y))
  {
    if (v5)
    {
      double v9 = +[AXMTUtilities sharedInstance];
      [v9 screenBoundsAccountingForInterfaceOrientation];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      double x = AXMTConstrainPointWithinBounds(x, y, v11, v13, v15);
      double y = v16;
    }
    -[AXMTCameraBasedLookAtPointTracker set_trackedOnScreenPoint:](self, "set_trackedOnScreenPoint:", x, y);
    double v17 = [(AXMTCameraBasedLookAtPointTracker *)self delegate];
    double v18 = v17;
    if (v19) {
      [v17 lookAtPointTracker:self trackedOnScreenPoint:x error:y];
    }
    else {
      objc_msgSend(v17, "lookAtPointTracker:trackedOnScreenPoint:", self, x, y);
    }
  }
}

- (void)_updateDebugOverlay
{
  if ([(AXMTCameraBasedLookAtPointTracker *)self debugOverlayEnabled])
  {
    [(AXMTCameraBasedLookAtPointTracker *)self _setUpDebugOverlay];
  }
  else
  {
    [(AXMTCameraBasedLookAtPointTracker *)self _tearDownDebugOverlay];
  }
}

- (void)_setUpDebugOverlay
{
  double v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTCameraBasedLookAtPointTracker: _setupDebugOverlay:", v30, 2u);
  }

  BOOL v4 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];

  if (!v4)
  {
    BOOL v5 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];

    if (v5)
    {
      float v6 = [AXMTVideoPreviewLayer alloc];
      id v7 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
      CGFloat v8 = [v7 captureSession];
      double v9 = [(AXMTCameraBasedLookAtPointTracker *)self _videoCapturer];
      [v9 resolution];
      double v10 = -[AXMTVideoPreviewLayer initWithAVCaptureSession:captureDeviceResolution:](v6, "initWithAVCaptureSession:captureDeviceResolution:", v8);
      [(AXMTCameraBasedLookAtPointTracker *)self set_videoPreviewLayer:v10];

      double v11 = +[AXMTUtilities sharedInstance];
      [(AXMTVideoPreviewLayer *)v11 screenBoundsAccountingForInterfaceOrientation];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      id v20 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

LABEL_8:
      goto LABEL_9;
    }
    double v21 = [(AXMTCameraBasedLookAtPointTracker *)self _videoFileReader];

    if (v21)
    {
      double v11 = [[AXMTVideoPreviewLayer alloc] initWithSampleBufferLayer];
      [(AXMTCameraBasedLookAtPointTracker *)self set_videoPreviewLayer:v11];
      goto LABEL_8;
    }
  }
LABEL_9:
  id v22 = objc_alloc((Class)UIView);
  float v23 = +[AXMTUtilities sharedInstance];
  [v23 screenBoundsAccountingForInterfaceOrientation];
  id v24 = objc_msgSend(v22, "initWithFrame:");
  [(AXMTCameraBasedLookAtPointTracker *)self set_rootView:v24];

  long long v25 = [(AXMTCameraBasedLookAtPointTracker *)self debugOverlayRootView];
  long long v26 = [(AXMTCameraBasedLookAtPointTracker *)self _rootView];
  [v25 addSubview:v26];

  long long v27 = [(AXMTCameraBasedLookAtPointTracker *)self _rootView];
  long long v28 = [v27 layer];
  double v29 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
  [v28 addSublayer:v29];
}

- (void)_tearDownDebugOverlay
{
  v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AXMTCameraBasedLookAtPointTracker: _tearDownDebugOverlay:", v3, 2u);
  }
}

+ (CGPoint)_defaultOnScreenPoint
{
  v2 = +[AXMTUtilities sharedInstance];
  [v2 screenBoundsAccountingForInterfaceOrientation];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4 + v8 * 0.5;
  double v12 = v6 + v10 * 0.5;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)updateTrackedOnScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(AXMTCameraBasedLookAtPointTracker *)self _isStarted])
  {
    [(AXMTCameraBasedLookAtPointTracker *)self _trackedOnScreenPoint];
    v32.double x = v6;
    v32.double y = v7;
    v31.double x = x;
    v31.double y = y;
    if (!NSEqualPoints(v31, v32))
    {
      double v8 = [(AXMTCameraBasedLookAtPointTracker *)self _pointerMovementMapper];

      if (v8)
      {
        double v9 = [(AXMTCameraBasedLookAtPointTracker *)self _pointerMovementMapper];
        [v9 reset];
      }
      double v10 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];

      if (v10)
      {
        double v11 = +[AXMTUtilities sharedInstance];
        [v11 screenBoundsAccountingForInterfaceOrientation];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;

        id v20 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
        [v20 bounds];
        double v22 = (x - v13) / v17 * v21;
        float v23 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
        [v23 bounds];
        double v25 = (y - v15) / v19 * v24;

        long long v26 = [(AXMTCameraBasedLookAtPointTracker *)self _velocityBasedPointMapper];
        objc_msgSend(v26, "resetToPoint:", v22, v25);
      }
      objc_initWeak(&location, self);
      long long v27 = [(AXMTCameraBasedLookAtPointTracker *)self _controllerQueue];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100019E18;
      v28[3] = &unk_100048EC0;
      objc_copyWeak(v29, &location);
      v29[1] = *(id *)&x;
      void v29[2] = *(id *)&y;
      dispatch_async(v27, v28);

      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
    }
  }
}

- (void)velocityBasedPointMapper:(id)a3 updatedPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  objc_initWeak(&location, self);
  double v8 = [(AXMTCameraBasedLookAtPointTracker *)self _controllerQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019F84;
  v9[3] = &unk_100048EC0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&x;
  v10[2] = *(id *)&y;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)videoFileReaderDidDropFrame:(id)a3
{
  double v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001A5A0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)videoFileReader:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4 withMetadata:(id)a5
{
  id v7 = a5;
  if ([(AXMTCameraBasedLookAtPointTracker *)self _trackingTypeSupportsOnDeviceGaze])
  {
    id v9 = [(AXMTCameraBasedLookAtPointTracker *)self _visionKitEyeTracker];
    [v9 processSampleBuffer:a4 metadata:v7];
  }
  else
  {
    uint64_t v8 = [(AXMTCameraBasedLookAtPointTracker *)self _faceKitFaceTracker];
    [v8 processVideoFrame:a4 metadata:v7];

    id v9 = [(AXMTCameraBasedLookAtPointTracker *)self _videoPreviewLayer];
    [v9 drawSample:a4];
  }
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (AXSSMotionTrackingInput)input
{
  return self->_input;
}

- (unint64_t)trackingType
{
  return self->_trackingType;
}

- (void)setTrackingType:(unint64_t)a3
{
  self->_trackingType = a3;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (AXMTLookAtPointTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTLookAtPointTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)debugOverlayEnabled
{
  return self->_debugOverlayEnabled;
}

- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration
{
  return self->_expressionConfiguration;
}

- (void)setExpressionConfiguration:(id)a3
{
}

- (UIView)debugOverlayRootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugOverlayRootView);

  return (UIView *)WeakRetained;
}

- (void)setDebugOverlayRootView:(id)a3
{
}

- (AXMTVideoPreviewLayer)_videoPreviewLayer
{
  return self->__videoPreviewLayer;
}

- (void)set_videoPreviewLayer:(id)a3
{
}

- (AXMTVideoCapturer)_videoCapturer
{
  return self->__videoCapturer;
}

- (void)set_videoCapturer:(id)a3
{
}

- (AXMTVideoFileReader)_videoFileReader
{
  return self->__videoFileReader;
}

- (void)set_videoFileReader:(id)a3
{
}

- (AXMTFaceKitFaceTracker)_faceKitFaceTracker
{
  return self->__faceKitFaceTracker;
}

- (void)set_faceKitFaceTracker:(id)a3
{
}

- (AXMTVisionKitEyeTracker)_visionKitEyeTracker
{
  return self->__visionKitEyeTracker;
}

- (void)set_visionKitEyeTracker:(id)a3
{
}

- (AXMTTrackingAreaPointMapper)_trackingAreaPointMapper
{
  return self->__trackingAreaPointMapper;
}

- (void)set_trackingAreaPointMapper:(id)a3
{
}

- (AXMTRelativePointerMovementMapper)_pointerMovementMapper
{
  return self->__pointerMovementMapper;
}

- (void)set_pointerMovementMapper:(id)a3
{
}

- (AXMTVelocityBasedPointMapper)_velocityBasedPointMapper
{
  return self->__velocityBasedPointMapper;
}

- (void)set_velocityBasedPointMapper:(id)a3
{
}

- (CGPoint)_trackedOnScreenPoint
{
  double x = self->__trackedOnScreenPoint.x;
  double y = self->__trackedOnScreenPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_trackedOnScreenPoint:(CGPoint)a3
{
  self->__trackedOnScreenPoint = a3;
}

- (OS_dispatch_queue)_controllerQueue
{
  return self->__controllerQueue;
}

- (void)set_controllerQueue:(id)a3
{
}

- (BOOL)_needsRecalibration
{
  return self->__needsRecalibration;
}

- (void)set_needsRecalibration:(BOOL)a3
{
  self->__needsRecalibration = a3;
}

- (BOOL)_hasFace
{
  return self->__hasFace;
}

- (void)set_hasFace:(BOOL)a3
{
  self->__hasFace = a3;
}

- (NSError)_error
{
  return self->__error;
}

- (void)set_error:(id)a3
{
}

- (NSSet)_previousExpressions
{
  return self->__previousExpressions;
}

- (void)set_previousExpressions:(id)a3
{
}

- (CGSize)_physicalDisplaySizeMM
{
  double width = self->__physicalDisplaySizeMM.width;
  double height = self->__physicalDisplaySizeMM.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_physicalDisplaySizeMM:(CGSize)a3
{
  self->__physicalDisplaySizeMM = a3;
}

- (NSNumber)_calibratedYaw
{
  return self->__calibratedYaw;
}

- (void)set_calibratedYaw:(id)a3
{
}

- (NSNumber)_calibratedPitch
{
  return self->__calibratedPitch;
}

- (void)set_calibratedPitch:(id)a3
{
}

- (UIView)_rootView
{
  return self->__rootView;
}

- (void)set_rootView:(id)a3
{
}

- (NSMutableArray)_screenLookAtPoints
{
  return self->__screenLookAtPoints;
}

- (void)set_screenLookAtPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__screenLookAtPoints, 0);
  objc_storeStrong((id *)&self->__rootView, 0);
  objc_storeStrong((id *)&self->__calibratedPitch, 0);
  objc_storeStrong((id *)&self->__calibratedYaw, 0);
  objc_storeStrong((id *)&self->__previousExpressions, 0);
  objc_storeStrong((id *)&self->__error, 0);
  objc_storeStrong((id *)&self->__controllerQueue, 0);
  objc_storeStrong((id *)&self->__velocityBasedPointMapper, 0);
  objc_storeStrong((id *)&self->__pointerMovementMapper, 0);
  objc_storeStrong((id *)&self->__trackingAreaPointMapper, 0);
  objc_storeStrong((id *)&self->__visionKitEyeTracker, 0);
  objc_storeStrong((id *)&self->__faceKitFaceTracker, 0);
  objc_storeStrong((id *)&self->__videoFileReader, 0);
  objc_storeStrong((id *)&self->__videoCapturer, 0);
  objc_storeStrong((id *)&self->__videoPreviewLayer, 0);
  objc_destroyWeak((id *)&self->_debugOverlayRootView);
  objc_storeStrong((id *)&self->_expressionConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_input, 0);
}

@end