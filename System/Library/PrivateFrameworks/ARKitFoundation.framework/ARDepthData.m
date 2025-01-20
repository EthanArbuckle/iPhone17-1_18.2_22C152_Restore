@interface ARDepthData
+ (BOOL)supportsSecureCoding;
- (ADCameraCalibration)adCameraCalibration;
- (ARDepthData)initWithCoder:(id)a3;
- (ARDepthData)initWithDepthMap:(__CVBuffer *)a3 confidenceMap:(__CVBuffer *)a4;
- (BOOL)isValid;
- (CVPixelBufferRef)confidenceMap;
- (CVPixelBufferRef)depthMap;
- (__CVBuffer)confidenceBuffer;
- (__CVBuffer)normalsBuffer;
- (__n128)cameraIntrinsics;
- (__n128)deviceTransform;
- (__n128)extrinsicsToAppNode;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (__n128)setDeviceTransform:(__n128)a3;
- (__n128)setExtrinsicsToAppNode:(__n128)a3;
- (double)timestamp;
- (int64_t)depthSensorsState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdCameraCalibration:(id)a3;
- (void)setConfidenceBuffer:(__CVBuffer *)a3;
- (void)setConfidenceMap:(__CVBuffer *)a3;
- (void)setDepthMap:(__CVBuffer *)a3;
- (void)setDepthSensorsState:(int64_t)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setNormalsBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARDepthData

- (ARDepthData)initWithDepthMap:(__CVBuffer *)a3 confidenceMap:(__CVBuffer *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ARDepthData;
  v6 = [(ARDepthData *)&v8 init];
  if (v6)
  {
    v6->_depthMap = CVPixelBufferRetain(a3);
    v6->_confidenceMap = CVPixelBufferRetain(a4);
    v6->_isValid = 1;
  }
  return v6;
}

- (void)setDepthMap:(__CVBuffer *)a3
{
  depthMap = self->_depthMap;
  if (depthMap != a3)
  {
    CVPixelBufferRelease(depthMap);
    self->_depthMap = CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceMap:(__CVBuffer *)a3
{
  confidenceMap = self->_confidenceMap;
  if (confidenceMap != a3)
  {
    CVPixelBufferRelease(confidenceMap);
    self->_confidenceMap = CVPixelBufferRetain(a3);
  }
}

- (void)setNormalsBuffer:(__CVBuffer *)a3
{
  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer != a3)
  {
    CVPixelBufferRelease(normalsBuffer);
    self->_normalsBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceBuffer:(__CVBuffer *)a3
{
  confidenceBuffer = self->_confidenceBuffer;
  if (confidenceBuffer != a3)
  {
    CVPixelBufferRelease(confidenceBuffer);
    self->_confidenceBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_depthMap);
  CVPixelBufferRelease(self->_confidenceMap);
  CVPixelBufferRelease(self->_confidenceBuffer);
  CVPixelBufferRelease(self->_normalsBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARDepthData;
  [(ARDepthData *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARDepthData)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARDepthData;
  v5 = [(ARDepthData *)&v24 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v4;
      v5->_depthMap = (__CVBuffer *)objc_msgSend(v7, "ar_decodePixelBufferForKey:", @"depthMap");
      v5->_confidenceMap = (__CVBuffer *)objc_msgSend(v7, "ar_decodePixelBufferForKey:", @"confidenceMap");
      v5->_confidenceBuffer = (__CVBuffer *)objc_msgSend(v7, "ar_decodePixelBufferForKey:", @"confidenceBuffer");
      uint64_t v8 = objc_msgSend(v7, "ar_decodePixelBufferForKey:", @"normalsBuffer");

      v5->_normalsBuffer = (__CVBuffer *)v8;
    }
    objc_msgSend(v4, "ar_decodeMatrix3x3ForKey:", @"cameraIntrinsics");
    *(_DWORD *)&v5->_anon_50[8] = v9;
    *(_DWORD *)&v5->_anon_50[24] = v10;
    *(void *)v5->_anon_50 = v11;
    *(void *)&v5->_anon_50[16] = v12;
    *(_DWORD *)&v5->_anon_50[40] = v13;
    *(void *)&v5->_anon_50[32] = v14;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"extrinsicsToAppNode");
    *(_OWORD *)v5->_anon_80 = v15;
    *(_OWORD *)&v5->_anon_80[16] = v16;
    *(_OWORD *)&v5->_anon_80[32] = v17;
    *(_OWORD *)&v5->_anon_80[48] = v18;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"deviceTransform");
    *(_OWORD *)&v5[1].super.isa = v19;
    *(_OWORD *)&v5[1]._depthMap = v20;
    *(_OWORD *)&v5[1]._normalsBuffer = v21;
    *(_OWORD *)&v5[1]._timestamp = v22;
    v5->_isValid = [v4 decodeBoolForKey:@"isValid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeDouble:@"timestamp" forKey:self->_timestamp];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    depthMap = self->_depthMap;
    id v5 = v6;
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", depthMap, @"depthMap");
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", self->_confidenceMap, @"confidenceMap");
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", self->_confidenceBuffer, @"confidenceBuffer");
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", self->_normalsBuffer, @"normalsBuffer");
  }
  objc_msgSend(v6, "ar_encodeMatrix3x3:forKey:", @"cameraIntrinsics", *(double *)self->_anon_50, *(double *)&self->_anon_50[16], *(double *)&self->_anon_50[32]);
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", @"extrinsicsToAppNode", *(double *)self->_anon_80, *(double *)&self->_anon_80[16], *(double *)&self->_anon_80[32], *(double *)&self->_anon_80[48]);
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", @"deviceTransform", *(double *)&self[1].super.isa, *(double *)&self[1]._depthMap, *(double *)&self[1]._normalsBuffer, self[1]._timestamp);
  [v6 encodeBool:self->_isValid forKey:@"isValid"];
}

- (CVPixelBufferRef)depthMap
{
  return self->_depthMap;
}

- (CVPixelBufferRef)confidenceMap
{
  return self->_confidenceMap;
}

- (__CVBuffer)normalsBuffer
{
  return self->_normalsBuffer;
}

- (__CVBuffer)confidenceBuffer
{
  return self->_confidenceBuffer;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[5];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (__n128)extrinsicsToAppNode
{
  return a1[8];
}

- (__n128)setExtrinsicsToAppNode:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (__n128)deviceTransform
{
  return a1[12];
}

- (__n128)setDeviceTransform:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (ADCameraCalibration)adCameraCalibration
{
  return self->_adCameraCalibration;
}

- (void)setAdCameraCalibration:(id)a3
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (int64_t)depthSensorsState
{
  return self->_depthSensorsState;
}

- (void)setDepthSensorsState:(int64_t)a3
{
  self->_depthSensorsState = a3;
}

- (void).cxx_destruct
{
}

@end