@interface CKActionMenuItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setView:(id)a3;
@end

@implementation CKActionMenuItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKActionMenuItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKActionMenuItemAccessibility;
  id v4 = a3;
  [(CKActionMenuItemAccessibility *)&v6 setView:v4];
  v5 = [(CKActionMenuItemAccessibility *)self accessibilityLabel];
  [v4 setAccessibilityLabel:v5];
}

@end