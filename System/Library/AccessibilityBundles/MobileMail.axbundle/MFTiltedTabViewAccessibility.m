@interface MFTiltedTabViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setPresented:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MFTiltedTabViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFTiltedTabView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFTiltedTabView" hasInstanceVariable:@"_visibleItems" withType:"NSMutableArray"];
  [v3 validateClass:@"_MFTiltedTabItemView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MFTiltedTabItemView", @"borrowedContentView", "@", 0);
  [v3 validateClass:@"MFTiltedTabView" hasInstanceVariable:@"_presented" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MFTiltedTabItemView", @"closeButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"popToRootViewControllerAnimated:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MFTiltedTabViewAccessibility;
  [(MFTiltedTabViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(MFTiltedTabViewAccessibility *)self safeValueForKey:@"_visibleItems"];
  v4 = __UIAccessibilityCastAsClass();

  v6 = v4;
  id v5 = v4;
  AXPerformSafeBlock();
}

void __74__MFTiltedTabViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v14 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v6 = [v5 safeValueForKey:@"borrowedContentView"];
        objc_super v7 = NSString;
        v8 = accessibilityLocalizedString(@"close.draft.format");
        v9 = [v6 accessibilityValue];
        v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

        v11 = [v5 safeValueForKey:@"closeButton"];
        [v11 setAccessibilityLabel:v10];
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v2);
  }
}

- (void)setPresented:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MFTiltedTabViewAccessibility;
  [(MFTiltedTabViewAccessibility *)&v5 setPresented:a3 animated:a4];
  [(MFTiltedTabViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityElements
{
  if ([(MFTiltedTabViewAccessibility *)self safeBoolForKey:@"_presented"])
  {
    v5.receiver = self;
    v5.super_class = (Class)MFTiltedTabViewAccessibility;
    uint64_t v3 = [(MFTiltedTabViewAccessibility *)&v5 accessibilityElements];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  if ([(MFTiltedTabViewAccessibility *)self safeBoolForKey:@"_presented"])
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    uint64_t v2 = (UIView *)objc_claimAutoreleasedReturnValue();
    [(UIView *)v2 bounds];
    CGRect v12 = UIAccessibilityConvertFrameToScreenCoordinates(v11, v2);
    CGFloat x = v12.origin.x;
    CGFloat y = v12.origin.y;
    CGFloat width = v12.size.width;
    CGFloat height = v12.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x263F001A8];
    CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

@end