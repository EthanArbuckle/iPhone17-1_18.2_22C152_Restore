@interface SBIconViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (id)_contextMenuInteraction:(id)a3 previewForIconWithConfigurationOptions:(unint64_t)a4 highlighted:(BOOL)a5;
@end

@implementation SBIconViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if (_AXSInvertColorsEnabledGlobalCached())
  {
    char isKindOfClass = 1;
  }
  else
  {
    v4 = [(SBIconViewInvertColorsAccessibility *)self safeValueForKey:@"superview"];
    NSClassFromString(@"SBFloatingDockIconListView");
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      NSClassFromString(@"SBDockIconListView");
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  return isKindOfClass & 1;
}

- (id)_contextMenuInteraction:(id)a3 previewForIconWithConfigurationOptions:(unint64_t)a4 highlighted:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SBIconViewInvertColorsAccessibility;
  v5 = [(SBIconViewInvertColorsAccessibility *)&v8 _contextMenuInteraction:a3 previewForIconWithConfigurationOptions:a4 highlighted:a5];
  v6 = [v5 view];
  [v6 setAccessibilityIgnoresInvertColors:1];

  return v5;
}

@end