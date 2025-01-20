@interface EKCalendarItemEditor
+ (id)_addLocalizedString;
+ (id)_doneLocalizedString;
+ (id)defaultTitleForCalendarItem;
- (BOOL)_canEnableDoneButton;
- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)attachmentsModifiedOnRecurrence;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformSaveKeyCommand;
- (BOOL)hasAttachmentChanges;
- (BOOL)hasModifiedAttendeesFromSuggestion;
- (BOOL)hasUnsavedChanges;
- (BOOL)isTextEditing;
- (BOOL)pendingVideoConference;
- (BOOL)saveCalendarItemWithSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)saveWithSpan:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)shouldDisplayEditItem:(id)a3;
- (BOOL)showsTimeZone;
- (BOOL)timeImplicitlySet;
- (BOOL)willPresentDialogOnSave;
- (CGSize)preferredContentSize;
- (EKCalendarItem)calendarItem;
- (EKCalendarItemEditItem)currentEditItem;
- (EKCalendarItemEditor)init;
- (EKCalendarItemEditorDelegate)editorDelegate;
- (EKChangeSet)originalChangeSet;
- (EKEventStore)store;
- (UIResponder)responderToRestoreOnAppearence;
- (_UIAccessDeniedView)accessDeniedView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_editItemAtIndexPath:(id)a3 firstRowIndex:(int64_t *)a4;
- (id)_editItems;
- (id)_nameForDeleteButton;
- (id)_orderedEditItems;
- (id)_viewForSheet;
- (id)_viewHierarchy;
- (id)attachmentsModifiedEvent;
- (id)cellWithReuseIdentifier:(id)a3 forEditItem:(id)a4;
- (id)defaultAlertTitle;
- (id)navigationItem;
- (id)notificationNamesForLocaleChange;
- (id)preferredTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)title;
- (int64_t)firstTableRowForEditItem:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowNumberForEditItem:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)calendarItemCreationMethod;
- (unint64_t)entityType;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)tableSectionForEditItem:(id)a3;
- (unint64_t)visibleSectionToRestoreOnAppearence;
- (void)_completeWithAction:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5;
- (void)_configureVisibleItems;
- (void)_copyEventForPossibleRevert;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide;
- (void)_localeChanged;
- (void)_performDelete:(int64_t)a3;
- (void)_pinKeyboard:(BOOL)a3;
- (void)_presentAttachmentRecurrenceSheetForEvent:(id)a3 withContinueBlock:(id)a4;
- (void)_presentDetachSheetForEvent:(id)a3 saveAttachments:(BOOL)a4 withContinueBlock:(id)a5;
- (void)_reallyHandleCellHeightChange;
- (void)_refreshDataAndDismissViewControllerIfDeleted;
- (void)_revertEvent;
- (void)_setCalendarItemOnEditItems;
- (void)_setWantsToEnableDoneButton:(BOOL)a3;
- (void)_setupFirstResponder;
- (void)_tableViewDidUpdateHeights;
- (void)_tableViewWillUpdateHeights;
- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3;
- (void)_updateDoneButtonState;
- (void)applicationDidResume;
- (void)attemptDisplayReviewPrompt;
- (void)cancel:(id)a3;
- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4;
- (void)completeAndSave;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)completeWithAction:(int64_t)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)deleteClicked:(id)a3;
- (void)done:(id)a3;
- (void)done:(id)a3 withContinueBlock:(id)a4;
- (void)editItem:(id)a3 didSaveFromDetailViewController:(BOOL)a4;
- (void)editItem:(id)a3 performActionsOnCellAtSubitem:(unint64_t)a4 actions:(id)a5;
- (void)editItem:(id)a3 wantsDoneButtonDisabled:(BOOL)a4;
- (void)editItem:(id)a3 wantsKeyboardPinned:(BOOL)a4;
- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5;
- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5 rowReloads:(id)a6;
- (void)editItem:(id)a3 wantsRowReload:(id)a4;
- (void)editItem:(id)a3 wantsRowsScrolledToVisible:(id)a4;
- (void)editItem:(id)a3 wantsViewControllerPresented:(id)a4;
- (void)editItem:(id)a3 wantsViewControllerPushed:(id)a4;
- (void)editItemDidEndEditing:(id)a3;
- (void)editItemDidStartEditing:(id)a3;
- (void)editItemRequiresHeightChange:(id)a3;
- (void)editItemRequiresPopoverSizeUpdate:(id)a3;
- (void)editItemTextChanged:(id)a3;
- (void)editItemWantsFirstResponderResigned:(id)a3;
- (void)editItemWantsFooterTitlesToReload:(id)a3;
- (void)editItemWantsInjectableViewControllerToBeShown:(id)a3;
- (void)handleCloseKeyCommand;
- (void)handleSaveKeyCommand;
- (void)loadView;
- (void)prepareEditItems;
- (void)resetBackgroundColor;
- (void)resignCurrentEditItemFirstResponder;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAccessDeniedView:(id)a3;
- (void)setCalendarItem:(id)a3;
- (void)setCalendarItemCreationMethod:(unint64_t)a3;
- (void)setDefaultCalendar:(id)a3;
- (void)setEditorDelegate:(id)a3;
- (void)setHasModifiedAttendeesFromSuggestion:(BOOL)a3;
- (void)setIsTextEditing:(BOOL)a3;
- (void)setOriginalChangeSet:(id)a3;
- (void)setPendingVideoConference:(BOOL)a3;
- (void)setResponderToRestoreOnAppearence:(id)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4;
- (void)setShowsTimeZone:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)setTimeImplicitlySet:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVisibleSectionToRestoreOnAppearence:(unint64_t)a3;
- (void)setupForEvent;
- (void)storeChanged:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateNavButtonsWithSpacing;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKCalendarItemEditor

- (EKCalendarItemEditor)init
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarItemEditor;
  v2 = [(EKCalendarItemEditor *)&v13 initWithStyle:2];
  v3 = v2;
  if (v2)
  {
    v4 = [(EKCalendarItemEditor *)v2 preferredTitle];
    [(EKCalendarItemEditor *)v3 setTitle:v4];

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    editItemsDisablingDoneButton = v3->_editItemsDisablingDoneButton;
    v3->_editItemsDisablingDoneButton = (NSMutableSet *)v5;

    v3->_needsFirstResponderSet = 1;
    objc_initWeak(&location, v3);
    v14[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __28__EKCalendarItemEditor_init__block_invoke;
    v10[3] = &unk_1E60874F8;
    objc_copyWeak(&v11, &location);
    id v8 = (id)[(EKCalendarItemEditor *)v3 registerForTraitChanges:v7 withHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__EKCalendarItemEditor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)dealloc
{
  if (self->_editItems)
  {
    v3 = [(EKCalendarItemEditor *)self _editItems];
    [v3 makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
  }
  [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController cancelAnimated:0];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v5 dealloc];
}

- (void)setStore:(id)a3
{
  objc_super v5 = (EKEventStore *)a3;
  p_store = &self->_store;
  store = self->_store;
  v10 = v5;
  if (store != v5)
  {
    if (store && [(EKCalendarItemEditor *)self isViewLoaded])
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:*MEMORY[0x1E4F25460] object:*p_store];
    }
    objc_storeStrong((id *)&self->_store, a3);
    if (*p_store && [(EKCalendarItemEditor *)self isViewLoaded])
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel_storeChanged_ name:*MEMORY[0x1E4F25460] object:*p_store];
    }
  }
}

- (void)setCalendarItem:(id)a3
{
  p_calendarItem = &self->_calendarItem;
  v9 = (EKCalendarItem *)a3;
  if (*p_calendarItem != v9)
  {
    objc_storeStrong((id *)&self->_calendarItem, a3);
    if ([(EKCalendarItem *)*p_calendarItem isNew])
    {
      v6 = [(EKCalendarItem *)v9 changeSet];
      v7 = (EKChangeSet *)[v6 copy];
      originalChangeSet = self->_originalChangeSet;
      self->_originalChangeSet = v7;
    }
    if ([(EKCalendarItemEditor *)self isViewLoaded]) {
      [(EKCalendarItemEditor *)self setupForEvent];
    }
  }
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  self->_shouldOverrideAuthorizationStatus = a3;
  [(EKCalendarItemEditor *)self _updateAccessDeniedViewWithNewStatus:a4];
  self->_lastAuthorizationStatus = a4;
}

- (void)setDefaultCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarItemEditor *)self calendarItem];
  [v5 setCalendar:v4];
}

- (unint64_t)tableSectionForEditItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_orderedEditItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      unint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "containsObject:", v4, (void)v13))
        {
          unint64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      unint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_12:

  return v11;
}

