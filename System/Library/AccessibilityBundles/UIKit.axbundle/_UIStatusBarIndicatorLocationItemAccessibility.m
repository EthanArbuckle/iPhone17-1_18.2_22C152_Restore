@interface _UIStatusBarIndicatorLocationItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UIStatusBarIndicatorLocationItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarIndicatorLocationItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIStatusBarIndicatorLocationItem";
  objc_msgSend(location[0], "validateClass:");
  v5 = "@";
  [location[0] validateClass:@"_UIStatusBarIndicatorLocationItem" hasClassMethod:@"prominentDisplayIdentifier" withFullSignature:0];
  v4 = @"_UIStatusBarItem";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"previousType", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"displayItems", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDisplayItem", @"isEnabled", "B", 0);
  objc_storeStrong(v7, obj);
}

- (id)accessibilityLabel
{
  v16 = self;
  SEL v15 = a2;
  int v14 = [(_UIStatusBarIndicatorLocationItemAccessibility *)self safeIntegerForKey:@"previousType"];
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  char v13 = 0;
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(_UIStatusBarIndicatorLocationItemAccessibility *)v16 safeValueForKey:@"displayItems"];
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v8 = v5;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:");
  if (v10[3])
  {
    id v17 = accessibilityLocalizedString(@"status.location.prominent");
  }
  else if (v14)
  {
    if (v14 == 1) {
      id v17 = accessibilityLocalizedString(@"status.location.geofence");
    }
    else {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = accessibilityLocalizedString(@"status.location.icon");
  }
  objc_storeStrong(&v8, 0);
  _Block_object_dispose(&v9, 8);
  v2 = v17;

  return v2;
}

@end