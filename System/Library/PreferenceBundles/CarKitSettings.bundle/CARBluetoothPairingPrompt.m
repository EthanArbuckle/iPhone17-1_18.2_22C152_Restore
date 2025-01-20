@interface CARBluetoothPairingPrompt
- (CARBluetoothPairingPrompt)initWithPairingStyle:(unint64_t)a3 deviceName:(id)a4 passKey:(id)a5;
- (NSString)deviceName;
- (NSString)passKey;
- (UIAlertController)presentedAlertController;
- (id)_alertController;
- (id)confirmationCompletion;
- (unint64_t)pairingStyle;
- (void)_handlePairingCompleted:(BOOL)a3;
- (void)dealloc;
- (void)presentFromViewController:(id)a3;
- (void)setConfirmationCompletion:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPairingStyle:(unint64_t)a3;
- (void)setPassKey:(id)a3;
- (void)setPresentedAlertController:(id)a3;
@end

@implementation CARBluetoothPairingPrompt

- (CARBluetoothPairingPrompt)initWithPairingStyle:(unint64_t)a3 deviceName:(id)a4 passKey:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CARBluetoothPairingPrompt;
  v10 = [(CARBluetoothPairingPrompt *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CARBluetoothPairingPrompt *)v10 setPairingStyle:a3];
    [(CARBluetoothPairingPrompt *)v11 setDeviceName:v8];
    [(CARBluetoothPairingPrompt *)v11 setPassKey:v9];
  }

  return v11;
}

- (void)dealloc
{
  [(CARBluetoothPairingPrompt *)self setConfirmationCompletion:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CARBluetoothPairingPrompt;
  [(CARBluetoothPairingPrompt *)&v4 dealloc];
}

- (id)_alertController
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"PAIRING_TITLE" value:&stru_24F60 table:@"Alerts"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_24F60 table:@"Alerts"];

  v7 = [(CARBluetoothPairingPrompt *)self deviceName];
  if ([(CARBluetoothPairingPrompt *)self pairingStyle])
  {
    id v8 = 0;
    id v9 = 0;
  }
  else
  {
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"NUMERIC_MESSAGE" value:&stru_24F60 table:@"Alerts"];
    v12 = +[UIDevice currentDevice];
    objc_super v13 = [v12 localizedModel];
    v14 = [(CARBluetoothPairingPrompt *)self passKey];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7, v13, v14, v7);

    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v15 localizedStringForKey:@"PAIR_BUTTON" value:&stru_24F60 table:@"Alerts"];
  }
  v16 = +[UIAlertController alertControllerWithTitle:v4 message:v9 preferredStyle:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10998;
  v21[3] = &unk_24CA8;
  v21[4] = self;
  v17 = +[UIAlertAction actionWithTitle:v6 style:1 handler:v21];
  [v16 addAction:v17];

  if (v8)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_109A4;
    v20[3] = &unk_24CA8;
    v20[4] = self;
    v18 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v20];
    [v16 addAction:v18];
  }

  return v16;
}

- (void)presentFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CARBluetoothPairingPrompt *)self _alertController];
  [v4 presentViewController:v5 animated:1 completion:0];

  [(CARBluetoothPairingPrompt *)self setPresentedAlertController:v5];
}

- (void)_handlePairingCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CARBluetoothPairingPrompt *)self confirmationCompletion];
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, v3);
    id v4 = (void (**)(void, void))v5;
  }
}

- (id)confirmationCompletion
{
  return self->_confirmationCompletion;
}

- (void)setConfirmationCompletion:(id)a3
{
}

- (unint64_t)pairingStyle
{
  return self->_pairingStyle;
}

- (void)setPairingStyle:(unint64_t)a3
{
  self->_pairingStyle = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)passKey
{
  return self->_passKey;
}

- (void)setPassKey:(id)a3
{
}

- (UIAlertController)presentedAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedAlertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setPresentedAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedAlertController);
  objc_storeStrong((id *)&self->_passKey, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong(&self->_confirmationCompletion, 0);
}

@end