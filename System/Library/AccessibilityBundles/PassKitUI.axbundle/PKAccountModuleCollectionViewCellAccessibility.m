@interface PKAccountModuleCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKAccountModuleCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKAccountModuleCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF980] array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__PKAccountModuleCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
  v8[3] = &unk_265140DC8;
  v8[4] = self;
  id v9 = v3;
  id v4 = v3;
  id v5 = (id)[(PKAccountModuleCollectionViewCellAccessibility *)self _accessibilityFindDescendant:v8];
  v6 = AXLabelForElements();

  return v6;
}

uint64_t __68__PKAccountModuleCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    if ([v3 isAccessibilityElement])
    {
      uint64_t v5 = [v4 accessibilityTraits];
      if ((*MEMORY[0x263F1CF00] & v5) == 0) {
        [*(id *)(a1 + 40) addObject:v4];
      }
    }
  }

  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end