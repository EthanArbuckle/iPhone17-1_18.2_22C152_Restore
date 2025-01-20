@interface PDFThumbnailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_axIconsView;
- (id)_axPageDescriptionForPage:(id)a3;
- (id)_axThumbnailSelf;
- (id)accessibilityValue;
- (id)automationElements;
- (int64_t)_axCurrentPageNumber;
- (int64_t)_axPageNumberForPage:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_axMoveOnePage:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PDFThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PDFThumbnailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PDFThumbnailView" hasInstanceVariable:@"_iconsView" withType:"UIView<PDFThumbnailCollectionViewInterface>"];
  [v3 validateClass:@"PDFIconsView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PDFIconsView" hasInstanceVariable:@"_activeIcon" withType:"PDFPageIconLayer"];
  [v3 validateClass:@"PDFPageIconLayer" isKindOfClass:@"CALayer"];
  [v3 validateClass:@"PDFIconsView" hasInstanceVariable:@"_icons" withType:"NSMutableArray"];
}

- (id)_axThumbnailSelf
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();

  return v2;
}

- (int64_t)_axPageNumberForPage:(id)a3
{
  id v4 = a3;
  v5 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  v6 = [v5 PDFView];
  v7 = [v6 document];

  int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 && v7) {
    int64_t v8 = [v7 indexForPage:v4];
  }

  return v8;
}

- (int64_t)_axCurrentPageNumber
{
  id v3 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  id v4 = [v3 PDFView];
  v5 = [v4 currentPage];

  int64_t v6 = [(PDFThumbnailViewAccessibility *)self _axPageNumberForPage:v5];
  return v6;
}

- (id)_axPageDescriptionForPage:(id)a3
{
  id v4 = a3;
  v5 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  int64_t v6 = [v5 PDFView];
  v7 = [v6 document];

  int64_t v8 = [(PDFThumbnailViewAccessibility *)self _axPageNumberForPage:v4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    int64_t v10 = v8 + 1;
    uint64_t v11 = [v7 pageCount];
    v12 = NSString;
    v13 = accessibilityLocalizedString(@"page.x.of.y");
    v9 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v10, v11);
  }

  return v9;
}

- (void)_axMoveOnePage:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  id v6 = [v5 PDFView];

  if ([(PDFThumbnailViewAccessibility *)self _axCurrentPageNumber] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3)
    {
      if ([v6 canGoToNextPage]) {
        [v6 goToNextPage:self];
      }
    }
    else if ([v6 canGoToPreviousPage])
    {
      [v6 goToPreviousPage:self];
    }
  }
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  BOOL v3 = [v2 PDFView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  BOOL v3 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  BOOL v4 = [v3 PDFView];
  v5 = [v4 document];

  id v6 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
  v7 = [v6 PDFView];
  int64_t v8 = [v7 currentPage];

  BOOL v9 = 0;
  if (v5 && v8) {
    BOOL v9 = (unint64_t)[v5 pageCount] > 1;
  }
  v14.receiver = self;
  v14.super_class = (Class)PDFThumbnailViewAccessibility;
  unint64_t v10 = [(PDFThumbnailViewAccessibility *)&v14 accessibilityTraits];
  uint64_t v11 = *MEMORY[0x263F1CED8];
  if (!v9) {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v11 | v10;

  return v12;
}

- (id)accessibilityValue
{
  v10.receiver = self;
  v10.super_class = (Class)PDFThumbnailViewAccessibility;
  BOOL v3 = [(PDFThumbnailViewAccessibility *)&v10 accessibilityValue];

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)PDFThumbnailViewAccessibility;
    BOOL v4 = [(PDFThumbnailViewAccessibility *)&v9 accessibilityValue];
  }
  else
  {
    v5 = [(PDFThumbnailViewAccessibility *)self _axThumbnailSelf];
    id v6 = [v5 PDFView];
    v7 = [v6 currentPage];

    BOOL v4 = [(PDFThumbnailViewAccessibility *)self _axPageDescriptionForPage:v7];
  }

  return v4;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)_axIconsView
{
  return (id)[(PDFThumbnailViewAccessibility *)self safeUIViewForKey:@"_iconsView"];
}

- (CGPoint)accessibilityActivationPoint
{
  char v13 = 0;
  BOOL v3 = [(PDFThumbnailViewAccessibility *)self _axIconsView];
  BOOL v4 = [v3 safeValueForKey:@"_activeIcon"];
  v5 = __UIAccessibilitySafeClass();

  if (v5)
  {
    [v5 accessibilityFrame];
    AX_CGRectGetCenter();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PDFThumbnailViewAccessibility;
    [(PDFThumbnailViewAccessibility *)&v12 accessibilityActivationPoint];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGRect)accessibilityFrame
{
  BOOL v3 = [(PDFThumbnailViewAccessibility *)self _axIconsView];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PDFThumbnailViewAccessibility;
    [(PDFThumbnailViewAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)automationElements
{
  v13.receiver = self;
  v13.super_class = (Class)PDFThumbnailViewAccessibility;
  BOOL v3 = [(PDFThumbnailViewAccessibility *)&v13 automationElements];
  BOOL v4 = (void *)[v3 mutableCopy];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  double v7 = v6;

  double v8 = [(PDFThumbnailViewAccessibility *)self _axIconsView];
  double v9 = v8;
  if (v8)
  {
    double v10 = [v8 safeValueForKey:@"_icons"];
    double v11 = __UIAccessibilitySafeClass();

    [v7 axSafelyAddObjectsFromArray:v11];
  }

  return v7;
}

@end