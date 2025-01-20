@interface VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MultiViewPlayerHUDTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility;
  [(VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  char v14 = 0;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 view];

  v4 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_13];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    uint64_t v8 = *MEMORY[0x263F1CF18];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) setAccessibilityTraits:v8];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility;
  [(VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility *)&v4 viewDidAppear:a3];
  [(VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility;
  [(VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility *)&v4 updateVisibleCellsWithPlaybackIdentifiers:a3];
  [(VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end