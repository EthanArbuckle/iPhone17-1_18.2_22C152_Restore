@interface NikeUITableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
@end

@implementation NikeUITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [(NikeUITableViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"TableWithFakeHeaderFooter"];

  if (v4)
  {
    v5 = [(NikeUITableViewAccessibility *)self _accessibilityValueForKey:@"_axHeader"];
    v9[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NikeUITableViewAccessibility;
    v6 = [(NikeUITableViewAccessibility *)&v8 _accessibilitySupplementaryHeaderViews];
  }

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [(NikeUITableViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"TableWithFakeHeaderFooter"];

  if (v4)
  {
    v5 = [(NikeUITableViewAccessibility *)self _accessibilityValueForKey:@"_axFooter"];
    v9[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NikeUITableViewAccessibility;
    v6 = [(NikeUITableViewAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  }

  return v6;
}

@end