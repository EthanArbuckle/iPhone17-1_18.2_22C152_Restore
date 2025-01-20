@interface MTAAlarmCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDeleteAlarm;
- (BOOL)_axIsEditing;
- (BOOL)_axToggleSwitch;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axModifyDeleteButton;
@end

@implementation MTAAlarmCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAAlarmCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"timeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"repeatLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"soundLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"enableSwitch", "@", 0);
  [v3 validateClass:@"MTAAlarmCollectionViewCell" hasInstanceVariable:@"_editing" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"deleteTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewCell", @"deleteButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
  [(MTAAlarmCollectionViewCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MTAAlarmCollectionViewCellAccessibility *)self _axModifyDeleteButton];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  objc_super v3 = [(MTAAlarmCollectionViewCellAccessibility *)self safeValueForKey:@"deleteButton"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)accessibilityValue
{
  if ([(MTAAlarmCollectionViewCellAccessibility *)self _axIsEditing])
  {
    v6.receiver = self;
    v6.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    objc_super v3 = [(MTAAlarmCollectionViewCellAccessibility *)&v6 accessibilityValue];
  }
  else
  {
    v4 = [(MTAAlarmCollectionViewCellAccessibility *)self safeValueForKey:@"enableSwitch"];
    objc_super v3 = [v4 accessibilityValue];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  if ([(MTAAlarmCollectionViewCellAccessibility *)self _axIsEditing])
  {
    v6.receiver = self;
    v6.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    return [(MTAAlarmCollectionViewCellAccessibility *)&v6 accessibilityTraits];
  }
  else
  {
    v4 = [(MTAAlarmCollectionViewCellAccessibility *)self safeValueForKey:@"enableSwitch"];
    unint64_t v5 = [v4 accessibilityTraits];

    return v5;
  }
}

- (id)accessibilityLabel
{
  return (id)[(MTAAlarmCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"timeLabel, nameLabel, repeatLabel, soundLabel"];
}

- (id)accessibilityHint
{
  if ([(MTAAlarmCollectionViewCellAccessibility *)self _axIsEditing])
  {
    objc_super v3 = accessibilityLocalizedString(@"alarm.edit.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    objc_super v3 = [(MTAAlarmCollectionViewCellAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(MTAAlarmCollectionViewCellAccessibility *)self _axIsEditing])
  {
    v10.receiver = self;
    v10.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    [(MTAAlarmCollectionViewCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  else
  {
    objc_super v5 = [(MTAAlarmCollectionViewCellAccessibility *)self safeValueForKey:@"enableSwitch"];
    [v5 accessibilityActivationPoint];
    double v7 = v6;
    double v9 = v8;

    double v3 = v7;
    double v4 = v9;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)accessibilityCustomActions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  double v4 = accessibilityLocalizedString(@"alarm.delete");
  objc_super v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axDeleteAlarm];

  [v5 setSortPriority:*MEMORY[0x263F81158]];
  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  double v7 = accessibilityLocalizedString(@"alarm.toggle");
  double v8 = (void *)[v6 initWithName:v7 target:self selector:sel__axToggleSwitch];

  v11[0] = v5;
  v11[1] = v8;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)_axModifyDeleteButton
{
  id v2 = [(MTAAlarmCollectionViewCellAccessibility *)self safeValueForKey:@"deleteButton"];
  [v2 setAccessibilityIdentifier:@"Delete"];
}

- (BOOL)_axDeleteAlarm
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __57__MTAAlarmCollectionViewCellAccessibility__axDeleteAlarm__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) deleteTapped:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_axToggleSwitch
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v7 + 24);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void __58__MTAAlarmCollectionViewCellAccessibility__axToggleSwitch__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained safeValueForKey:@"enableSwitch"];
  id v4 = __UIAccessibilityCastAsClass();

  objc_msgSend(v4, "setOn:animated:", objc_msgSend(v4, "isOn") ^ 1, 1);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)_axIsEditing
{
  return [(MTAAlarmCollectionViewCellAccessibility *)self safeBoolForKey:@"_editing"];
}

@end