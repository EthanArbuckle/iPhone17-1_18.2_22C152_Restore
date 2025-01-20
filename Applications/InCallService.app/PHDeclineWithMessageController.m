@interface PHDeclineWithMessageController
+ (id)dismissalAssertionReason;
- (NSString)cachedPreviouslyUsedLastAddressHandle;
- (NSString)displayName;
- (PHDeclineCallServiceProtocol)declineCallService;
- (PHDeclineWithMessageController)initWithIncomingCall:(id)a3 customMessagePresentingViewController:(id)a4 declineCallService:(id)a5;
- (TUCall)incomingCall;
- (TUHandle)recipientHandle;
- (TUReplyWithMessageStore)cachedReplyStore;
- (UIViewController)customMessagePresentingViewController;
- (id)replyWithMessageStore;
- (int)addressBookIdentifier;
- (void)configureDeclineMessageForButton:(id)a3;
- (void)declineCall;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)openDefaultMessagingApp;
- (void)sendDeclineViaChatKitWithMessageResponse:(id)a3;
- (void)sendDeclineViaIntentWithMessageResponse:(id)a3 extension:(id)a4;
- (void)sendDeclineWithMessageResponse:(id)a3;
- (void)setCachedPreviouslyUsedLastAddressHandle:(id)a3;
- (void)setCachedReplyStore:(id)a3;
- (void)setContextForCustomReplyWithSubscriptionIdentifier:(id)a3;
- (void)setCustomMessagePresentingViewController:(id)a3;
- (void)setDeclineCallService:(id)a3;
- (void)setIncomingCall:(id)a3;
- (void)showCustomReplyWithMessageComposer;
@end

@implementation PHDeclineWithMessageController

- (void)configureDeclineMessageForButton:(id)a3
{
  id v4 = a3;
  [v4 setContextMenuEnabled:1];
  [v4 setContextMenuIsPrimary:1];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D05D4;
  v5[3] = &unk_1002D0350;
  objc_copyWeak(&v6, &location);
  [v4 _setMenuProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (PHDeclineWithMessageController)initWithIncomingCall:(id)a3 customMessagePresentingViewController:(id)a4 declineCallService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PHDeclineWithMessageController;
  v12 = [(PHDeclineWithMessageController *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_incomingCall, a3);
    objc_storeWeak((id *)&v13->_customMessagePresentingViewController, v10);
    cachedPreviouslyUsedLastAddressHandle = v13->_cachedPreviouslyUsedLastAddressHandle;
    v13->_cachedPreviouslyUsedLastAddressHandle = (NSString *)&stru_1002D6110;

    objc_storeStrong((id *)&v13->_declineCallService, a5);
  }

  return v13;
}

+ (id)dismissalAssertionReason
{
  return @"PHDeclineWithMessageControllerAssertionReason";
}

- (TUHandle)recipientHandle
{
  v3 = [(PHDeclineWithMessageController *)self incomingCall];
  id v4 = [v3 handle];

  id v34 = v4;
  v5 = [v4 value];
  unsigned int v6 = [v5 destinationIdIsPseudonym];

  if (!v6) {
    goto LABEL_19;
  }
  v7 = +[TUCallCenter sharedInstance];
  v8 = [(PHDeclineWithMessageController *)self incomingCall];
  id v9 = [v7 activeConversationForCall:v8];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = [v9 remoteMembers];
  id v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v11) {
    goto LABEL_18;
  }
  id v12 = v11;
  v33 = v9;
  uint64_t v13 = *(void *)v37;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      if ([v15 validationSource] == (id)2)
      {
        uint64_t v16 = [v15 association];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [v15 association];
          if ([v18 type] != (id)2) {
            goto LABEL_14;
          }
          v19 = [v15 association];
          if (([v19 isPrimary] & 1) == 0)
          {

LABEL_14:
            continue;
          }
          [v15 association];
          v21 = v20 = v10;
          v22 = [v21 handle];
          unsigned int v35 = [v22 isEqualToHandle:v34];

          id v10 = v20;
          if (v35)
          {
            uint64_t v23 = [v15 handle];

            id v34 = (id)v23;
            goto LABEL_17;
          }
        }
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v12);
LABEL_17:
  id v9 = v33;
LABEL_18:

