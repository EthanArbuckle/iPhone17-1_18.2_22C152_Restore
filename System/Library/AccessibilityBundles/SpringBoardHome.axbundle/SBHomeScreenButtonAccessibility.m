@interface SBHomeScreenButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
@end

@implementation SBHomeScreenButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeScreenButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityPath
{
  v2 = [(SBHomeScreenButtonAccessibility *)self safeUIViewForKey:@"backgroundView"];
  v3 = [v2 accessibilityPath];

  return v3;
}

@end