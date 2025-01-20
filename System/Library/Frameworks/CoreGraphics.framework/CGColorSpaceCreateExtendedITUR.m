@interface CGColorSpaceCreateExtendedITUR
@end

@implementation CGColorSpaceCreateExtendedITUR

uint64_t __CGColorSpaceCreateExtendedITUR_2020_block_invoke()
{
  CGColorSpaceCreateExtendedITUR_2020_space = create_singleton((uint64_t (*)(void))color_space_state_create_extended_itur_2020);
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedITUR_2020_space, @"kCGColorSpaceStandardRangeOriginal", @"kCGColorSpaceITUR_2020");
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedITUR_2020_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedITUR_2020_space, @"kCGColorSpaceExtendedDerivative", (const void *)CGColorSpaceCreateExtendedITUR_2020_space);
  uint64_t v0 = CGColorSpaceCreateExtendedITUR_2020_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
}

@end