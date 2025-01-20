@interface ARWorldTrackingPoseData
+ (BOOL)supportsSecureCoding;
- (ARLineCloud)lineCloud;
- (ARSLAMState)slamState;
- (ARVideoFormat)currentlyActiveVideoFormat;
- (ARWorldTrackingPoseData)initWithCoder:(id)a3;
- (ARWorldTrackingPoseData)initWithTimestamp:(double)a3;
- (ARWorldTrackingState)worldTrackingState;
- (BOOL)isEqual:(id)a3;
- (__n128)cameraTransform;
- (__n128)setCameraTransform:(__n128)a3;
- (__n128)visionCameraTransform;
- (double)currentStateTimestamp;
- (double)lastInertialTimestamp;
- (double)setVisionCameraTransform:(uint64_t)a1;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)worldMappingStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentStateTimestamp:(double)a3;
- (void)setCurrentlyActiveVideoFormat:(id)a3;
- (void)setLastInertialTimestamp:(double)a3;
- (void)setLineCloud:(id)a3;
- (void)setSlamState:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setWorldMappingStatus:(int64_t)a3;
- (void)setWorldTrackingState:(id)a3;
@end

@implementation ARWorldTrackingPoseData

- (ARWorldTrackingPoseData)initWithTimestamp:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ARWorldTrackingPoseData;
  v4 = [(ARWorldTrackingPoseData *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_timestamp = a3;
    uint64_t v6 = MEMORY[0x1E4F149A0];
    long long v7 = *MEMORY[0x1E4F149A0];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *(_OWORD *)v4->_anon_50 = *MEMORY[0x1E4F149A0];
    *(_OWORD *)&v4->_anon_50[16] = v8;
    long long v9 = *(_OWORD *)(v6 + 32);
    long long v10 = *(_OWORD *)(v6 + 48);
    *(_OWORD *)&v4->_anon_50[32] = v9;
    *(_OWORD *)&v4->_anon_50[48] = v10;
    *(_OWORD *)&v4[1].super.isa = v7;
    *(_OWORD *)&v4[1]._lastInertialTimestamp = v8;
    *(_OWORD *)&v4[1]._worldTrackingState = v9;
    *(_OWORD *)&v4[1]._currentlyActiveVideoFormat = v10;
    v4->_worldMappingStatus = 0;
    uint64_t v11 = objc_opt_new();
    worldTrackingState = v5->_worldTrackingState;
    v5->_worldTrackingState = (ARWorldTrackingState *)v11;

    [(ARWorldTrackingState *)v5->_worldTrackingState setState:0];
    [(ARWorldTrackingState *)v5->_worldTrackingState setReason:0];
  }
  return v5;
}

