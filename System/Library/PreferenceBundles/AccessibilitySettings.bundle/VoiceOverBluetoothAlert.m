@interface VoiceOverBluetoothAlert
- (VoiceOverBluetoothAlert)initWithDevice:(id)a3;
- (void)dismiss;
- (void)setDelegate:(id)a3;
- (void)showAlertWithResult:(id)a3;
@end

@implementation VoiceOverBluetoothAlert

- (VoiceOverBluetoothAlert)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VoiceOverBluetoothAlert;
  v6 = [(VoiceOverBluetoothAlert *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)dismiss
{
  [(UIAlertController *)self->_alertController dismissViewControllerAnimated:1 completion:0];
  alertController = self->_alertController;
  self->_alertController = 0;
}

- (void)showAlertWithResult:(id)a3
{
  unsigned int v4 = [a3 unsignedIntValue];
  if (VOBTNoServiceError == v4)
  {
    id v5 = VOSLocString();
    v6 = [(AXUIBluetoothDevice *)self->_device name];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

    [(AXUIBluetoothDevice *)self->_device paired];
  }
  else
  {
    if (VOBTInvalidPINCodeError == v4 || VOBTDriverLoadingError == v4)
    {
      v8 = VOSLocString();
      objc_super v9 = [(AXUIBluetoothDevice *)self->_device name];
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);
    }
    else
    {
      if (VOBTGeneralError != v4 || ([(AXUIBluetoothDevice *)self->_device paired] & 1) != 0)
      {
        v10 = 0;
LABEL_12:
        [(AXUIBluetoothDevice *)self->_device paired];
        v11 = VOSLocString();
        v12 = [(AXUIBluetoothDevice *)self->_device name];
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

        uint64_t v13 = VOSLocString();

        v10 = (void *)v13;
        goto LABEL_13;
      }
      v8 = VOSLocString();
      v20 = VOSLocString();
      v21 = [(AXUIBluetoothDevice *)self->_device name];
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);
      v7 = +[NSString stringWithFormat:@"%@ %@", v8, v22];
    }
  }
  v10 = VOSLocString();
  if (!v7) {
    goto LABEL_12;
  }
LABEL_13:
  [(AXUIBluetoothDevice *)self->_device paired];
  v14 = VOSLocString();
  v15 = +[UIAlertController alertControllerWithTitle:v14 message:v7 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v15;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __47__VoiceOverBluetoothAlert_showAlertWithResult___block_invoke;
  v23[3] = &unk_208B68;
  v23[4] = self;
  v17 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v23];
  [(UIAlertController *)self->_alertController addAction:v17];
  v18 = [(VoiceOverBluetoothAlertDelegate *)self->_delegate window];
  v19 = [v18 rootViewController];
  [v19 presentViewController:self->_alertController animated:1 completion:0];
}

uint64_t __47__VoiceOverBluetoothAlert_showAlertWithResult___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 title];
  unsigned int v4 = VOSLocString();
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5) {
    [*(id *)(*(void *)(a1 + 32) + 16) unpair];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 8);
    return (uint64_t)objc_msgSend(v7, "performSelector:withObject:", "alertSheetDismissed:");
  }
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end