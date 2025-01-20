@interface PDFIconsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityAnnouncementTimer;
- (void)_accessibilitySetAnnouncementTimer:(id)a3;
- (void)_updateScrubberForPageIndex:(int)a3 goToPage:(BOOL)a4;
@end

@implementation PDFIconsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PDFIconsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFIconsView", @"_updateScrubberForPageIndex:goToPage:", "v", "i", "B", 0);
  [v3 validateClass:@"PDFThumbnailView"];
}

- (id)_accessibilityAnnouncementTimer
{
}

- (void)_accessibilitySetAnnouncementTimer:(id)a3
{
}

- (void)_updateScrubberForPageIndex:(int)a3 goToPage:(BOOL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PDFIconsViewAccessibility;
  [(PDFIconsViewAccessibility *)&v14 _updateScrubberForPageIndex:*(void *)&a3 goToPage:a4];
  v5 = [(PDFIconsViewAccessibility *)self _accessibilityAnnouncementTimer];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F22868]);
    v5 = (void *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(PDFIconsViewAccessibility *)self _accessibilitySetAnnouncementTimer:v5];
  }
  v7 = [(PDFIconsViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_0 startWithSelf:1];
  v8 = [v7 accessibilityValue];
  objc_initWeak(&location, v7);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__PDFIconsViewAccessibility__updateScrubberForPageIndex_goToPage___block_invoke_2;
  v10[3] = &unk_26513FD18;
  objc_copyWeak(&v12, &location);
  id v9 = v8;
  id v11 = v9;
  [v5 afterDelay:v10 processBlock:0.1];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __66__PDFIconsViewAccessibility__updateScrubberForPageIndex_goToPage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245659980](@"PDFThumbnailView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __66__PDFIconsViewAccessibility__updateScrubberForPageIndex_goToPage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id argument = [WeakRetained accessibilityValue];

  if (([argument isEqualToString:*(void *)(a1 + 32)] & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  }
}

@end