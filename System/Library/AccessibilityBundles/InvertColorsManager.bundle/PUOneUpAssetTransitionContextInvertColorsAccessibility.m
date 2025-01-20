@interface PUOneUpAssetTransitionContextInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_setSnapshotView:(id)a3;
@end

@implementation PUOneUpAssetTransitionContextInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUOneUpAssetTransitionContext";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setSnapshotView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpAssetTransitionContextInvertColorsAccessibility;
  [(PUOneUpAssetTransitionContextInvertColorsAccessibility *)&v4 _setSnapshotView:a3];
  [(PUOneUpAssetTransitionContextInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PUOneUpAssetTransitionContextInvertColorsAccessibility *)self safeUIViewForKey:@"snapshotView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end