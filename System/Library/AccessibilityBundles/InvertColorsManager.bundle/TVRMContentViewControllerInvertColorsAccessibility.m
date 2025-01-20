@interface TVRMContentViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (TVRMContentViewControllerInvertColorsAccessibility)init;
- (void)_accessibilityLoadInvertColors;
@end

@implementation TVRMContentViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRMContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (TVRMContentViewControllerInvertColorsAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)TVRMContentViewControllerInvertColorsAccessibility;
  v2 = [(TVRMContentViewControllerInvertColorsAccessibility *)&v4 init];
  [(TVRMContentViewControllerInvertColorsAccessibility *)v2 _accessibilityLoadInvertColors];

  return v2;
}

- (void)_accessibilityLoadInvertColors
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(TVRMContentViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"buttonView"];
  v3 = [v2 subviews];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        AXSafeClassFromString();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          v9 = [v8 safeValueForKey:@"_materialLayer"];
          v10 = __UIAccessibilityCastAsClass();

          if (v10) {
            +[AXInvertColorsAppHelper toggleInvertColors:v10 moveFilterToFront:1];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

@end