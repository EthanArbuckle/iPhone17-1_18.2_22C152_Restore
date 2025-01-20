@interface CGColorSpaceCreateDisplayP3
@end

@implementation CGColorSpaceCreateDisplayP3

uint64_t __CGColorSpaceCreateDisplayP3_PQ_block_invoke()
{
  CGColorSpaceCreateDisplayP3_PQ_space = create_singleton((uint64_t (*)(void))color_space_state_create_p3_PQ);
  CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_PQ_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearDisplayP3");
  uint64_t v0 = CGColorSpaceCreateDisplayP3_PQ_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearDisplayP3");
}

uint64_t __CGColorSpaceCreateDisplayP3_HLG_block_invoke()
{
  CGColorSpaceCreateDisplayP3_HLG_space = create_singleton((uint64_t (*)(void))color_space_state_create_p3_HLG);
  CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_HLG_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearDisplayP3");
  uint64_t v0 = CGColorSpaceCreateDisplayP3_HLG_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearDisplayP3");
}

uint64_t __CGColorSpaceCreateDisplayP3_709OETF_block_invoke()
{
  CGColorSpaceCreateDisplayP3_709OETF_space = create_singleton((uint64_t (*)(void))color_space_state_create_p3_709);
  CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_709OETF_space, @"kCGColorSpaceLinearDerivative", @"kCGColorSpaceLinearDisplayP3");
  uint64_t v0 = CGColorSpaceCreateDisplayP3_709OETF_space;

  return CGColorSpaceSetProperty(v0, @"kCGColorSpaceExtendedLinearDerivative", @"kCGColorSpaceExtendedLinearDisplayP3");
}

@end