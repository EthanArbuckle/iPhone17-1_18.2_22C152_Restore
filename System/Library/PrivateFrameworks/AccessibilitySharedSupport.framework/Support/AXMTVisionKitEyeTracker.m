@interface AXMTVisionKitEyeTracker
+ (unsigned)_imageOrientationForGazeRequest;
- ($1AB5FA073B851C12C2339EC22442E995)_currentAcceleration;
- ($1AB5FA073B851C12C2339EC22442E995)_lastAccelerationUpdate;
- (AXMTVisionKitEyeTracker)init;
- (AXMTVisionKitEyeTrackerDelegate)delegate;
- (BOOL)_accelerationIsInvalid:(id)a3;
- (BOOL)_accelerationsAreWithinThreshold:(id)a3 acceleration2:(id)a4 threshold:(double)a5;
- (CGPoint)_normalizeRawPoint:(CGPoint)a3;
- (CGPoint)_screenCoordsForNormPoint:(CGPoint)a3;
- (CGRect)_orientAVMetadataFaceBoundingBoxForCurrentOrientation:(CGRect)a3;
- (CGSize)_deviceOrientedScreenSize;
- (CGSize)_screenSizeInCM;
- (CGVector)_cameraOffsetInCM;
- (CGVector)_deviceOrientedCameraOffset;
- (NSNumber)_baselinePitch;
- (NSNumber)_baselineYaw;
- (NSValue)_baselineFaceBounds;
- (double)_calculateMaxBoundingAreaBoxForFOV:(float)a3;
- (double)_calculateMinBoundingAreaBoxForFOV:(float)a3;
- (double)_minDistBetweenAngleA:(double)a3 angleB:(double)a4;
- (float)fieldOfView;
- (id)_detectCriticalErrorsForFace:(id)a3;
- (id)_detectNonCriticalErrorsForFace:(id)a3;
- (id)_initializeScreenGazeRequestForFaceMetadata:(id)a3;
- (unint64_t)_lastTimePoseRecorded;
- (void)_computeScreenAndCameraPositions;
- (void)_notifyDelegateFaceLost;
- (void)axmtUtilities_accelerometerDataUpdated:(id)a3;
- (void)dealloc;
- (void)didUpdateFieldOfView:(float)a3;
- (void)failedToTrackFaceWithError:(id)a3;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 metadata:(id)a4;
- (void)recalibrateFace;
- (void)setDelegate:(id)a3;
- (void)setFieldOfView:(float)a3;
- (void)set_baselineFaceBounds:(id)a3;
- (void)set_baselinePitch:(id)a3;
- (void)set_baselineYaw:(id)a3;
- (void)set_cameraOffsetInCM:(CGVector)a3;
- (void)set_currentAcceleration:(id)a3;
- (void)set_lastAccelerationUpdate:(id)a3;
- (void)set_lastTimePoseRecorded:(unint64_t)a3;
- (void)set_screenSizeInCM:(CGSize)a3;
@end

@implementation AXMTVisionKitEyeTracker

- (AXMTVisionKitEyeTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXMTVisionKitEyeTracker;
  v2 = [(AXMTVisionKitEyeTracker *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(AXMTVisionKitEyeTracker *)v2 _computeScreenAndCameraPositions];
    v4 = +[AXMTUtilities sharedInstance];
    [v4 registerListener:v3 needsPhysicalOrientationEvents:1];

    int64x2_t v5 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v3->$83A9B0F16167884A9BDC45564D3E7367::x = v5;
    *(int64x2_t *)&v3->$83A9B0F16167884A9BDC45564D3E7367::z = v5;
    *(int64x2_t *)&v3->$83A9B0F16167884A9BDC45564D3E7367::y = v5;
    v3->__lastTimePoseRecorded = mach_absolute_time();
  }
  return v3;
}

