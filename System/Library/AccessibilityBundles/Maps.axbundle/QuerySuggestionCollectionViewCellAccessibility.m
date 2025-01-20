@interface QuerySuggestionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation QuerySuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QuerySuggestionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QuerySuggestionCollectionViewCell", @"querySuggestionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QuerySuggestionView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QuerySuggestionView", @"detailText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(QuerySuggestionCollectionViewCellAccessibility *)self safeValueForKey:@"querySuggestionView"];
  id v3 = [v2 safeValueForKey:@"title"];
  v6 = [v2 safeValueForKey:@"detailText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end