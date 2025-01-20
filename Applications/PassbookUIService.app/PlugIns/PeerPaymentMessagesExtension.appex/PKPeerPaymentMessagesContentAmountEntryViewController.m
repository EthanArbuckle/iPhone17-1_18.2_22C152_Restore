@interface PKPeerPaymentMessagesContentAmountEntryViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)pkui_navigationBarHidden;
- (BOOL)showSendAndRequest;
- (BOOL)showSetupRecurringSend;
- (NSString)memo;
- (PKCurrencyAmount)amount;
- (PKPeerPaymentMessagesContentAmountEntryView)mainView;
- (PKPeerPaymentMessagesContentAmountEntryViewController)init;
- (PKPeerPaymentMessagesContentAmountEntryViewController)initWithMessagesAppController:(id)a3;
- (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate)delegate;
- (id)_currentBalance;
- (id)_maximumTransferAmount;
- (id)_minimumTransferAmount;
- (unint64_t)context;
- (unint64_t)sourceType;
- (void)_noteAmountChanged;
- (void)_registerForPresentationSemanticContextChanges;
- (void)reloadContent;
- (void)sendAnalyticsForAction:(unint64_t)a3;
- (void)setAmount:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMemo:(id)a3;
- (void)setShowSendAndRequest:(BOOL)a3;
- (void)setShowSetupRecurringSend:(BOOL)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPeerPaymentMessagesContentAmountEntryViewController

- (PKPeerPaymentMessagesContentAmountEntryViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v2 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v11 init];
  if (v2)
  {
    v3 = +[NSDecimalNumber one];
    v4 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)v2 _currentBalance];
    uint64_t v5 = [v4 currency];
    v6 = (void *)v5;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    else {
      v7 = @"USD";
    }
    uint64_t v8 = PKCurrencyAmountCreate(v3, &v7->isa, 0);
    amount = v2->_amount;
    v2->_amount = (PKCurrencyAmount *)v8;
  }
  return v2;
}

- (PKPeerPaymentMessagesContentAmountEntryViewController)initWithMessagesAppController:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)&v12 initWithMessagesAppController:a3];
  if (v3)
  {
    v4 = +[NSDecimalNumber one];
    uint64_t v5 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)v3 _currentBalance];
    uint64_t v6 = [v5 currency];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = @"USD";
    }
    uint64_t v9 = PKCurrencyAmountCreate(v4, &v8->isa, 0);
    amount = v3->_amount;
    v3->_amount = (PKCurrencyAmount *)v9;
  }
  return v3;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v41 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryAccessibilityLarge) == NSOrderedDescending;

  uint64_t v5 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  uint64_t v6 = [v5 traitCollection];
  id v7 = [v6 _presentationSemanticContext];

  uint64_t v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v8 setContentAlignment:PKContentAlignmentMake()];
  [v8 setVerticalPadding:0.0];
  [v8 setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [v8 setIgnoreTopSafeArea:v7 == (id)2];
  id v9 = objc_alloc((Class)PKPeerPaymentMessagesContentAmountEntryView);
  [v8 bounds];
  v10 = [v9 initWithFrame:];
  mainView = self->_mainView;
  self->_mainView = v10;

  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setPresentationContext:v7];
  unint64_t context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setSubtitleType:1];
      v13 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView memoField];
      [v13 setText:self->_memo];

      v14 = self->_mainView;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100003D10;
      v38[3] = &unk_1000248A0;
      objc_copyWeak(&v39, &location);
      [(PKPeerPaymentMessagesContentAmountEntryView *)v14 setMemoChangedHandler:v38];
      objc_destroyWeak(&v39);
    }
  }
  else
  {
    [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setSubtitleType:0];
  }
  v15 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v15)
  {
    v16 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v16 _percentExpanded];
LABEL_7:
    double v18 = v17;

    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v18 = 1.0;
  if (WeakRetained)
  {
    v24 = WeakRetained;
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 percentExpanded];
      goto LABEL_7;
    }
  }
