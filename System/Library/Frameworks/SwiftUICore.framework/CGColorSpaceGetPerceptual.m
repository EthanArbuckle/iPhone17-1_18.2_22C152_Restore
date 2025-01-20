@interface CGColorSpaceGetPerceptual
@end

@implementation CGColorSpaceGetPerceptual

CGColorSpaceRef ___CGColorSpaceGetPerceptual_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateCalibratedRGB(_kCTTextScaleSecondary_block_invoke_white, 0, _kCTTextScaleSecondary_block_invoke_gamma, _kCTTextScaleSecondary_block_invoke_matrix);
  _CGColorSpaceGetPerceptual_space = (uint64_t)result;
  return result;
}

@end