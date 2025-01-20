@interface CPSHeroImagePreferredSize
@end

@implementation CPSHeroImagePreferredSize

double ___CPSHeroImagePreferredSize_block_invoke()
{
  int v0 = MGGetSInt32Answer();
  if (_CPSScreenScale_onceToken != -1) {
    dispatch_once(&_CPSScreenScale_onceToken, &__block_literal_global_1);
  }
  if (v0 >= 414) {
    int v1 = 414;
  }
  else {
    int v1 = v0;
  }
  double result = (double)v1 * *(float *)&_CPSScreenScale_scale;
  *(double *)&_CPSHeroImagePreferredSize_preferredSize_0 = result;
  _CPSHeroImagePreferredSize_preferredSize_1 = round((result + result) / 3.0);
  return result;
}

@end