@interface MobileCalUIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MobileCalUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"application.name");
}

@end