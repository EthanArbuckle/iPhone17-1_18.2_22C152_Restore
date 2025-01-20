@interface NPKRemotePassActionCompanionItemSelectionViewController
+ (id)_fallbackHeaderImageForMessage:(id)a3;
+ (id)_makeSelectItemViewForAction:(id)a3;
+ (id)_primaryFont;
+ (id)_primaryTextColor;
- (BOOL)_shouldHideNonEssentialUI;
- (CNContact)contact;
- (NPKRemotePassActionCompanionItemSelectionViewController)initWithRequest:(id)a3 contact:(id)a4 delegate:(id)a5;
- (NPKRemotePassActionCompanionItemSelectionViewControllerDelegate)delegate;
- (NPKRemotePassActionSelectItemRequest)request;
- (id)_action;
- (id)_contactImageForContact:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_confirmButtonTapped:(id)a3;
- (void)_fetchRemoteContentIfNeeded;
- (void)_reloadSelectItemView;
- (void)_setUpAppearance;
- (void)_setUpNavigationItem;
- (void)_setUpPassView;
- (void)_setUpSelectItemViewForCommutePlanField:(id)a3;
- (void)_setUpTitleLabel;
- (void)_showGenericErrorAlert:(id)a3;
- (void)_showLoadingView:(BOOL)a3;
- (void)_updateViewVisibility;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRightBarButtonEnabled:(BOOL)a3;
- (void)shakeCard;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NPKRemotePassActionCompanionItemSelectionViewController

- (NPKRemotePassActionCompanionItemSelectionViewController)initWithRequest:(id)a3 contact:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)NPKRemotePassActionCompanionItemSelectionViewController;
  v12 = [(NPKRemotePassActionCompanionItemSelectionViewController *)&v34 initWithNibName:0 bundle:0];
  if (!v12)
  {
LABEL_12:
    v22 = v12;
    goto LABEL_13;
  }
  v13 = [v9 action];
  if ([v13 type] == (id)2)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeWeak((id *)&v12->_delegate, v11);
    v14 = [v9 image];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [(id)objc_opt_class() _fallbackHeaderImageForMessage:v9];
    }
    v23 = v16;

    v24 = [NPKRemotePassActionPassView alloc];
    v25 = [(NPKRemotePassActionCompanionItemSelectionViewController *)v12 view];
    [v25 bounds];
    v26 = -[NPKRemotePassActionPassView initWithPassImage:frame:](v24, "initWithPassImage:frame:", v23);
    passView = v12->_passView;
    v12->_passView = v26;

    v28 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v28;

    uint64_t v30 = [(id)objc_opt_class() _makeSelectItemViewForAction:v13];
    selectItemView = v12->_selectItemView;
    v12->_selectItemView = (PKPerformActionSelectItemView *)v30;

    [(NPKRemotePassActionCompanionItemSelectionViewController *)v12 _setUpAppearance];
    [(NPKRemotePassActionCompanionItemSelectionViewController *)v12 _setUpPassView];
    [(NPKRemotePassActionCompanionItemSelectionViewController *)v12 setContact:v10];
    [(NPKRemotePassActionCompanionItemSelectionViewController *)v12 _setUpTitleLabel];
    v32 = [v9 commutePlanField];
    [(NPKRemotePassActionCompanionItemSelectionViewController *)v12 _setUpSelectItemViewForCommutePlanField:v32];

    goto LABEL_12;
  }
  v17 = pk_RemotePassAction_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

  if (v18)
  {
    v19 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      id v21 = [v13 type];
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      v38 = v13;
      __int16 v39 = 2048;
      id v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error: Fail to init object of class %@ with action: %@ actionType: %lu", buf, 0x20u);
    }
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NPKRemotePassActionCompanionItemSelectionViewController;
  [(NPKRemotePassActionCompanionItemSelectionViewController *)&v3 viewDidLoad];
  [(NPKRemotePassActionCompanionItemSelectionViewController *)self _setUpNavigationItem];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKRemotePassActionCompanionItemSelectionViewController;
  [(NPKRemotePassActionCompanionItemSelectionViewController *)&v4 viewWillAppear:a3];
  [(NPKRemotePassActionCompanionItemSelectionViewController *)self _fetchRemoteContentIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)NPKRemotePassActionCompanionItemSelectionViewController;
  [(NPKRemotePassActionCompanionItemSelectionViewController *)&v28 viewWillLayoutSubviews];
  objc_super v3 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12 + 10.0;
  double x = v5 + v13;
  double y = v7 + v16;
  double width = v9 - (v13 + v14 + 10.0);
  double height = v11 - (v16 + v19);
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  -[NPKRemotePassActionPassView sizeThatFits:](self->_passView, "sizeThatFits:", width, height);
  CGFloat v22 = v21;
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  CGRectDivide(v29, &slice, &remainder, v22, CGRectMinYEdge);
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
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height, 0, 0, 0, 0);
  CGFloat v24 = v23;
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGRectDivide(v30, &v25, &remainder, v24, CGRectMinYEdge);
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
  -[PKPerformActionSelectItemView setFrame:](self->_selectItemView, "setFrame:", x, y, width, height);
  -[PKPerformActionLoadingView setFrame:](self->_loadingView, "setFrame:", x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPKRemotePassActionCompanionItemSelectionViewController;
  [(NPKRemotePassActionCompanionItemSelectionViewController *)&v10 traitCollectionDidChange:v4];
  double v5 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self traitCollection];
  id v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    double v7 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self traitCollection];
    id v8 = [v7 horizontalSizeClass];
    id v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(NPKRemotePassActionCompanionItemSelectionViewController *)self _updateViewVisibility];
