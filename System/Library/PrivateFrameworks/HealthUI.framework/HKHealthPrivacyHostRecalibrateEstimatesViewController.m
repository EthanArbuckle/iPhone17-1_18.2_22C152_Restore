@interface HKHealthPrivacyHostRecalibrateEstimatesViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3;
- (HKHealthPrivacyHostRecalibrateEstimatesControllerDelegate)delegate;
- (void)didFinishWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequestRecord:(id)a3 completion:(id)a4;
@end

@implementation HKHealthPrivacyHostRecalibrateEstimatesViewController

- (void)setRequestRecord:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthPrivacyHostRecalibrateEstimatesViewController *)self _healthPrivacyServiceViewControllerProxy];
  [v8 setRequestRecord:v7 completion:v6];
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthPrivacyHostRecalibrateEstimatesViewController *)self delegate];
  [v5 healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:v4];
}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() requestViewController:@"HKHealthPrivacyServiceRecalibrateEstimatesViewController" fromServiceWithBundleIdentifier:*MEMORY[0x1E4F2BE18] connectionHandler:v3];

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (HKHealthPrivacyHostRecalibrateEstimatesControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyHostRecalibrateEstimatesControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end