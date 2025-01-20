@interface WorkoutPlanBrickItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation WorkoutPlanBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutPlanBrickItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" hasSwiftField:@"swapButton" withSwiftType:"IconButton"];
  [v3 validateClass:@"SeymourUI.IconButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" hasSwiftField:@"actionButtonContainerView" withSwiftType:"ActionButtonContainerView"];
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" isKindOfClass:@"UICollectionViewCell"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)WorkoutPlanBrickItemCellAccessibility;
  [(WorkoutPlanBrickItemCellAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(WorkoutPlanBrickItemCellAccessibility *)self safeValueForKey:@"contentView"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityShouldGroupAccessibilityChildrenBlock:&__block_literal_global_0];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_26514EE78;
  objc_copyWeak(&v7, &location);
  [v3 setAccessibilityLabelBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v4[3] = &unk_26514EEC8;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityCustomActionsBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

id __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeSwiftValueForKey:@"subtitleLabel"];
  v4 = [v3 accessibilityLabel];

  id v5 = objc_loadWeakRetained(v1);
  v6 = [v5 safeSwiftValueForKey:@"titleLabel"];
  id v7 = [v6 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  v10 = _accessibilityReplaceStylsticBulletsForSpeaking(v8, v9);

  return v10;
}

id __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  char v15 = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeSwiftValueForKey:@"swapButton"];
  v4 = __UIAccessibilityCastAsClass();

  id v5 = accessibilityLocalizedString(@"workout.button.choose.workout");
  if (v4 && ([v4 isHidden] & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v13 = &unk_26514EEA0;
    id v14 = v4;
    v8 = (void *)[v7 initWithName:v5 actionHandler:&v10];
    v16[0] = v8;
    v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  return 1;
}

- (id)accessibilityElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(WorkoutPlanBrickItemCellAccessibility *)self safeSwiftValueForKey:@"actionButtonContainerView"];
  id v5 = [(WorkoutPlanBrickItemCellAccessibility *)self safeValueForKey:@"contentView"];
  [v3 axSafelyAddObject:v5];
  [v3 axSafelyAddObject:v4];

  return v3;
}

@end