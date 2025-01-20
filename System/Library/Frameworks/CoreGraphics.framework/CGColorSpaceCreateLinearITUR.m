@interface CGColorSpaceCreateLinearITUR
@end

@implementation CGColorSpaceCreateLinearITUR

uint64_t __CGColorSpaceCreateLinearITUR_2020_block_invoke()
{
  CGColorSpaceCreateLinearITUR_2020_space = create_singleton((uint64_t (*)(void))color_space_state_create_linear_itur_2020);
  CGColorSpaceSetProperty(CGColorSpaceCreateLinearITUR_2020_space, @"kCGColorSpaceStandardRangeOriginal", (const void *)CGColorSpaceCreateLinearITUR_2020_space);
  CGColorSpaceSetProperty(CGColorSpaceCreateLinearITUR_2020_space, @"kCGColorSpaceLinearDerivative", (const void *)CGColorSpaceCreateLinearITUR_2020_space);
  CGColorSpaceSetProperty(CGColorSpaceCreateLinearITUR_2020_space, @"kCGColorSpaceExtendedDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
  uint64_t v0 = CGColorSpaceCreateLinearITUR_2020_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
}

@end