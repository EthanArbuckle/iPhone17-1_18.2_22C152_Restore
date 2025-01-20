@interface UberedCollectionViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UberedCollectionViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.UberedCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UberedCollectionViewControllerInvertColorsAccessibility;
  [(UberedCollectionViewControllerInvertColorsAccessibility *)&v15 viewWillAppear:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(UberedCollectionViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view", 0];
  v5 = [v4 subviews];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setAccessibilityIgnoresInvertColors:1];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

@end