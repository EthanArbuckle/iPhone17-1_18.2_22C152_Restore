@interface SUICFlamesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUICFlamesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUICFlamesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUICFlamesView" hasInstanceVariable:@"_flamesDelegate" withType:"<SUICFlamesViewDelegate>"];
  [v3 validateClass:@"SUICFlamesView" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  if ([v2 _accessibilityViewIsVisible]) {
    char v3 = [v2 _accessibilityWindowVisible];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"waveform.label");
}

@end