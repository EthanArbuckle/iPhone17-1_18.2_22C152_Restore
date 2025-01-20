@interface AVTUIRestrictMaximumAvatarCount
@end

@implementation AVTUIRestrictMaximumAvatarCount

uint64_t __AVTUIRestrictMaximumAvatarCount_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTUIRestrictMaxAvatarCount", 0);
  AVTUIRestrictMaximumAvatarCount_once_enabled = result;
  return result;
}

@end