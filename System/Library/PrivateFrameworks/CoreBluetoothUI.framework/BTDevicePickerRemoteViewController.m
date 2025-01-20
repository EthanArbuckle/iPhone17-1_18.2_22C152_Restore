@interface BTDevicePickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BTDevicePickerRemoteViewControllerHost)_delegate;
- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4;
- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4;
- (void)set_delegate:(id)a3;
@end

@implementation BTDevicePickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E93A120];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E929198];
}

- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained didDismissWithResult:a3 deviceAddress:v6];
}

- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained discoveredDevice:v7 deviceAddress:v6];
}

- (BTDevicePickerRemoteViewControllerHost)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BTDevicePickerRemoteViewControllerHost *)WeakRetained;
}

- (void)set_delegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end