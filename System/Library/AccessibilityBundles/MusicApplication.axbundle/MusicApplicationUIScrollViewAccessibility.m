@interface MusicApplicationUIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (double)_accessibilityScrollHeightDistance;
- (id)_accessibilityScrollStatus;
@end

@implementation MusicApplicationUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicApplication.JSVerticalStackViewModelViewController"];
  [v3 validateClass:@"MusicApplication.NowPlayingLyricsViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.NowPlayingLyricsViewController", @"cardHeight", "d", 0);
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsViewController"];
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsViewController" hasSwiftField:@"scrollView" withSwiftType:"UIScrollView"];
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsViewController" hasSwiftField:@"lineViews" withSwiftType:"Array<SyncedLyricsLineView>"];
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  v2 = [(MusicApplicationUIScrollViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_17 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __92__MusicApplicationUIScrollViewAccessibility__accessibilityDrawsFocusRingWhenChildrenFocused__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicApplication.JSVerticalStackViewModelViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v3 = [(MusicApplicationUIScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AXSyncedLyricsScrollView"];

  if (v4)
  {
    v5 = [(MusicApplicationUIScrollViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_297 startWithSelf:1];
    v6 = [v5 _accessibilityViewController];

    if (v6)
    {
      char v29 = 0;
      objc_opt_class();
      v7 = [v6 safeSwiftValueForKey:@"scrollView"];
      v8 = __UIAccessibilityCastAsClass();

      v9 = [v6 safeSwiftArrayForKey:@"lineViews"];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v12 = 0;
        uint64_t v13 = *(void *)v26;
        double v14 = INFINITY;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v9);
            }
            v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            [v8 contentOffset];
            double v18 = v17;
            [v16 frame];
            double v20 = vabdd_f64(v18, v19);
            if (v20 < v14)
            {
              id v21 = v16;

              v12 = v21;
              double v14 = v20;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v11);
        if (v12)
        {
          v22 = [v12 accessibilityLabel];

          goto LABEL_17;
        }
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)MusicApplicationUIScrollViewAccessibility;
  v22 = [(MusicApplicationUIScrollViewAccessibility *)&v24 _accessibilityScrollStatus];
LABEL_17:

  return v22;
}

uint64_t __71__MusicApplicationUIScrollViewAccessibility__accessibilityScrollStatus__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicCoreUI.SyncedLyricsViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)_accessibilityScrollHeightDistance
{
  BOOL v3 = [(MusicApplicationUIScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AXSyncedLyricsScrollView"];

  if (v4
    && (-[MusicApplicationUIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_301, 1), v5 = objc_claimAutoreleasedReturnValue(), [v5 _accessibilityViewController], v6 = objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    objc_opt_class();
    v7 = __UIAccessibilityCastAsClass();
    [(MusicApplicationUIScrollViewAccessibility *)self contentOffset];
    v8 = [v7 view];
    [v8 bounds];

    [v7 safeSwiftCGFloatForKey:@"containerHeight"];
    double v10 = v9;
    if (v9 <= 0.0)
    {
      uint64_t v11 = [v7 view];
      [v11 frame];
      double v10 = v12;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MusicApplicationUIScrollViewAccessibility;
    [(MusicApplicationUIScrollViewAccessibility *)&v15 _accessibilityScrollHeightDistance];
    return v13;
  }
  return v10;
}

uint64_t __79__MusicApplicationUIScrollViewAccessibility__accessibilityScrollHeightDistance__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicCoreUI.SyncedLyricsViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end