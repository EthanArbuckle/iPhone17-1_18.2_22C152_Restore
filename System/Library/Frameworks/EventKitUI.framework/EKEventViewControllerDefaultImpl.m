@interface EKEventViewControllerDefaultImpl
+ (id)_orderedActionsForMask:(int64_t)a3;
+ (void)adjustLayoutForCell:(id)a3 tableViewWidth:(double)a4 numRowsInSection:(unint64_t)a5 cellRow:(unint64_t)a6 forceLayout:(BOOL)a7;
+ (void)setDefaultDatesForEvent:(id)a3;
- (BOOL)_backingEventAllowsEditing;
- (BOOL)_canPerformEditKeyCommand;
- (BOOL)_isDisplayingDeletableEvent;
- (BOOL)_isDisplayingInvitation;
- (BOOL)_isDisplayingSelfOrganizedInvitation;
- (BOOL)_isDisplayingSuggestion;
- (BOOL)_navigationBarShouldBeHidden;
- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)_refreshEventAndReload;
- (BOOL)_reminderMode;
- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage;
- (BOOL)_shouldDisplayDoneButton;
- (BOOL)_shouldDisplayStatusButtons;
- (BOOL)_shouldPopSelf;
- (BOOL)_shouldShowEditButton;
- (BOOL)_shouldShowInlineButtonFromDelegate;
- (BOOL)allowContextProvider:(id)a3;
- (BOOL)allowsCalendarPreview;
- (BOOL)allowsEditing;
- (BOOL)allowsInviteResponses;
- (BOOL)allowsSubitems;
- (BOOL)calendarPreviewIsInlineDayView;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)eventDetailItemShouldPresentShareSheet:(id)a3;
- (BOOL)eventEditViewPresented;
- (BOOL)hideCalendarPreview;
- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter;
- (BOOL)isICSPreview;
- (BOOL)isLargeDayView;
- (BOOL)minimalMode;
- (BOOL)noninteractivePlatterMode;
- (BOOL)shouldShowEditButtonInline;
- (BOOL)shouldShowNextButton;
- (BOOL)shouldShowPreviousButton;
- (BOOL)showsAddToCalendarForICSPreview;
- (BOOL)showsDelegateMessage;
- (BOOL)showsDelegatorMessage;
- (BOOL)showsDeleteForICSPreview;
- (BOOL)showsDetectedConferenceItem;
- (BOOL)showsDoneButton;
- (BOOL)showsOutOfDateMessage;
- (BOOL)showsUpdateCalendarForICSPreview;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)viewIsVisible;
- (CGSize)_idealSize;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKEventViewControllerDefaultImpl)init;
- (EKEventViewDelegate)delegate;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (NSDictionary)context;
- (UIScrollView)eventDetailsScrollView;
- (UIViewController)presentationSourceViewController;
- (double)eventStatusButtonsViewButtonFontSize:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)tableViewSectionContentWidth;
- (id)_detachSheetHandler;
- (id)_footerLabelContainingText:(id)a3;
- (id)_indexPathForAttendeesDetailItem;
- (id)_indexPathForSection:(unint64_t)a3;
- (id)_itemAtIndexPath:(id)a3 section:(id *)a4 subitemIndex:(unint64_t *)a5;
- (id)_proposedDate;
- (id)_sectionAtIndex:(int64_t)a3;
- (id)_statusButtonsContainerView;
- (id)_statusButtonsView;
- (id)_viewControllerForEditorPresentation;
- (id)accessDeniedView;
- (id)activeEventEditor;
- (id)getCurrentContext;
- (id)items;
- (id)navigationController;
- (id)navigationItem;
- (id)optionalModel;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (id)presentationNavigationDelegate;
- (id)statusButtons;
- (id)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)toolbarItems;
- (id)viewTitle;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int64_t)_actionsMask;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_sectionForDetailItem:(id)a3;
- (void)_acceptProposedTimeWithSourceViewForPopover:(id)a3;
- (void)_addToCalendarClicked:(id)a3;
- (void)_annotateEventEntityIfNeeded;
- (void)_cancelProposedTime;
- (void)_clearCustomTitle;
- (void)_configureItemsForStoreConstraintsGivenCalendar:(id)a3;
- (void)_deleteClicked:(id)a3;
- (void)_deleteSuggestionTapped:(id)a3;
- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4;
- (void)_doneButtonTapped:(id)a3;
- (void)_eventEditViewControllerDidCompleteWithAction:(int64_t)a3;
- (void)_keyboardWasHidden:(id)a3;
- (void)_keyboardWasShown:(id)a3;
- (void)_localeChanged;
- (void)_notifyDetailItemsOfVisibilityOnScreen;
- (void)_performDelete:(int64_t)a3 editor:(id)a4;
- (void)_performEditKeyCommand;
- (void)_pop;
- (void)_prepareEventForEdit;
- (void)_presentDetachSheetFromBarButtonItem:(id)a3;
- (void)_presentDetachSheetFromView:(id)a3;
- (void)_presentValidationAlert:(id)a3;
- (void)_rejectProposedTime;
- (void)_reloadIfNeeded;
- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4;
- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4;
- (void)_setNeedsReloadIncludingItems;
- (void)_setNeedsReloadIncludingItems:(BOOL)a3;
- (void)_setObservesKeyboardNotifications:(BOOL)a3;
- (void)_setUpForEvent;
- (void)_storeChanged:(id)a3;
- (void)_teardownTableView;
- (void)_unsubscribeClicked:(id)a3;
- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3;
- (void)_updateHeaderAndFooterIfNeeded;
- (void)_updateNavBarAnimated:(BOOL)a3;
- (void)_updateResponse;
- (void)_updateResponseVisibility;
- (void)_updateStatusButtonsActions;
- (void)_updateTableContentInsetForKeyboard:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)completeWithAction:(int64_t)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)detailItem:(id)a3 performActionsOnCellAtIndexPath:(id)a4 actions:(id)a5;
- (void)detailItem:(id)a3 wantsIndexPathsScrolledToVisible:(id)a4;
- (void)detailItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5 rowReloads:(id)a6;
- (void)detailItem:(id)a3 wantsRowReload:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)doneButtonTapped;
- (void)editButtonPressed;
- (void)editButtonTapped;
- (void)eventDetailItem:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5;
- (void)eventDetailItemAccessoryButtonTapped:(id)a3;
- (void)eventDetailItemWantsRefeshForHeightChange;
- (void)eventDetailItemWantsRefresh:(id)a3;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventItem:(id)a3 wantsViewControllerPresented:(id)a4;
- (void)eventItemDidCommit:(id)a3;
- (void)eventItemDidEndEditing:(id)a3;
- (void)eventItemDidSave:(id)a3;
- (void)eventItemDidStartEditing:(id)a3;
- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4;
- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)fullReloadWithNewEvent:(id)a3;
- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4;
- (void)loadView;
- (void)nextButtonPressed;
- (void)openAttendeesDetailItem;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)performAddToCalendar;
- (void)presentEditorAnimated:(BOOL)a3;
- (void)previousButtonPressed;
- (void)reloadReminderWithEKEvent:(id)a3;
- (void)resetBackgroundColor;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActiveEventEditor:(id)a3;
- (void)setAllowsCalendarPreview:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsInviteResponses:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setBottomInset:(double)a3;
- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorHideTransition:(int)a3;
- (void)setEditorShowTransition:(int)a3;
- (void)setEvent:(id)a3;
- (void)setEventEditViewPresented:(BOOL)a3;
- (void)setHideCalendarPreview:(BOOL)a3;
- (void)setICSPreview:(BOOL)a3;
- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setIsLargeDayView:(BOOL)a3;
- (void)setMinimalMode:(BOOL)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setNeedsReload;
- (void)setNoninteractivePlatterMode:(BOOL)a3;
- (void)setPresentationSourceViewController:(id)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4;
- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3;
- (void)setShowsDelegateMessage:(BOOL)a3;
- (void)setShowsDelegatorMessage:(BOOL)a3;
- (void)setShowsDeleteForICSPreview:(BOOL)a3;
- (void)setShowsDetectedConferenceItem:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setShowsOutOfDateMessage:(BOOL)a3;
- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3;
- (void)setToolbarItems:(id)a3;
- (void)setToolbarItems:(id)a3 animated:(BOOL)a4;
- (void)setTopInset:(double)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)uneditableButtonDetailItem:(id)a3 requestsShowEvent:(id)a4;
- (void)updateTitleWithScrollView:(id)a3 animation:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EKEventViewControllerDefaultImpl

+ (void)setDefaultDatesForEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 date];
  CUIKGetDefaultStartAndEndTimeForDate();
  id v6 = 0;
  id v7 = 0;
  [v4 setStartDate:v6];
  [v4 setEndDateUnadjustedForLegacyClients:v7];
}

- (EKEventViewControllerDefaultImpl)init
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)EKEventViewControllerDefaultImpl;
  v2 = [(EKEventViewControllerDefaultImpl *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_showsPreview = 1;
    uint64_t v4 = objc_opt_new();
    cellHeights = v3->_cellHeights;
    v3->_cellHeights = (NSMutableDictionary *)v4;

    id v6 = [MEMORY[0x1E4F57C00] sharedPreferences];
    int v7 = [v6 hideInlineDayViewInEventDetails];

    if (v7) {
      [(EKEventViewControllerDefaultImpl *)v3 setHideCalendarPreview:1];
    }
    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__EKEventViewControllerDefaultImpl_init__block_invoke;
    v11[3] = &unk_1E60874F8;
    objc_copyWeak(&v12, &location);
    id v9 = (id)[(EKEventViewControllerDefaultImpl *)v3 registerForTraitChanges:v8 withHandler:v11];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__EKEventViewControllerDefaultImpl_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_22;
  }
  uint64_t v8 = [v6 horizontalSizeClass];
  id v9 = [v5 traitCollection];
  if (v8 != [v9 horizontalSizeClass])
  {

    goto LABEL_6;
  }
  uint64_t v10 = [v6 verticalSizeClass];
  v11 = [v5 traitCollection];
  uint64_t v12 = [v11 verticalSizeClass];

  if (v10 != v12)
  {
LABEL_6:
    v13 = [WeakRetained _statusButtonsContainerView];

    if (v13)
    {
      WeakRetained[137] = 0;
      objc_super v14 = [WeakRetained navigationController];
      v15 = [v14 toolbar];

      if (v15)
      {
        v16 = [WeakRetained _statusButtonsContainerView];
        [v16 setBoundsWithToolbar:v15];
      }
    }
    [WeakRetained _updateNavBarAnimated:0];
    v17 = [WeakRetained delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [WeakRetained delegate];
      v20 = [WeakRetained _ekEventViewController];
      objc_msgSend(WeakRetained, "setMinimalMode:", objc_msgSend(v19, "eventViewControllerUseMinimalModeAfterTraitCollectionChange:", v20));
    }
    else
    {
      [WeakRetained setMinimalMode:0];
    }
  }
  uint64_t v21 = [v6 userInterfaceStyle];
  v22 = [v5 traitCollection];
  uint64_t v23 = [v22 userInterfaceStyle];

  if (v21 != v23)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v24 = objc_msgSend(WeakRetained, "items", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * i) reset];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v26);
    }

    v29 = [WeakRetained tableView];
    [v29 reloadData];
  }
LABEL_22:
}

- (void)_teardownTableView
{
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  tableView = self->_tableView;
  self->_tableView = 0;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
  self->_dead = 1;
  [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController cancelAnimated:0];
  uint64_t v4 = [(id)EKWeakLinkClass() defaultContextManager];
  [v4 removeContextProvider:self];

  items = self->_items;
  if (items)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = items;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v11 setDelegate:0];
          [v11 setEvent:0 reminder:0 store:0];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  [(EKEventViewControllerDefaultImpl *)self _teardownTableView];

  v12.receiver = self;
  v12.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v12 dealloc];
}

- (id)tableView
{
  [(EKEventViewControllerDefaultImpl *)self view];

  tableView = self->_tableView;

  return tableView;
}

- (void)loadView
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(EKEventViewControllerDefaultImpl *)self setView:v3];

  uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self view];
  [v4 setAutoresizingMask:18];

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v10 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  tableView = self->_tableView;
  self->_tableView = v10;

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"EventDetailsContainer"];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setSeparatorStyle:!self->_minimalMode];
  if ([(EKEventViewControllerDefaultImpl *)self _reminderMode]) {
    [(EKEventViewControllerDefaultImpl *)self setTopInset:16.0];
  }
  if (self->_noninteractivePlatterMode)
  {
    [(UITableView *)self->_tableView setSeparatorStyle:0];
    [(EKEventViewControllerDefaultImpl *)self setBottomInset:16.0];
  }
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  if (EKUIUnscaledCatalyst()) {
    double v12 = EKUIUnscaledCatalystTableRowHeightDefault();
  }
  else {
    double v12 = *MEMORY[0x1E4FB2F28];
  }
  [(UITableView *)self->_tableView setRowHeight:v12];
  +[EKEventDetailCell detailsCellDefaultHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v13 = [(EKEventViewControllerDefaultImpl *)self view];
  [v13 addSubview:self->_tableView];

  long long v14 = _NSDictionaryOfVariableBindings(&cfstr_Tableview.isa, self->_tableView, 0);
  long long v15 = _NSDictionaryOfVariableBindings(&cfstr_Tableview.isa, self->_tableView, 0);
  long long v16 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_tableView]" options:0 metrics:0 views:v15];
  tableViewTopConstraints = self->_tableViewTopConstraints;
  self->_tableViewTopConstraints = v16;

  [(EKEventViewControllerDefaultImpl *)self resetBackgroundColor];
  uint64_t v18 = [(EKEventViewControllerDefaultImpl *)self event];
  if ([v18 couldBeJunk])
  {
    BOOL v19 = [(EKEventViewControllerDefaultImpl *)self minimalMode];

    if (!v19)
    {
      v20 = (UIView *)objc_opt_new();
      headerView = self->_headerView;
      self->_headerView = v20;

      [(UIView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
      v22 = [EKEventReportJunkView alloc];
      uint64_t v23 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      v24 = [(EKEventReportJunkView *)v22 initWithViewController:v23];

      [(EKEventReportJunkView *)v24 setIsLargeDayView:[(EKEventViewControllerDefaultImpl *)self isLargeDayView]];
      [(EKEventReportJunkView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_headerView addSubview:v24];
      uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
      uint64_t v26 = [MEMORY[0x1E4FB1618] tableSeparatorLightColor];
      [v25 setBackgroundColor:v26];

      [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_headerView addSubview:v25];
      uint64_t v27 = [(EKEventViewControllerDefaultImpl *)self view];
      [v27 addSubview:self->_headerView];

      v28 = _NSDictionaryOfVariableBindings(&cfstr_TableviewHeade.isa, self->_tableView, self->_headerView, v24, v25, 0);
      v63 = @"onePixel";
      v60 = v14;
      v29 = [NSNumber numberWithDouble:CalOnePixelInPoints()];
      v64[0] = v29;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];

      long long v30 = (void *)MEMORY[0x1E4F28DC8];
      [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[junkView][dividerView(==onePixel)]|" options:0 metrics:v58 views:v28];
      long long v31 = v59 = v15;
      [v30 activateConstraints:v31];

      long long v32 = (void *)MEMORY[0x1E4F28DC8];
      long long v33 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[junkView]|" options:0 metrics:0 views:v28];
      [v32 activateConstraints:v33];

      v34 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v35 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[dividerView]|" options:0 metrics:0 views:v28];
      [v34 activateConstraints:v35];

      v36 = (void *)MEMORY[0x1E4F28DC8];
      v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_headerView]|" options:0 metrics:0 views:v28];
      [v36 activateConstraints:v37];

      v38 = (void *)MEMORY[0x1E4F28DC8];
      v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_headerView attribute:8 relatedBy:0 toItem:v24 attribute:8 multiplier:1.0 constant:0.0];
      v62 = v39;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      [v38 activateConstraints:v40];

      v41 = (void *)MEMORY[0x1E4F28DC8];
      v42 = self->_headerView;
      v43 = [(EKEventViewControllerDefaultImpl *)self view];
      v44 = [v41 constraintWithItem:v42 attribute:3 relatedBy:0 toItem:v43 attribute:15 multiplier:1.0 constant:0.0];
      v61[0] = v44;
      v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_tableView attribute:3 relatedBy:0 toItem:self->_headerView attribute:4 multiplier:1.0 constant:0.0];
      v61[1] = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
      headerConstraints = self->_headerConstraints;
      self->_headerConstraints = v46;

      long long v15 = v59;
      long long v14 = v60;
      [MEMORY[0x1E4F28DC8] activateConstraints:self->_headerConstraints];

      goto LABEL_13;
    }
  }
  else
  {
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_tableViewTopConstraints];
LABEL_13:
  v48 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_tableView]|" options:0 metrics:0 views:v14];
  [v48 activateConstraints:v49];

  v50 = (void *)MEMORY[0x1E4F28DC8];
  v51 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:0 views:v14];
  [v50 activateConstraints:v51];

  if (self->_shouldOverrideAuthorizationStatus)
  {
    uint64_t lastAuthorizationStatus = self->_lastAuthorizationStatus;
  }
  else
  {
    uint64_t lastAuthorizationStatus = [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:0];
    self->_uint64_t lastAuthorizationStatus = lastAuthorizationStatus;
  }
  if (lastAuthorizationStatus <= 2)
  {
    v53 = [(EKEventViewControllerDefaultImpl *)self view];
    v54 = [(EKEventViewControllerDefaultImpl *)self accessDeniedView];
    [v53 addSubview:v54];

    v55 = [(EKEventViewControllerDefaultImpl *)self view];
    v56 = [(EKEventViewControllerDefaultImpl *)self accessDeniedView];
    [v55 bringSubviewToFront:v56];

    if (self->_lastAuthorizationStatus == 1)
    {
      v57 = [(EKEventViewControllerDefaultImpl *)self accessDeniedView];
      [v57 setMessage:@" "];
    }
  }
  [(EKEventViewControllerDefaultImpl *)self _reloadIfNeeded];
}

