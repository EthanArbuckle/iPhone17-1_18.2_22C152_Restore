@interface CGColorSpaceCreateITUR
@end

@implementation CGColorSpaceCreateITUR

uint64_t __CGColorSpaceCreateITUR_2100_PQ_block_invoke()
{
  CGColorSpaceCreateITUR_2100_PQ_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_2100_PQ);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2100_PQ_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearITUR_2020");
  uint64_t v0 = CGColorSpaceCreateITUR_2100_PQ_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
}

uint64_t __CGColorSpaceCreateITUR_2100_HLG_block_invoke()
{
  CGColorSpaceCreateITUR_2100_HLG_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_2100_HLG);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2100_HLG_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearITUR_2020");
  uint64_t v0 = CGColorSpaceCreateITUR_2100_HLG_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
}

uint64_t __CGColorSpaceCreateITUR_2020_sRGBGamma_block_invoke()
{
  CGColorSpaceCreateITUR_2020_sRGBGamma_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_2020_sRGB_gamma);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_sRGBGamma_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearITUR_2020");
  uint64_t v0 = CGColorSpaceCreateITUR_2020_sRGBGamma_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
}

uint64_t __CGColorSpaceCreateITUR_709_block_invoke()
{
  CGColorSpaceCreateITUR_709_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_709);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_709_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearSRGB");
  uint64_t v0 = CGColorSpaceCreateITUR_709_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearSRGB");
}

uint64_t __CGColorSpaceCreateITUR_2020_block_invoke()
{
  CGColorSpaceCreateITUR_2020_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_2020);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_space, @"kCGColorSpaceStandardRangeOriginal", (const void *)CGColorSpaceCreateITUR_2020_space);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearITUR_2020");
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_space, @"kCGColorSpaceExtendedDerivative", @"kCGColorSpaceExtendedITUR_2020");
  uint64_t v0 = CGColorSpaceCreateITUR_2020_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearITUR_2020");
}

uint64_t __CGColorSpaceCreateITUR_709_HLG_block_invoke()
{
  CGColorSpaceCreateITUR_709_HLG_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_709_hlg);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_709_HLG_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearSRGB");
  uint64_t v0 = CGColorSpaceCreateITUR_709_HLG_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearSRGB");
}

uint64_t __CGColorSpaceCreateITUR_709_PQ_block_invoke()
{
  CGColorSpaceCreateITUR_709_PQ_space = create_singleton((uint64_t (*)(void))color_space_state_create_itur_709_pq);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_709_PQ_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearSRGB");
  uint64_t v0 = CGColorSpaceCreateITUR_709_PQ_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearSRGB");
}

@end