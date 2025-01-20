@interface CKMentionSuggestionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CKMentionSuggestionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMentionSuggestionCell";
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
  v2 = [(CKMentionSuggestionCellAccessibility *)self safeValueForKey:@"handleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

@end