@interface UITableViewCell(SafariServicesExtras)
- (void)sf_registerDynamicImageProvider:()SafariServicesExtras forTraitChanges:;
- (void)sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:()SafariServicesExtras;
- (void)sf_setUsesVibrantSelection:()SafariServicesExtras;
@end

@implementation UITableViewCell(SafariServicesExtras)

- (void)sf_setUsesVibrantSelection:()SafariServicesExtras
{
  v5 = [a1 selectedBackgroundView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (a3)
  {
    if ((isKindOfClass & 1) == 0)
    {
      v7 = objc_alloc_init(SFVibrantCellSelectionBackgroundView);
      [a1 setSelectedBackgroundView:v7];
    }
  }
  else if (isKindOfClass)
  {
    [a1 setSelectedBackgroundView:0];
  }
}

- (void)sf_registerDynamicImageProvider:()SafariServicesExtras forTraitChanges:
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_getAssociatedObject(a1, (const void *)dynamicImageTraitCollectionRegistrationKey);
  if (v8) {
    [a1 unregisterForTraitChanges:v8];
  }
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__UITableViewCell_SafariServicesExtras__sf_registerDynamicImageProvider_forTraitChanges___block_invoke;
    v11[3] = &unk_1E5C76718;
    id v12 = v6;
    v9 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](v11);
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    v10 = [a1 registerForTraitChanges:v7 withHandler:v9];

    objc_setAssociatedObject(a1, (const void *)dynamicImageTraitCollectionRegistrationKey, v10, (void *)3);
    v8 = v10;
  }
  else
  {
    objc_setAssociatedObject(a1, (const void *)dynamicImageTraitCollectionRegistrationKey, 0, (void *)3);
  }
}

- (void)sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:()SafariServicesExtras
{
  v4 = (void *)MEMORY[0x1E4FB1E20];
  id v5 = a3;
  id v6 = [v4 systemTraitsAffectingColorAppearance];
  objc_msgSend(a1, "sf_registerDynamicImageProvider:forTraitChanges:", v5, v6);
}

@end