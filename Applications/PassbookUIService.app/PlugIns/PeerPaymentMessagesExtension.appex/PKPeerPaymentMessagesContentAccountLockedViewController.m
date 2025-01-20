@interface PKPeerPaymentMessagesContentAccountLockedViewController
- (void)_openWallet;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentAccountLockedViewController

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentMessagesContentAccountLockedViewController;
  [(PKPeerPaymentMessagesContentAccountLockedViewController *)&v18 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  PKUIScreenScale();
  v6 = +[PKPeerPaymentTheme primaryTextColor];
  v7 = PKUIApplePayLogo();
  [v5 setImage:v7];

  PKDeviceSpecificLocalizedStringKeyForKey();
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = PKLocalizedPeerPaymentString(v8);

  PKDeviceSpecificLocalizedStringKeyForKey();
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = PKLocalizedPeerPaymentString(v10);

  v12 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v13 = [v12 label];
  [v13 setText:v11];

  v14 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v15 = [v14 button];
  [v15 setTitle:v9 forState:0];

  v16 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v17 = [v16 button];
  [v17 addTarget:self action:"_openWallet" forControlEvents:0x2000];
}

- (void)_openWallet
{
  +[PKAnalyticsReporter reportAppleCashSenderErrorPage:PKAnalyticsReportPeerPaymentErrorAccountRestrictedLockedPageTag buttonTag:PKAnalyticsReportPeerPaymentGoToWalletButtonTag];
  id v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  [v3 handleAction:5 sender:self completion:0];
}

@end