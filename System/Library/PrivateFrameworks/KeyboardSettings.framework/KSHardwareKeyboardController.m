@interface KSHardwareKeyboardController
+ (id)IOHIDKeyboardLanguageToCapsLockKeyLabel;
- (BOOL)defaultValueForGlobeAsEmojiKey;
- (BOOL)isTrackingBrightnessSlider;
- (BOOL)shouldShowGlobeKeyPreference;
- (KSHardwareKeyboardController)init;
- (id)capsLockSwitchSpecifiersFromModes:(id)a3;
- (id)getBrightness:(id)a3;
- (id)getCurrentKeyboardType;
- (id)globeAsEmojiSpecifiers;
- (id)globeKeyPreference:(id)a3;
- (id)keyboardBrightnessSpecifiers;
- (id)keyboardTypeRemapSpecifiers;
- (id)modifierRemapSpecifiers;
- (id)newSpecifiers;
- (id)readPreferenceControllerValue:(id)a3;
- (id)readRomanCapsLockPreferenceValue:(id)a3;
- (id)separateHWKeyboardSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)appWillEnterForeground:(id)a3;
- (void)appWillResignActive:(id)a3;
- (void)dealloc;
- (void)hardwareKeyboardAvailabilityChanged;
- (void)setBrightness:(id)a3 specifier:(id)a4;
- (void)setPreferenceControllerValue:(id)a3 forSpecifier:(id)a4;
- (void)setRomanCapsLockPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)suspendIdleDimming:(BOOL)a3;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)toggledGlobeKey:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation KSHardwareKeyboardController

+ (id)IOHIDKeyboardLanguageToCapsLockKeyLabel
{
  if (IOHIDKeyboardLanguageToCapsLockKeyLabel___onceToken != -1) {
    dispatch_once(&IOHIDKeyboardLanguageToCapsLockKeyLabel___onceToken, &__block_literal_global_1);
  }
  return (id)IOHIDKeyboardLanguageToCapsLockKeyLabel___map;
}

id __71__KSHardwareKeyboardController_IOHIDKeyboardLanguageToCapsLockKeyLabel__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v1[0] = @"Simplified Chinese Keyboard";
  v1[1] = @"2SetHangul";
  v2[0] = @"中 / 英";
  v2[1] = @"한 / A";
  v1[2] = @"Zhuyin Bopomofo";
  v1[3] = @"Thai";
  v2[2] = @"中 / 英";
  v2[3] = @"ก / A";
  id result = (id)[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:4];
  IOHIDKeyboardLanguageToCapsLockKeyLabel___map = (uint64_t)result;
  return result;
}

- (KSHardwareKeyboardController)init
{
  v10.receiver = self;
  v10.super_class = (Class)KSHardwareKeyboardController;
  v2 = [(KSHardwareKeyboardController *)&v10 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged_0, (CFStringRef)[NSString stringWithUTF8String:*MEMORY[0x263F41D48]], 0, (CFNotificationSuspensionBehavior)0);
    v4 = (KeyboardBrightnessClient *)objc_alloc_init(MEMORY[0x263F34258]);
    v2->_keyboardBrightnessClient = v4;
    uint64_t v5 = *MEMORY[0x263F34260];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__KSHardwareKeyboardController_init__block_invoke;
    v9[3] = &unk_2653A9418;
    v9[4] = v2;
    [(KeyboardBrightnessClient *)v4 registerNotificationForKeys:&unk_2703CE4B0 keyboardID:v5 block:v9];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_appWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_appWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v2;
}

