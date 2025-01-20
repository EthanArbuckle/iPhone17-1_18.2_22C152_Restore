@interface ARWorldAlignmentTechnique
- (ARWorldAlignmentTechnique)initWithAlignment:(int64_t)a3;
- (ARWorldAlignmentTechnique)initWithAlignment:(int64_t)a3 cameraPosition:(int64_t)a4;
- (BOOL)isBusy;
- (BOOL)isEqual:(id)a3;
- (CMMotionManager)motionManager;
- (float)_trackingAlignmentAngleForPoseData:(id)a3 deviceOrientation:(id)a4;
- (id)_deviceOrientationPoseDataFromDeviceOrientation:(id)a3;
- (id)_fullDescription;
- (id)_referenceTrackingAlignmentWithPoseData:(id)a3 deviceOrientation:(id)a4;
- (id)_updateHeadingAlignmentWithPoseData:(id)a3 deviceOrientation:(id)a4 timestamp:(double)a5;
- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (int64_t)alignment;
- (int64_t)cameraPosition;
- (unint64_t)optionalSensorDataTypes;
- (void)_handleTrackingStateChanges:(id)a3 initialized:(BOOL *)a4 relocalized:(BOOL *)a5;
- (void)_referenceDeviceOrientation:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setMotionManager:(id)a3;
@end

@implementation ARWorldAlignmentTechnique

- (ARWorldAlignmentTechnique)initWithAlignment:(int64_t)a3
{
  return [(ARWorldAlignmentTechnique *)self initWithAlignment:a3 cameraPosition:1];
}

- (ARWorldAlignmentTechnique)initWithAlignment:(int64_t)a3 cameraPosition:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ARWorldAlignmentTechnique;
  v6 = [(ARTechnique *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_alignment = a3;
    v6->_cameraPosition = a4;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    dataSemaphore = v7->_dataSemaphore;
    v7->_dataSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = [[ARTimeKeyedList alloc] initWithMaxSize:10];
    deviceOrientationDataByTime = v7->_deviceOrientationDataByTime;
    v7->_deviceOrientationDataByTime = v10;
  }
  return v7;
}

