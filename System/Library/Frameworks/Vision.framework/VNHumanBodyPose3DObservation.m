@interface VNHumanBodyPose3DObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)getCameraRelativePosition:(simd_float4x4 *)modelPositionOut forJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error;
- (CGSize)_inputSize;
- (NSArray)availableJointsGroupNames;
- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanBodyPose3DObservationJointsGroupName)jointsGroupName error:(NSError *)error;
- (VNHumanBodyPose3DObservationHeightEstimation)heightEstimation;
- (VNHumanBodyPose3DObservationJointName)parentJointNameForJointName:(VNHumanBodyPose3DObservationJointName)jointName;
- (VNHumanBodyRecognizedPoint3D)recognizedPointForJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error;
- (VNPoint)pointInImageForJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error;
- (__n128)_cameraIntrinsics;
- (__n128)_cameraRootTransform;
- (float)bodyHeight;
- (id)debugQuickLookObject;
- (simd_float4x4)cameraOriginMatrix;
- (void)_addAllJointsToPath:(double)a3 imageSize:(double)a4;
@end

@implementation VNHumanBodyPose3DObservation

- (void).cxx_destruct
{
}

- (NSArray)availableJointsGroupNames
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (id)debugQuickLookObject
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CGMutablePathRef Mutable = CGPathCreateMutable();
  if (Mutable)
  {
    v4 = Mutable;
    v12.receiver = self;
    v12.super_class = (Class)VNHumanBodyPose3DObservation;
    v5 = [(VNObservation *)&v12 debugQuickLookObject];
    v6 = v5;
    if (v5)
    {
      double v7 = VNDebugImageSizeFromObject(v5);
      [(VNHumanBodyPose3DObservation *)self _addAllJointsToPath:v7 imageSize:v8];
      v13[0] = xmmword_1A4125548;
      v13[1] = unk_1A4125558;
      v9 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v13);
      VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v6, v9);
    }
    else
    {
      [(VNHumanBodyPose3DObservation *)self _addAllJointsToPath:512.0 imageSize:512.0];
      VNDebugPathFromNormalizedCGPath((uint64_t)v4, 512.0, 512.0);
    v10 = };

    CGPathRelease(v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_addAllJointsToPath:(double)a3 imageSize:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 availableJointNames];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = 0;
      double v11 = 7.0 / a3;
      double v12 = 7.0 / a4;
      uint64_t v13 = *(void *)v23;
      do
      {
        uint64_t v14 = 0;
        v15 = v10;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
          id v21 = v15;
          v17 = [a1 pointInImageForJointName:v16 error:&v21];
          id v10 = v21;

          [v17 location];
          double v19 = v18;
          [v17 location];
          v28.origin.x = v19 - v11 * 0.5;
          v28.origin.y = v20 - v12 * 0.5;
          v28.size.width = v11;
          v28.size.height = v12;
          CGPathAddEllipseInRect(a2, 0, v28);

          ++v14;
          v15 = v10;
        }
        while (v9 != v14);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
  }
}

- (VNHumanBodyPose3DObservationHeightEstimation)heightEstimation
{
  v2 = [(VNRecognizedPoints3DObservation *)self recognizedPointsSpecifier];
  [v2 heightEstimatedScale];
  VNHumanBodyPose3DObservationHeightEstimation v4 = (unint64_t)(v3 != -1.0);

  return v4;
}

