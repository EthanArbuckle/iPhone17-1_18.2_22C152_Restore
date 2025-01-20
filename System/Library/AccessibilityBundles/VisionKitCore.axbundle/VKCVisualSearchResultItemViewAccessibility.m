@interface VKCVisualSearchResultItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIncludeRoleDescription;
- (BOOL)_accessibilityShouldIncludeParentCustomActions;
- (BOOL)_accessibilityShouldIncludeParentCustomContent;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityRoleDescription;
- (id)accessibilityLabel;
- (id)automationElements;
- (id)axPositionInButtonsList;
- (void)_axSetPositionInButtonsList:(id)a3;
@end

@implementation VKCVisualSearchResultItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCVisualSearchResultItemView";
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResultItemView", @"_symbolNameForItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResultItemView", @"visualSearchResultItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResultItem", @"resultItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MADVIVisualSearchGatingResultItem", @"domains", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MADVIVisualSearchGatingDomainInfo", @"domain", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResultItemView", @"lookupButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(VKCVisualSearchResultItemViewAccessibility *)self safeStringForKey:@"_symbolNameForItem"];
  v4 = [(VKCVisualSearchResultItemViewAccessibility *)self safeValueForKeyPath:@"visualSearchResultItem.resultItem"];
  v5 = [v4 safeArrayForKey:@"domains"];

  if ([v5 count])
  {
    v6 = [v5 firstObject];
    v7 = [v6 safeStringForKey:@"domain"];
  }
  else
  {
    v7 = 0;
  }
  v8 = accessibilityLookupButtonName(v3, v7);

  return v8;
}

- (BOOL)_accessibilityShouldIncludeParentCustomActions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeParentCustomContent
{
  return 0;
}

- (BOOL)_accessibilityIncludeRoleDescription
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"lookup.role.description");
}

- (id)automationElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(VKCVisualSearchResultItemViewAccessibility *)self safeValueForKey:@"lookupButton"];
  v5 = __UIAccessibilitySafeClass();
  char v6 = [v5 isHidden];

  if ((v6 & 1) == 0) {
    [v3 axSafelyAddObject:v4];
  }

  return v3;
}

@end