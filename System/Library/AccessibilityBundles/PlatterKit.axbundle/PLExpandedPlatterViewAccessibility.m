@interface PLExpandedPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PLExpandedPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLExpandedPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"PLExpandedPlatter" hasRequiredInstanceMethod:@"dismissControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandedPlatterView", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PLExpandedPlatterViewAccessibility;
  [(PLExpandedPlatterViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PLExpandedPlatterViewAccessibility *)self safeValueForKey:@"_dismissControl"];
  v4 = accessibilityLocalizedString(@"dismiss");
  [v3 setAccessibilityLabel:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLExpandedPlatterViewAccessibility;
  [(PLExpandedPlatterViewAccessibility *)&v3 layoutSubviews];
  [(PLExpandedPlatterViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end