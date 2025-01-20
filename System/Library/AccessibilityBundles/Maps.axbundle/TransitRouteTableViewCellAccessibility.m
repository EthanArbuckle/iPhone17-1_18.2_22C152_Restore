@interface TransitRouteTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)tableTextAccessibleLabel:(id)a3;
@end

@implementation TransitRouteTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TransitRouteTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TransitRouteTableViewCell" hasInstanceVariable:@"_route" withType:"GEOComposedRoute"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"tableTextAccessibleLabel:", "@", 0);
  [v3 validateClass:@"TransitRouteTableViewCell" isKindOfClass:@"RouteTableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteTableViewCell", @"useRoutePreviewDescription", "B", 0);
}

- (id)tableTextAccessibleLabel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TransitRouteTableViewCellAccessibility;
  v5 = [(TransitRouteTableViewCellAccessibility *)&v12 tableTextAccessibleLabel:v4];
  objc_opt_class();
  v6 = [(TransitRouteTableViewCellAccessibility *)self safeValueForKey:@"_route"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 _accessibilityTransitArtworkText];

  v9 = __AXStringForVariables();

  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v10 = objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", @"·", @",", v5, @"__AXStringForVariablesSentinel");

    v9 = (void *)v10;
  }

  return v9;
}

- (id)accessibilityHint
{
  if ([(TransitRouteTableViewCellAccessibility *)self safeBoolForKey:@"useRoutePreviewDescription"])
  {
    id v3 = AXMapsLocString(@"TRANSIT_PREVIEW_HINT");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TransitRouteTableViewCellAccessibility;
    id v3 = [(TransitRouteTableViewCellAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

@end