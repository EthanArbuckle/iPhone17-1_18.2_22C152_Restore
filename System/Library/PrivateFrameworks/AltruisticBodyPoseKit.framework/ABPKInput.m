@interface ABPKInput
- (ABPKCameraParams)cameraParams;
- (ABPKInput)init;
- (BOOL)isDepthDataValid;
- (BOOL)isVioPoseValid;
- (__CVBuffer)depthConfidenceBuffer;
- (__CVBuffer)depthMap;
- (__CVBuffer)image;
- (double)timestamp;
- (double)vioPose;
- (int)saveDataToDir:(id)a3 withFileNamePrefix:(id)a4;
- (void)setCameraParams:(id)a3;
- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3;
- (void)setDepthMap:(__CVBuffer *)a3;
- (void)setImage:(__CVBuffer *)a3;
- (void)setIsDepthDataValid:(BOOL)a3;
- (void)setIsVioPoseValid:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setVioPose:(__n128)a3;
@end

@implementation ABPKInput

- (ABPKInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABPKInput;
  result = [(ABPKInput *)&v3 init];
  if (result)
  {
    result->_isDepthDataValid = 0;
    result->_depthMap = 0;
    result->_depthConfidenceBuffer = 0;
  }
  return result;
}

- (int)saveDataToDir:(id)a3 withFileNamePrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ABPKInput *)self timestamp];
  uint64_t v9 = v8;
  v31 = [NSString stringWithFormat:@"%@_%@_%f.png", v7, @"image", v8];
  v30 = [v6 stringByAppendingPathComponent:v31];
  writeImage([(ABPKInput *)self image], v30);
  v32 = getPixelBufferFormatTypeAsString(self->_depthMap);
  v29 = [NSString stringWithFormat:@"%@_%@_%f.png", v7, @"depth", v9];
  v28 = [v6 stringByAppendingPathComponent:v29];
  saveDepthBufferToFile([(ABPKInput *)self depthMap], v28, 10000.0);
  v10 = getPixelBufferFormatTypeAsString(self->_depthConfidenceBuffer);
  v27 = [NSString stringWithFormat:@"%@_%@_%f.png", v7, @"depth_confidence", v9];
  v11 = [v6 stringByAppendingPathComponent:v27];
  saveDepthBufferToFile([(ABPKInput *)self depthConfidenceBuffer], v11, 10000.0);
  v12 = [NSString stringWithFormat:@"%@_inputs_%f.plist", v7, v9];
  v13 = [v6 stringByAppendingPathComponent:v12];
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v14 setObject:v32 forKey:@"depth_map_type"];
  [v14 setObject:v10 forKey:@"depth_confidence_map_type"];
  [v14 setObject:v32 forKey:@"depth_confidence_map_type"];
  [v14 setObject:v10 forKey:@"depth_confidence_map_type"];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ABPKInput isDepthDataValid](self, "isDepthDataValid"));
  [v14 setObject:v15 forKey:@"depth_valid"];

  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ABPKInput isVioPoseValid](self, "isVioPoseValid"));
  [v14 setObject:v16 forKey:@"vio_pose_valid"];

  [(ABPKInput *)self vioPose];
  v21 = simdMatrix4x4ToNSMat(v17, v18, v19, v20);
  [v14 setObject:v21 forKey:@"vio_pose"];

  v22 = NSNumber;
  [(ABPKInput *)self timestamp];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  [v14 setObject:v23 forKey:@"timestamp"];

  v24 = [(ABPKInput *)self cameraParams];
  v25 = [v24 toDict];
  [v14 setObject:v25 forKey:@"camera_params"];

  [v14 writeToFile:v13 atomically:0];
  return 0;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

- (__CVBuffer)depthMap
{
  return self->_depthMap;
}

- (void)setDepthMap:(__CVBuffer *)a3
{
  self->_depthMap = a3;
}

- (__CVBuffer)depthConfidenceBuffer
{
  return self->_depthConfidenceBuffer;
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  self->_depthConfidenceBuffer = a3;
}

- (BOOL)isDepthDataValid
{
  return self->_isDepthDataValid;
}

- (void)setIsDepthDataValid:(BOOL)a3
{
  self->_isDepthDataValid = a3;
}

- (double)vioPose
{
  objc_copyStruct(&v2, (const void *)(a1 + 64), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setVioPose:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 64), v5, 64, 1, 0);
}

- (BOOL)isVioPoseValid
{
  return self->_isVioPoseValid;
}

- (void)setIsVioPoseValid:(BOOL)a3
{
  self->_isVioPoseValid = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ABPKCameraParams)cameraParams
{
  return (ABPKCameraParams *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCameraParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end