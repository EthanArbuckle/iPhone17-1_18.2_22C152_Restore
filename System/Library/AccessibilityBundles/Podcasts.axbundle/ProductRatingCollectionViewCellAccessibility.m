@interface ProductRatingCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityProductRatingCollectionViewCellElements;
- (id)accessibilityElements;
- (void)_setAccessibilityProductRatingCollectionViewCellElements:(id)a3;
- (void)clearAllRatings;
- (void)setRatingWithProportion:(float)a3 at:(int64_t)a4;
@end

@implementation ProductRatingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ProductRatingCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityProductRatingCollectionViewCellElements
{
  return objc_getAssociatedObject(self, &__ProductLockupCollectionViewCellAccessibility___accessibilityProductRatingCollectionViewCellElements);
}

- (void)_setAccessibilityProductRatingCollectionViewCellElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ProductRatingCollectionViewCell", @"setRatingWithProportion:at:", "v", "f", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ProductRatingCollectionViewCell", @"clearAllRatings", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ProductRatingCollectionViewCell", @"accessibilityCurrentRatingLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ProductRatingCollectionViewCell", @"accessibilityOutOfRatingLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ProductRatingCollectionViewCell", @"accessibilityRatingBreakdownStack", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ProductRatingCollectionViewCell", @"accessibilityRatingCountLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(ProductRatingCollectionViewCellAccessibility *)self _accessibilityProductRatingCollectionViewCellElements];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v4 = (void *)MEMORY[0x263EFF8C0];
    v5 = [(ProductRatingCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityCurrentRatingLabel"];
    v6 = [(ProductRatingCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityOutOfRatingLabel"];
    v7 = objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);

    v8 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v7];
    [v3 axSafelyAddObject:v8];
    char v23 = 0;
    objc_opt_class();
    v9 = [(ProductRatingCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityRatingBreakdownStack"];
    v10 = __UIAccessibilityCastAsClass();

    [v10 arrangedSubviews];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [v3 axSafelyAddObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    char v23 = 0;
    objc_opt_class();
    v16 = [(ProductRatingCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityRatingCountLabel"];
    v17 = __UIAccessibilityCastAsClass();

    if (v23) {
      abort();
    }
    [v3 axSafelyAddObject:v17];
    [(ProductRatingCollectionViewCellAccessibility *)self _setAccessibilityProductRatingCollectionViewCellElements:v3];
  }

  return v3;
}

- (void)setRatingWithProportion:(float)a3 at:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ProductRatingCollectionViewCellAccessibility;
  -[ProductRatingCollectionViewCellAccessibility setRatingWithProportion:at:](&v5, sel_setRatingWithProportion_at_, a4);
  [(ProductRatingCollectionViewCellAccessibility *)self _setAccessibilityProductRatingCollectionViewCellElements:0];
}

- (void)clearAllRatings
{
  v3.receiver = self;
  v3.super_class = (Class)ProductRatingCollectionViewCellAccessibility;
  [(ProductRatingCollectionViewCellAccessibility *)&v3 clearAllRatings];
  [(ProductRatingCollectionViewCellAccessibility *)self _setAccessibilityProductRatingCollectionViewCellElements:0];
}

@end