@interface GKPurchasableGameCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation GKPurchasableGameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKPurchasableGameCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPurchasableGameCell", @"developerLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPurchasableGameCell", @"priceLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKBaseGameCell", @"nameLabel", "@", 0);
  [v3 validateClass:@"GKPurchasableGameCell" isKindOfClass:@"GKBaseGameCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPurchasableGameCell", @"ratingStarsView", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(GKPurchasableGameCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(GKPurchasableGameCellAccessibility *)self safeValueForKey:@"developerLabel"];
  if ([v5 _accessibilityViewIsVisible])
  {
    v12 = [v5 accessibilityLabel];
    v14 = @"__AXStringForVariablesSentinel";
    uint64_t v6 = __UIAXStringForVariables();

    v4 = (void *)v6;
  }
  v7 = [(GKPurchasableGameCellAccessibility *)self safeValueForKey:@"ratingStarsView", v12, v14];
  if ([v7 _accessibilityViewIsVisible])
  {
    v13 = [v7 accessibilityLabel];
    v15 = @"__AXStringForVariablesSentinel";
    uint64_t v8 = __UIAXStringForVariables();

    v4 = (void *)v8;
  }
  v9 = [(GKPurchasableGameCellAccessibility *)self safeValueForKey:@"priceLabel", v13, v15];
  if ([v9 _accessibilityViewIsVisible])
  {
    uint64_t v10 = __UIAXStringForVariables();

    v4 = (void *)v10;
  }

  return v4;
}

@end