LABEL_8:
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setPercentExpanded:v18];
  [v8 addSubview:self->_mainView];
  v19 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  [v19 setAmount:self->_amount];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100003DB4;
  v36[3] = &unk_1000248C8;
  objc_copyWeak(&v37, &location);
  v36[4] = self;
  [v19 setAmountChangedHandler:v36];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100003E84;
  v34[3] = &unk_1000248F0;
  objc_copyWeak(&v35, &location);
  [v19 setAmountTappedHandler:v34];
  v20 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
  v21 = v20;
  if (self->_showSendAndRequest)
  {
    [v20 setLeadingAction:2];
    [v21 setTrailingAction:1];
  }
  if (self->_showSetupRecurringSend) {
    [v21 setCenterAction:7];
  }
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_100003F9C;
  v30 = &unk_100024968;
  objc_copyWeak(&v33, &location);
  v31 = self;
  id v22 = v19;
  id v32 = v22;
  [v21 setActionHandler:&v27];
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _registerForPresentationSemanticContextChanges];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentBaseViewController *)&v5 viewWillAppear:a3];
  v4 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self navigationItem];
  [v4 setBackButtonDisplayMode:2];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v4 viewDidAppear:a3];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsExpansionSupported];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsKeypadSupported];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v6 viewWillLayoutSubviews];
  v3 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  [v4 frame];
  double Height = CGRectGetHeight(v7);

  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setNavigationBarHeight:Height];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsExpansionSupported];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsKeypadSupported];
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v11 viewDidLayoutSubviews];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v3)
  {
    objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v4 _percentExpanded];
LABEL_3:
    double v6 = v5;

    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = 1.0;
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      objc_super v4 = objc_loadWeakRetained((id *)&self->_delegate);
      [v4 percentExpanded];
      goto LABEL_3;
    }
  }
LABEL_4:
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setPercentExpanded:v6];
}

- (void)reloadContent
{
  id v13 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _currentBalance];
  v3 = [v13 amount];
  objc_super v4 = [v13 currency];
  double v5 = PKFormattedCurrencyStringFromNumber();

  double v6 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_SECTION_HEADER_BALANCE_FORMAT", @"%@", v5);
  CGRect v7 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView balanceLabel];
  [v7 setText:v6];

  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsExpansionSupported];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsKeypadSupported];
  uint64_t v8 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  id v9 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _minimumTransferAmount];
  [v8 setMinAmount:v9];

  char v10 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  objc_super v11 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _maximumTransferAmount];
  [v10 setMaxAmount:v11];

  if (+[UIKeyboard isInHardwareKeyboardMode])
  {
    objc_super v12 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
    [v12 becomeFirstResponder];
  }
}

- (void)_noteAmountChanged
{
  v3 = [(PKCurrencyAmount *)self->_amount amount];
  objc_super v4 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _minimumTransferAmount];
  if ([v3 compare:v4] == (id)-1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    double v5 = [(PKCurrencyAmount *)self->_amount amount];
    double v6 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _maximumTransferAmount];
    if ([v5 compare:v6] == (id)1)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = [(PKCurrencyAmount *)self->_amount amount];
      id v9 = +[NSDecimalNumber zero];
      uint64_t v7 = [v8 isEqualToNumber:v9] ^ 1;
    }
  }

  id v10 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
  [v10 setEnabled:v7];
}

- (id)_minimumTransferAmount
{
  v3 = +[NSDecimalNumber zero];
  objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v4)
  {
    double v5 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (!WeakRetained) {
      goto LABEL_6;
    }
    double v5 = objc_loadWeakRetained((id *)p_delegate);
  }
  uint64_t v8 = v5;
  uint64_t v9 = [v5 minimumTransferAmount];

  v3 = (void *)v9;
LABEL_6:

  return v3;
}

- (id)_maximumTransferAmount
{
  v3 = +[NSDecimalNumber zero];
  objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v4)
  {
    double v5 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (!WeakRetained) {
      goto LABEL_6;
    }
    double v5 = objc_loadWeakRetained((id *)p_delegate);
  }
  uint64_t v8 = v5;
  uint64_t v9 = [v5 maximumTransferAmount];

  v3 = (void *)v9;
LABEL_6:

  return v3;
}

- (id)_currentBalance
{
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v3)
  {
    objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (!WeakRetained) {
      goto LABEL_6;
    }
    objc_super v4 = objc_loadWeakRetained((id *)p_delegate);
  }
  uint64_t v7 = v4;
  id WeakRetained = [v4 currentBalance];

LABEL_6:

  return WeakRetained;
}

