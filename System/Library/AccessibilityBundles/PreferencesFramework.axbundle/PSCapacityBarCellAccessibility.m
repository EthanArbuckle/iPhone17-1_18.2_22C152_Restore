@interface PSCapacityBarCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PSCapacityBarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSCapacityBarCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PSCapacityBarCell" isKindOfClass:@"PSTableCell"];
  [v3 validateClass:@"PSCapacityBarCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PSCapacityBarCell" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (id)accessibilityLabel
{
  return (id)[(PSCapacityBarCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _sizeLabel"];
}

- (id)accessibilityValue
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v26 = 0;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 specifier];
  v4 = [v3 propertyForKey:*MEMORY[0x263F5FF80]];

  if (v4)
  {
    uint64_t v5 = [v4 capacity];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = [v4 categories];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v23;
      double v11 = (double)v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v14 = (double)(unint64_t)objc_msgSend(v13, "bytes", v19, v20, v21) / v11;
          if (v14 >= 0.01)
          {
            v15 = [v13 title];
            float v16 = v14;
            v20 = MEMORY[0x24565C9D0](0, v16);
            v21 = @"__AXStringForVariablesSentinel";
            v19 = v15;
            uint64_t v17 = __UIAXStringForVariables();

            v9 = (void *)v17;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end