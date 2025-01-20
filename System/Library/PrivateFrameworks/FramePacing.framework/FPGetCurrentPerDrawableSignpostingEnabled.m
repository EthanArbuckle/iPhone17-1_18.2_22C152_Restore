@interface FPGetCurrentPerDrawableSignpostingEnabled
@end

@implementation FPGetCurrentPerDrawableSignpostingEnabled

uint64_t ___FPGetCurrentPerDrawableSignpostingEnabled_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = gFPPerFrameSignpostingIsEnabled;
  return result;
}

@end