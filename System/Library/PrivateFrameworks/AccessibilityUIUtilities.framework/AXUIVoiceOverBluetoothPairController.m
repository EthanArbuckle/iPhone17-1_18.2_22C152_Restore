@interface AXUIVoiceOverBluetoothPairController
- (AXUIVoiceOverBluetoothPairController)init;
- (BOOL)textFieldShouldReturn:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)cancelButtonClicked:(id)a3;
- (void)dealloc;
- (void)deviceUpdated:(id)a3;
- (void)doneButtonClicked:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)textDidChange:(id)a3;
- (void)updatePrompt:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXUIVoiceOverBluetoothPairController

- (AXUIVoiceOverBluetoothPairController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  v2 = [(AXUISettingsSetupCapableListController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_deviceUpdated_ name:*MEMORY[0x1E4F494A0] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  }
  return v2;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  [(AXUIVoiceOverBluetoothPairController *)&v10 loadView];
  v3 = (void *)[objc_allocWithZone(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonClicked_];
  id v4 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
  v5 = AXUILocalizedStringForKey(@"PAIR");
  objc_super v6 = (void *)[v4 initWithTitle:v5 style:2 target:self action:sel_doneButtonClicked_];

  v7 = [(AXUIVoiceOverBluetoothPairController *)self navigationItem];
  [v7 setLeftBarButtonItem:v3];

  v8 = [(AXUIVoiceOverBluetoothPairController *)self navigationItem];
  [v8 setRightBarButtonItem:v6];

  v9 = AXUILocalizedStringForKey(@"PAIRING_PROMPT");
  [(AXUIVoiceOverBluetoothPairController *)self updatePrompt:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  [(AXUIVoiceOverBluetoothPairController *)&v9 viewWillAppear:a3];
  id v4 = [(AXUIVoiceOverBluetoothPairController *)self navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:0];

  objc_super v6 = [(AXUIVoiceOverBluetoothPairController *)self internalTableView];
  v7 = [(AXUIVoiceOverBluetoothPairController *)self indexPathForIndex:1];
  v8 = [v6 cellForRowAtIndexPath:v7];
  [v8 becomeFirstResponder];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  [(AXUISettingsSetupCapableListController *)&v4 dealloc];
}

- (void)updatePrompt:(id)a3
{
  p_promptFormat = &self->_promptFormat;
  objc_storeStrong((id *)&self->_promptFormat, a3);
  id v6 = a3;
  id v11 = [(AXUIVoiceOverBluetoothPairController *)self navigationItem];
  v7 = NSString;
  v8 = *p_promptFormat;
  objc_super v9 = [(AXUIBluetoothDevice *)self->_device name];
  objc_super v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

  [v11 setPrompt:v10];
}

- (void)cancelButtonClicked:(id)a3
{
  id v4 = a3;
  self->_dismissed = 1;
  objc_opt_class();
  v5 = [(AXUIVoiceOverBluetoothPairController *)self specifier];
  id v6 = [v5 userInfo];
  v7 = __UIAccessibilityCastAsClass();

  [v7 setObject:@"cancelled" forKey:@"PIN-ended"];
  [(AXUIBluetoothDevice *)self->_device setPIN:0];
  v8 = [(AXUIVoiceOverBluetoothPairController *)self parentController];
  [v8 dismiss];
}

- (void)doneButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = [(AXUIVoiceOverBluetoothPairController *)self internalTableView];
  id v6 = [(AXUIVoiceOverBluetoothPairController *)self indexPathForIndex:1];
  v7 = [(AXUIVoiceOverBluetoothPairController *)self tableView:v5 cellForRowAtIndexPath:v6];

  if (v7)
  {
    v8 = [v7 value];
    unint64_t v9 = [v8 length];

    if (v9 >= 4)
    {
      self->_dismissed = 1;
      objc_opt_class();
      objc_super v10 = [(AXUIVoiceOverBluetoothPairController *)self specifier];
      id v11 = [v10 userInfo];
      v12 = __UIAccessibilityCastAsClass();

      [v12 setObject:@"entered" forKey:@"PIN-ended"];
      device = self->_device;
      v14 = [v7 value];
      [(AXUIBluetoothDevice *)device setPIN:v14];

      v15 = [(AXUIVoiceOverBluetoothPairController *)self parentController];
      [v15 dismiss];
    }
  }
}

- (void)deviceUpdated:(id)a3
{
  id v11 = [a3 object];
  id v4 = [v11 address];
  uint64_t v5 = [(AXUIBluetoothDevice *)self->_device address];
  if (v4 != (void *)v5)
  {
    id v6 = (void *)v5;
LABEL_3:

    goto LABEL_5;
  }
  BOOL dismissed = self->_dismissed;

  if (!dismissed)
  {
    id v4 = [(AXUIVoiceOverBluetoothPairController *)self navigationItem];
    v8 = NSString;
    promptFormat = self->_promptFormat;
    id v6 = [v11 name];
    objc_super v10 = objc_msgSend(v8, "stringWithFormat:", promptFormat, v6);
    [v4 setTitle:v10];

    goto LABEL_3;
  }
LABEL_5:
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [(AXUIVoiceOverBluetoothPairController *)self internalTableView];
  uint64_t v5 = [(AXUIVoiceOverBluetoothPairController *)self indexPathForIndex:1];
  id v6 = [v4 cellForRowAtIndexPath:v5];
  int v7 = [v6 isFirstResponder];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    [v8 setReturnKeyEnabled:0];
  }
}

- (void)textDidChange:(id)a3
{
  id v4 = [a3 text];
  BOOL v5 = (unint64_t)[v4 length] > 3;

  id v6 = [(AXUIVoiceOverBluetoothPairController *)self navigationItem];
  int v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];

  id v8 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v8 setReturnKeyEnabled:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  BOOL v5 = [(AXUIVoiceOverBluetoothPairController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 12)
  {
    id v6 = [v5 editableTextField];
    int v7 = v6;
    if (v6)
    {
      [v6 setKeyboardType:4];
      [v7 setReturnKeyType:9];
      [v7 setAutocapitalizationType:0];
      [v7 addTarget:self action:sel_textDidChange_ forControlEvents:0x20000];
      [v7 setDelegate:self];
    }
  }
  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v3 = a3;
  id v4 = [v3 delegate];
  [v4 doneButtonClicked:v3];

  return 1;
}

- (id)specifiers
{
  objc_opt_class();
  id v3 = [(AXUIVoiceOverBluetoothPairController *)self specifier];
  id v4 = [v3 userInfo];
  BOOL v5 = __UIAccessibilityCastAsClass();

  id v6 = [v5 objectForKey:@"bt-device"];
  device = self->_device;
  self->_device = v6;

  uint64_t v8 = (int)*MEMORY[0x1E4F92F08];
  objc_super v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  if (!v9)
  {
    objc_super v10 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
    id v11 = (void *)MEMORY[0x1E4F92E70];
    v12 = AXUILocalizedStringForKey(@"PASSWORD");
    v13 = [v11 preferenceSpecifierNamed:v12 target:self set:sel_emptySetter_specifier_ get:0 detail:0 cell:12 edit:0];

    [v10 addObject:v13];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)v10;

    objc_super v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  }
  id v15 = v9;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptFormat, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end