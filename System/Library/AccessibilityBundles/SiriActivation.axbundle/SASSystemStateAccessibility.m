@interface SASSystemStateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isConnectedToEyesFreeDevice;
@end

@implementation SASSystemStateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SASSystemState";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isConnectedToEyesFreeDevice
{
  v3 = objc_opt_new();
  char v4 = [v3 isClarityBoardEnabled];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SASSystemStateAccessibility;
  return [(SASSystemStateAccessibility *)&v6 isConnectedToEyesFreeDevice];
}

@end