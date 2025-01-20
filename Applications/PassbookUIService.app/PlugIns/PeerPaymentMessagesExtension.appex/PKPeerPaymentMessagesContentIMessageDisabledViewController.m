@interface PKPeerPaymentMessagesContentIMessageDisabledViewController
- (void)_openSettings;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentIMessageDisabledViewController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentMessagesContentIMessageDisabledViewController;
  [(PKPeerPaymentMessagesContentIMessageDisabledViewController *)&v16 viewDidLoad];
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
  v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_IMESSAGE_DISABLED_TITLE");
  [v9 setText:v10];

  v11 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v12 = [v11 button];
  v13 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_IMESSAGE_DISABLED_ACTION");
  [v12 setTitle:v13 forState:0];

  v14 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v15 = [v14 button];
  [v15 addTarget:self action:"_openSettings" forControlEvents:0x2000];
}

- (void)_openSettings
{
  +[NSURL URLWithString:@"prefs:root=MESSAGES"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end