@interface CKMessageEditingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKMessageEditingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEditingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEditingView", @"confirmButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEditingView", @"rejectButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEditingViewAccessibility;
  [(CKMessageEditingViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKMessageEditingViewAccessibility *)self safeValueForKey:@"confirmButton"];
  v4 = accessibilityLocalizedString(@"editing.confirm.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(CKMessageEditingViewAccessibility *)self safeValueForKey:@"rejectButton"];
  v6 = accessibilityLocalizedString(@"editing.reject.button");
  [v5 setAccessibilityLabel:v6];
}

@end