@interface PKPeerPaymentRemoteMessagesComposer
- (BOOL)_recipientFoundInContacts;
- (PKPeerPaymentController)peerPaymentController;
- (PKPeerPaymentRemoteMessagesComposer)initWithPeerPaymentController:(id)a3 presentingViewController:(id)a4 actionType:(int64_t)a5 sourceType:(unint64_t)a6;
- (int64_t)actionType;
- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4;
- (void)_handleError:(id)a3;
- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4;
- (void)_insertRequestMessageWithAmount:(id)a3 completion:(id)a4;
- (void)_presentPeerPaymentMessage:(id)a3 completion:(id)a4;
- (void)_showAlertForInvalidRecipientWithName:(id)a3 statusReason:(unint64_t)a4 completion:(id)a5;
- (void)_showAlertForInvalidStateIfNeededWithCompletion:(id)a3;
- (void)presentRemoteMessageComposerWithAmount:(id)a3 requestToken:(id)a4 memo:(id)a5 sessionID:(id)a6 overViewController:(id)a7 completion:(id)a8;
- (void)presentRemoteMessageComposerWithRecurringPayment:(id)a3 overViewController:(id)a4 completion:(id)a5;
- (void)setActionType:(int64_t)a3;
- (void)validateRecipientWithAddress:(id)a3 completion:(id)a4;
@end

@implementation PKPeerPaymentRemoteMessagesComposer

- (PKPeerPaymentRemoteMessagesComposer)initWithPeerPaymentController:(id)a3 presentingViewController:(id)a4 actionType:(int64_t)a5 sourceType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRemoteMessagesComposer;
  v13 = [(PKPeerPaymentRemoteMessagesComposer *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_peerPaymentController, a3);
    objc_storeWeak((id *)&v14->_presentingViewController, v12);
    v14->_actionType = a5;
    v14->_sourceType = a6;
  }

  return v14;
}

