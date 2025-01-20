@interface LiveSpeechAddFavoritePhraseController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)phraseShortcutTextField;
- (UITextField)phraseTextTextField;
- (id)_dummyTextValue;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_saveButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation LiveSpeechAddFavoritePhraseController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)LiveSpeechAddFavoritePhraseController;
  [(AXUISettingsSetupCapableListController *)&v8 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:self action:sel__saveButtonTapped_];
  v4 = [(LiveSpeechAddFavoritePhraseController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(LiveSpeechAddFavoritePhraseController *)self navigationItem];
  v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:0];

  v7 = settingsLocString(@"LIVE_SPEECH_ADD_FAVORITE_PHRASE", @"AccessibilitySettings");
  [(LiveSpeechAddFavoritePhraseController *)self setTitle:v7];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FavoritesGroup"];
    v7 = settingsLocString(@"LIVE_SPEECH_ADD_FAVORITE_PHRASE_FOOTER", @"AccessibilitySettings");
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    objc_super v8 = (void *)MEMORY[0x263F5FC40];
    v9 = settingsLocString(@"LIVE_SPEECH_PHRASE", @"AccessibilitySettings");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel__setDummyTextValue_ get:sel__dummyTextValue detail:0 cell:8 edit:0];

    v11 = [MEMORY[0x263F522E0] phraseTextKey];
    uint64_t v12 = *MEMORY[0x263F60138];
    [v10 setProperty:v11 forKey:*MEMORY[0x263F60138]];

    [v10 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v5 addObject:v10];
    v13 = (void *)MEMORY[0x263F5FC40];
    v14 = settingsLocString(@"LIVE_SPEECH_SHORTCUT", @"AccessibilitySettings");
    v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel__setDummyTextValue_ get:sel__dummyTextValue detail:0 cell:8 edit:0];

    v16 = [MEMORY[0x263F522E0] phraseShortcutKey];
    [v15 setProperty:v16 forKey:v12];

    [v15 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v5 addObject:v15];
    v17 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)LiveSpeechAddFavoritePhraseController;
  v5 = [(LiveSpeechAddFavoritePhraseController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 textField];
    [v6 setDelegate:self];
  }

  return v5;
}

- (id)_dummyTextValue
{
  return 0;
}

- (UITextField)phraseTextTextField
{
  uint64_t v3 = [MEMORY[0x263F522E0] phraseTextKey];
  v4 = [(LiveSpeechAddFavoritePhraseController *)self cachedCellForSpecifierID:v3];
  v5 = [v4 editableTextField];

  return (UITextField *)v5;
}

- (UITextField)phraseShortcutTextField
{
  uint64_t v3 = [MEMORY[0x263F522E0] phraseShortcutKey];
  v4 = [(LiveSpeechAddFavoritePhraseController *)self cachedCellForSpecifierID:v3];
  v5 = [v4 editableTextField];

  return (UITextField *)v5;
}

- (void)_saveButtonTapped:(id)a3
{
  v4 = [(LiveSpeechAddFavoritePhraseController *)self phraseTextTextField];
  id v13 = [v4 text];

  if ([v13 length])
  {
    v5 = [(LiveSpeechAddFavoritePhraseController *)self phraseShortcutTextField];
    v6 = [v5 text];

    v7 = (void *)MEMORY[0x263EFF9A0];
    objc_super v8 = [MEMORY[0x263F522E0] phraseTextKey];
    v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v13, v8, 0);

    if ([v6 length])
    {
      v10 = [MEMORY[0x263F522E0] phraseShortcutKey];
      [v9 setObject:v6 forKeyedSubscript:v10];
    }
    [MEMORY[0x263F522E0] addFavoritePhrase:v9];
    v11 = [(LiveSpeechAddFavoritePhraseController *)self navigationController];
    id v12 = (id)[v11 popViewControllerAnimated:1];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(LiveSpeechAddFavoritePhraseController *)self phraseTextTextField];

  if (v11 == v9)
  {
    id v12 = [v9 text];
    id v13 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    BOOL v14 = [v13 length] != 0;
    v15 = [(LiveSpeechAddFavoritePhraseController *)self navigationItem];
    v16 = [v15 rightBarButtonItem];
    [v16 setEnabled:v14];
  }
  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

@end