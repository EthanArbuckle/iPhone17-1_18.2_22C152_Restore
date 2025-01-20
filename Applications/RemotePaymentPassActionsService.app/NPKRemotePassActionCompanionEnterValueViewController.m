@interface NPKRemotePassActionCompanionEnterValueViewController
+ (id)_fallbackHeaderImageForMessage:(id)a3;
+ (id)_primaryFont;
+ (id)_primaryTextColor;
- (BOOL)_shouldHideNonEssentialUI;
- (CNContact)contact;
- (NPKRemotePassActionCompanionEnterValueViewController)initWithRequest:(id)a3 contact:(id)a4 delegate:(id)a5;
- (NPKRemotePassActionCompanionEnterValueViewControllerDelegate)delegate;
- (NPKRemotePassActionEnterValueRequest)request;
- (id)_contactImageForContact:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_confirmButtonTapped:(id)a3;
- (void)_keyboardWillChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_registerObservers;
- (void)_setUpAppearance;
- (void)_setUpEnterValueViewForBalanceField:(id)a3;
- (void)_setUpNavigationItem;
- (void)_setUpPassView;
- (void)_setUpTitleLabel;
- (void)_updateFirstResponder;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updateViewVisibility;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRightBarButtonEnabled:(BOOL)a3;
- (void)shakeCard;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NPKRemotePassActionCompanionEnterValueViewController

- (NPKRemotePassActionCompanionEnterValueViewController)initWithRequest:(id)a3 contact:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)NPKRemotePassActionCompanionEnterValueViewController;
  v12 = [(NPKRemotePassActionCompanionEnterValueViewController *)&v35 initWithNibName:0 bundle:0];
  if (!v12)
  {
LABEL_12:
    v23 = v12;
    goto LABEL_13;
  }
  v13 = [v9 balanceField];
  v14 = [v13 action];

  if ([v14 type] == (id)1)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeWeak((id *)&v12->_delegate, v11);
    v15 = [v9 image];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [(id)objc_opt_class() _fallbackHeaderImageForMessage:v9];
    }
    v24 = v17;

    v25 = [NPKRemotePassActionPassView alloc];
    v26 = [(NPKRemotePassActionCompanionEnterValueViewController *)v12 view];
    [v26 bounds];
    v27 = -[NPKRemotePassActionPassView initWithPassImage:frame:](v25, "initWithPassImage:frame:", v24);
    passView = v12->_passView;
    v12->_passView = v27;

    v29 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v29;

    v31 = (PKPerformActionEnterValueView *)[objc_alloc((Class)PKPerformActionEnterValueView) initWithPass:0 action:v14 paymentDataProvider:0];
    enterValueView = v12->_enterValueView;
    v12->_enterValueView = v31;

    [(NPKRemotePassActionCompanionEnterValueViewController *)v12 _setUpAppearance];
    [(NPKRemotePassActionCompanionEnterValueViewController *)v12 _setUpPassView];
    [(NPKRemotePassActionCompanionEnterValueViewController *)v12 setContact:v10];
    [(NPKRemotePassActionCompanionEnterValueViewController *)v12 _setUpTitleLabel];
    v33 = [v9 balanceField];
    [(NPKRemotePassActionCompanionEnterValueViewController *)v12 _setUpEnterValueViewForBalanceField:v33];

    [(NPKRemotePassActionCompanionEnterValueViewController *)v12 _registerObservers];
    goto LABEL_12;
  }
  v18 = pk_RemotePassAction_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

  if (v19)
  {
    v20 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      id v22 = [v14 type];
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = v21;
      __int16 v38 = 2112;
      v39 = v14;
      __int16 v40 = 2048;
      id v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error: Fail to init object of class %@ with action: %@ actionType: %lu", buf, 0x20u);
    }
  }
  v23 = 0;
LABEL_13:

  return v23;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NPKRemotePassActionCompanionEnterValueViewController;
  [(NPKRemotePassActionCompanionEnterValueViewController *)&v3 viewDidLoad];
  [(NPKRemotePassActionCompanionEnterValueViewController *)self _setUpNavigationItem];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKRemotePassActionCompanionEnterValueViewController;
  [(NPKRemotePassActionCompanionEnterValueViewController *)&v4 viewDidAppear:a3];
  [(NPKRemotePassActionCompanionEnterValueViewController *)self _updateFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKRemotePassActionCompanionEnterValueViewController;
  [(NPKRemotePassActionCompanionEnterValueViewController *)&v4 viewWillDisappear:a3];
  [(PKPerformActionEnterValueView *)self->_enterValueView willDismissViewController];
}

