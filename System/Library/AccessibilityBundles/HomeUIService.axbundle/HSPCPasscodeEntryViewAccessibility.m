@interface HSPCPasscodeEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axText;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)deleteBackward;
- (void)insertText:(id)a3;
@end

@implementation HSPCPasscodeEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HSPCPasscodeEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HSPCPasscodeEntryView" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCPasscodeEntryView", @"insertText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCPasscodeEntryView", @"deleteBackward", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCPasscodeEntryView", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCPasscodeEntryView", @"numberOfDigits", "Q", 0);
}

- (id)_axText
{
  return (id)[(HSPCPasscodeEntryViewAccessibility *)self safeStringForKey:@"text"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"setupcode.field.label");
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCPasscodeEntryViewAccessibility;
  unint64_t v2 = [(HSPCPasscodeEntryViewAccessibility *)&v8 accessibilityTraits];
  uint64_t v3 = *MEMORY[0x263F81408];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  unint64_t v5 = v3 | v2;
  LODWORD(v2) = [v4 isFirstResponder];

  uint64_t v6 = *MEMORY[0x263F81398];
  if (!v2) {
    uint64_t v6 = 0;
  }
  return v5 | v6;
}

- (id)accessibilityValue
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F21660]);
  v4 = [(HSPCPasscodeEntryViewAccessibility *)self _axText];
  unint64_t v5 = (void *)[v3 initWithString:v4];

  uint64_t v8 = *MEMORY[0x263F21888];
  v9[0] = MEMORY[0x263EFFA88];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 setAttributes:v6];

  return v5;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HSPCPasscodeEntryViewAccessibility *)self _axText];
  uint64_t v6 = [v5 length];

  v13.receiver = self;
  v13.super_class = (Class)HSPCPasscodeEntryViewAccessibility;
  [(HSPCPasscodeEntryViewAccessibility *)&v13 insertText:v4];
  objc_opt_class();
  v7 = __UIAccessibilityCastAsClass();
  uint64_t v8 = [(HSPCPasscodeEntryViewAccessibility *)self safeIntegerForKey:@"numberOfDigits"];
  if ([v7 length]) {
    BOOL v9 = v6 < v8;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
  }
  v10 = [(HSPCPasscodeEntryViewAccessibility *)self _axText];
  uint64_t v11 = [v10 length];

  if (v11 == v8)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
    dispatch_time_t v12 = dispatch_time(0, 750000000);
    dispatch_after(v12, MEMORY[0x263EF83A0], &__block_literal_global_0);
  }
}

void __49__HSPCPasscodeEntryViewAccessibility_insertText___block_invoke()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"setupcode.completed.manual.entry");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

- (void)deleteBackward
{
  id v3 = [(HSPCPasscodeEntryViewAccessibility *)self _axText];
  v8.receiver = self;
  v8.super_class = (Class)HSPCPasscodeEntryViewAccessibility;
  [(HSPCPasscodeEntryViewAccessibility *)&v8 deleteBackward];
  if ([v3 length])
  {
    id v4 = objc_msgSend(v3, "substringWithRange:", objc_msgSend(v3, "length") - 1, 1);
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [v4 length];
  if (v5) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v5) {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
  }
  else {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F812C8];
  }
  UIAccessibilityPostNotification(v7, v6);
}

@end