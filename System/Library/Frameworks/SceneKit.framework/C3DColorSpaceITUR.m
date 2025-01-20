@interface C3DColorSpaceITUR
@end

@implementation C3DColorSpaceITUR

CGColorSpaceRef __C3DColorSpaceITUR_709_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00298]);
  C3DColorSpaceITUR_709_kC3DColorSpaceITUR_709 = (uint64_t)result;
  return result;
}

@end