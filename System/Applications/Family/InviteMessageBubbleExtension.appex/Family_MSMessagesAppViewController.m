@interface Family_MSMessagesAppViewController
- (void)family_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7;
@end

@implementation Family_MSMessagesAppViewController

- (void)family_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  if (objc_opt_respondsToSelector()) {
    [(Family_MSMessagesAppViewController *)self _presentAlertSheetWithTitle:v16 message:v12 buttonTitles:v15 styles:v14 completion:v13];
  }
  else {
    [(Family_MSMessagesAppViewController *)self _presentAlertSheetWith:v15 styles:v14 completion:v13];
  }
}

@end