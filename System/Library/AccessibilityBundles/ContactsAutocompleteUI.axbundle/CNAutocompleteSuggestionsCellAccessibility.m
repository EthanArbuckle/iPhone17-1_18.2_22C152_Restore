@interface CNAutocompleteSuggestionsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CNAutocompleteSuggestionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAutocompleteSuggestionsCell";
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
  return (id)[(CNAutocompleteSuggestionsCellAccessibility *)self safeStringForKey:@"displayString"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CNAutocompleteSuggestionsCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CNAutocompleteSuggestionsCellAccessibility *)&v3 accessibilityTraits];
}

@end