- (id)_initializeScreenGazeRequestForFaceMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)VNDetectScreenGazeRequest);
  [v5 setRevision:2];
  if (AXDeviceIsPad()) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 setScreenSize:v6];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100021E58;
  v22 = sub_100021E68;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100021E58;
  v16 = sub_100021E68;
  id v17 = 0;
  objc_super v7 = [v5 supportedComputeStageDevicesAndReturnError:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021E70;
  v11[3] = &unk_100049040;
  v11[4] = &v18;
  v11[5] = &v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  if (v19[5] && v13[5]) {
    objc_msgSend(v5, "setComputeDevice:forComputeStage:");
  }
  [v5 setTemporalSmoothingFrameCount:1];
  [v4 bounds];
  -[AXMTVisionKitEyeTracker _orientAVMetadataFaceBoundingBoxForCurrentOrientation:](self, "_orientAVMetadataFaceBoundingBoxForCurrentOrientation:");
  v8 = +[VNFaceObservation faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:](VNFaceObservation, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", 0, 0, 0, 0);
  v24 = v8;
  v9 = +[NSArray arrayWithObjects:&v24 count:1];
  [v5 setInputFaceObservations:v9];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v5;
}

- (void)_computeScreenAndCameraPositions
{
  int v3 = [(id)MGCopyAnswer() intValue];
  int v4 = [(id)MGCopyAnswer() intValue];
  int v5 = [(id)MGCopyAnswer() intValue];
  [(id)MGCopyAnswer() floatValue];
  float v7 = v6;
  double v8 = (double)v5 / (double)v3 * 25.4;
  double v9 = (double)v4 / (double)v3 * 25.4;
  v10 = MGCopyAnswer();
  v11 = [v10 firstObject];
  [v11 floatValue];
  double v13 = v12;

  double v14 = -1.0;
  if ((unint64_t)[v10 count] >= 2)
  {
    v15 = [v10 objectAtIndexedSubscript:1];
    [v15 floatValue];
    double v14 = v16;
  }
  -[AXMTVisionKitEyeTracker set_cameraOffsetInCM:](self, "set_cameraOffsetInCM:", (v9 * 0.5 + v14) / 10.0, (v8 * 0.5 - v13) / 10.0);
  -[AXMTVisionKitEyeTracker set_screenSizeInCM:](self, "set_screenSizeInCM:", v9 / 10.0, v8 / 10.0);
  id v17 = AXSSLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136316418;
    uint64_t v20 = "-[AXMTVisionKitEyeTracker _computeScreenAndCameraPositions]";
    __int16 v21 = 1024;
    int v22 = v3;
    __int16 v23 = 1024;
    int v24 = v4;
    __int16 v25 = 1024;
    int v26 = v5;
    __int16 v27 = 2048;
    double v28 = v7;
    __int16 v29 = 2112;
    v30 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s pitch %d, width %d, height %d, scale %f --> %@", (uint8_t *)&v19, 0x32u);
  }

  uint64_t v18 = AXSSLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100023C10(self, v18);
  }
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 metadata:(id)a4
{
  id v6 = a4;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = sub_100021E58;
  v77 = sub_100021E68;
  id v78 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0x10000000000000;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100022798;
  v71[3] = &unk_100049068;
  v71[4] = v72;
  v71[5] = &v73;
  [v6 enumerateObjectsUsingBlock:v71];
  if (v74[5])
  {
    float v7 = -[AXMTVisionKitEyeTracker _detectCriticalErrorsForFace:](self, "_detectCriticalErrorsForFace:");
    if (v7)
    {
      [(AXMTVisionKitEyeTracker *)self _notifyDelegateFaceLost];
LABEL_35:

      goto LABEL_36;
    }
    float v16 = [(AXMTVisionKitEyeTracker *)self _initializeScreenGazeRequestForFaceMetadata:v74[5]];
    id v65 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCMSampleBuffer:orientation:options:", a3, objc_msgSend((id)objc_opt_class(), "_imageOrientationForGazeRequest"), 0);
    v64 = v16;
    if (!a3)
    {
      v39 = AXSSLogForCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100023D78(v39, v40, v41, v42, v43, v44, v45, v46);
      }
      goto LABEL_34;
    }
    v80 = v16;
    id v17 = +[NSArray arrayWithObjects:&v80 count:1];
    id v70 = 0;
    unsigned __int8 v18 = [v65 performRequests:v17 error:&v70];
    v63 = v70;

    if (v18)
    {
      int v19 = [v16 results];
      if ([v19 count])
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v20 = v19;
        id v21 = [v20 countByEnumeratingWithState:&v66 objects:v79 count:16];
        if (v21)
        {
          int v22 = 0;
          uint64_t v23 = *(void *)v67;
          double v24 = 2.22507386e-308;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v67 != v23) {
                objc_enumerationMutation(v20);
              }
              int v26 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              [v26 boundingBox];
              double v28 = v27;
              [v26 boundingBox];
              double v30 = v28 * v29;
              if (v30 > v24)
              {
                id v31 = v26;

                int v22 = v31;
                double v24 = v30;
              }
            }
            id v21 = [v20 countByEnumeratingWithState:&v66 objects:v79 count:16];
          }
          while (v21);

          if (v22)
          {
            v32 = [v22 faceScreenGaze];
            [v32 screenGazeRawOutputInCentimeters];
            -[AXMTVisionKitEyeTracker _normalizeRawPoint:](self, "_normalizeRawPoint:");
            -[AXMTVisionKitEyeTracker _screenCoordsForNormPoint:](self, "_screenCoordsForNormPoint:");
            double v34 = v33;
            double v36 = v35;
            v37 = [(AXMTVisionKitEyeTracker *)self _detectNonCriticalErrorsForFace:v74[5]];
            v38 = [(AXMTVisionKitEyeTracker *)self delegate];
            objc_msgSend(v38, "visionKitEyeTracker:detectedGaze:withNonCriticalError:", self, v37, v34, v36);

LABEL_26:
            int v19 = v20;
LABEL_33:

            v39 = v63;
LABEL_34:

            goto LABEL_35;
          }
        }
        else
        {
        }
        v48 = AXSSLogForCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_100023E68(v48, v56, v57, v58, v59, v60, v61, v62);
        }
      }
      else
      {
        v48 = AXSSLogForCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_100023DF0(v48, v49, v50, v51, v52, v53, v54, v55);
        }
      }

      [(AXMTVisionKitEyeTracker *)self _notifyDelegateFaceLost];
      goto LABEL_33;
    }
    v47 = AXSSLogForCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100023EE0((uint64_t)v63, v47);
    }

    id v20 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:0 userInfo:0];
    int v22 = [(AXMTVisionKitEyeTracker *)self delegate];
    [v22 visionKitEyeTrackerLostFace:self error:v20];
    goto LABEL_26;
  }
  double v8 = AXSSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100023D00(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(AXMTVisionKitEyeTracker *)self _notifyDelegateFaceLost];
