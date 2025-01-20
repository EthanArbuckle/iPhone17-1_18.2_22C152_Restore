@interface CKBlackholeTranscriptViewController
- (BOOL)isChatAllowedByScreenTime:(id)a3;
- (BOOL)isShowingLockoutView;
- (BOOL)shouldPresentBlockingDowntimeViewController;
- (CKBlackholeTranscriptViewController)initWithConversation:(id)a3;
- (CKConversation)conversation;
- (NSMutableArray)messages;
- (STConversationContext)conversationContext;
- (STLockoutViewController)lockoutViewController;
- (UITextView)headerTextView;
- (UIView)lockoutView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_alertTitleForDelete;
- (id)_conversationList;
- (id)_handleIDsForCurrentConversation;
- (id)generateHeader;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_confirmDeleteConversation:(id)a3 view:(id)a4 withCompletionHandler:(id)a5;
- (void)_deleteConversation:(id)a3 withCompletionHandler:(id)a4;
- (void)_openRestoredChatInMessages;
- (void)_restoreConversation;
- (void)_updateTranscriptHistory;
- (void)chatAllowedByScreenTimeChanged:(id)a3;
- (void)dealloc;
- (void)layoutLockoutView;
- (void)removeLockoutControllerIfNeeded;
- (void)setConversation:(id)a3;
- (void)setConversationContext:(id)a3;
- (void)setHeaderTextView:(id)a3;
- (void)setIsShowingLockoutView:(BOOL)a3;
- (void)setLockoutView:(id)a3;
- (void)setLockoutViewController:(id)a3;
- (void)setMessages:(id)a3;
- (void)showScreenTimeShieldIfNeeded;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateScreenTimeShieldIfNeededForChat:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKBlackholeTranscriptViewController

