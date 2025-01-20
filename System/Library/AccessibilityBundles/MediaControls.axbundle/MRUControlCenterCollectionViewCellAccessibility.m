@interface MRUControlCenterCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation MRUControlCenterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUControlCenterCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUControlCenterCollectionViewCell", @"cellContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingCellContentView", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"transportButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"routingButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MRUControlCenterCollectionViewCellAccessibility *)self safeValueForKey:@"cellContentView"];
  id v3 = [v2 safeValueForKey:@"headerView"];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v12.receiver = self;
  v12.super_class = (Class)MRUControlCenterCollectionViewCellAccessibility;
  v4 = [(MRUControlCenterCollectionViewCellAccessibility *)&v12 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(MRUControlCenterCollectionViewCellAccessibility *)self safeValueForKey:@"cellContentView"];
  v6 = [v5 safeValueForKey:@"headerView"];
  v7 = [v6 safeValueForKey:@"transportButton"];

  v8 = [(MRUControlCenterCollectionViewCellAccessibility *)self safeValueForKey:@"cellContentView"];
  v9 = [v8 safeValueForKey:@"headerView"];
  v10 = [v9 safeValueForKey:@"routingButton"];

  [v3 axSafelyAddObject:v7];
  [v3 axSafelyAddObject:v10];

  return v3;
}

@end