@interface CNContactGeminiViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CNContactGeminiViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactGeminiView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactGeminiViewAccessibility;
  unint64_t v3 = [(CNContactGeminiViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(CNContactGeminiViewAccessibility *)self safeBoolForKey:@"shouldDisplayChevron"];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end