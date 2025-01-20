@interface SFUnifiedBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SFUnifiedBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v18.receiver = self;
  v18.super_class = (Class)SFUnifiedBarItemViewAccessibility;
  v3 = [(SFUnifiedBarItemViewAccessibility *)&v18 accessibilityLabel];
  if (!v3)
  {
    id v4 = [(SFUnifiedBarItemViewAccessibility *)self safeValueForKey:@"item"];
    if (!v4)
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      v15 = __Block_byref_object_copy_;
      v16 = __Block_byref_object_dispose_;
      id v17 = 0;
      uint64_t v6 = MEMORY[0x263EF8330];
      uint64_t v7 = 3221225472;
      v8 = __55__SFUnifiedBarItemViewAccessibility_accessibilityLabel__block_invoke;
      v9 = &unk_265135CF0;
      v10 = self;
      v11 = &v12;
      AXPerformSafeBlock();
      id v4 = (id)v13[5];
      _Block_object_dispose(&v12, 8);
    }
    v3 = objc_msgSend(v4, "accessibilityLabel", v6, v7, v8, v9, v10, v11);
  }

  return v3;
}

void __55__SFUnifiedBarItemViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) allTargets];
  uint64_t v2 = [v5 anyObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end