@interface MapsUIPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axScrollSteppingPageViewForward:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MapsUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SteppingPageViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SteppingPageViewController", @"setSignIndex: animated:", "v", "q", "B", 0);
}

- (BOOL)_axScrollSteppingPageViewForward:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MapsUIPageControlAccessibility *)self superview];
  v6 = [v5 _accessibilityViewController];

  MEMORY[0x245653010](@"SteppingPageViewController");
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v8 = [(MapsUIPageControlAccessibility *)self currentPage];
    v9 = [MEMORY[0x263F1C408] sharedApplication];
    if ([v9 userInterfaceLayoutDirection] == 1) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 1;
    }

    if (v3) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = -v10;
    }
    if (v11 + v8 >= 0 && v11 + v8 < [(MapsUIPageControlAccessibility *)self numberOfPages])
    {
      id v13 = v6;
      AXPerformSafeBlock();
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
    }
  }

  return isKindOfClass & 1;
}

uint64_t __67__MapsUIPageControlAccessibility__axScrollSteppingPageViewForward___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSignIndex:*(void *)(a1 + 40) animated:0];
}

- (void)accessibilityIncrement
{
  if (![(MapsUIPageControlAccessibility *)self _axScrollSteppingPageViewForward:1])
  {
    v3.receiver = self;
    v3.super_class = (Class)MapsUIPageControlAccessibility;
    [(MapsUIPageControlAccessibility *)&v3 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  if (![(MapsUIPageControlAccessibility *)self _axScrollSteppingPageViewForward:0])
  {
    v3.receiver = self;
    v3.super_class = (Class)MapsUIPageControlAccessibility;
    [(MapsUIPageControlAccessibility *)&v3 accessibilityDecrement];
  }
}

@end