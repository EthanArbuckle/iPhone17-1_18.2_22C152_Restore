@interface AVTUIFlushThumbnailCache
@end

@implementation AVTUIFlushThumbnailCache

uint64_t __AVTUIFlushThumbnailCache_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIFlushThumbnailCache", 0);
  AVTUIFlushThumbnailCache_once_enabled = result;
  return result;
}

@end