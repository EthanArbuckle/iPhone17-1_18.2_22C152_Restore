@interface AVTUIShowTrackingLostReticle
@end

@implementation AVTUIShowTrackingLostReticle

uint64_t __AVTUIShowTrackingLostReticle_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarShowTrackingLostReticle", 0);
  AVTUIShowTrackingLostReticle_once_enabled = result;
  return result;
}

@end