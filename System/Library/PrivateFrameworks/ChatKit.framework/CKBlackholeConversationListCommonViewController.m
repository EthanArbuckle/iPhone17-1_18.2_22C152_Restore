@interface CKBlackholeConversationListCommonViewController
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (CKBlackholeConversationListCommonViewController)init;
- (CKScheduledUpdater)updater;
- (NSArray)visibleConversations;
- (UIBarButtonItem)clearAllButton;
- (UILabel)emptyConversationListLabel;
- (_UITableViewDiffableDataSource)tableViewDataSource;
- (id)_alertTitleForClearAll;
- (id)_alertTitleForDelete;
- (id)_conversationList;
- (id)_conversations;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)_batchDeleteConversationWithCompletionHandler:(id)a3;
- (void)_clearAllTapped;
- (void)_clearAllTappedWithCompletionHandler:(id)a3;
- (void)_confirmDeleteConversation:(id)a3 view:(id)a4 withCompletionHandler:(id)a5;
- (void)_deleteConversation:(id)a3;
- (void)_deleteConversation:(id)a3 withCompletionHandler:(id)a4;
- (void)_updateConversationList;
- (void)_updateConversationListEmptyLabel;
- (void)dealloc;
- (void)endHoldingConversationListUpdatesForKey:(id)a3;
- (void)popViewControllerIfNecessary;
- (void)setClearAllButton:(id)a3;
- (void)setEmptyConversationListLabel:(id)a3;
- (void)setTableViewDataSource:(id)a3;
- (void)setUpdater:(id)a3;
- (void)setVisibleConversations:(id)a3;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKBlackholeConversationListCommonViewController

- (CKBlackholeConversationListCommonViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKBlackholeConversationListCommonViewController;
  v2 = [(CKBlackholeConversationListCommonViewController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__updateConversationList name:@"CKConversationListFinishedLoadingNotification" object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:@"CKConversationListChangedNotification" object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:@"CKConversationListConversationLeftNotification" object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:*MEMORY[0x1E4F6B8D8] object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:*MEMORY[0x1E4F6B9F0] object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:*MEMORY[0x1E4F6BA70] object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:*MEMORY[0x1E4F6BA48] object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:*MEMORY[0x1E4F6BA40] object:0];
    [v3 addObserver:v2 selector:sel__updateConversationList name:*MEMORY[0x1E4F6BA78] object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_popToConversationListOnRestore, (CFStringRef)*MEMORY[0x1E4F6B9D8], v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = [[CKScheduledUpdater alloc] initWithTarget:v2 action:sel__updateConversationList];
    [(CKBlackholeConversationListCommonViewController *)v2 setUpdater:v5];
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  CKRemoveDaemonListener(@"CKSettingsMessagesController");
  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeConversationListCommonViewController;
  [(CKBlackholeConversationListCommonViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)CKBlackholeConversationListCommonViewController;
  [(CKBlackholeConversationListCommonViewController *)&v15 viewDidLoad];
  v3 = CKFrameworkBundle();
  objc_super v4 = [v3 localizedStringForKey:@"BLACKHOLE_CONVERSATIONLIST_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKBlackholeConversationListCommonViewController *)self setTitle:v4];

  v5 = [(CKBlackholeConversationListCommonViewController *)self clearAllButton];
  v6 = [(CKBlackholeConversationListCommonViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F42E98]);
  v8 = objc_msgSend(v7, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKBlackholeConversationListCommonViewController *)self setTableView:v8];

  v9 = [(CKBlackholeConversationListCommonViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"identifiers"];

  id v10 = objc_alloc(MEMORY[0x1E4F43358]);
  v11 = [(CKBlackholeConversationListCommonViewController *)self tableView];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__CKBlackholeConversationListCommonViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E5629B50;
  v14[4] = self;
  v12 = (void *)[v10 initWithTableView:v11 cellProvider:v14];
  [(CKBlackholeConversationListCommonViewController *)self setTableViewDataSource:v12];

  if (_IMWillLog())
  {
    v13 = [MEMORY[0x1E4F6BC98] sharedInstance];
    [v13 isConnected];
    _IMAlwaysLog();
  }
}

id __62__CKBlackholeConversationListCommonViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 section])
  {
    [v6 section];
    v8 = 0;
  }
  else
  {
    v9 = [*(id *)(a1 + 32) tableView];
    v8 = [v9 dequeueReusableCellWithIdentifier:@"identifiers"];

    [v8 configureForConversation:v7];
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKBlackholeConversationListCommonViewController;
  [(CKBlackholeConversationListCommonViewController *)&v6 viewWillAppear:a3];
  [(CKBlackholeConversationListCommonViewController *)self endHoldingConversationListUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];
  objc_super v4 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v4 addListenerID:@"CKSettingsMessagesController" capabilities:(*MEMORY[0x1E4F6C518] | *MEMORY[0x1E4F6C4F8]) | *MEMORY[0x1E4F6C530]];

  if (_IMWillLog())
  {
    v5 = [MEMORY[0x1E4F6BC98] sharedInstance];
    [v5 hasListenerForID:@"CKSettingsMessagesController"];
    _IMAlwaysLog();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeConversationListCommonViewController;
  [(CKBlackholeConversationListCommonViewController *)&v4 viewWillDisappear:a3];
  if ([(CKBlackholeConversationListCommonViewController *)self isMovingFromParentViewController])
  {
    if (_IMWillLog())
    {
      [(CKBlackholeConversationListCommonViewController *)self isMovingFromParentViewController];
      _IMAlwaysLog();
    }
    CKRemoveDaemonListener(@"CKSettingsMessagesController");
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  if ([v10 section])
  {
    if ([v10 section] == 1) {
      [(CKBlackholeConversationListCommonViewController *)self _clearAllTapped];
    }
  }
  else
  {
    v5 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];
    objc_super v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v10, "row"));

    id v7 = [[CKBlackholeTranscriptViewController alloc] initWithConversation:v6];
    v8 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v8 trackSpamEvent:17];

    v9 = [(CKBlackholeConversationListCommonViewController *)self navigationController];
    [v9 pushViewController:v7 animated:1];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndex:v7];

  v9 = (void *)MEMORY[0x1E4F42900];
  id v10 = CKFrameworkBundle();
  v11 = [v10 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __112__CKBlackholeConversationListCommonViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v21 = &unk_1E5628638;
  v22 = self;
  id v23 = v8;
  id v12 = v8;
  v13 = [v9 contextualActionWithStyle:1 title:v11 handler:&v18];

  v14 = (void *)MEMORY[0x1E4F42E68];
  v24[0] = v13;
  objc_super v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 1, v18, v19, v20, v21, v22);
  v16 = [v14 configurationWithActions:v15];

  [v16 setPerformsFirstActionWithFullSwipe:0];

  return v16;
}