- (CGSize)_inputSize
{
  v2 = [(VNRecognizedPoints3DObservation *)self recognizedPointsSpecifier];
  [v2 inputSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (__n128)_cameraIntrinsics
{
  v1 = [a1 recognizedPointsSpecifier];
  [v1 cameraIntrinsics];
  long long v4 = v2;

  return (__n128)v4;
}

- (__n128)_cameraRootTransform
{
  v1 = [a1 recognizedPointsSpecifier];
  [v1 cameraTransformMatrix];
  long long v4 = v2;

  return (__n128)v4;
}

- (simd_float4x4)cameraOriginMatrix
{
  long long v2 = [(VNRecognizedPoints3DObservation *)self recognizedPointsSpecifier];
  [v2 cameraRenderTransformMatrix];
  simd_float4 v14 = v3;
  simd_float4 v12 = v5;
  simd_float4 v13 = v4;
  simd_float4 v11 = v6;

  simd_float4 v7 = v14;
  simd_float4 v9 = v12;
  simd_float4 v8 = v13;
  simd_float4 v10 = v11;
  result.columns[3] = v10;
  result.columns[2] = v9;
  result.columns[1] = v8;
  result.columns[0] = v7;
  return result;
}

- (float)bodyHeight
{
  long long v2 = [(VNRecognizedPoints3DObservation *)self recognizedPointsSpecifier];
  [v2 bodyHeight];
  float v4 = v3;

  return v4;
}

- (VNPoint)pointInImageForJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error
{
  simd_float4 v5 = [(VNHumanBodyPose3DObservation *)self recognizedPointForJointName:jointName error:error];
  simd_float4 v6 = v5;
  if (v5)
  {
    [v5 position];
    if (self)
    {
      simd_float4 v7 = [(VNRecognizedPoints3DObservation *)self recognizedPointsSpecifier];
      [v7 cameraIntrinsics];
      long long v17 = v9;
      long long v18 = v8;
      long long v16 = v10;

      [(VNHumanBodyPose3DObservation *)self _cameraRootTransform];
    }
    simd_float4 v11 = [(VNRecognizedPoints3DObservation *)self recognizedPointsSpecifier];
    [v11 inputSize];

    VisionCoreNormalizedPointForImagePoint();
    simd_float4 v14 = [[VNPoint alloc] initWithX:v13 y:1.0 - v12];
  }
  else
  {
    simd_float4 v14 = 0;
  }

  return v14;
}

- (BOOL)getCameraRelativePosition:(simd_float4x4 *)modelPositionOut forJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error
{
  long long v8 = [(VNHumanBodyPose3DObservation *)self recognizedPointForJointName:jointName error:error];
  [v8 position];
  float32x4_t v25 = v10;
  float32x4_t v26 = v9;
  float32x4_t v23 = v12;
  float32x4_t v24 = v11;
  double v13 = *error;
  if (!v13)
  {
    [(VNHumanBodyPose3DObservation *)self _cameraRootTransform];
    uint64_t v14 = 0;
    v27[0] = v15;
    v27[1] = v16;
    v27[2] = v17;
    v27[3] = v18;
    do
    {
      v28[v14] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(v27[v14])), v25, *(float32x2_t *)&v27[v14], 1), v24, (float32x4_t)v27[v14], 2), v23, (float32x4_t)v27[v14], 3);
      ++v14;
    }
    while (v14 != 4);
    simd_float4 v19 = (simd_float4)v28[1];
    simd_float4 v20 = (simd_float4)v28[2];
    simd_float4 v21 = (simd_float4)v28[3];
    modelPositionOut->columns[0] = (simd_float4)v28[0];
    modelPositionOut->columns[1] = v19;
    modelPositionOut->columns[2] = v20;
    modelPositionOut->columns[3] = v21;
  }

  return v13 == 0;
}

- (VNHumanBodyRecognizedPoint3D)recognizedPointForJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error
{
  float v4 = [(VNRecognizedPoints3DObservation *)self recognizedPointForKey:jointName error:error];

  return (VNHumanBodyRecognizedPoint3D *)v4;
}

- (VNHumanBodyPose3DObservationJointName)parentJointNameForJointName:(VNHumanBodyPose3DObservationJointName)jointName
{
  float v3 = [(VNRecognizedPoints3DObservation *)self recognizedPointForKey:jointName error:0];
  float v4 = [v3 parentJoint];

  return (VNHumanBodyPose3DObservationJointName)v4;
}

- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanBodyPose3DObservationJointsGroupName)jointsGroupName error:(NSError *)error
{
  float v4 = [(VNRecognizedPoints3DObservation *)self recognizedPointsForGroupKey:jointsGroupName error:error];

  return (NSDictionary *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end