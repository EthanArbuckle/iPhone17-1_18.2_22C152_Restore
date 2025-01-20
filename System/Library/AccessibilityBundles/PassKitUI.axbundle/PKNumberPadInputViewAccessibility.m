@interface PKNumberPadInputViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_createBorderedButtonForButtonValue:(unint64_t)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5;
@end

@implementation PKNumberPadInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKNumberPadInputView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKBorderedButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKNumberPadInputView", @"_createBorderedButtonForButtonValue:withBorder:primaryAction:", "Q", "Q", "@", 0);
}

- (id)_createBorderedButtonForButtonValue:(unint64_t)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKNumberPadInputViewAccessibility;
  v9 = [(PKNumberPadInputViewAccessibility *)&v15 _createBorderedButtonForButtonValue:a3 withBorder:a4 primaryAction:v8];
  objc_opt_class();
  v10 = __UIAccessibilityCastAsClass();
  v11 = v10;
  if (a3 == 11)
  {
    [v10 setAccessibilityTextualContext:*MEMORY[0x263F220D0]];
  }
  else if (a3 == 10)
  {
    v12 = accessibilityLocalizedString(@"keypad.delete");
    [v11 setAccessibilityValue:v12];

    uint64_t v13 = [v11 accessibilityTraits];
    [v11 setAccessibilityTraits:*MEMORY[0x263F81378] | v13];
  }

  return v9;
}

@end