@interface ABPKMLModelConfiguration2DBreakthrough
- (ABPKMLModelConfiguration2DBreakthrough)init;
- (BOOL)applyPreProcessing;
- (BOOL)networkEstimatesAffinityMaps;
- (BOOL)networkWantsBGR;
- (CGSize)inputDimensions;
- (CGSize)inputDimensionsForABPKDeviceOrientation:(int64_t)a3;
- (float)biasB;
- (float)biasG;
- (float)biasR;
- (float)scale;
- (id)compiledMLModelPath;
- (id)configStringForABPKDeviceOrientation:(int64_t)a3;
- (id)inputTensorNames;
- (id)outputTensorNames;
- (unsigned)affinityMapChannels;
- (unsigned)heatMapChannels;
@end

@implementation ABPKMLModelConfiguration2DBreakthrough

- (ABPKMLModelConfiguration2DBreakthrough)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration2DBreakthrough;
  v2 = [(ABPKMLModelConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [NSString stringWithUTF8String:kABPK2DBreakthroughNetworkName];
    uint64_t v5 = ABPKMLModelPath(v3, v4, 1);
    mlModelPath = v2->_mlModelPath;
    v2->_mlModelPath = (NSString *)v5;
  }
  return v2;
}

- (id)compiledMLModelPath
{
  return self->_mlModelPath;
}

- (id)inputTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK2DBreakthroughInputTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputTensorNames
{
  void v4[2] = *MEMORY[0x263EF8340];
  v4[0] = kABPK2DBreakthroughOutputHeatmapsTensorName;
  v4[1] = kABPK2DBreakthroughOutputAffinityMapsTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (CGSize)inputDimensions
{
  [(ABPKMLModelConfiguration2DBreakthrough *)self inputDimensionsForABPKDeviceOrientation:3];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)inputDimensionsForABPKDeviceOrientation:(int64_t)a3
{
  if (ABPKDeviceOrientationIsLandscape(a3))
  {
    double v4 = 384.0;
    double v5 = 288.0;
  }
  else
  {
    BOOL IsPortrait = ABPKDeviceOrientationIsPortrait(a3);
    if (IsPortrait) {
      double v5 = 384.0;
    }
    else {
      double v5 = 0.0;
    }
    double v4 = 288.0;
    if (!IsPortrait) {
      double v4 = 0.0;
    }
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)configStringForABPKDeviceOrientation:(int64_t)a3
{
  if (ABPKDeviceOrientationIsLandscape(a3))
  {
    double v4 = &kABPK2DBreakthroughLandscapeConfigMode;
LABEL_5:
    double v5 = *v4;
    goto LABEL_7;
  }
  if (ABPKDeviceOrientationIsPortrait(a3))
  {
    double v4 = kABPK2DBreakthroughPortraitConfigMode;
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:
  return v5;
}

- (float)biasR
{
  return *(float *)&kABPK2DBreakthroughBiasR;
}

- (float)biasG
{
  return *(float *)&kABPK2DBreakthroughBiasG;
}

- (float)biasB
{
  return *(float *)&kABPK2DBreakthroughBiasB;
}

- (float)scale
{
  return *(float *)&kABPK2DBreakthroughScale;
}

- (BOOL)networkWantsBGR
{
  return kABPK2DBreakthroughNetworkTakesBGR;
}

- (BOOL)applyPreProcessing
{
  return kABPK2DBreakthroughApplyPreProcessing;
}

- (unsigned)heatMapChannels
{
  return kABPK2DBreakthroughHeatMapChannels;
}

- (unsigned)affinityMapChannels
{
  return kABPK2DBreakthroughAffinityMapChannels;
}

- (BOOL)networkEstimatesAffinityMaps
{
  return kABPK2DBreakthroughNetworkEstimatesAffinityMaps;
}

- (void).cxx_destruct
{
}

@end