@interface ARPointCloudSensorData
+ (BOOL)supportsSecureCoding;
- (ADJasperPointCloud)pointCloud;
- (ARPointCloudSensorData)initWithCoder:(id)a3;
- (ARPointCloudSensorData)initWithPointCloudData:(id)a3 captureFramePerSecond:(int64_t)a4 captureDevice:(id)a5 captureSession:(id)a6;
- (ARPointCloudSensorData)initWithPointCloudData:(id)a3 projectorMode:(int64_t)a4 timestamp:(double)a5;
- (NSString)cameraType;
- (__n128)cameraTransform;
- (__n128)extrinsicsToWideSensor;
- (__n128)setCameraTransform:(__n128)a3;
- (__n128)setExtrinsicsToWideSensor:(__n128)a3;
- (__n128)visionCameraTransform;
- (double)setVisionCameraTransform:(uint64_t)a1;
- (double)timestamp;
- (id)pointCloudData;
- (int64_t)cameraPosition;
- (int64_t)projectorMode;
- (void)encodeWithCoder:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARPointCloudSensorData

- (ARPointCloudSensorData)initWithPointCloudData:(id)a3 captureFramePerSecond:(int64_t)a4 captureDevice:(id)a5 captureSession:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F4D810];
  id v11 = v8;
  v12 = objc_msgSend(v10, "makeWithDataBuffer:", objc_msgSend(v11, "pointCloudDataBuffer"));
  if (v12)
  {
    v27.receiver = self;
    v27.super_class = (Class)ARPointCloudSensorData;
    v13 = [(ARPointCloudSensorData *)&v27 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_pointCloudData, v11);
      objc_storeStrong((id *)&v14->_pointCloud, v12);
      uint64_t v15 = [v9 deviceType];
      cameraType = v14->_cameraType;
      v14->_cameraType = (NSString *)v15;

      v14->_cameraPosition = [v9 position];
      v14->_projectorMode = [(AVPointCloudData *)v14->_pointCloudData projectorMode];
      v17 = ARPixelBufferGetMetadata((__CVBuffer *)[v11 pointCloudDataBuffer]);
      v18 = v17;
      if (v17)
      {
        CFDictionaryRef v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F51490]];
        CMTimeMakeFromDictionary(&time, v19);
        v14->_timestamp = CMTimeGetSeconds(&time);
      }
    }
    self = v14;
    v20 = self;
  }
  else
  {
    if (_ARLogGeneral_onceToken_51 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_51, &__block_literal_global_117);
    }
    v21 = (void *)_ARLogGeneral_logObj_51;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_51, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      __int16 v30 = 2048;
      v31 = self;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't generate pointcloud from pointcloud data", buf, 0x16u);
    }
    v20 = 0;
  }

  return v20;
}

- (ARPointCloudSensorData)initWithPointCloudData:(id)a3 projectorMode:(int64_t)a4 timestamp:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARPointCloudSensorData;
  v10 = [(ARPointCloudSensorData *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pointCloud, a3);
    v11->_projectorMode = a4;
    v11->_timestamp = a5;
  }

  return v11;
}

- (id)pointCloudData
{
  return self->_pointCloudData;
}

- (int64_t)projectorMode
{
  return self->_projectorMode;
}

- (double)setVisionCameraTransform:(uint64_t)a1
{
  *(simd_float4x4 *)(a1 + 64) = a2;
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
  *(float32x4_t *)(a1 + 128) = v29;
  *(float32x4_t *)(a1 + 144) = v14;
  *(float32x4_t *)(a1 + 160) = v15;
  *(float32x4_t *)(a1 + 176) = v16;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARPointCloudSensorData)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARPointCloudSensorData;
  float32x4_t v5 = [(ARPointCloudSensorData *)&v21 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"visionCameraTransform");
    *(_OWORD *)v5->_anon_40 = v7;
    *(_OWORD *)&v5->_anon_40[16] = v8;
    *(_OWORD *)&v5->_anon_40[32] = v9;
    *(_OWORD *)&v5->_anon_40[48] = v10;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"cameraTransform");
    *(_OWORD *)v5->_anon_80 = v11;
    *(_OWORD *)&v5->_anon_80[16] = v12;
    *(_OWORD *)&v5->_anon_80[32] = v13;
    *(_OWORD *)&v5->_anon_80[48] = v14;
    v5->_cameraPosition = [v4 decodeIntegerForKey:@"cameraPosition"];
    uint64_t v15 = [v4 decodeObjectForKey:@"cameraType"];
    cameraType = v5->_cameraType;
    v5->_cameraType = (NSString *)v15;

    simd_float4 v17 = [v4 decodeObjectForKey:@"pointCloud"];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F4D810]) initWithDictionaryRepresentation:v17];
    pointCloud = v5->_pointCloud;
    v5->_pointCloud = (ADJasperPointCloud *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"visionCameraTransform", *(double *)self->_anon_40, *(double *)&self->_anon_40[16], *(double *)&self->_anon_40[32], *(double *)&self->_anon_40[48]);
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"cameraTransform", *(double *)self->_anon_80, *(double *)&self->_anon_80[16], *(double *)&self->_anon_80[32], *(double *)&self->_anon_80[48]);
  [v5 encodeInteger:self->_cameraPosition forKey:@"cameraPosition"];
  [v5 encodeObject:self->_cameraType forKey:@"cameraType"];
  id v6 = [(ADJasperPointCloud *)self->_pointCloud dictionaryRepresentation];
  [v5 encodeObject:v6 forKey:@"pointCloud"];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (__n128)visionCameraTransform
{
  return a1[4];
}

- (__n128)cameraTransform
{
  return a1[8];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (ADJasperPointCloud)pointCloud
{
  return self->_pointCloud;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (NSString)cameraType
{
  return self->_cameraType;
}

- (__n128)extrinsicsToWideSensor
{
  return a1[12];
}

- (__n128)setExtrinsicsToWideSensor:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraType, 0);
  objc_storeStrong((id *)&self->_pointCloud, 0);
  objc_storeStrong((id *)&self->_pointCloudData, 0);
}

@end