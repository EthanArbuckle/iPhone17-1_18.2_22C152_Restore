@interface TLKKeyValueGridViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation TLKKeyValueGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKKeyValueGridView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKKeyValueGridView", @"keyLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKKeyValueGridView", @"valueLabels", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263F81490];
  v4 = [(TLKKeyValueGridViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [MEMORY[0x263EFF980] array];
    v7 = [(TLKKeyValueGridViewAccessibility *)self safeArrayForKey:@"keyLabels"];
    v8 = [(TLKKeyValueGridViewAccessibility *)self safeArrayForKey:@"valueLabels"];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__TLKKeyValueGridViewAccessibility_accessibilityElements__block_invoke;
    v12[3] = &unk_26515F600;
    id v13 = v8;
    v14 = self;
    id v9 = v6;
    id v15 = v9;
    id v10 = v8;
    [v7 enumerateObjectsUsingBlock:v12];
    [(TLKKeyValueGridViewAccessibility *)self _accessibilitySetRetainedValue:v9 forKey:*v3];
    id v5 = v9;
  }

  return v5;
}

void __57__TLKKeyValueGridViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a2;
  id v9 = [v5 array];
  [v9 addObject:v6];

  if ([*(id *)(a1 + 32) count] > a3)
  {
    v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    [v9 addObject:v7];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:*(void *)(a1 + 40) representedElements:v9];
  [*(id *)(a1 + 48) addObject:v8];
}

@end