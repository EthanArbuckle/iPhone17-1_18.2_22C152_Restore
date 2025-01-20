@interface ResolveSpatialAudioResolutionCutoffSize
@end

@implementation ResolveSpatialAudioResolutionCutoffSize

uint64_t __fpfsi_ResolveSpatialAudioResolutionCutoffSize_block_invoke()
{
  uint64_t result = FigGetCFPreferenceSizeWithDefault();
  fpfsi_ResolveSpatialAudioResolutionCutoffSize_defaultSpatialAudioResolutionCutoffSize_0 = v1;
  fpfsi_ResolveSpatialAudioResolutionCutoffSize_defaultSpatialAudioResolutionCutoffSize_1 = v2;
  return result;
}

@end