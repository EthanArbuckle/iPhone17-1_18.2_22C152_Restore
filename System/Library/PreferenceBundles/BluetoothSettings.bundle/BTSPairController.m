@interface BTSPairController
- (BOOL)textFieldShouldReturn:(id)a3;
- (BTSPairController)init;
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

@implementation BTSPairController

- (BTSPairController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTSPairController;
  v2 = [(BTSPairController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_deviceUpdated_ name:*MEMORY[0x263F2B930] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
  }
  return v2;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)BTSPairController;
  [(BTSPairController *)&v12 loadView];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonClicked_];
  id v4 = objc_alloc(MEMORY[0x263F824A8]);
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"PAIR" value:&stru_26F24FEE8 table:@"Devices"];
  v7 = (void *)[v4 initWithTitle:v6 style:2 target:self action:sel_doneButtonClicked_];

  v8 = [(BTSPairController *)self navigationItem];
  [v8 setLeftBarButtonItem:v3];

  v9 = [(BTSPairController *)self navigationItem];
  [v9 setRightBarButtonItem:v7];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PAIRING_PROMPT" value:&stru_26F24FEE8 table:@"Devices"];
  [(BTSPairController *)self updatePrompt:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BTSPairController;
  [(BTSPairController *)&v9 viewWillAppear:a3];
  id v4 = [(BTSPairController *)self navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:0];

  objc_super v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  v7 = [(BTSPairController *)self indexPathForIndex:1];
  v8 = [v6 cellForRowAtIndexPath:v7];
  [v8 becomeFirstResponder];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BTSPairController;
  [(BTSPairController *)&v4 dealloc];
}

- (void)updatePrompt:(id)a3
{
  objc_storeStrong((id *)&self->_promptFormat, a3);
  id v5 = a3;
  id v6 = [(BTSPairController *)self navigationItem];
  [v6 setPrompt:v5];
}

- (void)cancelButtonClicked:(id)a3
{
  self->_dismissed = 1;
  objc_super v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]), "userInfo", a3);
  [v4 setObject:@"cancelled" forKey:@"PIN-ended"];

  [(BluetoothDevice *)self->_device setPIN:0];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained dismiss];
}

- (void)doneButtonClicked:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  id v5 = [(BTSPairController *)self indexPathForIndex:1];
  id v12 = [(BTSPairController *)self tableView:v4 cellForRowAtIndexPath:v5];

  if (v12)
  {
    id v6 = [v12 value];
    unint64_t v7 = [v6 length];

    if (v7 >= 4)
    {
      self->_dismissed = 1;
      v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
      [v8 setObject:@"entered" forKey:@"PIN-ended"];

      device = self->_device;
      v10 = [v12 value];
      [(BluetoothDevice *)device setPIN:v10];

      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                + (int)*MEMORY[0x263F5FE78]));
      [WeakRetained dismiss];
    }
  }
}

- (void)deviceUpdated:(id)a3
{
  uint64_t v4 = [a3 object];
  id v5 = [v4 address];
  id v6 = [(BluetoothDevice *)self->_device address];
  if (v5 == v6)
  {
    BOOL dismissed = self->_dismissed;

    if (!dismissed)
    {
      v8 = NSString;
      p_promptFormat = (uint64_t *)&self->_promptFormat;
      promptFormat = self->_promptFormat;
      id v15 = 0;
      v11 = [v4 name];
      id v12 = [v8 stringWithValidatedFormat:promptFormat, @"%@", &v15, v11 validFormatSpecifiers error];
      id v13 = v15;

      if (v12)
      {
        v14 = [(BTSPairController *)self navigationItem];
        [v14 setTitle:v12];
      }
      else
      {
        v14 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          [(BTSPairController *)(uint64_t)v13 deviceUpdated:v14];
        }
      }
    }
  }
  else
  {
  }
}

- (void)keyboardWillShow:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  uint64_t v4 = [(BTSPairController *)self indexPathForIndex:1];
  id v5 = [v3 cellForRowAtIndexPath:v4];
  int v6 = [v5 isFirstResponder];

  if (v6)
  {
    id v7 = [MEMORY[0x263F828A0] activeKeyboard];
    [v7 setReturnKeyEnabled:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BTSPairController;
  id v5 = [(BTSPairController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 12)
  {
    int v6 = [v5 editableTextField];
    id v7 = v6;
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

- (void)textDidChange:(id)a3
{
  uint64_t v4 = [a3 text];
  BOOL v5 = (unint64_t)[v4 length] > 3;

  int v6 = [(BTSPairController *)self navigationItem];
  id v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];

  id v8 = [MEMORY[0x263F828A0] activeKeyboard];
  [v8 setReturnKeyEnabled:v5];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 delegate];
  [v4 doneButtonClicked:v3];

  return 1;
}

- (id)specifiers
{
  id v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  uint64_t v4 = [v3 objectForKey:@"bt-device"];

  BOOL v5 = [v4 device];
  device = self->_device;
  self->_device = v5;

  uint64_t v7 = (int)*MEMORY[0x263F5FDB8];
  id v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    v10 = (void *)MEMORY[0x263F5FC40];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"PASSWORD" value:&stru_26F24FEE8 table:@"Devices"];
    id v13 = [v10 preferenceSpecifierNamed:v12 target:self set:sel_emptySetter_specifier_ get:0 detail:0 cell:12 edit:0];

    [v9 addObject:v13];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)v9;

    id v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  }
  id v15 = v8;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptFormat, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)deviceUpdated:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_23EB2E000, log, OS_LOG_TYPE_ERROR, "bad format string in notification (%@): %@", (uint8_t *)&v4, 0x16u);
}

@end