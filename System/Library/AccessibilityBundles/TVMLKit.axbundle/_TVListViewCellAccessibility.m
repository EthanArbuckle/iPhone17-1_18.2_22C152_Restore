@interface _TVListViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _TVListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVListViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  v3 = (void *)MEMORY[0x263F22760];
  uint64_t v4 = *MEMORY[0x263F22760];
  id v5 = a3;
  [v5 client:v4 validateClass:@"_TVListViewController"];
  [v5 client:*v3 validateClass:@"_TVListViewController" hasInstanceVariable:@"_collectionElement" withType:"IKCollectionElement"];
  objc_msgSend(v5, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVListViewCell", @"setSelected:animated:", "v", "B", "B", 0);
  objc_msgSend(v5, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVListViewCell", @"floatingView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(_TVListViewCellAccessibility *)self _accessibleSubviews];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObject:", v9, (void)v13);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v10 = (id)[v3 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
  v11 = MEMORY[0x245666360](v3);

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(_TVListViewCellAccessibility *)self _accessibleSubviews];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v9, "isAccessibilityElement", (void)v11))
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_TVListViewCellAccessibility;
  [(_TVListViewCellAccessibility *)&v7 setSelected:a3 animated:a4];
  uint64_t v6 = (void *)MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v6 = (void *)MEMORY[0x263F1CF18];
  }
  [(_TVListViewCellAccessibility *)self setAccessibilityTraits:*v6];
}

- (unint64_t)accessibilityTraits
{
  v3 = [(_TVListViewCellAccessibility *)self _accessibleSubviews];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return *MEMORY[0x263F813E8];
  }
  uint64_t v5 = *MEMORY[0x263F1CF18];
  uint64_t v6 = [(_TVListViewCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_7];

  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *MEMORY[0x263F1CEE8];
  }
  v9.receiver = self;
  v9.super_class = (Class)_TVListViewCellAccessibility;
  return v7 | v5 | [(_TVListViewCellAccessibility *)&v9 accessibilityTraits];
}

- (id)_accessibilityFrameDelegate
{
  v3 = [(_TVListViewCellAccessibility *)self safeValueForKey:@"floatingView"];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVListViewCellAccessibility;
    id v5 = [(_TVListViewCellAccessibility *)&v8 _accessibilityFrameDelegate];
  }
  uint64_t v6 = v5;

  return v6;
}

@end