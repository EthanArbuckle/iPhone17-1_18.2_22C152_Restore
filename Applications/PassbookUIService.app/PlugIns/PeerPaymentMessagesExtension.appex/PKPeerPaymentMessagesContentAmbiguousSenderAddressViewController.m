@interface PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController
- (void)_openSettings;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController;
  [(PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController *)&v17 viewDidLoad];
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
  v10 = PKPrimaryAppleAccountFormattedUsername();
  v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_AMBIGUOUS_SENDER_ADDRESS_FORMAT", @"%@", v10);
  [v9 setText:v11];

  v12 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v13 = [v12 button];
  v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_AMBIGUOUS_SENDER_ADDRESS_ACTION");
  [v13 setTitle:v14 forState:0];

  v15 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v16 = [v15 button];
  [v16 addTarget:self action:"_openSettings" forControlEvents:0x2000];
}

- (void)_openSettings
{
  +[NSURL URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end