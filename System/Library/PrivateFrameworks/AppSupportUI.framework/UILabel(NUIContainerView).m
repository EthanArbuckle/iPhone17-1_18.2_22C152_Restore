@interface UILabel(NUIContainerView)
- (BOOL)canUseFastLayoutSizeCalulation;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
@end

@implementation UILabel(NUIContainerView)

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F0626928;
  return (objc_msgSendSuper2(&v3, sel_isLayoutSizeDependentOnPerpendicularAxis) & 1) != 0
      || [a1 numberOfLines] != 1;
}

- (BOOL)canUseFastLayoutSizeCalulation
{
  return [a1 numberOfLines] == 1;
}

@end