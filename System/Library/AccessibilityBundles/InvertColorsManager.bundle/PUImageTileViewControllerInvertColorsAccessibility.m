@interface PUImageTileViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_updateIfNeeded;
- (void)assetDidChange;
@end

@implementation PUImageTileViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUImageTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v2 = [(PUImageTileViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = objc_msgSend(v2, "subviews", 0);
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            AXSafeClassFromString();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          id v9 = v8;

          v2 = v9;
          goto LABEL_13;
        }
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)_updateIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewControllerInvertColorsAccessibility;
  [(PUImageTileViewControllerInvertColorsAccessibility *)&v3 _updateIfNeeded];
  [(PUImageTileViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)assetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewControllerInvertColorsAccessibility;
  [(PUImageTileViewControllerInvertColorsAccessibility *)&v3 assetDidChange];
  [(PUImageTileViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end