- (double)setVisionCameraTransform:(uint64_t)a1
{
  *(simd_float4x4 *)(a1 + 80) = a2;
  simd_float4x4 v33 = __invert_f4(a2);
  simd_float4 v21 = v33.columns[1];
  simd_float4 v23 = v33.columns[0];
  simd_float4 v17 = v33.columns[3];
  simd_float4 v19 = v33.columns[2];
  *(double *)v3.i64 = ARVisionToRenderingCoordinateTransform();
  unint64_t v7 = 0;
  simd_float4 v25 = v23;
  simd_float4 v26 = v21;
  simd_float4 v27 = v19;
  simd_float4 v28 = v17;
  float32x4_t v29 = 0u;
  float32x4_t v30 = 0u;
  float32x4_t v31 = 0u;
  float32x4_t v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v29 + v7) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v3, COERCE_FLOAT(*(_OWORD *)((char *)&v25 + v7))), v4, *(float32x2_t *)&v25.f32[v7 / 4], 1), v5, *(float32x4_t *)((char *)&v25 + v7), 2), v6, *(float32x4_t *)((char *)&v25 + v7), 3);
    v7 += 16;
  }
  while (v7 != 64);
  float32x4_t v22 = v30;
  float32x4_t v24 = v29;
  float32x4_t v18 = v32;
  float32x4_t v20 = v31;
  *(double *)v8.i64 = ARRenderingToVisionCameraCoordinateTransform();
  unint64_t v9 = 0;
  simd_float4 v25 = v8;
  simd_float4 v26 = v10;
  simd_float4 v27 = v11;
  simd_float4 v28 = v12;
  float32x4_t v29 = 0u;
  float32x4_t v30 = 0u;
  float32x4_t v31 = 0u;
  float32x4_t v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v29 + v9) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(*(_OWORD *)((char *)&v25 + v9))), v22, *(float32x2_t *)&v25.f32[v9 / 4], 1), v20, *(float32x4_t *)((char *)&v25 + v9), 2), v18, *(float32x4_t *)((char *)&v25 + v9), 3);
    v9 += 16;
  }
  while (v9 != 64);
  double result = *(double *)v29.i64;
  float32x4_t v14 = v30;
  float32x4_t v15 = v31;
  float32x4_t v16 = v32;
  *(float32x4_t *)(a1 + 144) = v29;
  *(float32x4_t *)(a1 + 160) = v14;
  *(float32x4_t *)(a1 + 176) = v15;
  *(float32x4_t *)(a1 + 192) = v16;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARWorldTrackingPoseData)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ARWorldTrackingPoseData;
  float32x4_t v5 = [(ARWorldTrackingPoseData *)&v22 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    [v4 decodeDoubleForKey:@"lastInertialTimestamp"];
    v5->_lastInertialTimestamp = v7;
    [v4 decodeDoubleForKey:@"currentStateTimestamp"];
    v5->_currentStateTimestamp = v8;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"visionCameraTransform");
    *(_OWORD *)v5->_anon_50 = v9;
    *(_OWORD *)&v5->_anon_50[16] = v10;
    *(_OWORD *)&v5->_anon_50[32] = v11;
    *(_OWORD *)&v5->_anon_50[48] = v12;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"cameraTransform");
    *(_OWORD *)&v5[1].super.isa = v13;
    *(_OWORD *)&v5[1]._lastInertialTimestamp = v14;
    *(_OWORD *)&v5[1]._worldTrackingState = v15;
    *(_OWORD *)&v5[1]._currentlyActiveVideoFormat = v16;
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"worldTrackingState"];
    worldTrackingState = v5->_worldTrackingState;
    v5->_worldTrackingState = (ARWorldTrackingState *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentlyActiveVideoFormat"];
    currentlyActiveVideoFormat = v5->_currentlyActiveVideoFormat;
    v5->_currentlyActiveVideoFormat = (ARVideoFormat *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeDouble:@"lastInertialTimestamp" forKey:self->_lastInertialTimestamp];
  [v5 encodeDouble:@"currentStateTimestamp" forKey:self->_currentStateTimestamp];
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"visionCameraTransform", *(double *)self->_anon_50, *(double *)&self->_anon_50[16], *(double *)&self->_anon_50[32], *(double *)&self->_anon_50[48]);
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"cameraTransform", *(double *)&self[1].super.isa, self[1]._lastInertialTimestamp, *(double *)&self[1]._worldTrackingState, *(double *)&self[1]._currentlyActiveVideoFormat);
  [v5 encodeObject:self->_worldTrackingState forKey:@"worldTrackingState"];
  [v5 encodeObject:self->_currentlyActiveVideoFormat forKey:@"currentlyActiveVideoFormat"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimestamp:", self->_timestamp);
  long long v6 = *(_OWORD *)&self[1]._currentlyActiveVideoFormat;
  long long v8 = *(_OWORD *)&self[1].super.isa;
  long long v7 = *(_OWORD *)&self[1]._lastInertialTimestamp;
  *(_OWORD *)(v5 + 176) = *(_OWORD *)&self[1]._worldTrackingState;
  *(_OWORD *)(v5 + 192) = v6;
  *(_OWORD *)(v5 + 144) = v8;
  *(_OWORD *)(v5 + 160) = v7;
  long long v9 = *(_OWORD *)self->_anon_50;
  long long v10 = *(_OWORD *)&self->_anon_50[16];
  long long v11 = *(_OWORD *)&self->_anon_50[48];
  *(_OWORD *)(v5 + 112) = *(_OWORD *)&self->_anon_50[32];
  *(_OWORD *)(v5 + 128) = v11;
  *(_OWORD *)(v5 + 80) = v9;
  *(_OWORD *)(v5 + 96) = v10;
  objc_storeStrong((id *)(v5 + 32), self->_worldTrackingState);
  *(void *)(v5 + 56) = self->_worldMappingStatus;
  id v12 = [(ARVideoFormat *)self->_currentlyActiveVideoFormat copyWithZone:a3];
  long long v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  id v14 = [(ARLineCloud *)self->_lineCloud copyWithZone:a3];
  long long v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  objc_storeStrong((id *)(v5 + 64), self->_slamState);
  *(double *)(v5 + 16) = self->_lastInertialTimestamp;
  *(double *)(v5 + 24) = self->_currentStateTimestamp;
  return (id)v5;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v6 = v5;
    BOOL v8 = vabdd_f64(self->_timestamp, *((double *)v5 + 1)) < 2.22044605e-16
      && vabdd_f64(self->_lastInertialTimestamp, *((double *)v5 + 2)) < 2.22044605e-16
      && vabdd_f64(self->_currentStateTimestamp, *((double *)v5 + 3)) < 2.22044605e-16
      && AREqualTransforms(*(float32x4_t *)self->_anon_50, *(float32x4_t *)&self->_anon_50[16], *(float32x4_t *)&self->_anon_50[32], *(float32x4_t *)&self->_anon_50[48], *((float32x4_t *)v5 + 5), *((float32x4_t *)v5 + 6), *((float32x4_t *)v5 + 7), *((float32x4_t *)v5 + 8))&& ((worldTrackingState = self->_worldTrackingState, worldTrackingState == (ARWorldTrackingState *)v6[4])|| -[ARWorldTrackingState isEqual:](worldTrackingState, "isEqual:"))&& self->_worldMappingStatus == v6[7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (double)lastInertialTimestamp
{
  return self->_lastInertialTimestamp;
}

- (void)setLastInertialTimestamp:(double)a3
{
  self->_lastInertialTimestamp = a3;
}

- (double)currentStateTimestamp
{
  return self->_currentStateTimestamp;
}

- (void)setCurrentStateTimestamp:(double)a3
{
  self->_currentStateTimestamp = a3;
}

- (__n128)visionCameraTransform
{
  return a1[5];
}

- (ARWorldTrackingState)worldTrackingState
{
  return self->_worldTrackingState;
}

- (void)setWorldTrackingState:(id)a3
{
}

- (ARLineCloud)lineCloud
{
  return self->_lineCloud;
}

- (void)setLineCloud:(id)a3
{
}

- (ARVideoFormat)currentlyActiveVideoFormat
{
  return self->_currentlyActiveVideoFormat;
}

- (void)setCurrentlyActiveVideoFormat:(id)a3
{
}

- (int64_t)worldMappingStatus
{
  return self->_worldMappingStatus;
}

- (void)setWorldMappingStatus:(int64_t)a3
{
  self->_worldMappingStatus = a3;
}

- (__n128)cameraTransform
{
  return a1[9];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (ARSLAMState)slamState
{
  return self->_slamState;
}

- (void)setSlamState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slamState, 0);
  objc_storeStrong((id *)&self->_currentlyActiveVideoFormat, 0);
  objc_storeStrong((id *)&self->_lineCloud, 0);
  objc_storeStrong((id *)&self->_worldTrackingState, 0);
}

@end