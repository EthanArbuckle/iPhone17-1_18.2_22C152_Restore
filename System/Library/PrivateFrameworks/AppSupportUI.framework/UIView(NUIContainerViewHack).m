@interface UIView(NUIContainerViewHack)
- (uint64_t)_intrinsicContentSizeInvalidatedForChildView:()NUIContainerViewHack;
- (uint64_t)_isContainerView;
@end

@implementation UIView(NUIContainerViewHack)

- (uint64_t)_intrinsicContentSizeInvalidatedForChildView:()NUIContainerViewHack
{
  uint64_t result = [a3 invalidatingIntrinsicContentSizeAlsoInvalidatesSuperview];
  if (result)
  {
    [a1 invalidateIntrinsicContentSize];
    return [a1 setNeedsLayout];
  }
  return result;
}

- (uint64_t)_isContainerView
{
  return 0;
}

@end