@interface MFAtomTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFAtomTextViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityPlaceholderValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MFAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFAtomTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFAtomTextView", @"clearButton", "@", 0);
  [v3 validateClass:@"MFAtomTextView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFAtomTextView", @"placeholder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFAtomTextView", @"placeholderLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MFAtomTextViewAccessibility;
  [(MFAtomTextViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFAtomTextViewAccessibility *)self safeValueForKey:@"clearButton"];
  v4 = UIKitAccessibilityLocalizedString();
  [v3 setAccessibilityLabel:v4];

  v5 = [(MFAtomTextViewAccessibility *)self safeValueForKey:@"placeholderLabel"];
  [v5 setIsAccessibilityElement:0];
}

- (id)accessibilityPlaceholderValue
{
  return (id)[(MFAtomTextViewAccessibility *)self safeStringForKey:@"placeholder"];
}

- (MFAtomTextViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFAtomTextViewAccessibility;
  id v3 = -[MFAtomTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFAtomTextViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

void __50___MFAtomTextViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 accessibilityLabel];
  objc_msgSend(v2, "ax_enqueueObject:", v3);
}

@end