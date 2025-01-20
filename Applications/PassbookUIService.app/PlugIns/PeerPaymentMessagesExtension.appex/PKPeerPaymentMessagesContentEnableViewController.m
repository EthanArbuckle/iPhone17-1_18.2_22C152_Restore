@interface PKPeerPaymentMessagesContentEnableViewController
- (void)_openSettings;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentEnableViewController

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentMessagesContentEnableViewController;
  [(PKPeerPaymentMessagesContentEnableViewController *)&v18 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  PKUIScreenScale();
  v6 = +[PKPeerPaymentTheme primaryTextColor];
  v7 = PKUIApplePayLogo();
  [v5 setImage:v7];

  LODWORD(v6) = PKUserHasDisabledPeerPayment();
  v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v9 = [v8 label];
  if (v6)
  {
    v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_REENABLEMENT_REQUIRED_TITLE");
    [v9 setText:v10];

    v11 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v12 = [v11 button];
    v13 = @"PEER_PAYMENT_MESSAGES_REENABLEMENT_REQUIRED_ACTION";
  }
  else
  {
    v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_ENABLEMENT_REQUIRED_TITLE");
    [v9 setText:v14];

    v11 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v12 = [v11 button];
    v13 = @"PEER_PAYMENT_MESSAGES_ENABLEMENT_REQUIRED_ACTION";
  }
  v15 = PKLocalizedPeerPaymentString(&v13->isa);
  [v12 setTitle:v15 forState:0];

  v16 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v17 = [v16 button];
  [v17 addTarget:self action:"_openSettings" forControlEvents:0x2000];
}

- (void)_openSettings
{
  +[NSURL URLWithString:@"prefs:root=PASSBOOK"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end