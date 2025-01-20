@interface SUUISectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHasOnlyStringViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation SUUISectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUISectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)layoutSubviews
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SUUISectionHeaderViewAccessibility;
  [(SUUISectionHeaderViewAccessibility *)&v15 layoutSubviews];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(SUUISectionHeaderViewAccessibility *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x263F1CEE8] | *MEMORY[0x263F21B60];
    uint64_t v8 = *MEMORY[0x263F1CEF8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((v7 & [v10 _accessibilityNativeTraits]) == 0) {
          objc_msgSend(v10, "setAccessibilityTraits:", v8 | objc_msgSend(v10, "accessibilityTraits"));
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)_axHasOnlyStringViews
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SUUISectionHeaderViewAccessibility *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        NSClassFromString(&cfstr_Suuiattributed.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)accessibilityLabel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(SUUISectionHeaderViewAccessibility *)self subviews];
  uint64_t v3 = [NSString string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        NSClassFromString(&cfstr_Suuiattributed.isa);
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 _accessibilityViewIsVisible])
        {
          long long v12 = [v9 accessibilityLabel];
          uint64_t v10 = __AXStringForVariables();

          uint64_t v3 = (void *)v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(SUUISectionHeaderViewAccessibility *)self _axHasOnlyStringViews]) {
    return *MEMORY[0x263F1CF18];
  }
  [(SUUISectionHeaderViewAccessibility *)self subviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        NSClassFromString(&cfstr_Suuiattributed.isa);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v8, "_accessibilityViewIsVisible", (void)v11) & 1) != 0)
        {
          unint64_t v9 = [v8 accessibilityTraits];

          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  unint64_t v9 = *MEMORY[0x263F813E8];
LABEL_14:

  return v9;
}

@end