@interface CKEffectPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityViewIsModal;
- (CKEffectPickerViewAccessibility)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7;
- (id)_axFullScreenEffectElement;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateCloseButton;
- (void)_axUpdateScrollView;
- (void)_setAXFullScreenEffectElement:(id)a3;
- (void)_touchUpInsideDotButton:(id)a3;
- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5;
- (void)cancelImpactSelection;
- (void)effectTypeDidChange:(id)a3;
@end

@implementation CKEffectPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKEffectPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"mainLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"typeSegmentedControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"sendMomentButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"momentTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"pageControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"momentsCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"momentIdentifiers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGPoint=dd}", "@", "c", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"closeButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"balloonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"_touchUpInsideDotButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"cancelImpactSelection", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"selectedMomentIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"effectTypeDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"scrollViewDidEndDecelerating:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"effectLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"effectDescriptiveLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"effectDotButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"effectSendButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEffectPickerView", @"effectIdentifiers", "@", 0);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)CKEffectPickerViewAccessibility;
  [(CKEffectPickerViewAccessibility *)&v22 _accessibilityLoadAccessibilityInformation];
  [(CKEffectPickerViewAccessibility *)self _axUpdateCloseButton];
  id v3 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"balloonView"];
  [v3 setIsAccessibilityElement:0];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v21 = 0;
  objc_opt_class();
  v5 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"momentIdentifiers"];
  v6 = __UIAccessibilityCastAsClass();

  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = _AXCKFullScreenEffectString(*(void **)(*((void *)&v17 + 1) + 8 * i), 0);
        if (v12) {
          objc_msgSend(v4, "addObject:", v12, (void)v17);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }

  char v21 = 0;
  objc_opt_class();
  v13 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"pageControl"];
  v14 = __UIAccessibilityCastAsClass();

  if (v21) {
    goto LABEL_14;
  }
  [v14 accessibilitySetIdentification:@"AXImpactEffectPageControl"];
  [v14 _accessibilitySetRetainedValue:v4 forKey:@"AXImpactEffectPageControlValues"];
  char v21 = 0;
  objc_opt_class();
  v15 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"momentsCollectionView"];
  v16 = __UIAccessibilityCastAsClass();

  if (v21) {
LABEL_14:
  }
    abort();
  [v16 accessibilitySetIdentification:@"AXImpactEffectCollectionView"];
}

- (id)_axFullScreenEffectElement
{
}

- (void)_setAXFullScreenEffectElement:(id)a3
{
}

