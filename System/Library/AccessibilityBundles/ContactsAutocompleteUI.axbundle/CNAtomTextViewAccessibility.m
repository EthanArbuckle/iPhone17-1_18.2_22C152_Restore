@interface CNAtomTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CNAtomTextViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityPlaceholderValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAtomTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomTextView", @"clearButton", "@", 0);
  [v3 validateClass:@"CNAtomTextView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomTextView", @"placeholder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomTextView", @"placeholderLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CNAtomTextViewAccessibility;
  [(CNAtomTextViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNAtomTextViewAccessibility *)self safeValueForKey:@"clearButton"];
  v4 = UIKitAccessibilityLocalizedString();
  [v3 setAccessibilityLabel:v4];

  v5 = [(CNAtomTextViewAccessibility *)self safeValueForKey:@"placeholderLabel"];
  [v5 setIsAccessibilityElement:0];
}

- (id)accessibilityPlaceholderValue
{
  return (id)[(CNAtomTextViewAccessibility *)self safeStringForKey:@"placeholder"];
}

- (CNAtomTextViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAtomTextViewAccessibility;
  id v3 = -[CNAtomTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CNAtomTextViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

void __60___CNAtomTextViewAccessibility_accessibilityAttributedValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = a2;
  v7 = (void *)MEMORY[0x263F216E0];
  v8 = [v13 objectForKeyedSubscript:*MEMORY[0x263F216E0]];

  v9 = v13;
  if (v8)
  {
    v10 = [v13 objectForKeyedSubscript:*v7];
    v11 = [v10 accessibilityLabel];

    v12 = [v11 stringByAppendingString:@" "];

    if ([v12 length])
    {
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + a3, a4, v12);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v12 length] - a4;
    }

    v9 = v13;
  }
}

@end