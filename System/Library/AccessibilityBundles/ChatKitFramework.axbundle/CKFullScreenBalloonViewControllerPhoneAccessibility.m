@interface CKFullScreenBalloonViewControllerPhoneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKFullScreenBalloonViewControllerPhoneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKFullScreenBalloonViewControllerPhone";
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
  v4.super_class = (Class)CKFullScreenBalloonViewControllerPhoneAccessibility;
  [(CKFullScreenBalloonViewControllerPhoneAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKFullScreenBalloonViewControllerPhoneAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

@end