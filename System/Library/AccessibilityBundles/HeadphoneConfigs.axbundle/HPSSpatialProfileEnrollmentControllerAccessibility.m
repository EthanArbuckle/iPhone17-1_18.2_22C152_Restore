@interface HPSSpatialProfileEnrollmentControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axContinueButton;
- (void)moveToStep:(int)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HPSSpatialProfileEnrollmentControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HPSSpatialProfileEnrollmentController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" hasInstanceVariable:@"_stepSerialQueue" withType:"NSObject<OS_dispatch_queue>"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" hasInstanceVariable:@"_previousStep" withType:"i"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" hasInstanceVariable:@"_currentStep" withType:"i"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" hasInstanceVariable:@"_infoView" withType:"OBHeaderView"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" hasInstanceVariable:@"_enrollView" withType:"HPSSpatialProfileUIPearlEnrollView"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController" hasInstanceVariable:@"_continueButton" withType:"OBTrayButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HPSSpatialProfileEnrollmentController", @"moveToStep:", "v", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"detailLabel", "@", 0);
  [v3 validateClass:@"OBTemplateHeaderDetailLabel" isKindOfClass:@"UILabel"];
  [v3 validateClass:@"BKUIPearlEnrollView" hasInstanceVariable:@"_pillContainer" withType:"BKUIPearlPillContainerView"];
}

- (id)_axContinueButton
{
  return (id)[(HPSSpatialProfileEnrollmentControllerAccessibility *)self safeValueForKey:@"_continueButton"];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileEnrollmentControllerAccessibility;
  [(HPSSpatialProfileEnrollmentControllerAccessibility *)&v9 viewWillLayoutSubviews];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  int v4 = [(HPSSpatialProfileEnrollmentControllerAccessibility *)self safeIntegerForKey:@"_currentStep"];
  v5 = [v3 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && !v4)
  {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CE18];
    v8 = [(HPSSpatialProfileEnrollmentControllerAccessibility *)self _axContinueButton];
    UIAccessibilityPostNotification(v7, v8);
  }
}

- (void)moveToStep:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileEnrollmentControllerAccessibility;
  -[HPSSpatialProfileEnrollmentControllerAccessibility moveToStep:](&v8, sel_moveToStep_);
  v5 = [(HPSSpatialProfileEnrollmentControllerAccessibility *)self safeValueForKey:@"_stepSerialQueue"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke;
  v6[3] = &unk_2651240F8;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

void __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) safeIntegerForKey:@"_previousStep"];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_2;
  v3[3] = &unk_265124060;
  v3[4] = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 40);
  int v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) safeValueForKey:@"_infoView"];
  id v3 = [v2 safeValueForKey:@"detailLabel"];
  int v4 = [v3 safeStringForKey:@"text"];
  int v5 = [*(id *)(a1 + 32) safeUIViewForKey:@"_enrollView"];
  v6 = [v5 safeValueForKey:@"pillContainer"];
  uint64_t v12 = MEMORY[0x263EF8330];
  id v7 = v6;
  v13 = v7;
  uint64_t v14 = *(void *)(a1 + 32);
  AXPerformSafeBlock();
  switch(*(_DWORD *)(a1 + 40))
  {
    case 0:
    case 1:
    case 5:
    case 6:
    case 7:
    case 9:
    case 0xA:
    case 0xB:
      UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE68];
      goto LABEL_3;
    case 2:
      UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE18];
      if (*(_DWORD *)(a1 + 44) == 1) {
LABEL_3:
      }
        objc_super v9 = v2;
      else {
        objc_super v9 = v3;
      }
      goto LABEL_4;
    case 3:
      UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE68];
      objc_super v9 = v5;
LABEL_4:
      UIAccessibilityPostNotification(v8, v9);
      break;
    case 4:
    case 8:
    case 0x10:
      UIAccessibilitySpeakAndDoNotBeInterrupted();
      UIAccessibilityNotifications v10 = *MEMORY[0x263F1CE18];
      v11 = objc_msgSend(*(id *)(a1 + 32), "_axContinueButton", v12, 3221225472, __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_3, &unk_2651240D0, v7, v14);
      UIAccessibilityPostNotification(v10, v11);

      break;
    case 0xC:
      UIAccessibilitySpeakAndDoNotBeInterrupted();
      break;
    default:
      break;
  }
}

uint64_t __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilitySetPearlEnrollViewController:*(void *)(a1 + 40)];
}

@end