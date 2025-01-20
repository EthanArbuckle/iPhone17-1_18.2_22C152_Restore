@interface SK_UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_accessibilityShouldOverrideScrollViewContentOffsetLimits;
- (BOOL)_accessibilityUseXRightOffsetForScrollOpaqueElementIntoViewDirection:(int64_t)a3;
- (BOOL)_axIsCollectionViewCarousel;
- (double)_accessibilityCellWidth;
- (double)_accessibilityLeftOpaqueScrollViewContentOffsetLimit;
- (double)_accessibilityRightOpaqueScrollViewContentOffsetLimit;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3;
- (unint64_t)_accessibilityActualCellCount;
- (unint64_t)_accessibilityModelCellCount;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SK_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_axIsCollectionViewCarousel
{
  v3 = [(SK_UICollectionViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"ShelfCollectionView"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(SK_UICollectionViewAccessibility *)self accessibilityIdentifier];
    char v4 = [v5 isEqualToString:@"SKUICarouselCollection"];
  }
  return v4;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  if ([(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SK_UICollectionViewAccessibility;
  return [(SK_UICollectionViewAccessibility *)&v4 _accessibilityOnlyComparesByXAxis];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SK_UICollectionViewAccessibility;
  [(SK_UICollectionViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  if ([(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel])
  {
    v3 = [(SK_UICollectionViewAccessibility *)self safeValueForKey:@"delegate"];
    NSClassFromString(&cfstr_Skuicarouselpa_0.isa);
    if (objc_opt_isKindOfClass()) {
      [v3 _accessibilityLoadAccessibilityInformation];
    }
  }
}

- (id)_accessibilityScrollStatus
{
  if ([(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel])
  {
    [(SK_UICollectionViewAccessibility *)self _accessibilityModelCellCount];
    v3 = NSString;
    objc_super v4 = accessibilitySKUILocalizedString(@"top.shelf.carousel.status");
    v5 = AXFormatInteger();
    v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SK_UICollectionViewAccessibility;
    v6 = [(SK_UICollectionViewAccessibility *)&v8 _accessibilityScrollStatus];
  }

  return v6;
}

- (BOOL)_accessibilityUseXRightOffsetForScrollOpaqueElementIntoViewDirection:(int64_t)a3
{
  int v5 = [(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel];
  if (v5)
  {
    if (a3 == 2)
    {
      LOBYTE(v5) = [(SK_UICollectionViewAccessibility *)self _accessibilityIsRTL] ^ 1;
    }
    else if (a3 == 1)
    {
      LOBYTE(v5) = [(SK_UICollectionViewAccessibility *)self _accessibilityIsRTL];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  id v4 = a3;
  if (_accessibilitySortedElementsWithinWithOptions__onceToken != -1) {
    dispatch_once(&_accessibilitySortedElementsWithinWithOptions__onceToken, &__block_literal_global_3);
  }
  if (_accessibilitySortedElementsWithinWithOptions__IsIBooks
    && [(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel])
  {
    int v5 = [(SK_UICollectionViewAccessibility *)self subviews];
    v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_300];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__SK_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_3;
    v11[3] = &unk_2650AB8E8;
    v11[4] = self;
    v7 = [v6 indexesOfObjectsPassingTest:v11];
    if ([v7 count])
    {
      objc_super v8 = (void *)[v6 mutableCopy];
      [v8 removeObjectsAtIndexes:v7];

      v6 = v8;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SK_UICollectionViewAccessibility;
    v6 = [(SK_UICollectionViewAccessibility *)&v10 _accessibilitySortedElementsWithinWithOptions:v4];
  }

  return v6;
}

- (double)_accessibilityRightOpaqueScrollViewContentOffsetLimit
{
  if ([(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel])
  {
    if ([(SK_UICollectionViewAccessibility *)self _accessibilityApplicationIsRTL])unint64_t v3 = [(SK_UICollectionViewAccessibility *)self _accessibilityActualCellCount]; {
    else
    }
      unint64_t v3 = [(SK_UICollectionViewAccessibility *)self _accessibilityModelCellCount];
    unint64_t v5 = v3;
    if ([(SK_UICollectionViewAccessibility *)self _accessibilityShouldOverrideScrollViewContentOffsetLimits])
    {
      [(SK_UICollectionViewAccessibility *)self _accessibilityCellWidth];
      return v6 * (double)(v5 - 1);
    }
    else
    {
      [(SK_UICollectionViewAccessibility *)&v8 _accessibilityRightOpaqueScrollViewContentOffsetLimit];
    }
  }
  else
  {
    [(SK_UICollectionViewAccessibility *)&v7 _accessibilityRightOpaqueScrollViewContentOffsetLimit];
  }
  return result;
}

- (double)_accessibilityLeftOpaqueScrollViewContentOffsetLimit
{
  if ([(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel])
  {
    double v3 = 0.0;
    if ([(SK_UICollectionViewAccessibility *)self _accessibilityApplicationIsRTL])
    {
      unint64_t v4 = [(SK_UICollectionViewAccessibility *)self _accessibilityActualCellCount];
      double v3 = (double)(v4
                  + ~[(SK_UICollectionViewAccessibility *)self _accessibilityModelCellCount]);
    }
    if ([(SK_UICollectionViewAccessibility *)self _accessibilityShouldOverrideScrollViewContentOffsetLimits])
    {
      [(SK_UICollectionViewAccessibility *)self _accessibilityCellWidth];
      return v3 * v5;
    }
    else
    {
      [(SK_UICollectionViewAccessibility *)&v8 _accessibilityLeftOpaqueScrollViewContentOffsetLimit];
    }
  }
  else
  {
    [(SK_UICollectionViewAccessibility *)&v7 _accessibilityLeftOpaqueScrollViewContentOffsetLimit];
  }
  return result;
}

- (BOOL)_accessibilityShouldOverrideScrollViewContentOffsetLimits
{
  if (![(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel]) {
    return 0;
  }
  double v3 = [(SK_UICollectionViewAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Skuicarouselpa_0.isa);
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 safeValueForKey:@"_modelObjects"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)_accessibilityModelCellCount
{
  if (![(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel]) {
    return 0;
  }
  double v3 = [(SK_UICollectionViewAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Skuicarouselpa_0.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  unint64_t v4 = [v3 safeValueForKey:@"_modelObjects"];
  BOOL v5 = __UIAccessibilitySafeClass();

  unint64_t v6 = [v5 count];
  return v6;
}

- (unint64_t)_accessibilityActualCellCount
{
  if (![(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel]) {
    return 0;
  }

  return [(SK_UICollectionViewAccessibility *)self numberOfItemsInSection:0];
}

- (double)_accessibilityCellWidth
{
  BOOL v3 = [(SK_UICollectionViewAccessibility *)self _axIsCollectionViewCarousel];
  double result = 0.0;
  if (v3)
  {
    [(SK_UICollectionViewAccessibility *)self contentSize];
    return v5
         / (double)[(SK_UICollectionViewAccessibility *)self _accessibilityActualCellCount];
  }
  return result;
}

@end