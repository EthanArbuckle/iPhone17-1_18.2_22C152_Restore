@interface MPRouteLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MPRouteLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPRouteLabel";
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
  Class v3 = NSClassFromString(&cfstr_Mrunowplayingh.isa);
  if (v3)
  {
    v4 = [(MPRouteLabelAccessibility *)self _accessibilityAncestorIsKindOf:v3];
    BOOL v5 = v4 == 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MPRouteLabelAccessibility;
    return [(MPRouteLabelAccessibility *)&v7 isAccessibilityElement];
  }
  return v5;
}

- (id)accessibilityLabel
{
  v2 = (void *)MEMORY[0x263F08950];
  Class v3 = [(MPRouteLabelAccessibility *)self safeSetForKey:@"routeNames"];
  v4 = [v3 allObjects];
  BOOL v5 = [v2 localizedStringByJoiningStrings:v4];

  return v5;
}

@end