@interface NPKRemotePassActionCompanionMessagesAppViewController
- (BOOL)_canRequestRemoteActionBePerformed:(id)a3 outError:(id *)a4;
- (BOOL)_isGroupConversation:(id)a3;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (NPKRemotePassActionUIService)remotePassUIService;
- (id)_genericErrorForAction:(id)a3;
- (id)_genericErrorTitleForAction:(id)a3;
- (id)_serviceProviderPaymentRequestForEnteredValueAmount:(id)a3 recipientName:(id)a4 organization:(id)a5 action:(id)a6 forLocalizedPassName:(id)a7;
- (id)_serviceProviderPaymentRequestForSelectedItemWithServiceProviderData:(id)a3 amount:(id)a4 recipientName:(id)a5 organization:(id)a6 action:(id)a7 forLocalizedPassName:(id)a8;
- (id)_serviceProviderPaymentRequestForServiceProviderData:(id)a3 action:(id)a4 amount:(id)a5 summaryItems:(id)a6;
- (id)_viewControllerForPresentationStyle:(unint64_t)a3 withConversation:(id)a4;
- (id)_viewControllerForTranscriptPresentationStyleWithConversation:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_contactForConversation:(id)a3 completion:(id)a4;
- (void)_insertResponse:(id)a3 toRequest:(id)a4 withCompletion:(id)a5;
- (void)_insertResponseToRequest:(id)a3 forRenewalAmount:(id)a4 serviceProviderData:(id)a5 withCompletion:(id)a6;
- (void)_insertResponseToRequest:(id)a3 forTopUpAmount:(id)a4 withCompletion:(id)a5;
- (void)_presentAlertWithDisplayableError:(id)a3;
- (void)_presentAlertWithDisplayableError:(id)a3 actionButtonTitle:(id)a4 actionHandler:(id)a5 showsConfirmButton:(BOOL)a6;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 actionButtonTitle:(id)a5 actionButtonHandler:(id)a6 confirmButtonTitle:(id)a7;
- (void)_presentPaymentSheetForPaymentRequest:(id)a3 withCompletion:(id)a4;
- (void)_removeAllChildViewControllers;
- (void)_requestResizeIfNeeded;
- (void)_restoreRequestDataURLForResponseMessage:(id)a3 toMatchRequest:(id)a4;
- (void)_showViewController:(id)a3;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)remotePassActionRequestBubbleViewController:(id)a3 didTapMessage:(id)a4;
- (void)remotePassActionUIService:(id)a3 didCancelForRequestIdentifier:(id)a4;
- (void)remotePassActionUIService:(id)a3 didSelectEnteredValueAmount:(id)a4 forRequestIdentifier:(id)a5;
- (void)remotePassActionUIService:(id)a3 didSelectItemForRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestIdentifier:(id)a6;
- (void)requestPresentationStyle:(unint64_t)a3;
- (void)setRemotePassUIService:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation NPKRemotePassActionCompanionMessagesAppViewController

- (void)didBecomeActiveWithConversation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NPKRemotePassActionCompanionMessagesAppViewController;
  id v4 = a3;
  [(NPKRemotePassActionCompanionMessagesAppViewController *)&v6 didBecomeActiveWithConversation:v4];
  [(NPKRemotePassActionCompanionMessagesAppViewController *)self _removeAllChildViewControllers];
  v5 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _viewControllerForPresentationStyle:[(NPKRemotePassActionCompanionMessagesAppViewController *)self presentationStyle] withConversation:v4];

  if (v5)
  {
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _showViewController:v5];
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _requestResizeIfNeeded];
  }
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKRemotePassActionCompanionMessagesAppViewController;
  -[NPKRemotePassActionCompanionMessagesAppViewController willTransitionToPresentationStyle:](&v5, "willTransitionToPresentationStyle:");
  if (!a3) {
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self resignFirstResponder];
  }
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKRemotePassActionCompanionMessagesAppViewController;
  -[NPKRemotePassActionCompanionMessagesAppViewController didTransitionToPresentationStyle:](&v5, "didTransitionToPresentationStyle:");
  if (!a3) {
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self dismiss];
  }
}

