@interface SiriRestaurantsDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_configurePhoneCell:(id)a3 forItem:(int64_t)a4;
- (void)_configureReviewsCell:(id)a3 forItem:(int64_t)a4;
- (void)_configureURLCell:(id)a3 forItem:(int64_t)a4;
@end

@implementation SiriRestaurantsDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriRestaurantsDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_configurePhoneCell:(id)a3 forItem:(int64_t)a4
{
  id v6 = a3;
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v9.receiver = self;
  v9.super_class = (Class)SiriRestaurantsDetailViewControllerAccessibility;
  [(SiriRestaurantsDetailViewControllerAccessibility *)&v9 _configurePhoneCell:v6 forItem:a4];
  v7 = [v6 safeValueForKey:@"textLabel"];
  v8 = [v7 accessibilityLabel];
  [v6 setAccessibilityLabel:v8];
}

- (void)_configureURLCell:(id)a3 forItem:(int64_t)a4
{
  id v6 = a3;
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CF10]];
  v9.receiver = self;
  v9.super_class = (Class)SiriRestaurantsDetailViewControllerAccessibility;
  [(SiriRestaurantsDetailViewControllerAccessibility *)&v9 _configureURLCell:v6 forItem:a4];
  v7 = [v6 safeValueForKey:@"textLabel"];
  v8 = [v7 accessibilityLabel];
  [v6 setAccessibilityLabel:v8];
}

- (void)_configureReviewsCell:(id)a3 forItem:(int64_t)a4
{
  id v6 = a3;
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v12.receiver = self;
  v12.super_class = (Class)SiriRestaurantsDetailViewControllerAccessibility;
  [(SiriRestaurantsDetailViewControllerAccessibility *)&v12 _configureReviewsCell:v6 forItem:a4];
  v7 = [v6 _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v8 = [v7 accessibilityLabel];
  objc_super v9 = [v6 safeValueForKey:@"textLabel"];
  v10 = [v9 accessibilityLabel];
  v11 = __UIAXStringForVariables();
  objc_msgSend(v6, "setAccessibilityLabel:", v11, v10, @"__AXStringForVariablesSentinel");
}

uint64_t __82__SiriRestaurantsDetailViewControllerAccessibility__configureReviewsCell_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Siriuistarsvie.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end