- (void)viewWillLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)NPKRemotePassActionCompanionEnterValueViewController;
  [(NPKRemotePassActionCompanionEnterValueViewController *)&v27 viewWillLayoutSubviews];
  objc_super v3 = [(NPKRemotePassActionCompanionEnterValueViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v23 = v10;
  [v3 safeAreaInsets];
  double x = v5 + v11 + 10.0;
  double y = v7 + v15;
  double width = v9 - (v11 + 10.0 + v13 + 10.0);
  double height = v23 - (v15 + v12 + CGRectGetHeight(self->_keyboardFrame));
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  -[NPKRemotePassActionPassView sizeThatFits:](self->_passView, "sizeThatFits:", width, height);
  CGFloat v20 = v19;
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  CGRectDivide(v28, &slice, &remainder, v20, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[NPKRemotePassActionPassView setFrame:](self->_passView, "setFrame:");
  if (([(NPKRemotePassActionPassView *)self->_passView isHidden] & 1) == 0)
  {
    double x = remainder.origin.x;
    double y = remainder.origin.y;
    double width = remainder.size.width;
    double height = remainder.size.height;
  }
  memset(&v24, 0, sizeof(v24));
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  CGFloat v22 = v21;
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  CGRectDivide(v29, &v24, &remainder, v22, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  if (([(UILabel *)self->_titleLabel isHidden] & 1) == 0)
  {
    double x = remainder.origin.x;
    double y = remainder.origin.y;
    double width = remainder.size.width;
    double height = remainder.size.height;
  }
  -[PKPerformActionEnterValueView setFrame:](self->_enterValueView, "setFrame:", x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPKRemotePassActionCompanionEnterValueViewController;
  [(NPKRemotePassActionCompanionEnterValueViewController *)&v10 traitCollectionDidChange:v4];
  double v5 = [(NPKRemotePassActionCompanionEnterValueViewController *)self traitCollection];
  id v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    double v7 = [(NPKRemotePassActionCompanionEnterValueViewController *)self traitCollection];
    id v8 = [v7 horizontalSizeClass];
    id v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(NPKRemotePassActionCompanionEnterValueViewController *)self _updateViewVisibility];
LABEL_6:
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
  id v5 = a3;
  id v6 = [(NPKRemotePassActionCompanionEnterValueViewController *)self _contactImageForContact:v5];
  [(NPKRemotePassActionPassView *)self->_passView setContactImage:v6];
}

- (void)_setUpAppearance
{
  id v4 = +[UIColor systemBackgroundColor];
  objc_super v3 = [(NPKRemotePassActionCompanionEnterValueViewController *)self view];
  [v3 setBackgroundColor:v4];
}

- (void)_setUpPassView
{
  if (self->_passView)
  {
    [(NPKRemotePassActionPassView *)self->_passView setHidden:[(NPKRemotePassActionCompanionEnterValueViewController *)self _shouldHideNonEssentialUI]];
    id v3 = [(NPKRemotePassActionCompanionEnterValueViewController *)self view];
    [v3 addSubview:self->_passView];
  }
}

- (void)_setUpTitleLabel
{
  if (self->_titleLabel)
  {
    id v3 = [(id)objc_opt_class() _primaryFont];
    [(UILabel *)self->_titleLabel setFont:v3];

    id v4 = [(id)objc_opt_class() _primaryTextColor];
    [(UILabel *)self->_titleLabel setTextColor:v4];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setNumberOfLines:3];
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_SELECT_RELOAD_AMOUNT_TITLE" value:&stru_100010608 table:@"RemotePaymentPassActionsService"];
    [(UILabel *)self->_titleLabel setText:v6];

    [(UILabel *)self->_titleLabel setHidden:[(NPKRemotePassActionCompanionEnterValueViewController *)self _shouldHideNonEssentialUI]];
    id v7 = [(NPKRemotePassActionCompanionEnterValueViewController *)self view];
    [v7 addSubview:self->_titleLabel];
  }
}

- (void)_setUpEnterValueViewForBalanceField:(id)a3
{
  enterValueView = self->_enterValueView;
  if (enterValueView)
  {
    id v5 = a3;
    [(PKPerformActionEnterValueView *)enterValueView setDelegate:self];
    id v6 = [v5 balance];
    id v7 = [v6 value];
    [(PKPerformActionEnterValueView *)self->_enterValueView setCardBalance:v7];

    id v17 = [v5 action];

    id v8 = [v17 enteredValueItem];
    id v9 = [v8 minLoadAmount];
    [(PKPerformActionEnterValueView *)self->_enterValueView setMinLoadAmount:v9];

    objc_super v10 = [v17 enteredValueItem];
    double v11 = [v10 maxLoadAmount];
    [(PKPerformActionEnterValueView *)self->_enterValueView setMaxLoadAmount:v11];

    double v12 = [v17 enteredValueItem];
    double v13 = [v12 minLoadedBalance];
    [(PKPerformActionEnterValueView *)self->_enterValueView setMinLoadedBalance:v13];

    v14 = [v17 enteredValueItem];
    double v15 = [v14 maxLoadedBalance];
    [(PKPerformActionEnterValueView *)self->_enterValueView setMaxLoadedBalance:v15];

    v16 = [(NPKRemotePassActionCompanionEnterValueViewController *)self view];
    [v16 addSubview:self->_enterValueView];
  }
}

- (void)_setUpNavigationItem
{
  id v15 = [(NPKRemotePassActionCompanionEnterValueViewController *)self navigationItem];
  id v3 = [(NPKRemotePassActionEnterValueRequest *)self->_request balanceField];
  id v4 = [v3 action];
  id v5 = [v4 title];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v8 localizedStringForKey:@"RELOAD_REQUEST_TITLE" value:&stru_100010608 table:@"RemotePaymentPassActionsService"];
  }
  [v15 setTitle:v7];
  id v9 = [(NPKRemotePassActionEnterValueRequest *)self->_request balanceField];
  objc_super v10 = [v9 action];
  double v11 = [v10 confirmationTitle];

  double v12 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:v11 style:0 target:self action:"_confirmButtonTapped:"];
  confirmBarButtonItem = self->_confirmBarButtonItem;
  self->_confirmBarButtonItem = v12;

  [v15 setRightBarButtonItem:self->_confirmBarButtonItem];
  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  [v15 setLeftBarButtonItem:v14];
}

