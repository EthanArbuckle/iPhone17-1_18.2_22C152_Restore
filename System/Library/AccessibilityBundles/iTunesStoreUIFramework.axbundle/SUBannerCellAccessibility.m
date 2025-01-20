@interface SUBannerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_reloadButtons;
@end

@implementation SUBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUBannerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_reloadButtons
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)SUBannerCellAccessibility;
  [(SUBannerCellAccessibility *)&v22 _reloadButtons];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(SUBannerCellAccessibility *)self safeValueForKey:@"subviews", 0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) setIsAccessibilityElement:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  v8 = [(SUBannerCellAccessibility *)self safeValueForKey:@"_leftButton"];
  [v8 setIsAccessibilityElement:1];

  v9 = [(SUBannerCellAccessibility *)self safeValueForKey:@"_leftButton"];
  v10 = [(SUBannerCellAccessibility *)self safeValueForKey:@"_configurationView"];
  v11 = [v10 safeValueForKey:@"_configuration"];
  v12 = [v11 accessibilityTableViewCellText];
  [v9 setAccessibilityLabel:v12];

  v13 = [(SUBannerCellAccessibility *)self safeValueForKey:@"_rightButton"];
  [v13 setIsAccessibilityElement:1];

  v14 = [(SUBannerCellAccessibility *)self safeValueForKey:@"_rightButton"];
  v15 = [(SUBannerCellAccessibility *)self safeValueForKey:@"_configurationView"];
  v16 = [v15 safeValueForKey:@"_configuration"];
  v17 = [v16 accessibilityTableViewCellText];
  [v14 setAccessibilityLabel:v17];
}

@end