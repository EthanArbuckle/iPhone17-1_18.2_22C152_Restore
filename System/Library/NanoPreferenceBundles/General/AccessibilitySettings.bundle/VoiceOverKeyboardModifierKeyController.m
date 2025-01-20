@interface VoiceOverKeyboardModifierKeyController
+ (id)modifierShortStringDescription:(int64_t)a3;
- (id)actionDetailControllerDelegate;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverKeyboardModifierKeyController

- (id)actionDetailControllerDelegate
{
  v2 = [(VoiceOverKeyboardModifierKeyController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"VoiceOverKeyboardModifierKeyDelegateKey"];

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"KEYBOARD_MODIFIER_KEY_FOOTER", @"VoiceOverSettings");
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = settingsLocString(@"KEYBOARD_MODIFIER_KEY_CONTROL_OPTIONS", @"VoiceOverSettings");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v11 = *MEMORY[0x263F60308];
    [v10 setProperty:&unk_26FB005B0 forKey:*MEMORY[0x263F60308]];
    [v5 addObject:v10];
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = settingsLocString(@"KEYBOARD_MODIFIER_KEY_CAPS_LOCK", @"VoiceOverSettings");
    v14 = [v12 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setProperty:&unk_26FB005C8 forKey:v11];
    [v5 addObject:v14];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  id v12 = [v6 specifier];
  v7 = [v12 propertyForKey:*MEMORY[0x263F60308]];
  uint64_t v8 = [v7 integerValue];

  v9 = [(VoiceOverKeyboardModifierKeyController *)self actionDetailControllerDelegate];
  v10 = [v9 selectedModifier];
  uint64_t v11 = [v10 integerValue];

  [v6 setChecked:(v11 & v8) != 0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)VoiceOverKeyboardModifierKeyController;
  id v6 = a4;
  id v7 = a3;
  [(VoiceOverKeyboardModifierKeyController *)&v19 tableView:v7 didSelectRowAtIndexPath:v6];
  uint64_t v8 = objc_msgSend(v7, "cellForRowAtIndexPath:", v6, v19.receiver, v19.super_class);

  v9 = [v8 specifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 isChecked];
    uint64_t v11 = [(VoiceOverKeyboardModifierKeyController *)self actionDetailControllerDelegate];
    id v12 = [v11 selectedModifier];
    uint64_t v13 = [v12 integerValue];

    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    uint64_t v15 = [v14 integerValue];

    if (v10) {
      uint64_t v16 = v13 & ~v15;
    }
    else {
      uint64_t v16 = v15 | v13;
    }
    if (v16)
    {
      [v8 setChecked:v10 ^ 1u];
      v17 = [(VoiceOverKeyboardModifierKeyController *)self actionDetailControllerDelegate];
      v18 = [NSNumber numberWithInteger:v16];
      [v17 setModifier:v18];
    }
  }
}

+ (id)modifierShortStringDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(off_2651F23F8[a3 - 1], @"VoiceOverSettings");
  }
  return v4;
}

@end