@interface CGColorSpaceCreateExtendedLinearITUR
@end

@implementation CGColorSpaceCreateExtendedLinearITUR

uint64_t __CGColorSpaceCreateExtendedLinearITUR_2020_block_invoke()
{
  CGColorSpaceCreateExtendedLinearITUR_2020_space = create_singleton((uint64_t (*)(void))color_space_state_create_extended_linear_itur_2020);
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearITUR_2020_space, @"kCGColorSpaceStandardRangeOriginal", @"kCGColorSpaceLinearITUR_2020");
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearITUR_2020_space, @"kCGColorSpaceLinearDerivative", (const void *)CGColorSpaceCreateExtendedLinearITUR_2020_space);
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearITUR_2020_space, @"kCGColorSpaceExtendedDerivative", (const void *)CGColorSpaceCreateExtendedLinearITUR_2020_space);
  uint64_t v0 = CGColorSpaceCreateExtendedLinearITUR_2020_space;
  v1 = (const void *)CGColorSpaceCreateExtendedLinearITUR_2020_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", v1);
}

@end