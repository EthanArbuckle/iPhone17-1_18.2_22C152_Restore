@interface UIVisualEffectViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_ensureBackgroundHost;
@end

@implementation UIVisualEffectViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIVisualEffectView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_ensureBackgroundHost
{
  v7.receiver = self;
  v7.super_class = (Class)UIVisualEffectViewInvertColorsAccessibility;
  [(UIVisualEffectViewInvertColorsAccessibility *)&v7 _ensureBackgroundHost];
  if ([(UIVisualEffectViewInvertColorsAccessibility *)self accessibilityVisualEffectHandleBackdrop])
  {
    v3 = [(UIVisualEffectViewInvertColorsAccessibility *)self contentView];
    v4 = +[UIColor blackColor];
    v5 = [v4 colorWithAlphaComponent:0.5];
    id v6 = +[AXInvertColorsAppHelper insertBackgroundView:v3 color:v5];
  }
}

@end