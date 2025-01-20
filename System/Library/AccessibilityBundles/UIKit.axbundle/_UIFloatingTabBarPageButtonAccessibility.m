@interface _UIFloatingTabBarPageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIFloatingTabBarPageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFloatingTabBarPageButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIFloatingTabBarPageButton";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFloatingTabBarPageButton", @"direction", "q", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v19 = self;
  v18[1] = (id)a2;
  char v17 = 0;
  objc_opt_class();
  id v16 = (id)__UIAccessibilityCastAsClass();
  id v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  BOOL v14 = [v15 effectiveUserInterfaceLayoutDirection] == 1;
  if ([(_UIFloatingTabBarPageButtonAccessibility *)v19 safeIntegerForKey:@"direction"])
  {
    char v8 = 0;
    char v6 = 0;
    if (v14)
    {
      id v9 = accessibilityLocalizedString(@"previous.page");
      char v8 = 1;
      id v3 = v9;
    }
    else
    {
      id v7 = accessibilityLocalizedString(@"next.page");
      char v6 = 1;
      id v3 = v7;
    }
    id v20 = v3;
    if (v6) {

    }
    if (v8) {
  }
    }
  else
  {
    char v12 = 0;
    char v10 = 0;
    if (v14)
    {
      id v13 = accessibilityLocalizedString(@"next.page");
      char v12 = 1;
      id v2 = v13;
    }
    else
    {
      id v11 = accessibilityLocalizedString(@"previous.page");
      char v10 = 1;
      id v2 = v11;
    }
    id v20 = v2;
    if (v10) {

    }
    if (v12) {
  }
    }
  objc_storeStrong(v18, 0);
  v4 = v20;

  return v4;
}

@end