uint64_t __112__CKBlackholeConversationListCommonViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteConversation:*(void *)(a1 + 40)];
}

- (void)_deleteConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBlackholeConversationListCommonViewController *)self view];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CKBlackholeConversationListCommonViewController__deleteConversation___block_invoke;
  v6[3] = &unk_1E5620BF0;
  v6[4] = self;
  [(CKBlackholeConversationListCommonViewController *)self _confirmDeleteConversation:v4 view:v5 withCompletionHandler:v6];
}

uint64_t __71__CKBlackholeConversationListCommonViewController__deleteConversation___block_invoke(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) endHoldingConversationListUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _updateConversationList];
  }
  return result;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  -[CKBlackholeConversationListCommonViewController setEditing:](self, "setEditing:", 0, a4);
  id v5 = [(CKBlackholeConversationListCommonViewController *)self updater];
  [v5 beginHoldingUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
}

- (void)_confirmDeleteConversation:(id)a3 view:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = [(CKBlackholeConversationListCommonViewController *)self _alertTitleForDelete];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E5622BA8;
    id v16 = v8;
    v17 = self;
    id v18 = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E5622BA8;
    v12[4] = self;
    id v13 = v16;
    id v14 = v18;
    [(UITableViewController *)self _confirmDeleteConversationFromView:v9 alertTitle:v11 forMultipleConversations:0 withReportSpamHander:v15 withNotReportSpamHandler:v12 withCancelHandler:0];
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

uint64_t __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) chat];
  [v2 markAsSpam:31];

  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v3 _deleteConversation:v4 withCompletionHandler:v5];
}

uint64_t __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteConversation:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];
}

- (void)setVisibleConversations:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  if ([(NSArray *)v4 count])
  {
    uint64_t v5 = [(NSArray *)v4 count];
    if (v5 != [(NSArray *)self->_visibleConversations count])
    {
      objc_super v6 = [MEMORY[0x1E4F6E890] sharedInstance];
      id v10 = @"ReceivedJunkConversationCount";
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v4, "count"));
      v11[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [v6 trackSpamEvent:26 withDictionary:v8];
    }
  }
  visibleConversations = self->_visibleConversations;
  self->_visibleConversations = v4;
}

- (void)_deleteConversation:(id)a3 withCompletionHandler:(id)a4
{
  id v12 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  uint64_t v7 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
  [v7 removeConversation:v6];

  id v8 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
  [v8 deleteConversation:v6];

  if (v12) {
    v12[2](v12, 1);
  }
  id v9 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
  id v10 = [v9 conversations];
  uint64_t v11 = [v10 count];

  if (!v11) {
    [(CKBlackholeConversationListCommonViewController *)self popViewControllerIfNecessary];
  }
}

