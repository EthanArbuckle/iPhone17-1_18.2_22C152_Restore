@interface PKPeerPaymentMessagesAppViewController
- (BOOL)_accountIsLocked;
- (BOOL)_canPerformQuoteForMessage:(id)a3 error:(id *)a4;
- (BOOL)_handlePaymentRequestMessage:(id)a3;
- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4;
- (BOOL)_iMessageIsEnabled;
- (BOOL)_isBusinessConversation;
- (BOOL)_isGroupConversation;
- (BOOL)_openWallet;
- (BOOL)_peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:(id)a3;
- (BOOL)_recipientAddressIsValid:(id)a3;
- (BOOL)_requiresEnablement;
- (BOOL)_requiresSetupFlow;
- (BOOL)appReadyForDisplay;
- (BOOL)displaysAfterAppearance;
- (BOOL)recipientFoundInContacts;
- (CGSize)_contentSizeThatFits:(CGSize)result presentationStyle:(unint64_t)a4;
- (CGSize)contentSize;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (NSDecimalNumber)maximumTransferAmount;
- (NSDecimalNumber)minimumTransferAmount;
- (NSString)recipientDisplayName;
- (PKCurrencyAmount)currentBalance;
- (PKPeerPaymentMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKTransactionSource)transactionSource;
- (id)_amountEntryViewController;
- (id)_analyticsP2PContext;
- (id)_analyticsPageTag;
- (id)_createViewControllerForState:(unint64_t)a3;
- (id)_currentRequestTokenForAmount:(id)a3;
- (id)_inCurrencyAmountForPeerPaymentMessage:(id)a3;
- (id)_recipientAddress;
- (id)_recipientPersonForIntentDonation;
- (id)_senderAddress;
- (id)_viewControllerForState:(unint64_t)a3 shouldLoad:(BOOL)a4;
- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3;
- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3;
- (unint64_t)_requiredContentState;
- (unint64_t)messageSource;
- (void)_applicationDidEnterBackground;
- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4;
- (void)_confirmRequestAmount:(id)a3 toRecipientWithCompletion:(id)a4;
- (void)_confirmSendAmount:(id)a3 toRecipientWithCompletion:(id)a4;
- (void)_donatePeerPaymentInteractionForMessage:(id)a3;
- (void)_handleAccountChanged:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleError:(id)a3 forAction:(unint64_t)a4 withCompletion:(id)a5;
- (void)_handleNetworkConnectivityChanged:(id)a3;
- (void)_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:(id)a3 completion:(id)a4;
- (void)_handleRecipientBecameInvalid:(id)a3;
- (void)_handleUpdatedTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_hostSceneIdentifierForMessageIdentifier:(id)a3 withCompletion:(id)a4;
- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4;
- (void)_insertRequestMessageWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5;
- (void)_presentAlertWithDisplayableError:(id)a3;
- (void)_presentInlineSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 completion:(id)a5;
- (void)_presentInlineSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 senderAddress:(id)a5 hostSceneIdentifier:(id)a6 completion:(id)a7;
- (void)_presentInlineSetupFlowWithPeerPaymentMessage:(id)a3 flowState:(unint64_t)a4 completion:(id)a5;
- (void)_presentSetupFlowWithPeerPaymentMessage:(id)a3 flowState:(unint64_t)a4 completion:(id)a5;
- (void)_prewarmDeviceScoreForRecipient:(id)a3;
- (void)_registerForPresentationSemanticContextChanges;
- (void)_reportAnalyticsButtonTap:(id)a3;
- (void)_reportAnalyticsForState;
- (void)_reportAnalyticsViewAppearedWithArchivedParent:(id)a3;
- (void)_reportAnalyticsViewDisappeared;
- (void)_shouldProceedPerformingQuote:(id)a3 message:(id)a4 memoText:(id)a5 completion:(id)a6;
- (void)_showPaymentDetailsForMessage:(id)a3 completion:(id)a4;
- (void)_showRecurringPaymentDetailsForMessage:(id)a3 completion:(id)a4;
- (void)_stagePaymentWithAmount:(id)a3 completion:(id)a4;
- (void)_stageRecurringPayment:(id)a3 completion:(id)a4;
- (void)_stageRequestWithAmount:(id)a3 completion:(id)a4;
- (void)_transitionToRequiredContentStateAnimated:(BOOL)a3;
- (void)_transitionToState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateWithFamilyCollection:(id)a3;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didReceiveMessage:(id)a3 conversation:(id)a4;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didSelectMessage:(id)a3 conversation:(id)a4;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)enableLiveBubbleDebugMode;
- (void)handleAction:(unint64_t)a3 sender:(id)a4 completion:(id)a5;
- (void)loadView;
- (void)localStatusForMessage:(id)a3 completion:(id)a4;
- (void)noteContentSizeNeedsUpdate;
- (void)noteReadyForDisplay;
- (void)recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:(id)a3;
- (void)remoteStatusForMessage:(id)a3 completion:(id)a4;
- (void)stageRecurringPayment:(id)a3 completion:(id)a4;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
@end

@implementation PKPeerPaymentMessagesAppViewController

- (PKPeerPaymentMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  v8 = [(PKPeerPaymentMessagesAppViewController *)&v33 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      v35 = v11;
      __int16 v36 = 2048;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %p Init", buf, 0x16u);
    }
    id v12 = objc_alloc((Class)PKPeerPaymentController);
    v13 = +[PKPeerPaymentWebService sharedService];
    v14 = (PKPeerPaymentController *)[v12 initWithPeerPaymentWebService:v13];
    peerPaymentController = v8->_peerPaymentController;
    v8->_peerPaymentController = v14;

    v16 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v8->_paymentService;
    v8->_paymentService = v16;

    v8->_state = 0;
    uint64_t v18 = +[NSMutableDictionary dictionary];
    viewControllerForState = v8->_viewControllerForState;
    v8->_viewControllerForState = (NSMutableDictionary *)v18;

    id v20 = objc_alloc((Class)PKTransactionSource);
    v21 = [(PKPeerPaymentController *)v8->_peerPaymentController peerPaymentPass];
    v22 = (PKTransactionSource *)[v20 initWithPaymentPass:v21];
    transactionSource = v8->_transactionSource;
    v8->_transactionSource = v22;

    objc_initWeak((id *)buf, v8);
    v24 = v8->_paymentService;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000AC40;
    v31[3] = &unk_100024F08;
    objc_copyWeak(&v32, (id *)buf);
    [(PKPaymentService *)v24 familyMembersWithCompletion:v31];
    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v8 selector:"_handleAccountChanged:" name:PKPeerPaymentControllerAccountDidChangeNotification object:v8->_peerPaymentController];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v8 selector:"_handleRecipientBecameInvalid:" name:PKPeerPaymentControllerRecipientDidBecomeInvalidNotification object:v8->_peerPaymentController];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v8 selector:"_handleNetworkConnectivityChanged:" name:PKNetworkConnectivityChangedNotification object:0];

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v8 selector:"_applicationDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v8 selector:"_applicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    [(PKPeerPaymentMessagesAppViewController *)v8 _registerForPresentationSemanticContextChanges];
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)dealloc
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %p Dealloc'd", buf, 0x16u);
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  [(PKPeerPaymentMessagesAppViewController *)&v7 dealloc];
}

- (void)loadView
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v12 = 138543874;
    v13 = v5;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = [(PKPeerPaymentMessagesAppViewController *)self presentationStyle];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %p loadView presentationStyle = %lu", (uint8_t *)&v12, 0x20u);
  }
  id v6 = +[PKMessagesAppSharedContext sharedContext];
  [v6 _registerAppViewController:self];

  objc_super v7 = (UIView *)[objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 300.0, 100.0];
  rootView = self->_rootView;
  self->_rootView = v7;

  id v9 = [(PKPeerPaymentMessagesAppViewController *)self presentationStyle];
  __int16 v10 = self->_rootView;
  if (v9 == (id)2) {
    +[PKPeerPaymentBubbleView referenceBackgroundColor];
  }
  else {
  v11 = +[PKPeerPaymentTheme backgroundColor];
  }
  [(UIView *)v10 setBackgroundColor:v11];

  [(PKPeerPaymentMessagesAppViewController *)self setView:self->_rootView];
}

- (void)viewDidLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  [(PKPeerPaymentMessagesAppViewController *)&v27 viewDidLayoutSubviews];
  v3 = [(PKPeerPaymentMessagesAppViewController *)self view];
  v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  if (v8 > 0.0)
  {
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v32.origin.x = v6;
      v32.origin.y = v8;
      v32.size.width = v10;
      v32.size.height = v12;
      __int16 v14 = NSStringFromCGRect(v32);
      *(_DWORD *)buf = 134218242;
      v29 = self;
      __int16 v30 = 2114;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesAppViewController %p: viewDidLayoutSubviews layoutFrame = %{public}@", buf, 0x16u);
    }
  }
  if ([(PKPeerPaymentMessagesAppViewController *)self presentationStyle] == (id)2)
  {
    v15 = [(PKPeerPaymentMessagesAppViewController *)self _viewControllerForState:12 shouldLoad:0];
    [(PKPeerPaymentMessagesAppViewController *)self _balloonMaskEdgeInsets];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [v15 bubbleView];
    [v24 setContentInset:v17, v19, v21, v23];
  }
  v25 = [(PKPeerPaymentMessagesContentProtocol *)self->_activeViewController view];
  v26 = [(PKPeerPaymentMessagesAppViewController *)self view];
  [v26 bounds];
  [v25 setFrame:];

  if (self->_debugBallView) {
    -[UIView bringSubviewToFront:](self->_rootView, "bringSubviewToFront:");
  }
}

