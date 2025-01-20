@interface MRUMediaSuggestionsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation MRUMediaSuggestionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUMediaSuggestionsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"media.suggestions.label");
}

@end