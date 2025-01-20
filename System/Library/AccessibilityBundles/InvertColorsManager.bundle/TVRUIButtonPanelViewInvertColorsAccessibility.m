@interface TVRUIButtonPanelViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (TVRUIButtonPanelViewInvertColorsAccessibility)initWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 secondaryRightButtons:(id)a5 styleProvider:(id)a6;
- (void)_accessibilityLoadInvertColors;
@end

@implementation TVRUIButtonPanelViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIButtonPanelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (TVRUIButtonPanelViewInvertColorsAccessibility)initWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 secondaryRightButtons:(id)a5 styleProvider:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUIButtonPanelViewInvertColorsAccessibility;
  v6 = [(TVRUIButtonPanelViewInvertColorsAccessibility *)&v8 initWithPrimaryButtonType:a3 secondaryLeftButtons:a4 secondaryRightButtons:a5 styleProvider:a6];
  [(TVRUIButtonPanelViewInvertColorsAccessibility *)v6 _accessibilityLoadInvertColors];
  return v6;
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(TVRUIButtonPanelViewInvertColorsAccessibility *)self safeArrayForKey:@"leftButtons"];
  v4 = [(TVRUIButtonPanelViewInvertColorsAccessibility *)self safeArrayForKey:@"rightButtons"];
  v5 = +[NSArray axArrayWithPossiblyNilArrays:](NSArray, "axArrayWithPossiblyNilArrays:", 2, v3, v4);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v18 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        char v25 = 0;
        objc_opt_class();
        v7 = __UIAccessibilityCastAsClass();
        if (v25) {
LABEL_22:
        }
          abort();
        v19 = v7;
        uint64_t v20 = v6;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        objc_super v8 = [v7 subviews];
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              AXSafeClassFromString();
              if (objc_opt_isKindOfClass())
              {
                char v25 = 0;
                objc_opt_class();
                v14 = [v13 safeValueForKey:@"_materialLayer"];
                v15 = __UIAccessibilityCastAsClass();

                if (v25) {
                  goto LABEL_22;
                }
                if (v15) {
                  +[AXInvertColorsAppHelper toggleInvertColors:v15 moveFilterToFront:1];
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v20 + 1;
      }
      while ((id)(v20 + 1) != v18);
      id v18 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v18);
  }
}

@end