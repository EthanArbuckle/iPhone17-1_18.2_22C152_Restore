@interface SUUIItemOfferButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIItemOfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIItemOfferButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"confirmationTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"progress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"isShowingConfirmation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"progressType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemBrowseCellLayout", @"title", "@", 0);
  [v3 validateClass:@"SUUIItemOfferButton" hasInstanceVariable:@"_cloudImage" withType:"UIImage"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"buttonDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"_buttonPropertiesForState:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButtonProperties", @"image", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemOfferButton", @"element", "@", 0);
  [v3 validateClass:@"SUUIButtonViewElement" isKindOfClass:@"SUUIViewElement"];
  [v3 validateClass:@"SUUIViewElement" isKindOfClass:@"IKViewElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKViewElement", @"parent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKViewElement", @"attributes", "@", 0);
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (id)accessibilityValue
{
  id v3 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"progressType"];
  uint64_t v4 = [v3 integerValue];

  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(SUUIItemOfferButtonAccessibility *)self safeCGFloatForKey:@"progress"];
    if (v5 == 0.0)
    {
      v6 = 0;
    }
    else
    {
      v8 = NSString;
      v9 = accessibilityLocalizedString(@"item.offer.button.progress");
      v10 = AXFormatFloatWithPercentage();
      v6 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
    }
  }
  else
  {
    if (v4 == 4)
    {
      uint64_t v7 = accessibilityLocalizedString(@"item.download.paused");
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)SUUIItemOfferButtonAccessibility;
      uint64_t v7 = [(SUUIItemOfferButtonAccessibility *)&v12 accessibilityValue];
    }
    v6 = (void *)v7;
  }

  return v6;
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIItemOfferButtonAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    uint64_t v4 = [(SUUIItemOfferButtonAccessibility *)self accessibilityUserDefinedLabel];
LABEL_5:
    uint64_t v7 = (void *)v4;
    goto LABEL_6;
  }
  double v5 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"progressType"];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1)
  {
    uint64_t v4 = accessibilityLocalizedString(@"item.connecting");
    goto LABEL_5;
  }
  v9 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"delegate"];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"delegate"];
    objc_super v12 = [v11 safeValueForKey:@"title"];
  }
  else
  {
    objc_super v12 = 0;
  }
  v13 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"buttonDescriptor"];
  v14 = __UIAccessibilitySafeClass();

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v40 = 0;
  if (v14)
  {
    id v34 = v14;
    AXPerformSafeBlock();
  }
  v15 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"_cloudImage"];
  if (v15
    && ([(id)v36[5] safeValueForKey:@"image"],
        v16 = objc_claimAutoreleasedReturnValue(),
        [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"_cloudImage"],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v15,
        v16 == v17))
  {
    uint64_t v20 = accessibilityLocalizedString(@"item.download");
  }
  else
  {
    v18 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"isShowingConfirmation"];
    int v19 = [v18 BOOLValue];

    if (!v19)
    {
      v21 = 0;
      goto LABEL_21;
    }
    uint64_t v20 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"confirmationTitle"];
  }
  v21 = (void *)v20;
LABEL_21:
  if (![v21 length])
  {
    if (v6 == 3)
    {
      v22 = @"item.downloading";
      goto LABEL_26;
    }
    if (v6 == 2)
    {
      v22 = @"item.downloading.cancelable";
LABEL_26:
      uint64_t v23 = accessibilityLocalizedString(v22);

      v21 = (void *)v23;
    }
  }
  if (![v21 length])
  {
    v24 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"title"];

    if ([v24 length] == 1)
    {
      v21 = accessibilityLocalizedString(@"no.value");
    }
    else
    {
      v21 = v24;
    }
  }
  if (![v21 length])
  {
    objc_opt_class();
    v25 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"element"];
    v26 = [v25 safeValueForKey:@"parent"];
    v27 = [v26 safeValueForKey:@"attributes"];
    v28 = __UIAccessibilityCastAsClass();

    v29 = [v28 objectForKey:@"supportsPlayButton"];
    int v30 = [v29 BOOLValue];

    if (v30)
    {
      uint64_t v31 = accessibilityLocalizedString(@"play.button");

      v21 = (void *)v31;
    }
  }
  if (![v21 length])
  {
    uint64_t v32 = accessibilityLocalizedString(@"item.download");

    v21 = (void *)v32;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v33 = [v21 lowercaseString];

    v21 = (void *)v33;
  }
  uint64_t v7 = __UIAXStringForVariables();

  _Block_object_dispose(&v35, 8);
LABEL_6:

  return v7;
}

void __54__SUUIItemOfferButtonAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _buttonPropertiesForState:*(void *)(a1 + 40)];
  uint64_t v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilityHint
{
  uint64_t v3 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"isShowingConfirmation"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    double v5 = accessibilityLocalizedString(@"item.offer.button.text.confirm.hint");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIItemOfferButtonAccessibility;
    double v5 = [(SUUIItemOfferButtonAccessibility *)&v7 accessibilityHint];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3 = *MEMORY[0x263F1CF68];
  int v4 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"progressType"];
  uint64_t v5 = [v4 integerValue];

  if (v5 != 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIItemOfferButtonAccessibility;
    v3 |= [(SUUIItemOfferButtonAccessibility *)&v7 accessibilityTraits] | *MEMORY[0x263F1CEE8];
    if (v5 == 5) {
      v3 |= *MEMORY[0x263F1CF40];
    }
  }
  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  AXDeviceGetMainScreenScaleFactor();
  double v9 = v8;
  [(SUUIItemOfferButtonAccessibility *)self bounds];
  CGRect v17 = CGRectInset(v16, v9 * -15.0, v9 * -15.0);
  v15.double x = x;
  v15.double y = y;
  if (CGRectContainsPoint(v17, v15))
  {
    char v10 = self;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIItemOfferButtonAccessibility;
    -[SUUIItemOfferButtonAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    char v10 = (SUUIItemOfferButtonAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)accessibilityIdentifier
{
  unint64_t v3 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"progressType"];
  uint64_t v4 = [v3 integerValue];

  if (v4 == 6)
  {
    uint64_t v5 = [(SUUIItemOfferButtonAccessibility *)self safeValueForKey:@"title"];
  }
  else
  {
    uint64_t v5 = @"PurchaseButton";
  }

  return v5;
}

@end