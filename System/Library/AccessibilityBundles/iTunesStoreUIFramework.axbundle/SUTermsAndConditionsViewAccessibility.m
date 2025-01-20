@interface SUTermsAndConditionsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_termsAndConditionsControl;
@end

@implementation SUTermsAndConditionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTermsAndConditionsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_termsAndConditionsControl
{
  v6.receiver = self;
  v6.super_class = (Class)SUTermsAndConditionsViewAccessibility;
  v2 = [(SUTermsAndConditionsViewAccessibility *)&v6 _termsAndConditionsControl];
  v3 = [v2 safeValueForKey:@"_label"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF10] | v4];

  return v2;
}

@end