LABEL_36:
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(&v73, 8);
}

- (void)_notifyDelegateFaceLost
{
  id v4 = [(AXMTVisionKitEyeTracker *)self delegate];
  int v3 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:1 userInfo:0];
  [v4 visionKitEyeTrackerLostFace:self error:v3];
}

- (void)recalibrateFace
{
  int v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[AXMTVisionKitEyeTracker recalibrateFace]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(AXMTVisionKitEyeTracker *)self set_baselineFaceBounds:0];
  [(AXMTVisionKitEyeTracker *)self set_baselineYaw:0];
  [(AXMTVisionKitEyeTracker *)self set_baselinePitch:0];
  -[AXMTVisionKitEyeTracker set_currentAcceleration:](self, "set_currentAcceleration:", 1.79769313e308, 1.79769313e308, 1.79769313e308);
  -[AXMTVisionKitEyeTracker set_lastAccelerationUpdate:](self, "set_lastAccelerationUpdate:", 1.79769313e308, 1.79769313e308, 1.79769313e308);
}

- (id)_detectCriticalErrorsForFace:(id)a3
{
  [a3 bounds];
  CGFloat v7 = v3;
  double v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (v3 >= 0.0
    && ((v11 = v3 + v5, double v12 = v4 + v6, v8 >= 0.0) ? (v13 = v11 <= 1.0) : (v13 = 0),
        v13 ? (BOOL v14 = v12 <= 1.0) : (BOOL v14 = 0),
        v14))
  {
    uint64_t v15 = 0;
  }
  else
  {
    float v16 = AXSSLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27.origin.x = v7;
      v27.origin.y = v8;
      v27.size.width = v9;
      v27.size.height = v10;
      unsigned __int8 v18 = NSStringFromRect(v27);
      int v19 = +[AXMTUtilities sharedInstance];
      int v20 = 136315650;
      id v21 = "-[AXMTVisionKitEyeTracker _detectCriticalErrorsForFace:]";
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      __int16 v24 = 2048;
      id v25 = [v19 currentDeviceOrientation];
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: faceBounds is out of bounds! face bounds: %@, orientation: %ld", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v15 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:1 userInfo:0];
  }

  return v15;
}