- (void)resetBackgroundColor
{
  tableView = self->_tableView;
  uint64_t v4 = [MEMORY[0x1E4FB1618] tableBackgroundColor];
  [(UITableView *)tableView setBackgroundColor:v4];

  id v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v5 = [(EKEventViewControllerDefaultImpl *)self view];
  [v5 setBackgroundColor:v6];
}

- (id)_indexPathForSection:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v7 = 0;
    double v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    currentSections = self->_currentSections;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__EKEventViewControllerDefaultImpl__indexPathForSection___block_invoke;
    v6[3] = &unk_1E608A3F8;
    v6[4] = &v7;
    v6[5] = a3;
    [(NSArray *)currentSections enumerateObjectsUsingBlock:v6];
    uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v8[3]];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __57__EKEventViewControllerDefaultImpl__indexPathForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 tag];
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_indexPathForAttendeesDetailItem
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  currentSections = self->_currentSections;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke;
  v5[3] = &unk_1E608A448;
  v5[4] = &v10;
  v5[5] = &v6;
  [(NSArray *)currentSections enumerateObjectsUsingBlock:v5];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:v7[3] inSection:v11[3]];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

  return v3;
}

void __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 items];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke_2;
  v6[3] = &unk_1E608A420;
  uint64_t v8 = a3;
  long long v7 = *(_OWORD *)(a1 + 32);
  [v5 enumerateObjectsUsingBlock:v6];
}

void __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = a1[6];
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)viewTitle
{
  BOOL v2 = [(EKEventViewControllerDefaultImpl *)self _reminderMode];
  id v3 = EventKitUIBundle();
  uint64_t v4 = v3;
  if (v2) {
    id v5 = @"Reminder Details";
  }
  else {
    id v5 = @"Event Details";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F0CC2140 table:0];

  return v6;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v5 viewDidLoad];
  id v3 = [(EKEventViewControllerDefaultImpl *)self viewTitle];
  uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  [v4 setTitle:v3];

  [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  [(EKEventViewControllerDefaultImpl *)self _annotateEventEntityIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v20 viewWillAppear:a3];
  [(UITableView *)self->_tableView setPreservesSuperviewLayoutMargins:1];
  uint64_t v4 = [(UIViewController *)self EKUI_viewHierarchy];
  EKUIPushFallbackSizingContextWithViewHierarchy(v4);
  uint64_t v5 = objc_msgSend(v4, "ekui_interfaceOrientation");
  int64_t lastOrientation = self->_lastOrientation;
  if (v5 != lastOrientation)
  {
    int64_t v7 = v5;
    if (lastOrientation)
    {
      uint64_t v8 = [(EKEventViewControllerDefaultImpl *)self view];
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;
      uint64_t v13 = objc_opt_new();
      -[EKEventViewControllerDefaultImpl viewWillTransitionToSize:withTransitionCoordinator:](self, "viewWillTransitionToSize:withTransitionCoordinator:", v13, v10, v12);
    }
    self->_int64_t lastOrientation = v7;
  }
  [(EKEventViewControllerDefaultImpl *)self _updateStatusButtonsActions];
  [(EKEventViewControllerDefaultImpl *)self _updateResponse];
  [(EKEventViewControllerDefaultImpl *)self _updateHeaderAndFooterIfNeeded];
  long long v14 = [(EKEventViewControllerDefaultImpl *)self _indexPathForSection:self->_scrollToSection];
  if (v14)
  {
    long long v15 = [(EKEventViewControllerDefaultImpl *)self tableView];
    [v15 scrollToRowAtIndexPath:v14 atScrollPosition:1 animated:0];
  }
  long long v16 = [(id)EKWeakLinkClass() defaultContextManager];
  [v16 addContextProvider:self];

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:self selector:sel__localeChanged name:*MEMORY[0x1E4F57AB0] object:0];
  [v17 addObserver:self selector:sel__storeChanged_ name:*MEMORY[0x1E4F25460] object:0];
  [v17 addObserver:self selector:sel__updateTableContentForSizeCategoryChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  [(EKEventViewControllerDefaultImpl *)self _setObservesKeyboardNotifications:1];
  [(EKEventViewControllerDefaultImpl *)self _updateNavBarAnimated:0];
  [(EKEventViewControllerDefaultImpl *)self _updateResponseVisibility];
  uint64_t v18 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  objc_msgSend(v18, "setNavigationBarHidden:animated:", -[EKEventViewControllerDefaultImpl _shouldShowInlineButtonFromDelegate](self, "_shouldShowInlineButtonFromDelegate"), 0);

  BOOL v19 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  objc_msgSend(v19, "setNavigationBarHidden:animated:", -[EKEventViewControllerDefaultImpl _navigationBarShouldBeHidden](self, "_navigationBarShouldBeHidden"), 1);

  [(EKEventTitleDetailItem *)self->_titleItem setHidesTopSeparator:1];
  self->_viewIsVisible = 1;
  [(EKEventViewControllerDefaultImpl *)self _reloadIfNeeded];
  EKUIPopFallbackSizingContextWithViewHierarchy(v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v12 viewDidAppear:a3];
  self->_didAppear = 1;
  if (self->_autoPop)
  {
    uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    id v5 = (id)[v4 popViewControllerAnimated:1];
  }
  if (!self->_countedAppearance)
  {
    self->_countedAppearance = 1;
    uint64_t v6 = [(EKEvent *)self->_event suggestionInfo];
    if (v6)
    {
      int64_t v7 = (void *)v6;
      int v8 = [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp];

      if (v8)
      {
        [MEMORY[0x1E4F57840] trackPseudoEventDetailsOpened];
        double v9 = (void *)MEMORY[0x1E4F57848];
        double v10 = [(EKEvent *)self->_event suggestionInfo];
        double v11 = [v10 uniqueKey];
        [v9 logEventShowedDetailsWithUniqueKey:v11];
      }
    }
  }
  [(EKEventViewControllerDefaultImpl *)self becomeFirstResponder];
}

- (BOOL)_navigationBarShouldBeHidden
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&unk_1F0D6D6D8])
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      int v8 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      char v9 = [v7 eventViewControllerShouldAlwaysShowNavBar:v8];

      if (v9) {
        return 0;
      }
    }
  }
  else
  {
  }
  if ([(EKEventViewControllerDefaultImpl *)self shouldShowEditButtonInline]) {
    LOBYTE(v11) = 1;
  }
  else {
    int v11 = ![(EKEventViewControllerDefaultImpl *)self _shouldShowEditButton];
  }
  id v12 = objc_loadWeakRetained((id *)p_delegate);
  if ([v12 conformsToProtocol:&unk_1F0D6D6D8])
  {
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
    {
      char v15 = 0;
      goto LABEL_15;
    }
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v15 = [v12 eventViewControllerPresentationWantsHiddenNavBarForSingleController];
  }
  else
  {
    char v15 = 0;
  }

LABEL_15:
  long long v16 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  if (v16)
  {
    v17 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    uint64_t v18 = [v17 viewControllers];
    if ([v18 count] == 1)
    {
      BOOL v19 = [(EKEventViewControllerDefaultImpl *)self navigationController];
      objc_super v20 = [v19 viewControllers];
      uint64_t v21 = [v20 firstObject];
      v22 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      BOOL v23 = v21 == v22;
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 1;
  }

  return v11 & v15 & v23;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_viewIsVisible = 0;
  [(EKEventViewControllerDefaultImpl *)self _setObservesKeyboardNotifications:0];
  id v5 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[EKEventViewControllerDefaultImpl _navigationBarShouldBeHidden](self, "_navigationBarShouldBeHidden"), 1);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 performSelector:sel_eventViewControllerWillDisappear_ withObject:self];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v11 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v5 viewDidDisappear:a3];
  self->_didAppear = 0;
  uint64_t v4 = [(id)EKWeakLinkClass() defaultContextManager];
  [v4 removeContextProvider:self];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [(EKEventViewControllerDefaultImpl *)self updateTitleWithScrollView:v5 animation:0];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v5 didMoveToParentViewController:v4];
  if (v4)
  {
    [(EKEventViewControllerDefaultImpl *)self _updateNavBarAnimated:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 isNavigationBarHidden] & 1) == 0) {
      [(EKEventViewControllerDefaultImpl *)self setMinimalMode:0];
    }
  }
}

- (void)_updateTableContentInsetForKeyboard:(id)a3
{
  id v33 = a3;
  if (![(UIViewController *)self isPresentedInsidePopover])
  {
    [(UITableView *)self->_tableView contentInset];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    id v10 = [v33 userInfo];
    objc_super v11 = [v10 objectForKey:*MEMORY[0x1E4FB2BD8]];
    [v11 CGRectValue];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    objc_super v20 = [v33 object];
    uint64_t v21 = [v20 coordinateSpace];

    v22 = self->_tableView;
    objc_msgSend(v21, "convertRect:toCoordinateSpace:", v22, v13, v15, v17, v19);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    [(UITableView *)self->_tableView bounds];
    v37.origin.x = v24;
    v37.origin.y = v26;
    v37.size.width = v28;
    v37.size.double height = v30;
    CGRect v36 = CGRectIntersection(v35, v37);
    double height = v36.size.height;
    if (CGRectIsEmpty(v36)) {
      double v32 = 0.0;
    }
    else {
      double v32 = height;
    }
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v5, v7, v32, v9);
  }
}

- (BOOL)_shouldDisplayDoneButton
{
  BOOL v3 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
  double v4 = [v3 leftBarButtonItem];
  if (!self->_showsDoneButton) {
    goto LABEL_7;
  }
  if (([v3 hidesBackButton] & 1) == 0 && (!v4 || !objc_msgSend(v4, "systemItem")))
  {
    double v5 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    double v6 = [v5 viewControllers];

    if ([v6 count])
    {
      double v7 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      double v8 = [v6 objectAtIndex:0];

      if (v7 != v8)
      {
LABEL_7:
        BOOL v9 = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if (![v4 systemItem]) {
    [v3 setLeftBarButtonItem:0];
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)_updateNavBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(EKEvent *)self->_event title];
  double v6 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
  [v6 setBackButtonTitle:v5];

  if ([(EKEventViewControllerDefaultImpl *)self _shouldShowEditButton])
  {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel_editButtonTapped];
    if ([(EKEventViewControllerDefaultImpl *)self _shouldDisplayDoneButton])
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
      double v8 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
      [v8 setLeftBarButtonItem:v11 animated:v3];

      BOOL v9 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
      [v9 setRightBarButtonItem:v7 animated:v3];
    }
    else
    {
      double v7 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
      [v7 setRightBarButtonItem:v11 animated:v3];
    }
  }
  else if ([(EKEventViewControllerDefaultImpl *)self _shouldDisplayDoneButton])
  {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
    id v10 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
    [v10 setRightBarButtonItem:v11 animated:v3];
  }
  else
  {
    id v11 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
    [v11 setRightBarButtonItem:0 animated:v3];
  }
}

- (BOOL)_shouldShowEditButton
{
  BOOL v3 = [(EKEventViewControllerDefaultImpl *)self allowsEditing];
  if (v3)
  {
    LOBYTE(v3) = [(EKEventViewControllerDefaultImpl *)self _backingEventAllowsEditing];
  }
  return v3;
}

- (CGSize)_idealSize
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(EKEventViewControllerDefaultImpl *)self _reloadIfNeeded];
  [(EKEventViewControllerDefaultImpl *)self _updateResponseVisibility];
  BOOL v3 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v3 layoutIfNeeded];

  double v4 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v4 bounds];
  if (v5 <= EKUIContainedControllerIdealWidth())
  {
    double v8 = EKUIContainedControllerIdealWidth();
  }
  else
  {
    double v6 = [(EKEventViewControllerDefaultImpl *)self tableView];
    [v6 bounds];
    double v8 = v7;
  }
  BOOL v9 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v9 contentInset];
  double v11 = v10;
  double v12 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v12 contentInset];
  double v14 = v11 + v13;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v15 = self->_currentSections;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    double v19 = *MEMORY[0x1E4FB2F28];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v21, "numberOfRows", (void)v26))
        {
          unint64_t v22 = 0;
          do
          {
            [v21 defaultCellHeightForSubitemAtIndex:v22 forWidth:0 forceUpdate:v8];
            if (v23 == v19) {
              +[EKEventDetailCell detailsCellDefaultHeight];
            }
            double v14 = v14 + v23;
            ++v22;
          }
          while (v22 < [v21 numberOfRows]);
        }
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  double v24 = EKUIContainedControllerIdealWidth();
  double v25 = v14;
  result.double height = v25;
  result.width = v24;
  return result;
}

- (BOOL)_shouldPopSelf
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    return 0;
  }
  double v5 = WeakRetained;
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  BOOL v9 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  char v10 = [v8 eventViewControllerShouldDismissSelf:v9];

  return v10;
}

- (void)_pop
{
  BOOL v3 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_INFO, "EKEventViewController is dismissing itself; clients of this class should ideally handle their own dismissal by imp"
      "lementing the delegate method eventViewController:didCompleteWithAction:",
      v14,
      2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    [v5 popViewControllerAnimated:1];
  }
  else
  {
    if (!self->_didAppear)
    {
      self->_autoPop = 1;
      return;
    }
    id v6 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    char v7 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    id v8 = (id)[v6 popToViewController:v7 animated:0];

    BOOL v9 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    char v10 = [v9 viewControllers];
    unint64_t v11 = [v10 count];

    double v12 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    id v5 = v12;
    if (v11 < 2) {
      [v12 dismissViewControllerAnimated:1 completion:0];
    }
    else {
      id v13 = (id)[v12 popViewControllerAnimated:1];
    }
  }
}

- (void)openAttendeesDetailItem
{
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKEventViewControllerDefaultImpl_openAttendeesDetailItem__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __59__EKEventViewControllerDefaultImpl_openAttendeesDetailItem__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _indexPathForAttendeesDetailItem];
  uint64_t v5 = 0;
  dispatch_time_t v3 = [*(id *)(a1 + 32) _itemAtIndexPath:v2 section:0 subitemIndex:&v5];
  double v4 = [*(id *)(a1 + 32) _ekEventViewController];
  [v3 eventViewController:v4 didSelectSubitem:v5];
}

- (void)setNeedsReload
{
}

- (void)_setNeedsReloadIncludingItems:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKEventViewControllerDefaultImpl *)self isViewLoaded])
  {
    self->_needsReload = 1;
    if (v3) {
      self->_itemsNeedReload = 1;
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadIfNeeded object:0];
    if (!self->_dead && !self->_tableIsBeingEdited)
    {
      [(EKEventViewControllerDefaultImpl *)self performSelector:sel__reloadIfNeeded withObject:0 afterDelay:0.0];
    }
  }
}

