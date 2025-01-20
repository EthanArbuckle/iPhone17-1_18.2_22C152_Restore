@interface PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController
- (void)reloadContent;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController;
  [(PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController *)&v8 viewDidLoad];
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
  id v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v2 = [v4 label];
  v3 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE");
  [v2 setText:v3];
}

@end