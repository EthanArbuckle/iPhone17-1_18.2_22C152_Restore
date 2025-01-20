@interface ARSLAMState
+ (BOOL)supportsSecureCoding;
- (ARPointCloud)pointCloud;
- (ARSLAMState)initWithCoder:(id)a3;
- (ARSLAMState)initWithSLAMState:(CV3DSLAMStateContext *)a3;
- (BOOL)setSLAMState:(CV3DSLAMStateContext *)a3;
- (CV3DSLAMStateContext)slamState;
- (NSDictionary)tracingEntry;
- (NSString)description;
- (double)timestamp;
- (int)trackingState;
- (unsigned)slamMode;
- (unsigned)visualSLAMState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARSLAMState

- (ARSLAMState)initWithSLAMState:(CV3DSLAMStateContext *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARSLAMState;
  v4 = [(ARSLAMState *)&v7 init];
  if (!v4) {
    goto LABEL_5;
  }
  if (ARMinVergenceAngleCosineDefault_onceToken != -1) {
    dispatch_once(&ARMinVergenceAngleCosineDefault_onceToken, &__block_literal_global_110);
  }
  *(void *)&v4->_minVergenceAngleCosine = ARMinVergenceAngleCosineDefault_sMinVergenceAngleCosine;
  if (![(ARSLAMState *)v4 setSLAMState:a3]) {
    v5 = 0;
  }
  else {
LABEL_5:
  }
    v5 = v4;

  return v5;
}

- (BOOL)setSLAMState:(CV3DSLAMStateContext *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_slamState)
  {
    CV3DSLAMStateRelease();
    self->_timestamp = 0.0;
    self->_slamState = 0;
  }
  int Timestamp = CV3DSLAMStateGetTimestamp();
  int v6 = *MEMORY[0x1E4F4D490];
  if (Timestamp == *MEMORY[0x1E4F4D490])
  {
    self->_slamState = a3;
    self->_timestamp = 0.0;
    CV3DSLAMStateRetain();
  }
  else
  {
    objc_super v7 = _ARLogGeneral_39();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = NSStringFromCV3DSLAMReturn(Timestamp);
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to get timestamp for SLAM state: %{public}@", buf, 0x20u);
    }
  }
  return Timestamp == v6;
}

- (void)dealloc
{
  CV3DSLAMStateRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARSLAMState;
  [(ARSLAMState *)&v3 dealloc];
}

- (unsigned)slamMode
{
  return CV3DSLAMStateGetSLAMMode();
}

- (unsigned)visualSLAMState
{
  return CV3DSLAMStateGetVisualSLAMState();
}

- (int)trackingState
{
  return 1;
}