- (CKBlackholeTranscriptViewController)initWithConversation:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKBlackholeTranscriptViewController;
  v6 = [(CKBlackholeTranscriptViewController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversation, a3);
    if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
    {
      [(CKBlackholeTranscriptViewController *)v7 removeLockoutControllerIfNeeded];
      uint64_t v8 = [(CKConversation *)v7->_conversation chat];
      if (v8)
      {
        v9 = (void *)v8;
        v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v11 = *MEMORY[0x1E4F6B888];
        [v10 removeObserver:v7 name:*MEMORY[0x1E4F6B888] object:v9];

        v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 addObserver:v7 selector:sel_chatAllowedByScreenTimeChanged_ name:v11 object:v9];

        [(CKBlackholeTranscriptViewController *)v7 updateScreenTimeShieldIfNeededForChat:v9];
      }
    }
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v7 selector:sel__updateTranscriptHistory name:*MEMORY[0x1E4F6B8D8] object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_openRestoredChatInMessagesEventReceived, (CFStringRef)*MEMORY[0x1E4F6B9D8], v7, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CKBlackholeTranscriptViewController;
  [(CKBlackholeTranscriptViewController *)&v11 viewDidLoad];
  v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"BLACKHOLE_TRANSCRIPT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKBlackholeTranscriptViewController *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F42E98]);
  v6 = [(CKBlackholeTranscriptViewController *)self view];
  [v6 bounds];
  v7 = objc_msgSend(v5, "initWithFrame:style:", 1);
  [(CKBlackholeTranscriptViewController *)self setTableView:v7];

  uint64_t v8 = [(CKBlackholeTranscriptViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"action"];

  v9 = [(CKBlackholeTranscriptViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"history"];

  v10 = [(CKBlackholeTranscriptViewController *)self generateHeader];
  [(CKBlackholeTranscriptViewController *)self setHeaderTextView:v10];
}

- (void)viewDidLayoutSubviews
{
  [(UITextView *)self->_headerTextView frame];
  double v4 = v3;
  headerTextView = self->_headerTextView;
  v6 = [(CKBlackholeTranscriptViewController *)self view];
  [v6 bounds];
  -[UITextView sizeThatFits:](headerTextView, "sizeThatFits:", v7, 1.79769313e308);
  double v9 = v8;
  double v11 = v10;

  if (v4 != v11)
  {
    -[UITextView setFrame:](self->_headerTextView, "setFrame:", 0.0, 0.0, v9, v11);
    v12 = [(CKBlackholeTranscriptViewController *)self tableView];
    [v12 setTableHeaderView:self->_headerTextView];

    v13 = [(CKBlackholeTranscriptViewController *)self tableView];
    [v13 layoutIfNeeded];
  }

  [(CKBlackholeTranscriptViewController *)self layoutLockoutView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKBlackholeTranscriptViewController;
  [(CKBlackholeTranscriptViewController *)&v7 viewWillAppear:a3];
  double v4 = [(CKBlackholeTranscriptViewController *)self navigationController];
  id v5 = [v4 navigationBar];
  [v5 setPrefersLargeTitles:0];

  [(CKBlackholeTranscriptViewController *)self _updateTranscriptHistory];
  v6 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v6 addListenerID:@"CKSettingsMessagesController" capabilities:(*MEMORY[0x1E4F6C518] | *MEMORY[0x1E4F6C4F8]) | *MEMORY[0x1E4F6C530]];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKBlackholeTranscriptViewController;
  [(CKBlackholeTranscriptViewController *)&v5 viewWillDisappear:a3];
  if ([(CKBlackholeTranscriptViewController *)self isMovingFromParentViewController])
  {
    if (_IMWillLog())
    {
      [(CKBlackholeTranscriptViewController *)self isMovingFromParentViewController];
      _IMAlwaysLog();
    }
    CKRemoveDaemonListener(@"CKSettingsMessagesController");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F6B9D8], 0);
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeTranscriptViewController;
  [(CKBlackholeTranscriptViewController *)&v4 dealloc];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    if ([v5 section] < 1)
    {
      objc_super v7 = objc_opt_new();
      goto LABEL_14;
    }
    v6 = [(CKBlackholeTranscriptViewController *)self tableView];
    objc_super v7 = [v6 dequeueReusableCellWithIdentifier:@"action"];

    double v8 = [v7 textLabel];
    [v8 setTextAlignment:1];

    if ([v5 section] == 1)
    {
      double v9 = [v7 textLabel];
      double v10 = [MEMORY[0x1E4F428B8] systemBlueColor];
      [v9 setColor:v10];

      double v11 = [v7 textLabel];
      v12 = CKFrameworkBundle();
      v13 = v12;
      v14 = @"BLACKHOLE_TRANSCRIPT_RESTORE";
    }
    else
    {
      if ([v5 section] != 2) {
        goto LABEL_14;
      }
      v21 = [v7 textLabel];
      v22 = [MEMORY[0x1E4F428B8] systemRedColor];
      [v21 setColor:v22];

      double v11 = [v7 textLabel];
      v12 = CKFrameworkBundle();
      v13 = v12;
      v14 = @"BLACKHOLE_TRANSCRIPT_DELETE";
    }
    v23 = [v12 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v11 setText:v23];
  }
  else
  {
    v15 = [(CKBlackholeTranscriptViewController *)self tableView];
    objc_super v7 = [v15 dequeueReusableCellWithIdentifier:@"history"];

    double v11 = -[NSMutableArray objectAtIndex:](self->_messages, "objectAtIndex:", [v5 row]);
    if ([v5 row] < 1)
    {
      uint64_t v20 = 1;
    }
    else
    {
      objc_super v16 = -[NSMutableArray objectAtIndex:](self->_messages, "objectAtIndex:", [v5 row] - 1);
      v17 = [v16 handle];
      v18 = [v11 handle];
      int v19 = [v17 isEqualToString:v18];

      uint64_t v20 = v19 ^ 1u;
    }
    [v7 configureForMessageItem:v11 showSender:v20];
  }

