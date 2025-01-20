@interface MTAAppControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MTAAppControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAAppController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)MTAAppControllerAccessibility;
  [(MTAAppControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

@end