- (unint64_t)optionalSensorDataTypes
{
  return 8;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)processData:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    deviceOrientationDataByTime = self->_deviceOrientationDataByTime;
    id v6 = v4;
    v7 = (void *)[v6 copy];
    [v6 timestamp];
    double v9 = v8;

    [(ARTimeKeyedList *)deviceOrientationDataByTime appendObject:v7 forTime:v9];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 resultDataOfClass:objc_opt_class()];
  double v8 = [v7 lastObject];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  int imageMirrored = self->_imageMirrored;
  v10 = [v6 imageData];
  int v11 = [v10 isMirrored];

  if (imageMirrored != v11)
  {
    v12 = [v6 imageData];
    self->_int imageMirrored = [v12 isMirrored];

    self->_deviceOrientationReferenced = 0;
    self->_trackingReferenced = 0;
  }
  __int16 v31 = 0;
  [(ARWorldAlignmentTechnique *)self _handleTrackingStateChanges:v8 initialized:(char *)&v31 + 1 relocalized:&v31];
  objc_super v13 = [v8 worldTrackingState];
  uint64_t v14 = [v13 reason];

  if (v14 == 1)
  {

    double v8 = 0;
  }
  v15 = [(ARTimeKeyedList *)self->_deviceOrientationDataByTime nearestObjectForTime:a3];
  if (v15 && !self->_deviceOrientationReferenced)
  {
    [(ARWorldAlignmentTechnique *)self _referenceDeviceOrientation:v15];
    int v16 = 1;
  }
  else
  {
    int v16 = 0;
  }
  if (!(_BYTE)v31 || !self->_relocalizedAlignmentData)
  {
    if (v15)
    {
      if (v8)
      {
        if (!self->_trackingReferenced || HIBYTE(v31))
        {
          v27 = [(ARWorldAlignmentTechnique *)self _referenceTrackingAlignmentWithPoseData:v8 deviceOrientation:v15];
          v19 = v27;
          if (HIBYTE(v31) && self->_trackingReferenced)
          {
            [v27 setSessionShouldResumeCameraPositionAndHeading:1];
          }
          else if (v16)
          {
            [v27 setReferenceOriginChanged:0];
          }
          v41 = v19;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
          self->_trackingReferenced = 1;
          goto LABEL_41;
        }
        if ([(ARWorldAlignmentTechnique *)self alignment] == 1)
        {
          uint64_t v18 = [(ARWorldAlignmentTechnique *)self _updateHeadingAlignmentWithPoseData:v8 deviceOrientation:v15 timestamp:a3];
          v19 = (void *)v18;
          if (!v18)
          {
            v17 = (void *)MEMORY[0x1E4F1CBF0];
            goto LABEL_41;
          }
          uint64_t v40 = v18;
          v20 = (void *)MEMORY[0x1E4F1C978];
          v21 = &v40;
          goto LABEL_40;
        }
LABEL_21:
        v17 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_42;
      }
      uint64_t v22 = [(ARWorldAlignmentTechnique *)self _deviceOrientationPoseDataFromDeviceOrientation:v15];
      v19 = (void *)v22;
      if (self->_trackingReferenced)
      {
        v23 = _ARLogTechnique_8();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 138543618;
          v37 = v25;
          __int16 v38 = 2048;
          v39 = self;
          _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World Tracking Reference Cleared", buf, 0x16u);
        }
        self->_trackingReferenced = 0;
        v26 = objc_opt_new();
        [v26 setWorldAlignmentReset:1];
        [v26 setReferenceOriginChanged:1];
        if (v14 == 1) {
          [v26 setSessionShouldResumeCameraPositionAndHeading:1];
        }
        else {
          [v26 setSessionShouldResumeCameraPosition:1];
        }
        v35[0] = v19;
        v35[1] = v26;
        v28 = (void *)MEMORY[0x1E4F1C978];
        v29 = v35;
        goto LABEL_37;
      }
      if (v16)
      {
        v26 = objc_opt_new();
        [v26 setWorldAlignmentReset:1];
        v34[0] = v19;
        v34[1] = v26;
        v28 = (void *)MEMORY[0x1E4F1C978];
        v29 = v34;
LABEL_37:
        v17 = [v28 arrayWithObjects:v29 count:2];

LABEL_41:
        goto LABEL_42;
      }
      uint64_t v33 = v22;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = &v33;
    }
    else
    {
      if (v14 != 1 || self->_trackingReferenced) {
        goto LABEL_21;
      }
      v19 = objc_opt_new();
      v32 = v19;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = (uint64_t *)&v32;
    }
LABEL_40:
    v17 = [v20 arrayWithObjects:v21 count:1];
    goto LABEL_41;
  }
  v42[0] = self->_relocalizedAlignmentData;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  self->_trackingReferenced = 1;
LABEL_42:

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  v30 = [(ARTechnique *)self delegate];
  [v30 technique:self didOutputResultData:v17 timestamp:v6 context:a3];
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_deviceOrientationReferenced
    && !self->_trackingReferenced
    && [(ARWorldAlignmentTechnique *)self alignment] != 2)
  {
    motionManager = self->_motionManager;
    if (motionManager
      && [(CMMotionManager *)motionManager isPredictedDeviceMotionAvailable])
    {
      kdebug_trace();
      v7 = [(ARWorldAlignmentTechnique *)self motionManager];
      id v19 = 0;
      double v8 = [v7 predictedDeviceMotionAtTimestamp:&v19 error:a3];
      id v9 = v19;

      [v8 timestamp];
      CFAbsoluteTimeGetCurrent();
      kdebug_trace();
      if (v8)
      {
        v10 = objc_opt_new();
        [v10 setDeviceMotion:v8];

        if (v10)
        {
LABEL_13:
          int v16 = [(ARWorldAlignmentTechnique *)self _deviceOrientationPoseDataFromDeviceOrientation:v10];
          v20 = v16;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

          goto LABEL_15;
        }
      }
      else
      {
        int v11 = _ARLogSensor_5();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (objc_class *)objc_opt_class();
          objc_super v13 = NSStringFromClass(v12);
          uint64_t v14 = [v9 description];
          v15 = self->_motionManager;
          *(_DWORD *)buf = 138544386;
          uint64_t v22 = v13;
          __int16 v23 = 2048;
          v24 = self;
          __int16 v25 = 2112;
          v26 = v14;
          __int16 v27 = 2048;
          double v28 = a3;
          __int16 v29 = 2048;
          v30 = v15;
          _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error(%@) Failed to get device motion prediction at timestamp (%f) from motion manager (%p)", buf, 0x34u);
        }
      }
    }
    v10 = [(ARTimeKeyedList *)self->_deviceOrientationDataByTime nearestObjectForTime:a3];
    if (v10) {
      goto LABEL_13;
    }
  }
  v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_15:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return v17;
}

