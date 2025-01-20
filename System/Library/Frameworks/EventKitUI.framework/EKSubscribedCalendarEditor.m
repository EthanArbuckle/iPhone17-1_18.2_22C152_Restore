@interface EKSubscribedCalendarEditor
+ (id)createNewCalendarForEntityType:(unint64_t)a3 inEventStore:(id)a4;
- (BOOL)_needToShowPrivacyNotice;
- (BOOL)_shouldShowDeleteButton;
- (CGSize)calculatePreferredContentSize;
- (EKSubscribedCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6;
- (NSURL)prefillURL;
- (id)_editItemsForState:(unint64_t)a3;
- (id)loadEditItems;
- (id)rightButton;
- (unint64_t)state;
- (void)URLEditItemDidChangeURLString:(id)a3;
- (void)_allowButtonTapped;
- (void)_cancelInFlightPreviewDataFetch;
- (void)_denyButtonTapped;
- (void)_kickoffPreviewDataFetch:(id)a3;
- (void)_promptToContinueUsingInsecureConnection;
- (void)_setTableHeaderViewForState;
- (void)_showPrivacyNotice;
- (void)_startSpamCheckingURLString:(id)a3;
- (void)_unsubscribeFromCalendar;
- (void)_unsubscribeFromCalendarAndReportJunk;
- (void)_unsubscribeTapped:(id)a3;
- (void)_updateCancelButtonVisibilityForSpamStatus:(BOOL)a3;
- (void)_updateTableHeaderLayout;
- (void)_validateURL;
- (void)_validateURL:(id)a3;
- (void)_validateUserEnteredURL;
- (void)calendarItemStartedEditing:(id)a3;
- (void)calendarSubscriptionSpamCheckEditItem:(id)a3 didDetermineThatURL:(id)a4 isSpam:(BOOL)a5;
- (void)cancel:(id)a3;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)didSaveCalendar:(id)a3;
- (void)loadView;
- (void)setHolidayCalendarModeWithTitle:(id)a3;
- (void)setPrefillURL:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)subscribedCalendarDidFinishLoading:(id)a3;
- (void)subscribedCalendarFailedWithError:(id)a3;
- (void)subscribedCalendarRequiresPassword:(id)a3 withContinuation:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willSaveCalendar:(id)a3;
@end

@implementation EKSubscribedCalendarEditor

- (EKSubscribedCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)EKSubscribedCalendarEditor;
  v13 = [(EKAbstractCalendarEditor *)&v23 initWithCalendar:v10 eventStore:v11 entityType:a5 limitedToSource:v12];
  if (v13)
  {
    v14 = (CUIKSubscribedCalendarManager *)objc_alloc_init(MEMORY[0x1E4F57C30]);
    subCalManager = v13->_subCalManager;
    v13->_subCalManager = v14;

    objc_storeStrong((id *)&v13->_limitedToSource, a6);
    if ([(EKAbstractCalendarEditor *)v13 isNewCalendar]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 3;
    }
    [(EKSubscribedCalendarEditor *)v13 setState:v16];
    objc_initWeak(&location, v13);
    v24[0] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__EKSubscribedCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke;
    v20[3] = &unk_1E60874F8;
    objc_copyWeak(&v21, &location);
    id v18 = (id)[(EKSubscribedCalendarEditor *)v13 registerForTraitChanges:v17 withHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __85__EKSubscribedCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[141] reset];
    v2 = [v3 tableView];
    [v2 reloadData];

    WeakRetained = v3;
  }
}

+ (id)createNewCalendarForEntityType:(unint64_t)a3 inEventStore:(id)a4
{
  v4 = [MEMORY[0x1E4F254C0] calendarForEntityType:0 eventStore:a4];
  [v4 setSubscribed:1];
  [v4 setReadOnly:1];
  [v4 setStripAlarms:1];
  [v4 setStripAttachments:1];

  return v4;
}

- (void)setHolidayCalendarModeWithTitle:(id)a3
{
  self->_holidayCalendarMode = 1;
  objc_storeStrong((id *)&self->_preloadTitle, a3);
}