void __36__KSHardwareKeyboardController_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__KSHardwareKeyboardController_init__block_invoke_2;
  v4[3] = &unk_2653A93F0;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = a3;
  v4[5] = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __36__KSHardwareKeyboardController_init__block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) isTrackingBrightnessSlider];
    if ((result & 1) == 0)
    {
      uint64_t v3 = (void *)[*(id *)(a1 + 40) specifierForID:@"Keyboard Brightness"];
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1384), "isBacklightSaturatedOnKeyboard:", *MEMORY[0x263F34260]) ^ 1);
      [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F600A8]];
      [*(id *)(a1 + 40) reloadSpecifier:v3];
      uint64_t v5 = (void *)[v3 propertyForKey:*MEMORY[0x263F602B0]];
      uint64_t v6 = *(void *)(a1 + 32);
      return [v5 setValue:v6];
    }
  }
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)[NSString stringWithUTF8String:*MEMORY[0x263F41D48]], 0);
  uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];
  uint64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];
  [(KeyboardBrightnessClient *)self->_keyboardBrightnessClient unregisterKeyboardNotificationBlock];

  v6.receiver = self;
  v6.super_class = (Class)KSHardwareKeyboardController;
  [(KSHardwareKeyboardController *)&v6 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    uint64_t v5 = [(KSHardwareKeyboardController *)self title];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)[(KSHardwareKeyboardController *)self newSpecifiers];
    [(KSHardwareKeyboardController *)self setTitle:v5];
    return *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return result;
}

- (id)newSpecifiers
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v4 = self;
  v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = (void *)[MEMORY[0x263EFF9C0] set];
  objc_super v6 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
  v33 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    uint64_t v31 = *MEMORY[0x263F60138];
    uint64_t v10 = *MEMORY[0x263F5FFE0];
    uint64_t v11 = *MEMORY[0x263F7E7A0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v3);
        }
        if ([v6 identifierIsValidSystemInputMode:*(void *)(*((void *)&v43 + 1) + 8 * i)])
        {
          uint64_t NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
          if (![v5 member:NormalizedIdentifier])
          {
            [v5 addObject:NormalizedIdentifier];
            if ([(id)UIKeyboardGetSupportedHardwareKeyboardsForInputMode() count])
            {
              v14 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v4 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
              [v14 setProperty:NormalizedIdentifier forKey:v31];
              [v14 setProperty:objc_opt_class() forKey:v10];
              v15 = v14;
              uint64_t v5 = v33;
              [v34 addObject:v15];
            }
            if (objc_msgSend((id)objc_msgSend((id)TIGetInputModeProperties(), "objectForKeyedSubscript:", v11), "BOOLValue"))objc_msgSend(v30, "addObject:", NormalizedIdentifier); {
          }
            }
        }
      }
      uint64_t v8 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v8);
  }
  v16 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"HWKeyboardSettings"];
  objc_msgSend(v16, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PERIOD_SHORTCUT_DESCRIPTION_HWKB", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F600F8]);
  [v34 addObject:v16];
  v32 = v4;
  id v17 = [(KSHardwareKeyboardController *)v4 separateHWKeyboardSpecifiers];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "name"), &stru_2703C6C20, @"Keyboard"));
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v19);
  }
  v22 = v34;
  [v34 addObjectsFromArray:v17];
  if ([v30 count])
  {
    v23 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"LIVE_CONVERSION"];
    objc_msgSend(v23, "setName:", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v30, 0, 0));
    [v34 addObject:v23];
    v24 = (void *)[(KSHardwareKeyboardController *)v32 loadSpecifiersFromPlistName:@"Preferences_HWLiveConversion" target:v32];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "name"), &stru_2703C6C20, @"Keyboard"));
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v26);
    }
    v22 = v34;
    [v34 addObjectsFromArray:v24];
  }
  if ([(KSHardwareKeyboardController *)v32 shouldShowGlobeKeyPreference]) {
    objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController globeAsEmojiSpecifiers](v32, "globeAsEmojiSpecifiers"));
  }
  objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController capsLockSwitchSpecifiersFromModes:](v32, "capsLockSwitchSpecifiersFromModes:", v33));
  objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController keyboardBrightnessSpecifiers](v32, "keyboardBrightnessSpecifiers"));
  objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController modifierRemapSpecifiers](v32, "modifierRemapSpecifiers"));
  if ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"KeyboardTypeCustomization", @"com.apple.keyboard.preferences", 0))
  {
    objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController keyboardTypeRemapSpecifiers](v32, "keyboardTypeRemapSpecifiers"));
  }
  return v22;
}