LABEL_6:
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
  id v5 = a3;
  id v6 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self _contactImageForContact:v5];
  [(NPKRemotePassActionPassView *)self->_passView setContactImage:v6];
}

- (void)_setUpAppearance
{
  id v4 = +[UIColor systemBackgroundColor];
  objc_super v3 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
  [v3 setBackgroundColor:v4];
}

- (void)_setUpNavigationItem
{
  id v13 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self navigationItem];
  objc_super v3 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
  id v4 = [v3 title];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v7 localizedStringForKey:@"RENEW_REQUEST_TITLE" value:&stru_100010608 table:@"RemotePaymentPassActionsService"];
  }
  [v13 setTitle:v6];
  id v8 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
  id v9 = [v8 confirmationTitle];

  objc_super v10 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:v9 style:0 target:self action:"_confirmButtonTapped:"];
  confirmBarButtonItem = self->_confirmBarButtonItem;
  self->_confirmBarButtonItem = v10;

  [v13 setRightBarButtonItem:self->_confirmBarButtonItem];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  [v13 setLeftBarButtonItem:v12];
}

- (void)_setUpPassView
{
  if (self->_passView)
  {
    [(NPKRemotePassActionPassView *)self->_passView setHidden:[(NPKRemotePassActionCompanionItemSelectionViewController *)self _shouldHideNonEssentialUI]];
    id v3 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
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
    id v5 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
    id v6 = [v5 title];
    [(UILabel *)self->_titleLabel setText:v6];

    [(UILabel *)self->_titleLabel setHidden:[(NPKRemotePassActionCompanionItemSelectionViewController *)self _shouldHideNonEssentialUI]];
    id v7 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
    [v7 addSubview:self->_titleLabel];
  }
}

- (void)_setUpSelectItemViewForCommutePlanField:(id)a3
{
  selectItemView = self->_selectItemView;
  if (selectItemView)
  {
    [(PKPerformActionSelectItemView *)selectItemView setDelegate:self];
    id v5 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
    [v5 addSubview:self->_selectItemView];
  }
}

