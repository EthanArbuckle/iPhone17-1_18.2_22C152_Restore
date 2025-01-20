@interface CNComposeRecipientTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CNComposeRecipientTextViewAccessibility)initWithFrame:(CGRect)a3;
- (id)automationElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_ensureInactiveTextView;
@end

@implementation CNComposeRecipientTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNComposeRecipientTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNComposeRecipientTextView" hasInstanceVariable:@"_inactiveTextView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"_ensureInactiveTextView", "v", 0);
  [v3 validateClass:@"CNComposeRecipientTextView" isKindOfClass:@"CNComposeHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeHeaderView", @"labelView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"textView", "@", 0);
  [v3 validateClass:@"CNComposeRecipientAtom"];
  [v3 validateClass:@"CNComposeRecipientAtom" hasInstanceVariable:@"_recipient" withType:"CNComposeRecipient"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipient", @"displayString", "@", 0);
  [v3 validateClass:@"CNComposeRecipientTextView" hasInstanceVariable:@"_atomViews" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"addButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  [(CNComposeRecipientTextViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNComposeRecipientTextViewAccessibility *)self safeValueForKey:@"_inactiveTextView"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(CNComposeRecipientTextViewAccessibility *)self safeValueForKey:@"_inactiveTextView"];
  [v4 _accessibilitySetTextViewShouldBreakUpParagraphs:0];

  v5 = [(CNComposeRecipientTextViewAccessibility *)self safeValueForKey:@"labelView"];
  [v5 setIsAccessibilityElement:0];
}

- (id)automationElements
{
  v8.receiver = self;
  v8.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  id v3 = [(CNComposeRecipientTextViewAccessibility *)&v8 automationElements];
  uint64_t v4 = [v3 mutableCopy];
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    v5 = [MEMORY[0x263EFF980] array];

    if (!v5)
    {
      v5 = [MEMORY[0x263EFF980] array];
    }
  }
  objc_super v6 = [(CNComposeRecipientTextViewAccessibility *)self safeValueForKey:@"labelView"];
  [v5 axSafelyAddObject:v6];

  return v5;
}

- (void)_ensureInactiveTextView
{
  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  [(CNComposeRecipientTextViewAccessibility *)&v3 _ensureInactiveTextView];
  [(CNComposeRecipientTextViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (CNComposeRecipientTextViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  objc_super v3 = -[CNComposeRecipientTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CNComposeRecipientTextViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end