- (ARPointCloud)pointCloud
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = [(ARSLAMState *)self trackingState];
  if (v3)
  {
    unsigned int v4 = v3;
    v5 = _ARLogGeneral_39();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = (objc_class *)objc_opt_class();
      objc_super v7 = NSStringFromClass(v6);
      v8 = NSStringFromCV3DVIOTrackingState(v4);
      int v17 = 138543874;
      uint64_t v18 = v7;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Point cloud rejected because tracking state is %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA58] data];
    int PointCloud = CV3DSLAMStateGetPointCloud();
    if (PointCloud == *MEMORY[0x1E4F4D490])
    {
      v10 = [[ARPointCloud alloc] initWithCV3DPointData:v5 minVergenceAngleCosine:self->_minVergenceAngleCosine];
      goto LABEL_10;
    }
    int v11 = PointCloud;
    v12 = _ARLogGeneral_39();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      v15 = NSStringFromCV3DSLAMReturn(v11);
      int v17 = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to retrieve point cloud from SLAM state: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (NSString)description
{
  int v3 = (void *)MEMORY[0x1E4F28E78];
  unsigned int v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARSLAMState *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  LODWORD(v5) = [(ARSLAMState *)self slamMode];
  v8 = NSStringFromCV3DSLAMMode((int)v5);
  [v6 appendFormat:@" mode=%@", v8];

  if (v5 == *MEMORY[0x1E4F4D460])
  {
    v9 = NSStringFromCV3DVisualSLAMState([(ARSLAMState *)self visualSLAMState]);
    [v6 appendFormat:@" visualSLAMState=%@", v9];

    objc_msgSend(v6, "appendFormat:", @" visualSLAMTransitions=%i", CV3DSLAMStateGetNumberOfVOToVIOStateTransitions());
  }
  v10 = NSStringFromCV3DVIOTrackingState([(ARSLAMState *)self trackingState]);
  [v6 appendFormat:@" trackingState=%@", v10];

  CV3DSLAMStateNumReinit();
  objc_msgSend(v6, "appendFormat:", @" reinitCount=%i", 0);
  CV3DSLAMStateIsPoseLocked();
  [v6 appendFormat:@" poseLocked=%@", @"no"];
  int v11 = (void *)CV3DSLAMStateCopyCurrentTrackingCameraIds();
  v12 = (void *)CV3DSLAMStateCopyCameraFrameRates();
  v13 = [v11 componentsJoinedByString:@", "];
  [v6 appendFormat:@" cameras={%@}", v13];

  __int16 v14 = [v12 componentsJoinedByString:@", "];
  [v6 appendFormat:@" frameRates={%@}", v14];

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (NSDictionary)tracingEntry
{
  v53[9] = *(double *)MEMORY[0x1E4F143B8];
  int v3 = ARQATraceableDefaultEntryForResultData(self);
  unsigned int v4 = (void *)[v3 mutableCopy];

  LODWORD(v3) = [(ARSLAMState *)self slamMode];
  v5 = NSStringFromCV3DSLAMMode((int)v3);
  [v4 setObject:v5 forKeyedSubscript:@"mode"];

  int v6 = NSStringFromCV3DVIOTrackingState([(ARSLAMState *)self trackingState]);
  [v4 setObject:v6 forKeyedSubscript:@"trackingState"];

  if (v3 == *MEMORY[0x1E4F4D460])
  {
    uint64_t v7 = NSStringFromCV3DVisualSLAMState([(ARSLAMState *)self visualSLAMState]);
    [v4 setObject:v7 forKeyedSubscript:@"visualSLAMState"];

    v8 = [NSNumber numberWithInt:CV3DSLAMStateGetNumberOfVOToVIOStateTransitions()];
    [v4 setObject:v8 forKeyedSubscript:@"visualSLAMTransitions"];
  }
  memset(v53, 0, 72);
  memset(&v52[2], 0, 24);
  if (CV3DSLAMStateGetPoseInCameraFrame() == *MEMORY[0x1E4F4D490])
  {
    *(double *)v55.columns[0].i64 = ARMatrix4x4MakeRowMajorTransform(v53);
    simd_float4x4 v56 = __invert_f4(v55);
    simd_float4 v35 = v56.columns[1];
    simd_float4 v37 = v56.columns[0];
    simd_float4 v31 = v56.columns[3];
    simd_float4 v33 = v56.columns[2];
    *(double *)v9.i64 = ARVisionToRenderingCoordinateTransform();
    unint64_t v13 = 0;
    simd_float4 v39 = v37;
    simd_float4 v40 = v35;
    simd_float4 v41 = v33;
    simd_float4 v42 = v31;
    float32x4_t v43 = 0u;
    float32x4_t v44 = 0u;
    float32x4_t v45 = 0u;
    float32x4_t v46 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v43 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)((char *)&v39 + v13))), v10, *(float32x2_t *)&v39.f32[v13 / 4], 1), v11, *(float32x4_t *)((char *)&v39 + v13), 2), v12, *(float32x4_t *)((char *)&v39 + v13), 3);
      v13 += 16;
    }
    while (v13 != 64);
    float32x4_t v36 = v44;
    float32x4_t v38 = v43;
    float32x4_t v32 = v46;
    float32x4_t v34 = v45;
    *(double *)v14.i64 = ARRenderingToVisionCoordinateTransform();
    unint64_t v15 = 0;
    simd_float4 v39 = v14;
    simd_float4 v40 = v16;
    simd_float4 v41 = v17;
    simd_float4 v42 = v18;
    float32x4_t v43 = 0u;
    float32x4_t v44 = 0u;
    float32x4_t v45 = 0u;
    float32x4_t v46 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v43 + v15) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(*(_OWORD *)((char *)&v39 + v15))), v36, *(float32x2_t *)&v39.f32[v15 / 4], 1), v34, *(float32x4_t *)((char *)&v39 + v15), 2), v32, *(float32x4_t *)((char *)&v39 + v15), 3);
      v15 += 16;
    }
    while (v15 != 64);
    __int16 v19 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:", *(double *)v43.i64, *(double *)v44.i64, *(double *)v45.i64, *(double *)v46.i64);
    [v4 setObject:v19 forKeyedSubscript:@"cameraPose"];
  }
  v39.i32[0] = 0;
  CV3DSLAMStateGetMapSize();
  CV3DSLAMStateWasTrackingMap();
  v51[0] = @"size";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v39.u32[0]);
  v51[1] = @"tracking";
  v52[0] = v20;
  v52[1] = @"no";
  __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v4 setObject:v21 forKeyedSubscript:@"map"];

  CV3DSLAMStateIsInitFinished();
  CV3DSLAMStateNumReinit();
  v49[0] = @"finished";
  v49[1] = @"reinitCount";
  v50[0] = @"no";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%i", 0);
  v50[1] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  [v4 setObject:v23 forKeyedSubscript:@"initialization"];

  v24 = (void *)CV3DSLAMStateCopyCurrentTrackingCameraIds();
  v25 = (void *)CV3DSLAMStateCopyCameraFrameRates();
  CameraTrackRatiosPerCamera = (void *)CV3DSLAMStateGetCameraTrackRatiosPerCamera();
  [v4 setObject:v24 forKeyedSubscript:@"cameraIDs"];
  [v4 setObject:v25 forKeyedSubscript:@"frameRates"];
  [v4 setObject:CameraTrackRatiosPerCamera forKeyedSubscript:@"trackRatios"];
  CV3DSLAMStateRelocalizationEvent();
  v43.i64[0] = 0;
  CV3DSLAMStateGetRelocalizationTimestamp();
  CV3DSLAMStateIsGlobalRelocalization();
  CV3DSLAMStateRelocalizationSucceeded();
  v48[0] = @"no";
  v47[0] = @"event";
  v47[1] = @"timestamp";
  v27 = [NSNumber numberWithDouble:*(double *)v43.i64];
  v48[1] = v27;
  v48[2] = @"no";
  v47[2] = @"global";
  v47[3] = @"success";
  v48[3] = @"no";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];
  [v4 setObject:v28 forKeyedSubscript:@"relocalization"];

  if (CV3DSLAMStateShouldUseVisualSLAM()) {
    v29 = @"yes";
  }
  else {
    v29 = @"no";
  }
  [v4 setObject:v29 forKeyedSubscript:@"useVisualSLAM"];

  return (NSDictionary *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ARSLAMState *)self slamState];
  CFDataRef v5 = (const __CFData *)CV3DSLAMStateSerializeToData();
  if (v5 && (int v6 = v5, CFDataGetLength(v5)))
  {
    [v4 encodeObject:v6 forKey:@"slamState"];
  }
  else
  {
    int v6 = _ARLogGeneral_39();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v9 = 138543618;
      float32x4_t v10 = v8;
      __int16 v11 = 2048;
      float32x4_t v12 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to serialize SLAM state", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (ARSLAMState)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFDataRef v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slamState"];
  if (!v5)
  {
    v8 = _ARLogGeneral_39();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = (objc_class *)objc_opt_class();
      float32x4_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543618;
      simd_float4 v16 = v10;
      __int16 v17 = 2048;
      simd_float4 v18 = self;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to deserialize SLAM state", buf, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v6 = CV3DSLAMStateCreateFromData();
  if (!v6)
  {
    v8 = _ARLogGeneral_39();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = (objc_class *)objc_opt_class();
      float32x4_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      simd_float4 v16 = v12;
      __int16 v17 = 2048;
      simd_float4 v18 = self;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create SLAM state from data", buf, 0x16u);
    }
LABEL_9:

    uint64_t v7 = 0;
    goto LABEL_10;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __29__ARSLAMState_initWithCoder___block_invoke;
  v14[3] = &__block_descriptor_40_e5_v8__0l;
  v14[4] = v6;
  self = [(ARSLAMState *)self initWithSLAMState:v6];
  ((void (*)(void *))__29__ARSLAMState_initWithCoder___block_invoke)(v14);
  uint64_t v7 = self;
LABEL_10:

  return v7;
}

uint64_t __29__ARSLAMState_initWithCoder___block_invoke()
{
  return CV3DSLAMStateRelease();
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CV3DSLAMStateContext)slamState
{
  return self->_slamState;
}

@end