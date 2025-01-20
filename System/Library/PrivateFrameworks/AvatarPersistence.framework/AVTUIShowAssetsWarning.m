@interface AVTUIShowAssetsWarning
@end

@implementation AVTUIShowAssetsWarning

uint64_t __AVTUIShowAssetsWarning_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIShowAssetsWarning", 0);
  AVTUIShowAssetsWarning_once_enabled = result;
  return result;
}

@end