- (id)accessibilityElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"mainLabel"];
  [v3 addObject:v4];
  LOBYTE(location) = 0;
  objc_opt_class();
  v5 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"typeSegmentedControl"];
  v6 = __UIAccessibilityCastAsClass();

  [v3 addObject:v6];
  id v7 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"closeButton"];
  if ([v6 selectedSegmentIndex])
  {
    uint64_t v8 = [(CKEffectPickerViewAccessibility *)self _axFullScreenEffectElement];
    if (!v8)
    {
      objc_initWeak(&location, self);
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __56__CKEffectPickerViewAccessibility_accessibilityElements__block_invoke;
      v34[3] = &unk_265112E80;
      objc_copyWeak(&v35, &location);
      [v8 _setAccessibilityFrameBlock:v34];
      [(CKEffectPickerViewAccessibility *)self _setAXFullScreenEffectElement:v8];
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    unint64_t v9 = [(CKEffectPickerViewAccessibility *)self safeIntegerForKey:@"selectedMomentIndex"];
    LOBYTE(location) = 0;
    objc_opt_class();
    uint64_t v10 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"momentIdentifiers"];
    v11 = __UIAccessibilityCastAsClass();

    if ((_BYTE)location) {
      goto LABEL_24;
    }
    v33 = v4;
    if (v9 < [v11 count])
    {
      v12 = [v11 objectAtIndex:v9];
      if ([v12 length])
      {
        v13 = _AXCKFullScreenEffectString(v12, 0);
        v14 = _AXCKFullScreenEffectString(v12, 1);
        v15 = __UIAXStringForVariables();
        objc_msgSend(v8, "setAccessibilityLabel:", v15, v14, @"__AXStringForVariablesSentinel");

        [v3 addObject:v8];
      }
    }
    v16 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"sendMomentButton"];
    LOBYTE(location) = 0;
    objc_opt_class();
    long long v17 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"momentTitleLabel"];
    long long v18 = __UIAccessibilityCastAsClass();

    if ((_BYTE)location) {
LABEL_24:
    }
      abort();
    long long v19 = [v18 text];
    [v16 setAccessibilityLabel:v19];

    [v3 addObject:v16];
    [v3 addObject:v7];
    long long v20 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"pageControl"];
    [v3 addObject:v20];

    id v4 = v33;
  }
  else
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    char v21 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectDotButtons"];
    uint64_t v8 = __UIAccessibilityCastAsClass();

    LOBYTE(location) = 0;
    objc_opt_class();
    objc_super v22 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectSendButtons"];
    v11 = __UIAccessibilityCastAsClass();

    uint64_t v23 = [v8 count];
    uint64_t v24 = [(CKEffectPickerViewAccessibility *)self safeUnsignedIntegerForKey:@"selectedIndex"];
    BOOL v25 = v23 < 1;
    uint64_t v26 = v23 - 1;
    if (!v25)
    {
      uint64_t v27 = v24;
      do
      {
        if (v27 == v26)
        {
          v28 = v11;
          uint64_t v29 = v27;
        }
        else
        {
          v28 = v8;
          uint64_t v29 = v26;
        }
        v30 = [v28 objectAtIndex:v29];
        [v3 addObject:v30];

        unint64_t v31 = v26-- + 1;
      }
      while (v31 > 1);
    }
    [v3 addObject:v7];
  }

  return v3;
}

double __56__CKEffectPickerViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"momentsCollectionView"];
  id v4 = __UIAccessibilityCastAsClass();

  [v4 accessibilityFrame];
  double v6 = v5;

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKEffectPickerViewAccessibility;
  BOOL v5 = -[CKEffectPickerViewAccessibility accessibilityScroll:](&v14, sel_accessibilityScroll_);
  objc_opt_class();
  double v6 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"momentsCollectionView"];
  id v7 = __UIAccessibilityCastAsClass();

  uint64_t v8 = [(CKEffectPickerViewAccessibility *)self safeIntegerForKey:@"selectedMomentIndex"];
  if ([v7 _accessibilityViewIsVisible])
  {
    if (a3 == 2)
    {
      objc_opt_class();
      unint64_t v9 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"pageControl"];
      uint64_t v10 = __UIAccessibilityCastAsClass();

      if (v8 < [v10 numberOfPages] - 1)
      {
        v11 = [MEMORY[0x263F088C8] indexPathForRow:v8 + 1 inSection:0];
        BOOL v5 = 1;
        [v7 scrollToItemAtIndexPath:v11 atScrollPosition:16 animated:1];
      }
    }
    else if (a3 == 1 && v8 >= 1)
    {
      v12 = [MEMORY[0x263F088C8] indexPathForRow:v8 - 1 inSection:0];
      [v7 scrollToItemAtIndexPath:v12 atScrollPosition:16 animated:1];

LABEL_10:
      [(CKEffectPickerViewAccessibility *)self performSelector:sel__axUpdateScrollView withObject:0 afterDelay:0.3];
      LOBYTE(v5) = 1;
      goto LABEL_12;
    }
    if (!v5)
    {
      LOBYTE(v5) = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_12:

  return v5;
}

- (void)_axUpdateScrollView
{
  objc_opt_class();
  id v3 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"momentsCollectionView"];
  id v4 = __UIAccessibilityCastAsClass();

  [(CKEffectPickerViewAccessibility *)self scrollViewDidScroll:v4];
  [(CKEffectPickerViewAccessibility *)self scrollViewDidEndDecelerating:v4];
  objc_opt_class();
  BOOL v5 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"pageControl"];
  double v6 = __UIAccessibilityCastAsClass();

  id v7 = [v6 accessibilityValue];
  UIAccessibilitySpeak();
}

