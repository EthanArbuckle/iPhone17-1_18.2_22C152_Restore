@interface LoggingCardCarouselViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityViewIsModal;
- (id)cardProgressLabel;
- (id)collectionViewFrom:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation LoggingCardCarouselViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.LoggingCardCarouselViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MenstrualCyclesAppPlugin.LoggingCardHeaderView"];
  [v3 validateClass:@"MenstrualCyclesAppPlugin.LoggingCardCarouselViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MenstrualCyclesAppPlugin.LoggingCardCarouselViewController" conformsToProtocol:@"UIScrollViewDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.LoggingCardCarouselViewController", @"axCardProgressLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)LoggingCardCarouselViewControllerAccessibility;
  [(LoggingCardCarouselViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  v4 = [v3 subviews];

  v5 = [v4 axFilterObjectsUsingBlock:&__block_literal_global_1];
  v6 = [v5 lastObject];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

uint64_t __92__LoggingCardCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  LOBYTE(v40[0]) = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  v6 = [(LoggingCardCarouselViewControllerAccessibility *)self collectionViewFrom:v5];
  objc_super v7 = v6;
  if (v6)
  {
    [v6 bounds];
    AX_CGRectGetCenter();
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v7 indexPathsForVisibleItems];
    uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v37 = self;
      v38 = v5;
      v14 = 0;
      double v16 = *MEMORY[0x263F00148];
      double v15 = *(double *)(MEMORY[0x263F00148] + 8);
      uint64_t v17 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v20 = [v7 cellForItemAtIndexPath:v19];
          [v20 bounds];
          objc_msgSend(v7, "convertRect:fromView:", v20);
          v47.x = v9;
          v47.y = v11;
          if (CGRectContainsPoint(v48, v47))
          {
            if (a3 == 2)
            {
              double v16 = 0.5;
              uint64_t v21 = 1;
            }
            else
            {
              if (a3 != 1)
              {

                v5 = v38;
                goto LABEL_22;
              }
              double v16 = -0.5;
              uint64_t v21 = -1;
            }
            v22 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v19, "item") + v21, objc_msgSend(v19, "section"));
            uint64_t v23 = [v7 cellForItemAtIndexPath:v22];

            v14 = (void *)v23;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v13) {
          continue;
        }
        break;
      }

      if (!v14)
      {
        BOOL v35 = 0;
        v5 = v38;
        goto LABEL_24;
      }
      [v14 center];
      double v25 = v24;
      [v7 bounds];
      double v27 = v25 + v26 * -0.5;
      [v7 contentOffset];
      [v7 setContentOffset:1 animated:v27];
      [v7 contentOffset];
      v40[0] = v28;
      v40[1] = v29;
      if (objc_opt_respondsToSelector()) {
        -[LoggingCardCarouselViewControllerAccessibility scrollViewWillEndDragging:withVelocity:targetContentOffset:](v37, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v7, v40, v16, v15);
      }
      v30 = accessibilityLocalizedString(@"card");
      v31 = [(LoggingCardCarouselViewControllerAccessibility *)v37 cardProgressLabel];
      v32 = [v31 text];

      LODWORD(v31) = *MEMORY[0x263F1CE30];
      v33 = __UIAXStringForVariables();
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v31, v33);

      v34 = objc_msgSend(v14, "_accessibilityFindSubviewDescendant:", &__block_literal_global_299, v32, @"__AXStringForVariablesSentinel");
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v34);

      BOOL v35 = 1;
      v5 = v38;
    }
    else
    {
      v14 = 0;
LABEL_22:

      BOOL v35 = 0;
    }
  }
  else
  {
    BOOL v35 = 0;
  }
LABEL_24:

  return v35;
}

uint64_t __70__LoggingCardCarouselViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245654380](@"MenstrualCyclesAppPlugin.LoggingCardHeaderView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)cardProgressLabel
{
  objc_opt_class();
  id v3 = [(LoggingCardCarouselViewControllerAccessibility *)self safeValueForKey:@"axCardProgressLabel"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)collectionViewFrom:(id)a3
{
  id v3 = [a3 view];
  v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_301];

  return v4;
}

uint64_t __69__LoggingCardCarouselViewControllerAccessibility_collectionViewFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)LoggingCardCarouselViewControllerAccessibility;
  [(LoggingCardCarouselViewControllerAccessibility *)&v5 viewDidLoad];
  [(LoggingCardCarouselViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [(LoggingCardCarouselViewControllerAccessibility *)self collectionViewFrom:v3];
  [v4 setAccessibilityIdentifier:@"AXLoggingCardCarouselViewCollectionView"];
}

@end