- (void)requestPresentationStyle:(unint64_t)a3
{
  objc_super v5 = pk_RemotePassAction_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested transition to presentation style:%lu", buf, 0xCu);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)NPKRemotePassActionCompanionMessagesAppViewController;
  [(NPKRemotePassActionCompanionMessagesAppViewController *)&v8 requestPresentationStyle:a3];
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = pk_RemotePassAction_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    objc_super v8 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v21 = width;
      __int16 v22 = 2048;
      double v23 = height;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Requesting content size that fits w:%f, h:%f", buf, 0x16u);
    }
  }
  bubbleViewController = self->_bubbleViewController;
  if (bubbleViewController)
  {
    -[NPKRemotePassActionCompanionBubbleViewController suggestedViewSizeThatFits:](bubbleViewController, "suggestedViewSizeThatFits:", width, height);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NPKRemotePassActionCompanionMessagesAppViewController;
    -[NPKRemotePassActionCompanionMessagesAppViewController contentSizeThatFits:](&v19, "contentSizeThatFits:", width, height);
  }
  double v12 = v10;
  double v13 = v11;
  v14 = pk_RemotePassAction_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    v16 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v21 = v12;
      __int16 v22 = 2048;
      double v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Returning size w:%f, h:%f", buf, 0x16u);
    }
  }
  double v17 = v12;
  double v18 = v13;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  double v12 = pk_RemotePassAction_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    v14 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_retainBlock(v11);
      *(_DWORD *)buf = 138412546;
      id v69 = v9;
      __int16 v70 = 2112;
      id v71 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Validating message %@ for sending with completion %@", buf, 0x16u);
    }
  }
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100008398;
  v65[3] = &unk_100014520;
  v65[4] = self;
  id v16 = v9;
  id v66 = v16;
  id v17 = v11;
  id v67 = v17;
  double v18 = objc_retainBlock(v65);
  objc_super v19 = [v16 response];
  v20 = +[NPKRemotePassActionCompanionConversationManager sharedInstance];
  double v21 = [v19 identifier];
  __int16 v22 = [v20 requestForIdentifier:v21];

  double v23 = [v22 action];
  if ((PKiMessageIsActive() & 1) == 0)
  {
    v37 = v18;
    id v59 = v16;
    v24 = v22;
    v25 = v19;
    id v26 = v17;
    id v27 = v10;
    v38 = pk_RemotePassAction_log();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);

    if (v39)
    {
      v40 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Notice: iMessage is disabled", buf, 2u);
      }
    }
    v41 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorTitleForAction:v23];
    v42 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    [v42 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_IMESSAGE_DISABLED_MESSAGE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    v44 = v43 = v23;
    v35 = NPKDisplayableError();

    v36 = v43;
    double v18 = v37;
    ((void (*)(void *, void, void, void *))v37[2])(v37, 0, 0, v35);
    goto LABEL_17;
  }
  if ([(NPKRemotePassActionCompanionMessagesAppViewController *)self _isGroupConversation:v10])
  {
    id v59 = v16;
    v24 = v22;
    v25 = v19;
    id v26 = v17;
    id v27 = v10;
    pk_RemotePassAction_log();
    v29 = v28 = v23;
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      v31 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Notice: Family top-up is not available in group conversations", buf, 2u);
      }
    }
    v32 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorTitleForAction:v28];
    v33 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    v34 = [v33 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_INVALID_GROUP_MESSAGE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    v35 = NPKDisplayableError();

    v36 = v28;
    ((void (*)(void *, void, void, void *))v18[2])(v18, 0, 0, v35);
LABEL_17:
    id v10 = v27;
    id v17 = v26;
    objc_super v19 = v25;
    __int16 v22 = v24;
    id v16 = v59;
    goto LABEL_18;
  }
  if (v23)
  {
    id v58 = v10;
    [v23 serviceProviderAcceptedNetworks];
    v46 = v45 = v23;
    v47 = [v45 serviceProviderSupportedCountries];
    [v45 serviceProviderCapabilities];
    int PaymentsUsingNetworksIssuerCountryCodesWithCapabilities = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilities();

    if (PaymentsUsingNetworksIssuerCountryCodesWithCapabilities)
    {
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100008498;
      v60[3] = &unk_100014548;
      id v61 = v22;
      v62 = self;
      id v63 = v19;
      v64 = v18;
      id v10 = v58;
      [(NPKRemotePassActionCompanionMessagesAppViewController *)self _contactForConversation:v58 completion:v60];

      v35 = v61;
      v36 = v45;
    }
    else
    {
      v52 = pk_RemotePassAction_log();
      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

      if (v53)
      {
        v54 = pk_RemotePassAction_log();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Error: Device is unable to make payments!", buf, 2u);
        }
      }
      v55 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorTitleForAction:v45];
      v56 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
      v57 = [v56 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_NO_CARDS_MESSAGE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
      v35 = NPKDisplayableError();

      v36 = v45;
      ((void (*)(void *, void, void, void *))v18[2])(v18, 0, 0, v35);
      id v10 = v58;
    }
  }
  else
  {
    v49 = pk_RemotePassAction_log();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);

    if (v50)
    {
      v51 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Error: No pass action found!", buf, 2u);
      }
    }
    v35 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorForAction:0];
    ((void (*)(void *, void, void, void *))v18[2])(v18, 0, 0, v35);
    v36 = 0;
  }
