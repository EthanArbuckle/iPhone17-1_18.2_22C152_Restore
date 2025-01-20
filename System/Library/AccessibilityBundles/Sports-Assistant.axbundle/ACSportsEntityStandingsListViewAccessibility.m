@interface ACSportsEntityStandingsListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)configureDomainObjectView:(id)a3 withDomainObject:(id)a4 beforeDomainObject:(id)a5 afterDomainObject:(id)a6 league:(id)a7 index:(unint64_t)a8;
@end

@implementation ACSportsEntityStandingsListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsEntityStandingsListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)configureDomainObjectView:(id)a3 withDomainObject:(id)a4 beforeDomainObject:(id)a5 afterDomainObject:(id)a6 league:(id)a7 index:(unint64_t)a8
{
  v9.receiver = self;
  v9.super_class = (Class)ACSportsEntityStandingsListViewAccessibility;
  [(ACSportsEntityStandingsListViewAccessibility *)&v9 configureDomainObjectView:a3 withDomainObject:a4 beforeDomainObject:a5 afterDomainObject:a6 league:a7 index:a8];
  [(ACSportsEntityStandingsListViewAccessibility *)self _accessibilityRemoveValueForKey:@"AXStandingsElements"];
}

- (id)accessibilityElements
{
  id v3 = [(ACSportsEntityStandingsListViewAccessibility *)self _accessibilityValueForKey:@"AXStandingsElements"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [(ACSportsEntityStandingsListViewAccessibility *)self safeValueForKey:@"snippetColumns"];
    v6 = [(ACSportsEntityStandingsListViewAccessibility *)self safeValueForKey:@"domainObjectViews"];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __69__ACSportsEntityStandingsListViewAccessibility_accessibilityElements__block_invoke;
    v13 = &unk_265152B90;
    id v14 = v5;
    id v7 = v4;
    id v15 = v7;
    id v8 = v5;
    [v6 enumerateObjectsWithOptions:2 usingBlock:&v10];
    id v3 = v7;
    [(ACSportsEntityStandingsListViewAccessibility *)self _accessibilitySetRetainedValue:v3, @"AXStandingsElements", v10, v11, v12, v13 forKey];
  }

  return v3;
}

void __69__ACSportsEntityStandingsListViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 _accessibilitySetRetainedValue:v3 forKey:@"AXStandingsColumns"];
  objc_msgSend(*(id *)(a1 + 40), "ax_enqueueObject:", v4);
}

@end