- (void)_reloadIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_needsReload
    && self->_viewIsVisible
    && [(EKEventViewControllerDefaultImpl *)self isViewLoaded])
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadIfNeeded object:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v3 = self->_items;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = 0;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "reset", (void)v12);
          v6 |= [v9 detailItemVisibilityChanged];
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    else
    {
      LOBYTE(v6) = 0;
    }

    if (self->_itemsNeedReload || (v6 & 1) != 0)
    {
      if (self->_items)
      {
        char v10 = [(EKEvent *)self->_event calendar];
        [(EKEventViewControllerDefaultImpl *)self _configureItemsForStoreConstraintsGivenCalendar:v10];
      }
      else
      {
        [(EKEventViewControllerDefaultImpl *)self _setUpForEvent];
      }
    }
    self->_itemsNeedReload = 0;
    self->_needsReload = 0;
    unint64_t v11 = [(EKEventViewControllerDefaultImpl *)self tableView];
    [v11 reloadData];

    [(EKEventViewControllerDefaultImpl *)self _updateStatusButtonsActions];
    [(EKEventViewControllerDefaultImpl *)self preferredContentSize];
    -[EKEventViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)setEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (EKEvent *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_event = &self->_event;
    event = self->_event;
    if (event != v5)
    {
      id v8 = (void *)MEMORY[0x1E4F25448];
      if (event)
      {
        BOOL v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 removeObserver:self name:*v8 object:*p_event];
      }
      [(EKEventViewControllerDefaultImpl *)self reloadReminderWithEKEvent:v5];
      objc_storeStrong((id *)&self->_event, a3);
      cachedShowNext = self->_cachedShowNext;
      self->_cachedShowNext = 0;

      cachedShowPrevious = self->_cachedShowPrevious;
      self->_cachedShowPrevious = 0;

      [(EKEventViewControllerDefaultImpl *)self _setUpForEvent];
      if (*p_event)
      {
        long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 addObserver:self selector:sel_setNeedsReload name:*v8 object:*p_event];
      }
      if ([(EKEventViewControllerDefaultImpl *)self isViewLoaded])
      {
        long long v13 = [(EKEventViewControllerDefaultImpl *)self tableView];
        [v13 reloadData];

        long long v14 = [(EKEventViewControllerDefaultImpl *)self tableView];
        [v14 selectRowAtIndexPath:0 animated:0 scrollPosition:0];

        [(EKEventViewControllerDefaultImpl *)self _updateResponseVisibility];
        [(EKEventViewControllerDefaultImpl *)self _updateResponse];
      }
      [(UIResponder *)self EKUI_setDataOwnersFromEvent:v5];
      [(EKEventViewControllerDefaultImpl *)self _annotateEventEntityIfNeeded];
    }
  }
  else
  {
    long long v15 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v15;
      int v18 = 138412546;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      id v17 = v19;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "Error: EKEventViewController setEvent given object of class %@. Description: %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)reloadReminderWithEKEvent:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isReminderIntegrationEvent])
  {
    uint64_t v5 = [v4 uniqueID];
    int v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x2050000000;
    uint64_t v7 = (void *)getREMObjectIDClass_softClass_0;
    uint64_t v25 = getREMObjectIDClass_softClass_0;
    if (!getREMObjectIDClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getREMObjectIDClass_block_invoke_0;
      long long v27 = &unk_1E6087D90;
      long long v28 = &v22;
      __getREMObjectIDClass_block_invoke_0((uint64_t)buf);
      uint64_t v7 = (void *)v23[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v22, 8);
    BOOL v9 = [v8 objectIDWithURL:v6];
    if (v9)
    {
      reminderStore = self->_reminderStore;
      if (!reminderStore)
      {
        uint64_t v22 = 0;
        double v23 = &v22;
        uint64_t v24 = 0x2050000000;
        unint64_t v11 = (void *)getREMStoreClass_softClass_0;
        uint64_t v25 = getREMStoreClass_softClass_0;
        if (!getREMStoreClass_softClass_0)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getREMStoreClass_block_invoke_0;
          long long v27 = &unk_1E6087D90;
          long long v28 = &v22;
          __getREMStoreClass_block_invoke_0((uint64_t)buf);
          unint64_t v11 = (void *)v23[3];
        }
        long long v12 = v11;
        _Block_object_dispose(&v22, 8);
        long long v13 = (REMStore *)objc_alloc_init(v12);
        long long v14 = self->_reminderStore;
        self->_reminderStore = v13;

        reminderStore = self->_reminderStore;
      }
      id v21 = 0;
      uint64_t v15 = [(REMStore *)reminderStore fetchReminderWithObjectID:v9 error:&v21];
      id v16 = v21;
      p_reminder = &self->_reminder;
      int v18 = *p_reminder;
      *p_reminder = (REMReminder *)v15;

      if (!*p_reminder || v16)
      {
        id v19 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_ERROR, "Unable to fetch reminder (objectID: %@). Error: %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    __int16 v20 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_ERROR, "Trying to reload reminder with EKEvent, but it's not a reminder. %@", buf, 0xCu);
    }
  }
}

- (EKEvent)event
{
  return self->_event;
}

- (void)_annotateEventEntityIfNeeded
{
  id v3 = [(EKEventViewControllerDefaultImpl *)self event];
  [(UIViewController *)self EKUI_annotateIfNeededWithAppEntityForEvent:v3 isEditing:0];
}

- (BOOL)_backingEventAllowsEditing
{
  if ((![(EKEvent *)self->_event isReminderIntegrationEvent]
     || [(EKEvent *)self->_event CUIK_reminderShouldBeEditable])
    && [(EKEvent *)self->_event isEditable])
  {
    id v3 = [(EKEvent *)self->_event eventStore];
    if (v3)
    {
      id v4 = [(EKEvent *)self->_event calendar];
      int v5 = [v4 isSuggestedEventCalendar] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setAllowsEditing:(BOOL)a3
{
  if (self->_allowsEditing != a3)
  {
    self->_allowsEditing = a3;
    -[EKEventViewControllerDefaultImpl setAllowsInviteResponses:](self, "setAllowsInviteResponses:");
    if ([(EKEventViewControllerDefaultImpl *)self isViewLoaded]
      && [(EKEventViewControllerDefaultImpl *)self viewIsVisible])
    {
      [(EKEventViewControllerDefaultImpl *)self _updateNavBarAnimated:1];
    }
    id v4 = [(EKEvent *)self->_event calendar];

    if (v4)
    {
      NSUInteger v5 = [(NSArray *)self->_currentSections count];
      int v6 = [(EKEvent *)self->_event calendar];
      [(EKEventViewControllerDefaultImpl *)self _configureItemsForStoreConstraintsGivenCalendar:v6];

      if (v5 != [(NSArray *)self->_currentSections count])
      {
        [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
      }
    }
  }
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  if (self->_allowsInviteResponses != a3)
  {
    self->_allowsInviteResponses = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (BOOL)allowsCalendarPreview
{
  if (self->_showsPreview)
  {
    BOOL v2 = [(EKEventViewControllerDefaultImpl *)self event];
    int v3 = [v2 isAllDay] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  if (!self->_hidePreview && self->_showsPreview != a3)
  {
    self->_showsPreview = a3;
    [(EKEventViewControllerDefaultImpl *)self _setNeedsReloadIncludingItems:1];
  }
}

- (BOOL)hideCalendarPreview
{
  return self->_hidePreview;
}

- (void)setHideCalendarPreview:(BOOL)a3
{
  if (self->_hidePreview != a3)
  {
    self->_hidePreview = a3;
    if (a3) {
      self->_showsPreview = 0;
    }
    [(EKEventViewControllerDefaultImpl *)self _setNeedsReloadIncludingItems:1];
  }
}

- (BOOL)calendarPreviewIsInlineDayView
{
  return self->_calendarPreviewIsInlineDayView;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  if (self->_calendarPreviewIsInlineDayView != a3)
  {
    self->_calendarPreviewIsInlineDayView = a3;
    [(EKEventViewControllerDefaultImpl *)self _setNeedsReloadIncludingItems:1];
  }
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return self->_inlineDayViewRespectsSelectedCalendarsFilter;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  if (self->_inlineDayViewRespectsSelectedCalendarsFilter != a3)
  {
    self->_inlineDayViewRespectsSelectedCalendarsFilter = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (void)setICSPreview:(BOOL)a3
{
  if (self->_ICSPreview != a3)
  {
    self->_ICSPreview = a3;
    self->_scrollToSection = 1;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  if (self->_showsAddToCalendarForICSPreview != a3)
  {
    self->_showsAddToCalendarForICSPreview = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  if (self->_showsUpdateCalendarForICSPreview != a3)
  {
    self->_showsUpdateCalendarForICSPreview = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  if (self->_showsDeleteForICSPreview != a3)
  {
    self->_showsDeleteForICSPreview = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (void)setShowsDoneButton:(BOOL)a3
{
  if (self->_showsDoneButton != a3)
  {
    self->_showsDoneButton = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  if (self->_showsOutOfDateMessage != a3)
  {
    self->_showsOutOfDateMessage = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
    [(EKEventViewControllerDefaultImpl *)self _updateStatusButtonsActions];
  }
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  if (self->_showsDelegatorMessage != a3)
  {
    self->_showsDelegatorMessage = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
    [(EKEventViewControllerDefaultImpl *)self _updateStatusButtonsActions];
  }
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  if (self->_showsDelegateMessage != a3)
  {
    self->_showsDelegateMessage = a3;
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
    [(EKEventViewControllerDefaultImpl *)self _updateStatusButtonsActions];
  }
}

- (BOOL)minimalMode
{
  return self->_minimalMode || self->_noninteractivePlatterMode;
}

- (void)setMinimalMode:(BOOL)a3
{
  if (self->_minimalMode != a3)
  {
    self->_minimalMode = a3;
    [(EKEventViewControllerDefaultImpl *)self _setNeedsReloadIncludingItems];
  }
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  if (self->_noninteractivePlatterMode != a3)
  {
    self->_noninteractivePlatterMode = a3;
    [(EKEventViewControllerDefaultImpl *)self _setNeedsReloadIncludingItems];
  }
}

- (void)_setNeedsReloadIncludingItems
{
  items = self->_items;
  self->_items = 0;

  [(UITableView *)self->_tableView setSeparatorStyle:!self->_minimalMode];

  [(EKEventViewControllerDefaultImpl *)self _setNeedsReloadIncludingItems:1];
}

- (void)completeWithAction:(int64_t)a3
{
  if (a3 == 2)
  {
    self->_ignoreDBChanges = 1;
    recurrenceAlertController = self->_recurrenceAlertController;
    if (recurrenceAlertController)
    {
      int v6 = [(EKUIRecurrenceAlertController *)recurrenceAlertController alertController];
      uint64_t v7 = [v6 presentingViewController];
      [v7 dismissViewControllerAnimated:0 completion:0];
    }
  }
  [(EKEventViewControllerDefaultImpl *)self _dismissEditor:0 deleted:a3 == 2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    BOOL v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      BOOL v11 = [(EKEventViewControllerDefaultImpl *)self _shouldPopSelf];

      if (!v11)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        long long v12 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
        [v13 eventViewController:v12 didCompleteWithAction:a3];

        return;
      }
    }
    else
    {
    }
  }

  [(EKEventViewControllerDefaultImpl *)self _pop];
}

- (id)accessDeniedView
{
  accessDeniedView = self->_accessDeniedView;
  if (!accessDeniedView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1F98]);
    NSUInteger v5 = [(EKEventViewControllerDefaultImpl *)self view];
    [v5 bounds];
    int v6 = (_UIAccessDeniedView *)objc_msgSend(v4, "initWithFrame:");
    uint64_t v7 = self->_accessDeniedView;
    self->_accessDeniedView = v6;

    [(_UIAccessDeniedView *)self->_accessDeniedView setAutoresizingMask:18];
    id v8 = EventKitUIBundle();
    BOOL v9 = [v8 localizedStringForKey:@"This app does not have access to your calendars." value:&stru_1F0CC2140 table:0];
    [(_UIAccessDeniedView *)self->_accessDeniedView setTitle:v9];

    accessDeniedView = self->_accessDeniedView;
  }

  return accessDeniedView;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  self->_shouldOverrideAuthorizationStatus = a3;
  [(EKEventViewControllerDefaultImpl *)self _updateAccessDeniedViewWithNewStatus:a4];
}

- (void)setTopInset:(double)a3
{
  [(UITableView *)self->_tableView contentInset];
  tableView = self->_tableView;

  [(UITableView *)tableView setContentInset:a3];
}

- (void)setBottomInset:(double)a3
{
  [(UITableView *)self->_tableView contentInset];
  tableView = self->_tableView;

  -[UITableView setContentInset:](tableView, "setContentInset:");
}

- (UIScrollView)eventDetailsScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  NSUInteger v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    NSUInteger v5 = obj;
    if (obj)
    {
      [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
      NSUInteger v5 = obj;
    }
  }
}

- (void)_setObservesKeyboardNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (v3)
  {
    [v5 addObserver:self selector:sel__updateTableContentInsetForKeyboard_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v5 addObserver:self selector:sel__updateTableContentInsetForKeyboard_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v5 addObserver:self selector:sel__keyboardWasShown_ name:*MEMORY[0x1E4FB2BC8] object:0];
    [v5 addObserver:self selector:sel__keyboardWasHidden_ name:*MEMORY[0x1E4FB2BC0] object:0];
  }
  else
  {
    [v5 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
    [v5 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
    [v5 removeObserver:self name:*MEMORY[0x1E4FB2BC8] object:0];
    [v5 removeObserver:self name:*MEMORY[0x1E4FB2BC0] object:0];
  }
}

- (BOOL)_refreshEventAndReload
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [(EKEvent *)self->_event refreshIfRefreshableAndNotify:1];
  if (v3)
  {
    if ([(EKEvent *)self->_event isReminderIntegrationEvent])
    {
      [(EKEventViewControllerDefaultImpl *)self reloadReminderWithEKEvent:self->_event];
      [(EKEventViewControllerDefaultImpl *)self _setUpForEvent];
    }
    cachedShowNext = self->_cachedShowNext;
    self->_cachedShowNext = 0;

    cachedShowPrevious = self->_cachedShowPrevious;
    self->_cachedShowPrevious = 0;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v6 = [(EKEventViewControllerDefaultImpl *)self items];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v10++) refreshCopiedEvents];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  }
  return v3;
}

- (void)_storeChanged:(id)a3
{
  id v9 = a3;
  if (![(EKEventViewControllerDefaultImpl *)self eventEditViewPresented]
    && !self->_ignoreDBChanges
    && ([(EKEvent *)self->_event isNew] & 1) == 0)
  {
    id v4 = [v9 userInfo];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F25468]];

    if (!v5
      || ([(EKEvent *)self->_event objectID],
          int v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 containsObject:v6],
          v6,
          v7))
    {
      if ([(EKEventViewControllerDefaultImpl *)self _refreshEventAndReload]) {
        [(UIResponder *)self EKUI_setDataOwnersFromEvent:self->_event];
      }
      else {
        [(EKEventViewControllerDefaultImpl *)self completeWithAction:2];
      }
    }
  }
  if ([(EKEventViewControllerDefaultImpl *)self isViewLoaded])
  {
    if (!self->_shouldOverrideAuthorizationStatus)
    {
      uint64_t v8 = [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:0];
      if (v8 != self->_lastAuthorizationStatus) {
        [(EKEventViewControllerDefaultImpl *)self _updateAccessDeniedViewWithNewStatus:v8];
      }
    }
  }
}

- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3
{
  if (self->_lastAuthorizationStatus != a3)
  {
    accessDeniedView = self->_accessDeniedView;
    if (a3 < 3)
    {
      if (accessDeniedView) {
        goto LABEL_9;
      }
      int v7 = [(EKEventViewControllerDefaultImpl *)self firstResponder];
      [v7 resignFirstResponder];

      uint64_t v8 = [(EKEventViewControllerDefaultImpl *)self view];
      id v9 = [(EKEventViewControllerDefaultImpl *)self accessDeniedView];
      [v8 addSubview:v9];

      uint64_t v10 = [(EKEventViewControllerDefaultImpl *)self view];
      BOOL v11 = [(EKEventViewControllerDefaultImpl *)self accessDeniedView];
      [v10 bringSubviewToFront:v11];

      if (a3 != 1) {
        goto LABEL_9;
      }
      int v6 = [(EKEventViewControllerDefaultImpl *)self accessDeniedView];
      [v6 setMessage:@" "];
    }
    else
    {
      if (!accessDeniedView)
      {
LABEL_9:
        self->_uint64_t lastAuthorizationStatus = a3;
        return;
      }
      [(_UIAccessDeniedView *)accessDeniedView removeFromSuperview];
      int v6 = self->_accessDeniedView;
      self->_accessDeniedView = 0;
    }

    goto LABEL_9;
  }
}

- (void)_localeChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = [(EKEventViewControllerDefaultImpl *)self items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) reset];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v8 reloadData];
}

- (void)_keyboardWasShown:(id)a3
{
  uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self view];
  uint64_t v5 = [v4 window];
  id v8 = [v5 firstResponder];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(EKEventViewControllerDefaultImpl *)self tableView];
    int v7 = [v8 isDescendantOfView:v6];

    if (v7) {
      self->_tableIsBeingEdited = 1;
    }
  }
}