- (id)_detectNonCriticalErrorsForFace:(id)a3
{
  id v4 = a3;
  if ([v4 hasYawAngle])
  {
    double v5 = [(AXMTVisionKitEyeTracker *)self _baselineYaw];

    if (v5)
    {
      double v6 = [(AXMTVisionKitEyeTracker *)self _baselineYaw];
      [v6 doubleValue];
      double v8 = v7;
      [v4 yawAngle];
      [(AXMTVisionKitEyeTracker *)self _minDistBetweenAngleA:v8 angleB:v9];
      double v11 = v10;

      if (v11 > 20.0)
      {
        int v12 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v13 = AXSSLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        [v4 yawAngle];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "using baseline yaw: %f", buf, 0xCu);
      }

      [v4 yawAngle];
      uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(AXMTVisionKitEyeTracker *)self set_baselineYaw:v15];
    }
  }
  int v12 = 0;
LABEL_9:
  if ([v4 hasPitchAngle])
  {
    float v16 = [(AXMTVisionKitEyeTracker *)self _baselinePitch];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v25 = AXSSLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        [v4 pitchAngle];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "using baseline pitch: %f", buf, 0xCu);
      }

      [v4 pitchAngle];
      NSRect v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(AXMTVisionKitEyeTracker *)self set_baselinePitch:v27];
    }
    else
    {
      unsigned __int8 v18 = [(AXMTVisionKitEyeTracker *)self _baselinePitch];
      [v18 doubleValue];
      double v20 = v19;
      [v4 pitchAngle];
      [(AXMTVisionKitEyeTracker *)self _minDistBetweenAngleA:v20 angleB:v21];
      BOOL v23 = v22 > 20.0;

      if (v23)
      {
        int v24 = 1;
        goto LABEL_17;
      }
    }
  }
  int v24 = 0;
