@interface PKPeerPaymentMessagesAmountStepperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHasInvalidAmount;
- (BOOL)isAccessibilityElement;
- (id)_axSpeakAmountTimer;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_setAXHasInvalidAmount:(BOOL)a3;
- (void)_setAXSpeakAmountTimer:(id)a3;
- (void)_shakeAmountLabel;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)handleNumberPadAction:(unint64_t)a3;
@end

@implementation PKPeerPaymentMessagesAmountStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentMessagesAmountStepperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axSpeakAmountTimer
{
}

- (void)_setAXSpeakAmountTimer:(id)a3
{
}

- (BOOL)_axHasInvalidAmount
{
  return MEMORY[0x270F0A438](self, &__PKPeerPaymentMessagesAmountStepperViewAccessibility___axHasInvalidAmount);
}

- (void)_setAXHasInvalidAmount:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesAmountStepperView", @"_decrementAmount", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesAmountStepperView", @"_incrementAmount", "v", 0);
  [v3 validateClass:@"PKPeerPaymentMessagesAmountStepperView" hasInstanceVariable:@"_amountLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesAmountStepperView", @"keypadVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesAmountStepperView", @"handleNumberPadAction:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesAmountStepperView", @"_shakeAmountLabel", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  return *MEMORY[0x263F1CED8] | [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
}

uint64_t __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _incrementAmount];
}

- (void)accessibilityDecrement
{
}

uint64_t __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementAmount];
}

- (id)accessibilityLabel
{
  return accessibilityPeerPaymentLocalizedString(@"amount.text");
}

- (id)accessibilityValue
{
  v2 = [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self safeValueForKey:@"_amountLabel"];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self safeValueForKey:@"keypadVisible"];
  objc_super v3 = v2;
  if (v2)
  {
    if ([v2 BOOLValue]) {
      v4 = @"dismiss.keypad.hint";
    }
    else {
      v4 = @"show.keypad.hint";
    }
    v5 = accessibilityPeerPaymentLocalizedString(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _setAXSpeakAmountTimer:0];
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)&v3 dealloc];
}

- (void)handleNumberPadAction:(unint64_t)a3
{
  [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _setAXHasInvalidAmount:0];
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)&v11 handleNumberPadAction:a3];
  v5 = [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _axSpeakAmountTimer];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F22868]);
    v7 = (void *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _setAXSpeakAmountTimer:v7];

    v8 = [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _axSpeakAmountTimer];
    [v8 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  v9 = [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _axSpeakAmountTimer];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_handleNumberPadAction___block_invoke;
  v10[3] = &unk_265142878;
  v10[4] = self;
  [v9 afterDelay:v10 processBlock:1.0];
}

void __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_handleNumberPadAction___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _axHasInvalidAmount]) {
    v2 = @"invalid.amount.text";
  }
  else {
    v2 = @"amount.text";
  }
  objc_super v3 = accessibilityPeerPaymentLocalizedString(v2);
  v4 = [*(id *)(a1 + 32) accessibilityValue];
  __AXStringForVariables();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilitySpeakOrQueueIfNeeded();
}

- (void)_shakeAmountLabel
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)&v3 _shakeAmountLabel];
  [(PKPeerPaymentMessagesAmountStepperViewAccessibility *)self _setAXHasInvalidAmount:1];
}

@end