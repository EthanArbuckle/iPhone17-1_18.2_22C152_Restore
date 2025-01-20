@interface MFArrowControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MFArrowControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFArrowControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFArrowControlsView", @"upButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFArrowControlsView", @"downButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MFArrowControlsViewAccessibility;
  [(MFArrowControlsViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFArrowControlsViewAccessibility *)self safeValueForKey:@"upButton"];
  v4 = accessibilityLocalizedString(@"previous.message.text");
  [v3 setAccessibilityLabel:v4];

  v5 = [(MFArrowControlsViewAccessibility *)self safeValueForKey:@"downButton"];
  v6 = accessibilityLocalizedString(@"next.message.text");
  [v5 setAccessibilityLabel:v6];
}

@end