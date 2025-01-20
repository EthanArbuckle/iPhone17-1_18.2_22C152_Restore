@interface CAMSemanticStyleSettingsViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CAMSemanticStyleSettingsViewInvertColorsAccessibility)init;
- (void)_accessibilityLoadInvertColors;
@end

@implementation CAMSemanticStyleSettingsViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSemanticStyleSettingsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CAMSemanticStyleSettingsViewInvertColorsAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)CAMSemanticStyleSettingsViewInvertColorsAccessibility;
  v2 = [(CAMSemanticStyleSettingsViewInvertColorsAccessibility *)&v4 init];
  [(CAMSemanticStyleSettingsViewInvertColorsAccessibility *)v2 _accessibilityLoadInvertColors];

  return v2;
}

- (void)_accessibilityLoadInvertColors
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CAMSemanticStyleSettingsViewInvertColorsAccessibility *)self safeArrayForKey:@"__semanticStyleImageViews", 0];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setAccessibilityIgnoresInvertColors:1];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end