@interface SFPageZoomStepperControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateButtonsEnabledOnMainQueueWithZoomFactor:(double)a3;
- (void)prepareStepper:(id)a3;
@end

@implementation SFPageZoomStepperControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFPageZoomStepperController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFPageZoomStepperController" hasInstanceVariable:@"_stepper" withType:"<_SFSettingsAlertStepperConfiguration>"];
  [v3 validateClass:@"SFPageZoomStepperController" hasInstanceVariable:@"_percentFormatter" withType:"NSNumberFormatter"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPageZoomStepperController", @"prepareStepper:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPageZoomStepperController", @"_updateButtonsEnabledOnMainQueueWithZoomFactor:", "v", "d", 0);
}

- (void)prepareStepper:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFPageZoomStepperControllerAccessibility;
  [(SFPageZoomStepperControllerAccessibility *)&v8 prepareStepper:a3];
  v4 = accessibilitySafariServicesLocalizedString(@"page.zoom");
  v5 = [(SFPageZoomStepperControllerAccessibility *)self safeUIViewForKey:@"_stepper"];
  [v5 setAccessibilityLabel:v4];

  v6 = [(SFPageZoomStepperControllerAccessibility *)self safeUIViewForKey:@"_stepper"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke;
  v7[3] = &unk_26514AB30;
  v7[4] = self;
  [v6 _setAccessibilityCustomActionsBlock:v7];
}

id __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1C390]);
  id v3 = accessibilitySafariServicesLocalizedString(@"reset.action");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke_2;
  v7[3] = &unk_26514AB08;
  v7[4] = *(void *)(a1 + 32);
  v4 = (void *)[v2 initWithName:v3 actionHandler:v7];
  v8[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v5;
}

uint64_t __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke_2()
{
  return 1;
}

uint64_t __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetValue:0];
}

- (void)_updateButtonsEnabledOnMainQueueWithZoomFactor:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFPageZoomStepperControllerAccessibility;
  -[SFPageZoomStepperControllerAccessibility _updateButtonsEnabledOnMainQueueWithZoomFactor:](&v10, sel__updateButtonsEnabledOnMainQueueWithZoomFactor_);
  objc_opt_class();
  v5 = [(SFPageZoomStepperControllerAccessibility *)self safeValueForKey:@"_percentFormatter"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [NSNumber numberWithDouble:a3];
  objc_super v8 = [v6 stringFromNumber:v7];
  v9 = [(SFPageZoomStepperControllerAccessibility *)self safeUIViewForKey:@"_stepper"];
  [v9 setAccessibilityValue:v8];
}

@end