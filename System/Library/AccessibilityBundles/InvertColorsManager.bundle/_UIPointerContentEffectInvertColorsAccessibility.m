@interface _UIPointerContentEffectInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_ensureRelativeEffectViewOrderInContainer;
@end

@implementation _UIPointerContentEffectInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPointerContentEffect";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v4 = [(_UIPointerContentEffectInvertColorsAccessibility *)self safeUIViewForKey:@"pointerPortal"];
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v3 = [v4 layer];
  if (IsInvertColorsEnabled) {
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v3];
  }
  else {
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v3];
  }
}

- (void)_ensureRelativeEffectViewOrderInContainer
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerContentEffectInvertColorsAccessibility;
  [(_UIPointerContentEffectInvertColorsAccessibility *)&v3 _ensureRelativeEffectViewOrderInContainer];
  [(_UIPointerContentEffectInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end