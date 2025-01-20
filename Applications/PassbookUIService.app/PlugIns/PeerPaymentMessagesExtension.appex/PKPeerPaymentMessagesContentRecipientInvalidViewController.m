@interface PKPeerPaymentMessagesContentRecipientInvalidViewController
- (void)reloadContent;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentRecipientInvalidViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesContentRecipientInvalidViewController;
  [(PKPeerPaymentMessagesContentRecipientInvalidViewController *)&v8 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  PKUIScreenScale();
  v6 = +[PKPeerPaymentTheme primaryTextColor];
  v7 = PKUIApplePayLogo();
  [v5 setImage:v7];
}

- (void)reloadContent
{
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  id v8 = [v3 recipientDisplayName];

  if (v8 && [v8 length])
  {
    v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v5 = [v4 label];
    uint64_t v6 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_FORMAT", @"%@", v8);
  }
  else
  {
    v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v5 = [v4 label];
    uint64_t v6 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_NO_DISPLAY_NAME");
  }
  v7 = (void *)v6;
  [v5 setText:v6];
}

@end