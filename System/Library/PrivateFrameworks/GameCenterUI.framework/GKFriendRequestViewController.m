@interface GKFriendRequestViewController
+ (void)addFriends:(id)a3;
+ (void)addFriends:(id)a3 recipients:(id)a4;
+ (void)presentAlertControllerOn:(id)a3 withMessage:(id)a4 andTitle:(id)a5;
+ (void)presentFriendRequestOn:(id)a3 forRecipients:(id)a4 withFriendCode:(id)a5 andFriendSupportPageURL:(id)a6;
- (GKFriendRequestViewController)init;
- (GKFriendRequestViewControllerDelegate)delegate;
- (NSArray)recipients;
- (NSString)chatGUID;
- (NSString)friendCode;
- (NSString)friendSupportPageURL;
- (NSString)hostApp;
- (UIViewController)requestingViewController;
- (id)_presentingViewController;
- (id)serviceSideViewControllerClassName;
- (void)notifyDelegateOnWillFinish;
- (void)setChatGUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFriendCode:(id)a3;
- (void)setFriendSupportPageURL:(id)a3;
- (void)setHostApp:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRequestingViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation GKFriendRequestViewController

- (GKFriendRequestViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKFriendRequestViewController;
  v2 = [(GKHostedViewController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F636F0] currentGame];
    v4 = [v3 bundleIdentifier];
    [(GKFriendRequestViewController *)v2 setHostApp:v4];
  }
  return v2;
}

- (id)serviceSideViewControllerClassName
{
  return @"GKServiceFriendRequestViewController";
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKFriendRequestViewController;
  [(GKHostedViewController *)&v4 viewDidDisappear:a3];
  v3 = [MEMORY[0x1E4F63760] local];
  [v3 setIsShowingFriendRequestUI:0];
}

- (void)notifyDelegateOnWillFinish
{
  id v3 = [(GKFriendRequestViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 friendRequestControllerDidFinish:self];
  }
}

- (id)_presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestingViewController);

  return WeakRetained;
}

+ (void)addFriends:(id)a3
{
}

+ (void)addFriends:(id)a3 recipients:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    v8 = [v7 keyWindow];
    id v5 = [v8 rootViewController];
  }
  if (![MEMORY[0x1E4F350F8] canSendText])
  {
    v13 = [MEMORY[0x1E4F637F8] reporter];
    [v13 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63158]];

    v12 = GKGameCenterUIFrameworkBundle();
    goto LABEL_7;
  }
  v9 = [MEMORY[0x1E4F637E8] shared];
  char v10 = [v9 isAddingFriendsRestricted];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F637F8] reporter];
    [v11 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63178]];

    v12 = GKGameCenterUIFrameworkBundle();
LABEL_7:
    v14 = GKGetLocalizedStringFromTableInBundle();
    v15 = GKGameCenterUIFrameworkBundle();
    v16 = GKGetLocalizedStringFromTableInBundle();
    +[GKFriendRequestViewController presentAlertControllerOn:v5 withMessage:v14 andTitle:v16];

    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x1E4F636D8];
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendRequestViewController.m", 86, "+[GKFriendRequestViewController addFriends:recipients:]");
  v19 = [v17 dispatchGroupWithName:v18];

  v20 = [MEMORY[0x1E4F637E8] shared];
  int v21 = [v20 fetchFriendCodeInExtensionEnabled];

  if (v21)
  {
    +[GKFriendRequestViewController presentFriendRequestOn:v5 forRecipients:v6 withFriendCode:0 andFriendSupportPageURL:0];
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __55__GKFriendRequestViewController_addFriends_recipients___block_invoke;
    v27[3] = &unk_1E5F63650;
    id v28 = v19;
    [v28 perform:v27];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_26;
  v23[3] = &unk_1E5F63E80;
  id v24 = v19;
  id v25 = v5;
  id v26 = v6;
  id v22 = v19;
  [v22 notifyOnMainQueueWithBlock:v23];

LABEL_12:
}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [MEMORY[0x1E4F63760] local];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2;
  v8[3] = &unk_1E5F657E0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [v4 createFriendRequestWithIdentifier:v6 handler:v8];
}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v10 = (id)GKOSLoggers();
    }
    v11 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2_cold_1((uint64_t)v9, v11);
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F637F8] reporter];
    [v12 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63160]];

    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"friendCode"];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"friendSupportPageURL"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_26(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friendCode"];

  if (v2)
  {
    id v3 = [MEMORY[0x1E4F63760] local];
    [v3 setIsShowingFriendRequestUI:1];

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friendCode"];
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friendSupportPageURL"];
    +[GKFriendRequestViewController presentFriendRequestOn:v5 forRecipients:v4 withFriendCode:v10 andFriendSupportPageURL:v6];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    GKGameCenterUIFrameworkBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = GKGetLocalizedStringFromTableInBundle();
    id v8 = GKGameCenterUIFrameworkBundle();
    id v9 = GKGetLocalizedStringFromTableInBundle();
    +[GKFriendRequestViewController presentAlertControllerOn:v7 withMessage:v6 andTitle:v9];
  }
}

+ (void)presentFriendRequestOn:(id)a3 forRecipients:(id)a4 withFriendCode:(id)a5 andFriendSupportPageURL:(id)a6
{
  id v13 = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(GKFriendRequestViewController);
  [(GKFriendRequestViewController *)v12 setRequestingViewController:v13];
  [(GKFriendRequestViewController *)v12 setFriendCode:v10];

  [(GKFriendRequestViewController *)v12 setFriendSupportPageURL:v9];
  [(GKFriendRequestViewController *)v12 setRecipients:v11];

  if ([v13 conformsToProtocol:&unk_1F08B1E20]) {
    [(GKFriendRequestViewController *)v12 setDelegate:v13];
  }
  [v13 _gkPresentViewController:v12 animated:1];
}

+ (void)presentAlertControllerOn:(id)a3 withMessage:(id)a4 andTitle:(id)a5
{
  id v15 = a3;
  uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a5 message:a4 preferredStyle:1];
  id v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = GKGameCenterUIFrameworkBundle();
  id v10 = GKGetLocalizedStringFromTableInBundle();
  id v11 = [v8 actionWithTitle:v10 style:0 handler:0];
  [v7 addAction:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    v12 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v13 = [v12 keyWindow];
    v14 = [v13 rootViewController];

    [v14 presentViewController:v7 animated:1 completion:0];
  }
}

- (GKFriendRequestViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKFriendRequestViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (UIViewController)requestingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setRequestingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestingViewController);
  objc_storeStrong((id *)&self->_hostApp, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_friendSupportPageURL, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "createFriendRequest error: %@", (uint8_t *)&v2, 0xCu);
}

@end