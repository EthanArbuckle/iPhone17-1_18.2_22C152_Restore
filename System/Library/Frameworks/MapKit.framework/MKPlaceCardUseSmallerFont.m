@interface MKPlaceCardUseSmallerFont
@end

@implementation MKPlaceCardUseSmallerFont

void ___MKPlaceCardUseSmallerFont_block_invoke()
{
  _MergedGlobals_146 = 0;
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 bounds];
  double v2 = v1;

  if (v2 <= 320.0) {
    _MergedGlobals_146 = 1;
  }
}

@end