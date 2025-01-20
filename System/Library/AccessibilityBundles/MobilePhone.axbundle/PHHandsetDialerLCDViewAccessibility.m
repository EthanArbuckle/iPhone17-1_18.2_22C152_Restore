@interface PHHandsetDialerLCDViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)hasText;
- (BOOL)shouldGroupAccessibilityChildren;
- (PHHandsetDialerLCDViewAccessibility)initWithFrame:(CGRect)a3 forDialerType:(int)a4;
- (double)_accessibilityAllowedGeometryOverlap;
- (id)_accessibilitySubviews;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_voStatusChanged:(id)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)deleteCharacter;
- (void)insertText:(id)a3;
- (void)setText:(id)a3 needsFormat:(BOOL)a4;
- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5;
@end

@implementation PHHandsetDialerLCDViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHHandsetDialerLCDView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"updateAddAndDeleteButtonForText: name: animated:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"initWithFrame: forDialerType:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"phonePadView", "@", 0);
  [v3 validateClass:@"PHDialerContactResultButtonView"];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (PHHandsetDialerLCDViewAccessibility)initWithFrame:(CGRect)a3 forDialerType:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  v4 = -[PHHandsetDialerLCDViewAccessibility initWithFrame:forDialerType:](&v6, sel_initWithFrame_forDialerType_, *(void *)&a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PHHandsetDialerLCDViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  [(PHHandsetDialerLCDViewAccessibility *)&v4 dealloc];
}

- (double)_accessibilityAllowedGeometryOverlap
{
  [(PHHandsetDialerLCDViewAccessibility *)self bounds];
  return v2;
}

- (void)_voStatusChanged:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v4 = [MEMORY[0x263F1C738] activeInstance];
    [v4 setDelegate:self];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20.receiver = self;
  v20.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  [(PHHandsetDialerLCDViewAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__voStatusChanged_ name:*MEMORY[0x263F1CF90] object:0];

  id v4 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"_numberTextField"];
  [v4 setAccessibilityIdentifier:@"PhoneNumberLabel"];

  v5 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"_numberTextField"];
  objc_super v6 = accessibilityLocalizedString(@"phone.display");
  [v5 setAccessibilityLabel:v6];

  v7 = [(PHHandsetDialerLCDViewAccessibility *)self safeUIViewForKey:@"contactResultButton"];
  objc_initWeak(&location, v7);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__PHHandsetDialerLCDViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_265134F20;
  objc_copyWeak(&v18, &location);
  id v8 = objc_loadWeakRetained(&location);
  [v8 setAccessibilityLabelBlock:v17];

  v9 = [(PHHandsetDialerLCDViewAccessibility *)self safeUIViewForKey:@"contactCountButton"];
  objc_initWeak(&from, v9);

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __81__PHHandsetDialerLCDViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v14 = &unk_265134F20;
  objc_copyWeak(&v15, &from);
  id v10 = objc_loadWeakRetained(&from);
  [v10 setAccessibilityLabelBlock:&v11];

  -[PHHandsetDialerLCDViewAccessibility _voStatusChanged:](self, "_voStatusChanged:", 0, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

id __81__PHHandsetDialerLCDViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = UIAXStringForAllChildren();

  return v2;
}

id __81__PHHandsetDialerLCDViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = UIAXStringForAllChildren();

  return v2;
}

- (BOOL)hasText
{
  double v2 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"_numberTextField"];
  id v3 = [v2 safeValueForKey:@"text"];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  v5 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"delegate"];
  objc_super v6 = [v5 safeValueForKey:@"delegate"];

  NSClassFromString(&cfstr_Dialercontroll.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AXAssert();
    goto LABEL_10;
  }
  if ([v4 length] == 1)
  {
    uint64_t v7 = [v4 characterAtIndex:0];
    id v8 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    char v9 = [v8 characterIsMember:v7];

    if ((v9 & 1) != 0 || v7 == 35) {
      goto LABEL_7;
    }
    if (v7 == 61)
    {
LABEL_8:
      id v10 = v6;
      AXPerformSafeBlock();

      goto LABEL_10;
    }
    if (v7 == 42)
    {
LABEL_7:
      id v11 = v6;
      id v12 = v4;
      AXPerformSafeBlock();

      if (v7 == 61) {
        goto LABEL_8;
      }
    }
  }
LABEL_10:
}

uint64_t __50__PHHandsetDialerLCDViewAccessibility_insertText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) phonePad:0 appendString:*(void *)(a1 + 40)];
}

uint64_t __50__PHHandsetDialerLCDViewAccessibility_insertText___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callButtonPressed:0];
}

- (void)deleteBackward
{
  id v2 = (id)[(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"deleteCharacter"];
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"text"];
  id v8 = UIUnformattedPhoneNumberFromString();

  v14.receiver = self;
  v14.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  [(PHHandsetDialerLCDViewAccessibility *)&v14 setText:v6 needsFormat:v4];

  char v9 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"text"];
  id v10 = UIUnformattedPhoneNumberFromString();

  unint64_t v11 = [v8 length];
  if (v11 < [v10 length])
  {
    id v12 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v8, "length"));
    v13 = [MEMORY[0x263F21660] axAttributedStringWithString:v12];
    [v13 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F218E0]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
  }
}

- (void)deleteCharacter
{
  id v3 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"text"];
  BOOL v4 = UIUnformattedPhoneNumberFromString();

  v10.receiver = self;
  v10.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  [(PHHandsetDialerLCDViewAccessibility *)&v10 deleteCharacter];
  v5 = [(PHHandsetDialerLCDViewAccessibility *)self safeValueForKey:@"text"];
  id v6 = UIUnformattedPhoneNumberFromString();

  unint64_t v7 = [v4 length];
  if (v7 > [v6 length])
  {
    id v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length"));
    char v9 = [MEMORY[0x263F21660] axAttributedStringWithString:v8];
    [v9 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F218D8]];
    [v9 setAttribute:&unk_26F719B60 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
  }
}

- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  [(PHHandsetDialerLCDViewAccessibility *)&v14 updateAddAndDeleteButtonForText:v8 name:v9 animated:v5];
  if ([v8 length])
  {
    objc_super v10 = 0;
  }
  else
  {
    objc_opt_class();
    unint64_t v11 = __UIAccessibilityCastAsClass();
    id v12 = [v11 superview];

    objc_opt_class();
    v13 = __UIAccessibilityCastAsClass();
    objc_super v10 = [v13 safeValueForKey:@"phonePadView"];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v10);
}

- (id)_accessibilitySubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  id v2 = [(PHHandsetDialerLCDViewAccessibility *)&v5 _accessibilitySubviews];
  id v3 = [v2 axFilterObjectsUsingBlock:&__block_literal_global_0];

  return v3;
}

uint64_t __61__PHHandsetDialerLCDViewAccessibility__accessibilitySubviews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 _accessibilityViewIsVisible];

  return v4;
}

@end