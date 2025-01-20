@interface ETHorizontalColorPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (int64_t)accessibilityNavigationStyle;
- (void)setDimmed:(BOOL)a3 excludeSelectedColor:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation ETHorizontalColorPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETHorizontalColorPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETHorizontalColorPicker" hasProperty:@"paletteCircles" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETHorizontalColorPicker", @"setDimmed:excludeSelectedColor:animated:", "v", "B", "B", "B", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (void)setDimmed:(BOOL)a3 excludeSelectedColor:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)ETHorizontalColorPickerAccessibility;
  [(ETHorizontalColorPickerAccessibility *)&v20 setDimmed:a3 excludeSelectedColor:a4 animated:a5];
  char v19 = 0;
  objc_opt_class();
  v7 = [(ETHorizontalColorPickerAccessibility *)self safeValueForKey:@"paletteCircles"];
  v8 = __UIAccessibilityCastAsClass();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    BOOL v13 = !v5;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setIsAccessibilityElement:", v13, (void)v15);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v11);
  }
}

@end