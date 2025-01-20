@interface UIView(MKInternalAdditions)
- (double)_mapkit_leadingMargin;
- (double)_mapkit_trailingMargin;
@end

@implementation UIView(MKInternalAdditions)

- (double)_mapkit_leadingMargin
{
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  [a1 layoutMargins];
  if (IsRightToLeft) {
    return v4;
  }
  else {
    return v3;
  }
}

- (double)_mapkit_trailingMargin
{
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  [a1 layoutMargins];
  if (IsRightToLeft) {
    return v3;
  }
  else {
    return v4;
  }
}

@end