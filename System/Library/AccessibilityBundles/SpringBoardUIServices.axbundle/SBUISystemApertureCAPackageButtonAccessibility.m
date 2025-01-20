@interface SBUISystemApertureCAPackageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SBUISystemApertureCAPackageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUISystemApertureCAPackageButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySBLocalizedString(@"turn.off.flashlight");
}

@end