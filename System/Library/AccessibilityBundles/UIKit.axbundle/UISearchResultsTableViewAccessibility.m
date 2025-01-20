@interface UISearchResultsTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (id)accessibilityLabel;
@end

@implementation UISearchResultsTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchResultsTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 0;
}

- (id)accessibilityLabel
{
  v7 = self;
  location[1] = (id)a2;
  if ([(UISearchResultsTableViewAccessibility *)self accessibilityElementCount])
  {
    id v8 = accessibilityLocalizedString(@"search.results");
  }
  else
  {
    id v5 = (id)[(UISearchResultsTableViewAccessibility *)v7 safeValueForKey:@"controller"];
    id v4 = (id)[v5 safeValueForKey:@"_noResultsLabel"];
    location[0] = (id)[v4 accessibilityLabel];

    if ([location[0] length]) {
      id v8 = location[0];
    }
    else {
      id v8 = accessibilityLocalizedString(@"no.search.results");
    }
    objc_storeStrong(location, 0);
  }
  v2 = v8;

  return v2;
}

@end