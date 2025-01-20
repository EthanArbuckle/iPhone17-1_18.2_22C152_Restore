@interface PKPeerPaymentMessagesContentOfflineViewController
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentOfflineViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentOfflineViewController;
  [(PKPeerPaymentMessagesContentOfflineViewController *)&v11 viewDidLoad];
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
  v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_OFFLINE_TITLE");
  [v9 setText:v10];
}

@end