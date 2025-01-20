@interface SBLeafIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityBundleIdentifier;
@end

@implementation SBLeafIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBLeafIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityBundleIdentifier
{
  return (id)[(SBLeafIconAccessibility *)self safeStringForKey:@"applicationBundleID"];
}

@end