@interface _SFBrowserContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation _SFBrowserContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFBrowserContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  id v2 = (id)[(_SFBrowserContentViewControllerAccessibility *)self safeValueForKey:@"_dismiss"];
  return 1;
}

@end