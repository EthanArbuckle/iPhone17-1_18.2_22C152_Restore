@interface SBUIProudLockIconViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (id)_activeViewsForState:(int64_t)a3;
@end

@implementation SBUIProudLockIconViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIProudLockIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return _AXSInvertColorsEnabledGlobalCached() != 0;
}

- (id)_activeViewsForState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIProudLockIconViewInvertColorsAccessibility;
  v3 = [(SBUIProudLockIconViewInvertColorsAccessibility *)&v5 _activeViewsForState:a3];
  [v3 enumerateObjectsUsingBlock:&stru_44AD8];

  return v3;
}

@end