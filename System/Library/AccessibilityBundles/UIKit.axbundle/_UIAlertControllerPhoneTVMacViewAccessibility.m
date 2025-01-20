@interface _UIAlertControllerPhoneTVMacViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation _UIAlertControllerPhoneTVMacViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIAlertControllerPhoneTVMacView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 3;
}

@end