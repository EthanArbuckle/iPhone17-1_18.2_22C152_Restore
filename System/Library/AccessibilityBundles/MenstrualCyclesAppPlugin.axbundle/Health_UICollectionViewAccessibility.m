@interface Health_UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (id)centerCellFromCollectionView:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)adjustCycleTimelineCollectionViewIncrement:(BOOL)a3;
@end

@implementation Health_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    return 0;
  }
  v4 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentification];
  char v5 = [v4 isEqualToString:@"AXCycleTimelineCollectionView"];

  if (v5) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)Health_UICollectionViewAccessibility;
  return [(Health_UICollectionViewAccessibility *)&v6 isAccessibilityElement];
}

- (id)accessibilityValue
{
  v3 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXCycleTimelineCollectionView"];

  if (v4
    && ([(Health_UICollectionViewAccessibility *)self centerCellFromCollectionView:self], (char v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v6 = v5;
    v7 = [v5 accessibilityLabel];
    v10 = [v6 accessibilityValue];
    v8 = __UIAXStringForVariables();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)Health_UICollectionViewAccessibility;
    v8 = [(Health_UICollectionViewAccessibility *)&v11 accessibilityValue];
  }

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXCycleTimelineCollectionView"];

  if (v4) {
    return *MEMORY[0x263F1CED8];
  }
  v6.receiver = self;
  v6.super_class = (Class)Health_UICollectionViewAccessibility;
  return [(Health_UICollectionViewAccessibility *)&v6 accessibilityTraits];
}

- (void)accessibilityIncrement
{
  v3 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXCycleTimelineCollectionView"];

  if (v4) {
    [(Health_UICollectionViewAccessibility *)self adjustCycleTimelineCollectionViewIncrement:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)Health_UICollectionViewAccessibility;
  [(Health_UICollectionViewAccessibility *)&v5 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  v3 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXCycleTimelineCollectionView"];

  if (v4) {
    [(Health_UICollectionViewAccessibility *)self adjustCycleTimelineCollectionViewIncrement:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)Health_UICollectionViewAccessibility;
  [(Health_UICollectionViewAccessibility *)&v5 accessibilityDecrement];
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  v3 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"AXLoggingCardCarouselViewCollectionView"])
  {

    return 1;
  }
  int v4 = [(Health_UICollectionViewAccessibility *)self accessibilityIdentification];
  char v5 = [v4 isEqualToString:@"AXCycleTimelineCollectionView"];

  if (v5) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)Health_UICollectionViewAccessibility;
  return [(Health_UICollectionViewAccessibility *)&v7 accessibilityCollectionViewBehavesLikeUIViewAccessibility];
}

- (void)adjustCycleTimelineCollectionViewIncrement:(BOOL)a3
{
  BOOL v3 = a3;
  v16 = self;
  int v4 = [(Health_UICollectionViewAccessibility *)v16 centerCellFromCollectionView:v16];
  if (v4)
  {
    char v5 = [(Health_UICollectionViewAccessibility *)v16 indexPathForCell:v4];
    objc_super v6 = (void *)MEMORY[0x263F088C8];
    uint64_t v7 = [v5 item];
    uint64_t v8 = [v5 section];
    if (v3) {
      uint64_t v9 = v7 + 1;
    }
    else {
      uint64_t v9 = v7 - 1;
    }
    v10 = [v6 indexPathForItem:v9 inSection:v8];
    objc_super v11 = [(Health_UICollectionViewAccessibility *)v16 cellForItemAtIndexPath:v10];

    if (v11)
    {
      [v11 center];
      double v13 = v12;
      [(Health_UICollectionViewAccessibility *)v16 bounds];
      double v15 = v13 + v14 * -0.5;
      [(Health_UICollectionViewAccessibility *)v16 contentOffset];
      [(Health_UICollectionViewAccessibility *)v16 setContentOffset:1 animated:v15];
    }
  }
}

- (id)centerCellFromCollectionView:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 bounds];
  AX_CGRectGetCenter();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(v3, "indexPathsForVisibleItems", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = [v3 cellForItemAtIndexPath:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
      [v13 bounds];
      objc_msgSend(v3, "convertRect:fromView:", v13);
      v22.x = v5;
      v22.y = v7;
      if (CGRectContainsPoint(v23, v22)) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    double v13 = 0;
  }

  return v13;
}

@end