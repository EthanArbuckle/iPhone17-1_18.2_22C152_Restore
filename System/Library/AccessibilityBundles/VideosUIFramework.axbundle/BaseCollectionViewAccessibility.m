@interface BaseCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHeaderElements;
@end

@implementation BaseCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.BaseCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHeaderElements
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)BaseCollectionViewAccessibility;
  v3 = [(BaseCollectionViewAccessibility *)&v22 accessibilityHeaderElements];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = MEMORY[0x245669780](@"VideosUI.CollectionHeaderView");
    v6 = [(BaseCollectionViewAccessibility *)self safeUIViewForKey:@"superview"];
    v7 = [v6 safeArrayForKey:@"subviews"];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __62__BaseCollectionViewAccessibility_accessibilityHeaderElements__block_invoke;
    v21[3] = &__block_descriptor_40_e23_B32__0__UIView_8Q16_B24lu32l8;
    v21[4] = v5;
    v8 = objc_msgSend(v7, "ax_filteredArrayUsingBlock:", v21);

    v9 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
    id v4 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "_accessibilityLeafDescendantsWithOptions:", v9, (void)v17);
          [v4 addObjectsFromArray:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v12);
    }
  }

  return v4;
}

uint64_t __62__BaseCollectionViewAccessibility_accessibilityHeaderElements__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end