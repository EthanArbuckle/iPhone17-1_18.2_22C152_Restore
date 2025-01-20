@interface PKPeerPaymentMessagesContentRecipientGroupViewController
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentRecipientGroupViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentRecipientGroupViewController;
  [(PKPeerPaymentMessagesContentRecipientGroupViewController *)&v11 viewDidLoad];
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
  v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_GROUP");
  [v9 setText:v10];
}

@end