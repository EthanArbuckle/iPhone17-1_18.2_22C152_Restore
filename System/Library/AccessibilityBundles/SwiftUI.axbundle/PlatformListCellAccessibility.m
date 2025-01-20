@interface PlatformListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityRetrieveTableViewCellText;
- (id)accessibilityLabel;
@end

@implementation PlatformListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.ListTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SwiftUI.AccessibilityNode"];
  [v3 validateClass:@"SwiftUI.ListTableViewCell" isKindOfClass:@"UITableViewCell"];
}

- (id)accessibilityLabel
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)PlatformListCellAccessibility;
  v2 = [(PlatformListCellAccessibility *)&v27 accessibilityLabel];
  if (![v2 length])
  {
    char v26 = 0;
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    v4 = [v3 contentView];
    v5 = [v4 subviews];
    v6 = [v5 firstObject];
    v7 = [v6 _accessibilityFindUnsortedDescendantsPassingTest:&__block_literal_global_0];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      v12 = (void *)MEMORY[0x263F217A8];
      do
      {
        uint64_t v13 = 0;
        v14 = v2;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
          v16 = objc_msgSend(v15, "accessibilityLabel", v20, v21, (void)v22);
          v17 = [v15 accessibilityLanguage];
          if (v17)
          {
            v18 = [MEMORY[0x263F21660] axAttributedStringWithString:v16];

            [v18 setAttribute:v17 forKey:*v12];
            v16 = v18;
          }
          v20 = v16;
          v21 = @"__AXStringForVariablesSentinel";
          v2 = __UIAXStringForVariables();

          ++v13;
          v14 = v2;
        }
        while (v10 != v13);
        uint64_t v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16, v16, @"__AXStringForVariablesSentinel");
      }
      while (v10);
    }
  }

  return v2;
}

uint64_t __51__PlatformListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

- (CGPoint)accessibilityActivationPoint
{
  char v18 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 contentView];
  v5 = [v4 subviews];
  v6 = [v5 firstObject];
  v7 = [v6 accessibilityElements];

  if ([v7 count] == 1)
  {
    id v8 = [v7 firstObject];
    [v8 accessibilityActivationPoint];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PlatformListCellAccessibility;
    [(PlatformListCellAccessibility *)&v17 accessibilityActivationPoint];
    double v10 = v13;
    double v12 = v14;
  }

  double v15 = v10;
  double v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (id)_accessibilityRetrieveTableViewCellText
{
  return 0;
}

@end