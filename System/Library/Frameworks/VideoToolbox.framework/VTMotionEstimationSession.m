@interface VTMotionEstimationSession
@end

@implementation VTMotionEstimationSession

uint64_t __VTMotionEstimationSession_ShouldUseSeparateProcess_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VTMotionEstimationSession_ShouldUseSeparateProcess_featureEnabled = result;
  return result;
}

@end