- (int64_t)firstTableRowForEditItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = self->_orderedEditItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v11 containsObject:v4])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
LABEL_9:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(id *)(*((void *)&v19 + 1) + 8 * v16);
              if (v17 == v4) {
                break;
              }
              v8 += [v17 numberOfSubitems];
              if (v14 == ++v16)
              {
                uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v14) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)loadView
{
  uint64_t v3 = MEMORY[0x1E4F1DB28];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v7 = [(EKCalendarItemEditor *)self _popoverController];

  if (v7) {
    double v8 = EKUIContainedControllerIdealWidth();
  }
  else {
    double v8 = *(double *)(v3 + 16);
  }
  unint64_t v11 = -[EKCalendarItemEditorTableView initWithFrame:style:]([EKCalendarItemEditorTableView alloc], "initWithFrame:style:", 2, v4, v5, v8, v6);
  [(EKCalendarItemEditorTableView *)v11 setAutoresizingMask:18];
  [(EKCalendarItemEditorTableView *)v11 setDelegate:self];
  [(EKCalendarItemEditorTableView *)v11 setDataSource:self];
  [(EKCalendarItemEditorTableView *)v11 setKeyboardDismissMode:1];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v9 lineHeight];
  -[EKCalendarItemEditorTableView setEstimatedRowHeight:](v11, "setEstimatedRowHeight:");

  if (EKUIUnscaledCatalyst())
  {
    [(EKCalendarItemEditorTableView *)v11 setSeparatorStyle:1];
    [(EKCalendarItemEditorTableView *)v11 setRowHeight:EKUIUnscaledCatalystTableRowHeightDefault()];
    uint64_t v10 = *MEMORY[0x1E4FB27D0];
    [(EKCalendarItemEditorTableView *)v11 setMinimumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [(EKCalendarItemEditorTableView *)v11 setMaximumContentSizeCategory:v10];
  }
  [(EKCalendarItemEditor *)self setView:v11];
  [(EKCalendarItemEditor *)self resetBackgroundColor];
  [(EKCalendarItemEditor *)self setResponderToRestoreOnAppearence:0];
}

- (void)resetBackgroundColor
{
  if ([(UIViewController *)self isPresentedInsidePopover]
    && ([(EKCalendarItemEditor *)self popoverPresentationController],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v6 = [(EKCalendarItemEditor *)self tableView];
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    id v6 = [(EKCalendarItemEditor *)self tableView];
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  double v5 = (void *)v4;
  [v6 setBackgroundColor:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v18 viewWillAppear:a3];
  if ([(EKCalendarItemEditor *)self visibleSectionToRestoreOnAppearence])
  {
    unint64_t v4 = [(EKCalendarItemEditor *)self visibleSectionToRestoreOnAppearence];
    double v5 = [(EKCalendarItemEditor *)self tableView];
    unint64_t v6 = [v5 numberOfSections] - 1;

    if (v4 >= v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = v4;
    }
    v19[0] = v7;
    v19[1] = 0;
    double v8 = [(EKCalendarItemEditor *)self tableView];
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v19 length:2];
    [v8 scrollToRowAtIndexPath:v9 atScrollPosition:2 animated:0];

    [(EKCalendarItemEditor *)self setVisibleSectionToRestoreOnAppearence:0];
  }
  uint64_t v10 = [(EKCalendarItemEditor *)self calendarItem];
  char v11 = [v10 isNew];
  id v12 = objc_opt_class();
  if (v11) {
    [v12 _addLocalizedString];
  }
  else {
  uint64_t v13 = [v12 _doneLocalizedString];
  }
  [(UIBarButtonItem *)self->_doneButton setTitle:v13];

  [(EKCalendarItemEditor *)self _updateDoneButtonState];
  if (!self->_accessDeniedView)
  {
    uint64_t v14 = [(EKCalendarItemEditor *)self transitionCoordinator];
    uint64_t v15 = v14;
    if (v14)
    {
      if ([v14 isAnimated])
      {
        uint64_t v16 = [(EKCalendarItemEditor *)self transitionCoordinator];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __39__EKCalendarItemEditor_viewWillAppear___block_invoke;
        v17[3] = &unk_1E608AB58;
        v17[4] = self;
        [v16 animateAlongsideTransition:v17 completion:0];
      }
    }
  }
}

uint64_t __39__EKCalendarItemEditor_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v4 viewDidAppear:a3];
  if (!self->_accessDeniedView) {
    [(EKCalendarItemEditor *)self _setupFirstResponder];
  }
  self->_hasAppeared = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasAppeared = 0;
  if (!a3)
  {
    if ([(EKCalendarItemEditor *)self _isPinningInputViews])
    {
      if (UIKeyboardAutomaticIsOnScreen())
      {
        double v5 = [(EKCalendarItemEditor *)self view];
        unint64_t v6 = [v5 window];
        char v7 = [v6 isRotating];

        if ((v7 & 1) == 0) {
          [(EKCalendarItemEditor *)self _pinKeyboard:0];
        }
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v8 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(EKCalendarItemEditor *)self _editItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isInline]) {
          [v10 endInlineEditing];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v11.receiver = self;
  v11.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v11 viewDidDisappear:v3];
}

- (void)_setupFirstResponder
{
  if (self->_needsFirstResponderSet)
  {
    if (self->_giveTitleCellKeyboardFocus)
    {
      [(EKCalendarItemEditor *)self focus:1 select:0];
      self->_giveTitleCellKeyboardFocus = 0;
    }
    else
    {
      BOOL v3 = [(EKCalendarItemEditor *)self responderToRestoreOnAppearence];

      if (v3)
      {
        objc_super v4 = [(EKCalendarItemEditor *)self responderToRestoreOnAppearence];
        [v4 becomeFirstResponder];
      }
    }
    self->_needsFirstResponderSet = 0;
  }
}

- (void)updateNavButtonsWithSpacing
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!self->_cancelButton)
  {
    BOOL v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v3;

    [(UIBarButtonItem *)self->_cancelButton setAccessibilityIdentifier:@"cancel-button"];
  }
  if (!self->_doneButton)
  {
    char v5 = [(EKCalendarItem *)self->_calendarItem isNew];
    uint64_t v6 = objc_opt_class();
    if (v5) {
      [v6 _addLocalizedString];
    }
    else {
    uint64_t v7 = [v6 _doneLocalizedString];
    }
    uint64_t v8 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:2 target:self action:sel_done_];
    doneButton = self->_doneButton;
    self->_doneButton = v8;

    if ([(EKCalendarItem *)self->_calendarItem isNew]) {
      uint64_t v10 = @"add-button";
    }
    else {
      uint64_t v10 = @"done-button";
    }
    [(UIBarButtonItem *)self->_doneButton setAccessibilityIdentifier:v10];
    [(UIBarButtonItem *)self->_doneButton setEnabled:0];
  }
  v16[0] = self->_cancelButton;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  long long v12 = [(EKCalendarItemEditor *)self navigationItem];
  [v12 setLeftBarButtonItems:v11];

  long long v15 = self->_doneButton;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  long long v14 = [(EKCalendarItemEditor *)self navigationItem];
  [v14 setRightBarButtonItems:v13];
}

- (void)viewDidLoad
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v14 viewDidLoad];
  [(EKCalendarItemEditor *)self updateNavButtonsWithSpacing];
  if (self->_calendarItem) {
    [(EKCalendarItemEditor *)self setupForEvent];
  }
  if (self->_shouldOverrideAuthorizationStatus)
  {
    uint64_t lastAuthorizationStatus = self->_lastAuthorizationStatus;
  }
  else
  {
    uint64_t lastAuthorizationStatus = objc_msgSend(MEMORY[0x1E4F25550], "realAuthorizationStatusForEntityType:", -[EKCalendarItemEditor entityType](self, "entityType"));
    self->_uint64_t lastAuthorizationStatus = lastAuthorizationStatus;
  }
  if (lastAuthorizationStatus <= 2) {
    -[EKCalendarItemEditor _updateAccessDeniedViewWithNewStatus:](self, "_updateAccessDeniedViewWithNewStatus:");
  }
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = [(EKCalendarItemEditor *)self notificationNamesForLocaleChange];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObserver:self selector:sel__localeChanged name:*(void *)(*((void *)&v10 + 1) + 8 * i) object:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [v4 addObserver:self selector:sel__keyboardWillHide name:*MEMORY[0x1E4FB2C50] object:0];
  [v4 addObserver:self selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];
  if (self->_store) {
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_storeChanged_, *MEMORY[0x1E4F25460]);
  }
}

- (void)_localeChanged
{
  id v2 = [(EKCalendarItemEditor *)self tableView];
  [v2 reloadData];
}

