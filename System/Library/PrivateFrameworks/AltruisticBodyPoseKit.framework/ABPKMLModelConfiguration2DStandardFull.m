@interface ABPKMLModelConfiguration2DStandardFull
- (ABPKMLModelConfiguration2DStandardFull)init;
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

@implementation ABPKMLModelConfiguration2DStandardFull

- (ABPKMLModelConfiguration2DStandardFull)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration2DStandardFull;
  v2 = [(ABPKMLModelConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [NSString stringWithUTF8String:kABPK2D19JointsFlickrNetworkName];
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
  v4[0] = kABPK2D19JointsFlickrInputTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK2D19JointsFlickrOutputHeatmapsTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (CGSize)inputDimensions
{
  [(ABPKMLModelConfiguration2DStandardFull *)self inputDimensionsForABPKDeviceOrientation:3];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)inputDimensionsForABPKDeviceOrientation:(int64_t)a3
{
  if (ABPKDeviceOrientationIsLandscape(a3))
  {
    double v4 = 288.0;
    double v5 = 192.0;
  }
  else
  {
    BOOL IsPortrait = ABPKDeviceOrientationIsPortrait(a3);
    if (IsPortrait) {
      double v5 = 288.0;
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
    double v4 = kABPK2D19JointsFlickrLandscapeConfigMode;
LABEL_5:
    double v5 = *v4;
    goto LABEL_7;
  }
  if (ABPKDeviceOrientationIsPortrait(a3))
  {
    double v4 = kABPK2D19JointsFlickrPortraitConfigMode;
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:
  return v5;
}

- (float)biasR
{
  return *(float *)&kABPK19JointsFlickrBiasR;
}

- (float)biasG
{
  return *(float *)&kABPK19JointsFlickrBiasG;
}

- (float)biasB
{
  return *(float *)&kABPK19JointsFlickrBiasB;
}

- (float)scale
{
  return *(float *)&kABPK19JointsFlickrScale;
}

- (BOOL)networkWantsBGR
{
  return kABPK19JointsFlickrNetworkTakesBGR;
}

- (BOOL)applyPreProcessing
{
  return kABPK19JointsFlickrApplyPreProcessing;
}

- (unsigned)heatMapChannels
{
  return kABPK19JointsFlickrHeatMapChannels;
}

- (unsigned)affinityMapChannels
{
  return kABPK19JointsFlickrAffinityMapChannels;
}

- (BOOL)networkEstimatesAffinityMaps
{
  return kABPK19JointsFlickrNetworkEstimatesAffinityMaps;
}

- (void).cxx_destruct
{
}

@end