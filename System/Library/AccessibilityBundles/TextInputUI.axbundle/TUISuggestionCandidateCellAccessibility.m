@interface TUISuggestionCandidateCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TUISuggestionCandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUISuggestionCandidateCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(TUISuggestionCandidateCellAccessibility *)self safeValueForKey:@"textLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F811F8];
}

- (BOOL)isAccessibilityElement
{
  if (AXRequestingClient() == 4) {
    return 1;
  }
  v4 = [(TUISuggestionCandidateCellAccessibility *)self accessibilityLabel];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

@end