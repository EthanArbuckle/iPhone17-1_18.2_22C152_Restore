@interface NPKRemotePassActionCompanionBubbleViewController
+ (id)_cardArtImageForMessage:(id)a3;
+ (id)_fallbackHeaderImageForMessage:(id)a3;
+ (id)_makeViewModelForMessage:(id)a3;
- (CGSize)suggestedViewSizeThatFits:(CGSize)a3;
- (CGSize)suggestedViewSizeThatFits:(CGSize)a3 message:(id)a4;
- (NPKRemotePassActionCompanionBubbleViewController)initWithMessage:(id)a3 delegate:(id)a4;
- (void)_setUpMessageBubbleForMessage:(id)a3;
- (void)_updateMessageBubbleForMessage:(id)a3;
- (void)remotePassActionRequestBubbleContentViewDidReceiveTap:(id)a3;
- (void)viewDidLoad;
@end

@implementation NPKRemotePassActionCompanionBubbleViewController

- (NPKRemotePassActionCompanionBubbleViewController)initWithMessage:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NPKRemotePassActionCompanionBubbleViewController;
  v9 = [(NPKRemotePassActionCompanionBubbleViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = [[NPKRemotePassActionCompanionBubbleContentView alloc] initWithDelegate:v10];
    bubbleContentView = v10->_bubbleContentView;
    v10->_bubbleContentView = v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NPKRemotePassActionCompanionBubbleViewController;
  [(NPKRemotePassActionCompanionBubbleViewController *)&v5 viewDidLoad];
  [(NPKRemotePassActionCompanionBubbleViewController *)self _setUpMessageBubbleForMessage:self->_message];
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView backgroundColor];
  v4 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (CGSize)suggestedViewSizeThatFits:(CGSize)a3
{
  -[NPKRemotePassActionCompanionBubbleViewController suggestedViewSizeThatFits:message:](self, "suggestedViewSizeThatFits:message:", self->_message, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)suggestedViewSizeThatFits:(CGSize)a3 message:(id)a4
{
  double height = a3.height;
  double v5 = fmin(a3.width, 230.0);
  id v6 = a4;
  id v7 = [(id)objc_opt_class() _makeViewModelForMessage:v6];

  +[NPKRemotePassActionCompanionBubbleContentView contentViewHeightForViewModel:v7 withWidth:v5];
  double v9 = fmin(v8, height);
  if (v9 < 0.0)
  {
    v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136446722;
        v16 = "-[NPKRemotePassActionCompanionBubbleViewController suggestedViewSizeThatFits:message:]";
        __int16 v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/RemotePaymentPassActionsCompanionMessagesExtension/NPKR"
              "emotePassActionCompanionBubbleViewController.m";
        __int16 v19 = 2048;
        uint64_t v20 = 82;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Expected the content height to be a positive number!)", (uint8_t *)&v15, 0x20u);
      }
    }
    _NPKAssertAbort();
  }

  double v13 = v5 + 0.0;
  double v14 = v9 + 0.0;
  result.double height = v14;
  result.width = v13;
  return result;
}

+ (id)_makeViewModelForMessage:(id)a3
{
  id v4 = a3;
  double v5 = [v4 remotePassAction];
  id v6 = [a1 _cardArtImageForMessage:v5];
  if ([v5 isResponse])
  {
    id v7 = [NPKRemotePassActionCompanionBubbleContentViewModel alloc];
    double v8 = [v5 passLocalizedDescription];
    double v9 = [v5 caption];
    v10 = [(NPKRemotePassActionCompanionBubbleContentViewModel *)v7 initWithCardArtImage:v6 shouldDimPass:0 titleText:v8 detailText:v9 actionButtonText:0 showsActionButton:0];
  }
  else
  {
    if (([v5 supportsTopUp] & 1) != 0
      || [v5 supportsCommutePlanRenewal])
    {
      double v8 = [v4 request];
      BOOL v11 = [NPKRemotePassActionCompanionBubbleContentViewModel alloc];
      double v9 = [v8 caption];
      v12 = [v8 actionText];
      uint64_t v13 = [v4 isFromMe] ^ 1;
      double v14 = v11;
      int v15 = v6;
      v16 = v9;
    }
    else
    {
      __int16 v17 = [NPKRemotePassActionCompanionBubbleContentViewModel alloc];
      double v8 = [v5 caption];
      double v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NanoPassKit"];
      v12 = [v9 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_UPDATE_CAPTION" value:&stru_100014798 table:@"NanoPassKit-RemotePaymentPassAction"];
      uint64_t v13 = [v4 isFromMe] ^ 1;
      double v14 = v17;
      int v15 = v6;
      v16 = v8;
    }
    v10 = [(NPKRemotePassActionCompanionBubbleContentViewModel *)v14 initWithCardArtImage:v15 shouldDimPass:0 titleText:v16 detailText:0 actionButtonText:v12 showsActionButton:v13];
  }

  return v10;
}

+ (id)_cardArtImageForMessage:(id)a3
{
  id v4 = a3;
  double v5 = [v4 image];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 _fallbackHeaderImageForMessage:v4];
  }
  double v8 = v7;

  return v8;
}