- (void)_clearAllTapped
{
  v3 = [(CKBlackholeConversationListCommonViewController *)self updater];
  [v3 beginHoldingUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__CKBlackholeConversationListCommonViewController__clearAllTapped__block_invoke;
  v4[3] = &unk_1E5620BF0;
  v4[4] = self;
  [(CKBlackholeConversationListCommonViewController *)self _clearAllTappedWithCompletionHandler:v4];
}

uint64_t __66__CKBlackholeConversationListCommonViewController__clearAllTapped__block_invoke(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) endHoldingConversationListUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];
  if (a2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 popViewControllerIfNecessary];
  }
  return result;
}

- (void)popViewControllerIfNecessary
{
  if (!CKMessageUnknownFilteringEnabled())
  {
    id v4 = [(CKBlackholeConversationListCommonViewController *)self navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:1];
  }
}

- (void)_clearAllTappedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [(CKBlackholeConversationListCommonViewController *)self view];
    id v8 = [(CKBlackholeConversationListCommonViewController *)self _alertTitleForClearAll];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5622BA8;
    id v13 = v6;
    id v14 = self;
    id v15 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E5622330;
    v10[4] = self;
    id v11 = v15;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E5620C40;
    v9[4] = self;
    [(UITableViewController *)self _confirmDeleteConversationFromView:v7 alertTitle:v8 forMultipleConversations:1 withReportSpamHander:v12 withNotReportSpamHandler:v10 withCancelHandler:v9];
  }
  else
  {
    [(CKBlackholeConversationListCommonViewController *)self endHoldingConversationListUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
}

uint64_t __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "chat", (void)v9);
        [v7 markAsSpam:31];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _batchDeleteConversationWithCompletionHandler:*(void *)(a1 + 48)];
}

uint64_t __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _batchDeleteConversationWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) endHoldingConversationListUpdatesForKey:@"kCKBlackholeConversationListHoldUpdatesForDeletion"];
}

- (void)_batchDeleteConversationWithCompletionHandler:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];
  uint64_t v6 = [MEMORY[0x1E4F6E890] sharedInstance];
  long long v11 = @"ClearedJunkConversationCount";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v6 trackSpamEvent:27 withDictionary:v8];

  long long v9 = +[CKCurrentConversationsManager sharedInstance];
  [v9 purgeConversations:v5];

  long long v10 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
  [v10 deleteConversations:v5];

  if (v4) {
    v4[2](v4, 1);
  }
}

- (void)endHoldingConversationListUpdatesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBlackholeConversationListCommonViewController *)self updater];
  [v5 endHoldingAllUpdatesForKey:v4];

  uint64_t v6 = [(CKBlackholeConversationListCommonViewController *)self updater];
  [v6 setNeedsUpdate];

  id v7 = [(CKBlackholeConversationListCommonViewController *)self updater];
  [v7 updateIfNeeded];
}

- (void)_updateConversationList
{
  uint64_t v3 = [(CKBlackholeConversationListCommonViewController *)self updater];
  char v4 = [v3 isHoldingUpdates];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
    [v5 resort];

    uint64_t v6 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
    [v6 updateConversationListsAndSortIfEnabled];

    id v7 = [(CKBlackholeConversationListCommonViewController *)self _conversations];
    id v8 = (void *)[v7 copy];
    [(CKBlackholeConversationListCommonViewController *)self setVisibleConversations:v8];

    long long v9 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];

    if (v9)
    {
      long long v10 = [(CKBlackholeConversationListCommonViewController *)self tableViewDataSource];
      long long v11 = [v10 emptySnapshot];

      [v11 appendSectionsWithIdentifiers:&unk_1EDF15728];
      long long v12 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];
      [v11 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:&unk_1EDF168F8];

      id v13 = [(CKBlackholeConversationListCommonViewController *)self tableViewDataSource];
      [v13 applyDifferencesFromSnapshot:v11];

      uint64_t v14 = [(CKBlackholeConversationListCommonViewController *)self tableView];
      [v14 reloadData];
    }
    [(CKBlackholeConversationListCommonViewController *)self _updateConversationListEmptyLabel];
  }
}

