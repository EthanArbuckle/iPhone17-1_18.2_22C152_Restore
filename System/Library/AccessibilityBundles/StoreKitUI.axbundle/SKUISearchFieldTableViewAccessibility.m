@interface SKUISearchFieldTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation SKUISearchFieldTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUISearchFieldTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUISearchFieldTableView", @"trendingSearchesVisible", "B", 0);
  [v3 validateClass:@"SKUISearchFieldTableView" hasInstanceVariable:@"_pageView" withType:"SKUITrendingSearchPageView"];
}

- (BOOL)isAccessibilityElement
{
  if ([(SKUISearchFieldTableViewAccessibility *)self safeBoolForKey:@"trendingSearchesVisible"])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SKUISearchFieldTableViewAccessibility;
  return [(SKUISearchFieldTableViewAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityElements
{
  if ([(SKUISearchFieldTableViewAccessibility *)self safeBoolForKey:@"trendingSearchesVisible"])
  {
    id v3 = (void *)MEMORY[0x263EFF8C0];
    objc_super v4 = [(SKUISearchFieldTableViewAccessibility *)self safeValueForKey:@"_pageView"];
    v5 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUISearchFieldTableViewAccessibility;
    v5 = [(SKUISearchFieldTableViewAccessibility *)&v7 accessibilityElements];
  }

  return v5;
}

@end