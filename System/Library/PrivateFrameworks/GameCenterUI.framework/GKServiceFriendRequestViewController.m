@interface GKServiceFriendRequestViewController
- (BOOL)_useBackdropViewForWindowBackground;
- (BOOL)messageComposeSent;
- (BOOL)shouldAnimatePresentationForPrivateViewController:(id)a3;
- (GKServiceFriendRequestViewController)init;
- (MFMessageComposeViewController)composeController;
- (NSArray)recipients;
- (NSString)chatGUID;
- (NSString)friendCode;
- (NSString)friendSupportPageURL;
- (NSString)hostApp;
- (void)constructPrivateViewController;
- (void)displayAlertWithTitle:(id)a3 andMessage:(id)a4;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setChatGUID:(id)a3;
- (void)setComposeController:(id)a3;
- (void)setFriendCode:(id)a3;
- (void)setFriendSupportPageURL:(id)a3;
- (void)setHostApp:(id)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setMessageComposeSent:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKServiceFriendRequestViewController

- (GKServiceFriendRequestViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKServiceFriendRequestViewController;
  v2 = [(GKServiceViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKServiceViewController *)v2 setAlwaysShowDoneButton:1];
  }
  return v3;
}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKServiceFriendRequestViewController;
  [(GKServiceViewController *)&v9 viewWillAppear:a3];
  v4 = [(GKServiceFriendRequestViewController *)self navigationBar];
  [v4 setHidden:1];

  objc_super v5 = [MEMORY[0x1E4F639B0] sharedPalette];
  v6 = [v5 viewBackgroundColor];
  v7 = [v6 colorWithAlphaComponent:0.0];
  v8 = [(GKServiceFriendRequestViewController *)self view];
  [v8 setBackgroundColor:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKServiceFriendRequestViewController;
  [(GKServiceViewController *)&v8 viewDidAppear:a3];
  v4 = [MEMORY[0x1E4F63660] reporter];
  [v4 recordPageWithID:@"MessageCompose" pageContext:&stru_1F07B2408 pageType:@"inviteFriend"];

  objc_super v5 = [(GKServiceFriendRequestViewController *)self view];
  v6 = [v5 window];
  v7 = [v6 _rootSheetPresentationController];
  [v7 _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 objectForKeyedSubscript:@"GKFriendCodeKey"];
  [(GKServiceFriendRequestViewController *)self setFriendCode:v8];

  objc_super v9 = [v7 objectForKeyedSubscript:@"GKFriendSupportPageURLKey"];
  [(GKServiceFriendRequestViewController *)self setFriendSupportPageURL:v9];

  v10 = [v7 objectForKeyedSubscript:@"GKFriendRecipientsKey"];
  [(GKServiceFriendRequestViewController *)self setRecipients:v10];

  v11 = [v7 objectForKeyedSubscript:@"GKChatGUIDKey"];
  [(GKServiceFriendRequestViewController *)self setChatGUID:v11];

  v12 = [v7 objectForKeyedSubscript:@"GKHostAppKey"];
  [(GKServiceFriendRequestViewController *)self setHostApp:v12];

  v13.receiver = self;
  v13.super_class = (Class)GKServiceFriendRequestViewController;
  [(GKServiceViewController *)&v13 setInitialState:v7 withReply:v6];
}

- (BOOL)shouldAnimatePresentationForPrivateViewController:(id)a3
{
  return 1;
}