+ (id)_fallbackHeaderImageForMessage:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 cardType];
  if (v3 <= 2)
  {
    id v4 = +[UIImage imageNamed:off_1000144F8[v3]];
  }

  return v4;
}

- (void)_setUpMessageBubbleForMessage:(id)a3
{
  id v4 = a3;
  if (self->_bubbleContentView)
  {
    double v5 = [(id)objc_opt_class() _makeViewModelForMessage:v4];
    [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView setViewModel:v5];

    unsigned int v6 = [v4 isFromMe];
    if (v6) {
      double v7 = -6.0;
    }
    else {
      double v7 = 0.0;
    }
    if (v6) {
      double v8 = 0.0;
    }
    else {
      double v8 = 6.0;
    }
    double v9 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
    [v9 addSubview:self->_bubbleContentView];

    v27 = [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView topAnchor];
    v30 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
    v29 = [v30 topAnchor];
    v28 = [v27 constraintEqualToAnchor:v29 constant:0.0];
    v34[0] = v28;
    v25 = [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView bottomAnchor];
    v26 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
    v24 = [v26 bottomAnchor];
    v10 = [v25 constraintEqualToAnchor:v24 constant:0.0];
    v34[1] = v10;
    BOOL v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView leadingAnchor];
    [(NPKRemotePassActionCompanionBubbleViewController *)self view];
    v12 = id v31 = v4;
    uint64_t v13 = [v12 leadingAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13 constant:v8];
    v34[2] = v14;
    int v15 = [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView trailingAnchor];
    v16 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
    __int16 v17 = [v16 trailingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17 constant:v7];
    v34[3] = v18;
    __int16 v19 = +[NSArray arrayWithObjects:v34 count:4];
    +[NSLayoutConstraint activateConstraints:v19];

    id v4 = v31;
    uint64_t v20 = v27;
  }
  else
  {
    v21 = pk_RemotePassAction_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (!v22) {
      goto LABEL_10;
    }
    uint64_t v20 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      bubbleContentView = self->_bubbleContentView;
      *(_DWORD *)buf = 138412290;
      v33 = bubbleContentView;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Warning: Unable to set up message bubble for nil message view! messageView: %@", buf, 0xCu);
    }
  }

LABEL_10:
}

- (void)_updateMessageBubbleForMessage:(id)a3
{
  id v4 = a3;
  double v5 = [(id)objc_opt_class() _makeViewModelForMessage:v4];

  [(NPKRemotePassActionCompanionBubbleContentView *)self->_bubbleContentView setViewModel:v5];
  unsigned int v6 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
  [v6 setNeedsLayout];

  id v7 = [(NPKRemotePassActionCompanionBubbleViewController *)self view];
  [v7 layoutIfNeeded];
}

- (void)remotePassActionRequestBubbleContentViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  double v5 = pk_RemotePassAction_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      message = self->_message;
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = message;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Bubble view: %@ did receive tap for message: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    BOOL v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 remotePassActionRequestBubbleViewController:self didTapMessage:self->_message];
  }
  else
  {
    v12 = pk_RemotePassAction_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (!v13) {
      goto LABEL_8;
    }
    BOOL v11 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_loadWeakRetained((id *)p_delegate);
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Warning: Unable to handle tap. Did you forget to set the delegate? delegate: %@", (uint8_t *)&v15, 0xCu);
    }
  }

LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_message, 0);
}

@end