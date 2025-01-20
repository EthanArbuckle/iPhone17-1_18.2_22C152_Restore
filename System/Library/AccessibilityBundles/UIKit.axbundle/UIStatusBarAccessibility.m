@interface UIStatusBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAlwaysOrderedFirst;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_shouldSeekHigherPriorityTouchTarget;
- (BOOL)accessibilityPerformEscape;
- (BOOL)shouldGroupAccessibilityChildren;
- (unint64_t)_accessibilityAutomationType;
- (void)_adjustDoubleHeightTextVisibility;
- (void)_finishedSettingStyleWithOldHeight:(double)a3 newHeight:(double)a4 animation:(int)a5;
- (void)_setDoubleHeightStatusString:(id)a3;
@end

@implementation UIStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBar";
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
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIStatusBar";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "v";
  [location[0] validateClass:@"UIStatusBar" hasInstanceMethod:@"_adjustDoubleHeightTextVisibility" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_finishedSettingStyleWithOldHeight: newHeight: animation:", v3, "d", "d", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_setDoubleHeightStatusString:", v3, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_shouldSeekHigherPriorityTouchTarget", "B", 0);
  objc_storeStrong(v6, v5);
}

- (unint64_t)_accessibilityAutomationType
{
  return 25;
}

- (BOOL)accessibilityPerformEscape
{
  v15[2] = self;
  v15[1] = (id)a2;
  char v14 = 0;
  objc_opt_class();
  id v10 = (id)[(id)*MEMORY[0x263F1D020] safeValueForKey:@"_systemNavigationAction"];
  id v13 = (id)__UIAccessibilityCastAsClass();

  id v12 = v13;
  objc_storeStrong(&v13, 0);
  v15[0] = v12;
  if ([v12 canSendResponse])
  {
    id v3 = v15[0];
    id v4 = (id)[MEMORY[0x263F29BC0] response];
    objc_msgSend(v3, "sendResponse:");

    id v11 = (id)accessibilityUIKitLocalizedString();
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    v6 = NSString;
    id v5 = v11;
    id v9 = (id)[v15[0] titleForDestination:0];
    id v8 = (id)objc_msgSend(v6, "stringWithFormat:", v5, v9);
    UIAccessibilityPostNotification(notification, v8);

    char v16 = 1;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    char v16 = 0;
  }
  objc_storeStrong(v15, 0);
  return v16 & 1;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (BOOL)_accessibilityAlwaysOrderedFirst
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_setDoubleHeightStatusString:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)-[UIStatusBarAccessibility safeValueForKey:](v7, "safeValueForKey:");
  v4.receiver = v7;
  v4.super_class = (Class)UIStatusBarAccessibility;
  [(UIStatusBarAccessibility *)&v4 _setDoubleHeightStatusString:location[0]];
  id v3 = (id)[(UIStatusBarAccessibility *)v7 safeValueForKey:@"_doubleHeightLabel"];
  if (v3) {
    [v3 accessibilitySetIdentification:@"doubleHeightLabel"];
  }
  [v3 _accessibilitySetOverridesInvisibility:1];
  if (v5 != v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_adjustDoubleHeightTextVisibility
{
  v18 = self;
  SEL v17 = a2;
  double v16 = 0.0;
  char v15 = 0;
  objc_opt_class();
  id v6 = (id)[(UIStatusBarAccessibility *)v18 safeValueForKey:@"_doubleHeightLabel"];
  id v14 = (id)__UIAccessibilityCastAsClass();

  id v13 = v14;
  objc_storeStrong(&v14, 0);
  [v13 alpha];
  double v4 = v2;

  double v16 = v4;
  v12.receiver = v18;
  v12.super_class = (Class)UIStatusBarAccessibility;
  [(UIStatusBarAccessibility *)&v12 _adjustDoubleHeightTextVisibility];
  char v10 = 0;
  objc_opt_class();
  id v5 = (id)[(UIStatusBarAccessibility *)v18 safeValueForKey:@"_doubleHeightLabel"];
  id v9 = (id)__UIAccessibilityCastAsClass();

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  id v11 = v8;
  [v8 alpha];
  double v7 = v3;
  [v11 _accessibilitySetOverridesInvisibility:1];
  if (v16 != v7) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v11, 0);
}

- (void)_finishedSettingStyleWithOldHeight:(double)a3 newHeight:(double)a4 animation:(int)a5
{
  id v13 = self;
  SEL v12 = a2;
  double v11 = a3;
  double v10 = a4;
  unsigned int v9 = a5;
  [(UIStatusBarAccessibility *)self safeCGFloatForKey:@"currentHeight"];
  double v8 = v5;
  BOOL v7 = v5 != v10;
  v6.receiver = v13;
  v6.super_class = (Class)UIStatusBarAccessibility;
  [(UIStatusBarAccessibility *)&v6 _finishedSettingStyleWithOldHeight:v9 newHeight:v11 animation:v10];
  if (v7) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  double v5 = self;
  SEL v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBarAccessibility;
  return [(UIStatusBarAccessibility *)&v3 _shouldSeekHigherPriorityTouchTarget];
}

uint64_t __71___UIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeBoolForKey:@"isEnabled"] ^ 1;

  return v3 & 1;
}

void __71___UIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  id v13 = a1;
  SEL v12 = a1;
  uint64_t v11 = 0;
  uint64_t v11 = [a1[4] safeIntegerForKey:@"enabilityStatus"];
  id v10 = 0;
  if (v11 == 2)
  {
    id v9 = (id)[a1[5] safeValueForKey:@"currentAggregatedData"];
    id v8 = (id)[a1[4] safeValueForKeyPath:@"currentPlacementState.region.overriddenStyleAttributes"];
    id v7 = (id)[a1[5] safeValueForKey:@"styleAttributes"];
    id v6 = (id)[v7 styleAttributesWithOverrides:v8];
    id v1 = (id)[a1[4] _updateForUpdatedData:v9 updatedStyleAttributes:v6 updatedEnability:MEMORY[0x263EFFA88]];
    id v2 = v10;
    id v10 = v1;

    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else if (v11 == 3)
  {
    id v3 = (id)[a1[4] _updateForUpdatedData:0 updatedStyleAttributes:0 updatedEnability:MEMORY[0x263EFFA80]];
    id v4 = v10;
    id v10 = v3;
  }
  if (v10) {
    [a1[6] _accessibilitySetRetainedValue:v10 forKey:@"AccessibilityStatusBarUpdateData"];
  }
  objc_storeStrong(&v10, 0);
}

BOOL __59___UIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1)
{
  if (AXRequestingClient() == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    char v5 = 0;
    if ([WeakRetained _axElementWithinFocused])
    {
      int v2 = 0;
    }
    else
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 32));
      char v5 = 1;
      int v2 = (-[_UIStatusBarAccessibility _axGetIsHitTesting]((uint64_t)v6) ^ 1) & 1;
    }
    BOOL v7 = v2 != 0;
    if (v5) {
  }
    }
  else
  {
    return 0;
  }
  return v7;
}

BOOL __52___UIStatusBarAccessibility__axElementWithinFocused__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

@end