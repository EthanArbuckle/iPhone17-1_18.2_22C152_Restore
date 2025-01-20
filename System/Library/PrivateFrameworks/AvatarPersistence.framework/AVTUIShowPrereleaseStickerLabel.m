@interface AVTUIShowPrereleaseStickerLabel
@end

@implementation AVTUIShowPrereleaseStickerLabel

uint64_t __AVTUIShowPrereleaseStickerLabel_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesShowPrereleaseStickerLabel", 0);
  AVTUIShowPrereleaseStickerLabel_once_enabled = result;
  return result;
}

@end