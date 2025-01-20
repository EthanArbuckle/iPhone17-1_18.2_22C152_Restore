@interface VKCCornerLookupButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIncludeRoleDescription;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityRoleDescription;
- (id)accessibilityLabel;
- (id)axPositionInButtonsList;
- (void)_axSetPositionInButtonsList:(id)a3;
@end

@implementation VKCCornerLookupButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCCornerLookupButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)axPositionInButtonsList
{
}

- (void)_axSetPositionInButtonsList:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCCornerLookupButton", @"_symbolNameForItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCCornerLookupButton", @"resultItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResultItem", @"domainInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MADVIVisualSearchGatingDomainInfo", @"domain", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(VKCCornerLookupButtonAccessibility *)self safeStringForKey:@"_symbolNameForItem"];
  v4 = [(VKCCornerLookupButtonAccessibility *)self safeValueForKey:@"resultItem"];
  v5 = [v4 safeValueForKey:@"domainInfo"];

  v6 = [v5 safeStringForKey:@"domain"];
  v7 = accessibilityLookupButtonName(v3, v6);

  return v7;
}

- (BOOL)_accessibilityIncludeRoleDescription
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"lookup.role.description");
}

@end