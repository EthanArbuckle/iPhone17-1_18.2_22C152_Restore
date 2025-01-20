@interface ABPKMLModelConfiguration2DStandard
- (ABPKMLModelConfiguration2DStandard)init;
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

@implementation ABPKMLModelConfiguration2DStandard

- (ABPKMLModelConfiguration2DStandard)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration2DStandard;
  v2 = [(ABPKMLModelConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [NSString stringWithUTF8String:kABPK2D19JointsFlickrFullPreD5xNetworkName];
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
  v4[0] = kABPK2D19JointsFlickrFullPreD5xInputTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK2D19JointsFlickrFullPreD5xOutputHeatmapsTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (CGSize)inputDimensions
{
  [(ABPKMLModelConfiguration2DStandard *)self inputDimensionsForABPKDeviceOrientation:3];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)inputDimensionsForABPKDeviceOrientation:(int64_t)a3
{
  if (ABPKDeviceOrientationIsLandscape(a3))
  {
    double v4 = 256.0;
    double v5 = 192.0;
  }
  else
  {
    BOOL IsPortrait = ABPKDeviceOrientationIsPortrait(a3);
    if (IsPortrait) {
      double v5 = 256.0;
    }
    else {
      double v5 = 0.0;
    }
    double v4 = 192.0;
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
    double v4 = kABPK2D19JointsFlickrFullPreD5xLandscapeConfigMode;
LABEL_5:
    double v5 = *v4;
    goto LABEL_7;
  }
  if (ABPKDeviceOrientationIsPortrait(a3))
  {
    double v4 = kABPK2D19JointsFlickrFullPreD5xPortraitConfigMode;
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:
  return v5;
}

- (float)biasR
{
  return *(float *)&kABPK19JointsFlickrFullPreD5xBiasR;
}

- (float)biasG
{
  return *(float *)&kABPK19JointsFlickrFullPreD5xBiasG;
}

- (float)biasB
{
  return *(float *)&kABPK19JointsFlickrFullPreD5xBiasB;
}

- (float)scale
{
  return *(float *)&kABPK19JointsFlickrFullPreD5xScale;
}

- (BOOL)networkWantsBGR
{
  return kABPK19JointsFlickrFullPreD5xNetworkTakesBGR;
}

- (BOOL)applyPreProcessing
{
  return kABPK19JointsFlickrFullPreD5xApplyPreProcessing;
}

- (unsigned)heatMapChannels
{
  return kABPK19JointsFlickrFullPreD5xHeatMapChannels;
}

- (unsigned)affinityMapChannels
{
  return kABPK19JointsFlickrFullPreD5xAffinityMapChannels;
}

- (BOOL)networkEstimatesAffinityMaps
{
  return kABPK19JointsFlickrFullPreD5xNetworkEstimatesAffinityMaps;
}

- (void).cxx_destruct
{
}

@end