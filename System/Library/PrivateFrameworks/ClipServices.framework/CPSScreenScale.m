@interface CPSScreenScale
@end

@implementation CPSScreenScale

uint64_t ___CPSScreenScale_block_invoke()
{
  uint64_t result = MGGetFloat32Answer();
  _CPSScreenScale_scale = v1;
  return result;
}

@end