@interface MTATimerControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
- (void)setState:(unint64_t)a3 animate:(BOOL)a4;
@end

@implementation MTATimerControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTATimerControlsView" hasInstanceVariable:@"_timePicker" withType:"MTATimerIntervalPickerView"];
  [v3 validateClass:@"MTATimerControlsView" hasInstanceVariable:@"_timeView" withType:"UILabel"];
  [v3 validateClass:@"MTATimerControlsView" hasInstanceVariable:@"_state" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerControlsView", @"setState: animate:", "v", "Q", "B", 0);
  [v3 validateClass:@"MTATimerControlsView" hasInstanceVariable:@"_tableView" withType:"UITableView"];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTATimerControlsViewAccessibility;
  [(MTATimerControlsViewAccessibility *)&v3 layoutSubviews];
  [(MTATimerControlsViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)MTATimerControlsViewAccessibility;
  [(MTATimerControlsViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = accessibilityLocalizedString(@"alarm.selected");
  v4 = [(MTATimerControlsViewAccessibility *)self safeUIViewForKey:@"_expectedTimeView"];
  [v4 setAccessibilityLabel:v3];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)setState:(unint64_t)a3 animate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTATimerControlsViewAccessibility;
  [(MTATimerControlsViewAccessibility *)&v5 setState:a3 animate:a4];
  [(MTATimerControlsViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

@end