@interface SBFluidSwitcherTitledButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessiblityLabel;
@end

@implementation SBFluidSwitcherTitledButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherTitledButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessiblityLabel
{
  return (id)[(SBFluidSwitcherTitledButtonAccessibility *)self safeValueForKey:@"title"];
}

@end