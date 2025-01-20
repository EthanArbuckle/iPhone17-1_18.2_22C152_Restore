@interface CPSEntityStyles
+ (id)actionButtonFont;
+ (id)mapAnnotationDropShadow;
+ (id)mapButtonBackgroundColor;
+ (id)mapButtonDropShadow;
+ (id)mapButtonFont;
+ (id)pickerCellPrimaryFont;
+ (id)pickerCellPrimaryFontColor:(BOOL)a3;
+ (id)pickerCellSecondaryFont;
+ (id)pickerCellSecondaryFontColor:(BOOL)a3;
+ (id)pickerInfoButtonFont;
+ (id)pickerInfoPrimaryFont;
+ (id)pickerInfoSecondaryFont;
+ (id)pickerTitleFont;
@end

@implementation CPSEntityStyles

+ (id)actionButtonFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 12.0, a2, a1);
}

+ (id)mapButtonFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "preferredFontForTextStyle:", *MEMORY[0x263F1D2A0], a2, a1);
}

+ (id)pickerTitleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 16.0, *MEMORY[0x263F1D340], a2, a1);
}

+ (id)pickerCellPrimaryFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 15.0, *MEMORY[0x263F1D330], a2, a1);
}

+ (id)pickerCellSecondaryFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 12.0, *MEMORY[0x263F1D338], a2, a1);
}

+ (id)pickerCellPrimaryFontColor:(BOOL)a3
{
  char v7 = 0;
  char v5 = 0;
  if (a3)
  {
    id v8 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    char v7 = 1;
    id v3 = v8;
  }
  else
  {
    id v6 = (id)[MEMORY[0x263F1C550] labelColor];
    char v5 = 1;
    id v3 = v6;
  }
  v9 = v3;
  if (v5) {

  }
  if (v7) {

  }
  return v9;
}

+ (id)pickerCellSecondaryFontColor:(BOOL)a3
{
  char v7 = 0;
  char v5 = 0;
  if (a3)
  {
    id v8 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    char v7 = 1;
    id v3 = v8;
  }
  else
  {
    id v6 = (id)[MEMORY[0x263F1C550] labelColor];
    char v5 = 1;
    id v3 = v6;
  }
  v9 = v3;
  if (v5) {

  }
  if (v7) {

  }
  return v9;
}

+ (id)pickerInfoPrimaryFont
{
  return +[CPSEntityStyles pickerTitleFont];
}

+ (id)pickerInfoSecondaryFont
{
  return +[CPSEntityStyles pickerCellSecondaryFont];
}

+ (id)pickerInfoButtonFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 15.0, *MEMORY[0x263F1D340], a2, a1);
}

+ (id)mapButtonBackgroundColor
{
  char v5 = (dispatch_once_t *)&mapButtonBackgroundColor_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_19);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)mapButtonBackgroundColor__mapButtonBackgroundColor;

  return v2;
}

void __43__CPSEntityStyles_mapButtonBackgroundColor__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(MEMORY[0x263F1C550], "colorWithDynamicProvider:", &__block_literal_global_5, a1, a1);
  v2 = (void *)mapButtonBackgroundColor__mapButtonBackgroundColor;
  mapButtonBackgroundColor__mapButtonBackgroundColor = (uint64_t)v1;
}

id __43__CPSEntityStyles_mapButtonBackgroundColor__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([location[0] userInterfaceStyle] == 1) {
    id v5 = (id)[MEMORY[0x263F1C550] colorWithWhite:0.964705882 alpha:1.0];
  }
  else {
    id v5 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

+ (id)mapButtonDropShadow
{
  id v5 = (dispatch_once_t *)&mapButtonDropShadow_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_7_0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)mapButtonDropShadow__mapButtonDropShadow;

  return v2;
}

uint64_t __38__CPSEntityStyles_mapButtonDropShadow__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)mapButtonDropShadow__mapButtonDropShadow;
  mapButtonDropShadow__mapButtonDropShadow = v0;

  id v5 = (id)[MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.200000003];
  objc_msgSend((id)mapButtonDropShadow__mapButtonDropShadow, "setColor:");

  CGSizeMake_17();
  objc_msgSend((id)mapButtonDropShadow__mapButtonDropShadow, "setOffset:", v2, v3);
  [(id)mapButtonDropShadow__mapButtonDropShadow setRadius:4.0];
  return [(id)mapButtonDropShadow__mapButtonDropShadow setOpacity:1.0];
}

+ (id)mapAnnotationDropShadow
{
  return (id)objc_msgSend(a1, "mapButtonDropShadow", a2, a1);
}

@end