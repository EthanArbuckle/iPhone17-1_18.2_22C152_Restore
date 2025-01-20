@interface ABPKMLModelConfiguration2DEnrollmentAnadrolMCAM
- (ABPKMLModelConfiguration2DEnrollmentAnadrolMCAM)init;
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

@implementation ABPKMLModelConfiguration2DEnrollmentAnadrolMCAM

- (ABPKMLModelConfiguration2DEnrollmentAnadrolMCAM)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration2DEnrollmentAnadrolMCAM;
  v2 = [(ABPKMLModelConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [NSString stringWithUTF8String:kABPK2DMCAMEnrollmentAnadrolNetworkName];
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
  v4[0] = kABPK2DMCAMEnrollmentAnadrolInputTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK2DMCAMEnrollmentAnadrolOutputHeatmapsTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (CGSize)inputDimensions
{
  [(ABPKMLModelConfiguration2DEnrollmentAnadrolMCAM *)self inputDimensionsForABPKDeviceOrientation:3];
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
    double v4 = kABPK2DMCAMEnrollmentAnadrolLandscapeConfigMode;
LABEL_5:
    double v5 = *v4;
    goto LABEL_7;
  }
  if (ABPKDeviceOrientationIsPortrait(a3))
  {
    double v4 = kABPK2DMCAMEnrollmentAnadrolPortraitConfigMode;
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:
  return v5;
}

- (float)biasR
{
  return *(float *)&kABPKMCAMEnrollmentAnadrolBiasR;
}

- (float)biasG
{
  return *(float *)&kABPKMCAMEnrollmentAnadrolBiasG;
}

- (float)biasB
{
  return *(float *)&kABPKMCAMEnrollmentAnadrolBiasB;
}

- (float)scale
{
  return *(float *)&kABPKMCAMEnrollmentAnadrolScale;
}

- (BOOL)networkWantsBGR
{
  return kABPKMCAMEnrollmentAnadrolNetworkTakesBGR;
}

- (BOOL)applyPreProcessing
{
  return kABPKMCAMEnrollmentAnadrolApplyPreProcessing;
}

- (unsigned)heatMapChannels
{
  return kABPKMCAMEnrollmentAnadrolHeatMapChannels;
}

- (unsigned)affinityMapChannels
{
  return kABPKMCAMEnrollmentAnadrolAffinityMapChannels;
}

- (BOOL)networkEstimatesAffinityMaps
{
  return kABPKMCAMEnrollmentAnadrolNetworkEstimatesAffinityMaps;
}

- (void).cxx_destruct
{
}

@end