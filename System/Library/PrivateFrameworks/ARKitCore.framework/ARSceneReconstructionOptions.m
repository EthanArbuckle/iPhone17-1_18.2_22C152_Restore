@interface ARSceneReconstructionOptions
- (ARSceneReconstructionOptions)init;
- (BOOL)deterministicMode;
- (BOOL)enableOccupancyMapping;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowQosSchedulingEnabled;
- (float)minDepthUncertaintyThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bucketsCount;
- (int64_t)preset;
- (int64_t)voxelSize;
- (void)setBucketsCount:(int64_t)a3;
- (void)setDeterministicMode:(BOOL)a3;
- (void)setEnableOccupancyMapping:(BOOL)a3;
- (void)setLowQosSchedulingEnabled:(BOOL)a3;
- (void)setMinDepthUncertaintyThreshold:(float)a3;
- (void)setPreset:(int64_t)a3;
- (void)setVoxelSize:(int64_t)a3;
@end

@implementation ARSceneReconstructionOptions

- (ARSceneReconstructionOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARSceneReconstructionOptions;
  v2 = [(ARSceneReconstructionOptions *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_voxelSize = 0;
    v2->_bucketsCount = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.sceneReconstruction.bucketsCount"];
    v3->_preset = 2;
    v3->_deterministicMode = 0;
    v3->_lowQosSchedulingEnabled = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.sceneReconstruction.enableLowQosScheduling"];
    v3->_enableOccupancyMapping = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.sceneReconstruction.enableOccupancyMapping"];
    v3->_minDepthUncertaintyThreshold = 1.0;
  }
  return v3;
}

- (void)setPreset:(int64_t)a3
{
  self->_preset = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 3) = self->_voxelSize;
  *((void *)result + 4) = self->_bucketsCount;
  *((void *)result + 2) = self->_preset;
  *((unsigned char *)result + 8) = self->_deterministicMode;
  *((unsigned char *)result + 9) = self->_lowQosSchedulingEnabled;
  *((unsigned char *)result + 10) = self->_enableOccupancyMapping;
  *((_DWORD *)result + 3) = LODWORD(self->_minDepthUncertaintyThreshold);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int64_t v6 = [(ARSceneReconstructionOptions *)self voxelSize];
    if (v6 == [v5 voxelSize]
      && (int64_t v7 = -[ARSceneReconstructionOptions bucketsCount](self, "bucketsCount"), v7 == [v5 bucketsCount])&& (v8 = -[ARSceneReconstructionOptions preset](self, "preset"), v8 == objc_msgSend(v5, "preset"))&& (v9 = -[ARSceneReconstructionOptions deterministicMode](self, "deterministicMode"), v9 == objc_msgSend(v5, "deterministicMode"))&& (v10 = -[ARSceneReconstructionOptions lowQosSchedulingEnabled](self, "lowQosSchedulingEnabled"), v10 == objc_msgSend(v5, "lowQosSchedulingEnabled"))&& (v11 = -[ARSceneReconstructionOptions enableOccupancyMapping](self, "enableOccupancyMapping"), v11 == objc_msgSend(v5, "enableOccupancyMapping")))
    {
      [(ARSceneReconstructionOptions *)self minDepthUncertaintyThreshold];
      float v15 = v14;
      [v5 minDepthUncertaintyThreshold];
      BOOL v12 = v15 == v16;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int64_t)preset
{
  return self->_preset;
}

- (int64_t)voxelSize
{
  return self->_voxelSize;
}

- (void)setVoxelSize:(int64_t)a3
{
  self->_voxelSize = a3;
}

- (int64_t)bucketsCount
{
  return self->_bucketsCount;
}

- (void)setBucketsCount:(int64_t)a3
{
  self->_bucketsCount = a3;
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (void)setDeterministicMode:(BOOL)a3
{
  self->_deterministicMode = a3;
}

- (BOOL)lowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)enableOccupancyMapping
{
  return self->_enableOccupancyMapping;
}

- (void)setEnableOccupancyMapping:(BOOL)a3
{
  self->_enableOccupancyMapping = a3;
}

- (float)minDepthUncertaintyThreshold
{
  return self->_minDepthUncertaintyThreshold;
}

- (void)setMinDepthUncertaintyThreshold:(float)a3
{
  self->_minDepthUncertaintyThreshold = a3;
}

@end