- (void)_referenceDeviceOrientation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ARWorldAlignmentTechnique *)self alignment] == 1 && !self->_relocalizing)
  {
    if (self->_cameraPosition == 2)
    {
      self->_deviceOrientationAlignmentAngle = 3.1416;
      uint64_t v14 = _ARLogTechnique_8();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      v17 = (objc_class *)objc_opt_class();
      int v16 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543874;
      __int16 v23 = v16;
      __int16 v24 = 2048;
      __int16 v25 = self;
      __int16 v26 = 2048;
      double v27 = 180.0;
    }
    else
    {
      self->_deviceOrientationAlignmentAngle = 0.0;
      uint64_t v14 = _ARLogTechnique_8();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      uint64_t v18 = (objc_class *)objc_opt_class();
      int v16 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543874;
      __int16 v23 = v16;
      __int16 v24 = 2048;
      __int16 v25 = self;
      __int16 v26 = 2048;
      double v27 = 0.0;
    }
    goto LABEL_10;
  }
  if (v4)
  {
    [v4 rotationMatrix];
  }
  else
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
  }
  v5.n128_f64[0] = ARCameraToWorldTransformFromCMRotationMatrix((double *)v20, self->_cameraPosition, self->_imageMirrored);
  *(double *)&long long v8 = AREulerAnglesFromMatrix(v5, v6, v7);
  long long v19 = v8;
  float v9 = *((float *)&v8 + 1);
  float v10 = -*((float *)&v8 + 1);
  self->_deviceOrientationAlignmentAngle = -*((float *)&v8 + 1);
  int v11 = _ARLogTechnique_8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138544386;
    __int16 v23 = v13;
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 2048;
    double v27 = *(float *)&v19 * 0.318309886 * 180.0;
    __int16 v28 = 2048;
    double v29 = v9 * 0.318309886 * 180.0;
    __int16 v30 = 2048;
    double v31 = *((float *)&v19 + 2) * 0.318309886 * 180.0;
    _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Device Orientation Referenced at (%0.2f° %0.2f° %0.2f°)", buf, 0x34u);
  }
  uint64_t v14 = _ARLogTechnique_8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    int v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v16;
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 2048;
    double v27 = v10 * 0.318309886 * 180.0;
LABEL_10:
    _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Device Orientation Alignment (%0.2f°)", buf, 0x20u);
  }
LABEL_11:

  self->_deviceOrientationReferenced = 1;
}

- (float)_trackingAlignmentAngleForPoseData:(id)a3 deviceOrientation:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    [a4 rotationMatrix];
  }
  else
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  v7.n128_f64[0] = ARCameraToWorldTransformFromCMRotationMatrix((double *)v18, self->_cameraPosition, self->_imageMirrored);
  *(double *)v10.i64 = AREulerAnglesFromMatrix(v7, v8, v9);
  float32x4_t v17 = v10;
  [v6 cameraTransform];
  *(double *)v14.i64 = AREulerAnglesFromMatrix(v11, v12, v13);
  float v15 = COERCE_FLOAT(vsubq_f32(v14, v17).i32[1]) - self->_deviceOrientationAlignmentAngle;

  return v15;
}