- (void)_keyboardWillHide
{
  BOOL v3 = [(EKCalendarItemEditor *)self view];
  objc_super v4 = [v3 window];
  char v5 = [v4 isRotating];

  if ((v5 & 1) == 0)
  {
    [(EKCalendarItemEditor *)self setResponderToRestoreOnAppearence:0];
  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  objc_super v4 = [a3 userInfo];
  char v5 = [v4 valueForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v17 = [(EKCalendarItemEditor *)self view];
  objc_super v14 = [v17 window];
  if ([v14 isRotating])
  {
  }
  else
  {
    long long v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 bounds];
    v20.origin.x = v7;
    v20.origin.y = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    BOOL v16 = CGRectIntersectsRect(v19, v20);

    if (!v16)
    {
      [(EKCalendarItemEditor *)self setResponderToRestoreOnAppearence:0];
    }
  }
}

- (void)storeChanged:(id)a3
{
  if (!self->_shouldOverrideAuthorizationStatus)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__EKCalendarItemEditor_storeChanged___block_invoke;
    block[3] = &unk_1E6087570;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void *__37__EKCalendarItemEditor_storeChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F25550], "realAuthorizationStatusForEntityType:", objc_msgSend(*(id *)(a1 + 32), "entityType"));
  [*(id *)(a1 + 32) _updateAccessDeniedViewWithNewStatus:v2];
  result = *(void **)(a1 + 32);
  if ((unint64_t)(v2 - 3) <= 1 && (unint64_t)(result[132] - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    [result _refreshDataAndDismissViewControllerIfDeleted];
    result = *(void **)(a1 + 32);
  }
  result[132] = v2;
  return result;
}

- (void)applicationDidResume
{
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemEditor;
  [(EKCalendarItemEditor *)&v4 applicationDidResume];
  BOOL v3 = [(EKCalendarItemEditor *)self _editItems];
  [v3 makeObjectsPerformSelector:sel_applicationDidResume];
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(UIViewController *)self EKUI_viewHierarchy];
  EKUIPushFallbackSizingContextWithViewHierarchy(v3);
  objc_super v4 = [(EKCalendarItemEditor *)self view];
  BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v4);

  EKUIPopFallbackSizingContextWithViewHierarchy(v3);
  if (IsRegularInViewHierarchy) {
    unint64_t v6 = 30;
  }
  else {
    unint64_t v6 = 26;
  }

  return v6;
}

- (void)cancel:(id)a3
{
}

- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4
{
  BOOL v4 = a3;
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v7 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      int v8 = [v7 editor:self shouldCompleteWithAction:0];

      if (!v8) {
        return;
      }
    }
    else
    {
    }
  }
  int v9 = [(EKCalendarItemEditor *)self _isPinningInputViews];
  double v10 = [(EKCalendarItemEditor *)self firstResponder];
  [v10 resignFirstResponder];

  [(EKCalendarItemEditor *)self _revertEvent];
  [(EKCalendarItemEditor *)self _completeWithAction:0 animated:1 notify:v4];
  if (v9 && UIKeyboardAutomaticIsOnScreen())
  {
    UIKeyboardOrderOutAutomatic();
  }
}

- (void)done:(id)a3
{
}

- (void)done:(id)a3 withContinueBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_loadWeakRetained((id *)&self->_editorDelegate);
    int v8 = [v7 editor:self shouldCompleteWithAction:1];

    if (!v8) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  recurrenceAlertController = self->_recurrenceAlertController;
  if (recurrenceAlertController)
  {
    if ([(EKUIRecurrenceAlertController *)recurrenceAlertController isCurrentlyShowingAlert]) {
      goto LABEL_41;
    }
    recurrenceAlertController = self->_recurrenceAlertController;
  }
  [(EKUIRecurrenceAlertController *)recurrenceAlertController cancelAnimated:0];
  double v10 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = 0;

  int v11 = [(EKCalendarItemEditor *)self _isPinningInputViews];
  double v12 = [(EKCalendarItemEditor *)self firstResponder];
  [v12 resignFirstResponder];

  currentEditItem = self->_currentEditItem;
  if (!currentEditItem
    || [(EKCalendarItemEditItem *)currentEditItem saveAndDismissWithForce:0])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    objc_super v14 = self->_currentItems;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          CGRect v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v19 isInline]
            && [v19 conformsToProtocol:&unk_1F0D0EB10])
          {
            id v20 = v19;
            if ([v20 isSaveable]) {
              [v20 saveAndDismissWithForce:0];
            }
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v16);
    }

    if (![(EKCalendarItemEditor *)self hasUnsavedChanges]
      && ![(EKCalendarItem *)self->_calendarItem isNew])
    {
      [(EKCalendarItemEditor *)self completeWithAction:0 animated:1];
      if (!v11) {
        goto LABEL_41;
      }
LABEL_39:
      if (UIKeyboardAutomaticIsOnScreen()) {
        UIKeyboardOrderOutAutomatic();
      }
      goto LABEL_41;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke;
    aBlock[3] = &unk_1E6087700;
    aBlock[4] = self;
    id v29 = v5;
    long long v21 = (void (**)(void))_Block_copy(aBlock);
    int v22 = [(EKCalendarItem *)self->_calendarItem isDetached];
    BOOL v23 = [(EKCalendarItemEditor *)self hasAttachmentChanges];
    if ([(EKCalendarItemEditor *)self hasModifiedAttendeesFromSuggestion])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke_2;
      v26[3] = &unk_1E608AB80;
      v26[4] = self;
      v27 = v21;
      id v24 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:16 viewController:self withCompletionHandler:v26];

      goto LABEL_38;
    }
    if (([(EKCalendarItem *)self->_calendarItem isNew] & 1) != 0
      || ![(EKCalendarItem *)self->_calendarItem isOrWasPartOfRecurringSeries])
    {
      goto LABEL_37;
    }
    if ((v22 & v23) == 1) {
      goto LABEL_36;
    }
    if ((([(EKCalendarItem *)self->_calendarItem requiresDetach] & 1) != 0
       || [(EKCalendarItem *)self->_calendarItem isOrWasPartOfRecurringSeries])&& [(EKCalendarItem *)self->_calendarItem allowsSpansOtherThanThisEvent])
    {
      [(EKCalendarItemEditor *)self _presentDetachSheetForEvent:self->_calendarItem saveAttachments:[(EKCalendarItemEditor *)self attachmentsModifiedOnRecurrence] withContinueBlock:v21];
      goto LABEL_38;
    }
    if ([(EKCalendarItemEditor *)self attachmentsModifiedOnRecurrence])
    {
LABEL_36:
      long long v25 = [(EKCalendarItemEditor *)self attachmentsModifiedEvent];
      [(EKCalendarItemEditor *)self _presentAttachmentRecurrenceSheetForEvent:v25 withContinueBlock:v21];
    }
    else
    {
LABEL_37:
      [(EKCalendarItemEditor *)self _performSave:0 animated:1];
      v21[2](v21);
    }
LABEL_38:

    if (!v11) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
LABEL_41:
}

uint64_t __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 attemptDisplayReviewPrompt];
}

uint64_t __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke_2(uint64_t result, int a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    [*(id *)(result + 32) _performSave:0 animated:1];
    BOOL v4 = *(uint64_t (**)(void))(*(void *)(v3 + 40) + 16);
    return v4();
  }
  return result;
}

- (void)completeAndSave
{
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
}

- (BOOL)willPresentDialogOnSave
{
  return [(EKCalendarItem *)self->_calendarItem requiresDetach]
      && ([(EKCalendarItem *)self->_calendarItem allowsSpansOtherThanThisEvent] & 1) != 0
      || [(EKCalendarItem *)self->_calendarItem isOrWasPartOfRecurringSeries]&& (([(UIBarButtonItem *)self->_doneButton isEnabled] & 1) != 0|| [(EKCalendarItemEditor *)self isTextEditing]);
}

- (BOOL)hasUnsavedChanges
{
  if ([(EKCalendarItem *)self->_calendarItem isNew])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F254F8]);
    BOOL v4 = [(EKCalendarItem *)self->_calendarItem changeSet];
    id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"uniqueID", 0);
    unint64_t v6 = (void *)[v3 initWithChangeSet:v4 changesToSkip:v5];

    id v7 = [(EKCalendarItem *)self->_calendarItem title];
    if ([v7 length])
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      int v11 = [(EKCalendarItem *)self->_calendarItem location];
      if ([v11 length]) {
        LOBYTE(v8) = 1;
      }
      else {
        int v8 = [v6 isEffectivelyEqual:self->_originalChangeSet] ^ 1;
      }
    }
    return v8;
  }
  else
  {
    calendarItem = self->_calendarItem;
    return [(EKCalendarItem *)calendarItem hasUnsavedChanges];
  }
}