- (void)_keyboardWasHidden:(id)a3
{
  self->_tableIsBeingEdited = 0;
  [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
}

- (BOOL)_reminderMode
{
  return [(EKEvent *)self->_event isReminderIntegrationEvent];
}

- (id)items
{
  v66[7] = *MEMORY[0x1E4F143B8];
  items = self->_items;
  if (!items)
  {
    uint64_t v4 = objc_alloc_init(EKEventTitleDetailItem);
    titleItem = self->_titleItem;
    self->_titleItem = v4;

    [(EKEventTitleDetailItem *)self->_titleItem setEditDelegate:self];
    [(EKEventTitleDetailItem *)self->_titleItem setNonInteractivePlatterMode:[(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode]];
    uint64_t v6 = [(EKEventViewControllerDefaultImpl *)self context];
    int v7 = [v6 objectForKeyedSubscript:@"EKUIEventDetailsFromTravelAdvisoryContext"];

    v42 = v7;
    uint64_t v8 = [v7 BOOLValue];
    [(EKEventTitleDetailItem *)self->_titleItem setHasMapItemLaunchOptionFromTimeToLeaveNotification:v8];
    if ([(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode]) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
    [(EKEventTitleDetailItem *)self->_titleItem setNumberOfTitleLines:v9];
    v59 = objc_alloc_init(EKEventMapDetailItem);
    [(EKEventMapDetailItem *)v59 setHasMapItemLaunchOptionFromTimeToLeaveNotification:v8];
    v60 = objc_alloc_init(EKEventCalendarDetailItem);
    v58 = objc_alloc_init(EKEventAlarmDetailItem);
    [(EKEventDetailItem *)v58 setViewControllerToPresentFrom:self];
    v57 = objc_alloc_init(EKEventAvailabilityDetailItem);
    v56 = objc_alloc_init(EKEventTravelDetailItem);
    v55 = objc_alloc_init(EKEventCommentDetailItem);
    uint64_t v10 = [(EKEventViewControllerDefaultImpl *)self optionalModel];
    v54 = [[EKEventProposeNewTimeItem alloc] initWithModel:v10];
    v53 = objc_alloc_init(EKEventProposedTimeDetailItem);
    long long v11 = objc_alloc_init(EKEventOrganizerDetailItem);
    long long v12 = objc_alloc_init(EKEventAttendeesDetailItem);
    [(EKEventDetailItem *)v12 setViewControllerToPresentFrom:self];
    long long v13 = objc_alloc_init(EKEventAttendeeCommentsDetailItem);
    [(EKEventDetailItem *)v13 setViewControllerToPresentFrom:self];
    v52 = objc_alloc_init(EKEventAttachmentDetailItem);
    v39 = [[EKEventPreviewDetailItem alloc] initWithModel:v10];
    v38 = (void *)v10;
    v51 = [[EKEventShowInCalendarDetailItem alloc] initWithModel:v10];
    v50 = objc_alloc_init(EKEventURLDetailItem);
    v49 = objc_alloc_init(EKEventEditedByDetailItem);
    v48 = objc_alloc_init(EKEventNotesDetailItem);
    [(EKEventDetailItem *)v48 setViewControllerToPresentFrom:self];
    v47 = objc_alloc_init(EKEventConferenceInformationDetailItem);
    [(EKEventDetailItem *)v47 setViewControllerToPresentFrom:self];
    v46 = objc_alloc_init(EKEventPrivacyLevelDetailItem);
    v45 = objc_alloc_init(EKEventImportedNoticeDetailItem);
    uint64_t v14 = objc_alloc_init(EKReminderTitleDetailItem);
    [(EKReminderTitleDetailItem *)v14 setEditDelegate:self];
    long long v15 = objc_alloc_init(EKReminderDateDetailItem);
    id v16 = objc_alloc_init(EKReminderListDetailItem);
    CGRect v37 = objc_alloc_init(EKReminderNotesDetailItem);
    uint64_t v17 = objc_alloc_init(EKReminderURLDetailItem);
    v43 = objc_alloc_init(EKShowInRemindersDetailItem);
    int v18 = [EKReminderUneditableButtonDetailItem alloc];
    if ([(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode]) {
      id v19 = 0;
    }
    else {
      id v19 = self;
    }
    __int16 v20 = [(EKReminderUneditableButtonDetailItem *)v18 initWithUneditableButtonDetailItemDelegate:v19];
    v40 = v13;
    v41 = v12;
    v44 = v11;
    if ([(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode])
    {
      if ([(EKEventViewControllerDefaultImpl *)self _reminderMode])
      {
        v66[0] = v14;
        v66[1] = v20;
        v66[2] = v16;
        v66[3] = v17;
        id v21 = v17;
        uint64_t v22 = v37;
        double v23 = v39;
        v66[4] = v37;
        v66[5] = v39;
        v66[6] = v15;
        uint64_t v24 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v25 = v66;
        uint64_t v26 = 7;
LABEL_17:
        double v32 = [v24 arrayWithObjects:v25 count:v26];
        id v33 = v41;
LABEL_22:
        v34 = self->_items;
        self->_items = v32;

        items = self->_items;
        goto LABEL_23;
      }
      [(EKEventOrganizerDetailItem *)v11 setHideDisclosureIndicator:1];
      double v23 = v39;
      v65[0] = self->_titleItem;
      v65[1] = v39;
      v65[2] = v60;
      v65[3] = v11;
      double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
      id v33 = v41;
    }
    else
    {
      BOOL v27 = [(EKEventViewControllerDefaultImpl *)self minimalMode];
      BOOL v28 = [(EKEventViewControllerDefaultImpl *)self _reminderMode];
      if (v27)
      {
        CGRect v36 = v17;
        if (v28)
        {
          v64[0] = v14;
          v64[1] = v20;
          void v64[2] = v15;
          uint64_t v29 = (void *)MEMORY[0x1E4F1C978];
          CGFloat v30 = v64;
          uint64_t v31 = 3;
        }
        else
        {
          v63[0] = self->_titleItem;
          v63[1] = v60;
          uint64_t v29 = (void *)MEMORY[0x1E4F1C978];
          CGFloat v30 = v63;
          uint64_t v31 = 2;
        }
        double v32 = [v29 arrayWithObjects:v30 count:v31];
        id v33 = v12;
        double v23 = v39;
        uint64_t v22 = v37;
        id v21 = v36;
        goto LABEL_22;
      }
      double v23 = v39;
      if (v28)
      {
        v62[0] = v14;
        v62[1] = v20;
        v62[2] = v16;
        v62[3] = v17;
        id v21 = v17;
        uint64_t v22 = v37;
        v62[4] = v37;
        v62[5] = v43;
        v62[6] = v39;
        v62[7] = v15;
        uint64_t v24 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v25 = v62;
        uint64_t v26 = 8;
        goto LABEL_17;
      }
      v61[0] = self->_titleItem;
      v61[1] = v53;
      void v61[2] = v54;
      v61[3] = v39;
      v61[4] = v60;
      v61[5] = v44;
      id v33 = v41;
      v61[6] = v41;
      v61[7] = v13;
      v61[8] = v56;
      v61[9] = v58;
      v61[10] = v57;
      v61[11] = v46;
      v61[12] = v52;
      v61[13] = v50;
      v61[14] = v49;
      v61[15] = v47;
      v61[16] = v48;
      v61[17] = v51;
      v61[18] = v55;
      v61[19] = v59;
      v61[20] = v45;
      double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:21];
    }
    id v21 = v17;
    uint64_t v22 = v37;
    goto LABEL_22;
  }
LABEL_23:

  return items;
}

- (id)optionalModel
{
  return [(NSDictionary *)self->_context objectForKeyedSubscript:@"EKUIEventDetailsContext_ModelKey"];
}

- (void)_configureItemsForStoreConstraintsGivenCalendar:(id)a3
{
  id v78 = a3;
  if (self->_items)
  {
    uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self items];
    v77 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v7 = EventKitUIBundle();
    v71 = [[EKEventDetailGroup alloc] initWithTag:0 headerTitle:0];
    v70 = [(EKEventDetailGroup *)[EKEventEditableDetailGroup alloc] initWithTag:1 headerTitle:0];
    v69 = [[EKEventDetailGroup alloc] initWithTag:3 headerTitle:0];
    uint64_t v8 = [EKEventDetailGroup alloc];
    uint64_t v9 = [v7 localizedStringForKey:@"Attachments" value:&stru_1F0CC2140 table:0];
    v68 = [(EKEventDetailGroup *)v8 initWithTag:8 headerTitle:v9];

    v67 = [[EKEventDetailGroup alloc] initWithTag:9 headerTitle:0];
    v66 = [[EKEventDetailGroup alloc] initWithTag:10 headerTitle:0];
    uint64_t v10 = [EKEventDetailGroup alloc];
    v57 = v7;
    long long v11 = v7;
    long long v12 = v6;
    long long v13 = [v11 localizedStringForKey:@"Notes" value:&stru_1F0CC2140 table:0];
    v65 = [(EKEventDetailGroup *)v10 initWithTag:11 headerTitle:v13];

    v64 = [[EKEventDetailGroup alloc] initWithTag:12 headerTitle:0];
    v63 = [[EKEventDetailGroup alloc] initWithTag:13 headerTitle:0];
    v62 = [[EKEventDetailGroup alloc] initWithTag:14 headerTitle:0];
    v56 = [[EKEventDetailGroup alloc] initWithTag:15 headerTitle:0];
    [(EKEventTitleDetailItem *)self->_titleItem setHidesTopSeparator:1];
    [(EKEventTitleDetailItem *)self->_titleItem setHidesBottomSeparator:0];
    if ([v4 count])
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0x1EC548000;
      id v16 = &OBJC_IVAR___EKUIAvailabilityViewController__topSpacer;
      v55 = v4;
      while (1)
      {
        uint64_t v17 = [v4 objectAtIndexedSubscript:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(EKEventViewControllerDefaultImpl *)self allowsCalendarPreview]
            && [(EKEventViewControllerDefaultImpl *)self calendarPreviewIsInlineDayView]&& [(EKEventTitleDetailItem *)v17 configureWithCalendar:v78 preview:*((unsigned __int8 *)&self->super.super.super.isa + v16[449])])
          {
            int v18 = v16;
            uint64_t v19 = v15;
            __int16 v20 = v12;
            id v21 = [v5 lastObject];
            titleItem = self->_titleItem;

            [v5 addObject:v17];
            [(EKEventTitleDetailItem *)v17 setCellPosition:2];
            [(EKEventTitleDetailItem *)v17 setInlineDayViewRespectsSelectedCalendarsFilter:[(EKEventViewControllerDefaultImpl *)self inlineDayViewRespectsSelectedCalendarsFilter]];
            if (v21 == titleItem) {
              [(EKEventTitleDetailItem *)self->_titleItem setHidesBottomSeparator:1];
            }
            [(EKEventTitleDetailItem *)v17 setHideBottomSeparator:[(EKEventViewControllerDefaultImpl *)self _reminderMode]];
            long long v12 = v20;
            uint64_t v4 = v55;
            uint64_t v15 = v19;
            id v16 = v18;
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if ([(EKEventTitleDetailItem *)v17 configureWithCalendar:v78 preview:*((unsigned __int8 *)&self->super.super.super.isa + v16[449])])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([(EKEventViewControllerDefaultImpl *)self allowsEditing])
            {
              [v75 addObject:v17];
              [(EKEventTitleDetailItem *)v17 setCellPosition:5];
            }
LABEL_21:
            uint64_t v24 = v17;
            uint64_t v25 = 5;
LABEL_24:
            [(EKEventTitleDetailItem *)v24 setCellPosition:v25];
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v5 addObject:v17];
            uint64_t v24 = v17;
            uint64_t v25 = 2;
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![(EKEventViewControllerDefaultImpl *)self allowsEditing]
              || ![(EKEvent *)self->_event allowsAvailabilityModifications])
            {
              goto LABEL_25;
            }
LABEL_38:
            if ([(EKEventViewControllerDefaultImpl *)self _backingEventAllowsEditing]) {
              goto LABEL_25;
            }
            double v23 = v75;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (![(EKEventViewControllerDefaultImpl *)self allowsEditing]
                || ![(EKEvent *)self->_event allowsPrivacyLevelModifications])
              {
                goto LABEL_25;
              }
              goto LABEL_38;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (![(EKEventViewControllerDefaultImpl *)self allowsEditing]
                || ![(EKEvent *)self->_event allowsTravelTimeModifications])
              {
                goto LABEL_25;
              }
              goto LABEL_38;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v74 addObject:v17];
              uint64_t v24 = v17;
              uint64_t v25 = 4;
              goto LABEL_24;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = 0x1EC548000;
              if (![(EKEventViewControllerDefaultImpl *)self allowsEditing]) {
                goto LABEL_21;
              }
              uint64_t v26 = [(EKEventViewControllerDefaultImpl *)self event];
              int v52 = [v26 allowsProposedTimeModifications];

              if (!v52) {
                goto LABEL_21;
              }
              double v23 = v5;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                BOOL v27 = [v5 lastObject];
                v53 = v12;
                BOOL v28 = self->_titleItem;

                [v5 addObject:v17];
                [(EKEventTitleDetailItem *)v17 setCellPosition:5];
                BOOL v29 = v27 == v28;
                long long v12 = v53;
                uint64_t v15 = 0x1EC548000;
                if (!v29) {
                  goto LABEL_25;
                }
                CGFloat v30 = self->_titleItem;
                goto LABEL_50;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v5 addObject:v17];
                uint64_t v31 = [(EKEventViewControllerDefaultImpl *)self event];
                uint64_t v15 = 0x1EC548000;
                if ([v31 isAllDay]
                  && [(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode])
                {
                  int v32 = CUIKCurrentLocaleRequiresIndianLanguageAdjustments();
                  id v33 = v31;
                  int v34 = v32;

                  if (v34) {
                    uint64_t v25 = 5;
                  }
                  else {
                    uint64_t v25 = 1;
                  }
                }
                else
                {

                  uint64_t v25 = 1;
                }
                uint64_t v24 = v17;
                goto LABEL_24;
              }
              objc_opt_class();
              uint64_t v15 = 0x1EC548000;
              if (objc_opt_isKindOfClass())
              {
                event = self->_event;
                reminder = self->_reminder;
                uint64_t v36 = [(EKEvent *)event eventStore];
                CGRect v37 = event;
                v38 = (void *)v36;
                -[EKEventTitleDetailItem setEvent:reminder:store:](v17, "setEvent:reminder:store:", v37, reminder);

                [v5 addObject:v17];
                uint64_t v24 = v17;
                uint64_t v25 = 1;
                goto LABEL_24;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();
                  [v5 addObject:v17];
                  [(EKEventTitleDetailItem *)v17 setCellPosition:1];
                  if (isKindOfClass)
                  {
                    if ([(EKEventViewControllerDefaultImpl *)self minimalMode]) {
                      uint64_t v40 = [(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode] ^ 1;
                    }
                    else {
                      uint64_t v40 = 0;
                    }
                    [(EKEventTitleDetailItem *)v17 setShowExtraSpaceAtBottom:v40];
                  }
                  goto LABEL_25;
                }
                [v5 addObject:v17];
                [(EKEventTitleDetailItem *)v17 setCellPosition:1];
                CGFloat v30 = v17;
LABEL_50:
                [(EKEventTitleDetailItem *)v30 setHidesBottomSeparator:1];
                goto LABEL_25;
              }
              double v23 = v61;
            }
          }
LABEL_16:
          [v23 addObject:v17];
          goto LABEL_21;
        }
LABEL_25:

        if (++v14 >= (unint64_t)[v4 count]) {
          goto LABEL_70;
        }
      }
      if (![(EKEventViewControllerDefaultImpl *)self allowsCalendarPreview]
        || [(EKEventViewControllerDefaultImpl *)self calendarPreviewIsInlineDayView]
        || ![(EKEventTitleDetailItem *)v17 configureWithCalendar:v78 preview:*((unsigned __int8 *)&self->super.super.super.isa + v16[449])])
      {
        goto LABEL_25;
      }
      double v23 = v76;
      goto LABEL_16;
    }
LABEL_70:
    uint64_t v41 = [v5 lastObject];
    if (v41)
    {
      v42 = (void *)v41;
      v43 = [v5 lastObject];
      objc_opt_class();
      char v44 = objc_opt_isKindOfClass();

      if (v44)
      {
        v45 = [v5 lastObject];
        [v45 setShowExtraSpaceAtBottom:1];
      }
    }
    v46 = v76;
    if ([v5 count])
    {
      uint64_t v47 = [v5 count];
      v48 = [v5 objectAtIndex:0];
      v49 = v48;
      if (v47 == 1)
      {
        uint64_t v50 = 5;
      }
      else
      {
        [v48 setCellPosition:1];

        v48 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 1);
        v49 = v48;
        uint64_t v50 = 4;
      }
      [v48 setCellPosition:v50];
    }
    if ([v5 count])
    {
      [(EKEventDetailGroup *)v71 setItems:v5];
      [(NSArray *)v77 addObject:v71];
    }
    if ([v75 count])
    {
      [(EKEventDetailGroup *)v70 setItems:v75];
      v46 = v76;
      [(NSArray *)v77 addObject:v70];
    }
    if ([v73 count])
    {
      [(EKEventDetailGroup *)v69 setItems:v73];
      v46 = v76;
      [(NSArray *)v77 addObject:v69];
    }
    if ([v60 count])
    {
      [(EKEventDetailGroup *)v68 setItems:v60];
      v46 = v76;
      [(NSArray *)v77 addObject:v68];
    }
    if ([v46 count])
    {
      [(EKEventDetailGroup *)v64 setItems:v46];
      [(NSArray *)v77 addObject:v64];
    }
    if ([v59 count])
    {
      [(EKEventDetailGroup *)v67 setItems:v59];
      [(NSArray *)v77 addObject:v67];
    }
    if ([v58 count])
    {
      [(EKEventDetailGroup *)v66 setItems:v58];
      [(NSArray *)v77 addObject:v66];
    }
    if ([v12 count])
    {
      [(EKEventDetailGroup *)v65 setItems:v12];
      [(NSArray *)v77 addObject:v65];
    }
    if ([v72 count])
    {
      [(EKEventDetailGroup *)v63 setItems:v72];
      [(NSArray *)v77 addObject:v63];
    }
    if ([v74 count])
    {
      [(EKEventDetailGroup *)v62 setItems:v74];
      [(NSArray *)v77 addObject:v62];
    }
    if ([v61 count])
    {
      [(EKEventDetailGroup *)v56 setItems:v61];
      [(NSArray *)v77 addObject:v56];
    }
    currentSections = self->_currentSections;
    self->_currentSections = v77;
  }
}

- (BOOL)_isDisplayingSuggestion
{
  BOOL v2 = [(EKEvent *)self->_event calendar];
  BOOL v3 = [v2 type] == 5;

  return v3;
}