LABEL_17:
  double v28 = [(AXMTVisionKitEyeTracker *)self _baselineFaceBounds];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    double v30 = AXSSLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      [v4 bounds];
      id v31 = NSStringFromRect(v85);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "using baseline bounding box: %@", buf, 0xCu);
    }
    [v4 bounds];
    v32 = +[NSValue valueWithRect:](NSValue, "valueWithRect:");
    [(AXMTVisionKitEyeTracker *)self set_baselineFaceBounds:v32];
  }
  uint64_t v33 = mach_absolute_time();
  unint64_t v34 = [(AXMTVisionKitEyeTracker *)self _lastTimePoseRecorded];
  uint64_t v77 = 0;
  id v78 = &v77;
  uint64_t v79 = 0x2020000000;
  double v35 = (uint64_t (*)(uint64_t))off_100054E90;
  v80 = off_100054E90;
  if (!off_100054E90)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100023A5C;
    double v82 = COERCE_DOUBLE(&unk_100048B88);
    v83 = &v77;
    sub_100023A5C((uint64_t)buf);
    double v35 = (uint64_t (*)(uint64_t))v78[3];
  }
  _Block_object_dispose(&v77, 8);
  if (!v35)
  {
    sub_10002C8C4();
    __break(1u);
  }
  if ((double)(unint64_t)v35(v33 - v34) / 1000000000.0 > 1.0)
  {
    double v36 = AXSSLogForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "bounds", v77);
      v37 = NSStringFromRect(v86);
      double v38 = -1.0;
      if ([v4 hasYawAngle])
      {
        [v4 yawAngle];
        double v38 = v39;
      }
      unsigned int v40 = [v4 hasPitchAngle];
      double v41 = -1.0;
      if (v40) {
        objc_msgSend(v4, "pitchAngle", -1.0);
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v38;
      *(_WORD *)&buf[22] = 2048;
      double v82 = v41;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "bounding box: %@, yaw: %f, pitch: %f", buf, 0x20u);
    }
    [(AXMTVisionKitEyeTracker *)self set_lastTimePoseRecorded:mach_absolute_time()];
  }
  uint64_t v42 = [(AXMTVisionKitEyeTracker *)self _baselineFaceBounds];
  [v42 rectValue];
  double v44 = v43;
  [v4 bounds];
  if (vabdd_f64(v44, v45) > 0.1)
  {

    int v51 = v12 | v24;
    BOOL v50 = 1;
    goto LABEL_37;
  }
  uint64_t v46 = [(AXMTVisionKitEyeTracker *)self _baselineFaceBounds];
  [v46 rectValue];
  double v48 = v47;
  [v4 bounds];
  BOOL v50 = vabdd_f64(v48, v49) > 0.1;

  int v51 = v12 | v24;
  if ((v12 | v24 | v50) == 1)
  {
LABEL_37:
    v63 = AXSSLogForCategory();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      CFStringRef v64 = @"NO";
      if (v50) {
        CFStringRef v65 = @"YES";
      }
      else {
        CFStringRef v65 = @"NO";
      }
      if (v51) {
        CFStringRef v64 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v65;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "facePositionChangedSignificantly: %@, poseChangedSignificantly: %@", buf, 0x16u);
    }

    uint64_t v62 = 4;
    goto LABEL_45;
  }
  [(AXMTVisionKitEyeTracker *)self fieldOfView];
  int v53 = v52;
  [v4 bounds];
  double v55 = v54;
  [v4 bounds];
  double v57 = v56;
  LODWORD(v58) = v53;
  [(AXMTVisionKitEyeTracker *)self _calculateMinBoundingAreaBoxForFOV:v58];
  double v60 = v59;
  LODWORD(v59) = v53;
  [(AXMTVisionKitEyeTracker *)self _calculateMaxBoundingAreaBoxForFOV:v59];
  if (v55 * v57 < v60)
  {
    uint64_t v62 = 2;
LABEL_45:
    long long v66 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:v62 userInfo:0];
    goto LABEL_46;
  }
  if (v55 * v57 > v61)
  {
    uint64_t v62 = 3;
    goto LABEL_45;
  }
  [(AXMTVisionKitEyeTracker *)self _currentAcceleration];
  if (!-[AXMTVisionKitEyeTracker _accelerationIsInvalid:](self, "_accelerationIsInvalid:"))
  {
    [(AXMTVisionKitEyeTracker *)self _lastAccelerationUpdate];
    if (!-[AXMTVisionKitEyeTracker _accelerationIsInvalid:](self, "_accelerationIsInvalid:"))
    {
      [(AXMTVisionKitEyeTracker *)self _currentAcceleration];
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      [(AXMTVisionKitEyeTracker *)self _lastAccelerationUpdate];
      if (!-[AXMTVisionKitEyeTracker _accelerationsAreWithinThreshold:acceleration2:threshold:](self, "_accelerationsAreWithinThreshold:acceleration2:threshold:", v69, v71, v73, v74, v75, v76, 0.1))
      {
        uint64_t v62 = 8;
        goto LABEL_45;
      }
    }
  }
  long long v66 = 0;
LABEL_46:

  return v66;
}

- (double)_calculateMinBoundingAreaBoxForFOV:(float)a3
{
  double v3 = a3 * -0.00225022 + 0.225222;
  BOOL v4 = v3 > 0.0 && a3 > 0.0;
  double result = 0.04;
  if (v4) {
    return v3;
  }
  return result;
}

- (double)_calculateMaxBoundingAreaBoxForFOV:(float)a3
{
  double v3 = a3 * -0.00457768 + 0.477992;
  BOOL v4 = v3 > 0.0 && a3 > 0.0;
  double result = 0.1;
  if (v4) {
    return v3;
  }
  return result;
}