- (id)_viewControllerForState:(unint64_t)a3 shouldLoad:(BOOL)a4
{
  BOOL v4 = a4;
  viewControllerForState = self->_viewControllerForState;
  double v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  double v9 = [(NSMutableDictionary *)viewControllerForState objectForKeyedSubscript:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    double v9 = [(PKPeerPaymentMessagesAppViewController *)self _createViewControllerForState:a3];
    if (v9)
    {
      double v11 = self->_viewControllerForState;
      CGFloat v12 = +[NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
    }
  }

  return v9;
}

- (id)_createViewControllerForState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      BOOL v4 = PKPeerPaymentMessagesContentBaseViewController;
      goto LABEL_19;
    case 1uLL:
      BOOL v4 = PKPeerPaymentMessagesContentOfflineViewController;
      goto LABEL_19;
    case 2uLL:
      BOOL v4 = PKPeerPaymentMessagesContentIMessageDisabledViewController;
      goto LABEL_19;
    case 3uLL:
      BOOL v4 = PKPeerPaymentMessagesContentEnableViewController;
      goto LABEL_19;
    case 4uLL:
      BOOL v4 = PKPeerPaymentMessagesContentInstallViewController;
      goto LABEL_19;
    case 5uLL:
      BOOL v4 = PKPeerPaymentMessagesContentAccountLockedViewController;
      goto LABEL_19;
    case 6uLL:
      BOOL v4 = PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController;
      goto LABEL_19;
    case 7uLL:
      BOOL v4 = PKPeerPaymentMessagesContentRecipientLoadingViewController;
      goto LABEL_19;
    case 8uLL:
      BOOL v4 = PKPeerPaymentMessagesContentRecipientInvalidViewController;
      goto LABEL_19;
    case 9uLL:
      BOOL v4 = PKPeerPaymentMessagesContentRecipientGroupViewController;
      goto LABEL_19;
    case 0xAuLL:
      BOOL v4 = PKPeerPaymentMessagesContentRecipientBusinessViewController;
      goto LABEL_19;
    case 0xBuLL:
      CGFloat v6 = [[PKPeerPaymentMessagesContentAmountEntryViewController alloc] initWithMessagesAppController:self];
      [(PKPeerPaymentMessagesContentAmountEntryViewController *)v6 setSourceType:2];
      [(PKPeerPaymentMessagesContentAmountEntryViewController *)v6 setShowSendAndRequest:1];
      double v5 = [[PKPeerPaymentMessagesContentNavigationController alloc] initWithMessagesAppController:self];
      double v9 = v6;
      double v7 = +[NSArray arrayWithObjects:&v9 count:1];
      [(PKPeerPaymentMessagesContentNavigationController *)v5 setViewControllers:v7 animated:0];

      break;
    case 0xCuLL:
      double v5 = [(PKPeerPaymentMessagesContentBaseViewController *)[PKPeerPaymentMessagesContentRenderBubbleViewController alloc] initWithMessagesAppController:self];
      if (PKEnableSURFLiveBubbleDebugMode()) {
        [(PKPeerPaymentMessagesAppViewController *)self enableLiveBubbleDebugMode];
      }
      break;
    case 0xDuLL:
      BOOL v4 = PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController;
      goto LABEL_19;
    case 0xEuLL:
      BOOL v4 = PKPeerPaymentMessagesContentRecipientRestrictedOutsideFamilyViewController;
LABEL_19:
      double v5 = (PKPeerPaymentMessagesContentNavigationController *)[[v4 alloc] initWithMessagesAppController:self];
      break;
    default:
      double v5 = 0;
      break;
  }

  return v5;
}

- (id)_amountEntryViewController
{
  v2 = [(PKPeerPaymentMessagesAppViewController *)self _viewControllerForState:11 shouldLoad:1];
  v3 = [v2 viewControllers];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (void)_transitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B61C;
  block[3] = &unk_100024F58;
  block[4] = self;
  block[5] = a3;
  BOOL v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_prewarmDeviceScoreForRecipient:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v3 = +[PKPeerPaymentWebService sharedService];
    [v3 prewarmDeviceScoreForEndpoint:PKPeerPaymentDeviceScoreEndpointIdentifierRequestToken recipientAddress:v4 quoteDestinationType:1];
    [v3 prewarmDeviceScoreForEndpoint:PKPeerPaymentDeviceScoreEndpointIdentifierQuote recipientAddress:v4 quoteDestinationType:1];
  }
}

- (unint64_t)_requiredContentState
{
  if ([(PKPeerPaymentMessagesAppViewController *)self presentationStyle] != (id)2)
  {
    if (PKPassbookIsCurrentlyDeletedByUser()) {
      return 4;
    }
    if ([(PKPeerPaymentMessagesAppViewController *)self _isGroupConversation]) {
      return 9;
    }
    if ([(PKPeerPaymentMessagesAppViewController *)self _isBusinessConversation]) {
      return 10;
    }
    if (PKStoreDemoModeEnabled()) {
      return 11;
    }
    if (!PKNetworkConnectivityAvailable()) {
      return 1;
    }
    if (![(PKPeerPaymentMessagesAppViewController *)self _iMessageIsEnabled]) {
      return 2;
    }
    if ([(PKPeerPaymentMessagesAppViewController *)self _requiresEnablement]) {
      return 3;
    }
    if ([(PKPeerPaymentMessagesAppViewController *)self _accountIsLocked]) {
      return 5;
    }
    if (![(PKPeerPaymentMessagesAppViewController *)self recipientFoundInContacts])
    {
      BOOL v5 = [(PKPeerPaymentController *)self->_peerPaymentController account];
      id v6 = [v5 sendRestrictionType];

      if (v6 == (id)2) {
        return 13;
      }
    }
    double v7 = [(PKPeerPaymentController *)self->_peerPaymentController recipient];
    double v8 = v7;
    if (v7)
    {
      id v9 = [v7 status];
      if (v9)
      {
        if (v9 == (id)2)
        {
          unint64_t v10 = (unint64_t)[v8 statusReason];
          if (v10 < 3)
          {
            unint64_t v3 = qword_10001BBE8[v10];
            goto LABEL_32;
          }
        }
        else if (v9 == (id)1)
        {
          unint64_t v3 = 11;
LABEL_32:

          return v3;
        }
        unint64_t v3 = 0;
        goto LABEL_32;
      }
    }
    unint64_t v3 = 7;
    goto LABEL_32;
  }
  return 12;
}

- (void)_transitionToRequiredContentStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PKPeerPaymentMessagesAppViewController *)self _requiredContentState];
  [(PKPeerPaymentMessagesAppViewController *)self _transitionToState:v5 animated:v3];
  if (v5 == 7)
  {
    id v6 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddress];
    uint64_t v7 = [(PKPeerPaymentMessagesAppViewController *)self _senderAddress];
    double v8 = (void *)v7;
    if (v6 && v7)
    {
      peerPaymentController = self->_peerPaymentController;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000BCEC;
      v10[3] = &unk_100024F80;
      v10[4] = self;
      [(PKPeerPaymentController *)peerPaymentController identifyRecipientWithAddress:v6 senderAddress:v8 completion:v10];
    }
    else
    {
      [(PKPeerPaymentMessagesAppViewController *)self _transitionToState:8 animated:1];
    }
  }
}

- (void)_handleNetworkConnectivityChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Network connectivity changed.", buf, 2u);
  }

  id v6 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];

  if (v6
    && [(PKPeerPaymentMessagesAppViewController *)self _requiredContentState] != self->_state)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Updating messages content state in response to a network connectivity changed notification.", v7, 2u);
    }

    [(PKPeerPaymentMessagesAppViewController *)self _transitionToRequiredContentStateAnimated:0];
  }
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = [a3 recipientAddresses];
    int v6 = 138412546;
    id v7 = a3;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Will become active with conversation: %@, recipientAddresses:%@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 recipientAddresses];
    *(_DWORD *)buf = 138412546;
    id v25 = v4;
    __int16 v26 = 2112;
    objc_super v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Did become active with conversation: %@, recipientAddresses:%@", buf, 0x16u);
  }
  if ([(PKPeerPaymentMessagesAppViewController *)self presentationStyle] == (id)2)
  {
    id v7 = [v4 selectedMessage];
    __int16 v8 = [v7 peerPaymentMessage];

    id v9 = [v8 localProperties];
    id v10 = v9;
    if (v9)
    {
      self->_messageSource = (unint64_t)[v9 source];
      objc_storeStrong((id *)&self->_stagedPeerPaymentMessage, v8);
      double v11 = [v10 analyticsSessionToken];
      if (v11) {
        [(PKPeerPaymentMessagesAppViewController *)self _reportAnalyticsViewAppearedWithArchivedParent:v11];
      }
    }
  }
  else
  {
    self->_messageSource = 2;
    CGFloat v12 = +[PKMessagesAppSharedContext sharedContext];
    v13 = [v12 bubbleAppControllers];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v13;
    id v14 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v10);
          }
          double v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v18, "messageSource", (void)v19))
          {
            self->_messageSource = (unint64_t)[v18 messageSource];
            goto LABEL_18;
          }
        }
        id v15 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_18:
    __int16 v8 = v10;
  }

  [(PKPeerPaymentMessagesAppViewController *)self _transitionToRequiredContentStateAnimated:0];
}

- (void)willResignActiveWithConversation:(id)a3
{
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Will resign active with conversation: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didResignActiveWithConversation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Did resign active with conversation: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PKPeerPaymentController *)self->_peerPaymentController reset];
  if (self->_pendingFormalPaymentRequestMesssage || self->_pendingInformalPaymentRequestAmount)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Invalidating pending request values.", (uint8_t *)&v9, 0xCu);
    }

    pendingFormalPaymentRequestMesssage = self->_pendingFormalPaymentRequestMesssage;
    self->_pendingFormalPaymentRequestMesssage = 0;

    pendingInformalPaymentRequestAmount = self->_pendingInformalPaymentRequestAmount;
    self->_pendingInformalPaymentRequestAmount = 0;

    pendingRecurringPayment = self->_pendingRecurringPayment;
    self->_pendingRecurringPayment = 0;

    self->_messageSource = 0;
  }
}

- (void)didReceiveMessage:(id)a3 conversation:(id)a4
{
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [a3 peerPaymentMessage];
    int v7 = 138412290;
    __int16 v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Received message: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)didSelectMessage:(id)a3 conversation:(id)a4
{
  unint64_t v5 = [a3 peerPaymentMessage];
  int v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Selected message: %@", (uint8_t *)&v12, 0xCu);
  }

  if ([v5 type] == (id)2)
  {
    int v7 = [v5 currency];
    uint64_t v8 = [v5 amount];
    int v9 = (NSDecimalNumber *)v8;
    if (v7 && v8)
    {
      id v10 = [(PKPeerPaymentMessagesAppViewController *)self _amountEntryViewController];
      __int16 v11 = PKCurrencyAmountCreate(v9, v7, 0);
      [v10 setAmount:v11];
    }
  }
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 completionHandler:(id)a5
{
}

- (BOOL)_canPerformQuoteForMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PKPeerPaymentMessagesAppViewController *)self _isGroupConversation]
    || ([v6 recipientAddress],
        int v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddressIsValid:v7],
        v7,
        (v8 & 1) == 0))
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Recipient identifier doesn't match current conversation recipient. Hence failing validation.", buf, 2u);
    }

    if (a4)
    {
      v13 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_BUBBLE_RECIPIENT_MISMATCH_ERROR_TITLE");
      uint64_t v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_BUBBLE_RECIPIENT_MISMATCH_ERROR_DESCRIPTION");
LABEL_16:
      uint64_t v16 = (void *)v14;
      PKDisplayableErrorCustom();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    if ([(PKPeerPaymentMessagesAppViewController *)self recipientFoundInContacts]
      || ([(PKPeerPaymentController *)self->_peerPaymentController account],
          int v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 sendRestrictionType],
          v9,
          v10 != (id)2))
    {
      LOBYTE(a4) = 1;
      goto LABEL_18;
    }
    __int16 v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: The curent user cannot sent to people outside of their contacts. Hence failing validation.", v18, 2u);
    }

    if (a4)
    {
      if ([v6 type] == (id)2) {
        int v12 = @"PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_TITLE";
      }
      else {
        int v12 = @"PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_SENDS_TITLE";
      }
      v13 = PKLocalizedPeerPaymentString(&v12->isa);
      uint64_t v14 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE");
      goto LABEL_16;
    }
  }
LABEL_18:

  return (char)a4;
}