LABEL_18:
}

- (id)_viewControllerForPresentationStyle:(unint64_t)a3 withConversation:(id)a4
{
  id v5 = a4;
  if ([(NPKRemotePassActionCompanionMessagesAppViewController *)self presentationStyle] == (id)2)
  {
    BOOL v6 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _viewControllerForTranscriptPresentationStyleWithConversation:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_viewControllerForTranscriptPresentationStyleWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = [NPKRemotePassActionCompanionBubbleViewController alloc];
  BOOL v6 = [v4 selectedMessage];

  BOOL v7 = [(NPKRemotePassActionCompanionBubbleViewController *)v5 initWithMessage:v6 delegate:self];
  bubbleViewController = self->_bubbleViewController;
  self->_bubbleViewController = v7;

  id v9 = self->_bubbleViewController;

  return v9;
}

- (void)_showViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self addChildViewController:v4];
    id v5 = [v4 view];
    [v5 setAutoresizingMask:18];

    BOOL v6 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
    BOOL v7 = [v4 view];
    [v6 addSubview:v7];

    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _balloonMaskEdgeInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    BOOL v39 = [v4 view];
    v37 = [v39 topAnchor];
    v38 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
    v36 = [v38 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:v9];
    v42[0] = v35;
    v34 = [v4 view];
    v32 = [v34 bottomAnchor];
    v33 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
    v31 = [v33 bottomAnchor];
    BOOL v30 = [v32 constraintEqualToAnchor:v31 constant:v13];
    v42[1] = v30;
    v29 = [v4 view];
    id v27 = [v29 leadingAnchor];
    v28 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
    id v16 = [v28 leadingAnchor];
    id v17 = [v27 constraintEqualToAnchor:v16 constant:v11];
    v42[2] = v17;
    double v18 = [v4 view];
    objc_super v19 = [v18 trailingAnchor];
    v20 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
    double v21 = [v20 trailingAnchor];
    __int16 v22 = [v19 constraintEqualToAnchor:v21 constant:v15];
    v42[3] = v22;
    double v23 = +[NSArray arrayWithObjects:v42 count:4];
    +[NSLayoutConstraint activateConstraints:v23];

    [v4 didMoveToParentViewController:self];
  }
  else
  {
    v24 = pk_RemotePassAction_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      id v26 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Warning: Attempted to show view controller, but instead found nil! view controller: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_removeAllChildViewControllers
{
  v3 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self childViewControllers];
  id v5 = [v3 copy];

  [v5 enumerateObjectsUsingBlock:&stru_100014588];
  bubbleViewController = self->_bubbleViewController;
  self->_bubbleViewController = 0;
}

- (void)_requestResizeIfNeeded
{
  v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Requesting resize if needed", (uint8_t *)&v15, 2u);
    }
  }
  if ([(NPKRemotePassActionCompanionMessagesAppViewController *)self presentationStyle] == (id)2)
  {
    BOOL v6 = self->_bubbleViewController;
    if (v6)
    {
      BOOL v7 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
      [v7 bounds];
      double Height = CGRectGetHeight(v19);

      -[NPKRemotePassActionCompanionBubbleViewController suggestedViewSizeThatFits:](v6, "suggestedViewSizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v10 = v9;
      double v11 = pk_RemotePassAction_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (Height == v10)
      {
        if (v12)
        {
          double v14 = pk_RemotePassAction_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 134217984;
            double v16 = Height;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: No need to request resize current size to match existing one:%f", (uint8_t *)&v15, 0xCu);
          }
        }
      }
      else
      {
        if (v12)
        {
          double v13 = pk_RemotePassAction_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 134218240;
            double v16 = Height;
            __int16 v17 = 2048;
            double v18 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Requesting resize bubble: currentHeight:%f expectedHeight:%f", (uint8_t *)&v15, 0x16u);
          }
        }
        [(NPKRemotePassActionCompanionMessagesAppViewController *)self requestResize];
      }
    }
  }
}

- (NPKRemotePassActionUIService)remotePassUIService
{
  remotePassUIService = self->_remotePassUIService;
  if (!remotePassUIService)
  {
    BOOL v4 = (NPKRemotePassActionUIService *)objc_alloc_init((Class)NPKRemotePassActionUIService);
    id v5 = self->_remotePassUIService;
    self->_remotePassUIService = v4;

    [(NPKRemotePassActionUIService *)self->_remotePassUIService setDelegate:self];
    remotePassUIService = self->_remotePassUIService;
  }

  return remotePassUIService;
}