- (BOOL)_isDisplayingDeletableEvent
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (([WeakRetained conformsToProtocol:&unk_1F0D6D6D8] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v5 = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_5:
    int v9 = 1;
    goto LABEL_6;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  int v8 = [v7 eventViewControllerShouldHideDeleteButton];

  int v9 = v8 ^ 1;
LABEL_6:
  uint64_t v10 = [(EKEvent *)self->_event calendar];
  if ([v10 allowsContentModifications]
    && ([(EKEvent *)self->_event isPrivateEventSharedToMe] & 1) == 0)
  {
    if (self->_minimalMode) {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = 0;
  }

  if ([(EKEventViewControllerDefaultImpl *)self _reminderMode])
  {
    if ([(EKEvent *)self->_event CUIK_reminderShouldBeEditable] & v9) {
      return 1;
    }
  }
  else if (v9)
  {
    return 1;
  }
  if ([(EKEvent *)self->_event status] != EKEventStatusCanceled) {
    return 0;
  }
  long long v12 = [(EKEvent *)self->_event calendar];
  long long v13 = [v12 source];
  if ([v13 isDelegate])
  {
    uint64_t v14 = [(EKEvent *)self->_event calendar];
    uint64_t v15 = [v14 source];
    char v11 = [v15 isWritable];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_isDisplayingInvitation
{
  int v3 = [(EKEventViewControllerDefaultImpl *)self allowsInviteResponses];
  if (v3)
  {
    event = self->_event;
    LOBYTE(v3) = [(EKEvent *)event allowsParticipationStatusModifications];
  }
  return v3;
}

- (BOOL)_isDisplayingSelfOrganizedInvitation
{
  return [(EKEvent *)self->_event isSelfOrganizedInvitation];
}

- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage
{
  if ([(EKEventViewControllerDefaultImpl *)self showsOutOfDateMessage]
    || [(EKEventViewControllerDefaultImpl *)self showsDelegatorMessage])
  {
    return 1;
  }

  return [(EKEventViewControllerDefaultImpl *)self showsDelegateMessage];
}

- (void)_updateHeaderAndFooterIfNeeded
{
  if (![(EKEventViewControllerDefaultImpl *)self isViewLoaded]) {
    return;
  }
  if (![(EKEventViewControllerDefaultImpl *)self _shouldDisplayDelegateOrOutOfDateMessage])
  {
    if (!self->_blankFooterView)
    {
      char v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      blankFooterView = self->_blankFooterView;
      self->_blankFooterView = v6;
    }
    if (!self->_showingBlankFooterView)
    {
      int v8 = self->_blankFooterView;
      int v9 = [(EKEventViewControllerDefaultImpl *)self tableView];
      [v9 setTableFooterView:v8];

      self->_showingBlankFooterView = 1;
    }
    goto LABEL_18;
  }
  if ([(EKEventViewControllerDefaultImpl *)self showsOutOfDateMessage])
  {
    int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    id v5 = @"This invitation data is out of date.";
  }
  else if ([(EKEventViewControllerDefaultImpl *)self showsDelegatorMessage])
  {
    int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    id v5 = @"This invitation is managed by your delegate.";
  }
  else
  {
    if (![(EKEventViewControllerDefaultImpl *)self showsDelegateMessage])
    {
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    id v5 = @"You are being notified of this event because you are a delegate of an invitee.";
  }
  uint64_t v10 = [v3 localizedStringForKey:v5 value:&stru_1F0CC2140 table:0];

LABEL_14:
  char v11 = [(EKEventViewControllerDefaultImpl *)self _footerLabelContainingText:v10];
  [v11 frame];
  double v13 = v12 + 15.0;
  uint64_t v14 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v15 = v11;
  id v16 = objc_msgSend([v14 alloc], "initWithFrame:", 0.0, 0.0, 100.0, v13);
  [v16 addSubview:v15];

  uint64_t v17 = [(EKEventViewControllerDefaultImpl *)self view];
  [v17 bounds];
  double v19 = v18;
  __int16 v20 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v20 rowHeight];
  double v22 = v21;

  if (v13 >= v22) {
    double v23 = v13;
  }
  else {
    double v23 = v22;
  }
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v19, v23);

  uint64_t v24 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v24 setTableFooterView:v16];

  self->_showingBlankFooterView = 0;
LABEL_18:
  id v28 = [(EKEventViewControllerDefaultImpl *)self event];
  if ([v28 couldBeJunk])
  {
  }
  else
  {
    BOOL v25 = [(UIView *)self->_headerView isHidden];

    if (!v25)
    {
      [(UIView *)self->_headerView setHidden:1];
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_headerConstraints];
      uint64_t v26 = (void *)MEMORY[0x1E4F28DC8];
      tableViewTopConstraints = self->_tableViewTopConstraints;
      [v26 activateConstraints:tableViewTopConstraints];
    }
  }
}

- (id)_footerLabelContainingText:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setText:v5];

  id v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [v6 setFont:v7];

  int v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v6 setTextColor:v8];

  int v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v9];

  [v6 setNumberOfLines:0];
  double v10 = EKUIContainedControllerIdealWidth();
  self->_lastFooterLayoutWidth = v10;
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v10 + -30.0, 1.79769313e308);
  [v6 sizeToFit];
  [v6 frame];
  objc_msgSend(v6, "setFrame:", 15.0, v11 + 6.0);

  return v6;
}

- (void)_setUpForEvent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(EKEventViewControllerDefaultImpl *)self _prepareEventForEdit];
  int v3 = [(EKEventViewControllerDefaultImpl *)self items];
  [v3 makeObjectsPerformSelector:sel_setDelegate_ withObject:self];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        event = self->_event;
        reminder = self->_reminder;
        double v12 = [(EKEvent *)event eventStore];
        [v9 setEvent:event reminder:reminder store:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  double v13 = [(EKEvent *)self->_event calendar];
  [(EKEventViewControllerDefaultImpl *)self _configureItemsForStoreConstraintsGivenCalendar:v13];

  [(EKEventViewControllerDefaultImpl *)self _updateHeaderAndFooterIfNeeded];
  [(EKEventViewControllerDefaultImpl *)self _updateStatusButtonsActions];
  [(EKEventViewControllerDefaultImpl *)self _updateResponseVisibility];
}

- (id)_statusButtonsView
{
  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    uint64_t v4 = [EKUIEventStatusButtonsView alloc];
    uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self statusButtons];
    uint64_t v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setDisableButtonHighlights:[(EKEventViewControllerDefaultImpl *)self _isDisplayingInvitation] ^ 1];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTextSizeMode:1];
    statusButtonsView = self->_statusButtonsView;
  }

  return statusButtonsView;
}

- (id)_statusButtonsContainerView
{
  statusButtonsContainerView = self->_statusButtonsContainerView;
  if (!statusButtonsContainerView)
  {
    uint64_t v4 = [SingleToolbarItemContainerView alloc];
    uint64_t v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    [(SingleToolbarItemContainerView *)self->_statusButtonsContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    statusButtonsContainerView = self->_statusButtonsContainerView;
  }

  return statusButtonsContainerView;
}

- (void)_updateStatusButtonsActions
{
  id v3 = [(EKEventViewControllerDefaultImpl *)self statusButtons];
  [(EKUIEventStatusButtonsView *)self->_statusButtonsView setActions:v3];
}

- (void)_notifyDetailItemsOfVisibilityOnScreen
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = self->_currentSections;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(UITableView *)self->_tableView indexPathsForVisibleRows];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", [v9 section]);
        double v11 = objc_msgSend(v10, "itemAtIndex:", objc_msgSend(v9, "row"));
        double v12 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
        [v11 eventViewController:v12 tableViewDidScroll:self->_tableView];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)doneButtonTapped
{
  id v3 = [(EKEventTitleDetailItem *)self->_titleItem sourceViewForPopover];
  [(EKEventViewControllerDefaultImpl *)self _doneButtonTapped:v3];
}

- (void)_doneButtonTapped:(id)a3
{
  id v4 = a3;
  if (!self->_recurrenceAlertController)
  {
    selectedEditItem = self->_selectedEditItem;
    id v8 = v4;
    if (!selectedEditItem
      || (BOOL v6 = [(EKEventDetailItem *)selectedEditItem saveAndDismissWithForce:0],
          id v4 = v8,
          v6))
    {
      if ([(EKEvent *)self->_event hasChanges])
      {
        if ([(EKEvent *)self->_event requiresDetach])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(EKEventViewControllerDefaultImpl *)self _presentDetachSheetFromBarButtonItem:v8];
          }
          else
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            id v4 = v8;
            if ((isKindOfClass & 1) == 0) {
              goto LABEL_13;
            }
            [(EKEventViewControllerDefaultImpl *)self _presentDetachSheetFromView:v8];
          }
        }
        else
        {
          [(EKEventViewControllerDefaultImpl *)self _performSave:0 animated:1];
        }
      }
      else
      {
        [(EKEventViewControllerDefaultImpl *)self completeWithAction:0];
      }
      id v4 = v8;
    }
  }
LABEL_13:
}

- (void)editButtonTapped
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      int v9 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      char v10 = [v8 eventViewControllerEditButtonTemporarilyDisabled:v9];

      if (v10) {
        return;
      }
    }
  }
  id v11 = objc_loadWeakRetained((id *)p_delegate);
  if (v11)
  {
    double v12 = v11;
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)p_delegate);
      [v15 performSelector:sel_eventViewControllerWillBeginEditingEvent_ withObject:self];
    }
  }
  id v16 = objc_loadWeakRetained((id *)p_delegate);
  if (([v16 conformsToProtocol:&unk_1F0D6D6D8] & 1) == 0)
  {

LABEL_12:
    double v22 = +[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:self->_event creationMethod:0 eventEditViewDelegate:self];
    [(EKEventViewControllerDefaultImpl *)self setActiveEventEditor:v22];

    goto LABEL_13;
  }
  id v17 = objc_loadWeakRetained((id *)p_delegate);
  char v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0) {
    goto LABEL_12;
  }
  id v19 = objc_loadWeakRetained((id *)p_delegate);
  __int16 v20 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  char v21 = [v19 eventViewDelegateShouldCreateOwnEditViewController:v20];

  if ((v21 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_13:

  [(EKEventViewControllerDefaultImpl *)self presentEditorAnimated:1];
}

- (id)activeEventEditor
{
  return self->_activeEventEditor;
}

- (void)setActiveEventEditor:(id)a3
{
  id v4 = a3;
  [v4 setInternalEditViewDelegate:self];
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self view];
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
  {
    id v6 = [(EKEventViewControllerDefaultImpl *)self view];
    BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

    if (IsRegular) {
      [v4 setModalPresentationStyle:3];
    }
  }
  else
  {
  }
  id v8 = [(EKEventViewControllerDefaultImpl *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "setModalPresentationStyle:", objc_msgSend(WeakRetained, "editorPresentationStyle"));
  }
  activeEventEditor = self->_activeEventEditor;
  self->_activeEventEditor = (EKEventOrIntegrationEditView *)v4;
}

- (void)presentEditorAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  char v18 = self->_activeEventEditor;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![WeakRetained conformsToProtocol:&unk_1F0D6D6D8]) {
    goto LABEL_6;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  int v10 = [v8 eventViewDelegateShouldHandlePresentationOfEditViewController:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    double v12 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [v11 eventViewController:v12 requestsDisplayOfEditViewController:v18 animated:v3];

LABEL_12:
    goto LABEL_13;
  }
LABEL_7:
  if (v18)
  {
    if (v3
      && (uint64_t v3 = [(EKEventViewControllerDefaultImpl *)self editorShowTransition], v3 == 8))
    {
      id v11 = [(EKEventViewControllerDefaultImpl *)self _viewControllerForEditorPresentation];
      [v11 presentViewController:v18 animated:1 completion:0];
    }
    else
    {
      id v11 = [(EKEventViewControllerDefaultImpl *)self _viewControllerForEditorPresentation];
      [v11 presentModalViewController:v18 withTransition:v3];
    }
    goto LABEL_12;
  }
LABEL_13:
  id v13 = objc_loadWeakRetained((id *)p_delegate);
  if (v13)
  {
    char v14 = v13;
    id v15 = objc_loadWeakRetained((id *)p_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)p_delegate);
      [v17 performSelector:sel_eventViewControllerDidBeginEditingEventWithEditViewController_ withObject:v18];
    }
  }
}

- (id)_viewControllerForEditorPresentation
{
  uint64_t v3 = [(EKEventViewControllerDefaultImpl *)self navigationController];

  if (v3)
  {
    id v4 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4
{
  [(EKEvent *)self->_event setParticipationStatus:a3];
  [(EKEvent *)self->_event setInvitationStatus:0];

  [(EKEventViewControllerDefaultImpl *)self _performSave:a4 animated:1];
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  id v6 = [(UIResponder *)self EKUI_editor];
  event = self->_event;
  id v14 = 0;
  char v8 = [v6 saveEvent:event span:a3 error:&v14];
  id v9 = v14;
  int v10 = v9;
  if ((v8 & 1) == 0 && v9)
  {
    id v11 = [v9 domain];
    if (v11 != (void *)*MEMORY[0x1E4F25338])
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v12 = [v10 code];

    if (v12 == 1010)
    {
      id v11 = [(EKEvent *)self->_event eventStore];
      [v11 rollback];
      goto LABEL_6;
    }
  }
LABEL_7:
  [(EKEventViewControllerDefaultImpl *)self completeWithAction:1];

  return 1;
}

- (void)_presentValidationAlert:(id)a3
{
}

- (void)_performDelete:(int64_t)a3 editor:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F25540];
  id v7 = a4;
  char v8 = [v6 sharedInstance];
  [v8 handleEventDeletion:self->_event];

  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_event];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__EKEventViewControllerDefaultImpl__performDelete_editor___block_invoke;
  v10[3] = &unk_1E608A470;
  v10[4] = self;
  [v7 deleteEvents:v9 span:a3 result:v10];
}

void __58__EKEventViewControllerDefaultImpl__performDelete_editor___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) completeWithAction:2];
  }
  else
  {
    id v6 = [v5 domain];
    id v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E4F25338])
    {
      uint64_t v8 = [v10 code];

      if (v8 == 1010)
      {
        id v9 = [*(id *)(*(void *)(a1 + 32) + 984) eventStore];
        [v9 rollback];
      }
    }
    else
    {
    }
  }
}

- (void)performAddToCalendar
{
  if ([(EKEventViewControllerDefaultImpl *)self isICSPreview]
    && [(EKEventViewControllerDefaultImpl *)self showsAddToCalendarForICSPreview])
  {
    [(EKEventViewControllerDefaultImpl *)self _addToCalendarClicked:self];
  }
}

- (CGSize)preferredContentSize
{
  if (self->_activeEventEditor)
  {
    activeEventEditor = self->_activeEventEditor;
    [(EKEventOrIntegrationEditView *)activeEventEditor preferredContentSize];
  }
  else if (self->_currentEditItem)
  {
    id v5 = [(EKEventDetailItem *)self->_currentEditItem viewController];
    [v5 preferredContentSize];
    double v7 = v6;
    double v9 = v8;

    double v3 = v7;
    double v4 = v9;
  }
  else
  {
    [(EKEventViewControllerDefaultImpl *)self _idealSize];
  }
  result.double height = v4;
  result.width = v3;
  return result;
}

- (double)tableViewSectionContentWidth
{
  double v3 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v6 _sectionContentInset];
  double v8 = v7;
  double v10 = v9;

  return v5 - (v8 + v10);
}

- (void)viewLayoutMarginsDidChange
{
  v15.receiver = self;
  v15.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v15 viewLayoutMarginsDidChange];
  [(EKEventViewControllerDefaultImpl *)self preferredContentSize];
  -[EKEventViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
  [(EKEventViewControllerDefaultImpl *)self tableViewSectionContentWidth];
  double v4 = v3;
  if (v3 < 1.0)
  {
    [(EKEventViewControllerDefaultImpl *)self preferredContentSize];
    double v4 = v5;
  }
  if (v4 >= 1.0)
  {
    double v6 = [(EKEventViewControllerDefaultImpl *)self tableView];
    uint64_t v7 = [v6 numberOfSections];

    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        double v9 = [(EKEventViewControllerDefaultImpl *)self tableView];
        uint64_t v10 = [v9 numberOfRowsInSection:i];

        if (v10)
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:j inSection:i];
            id v13 = [(EKEventViewControllerDefaultImpl *)self tableView];
            id v14 = [(EKEventViewControllerDefaultImpl *)self tableView:v13 cellForRowAtIndexPath:v12];

            [(id)objc_opt_class() adjustLayoutForCell:v14 tableViewWidth:v10 numRowsInSection:j cellRow:1 forceLayout:v4];
          }
        }
      }
    }
  }
}

- (void)setPresentationSourceViewController:(id)a3
{
}

- (UIViewController)presentationSourceViewController
{
  presentationSourceViewController = self->_presentationSourceViewController;
  if (presentationSourceViewController
    && ([(UIViewController *)presentationSourceViewController view],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 window],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    double v6 = self->_presentationSourceViewController;
  }
  else
  {
    uint64_t v7 = [(EKEventViewControllerDefaultImpl *)self navigationController];

    if (v7)
    {
      double v6 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    }
    else
    {
      double v6 = self;
    }
  }

  return (UIViewController *)v6;
}

- (id)presentationNavigationDelegate
{
  p_navigationDelegate = &self->_navigationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    double v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    double v5 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
  }

  return v5;
}

- (void)_presentDetachSheetFromBarButtonItem:(id)a3
{
  id v4 = a3;
  id v8 = [(EKEventViewControllerDefaultImpl *)self _detachSheetHandler];
  double v5 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
  double v6 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:0 viewController:v5 barButtonItem:v4 forEvent:self->_event withCompletionHandler:v8];

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v6;
}

- (void)_presentDetachSheetFromView:(id)a3
{
  id v4 = a3;
  id v8 = [(EKEventViewControllerDefaultImpl *)self _detachSheetHandler];
  double v5 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
  [v4 bounds];
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v5, v4, self->_event, v8);
  double v6 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v6;
}

- (id)_detachSheetHandler
{
  BOOL v2 = self->_pendingStatus == 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__EKEventViewControllerDefaultImpl__detachSheetHandler__block_invoke;
  v7[3] = &unk_1E6089588;
  char v3 = !v2;
  v7[4] = self;
  char v8 = v3;
  id v4 = _Block_copy(v7);
  double v5 = _Block_copy(v4);

  return v5;
}

void __55__EKEventViewControllerDefaultImpl__detachSheetHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
    case 2:
      goto LABEL_3;
    case 3:
      [*(id *)(a1 + 32) _updateResponse];
      goto LABEL_7;
    case 4:
    case 5:
      return;
    default:
      a2 = 0;
LABEL_3:
      char v3 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 40)) {
        [v3 _saveStatus:v3[132] span:a2];
      }
      else {
        [v3 _performSave:a2 animated:1];
      }
LABEL_7:
      uint64_t v4 = *(void *)(a1 + 32);
      double v5 = *(void **)(v4 + 1072);
      *(void *)(v4 + 1072) = 0;

      return;
  }
}