- (void)resignCurrentEditItemFirstResponder
{
  id v2 = [(EKCalendarItemEditItem *)self->_currentEditItem selectedResponder];
  [v2 resignFirstResponder];
}

- (BOOL)saveWithSpan:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  currentEditItem = self->_currentEditItem;
  if (currentEditItem) {
    [(EKCalendarItemEditItem *)currentEditItem saveAndDismissWithForce:1];
  }

  return [(EKCalendarItemEditor *)self _performSave:a3 animated:v4];
}

- (void)completeWithAction:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_completeWithAction:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(EKCalendarItemEditor *)self _pinKeyboard:0];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      [v11 editor:self didCompleteWithAction:a3];
    }
  }
  double v12 = [(EKCalendarItemEditor *)self _editItems];
  [v12 makeObjectsPerformSelector:sel_setDelegate_ withObject:0];

  [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController cancelAnimated:v6];
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = 0;
}

- (BOOL)shouldDisplayEditItem:(id)a3
{
  return [a3 shouldAppear];
}

- (void)_configureVisibleItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKCalendarItemEditor *)self _editItems];
  BOOL v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (-[EKCalendarItemEditor shouldDisplayEditItem:](self, "shouldDisplayEditItem:", v10, (void)v14))
        {
          id v11 = [(EKCalendarItem *)self->_calendarItem calendar];
          int v12 = [v10 configureForCalendarConstraints:v11];

          if (v12) {
            [(NSArray *)v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  currentItems = self->_currentItems;
  self->_currentItems = v4;
}

- (void)_setCalendarItemOnEditItems
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(EKCalendarItemEditor *)self _editItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setCalendarItem:self->_calendarItem store:self->_store];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)prepareEditItems
{
  id v3 = [(EKCalendarItemEditor *)self _editItems];
  [v3 makeObjectsPerformSelector:sel_setDelegate_ withObject:self];

  [(EKCalendarItemEditor *)self _setCalendarItemOnEditItems];
  [(EKCalendarItemEditor *)self _configureVisibleItems];
  id v4 = [(EKCalendarItemEditor *)self tableView];
  [v4 reloadData];
}

- (void)attemptDisplayReviewPrompt
{
  p_editorDelegate = &self->_editorDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_editorDelegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (id)preferredTitle
{
  return 0;
}

+ (id)defaultTitleForCalendarItem
{
  return 0;
}

- (void)setupForEvent
{
  p_editorDelegate = &self->_editorDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_editorDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_editorDelegate);
      [v8 editor:self prepareCalendarItemForEdit:self->_calendarItem];
    }
  }
  [(EKCalendarItemEditor *)self prepareEditItems];
  [(EKCalendarItem *)self->_calendarItem isNew];
  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  long long v10 = [(EKCalendarItemEditor *)self tableView];
  [v10 bounds];
  long long v11 = objc_msgSend(v9, "initWithFrame:", 0.0, 0.0);
  int v12 = [(EKCalendarItemEditor *)self tableView];
  [v12 setTableFooterView:v11];

  [(EKCalendarItemEditor *)self _copyEventForPossibleRevert];
  if ([(EKCalendarItem *)self->_calendarItem isNew])
  {
    uint64_t v13 = [(EKCalendarItem *)self->_calendarItem title];
    uint64_t v14 = [v13 length];

    if (!v14)
    {
      if (self->_hasAppeared)
      {
        if (!self->_accessDeniedView)
        {
          [(EKCalendarItemEditor *)self focus:1 select:0];
        }
      }
      else
      {
        self->_giveTitleCellKeyboardFocus = 1;
      }
    }
  }
}

- (void)_refreshDataAndDismissViewControllerIfDeleted
{
  if (self->_calendarItem)
  {
    int v3 = [(EKCalendarItemEditor *)self isViewLoaded];
    if (([(EKCalendarItem *)self->_calendarItem isNew] & 1) != 0
      || ([(EKCalendarItem *)self->_calendarItem refreshIfRefreshableAndNotify:1] & 1) != 0)
    {
      if (v3 && [(EKCalendarItemEditor *)self isViewLoaded])
      {
        [(EKCalendarItemEditor *)self setupForEvent];
      }
    }
    else
    {
      [(EKCalendarItemEditor *)self cancelEditingWithDelegateNotification:1 forceCancel:1];
    }
  }
}

- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3
{
  if ([(EKCalendarItemEditor *)self isViewLoaded])
  {
    int64_t lastAuthorizationStatus = a3;
    if (self->_shouldOverrideAuthorizationStatus) {
      int64_t lastAuthorizationStatus = self->_lastAuthorizationStatus;
    }
    accessDeniedView = self->_accessDeniedView;
    if ((unint64_t)(lastAuthorizationStatus - 3) > 1)
    {
      if (accessDeniedView) {
        return;
      }
      long long v10 = [(EKCalendarItemEditor *)self firstResponder];
      [v10 resignFirstResponder];

      long long v11 = [(EKCalendarItemEditor *)self view];
      int v12 = [(EKCalendarItemEditor *)self accessDeniedView];
      [v11 addSubview:v12];

      uint64_t v13 = [(EKCalendarItemEditor *)self view];
      uint64_t v14 = [(EKCalendarItemEditor *)self accessDeniedView];
      [v13 bringSubviewToFront:v14];

      if (a3 == 1)
      {
        long long v15 = [(EKCalendarItemEditor *)self accessDeniedView];
        [v15 setMessage:@" "];
      }
      [(UIBarButtonItem *)self->_doneButton setEnabled:0];
      long long v16 = [(EKCalendarItemEditor *)self navigationController];
      id v17 = (id)[v16 popToRootViewControllerAnimated:1];

      id v8 = [(EKCalendarItemEditor *)self contentScrollView];
      id v18 = v8;
      uint64_t v9 = 0;
    }
    else
    {
      if (!accessDeniedView) {
        return;
      }
      [(_UIAccessDeniedView *)accessDeniedView removeFromSuperview];
      char v7 = self->_accessDeniedView;
      self->_accessDeniedView = 0;

      [(UIBarButtonItem *)self->_doneButton setEnabled:[(EKCalendarItemEditor *)self _canEnableDoneButton]];
      id v8 = [(EKCalendarItemEditor *)self contentScrollView];
      id v18 = v8;
      uint64_t v9 = 1;
    }
    [v8 setScrollEnabled:v9];
  }
}

- (CGSize)preferredContentSize
{
  int v3 = [(EKCalendarItemEditor *)self tableView];
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  double v5 = v4;
  double v7 = v6;

  id v8 = [(EKCalendarItemEditor *)self navigationController];
  uint64_t v9 = [v8 navigationBar];
  [v9 frame];
  double v11 = v10;

  int v12 = [(EKCalendarItemEditor *)self view];
  LODWORD(v8) = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v12);

  if (v8) {
    double v5 = EKUIContainedControllerIdealWidth();
  }
  double v13 = v7 + v11;
  double v14 = v5;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_pinKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(EKCalendarItemEditor *)self _popoverController];

  if (v5)
  {
    if (v3)
    {
      [(EKCalendarItemEditor *)self _beginPinningInputViews];
    }
    else
    {
      [(EKCalendarItemEditor *)self _endPinningInputViews];
    }
  }
}

- (_UIAccessDeniedView)accessDeniedView
{
  if (!self->_accessDeniedView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1F98]);
    double v4 = [(EKCalendarItemEditor *)self view];
    [v4 bounds];
    double v5 = (_UIAccessDeniedView *)objc_msgSend(v3, "initWithFrame:");
    accessDeniedView = self->_accessDeniedView;
    self->_accessDeniedView = v5;

    [(_UIAccessDeniedView *)self->_accessDeniedView setAutoresizingMask:18];
    unint64_t v7 = [(EKCalendarItemEditor *)self entityType];
    id v8 = EventKitUIBundle();
    uint64_t v9 = v8;
    if (v7 == 1) {
      double v10 = @"This app does not have access to your reminders.";
    }
    else {
      double v10 = @"This app does not have access to your calendars.";
    }
    double v11 = [v8 localizedStringForKey:v10 value:&stru_1F0CC2140 table:0];
    [(_UIAccessDeniedView *)self->_accessDeniedView setTitle:v11];
  }
  int v12 = self->_accessDeniedView;

  return v12;
}

- (void)_setWantsToEnableDoneButton:(BOOL)a3
{
  if (a3) {
    *(void *)&a3 = [(EKCalendarItemEditor *)self _canEnableDoneButton];
  }
  doneButton = self->_doneButton;

  [(UIBarButtonItem *)doneButton setEnabled:a3];
}

