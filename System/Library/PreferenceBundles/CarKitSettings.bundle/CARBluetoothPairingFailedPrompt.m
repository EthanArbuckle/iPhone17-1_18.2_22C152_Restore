@interface CARBluetoothPairingFailedPrompt
+ (void)presentPairingFailure:(unint64_t)a3 forDeviceName:(id)a4 fromViewController:(id)a5 completion:(id)a6;
@end

@implementation CARBluetoothPairingFailedPrompt

+ (void)presentPairingFailure:(unint64_t)a3 forDeviceName:(id)a4 fromViewController:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v22 = v9;
  if (a3 == 1)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v12 localizedStringForKey:@"PAIRING_FAILED_MESSAGE_TIMEOUT" value:&stru_24F60 table:@"Alerts"];
  }
  else
  {
    if (a3)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"PAIRING_FAILED_MESSAGE_GENERIC" value:&stru_24F60 table:@"Alerts"];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v9);
  }
LABEL_7:
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"PAIRING_FAILED_TITLE" value:&stru_24F60 table:@"Alerts"];
  v17 = +[UIAlertController alertControllerWithTitle:v16 message:v14 preferredStyle:1];

  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"PAIRING_FAILED_OK" value:&stru_24F60 table:@"Alerts"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10E04;
  v23[3] = &unk_24CD0;
  id v24 = v11;
  id v20 = v11;
  v21 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v23];
  [v17 addAction:v21];

  [v10 presentViewController:v17 animated:1 completion:0];
}

@end