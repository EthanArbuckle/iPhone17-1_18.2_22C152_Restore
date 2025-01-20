@interface ComposeNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setContentVisible:(BOOL)a3;
@end

@implementation ComposeNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ComposeNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setContentVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ComposeNavigationControllerAccessibility;
  -[ComposeNavigationControllerAccessibility setContentVisible:](&v6, sel_setContentVisible_);
  v5 = [(ComposeNavigationControllerAccessibility *)self safeValueForKey:@"view"];
  [v5 setAccessibilityElementsHidden:!v3];
}

@end