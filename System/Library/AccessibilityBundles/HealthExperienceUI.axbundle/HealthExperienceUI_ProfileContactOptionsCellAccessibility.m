@interface HealthExperienceUI_ProfileContactOptionsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation HealthExperienceUI_ProfileContactOptionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.ProfileContactOptionsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)HealthExperienceUI_ProfileContactOptionsCellAccessibility;
  [(HealthExperienceUI_ProfileContactOptionsCellAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  v3 = [(HealthExperienceUI_ProfileContactOptionsCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = [v8 _accessibilityFindSubviewDescendant:&__block_literal_global_276_0];
        v10 = [v9 accessibilityLabel];
        [v8 setAccessibilityLabel:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HealthExperienceUI_ProfileContactOptionsCellAccessibility;
  [(HealthExperienceUI_ProfileContactOptionsCellAccessibility *)&v3 layoutSubviews];
  [(HealthExperienceUI_ProfileContactOptionsCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end