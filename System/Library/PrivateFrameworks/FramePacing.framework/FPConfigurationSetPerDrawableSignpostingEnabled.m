@interface FPConfigurationSetPerDrawableSignpostingEnabled
@end

@implementation FPConfigurationSetPerDrawableSignpostingEnabled

uint64_t ___FPConfigurationSetPerDrawableSignpostingEnabled_block_invoke(uint64_t result)
{
  gFPPerFrameSignpostingIsEnabled = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = gFPPerFrameSignpostingIsEnabled;
  return result;
}

@end