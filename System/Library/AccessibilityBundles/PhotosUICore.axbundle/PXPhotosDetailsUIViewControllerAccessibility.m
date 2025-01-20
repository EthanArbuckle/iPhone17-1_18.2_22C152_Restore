@interface PXPhotosDetailsUIViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)widgetComposition:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4;
- (id)_axDetailsDismissedBlock;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetDetailsDismissedBlock:(id)a3;
- (void)_ensureScrollViewController;
- (void)_loadWidgets;
- (void)_setAXDetailsDismissedBlock:(id)a3;
@end

@implementation PXPhotosDetailsUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosDetailsUIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXUIScrollViewController"];
  [v3 validateClass:@"PXPhotosDetailsUIViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsUIViewController", @"_scrollViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsUIViewController", @"_widgets", "@", 0);
  [v3 validateClass:@"PXUIScrollViewController" hasInstanceVariable:@"_scrollView" withType:"_PXUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsUIViewController", @"_loadWidgets", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsUIViewController", @"_ensureScrollViewController", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsUIViewController", @"widgetComposition:requestViewControllerDismissalAnimated:", "@", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  [(PXPhotosDetailsUIViewControllerAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PXPhotosDetailsUIViewControllerAccessibility *)self safeValueForKey:@"_scrollViewController"];
  MEMORY[0x2455E3C60](@"PXUIScrollViewController");
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 safeValueForKey:@"_scrollView"];
    [v5 accessibilitySetIdentification:@"AXPhotoDetailsScrollView"];
    [v4 accessibilitySetIdentification:@"AXPhotosDetailsUIViewController"];
    char v18 = 0;
    objc_opt_class();
    v6 = [(PXPhotosDetailsUIViewControllerAccessibility *)self safeValueForKey:@"navigationController"];
    v7 = __UIAccessibilityCastAsClass();

    [v4 _axAdjustScrollViewInsetsWithNavController:v7];
  }
  v8 = [(PXPhotosDetailsUIViewControllerAccessibility *)self safeArrayForKey:@"_widgets"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v13 conformsToProtocol:&unk_26F438080]) {
          [v13 _accessibilityLoadAccessibilityInformation];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_loadWidgets
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  [(PXPhotosDetailsUIViewControllerAccessibility *)&v3 _loadWidgets];
  [(PXPhotosDetailsUIViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_ensureScrollViewController
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  [(PXPhotosDetailsUIViewControllerAccessibility *)&v3 _ensureScrollViewController];
  [(PXPhotosDetailsUIViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axDetailsDismissedBlock
{
}

- (void)_setAXDetailsDismissedBlock:(id)a3
{
  id v3 = (id)MEMORY[0x2455E4100](a3, a2);
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axSetDetailsDismissedBlock:(id)a3
{
  id v4 = (id)[a3 copy];
  [(PXPhotosDetailsUIViewControllerAccessibility *)self _setAXDetailsDismissedBlock:v4];
}

- (BOOL)widgetComposition:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  BOOL v5 = [(PXPhotosDetailsUIViewControllerAccessibility *)&v9 widgetComposition:a3 requestViewControllerDismissalAnimated:a4];
  uint64_t v6 = [(PXPhotosDetailsUIViewControllerAccessibility *)self _axDetailsDismissedBlock];
  v7 = (void *)v6;
  if (v6 && v5) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

  return v5;
}

@end