- (id)capsLockSwitchSpecifiersFromModes:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(a3);
        }
        v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable())
        {
          ++v9;
          uint64_t v10 = v13;
        }
        else
        {
          v8 += UIKeyboardLayoutSupportsASCIIToggleKey();
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
    if (v9 && v8)
    {
      HardwareKeyboardLanguage = (void *)BKSHIDServicesGetHardwareKeyboardLanguage();
      char HasLanguageSwitchLabel = BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel();
      if ([HardwareKeyboardLanguage length]
        && ((HasLanguageSwitchLabel & 1) != 0
         || [HardwareKeyboardLanguage isEqualToString:@"Simplified Chinese Keyboard"]))
      {
        v16 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "IOHIDKeyboardLanguageToCapsLockKeyLabel"), "objectForKey:", HardwareKeyboardLanguage);
      }
      else
      {
        v16 = 0;
      }
      id v17 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"HWKeyboardCapsLockSwitch"];
      if (v9 >= 2) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = v9;
      }
      uint64_t v19 = [v16 length];
      uint64_t v20 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v19)
      {
        uint64_t v21 = [v20 localizedStringForKey:@"LANGUAGE_SWITCH_LATIN_TITLE" value:&stru_2703C6C20 table:@"Keyboard"];
        uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", v21, v16);
        uint64_t v23 = [(id)objc_msgSend(MEMORY[0x263F086E0] bundleForClass:objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(NSString, "stringWithFormat:", @"LANGUAGE_SWITCH_LATIN_DESCRIPTION_%lu", v18), &stru_2703C6C20, @"Keyboard"];
        if (v18 == 1)
        {
          if ([0 hasPrefix:@"%2$@"]) {
            uint64_t v24 = 4;
          }
          else {
            uint64_t v24 = 5;
          }
          uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", v23, v16, TUIKeyboardDisplayNameFromIdentifierForContext(v10, v24));
        }
        else
        {
          uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", v23, v16, v34);
        }
        uint64_t v26 = v25;
      }
      else
      {
        uint64_t v22 = [v20 localizedStringForKey:@"CAPS_LOCK_LATIN_TITLE" value:&stru_2703C6C20 table:@"Keyboard"];
        uint64_t v26 = [(id)objc_msgSend(MEMORY[0x263F086E0] bundleForClass:objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(NSString, "stringWithFormat:", @"CAPS_LOCK_LATIN_DESCRIPTION_%lu", v18), &stru_2703C6C20, @"Keyboard"];
        if (v18 == 1)
        {
          if ([0 hasPrefix:@"%@"]) {
            uint64_t v27 = 4;
          }
          else {
            uint64_t v27 = 5;
          }
          uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", v26, TUIKeyboardDisplayNameFromIdentifierForContext(v10, v27));
        }
      }
      [v17 setProperty:v26 forKey:*MEMORY[0x263F600F8]];
      [v5 addObject:v17];
      v28 = (void *)[(KSHardwareKeyboardController *)self loadSpecifiersFromPlistName:@"Preferences_HWCapsLock" target:self];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v36 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * j) setName:v22];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v30);
      }
      [v5 addObjectsFromArray:v28];
    }
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)KSHardwareKeyboardController;
  [(KSHardwareKeyboardController *)&v16 viewWillAppear:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(KSHardwareKeyboardController *)self specifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = *MEMORY[0x263F602B0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v10, "identifier"), "hasPrefix:", @"HWKeyboard") & 1) == 0)
        {
          uint64_t v11 = (void *)[v10 propertyForKey:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 updateLabels];
          }
        }
        if (objc_msgSend((id)objc_msgSend(v10, "identifier"), "isEqualToString:", @"Keyboard Type.0"))-[KSHardwareKeyboardController reloadSpecifier:](self, "reloadSpecifier:", v10); {
      }
        }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
  [(KSHardwareKeyboardController *)self suspendIdleDimming:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSHardwareKeyboardController;
  [(KSHardwareKeyboardController *)&v4 viewWillDisappear:a3];
  [(KSHardwareKeyboardController *)self suspendIdleDimming:0];
}

