@interface CSFocusActivityManager
- (BOOL)isFocusActivityIndicatorVisible;
- (CSFocusActivityDelegate)delegate;
- (CSFocusActivityManager)initWithItemDestination:(id)a3;
- (id)_activityForDisplayInIndicator;
- (void)_addOrUpdateFocusActivityIndicatorItemIfNecessary;
- (void)_updateFocusActivityIndicator;
- (void)activeActivityDidChangeForManager:(id)a3;
- (void)availableActivitiesDidChangeForManager:(id)a3;
- (void)focusActivityViewIndicatorDidChangeToVisible:(BOOL)a3;
- (void)presentFocusActivityPickerViewControllerFromView:(id)a3 coverSheetViewPresenting:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CSFocusActivityManager

- (CSFocusActivityManager)initWithItemDestination:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSFocusActivityManager;
  v6 = [(CSFocusActivityManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemDestination, a3);
    v8 = objc_alloc_init(CSFocusActivityViewController);
    focusActivityViewController = v7->_focusActivityViewController;
    v7->_focusActivityViewController = v8;

    [(CSFocusActivityViewController *)v7->_focusActivityViewController setDelegate:v7];
    [(CSFocusActivityManager *)v7 _addOrUpdateFocusActivityIndicatorItemIfNecessary];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    activityManagerQueue = v7->_activityManagerQueue;
    v7->_activityManagerQueue = (OS_dispatch_queue *)Serial;

    uint64_t v12 = [MEMORY[0x1E4F62278] sharedActivityManager];
    activityManager = v7->_activityManager;
    v7->_activityManager = (FCActivityManager *)v12;

    [(FCActivityManager *)v7->_activityManager addObserver:v7];
    [(CSFocusActivityManager *)v7 _updateFocusActivityIndicator];
  }

  return v7;
}

- (void)focusActivityViewIndicatorDidChangeToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CSFocusActivityManager *)self delegate];
  id v5 = [(CSFocusActivityManager *)self _activityForDisplayInIndicator];

  if (!v5)
  {
    [(CSItemDestination *)self->_itemDestination removeItemForIdentifier:@"focus activity identifier"];
    focusActivityItem = self->_focusActivityItem;
    self->_focusActivityItem = 0;
  }
  [v7 focusActivityIndicatorDidChangeToVisible:v3];
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  if (self->_activityManager == a3)
  {
    v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "Active focus activity did change...", v5, 2u);
    }

    [(CSFocusActivityManager *)self _addOrUpdateFocusActivityIndicatorItemIfNecessary];
    [(CSFocusActivityManager *)self _updateFocusActivityIndicator];
  }
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  if (self->_activityManager == a3)
  {
    v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "Available focus activities did change...", v5, 2u);
    }

    [(CSFocusActivityManager *)self _updateFocusActivityIndicator];
  }
}

- (BOOL)isFocusActivityIndicatorVisible
{
  if (CSAutobahnEnabledForPlatform()) {
    return 0;
  }
  focusActivityViewController = self->_focusActivityViewController;

  return [(CSFocusActivityViewController *)focusActivityViewController isActivityIndicatorVisible];
}

- (void)presentFocusActivityPickerViewControllerFromView:(id)a3 coverSheetViewPresenting:(id)a4
{
}

- (void)_addOrUpdateFocusActivityIndicatorItemIfNecessary
{
  BOOL v3 = [(CSFocusActivityManager *)self _activityForDisplayInIndicator];

  if (v3)
  {
    focusActivityItem = self->_focusActivityItem;
    if (!focusActivityItem)
    {
      id v5 = [[CSAdjunctListItem alloc] initWithIdentifier:@"focus activity identifier"];
      [(CSAdjunctListItem *)v5 setAnimatePresentation:0];
      [(CSAdjunctListItem *)v5 setContentHost:self->_focusActivityViewController];
      v6 = self->_focusActivityItem;
      self->_focusActivityItem = v5;

      focusActivityItem = self->_focusActivityItem;
    }
    itemDestination = self->_itemDestination;
    [(CSItemDestination *)itemDestination addOrUpdateItem:focusActivityItem];
  }
}

- (id)_activityForDisplayInIndicator
{
  if (CSAutobahnEnabledForPlatform())
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(FCActivityManager *)self->_activityManager activeActivity];
  }

  return v3;
}

- (void)_updateFocusActivityIndicator
{
  activityManagerQueue = self->_activityManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  dispatch_async(activityManagerQueue, block);
}

void __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _activityForDisplayInIndicator];
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Setting focus activity: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke_6;
  v5[3] = &unk_1E6AD88C0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) setActivity:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "focusActivityIndicatorDidChangeToVisible:", objc_msgSend(*(id *)(a1 + 32), "isFocusActivityIndicatorVisible"));
}

- (CSFocusActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSFocusActivityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusActivityItem, 0);
  objc_storeStrong((id *)&self->_focusActivityViewController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_activityManagerQueue, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);

  objc_storeStrong((id *)&self->_itemDestination, 0);
}

@end