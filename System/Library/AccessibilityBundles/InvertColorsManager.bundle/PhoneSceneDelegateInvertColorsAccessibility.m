@interface PhoneSceneDelegateInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)applicationDidFinishLaunching:(id)a3;
@end

@implementation PhoneSceneDelegateInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PhoneSceneDelegate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)applicationDidFinishLaunching:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneSceneDelegateInvertColorsAccessibility;
  [(PhoneSceneDelegateInvertColorsAccessibility *)&v4 applicationDidFinishLaunching:a3];
  [(PhoneSceneDelegateInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v3 = [(PhoneSceneDelegateInvertColorsAccessibility *)self safeValueForKey:@"window"];
  [(PhoneSceneDelegateInvertColorsAccessibility *)self accessibilityApplyIgnoreInvertToWindow:v3];
}

@end