- (void)_registerObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
  [v3 addObserver:self selector:"_keyboardWillChange:" name:UIKeyboardWillChangeFrameNotification object:0];
  [v3 addObserver:self selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)_confirmButtonTapped:(id)a3
{
  id v4 = [(PKPerformActionEnterValueView *)self->_enterValueView transactionAmount];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSDecimalNumber zero];
  }
  id v7 = v6;

  id v8 = [(PKPerformActionEnterValueView *)self->_enterValueView transactionCurrency];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    double v11 = [(NPKRemotePassActionEnterValueRequest *)self->_request balanceField];
    double v12 = [v11 balance];
    id v10 = [v12 currencyCode];
  }
  double v13 = PKCurrencyAmountMake();
  if (v13)
  {
    id v14 = [(NPKRemotePassActionCompanionEnterValueViewController *)self delegate];
    id v15 = [(NPKRemotePassActionEnterValueRequest *)self->_request identifier];
    [v14 enterValueViewController:self didFinishWithCurrencyAmount:v13 forRequestIdentifier:v15];
  }
  else
  {
    v16 = pk_RemotePassAction_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      v18 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412802;
        uint64_t v20 = 0;
        __int16 v21 = 2112;
        CGFloat v22 = v7;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: Unable to identify currency amount! (%@). transactionAmount: %@ currencyCode: %@", (uint8_t *)&v19, 0x20u);
      }
    }
    id v14 = [(NPKRemotePassActionCompanionEnterValueViewController *)self delegate];
    id v15 = [(NPKRemotePassActionEnterValueRequest *)self->_request identifier];
    [v14 enterValueViewController:self didCancelForRequestIdentifier:v15];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  id v5 = [(NPKRemotePassActionCompanionEnterValueViewController *)self delegate];
  id v4 = [(NPKRemotePassActionEnterValueRequest *)self->_request identifier];
  [v5 enterValueViewController:self didCancelForRequestIdentifier:v4];
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:UIKeyboardFrameEndUserInfoKey];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000055C0;
  v7[3] = &unk_100010340;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(NPKRemotePassActionCompanionEnterValueViewController *)self _updateLayoutForKeyboardAction:v7];
}

