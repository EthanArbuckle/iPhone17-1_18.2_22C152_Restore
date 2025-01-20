@interface UIImage
@end

@implementation UIImage

uint64_t ___ef_log_UIImage_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "UIImage");
  uint64_t v1 = _ef_log_UIImage_log;
  _ef_log_UIImage_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end