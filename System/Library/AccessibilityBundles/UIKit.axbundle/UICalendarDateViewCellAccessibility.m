@interface UICalendarDateViewCellAccessibility
@end

@implementation UICalendarDateViewCellAccessibility

id __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22[2] = a1;
  v22[1] = a1;
  v22[0] = 0;
  memset(__b, 0, sizeof(__b));
  id obj = objc_loadWeakRetained(a1 + 4);
  uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v18)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v18;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v14);
      id v11 = (id)objc_msgSend(v21, "accessibilityLabel", v6, v7, v9);
      id v8 = (id)[v21 accessibilityValue];
      id v1 = (id)__AXStringForVariables();
      id v2 = v22[0];
      v22[0] = v1;

      id v19 = (id)objc_msgSend(v21, "safeUIViewForKey:", @"_decorationView", v11, v8, @"__AXStringForVariablesSentinel");
      id v6 = (id)[v19 accessibilityLabel];
      id v7 = (id)[v19 accessibilityValue];
      v9 = @"__AXStringForVariablesSentinel";
      id v3 = (id)__AXStringForVariables();
      id v4 = v22[0];
      v22[0] = v3;

      objc_storeStrong(&v19, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16, v6, v7, @"__AXStringForVariablesSentinel");
        if (!v15) {
          break;
        }
      }
    }
  }

  id v10 = v22[0];
  objc_storeStrong(v22, 0);

  return v10;
}

id __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_2(id *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20[2] = a1;
  v20[1] = a1;
  v20[0] = 0;
  memset(__b, 0, sizeof(__b));
  id obj = objc_loadWeakRetained(a1 + 4);
  uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v16)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v16;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(__b[1] + 8 * v12);
      id v7 = (id)objc_msgSend(v19, "accessibilityHint", v6, v8);
      id v1 = (id)__AXStringForVariables();
      id v2 = v20[0];
      v20[0] = v1;

      id v17 = (id)objc_msgSend(v19, "safeUIViewForKey:", @"_decorationView", v7, @"__AXStringForVariablesSentinel");
      id v6 = (id)[v17 accessibilityHint];
      id v8 = @"__AXStringForVariablesSentinel";
      id v3 = (id)__AXStringForVariables();
      id v4 = v20[0];
      v20[0] = v3;

      objc_storeStrong(&v17, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16, v6, @"__AXStringForVariablesSentinel");
        if (!v13) {
          break;
        }
      }
    }
  }

  id v9 = v20[0];
  objc_storeStrong(v20, 0);

  return v9;
}

BOOL __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)[WeakRetained safeUIViewForKey:@"_decorationContentView"];
  char v4 = [v2 isHidden];

  return (v4 & 1) == 0;
}

BOOL __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)[WeakRetained safeUIViewForKey:@"_decorationContentView"];
  char v4 = [v2 isHidden];

  return (v4 & 1) != 0;
}

uint64_t __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_5(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  uint64_t v8 = 0;
  uint64_t v8 = *MEMORY[0x263F1CEE8];
  char v7 = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  char v2 = [v5 isSelected];

  if (v2) {
    v8 |= *MEMORY[0x263F1CF38];
  }
  if (*(unsigned char *)(a1 + 40)) {
    return v8 | *MEMORY[0x263F1CF20];
  }
  return v8;
}

@end