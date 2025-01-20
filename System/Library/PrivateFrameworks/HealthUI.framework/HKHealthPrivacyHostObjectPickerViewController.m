@interface HKHealthPrivacyHostObjectPickerViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3;
- (HKHealthPrivacyHostObjectPickerViewControllerDelegate)delegate;
- (void)didFinishWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPromptSession:(id)a3;
@end

@implementation HKHealthPrivacyHostObjectPickerViewController

- (void)setPromptSession:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthPrivacyHostObjectPickerViewController *)self _healthPrivacyServiceViewControllerProxy];
  [v5 setPromptSession:v4];
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthPrivacyHostObjectPickerViewController *)self delegate];
  [v5 healthPrivacyHostObjectPickerViewController:self didFinishWithError:v4];
}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() requestViewController:@"HKHealthPrivacyServiceObjectPickerViewController" fromServiceWithBundleIdentifier:*MEMORY[0x1E4F2BE18] connectionHandler:v3];

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (HKHealthPrivacyHostObjectPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyHostObjectPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end