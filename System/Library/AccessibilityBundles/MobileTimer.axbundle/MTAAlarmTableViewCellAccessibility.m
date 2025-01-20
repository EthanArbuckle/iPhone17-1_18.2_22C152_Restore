@interface MTAAlarmTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsEditing;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axEnabledSwitch;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axSetDetailLabelForAlarm:(id)a3;
- (void)refreshUI:(id)a3 animated:(BOOL)a4;
@end

@implementation MTAAlarmTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAAlarmTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAlarm", @"repeatSchedule", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAlarm", @"isSleepAlarm", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAlarm", @"displayTitle", "@", 0);
  [v3 validateClass:@"MTAAlarmTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewCell", @"digitalClockLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewCell", @"enabledSwitch", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewCell", @"refreshUI:animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewController", @"showEditViewForRow:", "v", "q", 0);
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(MTAAlarmTableViewCellAccessibility *)self _axEnabledSwitch];
  if ([v3 _accessibilityViewIsVisible])
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MTAAlarmTableViewCellAccessibility;
    [(MTAAlarmTableViewCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmTableViewCellAccessibility;
  unint64_t v3 = [(MTAAlarmTableViewCellAccessibility *)&v8 accessibilityTraits];
  double v4 = [(MTAAlarmTableViewCellAccessibility *)self _axEnabledSwitch];
  int v5 = [v4 _accessibilityViewIsVisible];

  uint64_t v6 = *MEMORY[0x263F81418];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

- (id)accessibilityHint
{
  if ([(MTAAlarmTableViewCellAccessibility *)self _axIsEditing])
  {
    unint64_t v3 = accessibilityLocalizedString(@"alarm.edit.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTAAlarmTableViewCellAccessibility;
    unint64_t v3 = [(MTAAlarmTableViewCellAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (id)accessibilityValue
{
  if ([(MTAAlarmTableViewCellAccessibility *)self _axIsEditing])
  {
    v6.receiver = self;
    v6.super_class = (Class)MTAAlarmTableViewCellAccessibility;
    unint64_t v3 = [(MTAAlarmTableViewCellAccessibility *)&v6 accessibilityValue];
  }
  else
  {
    double v4 = [(MTAAlarmTableViewCellAccessibility *)self _axEnabledSwitch];
    unint64_t v3 = [v4 accessibilityValue];
  }

  return v3;
}

- (void)_axSetDetailLabelForAlarm:(id)a3
{
  id v4 = a3;
  [v4 safeUnsignedIntegerForKey:@"repeatSchedule"];
  objc_super v5 = DateMaskToString();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__MTAAlarmTableViewCellAccessibility__axSetDetailLabelForAlarm___block_invoke;
  v8[3] = &unk_265139FF8;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v9 = v6;
  id v7 = v5;
  id v10 = v7;
  [(MTAAlarmTableViewCellAccessibility *)self _setAccessibilityLabelBlock:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __64__MTAAlarmTableViewCellAccessibility__axSetDetailLabelForAlarm___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v3 = [WeakRetained safeUIViewForKey:@"digitalClockLabel"];
  id v4 = [v3 accessibilityLabel];
  char v5 = [*(id *)(a1 + 32) safeBoolForKey:@"isSleepAlarm"];
  if (v5)
  {
    id v6 = &stru_26F738340;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) safeStringForKey:@"displayTitle"];
  }
  id v7 = __AXStringForVariables();
  if ((v5 & 1) == 0) {

  }
  return v7;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x263F1C390]);
  char v5 = accessibilityLocalizedString(@"alarm.edit");
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __64__MTAAlarmTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
  id v11 = &unk_26513A048;
  objc_copyWeak(&v12, &location);
  id v6 = (void *)[v4 initWithName:v5 actionHandler:&v8];

  objc_msgSend(v3, "axSafelyAddObject:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __64__MTAAlarmTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityIndexPath];
  [v2 row];
  unint64_t v3 = [WeakRetained _accessibilityScrollParent];
  id v4 = [v3 _accessibilityViewController];

  id v5 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __64__MTAAlarmTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showEditViewForRow:*(void *)(a1 + 40)];
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MTAAlarmTableViewCellAccessibility;
  id v6 = a3;
  [(MTAAlarmTableViewCellAccessibility *)&v7 refreshUI:v6 animated:v4];
  -[MTAAlarmTableViewCellAccessibility _axSetDetailLabelForAlarm:](self, "_axSetDetailLabelForAlarm:", v6, v7.receiver, v7.super_class);
}

- (id)_axEnabledSwitch
{
  objc_opt_class();
  unint64_t v3 = [(MTAAlarmTableViewCellAccessibility *)self safeValueForKey:@"enabledSwitch"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)_axIsEditing
{
  return [(MTAAlarmTableViewCellAccessibility *)self safeBoolForKey:@"isEditing"];
}

@end