- (void)loadView
{
  if (!self->_holidayCalendarMode)
  {
    BOOL v3 = [(EKAbstractCalendarEditor *)self isNewCalendar];
    v4 = EventKitUIBundle();
    v5 = v4;
    if (v3)
    {
      v6 = @"Add Subscription Calendar Title";
      v7 = @"Add Subscription Calendar";
    }
    else
    {
      v6 = @"Edit Subscribed Calendar";
      v7 = &stru_1F0CC2140;
    }
    v8 = [v4 localizedStringForKey:v6 value:v7 table:0];
    [(EKSubscribedCalendarEditor *)self setTitle:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)EKSubscribedCalendarEditor;
  [(EKAbstractCalendarEditor *)&v9 loadView];
  [(EKSubscribedCalendarEditor *)self _setTableHeaderViewForState];
  self->_allowTableHeaderLayouts = 1;
}

- (id)rightButton
{
  BOOL v3 = [(EKAbstractCalendarEditor *)self isNewCalendar];
  id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v5 = v4;
  if (v3)
  {
    v6 = EventKitUIBundle();
    v7 = [v6 localizedStringForKey:@"Add New Subscribed Calendar Confirm Button" value:@"Add" table:0];
    v8 = (void *)[v5 initWithTitle:v7 style:2 target:self action:sel_done_];

    objc_super v9 = @"add-button";
    id v10 = v8;
  }
  else
  {
    id v10 = (void *)[v4 initWithBarButtonSystemItem:0 target:self action:sel_done_];
    v8 = v10;
    objc_super v9 = @"done-button";
  }
  [v10 setAccessibilityIdentifier:v9];

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKAbstractCalendarEditor *)self isNewCalendar] && !self->_holidayCalendarMode)
  {
    if ([(EKSubscribedCalendarEditor *)self _needToShowPrivacyNotice]) {
      [(EKSubscribedCalendarEditor *)self _showPrivacyNotice];
    }
    v5 = [(EKAbstractCalendarEditor *)self editItems];
    v6 = [v5 objectAtIndex:0];
    [v6 becomeFirstResponder];
  }
  self->_allowTableHeaderLayouts = 1;
  v7.receiver = self;
  v7.super_class = (Class)EKSubscribedCalendarEditor;
  [(EKSubscribedCalendarEditor *)&v7 viewDidAppear:v3];
  if (self->_holidayCalendarMode && [(EKSubscribedCalendarEditor *)self state] != 1) {
    [(EKSubscribedCalendarEditor *)self _validateURL];
  }
}

- (BOOL)_needToShowPrivacyNotice
{
  if (_os_feature_enabled_impl())
  {
    v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
    int v3 = [v2 displayedSubscribedCalendarSpamDetectionPrivacyNotice] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKSubscribedCalendarEditor;
  [(EKAbstractCalendarEditor *)&v4 viewWillAppear:a3];
  [(EKSubscribedCalendarEditor *)self _setTableHeaderViewForState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_allowTableHeaderLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)EKSubscribedCalendarEditor;
  [(EKAbstractCalendarEditor *)&v3 viewWillDisappear:a3];
}

- (void)_setTableHeaderViewForState
{
  objc_super v3 = [(EKSubscribedCalendarEditor *)self tableView];
  objc_super v4 = [v3 tableHeaderView];

  if (self->_state == 3)
  {
    v5 = 0;
    if (v4)
    {
LABEL_3:
      id v11 = v5;
      objc_storeStrong((id *)&self->_tableViewHeader, v5);
      tableViewHeader = self->_tableViewHeader;
      objc_super v7 = [(EKSubscribedCalendarEditor *)self tableView];
      [v7 setTableHeaderView:tableViewHeader];

      goto LABEL_6;
    }
  }
  else
  {
    BOOL v8 = v4 != 0;
    objc_super v9 = [EKSubscribedCalendarDescriptionHeader alloc];
    id v10 = [(EKSubscribedCalendarEditor *)self tableView];
    [v10 bounds];
    id v12 = [(EKSubscribedCalendarDescriptionHeader *)v9 initWithParentWidth:self->_holidayCalendarMode showHolidayCalendarDescription:CGRectGetWidth(v14)];

    v5 = v12;
    if (((v8 ^ (v12 == 0)) & 1) == 0) {
      goto LABEL_3;
    }
  }
  id v11 = v5;
  [(EKSubscribedCalendarEditor *)self _updateTableHeaderLayout];
LABEL_6:
}

- (void)_updateTableHeaderLayout
{
  tableViewHeader = self->_tableViewHeader;
  objc_super v4 = [(EKSubscribedCalendarEditor *)self tableView];
  [v4 bounds];
  LODWORD(tableViewHeader) = [(EKSubscribedCalendarDescriptionHeader *)tableViewHeader updateLayoutForWidth:CGRectGetWidth(v9)];

  if (tableViewHeader)
  {
    v5 = [(EKSubscribedCalendarEditor *)self tableView];
    [v5 setTableHeaderView:0];

    v6 = self->_tableViewHeader;
    id v7 = [(EKSubscribedCalendarEditor *)self tableView];
    [v7 setTableHeaderView:v6];
  }
}

- (BOOL)_shouldShowDeleteButton
{
  if ([(EKAbstractCalendarEditor *)self isNewCalendar]) {
    return 0;
  }
  objc_super v3 = [(EKAbstractCalendarEditor *)self calendar];
  char v4 = [v3 isImmutable];

  if (v4) {
    return 0;
  }
  v5 = [(EKAbstractCalendarEditor *)self calendar];
  char v6 = [v5 isSubscribedHolidayCalendar];

  if (v6) {
    return 0;
  }
  BOOL v8 = [(EKAbstractCalendarEditor *)self calendar];
  char v9 = [v8 isMarkedUndeletable];

  return v9 ^ 1;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [(EKCalendarColorEditItem *)self->_colorEditItem reset];
  id v4 = [(EKSubscribedCalendarEditor *)self tableView];
  [v4 reloadData];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(EKSubscribedCalendarEditor *)self _setTableHeaderViewForState];
    [(EKAbstractCalendarEditor *)self reconfigureAndReloadEditItems];
    if (self->_state == 1)
    {
      BOOL v4 = [(EKAbstractCalendarEditor *)self enableDoneInitially];
      v5 = [(EKSubscribedCalendarEditor *)self navigationItem];
      id v7 = v5;
      if (v4) {
        [v5 leftBarButtonItem];
      }
      else {
      char v6 = [v5 rightBarButtonItem];
      }
      [v6 setEnabled:1];
    }
  }
}

