@interface BTDeviceNameEditingController
- (BOOL)keyboardShownOnce;
- (BOOL)shouldSelectResponderOnAppearance;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BTDeviceNameEditingController)init;
- (id)getDeviceName:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyboardWillShow:(id)a3;
- (void)setKeyboardShownOnce:(BOOL)a3;
- (void)suspend;
- (void)textDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTDeviceNameEditingController

- (BTDeviceNameEditingController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BTDeviceNameEditingController;
  v2 = [(BTDeviceNameEditingController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BTDeviceNameEditingController;
  [(BTDeviceNameEditingController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
    v6 = +[HPSDevice deviceKey];
    v7 = [v5 objectForKeyedSubscript:v6];
    currentDevice = self->_currentDevice;
    self->_currentDevice = v7;

    v9 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    v10 = [v9 name];
    deviceName = self->_deviceName;
    self->_deviceName = v10;

    v12 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    v13 = [v12 productName];
    productName = self->_productName;
    self->_productName = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v16 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    v17 = objc_msgSend(v15, "initWithObjects:", v16, 0);

    v18 = (void *)MEMORY[0x1E4F92E70];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E4F92F90]));
    v20 = [v18 preferenceSpecifierNamed:0 target:WeakRetained set:sel_saveEditedName_specifier_ get:sel_getDeviceName_ detail:0 cell:8 edit:0];

    [v20 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93128]];
    [v17 addObject:v20];
    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v17;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)suspend
{
  uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) firstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)BTDeviceNameEditingController;
  [(BTDeviceNameEditingController *)&v4 suspend];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BTDeviceNameEditingController;
  [(BTDeviceNameEditingController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BTDeviceNameEditingController;
  [(BTDeviceNameEditingController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)BTDeviceNameEditingController;
  [(BTDeviceNameEditingController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BTDeviceNameEditingController;
  [(BTDeviceNameEditingController *)&v3 viewDidDisappear:a3];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BTDeviceNameEditingController;
  objc_super v5 = [(BTDeviceNameEditingController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  objc_super v6 = [v5 editableTextField];
  v7 = v6;
  if (v6)
  {
    [v6 setReturnKeyType:9];
    [v7 setAutocapitalizationType:0];
    [v7 setAutocorrectionType:1];
    [v7 setAutoresizesTextToFit:1];
    [v7 setTextAlignment:4];
    [v7 setClearButtonMode:3];
    [v7 addTarget:self action:sel_textDidChange_ forEvents:0x20000];
    [v7 setDelegate:self];
    p_deviceName = &self->_deviceName;
    [v7 setText:self->_deviceName];
    v9 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    if (([v9 magicPaired] & 1) == 0) {
      p_deviceName = &self->_productName;
    }
    [v7 setPlaceholder:*p_deviceName];
  }

  return v5;
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4FB18E0], "activeKeyboard", a3);
  if ([(BTDeviceNameEditingController *)self keyboardShownOnce]) {
    uint64_t v5 = [(BluetoothDeviceProtocol *)self->_currentDevice connected];
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setReturnKeyEnabled:v5];

  if (![(BTDeviceNameEditingController *)self keyboardShownOnce])
  {
    [(BTDeviceNameEditingController *)self setKeyboardShownOnce:1];
  }
}

- (void)textDidChange:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 text];
  uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  objc_super v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if (![v6 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setText:&stru_1F4097960];
    }
  }
  if ((unint64_t)[v6 length] > 0x3C)
  {
    uint64_t v8 = 0;
  }
  else
  {
    v7 = [(BluetoothDeviceProtocol *)self->_currentDevice name];
    if ([v6 isEqualToString:v7]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [(BluetoothDeviceProtocol *)self->_currentDevice connected];
    }
  }
  v9 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v9 setReturnKeyEnabled:v8];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 text];
  objc_super v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if (![v7 length])
  {
    uint64_t v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 placeholder];
      int v20 = 138477827;
      v21 = v9;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Textfield empty, setting it as placeholder: %{private}@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v10 = [v4 placeholder];

    v7 = (void *)v10;
  }
  int v11 = [(BluetoothDeviceProtocol *)self->_currentDevice connected];
  if (v11)
  {
    v12 = [(BluetoothDeviceProtocol *)self->_currentDevice name];
    char v13 = [v7 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                + (int)*MEMORY[0x1E4F92F90]));
      [WeakRetained setTitle:v7];

      id v15 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
      [v15 setUserName:v7];

      v16 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
      LODWORD(v15) = [v16 magicPaired];

      if (v15) {
        [v4 setPlaceholder:v7];
      }
    }
    [v4 setText:v7];
  }
  else
  {
    v17 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Cannot rename when device is disconnected", (uint8_t *)&v20, 2u);
    }

    v18 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    [v18 setReturnKeyEnabled:0];
  }
  return v11;
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
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_currentDevice, 0);
}

@end