@interface PKPeerPaymentMessagesContentInstallViewController
- (void)_openInstallWallet;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentInstallViewController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentMessagesContentInstallViewController;
  [(PKPeerPaymentMessagesContentInstallViewController *)&v16 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  PKUIScreenScale();
  v6 = +[PKPeerPaymentTheme primaryTextColor];
  v7 = PKUIApplePayLogo();
  [v5 setImage:v7];

  v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v9 = [v8 label];
  v10 = PKLocalizedDeletableString(@"WALLET_UNINSTALLED_ALERT_MESSAGE");
  [v9 setText:v10];

  v11 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v12 = [v11 button];
  v13 = PKLocalizedDeletableString(@"WALLET_UNINSTALLED_SHOW_APP_STORE_BUTTON");
  [v12 setTitle:v13 forState:0];

  v14 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v15 = [v14 button];
  [v15 addTarget:self action:"_openInstallWallet" forControlEvents:0x2000];
}

- (void)_openInstallWallet
{
}

@end