- (id)loadEditItems
{
  return [(EKSubscribedCalendarEditor *)self _editItemsForState:self->_state];
}

- (id)_editItemsForState:(unint64_t)a3
{
  v62[4] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  switch(a3)
  {
    case 0uLL:
      char v6 = objc_alloc_init(EKCalendarSubscriptionURLEditItem);
      urlItem = self->_urlItem;
      self->_urlItem = v6;

      [(EKCalendarSubscriptionURLEditItem *)self->_urlItem setEditable:1];
      [(EKCalendarSubscriptionURLEditItem *)self->_urlItem setUrlEditItemDelegate:self];
      BOOL v8 = [(EKSubscribedCalendarEditor *)self prefillURL];

      if (v8)
      {
        char v9 = [(EKSubscribedCalendarEditor *)self prefillURL];
        id v10 = [v9 absoluteString];
        [(EKCalendarSubscriptionURLEditItem *)self->_urlItem setUrlString:v10];
      }
      id v11 = objc_alloc_init(EKCalendarValidateEditItem);
      validateItem = self->_validateItem;
      self->_validateItem = v11;

      [(EKCalendarButtonEditItem *)self->_validateItem setButtonTarget:self action:sel__validateURL_];
      if (_os_feature_enabled_impl())
      {
        v13 = objc_alloc_init(EKCalendarSubscriptionSpamCheckEditItem);
        spamCheckItem = self->_spamCheckItem;
        self->_spamCheckItem = v13;

        [(EKCalendarSubscriptionSpamCheckEditItem *)self->_spamCheckItem setSubscriptionSpamDelegate:self];
        v15 = objc_alloc_init(EKCalendarCancelValidationEditItem);
        cancelValidationItem = self->_cancelValidationItem;
        self->_cancelValidationItem = v15;

        [(EKCalendarCancelValidationEditItem *)self->_cancelValidationItem setHidden:1];
        [(EKCalendarButtonEditItem *)self->_cancelValidationItem setButtonTarget:self action:sel_cancel_];
        v17 = self->_cancelValidationItem;
        id v18 = EventKitUIBundle();
        v19 = [v18 localizedStringForKey:@"Cancel - Adding Subscription" value:@"Cancel" table:0];
        [(EKCalendarButtonEditItem *)v17 setButtonTitle:v19];
      }
      v20 = [(EKSubscribedCalendarEditor *)self prefillURL];

      if (v20)
      {
        id v21 = [(EKSubscribedCalendarEditor *)self prefillURL];
        v22 = [v21 absoluteString];
        [(EKSubscribedCalendarEditor *)self _startSpamCheckingURLString:v22];
      }
      if (!self->_holidayCalendarMode)
      {
        if (_os_feature_enabled_impl())
        {
          objc_super v23 = self->_validateItem;
          v62[0] = self->_urlItem;
          v62[1] = v23;
          v24 = self->_spamCheckItem;
          v62[2] = self->_cancelValidationItem;
          v62[3] = v24;
          v25 = (void *)MEMORY[0x1E4F1C978];
          v26 = (EKCalendarValidateEditItem **)v62;
          uint64_t v27 = 4;
          goto LABEL_27;
        }
        v51 = self->_validateItem;
        v61[0] = self->_urlItem;
        v61[1] = v51;
        v25 = (void *)MEMORY[0x1E4F1C978];
        v26 = (EKCalendarValidateEditItem **)v61;
        goto LABEL_26;
      }
      break;
    case 1uLL:
      v28 = objc_alloc_init(EKCalendarSubscriptionURLEditItem);
      v29 = self->_urlItem;
      self->_urlItem = v28;

      [(EKCalendarSubscriptionURLEditItem *)self->_urlItem setEditable:0];
      v30 = [[EKCalendarPreviewEventsEditItem alloc] initWithPreviewSummary:self->_previewSummary];
      v31 = objc_alloc_init(EKCalendarTitleEditItem);
      [(EKCalendarTitleEditItem *)v31 setShowHeader:1];
      if (self->_holidayCalendarMode && [(NSString *)self->_preloadTitle length]) {
        [(EKCalendarTitleEditItem *)v31 setPrefillTitle:self->_preloadTitle];
      }
      v32 = [[EKCalendarAccountEditItem alloc] initLimitedToSource:self->_limitedToSource];
      [(EKCalendarSubscriptionDetailsEditItem *)v32 setEditable:1];
      v33 = objc_alloc_init(EKCalendarColorEditItem);
      colorEditItem = self->_colorEditItem;
      self->_colorEditItem = v33;

      v35 = objc_alloc_init(EKCalendarIgnoreAlertsEditItem);
      v36 = objc_alloc_init(EKCalendarSubscriptionDetailsEditItem);
      v37 = v36;
      if (self->_holidayCalendarMode)
      {
        v60[0] = v31;
        v60[1] = v30;
        v38 = self->_colorEditItem;
        v60[2] = v32;
        v60[3] = v38;
        v60[4] = v35;
        v60[5] = v36;
        v39 = (void *)MEMORY[0x1E4F1C978];
        v40 = v60;
        uint64_t v41 = 6;
      }
      else
      {
        v59[0] = self->_urlItem;
        v59[1] = v31;
        v48 = self->_colorEditItem;
        v59[2] = v30;
        v59[3] = v32;
        v59[4] = v48;
        v59[5] = v35;
        v59[6] = v36;
        v39 = (void *)MEMORY[0x1E4F1C978];
        v40 = v59;
        uint64_t v41 = 7;
      }
      v49 = [v39 arrayWithObjects:v40 count:v41];
      [v5 addObjectsFromArray:v49];

      goto LABEL_22;
    case 2uLL:
      [(EKCalendarValidateEditItem *)self->_validateItem setShowError:1];
      if (self->_holidayCalendarMode)
      {
        v58 = self->_validateItem;
        v25 = (void *)MEMORY[0x1E4F1C978];
        v26 = &v58;
        uint64_t v27 = 1;
      }
      else
      {
        v50 = self->_validateItem;
        v57[0] = self->_urlItem;
        v57[1] = v50;
        v25 = (void *)MEMORY[0x1E4F1C978];
        v26 = (EKCalendarValidateEditItem **)v57;
LABEL_26:
        uint64_t v27 = 2;
      }
LABEL_27:
      v30 = [v25 arrayWithObjects:v26 count:v27];
      [v5 addObjectsFromArray:v30];
      goto LABEL_28;
    case 3uLL:
      v30 = objc_alloc_init(EKCalendarTitleEditItem);
      [(EKCalendarPreviewEventsEditItem *)v30 setShowHeader:0];
      v42 = objc_alloc_init(EKCalendarColorEditItem);
      v43 = self->_colorEditItem;
      self->_colorEditItem = v42;

      [(EKCalendarColorEditItem *)self->_colorEditItem setLayoutInline:0];
      v31 = objc_alloc_init(EKCalendarIgnoreAlertsEditItem);
      v32 = objc_alloc_init(EKCalendarSubscriptionDetailsEditItem);
      v44 = self->_colorEditItem;
      v56[0] = v30;
      v56[1] = v44;
      v56[2] = v31;
      v56[3] = v32;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
      [v5 addObjectsFromArray:v45];

      if ([(EKSubscribedCalendarEditor *)self _shouldShowDeleteButton])
      {
        v35 = objc_alloc_init(EKCalendarButtonEditItem);
        [(EKCalendarIgnoreAlertsEditItem *)v35 setButtonTarget:self action:sel__unsubscribeTapped_];
        v46 = EventKitUIBundle();
        v47 = [v46 localizedStringForKey:@"Unsubscribe" value:&stru_1F0CC2140 table:0];
        [(EKCalendarIgnoreAlertsEditItem *)v35 setButtonTitle:v47];

        [(EKCalendarIgnoreAlertsEditItem *)v35 setAccessibilityIdentifier:@"unsubscribe-calendar"];
        [v5 addObject:v35];
LABEL_22:
      }
LABEL_28:

      break;
    default:
      break;
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __49__EKSubscribedCalendarEditor__editItemsForState___block_invoke;
  v55[3] = &unk_1E608B0C0;
  v55[4] = self;
  v52 = [MEMORY[0x1E4F28F60] predicateWithBlock:v55];
  v53 = [v5 filteredArrayUsingPredicate:v52];

  return v53;
}

uint64_t __49__EKSubscribedCalendarEditor__editItemsForState___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 calendar];
  char v6 = [*(id *)(a1 + 32) eventStore];
  uint64_t v7 = [v4 configureWithCalendar:v5 store:v6];

  return v7;
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  [(EKSubscribedCalendarEditor *)self _cancelInFlightPreviewDataFetch];
  v5.receiver = self;
  v5.super_class = (Class)EKSubscribedCalendarEditor;
  [(EKAbstractCalendarEditor *)&v5 cancel:v4];
}

