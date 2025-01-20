@interface ASTLockScreenSuggestionsGlobalController
- (ASTLockScreenSuggestionsGlobalController)initWithOnChangeCallback:(id)a3;
- (id)isLockScreenSuggestionEnabled:(id)a3;
- (id)specifier;
- (void)setLockScreenSuggestionsEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation ASTLockScreenSuggestionsGlobalController

- (ASTLockScreenSuggestionsGlobalController)initWithOnChangeCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASTLockScreenSuggestionsGlobalController;
  v5 = [(ASTLockScreenSuggestionsGlobalController *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id onChangeCallback = v5->_onChangeCallback;
    v5->_id onChangeCallback = v6;
  }
  return v5;
}

- (id)specifier
{
  specifier = self->_specifier;
  if (!specifier)
  {
    id v4 = (void *)MEMORY[0x263F5FC40];
    v5 = +[AssistantController bundle];
    v6 = [v5 localizedStringForKey:@"SUGGESTIONS_ALLOW_NOTIFICATIONS" value:&stru_26D2AB140 table:@"AssistantSettings"];
    v7 = [v4 preferenceSpecifierNamed:v6 target:self set:sel_setLockScreenSuggestionsEnabled_forSpecifier_ get:sel_isLockScreenSuggestionEnabled_ detail:0 cell:6 edit:0];
    v8 = self->_specifier;
    self->_specifier = v7;

    uint64_t v9 = MEMORY[0x263EFFA88];
    [(PSSpecifier *)self->_specifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    [(PSSpecifier *)self->_specifier setProperty:v9 forKey:*MEMORY[0x263F5FEF8]];
    specifier = self->_specifier;
  }
  v10 = specifier;

  return v10;
}

- (id)isLockScreenSuggestionEnabled:(id)a3
{
  v3 = NSNumber;
  id v4 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue] ^ 1;
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void)setLockScreenSuggestionsEnabled:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.lockscreen.shared"];
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v7, "BOOLValue") ^ 1, @"LockScreenSuggestionsDisabled");

  id onChangeCallback = (void (**)(id, uint64_t))self->_onChangeCallback;
  if (onChangeCallback) {
    onChangeCallback[2](onChangeCallback, [v7 BOOLValue]);
  }
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", @"Lockscreen", [v7 BOOLValue]);
  notify_post("com.apple.duetexpertd.prefschanged");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onChangeCallback, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

@end