- (void)remotePassActionRequestBubbleViewController:(id)a3 didTapMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = pk_RemotePassAction_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    double v10 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v54 = self;
      __int16 v55 = 2112;
      id v56 = v7;
      __int16 v57 = 2112;
      id v58 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: App view controller: %@ did receive tap for message: %@ with sender: %@", buf, 0x20u);
    }
  }
  if (([v7 isFromMe] & 1) == 0)
  {
    double v11 = [v7 remotePassAction];
    BOOL v12 = [v11 underlyingMessage];
    double v13 = [v12 remotePassAction];

    if ([(NPKRemotePassActionCompanionMessagesAppViewController *)v13 isResponse])
    {
LABEL_43:

      goto LABEL_44;
    }
    double v14 = [v7 request];
    int v15 = [v14 action];
    id v52 = 0;
    unsigned int v16 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _canRequestRemoteActionBePerformed:v15 outError:&v52];
    id v17 = v52;

    if (!v16)
    {
      __int16 v22 = pk_RemotePassAction_log();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

      if (v23)
      {
        v24 = pk_RemotePassAction_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v13;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Warning: App view controller: Unable to perform action: %@", buf, 0xCu);
        }
      }
      [(NPKRemotePassActionCompanionMessagesAppViewController *)self _presentAlertWithDisplayableError:v17];
      goto LABEL_42;
    }
    double v18 = [v7 request];
    if ([(NPKRemotePassActionCompanionMessagesAppViewController *)v13 supportsTopUp])
    {
      id v19 = [v7 enterValueRequest];
      if (v19)
      {
        v20 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100009670;
        v50[3] = &unk_1000145D8;
        v50[4] = self;
        id v19 = v19;
        id v51 = v19;
        [(NPKRemotePassActionCompanionMessagesAppViewController *)self _contactForConversation:v20 completion:v50];
        double v21 = v51;
LABEL_19:

LABEL_40:
        goto LABEL_41;
      }
      v33 = pk_RemotePassAction_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        v20 = pk_RemotePassAction_log();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 138412802;
        v54 = self;
        __int16 v55 = 2112;
        id v56 = 0;
        __int16 v57 = 2112;
        id v58 = v18;
        v35 = "Notice: App view controller: %@ Unable to identify enterValueRequest: %@ from request: %@";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v35, buf, 0x20u);
        goto LABEL_40;
      }
      goto LABEL_41;
    }
    if ([(NPKRemotePassActionCompanionMessagesAppViewController *)v13 supportsCommutePlanRenewal])
    {
      id v19 = [v7 selectItemRequest];
      if (v19)
      {
        v20 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100009720;
        v48[3] = &unk_1000145D8;
        v48[4] = self;
        id v19 = v19;
        id v49 = v19;
        [(NPKRemotePassActionCompanionMessagesAppViewController *)self _contactForConversation:v20 completion:v48];
        double v21 = v49;
        goto LABEL_19;
      }
      v36 = pk_RemotePassAction_log();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      if (v37)
      {
        v20 = pk_RemotePassAction_log();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 138412802;
        v54 = self;
        __int16 v55 = 2112;
        id v56 = 0;
        __int16 v57 = 2112;
        id v58 = v18;
        v35 = "Notice: App view controller: %@ Unable to identify selectItemRequest: %@ from request: %@";
        goto LABEL_33;
      }
LABEL_41:

LABEL_42:
      goto LABEL_43;
    }
    BOOL v25 = pk_RemotePassAction_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      id v27 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v54 = self;
        __int16 v55 = 2112;
        id v56 = v7;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Warning: App view controller: %@ did receive tap for unsupported message: %@", buf, 0x16u);
      }
    }
    v47 = v18;
    if ((PKIsPhone() & 1) != 0 || PKIsPod())
    {
      uint64_t v28 = NPKRemotePassActionAppExtensionIdentifier;
      v46 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
      v29 = [v46 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_SOFTWARE_UPDATE_TITLE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
      BOOL v30 = +[NSBundle bundleWithIdentifier:v28];
      v31 = [v30 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_SOFTWARE_UPDATE_MESSAGE_IOS" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
      NPKDisplayableError();
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      double v18 = v47;
      v20 = +[NSBundle bundleWithIdentifier:v28];
      v32 = [v20 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_SOFTWARE_UPDATE_SETTINGS_ACTION" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
      [(NPKRemotePassActionCompanionMessagesAppViewController *)self _presentAlertWithDisplayableError:v19 actionButtonTitle:v32 actionHandler:&stru_1000145F8 showsConfirmButton:1];

      goto LABEL_40;
    }
    uint64_t v38 = NPKRemotePassActionAppExtensionIdentifier;
    BOOL v39 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    id v19 = [v39 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_UNSUPPORTED_PLATFORM_MESSAGE_GENERIC" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];

    if (PKIsPad())
    {
      v40 = +[NSBundle bundleWithIdentifier:v38];
      uint64_t v41 = v40;
      CFStringRef v42 = @"REMOTE_PAYMENT_PASS_ACTION_ERROR_UNSUPPORTED_PLATFORM_MESSAGE_IPAD";
    }
    else
    {
      if (!PKIsMac())
      {
LABEL_39:
        v44 = +[NSBundle bundleWithIdentifier:v38];
        v45 = [v44 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_UNSUPPORTED_PLATFORM_TITLE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
        v20 = NPKDisplayableError();

        [(NPKRemotePassActionCompanionMessagesAppViewController *)self _presentAlertWithDisplayableError:v20];
        double v18 = v47;
        goto LABEL_40;
      }
      v40 = +[NSBundle bundleWithIdentifier:v38];
      uint64_t v41 = v40;
      CFStringRef v42 = @"REMOTE_PAYMENT_PASS_ACTION_ERROR_UNSUPPORTED_PLATFORM_MESSAGE_MAC";
    }
    uint64_t v43 = [v40 localizedStringForKey:v42 value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];

    id v19 = (id)v43;
    goto LABEL_39;
  }
LABEL_44:
}

- (void)remotePassActionUIService:(id)a3 didSelectEnteredValueAmount:(id)a4 forRequestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
  BOOL v12 = [v11 selectedMessage];
  double v13 = [v12 enterValueRequest];

  double v14 = [v13 identifier];
  LODWORD(v12) = [v10 isEqualToString:v14];

  if (v12)
  {
    int v15 = pk_RemotePassAction_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      id v17 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        double v18 = [v9 formattedStringValue];
        *(_DWORD *)buf = 138412546;
        id v22 = v8;
        __int16 v23 = 2112;
        v24 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionCompanionMessagesAppViewController: %@ did finish with currency amount %@", buf, 0x16u);
      }
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009A40;
    v20[3] = &unk_100014620;
    v20[4] = self;
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _insertResponseToRequest:v13 forTopUpAmount:v9 withCompletion:v20];
    remotePassUIService = self->_remotePassUIService;
    self->_remotePassUIService = 0;
  }
}