- (id)_viewHierarchy
{
  if ([(EKCalendarItemEditor *)self isViewLoaded])
  {
    id v3 = [(EKCalendarItemEditor *)self view];
    double v4 = [v3 window];

    if (v4) {
      goto LABEL_5;
    }
  }
  double v5 = [(EKCalendarItemEditor *)self presentingViewController];
  double v6 = [v5 view];
  unint64_t v7 = [v6 window];

  if (!v7)
  {
LABEL_5:
    double v10 = [(EKCalendarItemEditor *)self view];
  }
  else
  {
    id v8 = [(EKCalendarItemEditor *)self presentingViewController];
    uint64_t v9 = [v8 view];
    double v10 = [v9 window];
  }

  return v10;
}

+ (id)_addLocalizedString
{
  id v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Add" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_doneLocalizedString
{
  id v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Done" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)editItemDidStartEditing:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentEditItem, a3);
  if ([(EKCalendarItemEditItem *)self->_currentEditItem isInline])
  {
    double v6 = [v5 selectedResponder];
    [(EKCalendarItemEditor *)self setResponderToRestoreOnAppearence:v6];

    [(EKCalendarItemEditor *)self setVisibleSectionToRestoreOnAppearence:[(EKCalendarItemEditor *)self tableSectionForEditItem:v5]];
    [(EKCalendarItemEditor *)self _pinKeyboard:[(EKCalendarItemEditItem *)self->_currentEditItem shouldPinKeyboard]];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v7 = [(EKCalendarItemEditor *)self _editItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) editor:self didStartEditingItem:v5];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)editItem:(id)a3 didSaveFromDetailViewController:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  uint64_t v6 = [v10 onSaveEditorReloadBehavior];
  if (v6 == 2) {
    [(EKCalendarItemEditor *)self _configureVisibleItems];
  }
  uint64_t v7 = [v10 onSaveEditItemsToRefresh];
  unint64_t v8 = v7;
  if (v7)
  {
    [(EKCalendarItemEditor *)self refreshStartAndEndDates];
    if ((v8 & 2) == 0)
    {
LABEL_5:
      if ((v8 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  [(EKCalendarItemEditor *)self refreshInvitees];
  if ((v8 & 4) == 0)
  {
LABEL_6:
    if ((v8 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [(EKCalendarItemEditor *)self refreshLocation];
  if ((v8 & 8) == 0)
  {
LABEL_7:
    if ((v8 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [(EKCalendarItemEditor *)self refreshURL];
  if ((v8 & 0x10) == 0)
  {
LABEL_8:
    if ((v8 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  [(EKCalendarItemEditor *)self refreshRecurrence];
  if ((v8 & 0x20) != 0) {
LABEL_9:
  }
    [(EKCalendarItemEditor *)self refreshAttachments];
LABEL_10:
  if (v6 == 2)
  {
LABEL_16:
    uint64_t v9 = [(EKCalendarItemEditor *)self tableView];
    [v9 reloadData];

    goto LABEL_24;
  }
  if (v6 == 1)
  {
    [(EKCalendarItemEditor *)self reloadTableViewSectionsForTime:0 invitees:(v8 >> 1) & 1 location:(v8 >> 2) & 1 recurrence:(v8 >> 4) & 1];
  }
  else if (!v6 && (v8 || v4))
  {
    [(EKCalendarItemEditor *)self _configureVisibleItems];
    goto LABEL_16;
  }
LABEL_24:
  [(EKCalendarItemEditor *)self _updateDoneButtonState];
}

- (void)_updateDoneButtonState
{
  BOOL v3 = [(EKCalendarItemEditor *)self hasUnsavedChanges];

  [(EKCalendarItemEditor *)self _setWantsToEnableDoneButton:v3];
}

- (void)editItemDidEndEditing:(id)a3
{
  BOOL v4 = (EKCalendarItemEditItem *)a3;
  if ([(EKCalendarItemEditItem *)v4 isInline]) {
    [(EKCalendarItemEditItem *)v4 saveAndDismissWithForce:0];
  }
  if (self->_currentEditItem == v4)
  {
    self->_currentEditItem = 0;
  }
  [(EKCalendarItemEditor *)self setIsTextEditing:0];
}

- (void)editItemTextChanged:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F0D0EB10]
    && [v4 isSaveable])
  {
    [(EKCalendarItemEditor *)self _setWantsToEnableDoneButton:1];
  }
  else
  {
    [(EKCalendarItemEditor *)self _updateDoneButtonState];
  }
  [(EKCalendarItemEditor *)self setIsTextEditing:1];
}

- (void)editItemWantsInjectableViewControllerToBeShown:(id)a3
{
}

- (void)editItem:(id)a3 wantsKeyboardPinned:(BOOL)a4
{
}

- (BOOL)_canEnableDoneButton
{
  accessDeniedView = self->_accessDeniedView;
  BOOL result = (!accessDeniedView
         || ([(_UIAccessDeniedView *)accessDeniedView superview],
             id v4 = objc_claimAutoreleasedReturnValue(),
             v4,
             !v4))
        && [(NSMutableSet *)self->_editItemsDisablingDoneButton count] == 0;
  return result;
}

- (void)editItem:(id)a3 wantsDoneButtonDisabled:(BOOL)a4
{
  id v6 = a3;
  editItemsDisablingDoneButton = self->_editItemsDisablingDoneButton;
  id v10 = v6;
  if (a4)
  {
    [(NSMutableSet *)editItemsDisablingDoneButton addObject:v6];
    unint64_t v8 = self;
    uint64_t v9 = 0;
LABEL_7:
    [(EKCalendarItemEditor *)v8 _setWantsToEnableDoneButton:v9];
    goto LABEL_8;
  }
  if ([(NSMutableSet *)editItemsDisablingDoneButton containsObject:v6]) {
    [(NSMutableSet *)self->_editItemsDisablingDoneButton removeObject:v10];
  }
  if (![(NSMutableSet *)self->_editItemsDisablingDoneButton count])
  {
    unint64_t v8 = self;
    uint64_t v9 = 1;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_tableViewWillUpdateHeights
{
  self->_isIgnoringCellHeightChange = 1;
}

- (void)_tableViewDidUpdateHeights
{
  if (self->_needsCellHeightChange) {
    [(EKCalendarItemEditor *)self performSelector:sel__reallyHandleCellHeightChange withObject:0 afterDelay:0.0];
  }
  self->_isIgnoringCellHeightChange = 0;
}

- (void)_reallyHandleCellHeightChange
{
  if (self->_isIgnoringCellHeightChange)
  {
    self->_needsCellHeightChange = 1;
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__EKCalendarItemEditor__reallyHandleCellHeightChange__block_invoke;
    v6[3] = &unk_1E6087570;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
    self->_needsCellHeightChange = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      [v5 editor:self didChangeHeightAnimated:0];
    }
  }
}

void __53__EKCalendarItemEditor__reallyHandleCellHeightChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 endUpdates];
}

- (void)editItem:(id)a3 performActionsOnCellAtSubitem:(unint64_t)a4 actions:(id)a5
{
  unint64_t v8 = (void (**)(id, void *))a5;
  id v9 = a3;
  unint64_t v10 = [(EKCalendarItemEditor *)self tableSectionForEditItem:v9];
  int64_t v11 = [(EKCalendarItemEditor *)self firstTableRowForEditItem:v9];

  id v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 + a4 inSection:v10];
  long long v12 = [(EKCalendarItemEditor *)self tableView];
  long long v13 = [v12 cellForRowAtIndexPath:v14];

  v8[2](v8, v13);
}

- (void)editItemWantsFooterTitlesToReload:(id)a3
{
  char v4 = [(EKCalendarItemEditor *)self tableView];
  uint64_t v5 = [v4 numberOfSections];

  if (v5 >= 1)
  {
    for (unint64_t i = 0; i != v5; ++i)
    {
      if ([(NSArray *)self->_orderedEditItems count] <= i)
      {
        id v9 = 0;
      }
      else
      {
        uint64_t v7 = [(NSArray *)self->_orderedEditItems objectAtIndexedSubscript:i];
        if ([v7 count])
        {
          unint64_t v8 = [v7 objectAtIndexedSubscript:0];
          id v9 = [v8 footerTitle];
        }
        else
        {
          id v9 = 0;
        }
      }
      unint64_t v10 = [(EKCalendarItemEditor *)self tableView];
      int64_t v11 = [v10 footerViewForSection:i];
      long long v12 = [v11 textLabel];
      [v12 setText:v9];
    }
  }
}

- (void)editItem:(id)a3 wantsRowReload:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [(EKCalendarItemEditor *)self tableSectionForEditItem:a3];
  unint64_t v8 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v9 = [v6 row];
  uint64_t v10 = [v6 section];

  int64_t v11 = [v8 indexPathForRow:v9 inSection:v10 + v7];
  long long v12 = [(EKCalendarItemEditor *)self tableView];
  v14[0] = v11;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v12 reloadRowsAtIndexPaths:v13 withRowAnimation:0];
}

- (int64_t)rowNumberForEditItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_orderedEditItems;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v16[0] = 0;
        v16[1] = v16;
        void v16[2] = 0x2020000000;
        v16[3] = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __45__EKCalendarItemEditor_rowNumberForEditItem___block_invoke;
        v12[3] = &unk_1E608ABA8;
        v12[4] = self;
        id v13 = v4;
        id v14 = &v21;
        long long v15 = v16;
        [v8 enumerateObjectsUsingBlock:v12];

        _Block_object_dispose(v16, 8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }

  int64_t v9 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __45__EKCalendarItemEditor_rowNumberForEditItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDisplayEditItem:"))
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1160) calendar];
    int v7 = [v10 configureForCalendarConstraints:v6];

    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v9 = *(void *)(v8 + 24);
      if (*(id *)(a1 + 40) == v10)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
        *a4 = 1;
      }
      else
      {
        *(void *)(v8 + 24) = v9 + 1;
      }
    }
  }
}

- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5
{
}

- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5 rowReloads:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(EKCalendarItemEditor *)self tableView];
  if (([v14 isReloading] & 1) == 0)
  {
    unint64_t v15 = [(EKCalendarItemEditor *)self tableSectionForEditItem:v10];
    int64_t v16 = [(EKCalendarItemEditor *)self firstTableRowForEditItem:v10];
    [(EKCalendarItemEditor *)self _tableViewWillUpdateHeights];
    [v14 beginUpdates];
    unint64_t v17 = 0x1E4F1C000;
    if ([v11 count])
    {
      long long v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke;
      v39[3] = &unk_1E608ABD0;
      int64_t v41 = v16;
      unint64_t v42 = v15;
      id v40 = v18;
      id v19 = v18;
      [v11 enumerateIndexesUsingBlock:v39];
      [v14 insertRowsAtIndexPaths:v19 withRowAnimation:0];

      unint64_t v17 = 0x1E4F1C000uLL;
    }
    if ([v12 count])
    {
      unint64_t v20 = v17;
      uint64_t v21 = objc_msgSend(*(id *)(v17 + 2632), "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_2;
      v35[3] = &unk_1E608ABD0;
      int64_t v37 = v16;
      unint64_t v38 = v15;
      id v36 = v21;
      id v22 = v21;
      [v12 enumerateIndexesUsingBlock:v35];
      [v14 deleteRowsAtIndexPaths:v22 withRowAnimation:0];

      unint64_t v17 = v20;
    }
    if ([v13 count])
    {
      uint64_t v23 = objc_msgSend(*(id *)(v17 + 2632), "arrayWithCapacity:", objc_msgSend(v13, "count"));
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      long long v30 = __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_3;
      long long v31 = &unk_1E608ABD0;
      int64_t v33 = v16;
      unint64_t v34 = v15;
      id v32 = v23;
      id v24 = v23;
      [v13 enumerateIndexesUsingBlock:&v28];
      objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v24, 0, v28, v29, v30, v31);
    }
    [v14 endUpdates];
    [(EKCalendarItemEditor *)self _tableViewDidUpdateHeights];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      [v27 editor:self didChangeHeightAnimated:1];
    }
  }
}

void __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 40) + a2 inSection:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addObject:v3];
}

void __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 40) + a2 inSection:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addObject:v3];
}

void __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 40) + a2 inSection:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addObject:v3];
}

- (void)editItem:(id)a3 wantsRowsScrolledToVisible:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EKCalendarItemEditor *)self tableView];
  [v8 contentInset];
  double v10 = v9;

  if (v10 == 0.0)
  {
    unint64_t v11 = [(EKCalendarItemEditor *)self tableSectionForEditItem:v6];
    int64_t v12 = [(EKCalendarItemEditor *)self firstTableRowForEditItem:v6];
    uint64_t v26 = 0;
    id v27 = (CGRect *)&v26;
    uint64_t v28 = 0x4010000000;
    uint64_t v29 = "";
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v30 = *MEMORY[0x1E4F1DB28];
    long long v31 = v13;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __60__EKCalendarItemEditor_editItem_wantsRowsScrolledToVisible___block_invoke;
    v25[3] = &unk_1E608ABF8;
    v25[6] = v12;
    v25[7] = v11;
    v25[4] = self;
    v25[5] = &v26;
    [v7 enumerateIndexesUsingBlock:v25];
    if (!CGRectIsEmpty(v27[1]))
    {
      double height = v27[1].size.height;
      unint64_t v15 = [(EKCalendarItemEditor *)self tableView];
      [v15 bounds];
      double v17 = v16;
      long long v18 = [(EKCalendarItemEditor *)self tableView];
      [v18 contentInset];
      double v19 = height + 20.0;
      double v21 = v17 - v20;

      if (v19 <= v21)
      {
        id v24 = v27;
        v27[1].size.double height = v19;
        v24[1].origin.y = v24[1].origin.y + -10.0;
        id v22 = [(EKCalendarItemEditor *)self tableView];
        objc_msgSend(v22, "scrollRectToVisible:animated:", 1, v27[1].origin.x, v27[1].origin.y, v27[1].size.width, v27[1].size.height);
      }
      else
      {
        id v22 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v7, "firstIndex") + v12, v11);
        uint64_t v23 = [(EKCalendarItemEditor *)self tableView];
        [v23 scrollToRowAtIndexPath:v22 atScrollPosition:1 animated:1];
      }
    }
    _Block_object_dispose(&v26, 8);
  }
}

void __60__EKCalendarItemEditor_editItem_wantsRowsScrolledToVisible___block_invoke(uint64_t a1, uint64_t a2)
{
  id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 48) + a2 inSection:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 rectForRowAtIndexPath:v13];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;

  if (!CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)))
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGRect v16 = CGRectUnion(v15, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
  }
  int64_t v12 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
  v12[4] = x;
  void v12[5] = y;
  v12[6] = width;
  v12[7] = height;
}

- (void)editItemRequiresHeightChange:(id)a3
{
  if (self->_isIgnoringCellHeightChange) {
    self->_needsCellHeightChange = 1;
  }
  else {
    [(EKCalendarItemEditor *)self _reallyHandleCellHeightChange];
  }
}

- (void)editItemRequiresPopoverSizeUpdate:(id)a3
{
  p_editorDelegate = &self->_editorDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_editorDelegate);
    [v7 editor:self didChangeHeightAnimated:1];
  }
}

- (id)cellWithReuseIdentifier:(id)a3 forEditItem:(id)a4
{
  id v5 = a3;
  char v6 = [(EKCalendarItemEditor *)self tableView];
  id v7 = [v6 dequeueReusableCellWithIdentifier:v5];

  return v7;
}