LABEL_19:
  if ([v34 type] == (id)2)
  {
    v24 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage();
    v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      TUActiveCountryCode();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;

    v28 = [v34 value];
    v29 = TUNetworkCountryCode();
    v30 = TUNumberToDial();

    id v31 = [objc_alloc((Class)TUHandle) initWithType:2 value:v30];
    id v34 = v31;
  }

  return (TUHandle *)v34;
}

- (NSString)displayName
{
  v2 = [(PHDeclineWithMessageController *)self incomingCall];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (int)addressBookIdentifier
{
  v2 = [(PHDeclineWithMessageController *)self incomingCall];
  int v3 = [v2 abUID];

  return v3;
}

- (void)declineCall
{
  declineCallService = self->_declineCallService;
  id v3 = [(PHDeclineWithMessageController *)self incomingCall];
  [(PHDeclineCallServiceProtocol *)declineCallService declineAnsweringWithCall:v3 anayticsSourceForDismissal:@"SBSUIInCallTransitionAnalyticsSourceDeclineWithMessage" reason:4 completionHandler:&stru_1002D0370];
}

- (id)replyWithMessageStore
{
  cachedReplyStore = self->_cachedReplyStore;
  if (!cachedReplyStore)
  {
    id v4 = (TUReplyWithMessageStore *)objc_alloc_init((Class)TUReplyWithMessageStore);
    v5 = self->_cachedReplyStore;
    self->_cachedReplyStore = v4;

    cachedReplyStore = self->_cachedReplyStore;
  }

  return cachedReplyStore;
}

- (void)sendDeclineWithMessageResponse:(id)a3
{
  id v4 = a3;
  v5 = [(PHDeclineWithMessageController *)self recipientHandle];
  unsigned int v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "response: %@ recipientHandle: %@", (uint8_t *)&v22, 0x16u);
  }

  v7 = [v5 value];
  unsigned __int8 v8 = [v7 destinationIdIsPseudonym];

  if (v8) {
    goto LABEL_12;
  }
  id v9 = [v5 value];
  if (![v9 length])
  {

    goto LABEL_12;
  }
  id v10 = [v4 length];

  if (!v10)
  {
LABEL_12:
    v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001EBE38();
    }

    goto LABEL_15;
  }
  id v11 = +[CNKFeatures sharedInstance];
  if ([v11 isSADMessagesEnabled])
  {
    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned int v13 = [v12 applicationIsInstalled:@"com.apple.MobileSMS"];

    if (!v13)
    {
      v14 = sub_1000D5130();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Messages app not installed, trying to open default messaging app", (uint8_t *)&v22, 2u);
      }

      [(PHDeclineWithMessageController *)self openDefaultMessagingApp];
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v16 = [(PHDeclineWithMessageController *)self incomingCall];
  v17 = [v16 sendMessageIntentExtension];

  v18 = sub_1000D5130();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using send message intent to send response", (uint8_t *)&v22, 2u);
    }

    [(PHDeclineWithMessageController *)self sendDeclineViaIntentWithMessageResponse:v4 extension:v17];
  }
  else
  {
    if (v19)
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using ChatKit to send response", (uint8_t *)&v22, 2u);
    }

    [(PHDeclineWithMessageController *)self sendDeclineViaChatKitWithMessageResponse:v4];
    v20 = [(PHDeclineWithMessageController *)self displayName];
    v21 = [v5 value];
    [(PHDeclineWithMessageController *)self addressBookIdentifier];
    TUNotifyOfReplyWithMessage();
  }
LABEL_15:
}

- (void)openDefaultMessagingApp
{
  v2 = [(PHDeclineWithMessageController *)self recipientHandle];
  id v3 = objc_alloc((Class)NSURLQueryItem);
  id v4 = [v2 value];
  id v5 = [v3 initWithName:@"addresses" value:v4];

  id v6 = objc_alloc_init((Class)NSURLComponents);
  [v6 setScheme:@"im"];
  [v6 setPath:@"open"];
  id v15 = v5;
  v7 = +[NSArray arrayWithObjects:&v15 count:1];
  [v6 setQueryItems:v7];

  unsigned __int8 v8 = [v6 URL];
  uint64_t v14 = 0;
  int v9 = TUOpenURLWithError();
  id v10 = 0;

  id v11 = sub_1000D5130();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully opened default messaging app", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_1001EBEBC();
  }
}

