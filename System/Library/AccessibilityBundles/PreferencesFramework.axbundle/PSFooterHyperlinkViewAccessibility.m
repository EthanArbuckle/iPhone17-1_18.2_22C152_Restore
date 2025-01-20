@interface PSFooterHyperlinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PSFooterHyperlinkViewAccessibility)initWithSpecifier:(id)a3;
- (id)isAccessibilityUserDefinedElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PSFooterHyperlinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSFooterHyperlinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PSFooterHyperlinkView" hasInstanceVariable:@"_textView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSFooterHyperlinkView", @"initWithSpecifier:", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PSFooterHyperlinkViewAccessibility;
  [(PSFooterHyperlinkViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PSFooterHyperlinkViewAccessibility *)self safeValueForKey:@"_textView"];
  [v3 _accessibilitySetTextViewShouldBreakUpParagraphs:1];
}

- (id)isAccessibilityUserDefinedElement
{
  return (id)MEMORY[0x263EFFA80];
}

- (PSFooterHyperlinkViewAccessibility)initWithSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSFooterHyperlinkViewAccessibility;
  id v3 = [(PSFooterHyperlinkViewAccessibility *)&v5 initWithSpecifier:a3];
  [(PSFooterHyperlinkViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end