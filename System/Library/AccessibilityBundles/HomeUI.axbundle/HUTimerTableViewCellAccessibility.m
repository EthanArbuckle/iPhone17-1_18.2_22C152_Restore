@interface HUTimerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation HUTimerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTimerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTimerTableViewCell", @"timerNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTimerTableViewCell", @"timerTimeLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(HUTimerTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"timerNameLabel, timerTimeLabel"];
}

@end