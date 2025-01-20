@interface SUICOrbViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)isAccessibilityElement;
- (void)accessibilityElementDidLoseFocus;
@end

@implementation SUICOrbViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUICOrbView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  if (AXProcessIsSpringBoard()) {
    [v3 validateClass:@"AFUISiriCompactView"];
  }
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SUICOrbViewAccessibility *)self accessibilityIdentification];
  char v3 = [v2 isEqualToString:@"EnrollmentSetupIntroView"];

  return v3 ^ 1;
}

- (void)accessibilityElementDidLoseFocus
{
  id v2 = [(SUICOrbViewAccessibility *)self _accessibilityViewAncestorIsKindOf:MEMORY[0x2456618F0](@"AFUISiriCompactView", a2)];
  [v2 accessibilityElementDidLoseFocus];
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

@end