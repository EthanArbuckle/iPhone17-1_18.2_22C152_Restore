@interface SBUISystemApertureSecureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsInJindo;
@end

@implementation SBUISystemApertureSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUISystemApertureSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsInJindo
{
  return 1;
}

@end