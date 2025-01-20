@interface PosterCoupledTitlesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4;
@end

@implementation PosterCoupledTitlesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterCoupledTitlesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.PosterCoupledTitlesView" hasSwiftFieldOfAnyClass:@"titleLabel"];
  [v3 validateClass:@"PosterBoard.PosterRackCollectionViewController" hasSwiftField:@"layoutMode" withSwiftType:"PRUISSwitcherLayoutMode"];
  [v3 validateClass:@"PosterBoard.PosterCoupledTitlesView" isKindOfClass:@"UICollectionReusableView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionReusableView", @"didTransitionFromLayout:toLayout:", "v", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PosterCoupledTitlesViewAccessibility;
  [(PosterCoupledTitlesViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PosterCoupledTitlesViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F83268]];
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(PosterCoupledTitlesViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  objc_super v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (int64_t)_accessibilitySortPriority
{
  return 100;
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PosterCoupledTitlesViewAccessibility;
  [(PosterCoupledTitlesViewAccessibility *)&v13 didTransitionFromLayout:v6 toLayout:v7];
  objc_opt_class();
  v8 = [v7 collectionView];
  v9 = [v8 dataSource];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 safeSwiftValueForKey:@"layoutMode"];
  uint64_t v12 = AXConvertToLayoutMode();

  if (v12 == 3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F831C0], self);
  }
}

@end