- (void)remotePassActionUIService:(id)a3 didSelectItemForRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
  int v15 = [v14 selectedMessage];
  BOOL v16 = [v15 selectItemRequest];

  id v17 = [v16 identifier];
  LODWORD(v15) = [v13 isEqualToString:v17];

  if (v15)
  {
    double v18 = pk_RemotePassAction_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      v20 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionCompanionMessagesAppViewController: %@ did finish for selected item with renewal amount %@, service provider data: %@", buf, 0x20u);
      }
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100009C50;
    v22[3] = &unk_100014620;
    v22[4] = self;
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _insertResponseToRequest:v16 forRenewalAmount:v11 serviceProviderData:v12 withCompletion:v22];
    remotePassUIService = self->_remotePassUIService;
    self->_remotePassUIService = 0;
  }
}

- (void)remotePassActionUIService:(id)a3 didCancelForRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
  id v9 = [v8 selectedMessage];
  id v10 = [v9 request];

  id v11 = [v10 identifier];
  LODWORD(v9) = [v7 isEqualToString:v11];

  if (v9)
  {
    id v12 = pk_RemotePassAction_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      double v14 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionCompanionMessagesAppViewController: %@ did cancel", (uint8_t *)&v16, 0xCu);
      }
    }
    remotePassUIService = self->_remotePassUIService;
    self->_remotePassUIService = 0;
  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009E8C;
  block[3] = &unk_100014648;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A0C0;
  v11[3] = &unk_100014670;
  id v12 = a3;
  id v13 = a4;
  double v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  v3 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A3B0;
  block[3] = &unk_100014698;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  objc_copyWeak(&v18, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (BOOL)_canRequestRemoteActionBePerformed:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 unavailableActionBehavior];
  char v7 = (char)v6;
  BOOL v8 = (v6 & 2) == 0;
  uint64_t v9 = ((uint64_t)((void)v6 << 62) >> 63) & 7;
  id v10 = +[NSDate date];
  uint64_t v11 = [v5 availableFrom];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [v5 availableFrom];
    id v14 = [v10 compare:v13];

    if (v14 == (id)-1) {
      uint64_t v9 = 3;
    }
    BOOL v8 = (v7 & 2) == 0 && v14 != (id)-1;
  }
  uint64_t v15 = [v5 availableUntil];
  if (v15)
  {
    id v16 = (void *)v15;
    id v17 = [v5 availableUntil];
    id v18 = [v10 compare:v17];

    if (v18 == (id)1)
    {
      uint64_t v9 = 4;
      BOOL v8 = 0;
    }
  }
  if (a4 && !v8)
  {
    *a4 = +[PKPaymentPass displayableErrorForAction:v5 andReason:v9];
  }

  return v8;
}