- (void)validateRecipientWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007C90;
  v10[3] = &unk_100024BE8;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(PKPeerPaymentRemoteMessagesComposer *)self _showAlertForInvalidStateIfNeededWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)presentRemoteMessageComposerWithAmount:(id)a3 requestToken:(id)a4 memo:(id)a5 sessionID:(id)a6 overViewController:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_storeStrong((id *)&self->_memo, a5);
  objc_storeStrong((id *)&self->_requestToken, a4);
  objc_storeWeak((id *)&self->_presentingViewController, v18);
  if (v17)
  {
    id v20 = objc_alloc((Class)MSSession);
    id v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:v17];
    v22 = (MSSession *)[v20 initWithIdentifier:v21];
    session = self->_session;
    self->_session = v22;
  }
  objc_initWeak(&location, self);
  int64_t actionType = self->_actionType;
  if (actionType)
  {
    if (actionType == 1)
    {
      [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
      unint64_t v25 = self->_sourceType - 1;
      if (v25 > 2) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = qword_10001BB68[v25];
      }
      peerPaymentController = self->_peerPaymentController;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100008514;
      v35[3] = &unk_100024C38;
      objc_copyWeak(&v37, &location);
      id v36 = v19;
      [(PKPeerPaymentController *)peerPaymentController quoteWithAmount:v14 source:v26 requestToken:v15 alternateFundingSource:0 preserveCurrentBalance:0 recurringPaymentIdentifier:0 frequency:0 startDate:0 threshold:0 completion:v35];

      objc_destroyWeak(&v37);
    }
    else
    {
      v29 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v40 = actionType;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for action type: %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    [(PKPeerPaymentController *)self->_peerPaymentController selectMode:3];
    v27 = self->_peerPaymentController;
    if (self->_sourceType - 1 >= 3) {
      unint64_t sourceType = 0;
    }
    else {
      unint64_t sourceType = self->_sourceType;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100008778;
    v31[3] = &unk_100024C88;
    objc_copyWeak(&v34, &location);
    id v32 = v14;
    id v33 = v19;
    [(PKPeerPaymentController *)v27 formalRequestTokenForAmount:v32 source:sourceType completion:v31];

    objc_destroyWeak(&v34);
  }
  objc_destroyWeak(&location);
}

- (void)presentRemoteMessageComposerWithRecurringPayment:(id)a3 overViewController:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v25 = a4;
  id v26 = a5;
  objc_storeWeak((id *)&self->_presentingViewController, v25);
  objc_initWeak(&location, self);
  int64_t actionType = self->_actionType;
  if (actionType == 2)
  {
    objc_storeStrong((id *)&self->_recurringPayment, a3);
    id v11 = [v9 amount];
    id v12 = [v9 currency];
    id v13 = PKCurrencyAmountMake();

    id v14 = +[PKPassLibrary sharedInstance];
    id v15 = [v9 fundingSource];
    id v16 = [v15 fpanIdentifier];
    v24 = [v14 passWithFPANIdentifier:v16];

    if ([v9 usesAppleCashBalance]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
    unint64_t v18 = self->_sourceType - 1;
    if (v18 > 2) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = qword_10001BB68[v18];
    }
    peerPaymentController = self->_peerPaymentController;
    id v20 = [v9 identifier];
    id v21 = [v9 frequency];
    v22 = [v9 startDate];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100008D30;
    v27[3] = &unk_100024CD8;
    objc_copyWeak(&v30, &location);
    v27[4] = self;
    id v28 = v9;
    id v29 = v26;
    [(PKPeerPaymentController *)peerPaymentController quoteWithAmount:v13 source:v23 requestToken:0 alternateFundingSource:v24 preserveCurrentBalance:v17 recurringPaymentIdentifier:v20 frequency:v21 startDate:v22 threshold:0 completion:v27];

    objc_destroyWeak(&v30);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v33 = actionType;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for non-recurring payment action type: %ld", buf, 0xCu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)_showAlertForInvalidStateIfNeededWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (!PKNetworkConnectivityAvailable())
  {
    id v6 = @"PEER_PAYMENT_INTERNET_CONNECTION_ERROR_MESSAGE";
    id v7 = @"PEER_PAYMENT_INTERNET_CONNECTION_ERROR_TITLE";
LABEL_7:
    id v8 = PKLocalizedPeerPaymentString(&v7->isa);
    [v4 setObject:v8 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    v5 = &kCFUserNotificationAlertMessageKey;
    goto LABEL_8;
  }
  if (!+[MFMessageComposeViewController isiMessageEnabled])
  {
    id v6 = @"PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_MESSAGE";
    id v7 = @"PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_TITLE";
    goto LABEL_7;
  }
  if (+[MFMessageComposeViewController canSendText]) {
    goto LABEL_9;
  }
  v5 = &kCFUserNotificationAlertHeaderKey;
  id v6 = @"PEER_PAYMENT_MESSAGES_UNAVAILABLE_ERROR_TITLE";
LABEL_8:
  id v9 = PKLocalizedPeerPaymentString(&v6->isa);
  [v4 setObject:v9 forKeyedSubscript:*v5];

  v10 = PKLocalizedString(@"OK_BUTTON_TITLE");
  [v4 setObject:v10 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

LABEL_9:
  if ([v4 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009208;
    v11[3] = &unk_100024D00;
    id v12 = v3;
    +[PKUserNotificationAgent presentNotificationWithParameters:v4 responseHandler:v11];
  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

- (void)_showAlertForInvalidRecipientWithName:(id)a3 statusReason:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  if (a4 < 2)
  {
    v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE");
    [v9 setObject:v10 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    id v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_INVALID_RECIPIENT_ERROR_FORMAT", @"%@", v7);
    id v12 = &stru_100024D60;
    id v13 = &PKAnalyticsReportPeerPaymentErrorInvalidRecipientPageTag;
LABEL_6:
    [v9 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

    id v15 = PKLocalizedString(@"OK_BUTTON_TITLE");
    [v9 setObject:v15 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*v13];
    goto LABEL_7;
  }
  if (a4 == 2)
  {
    id v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE");
    [v9 setObject:v14 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    id v11 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_FAMILY_RESTRICTED_MESSAGE");
    id v12 = &stru_100024D80;
    id v13 = &PKAnalyticsReportPeerPaymentErrorFamilyOnlyPageTag;
    goto LABEL_6;
  }
  id v12 = &stru_100024D40;
LABEL_7:
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000947C;
  v17[3] = &unk_100024DA8;
  unint64_t v18 = v12;
  id v19 = v8;
  id v16 = v8;
  +[PKUserNotificationAgent presentNotificationWithParameters:v9 responseHandler:v17];
}

- (BOOL)_recipientFoundInContacts
{
  BOOL v6 = 0;
  peerPaymentController = self->_peerPaymentController;
  id v3 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
  id v4 = [(PKPeerPaymentController *)peerPaymentController displayNameForRecipientAddress:v3 foundInContacts:&v6];

  return v6;
}

- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Confirm payment message insertion with peer payment quote: %@", buf, 0xCu);
  }

  if ([(PKPeerPaymentRemoteMessagesComposer *)self _recipientFoundInContacts]
    || ([(PKPeerPaymentController *)self->_peerPaymentController account],
        id v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = [v9 sendRestrictionType] == (id)2,
        v9,
        !v10))
  {
    if ((id)+[CNContactStore authorizationStatusForEntityType:0] != (id)3|| [(PKPeerPaymentRemoteMessagesComposer *)self _recipientFoundInContacts])
    {
      goto LABEL_11;
    }
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
    id v19 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_TITLE");
    [v11 setObject:v19 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    id v20 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_MESSAGE");
    [v11 setObject:v20 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

    id v21 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CONTINUE");
    [v11 setObject:v21 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    id v14 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CANCEL");
    [v11 setObject:v14 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    uint64_t v17 = 0;
    id v15 = &stru_100024E28;
    id v16 = &PKAnalyticsReportPeerPaymentErrorNotInContactsPageTag;
    unint64_t v18 = &stru_100024E08;
  }
  else
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
    id v12 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE");
    [v11 setObject:v12 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

    id v13 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE");
    [v11 setObject:v13 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

    id v14 = PKLocalizedString(@"OK_BUTTON_TITLE");
    [v11 setObject:v14 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
    id v15 = &stru_100024DC8;
    id v16 = &PKAnalyticsReportPeerPaymentErrorContactsOnlyPageTag;
    uint64_t v17 = 3;
    unint64_t v18 = &stru_100024DE8;
  }

  +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*v16];
  if (!v11)
  {
LABEL_11:
    [(PKPeerPaymentRemoteMessagesComposer *)self _insertPaymentMessageWithQuote:v6 completion:v7];
    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100009A04;
  v22[3] = &unk_100024E50;
  objc_copyWeak(v27, (id *)buf);
  v24 = v18;
  id v25 = v15;
  v27[1] = (id)v17;
  id v23 = v6;
  id v26 = v7;
  +[PKUserNotificationAgent presentNotificationWithParameters:v11 responseHandler:v22];

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert payment message with peer payment quote: %@", (uint8_t *)&v21, 0xCu);
  }

  id v9 = [v6 totalReceiveAmount];
  BOOL v10 = [v6 totalReceiveAmountCurrency];
  id v11 = PKCurrencyAmountCreate(v9, v10, 0);

  unsigned int v12 = [v6 isRecurringPayment];
  if (v12) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 1;
  }
  id v14 = objc_alloc_init((Class)PKPeerPaymentMessageLocalProperties);
  [v14 setSource:1];
  id v15 = +[PKAnalyticsReporter archivedSessionTokenForSubject:PKAnalyticsSubjectAppleCash];
  [v14 setAnalyticsSessionToken:v15];

  id v16 = [objc_alloc((Class)PKPeerPaymentMessage) initWithType:v13 session:self->_session];
  [v16 setCurrencyAmount:v11];
  uint64_t v17 = [(PKPeerPaymentController *)self->_peerPaymentController senderPhoneOrEmail];
  [v16 setSenderAddress:v17];

  unint64_t v18 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
  [v16 setRecipientAddress:v18];

  [v16 setLocalProperties:v14];
  if (self->_memo) {
    [v16 setMemo:];
  }
  if (self->_requestToken) {
    [v16 setRequestToken:];
  }
  if (v12)
  {
    id v19 = [v6 startDate];
    [v16 setRecurringPaymentStartDate:v19];

    objc_msgSend(v16, "setRecurringPaymentFrequency:", objc_msgSend(v6, "frequency"));
    id v20 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment memo];
    [v16 setRecurringPaymentMemo:v20];
  }
  [(PKPeerPaymentRemoteMessagesComposer *)self _presentPeerPaymentMessage:v16 completion:v7];
}

- (void)_insertRequestMessageWithAmount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    requestToken = self->_requestToken;
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    unint64_t v18 = requestToken;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert request with amount: %@ requestToken: %@", (uint8_t *)&v15, 0x16u);
  }

  id v10 = objc_alloc_init((Class)PKPeerPaymentMessageLocalProperties);
  [v10 setSource:1];
  id v11 = +[PKAnalyticsReporter archivedSessionTokenForSubject:PKAnalyticsSubjectAppleCash];
  [v10 setAnalyticsSessionToken:v11];

  id v12 = [objc_alloc((Class)PKPeerPaymentMessage) initWithType:2 session:self->_session];
  [v12 setCurrencyAmount:v6];
  [v12 setRequestToken:self->_requestToken];
  uint64_t v13 = [(PKPeerPaymentController *)self->_peerPaymentController senderPhoneOrEmail];
  [v12 setSenderAddress:v13];

  id v14 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
  [v12 setRecipientAddress:v14];

  [v12 setLocalProperties:v10];
  if (self->_memo) {
    [v12 setMemo:];
  }
  [(PKPeerPaymentRemoteMessagesComposer *)self _presentPeerPaymentMessage:v12 completion:v7];
}

- (void)_presentPeerPaymentMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PKMessagesAppSharedContext sharedContext];
  id v9 = [(PKPeerPaymentController *)self->_peerPaymentController externalizedControllerState];
  id v10 = [v6 identifier];
  [v8 persistExternalizedControllerState:v9 forMessageIdentifier:v10];

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A08C;
  v13[3] = &unk_100024EA0;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleError:(id)a3
{
  id v3 = a3;
  id v4 = +[PKPeerPaymentController displayableErrorForError:v3];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = +[PKAnalyticsReporter pageTagForAppleCashSenderError:v3];

  +[PKAnalyticsReporter reportAppleCashSenderErrorPage:v6];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationDontDismissOnUnlock];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationAllowMenuButtonDismissal];
  id v7 = PKTitleForDisplayableError();
  [v5 setObject:v7 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  id v8 = PKMessageForDisplayableError();
  [v5 setObject:v8 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  id v9 = PKLocalizedString(@"OK_BUTTON_TITLE");
  [v5 setObject:v9 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000A6C0;
  v25[3] = &unk_1000249B8;
  id v10 = v6;
  id v26 = v10;
  id v11 = objc_retainBlock(v25);
  id v12 = [v4 localizedRecoveryOptions];
  uint64_t v13 = [v12 firstObject];

  id v14 = [v4 userInfo];
  id v15 = [v14 objectForKeyedSubscript:PKErrorRecoveryURLKey];

  if (v13 && v15)
  {
    id v16 = PKLocalizedString(@"CANCEL_BUTTON_TITLE");
    [v5 setObject:v16 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    [v5 setObject:v13 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000A6E0;
    v23[3] = &unk_1000249B8;
    id v24 = v10;
    __int16 v17 = objc_retainBlock(v23);

    id v11 = v17;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000A700;
  v20[3] = &unk_100024EC8;
  id v21 = v15;
  id v22 = v11;
  unint64_t v18 = v11;
  id v19 = v15;
  +[PKUserNotificationAgent presentNotificationWithParameters:v5 responseHandler:v20];
}

- (PKPeerPaymentController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_int64_t actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_composeController, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end