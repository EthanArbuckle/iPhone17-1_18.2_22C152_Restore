@interface UIViewController(DOCAppearanceInheritance)
+ (uint64_t)load;
- (id)_appearance;
- (id)effectiveAppearance;
- (void)_notifyAppearanceChange:()DOCAppearanceInheritance;
- (void)doc_viewDidLoad;
- (void)setAppearance:()DOCAppearanceInheritance;
@end

@implementation UIViewController(DOCAppearanceInheritance)

- (id)_appearance
{
  return objc_getAssociatedObject(a1, &_docAppearanceIdentifier);
}

- (void)doc_viewDidLoad
{
  objc_msgSend(a1, "doc_viewDidLoad");
  id v3 = [a1 _appearance];
  if (v3)
  {
    v2 = [a1 viewIfLoaded];
    [v2 _notifyAppearanceChange:v3];
  }
}

- (void)setAppearance:()DOCAppearanceInheritance
{
  objc_setAssociatedObject(a1, &_docAppearanceIdentifier, a3, (void *)3);
  id v4 = [a1 effectiveAppearance];
  [a1 _notifyAppearanceChange:v4];
}

- (id)effectiveAppearance
{
  v2 = [a1 _appearance];
  if (!v2)
  {
    id v3 = [a1 viewIfLoaded];
    v2 = [v3 effectiveAppearance];

    if (!v2)
    {
      id v4 = [a1 parentViewController];
      v2 = [v4 effectiveAppearance];
    }
  }

  return v2;
}

- (void)_notifyAppearanceChange:()DOCAppearanceInheritance
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F82E00];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__UIViewController_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke;
  v7[3] = &unk_2648FB630;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

+ (uint64_t)load
{
  return objc_msgSend(a1, "_doc_swapMethodWithSelector:withMethodWithSelector:", sel_viewDidLoad, sel_doc_viewDidLoad);
}

@end