- (void)appWillEnterForeground:(id)a3
{
  [(KSHardwareKeyboardController *)self reloadSpecifiers];
  [(KSHardwareKeyboardController *)self suspendIdleDimming:1];
}

- (void)appWillResignActive:(id)a3
{
}

- (void)suspendIdleDimming:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    keyboardBrightnessClient = self->_keyboardBrightnessClient;
    uint64_t v6 = *MEMORY[0x263F34260];
    [(KeyboardBrightnessClient *)keyboardBrightnessClient suspendIdleDimming:v3 forKeyboard:v6];
  }
}

- (id)separateHWKeyboardSpecifiers
{
  return (id)[(KSHardwareKeyboardController *)self loadSpecifiersFromPlistName:@"Preferences_HWKeyboard" target:self];
}

- (id)readPreferenceControllerValue:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:*MEMORY[0x263F60170]];
  objc_super v4 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  return (id)[v4 valueForPreferenceKey:v3];
}

- (void)setPreferenceControllerValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a4 propertyForKey:*MEMORY[0x263F60170]];
  uint64_t v6 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v6 setValue:a3 forPreferenceKey:v5];
}

- (id)readRomanCapsLockPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"HWKeyboardCapsLockRomanSwitch") & 1) == 0)-[KSHardwareKeyboardController readRomanCapsLockPreferenceValue:](); {
  uint64_t v3 = NSNumber;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C738], "sharedInstance"), "isCapsLockSwitchEnabled");
  return (id)[v3 numberWithBool:v4];
}

- (void)setRomanCapsLockPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"HWKeyboardCapsLockRomanSwitch") & 1) == 0)-[KSHardwareKeyboardController setRomanCapsLockPreferenceValue:forSpecifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v6 = *MEMORY[0x263F7E748];
  [v5 setValue:a3 forPreferenceKey:v6];
}

- (id)keyboardBrightnessSpecifiers
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (objc_msgSend((id)-[KeyboardBrightnessClient copyKeyboardBacklightIDs](self->_keyboardBrightnessClient, "copyKeyboardBacklightIDs"), "count"))
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", @"Keyboard Brightness Group", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Keyboard Brightness", &stru_2703C6C20, @"Keyboard"));
    objc_msgSend(v4, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARD_BRIGHTNESS_DESCRIPTION", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F600F8]);
    [v3 addObject:v4];
    uint64_t v5 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Keyboard Brightness", &stru_2703C6C20, @"Keyboard"), self, sel_setBrightness_specifier_, sel_getBrightness_, 0, 5, 0);
    [v5 setObject:@"Keyboard Brightness" forKeyedSubscript:*MEMORY[0x263F60138]];
    uint64_t v6 = (void *)[MEMORY[0x263F1C6B0] systemImageNamed:@"light.min"];
    uint64_t v7 = objc_msgSend(v6, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x263F1C550], "secondaryLabelColor"), 1);
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60240]];
    uint64_t v8 = (void *)[MEMORY[0x263F1C6B0] systemImageNamed:@"light.max"];
    uint64_t v9 = objc_msgSend(v8, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x263F1C550], "secondaryLabelColor"), 1);
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F60250]];
    [v5 setObject:&unk_2703CE9C0 forKeyedSubscript:*MEMORY[0x263F60038]];
    [v5 setObject:&unk_2703CE9D0 forKeyedSubscript:*MEMORY[0x263F60030]];
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60230]];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[KeyboardBrightnessClient isBacklightSaturatedOnKeyboard:](self->_keyboardBrightnessClient, "isBacklightSaturatedOnKeyboard:", *MEMORY[0x263F34260]) ^ 1);
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F600A8]];
    [v3 addObject:v5];
  }
  return v3;
}

