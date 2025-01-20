@interface EKReminderTitleDetailCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation EKReminderTitleDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKReminderTitleDetailCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKReminderTitleDetailCell" hasInstanceVariable:@"_circle" withType:"UIButton"];
  [v3 validateClass:@"EKReminderTitleDetailCell" hasInstanceVariable:@"_title" withType:"UILabel"];
  [v3 validateClass:@"EKReminderTitleDetailCell" hasInstanceVariable:@"_subtitle" withType:"UILabel"];
  [v3 validateClass:@"EKReminderTitleDetailCell" isKindOfClass:@"EKEventDetailCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(EKReminderTitleDetailCellAccessibility *)self safeUIViewForKey:@"_circle"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  double v3 = [(EKReminderTitleDetailCellAccessibility *)self safeUIViewForKey:@"_title"];
  double v4 = [v3 accessibilityLabel];
  double v5 = [(EKReminderTitleDetailCellAccessibility *)self safeUIViewForKey:@"_subtitle"];
  double v8 = [v5 accessibilityLabel];
  double v6 = __AXStringForVariables();

  return v6;
}

- (id)accessibilityHint
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  double v3 = [v2 event];

  if (objc_msgSend(v3, "CUIK_reminderShouldBeEditable"))
  {
    if ([v3 completed]) {
      double v4 = @"reminder.mark.incomplete.hint";
    }
    else {
      double v4 = @"reminder.mark.complete.hint";
    }
    double v5 = accessibilityLocalizedString(v4);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

@end