@interface SearchUIHomeScreenAppIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUIHomeScreenAppIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIHomeScreenAppIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHomeScreenAppIconView", @"rowModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIRowModel", @"identifyingResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFSearchResult", @"title", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SearchUIHomeScreenAppIconViewAccessibility *)self safeValueForKeyPath:@"rowModel.identifyingResult.title"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end