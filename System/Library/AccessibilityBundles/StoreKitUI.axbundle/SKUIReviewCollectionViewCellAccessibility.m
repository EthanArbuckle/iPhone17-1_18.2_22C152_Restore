@interface SKUIReviewCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SKUIReviewCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIReviewCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIReviewCollectionViewCell" isKindOfClass:@"SKUIViewReuseCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIViewReuseCollectionViewCell", @"allExistingViews", "@", 0);
}

- (id)accessibilityLabel
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(SKUIReviewCollectionViewCellAccessibility *)self safeValueForKey:@"allExistingViews"];
  id v3 = [v2 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 isAccessibilityElement])
        {
          [v4 addObject:v10];
        }
        else if ([v10 _accessibilityHasOrderedChildren])
        {
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __63__SKUIReviewCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
          v13[3] = &unk_2650AB738;
          id v14 = v4;
          [v10 accessibilityEnumerateContainerElementsUsingBlock:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v11 = MEMORY[0x2455E57F0](v4);

  return v11;
}

void __63__SKUIReviewCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAccessibilityElement]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end