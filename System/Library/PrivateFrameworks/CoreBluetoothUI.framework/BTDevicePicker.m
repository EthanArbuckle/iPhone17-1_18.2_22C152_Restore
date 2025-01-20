@interface BTDevicePicker
- (BTDevicePicker)initWithTitle:(id)a3 service:(unsigned int)a4 discoveryNameFilter:(id)a5;
- (BTDevicePickerDelegate)delegate;
- (BTDevicePickerRemoteViewController)devicePickerRemoteViewController;
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (void)applicationWillResignActive:(id)a3;
- (void)createAlertWindowForRootViewController:(id)a3;
- (void)dealloc;
- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4;
- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4;
- (void)dismissAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDevicePickerRemoteViewController:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)show;
@end

@implementation BTDevicePicker

- (BTDevicePicker)initWithTitle:(id)a3 service:(unsigned int)a4 discoveryNameFilter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BTDevicePicker;
  v11 = [(BTDevicePicker *)&v14 init];
  if (v11)
  {
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v11 selector:sel_applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];

    objc_storeStrong((id *)&v11->_title, a3);
    v11->_service = a4;
    objc_storeStrong((id *)&v11->_predicate, a5);
  }

  return v11;
}

- (void)dealloc
{
  if (CBUILogInitOnce != -1) {
    dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
  }
  v3 = CBUILogComponent;
  if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235C69000, v3, OS_LOG_TYPE_DEFAULT, "BTDevicePikcer dealloc", buf, 2u);
  }
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  if (self->_extensionRequestIdentifier)
  {
    if (CBUILogInitOnce != -1) {
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    }
    v5 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235C69000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling the extension", buf, 2u);
    }
    [(NSExtension *)self->_extension cancelExtensionRequestWithIdentifier:self->_extensionRequestIdentifier];
  }
  extension = self->_extension;
  self->_extension = 0;

  [(BTDevicePicker *)self setDelegate:0];
  title = self->_title;
  self->_title = 0;

  predicate = self->_predicate;
  self->_predicate = 0;

  alertWindow = self->_alertWindow;
  self->_alertWindow = 0;

  devicePickerRemoteViewController = self->_devicePickerRemoteViewController;
  self->_devicePickerRemoteViewController = 0;

  v11.receiver = self;
  v11.super_class = (Class)BTDevicePicker;
  [(BTDevicePicker *)&v11 dealloc];
}

- (void)applicationWillResignActive:(id)a3
{
}

- (void)show
{
  v3 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.CoreBluetoothUI.BTDevicePickerUI" error:0];
  [(BTDevicePicker *)self setExtension:v3];

  id location = 0;
  objc_initWeak(&location, self);
  v4 = [(BTDevicePicker *)self extension];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__BTDevicePicker_show__block_invoke;
  v5[3] = &unk_264C730B0;
  objc_copyWeak(&v6, &location);
  [v4 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __22__BTDevicePicker_show__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v11 = WeakRetained;
  if (v9 || !WeakRetained)
  {
    if (CBUILogInitOnce != -1) {
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    }
    v15 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_235C69000, v15, OS_LOG_TYPE_DEFAULT, "Failed to launch extension 'com.apple.CoreBluetoothUI.BTDevicePickerUI' due to error: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (CBUILogInitOnce != -1) {
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    }
    v12 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_235C69000, v12, OS_LOG_TYPE_DEFAULT, "Extension 'com.apple.CoreBluetoothUI.BTDevicePickerUI' launched successfully!", (uint8_t *)&v16, 2u);
    }
    objc_msgSend(v8, "set_delegate:", v11);
    [v11 setDevicePickerRemoteViewController:v8];
    [v11 setExtensionRequestIdentifier:v7];
    v13 = [v11 devicePickerRemoteViewController];
    [v11 createAlertWindowForRootViewController:v13];

    objc_super v14 = [v8 serviceViewControllerProxy];
    [v14 showBTDevicePickerWithTitle:*((void *)v11 + 2) Service:v11[6]];
  }
}

- (void)createAlertWindowForRootViewController:(id)a3
{
  id v19 = a3;
  v4 = [MEMORY[0x263F1C408] sharedApplication];
  v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = [MEMORY[0x263F1C408] sharedApplication];
  id v8 = [v7 delegate];
  id v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 window];

    id v9 = (void *)v10;
  }

  if (v9)
  {
    alertWindow = self->_alertWindow;
    self->_alertWindow = 0;

    v12 = [UIWindow_Custom alloc];
    v13 = [MEMORY[0x263F1C920] mainScreen];
    [v13 bounds];
    objc_super v14 = -[UIWindow_Custom initWithFrame:](v12, "initWithFrame:");
    v15 = self->_alertWindow;
    self->_alertWindow = v14;

    [(UIWindow_Custom *)self->_alertWindow setRootViewController:v19];
    [(UIWindow_Custom *)self->_alertWindow setWindowLevel:*MEMORY[0x263F1D810] + 1.0];
    [(UIWindow_Custom *)self->_alertWindow makeKeyAndVisible];
  }
  else
  {
    int v16 = [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
    id v17 = [v16 firstObject];
    uint64_t v18 = self->_alertWindow;
    self->_alertWindow = v17;
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(_UIRemoteViewController *)self->_devicePickerRemoteViewController serviceViewControllerProxy];
  [v6 dismissAnimated:v3];
  v5 = [(UIWindow_Custom *)self->_alertWindow rootViewController];
  [v5 dismissViewControllerAnimated:v3 completion:0];
}

- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    if (CBUILogInitOnce != -1) {
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    }
    id v7 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_235C69000, v7, OS_LOG_TYPE_DEFAULT, "Calling didDismissWithResult delegate", v8, 2u);
    }
    [(BTDevicePickerDelegate *)self->_delegate devicePicker:self didDismissWithResult:a3 deviceAddress:v6];
  }
}

- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  predicate = self->_predicate;
  if (!predicate || [(NSPredicate *)predicate evaluateWithObject:v9])
  {
    id v8 = [(_UIRemoteViewController *)self->_devicePickerRemoteViewController serviceViewControllerProxy];
    [v8 displayDevice:v9 deviceAddress:v6];
  }
}

- (BTDevicePickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BTDevicePickerDelegate *)a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (BTDevicePickerRemoteViewController)devicePickerRemoteViewController
{
  return self->_devicePickerRemoteViewController;
}

- (void)setDevicePickerRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePickerRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertWindow, 0);
}

@end