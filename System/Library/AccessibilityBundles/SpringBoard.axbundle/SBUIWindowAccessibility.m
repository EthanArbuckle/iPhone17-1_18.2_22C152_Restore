@interface SBUIWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates;
@end

@implementation SBUIWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
}

@end