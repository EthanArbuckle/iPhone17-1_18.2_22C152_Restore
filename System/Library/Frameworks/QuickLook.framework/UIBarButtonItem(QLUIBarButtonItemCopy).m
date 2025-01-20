@interface UIBarButtonItem(QLUIBarButtonItemCopy)
- (id)ql_copySystemItem;
- (void)ql_copySystemItem;
@end

@implementation UIBarButtonItem(QLUIBarButtonItemCopy)

- (id)ql_copySystemItem
{
  [a1 customView];
  if (objc_claimAutoreleasedReturnValue()) {
    -[UIBarButtonItem(QLUIBarButtonItemCopy) ql_copySystemItem]();
  }
  int v2 = [a1 isSystemItem];
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  if (v2)
  {
    uint64_t v4 = [a1 systemItem];
    v5 = [a1 target];
    v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", v4, v5, objc_msgSend(a1, "action"));
  }
  else
  {
    v7 = [a1 title];
    uint64_t v8 = [a1 style];
    v9 = [a1 target];
    v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v7, v8, v9, objc_msgSend(a1, "action"));

    v10 = [a1 image];
    [v6 setImage:v10];

    v11 = [a1 possibleTitles];
    [v6 setPossibleTitles:v11];

    v12 = [a1 primaryAction];
    [v6 setPrimaryAction:v12];
  }
  v13 = [a1 accessibilityIdentifier];
  [v6 setAccessibilityIdentifier:v13];

  return v6;
}

- (void)ql_copySystemItem
{
  __assert_rtn("-[UIBarButtonItem(QLUIBarButtonItemCopy) ql_copySystemItem]", "QLPreviewController+Overlay.m", 71, "self.customView == nil");
}

@end