- (void)eventDetailItemAccessoryButtonTapped:(id)a3
{
  id v10 = a3;
  if ([(EKEventViewControllerDefaultImpl *)self allowsSubitems])
  {
    uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [v10 eventViewControllerDidTapInfoButton:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      double v6 = WeakRetained;
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_delegate);
        [v9 performSelector:sel_eventViewControllerDidReceiveEditUserInteraction_ withObject:self];
      }
    }
  }
}

- (void)eventDetailItemWantsRefeshForHeightChange
{
  if (self->_needsReload)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadIfNeeded object:0];
    [(EKEventViewControllerDefaultImpl *)self _reloadIfNeeded];
  }
  else
  {
    char v3 = [(EKEventViewControllerDefaultImpl *)self tableView];
    [v3 beginUpdates];

    uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self tableView];
    [v4 endUpdates];
  }
  [(EKEventViewControllerDefaultImpl *)self preferredContentSize];

  -[EKEventViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)eventItemDidStartEditing:(id)a3
{
}

- (void)eventItemDidSave:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    double v5 = [(EKEvent *)self->_event calendar];
    [(EKEventViewControllerDefaultImpl *)self _configureItemsForStoreConstraintsGivenCalendar:v5];

    [(UIResponder *)self EKUI_setDataOwnersFromEvent:self->_event];
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    [(EKEventViewControllerDefaultImpl *)self reloadReminderWithEKEvent:self->_event];
    [(EKEventViewControllerDefaultImpl *)self _setUpForEvent];
  }
  id v7 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v7 reloadData];
}

- (void)eventItemDidCommit:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [WeakRetained eventViewControllerModifiedEventWithoutEditing:v4];
  }
}

- (void)eventDetailItemWantsRefresh:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  currentSections = self->_currentSections;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke;
  v13[3] = &unk_1E608A4C0;
  objc_super v15 = &v17;
  id v6 = v4;
  id v14 = v6;
  char v16 = &v21;
  [(NSArray *)currentSections enumerateObjectsUsingBlock:v13];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "Event detail item to reload (%@) not found", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [v6 numberOfSubitems];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v11 = [MEMORY[0x1E4F28D58] indexPathForRow:i + v18[3] inSection:v22[3]];
        [v9 addObject:v11];
      }
    }
    uint64_t v12 = [(EKEventViewControllerDefaultImpl *)self tableView];
    [v12 reloadRowsAtIndexPaths:v9 withRowAnimation:0];
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  id v7 = [a2 items];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke_2;
  v8[3] = &unk_1E608A498;
  id v9 = *(id *)(a1 + 32);
  uint64_t v11 = a3;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v7 enumerateObjectsUsingBlock:v8];

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke_2(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = result;
  if (*(void **)(result + 32) == a2)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(result + 56);
    *a4 = 1;
  }
  else
  {
    CGSize result = [a2 numberOfSubitems];
    *(void *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) += result;
  }
  return result;
}

- (void)eventItemDidEndEditing:(id)a3
{
  currentEditItem = self->_currentEditItem;
  self->_currentEditItem = 0;
}

- (void)eventItem:(id)a3 wantsViewControllerPresented:(id)a4
{
  id v5 = a4;
  id v6 = +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:self];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4
{
  activeEventEditor = self->_activeEventEditor;
  if (!activeEventEditor) {
    return;
  }
  BOOL v6 = a4;
  if ([(EKEventOrIntegrationEditView *)activeEventEditor isBeingDismissed]) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (uint64_t v8 = WeakRetained,
        id v9 = objc_loadWeakRetained((id *)&self->_delegate),
        int v10 = [v9 conformsToProtocol:&unk_1F0D6D6D8],
        v9,
        v8,
        v10))
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      [v13 eventViewControllerWillFinishEditingEvent:v14 deleted:v6];
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    uint64_t v17 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v16)
    {
      char v18 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      [v17 eventViewController:v18 requestsDismissalOfEditViewController:self->_activeEventEditor];
    }
    else
    {
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        id v21 = objc_loadWeakRetained((id *)&self->_delegate);
        double v22 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
        [v21 eventViewController:v22 willDismissEditViewController:self->_activeEventEditor deleted:v6];
      }
      uint64_t v23 = [(EKEventOrIntegrationEditView *)self->_activeEventEditor presentingViewController];
      objc_msgSend(v23, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerDefaultImpl editorHideTransition](self, "editorHideTransition"), 0);

      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      char v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0) {
        goto LABEL_12;
      }
      uint64_t v17 = objc_loadWeakRetained((id *)&self->_delegate);
      id v26 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      [v17 eventViewController:v26 didDismissEditViewController:self->_activeEventEditor deleted:v6];
    }
  }
  else
  {
    uint64_t v17 = [(EKEventOrIntegrationEditView *)self->_activeEventEditor presentingViewController];
    objc_msgSend(v17, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerDefaultImpl editorHideTransition](self, "editorHideTransition"), 0);
  }

LABEL_12:
  [(EKEventOrIntegrationEditView *)self->_activeEventEditor setInternalEditViewDelegate:0];
  uint64_t v19 = self->_activeEventEditor;
  self->_activeEventEditor = 0;
}

- (void)fullReloadWithNewEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKEventViewControllerDefaultImpl *)self setEvent:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        reminder = self->_reminder;
        char v12 = objc_msgSend(v4, "eventStore", (void)v15);
        [v10 setEvent:v4 reminder:reminder store:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [(EKEvent *)self->_event calendar];
  [(EKEventViewControllerDefaultImpl *)self _configureItemsForStoreConstraintsGivenCalendar:v13];

  [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
  id v14 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v14 reloadData];
}

- (BOOL)eventDetailItemShouldPresentShareSheet:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v8 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  char v9 = [v7 eventViewControllerShouldPresentShareSheet:v8];

  return v9;
}

- (void)eventDetailItem:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    id v11 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [v10 eventViewController:v11 requestPresentShareSheetWithActivityItems:v12 withPopoverSourceView:v7];
  }
}

- (void)_eventEditViewControllerDidCompleteWithAction:(int64_t)a3
{
  if (a3 == 2)
  {
    -[EKEventViewControllerDefaultImpl completeWithAction:](self, "completeWithAction:");
  }
  else
  {
    [(EKEventViewControllerDefaultImpl *)self setNeedsReload];
    [(EKEventViewControllerDefaultImpl *)self _dismissEditor:1 deleted:0];
    if (a3 == 1)
    {
      id v5 = [(EKEvent *)self->_event calendar];
      [(EKEventViewControllerDefaultImpl *)self _configureItemsForStoreConstraintsGivenCalendar:v5];

      id v6 = [(EKEventViewControllerDefaultImpl *)self tableView];
      [v6 reloadData];
    }
  }
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  long long v15 = (EKEventEditViewController *)a3;
  uint64_t v8 = (void (**)(id, id))a5;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      v8[2](v8, v11);
    }
    else
    {
      v8[2](v8, self);
    }
  }
  if (self->_editViewControllerForPasteboard == v15)
  {
    id v12 = [(EKEventEditViewController *)v15 presentingViewController];
    [v12 dismissViewControllerAnimated:1 completion:0];

    editViewControllerForPasteboard = self->_editViewControllerForPasteboard;
    self->_editViewControllerForPasteboard = 0;

    strongSelf = self->_strongSelf;
    self->_strongSelf = 0;
  }
  else
  {
    [(EKEventViewControllerDefaultImpl *)self _eventEditViewControllerDidCompleteWithAction:a4];
  }
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  id v4 = [(EKEventViewControllerDefaultImpl *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [WeakRetained pasteboardManager];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)attemptDisplayReviewPrompt
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (void)_prepareEventForEdit
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(EKEvent *)self->_event calendar];

  if (!v3)
  {
    event = self->_event;
    id v5 = [(EKEvent *)event eventStore];
    id v6 = [v5 defaultCalendarForNewEvents];
    [(EKEvent *)event setCalendar:v6];
  }
  id v7 = [(EKEvent *)self->_event startDate];

  if (!v7) {
    [(id)objc_opt_class() setDefaultDatesForEvent:self->_event];
  }
  uint64_t v8 = self->_event;
  v10[0] = *MEMORY[0x1E4F57188];
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(EKEvent *)v8 prefetchAttendeesWithAdditionalProperties:v9];
}

- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(a4, "buttonForAction:");
  id v7 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "EKEventViewController invoking action: %ld", (uint8_t *)&v10, 0xCu);
  }
  if (a3 <= 4095)
  {
    if (a3 <= 15)
    {
      uint64_t v8 = 2;
      switch(a3)
      {
        case 1:
          goto LABEL_25;
        case 2:
          uint64_t v8 = 4;
          goto LABEL_25;
        case 4:
          uint64_t v8 = 3;
LABEL_25:
          [(EKEventViewControllerDefaultImpl *)self _saveStatus:v8 sourceViewForPopover:v6];
          break;
        case 8:
          goto LABEL_15;
        default:
          goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (a3 != 16)
    {
      if (a3 == 128)
      {
        [(EKEventViewControllerDefaultImpl *)self _deleteSuggestionTapped:self];
      }
      else if (a3 == 2048)
      {
LABEL_15:
        [(EKEventViewControllerDefaultImpl *)self _addToCalendarClicked:self];
      }
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (a3 < 0x10000)
  {
    switch(a3)
    {
      case 0x1000:
        [(EKEventViewControllerDefaultImpl *)self _acceptProposedTimeWithSourceViewForPopover:v6];
        break;
      case 0x2000:
        [(EKEventViewControllerDefaultImpl *)self _rejectProposedTime];
        break;
      case 0x8000:
        [(EKEventViewControllerDefaultImpl *)self _cancelProposedTime];
        break;
    }
  }
  else
  {
    if (a3 >= 0x80000)
    {
      if (a3 != 0x80000 && a3 != 0x100000) {
        goto LABEL_30;
      }
LABEL_22:
      char v9 = [(EKEventViewControllerDefaultImpl *)self _statusButtonsView];
      [(EKEventViewControllerDefaultImpl *)self _deleteClicked:v9];
      goto LABEL_23;
    }
    if (a3 == 0x10000)
    {
      PresentJunkAlertControllerForEvent(self->_event, self);
      goto LABEL_30;
    }
    if (a3 == 0x40000)
    {
      char v9 = [(EKEventViewControllerDefaultImpl *)self _statusButtonsView];
      [(EKEventViewControllerDefaultImpl *)self _unsubscribeClicked:v9];
LABEL_23:
    }
  }
LABEL_30:
}

- (id)_proposedDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v3 = [(EKEventViewControllerDefaultImpl *)self event];
  char v4 = [v3 attendees];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if ([v10 proposedStartDateStatus] == 1
            || ![v10 proposedStartDateStatus])
          {
            int64_t v11 = [(EKEventViewControllerDefaultImpl *)self event];
            uint64_t v12 = [v10 proposedStartDateForEvent:v11];

            if (v12)
            {

              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

- (void)_acceptProposedTimeWithSourceViewForPopover:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self _proposedDate];
  if (v5)
  {
    uint64_t v6 = [(EKEventViewControllerDefaultImpl *)self event];
    uint64_t v7 = [v6 endDateUnadjustedForLegacyClients];
    uint64_t v8 = [v6 startDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    [v6 setStartDate:v5];
    int64_t v11 = [v5 dateByAddingTimeInterval:v10];
    [v6 setEndDateUnadjustedForLegacyClients:v11];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = [v6 attendees];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            [v18 setCommentChanged:0];
            [v18 setStatusChanged:0];
            [v18 setProposedStartDateChanged:0];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v6 dismissAcceptedProposeNewTimeNotification];
    if ([v6 isOrWasPartOfRecurringSeries])
    {
      uint64_t v19 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
      [v4 bounds];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __80__EKEventViewControllerDefaultImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke;
      v22[3] = &unk_1E6088638;
      v22[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v4, v6, v22);
      uint64_t v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v20;
    }
    else
    {
      [(EKEventViewControllerDefaultImpl *)self _performSave:0 animated:0];
    }
  }
}

void __80__EKEventViewControllerDefaultImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) >= 3)
  {
    if (a2 == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = a2 == 1;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 1072);
    *(void *)(v6 + 1072) = 0;

    uint64_t v8 = *(void **)(a1 + 32);
    [v8 _performSave:v5 animated:0];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1072);
    *(void *)(v3 + 1072) = 0;
  }
}

- (void)_rejectProposedTime
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(EKEventViewControllerDefaultImpl *)self event];
  id v4 = [v3 attendees];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          [v10 setCommentChanged:0];
          [v10 setStatusChanged:0];
          [v10 setProposedStartDateChanged:0];
          [v10 setProposedStartDateStatus:3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  int64_t v11 = [(EKEventViewControllerDefaultImpl *)self event];
  if ([v11 isOrWasPartOfRecurringSeries]) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }

  [(EKEventViewControllerDefaultImpl *)self _performSave:v12 animated:0];
}

- (void)_cancelProposedTime
{
  uint64_t v3 = [(EKEventViewControllerDefaultImpl *)self event];
  [v3 setProposedStartDate:0];

  [(EKEventViewControllerDefaultImpl *)self _performSave:0 animated:0];
}

- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v8 = v6;
    if ([(EKEvent *)self->_event responseMustApplyToAll])
    {
      uint64_t v7 = 4;
    }
    else
    {
      if ([(EKEvent *)self->_event isOrWasPartOfRecurringSeries]
        && ([(EKEvent *)self->_event isSignificantlyDetached] & 1) == 0)
      {
        self->_pendingStatus = a3;
        [(EKEventViewControllerDefaultImpl *)self _presentDetachSheetFromView:v8];
        goto LABEL_8;
      }
      uint64_t v7 = 0;
    }
    [(EKEventViewControllerDefaultImpl *)self _saveStatus:a3 span:v7];
LABEL_8:
    id v6 = v8;
  }
}

- (void)_deleteClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self event];
  uint64_t v6 = [v5 status];

  uint64_t v7 = [(UIResponder *)self EKUI_editor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    int v11 = [v9 eventViewDelegateShouldHandlePresentationOfDeleteAlert:v10];
  }
  else
  {
    int v11 = 0;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke;
  aBlock[3] = &unk_1E608A510;
  char v25 = v11;
  aBlock[4] = self;
  id v12 = v7;
  id v24 = v12;
  BOOL v26 = v6 == 3;
  long long v13 = (void (**)(void *, void))_Block_copy(aBlock);
  if (v6 == 3) {
    uint64_t v14 = 5;
  }
  else {
    uint64_t v14 = 4;
  }
  if (v11)
  {
    long long v15 = +[EKUIRecurrenceAlertController deleteAlertWithOptions:v14 forEvent:self->_event stringForDeleteButton:0 withCompletionHandler:v13];
    recurrenceAlertController = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v15;

    if (!self->_recurrenceAlertController)
    {
      v13[2](v13, 0);
      goto LABEL_16;
    }
    long long v17 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v18 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    uint64_t v19 = [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController alertController];
    [v17 eventViewController:v18 requestsDisplayOfDeleteAlert:v19];
  }
  else
  {
    long long v17 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v4 centerButton];
    }
    else
    {
      uint64_t v20 = 0;
    }
    [v20 bounds];
    +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", v14, v17, v20, self->_event, 0, v13);
    id v21 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
    double v22 = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v21;
  }
LABEL_16:
}

void __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v14 = *MEMORY[0x1E4F57A90];
    id v4 = [EKUIEventViewDelegateAlertDisplayer alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1328));
    uint64_t v6 = [(EKUIEventViewDelegateAlertDisplayer *)v4 initWithDelegate:WeakRetained eventViewController:*(void *)(a1 + 32)];
    v15[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke_2;
  v10[3] = &unk_1E608A4E8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v12 = a2;
  v10[4] = v9;
  char v13 = *(unsigned char *)(a1 + 49);
  id v11 = v8;
  [v11 performWithOptions:v7 block:v10];
}

uint64_t __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  if (v1 == 2)
  {
    uint64_t v3 = *(void *)(result + 40);
    id v4 = *(void **)(result + 32);
    uint64_t v2 = 2;
  }
  else if (v1 == 1)
  {
    uint64_t v3 = *(void *)(result + 40);
    id v4 = *(void **)(result + 32);
    uint64_t v2 = 1;
  }
  else
  {
    if (v1) {
      return result;
    }
    uint64_t v2 = 2 * *(unsigned __int8 *)(result + 56);
    uint64_t v3 = *(void *)(result + 40);
    id v4 = *(void **)(result + 32);
  }
  return [v4 _performDelete:v2 editor:v3];
}

- (void)_unsubscribeClicked:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__EKEventViewControllerDefaultImpl__unsubscribeClicked___block_invoke;
  aBlock[3] = &unk_1E6088638;
  aBlock[4] = self;
  uint64_t v5 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  int v9 = [v7 eventViewDelegateShouldHandlePresentationOfDeleteAlert:v8];

  if (!v9)
  {
LABEL_5:
    uint64_t v12 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
    char v13 = [v4 buttonForAction:0x40000];
    [v13 bounds];
    +[EKUIRecurrenceAlertController presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:](EKUIRecurrenceAlertController, "presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:", 4, v12, v13, v5);
    long long v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
    recurrenceAlertController = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v15;
    goto LABEL_6;
  }
  id v10 = +[EKUIRecurrenceAlertController unsubscribeAlertWithOptions:4 withCompletionHandler:v5];
  id v11 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v10;

  uint64_t v12 = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  recurrenceAlertController = [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController alertController];
  [v12 eventViewController:v13 requestsDisplayOfDeleteAlert:recurrenceAlertController];
LABEL_6:
}

