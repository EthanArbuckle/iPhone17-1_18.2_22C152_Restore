@interface SBIconListViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityForceRefreshOfInvertColors:(id)a3;
- (void)_accessibilityLoadInvertColors;
- (void)addSubview:(id)a3;
- (void)insertSubview:(id)a3 aboveSubview:(id)a4;
- (void)insertSubview:(id)a3 atIndex:(int64_t)a4;
- (void)insertSubview:(id)a3 belowSubview:(id)a4;
@end

@implementation SBIconListViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return _AXSInvertColorsEnabledGlobalCached() != 0;
}

- (void)_accessibilityForceRefreshOfInvertColors:(id)a3
{
  id v3 = a3;
  if (_AXSInvertColorsEnabledGlobalCached()
    && [v3 accessibilityIgnoresInvertColors])
  {
    [v3 setAccessibilityIgnoresInvertColors:0];
    [v3 setAccessibilityIgnoresInvertColors:1];
  }
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewInvertColorsAccessibility;
  id v6 = a3;
  [(SBIconListViewInvertColorsAccessibility *)&v7 insertSubview:v6 atIndex:a4];
  -[SBIconListViewInvertColorsAccessibility _accessibilityForceRefreshOfInvertColors:](self, "_accessibilityForceRefreshOfInvertColors:", v6, v7.receiver, v7.super_class);
}

- (void)addSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconListViewInvertColorsAccessibility;
  id v4 = a3;
  [(SBIconListViewInvertColorsAccessibility *)&v5 addSubview:v4];
  -[SBIconListViewInvertColorsAccessibility _accessibilityForceRefreshOfInvertColors:](self, "_accessibilityForceRefreshOfInvertColors:", v4, v5.receiver, v5.super_class);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewInvertColorsAccessibility;
  id v6 = a3;
  [(SBIconListViewInvertColorsAccessibility *)&v7 insertSubview:v6 belowSubview:a4];
  -[SBIconListViewInvertColorsAccessibility _accessibilityForceRefreshOfInvertColors:](self, "_accessibilityForceRefreshOfInvertColors:", v6, v7.receiver, v7.super_class);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewInvertColorsAccessibility;
  id v6 = a3;
  [(SBIconListViewInvertColorsAccessibility *)&v7 insertSubview:v6 aboveSubview:a4];
  -[SBIconListViewInvertColorsAccessibility _accessibilityForceRefreshOfInvertColors:](self, "_accessibilityForceRefreshOfInvertColors:", v6, v7.receiver, v7.super_class);
}

- (void)_accessibilityLoadInvertColors
{
  if (_AXSInvertColorsEnabled())
  {
    id v3 = [(SBIconListViewInvertColorsAccessibility *)self subviews];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_191E0;
    v4[3] = &unk_449F8;
    v4[4] = self;
    [v3 enumerateObjectsUsingBlock:v4];
  }
}

@end