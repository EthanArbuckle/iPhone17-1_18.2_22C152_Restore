@interface ASAccessoryNameEditingController
- (ASAccessoryNameEditingController)init;
- (BOOL)keyboardShownOnce;
- (BOOL)shouldSelectResponderOnAppearance;
- (BOOL)textFieldShouldReturn:(id)a3;
- (id)getDeviceName:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyboardWillShow:(id)a3;
- (void)setKeyboardShownOnce:(BOOL)a3;
- (void)suspend;
- (void)textDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ASAccessoryNameEditingController

- (ASAccessoryNameEditingController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ASAccessoryNameEditingController;
  v2 = [(ASAccessoryNameEditingController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASAccessoryNameEditingController;
  [(ASAccessoryNameEditingController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ASAccessoryNameEditingController;
  [(ASAccessoryNameEditingController *)&v6 viewDidLoad];
  if (!self->_session)
  {
    v3 = (DASession *)objc_alloc_init(MEMORY[0x263F397F8]);
    session = self->_session;
    self->_session = v3;

    objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE90]) propertyForKey:@"bundleID"];
    [(DASession *)self->_session setBundleID:v5];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDC0];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE90]) propertyForKey:@"device"];
    currentDevice = self->_currentDevice;
    self->_currentDevice = v5;

    v7 = [(DADevice *)self->_currentDevice name];
    deviceName = self->_deviceName;
    self->_deviceName = v7;

    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    v10 = [(objc_class *)getPSSpecifierClass() emptyGroupSpecifier];
    v11 = objc_msgSend(v9, "initWithObjects:", v10, 0);

    Class PSSpecifierClass = getPSSpecifierClass();
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE80]));
    v14 = [(objc_class *)PSSpecifierClass preferenceSpecifierNamed:0 target:WeakRetained set:sel_saveEditedName_specifier_ get:sel_getDeviceName_ detail:0 cell:8 edit:0];

    [v14 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60098]];
    [v11 addObject:v14];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v11;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)suspend
{
  uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD8]) firstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)ASAccessoryNameEditingController;
  [(ASAccessoryNameEditingController *)&v4 suspend];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD8]) firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)ASAccessoryNameEditingController;
  [(ASAccessoryNameEditingController *)&v6 viewWillDisappear:v3];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ASAccessoryNameEditingController;
  objc_super v5 = [(ASAccessoryNameEditingController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  objc_super v6 = [v5 editableTextField];
  v7 = v6;
  if (v6)
  {
    [v6 setReturnKeyType:9];
    [v7 setAutocapitalizationType:0];
    [v7 setAutocorrectionType:1];
    [v7 setAdjustsFontSizeToFitWidth:1];
    [v7 setTextAlignment:4];
    [v7 setClearButtonMode:3];
    [v7 addTarget:self action:sel_textDidChange_ forControlEvents:0x20000];
    [v7 setDelegate:self];
    [v7 setText:self->_deviceName];
    [v7 setPlaceholder:self->_deviceName];
  }

  return v5;
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x263F828A0], "activeKeyboard", a3);
  objc_msgSend(v4, "setReturnKeyEnabled:", -[ASAccessoryNameEditingController keyboardShownOnce](self, "keyboardShownOnce"));

  if (![(ASAccessoryNameEditingController *)self keyboardShownOnce])
  {
    [(ASAccessoryNameEditingController *)self setKeyboardShownOnce:1];
  }
}

- (void)textDidChange:(id)a3
{
  id v9 = a3;
  objc_super v4 = [v9 text];
  objc_super v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  objc_super v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if (![v6 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setText:&stru_26F86DD88];
    }
  }
  uint64_t v7 = [v6 isEqualToString:self->_deviceName] ^ 1;
  v8 = [MEMORY[0x263F828A0] activeKeyboard];
  [v8 setReturnKeyEnabled:v7];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_super v4 = [a3 text];
  objc_super v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  objc_super v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x263F397E0]);
    [v7 setDisplayName:v6];
    [v7 setUserInitiated:1];
    v8 = [(DADevice *)self->_currentDevice identifier];
    [(DASession *)self->_session modifyDeviceWithIdentifier:v8 settings:v7 completionHandler:&__block_literal_global];
  }
  return 1;
}

- (id)getDeviceName:(id)a3
{
  return self->_deviceName;
}

- (BOOL)keyboardShownOnce
{
  return self->_keyboardShownOnce;
}

- (void)setKeyboardShownOnce:(BOOL)a3
{
  self->_keyboardShownOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end