LABEL_14:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CKBlackholeTranscriptViewController *)self tableView];
  [v8 deselectRowAtIndexPath:v7 animated:1];

  if ([v7 section] == 1)
  {
    double v9 = CKFrameworkBundle();
    double v10 = [v9 localizedStringForKey:@"BLACKHOLE_RESTORE_PROMPT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v11 = +[CKAlertController alertControllerWithTitle:v10 message:0 preferredStyle:0];

    v12 = CKFrameworkBundle();
    v13 = [v12 localizedStringForKey:@"BLACKHOLE_RESTORE_PROMPT_CONFIRM" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v23[3] = &unk_1E5621178;
    v23[4] = self;
    v14 = +[CKAlertAction actionWithTitle:v13 style:0 handler:v23];

    [v11 addAction:v14];
    v15 = CKFrameworkBundle();
    objc_super v16 = [v15 localizedStringForKey:@"BLACKHOLE_RESTORE_PROMPT_CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v17 = +[CKAlertAction actionWithTitle:v16 style:1 handler:0];

    [v11 addAction:v17];
    [v11 presentFromViewController:self animated:1 completion:0];
  }
  else if ([v7 section] == 2)
  {
    id location = 0;
    objc_initWeak(&location, self);
    conversation = self->_conversation;
    int v19 = [(CKBlackholeTranscriptViewController *)self view];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v20[3] = &unk_1E5623970;
    objc_copyWeak(&v21, &location);
    [(CKBlackholeTranscriptViewController *)self _confirmDeleteConversation:conversation view:v19 withCompletionHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreConversation];
}

void __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained navigationController];
    id v3 = (id)[v2 popViewControllerAnimated:1];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return a4 > 0;
  }
  else {
    return [(NSMutableArray *)self->_messages count];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (void)_confirmDeleteConversation:(id)a3 view:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id location = 0;
    objc_initWeak(&location, self);
    double v11 = [(CKBlackholeTranscriptViewController *)self _alertTitleForDelete];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E5623998;
    id v12 = v8;
    id v19 = v12;
    objc_copyWeak(&v21, &location);
    id v13 = v10;
    id v20 = v13;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E56239C0;
    objc_copyWeak(&v17, &location);
    id v15 = v12;
    id v16 = v13;
    [(UITableViewController *)self _confirmDeleteConversationFromView:v9 alertTitle:v11 forMultipleConversations:0 withReportSpamHander:v18 withNotReportSpamHandler:v14 withCancelHandler:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

void __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) chat];
  [v2 markAsSpam:31];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteConversation:*(void *)(a1 + 32) withCompletionHandler:*(void *)(a1 + 40)];
}

void __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteConversation:*(void *)(a1 + 32) withCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_restoreConversation
{
  if (_IMWillLog())
  {
    id v3 = [(CKConversation *)self->_conversation chat];
    id v8 = [v3 guid];
    _IMAlwaysLog();
  }
  objc_super v4 = [(CKConversation *)self->_conversation chat];
  [v4 updateIsBlackholed:0];

  id v5 = [(CKConversation *)self->_conversation chat];
  LODWORD(v4) = [v5 isGroupChat];

  id v6 = [MEMORY[0x1E4F6E890] sharedInstance];
  id v9 = v6;
  if (v4) {
    uint64_t v7 = 19;
  }
  else {
    uint64_t v7 = 18;
  }
  [v6 trackSpamEvent:v7];
}

- (void)_openRestoredChatInMessages
{
  if (_IMWillLog())
  {
    id v3 = [(CKConversation *)self->_conversation chat];
    id v8 = [v3 guid];
    _IMAlwaysLog();
  }
  objc_super v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [(CKConversation *)self->_conversation chat];
  id v6 = [v5 chatIdentifier];
  objc_msgSend(v4, "__im_URLForChatIdentifier:entryBody:", v6, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [MEMORY[0x1E4F42738] sharedApplication];
  [v7 openURL:v9 withCompletionHandler:0];
}

- (void)_deleteConversation:(id)a3 withCompletionHandler:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  uint64_t v7 = [(CKBlackholeTranscriptViewController *)self _conversationList];
  [v7 removeConversation:v6];

  id v8 = [(CKBlackholeTranscriptViewController *)self _conversationList];
  [v8 deleteConversation:v6];

  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
    id v9 = v10;
  }
}

