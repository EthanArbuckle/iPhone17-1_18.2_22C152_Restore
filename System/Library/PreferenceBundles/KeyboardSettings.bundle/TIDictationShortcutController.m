@interface TIDictationShortcutController
+ (id)attributedTitleForDictationShortcutValue:(int64_t)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePreferenceForParent;
@end

@implementation TIDictationShortcutController

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_SHORTCUT_EXPLANATION", &stru_26E29DC78, @"Dictation"));
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    [v3 addObject:v5];
    v6 = (void *)[(TIDictationShortcutController *)self specifier];
    [v6 setProperty:&unk_26E2A70C0 forKey:*MEMORY[0x263F60068]];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController"), "valueForPreferenceKey:", @"HWKeyboardDictationShortcut");
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = (void *)[(TIDictationShortcutController *)self specifier];
      uint64_t v10 = *MEMORY[0x263F60308];
      [v9 setProperty:v8 forKey:*MEMORY[0x263F60308]];
    }
    else
    {
      uint64_t v10 = *MEMORY[0x263F60308];
    }
    v11 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Control"), self, 0, 0, 0, 3, 0);
    uint64_t v12 = *MEMORY[0x263F602D0];
    [v11 setProperty:@"control" forKey:*MEMORY[0x263F602D0]];
    [v11 setProperty:&unk_26E2A70C0 forKey:v10];
    [v3 addObject:v11];
    v13 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Command", &stru_26E29DC78, @"Keyboard"), self, 0, 0, 0, 3, 0);
    [v13 setProperty:@"command" forKey:v12];
    [v13 setProperty:&unk_26E2A70D8 forKey:v10];
    [v3 addObject:v13];
    v14 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"NO_SHORTCUT", &stru_26E29DC78, @"Keyboard"), self, 0, 0, 0, 3, 0);
    [v14 setProperty:@"noshortcut" forKey:v12];
    [v14 setProperty:&unk_26E2A70F0 forKey:v10];
    [v3 addObject:v14];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v3;
  }
  return v3;
}

+ (id)attributedTitleForDictationShortcutValue:(int64_t)a3
{
  id v3 = @"noshortcut";
  v4 = @"NO_SHORTCUT";
  if (a3 == 1)
  {
    v4 = @"Command";
    id v3 = @"command";
  }
  if (a3) {
    v5 = v4;
  }
  else {
    v5 = @"Control";
  }
  if (a3) {
    v6 = v3;
  }
  else {
    v6 = @"control";
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v5, &stru_26E29DC78, @"Keyboard");

  return +[TIKeyboardListController attributedTitleForSymbolName:v6 cellTitle:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)TIDictationShortcutController;
  id v6 = -[TIDictationShortcutController tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = (void *)[(TIDictationShortcutController *)self specifierAtIndexPath:a4];
  uint64_t v8 = [v7 propertyForKey:*MEMORY[0x263F602D0]];
  if (v8) {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setAttributedText:", +[TIKeyboardListController attributedTitleForSymbolName:cellTitle:](TIKeyboardListController, "attributedTitleForSymbolName:cellTitle:", v8, objc_msgSend(v7, "name")));
  }
  else {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setText:", objc_msgSend(v7, "name"));
  }
  v9 = (void *)[(TIDictationShortcutController *)self specifier];
  uint64_t v10 = *MEMORY[0x263F60308];
  uint64_t v11 = [v9 propertyForKey:*MEMORY[0x263F60308]];
  if (!v11)
  {
    uint64_t v12 = (void *)[(TIDictationShortcutController *)self specifier];
    uint64_t v11 = [v12 propertyForKey:*MEMORY[0x263F60068]];
  }
  objc_msgSend(v6, "setChecked:", objc_msgSend((id)objc_msgSend(v7, "propertyForKey:", v10), "isEqualToNumber:", v11));
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7 = (void *)[(TIDictationShortcutController *)self specifierAtIndexPath:a4];
  uint64_t v8 = *MEMORY[0x263F60308];
  uint64_t v9 = [v7 propertyForKey:*MEMORY[0x263F60308]];
  objc_msgSend((id)-[TIDictationShortcutController specifier](self, "specifier"), "setProperty:forKey:", v9, v8);
  [(TIDictationShortcutController *)self setPreferenceValue:v9 specifier:[(TIDictationShortcutController *)self specifier]];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController"), "setValue:forPreferenceKey:", v9, @"HWKeyboardDictationShortcut");
  [(TIDictationShortcutController *)self reloadSpecifiers];
  [(TIDictationShortcutController *)self updatePreferenceForParent];

  [a3 deselectRowAtIndexPath:a4 animated:1];
}

- (void)updatePreferenceForParent
{
  uint64_t v2 = (void *)[(TIDictationShortcutController *)self parentController];
  if (objc_opt_respondsToSelector())
  {
    [v2 setNeedsReloadSpecifiers:1];
  }
}

@end