- (void)editItem:(id)a3 wantsViewControllerPresented:(id)a4
{
  id v5 = a4;
  id v6 = +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:self];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)editItem:(id)a3 wantsViewControllerPushed:(id)a4
{
  id v5 = a4;
  id v6 = [(EKCalendarItemEditor *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)editItemWantsFirstResponderResigned:(id)a3
{
  id v3 = [(EKCalendarItemEditor *)self firstResponder];
  [v3 resignFirstResponder];
}

- (id)_editItemAtIndexPath:(id)a3 firstRowIndex:(int64_t *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", [v5 section]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0;
    int64_t v12 = v9;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
      if ([(NSArray *)self->_currentItems containsObject:v13])
      {
        unint64_t v9 = [v13 numberOfSubitems] + v12;
        if ([v5 row] < v9)
        {
          id v14 = v13;
          CGRect v15 = a4;
          *a4 = v12;

          if (v14) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
      }
      else
      {
        unint64_t v9 = v12;
      }
      ++v11;
      int64_t v12 = v9;
      if (v8 == v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
  }
  unint64_t v9 = 0;
LABEL_16:

  int64_t v12 = v9;
  CGRect v15 = a4;
LABEL_17:
  id v14 = [v6 lastObject];
  *CGRect v15 = v12;
LABEL_18:

  return v14;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSArray *)self->_orderedEditItems count];
  double v4 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "Number of sections: [%ld]", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = [(NSArray *)self->_orderedEditItems objectAtIndex:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        int64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([(NSArray *)self->_currentItems containsObject:v12]) {
          v9 += [v12 numberOfSubitems];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }
  id v13 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v20 = a4;
    __int16 v21 = 2048;
    int64_t v22 = v9;
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Number of rows in section [%ld]: [%ld]", buf, 0x16u);
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v7 = a4;
  uint64_t v8 = [(EKCalendarItemEditor *)self _editItemAtIndexPath:v7 firstRowIndex:&v13];
  uint64_t v9 = [v7 row];

  uint64_t v10 = [v8 cellForSubitemAtIndex:v9 - v13 inEditor:self];
  if (EKUICatalyst())
  {
    uint64_t v11 = [v6 backgroundColor];
    [v10 setBackgroundColor:v11];
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 rowHeight];
  double v9 = v8;
  [v7 bounds];
  double v11 = v10;
  [v7 _backgroundInset];
  double v13 = v12;

  uint64_t v18 = 0;
  id v14 = [(EKCalendarItemEditor *)self _editItemAtIndexPath:v6 firstRowIndex:&v18];
  uint64_t v15 = [v6 row];

  [v14 defaultCellHeightForSubitemAtIndex:v15 - v18 forWidth:v11 + v13 * -2.0];
  if (v16 > 0.0) {
    double v9 = v16;
  }

  return v9;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v11 = 0;
  id v6 = [(EKCalendarItemEditor *)self _editItemAtIndexPath:v5 firstRowIndex:&v11];
  uint64_t v7 = [v5 row];
  int v8 = [v6 editor:self canSelectSubitem:v7 - v11];
  id v9 = 0;
  if (v8) {
    id v9 = v5;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  int v8 = [v6 cellForRowAtIndexPath:v7];
  if ([v8 selectionStyle])
  {
    uint64_t v16 = 0;
    id v9 = [(EKCalendarItemEditor *)self _editItemAtIndexPath:v7 firstRowIndex:&v16];
    uint64_t v10 = [v7 row];
    uint64_t v11 = v10 - v16;
    currentEditItem = self->_currentEditItem;
    if (currentEditItem) {
      BOOL v13 = v9 == currentEditItem;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if ([(EKCalendarItemEditItem *)v9 editor:self shouldClearSelectionFromSubitem:v11])
      {
        [v6 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
      }
    }
    else if (![(EKCalendarItemEditItem *)currentEditItem saveAndDismissWithForce:0])
    {
      [v6 selectRowAtIndexPath:0 animated:1 scrollPosition:0];

      goto LABEL_14;
    }
    id v14 = [(EKCalendarItemEditor *)self _popoverController];

    if (!v14)
    {
      uint64_t v15 = [(EKCalendarItemEditItem *)self->_currentEditItem selectedResponder];
      [v15 resignFirstResponder];
    }
    [(EKCalendarItemEditItem *)v9 editor:self didSelectSubitem:v11];
  }
  [(EKCalendarItemEditor *)self setResponderToRestoreOnAppearence:0];
LABEL_14:
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v8 = 0;
  id v5 = a4;
  id v6 = [(EKCalendarItemEditor *)self _editItemAtIndexPath:v5 firstRowIndex:&v8];
  uint64_t v7 = [v5 row];

  [v6 editor:self didDeselectSubitem:v7 - v8];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(EKCalendarItemEditor *)self tableView:a3 numberOfRowsInSection:a4] <= 0) {
    double v4 = 0.0;
  }
  else {
    double v4 = *MEMORY[0x1E4FB2F28];
  }
  BOOL v5 = EKUIUnscaledCatalyst();
  double result = 5.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(EKCalendarItemEditor *)self tableView:a3 numberOfRowsInSection:a4]) {
    double v4 = 0;
  }
  else {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"Default"];
  }

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NSArray *)self->_orderedEditItems objectAtIndex:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(NSArray *)self->_currentItems containsObject:v13])
        {
          id v14 = v13;

          uint64_t v10 = v14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
    if (v10)
    {
      uint64_t v15 = [v10 headerTitle];
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v15 = 0;
LABEL_14:

  return v15;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v10 = a3;
  id v6 = a4;
  if (EKUICatalyst())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      uint64_t v8 = [v10 backgroundColor];
      uint64_t v9 = [v7 contentView];

      [v9 setBackgroundColor:v8];
    }
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSArray *)self->_orderedEditItems objectAtIndex:a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  double v9 = 0.0;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([(NSArray *)self->_currentItems containsObject:v14])
        {
          id v15 = v14;

          uint64_t v11 = v15;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
    if (v11)
    {
      [v6 bounds];
      [v11 footerHeightForWidth:v16];
      if (v17 == 0.0) {
        double v9 = *MEMORY[0x1E4FB2F28];
      }
      else {
        double v9 = v17;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSArray *)self->_orderedEditItems objectAtIndex:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(NSArray *)self->_currentItems containsObject:v13])
        {
          id v14 = v13;

          uint64_t v10 = v14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
    if (v10)
    {
      id v15 = [v10 footerTitle];
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v15 = 0;
LABEL_14:

  return v15;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a3;
  id v6 = a4;
  if (EKUICatalyst())
  {
    id v7 = [v9 backgroundColor];
    uint64_t v8 = [v6 contentView];
    [v8 setBackgroundColor:v7];
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSArray *)self->_orderedEditItems objectAtIndex:a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([(NSArray *)self->_currentItems containsObject:v13])
        {
          id v14 = v13;

          uint64_t v10 = v14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  if (v10)
  {
    uint64_t v16 = [v10 footerView];

    id v15 = (id)v16;
  }
  if (v15 && EKUICatalyst())
  {
    long long v17 = [v6 backgroundColor];
    [v15 setBackgroundColor:v17];
  }

  return v15;
}

- (void)deleteClicked:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = self->_calendarItem;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = [v4 sourceViewForPopover];
  id v7 = [v4 sourceViewForPopover];

  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(EKCalendarItemEditor *)self _nameForDeleteButton];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__EKCalendarItemEditor_deleteClicked___block_invoke;
  void v19[3] = &unk_1E6088638;
  v19[4] = self;
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", 0, self, v6, v5, v16, v19, v9, v11, v13, v15);
  long long v17 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v17;
}

void __38__EKCalendarItemEditor_deleteClicked___block_invoke(uint64_t a1, unint64_t a2)
{
  if (a2 <= 2) {
    [*(id *)(a1 + 32) _performDelete:a2];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1080);
  *(void *)(v3 + 1080) = 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v12 = 0;
  id v5 = a4;
  id v6 = [(EKCalendarItemEditor *)self _editItemAtIndexPath:v5 firstRowIndex:&v12];
  uint64_t v7 = [v5 row];

  double v8 = [v6 trailingSwipeActionsConfigurationForRowAtIndex:v7 - v12];
  if (!v8)
  {
    double v9 = (void *)MEMORY[0x1E4FB1CC0];
    double v10 = [MEMORY[0x1E4F1C978] array];
    double v8 = [v9 configurationWithActions:v10];
  }

  return v8;
}

- (void)_performDelete:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = [(EKCalendarItemEditor *)self calendarItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = [MEMORY[0x1E4F25540] sharedInstance];
    double v9 = [(EKCalendarItemEditor *)self calendarItem];
    [v8 handleEventDeletion:v9];

    double v10 = [(EKCalendarItemEditor *)self editorDelegate];
    double v11 = [v10 editorForCalendarItemEditor:self];

    uint64_t v12 = [(EKCalendarItemEditor *)self calendarItem];
    id v24 = 0;
    char v13 = [v11 deleteEvent:v12 span:a3 error:&v24];
    id v14 = v24;

    if (v13) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  if (a3)
  {
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"EKCalendarItemEditor.m" lineNumber:1543 description:@"Span should never be anything but 'this' for reminders"];
  }
  store = self->_store;
  uint64_t v16 = [(EKCalendarItemEditor *)self calendarItem];
  id v23 = 0;
  BOOL v17 = [(EKEventStore *)store removeReminder:v16 commit:1 error:&v23];
  id v14 = v23;

  if (!v17)
  {
LABEL_7:
    long long v18 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v14;
      _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_ERROR, "Remove failed: %@", buf, 0xCu);
    }
    long long v19 = [v14 domain];
    long long v20 = v19;
    if (v19 == (void *)*MEMORY[0x1E4F25338])
    {
      uint64_t v21 = [v14 code];

      if (v21 == 1010) {
        [(EKEventStore *)self->_store rollback];
      }
    }
    else
    {
    }
  }
