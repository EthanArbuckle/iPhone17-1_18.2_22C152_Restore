@interface UIScrollView(AVAdditions)
- (uint64_t)avkit_isBeingScrollTested;
- (uint64_t)avkit_isBeingScrolled;
- (uint64_t)avkit_isBeingScrolledQuickly;
- (uint64_t)avkit_isDescendantOfNonPagingScrollView;
- (uint64_t)avkit_isInAScrollView;
@end

@implementation UIScrollView(AVAdditions)

- (uint64_t)avkit_isBeingScrolledQuickly
{
  [a1 _horizontalVelocity];
  if (v2 < 0.0) {
    double v2 = -v2;
  }
  if (v2 > 1.5) {
    return 1;
  }
  [a1 _verticalVelocity];
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  if (v3 > 1.5) {
    return 1;
  }
  v5 = [a1 superview];
  uint64_t v6 = objc_msgSend(v5, "avkit_isBeingScrolledQuickly");

  return v6;
}

- (uint64_t)avkit_isBeingScrolled
{
  if (([a1 isDecelerating] & 1) != 0
    || ([a1 isDragging] & 1) != 0
    || ([a1 isScrollAnimating] & 1) != 0
    || ([a1 _isAnimatingScrollTest] & 1) != 0)
  {
    return 1;
  }
  double v3 = [a1 superview];
  uint64_t v4 = objc_msgSend(v3, "avkit_isBeingScrolled");

  return v4;
}

- (uint64_t)avkit_isInAScrollView
{
  return 1;
}

- (uint64_t)avkit_isBeingScrollTested
{
  if ([a1 _isAnimatingScrollTest]) {
    return 1;
  }
  double v3 = [a1 superview];
  uint64_t v4 = objc_msgSend(v3, "avkit_isBeingScrollTested");

  return v4;
}

- (uint64_t)avkit_isDescendantOfNonPagingScrollView
{
  if (![a1 isPagingEnabled]) {
    return 1;
  }
  double v2 = [a1 superview];
  uint64_t v3 = objc_msgSend(v2, "avkit_isDescendantOfNonPagingScrollView");

  return v3;
}

@end