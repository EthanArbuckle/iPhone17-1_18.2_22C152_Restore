@interface _UINavigationBarPaletteAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityNavigationBarShouldOverrideMinimumHeight;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setMinimumHeight:(double)a3;
@end

@implementation _UINavigationBarPaletteAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UINavigationBarPalette";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UINavigationBarPalette", @"setMinimumHeight:", "v", "d", 0);
  objc_storeStrong(v4, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarPaletteAccessibility;
  [(_UINavigationBarPaletteAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  if ([(_UINavigationBarPaletteAccessibility *)v5 _accessibilityNavigationBarShouldOverrideMinimumHeight])
  {
    v2 = v5;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v2, 0);
  }
}

- (void)setMinimumHeight:(double)a3
{
  v11 = self;
  SEL v10 = a2;
  double v9 = a3;
  if ((UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    && [(_UINavigationBarPaletteAccessibility *)v11 _accessibilityNavigationBarShouldOverrideMinimumHeight])
  {
    [(_UINavigationBarPaletteAccessibility *)v11 preferredHeight];
    double v8 = v3;
    double v7 = v9;
    if (v3 >= v9) {
      double v4 = v8;
    }
    else {
      double v4 = v7;
    }
    double v6 = v4;
    double v9 = v4;
  }
  v5.receiver = v11;
  v5.super_class = (Class)_UINavigationBarPaletteAccessibility;
  [(_UINavigationBarPaletteAccessibility *)&v5 setMinimumHeight:v9];
}

- (BOOL)_accessibilityNavigationBarShouldOverrideMinimumHeight
{
  return 1;
}

@end