- (id)_alertTitleForDelete
{
  v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  int v3 = [v2 isEnabled];
  objc_super v4 = CKFrameworkBundle();
  id v5 = v4;
  if (v3) {
    id v6 = @"DELETE_ALERT_MESSAGE_ON_ICLOUD";
  }
  else {
    id v6 = @"DELETE_ALERT_MESSAGE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (void)_updateTranscriptHistory
{
  [(CKConversation *)self->_conversation setLoadedMessageCount:50 loadImmediately:1];
  int v3 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:50];
  messages = self->_messages;
  self->_messages = v3;

  id v5 = [(CKConversation *)self->_conversation chat];
  id v6 = [v5 _items];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CKBlackholeTranscriptViewController__updateTranscriptHistory__block_invoke;
  v8[3] = &unk_1E56239E8;
  v8[4] = self;
  [v6 enumerateObjectsUsingBlock:v8];

  uint64_t v7 = [(CKBlackholeTranscriptViewController *)self tableView];
  [v7 reloadData];
}

void __63__CKBlackholeTranscriptViewController__updateTranscriptHistory__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v4 = v6;
  if (isKindOfClass)
  {
    id v5 = v6;
    if ([v5 isFinished]) {
      [*(id *)(*(void *)(a1 + 32) + 1040) addObject:v5];
    }

    objc_super v4 = v6;
  }
}

- (void)layoutLockoutView
{
  if ([(CKBlackholeTranscriptViewController *)self isShowingLockoutView])
  {
    int v3 = [(CKBlackholeTranscriptViewController *)self lockoutView];

    if (v3)
    {
      objc_super v4 = [(CKBlackholeTranscriptViewController *)self headerTextView];
      objc_msgSend(v4, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

      id v6 = [(CKBlackholeTranscriptViewController *)self lockoutView];
      id v5 = [(CKBlackholeTranscriptViewController *)self view];
      [v5 bounds];
      objc_msgSend(v6, "setFrame:");
    }
  }
}

- (void)chatAllowedByScreenTimeChanged:(id)a3
{
  id v7 = a3;
  int v4 = [MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled];
  id v5 = v7;
  if (v4)
  {
    id v6 = [v7 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CKBlackholeTranscriptViewController *)self updateScreenTimeShieldIfNeededForChat:v6];
    }

    id v5 = v7;
  }
}

- (BOOL)isChatAllowedByScreenTime:(id)a3
{
  return [a3 allowedByScreenTime];
}

- (void)updateScreenTimeShieldIfNeededForChat:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ([(CKBlackholeTranscriptViewController *)self isChatAllowedByScreenTime:v4]) {
      [(CKBlackholeTranscriptViewController *)self removeLockoutControllerIfNeeded];
    }
    else {
      [(CKBlackholeTranscriptViewController *)self showScreenTimeShieldIfNeeded];
    }
    id v4 = v5;
  }
}

- (BOOL)shouldPresentBlockingDowntimeViewController
{
  return 1;
}

- (void)removeLockoutControllerIfNeeded
{
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]
    && [(CKBlackholeTranscriptViewController *)self isShowingLockoutView])
  {
    id v7 = [(CKBlackholeTranscriptViewController *)self lockoutViewController];
    int v3 = [v7 view];
    [v3 removeFromSuperview];

    [v7 removeFromParentViewController];
    [(CKBlackholeTranscriptViewController *)self setLockoutViewController:0];
    [(CKBlackholeTranscriptViewController *)self setLockoutView:0];
    id v4 = [(CKBlackholeTranscriptViewController *)self generateHeader];
    [(CKBlackholeTranscriptViewController *)self setHeaderTextView:v4];

    [(CKBlackholeTranscriptViewController *)self setIsShowingLockoutView:0];
    id v5 = [(CKBlackholeTranscriptViewController *)self conversation];
    [(CKBlackholeTranscriptViewController *)self setConversation:v5];

    id v6 = [(CKBlackholeTranscriptViewController *)self tableView];
    [v6 setScrollEnabled:1];

    [(CKBlackholeTranscriptViewController *)self reloadInputViews];
  }
}

