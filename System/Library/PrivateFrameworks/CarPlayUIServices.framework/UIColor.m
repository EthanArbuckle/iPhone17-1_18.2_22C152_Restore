@interface UIColor
@end

@implementation UIColor

void __66__UIColor_CarPlayUIServices__crsui_dashboardWidgetBackgroundColor__block_invoke()
{
  v0 = [MEMORY[0x263F1C550] colorWithRed:0.270588235 green:0.270588235 blue:0.28627451 alpha:1.0];
  v1 = [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.176470588 blue:0.184313725 alpha:1.0];
  v2 = [MEMORY[0x263F1C550] colorWithWhite:0.960784314 alpha:1.0];
  v3 = (void *)MEMORY[0x263F1C550];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__UIColor_CarPlayUIServices__crsui_dashboardWidgetBackgroundColor__block_invoke_2;
  v9[3] = &unk_264307640;
  id v10 = v2;
  id v11 = v1;
  id v12 = v0;
  id v4 = v0;
  id v5 = v1;
  id v6 = v2;
  uint64_t v7 = [v3 colorWithDynamicProvider:v9];
  v8 = (void *)crsui_dashboardWidgetBackgroundColor_dashboardWidgetBackgroundColor;
  crsui_dashboardWidgetBackgroundColor_dashboardWidgetBackgroundColor = v7;
}

id __66__UIColor_CarPlayUIServices__crsui_dashboardWidgetBackgroundColor__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 userInterfaceStyle] == 1)
  {
    id v4 = a1 + 4;
  }
  else
  {
    id v5 = self;
    uint64_t v6 = [v3 valueForNSIntegerTrait:v5];

    id v4 = a1 + 6;
    if (v6 == 1) {
      id v4 = a1 + 5;
    }
  }
  id v7 = *v4;

  return v7;
}

uint64_t __73__UIColor_CarPlayUIServices__crsui_consoleTurnCardETATrayBackgroundColor__block_invoke()
{
  crsui_consoleTurnCardETATrayBackgroundColor_consoleTurnCardBackgroundColor = [MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_6];
  return MEMORY[0x270F9A758]();
}

id __73__UIColor_CarPlayUIServices__crsui_consoleTurnCardETATrayBackgroundColor__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    v2 = [MEMORY[0x263F1C550] blackColor];
    id v3 = v2;
    double v4 = 0.65;
  }
  else
  {
    v2 = [MEMORY[0x263F1C550] whiteColor];
    id v3 = v2;
    double v4 = 0.75;
  }
  id v5 = [v2 colorWithAlphaComponent:v4];

  return v5;
}

@end