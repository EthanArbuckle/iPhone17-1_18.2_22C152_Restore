@interface CDPUIEDPRecoveryTokenEntryViewModel
- (BOOL)canEnterText:(id)a3;
- (BOOL)canEnterTextWithoutModification:(id)a3;
- (BOOL)hasText;
- (BOOL)tokenCanBeValidated;
- (CDPUIEDPRecoveryTokenEntryField)entryField;
- (CDPUIEDPRecoveryTokenEntryViewModel)init;
- (NSString)titleText;
- (UIButton)toggleEntryModeButton;
- (UIResponder)cameraPresenter;
- (id)_makeToggleEntryModeButton;
- (id)formattedFinalText:(id)a3;
- (unint64_t)entryMode;
- (void)_cameraSessionDidAppear;
- (void)_cameraSessionDidEnd;
- (void)_cameraSessionWillEnd;
- (void)_disableToggleButton;
- (void)_enableToggleButton;
- (void)_switchFromCameraToKeyboardInput;
- (void)_toggleEntryModeButton;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)processEnteredText:(id)a3 inRange:(_NSRange)a4;
- (void)setCameraPresenter:(id)a3;
@end

@implementation CDPUIEDPRecoveryTokenEntryViewModel

- (CDPUIEDPRecoveryTokenEntryViewModel)init
{
  v24.receiver = self;
  v24.super_class = (Class)CDPUIEDPRecoveryTokenEntryViewModel;
  v2 = [(CDPUIEDPRecoveryTokenEntryViewModel *)&v24 init];
  v3 = v2;
  if (v2)
  {
    v2->_entryMode = 0;
    uint64_t v4 = CDPLocalizedStringInTable();
    titleText = v3->_titleText;
    v3->_titleText = (NSString *)v4;

    v6 = CDPLocalizedStringInTable();
    v7 = [[CDPUIEDPRecoveryTokenEntryField alloc] initWithPlaceholder:v6];
    entryField = v3->_entryField;
    v3->_entryField = v7;

    uint64_t v9 = [(CDPUIEDPRecoveryTokenEntryViewModel *)v3 _makeToggleEntryModeButton];
    toggleEntryModeButton = v3->_toggleEntryModeButton;
    v3->_toggleEntryModeButton = (UIButton *)v9;

    v11 = [MEMORY[0x263F089C0] letterCharacterSet];
    v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-"];
    [(NSCharacterSet *)v11 formUnionWithCharacterSet:v12];
    charactersAllowedWithoutModification = v3->_charactersAllowedWithoutModification;
    v3->_charactersAllowedWithoutModification = v11;
    v14 = v11;

    v15 = [MEMORY[0x263F089C0] letterCharacterSet];
    v16 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    [(NSCharacterSet *)v15 formUnionWithCharacterSet:v16];

    [(NSCharacterSet *)v15 formUnionWithCharacterSet:v12];
    allAllowedCharacters = v3->_allAllowedCharacters;
    v3->_allAllowedCharacters = v15;
    v18 = v15;

    v19 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
    [(NSCharacterSet *)v19 formUnionWithCharacterSet:v12];
    delimiters = v3->_delimiters;
    v3->_delimiters = v19;
    v21 = v19;

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v3 selector:sel__cameraSessionDidAppear name:@"_UIKeyboardCameraSessionDidPresent" object:0];
    [v22 addObserver:v3 selector:sel__cameraSessionWillEnd name:@"_UIKeyboardCameraSessionWillDismiss" object:0];
    [v22 addObserver:v3 selector:sel__cameraSessionDidEnd name:@"_UIKeyboardCameraSessionDidDismiss" object:0];
  }
  return v3;
}

- (BOOL)canEnterTextWithoutModification:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:a3];
  LOBYTE(self) = [(NSCharacterSet *)self->_charactersAllowedWithoutModification isSupersetOfSet:v4];

  return (char)self;
}

- (BOOL)canEnterText:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:a3];
  LOBYTE(self) = [(NSCharacterSet *)self->_allAllowedCharacters isSupersetOfSet:v4];

  return (char)self;
}

- (id)formattedFinalText:(id)a3
{
  v3 = [a3 stringByTrimmingCharactersInSet:self->_delimiters];
  uint64_t v4 = [v3 lowercaseString];

  return v4;
}

- (void)processEnteredText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  uint64_t v9 = [v8 text];
  v10 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", location, length, v7);

  id v12 = [v10 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

  v11 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  [v11 setText:v12];
}

- (BOOL)tokenCanBeValidated
{
  v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.length > 0"];
  uint64_t v4 = [(CDPUIEDPRecoveryTokenEntryField *)self->_entryField text];
  v5 = [v4 componentsSeparatedByCharactersInSet:self->_delimiters];
  v6 = [v5 filteredArrayUsingPredicate:v3];

  LOBYTE(v5) = [v6 count] == 12;
  return (char)v5;
}

