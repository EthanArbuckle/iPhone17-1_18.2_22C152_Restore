@interface NSBundleLoadCode
@end

@implementation NSBundleLoadCode

uint64_t ___NSBundleLoadCode_block_invoke()
{
  return MEMORY[0x1F40C9F00](_NSBundleImagesLoadedCallback);
}

@end