- (void)willSaveCalendar:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 source];

  if (!v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v6 = [(EKAbstractCalendarEditor *)self eventStore];
    uint64_t v7 = [v6 sources];

    id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 sourceType] == 4)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v12 = [(EKAbstractCalendarEditor *)self calendar];
    [v12 setSource:v8];
  }
  if (([v4 isSubscribedHolidayCalendar] & 1) == 0)
  {
    [(CUIKSubscribedCalendarManager *)self->_subCalManager shutdownDAForCalendarUpdates];
    [(CUIKSubscribedCalendarManager *)self->_subCalManager updateOrCreateAccountWithCalendar:v4 previousAccountID:0 newUsername:self->_username newPassword:self->_password newAllowsInsecureConnections:self->_insecureConnectionApproved];
  }
}

- (void)didSaveCalendar:(id)a3
{
  if (([a3 isSubscribedHolidayCalendar] & 1) == 0)
  {
    subCalManager = self->_subCalManager;
    [(CUIKSubscribedCalendarManager *)subCalManager restartDAAfterCalendarUpdates];
  }
}

- (void)_unsubscribeFromCalendar
{
  objc_super v3 = (void *)MEMORY[0x1E4F57C38];
  id v4 = [(EKAbstractCalendarEditor *)self calendar];
  [v3 unsubscribeFromCalendar:v4];

  uint64_t v5 = [(EKAbstractCalendarEditor *)self delegate];
  if (v5)
  {
    char v6 = (void *)v5;
    uint64_t v7 = [(EKAbstractCalendarEditor *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(EKAbstractCalendarEditor *)self delegate];
      [v9 calendarEditor:self didCompleteWithAction:2];
    }
  }
}

