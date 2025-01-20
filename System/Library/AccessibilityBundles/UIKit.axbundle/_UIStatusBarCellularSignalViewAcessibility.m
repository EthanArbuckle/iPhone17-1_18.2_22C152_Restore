@interface _UIStatusBarCellularSignalViewAcessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UIStatusBarCellularSignalViewAcessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarCellularSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIStatusBarDualCellularSignalView"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  v18 = self;
  location[1] = (id)a2;
  id v14 = (id)[(_UIStatusBarCellularSignalViewAcessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uistatusbardua_0.isa)];

  if (!v14
    || ((location[0] = (id)[(_UIStatusBarCellularSignalViewAcessibility *)v18 _accessibilityValueForKey:@"AXStatusBarSignalViewServiceKey"]) == 0? (int v16 = 0): (v19 = location[0], int v16 = 1), objc_storeStrong(location, 0), !v16))
  {
    v12 = (void *)MEMORY[0x263F21660];
    id v13 = accessibilityLocalizedString(@"status.cellular.service");
    id v15 = (id)objc_msgSend(v12, "axAttributedStringWithString:");

    if ([(_UIStatusBarCellularSignalViewAcessibility *)v18 _accessibilityBoolValueForKey:@"PrimaryCellular"])
    {
      v10 = (void *)MEMORY[0x263F21660];
      id v11 = accessibilityLocalizedString(@"primary.cellular");
      id v2 = (id)objc_msgSend(v10, "axAttributedStringWithString:");
      id v3 = v15;
      id v15 = v2;

      [v15 setAttribute:@"Primary" forKey:*MEMORY[0x263F21840]];
    }
    else if ([(_UIStatusBarCellularSignalViewAcessibility *)v18 _accessibilityBoolValueForKey:@"SecondaryCellular"])
    {
      v8 = (void *)MEMORY[0x263F21660];
      id v9 = accessibilityLocalizedString(@"secondary.cellular");
      id v4 = (id)objc_msgSend(v8, "axAttributedStringWithString:");
      id v5 = v15;
      id v15 = v4;

      [v15 setAttribute:@"Secondary" forKey:*MEMORY[0x263F21840]];
    }
    id v19 = v15;
    int v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  v6 = v19;

  return v6;
}

@end