- (double)_minDistBetweenAngleA:(double)a3 angleB:(double)a4
{
  double result = vabdd_f64(a3, a4);
  if (360.0 - result < result) {
    return 360.0 - result;
  }
  return result;
}

- (BOOL)_accelerationsAreWithinThreshold:(id)a3 acceleration2:(id)a4 threshold:(double)a5
{
  return vabdd_f64(a3.var0, a4.var0) < a5 && vabdd_f64(a3.var1, a4.var1) < a5 && vabdd_f64(a3.var2, a4.var2) < a5;
}

- (BOOL)_accelerationIsInvalid:(id)a3
{
  return -[AXMTVisionKitEyeTracker _accelerationsAreWithinThreshold:acceleration2:threshold:](self, "_accelerationsAreWithinThreshold:acceleration2:threshold:", a3.var0, a3.var1, a3.var2, 1.79769313e308, 1.79769313e308, 1.79769313e308, 2.22044605e-16);
}

- (void)failedToTrackFaceWithError:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(AXMTVisionKitEyeTracker *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(AXMTVisionKitEyeTracker *)self delegate];
    [v6 visionKitEyeTrackerLostFace:self error:v7];
  }
}

- (void)didUpdateFieldOfView:(float)a3
{
  char v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    double v8 = "-[AXMTVisionKitEyeTracker didUpdateFieldOfView:]";
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: %f", (uint8_t *)&v7, 0x16u);
  }

  *(float *)&double v6 = a3;
  [(AXMTVisionKitEyeTracker *)self setFieldOfView:v6];
}

- (CGRect)_orientAVMetadataFaceBoundingBoxForCurrentOrientation:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double v6 = 1.0 - (a3.origin.y + a3.size.height);
  int v7 = +[AXMTUtilities sharedInstance];
  id v8 = [v7 currentDeviceOrientation];

  if (v8 == (id)2)
  {
    double v6 = 1.0 - (height + v6);
    double v12 = width;
    double width = height;
    double v11 = x;
  }
  else if (v8 == (id)4)
  {
    double v12 = height;
    double v11 = v6;
    double v6 = x;
  }
  else
  {
    double v9 = x + width;
    if (v8 == (id)3)
    {
      double v10 = height + v6;
      double v6 = 1.0 - v9;
      double v11 = 1.0 - v10;
      double v12 = height;
    }
    else
    {
      double v11 = 1.0 - v9;
      double v12 = width;
      double width = height;
    }
  }
  double v13 = v6;
  double v14 = width;
  result.size.double height = v12;
  result.size.double width = v14;
  result.origin.y = v11;
  result.origin.double x = v13;
  return result;
}

- (CGPoint)_normalizeRawPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTVisionKitEyeTracker *)self _deviceOrientedCameraOffset];
  double v7 = v6;
  double v9 = v8;
  [(AXMTVisionKitEyeTracker *)self _deviceOrientedScreenSize];
  double v11 = (x + v7) / v10;
  double v13 = (v9 - y) / v12;
  result.double y = v13;
  result.double x = v11;
  return result;
}

