@interface HomeWallpaperScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsWallpaperEditable;
- (BOOL)isAccessibilityElement;
- (double)aspectFillScale;
- (id)_accessibilityScrollStatusFormatString;
- (id)_accessibilityZoomedString;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation HomeWallpaperScrollViewAccessibility

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
}

- (id)accessibilityLabel
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:AXWallpaperScrollViewIdentifier];

  if (v4)
  {
    v5 = accessibilityHomeUILocalizedString(@"wallpaper.viewfinder.label");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    v5 = [(HomeWallpaperScrollViewAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:AXWallpaperScrollViewIdentifier];

  if (v4)
  {
    v5 = [(HomeWallpaperScrollViewAccessibility *)self _accessibilityZoomedString];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    v5 = [(HomeWallpaperScrollViewAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (id)accessibilityHint
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:AXWallpaperScrollViewIdentifier])
  {
    BOOL v4 = [(HomeWallpaperScrollViewAccessibility *)self _accessibilityIsWallpaperEditable];

    if (v4)
    {
      v5 = accessibilityHomeUILocalizedString(@"wallpaper.viewfinder.hint");
      goto LABEL_6;
    }
  }
  else
  {
  }
  v7.receiver = self;
  v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
  v5 = [(HomeWallpaperScrollViewAccessibility *)&v7 accessibilityHint];
LABEL_6:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:AXWallpaperScrollViewIdentifier];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)HomeWallpaperScrollViewAccessibility;
  return [(HomeWallpaperScrollViewAccessibility *)&v6 isAccessibilityElement];
}

- (void)accessibilityIncrement
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:AXWallpaperScrollViewIdentifier];

  if (v4)
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    [v5 zoomScale];
    [v5 setZoomScale:v6 + 0.1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    [(HomeWallpaperScrollViewAccessibility *)&v7 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:AXWallpaperScrollViewIdentifier];

  if (v4)
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    [v5 zoomScale];
    [v5 setZoomScale:v6 + -0.1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    [(HomeWallpaperScrollViewAccessibility *)&v7 accessibilityDecrement];
  }
}

- (id)_accessibilityScrollStatusFormatString
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:AXWallpaperScrollViewIdentifier];

  if (v4)
  {
    v5 = accessibilityHomeUILocalizedString(@"wallpaper.viewfinder.position");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    v5 = [(HomeWallpaperScrollViewAccessibility *)&v7 _accessibilityScrollStatusFormatString];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(HomeWallpaperScrollViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:AXWallpaperScrollViewIdentifier])
  {
    BOOL v4 = [(HomeWallpaperScrollViewAccessibility *)self _accessibilityIsWallpaperEditable];

    if (v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
      return *MEMORY[0x263F1CED8] | [(HomeWallpaperScrollViewAccessibility *)&v7 accessibilityTraits];
    }
  }
  else
  {
  }
  v6.receiver = self;
  v6.super_class = (Class)HomeWallpaperScrollViewAccessibility;
  return [(HomeWallpaperScrollViewAccessibility *)&v6 accessibilityTraits];
}

- (BOOL)_accessibilityIsWallpaperEditable
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 maximumZoomScale];
  double v4 = v3;
  [v2 minimumZoomScale];
  BOOL v6 = v4 != v5;

  return v6;
}

- (id)_accessibilityZoomedString
{
  objc_opt_class();
  double v3 = __UIAccessibilityCastAsClass();
  [v3 zoomScale];
  [(HomeWallpaperScrollViewAccessibility *)self aspectFillScale];
  double v4 = AXFormatMagnificationFactor();

  return v4;
}

- (double)aspectFillScale
{
  objc_opt_class();
  double v3 = [(HomeWallpaperScrollViewAccessibility *)self safeValueForKey:@"delegate"];
  double v4 = [v3 safeValueForKey:@"imageView"];
  double v5 = __UIAccessibilityCastAsClass();

  [v5 bounds];
  if (v6 == 0.0
    || (double v8 = v7, v7 == 0.0)
    || ((double v9 = v6,
         [(HomeWallpaperScrollViewAccessibility *)self bounds],
         double v11 = v10 / v9,
         [(HomeWallpaperScrollViewAccessibility *)self bounds],
         v11 >= v12 / v8)
      ? (double v13 = v11)
      : (double v13 = v12 / v8),
        v13 == 0.0))
  {
    double v13 = 1.0;
  }

  return v13;
}

@end