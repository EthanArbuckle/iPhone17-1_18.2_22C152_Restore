@interface VideosUI_MonogramLockupCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation VideosUI_MonogramLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MonogramLockupCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIMonogramView"];
  [v3 validateClass:@"VideosUI.MonogramLockupCell" hasSwiftField:@"monogramView" withSwiftType:"Optional<VUIMonogramView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIMonogramView", @"overlayView", "@", 0);
  [v3 validateClass:@"VideosUI.MonogramLockupCell" hasSwiftField:@"titleLabel" withSwiftType:"Optional<VUILabel>"];
  [v3 validateClass:@"VideosUI.MonogramLockupCell" hasSwiftField:@"subtitleLabel" withSwiftType:"Optional<VUILabel>"];
}

- (id)accessibilityLabel
{
  id v3 = [(VideosUI_MonogramLockupCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(VideosUI_MonogramLockupCellAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "length", v6, @"__AXStringForVariablesSentinel"))
  {
    v9 = [(VideosUI_MonogramLockupCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x245669780](@"VUIMonogramView")];
    uint64_t v10 = [v9 accessibilityLabel];

    v8 = (void *)v10;
  }

  return v8;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityValue
{
  id v3 = [(VideosUI_MonogramLockupCellAccessibility *)self safeSwiftValueForKey:@"monogramView"];
  v4 = [v3 safeValueForKey:@"overlayView"];

  if ([v4 _accessibilityViewIsVisible])
  {
    uint64_t v5 = accessibilityLocalizedString(@"sports.favorites.isFavorited");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VideosUI_MonogramLockupCellAccessibility;
    uint64_t v5 = [(VideosUI_MonogramLockupCellAccessibility *)&v8 accessibilityValue];
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  if ([(VideosUI_MonogramLockupCellAccessibility *)self _accessibilityHasDescendantOfType:MEMORY[0x245669780](@"VUIMonogramView", a2)])
  {
    v5.receiver = self;
    v5.super_class = (Class)VideosUI_MonogramLockupCellAccessibility;
    return *MEMORY[0x263F1CEE8] | [(VideosUI_MonogramLockupCellAccessibility *)&v5 accessibilityTraits];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)VideosUI_MonogramLockupCellAccessibility;
    return [(VideosUI_MonogramLockupCellAccessibility *)&v4 accessibilityTraits];
  }
}

@end