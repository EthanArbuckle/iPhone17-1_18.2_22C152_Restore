@interface PXCuratedLibraryFooterControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_shouldRevealPhotosFooterView;
- (void)scrollViewControllerDidScroll:(id)a3;
@end

@implementation PXCuratedLibraryFooterControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCuratedLibraryFooterController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryFooterController", @"_shouldRevealPhotosFooterView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryFooterController", @"gridView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGView", @"scrollViewController", "@", 0);
  [v3 validateClass:@"PXUIScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIScrollViewController", @"isScrolledAtEdge:tolerance:", "B", "I", "d", 0);
  [v3 validateProtocol:@"PXScrollViewControllerObserver" hasMethod:@"scrollViewControllerDidScroll:" isInstanceMethod:1 isRequired:0];
  [v3 validateClass:@"PXCuratedLibraryFooterController" conformsToProtocol:@"PXScrollViewControllerObserver"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryFooterController", @"_conditionallyRevealPhotosFooterView", "v", 0);
}

- (BOOL)_shouldRevealPhotosFooterView
{
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryFooterControllerAccessibility;
  unsigned __int8 v3 = [(PXCuratedLibraryFooterControllerAccessibility *)&v12 _shouldRevealPhotosFooterView];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    v4 = [(PXCuratedLibraryFooterControllerAccessibility *)self safeValueForKey:@"gridView"];
    v5 = [v4 safeValueForKey:@"scrollViewController"];

    MEMORY[0x2455E3C60](@"PXUIScrollViewController");
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 0;
      v9 = &v8;
      uint64_t v10 = 0x2020000000;
      char v11 = 0;
      id v7 = v5;
      AXPerformSafeBlock();
      unsigned __int8 v3 = *((unsigned char *)v9 + 24) != 0;

      _Block_object_dispose(&v8, 8);
    }
  }
  return v3;
}

uint64_t __78__PXCuratedLibraryFooterControllerAccessibility__shouldRevealPhotosFooterView__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isScrolledAtEdge:3 tolerance:1.0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryFooterControllerAccessibility;
  [(PXCuratedLibraryFooterControllerAccessibility *)&v3 scrollViewControllerDidScroll:a3];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    AXPerformSafeBlock();
  }
}

uint64_t __79__PXCuratedLibraryFooterControllerAccessibility_scrollViewControllerDidScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _conditionallyRevealPhotosFooterView];
}

@end