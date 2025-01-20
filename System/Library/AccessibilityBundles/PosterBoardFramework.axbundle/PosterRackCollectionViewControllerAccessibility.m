@interface PosterRackCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axScrollDown:(id)a3 scrollView:(id)a4;
- (BOOL)_axScrollLeft:(BOOL)a3 pageControl:(id)a4 collectionView:(id)a5;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_axCollectionView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetPageControlValue;
- (void)viewDidLayoutSubviews;
@end

@implementation PosterRackCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterRackCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.PosterRackCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"PosterBoard.PosterRackCollectionViewController" hasSwiftField:@"pageControl" withSwiftType:"Optional<UIPageControl>"];
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell"];
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell" hasSwiftField:@"scrollView" withSwiftType:"Optional<UIScrollView>"];
  [v3 validateClass:@"PosterBoard.PosterSectionRemovalView"];
  [v3 validateClass:@"PosterBoard.PosterSectionRemovalView" hasSwiftField:@"deleteButton" withSwiftType:"Optional<UIButton>"];
  [v3 validateClass:@"PosterBoard.PosterRackCollectionViewController" hasSwiftField:@"layoutMode" withSwiftType:"PRUISSwitcherLayoutMode"];
  [v3 validateClass:@"PosterBoard.PosterRackCollectionViewController" hasSwiftFieldOfAnyClass:@"addPosterButton"];
  [v3 validateClass:@"PosterBoard.PosterPair" hasSwiftField:@"localizedTitle" withSwiftType:"Optional<String>"];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_opt_class();
  v5 = [(PosterRackCollectionViewControllerAccessibility *)self safeSwiftValueForKey:@"pageControl"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(PosterRackCollectionViewControllerAccessibility *)self _axCollectionView];
  objc_opt_class();
  v8 = [(PosterRackCollectionViewControllerAccessibility *)self _axCollectionView];
  v9 = AXCenteredPosterCellInCollectionView(v8);
  v10 = [v9 safeSwiftValueForKey:@"scrollView"];
  v11 = __UIAccessibilityCastAsClass();

  v12 = [(PosterRackCollectionViewControllerAccessibility *)self safeSwiftValueForKey:@"layoutMode"];
  uint64_t v13 = AXConvertToLayoutMode();

  if (v13 == 1)
  {
    switch(a3)
    {
      case 1:
        v14 = self;
        uint64_t v15 = 0;
        goto LABEL_7;
      case 2:
        v14 = self;
        uint64_t v15 = 1;
LABEL_7:
        BOOL v17 = [(PosterRackCollectionViewControllerAccessibility *)v14 _axScrollLeft:v15 pageControl:v6 collectionView:v7];
        goto LABEL_10;
      case 3:
        BOOL v16 = 1;
        objc_msgSend(v11, "setContentOffset:animated:", 1, 0.0, 0.0);
        UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
        break;
      case 4:
        BOOL v17 = [(PosterRackCollectionViewControllerAccessibility *)self _axScrollDown:v7 scrollView:v11];
LABEL_10:
        BOOL v16 = v17;
        break;
      default:
        BOOL v16 = 1;
        break;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PosterRackCollectionViewControllerAccessibility;
  [(PosterRackCollectionViewControllerAccessibility *)&v7 viewDidLayoutSubviews];
  id v3 = [(PosterRackCollectionViewControllerAccessibility *)self safeSwiftValueForKey:@"layoutMode"];
  uint64_t v4 = AXConvertToLayoutMode();

  BOOL v5 = v4 == 4;
  v6 = [(PosterRackCollectionViewControllerAccessibility *)self _axCollectionView];
  [v6 setAccessibilityElementsHidden:v5];

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __72__PosterRackCollectionViewControllerAccessibility_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axSetPageControlValue];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PosterRackCollectionViewControllerAccessibility;
  [(PosterRackCollectionViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PosterRackCollectionViewControllerAccessibility *)self safeSwiftValueForKey:@"addPosterButton"];
  uint64_t v4 = accessibilityLocalizedString(@"poster.gallery.affordance.cell.label");
  [v3 setAccessibilityLabel:v4];
}

- (id)_axCollectionView
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 collectionView];

  return v3;
}

- (BOOL)_axScrollDown:(id)a3 scrollView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = AXLockScreenPostersCount(v5);
  if (v7 != 1)
  {
    [v6 contentSize];
    double v9 = v8;
    [v6 bounds];
    objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, v9 - v10);
    id v12 = v5;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  return v7 != 1;
}

void __76__PosterRackCollectionViewControllerAccessibility__axScrollDown_scrollView___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "accessibilityElements", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v1);
      }
      id v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
      MEMORY[0x24565BD30](@"PosterBoard.PosterSectionRemovalView");
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v7 = [v6 safeSwiftValueForKey:@"deleteButton"];

    if (!v7) {
      return;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F831C0], v7);
    v1 = v7;
  }
LABEL_12:
}

- (BOOL)_axScrollLeft:(BOOL)a3 pageControl:(id)a4 collectionView:(id)a5
{
  if (a3) {
    [a4 accessibilityIncrement];
  }
  else {
    [a4 accessibilityDecrement];
  }
  AXPerformBlockOnMainThreadAfterDelay();
  return 1;
}

void __92__PosterRackCollectionViewControllerAccessibility__axScrollLeft_pageControl_collectionView___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F83188];
  id v3 = [*(id *)(a1 + 32) _axCollectionView];
  uint64_t v2 = [v3 accessibilityValue];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)_axSetPageControlValue
{
  objc_opt_class();
  id v3 = [(PosterRackCollectionViewControllerAccessibility *)self safeSwiftValueForKey:@"pageControl"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 currentPage];
  uint64_t v6 = [v4 numberOfPages] - 1;
  uint64_t v7 = [(PosterRackCollectionViewControllerAccessibility *)self _axCollectionView];
  long long v8 = AXCenteredPosterCellInCollectionView(v7);
  long long v9 = [v8 safeSwiftStringForKey:@"localizedTitle"];

  if (v6 == 1)
  {
    long long v10 = accessibilityLocalizedString(@"page.control.one.wallpaper.available.value");
  }
  else
  {
    if (v5 >= v6)
    {
      long long v11 = 0;
      goto LABEL_7;
    }
    long long v10 = accessibilityLocalizedString(@"page.control.format.text");
  }
  long long v11 = AXCFormattedString();

LABEL_7:
  id v12 = __UIAXStringForVariables();
  objc_msgSend(v4, "setAccessibilityValue:", v12, v11, @"__AXStringForVariablesSentinel");
}

@end