- (void)setBrightness:(id)a3 specifier:(id)a4
{
  BOOL v6 = [(KSHardwareKeyboardController *)self isTrackingBrightnessSlider];
  char v7 = objc_opt_respondsToSelector();
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  [a3 floatValue];
  if (v7)
  {
    uint64_t v9 = *MEMORY[0x263F34260];
    -[KeyboardBrightnessClient setBrightness:fadeSpeed:commit:forKeyboard:](keyboardBrightnessClient, "setBrightness:fadeSpeed:commit:forKeyboard:", 0, !v6, v9);
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F34260];
    -[KeyboardBrightnessClient setBrightness:forKeyboard:](keyboardBrightnessClient, "setBrightness:forKeyboard:", v10);
  }
}

- (id)getBrightness:(id)a3
{
  [(KeyboardBrightnessClient *)self->_keyboardBrightnessClient brightnessForKeyboard:*MEMORY[0x263F34260]];
  *(float *)&double v3 = fminf(*(float *)&v3, 1.0);
  if (*(float *)&v3 < 0.0) {
    *(float *)&double v3 = 0.0;
  }
  uint64_t v4 = NSNumber;
  return (id)[v4 numberWithFloat:v3];
}

- (BOOL)isTrackingBrightnessSlider
{
  v2 = (void *)[(KSHardwareKeyboardController *)self specifierForID:@"Keyboard Brightness"];
  double v3 = objc_msgSend((id)objc_msgSend(v2, "propertyForKey:", *MEMORY[0x263F602B0]), "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v3 isTracking];
}

- (id)globeAsEmojiSpecifiers
{
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v4 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"Globe as Emoji group"];
  [v3 addObject:v4];
  uint64_t v5 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"GLOBE_AS_EMOJI_KEY", &stru_2703C6C20, @"Keyboard", @"<globe>", self, sel_toggledGlobeKey_specifier_, sel_globeKeyPreference_, 0, 6, 0 target set get detail cell edit];
  [v5 setProperty:*MEMORY[0x263F7E750] forKey:*MEMORY[0x263F60138]];
  [v4 setProperty:objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"GLOBE_AS_EMOJI_KEY_FOOTER", &stru_2703C6C20, @"Keyboard", @"<globe>", *MEMORY[0x263F600F8] forKey];
  [v3 addObject:v5];
  return v3;
}

- (id)globeKeyPreference:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController", a3);
  uint64_t v5 = (void *)[v4 valueForPreferenceKey:*MEMORY[0x263F7E750]];
  if (v5) {
    uint64_t v6 = [v5 BOOLValue];
  }
  else {
    uint64_t v6 = [(KSHardwareKeyboardController *)self defaultValueForGlobeAsEmojiKey];
  }
  uint64_t v7 = v6;
  uint64_t v8 = NSNumber;
  return (id)[v8 numberWithBool:v7];
}

- (void)toggledGlobeKey:(id)a3 specifier:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController", a3, a4);
  uint64_t v6 = *MEMORY[0x263F7E750];
  [v5 setValue:a3 forPreferenceKey:v6];
}

- (BOOL)defaultValueForGlobeAsEmojiKey
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "defaultGlobeAsEmojiKeySetting") != 0;
}

- (BOOL)shouldShowGlobeKeyPreference
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
    || (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers"), "count") < 3)
  {
    return 0;
  }
  v2 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];
  return [v2 containsEmojiInputMode];
}

- (id)modifierRemapSpecifiers
{
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:", @"Modifier Keys"));
  uint64_t v4 = (void *)MEMORY[0x263F5FC40];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MODIFIER_KEYS", &stru_2703C6C20, @"Keyboard");
  objc_msgSend(v3, "addObject:", objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, objc_opt_class(), 2, 0));
  return v3;
}

