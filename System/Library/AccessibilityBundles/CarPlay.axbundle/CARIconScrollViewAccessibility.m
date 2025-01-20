@interface CARIconScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
@end

@implementation CARIconScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CARIconScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CARFolderView"];
  [v3 validateClass:@"_CARDashboardHomeViewController"];
  [v3 validateClass:@"CARTodayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CARDashboardHomeViewController", @"todayViewController", "@", 0);
}

- (id)automationElements
{
  objc_opt_class();
  id v3 = [(CARIconScrollViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:0];
  v4 = [v3 _accessibilityViewController];
  v5 = [v4 safeValueForKey:@"todayViewController"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(CARIconScrollViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245646520](@"CARFolderView")];
  v8 = __UIAccessibilityCastAsSafeCategory();

  v9 = (void *)MEMORY[0x263EFF8C0];
  v10 = [v6 view];
  v11 = objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 1, v10);
  v12 = [v8 automationElements];
  v13 = objc_msgSend(v9, "axArrayWithPossiblyNilArrays:", 2, v11, v12);

  return v13;
}

uint64_t __52__CARIconScrollViewAccessibility_automationElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x245646520](@"_CARDashboardHomeViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end