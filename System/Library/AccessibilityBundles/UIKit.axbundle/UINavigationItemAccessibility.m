@interface UINavigationItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)hidesSearchBarWhenScrolling;
- (uint64_t)_axDidOverrideHidesSearchBarWhenScrolling;
- (uint64_t)_axSetDidOverrideHidesSearchBarWhenScrolling:(uint64_t)result;
- (uint64_t)_axSetOriginalHidesSearchBarWhenScrolling:(uint64_t)result;
- (uint64_t)_axSetShouldHideSearchBarWhenScrolling:(uint64_t)result;
- (uint64_t)_axShouldHideSearchBarWhenScrolling;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_switchControlStatusChanged;
- (void)_voiceOverStatusChanged;
- (void)setHidesSearchBarWhenScrolling:(BOOL)a3;
- (void)setTitleView:(id)a3;
@end

@implementation UINavigationItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UINavigationItem";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"setTitleView:", "v", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"hidesSearchBarWhenScrolling", "B", 0);
  objc_storeStrong(v6, obj);
}

- (uint64_t)_axSetOriginalHidesSearchBarWhenScrolling:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (uint64_t)_axDidOverrideHidesSearchBarWhenScrolling
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetDidOverrideHidesSearchBarWhenScrolling:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (uint64_t)_axShouldHideSearchBarWhenScrolling
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetShouldHideSearchBarWhenScrolling:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (void)setTitleView:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(UINavigationItemAccessibility *)v7 _accessibilityBoolValueForKey:setTitleView__AXIsAccessingTitleView] & 1) == 0)
  {
    [(UINavigationItemAccessibility *)v7 _accessibilitySetBoolValue:1 forKey:setTitleView__AXIsAccessingTitleView];
    id v4 = (id)[(UINavigationItemAccessibility *)v7 safeValueForKey:@"titleView"];
    [v4 _accessibilitySetBoolValue:0 forKey:kUIAccessibilityStorageKeyIsTitleElement];

    [(UINavigationItemAccessibility *)v7 _accessibilitySetBoolValue:0 forKey:setTitleView__AXIsAccessingTitleView];
  }
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationItemAccessibility;
  -[UINavigationItemAccessibility setTitleView:](&v5, sel_setTitleView_, location[0], location);
  [location[0] _accessibilitySetBoolValue:1 forKey:kUIAccessibilityStorageKeyIsTitleElement];
  objc_storeStrong(v3, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationItemAccessibility;
  [(UINavigationItemAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v8 = v5;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    if ((-[UINavigationItemAccessibility _axDidOverrideHidesSearchBarWhenScrolling]((uint64_t)v11) & 1) == 0)
    {
      -[UINavigationItemAccessibility _axSetDidOverrideHidesSearchBarWhenScrolling:]((uint64_t)v11);
      id v4 = v11;
      [v8 hidesSearchBarWhenScrolling];
      -[UINavigationItemAccessibility _axSetOriginalHidesSearchBarWhenScrolling:]((uint64_t)v4);
    }
    [v8 setHidesSearchBarWhenScrolling:0];
  }
  else if (-[UINavigationItemAccessibility _axDidOverrideHidesSearchBarWhenScrolling]((uint64_t)v11))
  {
    -[UINavigationItemAccessibility _axSetDidOverrideHidesSearchBarWhenScrolling:]((uint64_t)v11);
  }
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  objc_msgSend(v2, "addObserver:selector:name:object:", v11, sel__voiceOverStatusChanged, *MEMORY[0x263F1CF90]);

  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:v11 selector:sel__switchControlStatusChanged name:*MEMORY[0x263F1CEB8] object:0];

  objc_storeStrong(&v8, 0);
}

- (void)setHidesSearchBarWhenScrolling:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UINavigationItemAccessibility;
  [(UINavigationItemAccessibility *)&v3 setHidesSearchBarWhenScrolling:a3];
  if (v4) {
    -[UINavigationItemAccessibility _axSetShouldHideSearchBarWhenScrolling:]((uint64_t)v6);
  }
}

- (BOOL)hidesSearchBarWhenScrolling
{
  SEL v5 = self;
  SEL v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UINavigationItemAccessibility;
  return [(UINavigationItemAccessibility *)&v3 hidesSearchBarWhenScrolling];
}

- (void)_voiceOverStatusChanged
{
  id v6 = self;
  v5[1] = (id)a2;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    char v4 = 0;
    objc_opt_class();
    id v3 = (id)__UIAccessibilityCastAsClass();
    id v2 = v3;
    objc_storeStrong(&v3, 0);
    v5[0] = v2;
    [v2 setHidesSearchBarWhenScrolling:-[UINavigationItemAccessibility _axShouldHideSearchBarWhenScrolling]((uint64_t)v6) & 1];
    objc_storeStrong(v5, 0);
  }
}

- (void)_switchControlStatusChanged
{
  id v6 = self;
  v5[1] = (id)a2;
  if (!UIAccessibilityIsSwitchControlRunning())
  {
    char v4 = 0;
    objc_opt_class();
    id v3 = (id)__UIAccessibilityCastAsClass();
    id v2 = v3;
    objc_storeStrong(&v3, 0);
    v5[0] = v2;
    [v2 setHidesSearchBarWhenScrolling:-[UINavigationItemAccessibility _axShouldHideSearchBarWhenScrolling]((uint64_t)v6) & 1];
    objc_storeStrong(v5, 0);
  }
}

@end