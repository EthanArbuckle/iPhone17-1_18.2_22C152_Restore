@interface UpNextQueueButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UpNextQueueButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.UpNextQueueButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = NSString;
  v3 = [(UpNextQueueButtonAccessibility *)self safeSwiftValueForKey:@"queueCount"];
  v4 = [v2 stringWithFormat:@"%@", v3];

  v5 = accessibilityLocalizedString(@"workout.button.stack");
  v6 = __UIAXStringForVariables();

  return v6;
}

@end