void __56__EKEventViewControllerDefaultImpl__unsubscribeClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2 != 3)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 984) calendar];
    id v4 = kEKUILogHandle;
    BOOL v5 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT);
    if (a2 == 5)
    {
      if (v5)
      {
        int v6 = 138412290;
        id v7 = v3;
        _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details, and reporting it as junk", (uint8_t *)&v6, 0xCu);
      }
      [MEMORY[0x1E4F57C38] unsubscribeFromCalendar:v3 reportAsJunk:1];
    }
    else
    {
      if (v5)
      {
        int v6 = 138412290;
        id v7 = v3;
        _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details", (uint8_t *)&v6, 0xCu);
      }
      [MEMORY[0x1E4F57C38] unsubscribeFromCalendar:v3];
    }
  }
}

- (void)_addToCalendarClicked:(id)a3
{
  if ([(EKEventViewControllerDefaultImpl *)self _isDisplayingSuggestion])
  {
    id v4 = [(EKEvent *)self->_event suggestionInfo];
    [v4 setChangedFields:0];

    [(EKEventViewControllerDefaultImpl *)self attemptDisplayReviewPrompt];
    BOOL v5 = [(EKEvent *)self->_event eventStore];
    [v5 acceptSuggestedEvent:self->_event];

    int v6 = (void *)MEMORY[0x1E4F57848];
    id v7 = [(EKEvent *)self->_event suggestionInfo];
    uint64_t v8 = [v7 uniqueIdentifier];
    [v6 logEventConfirmedDetailsWithUniqueKey:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v9 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [WeakRetained eventViewController:v9 didCompleteWithAction:0];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v10) {
      return;
    }
    id v11 = v10;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained performSelector:sel_eventViewControllerDidRequestAddToCalendar_ withObject:self];
  }
}

- (void)_deleteSuggestionTapped:(id)a3
{
  if ([(EKEventViewControllerDefaultImpl *)self _isDisplayingSuggestion])
  {
    id v4 = [(EKEvent *)self->_event suggestionInfo];
    [v4 setChangedFields:0];

    BOOL v5 = (void *)MEMORY[0x1E4F57848];
    int v6 = [(EKEvent *)self->_event suggestionInfo];
    id v7 = [v6 uniqueIdentifier];
    [v5 logEventRejectedDetailsWithUniqueKey:v7];

    uint64_t v8 = [(EKEvent *)self->_event eventStore];
    [v8 deleteSuggestedEvent:self->_event];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v9 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [WeakRetained eventViewController:v9 didCompleteWithAction:2];
  }
}

- (void)_updateResponseVisibility
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if ([(EKEventViewControllerDefaultImpl *)self _shouldDisplayStatusButtons])
  {
    uint64_t v3 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    [v3 setToolbarHidden:0];

    id v4 = [(EKEventViewControllerDefaultImpl *)self toolbarItems];
    if (!v4
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v4, !statusButtonsContainerView))
    {
      int v6 = [(EKEventViewControllerDefaultImpl *)self _statusButtonsContainerView];
      id v7 = [(EKEventViewControllerDefaultImpl *)self _statusButtonsView];
      [v6 addSubview:v7];
      uint64_t v20 = (void *)MEMORY[0x1E4F28DC8];
      char v25 = [v7 leadingAnchor];
      id v24 = [v6 leadingAnchor];
      long long v23 = [v25 constraintEqualToAnchor:v24];
      v27[0] = v23;
      double v22 = [v7 trailingAnchor];
      id v21 = [v6 trailingAnchor];
      uint64_t v19 = [v22 constraintEqualToAnchor:v21];
      v27[1] = v19;
      uint64_t v8 = [v7 topAnchor];
      int v9 = [v6 topAnchor];
      id v10 = [v8 constraintEqualToAnchor:v9];
      v27[2] = v10;
      id v11 = [v7 bottomAnchor];
      id v12 = [v6 bottomAnchor];
      char v13 = [v11 constraintEqualToAnchor:v12];
      v27[3] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      [v20 activateConstraints:v14];

      long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v6];
      BOOL v26 = v15;
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [(EKEventViewControllerDefaultImpl *)self setToolbarItems:v16 animated:1];
    }
  }
  else
  {
    long long v17 = [(EKEventViewControllerDefaultImpl *)self toolbarItems];

    if (v17)
    {
      uint64_t v18 = [(EKEventViewControllerDefaultImpl *)self navigationController];
      [v18 setToolbarHidden:1];

      [(EKEventViewControllerDefaultImpl *)self setToolbarItems:0 animated:1];
    }
  }
}

- (void)_updateResponse
{
  uint64_t v3 = [(EKEventViewControllerDefaultImpl *)self _statusButtonsView];
  event = self->_event;
  id v12 = (id)v3;
  if (self->_trustsStatus)
  {
    uint64_t v5 = [(EKEvent *)event participationStatus];
  }
  else
  {
    int v6 = [(EKEvent *)event calendar];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 source];
      int v9 = [v8 constraints];
      int v10 = [v9 statusesAreAccurate] ^ 1;
    }
    else
    {
      int v10 = 0;
    }

    uint64_t v5 = [(EKEvent *)self->_event participationStatus];
    if (v10 && ![(EKEvent *)self->_event isStatusDirty]) {
      goto LABEL_11;
    }
  }
  if (![(EKEventViewControllerDefaultImpl *)self _isDisplayingSuggestion]
    && (unint64_t)(v5 - 2) <= 2)
  {
    uint64_t v11 = qword_1B413ACC8[v5 - 2];
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v11 = 0;
LABEL_12:
  [v12 setSelectedAction:v11];
}

- (BOOL)_shouldDisplayStatusButtons
{
  uint64_t v2 = [(EKEventViewControllerDefaultImpl *)self statusButtons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)_actionsMask
{
  if ([(EKEventViewControllerDefaultImpl *)self _shouldDisplayDelegateOrOutOfDateMessage])
  {
    return 0;
  }
  if (![(EKEventViewControllerDefaultImpl *)self _isDisplayingInvitation])
  {
    if ([(EKEventViewControllerDefaultImpl *)self isICSPreview])
    {
      if ([(EKEventViewControllerDefaultImpl *)self showsAddToCalendarForICSPreview])
      {
        int64_t v3 = 8;
        goto LABEL_13;
      }
      BOOL v4 = ![(EKEventViewControllerDefaultImpl *)self showsUpdateCalendarForICSPreview];
      uint64_t v5 = 2048;
    }
    else
    {
      BOOL v4 = ![(EKEventViewControllerDefaultImpl *)self _isDisplayingSuggestion];
      uint64_t v5 = 136;
    }
    if (v4) {
      int64_t v3 = 0;
    }
    else {
      int64_t v3 = v5;
    }
LABEL_13:
    if ([(EKEventViewControllerDefaultImpl *)self _isDisplayingDeletableEvent]
      && (![(EKEventViewControllerDefaultImpl *)self isICSPreview]
       || [(EKEventViewControllerDefaultImpl *)self showsDeleteForICSPreview]))
    {
      if ([(EKEventViewControllerDefaultImpl *)self _reminderMode])
      {
        v3 |= 0x80000uLL;
      }
      else
      {
        int v6 = [(EKEventViewControllerDefaultImpl *)self event];
        uint64_t v7 = [v6 status];

        if (v7 == 3) {
          v3 |= 0x100000uLL;
        }
        else {
          v3 |= 0x10uLL;
        }
      }
    }
    goto LABEL_21;
  }
  int64_t v3 = 7;
LABEL_21:
  uint64_t v8 = [(EKEventViewControllerDefaultImpl *)self event];
  int v9 = [v8 calendar];

  if ([v9 isSubscribed]
    && ([v9 isSubscribedHolidayCalendar] & 1) == 0
    && [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp])
  {
    v3 |= 0x40000uLL;
  }

  return v3;
}

+ (id)_orderedActionsForMask:(int64_t)a3
{
  BOOL v4 = objc_opt_new();
  for (uint64_t i = 0; i != 15; ++i)
  {
    if ((_orderedActionsForMask__actionOrder_0[i] & a3) != 0)
    {
      int v6 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v4 addObject:v6];
    }
  }

  return v4;
}

- (id)statusButtons
{
  int64_t v2 = [(EKEventViewControllerDefaultImpl *)self _actionsMask];
  int64_t v3 = objc_opt_class();

  return (id)[v3 _orderedActionsForMask:v2];
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
}

- (double)eventStatusButtonsViewButtonFontSize:(id)a3
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_statusButtonsViewCachedFontSize = a4;
}

- (void)viewWillLayoutSubviews
{
  if (!self->_showingBlankFooterView)
  {
    double lastFooterLayoutWidth = self->_lastFooterLayoutWidth;
    if (lastFooterLayoutWidth != EKUIContainedControllerIdealWidth()) {
      [(EKEventViewControllerDefaultImpl *)self _updateHeaderAndFooterIfNeeded];
    }
  }
  BOOL v4 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  id v6 = [v4 toolbar];

  uint64_t v5 = v6;
  if (v6)
  {
    [(SingleToolbarItemContainerView *)self->_statusButtonsContainerView setBoundsWithToolbar:v6];
    uint64_t v5 = v6;
  }
}

- (id)_sectionAtIndex:(int64_t)a3
{
  BOOL v4 = self->_currentSections;
  uint64_t v5 = v4;
  if (a3 < 0 || [(NSArray *)v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)_itemAtIndexPath:(id)a3 section:(id *)a4 subitemIndex:(unint64_t *)a5
{
  id v8 = a3;
  int v9 = -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", [v8 section]);
  uint64_t v10 = [v8 row];

  uint64_t v11 = [v9 itemAtIndex:v10 subitemIndex:a5];
  if (a4) {
    *a4 = v9;
  }

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_currentSections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKEventViewControllerDefaultImpl *)self _sectionAtIndex:a4];
  [v6 frame];
  if (v8 > 0.0)
  {
    [v6 frame];
    [v7 updateCellLayoutsForRowCountIfNeededUsingWidth:v9];
  }
  uint64_t v10 = [v7 numberOfRows];
  int64_t v11 = v10;
  if (self->_disclosedTableSection == a4) {
    int64_t v11 = self->_disclosedTableRange.length + v10;
  }

  return v11;
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)EKEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v16 viewDidLayoutSubviews];
  [(EKEventViewControllerDefaultImpl *)self tableViewSectionContentWidth];
  double v4 = v3;
  if (v3 >= 10.0)
  {
    uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self view];
    id v6 = [v5 window];

    if (v6)
    {
      uint64_t v7 = [(EKEventViewControllerDefaultImpl *)self tableView];
      uint64_t v8 = [v7 numberOfSections];

      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v10 = [(EKEventViewControllerDefaultImpl *)self tableView];
          uint64_t v11 = [v10 numberOfRowsInSection:i];

          if (v11)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              char v13 = [MEMORY[0x1E4F28D58] indexPathForRow:j inSection:i];
              uint64_t v14 = [(EKEventViewControllerDefaultImpl *)self tableView];
              long long v15 = [(EKEventViewControllerDefaultImpl *)self tableView:v14 cellForRowAtIndexPath:v13];

              [(id)objc_opt_class() adjustLayoutForCell:v15 tableViewWidth:v11 numRowsInSection:j cellRow:0 forceLayout:v4];
            }
          }
        }
      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  double v9 = [(EKEventViewControllerDefaultImpl *)self _sectionAtIndex:v8];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v10 = [v7 row];
  uint64_t v11 = [(EKEventViewControllerDefaultImpl *)self view];
  id v12 = [v11 window];

  if (v12)
  {
    char v13 = [(EKEventViewControllerDefaultImpl *)self view];
    uint64_t v14 = [v13 window];
    EKUIPushFallbackSizingContextWithViewHierarchy(v14);
  }
  long long v15 = [(EKEventViewControllerDefaultImpl *)self traitCollection];
  objc_super v16 = [v9 cellForSubitemAtIndex:v10 withTraitCollection:v15];

  long long v17 = [(EKEventViewControllerDefaultImpl *)self view];
  uint64_t v18 = [v17 window];

  if (v18)
  {
    uint64_t v19 = [(EKEventViewControllerDefaultImpl *)self view];
    uint64_t v20 = [v19 window];
    EKUIPopFallbackSizingContextWithViewHierarchy(v20);
  }
  if (![(EKEventViewControllerDefaultImpl *)self allowsSubitems]
    && ([v16 accessoryType] == 1 || objc_msgSend(v16, "accessoryType") == 2)
    || [v9 tag] == 1 && !-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing"))
  {
    [v16 setAccessoryType:0];
  }
  [(EKEventViewControllerDefaultImpl *)self tableViewSectionContentWidth];
  double v22 = v21;
  if (v21 > 10.0)
  {
    uint64_t v23 = [v6 numberOfRowsInSection:v8];
    id v24 = [(EKEventViewControllerDefaultImpl *)self view];
    char v25 = [v24 window];

    if (v25)
    {
      BOOL v26 = [(EKEventViewControllerDefaultImpl *)self view];
      uint64_t v27 = [v26 window];
      EKUIPushFallbackSizingContextWithViewHierarchy(v27);
    }
    [(id)objc_opt_class() adjustLayoutForCell:v16 tableViewWidth:v23 numRowsInSection:v10 cellRow:1 forceLayout:v22];
    uint64_t v28 = [(EKEventViewControllerDefaultImpl *)self view];
    BOOL v29 = [v28 window];

    if (v29)
    {
      CGFloat v30 = [(EKEventViewControllerDefaultImpl *)self view];
      uint64_t v31 = [v30 window];
      EKUIPopFallbackSizingContextWithViewHierarchy(v31);
    }
  }
  if (!v16)
  {
LABEL_19:
    int v32 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v34 = 138412290;
      id v35 = v7;
      _os_log_impl(&dword_1B3F4C000, v32, OS_LOG_TYPE_ERROR, "No cell found from EKEventViewController for index path %@.  Using empty cell to prevent crash.", (uint8_t *)&v34, 0xCu);
    }
    objc_super v16 = objc_opt_new();
  }

  return v16;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  cellHeights = self->_cellHeights;
  id v7 = NSNumber;
  id v8 = a5;
  [a4 frame];
  id v10 = [v7 numberWithDouble:v9];
  [(NSMutableDictionary *)cellHeights setObject:v10 forKey:v8];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double v4 = [(NSMutableDictionary *)self->_cellHeights objectForKey:a4];
  uint64_t v5 = v4;
  if (v4) {
    [v4 doubleValue];
  }
  else {
    +[EKEventDetailCell detailsCellDefaultHeight];
  }
  double v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 rowHeight];
  double v9 = v8;
  id v10 = -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", [v7 section]);
  if (v10)
  {
    uint64_t v11 = [v7 row];
    [(EKEventViewControllerDefaultImpl *)self tableViewSectionContentWidth];
    double v13 = v12;
    [v6 _backgroundInset];
    if (v13 + v14 * -2.0 > 10.0)
    {
      objc_msgSend(v10, "defaultCellHeightForSubitemAtIndex:forWidth:", v11);
      if (v15 > 0.0) {
        double v9 = v15;
      }
    }
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self _itemAtIndexPath:a4 section:0 subitemIndex:&v9];
  if (v5)
  {
    id v6 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    char v7 = [v5 eventViewController:v6 shouldSelectSubitem:v9];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self _itemAtIndexPath:a4 section:0 subitemIndex:&v7];
  id v6 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  [v5 eventViewController:v6 didHighlightSubitem:v7];
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self _itemAtIndexPath:a4 section:0 subitemIndex:&v7];
  id v6 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  [v5 eventViewController:v6 didUnhighlightSubitem:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0;
  uint64_t v21 = 0;
  double v8 = [(EKEventViewControllerDefaultImpl *)self _itemAtIndexPath:v7 section:&v20 subitemIndex:&v21];
  id v9 = v20;
  currentEditItem = self->_currentEditItem;
  if (currentEditItem) {
    BOOL v11 = v8 == currentEditItem;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || [(EKEventDetailItem *)currentEditItem saveAndDismissWithForce:0])
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    double v12 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [(EKEventDetailItem *)v8 eventViewController:v12 didSelectReadOnlySubitem:v21];

    BOOL v13 = [(EKEventViewControllerDefaultImpl *)self _shouldShowEditButton];
    if ([(EKEventViewControllerDefaultImpl *)self allowsSubitems]
      && (!v13 || objc_msgSend(v9, "hasSubitemForIndexPathRow:", objc_msgSend(v7, "row")))
      && ([v9 tag] != 1 || -[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing")))
    {
      double v14 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      [(EKEventDetailItem *)v8 eventViewController:v14 didSelectSubitem:v21];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        objc_super v16 = WeakRetained;
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          id v19 = objc_loadWeakRetained((id *)&self->_delegate);
          [v19 performSelector:sel_eventViewControllerDidReceiveEditUserInteraction_ withObject:self];
        }
      }
    }
  }
  else
  {
    [v6 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v4 = [(EKEventViewControllerDefaultImpl *)self _sectionAtIndex:a4];
  uint64_t v5 = [v4 headerTitle];

  return v5;
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
      double v8 = [v10 backgroundColor];
      id v9 = [v7 contentView];

      [v9 setBackgroundColor:v8];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  [(EKEventViewControllerDefaultImpl *)self updateTitleWithScrollView:a3 animation:1];

  [(EKEventViewControllerDefaultImpl *)self _notifyDetailItemsOfVisibilityOnScreen];
}

- (void)updateTitleWithScrollView:(id)a3 animation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UIViewController *)self isPresentedInsidePopover]) {
    goto LABEL_6;
  }
  [v6 contentSize];
  double v8 = v7;
  id v9 = [(EKEventViewControllerDefaultImpl *)self view];
  [v9 frame];
  double v11 = v10;
  double v12 = [(EKEventViewControllerDefaultImpl *)self view];
  [v12 safeAreaInsets];
  if (v8 < v11 - v13) {
    goto LABEL_5;
  }
  double v14 = [(EKEventViewControllerDefaultImpl *)self view];
  if (EKUICurrentHeightSizeClassIsCompact(v14))
  {

LABEL_5:
LABEL_6:
    [(EKEventViewControllerDefaultImpl *)self _clearCustomTitle];
    goto LABEL_7;
  }
  BOOL v15 = [(EKEventViewControllerDefaultImpl *)self _navigationBarShouldBeHidden];

  if (v15) {
    goto LABEL_6;
  }
  if ([(EKCustomTitleView *)self->_customTitle animating]) {
    goto LABEL_7;
  }
  [v6 contentOffset];
  double v17 = v16;
  [(EKEventTitleDetailItem *)self->_titleItem titleHeight];
  double v19 = v18;
  id v20 = [(EKEventViewControllerDefaultImpl *)self view];
  [v20 safeAreaInsets];
  double v22 = v19 - v21;

  customTitle = self->_customTitle;
  if (v17 <= v22)
  {
    if (!customTitle) {
      goto LABEL_7;
    }
    if (v4)
    {
      [(EKCustomTitleView *)customTitle setAnimating:1];
      uint64_t v36 = self->_customTitle;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_4;
      v37[3] = &unk_1E6087520;
      v37[4] = self;
      [(EKCustomTitleView *)v36 animateOutWithCompletionBlock:v37];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (customTitle) {
    goto LABEL_7;
  }
  id v24 = [EKCustomTitleView alloc];
  char v25 = [(EKEventViewControllerDefaultImpl *)self viewTitle];
  BOOL v26 = [(EKEventViewControllerDefaultImpl *)self event];
  uint64_t v27 = [v26 title];
  uint64_t v28 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  BOOL v29 = [(EKCustomTitleView *)v24 initWithTitle:v25 subTitle:v27 eventViewController:v28];
  CGFloat v30 = self->_customTitle;
  self->_customTitle = v29;

  uint64_t v31 = self->_customTitle;
  int v32 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
  [v32 setTitleView:v31];

  id v33 = [(EKCustomTitleView *)self->_customTitle window];

  if (!v33) {
    goto LABEL_6;
  }
  if (v4)
  {
    [(EKCustomTitleView *)self->_customTitle setAnimating:1];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke;
    v39[3] = &unk_1E6087570;
    v39[4] = self;
    int v34 = MEMORY[0x1E4F14428];
    id v35 = v39;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_3;
    block[3] = &unk_1E6087570;
    block[4] = self;
    int v34 = MEMORY[0x1E4F14428];
    id v35 = block;
  }
  dispatch_async(v34, v35);
LABEL_7:
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) navigationController];
  double v3 = [v2 navigationBar];
  [v3 layoutIfNeeded];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1120);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_2;
  v7[3] = &unk_1E6087520;
  v7[4] = v4;
  return [v5 animateInWithCompletionBlock:v7];
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1120) setAnimating:0];
  }
  return result;
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) setShowSubtitle:1];
  int64_t v2 = *(void **)(*(void *)(a1 + 32) + 1120);

  return [v2 setNeedsLayout];
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _clearCustomTitle];
  }
  return result;
}

