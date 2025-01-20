@interface TPNumberPadButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TPNumberPadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPNumberPadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"TPNumberPadButton", @"usesTelephonyGlyphsWhereAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"TPNumberPadButton", @"localizedLettersForCharacter:", "@", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  if ([(TPNumberPadButtonAccessibility *)self isHidden]) {
    return 0;
  }
  [(TPNumberPadButtonAccessibility *)self alpha];
  if (v3 <= 0.0) {
    return 0;
  }
  v4 = [(TPNumberPadButtonAccessibility *)self accessibilityLabel];
  BOOL v5 = v4 != 0;

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF08] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF28];
}

- (id)accessibilityHint
{
  double v3 = [(TPNumberPadButtonAccessibility *)self safeValueForKey:@"character"];
  int v4 = [v3 intValue];

  int v5 = v4 - 1;
  if ((v4 - 1) > 7)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __51__TPNumberPadButtonAccessibility_accessibilityHint__block_invoke;
    v14 = &unk_26515F040;
    v15 = self;
    v16 = &v18;
    int v17 = v4;
    AXPerformSafeBlock();
    id v6 = (id)v19[5];
    _Block_object_dispose(&v18, 8);
  }
  if (![v6 length])
  {
    v7 = @"2.key.hint";
    switch(v5)
    {
      case 0:
        goto LABEL_15;
      case 1:
        v7 = @"3.key.hint";
        goto LABEL_15;
      case 2:
        v7 = @"4.key.hint";
        goto LABEL_15;
      case 3:
        v7 = @"5.key.hint";
        goto LABEL_15;
      case 4:
        v7 = @"6.key.hint";
        goto LABEL_15;
      case 5:
        v7 = @"7.key.hint";
        goto LABEL_15;
      case 6:
        v7 = @"8.key.hint";
        goto LABEL_15;
      case 7:
        v7 = @"9.key.hint";
        goto LABEL_15;
      case 9:
        if (([(id)objc_opt_class() safeBoolForKey:@"usesTelephonyGlyphsWhereAvailable"] & 1) == 0) {
          goto LABEL_20;
        }
        v7 = @"0.key.hint";
LABEL_15:

        id v6 = v7;
        goto LABEL_16;
      default:
LABEL_20:
        if (v6)
        {
LABEL_16:
          uint64_t v8 = accessibilityLocalizedString(v6);

          id v6 = (id)v8;
        }
        else
        {
          v10.receiver = self;
          v10.super_class = (Class)TPNumberPadButtonAccessibility;
          id v6 = [(TPNumberPadButtonAccessibility *)&v10 accessibilityHint];
        }
        break;
    }
  }

  return v6;
}

uint64_t __51__TPNumberPadButtonAccessibility_accessibilityHint__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)objc_opt_class() localizedLettersForCharacter:*(int *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(TPNumberPadButtonAccessibility *)self safeValueForKey:@"character"];
  int v3 = [v2 intValue];

  int v4 = @"number.pad.star";
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      int v5 = AXFormatInteger();
      goto LABEL_4;
    case 9:
      goto LABEL_7;
    case 11:
      int v4 = @"number.pad.octothorpe";
      goto LABEL_7;
    case 12:
      int v4 = @"number.pad.delete";
LABEL_7:
      accessibilityLocalizedString(v4);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      int v5 = 0;
LABEL_4:
      id v6 = v5;
      int v4 = v6;
      break;
  }
  v7 = v6;

  return v7;
}

@end