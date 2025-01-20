@interface HKHealthPrivacyHostAuthorizationViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3;
- (HKHealthPrivacyHostAuthorizationControllerDelegate)delegate;
- (void)didFinishWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4;
- (void)show;
@end

@implementation HKHealthPrivacyHostAuthorizationViewController

- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthPrivacyHostAuthorizationViewController *)self _healthPrivacyServiceViewControllerProxy];
  [v8 setRequestRecord:v7 presentationRequests:v6];
}

- (void)show
{
  id v2 = [(HKHealthPrivacyHostAuthorizationViewController *)self _healthPrivacyServiceViewControllerProxy];
  [v2 show];
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthPrivacyHostAuthorizationViewController *)self delegate];
  [v5 healthPrivacyHostAuthorizationControllerDidFinishWithError:v4];
}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() requestViewController:@"HKHealthPrivacyServiceAuthorizationViewController" fromServiceWithBundleIdentifier:*MEMORY[0x1E4F2BE18] connectionHandler:v3];

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (HKHealthPrivacyHostAuthorizationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyHostAuthorizationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end