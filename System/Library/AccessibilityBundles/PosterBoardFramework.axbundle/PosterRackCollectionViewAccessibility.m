@interface PosterRackCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsPosterSwitcher;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axCenteredPoster;
- (id)_axCollectionViewController;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PosterRackCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterRackCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.PosterRackCollectionView" isKindOfClass:@"UICollectionView"];
  [v3 validateClass:@"PosterBoard.PosterRackCollectionViewController" hasSwiftField:@"layoutMode" withSwiftType:"PRUISSwitcherLayoutMode"];
}

- (id)accessibilityValue
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    v4 = [v3 accessibilityLabel];
    v5 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    v8 = [v5 accessibilityValue];
    v6 = __UIAXStringForVariables();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PosterRackCollectionViewAccessibility;
    v6 = [(PosterRackCollectionViewAccessibility *)&v9 accessibilityValue];
  }

  return v6;
}

- (id)accessibilityHint
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    v4 = [v3 accessibilityHint];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    v4 = [(PosterRackCollectionViewAccessibility *)&v6 accessibilityHint];
  }

  return v4;
}

- (id)accessibilityIdentifier
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    v4 = [v3 accessibilityIdentifier];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    v4 = [(PosterRackCollectionViewAccessibility *)&v6 accessibilityIdentifier];
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self accessibilityElements];
    BOOL v4 = v3 == 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    return [(PosterRackCollectionViewAccessibility *)&v6 isAccessibilityElement];
  }
  return v4;
}

- (CGRect)accessibilityFrame
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    [v3 accessibilityFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PosterRackCollectionViewAccessibility;
    [(PosterRackCollectionViewAccessibility *)&v20 accessibilityFrame];
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)accessibilityPath
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    double v4 = [v3 accessibilityPath];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    double v4 = [(PosterRackCollectionViewAccessibility *)&v6 accessibilityPath];
  }

  return v4;
}

- (id)accessibilityCustomActions
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    double v4 = [v3 accessibilityCustomActions];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    double v4 = [(PosterRackCollectionViewAccessibility *)&v6 accessibilityCustomActions];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    id v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    unint64_t v4 = [v3 accessibilityTraits];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    return [(PosterRackCollectionViewAccessibility *)&v6 accessibilityTraits];
  }
}

- (id)accessibilityElements
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    uint64_t v3 = [(PosterRackCollectionViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
    unint64_t v4 = (void *)v3;
    if (v3)
    {
      v8[0] = v3;
      double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PosterRackCollectionViewAccessibility;
    double v5 = [(PosterRackCollectionViewAccessibility *)&v7 accessibilityElements];
  }

  return v5;
}

uint64_t __62__PosterRackCollectionViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565BD30](@"PosterBoard.PosterSectionRemovalView");
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    uint64_t v3 = __UIAccessibilityCastAsClass();
    uint64_t v4 = [v3 _accessibilityViewIsVisible];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(PosterRackCollectionViewAccessibility *)self _axIsPosterSwitcher])
  {
    uint64_t v3 = [(PosterRackCollectionViewAccessibility *)self _axCenteredPoster];
    uint64_t v4 = [v3 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    uint64_t v4 = [(PosterRackCollectionViewAccessibility *)&v6 _accessibilitySupplementaryFooterViews];
  }

  return v4;
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  return 1;
}

- (id)_axCollectionViewController
{
  objc_opt_class();
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = [v2 dataSource];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)_axIsPosterSwitcher
{
  id v2 = [(PosterRackCollectionViewAccessibility *)self _axCollectionViewController];
  uint64_t v3 = [v2 safeSwiftValueForKey:@"layoutMode"];
  uint64_t v4 = AXConvertToLayoutMode();

  return v4 == 1;
}

- (id)_axCenteredPoster
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = AXCenteredPosterCellInCollectionView(v2);

  return v3;
}

@end