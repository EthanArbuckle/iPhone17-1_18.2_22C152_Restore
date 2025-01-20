@interface PKPeerPaymentIntentViewController
- (BOOL)displaysPaymentTransaction;
- (CGSize)_desiredSize;
- (PKPeerPaymentBubbleView)peerPaymentBubbleView;
- (PKPeerPaymentSiriSnippetContentView)snippetContentView;
- (id)localizedPeerPaymentSiriString:(id)a3;
- (void)_configureSnippetContentViewWithCurrency:(id)a3 amount:(id)a4 note:(id)a5 toFieldText:(id)a6 bubbleViewState:(unint64_t)a7 recipient:(id)a8;
- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7;
- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5;
- (void)setPeerPaymentBubbleView:(id)a3;
- (void)setSnippetContentView:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PKPeerPaymentIntentViewController

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentIntentViewController;
  [(PKPeerPaymentIntentViewController *)&v5 viewDidLayoutSubviews];
  snippetContentView = self->_snippetContentView;
  if (snippetContentView)
  {
    v4 = [(PKPeerPaymentIntentViewController *)self view];
    [v4 bounds];
    -[PKPeerPaymentSiriSnippetContentView setFrame:](snippetContentView, "setFrame:");
  }
}

- (BOOL)displaysPaymentTransaction
{
  return 1;
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v14 = [v12 intent];
  v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    id v43 = v17;
    __int16 v44 = 2112;
    id v45 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Configuring view for %{public}@ with parameter key paths: %@", buf, 0x16u);
  }
  if ([v11 count])
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received unexpected parameter render request containing a non-empty parameter set. Displaying generic UI for parameters: %@", buf, 0xCu);
    }
LABEL_6:

    (*((void (**)(id, void, void, CGFloat, CGFloat))v13 + 2))(v13, 0, 0, CGSizeZero.width, CGSizeZero.height);
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = self;
    unint64_t v32 = a6;
    uint64_t v18 = objc_opt_class();
    v35 = NSStringFromSelector("payee");
    v34 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", v18);
    v41[0] = v34;
    uint64_t v19 = objc_opt_class();
    v33 = NSStringFromSelector("currencyAmount");
    v20 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", v19);
    v41[1] = v20;
    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("note");
    v23 = +[INParameter parameterForClass:v21 keyPath:v22];
    v41[2] = v23;
    v24 = +[INParameter parameterForClass:objc_opt_class() keyPath:@"paymentRecord.feeAmount"];
    v41[3] = v24;
    v25 = +[NSArray arrayWithObjects:v41 count:4];

    a6 = v32;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138543618;
        id v43 = v31;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received unexpected intent class: %{public}@. Displaying generic UI for parameters: %@", buf, 0x16u);
      }
      goto LABEL_6;
    }
    v36 = self;
    uint64_t v26 = objc_opt_class();
    v35 = NSStringFromSelector("payer");
    v34 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", v26);
    v40[0] = v34;
    uint64_t v27 = objc_opt_class();
    v33 = NSStringFromSelector("currencyAmount");
    v20 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", v27);
    v40[1] = v20;
    uint64_t v28 = objc_opt_class();
    v22 = NSStringFromSelector("note");
    v23 = +[INParameter parameterForClass:v28 keyPath:v22];
    v40[2] = v23;
    v25 = +[NSArray arrayWithObjects:v40 count:3];
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rendering the primary content view. Telling Siri the following parameters were rendered: %@", buf, 0xCu);
  }

  +[NSSet setWithArray:v25];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100004258;
  v37[3] = &unk_100008258;
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = v13;
  id v29 = v38;
  [(PKPeerPaymentIntentViewController *)v36 configureWithInteraction:v12 context:a6 completion:v37];

LABEL_14:
}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5
{
  v7 = (void (**)(void))a5;
  v8 = [a3 intent];
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuring snippet for intent %@", (uint8_t *)&v24, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    id v11 = [v10 currencyAmount];
    id v12 = [v11 amount];

    id v13 = [v10 currencyAmount];
    v14 = [v13 currencyCode];

    v15 = [v10 note];
    v16 = [v10 payee];
    v17 = [v16 displayName];

    uint64_t v18 = [v10 payee];
    uint64_t v19 = 5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
      uint64_t v18 = 0;
      v14 = 0;
      id v12 = 0;
      v17 = 0;
      goto LABEL_13;
    }
    id v20 = v8;
    uint64_t v21 = [v20 currencyAmount];
    id v12 = [v21 amount];

    v22 = [v20 currencyAmount];
    v14 = [v22 currencyCode];

    v15 = [v20 note];
    v23 = [v20 payer];
    v17 = [v23 displayName];

    uint64_t v18 = [v20 payer];
    uint64_t v19 = 1;
  }

  if (v12)
  {
    if (v14)
    {
      if (v17)
      {
        [(PKPeerPaymentIntentViewController *)self _configureSnippetContentViewWithCurrency:v14 amount:v12 note:v15 toFieldText:v17 bubbleViewState:v19 recipient:v18];
        [(PKPeerPaymentSiriSnippetContentView *)self->_snippetContentView setNeedsLayout];
        if (v7)
        {
          [(PKPeerPaymentIntentViewController *)self _desiredSize];
          v7[2](v7);
        }
      }
    }
  }