- (id)_serviceProviderPaymentRequestForEnteredValueAmount:(id)a3 recipientName:(id)a4 organization:(id)a5 action:(id)a6 forLocalizedPassName:(id)a7
{
  id v12 = a4;
  uint64_t v13 = NPKRemotePassActionAppExtensionIdentifier;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = +[NSBundle bundleWithIdentifier:v13];
  BOOL v19 = v18;
  if (v12)
  {
    v20 = [v18 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_SUMMARY_LABEL_WITH_GIVEN_NAME" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v12, v14);
  }
  else
  {
    v20 = [v18 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_SUMMARY_LABEL" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v14, v30);
  double v21 = };

  id v22 = [v17 amount];
  __int16 v23 = +[PKPaymentSummaryItem summaryItemWithLabel:v21 amount:v22];
  v31[0] = v23;
  id v24 = +[PKPaymentSummaryItem summaryItemWithLabel:v16 amount:v22];

  v31[1] = v24;
  __int16 v25 = +[NSArray arrayWithObjects:v31 count:2];

  id v26 = [v15 enteredValueItem];
  __int16 v27 = [v26 serviceProviderData];
  id v28 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _serviceProviderPaymentRequestForServiceProviderData:v27 action:v15 amount:v17 summaryItems:v25];

  return v28;
}

- (id)_serviceProviderPaymentRequestForSelectedItemWithServiceProviderData:(id)a3 amount:(id)a4 recipientName:(id)a5 organization:(id)a6 action:(id)a7 forLocalizedPassName:(id)a8
{
  id v13 = a5;
  uint64_t v14 = NPKRemotePassActionAppExtensionIdentifier;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  v20 = +[NSBundle bundleWithIdentifier:v14];
  double v21 = v20;
  v31 = v13;
  if (v13)
  {
    id v22 = [v20 localizedStringForKey:@"RENEW_REMOTE_PAYMENT_PASS_ACTION_SUMMARY_LABEL_WITH_GIVEN_NAME" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v13, v15);
  }
  else
  {
    id v22 = [v20 localizedStringForKey:@"RENEW_REMOTE_PAYMENT_PASS_ACTION_SUMMARY_LABEL" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v15, v30);
  __int16 v23 = };

  id v24 = [v18 amount];
  __int16 v25 = +[PKPaymentSummaryItem summaryItemWithLabel:v23 amount:v24];
  v33[0] = v25;
  id v26 = +[PKPaymentSummaryItem summaryItemWithLabel:v17 amount:v24];

  v33[1] = v26;
  __int16 v27 = +[NSArray arrayWithObjects:v33 count:2];

  id v28 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _serviceProviderPaymentRequestForServiceProviderData:v19 action:v16 amount:v18 summaryItems:v27];

  return v28;
}

- (id)_serviceProviderPaymentRequestForServiceProviderData:(id)a3 action:(id)a4 amount:(id)a5 summaryItems:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 amount];
  uint64_t v14 = (void *)v13;
  if (v10 && v9 && v13)
  {
    id v15 = objc_alloc_init((Class)PKOpaqueDataServiceProviderOrder);
    id v16 = [v10 actionDescription];
    [v15 setItemDescription:v16];

    id v17 = [v9 mutableCopy];
    [v17 setObject:v14 forKey:PKServiceProviderOrderAmountKey];
    id v18 = [v17 copy];

    [v15 setServiceProviderData:v18];
    id v19 = [v10 serviceProviderIdentifier];
    [v15 setServiceProviderIdentifier:v19];

    id v20 = [objc_alloc((Class)PKServiceProviderPaymentRequest) initWithServiceProviderOrder:v15];
    double v21 = [v11 currency];
    [v20 setCurrencyCode:v21];

    id v22 = [v10 serviceProviderAcceptedNetworks];
    [v20 setSupportedNetworks:v22];

    [v20 setMerchantCapabilities:[v10 serviceProviderCapabilities]];
    __int16 v23 = [v10 serviceProviderCountryCode];
    [v20 setCountryCode:v23];

    id v24 = [v10 serviceProviderSupportedCountries];
    [v20 setSupportedCountries:v24];

    [v20 setPaymentSummaryItems:v12];
    id v9 = v18;
  }
  else
  {
    __int16 v25 = pk_RemotePassAction_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      __int16 v27 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138412802;
        id v30 = v9;
        __int16 v31 = 2112;
        v32 = v14;
        __int16 v33 = 2112;
        id v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error: Missing information to construct a payment request! serviceProviderData: %@, amount: %@, action: %@", (uint8_t *)&v29, 0x20u);
      }
    }
    id v20 = 0;
  }

  return v20;
}

- (void)_presentPaymentSheetForPaymentRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (PKPaymentAuthorizationCoordinator *)[objc_alloc((Class)PKPaymentAuthorizationCoordinator) initWithPaymentRequest:v6];
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v8;

  id v10 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
  id v11 = [v10 selectedMessage];
  id v12 = [v11 request];

  uint64_t v13 = [v12 action];
  uint64_t v14 = self->_authorizationCoordinator;
  if (v14)
  {
    [(PKPaymentAuthorizationCoordinator *)v14 setDelegate:self];
    [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator _setPrivateDelegate:self];
    objc_initWeak(location, self);
    id v15 = self->_authorizationCoordinator;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000AFAC;
    v20[3] = &unk_1000146C0;
    objc_copyWeak(&v23, location);
    id v22 = v7;
    v20[4] = self;
    id v21 = v13;
    [(PKPaymentAuthorizationCoordinator *)v15 presentWithCompletion:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
  else
  {
    id v16 = pk_RemotePassAction_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      id v18 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: Unable to construct authorization coordinator!", (uint8_t *)location, 2u);
      }
    }
    id v19 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorForAction:v13];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v19);
  }
}

- (void)_insertResponseToRequest:(id)a3 forTopUpAmount:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pk_RemotePassAction_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_retainBlock(v10);
      int v24 = 138412802;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Inserting response to request %@ for amount: %@ with completion %@!", (uint8_t *)&v24, 0x20u);
    }
  }
  id v15 = +[NPKRemotePassActionCompanionConversationManager sharedInstance];
  id v16 = [v8 identifier];
  [v15 setRequest:v8 forIdentifier:v16];

  if ([v8 supportsTopUp])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v17 = v8;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17)
    {
      id v19 = 0;
      goto LABEL_17;
    }
    id v18 = v17;
    id v19 = [objc_alloc((Class)NPKRemotePassActionEnterValueResponse) initWithTopUpAmount:v9 fromRequest:v18 withResult:1];
  }
  else
  {
    id v18 = [v8 action];
    id v20 = pk_RemotePassAction_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (v21)
    {
      id v22 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v18 type];
        int v24 = 138412802;
        id v25 = 0;
        __int16 v26 = 2112;
        id v27 = v8;
        __int16 v28 = 2048;
        id v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error: Unable to create response: %@ to request: %@ of action type: %lu", (uint8_t *)&v24, 0x20u);
      }
    }
    id v19 = 0;
  }

LABEL_17:
  [(NPKRemotePassActionCompanionMessagesAppViewController *)self _insertResponse:v19 toRequest:v8 withCompletion:v10];
}

- (void)_insertResponseToRequest:(id)a3 forRenewalAmount:(id)a4 serviceProviderData:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = pk_RemotePassAction_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_retainBlock(v13);
      int v27 = 138412802;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Inserting response to request %@ for renewal amount: %@ with completion %@!", (uint8_t *)&v27, 0x20u);
    }
  }
  id v18 = +[NPKRemotePassActionCompanionConversationManager sharedInstance];
  id v19 = [v10 identifier];
  [v18 setRequest:v10 forIdentifier:v19];

  if ([v10 supportsCommutePlanRenewal])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v10;
    }
    else {
      id v20 = 0;
    }
    if (!v20)
    {
      id v22 = 0;
      goto LABEL_17;
    }
    id v21 = v20;
    id v22 = [objc_alloc((Class)NPKRemotePassActionSelectItemResponse) initWithRenewalAmount:v11 serviceProviderData:v12 fromRequest:v21 withResult:1];
  }
  else
  {
    id v21 = [v10 action];
    id v23 = pk_RemotePassAction_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      id v25 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = [v21 type];
        int v27 = 138412802;
        id v28 = 0;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2048;
        id v32 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error: Unable to create response: %@ to request: %@ of action type: %lu", (uint8_t *)&v27, 0x20u);
      }
    }
    id v22 = 0;
  }

LABEL_17:
  [(NPKRemotePassActionCompanionMessagesAppViewController *)self _insertResponse:v22 toRequest:v10 withCompletion:v13];
}

- (void)_insertResponse:(id)a3 toRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 underlyingMessage];
  if (v11)
  {
    id v12 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self activeConversation];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000B81C;
    v18[3] = &unk_1000146E8;
    id v19 = v11;
    id v20 = v8;
    id v21 = self;
    id v22 = v9;
    id v23 = v10;
    [v12 insertMessage:v19 completionHandler:v18];

    id v13 = v19;