+ (id)_makeSelectItemViewForAction:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)PKPerformActionSelectItemView) initWithPass:0 action:v3 paymentDataProvider:0];

  return v4;
}

- (void)_confirmButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPerformActionSelectItemView *)self->_selectItemView transactionAmount];
  id v6 = [(PKPerformActionSelectItemView *)self->_selectItemView transactionCurrency];
  id v7 = PKCurrencyAmountMake();

  objc_initWeak(&location, self);
  selectItemView = self->_selectItemView;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006D98;
  v10[3] = &unk_100010438;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(PKPerformActionSelectItemView *)selectItemView fetchServiceProviderDataWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_cancelButtonTapped:(id)a3
{
  id v5 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self delegate];
  id v4 = [(NPKRemotePassActionSelectItemRequest *)self->_request identifier];
  [v5 selectItemViewController:self didCancelForRequestIdentifier:v4];
}

- (id)_action
{
  id v3 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
  id v4 = [v3 remoteContentConfiguration];

  if (v4 && (remoteAction = self->_remoteAction) != 0)
  {
    id v6 = remoteAction;
  }
  else
  {
    id v6 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
  }

  return v6;
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
  id v3 = [a3 cardType];
  if ((unint64_t)v3 <= 2)
  {
    id v4 = +[UIImage imageNamed:*(&off_1000104F0 + (void)v3)];
  }

  return v4;
}

- (id)_contactImageForContact:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() contactImageSize];
  double v5 = v4;
  Class v6 = off_100017360();
  id v7 = [v3 givenName];
  id v8 = [v3 familyName];
  id v9 = [(objc_class *)v6 profilePictureForContact:v3 serverImageData:0 firstName:v7 lastName:v8 diameter:v5];

  if (!v9
    || (+[UIImage imageWithData:v9],
        (objc_super v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v11 = pk_RemotePassAction_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      id v13 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Warning: No photo data found; falling back to monogram for contact: %@",
          (uint8_t *)&v21,
          0xCu);
      }
    }
    double v14 = (void *)qword_100017508;
    if (!qword_100017508)
    {
      id v15 = [objc_alloc((Class)CNMonogrammer) initWithStyle:0 diameter:v5];
      double v16 = (void *)qword_100017508;
      qword_100017508 = (uint64_t)v15;

      double v14 = (void *)qword_100017508;
    }
    v17 = [v14 monogramForContact:v3];
    BOOL v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(id)qword_100017508 silhouetteMonogram];
    }
    objc_super v10 = v19;
  }

  return v10;
}

- (BOOL)_shouldHideNonEssentialUI
{
  if (!PKUIGetMinScreenWidthType()) {
    return 1;
  }
  id v3 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self traitCollection];
  BOOL v4 = [v3 verticalSizeClass] == (id)1;

  return v4;
}