- (void)showCustomReplyWithMessageComposer
{
  id v3 = +[CNKFeatures sharedInstance];
  if ([v3 isSADMessagesEnabled])
  {
    id v4 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned __int8 v5 = [v4 applicationIsInstalled:@"com.apple.MobileSMS"];

    if ((v5 & 1) == 0)
    {
      id v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Messages app not installed, trying to open default messaging app", buf, 2u);
      }

      [(PHDeclineWithMessageController *)self openDefaultMessagingApp];
      [(PHDeclineWithMessageController *)self declineCall];
      return;
    }
  }
  else
  {
  }
  v7 = [(PHDeclineWithMessageController *)self incomingCall];
  unsigned __int8 v8 = [v7 provider];
  unsigned int v9 = [v8 isSystemProvider];

  id v10 = [(PHDeclineWithMessageController *)self incomingCall];
  id v11 = v10;
  if (v9)
  {
    id v12 = [v10 localSenderIdentity];
    unsigned int v13 = [v12 accountUUID];
    uint64_t v14 = [v13 UUIDString];
    [(PHDeclineWithMessageController *)self setContextForCustomReplyWithSubscriptionIdentifier:v14];

    id v15 = objc_alloc_init(PHMessageComposeViewController);
    uint64_t v16 = [(PHDeclineWithMessageController *)self recipientHandle];
    v17 = [v16 value];
    id v23 = v17;
    v18 = +[NSArray arrayWithObjects:&v23 count:1];
    [(PHMessageComposeViewController *)v15 setRecipients:v18];

    [(PHMessageComposeViewController *)v15 setBody:&stru_1002D6110];
    [(PHMessageComposeViewController *)v15 setMessageComposeDelegate:self];
    [(PHMessageComposeViewController *)v15 _setCanEditRecipients:0];
    [(PHMessageComposeViewController *)v15 disableUserAttachments];
    BOOL v19 = [(PHDeclineWithMessageController *)self customMessagePresentingViewController];
    [v19 presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    unsigned int v20 = [v10 hasSendCustomMessageCapability];

    if (!v20) {
      return;
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000D1768;
    v21[3] = &unk_1002CD540;
    v21[4] = self;
    id v15 = objc_retainBlock(v21);
    [(PHDeclineWithMessageController *)self declineCall];
    BOOL v19 = +[PHInCallUtilities sharedInstance];
    [v19 requestPasscodeUnlockWithCompletion:v15];
  }
}

- (void)sendDeclineViaChatKitWithMessageResponse:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "response: %@", buf, 0xCu);
  }

  id v6 = +[IMDaemonController sharedInstance];
  v7 = +[NSBundle mainBundle];
  unsigned __int8 v8 = [v7 bundleIdentifier];
  [v6 addListenerID:v8 capabilities:(kFZListenerCapChats | kFZListenerCapAccounts)];

  unsigned int v9 = +[IMDaemonController sharedInstance];
  [v9 _setBlocksConnectionAtResume:1];

  if (qword_100326270 != -1) {
    dispatch_once(&qword_100326270, &stru_1002D03B8);
  }
  id v10 = +[IMSystemMonitor sharedInstance];
  [v10 _forceSuspended];

  id v11 = +[IMSystemMonitor sharedInstance];
  [v11 _forceResumed];

  id v12 = (void (*)(void *, id, void *))off_100326268;
  unsigned int v13 = [(PHDeclineWithMessageController *)self recipientHandle];
  uint64_t v14 = [v13 value];
  unsigned int v20 = v14;
  id v15 = +[NSArray arrayWithObjects:&v20 count:1];
  uint64_t v16 = [(PHDeclineWithMessageController *)self incomingCall];
  v17 = [v16 localSenderIdentity];
  v18 = [v17 accountUUID];
  BOOL v19 = [v18 UUIDString];
  v12(v15, v4, v19);
}

