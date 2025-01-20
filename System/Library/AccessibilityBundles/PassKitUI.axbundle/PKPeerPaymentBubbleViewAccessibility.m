@interface PKPeerPaymentBubbleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axBubbleLabel;
- (id)accessibilityElements;
- (void)_actionButtonTapped:(id)a3;
@end

@implementation PKPeerPaymentBubbleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentBubbleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentBubbleView", @"actionButton", "@", 0);
  [v3 validateClass:@"PKPeerPaymentBubbleView" hasInstanceVariable:@"_messageLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPeerPaymentBubbleView" hasInstanceVariable:@"_statusLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentBubbleView", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentBubbleView", @"_actionButtonTapped:", "v", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = [(PKPeerPaymentBubbleViewAccessibility *)self _accessibilityValueForKey:@"PKPeerPaymentBubbleElement"];
  v4 = [(PKPeerPaymentBubbleViewAccessibility *)self safeUIViewForKey:@"actionButton"];
  int v5 = [v4 _accessibilityViewIsVisible];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [(PKPeerPaymentBubbleViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"PKPeerPaymentBubbleElement"];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    LOBYTE(location) = 0;
    objc_opt_class();
    uint64_t v6 = __UIAccessibilityCastAsClass();
    v7 = (void *)v19[5];
    v19[5] = v6;

    if (v5)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke;
      v15[3] = &unk_265141138;
      v17 = &v18;
      id v16 = v4;
      [v3 _setAccessibilityFrameBlock:v15];
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_2;
      v14[3] = &unk_265141160;
      v14[4] = &v18;
      [v3 _setAccessibilityFrameBlock:v14];
    }
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_3;
    v11[3] = &unk_265140E18;
    objc_copyWeak(&v12, &location);
    [v3 _setAccessibilityLabelBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v18, 8);
  }
  if (v5) {
    objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  }
  else {
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3, v10);
  }

  return v8;
}

uint64_t __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accessibilityFrame];
  unint64_t v3 = v2;
  unint64_t v5 = v4;
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  [*(id *)(a1 + 32) accessibilityFrame];
  v10.n128_u64[0] = v14.n128_u64[0];
  v11.n128_u64[0] = v15.n128_u64[0];
  v12.n128_u64[0] = v16.n128_u64[0];
  v13.n128_u64[0] = v17.n128_u64[0];
  v14.n128_u64[0] = v3;
  v15.n128_u64[0] = v5;
  v16.n128_u64[0] = v7;
  v17.n128_u64[0] = v9;

  return MEMORY[0x270F0A3A0](1, 1, v14, v15, v16, v17, v10, v11, v12, v13);
}

uint64_t __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accessibilityFrame];
}

id __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = [WeakRetained _axBubbleLabel];

  return v2;
}

- (id)_axBubbleLabel
{
  uint64_t v3 = [(PKPeerPaymentBubbleViewAccessibility *)self safeIntegerForKey:@"state"];
  objc_opt_class();
  unint64_t v4 = [(PKPeerPaymentBubbleViewAccessibility *)self safeValueForKey:@"_messageLabel"];
  unint64_t v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  unint64_t v6 = [(PKPeerPaymentBubbleViewAccessibility *)self safeValueForKey:@"_statusLabel"];
  unint64_t v7 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    if ((unint64_t)(v3 - 5) > 3) {
      unint64_t v8 = @"unknown.transfer.format";
    }
    else {
      unint64_t v8 = off_2651411A8[v3 - 5];
    }
    __n128 v10 = NSString;
    __n128 v11 = accessibilityLocalizedString(v8);
    __n128 v12 = [v5 text];
    unint64_t v9 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

    if (v3 == 1)
    {
      uint64_t v13 = [v5 text];

      unint64_t v9 = (void *)v13;
    }
  }
  else
  {
    unint64_t v9 = accessibilityLocalizedString(@"unknown.transfer");
  }
  __n128 v14 = __UIAXStringForVariables();

  return v14;
}

- (void)_actionButtonTapped:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentBubbleViewAccessibility;
  [(PKPeerPaymentBubbleViewAccessibility *)&v10 _actionButtonTapped:v4];
  unint64_t v5 = [(PKPeerPaymentBubbleViewAccessibility *)self accessibilityElements];
  unint64_t v6 = [v5 firstObject];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__PKPeerPaymentBubbleViewAccessibility__actionButtonTapped___block_invoke;
  v7[3] = &unk_265141188;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityFrameBlock:v7];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

double __60__PKPeerPaymentBubbleViewAccessibility__actionButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;

  return v3;
}

@end