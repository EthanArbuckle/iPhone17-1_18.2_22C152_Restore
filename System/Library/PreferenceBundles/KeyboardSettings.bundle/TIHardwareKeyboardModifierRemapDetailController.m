@interface TIHardwareKeyboardModifierRemapDetailController
- (id)newSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation TIHardwareKeyboardModifierRemapDetailController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(TIHardwareKeyboardModifierRemapDetailController *)self newSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)newSpecifiers
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = [(TIHardwareKeyboardModifierRemapDetailController *)self parentController];
  v4 = (__IOHIDServiceClient *)[v3 currentKeyboard];

  v5 = self;
  v6 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifier];
  uint64_t v7 = *MEMORY[0x263F60138];
  v8 = [v6 propertyForKey:*MEMORY[0x263F60138]];

  int v9 = [v8 isEqualToString:@"Function"];
  char v10 = v9;
  if (v9) {
    int v11 = showGlobeKeyInsteadOfFunctionKey(v4);
  }
  else {
    int v11 = 0;
  }
  v30 = v8;
  v29 = attributedTitleForKey(v8, v4, @" key", 0);
  uint64_t v12 = [v29 string];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"CHOOSE_KEY_ACTION" value:&stru_26E29DC78 table:@"Keyboard"];

  v28 = (void *)v12;
  uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"%@" withString:v12];

  v27 = (void *)v15;
  v16 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v15];
  [v16 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  v26 = v16;
  [v31 addObject:v16];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = (id)_dstKeys;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(id *)(*((void *)&v32 + 1) + 8 * v21);
        v23 = v22;
        if (((v10 & 1) != 0 || ([v22 isEqualToString:@"Function"] & 1) == 0)
          && (!v11 || ([v23 isEqualToString:@"Globe"] & 1) == 0))
        {
          v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v5 set:0 get:0 detail:0 cell:3 edit:0];
          [v24 setProperty:v23 forKey:v7];
          [v31 addObject:v24];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v19);
  }

  return v31;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v48.receiver = self;
  v48.super_class = (Class)TIHardwareKeyboardModifierRemapDetailController;
  id v7 = a3;
  v8 = [(TIHardwareKeyboardModifierRemapDetailController *)&v48 tableView:v7 cellForRowAtIndexPath:v6];
  int v9 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifierAtIndexPath:v6];
  uint64_t v10 = *MEMORY[0x263F60138];
  v47 = v9;
  int v11 = [v9 propertyForKey:*MEMORY[0x263F60138]];
  uint64_t v12 = [(TIHardwareKeyboardModifierRemapDetailController *)self parentController];
  uint64_t v13 = attributedTitleForKey(v11, (__IOHIDServiceClient *)[v12 currentKeyboard], 0, 1);

  v14 = [v8 titleLabel];
  v46 = (void *)v13;
  [v14 setAttributedText:v13];

  uint64_t v15 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifier];
  v16 = [v15 propertyForKey:v10];

  id v17 = [(TIHardwareKeyboardModifierRemapDetailController *)self parentController];
  uint64_t v18 = [v17 valueForRemappingKey:v16];

  objc_msgSend(v8, "setChecked:", objc_msgSend(v11, "isEqualToString:", v18));
  uint64_t v19 = [v7 window];
  uint64_t v20 = [v19 screen];
  [v20 scale];
  double v22 = v21;

  if (v22 <= 1.0) {
    double v23 = 1.0;
  }
  else {
    double v23 = 1.0 / v22;
  }
  v24 = [MEMORY[0x263F1C550] clearColor];
  [v7 setSeparatorColor:v24];

  v25 = [v8 viewWithTag:10086];
  [v8 bounds];
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  if (!v25)
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v26, v27, v28, v29);
    [v25 setTag:10086];
    [v25 setAutoresizingMask:10];
    long long v34 = [MEMORY[0x263F1C550] separatorColor];
    [v25 setBackgroundColor:v34];

    [v8 addSubview:v25];
  }
  uint64_t v35 = [v6 row];
  v36 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifiers];
  uint64_t v37 = [v36 count] - 3;

  if (v35 == v37)
  {
    double v23 = v23 * 3.0;
    double v31 = v33 - v23;
  }
  else
  {
    unint64_t v38 = [v6 row];
    v39 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifiers];
    unint64_t v40 = [v39 count] - 2;

    if (v38 >= v40)
    {
      [v25 removeFromSuperview];
      double v23 = v33;
    }
    else
    {
      [v8 separatorInset];
      double v30 = v30 + v41;
      double v32 = v32 - (v41 + v42);
      double v31 = v33 - (v43 + v44) - v23;
    }
  }
  objc_msgSend(v25, "setFrame:", v30, v31, v32, v23);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifierAtIndexPath:v6];
  v8 = [(TIHardwareKeyboardModifierRemapDetailController *)self specifier];
  uint64_t v9 = *MEMORY[0x263F60138];
  uint64_t v10 = [v8 propertyForKey:*MEMORY[0x263F60138]];

  int v11 = [v13 propertyForKey:v9];
  uint64_t v12 = [(TIHardwareKeyboardModifierRemapDetailController *)self parentController];
  [v12 setRemappingFromKey:v10 toValue:v11];

  [(TIHardwareKeyboardModifierRemapDetailController *)self reloadSpecifiers];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

@end