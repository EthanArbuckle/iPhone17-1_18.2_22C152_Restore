@interface AVTUIAlwaysShowPaddleView
@end

@implementation AVTUIAlwaysShowPaddleView

uint64_t __AVTUIAlwaysShowPaddleView_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedPaddleView", 0);
  AVTUIAlwaysShowPaddleView_once_enabled = result;
  return result;
}

@end