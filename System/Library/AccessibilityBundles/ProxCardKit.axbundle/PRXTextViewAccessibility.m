@interface PRXTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs;
- (id)accessibilityAttributedValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PRXTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRXTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PRXTextView" isKindOfClass:@"UITextView"];
  [v3 validateClass:@"PRXTextView" hasInstanceVariable:@"_style" withType:"q"];
}

- (id)accessibilityValue
{
  return 0;
}

- (id)accessibilityAttributedValue
{
  return 0;
}

- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs
{
  return 0;
}

- (id)accessibilityLabel
{
  v4.receiver = self;
  v4.super_class = (Class)PRXTextViewAccessibility;
  v2 = [(PRXTextViewAccessibility *)&v4 accessibilityValue];

  return v2;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = [(PRXTextViewAccessibility *)self safeIntegerForKey:@"_style"];
  id v3 = (unint64_t *)MEMORY[0x263F1CEF8];
  if (v2) {
    id v3 = (unint64_t *)MEMORY[0x263F1CF48];
  }
  return *v3;
}

@end