- (void)_updateViewVisibility
{
  BOOL v3 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self _shouldHideNonEssentialUI];
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
  id v5 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (void)_fetchRemoteContentIfNeeded
{
  id v25 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
  BOOL v3 = [v25 remoteContentConfiguration];
  if (v3)
  {
    remoteAction = self->_remoteAction;

    if (remoteAction) {
      return;
    }
    id v5 = pk_RemotePassAction_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = (uint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fetching remote content for action %@", buf, 0xCu);
      }
    }
    id v9 = +[PKPaymentWebService sharedService];
    if ([v9 needsRegistration])
    {
      objc_super v10 = pk_RemotePassAction_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        BOOL v12 = pk_RemotePassAction_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: Web service needs registration", buf, 2u);
        }
      }
    }
    id v13 = [(NPKRemotePassActionSelectItemRequest *)self->_request deviceIdentifier];
    double v14 = [(NPKRemotePassActionSelectItemRequest *)self->_request passTypeIdentifier];
    uint64_t v15 = [(NPKRemotePassActionSelectItemRequest *)self->_request passSerialNumber];
    double v16 = (void *)v15;
    if (v13 && v14 && v15)
    {
      [(NPKRemotePassActionCompanionItemSelectionViewController *)self _showLoadingView:1];
      v17 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100007850;
      v26[3] = &unk_100010488;
      v26[4] = self;
      [v9 passActionWithRemoteContentPassAction:v17 forDeviceIdentifier:v13 passTypeIdentifier:v14 passSerialNumber:v16 completion:v26];
    }
    else
    {
      BOOL v18 = pk_RemotePassAction_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (!v19)
      {
LABEL_31:

        return;
      }
      v17 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
        int v21 = (void *)v20;
        CFStringRef v22 = @"NO";
        if (v13) {
          CFStringRef v23 = @"YES";
        }
        else {
          CFStringRef v23 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        uint64_t v28 = v20;
        if (v14) {
          CFStringRef v24 = @"YES";
        }
        else {
          CFStringRef v24 = @"NO";
        }
        CFStringRef v30 = v23;
        __int16 v29 = 2112;
        __int16 v31 = 2112;
        if (v16) {
          CFStringRef v22 = @"YES";
        }
        CFStringRef v32 = v24;
        __int16 v33 = 2112;
        CFStringRef v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error: Unable to load remote content for action %@! Remote content needed, but insufficient information exists to obtain it.\nHas deviceID? %@.\nHas passTypeIdentifier? %@.\nHas passSerialNumber? %@", buf, 0x2Au);
      }
    }

    goto LABEL_31;
  }
}

- (void)_showLoadingView:(BOOL)a3
{
  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView)
    {
      id v5 = objc_alloc((Class)PKPerformActionLoadingView);
      [(PKPerformActionSelectItemView *)self->_selectItemView frame];
      BOOL v6 = (PKPerformActionLoadingView *)[v5 initWithFrame:];
      id v7 = self->_loadingView;
      self->_loadingView = v6;
    }
    id v8 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
    [v8 addSubview:self->_loadingView];

    [(PKPerformActionSelectItemView *)self->_selectItemView setDelegate:0];
    [(PKPerformActionSelectItemView *)self->_selectItemView removeFromSuperview];
    selectItemView = self->_selectItemView;
    self->_selectItemView = 0;
  }
  else
  {
    [(PKPerformActionLoadingView *)loadingView removeFromSuperview];
  }
}

- (void)_reloadSelectItemView
{
  [(PKPerformActionSelectItemView *)self->_selectItemView setDelegate:0];
  [(PKPerformActionSelectItemView *)self->_selectItemView removeFromSuperview];
  BOOL v3 = objc_opt_class();
  unsigned int v4 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self _action];
  id v5 = [v3 _makeSelectItemViewForAction:v4];
  selectItemView = self->_selectItemView;
  self->_selectItemView = v5;

  [(PKPerformActionSelectItemView *)self->_selectItemView setDelegate:self];
  id v7 = [(NPKRemotePassActionCompanionItemSelectionViewController *)self view];
  [v7 insertSubview:self->_selectItemView belowSubview:self->_passView];
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemotePassActionSelectItemRequest *)self->_request action];
  BOOL v6 = +[PKPaymentPass displayableErrorForAction:v5 andReason:1];

  id v7 = [v6 localizedDescription];
  id v8 = [v6 localizedRecoverySuggestion];
  id v9 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  objc_super v10 = PKLocalizedPaymentString(@"PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007DC4;
  v13[3] = &unk_1000104B0;
  id v14 = v4;
  id v11 = v4;
  BOOL v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v13];
  [v9 addAction:v12];

  [(NPKRemotePassActionCompanionItemSelectionViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)shakeCard
{
}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
}

- (NPKRemotePassActionSelectItemRequest)request
{
  return self->_request;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NPKRemotePassActionCompanionItemSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPKRemotePassActionCompanionItemSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_remoteAction, 0);
  objc_storeStrong((id *)&self->_confirmBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectItemView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end