- (void)showScreenTimeShieldIfNeeded
{
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]
    && [(CKBlackholeTranscriptViewController *)self shouldPresentBlockingDowntimeViewController]&& ![(CKBlackholeTranscriptViewController *)self isShowingLockoutView])
  {
    int v3 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    id v4 = [v3 getContactStore];

    if (!showScreenTimeShieldIfNeeded_CKSTLockoutViewController_0) {
      showScreenTimeShieldIfNeeded_CKSTLockoutViewController_0 = MEMORY[0x192FBA860](@"STLockoutViewController", @"ScreenTimeUI");
    }
    id v5 = [(CKBlackholeTranscriptViewController *)self conversation];
    id v6 = [v5 chat];

    if (v6)
    {
      id v7 = IMSharedDowntimeController();
      id v8 = [(CKBlackholeTranscriptViewController *)self conversation];
      id v9 = [v8 chat];
      id v10 = [v7 conversationContextForChat:v9];
      [(CKBlackholeTranscriptViewController *)self setConversationContext:v10];
    }
    double v11 = [(CKBlackholeTranscriptViewController *)self conversationContext];

    id v12 = (void *)showScreenTimeShieldIfNeeded_CKSTLockoutViewController_0;
    if (v11 && v4)
    {
      id v13 = [(CKBlackholeTranscriptViewController *)self conversationContext];
      v14 = [(CKBlackholeTranscriptViewController *)self conversation];
      id v15 = [v14 contactNameByHandle];
      uint64_t v16 = [v12 lockoutViewControllerWithConversationContext:v13 bundleIdentifier:@"com.apple.MobileSMS" contactStore:v4 applicationName:0 contactNameByHandle:v15];
    }
    else
    {
      id v13 = [(CKBlackholeTranscriptViewController *)self _handleIDsForCurrentConversation];
      v14 = [(CKBlackholeTranscriptViewController *)self conversation];
      id v15 = [v14 contactNameByHandle];
      uint64_t v16 = [v12 lockoutViewControllerWithBundleIdentifier:@"com.apple.MobileSMS" contactsHandles:v13 contactNameByHandle:v15];
    }
    id v24 = (id)v16;

    [v24 setMainButtonAlwaysHidden:1];
    id v17 = [v24 view];
    [(CKBlackholeTranscriptViewController *)self setLockoutView:v17];

    id v18 = objc_alloc_init(MEMORY[0x1E4F42F58]);
    [(CKBlackholeTranscriptViewController *)self setHeaderTextView:v18];

    [(CKBlackholeTranscriptViewController *)self setLockoutViewController:v24];
    id v19 = [(CKBlackholeTranscriptViewController *)self view];
    id v20 = [(CKBlackholeTranscriptViewController *)self lockoutView];
    [v19 addSubview:v20];

    [(CKBlackholeTranscriptViewController *)self addChildViewController:v24];
    [(CKBlackholeTranscriptViewController *)self setIsShowingLockoutView:1];
    id v21 = [(CKBlackholeTranscriptViewController *)self tableView];
    [v21 setScrollEnabled:0];

    v22 = [(CKBlackholeTranscriptViewController *)self view];
    [v22 setNeedsLayout];

    v23 = [(CKBlackholeTranscriptViewController *)self view];
    [v23 layoutIfNeeded];

    [(CKBlackholeTranscriptViewController *)self reloadInputViews];
  }
}

- (id)_handleIDsForCurrentConversation
{
  v2 = [(CKBlackholeTranscriptViewController *)self conversation];
  int v3 = [v2 recipients];
  id v4 = objc_msgSend(v3, "__imArrayByApplyingBlock:", &__block_literal_global_33);

  return v4;
}

id __71__CKBlackholeTranscriptViewController__handleIDsForCurrentConversation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 defaultIMHandle];
  int v3 = [v2 ID];

  return v3;
}

- (id)generateHeader
{
  id v2 = objc_alloc(MEMORY[0x1E4F42F58]);
  int v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setSelectable:0];
  [v3 setEditable:0];
  [v3 setAdjustsFontForContentSizeCategory:1];
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"BLACKHOLE_TRANSCRIPT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v3 setText:v5];

  [v3 setTextAlignment:1];
  id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [v3 setFont:v6];

  id v7 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [v3 setTextColor:v7];

  [v3 setBackgroundColor:0];
  objc_msgSend(v3, "setTextContainerInset:", 12.0, 24.0, 12.0, 24.0);

  return v3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (UITextView)headerTextView
{
  return self->_headerTextView;
}

- (void)setHeaderTextView:(id)a3
{
}

- (BOOL)isShowingLockoutView
{
  return self->_isShowingLockoutView;
}

- (void)setIsShowingLockoutView:(BOOL)a3
{
  self->_isShowingLockoutView = a3;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (STConversationContext)conversationContext
{
  return self->_conversationContext;
}

- (void)setConversationContext:(id)a3
{
}

- (UIView)lockoutView
{
  return self->_lockoutView;
}

- (void)setLockoutView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockoutView, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_headerTextView, 0);
  objc_storeStrong((id *)&self->_messages, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end