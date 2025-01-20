@interface CKFullScreenAppNavbarManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateDismissButton;
@end

@implementation CKFullScreenAppNavbarManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKFullScreenAppNavbarManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenAppNavbarManager", @"dismissButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenAppNavbarManager", @"_updateDismissButton", "v", 0);
}

- (void)_updateDismissButton
{
  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenAppNavbarManagerAccessibility;
  [(CKFullScreenAppNavbarManagerAccessibility *)&v5 _updateDismissButton];
  id v3 = [(CKFullScreenAppNavbarManagerAccessibility *)self safeValueForKey:@"dismissButton"];
  v4 = accessibilityLocalizedString(@"dismiss.button.label");
  [v3 setAccessibilityLabel:v4];
}

@end