- (void)_keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    id v4 = [a3 userInfo];
    id v5 = [v4 objectForKey:UIKeyboardFrameEndUserInfoKey];

    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000057CC;
      v6[3] = &unk_100010340;
      v6[4] = self;
      id v7 = v5;
      [(NPKRemotePassActionCompanionEnterValueViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005938;
  v3[3] = &unk_100010368;
  v3[4] = self;
  [(NPKRemotePassActionCompanionEnterValueViewController *)self _updateLayoutForKeyboardAction:v3];
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  if (v4)
  {
    id v5 = [(NPKRemotePassActionCompanionEnterValueViewController *)self viewIfLoaded];
    id v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_100005AA0;
        v7[3] = &unk_100010390;
        id v8 = v6;
        +[UIView _animateUsingDefaultTimingWithOptions:134 animations:v7 completion:0];
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

- (void)_updateFirstResponder
{
  id v2 = [(PKPerformActionEnterValueView *)self->_enterValueView amountTextField];
  [v2 becomeFirstResponder];
}

+ (id)_primaryFont
{
  return (id)_PKRoundedSystemFontOfSizeAndWeight(a1, a2, 36.0, UIFontWeightSemibold);
}

+ (id)_primaryTextColor
{
  return +[UIColor labelColor];
}

+ (id)_fallbackHeaderImageForMessage:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 cardType];
  if (v3 <= 2)
  {
    id v4 = +[UIImage imageNamed:off_1000103F0[v3]];
  }

  return v4;
}

- (id)_contactImageForContact:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() contactImageSize];
  double v5 = v4;
  Class v6 = off_100017238();
  id v7 = [v3 givenName];
  id v8 = [v3 familyName];
  id v9 = [(objc_class *)v6 profilePictureForContact:v3 serverImageData:0 firstName:v7 lastName:v8 diameter:v5];

  if (!v9
    || (+[UIImage imageWithData:v9],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v11 = pk_RemotePassAction_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      double v13 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Warning: No photo data found; falling back to monogram for contact: %@",
          (uint8_t *)&v21,
          0xCu);
      }
    }
    id v14 = (void *)qword_1000174E8;
    if (!qword_1000174E8)
    {
      id v15 = [objc_alloc((Class)CNMonogrammer) initWithStyle:0 diameter:v5];
      v16 = (void *)qword_1000174E8;
      qword_1000174E8 = (uint64_t)v15;

      id v14 = (void *)qword_1000174E8;
    }
    BOOL v17 = [v14 monogramForContact:v3];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(id)qword_1000174E8 silhouetteMonogram];
    }
    id v10 = v19;
  }

  return v10;
}

- (BOOL)_shouldHideNonEssentialUI
{
  if (!PKUIGetMinScreenWidthType()) {
    return 1;
  }
  id v3 = [(NPKRemotePassActionCompanionEnterValueViewController *)self traitCollection];
  BOOL v4 = [v3 verticalSizeClass] == (id)1;

  return v4;
}

- (void)_updateViewVisibility
{
  BOOL v3 = [(NPKRemotePassActionCompanionEnterValueViewController *)self _shouldHideNonEssentialUI];
  if (v3 == [(NPKRemotePassActionPassView *)self->_passView isHidden])
  {
    unsigned int v4 = [(UILabel *)self->_titleLabel isHidden];
    [(NPKRemotePassActionPassView *)self->_passView setHidden:v3];
    [(UILabel *)self->_titleLabel setHidden:v3];
    if (v3 == v4) {
      return;
    }
  }
  else
  {
    [(NPKRemotePassActionPassView *)self->_passView setHidden:v3];
    [(UILabel *)self->_titleLabel setHidden:v3];
  }
  id v5 = [(NPKRemotePassActionCompanionEnterValueViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (void)shakeCard
{
}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
}

- (NPKRemotePassActionEnterValueRequest)request
{
  return self->_request;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NPKRemotePassActionCompanionEnterValueViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPKRemotePassActionCompanionEnterValueViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_confirmBarButtonItem, 0);
  objc_storeStrong((id *)&self->_enterValueView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end