- (void)setContextForCustomReplyWithSubscriptionIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setContextForCustomReplyWithSubscriptionIdenitifier: %@", buf, 0xCu);
  }

  id v6 = +[IMDaemonController sharedInstance];
  v7 = +[NSBundle mainBundle];
  unsigned __int8 v8 = [v7 bundleIdentifier];
  [v6 addListenerID:v8 capabilities:(kFZListenerCapChats | kFZListenerCapAccounts)];

  unsigned int v9 = +[IMDaemonController sharedInstance];
  [v9 _setBlocksConnectionAtResume:1];

  if (qword_100326280 != -1) {
    dispatch_once(&qword_100326280, &stru_1002D03D8);
  }
  if (off_100326278)
  {
    id v10 = +[IMSystemMonitor sharedInstance];
    [v10 _forceSuspended];

    id v11 = +[IMSystemMonitor sharedInstance];
    [v11 _forceResumed];

    id v12 = (void (*)(void *, id))off_100326278;
    unsigned int v13 = [(PHDeclineWithMessageController *)self recipientHandle];
    uint64_t v14 = [v13 value];
    v17 = v14;
    id v15 = +[NSArray arrayWithObjects:&v17 count:1];
    uint64_t v16 = v12(v15, v4);

    [(PHDeclineWithMessageController *)self setCachedPreviouslyUsedLastAddressHandle:v16];
  }
}

- (void)sendDeclineViaIntentWithMessageResponse:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "response: %@", buf, 0xCu);
  }

  unsigned int v9 = [(PHDeclineWithMessageController *)self recipientHandle];
  id v10 = [v9 personHandle];

  id v11 = [objc_alloc((Class)INPerson) initWithPersonHandle:v10 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
  id v12 = objc_alloc((Class)INSendMessageIntent);
  id v33 = v11;
  unsigned int v13 = +[NSArray arrayWithObjects:&v33 count:1];
  id v14 = [v12 initWithRecipients:v13 content:v6 groupName:0 serviceName:0 sender:0];

  id v15 = +[AFPreferences sharedPreferences];
  uint64_t v16 = [v15 languageCode];

  if (v16)
  {
    id v17 = objc_alloc_init((Class)NSExtensionItem);
    uint64_t v31 = _INExtensionItemSiriLanguageCodeKey;
    v32 = v16;
    v18 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v17 setUserInfo:v18];

    id v30 = v17;
    id v19 = +[NSArray arrayWithObjects:&v30 count:1];
  }
  else
  {
    id v19 = &__NSArray0__struct;
  }
  unsigned int v20 = sub_1000D5130();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v7;
    __int16 v28 = 2112;
    v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Beginning extension request for %@ with input items: %@", buf, 0x16u);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D2334;
  v23[3] = &unk_1002D0448;
  id v24 = v7;
  id v25 = v14;
  id v21 = v14;
  id v22 = v7;
  [v22 beginExtensionRequestWithOptions:1 inputItems:v19 completion:v23];
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1) {
      [(PHDeclineWithMessageController *)self declineCall];
    }
  }
  else if ([(NSString *)self->_cachedPreviouslyUsedLastAddressHandle length])
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedPreviouslyUsedLastAddressHandle = self->_cachedPreviouslyUsedLastAddressHandle;
      int v10 = 138412290;
      id v11 = cachedPreviouslyUsedLastAddressHandle;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting Context to: %@ as user cancelled custom reply", (uint8_t *)&v10, 0xCu);
    }

    [(PHDeclineWithMessageController *)self setContextForCustomReplyWithSubscriptionIdentifier:self->_cachedPreviouslyUsedLastAddressHandle];
  }
  unsigned int v9 = self->_cachedPreviouslyUsedLastAddressHandle;
  self->_cachedPreviouslyUsedLastAddressHandle = (NSString *)&stru_1002D6110;

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
}

- (TUCall)incomingCall
{
  return (TUCall *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncomingCall:(id)a3
{
}

- (UIViewController)customMessagePresentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customMessagePresentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setCustomMessagePresentingViewController:(id)a3
{
}

- (TUReplyWithMessageStore)cachedReplyStore
{
  return (TUReplyWithMessageStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedReplyStore:(id)a3
{
}

- (NSString)cachedPreviouslyUsedLastAddressHandle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedPreviouslyUsedLastAddressHandle:(id)a3
{
}

- (PHDeclineCallServiceProtocol)declineCallService
{
  return (PHDeclineCallServiceProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeclineCallService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineCallService, 0);
  objc_storeStrong((id *)&self->_cachedPreviouslyUsedLastAddressHandle, 0);
  objc_storeStrong((id *)&self->_cachedReplyStore, 0);
  objc_destroyWeak((id *)&self->_customMessagePresentingViewController);

  objc_storeStrong((id *)&self->_incomingCall, 0);
}

@end