- (BOOL)_recipientAddressIsValid:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKIDSNormalizedAddress();
  id v6 = [(PKPeerPaymentMessagesAppViewController *)self recipientAddress];
  int v7 = PKIDSNormalizedAddress();

  if ([v7 isEqualToString:v5])
  {
    unsigned __int8 v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: recipientAddress matches conversationAddress.", buf, 2u);
    }
    BOOL v9 = 1;
  }
  else
  {
    unsigned __int8 v8 = PKPeerPaymentNormalizedMergedPinningIdentifiersForRecipientAddress();
    if ([v8 containsObject:v5]
      && [v8 containsObject:v7])
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: addresses match mergedPinningIdentifiers.", v13, 2u);
      }
      BOOL v9 = 1;
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: mismatch between addresses and mergedPinningIdentifiers.", v12, 2u);
      }
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (void)_shouldProceedPerformingQuote:(id)a3 message:(id)a4 memoText:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Should proceed performing quote: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v13)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    if ([v10 riskLevel])
    {
      id v15 = [v10 dynamicFraudContent];
      id v16 = +[NSMutableDictionary dictionary];
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      double v17 = [v15 header];
      [v16 setObject:v17 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

      double v18 = [v15 message];
      [v16 setObject:v18 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      long long v19 = [v15 defaultButtonTitle];
      [v16 setObject:v19 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      long long v20 = [v15 otherButtonTitle];
      [v16 setObject:v20 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

      +[PKAnalyticsReporter reportAppleCashSenderErrorPage:PKAnalyticsReportPeerPaymentErrorFraudSuspectedPageTag];
      long long v21 = &stru_100025000;
      uint64_t v22 = 2;
      double v23 = &stru_100024FE0;
    }
    else
    {
      if (![(PKPeerPaymentMessagesAppViewController *)self _peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:v12])goto LABEL_10; {
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      }
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      v24 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_MESSAGES_MEMO_SHARING_ALERT_TITLE");
      [v16 setObject:v24 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

      id v25 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_MESSAGES_MEMO_SHARING_ALERT_MESSAGE");
      [v16 setObject:v25 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      __int16 v26 = PKLocalizedPaymentString(@"CONTINUE");
      [v16 setObject:v26 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v15 = PKLocalizedString(@"CANCEL");
      [v16 setObject:v15 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
      uint64_t v22 = 0;
      long long v21 = &stru_100024FC0;
      double v23 = &stru_100024FA0;
    }

    if (v16)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10000D014;
      v27[3] = &unk_100025028;
      p_long long buf = &buf;
      uint64_t v32 = v22;
      v28 = v23;
      v29 = v21;
      id v30 = v13;
      +[PKUserNotificationAgent presentNotificationWithParameters:v16 flags:0 responseHandler:v27];

LABEL_11:
      _Block_object_dispose(&buf, 8);
      goto LABEL_12;
    }
LABEL_10:
    (*((void (**)(id, void))v13 + 2))(v13, *(unsigned __int8 *)(*((void *)&buf + 1) + 24));
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [a3 peerPaymentMessage];
  [(PKPeerPaymentMessagesAppViewController *)self _reportAnalyticsButtonTap:PKAnalyticsReportPeerPaymentSendButtonTag];
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    v41 = self;
    __int16 v42 = 2112;
    v43 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Validate message for sending: %@", buf, 0x16u);
  }

  id v39 = 0;
  unsigned __int8 v13 = [(PKPeerPaymentMessagesAppViewController *)self _canPerformQuoteForMessage:v11 error:&v39];
  id v14 = v39;
  id v15 = v14;
  if (v13)
  {
    id v16 = [v11 localProperties];
    [v11 setLocalProperties:0];
    id v17 = [v11 type];
    switch((unint64_t)v17)
    {
      case 0uLL:
        goto LABEL_13;
      case 1uLL:
      case 3uLL:
        id v18 = objc_alloc((Class)PKPeerPaymentController);
        long long v19 = +[PKPeerPaymentWebService sharedService];
        id v20 = [v18 initWithPeerPaymentWebService:v19];

        [v20 setDelegate:self];
        long long v21 = +[PKMessagesAppSharedContext sharedContext];
        [v11 identifier];
        uint64_t v22 = v28 = v16;
        double v23 = [v21 externalizedControllerStateForMessageIdentifier:v22];

        LOBYTE(v22) = [v20 restoreStateWithExternalizedControllerState:v23];
        objc_super v27 = [v20 quote];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000D4F0;
        v29[3] = &unk_100025108;
        char v38 = (char)v22;
        id v30 = v23;
        v31 = self;
        id v32 = v11;
        id v33 = v20;
        id v34 = v9;
        id v37 = v17;
        id v35 = v28;
        id v36 = v10;
        id v24 = v20;
        id v25 = v23;
        id v16 = v28;
        [(PKPeerPaymentMessagesAppViewController *)self _shouldProceedPerformingQuote:v27 message:v32 memoText:v34 completion:v29];

        break;
      case 2uLL:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, PKDarwinNotificationEventInAppDismissed, 0, 0, 1u);
        if ([v9 length]) {
          [v11 setMemo:v9];
        }
        PKAnalyticsSendEvent();
        [v11 reportMessageSentWithLocalProperties:v16];
LABEL_13:
        if (v10) {
          (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
        }
        break;
      default:
        break;
    }
  }
  else
  {
    if (v14) {
      [(PKPeerPaymentMessagesAppViewController *)self _handleError:v14];
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)_hostSceneIdentifierForMessageIdentifier:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 peerPaymentMessage];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Did start sending message: %@", (uint8_t *)&v9, 0xCu);
  }
  [(PKPeerPaymentMessagesAppViewController *)self _donatePeerPaymentInteractionForMessage:v5];
  [(PKPeerPaymentMessagesAppViewController *)self dismiss];
  stagedPeerPaymentMessage = self->_stagedPeerPaymentMessage;
  self->_stagedPeerPaymentMessage = 0;
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  id v5 = [a3 peerPaymentMessage];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Did cancel sending message: %@", (uint8_t *)&v10, 0xCu);
  }

  stagedPeerPaymentMessage = self->_stagedPeerPaymentMessage;
  self->_stagedPeerPaymentMessage = 0;

  PKAnalyticsSendEvent();
  [(PKPeerPaymentMessagesAppViewController *)self _reportAnalyticsButtonTap:PKAnalyticsReportCancelButtonTag];
  +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectAppleCash];
  if ([v5 type] == (id)1)
  {
    unsigned __int8 v8 = +[PKMessagesAppSharedContext sharedContext];
    int v9 = [v5 identifier];
    [v8 removeExternalizedControllerStateDataForMessageIdentifier:v9];
  }
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  if (!a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = [(PKPeerPaymentMessagesContentProtocol *)self->_activeViewController popToRootViewControllerAnimated:0];
    }
  }
  activeViewController = self->_activeViewController;

  [(PKPeerPaymentMessagesContentProtocol *)activeViewController reloadContent];
}

- (CGSize)_contentSizeThatFits:(CGSize)result presentationStyle:(unint64_t)a4
{
  if (a4 == 2) {
    -[PKPeerPaymentMessagesAppViewController contentSizeThatFits:](self, "contentSizeThatFits:", result.width, result.height, v4, v5);
  }
  return result;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = [(PKPeerPaymentMessagesAppViewController *)self _viewControllerForState:12 shouldLoad:1];
  [v5 contentSizeThatFits:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_applicationDidEnterBackground
{
  +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectAppleCash];
  traitRegistration = self->_traitRegistration;

  [(PKPeerPaymentMessagesAppViewController *)self unregisterForTraitChanges:traitRegistration];
}

- (void)_registerForPresentationSemanticContextChanges
{
  objc_initWeak(&location, self);
  uint64_t v9 = objc_opt_class();
  BOOL v3 = +[NSArray arrayWithObjects:&v9 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E4D4;
  v6[3] = &unk_100024990;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [(PKPeerPaymentMessagesAppViewController *)self registerForTraitChanges:v3 withHandler:v6];
  traitRegistration = self->_traitRegistration;
  self->_traitRegistration = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)displaysAfterAppearance
{
  if (self->_readyForDisplay
    || [(PKPeerPaymentMessagesAppViewController *)self presentationStyle] != (id)2)
  {
    BOOL result = 1;
    self->_readyForDisplay = 1;
  }
  else
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Deferring display to the bubble render view for transcript presentation controller.", v5, 2u);
    }

    return 0;
  }
  return result;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void (**)(id, void *))a3;
    uint64_t v5 = [(PKPeerPaymentMessagesAppViewController *)self view];
    [v5 bounds];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    double v11 = v10;
    double v13 = v12;

    id v14 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v11, v13];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E794;
    v16[3] = &unk_100025130;
    v16[5] = v7;
    v16[6] = v9;
    *(double *)&v16[7] = v11;
    *(double *)&v16[8] = v13;
    v16[4] = self;
    id v15 = [v14 imageWithActions:v16];
    v4[2](v4, v15);
  }
}

- (NSString)recipientDisplayName
{
  peerPaymentController = self->_peerPaymentController;
  BOOL v3 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddress];
  uint64_t v4 = [(PKPeerPaymentController *)peerPaymentController displayNameForRecipientAddress:v3];

  return (NSString *)v4;
}

- (BOOL)recipientFoundInContacts
{
  BOOL v6 = 0;
  peerPaymentController = self->_peerPaymentController;
  BOOL v3 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddress];
  id v4 = [(PKPeerPaymentController *)peerPaymentController displayNameForRecipientAddress:v3 foundInContacts:&v6];

  return v6;
}

- (PKCurrencyAmount)currentBalance
{
  v2 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  BOOL v3 = [v2 currentBalance];

  return (PKCurrencyAmount *)v3;
}

- (NSDecimalNumber)minimumTransferAmount
{
  v2 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  BOOL v3 = [v2 sendToUserFeatureDescriptor];
  id v4 = [v3 minimumAmount];

  return (NSDecimalNumber *)v4;
}

- (NSDecimalNumber)maximumTransferAmount
{
  v2 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  BOOL v3 = [v2 sendToUserFeatureDescriptor];
  id v4 = [v3 maximumAmount];

  return (NSDecimalNumber *)v4;
}

