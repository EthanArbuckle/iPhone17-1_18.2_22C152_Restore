@interface SBUIAlertViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation SBUIAlertViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAlertView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAlertView", @"show", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBUIController", @"sharedInstance", "@", 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 6;
}

@end