- (void)constructPrivateViewController
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(GKServiceFriendRequestViewController *)self setMessageComposeSent:0];
  v3 = objc_alloc_init(GKMessageComposeViewController);
  [(GKServiceFriendRequestViewController *)self setComposeController:v3];
  [(GKServiceViewController *)self setPrivateViewController:v3];
  [(GKMessageComposeViewController *)v3 setMessageComposeDelegate:self];
  [(GKMessageComposeViewController *)v3 setGkComposeDelegate:self];
  v4 = [(GKServiceFriendRequestViewController *)self friendSupportPageURL];
  if (v4)
  {
    objc_super v5 = [(GKServiceFriendRequestViewController *)self friendCode];

    if (v5)
    {
      id v6 = objc_opt_new();
      id v7 = [(GKServiceFriendRequestViewController *)self friendSupportPageURL];
      [v6 setFriendSupportPageURL:v7];

      objc_super v8 = [(GKServiceFriendRequestViewController *)self friendCode];
      [v6 setFriendCode:v8];

      [v6 setFriendRequestState:@"1"];
      objc_super v9 = [MEMORY[0x1E4F63760] local];
      [v6 setInitiator:v9];

      [v6 setFriendRequestVersion:@"1"];
      v4 = [MEMORY[0x1E4F1CB10] _gkGenerateFriendRequestURL:v6];
    }
    else
    {
      v4 = 0;
    }
  }
  v10 = (void *)MEMORY[0x1E4F35150];
  v11 = objc_opt_new();
  v12 = [v10 friendInviteMessageWithUrl:v4 session:v11];

  [(GKMessageComposeViewController *)v3 setMessage:v12];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14 = [(GKServiceFriendRequestViewController *)self chatGUID];

  if (v14)
  {
    v15 = [(GKServiceFriendRequestViewController *)self chatGUID];
    [(GKMessageComposeViewController *)v3 setChatGUID:v15];
  }
  else
  {
    v26 = v12;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v16 = [(GKServiceFriendRequestViewController *)self recipients];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v22 = [v21 suggestedHandle];

          if (v22)
          {
            v23 = [v21 suggestedHandle];
            [v13 addObject:v23];
          }
          else
          {
            v23 = +[GKUnifiedRecipient recipientForContact:v21];
            v24 = [v23 handle];

            if (v24)
            {
              v25 = [v23 handle];
              [v13 addObject:v25];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    [(GKMessageComposeViewController *)v3 setRecipients:v13];
    v12 = v26;
  }
  v27.receiver = self;
  v27.super_class = (Class)GKServiceFriendRequestViewController;
  [(GKServiceViewController *)&v27 constructPrivateViewController];
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 2:
      v12 = [MEMORY[0x1E4F637F8] reporter];
      [v12 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63168]];

      objc_super v9 = [MEMORY[0x1E4F63660] reporter];
      [v9 recordClickWithAction:@"error" targetId:@"error" targetType:@"button" pageId:@"MessageCompose" pageType:@"inviteFriend"];
      goto LABEL_11;
    case 1:
      [(GKServiceFriendRequestViewController *)self setMessageComposeSent:1];
      id v13 = [MEMORY[0x1E4F637F8] reporter];
      [v13 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63180]];

      v14 = [MEMORY[0x1E4F63660] reporter];
      [v14 recordClickWithAction:@"send" targetId:@"send" targetType:@"button" pageId:@"MessageCompose" pageType:@"inviteFriend"];

      objc_super v9 = [MEMORY[0x1E4F63660] reporter];
      v11 = [(GKServiceFriendRequestViewController *)self hostApp];
      [v9 recordFriendInviteActivityEventAtStage:1 hostApp:v11];
      goto LABEL_10;
    case 0:
      id v7 = [MEMORY[0x1E4F637F8] reporter];
      [v7 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63148]];

      if (![(GKServiceFriendRequestViewController *)self messageComposeSent])
      {
        objc_super v8 = [MEMORY[0x1E4F63660] reporter];
        [v8 recordClickWithAction:@"cancel" targetId:@"cancel" targetType:@"button" pageId:@"MessageCompose" pageType:@"inviteFriend"];

        objc_super v9 = [MEMORY[0x1E4F63760] local];
        if ([v9 isAuthenticated])
        {
          v10 = [(GKServiceFriendRequestViewController *)self friendCode];

          if (v10)
          {
            objc_super v9 = [MEMORY[0x1E4F63760] local];
            v11 = [(GKServiceFriendRequestViewController *)self friendCode];
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke;
            v16[3] = &unk_1E5F63240;
            v16[4] = self;
            [v9 cancelFriendRequestWithIdentifier:v11 handler:v16];
LABEL_10:

            goto LABEL_11;
          }
          break;
        }
LABEL_11:
      }
      break;
  }
  v15 = [(GKServiceFriendRequestViewController *)self composeController];
  [v15 dismissViewControllerAnimated:1 completion:0];

  [(GKServiceFriendRequestViewController *)self setComposeController:0];
}

void __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    objc_super v5 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F637F8] reporter];
    [v6 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63150]];

    [*(id *)(a1 + 32) setFriendCode:0];
  }
}

- (void)displayAlertWithTitle:(id)a3 andMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__GKServiceFriendRequestViewController_displayAlertWithTitle_andMessage___block_invoke;
  v9[3] = &unk_1E5F63350;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __73__GKServiceFriendRequestViewController_displayAlertWithTitle_andMessage___block_invoke(uint64_t a1)
{
  CFOptionFlags v5 = 0;
  CFStringRef v1 = *(const __CFString **)(a1 + 32);
  CFStringRef v2 = *(const __CFString **)(a1 + 40);
  id v3 = GKGameCenterUIFrameworkBundle();
  GKGetLocalizedStringFromTableInBundle();
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUserNotificationDisplayAlert(30.0, 0, 0, 0, 0, v1, v2, v4, 0, 0, &v5);
}

- (MFMessageComposeViewController)composeController
{
  return self->_composeController;
}

- (void)setComposeController:(id)a3
{
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
}

- (NSString)friendSupportPageURL
{
  return self->_friendSupportPageURL;
}

- (void)setFriendSupportPageURL:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
}

- (NSString)hostApp
{
  return self->_hostApp;
}

- (void)setHostApp:(id)a3
{
}

- (BOOL)messageComposeSent
{
  return self->_messageComposeSent;
}

- (void)setMessageComposeSent:(BOOL)a3
{
  self->_messageComposeSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApp, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_friendSupportPageURL, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);

  objc_storeStrong((id *)&self->_composeController, 0);
}

void __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "cancelFriendRequest error: %@", (uint8_t *)&v2, 0xCu);
}

@end