- (CGVector)_deviceOrientedCameraOffset
{
  double v3 = +[AXMTUtilities sharedInstance];
  id v4 = [v3 currentDeviceOrientation];

  [(AXMTVisionKitEyeTracker *)self _cameraOffsetInCM];
  double v7 = v6;
  double v8 = v5;
  if (v4 == (id)4)
  {
    [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
    double v9 = v7;
    double v7 = v12 - v8;
  }
  else if (v4 == (id)3)
  {
    [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
    double v9 = v13 - v7;
    double v7 = v8;
  }
  else
  {
    double v9 = v5;
    if (v4 == (id)2)
    {
      [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
      double v9 = v10 - v8;
      [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
      double v7 = v11 - v7;
    }
  }
  double v14 = v7;
  double v15 = v9;
  result.ddouble y = v15;
  result.ddouble x = v14;
  return result;
}

- (CGSize)_deviceOrientedScreenSize
{
  double v3 = +[AXMTUtilities sharedInstance];
  id v4 = (char *)[v3 currentDeviceOrientation];

  if ((unint64_t)(v4 - 3) < 2)
  {
    [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
    double v8 = v7;
    [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
    double v6 = v9;
    double v5 = v8;
  }
  else
  {
    [(AXMTVisionKitEyeTracker *)self _screenSizeInCM];
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGPoint)_screenCoordsForNormPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = +[AXMTUtilities sharedInstance];
  [v5 screenBoundsAccountingForPhysicalDeviceOrientation];
  double v7 = v6;
  double v9 = v8;

  double v10 = x * v7;
  double v11 = y * v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)axmtUtilities_accelerometerDataUpdated:(id)a3
{
  id v4 = a3;
  [(AXMTVisionKitEyeTracker *)self _currentAcceleration];
  -[AXMTVisionKitEyeTracker set_lastAccelerationUpdate:](self, "set_lastAccelerationUpdate:");
  [v4 acceleration];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  -[AXMTVisionKitEyeTracker set_currentAcceleration:](self, "set_currentAcceleration:", v6, v8, v10);
}

- (void)dealloc
{
  double v3 = +[AXMTUtilities sharedInstance];
  [v3 unregisterListener:self];

  v4.receiver = self;
  v4.super_class = (Class)AXMTVisionKitEyeTracker;
  [(AXMTVisionKitEyeTracker *)&v4 dealloc];
}

+ (unsigned)_imageOrientationForGazeRequest
{
  v2 = +[AXMTUtilities sharedInstance];
  double v3 = (char *)[v2 currentDeviceOrientation];

  if ((unint64_t)(v3 - 2) > 2) {
    return 6;
  }
  else {
    return dword_100036D70[(void)(v3 - 2)];
  }
}

- (AXMTVisionKitEyeTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTVisionKitEyeTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGVector)_cameraOffsetInCM
{
  ddouble x = self->__cameraOffsetInCM.dx;
  ddouble y = self->__cameraOffsetInCM.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)set_cameraOffsetInCM:(CGVector)a3
{
  self->__cameraOffsetInCM = a3;
}

- (CGSize)_screenSizeInCM
{
  double width = self->__screenSizeInCM.width;
  double height = self->__screenSizeInCM.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_screenSizeInCM:(CGSize)a3
{
  self->__screenSizeInCM = a3;
}

- (NSValue)_baselineFaceBounds
{
  return self->__baselineFaceBounds;
}

- (void)set_baselineFaceBounds:(id)a3
{
}

- (NSNumber)_baselineYaw
{
  return self->__baselineYaw;
}

- (void)set_baselineYaw:(id)a3
{
}

- (NSNumber)_baselinePitch
{
  return self->__baselinePitch;
}

- (void)set_baselinePitch:(id)a3
{
}

- ($1AB5FA073B851C12C2339EC22442E995)_currentAcceleration
{
  double x = self->$83A9B0F16167884A9BDC45564D3E7367::x;
  double y = self->$83A9B0F16167884A9BDC45564D3E7367::y;
  double z = self->$83A9B0F16167884A9BDC45564D3E7367::z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)set_currentAcceleration:(id)a3
{
  self->88 = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)_lastAccelerationUpdate
{
  double x = self->$83A9B0F16167884A9BDC45564D3E7367::x;
  double y = self->$83A9B0F16167884A9BDC45564D3E7367::y;
  double z = self->$83A9B0F16167884A9BDC45564D3E7367::z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)set_lastAccelerationUpdate:(id)a3
{
  self->112 = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (unint64_t)_lastTimePoseRecorded
{
  return self->__lastTimePoseRecorded;
}

- (void)set_lastTimePoseRecorded:(unint64_t)a3
{
  self->__lastTimePoseRecorded = a3;
}

- (float)fieldOfView
{
  return self->_fieldOfView;
}

- (void)setFieldOfView:(float)a3
{
  self->_fieldOfView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__baselinePitch, 0);
  objc_storeStrong((id *)&self->__baselineYaw, 0);
  objc_storeStrong((id *)&self->__baselineFaceBounds, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end