- (void)_unsubscribeFromCalendarAndReportJunk
{
  objc_super v3 = (void *)MEMORY[0x1E4F57C38];
  id v4 = [(EKAbstractCalendarEditor *)self calendar];
  [v3 unsubscribeFromCalendar:v4 reportAsJunk:1];

  uint64_t v5 = [(EKAbstractCalendarEditor *)self delegate];
  if (v5)
  {
    char v6 = (void *)v5;
    uint64_t v7 = [(EKAbstractCalendarEditor *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(EKAbstractCalendarEditor *)self delegate];
      [v9 calendarEditor:self didCompleteWithAction:2];
    }
  }
}

- (void)_unsubscribeTapped:(id)a3
{
  id v5 = a3;
  char v6 = [(EKAbstractCalendarEditor *)self calendar];

  if (!v6)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"EKSubscribedCalendarEditor.m" lineNumber:425 description:@"-[EKSubscribedCalendarEditor _unsubscribeTapped]: There is no calendar to unsubscribe from."];
  }
  uint64_t v7 = EventKitUIBundle();
  char v8 = [v7 localizedStringForKey:@"Are you sure you want to unsubscribe from this calendar? All events associated with the calendar will also be deleted." value:&stru_1F0CC2140 table:0];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = EventKitUIBundle();
  id v11 = [v10 localizedStringForKey:@"Unsubscribe" value:&stru_1F0CC2140 table:0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke;
  v36[3] = &unk_1E60874A8;
  v36[4] = self;
  id v12 = [v9 actionWithTitle:v11 style:2 handler:v36];

  [v12 setAccessibilityIdentifier:@"unsubscribe-alert-button"];
  long long v13 = (void *)MEMORY[0x1E4FB1410];
  long long v14 = EventKitUIBundle();
  long long v15 = [v14 localizedStringForKey:@"Unsubscribe and Report Junk" value:&stru_1F0CC2140 table:0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke_2;
  v35[3] = &unk_1E60874A8;
  v35[4] = self;
  long long v16 = [v13 actionWithTitle:v15 style:2 handler:v35];

  [v16 setAccessibilityIdentifier:@"unsubscribe-report-junk-alert-button"];
  v17 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v18 = EventKitUIBundle();
  v19 = [v18 localizedStringForKey:@"Cancel - unsubscribe clicked" value:@"Cancel" table:0];
  v20 = [v17 actionWithTitle:v19 style:1 handler:0];

  [v20 setAccessibilityIdentifier:@"cancel-alert-button"];
  id v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:0 preferredStyle:0];
  [v21 addAction:v12];
  [v21 addAction:v16];
  [v21 addAction:v20];
  v22 = [v5 buttonView];
  objc_super v23 = [v21 popoverPresentationController];
  [v23 setSourceView:v22];

  v24 = [v5 buttonView];

  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [v21 popoverPresentationController];
  objc_msgSend(v33, "setSourceRect:", v26, v28, v30, v32);

  [(EKSubscribedCalendarEditor *)self presentViewController:v21 animated:1 completion:0];
}

uint64_t __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribeFromCalendar];
}

uint64_t __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribeFromCalendarAndReportJunk];
}

- (void)_validateURL:(id)a3
{
  if ([(EKCalendarValidateEditItem *)self->_validateItem URLIsSpam])
  {
    id v4 = (void *)MEMORY[0x1E4FB1410];
    id v5 = EventKitUIBundle();
    char v6 = [v5 localizedStringForKey:@"Subscribe Anyway" value:&stru_1F0CC2140 table:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__EKSubscribedCalendarEditor__validateURL___block_invoke;
    v15[3] = &unk_1E60874A8;
    v15[4] = self;
    uint64_t v7 = [v4 actionWithTitle:v6 style:2 handler:v15];

    char v8 = (void *)MEMORY[0x1E4FB1410];
    id v9 = EventKitUIBundle();
    id v10 = [v9 localizedStringForKey:@"Cancel - subscribing to a spam calendar" value:@"Cancel" table:0];
    id v11 = [v8 actionWithTitle:v10 style:1 handler:0];

    id v12 = EventKitUIBundle();
    long long v13 = [v12 localizedStringForKey:@"This subscribed calendar is spam. Are you sure you want to continue?" value:&stru_1F0CC2140 table:0];

    long long v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:0 preferredStyle:1];
    [v14 addAction:v7];
    [v14 addAction:v11];
    [(EKSubscribedCalendarEditor *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    [(EKSubscribedCalendarEditor *)self _validateUserEnteredURL];
  }
}

uint64_t __43__EKSubscribedCalendarEditor__validateURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validateUserEnteredURL];
}

- (void)_validateUserEnteredURL
{
  self->_insecureConnectionOffered = 0;
  self->_insecureConnectionApproved = 0;
  [(EKSubscribedCalendarEditor *)self _validateURL];
}

