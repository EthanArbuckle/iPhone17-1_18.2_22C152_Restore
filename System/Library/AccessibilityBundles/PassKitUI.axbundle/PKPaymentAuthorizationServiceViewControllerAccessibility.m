@interface PKPaymentAuthorizationServiceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPaymentViewIsVisible;
- (BOOL)_axPhysicalButtonIsVisible;
- (id)_axPrevPaymentLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetTotalMetaLabel;
- (void)_addPassphraseViewControllerToHierarchy:(id)a3 withCompletion:(id)a4;
- (void)_axSetPrevPaymentLabel:(id)a3;
- (void)_handleModelUpdate;
- (void)_removePassphraseViewFromHierarchyWithCompletionHandler:(id)a3;
- (void)biometricAttemptFailed;
- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKPaymentAuthorizationServiceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentAuthorizationServiceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPrevPaymentLabel
{
}

- (void)_axSetPrevPaymentLabel:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationServiceViewController", @"_addPassphraseViewControllerToHierarchy:withCompletion:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationServiceViewController", @"_removePassphraseViewFromHierarchyWithCompletionHandler:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationServiceViewController", @"stateMachine", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationServiceViewController", @"_handleModelUpdate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationStateMachine", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationDataModel", @"merchantName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationServiceViewController", @"setFooterState:string:animated:withCompletion:", "v", "q", "@", "B", "@?", 0);
  [v3 validateClass:@"PKPaymentAuthorizationServiceViewController" hasInstanceVariable:@"_totalView" withType:"PKPaymentAuthorizationTotalView"];
  [v3 validateClass:@"PKPaymentAuthorizationTotalView" hasInstanceVariable:@"_labelView" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentAuthorizationTotalView" hasInstanceVariable:@"_valueView" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentAuthorizationServiceViewController" hasInstanceVariable:@"_passwordButtonView" withType:"PKPaymentAuthorizationPasswordButtonView"];
  [v3 validateClass:@"PKPaymentAuthorizationServiceViewController" hasInstanceVariable:@"_footerView" withType:"PKPaymentAuthorizationFooterView"];
  [v3 validateClass:@"PKPaymentAuthorizationFooterView" hasInstanceVariable:@"_payWithPasscodeButton" withType:"UIButton"];
  [v3 validateClass:@"PKPaymentAuthorizationFooterView" hasInstanceVariable:@"_labelView" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentAuthorizationServiceViewController" hasInstanceVariable:@"_visibility" withType:"C"];
  [v3 validateClass:@"PKPaymentAuthorizationServiceViewController" hasInstanceVariable:@"_physicalButtonState" withType:"NSInteger"];
}

- (void)_accessibilitySetTotalMetaLabel
{
  id v3 = [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self safeValueForKey:@"stateMachine"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"model"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [v6 safeStringForKey:@"merchantName"];
  v8 = [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self safeValueForKey:@"_totalView"];
  v9 = __UIAccessibilitySafeClass();

  objc_opt_class();
  v10 = [v9 safeValueForKey:@"_labelView"];
  v11 = __UIAccessibilityCastAsClass();

  v12 = [v11 text];
  v13 = [v7 uppercaseString];
  int v14 = [v12 isEqualToString:v13];

  if (v14) {
    v15 = v7;
  }
  else {
    v15 = 0;
  }
  [v11 setAccessibilityLabel:v15];
}

- (BOOL)_axPhysicalButtonIsVisible
{
  return [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self safeIntegerForKey:@"_physicalButtonState"] == 1;
}

- (BOOL)_axPaymentViewIsVisible
{
  return [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self safeIntegerForKey:@"_visibility"]- 1 < 2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self _accessibilitySetTotalMetaLabel];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v3 viewDidAppear:a3];
}

- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v7 setFooterState:a3 string:a4 animated:a5 withCompletion:a6];
  if (a3 != 9) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __106__PKPaymentAuthorizationServiceViewControllerAccessibility_setFooterState_string_animated_withCompletion___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) safeValueForKey:@"_footerView"];
  v2 = [v14 safeValueForKey:@"_payWithPasscodeButton"];
  int v3 = [v2 _accessibilityViewIsVisible];
  v4 = [v14 safeValueForKey:@"_labelView"];
  v5 = [v4 accessibilityLabel];

  if ([*(id *)(a1 + 32) _axPaymentViewIsVisible])
  {
    if (*(void *)(a1 + 40) == 4) {
      int v6 = v3;
    }
    else {
      int v6 = 0;
    }
    if (v6 == 1)
    {
      UIAccessibilityNotifications v7 = *MEMORY[0x263F1CE18];
      v8 = v2;
LABEL_7:
      UIAccessibilityPostNotification(v7, v8);
      goto LABEL_13;
    }
    if (v5)
    {
      uint64_t v9 = [*(id *)(a1 + 32) _axPrevPaymentLabel];
      if (!v9
        || (v10 = (void *)v9,
            [*(id *)(a1 + 32) _axPrevPaymentLabel],
            v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 isEqual:v5],
            v11,
            v10,
            (v12 & 1) == 0))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        switch(v13)
        {
          case 0:
          case 2:
          case 8:
            goto LABEL_12;
          case 1:
          case 4:
          case 5:
          case 6:
          case 7:
            goto LABEL_13;
          case 3:
            if (![*(id *)(a1 + 32) _axPhysicalButtonIsVisible]) {
              goto LABEL_13;
            }
            UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
            v8 = v5;
            break;
          default:
            if (v13 == 12)
            {
LABEL_12:
              UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
              [*(id *)(a1 + 32) _axSetPrevPaymentLabel:v5];
            }
            goto LABEL_13;
        }
        goto LABEL_7;
      }
    }
  }
LABEL_13:
}

- (void)_handleModelUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v3 _handleModelUpdate];
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_addPassphraseViewControllerToHierarchy:(id)a3 withCompletion:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  id v5 = a3;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v8 _addPassphraseViewControllerToHierarchy:v5 withCompletion:a4];
  int v6 = objc_msgSend(v5, "view", v8.receiver, v8.super_class);
  [v6 setAccessibilityViewIsModal:1];

  LODWORD(v6) = *MEMORY[0x263F1CE68];
  UIAccessibilityNotifications v7 = [v5 view];

  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v7);
}

- (void)_removePassphraseViewFromHierarchyWithCompletionHandler:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v3 _removePassphraseViewFromHierarchyWithCompletionHandler:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)biometricAttemptFailed
{
  objc_super v3 = [(PKPaymentAuthorizationServiceViewControllerAccessibility *)self safeValueForKey:@"_passwordButtonView"];
  int v4 = [v3 isHidden];
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  [(PKPaymentAuthorizationServiceViewControllerAccessibility *)&v5 biometricAttemptFailed];
  if (([v3 isHidden] & 1) == 0 && v4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
  }
}

@end