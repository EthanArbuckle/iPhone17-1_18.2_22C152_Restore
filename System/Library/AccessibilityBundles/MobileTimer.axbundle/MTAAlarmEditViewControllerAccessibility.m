@interface MTAAlarmEditViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation MTAAlarmEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAAlarmEditViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmEditViewController", @"editedAlarm", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAlarm", @"repeatSchedule", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmEditViewController", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MTAAlarmEditViewControllerAccessibility;
  id v6 = a4;
  v7 = [(MTAAlarmEditViewControllerAccessibility *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = objc_msgSend(v6, "row", v14.receiver, v14.super_class);
  uint64_t v9 = [v6 section];

  if (v9 == 1 && !v8)
  {
    v10 = [(MTAAlarmEditViewControllerAccessibility *)self safeValueForKey:@"editedAlarm"];
    [v10 safeUnsignedIntegerForKey:@"repeatSchedule"];

    v11 = DateMaskToString();
    v12 = [v7 detailTextLabel];
    [v12 setAccessibilityLabel:v11];
  }

  return v7;
}

@end