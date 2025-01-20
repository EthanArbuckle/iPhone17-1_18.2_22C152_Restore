@interface VLFFailureViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VLFFailureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VLFFailureView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)VLFFailureViewAccessibility;
  [(VLFFailureViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(VLFFailureViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48]];
}

@end