LABEL_13:
  [(EKCalendarItemEditor *)self completeWithAction:2 animated:1];
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(EKCalendarItemEditor *)self hasUnsavedChanges]
    && ![(EKCalendarItem *)self->_calendarItem isNew])
  {
    goto LABEL_7;
  }
  uint64_t v7 = [(EKCalendarItemEditor *)self calendarItem];
  double v8 = [v7 title];
  double v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  double v10 = [v8 stringByTrimmingCharactersInSet:v9];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    uint64_t v12 = [(id)objc_opt_class() defaultTitleForCalendarItem];
    char v13 = [(EKCalendarItemEditor *)self calendarItem];
    [v13 setTitle:v12];
  }
  id v24 = 0;
  BOOL v14 = [(EKCalendarItemEditor *)self saveCalendarItemWithSpan:a3 error:&v24];
  id v15 = v24;
  uint64_t v16 = v15;
  if (v14)
  {

LABEL_7:
    BOOL v17 = 1;
    [(EKCalendarItemEditor *)self completeWithAction:1 animated:v4];
    return v17;
  }
  long long v18 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v16;
    _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_ERROR, "Calendar: unable to save: %@", buf, 0xCu);
  }
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v19 = [(EKCalendarItemEditor *)self defaultAlertTitle];
    PresentValidationAlertWithDefaultTitle(self, v16, v19);

    long long v20 = [v16 domain];
    uint64_t v21 = v20;
    if (v20 == (void *)*MEMORY[0x1E4F25338])
    {
      uint64_t v22 = [v16 code];

      if (v22 == 1010) {
        [(EKEventStore *)self->_store rollback];
      }
    }
    else
    {
    }
  }

  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_editItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "tableViewDidScroll", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_presentAttachmentRecurrenceSheetForEvent:(id)a3 withContinueBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  doneButton = self->_doneButton;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__EKCalendarItemEditor__presentAttachmentRecurrenceSheetForEvent_withContinueBlock___block_invoke;
  v13[3] = &unk_1E608AC20;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  long long v11 = +[EKUIRecurrenceAlertController presentAttachmentAlertWithOptions:0 viewController:self barButtonItem:doneButton forEvent:v10 withCompletionHandler:v13];
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v11;
}

void __84__EKCalendarItemEditor__presentAttachmentRecurrenceSheetForEvent_withContinueBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 1080);
    *(void *)(v3 + 1080) = 0;

    uint64_t v5 = [*(id *)(a1 + 32) editorDelegate];
    id v6 = [v5 editorForCalendarItemEditor:*(void *)(a1 + 32)];

    [v6 saveEvent:*(void *)(a1 + 40) span:1 error:0];
    [*(id *)(a1 + 32) _performSave:0 animated:1];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void **)(v7 + 1080);
  *(void *)(v7 + 1080) = 0;
}

- (void)_presentDetachSheetForEvent:(id)a3 saveAttachments:(BOOL)a4 withContinueBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"EKCalendarItemEditor.m", 1642, @"Trying to detach something that's not an event: %@", v9 object file lineNumber description];
  }
  if (v6) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = 0;
  }
  doneButton = self->_doneButton;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke;
  v17[3] = &unk_1E608AC70;
  id v18 = v10;
  uint64_t v19 = v11;
  v17[4] = self;
  id v13 = v10;
  id v14 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:v11 viewController:self barButtonItem:doneButton forEvent:v9 withCompletionHandler:v17];
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v14;
}

void __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke(void *a1, unint64_t a2)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke_2;
  aBlock[3] = &unk_1E608AC48;
  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = a1[4];
  uint64_t v12 = a1[6];
  aBlock[4] = v5;
  id v11 = v4;
  BOOL v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  if (a2 <= 2) {
    (*((void (**)(void *, unint64_t))v6 + 2))(v6, a2);
  }
  uint64_t v8 = a1[4];
  id v9 = *(void **)(v8 + 1080);
  *(void *)(v8 + 1080) = 0;
}

uint64_t __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 48) & 8) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) editorDelegate];
    uint64_t v5 = [v4 editorForCalendarItemEditor:*(void *)(a1 + 32)];

    BOOL v6 = [*(id *)(a1 + 32) attachmentsModifiedEvent];
    [v5 saveEvent:v6 span:1 error:0];
  }
  [*(id *)(a1 + 32) _performSave:a2 animated:1];
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

- (BOOL)canPerformSaveKeyCommand
{
  return [(UIBarButtonItem *)self->_doneButton isEnabled];
}

- (void)handleCloseKeyCommand
{
}

- (void)handleSaveKeyCommand
{
  if ([(EKCalendarItemEditor *)self canPerformSaveKeyCommand])
  {
    [(EKCalendarItemEditor *)self done:0];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_handleSaveKeyCommand == a3)
  {
    return [(EKCalendarItemEditor *)self canPerformSaveKeyCommand];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)EKCalendarItemEditor;
    return -[EKCalendarItemEditor canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)navigationItem
{
  id v2 = [(EKCalendarItemEditor *)self parentViewController];
  uint64_t v3 = [v2 navigationItem];

  return v3;
}

- (id)title
{
  id v2 = [(EKCalendarItemEditor *)self parentViewController];
  uint64_t v3 = [v2 title];

  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarItemEditor *)self parentViewController];
  [v5 setTitle:v4];
}

- (EKCalendarItemEditorDelegate)editorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);

  return (EKCalendarItemEditorDelegate *)WeakRetained;
}

- (void)setEditorDelegate:(id)a3
{
}

- (EKEventStore)store
{
  return self->_store;
}

- (EKCalendarItem)calendarItem
{
  return self->_calendarItem;
}

- (UIResponder)responderToRestoreOnAppearence
{
  return self->_responderToRestoreOnAppearence;
}

- (void)setResponderToRestoreOnAppearence:(id)a3
{
}

- (unint64_t)visibleSectionToRestoreOnAppearence
{
  return self->_visibleSectionToRestoreOnAppearence;
}

- (void)setVisibleSectionToRestoreOnAppearence:(unint64_t)a3
{
  self->_visibleSectionToRestoreOnAppearence = a3;
}

- (BOOL)showsTimeZone
{
  return self->_showsTimeZone;
}

- (void)setShowsTimeZone:(BOOL)a3
{
  self->_showsTimeZone = a3;
}

- (EKCalendarItemEditItem)currentEditItem
{
  return (EKCalendarItemEditItem *)objc_getProperty(self, a2, 1088, 1);
}

- (BOOL)timeImplicitlySet
{
  return self->_timeImplicitlySet;
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  self->_timeImplicitlySet = a3;
}

- (BOOL)isTextEditing
{
  return self->_isTextEditing;
}

- (void)setIsTextEditing:(BOOL)a3
{
  self->_isTextEditing = a3;
}

- (BOOL)pendingVideoConference
{
  return self->_pendingVideoConference;
}

- (void)setPendingVideoConference:(BOOL)a3
{
  self->_pendingVideoConference = a3;
}

- (BOOL)hasModifiedAttendeesFromSuggestion
{
  return self->_hasModifiedAttendeesFromSuggestion;
}

- (void)setHasModifiedAttendeesFromSuggestion:(BOOL)a3
{
  self->_hasModifiedAttendeesFromSuggestion = a3;
}

- (unint64_t)calendarItemCreationMethod
{
  return self->_calendarItemCreationMethod;
}

- (void)setCalendarItemCreationMethod:(unint64_t)a3
{
  self->_calendarItemCreationMethod = a3;
}

- (void)setAccessDeniedView:(id)a3
{
}

- (EKChangeSet)originalChangeSet
{
  return self->_originalChangeSet;
}

- (void)setOriginalChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChangeSet, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_responderToRestoreOnAppearence, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_editorDelegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_editItemsDisablingDoneButton, 0);
  objc_storeStrong((id *)&self->_currentEditItem, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong(&self->_revertState, 0);
  objc_storeStrong((id *)&self->_orderedEditItems, 0);

  objc_storeStrong((id *)&self->_editItems, 0);
}

- (id)_editItems
{
  return 0;
}

- (id)_orderedEditItems
{
  return 0;
}

- (BOOL)saveCalendarItemWithSpan:(int64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)attachmentsModifiedOnRecurrence
{
  return 0;
}

- (id)attachmentsModifiedEvent
{
  return 0;
}

- (BOOL)hasAttachmentChanges
{
  return 0;
}

- (id)defaultAlertTitle
{
  return 0;
}

- (id)notificationNamesForLocaleChange
{
  return 0;
}

- (unint64_t)entityType
{
  return 0;
}

- (void)_copyEventForPossibleRevert
{
  OUTLINED_FUNCTION_1_1();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)_revertEvent
{
  OUTLINED_FUNCTION_1_1();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)_nameForDeleteButton
{
  return 0;
}

- (id)_viewForSheet
{
  return 0;
}

@end