- (void)_validateURL
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_insecureConnectionOffered && !self->_insecureConnectionApproved)
  {
    [(EKCalendarValidateEditItem *)self->_validateItem setAnimateSpinner:0];
    [(EKSubscribedCalendarEditor *)self setState:2];
  }
  else
  {
    [(EKCalendarValidateEditItem *)self->_validateItem setAnimateSpinner:1];
    objc_super v3 = (void *)MEMORY[0x1E4F57C38];
    id v4 = [(EKCalendarSubscriptionURLEditItem *)self->_urlItem urlString];
    id v5 = [v3 checkSubscriptionURL:v4 missingSchemeBlock:0 unsupportedSchemeBlock:0];

    if (v5)
    {
      char v6 = [MEMORY[0x1E4F57C38] subscriptionURL:v5 usingHTTPS:!self->_insecureConnectionApproved];
      uint64_t v7 = v6;
      if (v6)
      {
        char v8 = [v6 absoluteString];
        [(EKCalendarSubscriptionURLEditItem *)self->_urlItem setUrlString:v8];

        [(EKSubscribedCalendarEditor *)self _kickoffPreviewDataFetch:v7];
      }
      else
      {
        id v10 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_FAULT))
        {
          BOOL insecureConnectionApproved = self->_insecureConnectionApproved;
          int v13 = 138412546;
          long long v14 = v5;
          __int16 v15 = 1024;
          BOOL v16 = insecureConnectionApproved;
          _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_FAULT, "Got unexpected nil URL from CUIKSubscribedCalendarUtilities. original = %@, BOOL insecureConnectionApproved = %{BOOL}d", (uint8_t *)&v13, 0x12u);
        }
        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F57648]) initWithType:@"Subscriptions" subtype:@"BadURL" context:0];
        [v12 report];

        [(EKCalendarValidateEditItem *)self->_validateItem setAnimateSpinner:0];
        [(EKSubscribedCalendarEditor *)self setState:2];
      }
    }
    else
    {
      id v9 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEFAULT, "Local validation of subcal url failed, aborting add flow", (uint8_t *)&v13, 2u);
      }
      [(EKCalendarValidateEditItem *)self->_validateItem setAnimateSpinner:0];
      [(EKSubscribedCalendarEditor *)self setState:2];
    }
  }
}

- (void)_promptToContinueUsingInsecureConnection
{
  self->_insecureConnectionOffered = 1;
  objc_super v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Insecure Connection" value:&stru_1F0CC2140 table:0];
  char v6 = EventKitUIBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"The connection is not secure. Do you want to continue subscribing?" value:&stru_1F0CC2140 table:0];
  char v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = EventKitUIBundle();
  id v11 = [v10 localizedStringForKey:@"Continue - insecure connection" value:@"Continue" table:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke;
  v18[3] = &unk_1E60874A8;
  v18[4] = self;
  id v12 = [v9 actionWithTitle:v11 style:0 handler:v18];

  [v8 addAction:v12];
  int v13 = (void *)MEMORY[0x1E4FB1410];
  long long v14 = EventKitUIBundle();
  __int16 v15 = [v14 localizedStringForKey:@"Cancel - insecure connection" value:@"Cancel" table:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke_2;
  v17[3] = &unk_1E60874A8;
  v17[4] = self;
  BOOL v16 = [v13 actionWithTitle:v15 style:1 handler:v17];

  [v8 addAction:v16];
  [(EKSubscribedCalendarEditor *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1113) = 1;
  return [*(id *)(a1 + 32) _validateURL];
}

uint64_t __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1113) = 0;
  return [*(id *)(a1 + 32) _validateURL];
}

- (void)_kickoffPreviewDataFetch:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5E950];
  id v5 = a3;
  id v8 = [v4 sharedConnection];
  char v6 = [v8 downloadSubscribedCalendarWithURL:v5 queue:MEMORY[0x1E4F14428] delegate:self];

  id previewDownloadToken = self->_previewDownloadToken;
  self->_id previewDownloadToken = v6;
}

- (void)_cancelInFlightPreviewDataFetch
{
  if (self->_previewDownloadToken)
  {
    id v3 = [MEMORY[0x1E4F5E950] sharedConnection];
    [v3 cancelDownloadingSubscriptionCalendarWithDownloadID:self->_previewDownloadToken];
  }
}

- (void)calendarItemStartedEditing:(id)a3
{
  if ([(EKSubscribedCalendarEditor *)self state] == 3)
  {
    id v4 = [(EKSubscribedCalendarEditor *)self navigationItem];
    id v5 = [v4 leftBarButtonItem];
    [v5 setEnabled:1];

    id v7 = [(EKSubscribedCalendarEditor *)self navigationItem];
    char v6 = [v7 rightBarButtonItem];
    [v6 setEnabled:1];
  }
}

