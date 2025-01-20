@interface SearchResultAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SearchResultAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchResult";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(SearchResultAccessibility *)self safeValueForKey:@"infoCardTitle"];
  v4 = [(SearchResultAccessibility *)self safeValueForKey:@"locationTitle"];
  if ([v3 isEqualToString:v4])
  {
    id v5 = v3;
  }
  else
  {
    v12 = v4;
    v13 = @"__AXStringForVariablesSentinel";
    __UIAXStringForVariables();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = [(SearchResultAccessibility *)self safeValueForKey:@"appearance", v12, v13];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 2)
  {
    v9 = AXMapsLocString(@"ROUTE_ORIGIN");
    uint64_t v10 = __UIAXStringForVariables();

    v6 = (void *)v10;
  }

  return v6;
}

@end