- (void)_clearCustomTitle
{
  double v3 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
  [v3 setTitleView:0];

  uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self viewTitle];
  uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  [v5 setTitle:v4];

  customTitle = self->_customTitle;
  self->_customTitle = 0;
}

+ (void)adjustLayoutForCell:(id)a3 tableViewWidth:(double)a4 numRowsInSection:(unint64_t)a5 cellRow:(unint64_t)a6 forceLayout:(BOOL)a7
{
  BOOL v7 = a7;
  id v14 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v11 = a5 - 1 == a6 ? 4 : 2;
    unsigned int v12 = a6 ? v11 : 1;
    uint64_t v13 = a5 == 1 ? 5 : v12;
    if (([v14 needsLayoutForWidth:v13 position:a4] & 1) != 0 || v7) {
      [v14 layoutForWidth:v13 position:a4];
    }
  }
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  double v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v4 = EKWeakLinkSymbol();
  CreateAceEventFromEKEvent = v4;
  event = self->_event;
  if (event) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    BOOL v7 = (void (*)(EKEvent *, void *))v4;
    double v8 = [(EKEvent *)event eventStore];
    id v9 = [v8 timeZone];
    double v10 = v7(event, v9);

    int v11 = [v10 dictionary];
    if (v11) {
      [v3 addObject:v11];
    }
  }

  return v3;
}

- (unint64_t)_sectionForDetailItem:(id)a3
{
  return 0;
}

- (void)detailItem:(id)a3 performActionsOnCellAtIndexPath:(id)a4 actions:(id)a5
{
  BOOL v7 = (void (**)(id, id))a5;
  id v8 = a4;
  id v9 = [(EKEventViewControllerDefaultImpl *)self tableView];
  id v10 = [v9 cellForRowAtIndexPath:v8];

  v7[2](v7, v10);
}

- (void)detailItem:(id)a3 wantsRowReload:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [(EKEventViewControllerDefaultImpl *)self _sectionForDetailItem:a3];
  id v8 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v9 = [v6 row];
  uint64_t v10 = [v6 section];

  int v11 = [v8 indexPathForRow:v9 inSection:v10 + v7];
  unsigned int v12 = [(EKEventViewControllerDefaultImpl *)self tableView];
  v14[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v12 reloadRowsAtIndexPaths:v13 withRowAnimation:0];
}

- (void)detailItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5 rowReloads:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v37 = a5;
  id v35 = a6;
  unint64_t v11 = [(EKEventViewControllerDefaultImpl *)self _sectionForDetailItem:a3];
  unsigned int v12 = [(EKEventViewControllerDefaultImpl *)self tableView];
  [v12 beginUpdates];
  uint64_t v36 = v10;
  if (v10)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "row"), objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "section") + v11);
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v16);
    }

    [v12 insertRowsAtIndexPaths:v13 withRowAnimation:0];
  }
  if (v37)
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v21 = v37;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v43 != v24) {
            objc_enumerationMutation(v21);
          }
          BOOL v26 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "row"), objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "section") + v11);
          [v20 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v23);
    }

    [v12 deleteRowsAtIndexPaths:v20 withRowAnimation:0];
  }
  uint64_t v27 = v35;
  if (v35)
  {
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v29 = v35;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(v29);
          }
          int v34 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * k), "row"), objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * k), "section") + v11);
          [v28 addObject:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v31);
    }

    [v12 reloadRowsAtIndexPaths:v28 withRowAnimation:0];
    uint64_t v27 = v35;
  }
  [v12 endUpdates];
}

- (void)detailItem:(id)a3 wantsIndexPathsScrolledToVisible:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [(EKEventViewControllerDefaultImpl *)self _sectionForDetailItem:a3];
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v16), "row", (void)v28), objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v16), "section") + v7);
        double v18 = [(EKEventViewControllerDefaultImpl *)self tableView];
        [v18 rectForRowAtIndexPath:v17];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;

        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        if (CGRectIsEmpty(v34))
        {
          double height = v26;
          double width = v24;
          double y = v22;
          double x = v20;
        }
        else
        {
          v35.origin.double x = v20;
          v35.origin.double y = v22;
          v35.size.double width = v24;
          v35.size.double height = v26;
          v38.origin.double x = x;
          v38.origin.double y = y;
          v38.size.double width = width;
          v38.size.double height = height;
          CGRect v36 = CGRectUnion(v35, v38);
          double x = v36.origin.x;
          double y = v36.origin.y;
          double width = v36.size.width;
          double height = v36.size.height;
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  if (!CGRectIsEmpty(v37))
  {
    uint64_t v27 = [(EKEventViewControllerDefaultImpl *)self tableView];
    objc_msgSend(v27, "scrollRectToVisible:animated:", 1, x + -10.0, y, width, height + 20.0);
  }
}

- (BOOL)shouldShowEditButtonInline
{
  if ([(EKEventViewControllerDefaultImpl *)self minimalMode])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [(EKEventViewControllerDefaultImpl *)self navigationController];
    if (v4)
    {
      uint64_t v5 = [(EKEventViewControllerDefaultImpl *)self navigationController];
      if ([v5 isNavigationBarHidden])
      {
        BOOL v3 = 0;
      }
      else
      {
        id v6 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
        unint64_t v7 = [v6 rightBarButtonItem];
        if ([v7 systemItem] == 2)
        {
          BOOL v3 = 1;
        }
        else
        {
          id v8 = [(EKEventViewControllerDefaultImpl *)self navigationItem];
          uint64_t v9 = [v8 leftBarButtonItem];
          BOOL v3 = [v9 systemItem] == 2;
        }
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  BOOL v10 = [(EKEventViewControllerDefaultImpl *)self _shouldShowInlineButtonFromDelegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&unk_1F0D6D6D8])
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
    {
      char v15 = 0;
      if (v3) {
        return 0;
      }
      goto LABEL_20;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v14 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    char v15 = [WeakRetained eventViewControllerShouldShowInlineEditButtonForInvitations:v14];
  }
  else
  {
    char v15 = 0;
  }

  if (v3) {
    return 0;
  }
LABEL_20:
  BOOL v17 = [(EKEventViewControllerDefaultImpl *)self noninteractivePlatterMode];
  BOOL result = 0;
  if (!v17 && v10) {
    return [(EKEventViewControllerDefaultImpl *)self _shouldShowEditButton] | v15;
  }
  return result;
}

- (BOOL)_shouldShowInlineButtonFromDelegate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  BOOL v7 = [v6 performSelector:sel_eventViewControllerShouldHideInlineEditButton withObject:self] == 0;

  return v7;
}

- (void)editButtonPressed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![WeakRetained conformsToProtocol:&unk_1F0D6D6D8]) {
    goto LABEL_10;
  }
  id v5 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_9;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  id v8 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  int v9 = [v7 eventViewControllerShouldHandleInlineEdit:v8];

  if (v9)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    BOOL v10 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [v11 eventViewControllerInlineEditButtonWasTapped:v10];

    return;
  }
LABEL_11:

  [(EKEventViewControllerDefaultImpl *)self editButtonTapped];
}

- (BOOL)shouldShowNextButton
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int v7 = [v6 eventViewControllerShouldShowNextPreviousRecurrenceButtons];

  if (!v7) {
    return 0;
  }
  if (!self->_cachedShowNext)
  {
    id v8 = [(EKEvent *)self->_event nextOccurrence];

    cachedShowNext = self->_cachedShowNext;
    BOOL v10 = (NSNumber *)MEMORY[0x1E4F1CC38];
    if (!v8) {
      BOOL v10 = (NSNumber *)MEMORY[0x1E4F1CC28];
    }
    self->_cachedShowNext = v10;
  }
  id v11 = self->_cachedShowNext;

  return [(NSNumber *)v11 BOOLValue];
}

- (BOOL)shouldShowPreviousButton
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int v7 = [v6 eventViewControllerShouldShowNextPreviousRecurrenceButtons];

  if (!v7) {
    return 0;
  }
  if (!self->_cachedShowPrevious)
  {
    id v8 = [(EKEvent *)self->_event previousOccurrence];

    cachedShowPrevious = self->_cachedShowPrevious;
    BOOL v10 = (NSNumber *)MEMORY[0x1E4F1CC38];
    if (!v8) {
      BOOL v10 = (NSNumber *)MEMORY[0x1E4F1CC28];
    }
    self->_cachedShowPrevious = v10;
  }
  id v11 = self->_cachedShowPrevious;

  return [(NSNumber *)v11 BOOLValue];
}

- (void)nextButtonPressed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&unk_1F0D6D6D8])
  {
    id v4 = objc_loadWeakRetained((id *)p_delegate);
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [WeakRetained eventViewControllerNextButtonWasTapped:v6];
  }
}

- (void)previousButtonPressed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&unk_1F0D6D6D8])
  {
    id v4 = objc_loadWeakRetained((id *)p_delegate);
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
    [WeakRetained eventViewControllerPreviousButtonWasTapped:v6];
  }
}

- (void)uneditableButtonDetailItem:(id)a3 requestsShowEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained conformsToProtocol:&unk_1F0D6D6D8])
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        goto LABEL_6;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v10 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
      [WeakRetained eventViewController:v10 requestsShowEvent:v6];
    }
  }
LABEL_6:
}

- (BOOL)_canPerformEditKeyCommand
{
  if ([(EKEventViewControllerDefaultImpl *)self _shouldShowEditButton]) {
    return 1;
  }

  return [(EKEventViewControllerDefaultImpl *)self shouldShowEditButtonInline];
}

- (void)_performEditKeyCommand
{
  if ([(EKEventViewControllerDefaultImpl *)self _canPerformEditKeyCommand])
  {
    [(EKEventViewControllerDefaultImpl *)self editButtonPressed];
  }
}

- (void)copy:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&unk_1F0D6D6D8])
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id WeakRetained = [v7 pasteboardManager];

    id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_event];
    [WeakRetained copyEvents:v8 delegate:self];
  }
}

- (void)cut:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v9 = [v7 pasteboardManager];

    id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_event];
    [v9 cutEvents:v8 delegate:self];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (sel__performEditKeyCommand == a3)
  {
    unsigned __int8 v8 = [(EKEventViewControllerDefaultImpl *)self _canPerformEditKeyCommand];
    goto LABEL_8;
  }
  unsigned __int8 v7 = 0;
  if (([MEMORY[0x1E4F57BF0] declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0
    && sel_paste_ != a3)
  {
    if (sel_copy_ == a3)
    {
      id v9 = (void *)MEMORY[0x1E4F57BF0];
      v17[0] = self->_event;
      BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      id v11 = v9;
      uint64_t v12 = 1;
    }
    else
    {
      if (sel_cut_ != a3)
      {
        v15.receiver = self;
        v15.super_class = (Class)EKEventViewControllerDefaultImpl;
        unsigned __int8 v8 = [(EKEventViewControllerDefaultImpl *)&v15 canPerformAction:a3 withSender:v6];
LABEL_8:
        unsigned __int8 v7 = v8;
        goto LABEL_12;
      }
      char v13 = (void *)MEMORY[0x1E4F57BF0];
      event = self->_event;
      BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&event count:1];
      id v11 = v13;
      uint64_t v12 = 0;
    }
    unsigned __int8 v7 = [v11 allEventsValidForAction:v12 fromEvents:v10];
  }
LABEL_12:

  return v7;
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5 = a4;
  id v6 = [(EKEventViewControllerDefaultImpl *)self presentationSourceViewController];
  [v5 presentFromSource:v6];
}

- (void)setToolbarItems:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  [v5 setToolbarItems:v4];
}

- (id)toolbarItems
{
  int64_t v2 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  BOOL v3 = [v2 toolbarItems];

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  [v7 setToolbarItems:v6 animated:v4];
}

- (id)navigationItem
{
  int64_t v2 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  BOOL v3 = [v2 navigationItem];

  return v3;
}

- (id)navigationController
{
  int64_t v2 = [(EKEventViewControllerDefaultImpl *)self _ekEventViewController];
  BOOL v3 = [v2 navigationController];

  return v3;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  p_navigationDelegate = &self->_navigationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    id v5 = [(EKEventViewControllerDefaultImpl *)self navigationController];
  }

  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (BOOL)eventEditViewPresented
{
  return self->_eventEditViewPresented;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  self->_eventEditViewPresented = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (EKEventViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventViewDelegate *)WeakRetained;
}

- (BOOL)allowsSubitems
{
  return self->_allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->_allowsSubitems = a3;
}

- (BOOL)allowsInviteResponses
{
  return self->_allowsInviteResponses;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (int)editorHideTransition
{
  return self->_editorHideTransition;
}

- (void)setEditorHideTransition:(int)a3
{
  self->_editorHideTransition = a3;
}

- (int)editorShowTransition
{
  return self->_editorShowTransition;
}

- (void)setEditorShowTransition:(int)a3
{
  self->_editorShowTransition = a3;
}

- (BOOL)isICSPreview
{
  return self->_ICSPreview;
}

- (BOOL)isLargeDayView
{
  return self->_isLargeDayView;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  self->_isLargeDayView = a3;
}

- (BOOL)noninteractivePlatterMode
{
  return self->_noninteractivePlatterMode;
}

- (BOOL)showsAddToCalendarForICSPreview
{
  return self->_showsAddToCalendarForICSPreview;
}

- (BOOL)showsDelegateMessage
{
  return self->_showsDelegateMessage;
}

- (BOOL)showsDelegatorMessage
{
  return self->_showsDelegatorMessage;
}

- (BOOL)showsDeleteForICSPreview
{
  return self->_showsDeleteForICSPreview;
}

- (BOOL)showsDetectedConferenceItem
{
  return self->_showsDetectedConferenceItem;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  self->_showsDetectedConferenceItem = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (BOOL)showsOutOfDateMessage
{
  return self->_showsOutOfDateMessage;
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  return self->_showsUpdateCalendarForICSPreview;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_editViewControllerForPasteboard, 0);
  objc_storeStrong((id *)&self->_cellHeights, 0);
  objc_storeStrong((id *)&self->_presentationSourceViewController, 0);
  objc_storeStrong((id *)&self->_blankFooterView, 0);
  objc_storeStrong((id *)&self->_tableViewTopConstraints, 0);
  objc_storeStrong((id *)&self->_headerConstraints, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_currentSections, 0);
  objc_storeStrong((id *)&self->_cachedShowPrevious, 0);
  objc_storeStrong((id *)&self->_cachedShowNext, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentEditItem, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_titleItem, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_activeEventEditor, 0);
  objc_storeStrong((id *)&self->_selectedEditItem, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end