- (void)viewWillLayoutSubviews
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_tableViewHeader && self->_allowTableHeaderLayouts) {
    [(EKSubscribedCalendarEditor *)self _updateTableHeaderLayout];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(EKAbstractCalendarEditor *)self editItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(EKSubscribedCalendarEditor *)self view];
        [v9 frame];
        [v8 layoutForWidth:CGRectGetWidth(v16)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (CGSize)calculatePreferredContentSize
{
  if (self->_holidayCalendarMode && !self->_state)
  {
    double v2 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)EKSubscribedCalendarEditor;
    [(EKAbstractCalendarEditor *)&v4 calculatePreferredContentSize];
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)subscribedCalendarDidFinishLoading:(id)a3
{
  id v5 = a3;
  uint64_t v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEFAULT, "Successfully fetched subscribed calendar preview data", v24, 2u);
  }
  objc_storeStrong((id *)&self->_previewSummary, a3);
  id v7 = [(DAESubscribedCalendarSummary *)self->_previewSummary title];
  id v8 = [(EKAbstractCalendarEditor *)self calendar];
  [v8 setTitle:v7];

  id v9 = [(DAESubscribedCalendarSummary *)self->_previewSummary color];
  long long v10 = [(EKAbstractCalendarEditor *)self calendar];
  [v10 setColorStringRaw:v9];

  long long v11 = [(DAESubscribedCalendarSummary *)self->_previewSummary notes];
  long long v12 = [(EKAbstractCalendarEditor *)self calendar];
  [v12 setNotes:v11];

  [(DAESubscribedCalendarSummary *)self->_previewSummary refreshInterval];
  if (v13 <= 0.0)
  {
    CGRect v16 = [(EKAbstractCalendarEditor *)self calendar];
    uint64_t v17 = v16;
    uint64_t v18 = 604800;
  }
  else
  {
    [(DAESubscribedCalendarSummary *)self->_previewSummary refreshInterval];
    uint64_t v15 = (int)v14;
    CGRect v16 = [(EKAbstractCalendarEditor *)self calendar];
    uint64_t v17 = v16;
    uint64_t v18 = v15;
  }
  [v16 setRefreshInterval:v18];

  v19 = [v5 subscriptionID];
  v20 = [(EKAbstractCalendarEditor *)self calendar];
  [v20 setSubscriptionID:v19];

  id v21 = [v5 subscriptionURL];
  v22 = [v21 absoluteString];
  objc_super v23 = [(EKAbstractCalendarEditor *)self calendar];
  [v23 setSubcalURL:v22];

  [(EKCalendarValidateEditItem *)self->_validateItem setAnimateSpinner:0];
  [(EKSubscribedCalendarEditor *)self setState:1];
}

- (void)subscribedCalendarFailedWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch subscribed calendar preview data: %@", (uint8_t *)&v7, 0xCu);
  }
  id previewDownloadToken = self->_previewDownloadToken;
  self->_id previewDownloadToken = 0;

  if (self->_insecureConnectionOffered)
  {
    [(EKCalendarValidateEditItem *)self->_validateItem setAnimateSpinner:0];
    [(EKSubscribedCalendarEditor *)self setState:2];
  }
  else
  {
    [(EKSubscribedCalendarEditor *)self _promptToContinueUsingInsecureConnection];
  }
}

- (void)subscribedCalendarRequiresPassword:(id)a3 withContinuation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEFAULT, "Fetching subscribed calendar requires username and passwor", buf, 2u);
  }
  int v7 = (void *)MEMORY[0x1E4FB1418];
  id v8 = EventKitUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Authentication" value:&stru_1F0CC2140 table:0];
  long long v10 = EventKitUIBundle();
  long long v11 = [v10 localizedStringForKey:@"You must enter a valid username and password to access this calendar." value:&stru_1F0CC2140 table:0];
  long long v12 = [v7 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

  [v12 addTextFieldWithConfigurationHandler:&__block_literal_global_67];
  [v12 addTextFieldWithConfigurationHandler:&__block_literal_global_158];
  double v13 = (void *)MEMORY[0x1E4FB1410];
  double v14 = EventKitUIBundle();
  uint64_t v15 = [v14 localizedStringForKey:@"OK - subscription authentication" value:@"OK" table:0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_3;
  v26[3] = &unk_1E608B108;
  v26[4] = self;
  id v27 = v12;
  id v16 = v5;
  id v28 = v16;
  id v17 = v12;
  uint64_t v18 = [v13 actionWithTitle:v15 style:0 handler:v26];

  [v17 addAction:v18];
  v19 = (void *)MEMORY[0x1E4FB1410];
  v20 = EventKitUIBundle();
  id v21 = [v20 localizedStringForKey:@"Cancel - subscription authentication" value:@"Cancel" table:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_4;
  v24[3] = &unk_1E608A3D0;
  v24[4] = self;
  id v25 = v16;
  id v22 = v16;
  objc_super v23 = [v19 actionWithTitle:v21 style:1 handler:v24];

  [v17 addAction:v23];
  [(EKSubscribedCalendarEditor *)self presentViewController:v17 animated:1 completion:0];
}

void __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v2 = EventKitUIBundle();
  double v3 = [v2 localizedStringForKey:@"Username" value:&stru_1F0CC2140 table:0];
  [v4 setPlaceholder:v3];

  [v4 setTextContentType:*MEMORY[0x1E4FB2FE8]];
}

void __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v2 = EventKitUIBundle();
  double v3 = [v2 localizedStringForKey:@"Password" value:&stru_1F0CC2140 table:0];
  [v4 setPlaceholder:v3];

  [v4 setTextContentType:*MEMORY[0x1E4FB2FB0]];
}

