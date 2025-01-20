@interface UIView(JU_UITraitCollectionOverrides)
- (uint64_t)juLayoutDirection;
- (void)setJuLayoutDirection:()JU_UITraitCollectionOverrides;
@end

@implementation UIView(JU_UITraitCollectionOverrides)

- (uint64_t)juLayoutDirection
{
  v2 = [a1 _juLayoutDirectionValue];
  uint64_t v3 = [a1 _juLayoutDirectionFromLayoutDirectionValue:v2];

  return v3;
}

- (void)setJuLayoutDirection:()JU_UITraitCollectionOverrides
{
  if ([a1 juLayoutDirection] != a3)
  {
    if (sOriginal_UIView_traitCollection)
    {
      uint64_t v5 = [a1 traitCollection];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v7 = (id)v5;
    if (a3 > 1)
    {
      v6 = 0;
    }
    else
    {
      v6 = [NSNumber numberWithInteger:a3];
    }
    objc_setAssociatedObject(a1, sel_juLayoutDirection, v6, (void *)0x303);
    if (sOriginal_UIView_traitCollection)
    {
      [a1 setNeedsLayout];
      [a1 traitCollectionDidChange:v7];
    }
  }
}

@end