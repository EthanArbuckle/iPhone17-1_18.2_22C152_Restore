@interface SUUISearchFieldTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation SUUISearchFieldTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUISearchFieldTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUISearchFieldTableView", @"trendingSearchesVisible", "B", 0);
  [v3 validateClass:@"SUUISearchFieldTableView" hasInstanceVariable:@"_pageView" withType:"SUUITrendingSearchPageView"];
}

- (BOOL)isAccessibilityElement
{
  if ([(SUUISearchFieldTableViewAccessibility *)self safeBoolForKey:@"trendingSearchesVisible"])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SUUISearchFieldTableViewAccessibility;
  return [(SUUISearchFieldTableViewAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityElements
{
  if ([(SUUISearchFieldTableViewAccessibility *)self safeBoolForKey:@"trendingSearchesVisible"])
  {
    id v3 = (void *)MEMORY[0x263EFF8C0];
    objc_super v4 = [(SUUISearchFieldTableViewAccessibility *)self safeValueForKey:@"_pageView"];
    v5 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUISearchFieldTableViewAccessibility;
    v5 = [(SUUISearchFieldTableViewAccessibility *)&v7 accessibilityElements];
  }

  return v5;
}

@end