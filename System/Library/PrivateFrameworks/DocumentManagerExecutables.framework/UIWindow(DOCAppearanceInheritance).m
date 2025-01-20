@interface UIWindow(DOCAppearanceInheritance)
- (id)appearance;
- (id)effectiveAppearance;
- (void)setAppearance:()DOCAppearanceInheritance;
@end

@implementation UIWindow(DOCAppearanceInheritance)

- (id)appearance
{
  return objc_getAssociatedObject(a1, &_docAppearanceIdentifier);
}

- (void)setAppearance:()DOCAppearanceInheritance
{
  objc_setAssociatedObject(a1, &_docAppearanceIdentifier, a3, (void *)3);
  id v4 = [a1 effectiveAppearance];
  [a1 _notifyAppearanceChange:v4];
}

- (id)effectiveAppearance
{
  v2 = [a1 appearance];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_26DF8A180;
    objc_msgSendSuper2(&v7, sel_effectiveAppearance);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end