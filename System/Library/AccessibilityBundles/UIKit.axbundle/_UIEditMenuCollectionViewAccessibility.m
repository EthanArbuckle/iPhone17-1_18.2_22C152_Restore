@interface _UIEditMenuCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)decrementTargetPage;
- (void)incrementTargetPage;
@end

@implementation _UIEditMenuCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIEditMenuCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIEditMenuCollectionView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIEditMenuCollectionView", @"currentPage", "d", 0);
  v3 = "v";
  [location[0] validateClass:v4 hasInstanceMethod:@"incrementTargetPage" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"decrementTargetPage", v3, 0);
  v5 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"setTargetPage:", v3, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"pages", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"targetPage", v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)incrementTargetPage
{
  v11 = self;
  SEL v10 = a2;
  [(_UIEditMenuCollectionViewAccessibility *)self safeFloatForKey:@"currentPage"];
  double v9 = v2;
  [(_UIEditMenuCollectionViewAccessibility *)v11 setTargetPage:(uint64_t)v2];
  v8.receiver = v11;
  v8.super_class = (Class)_UIEditMenuCollectionViewAccessibility;
  [(_UIEditMenuCollectionViewAccessibility *)&v8 incrementTargetPage];
  id v7 = (id)[(_UIEditMenuCollectionViewAccessibility *)v11 safeArrayForKey:@"pages"];
  uint64_t v6 = [(_UIEditMenuCollectionViewAccessibility *)v11 safeIntegerForKey:@"targetPage"];
  if (v6 == [v7 count] - 1)
  {
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsClass();
    id v3 = (id)[v5 visibleCells];
    id argument = (id)[v3 lastObject];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v7, 0);
}

- (void)decrementTargetPage
{
  uint64_t v6 = self;
  SEL v5 = a2;
  [(_UIEditMenuCollectionViewAccessibility *)self safeFloatForKey:@"currentPage"];
  double v4 = v2;
  [(_UIEditMenuCollectionViewAccessibility *)v6 setTargetPage:(uint64_t)v2];
  v3.receiver = v6;
  v3.super_class = (Class)_UIEditMenuCollectionViewAccessibility;
  [(_UIEditMenuCollectionViewAccessibility *)&v3 decrementTargetPage];
  if (![(_UIEditMenuCollectionViewAccessibility *)v6 safeIntegerForKey:@"targetPage"]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
  }
}

@end