- (BOOL)hasText
{
  v2 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  [(CDPUIEDPRecoveryTokenEntryViewModel *)self _toggleEntryModeButton];
  id v5 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  [v5 setText:v4];
}

- (void)deleteBackward
{
  id v2 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  [v2 setText:&stru_26C9EBCA0];
}

- (id)_makeToggleEntryModeButton
{
  unint64_t v3 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryMode];
  if (v3)
  {
    if (v3 == 1)
    {
      CDPLocalizedString();
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v5 = @"keyboard";
    }
    else
    {
      id v5 = &stru_26C9EBCA0;
      id v4 = &stru_26C9EBCA0;
    }
  }
  else
  {
    CDPLocalizedStringInTable();
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v5 = @"text.viewfinder";
  }
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x263F823D0];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __65__CDPUIEDPRecoveryTokenEntryViewModel__makeToggleEntryModeButton__block_invoke;
  v20 = &unk_26433DA10;
  objc_copyWeak(&v21, &location);
  id v7 = [v6 actionWithHandler:&v17];
  v8 = objc_msgSend(MEMORY[0x263F824E8], "buttonWithType:primaryAction:", 0, v7, v17, v18, v19, v20);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setTitle:v4 forState:0];
  uint64_t v9 = [MEMORY[0x263F827E8] systemImageNamed:v5];
  [v8 setImage:v9 forState:0];

  v10 = (void *)MEMORY[0x263F81708];
  v11 = [MEMORY[0x263F82B60] mainScreen];
  id v12 = [v11 traitCollection];
  v13 = [v10 preferredFontForTextStyle:*MEMORY[0x263F83570] compatibleWithTraitCollection:v12];
  v14 = [v8 titleLabel];
  [v14 setFont:v13];

  objc_msgSend(v8, "setImageEdgeInsets:", 0.0, 0.0, 0.0, 3.0);
  v15 = [MEMORY[0x263F825C8] systemBlueColor];
  [v8 setTitleColor:v15 forState:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v8;
}

void __65__CDPUIEDPRecoveryTokenEntryViewModel__makeToggleEntryModeButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleEntryModeButton];
}

- (void)_toggleEntryModeButton
{
}

- (void)_cameraSessionDidAppear
{
}

- (void)_cameraSessionWillEnd
{
  if ([(CDPUIEDPRecoveryTokenEntryViewModel *)self entryMode] == 1)
  {
    [(CDPUIEDPRecoveryTokenEntryViewModel *)self _disableToggleButton];
  }
}

- (void)_cameraSessionDidEnd
{
  if ([(CDPUIEDPRecoveryTokenEntryViewModel *)self entryMode] == 1) {
    [(CDPUIEDPRecoveryTokenEntryViewModel *)self _toggleEntryModeButton];
  }
  unint64_t v3 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self toggleEntryModeButton];
  id v4 = CDPLocalizedStringInTable();
  [v3 setTitle:v4 forState:0];

  id v5 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self toggleEntryModeButton];
  v6 = [MEMORY[0x263F827E8] systemImageNamed:@"text.viewfinder"];
  [v5 setImage:v6 forState:0];

  [(CDPUIEDPRecoveryTokenEntryViewModel *)self _enableToggleButton];
}

- (void)_switchFromCameraToKeyboardInput
{
  unint64_t v3 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  [v3 endEditing:1];

  id v4 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self entryField];
  [v4 becomeFirstResponder];
}

- (void)_disableToggleButton
{
  unint64_t v3 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self toggleEntryModeButton];
  [v3 setEnabled:0];

  id v4 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self toggleEntryModeButton];
  [v4 setAlpha:0.4];
}

- (void)_enableToggleButton
{
  unint64_t v3 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self toggleEntryModeButton];
  [v3 setEnabled:1];

  id v4 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self toggleEntryModeButton];
  [v4 setAlpha:1.0];
}

- (unint64_t)entryMode
{
  return self->_entryMode;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (CDPUIEDPRecoveryTokenEntryField)entryField
{
  return self->_entryField;
}

- (UIButton)toggleEntryModeButton
{
  return self->_toggleEntryModeButton;
}

- (UIResponder)cameraPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraPresenter);

  return (UIResponder *)WeakRetained;
}

- (void)setCameraPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraPresenter);
  objc_storeStrong((id *)&self->_toggleEntryModeButton, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_allAllowedCharacters, 0);
  objc_storeStrong((id *)&self->_delimiters, 0);

  objc_storeStrong((id *)&self->_charactersAllowedWithoutModification, 0);
}

@end