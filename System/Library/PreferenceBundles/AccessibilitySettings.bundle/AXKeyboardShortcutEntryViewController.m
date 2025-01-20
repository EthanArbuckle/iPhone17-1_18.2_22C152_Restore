@interface AXKeyboardShortcutEntryViewController
- (AXKeyboardShortcutEntryPresenter)presenter;
- (BOOL)hasEndedEventCapture;
- (BOOL)shouldAllowEndingEventCapture;
- (BOOL)shouldAllowTabAsModifier;
- (NSString)instructionsText;
- (NSString)keyChordDisplayText;
- (PSSpecifier)specifier;
- (void)_updateAttributedMessage;
- (void)_updateInstructionsText;
- (void)setHasEndedEventCapture:(BOOL)a3;
- (void)setInstructionsText:(id)a3;
- (void)setKeyChordDisplayText:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setShouldAllowEndingEventCapture:(BOOL)a3;
- (void)setShouldAllowTabAsModifier:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)updateWithKeyChord:(id)a3 shouldSpeakChange:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation AXKeyboardShortcutEntryViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AXKeyboardShortcutEntryViewController;
  [(AXKeyboardShortcutEntryViewController *)&v4 viewDidLoad];
  [(AXKeyboardShortcutEntryViewController *)self _updateInstructionsText];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_updateAttributedMessage" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)setHasEndedEventCapture:(BOOL)a3
{
  if (self->_hasEndedEventCapture != a3)
  {
    self->_hasEndedEventCapture = a3;
    [(AXKeyboardShortcutEntryViewController *)self _updateInstructionsText];
  }
}

- (void)updateWithKeyChord:(id)a3 shouldSpeakChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(AXKeyboardShortcutEntryViewController *)self shouldAllowTabAsModifier]) {
    [v6 accessibilitySpeakableDisplayValueWithStyle:1];
  }
  else {
  v7 = [v6 accessibilitySpeakableDisplayValue];
  }

  [(AXKeyboardShortcutEntryViewController *)self setKeyChordDisplayText:v7];
  if (v4)
  {
    v8 = [(AXKeyboardShortcutEntryViewController *)self keyChordDisplayText];
    UIAccessibilitySpeak();
  }

  [(AXKeyboardShortcutEntryViewController *)self _updateAttributedMessage];
}

- (void)_updateInstructionsText
{
  if ([(AXKeyboardShortcutEntryViewController *)self shouldAllowEndingEventCapture])
  {
    if ([(AXKeyboardShortcutEntryViewController *)self hasEndedEventCapture]) {
      v3 = @"KEYBOARD_SHORTCUT_INSTRUCTIONS_TOGGLE_OFF";
    }
    else {
      v3 = @"KEYBOARD_SHORTCUT_INSTRUCTIONS_TOGGLE";
    }
  }
  else
  {
    v3 = @"KEYBOARD_SHORTCUT_INSTRUCTIONS";
  }
  settingsLocString(v3, @"Accessibility");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXKeyboardShortcutEntryViewController *)self setInstructionsText:v4];
  [(AXKeyboardShortcutEntryViewController *)self _updateAttributedMessage];
}

- (void)_updateAttributedMessage
{
  v3 = objc_opt_new();
  id v4 = [(AXKeyboardShortcutEntryViewController *)self instructionsText];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:2];
    id v7 = objc_alloc((Class)NSAttributedString);
    v8 = [(AXKeyboardShortcutEntryViewController *)self instructionsText];
    NSAttributedStringKey v24 = NSFontAttributeName;
    v9 = +[UIFont fontWithDescriptor:v6 size:0.0];
    v25 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v11 = [v7 initWithString:v8 attributes:v10];
    [v3 appendAttributedString:v11];
  }
  v12 = [(AXKeyboardShortcutEntryViewController *)self keyChordDisplayText];
  id v13 = [v12 length];

  if (v13)
  {
    v14 = [(AXKeyboardShortcutEntryViewController *)self instructionsText];
    id v15 = [v14 length];

    if (v15)
    {
      id v16 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n\n"];
      [v3 appendAttributedString:v16];
    }
    v17 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle2 variant:1024];
    id v18 = objc_alloc((Class)NSAttributedString);
    v19 = [(AXKeyboardShortcutEntryViewController *)self keyChordDisplayText];
    NSAttributedStringKey v22 = NSFontAttributeName;
    v23 = v17;
    v20 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v21 = [v18 initWithString:v19 attributes:v20];
    [v3 appendAttributedString:v21];
  }
  [(AXKeyboardShortcutEntryViewController *)self _setAttributedMessage:v3];
}

- (AXKeyboardShortcutEntryPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (AXKeyboardShortcutEntryPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (PSSpecifier)specifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);

  return (PSSpecifier *)WeakRetained;
}

- (void)setSpecifier:(id)a3
{
}

- (BOOL)shouldAllowTabAsModifier
{
  return self->_shouldAllowTabAsModifier;
}

- (void)setShouldAllowTabAsModifier:(BOOL)a3
{
  self->_shouldAllowTabAsModifier = a3;
}

- (BOOL)shouldAllowEndingEventCapture
{
  return self->_shouldAllowEndingEventCapture;
}

- (void)setShouldAllowEndingEventCapture:(BOOL)a3
{
  self->_shouldAllowEndingEventCapture = a3;
}

- (BOOL)hasEndedEventCapture
{
  return self->_hasEndedEventCapture;
}

- (NSString)keyChordDisplayText
{
  return self->_keyChordDisplayText;
}

- (void)setKeyChordDisplayText:(id)a3
{
}

- (NSString)instructionsText
{
  return self->_instructionsText;
}

- (void)setInstructionsText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsText, 0);
  objc_storeStrong((id *)&self->_keyChordDisplayText, 0);
  objc_destroyWeak((id *)&self->_specifier);

  objc_destroyWeak((id *)&self->_presenter);
}

@end