- (id)_referenceTrackingAlignmentWithPoseData:(id)a3 deviceOrientation:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __n128 v8 = objc_opt_new();
  [v8 setReferenceOriginChanged:1];
  int64_t v9 = [(ARWorldAlignmentTechnique *)self alignment];
  float v10 = 0.0;
  if (v9 != 16) {
    -[ARWorldAlignmentTechnique _trackingAlignmentAngleForPoseData:deviceOrientation:](self, "_trackingAlignmentAngleForPoseData:deviceOrientation:", v6, v7, 0.0);
  }
  self->_trackingAlignmentAngle = v10;
  [v6 cameraTransform];
  *(_OWORD *)self->_trackingAlignmentTranslation = v11;
  __float2 v12 = __sincosf_stret(self->_trackingAlignmentAngle * 0.5);
  float32x4_t v13 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v12.__sinval);
  v13.i32[3] = LODWORD(v12.__cosval);
  simd_matrix4x4(v13);
  ARMatrix4x4FromRotationAndTranslation();
  objc_msgSend(v8, "setWorldAlignmentTransform:");
  float32x4_t v14 = _ARLogTechnique_8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    float v15 = (objc_class *)objc_opt_class();
    int v16 = NSStringFromClass(v15);
    [v8 worldAlignmentTransform];
    uint64_t v21 = ARMatrix4x4Description(0, v17, v18, v19, v20);
    *(_DWORD *)buf = 138543874;
    __int16 v24 = v16;
    __int16 v25 = 2048;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v21;
    _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World Tracking Referenced: %@", buf, 0x20u);
  }
  return v8;
}

- (id)_updateHeadingAlignmentWithPoseData:(id)a3 deviceOrientation:(id)a4 timestamp:(double)a5
{
  float v7 = a5 - self->_lastHeadingUpdateTimestamp;
  [(ARWorldAlignmentTechnique *)self _trackingAlignmentAngleForPoseData:a3 deviceOrientation:a4];
  float trackingAlignmentAngle = self->_trackingAlignmentAngle;
  float v10 = vabds_f32(v8, trackingAlignmentAngle);
  float v11 = (float)(4.0 / sqrtf(v7)) + 2.0;
  float v12 = v10 + -6.28318531;
  float v13 = fabsf(v12);
  if (v10 > 3.14159265) {
    float v10 = v13;
  }
  if (v11 * 3.14159265 / 180.0 >= v10)
  {
    __n128 v17 = 0;
  }
  else
  {
    self->_lastHeadingUpdateTimestamp = a5;
    if (v10 <= 0.523598776)
    {
      float v14 = v10 * 0.125;
      BOOL v15 = v8 <= trackingAlignmentAngle;
      float v8 = trackingAlignmentAngle - v14;
      float v16 = trackingAlignmentAngle + v14;
      if (!v15) {
        float v8 = v16;
      }
    }
    self->_float trackingAlignmentAngle = v8;
    __n128 v17 = objc_opt_new();
    [v17 setReferenceOriginChanged:0];
    __float2 v18 = __sincosf_stret(self->_trackingAlignmentAngle * 0.5);
    float32x4_t v19 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v18.__sinval);
    v19.i32[3] = LODWORD(v18.__cosval);
    simd_matrix4x4(v19);
    ARMatrix4x4FromRotationAndTranslation();
    objc_msgSend(v17, "setWorldAlignmentTransform:");
  }
  return v17;
}

- (id)_deviceOrientationPoseDataFromDeviceOrientation:(id)a3
{
  id v4 = a3;
  __n128 v5 = v4;
  if (v4)
  {
    [v4 rotationMatrix];
  }
  else
  {
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
  }
  *(double *)&long long v6 = ARCameraToWorldTransformFromCMRotationMatrix((double *)v23, self->_cameraPosition, self->_imageMirrored);
  long long v21 = v7;
  long long v22 = v6;
  long long v19 = v9;
  long long v20 = v8;
  float v10 = objc_opt_new();
  [v5 timestamp];
  objc_msgSend(v10, "setTimestamp:");
  __float2 v11 = __sincosf_stret(self->_deviceOrientationAlignmentAngle * 0.5);
  float32x4_t v12 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *(double *)v13.i64 = simd_matrix4x4(v12);
  uint64_t v17 = 0;
  v25[0] = v22;
  v25[1] = v21;
  v25[2] = v20;
  v25[3] = v19;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  do
  {
    *(long long *)((char *)&v26 + v17 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(v25[v17])), v14, *(float32x2_t *)&v25[v17], 1), v15, (float32x4_t)v25[v17], 2), v16, (float32x4_t)v25[v17], 3);
    ++v17;
  }
  while (v17 != 4);
  objc_msgSend(v10, "setCameraTransform:", *(double *)&v26, *(double *)&v27, *(double *)&v28, *(double *)&v29);

  return v10;
}