- (void)sendAnalyticsForAction:(unint64_t)a3
{
  double v5 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  [v5 usedKeypad];
  PKAnalyticsSendEvent();
  if (a3 == 7)
  {
    uint64_t v7 = (id *)&PKAnalyticsReportPeerPaymentSendRecurringButtonTag;
LABEL_6:
    id v6 = *v7;
    goto LABEL_16;
  }
  if (a3 != 2)
  {
    id v6 = 0;
    if (a3 != 1) {
      goto LABEL_16;
    }
    uint64_t v7 = (id *)&PKAnalyticsReportPeerPaymentSendButtonTag;
    goto LABEL_6;
  }
  uint64_t v8 = [v5 amount];
  uint64_t v9 = [v8 amount];

  id v10 = [v5 amount];
  objc_super v11 = [v10 currency];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    v14 = PKAnalyticsAmountCategoryForAmount();
    [v13 setObject:v14 forKey:PKAnalyticsPayloadKeyP2PAmountCategory];

    [v13 setObject:v11 forKey:PKAnalyticsPayloadKeyP2PCurrency];
    unint64_t v15 = self->_sourceType - 1;
    if (v15 > 2) {
      CFStringRef v16 = @"unknown";
    }
    else {
      CFStringRef v16 = off_100024EE8[v15];
    }
    [v13 setObject:v16 forKey:PKAnalyticsPayloadKeyP2PSource];
    PKAnalyticsSendEventWithDailyLimit();
  }
  id v6 = PKAnalyticsReportPeerPaymentRequestButtonTag;

LABEL_16:
  if ([v6 length])
  {
    id v17 = PKAnalyticsReportPeerPaymentP2PContextWallet;
    if (self->_sourceType == 2)
    {
      double v18 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      id v19 = [v18 presentationStyle];

      v20 = (id *)&PKAnalyticsReportPeerPaymentP2PContextMessages;
      if (v19 != (id)1) {
        v20 = (id *)&PKAnalyticsReportPeerPaymentP2PContextMessagesCompact;
      }
      id v21 = *v20;

      id v17 = v21;
    }
    uint64_t v22 = PKAnalyticsSubjectAppleCash;
    v24[0] = PKAnalyticsReportFeatureTypeKey;
    v24[1] = PKAnalyticsReportPageTagKey;
    v25[0] = PKAnalyticsReportPeerPaymentFeatureType;
    v25[1] = PKAnalyticsReportPeerPaymentAmountSelectionPageTag;
    v24[2] = PKAnalyticsReportEventKey;
    v24[3] = PKAnalyticsReportButtonTagKey;
    v24[4] = PKAnalyticsReportPeerPaymentP2PSideKey;
    v24[5] = PKAnalyticsReportPeerPaymentP2PContextKey;
    v25[2] = PKAnalyticsReportEventTypeButtonTap;
    v25[3] = v6;
    v25[4] = PKAnalyticsReportPeerPaymentP2PSideSender;
    v25[5] = v17;
    v23 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];
    +[PKAnalyticsReporter subject:v22 sendEvent:v23];
  }
}

- (void)_registerForPresentationSemanticContextChanges
{
  objc_initWeak(&location, self);
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  uint64_t v9 = objc_opt_class();
  objc_super v4 = +[NSArray arrayWithObjects:&v9 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004F50;
  v6[3] = &unk_100024990;
  objc_copyWeak(&v7, &location);
  id v5 = [v3 registerForTraitChanges:v4 withHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setAmount:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_amount] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    id v5 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
    [v5 setAmount:v6];

    [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _noteAmountChanged];
  }
}

- (void)setShowSendAndRequest:(BOOL)a3
{
  if (self->_showSendAndRequest != a3)
  {
    BOOL v3 = a3;
    self->_showSendAndRequest = a3;
    objc_super v4 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    [v4 setLeadingAction:v5];
    [v6 setTrailingAction:v3];
  }
}

- (void)setShowSetupRecurringSend:(BOOL)a3
{
  if (self->_showSetupRecurringSend != a3)
  {
    BOOL v3 = a3;
    self->_showSetupRecurringSend = a3;
    objc_super v4 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 7;
    }
    else {
      uint64_t v5 = 0;
    }
    [v4 setCenterAction:v5];
  }
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v2 = 1;
  int64_t v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_unint64_t context = a3;
}

- (BOOL)showSendAndRequest
{
  return self->_showSendAndRequest;
}

- (BOOL)showSetupRecurringSend
{
  return self->_showSetupRecurringSend;
}

- (PKPeerPaymentMessagesContentAmountEntryView)mainView
{
  return self->_mainView;
}

- (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainView, 0);
  objc_storeStrong((id *)&self->_memo, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

@end