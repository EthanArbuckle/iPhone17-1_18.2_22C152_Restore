@interface UIViewController(EKUIFutureTraitEnvironment)
- (id)ekui_futureTraitCollection;
- (void)ekui_futureTraitCollectionCategoryPropertyKey;
- (void)setEkui_futureTraitCollection:()EKUIFutureTraitEnvironment;
@end

@implementation UIViewController(EKUIFutureTraitEnvironment)

- (void)setEkui_futureTraitCollection:()EKUIFutureTraitEnvironment
{
  id value = a3;
  v4 = objc_msgSend(a1, "ekui_futureTraitCollection");
  char v5 = [v4 isEqual:value];

  if ((v5 & 1) == 0) {
    objc_setAssociatedObject(a1, (const void *)objc_msgSend(a1, "ekui_futureTraitCollectionCategoryPropertyKey"), value, (void *)0x303);
  }
}

- (id)ekui_futureTraitCollection
{
  v2 = objc_getAssociatedObject(a1, (const void *)objc_msgSend(a1, "ekui_futureTraitCollectionCategoryPropertyKey"));
  if (!v2)
  {
    v3 = [a1 parentViewController];

    if (!v3
      || ([a1 parentViewController],
          v4 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "ekui_futureTraitCollection"),
          v2 = objc_claimAutoreleasedReturnValue(),
          v4,
          !v2))
    {
      v2 = [a1 traitCollection];
    }
  }

  return v2;
}

- (void)ekui_futureTraitCollectionCategoryPropertyKey
{
  return &ekui_futureTraitCollectionCategoryPropertyKey;
}

@end