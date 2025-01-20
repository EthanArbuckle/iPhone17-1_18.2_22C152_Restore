@interface KSKeyboardSettingsBundleController
- (id)keyboardsValue:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)dealloc;
@end

@implementation KSKeyboardSettingsBundleController

- (id)keyboardsValue:(id)a3
{
  unint64_t v3 = +[KSKeyboardListController count];
  return (id)objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARD_COUNT", &stru_2703C6C20, @"Keyboard"), objc_msgSend(MEMORY[0x263F08A30], "localizedStringFromNumber:numberStyle:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v3), 1));
}

- (id)specifiersWithSpecifier:(id)a3
{
  if (!self->_specifier)
  {
    uint64_t v5 = *MEMORY[0x263F60138];
    if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60138]), "isEqualToString:", @"General"))
    {
      v6 = (void *)MEMORY[0x263F5FC40];
      uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Keyboard", &stru_2703C6C20, @"Keyboard");
      specifier = (PSSpecifier *)(id)[v6 preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
      self->_specifier = specifier;
      v9 = @"Keyboard";
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", v5), "isEqualToString:", @"Keyboard"))
      {
        v10 = (void *)MEMORY[0x263F5FC40];
        uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARDS", &stru_2703C6C20, @"Keyboard");
        specifier = (PSSpecifier *)(id)[v10 preferenceSpecifierNamed:v11 target:self set:0 get:sel_keyboardsValue_ detail:objc_opt_class() cell:2 edit:0];
        self->_specifier = specifier;
      }
      else
      {
        uint64_t v12 = *MEMORY[0x263F5FF00];
        uint64_t v13 = [a3 propertyForKey:*MEMORY[0x263F5FF00]];
        if (!objc_msgSend(+[KSKeyboardExtensionController keyboardsForBundleID:](KSKeyboardExtensionController, "keyboardsForBundleID:", v13), "count"))return (id)MEMORY[0x263EFFA68]; {
        v14 = (void *)MEMORY[0x263F5FC40];
        }
        uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARDS", &stru_2703C6C20, @"Keyboard");
        v16 = (PSSpecifier *)(id)[v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        self->_specifier = v16;
        [(PSSpecifier *)v16 setProperty:v13 forKey:v12];
        uint64_t v17 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"KeyboardSettings", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()));
        specifier = self->_specifier;
        if (v17)
        {
          [(PSSpecifier *)specifier setProperty:v17 forKey:*MEMORY[0x263F60140]];
          specifier = self->_specifier;
        }
      }
      v9 = @"KEYBOARDS";
    }
    [(PSSpecifier *)specifier setProperty:v9 forKey:v5];
  }
  v18 = (void *)MEMORY[0x263EFF8C0];
  v19 = self->_specifier;
  return (id)[v18 arrayWithObject:v19];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSKeyboardSettingsBundleController;
  [(KSKeyboardSettingsBundleController *)&v3 dealloc];
}

@end