LABEL_9:

    goto LABEL_10;
  }
  id v14 = pk_RemotePassAction_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

  if (v15)
  {
    id v16 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error: Unable to identify response (%@) to insert into conversation.", buf, 0xCu);
    }
  }
  if (v10)
  {
    id v17 = [v9 action];
    id v13 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorForAction:v17];

    (*((void (**)(id, void *))v10 + 2))(v10, v13);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_presentAlertWithDisplayableError:(id)a3
{
  id v4 = a3;
  PKTitleForDisplayableError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = PKMessageForDisplayableError();

  id v6 = PKLocalizedString(@"OK_BUTTON_TITLE");
  [(NPKRemotePassActionCompanionMessagesAppViewController *)self _presentAlertWithTitle:v7 message:v5 actionButtonTitle:0 actionButtonHandler:0 confirmButtonTitle:v6];
}

- (void)_presentAlertWithDisplayableError:(id)a3 actionButtonTitle:(id)a4 actionHandler:(id)a5 showsConfirmButton:(BOOL)a6
{
  id v15 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = PKTitleForDisplayableError();
  id v13 = PKMessageForDisplayableError();

  if (a6)
  {
    id v14 = PKLocalizedString(@"OK_BUTTON_TITLE");
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _presentAlertWithTitle:v12 message:v13 actionButtonTitle:v15 actionButtonHandler:v10 confirmButtonTitle:v14];
  }
  else
  {
    [(NPKRemotePassActionCompanionMessagesAppViewController *)self _presentAlertWithTitle:v12 message:v13 actionButtonTitle:v15 actionButtonHandler:v10 confirmButtonTitle:0];
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 actionButtonTitle:(id)a5 actionButtonHandler:(id)a6 confirmButtonTitle:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[NSMutableDictionary dictionary];
  [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
  [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
  [v16 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  [v16 setObject:v12 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  id v17 = [v13 length];
  CFStringRef v18 = kCFUserNotificationDefaultButtonTitleKey;
  if (v17)
  {
    [v16 setObject:v13 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
    CFStringRef v18 = kCFUserNotificationAlternateButtonTitleKey;
  }
  [v16 setObject:v15 forKeyedSubscript:v18];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000BD54;
  v23[3] = &unk_100014710;
  BOOL v28 = v17 != 0;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  +[PKUserNotificationAgent presentNotificationWithParameters:v16 responseHandler:v23];
}

- (void)_contactForConversation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[NPKRemotePassActionCompanionConversationManager sharedInstance];
  id v8 = [v7 cachedContactForConversation:v5];

  if (v8)
  {
    v6[2](v6, v8);
  }
  else
  {
    id v9 = +[NPKRemotePassActionCompanionConversationManager sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000BFDC;
    v10[3] = &unk_100014738;
    id v11 = v6;
    [v9 fetchContactForConversation:v5 completion:v10];
  }
}

- (BOOL)_isGroupConversation:(id)a3
{
  v3 = [a3 recipientAddresses];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)_restoreRequestDataURLForResponseMessage:(id)a3 toMatchRequest:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 remotePassAction];
  unsigned int v7 = [v6 isResponse];

  if (v7) {
    [v8 updateDataURLForRemoteAction:v5];
  }
}

- (id)_genericErrorTitleForAction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 title];
  if ([v4 length]) {
    goto LABEL_7;
  }
  id v5 = [v3 enteredValueItem];

  if (v5)
  {
    id v6 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    unsigned int v7 = v6;
    CFStringRef v8 = @"RELOAD_REQUEST_TITLE";
  }
  else
  {
    id v9 = [v3 selectedActionItems];
    id v10 = [v9 count];

    if (!v10) {
      goto LABEL_7;
    }
    id v6 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    unsigned int v7 = v6;
    CFStringRef v8 = @"RENEW_REQUEST_TITLE";
  }
  uint64_t v11 = [v6 localizedStringForKey:v8 value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];

  BOOL v4 = (void *)v11;
LABEL_7:
  if ([v4 length])
  {
    id v12 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    id v13 = [v12 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_TITLE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v4);
  }
  else
  {
    id v12 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
    id v14 = [v12 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_TITLE_FALLBACK" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
  }

  return v14;
}

- (id)_genericErrorForAction:(id)a3
{
  id v3 = [(NPKRemotePassActionCompanionMessagesAppViewController *)self _genericErrorTitleForAction:a3];
  BOOL v4 = +[NSBundle bundleWithIdentifier:NPKRemotePassActionAppExtensionIdentifier];
  id v5 = [v4 localizedStringForKey:@"REMOTE_PAYMENT_PASS_ACTION_ERROR_GENERIC_MESSAGE" value:&stru_100014798 table:@"RemotePaymentPassActionsCompanionMessagesExtension"];
  id v6 = NPKDisplayableError();

  return v6;
}

- (void)setRemotePassUIService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePassUIService, 0);
  objc_storeStrong(&self->_authorizationCoordinatorHandler, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);

  objc_storeStrong((id *)&self->_bubbleViewController, 0);
}

@end