LABEL_13:
}

- (CGSize)_desiredSize
{
  v3 = [(PKPeerPaymentIntentViewController *)self extensionContext];
  [v3 hostedViewMaximumAllowedSize];
  double v5 = v4;
  double v7 = v6;

  -[PKPeerPaymentSiriSnippetContentView sizeThatFits:](self->_snippetContentView, "sizeThatFits:", v5, v7);
  double v9 = v8;
  double v11 = v10;
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218240;
    double v16 = v9;
    __int16 v17 = 2048;
    double v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Snippet content view desired size: %.1f x %.1f", (uint8_t *)&v15, 0x16u);
  }

  double v13 = v9;
  double v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureSnippetContentViewWithCurrency:(id)a3 amount:(id)a4 note:(id)a5 toFieldText:(id)a6 bubbleViewState:(unint64_t)a7 recipient:(id)a8
{
  id v28 = a8;
  if (self->_snippetContentView)
  {
    peerPaymentBubbleView = self->_peerPaymentBubbleView;
    id v15 = a6;
    id v16 = a5;
    id v17 = a4;
    id v18 = a3;
    [(PKPeerPaymentBubbleView *)peerPaymentBubbleView setAmount:v17];

    [(PKPeerPaymentBubbleView *)self->_peerPaymentBubbleView setCurrency:v18];
    [(PKPeerPaymentBubbleView *)self->_peerPaymentBubbleView setState:a7];
    [(PKPeerPaymentSiriSnippetContentView *)self->_snippetContentView setToFieldText:v15];

    [(PKPeerPaymentSiriSnippetContentView *)self->_snippetContentView setMemoText:v16];
  }
  else
  {
    id v19 = a6;
    id v20 = a5;
    id v21 = a4;
    id v22 = a3;
    v23 = (PKPeerPaymentBubbleView *)[objc_alloc((Class)PKPeerPaymentBubbleView) initWithAmount:v21 currency:v22 state:a7];

    int v24 = self->_peerPaymentBubbleView;
    self->_peerPaymentBubbleView = v23;

    [(PKPeerPaymentBubbleView *)self->_peerPaymentBubbleView setDisplaysApplePayLogo:1];
    [(PKPeerPaymentBubbleView *)self->_peerPaymentBubbleView setLiveRenderingEnabled:1];
    id v16 = [objc_alloc((Class)PKPeerPaymentMessageBalloonView) initWithBubbleView:self->_peerPaymentBubbleView peerPaymentType:1];
    [v16 setHasTail:0];
    v25 = [[PKPeerPaymentSiriSnippetContentView alloc] initWithBalloonView:v16];
    snippetContentView = self->_snippetContentView;
    self->_snippetContentView = v25;

    [(PKPeerPaymentSiriSnippetContentView *)self->_snippetContentView setToFieldText:v19];
    [(PKPeerPaymentSiriSnippetContentView *)self->_snippetContentView setMemoText:v20];

    [(PKPeerPaymentSiriSnippetContentView *)self->_snippetContentView setRecipient:v28];
    uint64_t v27 = [(PKPeerPaymentIntentViewController *)self view];
    [v27 addSubview:self->_snippetContentView];
  }
}

- (id)localizedPeerPaymentSiriString:(id)a3
{
  id v3 = a3;
  double v4 = PKPassKitBundle();
  double v5 = [v4 assistantUILocalizedStringFromSiriLanguageForKey:v3 table:@"PeerPayment_Localizable"];

  return v5;
}

- (PKPeerPaymentSiriSnippetContentView)snippetContentView
{
  return self->_snippetContentView;
}

- (void)setSnippetContentView:(id)a3
{
}

- (PKPeerPaymentBubbleView)peerPaymentBubbleView
{
  return self->_peerPaymentBubbleView;
}

- (void)setPeerPaymentBubbleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentBubbleView, 0);

  objc_storeStrong((id *)&self->_snippetContentView, 0);
}

@end