- (void)_updateConversationListEmptyLabel
{
  v45[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKBlackholeConversationListCommonViewController *)self visibleConversations];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(CKBlackholeConversationListCommonViewController *)self clearAllButton];
  uint64_t v6 = v5;
  if (v4 >= 1)
  {
    [v5 setEnabled:1];

    id v7 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    [v7 removeFromSuperview];

    goto LABEL_7;
  }
  [v5 setEnabled:0];

  id v8 = [(CKBlackholeConversationListCommonViewController *)self view];
  [v8 frame];
  if (!CGRectIsEmpty(v46))
  {
    long long v9 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    long long v10 = [v9 superview];

    if (v10) {
      goto LABEL_7;
    }
    long long v11 = [(CKBlackholeConversationListCommonViewController *)self view];
    long long v12 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    [v11 addSubview:v12];

    id v13 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v38 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    v42 = [v44 centerXAnchor];
    v43 = [(CKBlackholeConversationListCommonViewController *)self view];
    v41 = [v43 centerXAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v45[0] = v40;
    v39 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    v36 = [v39 leadingAnchor];
    v37 = [(CKBlackholeConversationListCommonViewController *)self view];
    uint64_t v14 = [v37 leadingAnchor];
    id v15 = [v36 constraintGreaterThanOrEqualToAnchor:v14];
    v45[1] = v15;
    id v16 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    v17 = [v16 trailingAnchor];
    id v18 = [(CKBlackholeConversationListCommonViewController *)self view];
    uint64_t v19 = [v18 trailingAnchor];
    v20 = [v17 constraintLessThanOrEqualToAnchor:v19];
    v45[2] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    [v38 activateConstraints:v21];

    v22 = [(CKBlackholeConversationListCommonViewController *)self navigationController];
    id v23 = [v22 navigationBar];
    [v23 frame];
    double v25 = v24;
    v26 = [(CKBlackholeConversationListCommonViewController *)self view];
    [v26 safeAreaInsets];
    double v28 = v25 + v27;
    v29 = [MEMORY[0x1E4F42738] sharedApplication];
    [v29 statusBarFrame];
    double v31 = (v28 + v30) * -0.5;

    id v8 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
    v32 = [v8 centerYAnchor];
    v33 = [(CKBlackholeConversationListCommonViewController *)self view];
    v34 = [v33 centerYAnchor];
    v35 = [v32 constraintEqualToAnchor:v34 constant:(double)(uint64_t)v31];
    [v35 setActive:1];
  }
LABEL_7:
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeConversationListCommonViewController;
  [(CKBlackholeConversationListCommonViewController *)&v4 viewSafeAreaInsetsDidChange];
  uint64_t v3 = [(CKBlackholeConversationListCommonViewController *)self emptyConversationListLabel];
  [v3 removeFromSuperview];

  [(CKBlackholeConversationListCommonViewController *)self _updateConversationListEmptyLabel];
}

- (UIBarButtonItem)clearAllButton
{
  clearAllButton = self->_clearAllButton;
  if (!clearAllButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F427C0]);
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"BLACKHOLE_CONVERSATIONLIST_CLEAR_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 style:0 target:self action:sel__clearAllTapped];
    id v8 = self->_clearAllButton;
    self->_clearAllButton = v7;

    clearAllButton = self->_clearAllButton;
  }

  return clearAllButton;
}

- (UILabel)emptyConversationListLabel
{
  emptyConversationListLabel = self->_emptyConversationListLabel;
  if (!emptyConversationListLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UILabel *)v5 setAdjustsFontForContentSizeCategory:1];
    uint64_t v6 = CKFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"BLACKHOLE_EMPTY_CONVERSATION_LIST_LABEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)v5 setText:v7];

    [(UILabel *)v5 setTextAlignment:1];
    id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [(UILabel *)v5 setFont:v8];

    [(UILabel *)v5 setNumberOfLines:0];
    long long v9 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    [(UILabel *)v5 setTextColor:v9];

    long long v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v5 setBackgroundColor:v10];

    [(UILabel *)v5 sizeToFit];
    long long v11 = self->_emptyConversationListLabel;
    self->_emptyConversationListLabel = v5;

    emptyConversationListLabel = self->_emptyConversationListLabel;
  }

  return emptyConversationListLabel;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (id)_conversations
{
  id v2 = [(CKBlackholeConversationListCommonViewController *)self _conversationList];
  uint64_t v3 = [v2 conversations];

  return v3;
}

- (id)_alertTitleForDelete
{
  id v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  int v3 = [v2 isEnabled];
  id v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = @"DELETE_ALERT_MESSAGE_ON_ICLOUD";
  }
  else {
    uint64_t v6 = @"DELETE_ALERT_MESSAGE";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_alertTitleForClearAll
{
  id v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  int v3 = [v2 isEnabled];
  id v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = @"BLACKHOLE_BATCH_DELETE_PROMPT";
  }
  else {
    uint64_t v6 = @"BLACKHOLE_BATCH_DELETE_PROMPT_ICLOUD";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 0;
}

- (_UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
}

- (void)setClearAllButton:(id)a3
{
}

- (void)setEmptyConversationListLabel:(id)a3
{
}

- (CKScheduledUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
}

- (NSArray)visibleConversations
{
  return self->_visibleConversations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleConversations, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_emptyConversationListLabel, 0);
  objc_storeStrong((id *)&self->_clearAllButton, 0);

  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
}

@end