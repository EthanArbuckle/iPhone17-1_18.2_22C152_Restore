@interface AVTStickerRecentsStickerCollectionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation AVTStickerRecentsStickerCollectionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTStickerRecentsStickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 window];
  v4 = [v3 rootViewController];
  v5 = [v4 safeStringForKey:@"_hostBundleID"];

  if (v5) {
    [v2 _setAccessibilityInvertState:_AXSInvertColorsEnabledAppCached()];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTStickerRecentsStickerCollectionViewCellInvertColorsAccessibility;
  [(AVTStickerRecentsStickerCollectionViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(AVTStickerRecentsStickerCollectionViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end