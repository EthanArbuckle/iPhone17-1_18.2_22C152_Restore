@interface CKSyndicationContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKSyndicationContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKSyndicationContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKSyndicationContentViewController" isKindOfClass:@"OBWelcomeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSyndicationContentViewController", @"micropillView1", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSyndicationContentViewController", @"micropillView2", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKSyndicationContentViewControllerAccessibility;
  [(CKSyndicationContentViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKSyndicationContentViewControllerAccessibility *)self safeValueForKey:@"micropillView1"];
  v4 = [(CKSyndicationContentViewControllerAccessibility *)self safeValueForKey:@"micropillView2"];
  [v3 setIsAccessibilityElement:0];
  [v4 setIsAccessibilityElement:0];
}

@end