- (void)handleAction:(unint64_t)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  switch(a3)
  {
    case 1uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      double v10 = [v8 amount];
      [(PKPeerPaymentMessagesAppViewController *)self _stagePaymentWithAmount:v10 completion:v9];
      goto LABEL_6;
    case 2uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      double v10 = [v8 amount];
      [(PKPeerPaymentMessagesAppViewController *)self _stageRequestWithAmount:v10 completion:v9];
LABEL_6:

LABEL_19:
      unsigned int v24 = 1;
      goto LABEL_53;
    case 3uLL:
      double v11 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
      double v12 = [v11 selectedMessage];
      double v13 = [v12 peerPaymentMessage];

      if (!v13 || [v13 type] != (id)2) {
        goto LABEL_38;
      }
      id v14 = +[PKMessagesAppSharedContext sharedContext];
      [v14 handlePaymentRequestMessage:v13 sender:self completion:v9];
      goto LABEL_50;
    case 4uLL:
      id v15 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
      id v16 = [v15 selectedMessage];
      double v13 = [v16 peerPaymentMessage];

      if (!v13 || [v13 type] != (id)1) {
        goto LABEL_38;
      }
      if ([(PKPeerPaymentMessagesAppViewController *)self _requiresSetupFlow])
      {
        id v14 = [v13 senderAddress];
        id v17 = [v14 length];
        uint64_t v18 = 1;
        if (v17) {
          uint64_t v18 = 2;
        }
        uint64_t v67 = v18;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_10000F4F4;
        v77[3] = &unk_100025158;
        v77[4] = self;
        id v19 = v13;
        id v78 = v19;
        id v79 = v9;
        id v20 = objc_retainBlock(v77);
        long long v21 = [(PKPeerPaymentController *)self->_peerPaymentController account];
        id v22 = [v21 stage];

        if (v22 == (id)1) {
          [(PKPeerPaymentMessagesAppViewController *)self _presentSetupFlowWithPeerPaymentMessage:v19 flowState:v67 completion:v20];
        }
        else {
          [(PKPeerPaymentMessagesAppViewController *)self _presentInlineSetupFlowWithPeerPaymentMessage:v19 flowState:v67 completion:v20];
        }

        v60 = &v78;
      }
      else
      {
        id v14 = [v13 paymentIdentifier];
        peerPaymentController = self->_peerPaymentController;
        uint64_t v59 = PKPeerPaymentActionAccept;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_10000F598;
        v75[3] = &unk_1000251A8;
        v75[4] = self;
        v60 = &v76;
        id v76 = v9;
        [(PKPeerPaymentController *)peerPaymentController performAction:v59 withPaymentIdentifier:v14 completion:v75];
      }

LABEL_50:
      goto LABEL_51;
    case 5uLL:
      BOOL v23 = [(PKPeerPaymentMessagesAppViewController *)self _openWallet];
      if (v9) {
        (*((void (**)(id, BOOL))v9 + 2))(v9, v23);
      }
      goto LABEL_19;
    case 6uLL:
      id v25 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
      __int16 v26 = [v25 selectedMessage];
      double v13 = [v26 peerPaymentMessage];

      if (!v13 || [v13 type] != (id)1 || !objc_msgSend(v13, "hasBeenSent")) {
        goto LABEL_38;
      }
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10000F7E0;
      v73[3] = &unk_1000251D0;
      id v74 = v9;
      [(PKPeerPaymentMessagesAppViewController *)self _showPaymentDetailsForMessage:v13 completion:v73];
      objc_super v27 = v74;
      goto LABEL_37;
    case 7uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      double v13 = [(PKPeerPaymentController *)self->_peerPaymentController account];
      *(void *)long long buf = 0;
      id v72 = 0;
      unsigned int v24 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:3 account:v13 unableReason:buf displayableError:&v72];
      id v28 = v72;
      v29 = v28;
      if (v24)
      {
        id v66 = v28;
        v68 = v13;
        id v30 = [v8 amount];
        v31 = [(PKPeerPaymentController *)self->_peerPaymentController account];
        v69 = [v31 recurringPaymentsFeatureDescriptor];

        pendingRecurringPayment = self->_pendingRecurringPayment;
        if (!pendingRecurringPayment)
        {
          id v33 = (PKPeerPaymentRecurringPayment *)objc_alloc_init((Class)PKPeerPaymentRecurringPayment);
          id v34 = self->_pendingRecurringPayment;
          self->_pendingRecurringPayment = v33;

          [(PKPeerPaymentRecurringPayment *)self->_pendingRecurringPayment setFrequency:1];
          id v35 = self->_pendingRecurringPayment;
          id v36 = +[NSDate date];
          [(PKPeerPaymentRecurringPayment *)v35 setStartDate:v36];

          pendingRecurringPayment = self->_pendingRecurringPayment;
        }
        id v37 = [v30 currency];
        [(PKPeerPaymentRecurringPayment *)pendingRecurringPayment setCurrency:v37];

        char v38 = self->_pendingRecurringPayment;
        v65 = v30;
        id v39 = [v30 amount];
        [(PKPeerPaymentRecurringPayment *)v38 setAmount:v39];

        v40 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
        v41 = [v40 recipientAddresses];
        __int16 v42 = [v41 firstObject];

        id v43 = objc_alloc((Class)PKPeerPaymentRecurringPaymentDetailViewController);
        id v44 = [(PKPeerPaymentRecurringPayment *)self->_pendingRecurringPayment copy];
        id v45 = [v43 initWithRecurringPayment:v44 recipientAddress:v42 mode:1 context:9 peerPaymentController:self->_peerPaymentController remoteMessagesComposer:0];

        [v45 setDelegate:self];
        v46 = [v69 minimumAmount];
        [v45 setMinimumAmount:v46];

        v47 = [v69 maximumAmount];
        [v45 setMaximumAmount:v47];

        [v45 setOverrideUserInterfaceStyle:2];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v48 = [(PKPeerPaymentMessagesAppViewController *)self traitCollection];
          id v49 = [v48 _presentationSemanticContext];

          if (v49 == (id)3 && PKIsPad())
          {
            [v45 setShowCancelButton:1];
            v50 = (PKPeerPaymentMessagesContentProtocol *)[objc_alloc((Class)PKNavigationController) initWithRootViewController:v45];
            [(PKPeerPaymentMessagesContentProtocol *)v50 setOverrideUserInterfaceStyle:2];
            [(PKPeerPaymentMessagesContentProtocol *)v50 setModalPresentationStyle:0];
            [(PKPeerPaymentMessagesAppViewController *)self presentViewController:v50 animated:1 completion:0];
          }
          else
          {
            v50 = self->_activeViewController;
            [(PKPeerPaymentMessagesContentProtocol *)v50 setOverrideUserInterfaceStyle:2];
            [(PKPeerPaymentMessagesContentProtocol *)v50 pushViewController:v45 animated:1];
          }
        }
        v29 = v66;
        if (v9) {
          (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
        }

        double v13 = v68;
        v53 = v65;
      }
      else
      {
        v53 = +[NSMutableDictionary dictionary];
        [v53 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
        [v53 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
        v54 = PKTitleForDisplayableError();
        [v53 setObject:v54 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

        v55 = PKMessageForDisplayableError();
        [v53 setObject:v55 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

        v56 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_ACTION_UNAVAILABLE_ADD_CARD_BUTTON_TITLE");
        [v53 setObject:v56 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

        v57 = PKLocalizedString(@"CANCEL_BUTTON_TITLE");
        [v53 setObject:v57 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

        +[PKUserNotificationAgent presentNotificationWithParameters:v53 flags:0 responseHandler:&stru_100025210];
      }

      goto LABEL_52;
    case 8uLL:
      v51 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
      v52 = [v51 selectedMessage];
      double v13 = [v52 peerPaymentMessage];

      if (v13 && [v13 type] == (id)3 && objc_msgSend(v13, "hasBeenSent"))
      {
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_10000F8AC;
        v70[3] = &unk_1000251D0;
        id v71 = v9;
        [(PKPeerPaymentMessagesAppViewController *)self _showRecurringPaymentDetailsForMessage:v13 completion:v70];
        objc_super v27 = v71;
LABEL_37:

LABEL_51:
        unsigned int v24 = 1;
      }
      else
      {
LABEL_38:
        unsigned int v24 = 0;
      }
LABEL_52:

LABEL_53:
      v61 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 > 8) {
          CFStringRef v62 = @"unknown";
        }
        else {
          CFStringRef v62 = off_100025668[a3];
        }
        CFStringRef v63 = @"NO";
        if (v24) {
          CFStringRef v63 = @"YES";
        }
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v62;
        __int16 v81 = 2114;
        CFStringRef v82 = v63;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Handle action: %{public}@, handled: %{public}@", buf, 0x16u);
      }

      if (v9) {
        char v64 = v24;
      }
      else {
        char v64 = 1;
      }
      if ((v64 & 1) == 0) {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }

      return;
    default:
LABEL_32:
      unsigned int v24 = 0;
      goto LABEL_53;
  }
}

- (void)noteReadyForDisplay
{
  if (!self->_readyForDisplay)
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Ready for display.", v4, 2u);
    }

    [(PKPeerPaymentMessagesAppViewController *)self setReadyForDisplay];
    self->_readyForDisplay = 1;
  }
}

- (BOOL)appReadyForDisplay
{
  return self->_readyForDisplay;
}

- (CGSize)contentSize
{
  [(UIView *)self->_rootView bounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)noteContentSizeNeedsUpdate
{
  double v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Requesting content size update", v4, 2u);
  }

  [(PKPeerPaymentMessagesAppViewController *)self requestResize];
}

- (BOOL)_openWallet
{
  double v2 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  double v3 = [v2 associatedPassUniqueID];

  if (PKPassbookIsSupported())
  {
    double v4 = +[NSString stringWithFormat:@"shoebox://card/%@", v3];
    double v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    double v5 = +[NSURL URLWithString:@"prefs:root=PASSBOOK"];
  }
  BOOL v6 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v7 = [v6 openSensitiveURL:v5 withOptions:0];

  return v7;
}

