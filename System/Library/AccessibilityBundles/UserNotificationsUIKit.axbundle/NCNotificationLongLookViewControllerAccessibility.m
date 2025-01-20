@interface NCNotificationLongLookViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (Class)_axNotificationBannerWindowClass;
- (Class)_axPagedScrollViewClass;
- (Class)_ax_UIInteractiveHighlightContentViewClass;
- (id)_axLongLookView;
- (id)_axModalAncestorsForLongLookView:(id)a3;
- (void)_axSetModalAncestorsModal:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NCNotificationLongLookViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationLongLookViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    [v3 validateClass:@"SBFPagedScrollView"];
    [v3 validateClass:@"SBBannerWindow"];
  }
  [v3 validateClass:@"_UIInteractiveHighlightContentView"];
  [v3 validateClass:@"NCNotificationLongLookViewController" isKindOfClass:@"UIViewController"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewControllerAccessibility;
  [(NCNotificationLongLookViewControllerAccessibility *)&v6 viewDidAppear:a3];
  [(NCNotificationLongLookViewControllerAccessibility *)self _axSetModalAncestorsModal:1];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  v5 = [(NCNotificationLongLookViewControllerAccessibility *)self _axLongLookView];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookViewControllerAccessibility;
  [(NCNotificationLongLookViewControllerAccessibility *)&v4 viewWillDisappear:a3];
  [(NCNotificationLongLookViewControllerAccessibility *)self _axSetModalAncestorsModal:0];
}

- (id)_axLongLookView
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];

  return v3;
}

- (void)_axSetModalAncestorsModal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = [(NCNotificationLongLookViewControllerAccessibility *)self _axLongLookView];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v6 = -[NCNotificationLongLookViewControllerAccessibility _axModalAncestorsForLongLookView:](self, "_axModalAncestorsForLongLookView:", v5, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setAccessibilityViewIsModal:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_axModalAncestorsForLongLookView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v6 = [v4 _accessibilityWindow];
  [(NCNotificationLongLookViewControllerAccessibility *)self _axNotificationBannerWindowClass];
  if (objc_opt_isKindOfClass()) {
    [v5 addObject:v6];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__NCNotificationLongLookViewControllerAccessibility__axModalAncestorsForLongLookView___block_invoke;
  v12[3] = &unk_2651618C0;
  v12[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v8 = (id)[v4 _accessibilityFindViewAncestor:v12 startWithSelf:1];
  uint64_t v9 = v13;
  id v10 = v7;

  return v10;
}

uint64_t __86__NCNotificationLongLookViewControllerAccessibility__axModalAncestorsForLongLookView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_ax_UIInteractiveHighlightContentViewClass");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([*(id *)(a1 + 32) _axPagedScrollViewClass], (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 40) addObject:v5];
    if ([*(id *)(a1 + 40) count] == 2) {
      *a3 = 1;
    }
  }

  return 0;
}

- (Class)_ax_UIInteractiveHighlightContentViewClass
{
  if (_ax_UIInteractiveHighlightContentViewClass_onceToken != -1) {
    dispatch_once(&_ax_UIInteractiveHighlightContentViewClass_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_ax_UIInteractiveHighlightContentViewClass__UIInteractiveHighlightContentViewClass;

  return (Class)v2;
}

uint64_t __95__NCNotificationLongLookViewControllerAccessibility__ax_UIInteractiveHighlightContentViewClass__block_invoke()
{
  uint64_t result = MEMORY[0x2456680B0](@"_UIInteractiveHighlightContentView");
  _ax_UIInteractiveHighlightContentViewClass__UIInteractiveHighlightContentViewClass = result;
  return result;
}

- (Class)_axPagedScrollViewClass
{
  if (_axPagedScrollViewClass_onceToken != -1) {
    dispatch_once(&_axPagedScrollViewClass_onceToken, &__block_literal_global_291);
  }
  v2 = (void *)_axPagedScrollViewClass_SBFPagedScrollViewClass;

  return (Class)v2;
}

uint64_t __76__NCNotificationLongLookViewControllerAccessibility__axPagedScrollViewClass__block_invoke()
{
  uint64_t result = MEMORY[0x2456680B0](@"SBFPagedScrollView");
  _axPagedScrollViewClass_SBFPagedScrollViewClass = result;
  return result;
}

- (Class)_axNotificationBannerWindowClass
{
  if (_axNotificationBannerWindowClass_onceToken != -1) {
    dispatch_once(&_axNotificationBannerWindowClass_onceToken, &__block_literal_global_293);
  }
  v2 = (void *)_axNotificationBannerWindowClass_SBBannerWindowClass;

  return (Class)v2;
}

uint64_t __85__NCNotificationLongLookViewControllerAccessibility__axNotificationBannerWindowClass__block_invoke()
{
  uint64_t result = MEMORY[0x2456680B0](@"SBBannerWindow");
  _axNotificationBannerWindowClass_SBBannerWindowClass = result;
  return result;
}

@end