uint64_t __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 40) textFields];
  double v3 = [v2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 text];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 1096);
  *(void *)(v5 + 1096) = v4;

  int v7 = [*(id *)(a1 + 40) textFields];
  id v8 = [v7 objectAtIndexedSubscript:1];
  uint64_t v9 = [v8 text];
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(void **)(v10 + 1104);
  *(void *)(v10 + 1104) = v9;

  long long v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v12();
}

uint64_t __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 1096);
  *(void *)(v2 + 1096) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1104);
  *(void *)(v4 + 1104) = 0;

  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)_startSpamCheckingURLString:(id)a3
{
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = [MEMORY[0x1E4F57C00] sharedPreferences];
    int v5 = [v4 allowSubscribedCalendarSpamDetection];

    if (v5)
    {
      if ([v7 length])
      {
        uint64_t v6 = [MEMORY[0x1E4F57C38] checkSubscriptionURL:v7 missingSchemeBlock:0 unsupportedSchemeBlock:0];
      }
      else
      {
        uint64_t v6 = 0;
      }
      [(EKCalendarSubscriptionSpamCheckEditItem *)self->_spamCheckItem setURLToCheck:v6];
      [(EKCalendarValidateEditItem *)self->_validateItem setURLIsSpam:0];
      [(EKSubscribedCalendarEditor *)self _updateCancelButtonVisibilityForSpamStatus:0];
    }
  }
}

- (void)URLEditItemDidChangeURLString:(id)a3
{
  id v4 = [a3 urlString];
  [(EKSubscribedCalendarEditor *)self _startSpamCheckingURLString:v4];
}

- (void)calendarSubscriptionSpamCheckEditItem:(id)a3 didDetermineThatURL:(id)a4 isSpam:(BOOL)a5
{
  BOOL v5 = a5;
  -[EKCalendarValidateEditItem setURLIsSpam:](self->_validateItem, "setURLIsSpam:", a5, a4);

  [(EKSubscribedCalendarEditor *)self _updateCancelButtonVisibilityForSpamStatus:v5];
}

- (void)_updateCancelButtonVisibilityForSpamStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKCalendarCancelValidationEditItem *)self->_cancelValidationItem hidden] == a3)
  {
    [(EKCalendarCancelValidationEditItem *)self->_cancelValidationItem setHidden:!v3];
    id v5 = [(EKSubscribedCalendarEditor *)self tableView];
    [v5 reloadData];
  }
}

- (void)_showPrivacyNotice
{
  BOOL v3 = EventKitUIBundle();
  id v15 = [v3 localizedStringForKey:@"Subscribed Calendar Spam Protection" value:&stru_1F0CC2140 table:0];

  id v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Calendar can check whether a subscribed calendar is spam before you add it. In order to do this, Calendar will send the URL of the subscribed calendar to Apple for checking. You can change this in Settings.", &stru_1F0CC2140, 0 value table];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F83AF8]) initWithTitle:v15 detailText:v5 icon:0];
  id v7 = [MEMORY[0x1E4F83A80] boldButton];
  id v8 = EventKitUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Enable" value:&stru_1F0CC2140 table:0];
  [v7 setTitle:v9 forState:0];

  [v7 addTarget:self action:sel__allowButtonTapped forControlEvents:64];
  uint64_t v10 = [MEMORY[0x1E4F83AB8] linkButton];
  long long v11 = EventKitUIBundle();
  long long v12 = [v11 localizedStringForKey:@"Disable" value:&stru_1F0CC2140 table:0];
  [v10 setTitle:v12 forState:0];

  [v10 addTarget:self action:sel__denyButtonTapped forControlEvents:64];
  double v13 = [v6 buttonTray];
  [v13 addButton:v7];

  double v14 = [v6 buttonTray];
  [v14 addButton:v10];

  [(EKSubscribedCalendarEditor *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_allowButtonTapped
{
  [(EKSubscribedCalendarEditor *)self dismissViewControllerAnimated:1 completion:0];
  uint64_t v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
  [v2 setAllowSubscribedCalendarSpamDetection:1];

  id v3 = [MEMORY[0x1E4F57C00] sharedPreferences];
  [v3 setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:1];
}

- (void)_denyButtonTapped
{
  [(EKSubscribedCalendarEditor *)self dismissViewControllerAnimated:1 completion:0];
  uint64_t v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
  [v2 setAllowSubscribedCalendarSpamDetection:0];

  id v3 = [MEMORY[0x1E4F57C00] sharedPreferences];
  [v3 setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:1];
}

- (NSURL)prefillURL
{
  return self->_prefillURL;
}

- (void)setPrefillURL:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefillURL, 0);
  objc_storeStrong((id *)&self->_subCalManager, 0);
  objc_storeStrong((id *)&self->_previewSummary, 0);
  objc_storeStrong(&self->_previewDownloadToken, 0);
  objc_storeStrong((id *)&self->_spamCheckItem, 0);
  objc_storeStrong((id *)&self->_cancelValidationItem, 0);
  objc_storeStrong((id *)&self->_validateItem, 0);
  objc_storeStrong((id *)&self->_urlItem, 0);
  objc_storeStrong((id *)&self->_colorEditItem, 0);
  objc_storeStrong((id *)&self->_preloadTitle, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_tableViewHeader, 0);

  objc_storeStrong((id *)&self->_limitedToSource, 0);
}

@end