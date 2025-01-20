@interface CUIImageIsInsideSRGB
@end

@implementation CUIImageIsInsideSRGB

uint64_t (*____CUIImageIsInsideSRGB_block_invoke())(void)
{
  v0 = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 256);
  result = (uint64_t (*)(void))dlsym(v0, "CGImageIsInsideSRGB");
  __CUIImageIsInsideSRGB___imageIsInsideSRGB = result;
  return result;
}

@end