- (void)_showPaymentDetailsForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 transactionIdentifier];
  if (!v6
    || [v6 type] != (id)1
    || ![v6 hasBeenSent]
    || ![v8 length])
  {
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    PKShowAlertForWalletUninstalled();
LABEL_15:
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  if ([(PKPeerPaymentMessagesAppViewController *)self _requiresEnablement])
  {
    double v10 = +[NSMutableDictionary dictionary];
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
    double v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_TITLE");
    [v10 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    double v12 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_MESSAGE");
    [v10 setObject:v12 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

    double v13 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_SETTINGS");
    [v10 setObject:v13 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    id v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_CANCEL");
    [v10 setObject:v14 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

    +[PKUserNotificationAgent presentNotificationWithParameters:v10 flags:0 responseHandler:&stru_100025230];
    goto LABEL_15;
  }
  if ([(PKPeerPaymentMessagesAppViewController *)self _requiresSetupFlow])
  {
    id v15 = +[NSMutableDictionary dictionary];
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
    id v16 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_TITLE");
    [v15 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    id v17 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_MESSAGE");
    [v15 setObject:v17 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

    uint64_t v18 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_SET_UP");
    [v15 setObject:v18 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    id v19 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_CANCEL");
    [v15 setObject:v19 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100010088;
    v26[3] = &unk_100025258;
    v26[4] = self;
    id v27 = v6;
    +[PKUserNotificationAgent presentNotificationWithParameters:v15 flags:0 responseHandler:v26];

    goto LABEL_15;
  }
  id v20 = [(PKPeerPaymentController *)self->_peerPaymentController peerPaymentPass];
  long long v21 = [v20 deviceTransactionSourceIdentifiers];
  id v22 = [v21 anyObject];

  BOOL v23 = PKTransactionDetailsSensitiveURL();
  if (v23)
  {
    PKAnalyticsSendEvent();
    unsigned int v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v29 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Launching transaction details with url: %@", buf, 0xCu);
    }

    id v25 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v9 = (uint64_t)[v25 openSensitiveURL:v23 withOptions:0];
  }
  else
  {
    id v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Could not construct transaction details URL for message: %@", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }

LABEL_8:
  if (v7) {
    v7[2](v7, v9);
  }
}

- (void)_showRecurringPaymentDetailsForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 recurringPaymentIdentifier];
  if (v6
    && [v6 type] == (id)3
    && [v6 hasBeenSent]
    && [v8 length])
  {
    if (PKPassbookIsCurrentlyDeletedByUser())
    {
      PKShowAlertForWalletUninstalled();
      goto LABEL_11;
    }
    if ([(PKPeerPaymentMessagesAppViewController *)self _requiresEnablement])
    {
      uint64_t v9 = +[NSMutableDictionary dictionary];
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      double v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_TITLE");
      [v9 setObject:v10 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

      double v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_MESSAGE");
      [v9 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      double v12 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_SETTINGS");
      [v9 setObject:v12 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      double v13 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_CANCEL");
      [v9 setObject:v13 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

      +[PKUserNotificationAgent presentNotificationWithParameters:v9 flags:0 responseHandler:&stru_100025278];
      goto LABEL_11;
    }
    if ([(PKPeerPaymentMessagesAppViewController *)self _requiresSetupFlow])
    {
      id v14 = +[NSMutableDictionary dictionary];
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      id v15 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_TITLE");
      [v14 setObject:v15 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

      id v16 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_MESSAGE");
      [v14 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      id v17 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_SET_UP");
      [v14 setObject:v17 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      uint64_t v18 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_CANCEL");
      [v14 setObject:v18 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000105C0;
      v24[3] = &unk_100025258;
      v24[4] = self;
      id v25 = v6;
      +[PKUserNotificationAgent presentNotificationWithParameters:v14 flags:0 responseHandler:v24];

LABEL_11:
      uint64_t v19 = 1;
      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    id v20 = +[NSString stringWithFormat:@"https://wallet.apple.com/%@/%@/%@", PKURLActionRoutePeerPaymentPass, PKURLActionRouteRecurringPayment, v8];
    long long v21 = +[NSURL URLWithString:v20];

    id v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Launching recurring payment details with url: %@", buf, 0xCu);
    }

    BOOL v23 = +[LSApplicationWorkspace defaultWorkspace];
    [v23 openURL:v21 configuration:0 completionHandler:0];
  }
  uint64_t v19 = 0;
  if (v7) {
LABEL_17:
  }
    v7[2](v7, v19);
LABEL_18:
}

- (void)localStatusForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 paymentIdentifier];
    if (v8)
    {
      uint64_t v9 = [(PKTransactionSource *)self->_transactionSource transactionSourceIdentifiers];
      double v10 = [v9 anyObject];

      paymentService = self->_paymentService;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100010728;
      v12[3] = &unk_1000252A0;
      id v13 = v6;
      id v14 = self;
      id v15 = v8;
      id v16 = v7;
      [(PKPaymentService *)paymentService transactionWithServiceIdentifier:v15 transactionSourceIdentifier:v10 completion:v12];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)remoteStatusForMessage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [a3 paymentIdentifier];
    if (v7 && PKNetworkConnectivityAvailable())
    {
      peerPaymentController = self->_peerPaymentController;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100010974;
      v9[3] = &unk_1000252C8;
      id v10 = v6;
      [(PKPeerPaymentController *)peerPaymentController statusForPaymentIdentifier:v7 withCompletion:v9];
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (BOOL)_iMessageIsEnabled
{
  if (PKUseMockSURFServer() && PKIsSimulator()) {
    return 1;
  }

  return _PKiMessageIsActive();
}

- (BOOL)_requiresEnablement
{
  if (PKUseMockSURFServer()) {
    return 0;
  }
  double v4 = [(PKPeerPaymentController *)self->_peerPaymentController webService];
  unsigned __int8 v5 = [v4 needsRegistration];

  return v5;
}

- (BOOL)_requiresSetupFlow
{
  double v2 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  if (+[PKPeerPaymentOnDeviceProvisioningCheck peerPaymentPassIsProvisionedOnDeviceForAccount:v2])LOBYTE(v3) = 0; {
  else
  }
    int v3 = PKUseMockSURFServer() ^ 1;

  return v3;
}

- (BOOL)_accountIsLocked
{
  if ((PKUseMockSURFServer() & 1) == 0)
  {
    double v4 = [(PKPeerPaymentController *)self->_peerPaymentController account];
    unint64_t v5 = (unint64_t)[v4 state];
    id v6 = +[PKPassLibrary sharedInstance];
    id v7 = [v4 associatedPassUniqueID];
    id v8 = [v6 passWithUniqueID:v7];

    uint64_t v9 = [v8 paymentPass];
    id v10 = [v9 activationState];
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (([v4 identityVerificationRequired] & 1) == 0)
      {
LABEL_5:
        BOOL v3 = 1;
LABEL_8:

        return v3;
      }
    }
    else if (v5 == 4)
    {
      goto LABEL_5;
    }
    BOOL v3 = v10 == (id)3;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_isGroupConversation
{
  double v2 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
  BOOL v3 = [v2 recipientAddresses];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)_isBusinessConversation
{
  double v2 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
  BOOL v3 = [v2 recipientAddresses];
  BOOL v4 = [v3 firstObject];
  unint64_t v5 = [v4 lowercaseString];

  LOBYTE(v2) = IMStringIsBusinessID();
  return (char)v2;
}

- (id)_senderAddress
{
  double v2 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
  BOOL v3 = [v2 senderAddress];

  return v3;
}

- (id)_recipientAddress
{
  double v2 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
  BOOL v3 = [v2 recipientAddresses];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (void)_confirmSendAmount:(id)a3 toRecipientWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (PKStoreDemoModeEnabled())
    {
      id v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      uint64_t v9 = PKLocalizedString(@"GENERIC_DEMO_MODE_TITLE");
      [v8 setObject:v9 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      id v10 = PKLocalizedString(@"GENERIC_DEMO_MODE_BUTTON");
      [v8 setObject:v10 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100011150;
      v20[3] = &unk_100024D00;
      id v21 = v7;
      +[PKUserNotificationAgent presentNotificationWithParameters:v8 flags:0 responseHandler:v20];
    }
    else if ([(PKPeerPaymentMessagesAppViewController *)self recipientFoundInContacts] {
           || ([(PKPeerPaymentController *)self->_peerPaymentController account],
    }
               double v11 = objc_claimAutoreleasedReturnValue(),
               id v12 = [v11 sendRestrictionType],
               v11,
               v12 != (id)2))
    {
      if ([(PKPeerPaymentMessagesAppViewController *)self _requiresSetupFlow])
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100011190;
        v18[3] = &unk_1000251D0;
        id v19 = v7;
        [(PKPeerPaymentMessagesAppViewController *)self _presentInlineSetupFlowWithAmount:v6 flowState:4 completion:v18];
      }
      else
      {
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      }
    }
    else
    {
      +[PKAnalyticsReporter reportAppleCashSenderErrorPage:PKAnalyticsReportPeerPaymentErrorContactsOnlyPageTag];
      id v13 = +[NSMutableDictionary dictionary];
      [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      id v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_SENDS_TITLE");
      [v13 setObject:v14 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

      id v15 = [(PKPeerPaymentMessagesAppViewController *)self recipientDisplayName];
      id v16 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE", @"%@", v15);
      [v13 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      id v17 = PKLocalizedString(@"OK_BUTTON_TITLE");
      [v13 setObject:v17 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      +[PKUserNotificationAgent presentNotificationWithParameters:v13 flags:0 responseHandler:&stru_1000252E8];
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_confirmRequestAmount:(id)a3 toRecipientWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (PKStoreDemoModeEnabled())
    {
      id v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
      [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
      uint64_t v9 = PKLocalizedString(@"GENERIC_DEMO_MODE_TITLE");
      [v8 setObject:v9 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

      id v10 = PKLocalizedString(@"GENERIC_DEMO_MODE_BUTTON");
      [v8 setObject:v10 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100011644;
      v27[3] = &unk_100024D00;
      id v28 = v7;
      +[PKUserNotificationAgent presentNotificationWithParameters:v8 flags:0 responseHandler:v27];
    }
    else
    {
      if (![(PKPeerPaymentMessagesAppViewController *)self _requiresSetupFlow])
      {
        if ([(PKPeerPaymentMessagesAppViewController *)self recipientFoundInContacts]
          || ([(PKPeerPaymentController *)self->_peerPaymentController account],
              double v11 = objc_claimAutoreleasedReturnValue(),
              id v12 = [v11 sendRestrictionType],
              v11,
              v12 != (id)2))
        {
          id v19 = [(PKPeerPaymentController *)self->_peerPaymentController recipient];
          unsigned __int8 v20 = [v19 allowsFormalPaymentRequests];

          if (v20)
          {
            (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
            goto LABEL_13;
          }
          id v13 = +[NSMutableDictionary dictionary];
          [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
          [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
          id v21 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_TITLE");
          [v13 setObject:v21 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

          id v22 = [(PKPeerPaymentMessagesAppViewController *)self recipientDisplayName];
          BOOL v23 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_FORMAT", @"%@", v22);
          [v13 setObject:v23 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

          unsigned int v24 = PKLocalizedString(@"OK_BUTTON_TITLE");
          [v13 setObject:v24 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

          uint64_t v18 = &stru_100025328;
        }
        else
        {
          id v13 = +[NSMutableDictionary dictionary];
          [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
          [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
          id v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_TITLE");
          [v13 setObject:v14 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

          id v15 = [(PKPeerPaymentMessagesAppViewController *)self recipientDisplayName];
          id v16 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE", @"%@", v15);
          [v13 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

          id v17 = PKLocalizedString(@"OK_BUTTON_TITLE");
          [v13 setObject:v17 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

          uint64_t v18 = &stru_100025308;
        }
        +[PKUserNotificationAgent presentNotificationWithParameters:v13 flags:0 responseHandler:v18];
        (*((void (**)(id, void))v7 + 2))(v7, 0);

        goto LABEL_13;
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100011658;
      v25[3] = &unk_1000251D0;
      id v26 = v7;
      [(PKPeerPaymentMessagesAppViewController *)self _presentInlineSetupFlowWithAmount:v6 flowState:5 completion:v25];
    }
  }
LABEL_13:
}

- (void)_presentInlineSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001173C;
  v9[3] = &unk_100025350;
  id v10 = self;
  id v11 = a3;
  id v12 = a5;
  unint64_t v13 = a4;
  id v7 = v12;
  id v8 = v11;
  [(PKPeerPaymentMessagesAppViewController *)v10 _hostSceneIdentifierForMessageIdentifier:0 withCompletion:v9];
}

- (void)_presentInlineSetupFlowWithPeerPaymentMessage:(id)a3 flowState:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001183C;
  v13[3] = &unk_100025350;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [(PKPeerPaymentMessagesAppViewController *)self _hostSceneIdentifierForMessageIdentifier:v10 withCompletion:v13];
}

- (void)_presentInlineSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 senderAddress:(id)a5 hostSceneIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a7;
  peerPaymentController = self->_peerPaymentController;
  id v31 = a6;
  id v14 = a5;
  id v15 = a3;
  unint64_t v16 = [(PKPeerPaymentController *)peerPaymentController webService];
  id v17 = [v16 peerPaymentService];

  uint64_t v18 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting peer payment setup flow via view service.", buf, 2u);
  }

  if (PKIsPad())
  {
    +[UIApplication sharedApplication];
    id v19 = v30 = v17;
    [v19 windows];
    id v29 = v15;
    id v20 = v14;
    v22 = unint64_t v21 = a4;
    BOOL v23 = [v22 firstObject];
    unsigned int v24 = [v23 windowScene];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 interfaceOrientation]);
    id v25 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

    a4 = v21;
    id v14 = v20;
    id v15 = v29;

    id v17 = v30;
  }
  else
  {
    id v25 = &off_100026618;
  }
  id v26 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  uint64_t v27 = PKMobileSMSBundleIdentifier;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100011B1C;
  v32[3] = &unk_1000251D0;
  id v33 = v12;
  id v28 = v12;
  [v17 presentRegistrationFlowWithAccount:v26 amount:v15 state:a4 senderAddress:v14 orientation:v25 hostSceneIdentifier:v31 hostSceneBundleIdentifier:v27 completion:v32];
}

- (void)_presentSetupFlowWithPeerPaymentMessage:(id)a3 flowState:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a5;
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Presenting peer payment setup flow via url.", (uint8_t *)&v17, 2u);
  }

  id v10 = objc_alloc_init((Class)PKPeerPaymentAccountResolutionControllerConfiguration);
  id v11 = [v7 currencyAmount];
  [v10 setCurrencyAmount:v11];

  [v10 setRegistrationFlowState:a4];
  id v12 = [v7 senderAddress];
  [v10 setSenderAddress:v12];

  unint64_t v13 = PKPeerPaymentGetSetupSensitiveURLWithConfiguration();
  id v14 = +[LSApplicationWorkspace defaultWorkspace];
  id v15 = [v14 openSensitiveURL:v13 withOptions:0];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    if (v15) {
      CFStringRef v16 = @"YES";
    }
    int v17 = 138543362;
    CFStringRef v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer payment setup flow presented with success %{public}@.", (uint8_t *)&v17, 0xCu);
  }

  if (v8) {
    v8[2](v8, v15);
  }
}

- (void)_handleRecipientBecameInvalid:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Recipient became invalid.", buf, 2u);
  }

  if ([(PKPeerPaymentMessagesAppViewController *)self _requiredContentState] != self->_state)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Updating messages content state in response to recipient becoming invalid.", v6, 2u);
    }

    [(PKPeerPaymentMessagesAppViewController *)self _transitionToRequiredContentStateAnimated:1];
  }
}

- (BOOL)_peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  if ([v5 role] == (id)1 && objc_msgSend(v4, "length"))
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v6 objectForKey:@"PKPeerPaymentParticipantSharingMemoMessage"];
    unsigned int v8 = [v7 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_currentRequestTokenForAmount:(id)a3
{
  if (self->_pendingFormalPaymentRequestMesssage)
  {
    BOOL v3 = [(PKPeerPaymentMessage *)self->_pendingFormalPaymentRequestMesssage requestToken];
  }
  else if ([(PKCurrencyAmount *)self->_pendingInformalPaymentRequestAmount isEqual:a3])
  {
    BOOL v3 = +[PKPeerPaymentRequestToken informalRequestToken];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_handleAccountChanged:(id)a3
{
  id v4 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];

  if (v4
    && [(PKPeerPaymentMessagesAppViewController *)self _requiredContentState] != self->_state)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Updating messages content state in response to an account changed notification.", v6, 2u);
    }

    [(PKPeerPaymentMessagesAppViewController *)self _transitionToRequiredContentStateAnimated:0];
  }
}

- (void)_updateWithFamilyCollection:(id)a3
{
  id v8 = a3;
  id v4 = [(PKPeerPaymentController *)self->_peerPaymentController account];
  unint64_t v5 = [(PKPeerPaymentMessagesAppViewController *)self _amountEntryViewController];
  if ([v4 supportsRecurringPayments])
  {
    id v6 = [v8 currentUser];
    if ([v4 isEligibleForRecurringPaymentsForUser:v6]) {
      uint64_t v7 = PKIsVision() ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
    [v5 setShowSetupRecurringSend:v7];
  }
  else
  {
    [v5 setShowSetupRecurringSend:0];
  }
}

- (void)_stagePaymentWithAmount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pendingRecurringPayment = self->_pendingRecurringPayment;
  self->_pendingRecurringPayment = 0;

  PKAnalyticsSendEvent();
  [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012290;
  v11[3] = &unk_100025158;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PKPeerPaymentMessagesAppViewController *)self _confirmSendAmount:v10 toRecipientWithCompletion:v11];
}

- (void)_stageRequestWithAmount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pendingRecurringPayment = self->_pendingRecurringPayment;
  self->_pendingRecurringPayment = 0;

  PKAnalyticsSendEvent();
  [(PKPeerPaymentController *)self->_peerPaymentController selectMode:3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001270C;
  v11[3] = &unk_100025158;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PKPeerPaymentMessagesAppViewController *)self _confirmRequestAmount:v10 toRecipientWithCompletion:v11];
}

- (void)_stageRecurringPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_pendingRecurringPayment, a3);
  [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
  objc_initWeak(&location, self);
  id v9 = [v7 amount];
  id v10 = [v7 currency];
  id v11 = PKCurrencyAmountMake();

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100012C20;
  v15[3] = &unk_100025418;
  id v12 = v7;
  id v16 = v12;
  int v17 = self;
  id v13 = v11;
  id v18 = v13;
  objc_copyWeak(&v20, &location);
  id v14 = v8;
  id v19 = v14;
  [(PKPeerPaymentMessagesAppViewController *)self _confirmSendAmount:v13 toRecipientWithCompletion:v15];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Confirm payment message insertion with peer payment quote: %@", buf, 0xCu);
  }

  if ((id)+[CNContactStore authorizationStatusForEntityType:0] != (id)3)goto LABEL_7; {
  if ([(PKPeerPaymentMessagesAppViewController *)self recipientFoundInContacts])
  }
    goto LABEL_7;
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
  id v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_TITLE");
  [v9 setObject:v10 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  id v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_MESSAGE");
  [v9 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  id v12 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CONTINUE");
  [v9 setObject:v12 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  id v13 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CANCEL");
  [v9 setObject:v13 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

  +[PKAnalyticsReporter reportAppleCashSenderErrorPage:PKAnalyticsReportPeerPaymentErrorNotInContactsPageTag buttonTag:PKAnalyticsReportOkButtonTag];
  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001334C;
    v14[3] = &unk_100025480;
    id v16 = &stru_100025438;
    int v17 = &stru_100025458;
    v14[4] = self;
    id v15 = v6;
    id v18 = v7;
    +[PKUserNotificationAgent presentNotificationWithParameters:v9 flags:0 responseHandler:v14];
  }
  else
  {
LABEL_7:
    [(PKPeerPaymentMessagesAppViewController *)self _insertPaymentMessageWithQuote:v6 completion:v7];
  }
}

- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4
{
  id v6 = (PKPeerPaymentMessage *)a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v50 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Insert payment message with peer payment quote: %@", buf, 0xCu);
  }

  id v9 = [(PKPeerPaymentMessage *)v6 totalReceiveAmount];
  id v10 = [(PKPeerPaymentMessage *)v6 totalReceiveAmountCurrency];
  id v11 = PKCurrencyAmountCreate(v9, v10, 0);

  pendingFormalPaymentRequestMesssage = self->_pendingFormalPaymentRequestMesssage;
  if (pendingFormalPaymentRequestMesssage)
  {
    id v13 = [(PKPeerPaymentMessage *)pendingFormalPaymentRequestMesssage underlyingMessage];
    id v14 = [v13 session];

    if (v14)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = self->_pendingFormalPaymentRequestMesssage;
        *(_DWORD *)long long buf = 138412290;
        v50 = v15;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Found a pending formal payment request message. Inserted message will have session %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  unsigned int v16 = [(PKPeerPaymentMessage *)v6 isRecurringPayment];
  if (v16)
  {
    int v17 = [(PKPeerPaymentMessage *)v6 recurringPaymentIdentifier];

    if (v17)
    {
      id v18 = objc_alloc((Class)MSSession);
      id v19 = objc_alloc((Class)NSUUID);
      id v20 = [(PKPeerPaymentMessage *)v6 recurringPaymentIdentifier];
      id v21 = [v19 initWithUUIDString:v20];
      id v22 = [v18 initWithIdentifier:v21];
      BOOL v23 = v14;
      unsigned int v24 = v11;
      id v25 = v7;
      id v26 = v22;

      uint64_t v27 = 3;
      id v28 = v26;
      id v7 = v25;
      id v11 = v24;
      id v14 = v28;
    }
    else
    {
      uint64_t v27 = 3;
    }
  }
  else
  {
    uint64_t v27 = 1;
  }
  id v29 = [objc_alloc((Class)PKPeerPaymentMessage) initWithType:v27 session:v14];
  [v29 setCurrencyAmount:v11];
  id v30 = [(PKPeerPaymentMessagesAppViewController *)self _senderAddress];
  [v29 setSenderAddress:v30];

  id v31 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddress];
  [v29 setRecipientAddress:v31];

  id v32 = [objc_alloc((Class)PKPeerPaymentMessageLocalProperties) initWithSource:2];
  [v29 setLocalProperties:v32];

  id v33 = self->_pendingFormalPaymentRequestMesssage;
  if (v33)
  {
    id v34 = [(PKPeerPaymentMessage *)v33 memo];
    [v29 setMemo:v34];

    id v35 = [(PKPeerPaymentMessage *)self->_pendingFormalPaymentRequestMesssage requestToken];
    [v29 setRequestToken:v35];
  }
  if (v16)
  {
    id v36 = [(PKPeerPaymentMessage *)v6 startDate];
    [v29 setRecurringPaymentStartDate:v36];

    [v29 setRecurringPaymentFrequency:[v6 frequency]];
    id v37 = [(PKPeerPaymentRecurringPayment *)self->_pendingRecurringPayment memo];
    [v29 setRecurringPaymentMemo:v37];
  }
  objc_storeStrong((id *)&self->_stagedPeerPaymentMessage, v29);
  char v38 = +[PKMessagesAppSharedContext sharedContext];
  id v39 = [(PKPeerPaymentController *)self->_peerPaymentController externalizedControllerState];
  v40 = [v29 identifier];
  [v38 persistExternalizedControllerState:v39 forMessageIdentifier:v40];

  v41 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
  __int16 v42 = [v29 underlyingMessage];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000138D0;
  v45[3] = &unk_1000254F8;
  id v46 = v29;
  v47 = self;
  id v48 = v7;
  id v43 = v7;
  id v44 = v29;
  [v41 insertMessage:v42 completionHandler:v45];
}

- (void)_insertRequestMessageWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Insert request with amount: %@ requestToken: %@", buf, 0x16u);
  }

  id v12 = objc_alloc_init((Class)PKPeerPaymentMessage);
  [v12 setType:2];
  [v12 setCurrencyAmount:v8];
  [v12 setRequestToken:v9];
  id v13 = [(PKPeerPaymentMessagesAppViewController *)self _senderAddress];
  [v12 setSenderAddress:v13];

  id v14 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddress];
  [v12 setRecipientAddress:v14];

  id v15 = [objc_alloc((Class)PKPeerPaymentMessageLocalProperties) initWithSource:2];
  [v12 setLocalProperties:v15];

  objc_storeStrong((id *)&self->_stagedPeerPaymentMessage, v12);
  unsigned int v16 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
  int v17 = [v12 underlyingMessage];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100013EB0;
  v20[3] = &unk_1000254F8;
  id v21 = v12;
  id v22 = self;
  id v23 = v10;
  id v18 = v10;
  id v19 = v12;
  [v16 insertMessage:v17 completionHandler:v20];
}

- (void)_handleError:(id)a3
{
}

- (void)_handleError:(id)a3 forAction:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  switch((unint64_t)+[PKPeerPaymentController proposedResolutionForError:v8])
  {
    case 0uLL:
      if (v9) {
        v9[2](v9, 1);
      }
      break;
    case 1uLL:
      uint64_t v15 = +[PKPeerPaymentController displayableErrorForError:v8];

      [(PKPeerPaymentMessagesAppViewController *)self _presentAlertWithDisplayableError:v15];
      if (v9) {
        v9[2](v9, 1);
      }
      id v8 = (id)v15;
      break;
    case 2uLL:
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Displaying terms acceptance flow...", buf, 2u);
      }

      peerPaymentController = self->_peerPaymentController;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100014574;
      v27[3] = &unk_100025520;
      unint64_t v29 = a4;
      void v27[4] = self;
      id v28 = v9;
      [(PKPeerPaymentController *)peerPaymentController handleTermsAcceptanceRequiredWithError:v8 completion:v27];
      id v12 = v28;
      goto LABEL_11;
    case 3uLL:
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Displaying identity verification flow...", buf, 2u);
      }

      if (PKDeviceSupportsPeerPaymentIdentityVerification())
      {
        id v14 = self->_peerPaymentController;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000146CC;
        v22[3] = &unk_100025520;
        unint64_t v24 = a4;
        v22[4] = self;
        id v23 = v9;
        [(PKPeerPaymentController *)v14 handleIdentityVerificationWithError:v8 completion:v22];
        id v12 = v23;
LABEL_11:
      }
      else
      {
        unsigned int v16 = PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported();
        int v17 = [v16 title];
        id v18 = [v16 message];
        id v19 = [v16 actions];
        id v20 = [v19 firstObject];
        id v21 = [v20 title];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000146B0;
        v25[3] = &unk_100024B70;
        __int16 v26 = v9;
        [(PKPeerPaymentMessagesAppViewController *)self _presentAlertWithTitle:v17 message:v18 buttonTitle:v21 completion:v25];
      }
      break;
    default:
      break;
  }
}

- (void)_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:(id)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000148D0;
  block[3] = &unk_100025548;
  id v9 = a3;
  id v10 = a4;
  block[4] = self;
  id v6 = v9;
  id v7 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_presentAlertWithDisplayableError:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  unint64_t v5 = +[PKAnalyticsReporter pageTagForAppleCashSenderError:v3];
  +[PKAnalyticsReporter reportAppleCashSenderErrorPage:v5];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
  id v6 = PKTitleForDisplayableError();
  [v4 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  id v7 = PKMessageForDisplayableError();
  [v4 setObject:v7 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  id v8 = PKLocalizedString(@"OK_BUTTON_TITLE");
  [v4 setObject:v8 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100014FE4;
  v24[3] = &unk_1000249B8;
  id v9 = v5;
  id v25 = v9;
  id v10 = objc_retainBlock(v24);
  id v11 = [v3 localizedRecoveryOptions];
  id v12 = [v11 firstObject];

  id v13 = [v3 userInfo];

  id v14 = [v13 objectForKeyedSubscript:PKErrorRecoveryURLKey];

  if (v12 && v14)
  {
    uint64_t v15 = PKLocalizedString(@"CANCEL_BUTTON_TITLE");
    [v4 setObject:v15 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    [v4 setObject:v12 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100015004;
    v22[3] = &unk_1000249B8;
    id v23 = v9;
    unsigned int v16 = objc_retainBlock(v22);

    id v10 = v16;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015024;
  v19[3] = &unk_100024EC8;
  id v20 = v14;
  id v21 = v10;
  int v17 = v10;
  id v18 = v14;
  +[PKUserNotificationAgent presentNotificationWithParameters:v4 flags:0 responseHandler:v19];
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"com.apple.messages.surf"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.messages.datadetectors.currency"] & 1) != 0|| ([v7 isEqualToString:@"com.apple.messages.appLaunchURLPluginPayload"] & 1) != 0)
  {
    id v8 = [v6 objectForKeyedSubscript:@"Currency"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v39 = self;
      v40 = v8;
      v41 = v7;
      __int16 v42 = v6;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v49;
        id v43 = v9;
LABEL_8:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v49 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(NSObject **)(*((void *)&v48 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v15 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              v53 = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Text input payload currency array contains non-dictionary type: %@", buf, 0xCu);
            }
            goto LABEL_29;
          }
          uint64_t v15 = [v14 objectForKeyedSubscript:@"CurrencyType"];
          unsigned int v16 = [v14 objectForKeyedSubscript:@"CurrencyValue"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
LABEL_18:
            id v18 = v17;
            if (v15) {
              BOOL v19 = v17 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v20 = +[NSDecimalNumber notANumber];
                unsigned int v21 = [v18 isEqualToNumber:v20];

                if (!v21)
                {
                  id v25 = PKCurrencyDecimalAmountRound();

                  id v23 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v25 currency:v15 exponent:0];
                  if (!v23) {
                    goto LABEL_48;
                  }
                  __int16 v26 = [(PKPeerPaymentMessagesAppViewController *)v39 currentBalance];
                  id v27 = [v26 currency];

                  id v28 = [v23 currency];
                  unsigned __int8 v24 = [v28 isEqualToString:v27];
                  if (v24)
                  {
                    unint64_t v29 = [v23 amount];
                    id v30 = [(PKPeerPaymentMessagesAppViewController *)v39 minimumTransferAmount];
                    id v31 = [(PKPeerPaymentMessagesAppViewController *)v39 maximumTransferAmount];
                    id v32 = v23;
                    if (v30 && [v29 compare:v30] == (id)-1)
                    {
                      id v33 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138412546;
                        v53 = v29;
                        __int16 v54 = 2112;
                        v55 = v30;
                        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Suggested amount %@ is less than the minimum transfer amount %@. Using minimum transfer amount instead.", buf, 0x16u);
                      }

                      id v34 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v30 currency:v27 exponent:0];
                      id v32 = v34;
                    }
                    if (v31 && [v29 compare:v31] == (id)1)
                    {
                      id v35 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138412546;
                        v53 = v29;
                        __int16 v54 = 2112;
                        v55 = v31;
                        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Suggested amount %@ is greater than the maximum transfer amount %@. Using maximum transfer amount instead.", buf, 0x16u);
                      }

                      id v36 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v31 currency:v27 exponent:0];
                      id v32 = v36;
                    }
                    block[0] = _NSConcreteStackBlock;
                    block[1] = 3221225472;
                    block[2] = sub_100015848;
                    block[3] = &unk_100025570;
                    id v45 = v32;
                    id v46 = v42;
                    v47 = v39;
                    id v37 = v32;
                    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
                  }
                  else
                  {
                    unint64_t v29 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412546;
                      v53 = v28;
                      __int16 v54 = 2112;
                      v55 = v27;
                      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Suggested amount's currency %@ does not match account currency %@", buf, 0x16u);
                    }
                  }

LABEL_57:
                  id v6 = v42;
                  goto LABEL_58;
                }
                id v9 = v43;
              }
            }
            goto LABEL_26;
          }
          id v18 = 0;
LABEL_26:
          id v22 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v53 = v14;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Text input payload currency amount dictionary does not contain appropriate values: %@", buf, 0xCu);
          }

LABEL_29:
          if (v11 == (id)++v13)
          {
            id v11 = [v9 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v11) {
              goto LABEL_8;
            }
            goto LABEL_31;
          }
        }
        id v17 = +[NSDecimalNumber decimalNumberWithString:v16];
        goto LABEL_18;
      }
LABEL_31:

LABEL_48:
      id v23 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v24 = 0;
        goto LABEL_57;
      }
      *(_DWORD *)long long buf = 138412290;
      id v6 = v42;
      v53 = v42;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No valid currency amount was found in text input payload: %@", buf, 0xCu);
      unsigned __int8 v24 = 0;
LABEL_58:
      id v8 = v40;
      id v7 = v41;
    }
    else
    {
      id v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v53 = v6;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Text input payload does not contain a currency array. Payload: %@", buf, 0xCu);
      }
      unsigned __int8 v24 = 0;
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v53 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received text input payload for unhandled payloadID: %@", buf, 0xCu);
    }
    unsigned __int8 v24 = 0;
  }

  return v24;
}

- (void)_donatePeerPaymentInteractionForMessage:(id)a3
{
  id v4 = [a3 peerPaymentMessage];
  if (v4)
  {
    id v12 = v4;
    id v5 = [v4 type];
    id v6 = [(PKPeerPaymentMessagesAppViewController *)self _recipientPersonForIntentDonation];
    id v7 = [(PKPeerPaymentMessagesAppViewController *)self _inCurrencyAmountForPeerPaymentMessage:v12];
    id v8 = [v12 memo];
    if (v5 == (id)2)
    {
      id v9 = [objc_alloc((Class)INRequestPaymentIntent) initWithPayer:v6 currencyAmount:v7 note:v8];
    }
    else
    {
      if (v5 != (id)1)
      {
LABEL_8:

        id v4 = v12;
        goto LABEL_9;
      }
      id v9 = [objc_alloc((Class)INSendPaymentIntent) initWithPayee:v6 currencyAmount:v7 note:v8];
    }
    id v10 = v9;
    if (v9)
    {
      [v9 _setLaunchId:PKMobileSMSBundleIdentifier];
      [v10 _setExtensionBundleId:PKIntentsExtensionBundleIdentifier];
      [v10 _setUiExtensionBundleId:PKIntentsUIExtensionBundleIdentifier];
      id v11 = [objc_alloc((Class)INInteraction) initWithIntent:v10 response:0];
      [v11 _donateInteractionWithBundleId:0 completion:&stru_1000255B0];
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_inCurrencyAmountForPeerPaymentMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 amount];
  id v5 = [v3 currency];

  id v6 = 0;
  if (v4 && v5) {
    id v6 = [objc_alloc((Class)INCurrencyAmount) initWithAmount:v4 currencyCode:v5];
  }

  return v6;
}

- (id)_recipientPersonForIntentDonation
{
  id v3 = [(PKPeerPaymentMessagesAppViewController *)self _recipientAddress];
  id v4 = v3;
  if (v3)
  {
    if ([v3 containsString:@"@"]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    id v6 = [objc_alloc((Class)INPersonHandle) initWithValue:v4 type:v5];
    id v7 = [(PKPeerPaymentController *)self->_peerPaymentController contactForHandle:v4];
    id v8 = [v7 identifier];
    id v9 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v4 contact:v7];
    id v10 = [v7 nameComponents];
    id v11 = [objc_alloc((Class)INPerson) initWithPersonHandle:v6 nameComponents:v10 displayName:v9 image:0 contactIdentifier:v8 customIdentifier:v8];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_handlePaymentRequestMessage:(id)a3
{
  id v5 = a3;
  id v6 = [v5 type];
  id v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == (id)2)
  {
    if (v8)
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Handle Payment Request Message: %@", (uint8_t *)&v17, 0xCu);
    }

    id v7 = [v5 currency];
    uint64_t v9 = [v5 amount];
    id v10 = (NSDecimalNumber *)v9;
    if (v7) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v12 = !v11;
    if (!v11)
    {
      uint64_t v13 = [(PKPeerPaymentMessagesAppViewController *)self _amountEntryViewController];
      id v14 = PKCurrencyAmountCreate(v10, (NSString *)&v7->isa, 0);
      [v13 setAmount:v14];

      objc_storeStrong((id *)&self->_pendingFormalPaymentRequestMesssage, a3);
      pendingInformalPaymentRequestAmount = self->_pendingInformalPaymentRequestAmount;
      self->_pendingInformalPaymentRequestAmount = 0;
    }
  }
  else
  {
    if (v8)
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Asked to handle a Payment Message of incorrect type: %@", (uint8_t *)&v17, 0xCu);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_handleUpdatedTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v5 = a3;
  if ((id)[(PKPeerPaymentMessagesAppViewController *)self _requiredContentState] == (id)12)
  {
    id v6 = [v5 serviceIdentifier];
    id v7 = [(PKPeerPaymentMessagesAppViewController *)self activeConversation];
    BOOL v8 = [v7 selectedMessage];
    uint64_t v9 = [v8 peerPaymentMessage];

    id v10 = [v9 transactionIdentifier];
    if ([v10 isEqualToString:v6])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015FEC;
      block[3] = &unk_1000249B8;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)enableLiveBubbleDebugMode
{
  if (!self->_debugBallView)
  {
    id v3 = [objc_alloc((Class)PKShapeView) initWithFrame:0.0, 0.0, 10.0, 10.0];
    debugBallView = self->_debugBallView;
    self->_debugBallView = v3;

    id v5 = [(PKShapeView *)self->_debugBallView shapeLayer];
    id v6 = +[UIColor redColor];
    [v5 setFillColor:[v6 CGColor]];

    id v7 = [(PKShapeView *)self->_debugBallView shapeLayer];
    [(PKShapeView *)self->_debugBallView center];
    double v9 = v8;
    double v11 = v10;
    [(PKShapeView *)self->_debugBallView bounds];
    +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v11, CGRectGetWidth(v33) * 0.5, 0.0, 6.28318531);
    id v12 = objc_claimAutoreleasedReturnValue();
    [v7 setPath:[v12 CGPath]];

    [(UIView *)self->_rootView addSubview:self->_debugBallView];
    uint64_t v13 = (UIDynamicAnimator *)[objc_alloc((Class)UIDynamicAnimator) initWithReferenceView:self->_rootView];
    debugAnimator = self->_debugAnimator;
    self->_debugAnimator = v13;

    id v15 = objc_alloc((Class)UIGravityBehavior);
    id v32 = self->_debugBallView;
    unsigned int v16 = +[NSArray arrayWithObjects:&v32 count:1];
    id v17 = [v15 initWithItems:v16];

    [(UIDynamicAnimator *)self->_debugAnimator addBehavior:v17];
    id v18 = objc_alloc((Class)UICollisionBehavior);
    id v31 = self->_debugBallView;
    BOOL v19 = +[NSArray arrayWithObjects:&v31 count:1];
    id v20 = [v18 initWithItems:v19];

    [v20 setTranslatesReferenceBoundsIntoBoundary:1];
    [(UIDynamicAnimator *)self->_debugAnimator addBehavior:v20];
    id v21 = objc_alloc((Class)UIDynamicItemBehavior);
    id v30 = self->_debugBallView;
    id v22 = +[NSArray arrayWithObjects:&v30 count:1];
    id v23 = [v21 initWithItems:v22];

    [v23 setElasticity:0.6];
    [v23 setFriction:0.2];
    [(UIDynamicAnimator *)self->_debugAnimator addBehavior:v23];
    unsigned __int8 v24 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    debugMotionManager = self->_debugMotionManager;
    self->_debugMotionManager = v24;

    if ([(CMMotionManager *)self->_debugMotionManager isDeviceMotionAvailable])
    {
      [(CMMotionManager *)self->_debugMotionManager setDeviceMotionUpdateInterval:0.1];
      __int16 v26 = self->_debugMotionManager;
      id v27 = +[NSOperationQueue mainQueue];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100016410;
      v28[3] = &unk_1000255D8;
      id v29 = v17;
      [(CMMotionManager *)v26 startDeviceMotionUpdatesToQueue:v27 withHandler:v28];
    }
  }
}

- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3
{
  return self->_currentHostSceneIdentifier;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3
{
  return PKMobileSMSBundleIdentifier;
}

- (void)stageRecurringPayment:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016540;
  v7[3] = &unk_1000251D0;
  id v8 = a4;
  id v6 = v8;
  [(PKPeerPaymentMessagesAppViewController *)self _stageRecurringPayment:a3 completion:v7];
}

- (void)recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:(id)a3
{
}

- (void)_reportAnalyticsForState
{
  unint64_t v2 = self->_state - 5;
  if (v2 <= 9 && ((0x30Bu >> v2) & 1) != 0) {
    id v3 = *(id *)*(&off_1000256B0 + v2);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  if ([v3 length]) {
    +[PKAnalyticsReporter reportAppleCashSenderErrorPage:v4];
  }
}

- (void)_reportAnalyticsViewAppearedWithArchivedParent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKAnalyticsSubjectAppleCash;
  id v6 = +[PKAnalyticsReporter reporterForSubject:PKAnalyticsSubjectAppleCash];

  if (!v6)
  {
    if (v4) {
      +[PKAnalyticsReporter beginSubjectReporting:v5 withArchivedParent:v4];
    }
    else {
      +[PKAnalyticsReporter beginSubjectReporting:v5];
    }
  }
  v12[0] = PKAnalyticsReportPeerPaymentFeatureType;
  v11[0] = PKAnalyticsReportFeatureTypeKey;
  v11[1] = PKAnalyticsReportPageTagKey;
  id v7 = [(PKPeerPaymentMessagesAppViewController *)self _analyticsPageTag];
  v12[1] = v7;
  v12[2] = PKAnalyticsReportEventTypeViewDidAppear;
  v11[2] = PKAnalyticsReportEventKey;
  v11[3] = PKAnalyticsReportPeerPaymentP2PSideKey;
  v12[3] = PKAnalyticsReportPeerPaymentP2PSideSender;
  id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v9 = [v8 mutableCopy];

  double v10 = [(PKPeerPaymentMessagesAppViewController *)self _analyticsP2PContext];
  [v9 safelySetObject:v10 forKey:PKAnalyticsReportPeerPaymentP2PContextKey];

  +[PKAnalyticsReporter subject:v5 sendEvent:v9];
  [(PKPeerPaymentMessagesAppViewController *)self _reportAnalyticsForState];
}

- (void)_reportAnalyticsViewDisappeared
{
  v12[0] = PKAnalyticsReportPeerPaymentFeatureType;
  v11[0] = PKAnalyticsReportFeatureTypeKey;
  v11[1] = PKAnalyticsReportPageTagKey;
  id v3 = [(PKPeerPaymentMessagesAppViewController *)self _analyticsPageTag];
  v12[1] = v3;
  v12[2] = PKAnalyticsReportEventTypeViewDidDisappear;
  v11[2] = PKAnalyticsReportEventKey;
  v11[3] = PKAnalyticsReportPeerPaymentP2PSideKey;
  v12[3] = PKAnalyticsReportPeerPaymentP2PSideSender;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v5 = [v4 mutableCopy];

  id v6 = [(PKPeerPaymentMessagesAppViewController *)self _analyticsP2PContext];
  [v5 safelySetObject:v6 forKey:PKAnalyticsReportPeerPaymentP2PContextKey];

  uint64_t v7 = PKAnalyticsSubjectAppleCash;
  +[PKAnalyticsReporter subject:PKAnalyticsSubjectAppleCash sendEvent:v5];
  if (!self->_stagedPeerPaymentMessage) {
    goto LABEL_4;
  }
  if (self->_messageSource != 2) {
    goto LABEL_4;
  }
  id v8 = +[PKMessagesAppSharedContext sharedContext];
  id v9 = [(PKPeerPaymentMessage *)self->_stagedPeerPaymentMessage identifier];
  double v10 = [v8 externalizedControllerStateForMessageIdentifier:v9];

  if (!v10) {
LABEL_4:
  }
    +[PKAnalyticsReporter endSubjectReporting:v7];
}

- (void)_reportAnalyticsButtonTap:(id)a3
{
  v8[0] = PKAnalyticsReportFeatureTypeKey;
  v8[1] = PKAnalyticsReportPageTagKey;
  v9[0] = PKAnalyticsReportPeerPaymentFeatureType;
  v9[1] = PKAnalyticsReportPeerPaymentP2PMessagePageTag;
  v8[2] = PKAnalyticsReportEventKey;
  v8[3] = PKAnalyticsReportButtonTagKey;
  v9[2] = PKAnalyticsReportEventTypeButtonTap;
  v9[3] = a3;
  v8[4] = PKAnalyticsReportPeerPaymentP2PSideKey;
  void v9[4] = PKAnalyticsReportPeerPaymentP2PSideSender;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  id v6 = [v5 mutableCopy];

  uint64_t v7 = [(PKPeerPaymentMessagesAppViewController *)self _analyticsP2PContext];
  [v6 safelySetObject:v7 forKey:PKAnalyticsReportPeerPaymentP2PContextKey];

  +[PKAnalyticsReporter subject:PKAnalyticsSubjectAppleCash sendEvent:v6];
}

- (id)_analyticsPageTag
{
  if (self->_messageSource == 2) {
    unint64_t v2 = (id *)&PKAnalyticsReportPeerPaymentAmountSelectionPageTag;
  }
  else {
    unint64_t v2 = (id *)&PKAnalyticsReportPeerPaymentP2PMessagePageTag;
  }
  return *v2;
}

- (id)_analyticsP2PContext
{
  unint64_t messageSource = self->_messageSource;
  if (messageSource == 1 || messageSource == 3)
  {
    id v4 = (id *)&PKAnalyticsReportPeerPaymentP2PContextWallet;
LABEL_10:
    id v6 = *v4;
    goto LABEL_12;
  }
  if (messageSource == 2)
  {
    id v5 = [(PKPeerPaymentMessagesAppViewController *)self presentationStyle];
    id v4 = (id *)&PKAnalyticsReportPeerPaymentP2PContextMessages;
    if (v5 != (id)1) {
      id v4 = (id *)&PKAnalyticsReportPeerPaymentP2PContextMessagesCompact;
    }
    goto LABEL_10;
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

- (PKTransactionSource)transactionSource
{
  return self->_transactionSource;
}

- (unint64_t)messageSource
{
  return self->_messageSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_currentHostSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_debugMotionManager, 0);
  objc_storeStrong((id *)&self->_debugAnimator, 0);
  objc_storeStrong((id *)&self->_debugBallView, 0);
  objc_storeStrong((id *)&self->_stagedPeerPaymentMessage, 0);
  objc_storeStrong((id *)&self->_pendingRecurringPayment, 0);
  objc_storeStrong((id *)&self->_pendingInformalPaymentRequestAmount, 0);
  objc_storeStrong((id *)&self->_pendingFormalPaymentRequestMesssage, 0);
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_activeViewController, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_viewControllerForState, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end