- (id)keyboardTypeRemapSpecifiers
{
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v4 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"Keyboard Type"];
  [v3 addObject:v4];
  uint64_t v5 = (void *)MEMORY[0x263F5FC40];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Keyboard Type", &stru_2703C6C20, @"Keyboard");
  uint64_t v7 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:sel_getCurrentKeyboardType detail:objc_opt_class() cell:2 edit:0];
  objc_msgSend(v4, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARD_TYPE_FOOTER_TEXT", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F600F8]);
  [v3 addObject:v7];
  return v3;
}

- (id)getCurrentKeyboardType
{
  DeviceProperties = (void *)BKSHIDKeyboardGetDeviceProperties();
  switch([DeviceProperties standardType])
  {
    case 0xFFFFFFFF:
      if ([DeviceProperties countryCode] != 15) {
        goto LABEL_4;
      }
      goto LABEL_3;
    case 0u:
LABEL_4:
      id result = @"ANSI";
      break;
    case 1u:
      id result = @"ISO";
      break;
    case 2u:
LABEL_3:
      id result = @"JIS";
      break;
    default:
      id result = &stru_2703C6C20;
      break;
  }
  return result;
}

- (void)hardwareKeyboardAvailabilityChanged
{
  if (GSEventIsHardwareKeyboardAttached())
  {
    if (![(KSHardwareKeyboardController *)self specifierForID:@"Keyboard Brightness Group"]) {
      [(KSHardwareKeyboardController *)self addSpecifiersFromArray:[(KSHardwareKeyboardController *)self keyboardBrightnessSpecifiers] animated:1];
    }
    if (![(KSHardwareKeyboardController *)self specifierForID:@"Modifier Keys"]) {
      [(KSHardwareKeyboardController *)self addSpecifiersFromArray:[(KSHardwareKeyboardController *)self modifierRemapSpecifiers] animated:1];
    }
    if (![(KSHardwareKeyboardController *)self specifierForID:@"Keyboard Type"]
      && ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"KeyboardTypeCustomization", @"com.apple.keyboard.preferences", 0)))
    {
      id v3 = [(KSHardwareKeyboardController *)self keyboardTypeRemapSpecifiers];
      [(KSHardwareKeyboardController *)self addSpecifiersFromArray:v3 animated:1];
    }
  }
  else
  {
    [(KSHardwareKeyboardController *)self removeSpecifierID:@"Keyboard Brightness Group" animated:1];
    [(KSHardwareKeyboardController *)self removeSpecifierID:@"Modifier Keys" animated:1];
    [(KSHardwareKeyboardController *)self removeSpecifierID:@"Keyboard Type" animated:1];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)KSHardwareKeyboardController;
  id v6 = -[KSHardwareKeyboardController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = (void *)[(KSHardwareKeyboardController *)self specifierAtIndexPath:a4];
  uint64_t v8 = (void *)[v7 propertyForKey:*MEMORY[0x263F60138]];
  if ([v8 isEqualToString:*MEMORY[0x263F7E750]])
  {
    uint64_t v9 = (void *)[v7 name];
    uint64_t v10 = [v9 rangeOfString:@"<globe>"];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      long long v14 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
      objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v12, v13, +[KSKeyboardListController attributedStringForSymbolName:](KSKeyboardListController, "attributedStringForSymbolName:", @"globe"));
      objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setAttributedText:", v14);
    }
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v6 = objc_msgSend((id)objc_msgSend(a4, "textLabel", a3), "text");
  uint64_t v7 = [v6 rangeOfString:@"<globe>"];
  if (v6)
  {
    uint64_t v9 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v8;
      id v11 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
      objc_msgSend(v11, "replaceCharactersInRange:withAttributedString:", v9, v10, +[KSKeyboardListController attributedStringForSymbolName:](KSKeyboardListController, "attributedStringForSymbolName:", @"globe"));
      objc_msgSend((id)objc_msgSend(a4, "textLabel"), "setAttributedText:", v11);
    }
  }
}

- (void)readRomanCapsLockPreferenceValue:.cold.1()
{
}

- (void)setRomanCapsLockPreferenceValue:forSpecifier:.cold.1()
{
}

@end