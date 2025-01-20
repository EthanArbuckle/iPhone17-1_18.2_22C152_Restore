@interface PLPlatterHeaderContentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_configureIconButtonsForIcons:(id)a3;
@end

@implementation PLPlatterHeaderContentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLPlatterHeaderContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PLPlatterHeaderContentViewInvertColorsAccessibility *)self safeArrayForKey:@"_iconButtons", 0];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setAccessibilityIgnoresInvertColors:_AXSInvertColorsEnabledGlobalCached() != 0];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_configureIconButtonsForIcons:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLPlatterHeaderContentViewInvertColorsAccessibility;
  [(PLPlatterHeaderContentViewInvertColorsAccessibility *)&v4 _configureIconButtonsForIcons:a3];
  [(PLPlatterHeaderContentViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end