- (void)_handleTrackingStateChanges:(id)a3 initialized:(BOOL *)a4 relocalized:(BOOL *)a5
{
  id v8 = a3;
  long long v9 = [v8 worldTrackingState];
  int64_t v10 = [v9 reason];

  if (v8 && self->_lastTrackingStateReason != v10)
  {
    if (v10 == 1)
    {
      self->_relocalizing = 1;
      if (self->_lastTrackingStateReason != 4)
      {
        memset(&v21[1], 0, 24);
        memset(&v21[5], 0, 24);
        __float2 v11 = objc_opt_new();
        v21[0] = 0x3FF0000000000000;
        v21[4] = 0x3FF0000000000000;
        v21[8] = 0x3FF0000000000000;
        [v11 setRotationMatrix:v21];
        [(ARWorldAlignmentTechnique *)self _referenceDeviceOrientation:v11];
        float32x4_t v12 = [(ARWorldAlignmentTechnique *)self _referenceTrackingAlignmentWithPoseData:v8 deviceOrientation:v11];
        relocalizedAlignmentData = self->_relocalizedAlignmentData;
        self->_relocalizedAlignmentData = v12;
      }
      [(ARTimeKeyedList *)self->_deviceOrientationDataByTime clear];
      self->_deviceOrientationReferenced = 0;
    }
    else
    {
      float32x4_t v14 = [v8 worldTrackingState];
      if ([v14 majorRelocalization])
      {
      }
      else
      {
        float32x4_t v15 = [v8 worldTrackingState];
        [v15 lastMajorRelocalizationTimestamp];
        double v17 = v16;
        double lastMajorRelocalizationTimestamp = self->_lastMajorRelocalizationTimestamp;

        if (v17 <= lastMajorRelocalizationTimestamp)
        {
          if (a4 && self->_lastTrackingStateReason == 1) {
            *a4 = 1;
          }
          goto LABEL_13;
        }
      }
      if (a5) {
        *a5 = 1;
      }
      self->_relocalizing = 0;
      long long v19 = [v8 worldTrackingState];
      [v19 lastMajorRelocalizationTimestamp];
      self->_double lastMajorRelocalizationTimestamp = v20;
    }
LABEL_13:
    self->_lastTrackingStateReason = v10;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARWorldAlignmentTechnique;
  if ([(ARTechnique *)&v10 isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(ARWorldAlignmentTechnique *)self alignment];
    if (v6 == [v5 alignment])
    {
      int64_t v7 = [(ARWorldAlignmentTechnique *)self cameraPosition];
      BOOL v8 = v7 == [v5 cameraPosition];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v12.receiver = self;
  v12.super_class = (Class)ARWorldAlignmentTechnique;
  id v4 = [(ARTechnique *)&v12 _fullDescription];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  if (self->_relocalizing) {
    int64_t v6 = @"YES";
  }
  else {
    int64_t v6 = @"NO";
  }
  [v5 appendFormat:@"\tRelocalizing %@\n", v6];
  if (self->_trackingReferenced) {
    int64_t v7 = @"YES";
  }
  else {
    int64_t v7 = @"NO";
  }
  [v5 appendFormat:@"\tTrackingReferenced %@\n", v7];
  objc_msgSend(v5, "appendFormat:", @"\tLatestTrakingStateReason %ld\n", self->_lastTrackingStateReason);
  BOOL v8 = [(ARTimeKeyedList *)self->_deviceOrientationDataByTime description];
  long long v9 = [v8 description];
  objc_super v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"\tOrientationData %@\n", v10];

  return v5;
}

- (BOOL)isBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  }
  return v3 != 0;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_dataSemaphore, 0);
  objc_storeStrong((id *)&self->_relocalizedAlignmentData, 0);
  objc_storeStrong((id *)&self->_deviceOrientationDataByTime, 0);
}

@end