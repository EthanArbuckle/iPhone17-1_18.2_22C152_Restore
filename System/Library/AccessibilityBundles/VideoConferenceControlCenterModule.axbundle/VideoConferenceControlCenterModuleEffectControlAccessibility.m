@interface VideoConferenceControlCenterModuleEffectControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation VideoConferenceControlCenterModuleEffectControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideoConferenceControlCenterModule.EffectControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideoConferenceControlCenterModule.EffectControl" hasSwiftField:@"isExpanded" withSwiftType:"Bool"];
  [v3 validateClass:@"VideoConferenceControlCenterModule.EffectControl" hasSwiftField:@"buttonTitle" withSwiftType:"String"];
  [v3 validateClass:@"VideoConferenceControlCenterModule.EffectControl" hasSwiftField:@"controlType" withSwiftType:"ControlType"];
  [v3 validateClass:@"VideoConferenceControlCenterModule.EffectControl" hasSwiftField:@"expandChevron" withSwiftType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return [(VideoConferenceControlCenterModuleEffectControlAccessibility *)self safeSwiftBoolForKey:@"isExpanded"] ^ 1;
}

- (id)accessibilityLabel
{
  id v3 = [(VideoConferenceControlCenterModuleEffectControlAccessibility *)self safeSwiftStringForKey:@"buttonTitle"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VideoConferenceControlCenterModuleEffectControlAccessibility;
    id v5 = [(VideoConferenceControlCenterModuleEffectControlAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  v18.receiver = self;
  v18.super_class = (Class)VideoConferenceControlCenterModuleEffectControlAccessibility;
  id v3 = [(VideoConferenceControlCenterModuleEffectControlAccessibility *)&v18 accessibilityCustomActions];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(VideoConferenceControlCenterModuleEffectControlAccessibility *)self safeSwiftValueForKey:@"controlType"];
  v6 = [v5 safeSwiftEnumCase];
  int v7 = [v6 isEqualToString:@"expandable"];

  if (v7)
  {
    if (!v4)
    {
      v4 = [MEMORY[0x263EFF980] array];
    }
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    v9 = accessibilityLocalizedString(@"expand.button.label");
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __90__VideoConferenceControlCenterModuleEffectControlAccessibility_accessibilityCustomActions__block_invoke;
    v15 = &unk_265165300;
    objc_copyWeak(&v16, &location);
    v10 = (void *)[v8 initWithName:v9 actionHandler:&v12];

    objc_msgSend(v4, "axSafelyAddObject:", v10, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __90__VideoConferenceControlCenterModuleEffectControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __90__VideoConferenceControlCenterModuleEffectControlAccessibility_accessibilityCustomActions__block_invoke_2(id *a1)
{
  objc_opt_class();
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v3 = [WeakRetained safeSwiftValueForKey:@"expandChevron"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 sendActionsForControlEvents:64];
  LODWORD(WeakRetained) = *MEMORY[0x263F1CE68];
  id v5 = objc_loadWeakRetained(a1);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)WeakRetained, v5);
}

@end