- (CKEffectPickerViewAccessibility)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7
{
  v10.receiver = self;
  v10.super_class = (Class)CKEffectPickerViewAccessibility;
  id v7 = -[CKEffectPickerViewAccessibility initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:](&v10, sel_initWithFrame_sendButtonFrame_balloonViewOrigin_composition_color_, *(void *)&a5.x, *(void *)&a5.y, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v11, v12);
  uint64_t v8 = v7;
  if (v7) {
    [(CKEffectPickerViewAccessibility *)v7 _accessibilityLoadAccessibilityInformation];
  }
  return v8;
}

- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5
{
  v23.receiver = self;
  v23.super_class = (Class)CKEffectPickerViewAccessibility;
  id v8 = a3;
  [(CKEffectPickerViewAccessibility *)&v23 addEffect:v8 withDescriptiveText:a4 withIdentifier:a5];
  unint64_t v9 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectLabels"];
  objc_super v10 = [v9 safeValueForKey:@"@lastObject"];
  [v10 setIsAccessibilityElement:0];

  uint64_t v11 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectDescriptiveLabels"];
  uint64_t v12 = [v11 safeValueForKey:@"@lastObject"];
  [v12 setIsAccessibilityElement:0];

  v13 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectDotButtons"];
  objc_super v14 = [v13 safeValueForKey:@"@lastObject"];

  [v14 setAccessibilityLabel:v8];
  v15 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectSendButtons"];
  v16 = [v15 safeValueForKey:@"@lastObject"];

  long long v17 = NSString;
  long long v18 = accessibilityLocalizedString(@"impact.effect.send");
  long long v19 = objc_msgSend(v17, "stringWithFormat:", v18, v8);
  [v16 setAccessibilityLabel:v19];

  long long v20 = NSString;
  char v21 = accessibilityLocalizedString(@"impact.effect.send.hint.format");
  objc_super v22 = objc_msgSend(v20, "stringWithFormat:", v21, v8);

  [v16 setAccessibilityHint:v22];
}

- (void)_touchUpInsideDotButton:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEffectPickerViewAccessibility;
  [(CKEffectPickerViewAccessibility *)&v16 _touchUpInsideDotButton:v4];
  objc_opt_class();
  BOOL v5 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectDotButtons"];
  double v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 indexOfObject:v4];
  char v15 = 0;
  objc_opt_class();
  id v8 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"effectSendButtons"];
  unint64_t v9 = __UIAccessibilityCastAsClass();

  objc_super v10 = [v9 objectAtIndex:v7];

  [(CKEffectPickerViewAccessibility *)self _axUpdateCloseButton];
  dispatch_time_t v11 = dispatch_time(0, 160000000);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__CKEffectPickerViewAccessibility__touchUpInsideDotButton___block_invoke;
  v13[3] = &unk_265112D38;
  id v14 = v10;
  id v12 = v10;
  dispatch_after(v11, MEMORY[0x263EF83A0], v13);
}

void __59__CKEffectPickerViewAccessibility__touchUpInsideDotButton___block_invoke(uint64_t a1)
{
}

- (void)cancelImpactSelection
{
  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerViewAccessibility;
  [(CKEffectPickerViewAccessibility *)&v5 cancelImpactSelection];
  [(CKEffectPickerViewAccessibility *)self _axUpdateCloseButton];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  id v4 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"closeButton"];
  UIAccessibilityPostNotification(v3, v4);
}

- (void)effectTypeDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKEffectPickerViewAccessibility;
  [(CKEffectPickerViewAccessibility *)&v4 effectTypeDidChange:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

- (void)_axUpdateCloseButton
{
  if ([(CKEffectPickerViewAccessibility *)self safeUnsignedIntegerForKey:@"selectedIndex"] == 0x7FFFFFFFFFFFFFFFLL)UIAccessibilityNotifications v3 = @"impact.effect.close"; {
  else
  }
    UIAccessibilityNotifications v3 = @"impact.effect.cancel";
  accessibilityLocalizedString(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [(CKEffectPickerViewAccessibility *)self safeValueForKey:@"closeButton"];
  [v4 setAccessibilityLabel:v5];
}

@end