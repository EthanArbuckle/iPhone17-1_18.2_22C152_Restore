@interface UIViewController(AMP_UITraitCollectionOverrides)
- (uint64_t)layoutDirection;
- (void)setLayoutDirection:()AMP_UITraitCollectionOverrides;
@end

@implementation UIViewController(AMP_UITraitCollectionOverrides)

- (uint64_t)layoutDirection
{
  v1 = [a1 traitCollection];
  uint64_t v2 = [v1 layoutDirection];

  return v2;
}

- (void)setLayoutDirection:()AMP_UITraitCollectionOverrides
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v5 = [a1 traitCollection];
  if ([v5 layoutDirection] != a3)
  {
    v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithLayoutDirection:a3];
    v7 = (void *)MEMORY[0x1E4FB1E20];
    v10[0] = v5;
    v10[1] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    v9 = [v7 traitCollectionWithTraitsFromCollections:v8];

    [a1 setOverrideTraitCollection:v9];
  }
}

@end