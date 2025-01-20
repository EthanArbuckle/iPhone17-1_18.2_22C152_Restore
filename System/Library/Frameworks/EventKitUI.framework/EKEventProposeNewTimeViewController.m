@interface EKEventProposeNewTimeViewController
+ (id)_participantsInArray:(id)a3 thatAreNotInArray:(id)a4;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (BOOL)proposedTimeChanged;
- (BOOL)resetConflictResolutionSections;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)viewIsVisible;
- (EKEvent)event;
- (EKEventDateEditItem)proposeTimeItem;
- (EKEventProposeNewTimeViewController)initWithEvent:(id)a3 model:(id)a4;
- (EKInviteeAlternativeTimeSearcher)availabilitySearcher;
- (EKUIEmailCompositionManager)messageSendingManager;
- (EKUIEventStatusButtonsView)statusButtonsView;
- (EKUIInviteesViewAllInviteesCanAttendSection)allInviteesCanAttendSection;
- (EKUIInviteesViewAvailabilitySection)viewAvailabilitySection;
- (EKUIInviteesViewOriginalConflictSection)originalConflictSection;
- (EKUIInviteesViewSomeInviteesCanAttendSection)someInviteesCanAttendSection;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (EKViewControllerRemoteUIDelegate)remoteUIDelegate;
- (NSArray)sections;
- (NSDate)originalDate;
- (NSDate)proposedStartDate;
- (NSDate)selectedEndDate;
- (NSDate)selectedStartDate;
- (NSTimer)availabilitySearcherRunningSpinnerTimer;
- (SingleToolbarItemContainerView)statusButtonsContainerView;
- (UIActivityIndicatorView)availabilitySearcherRunningSpinner;
- (double)statusButtonsViewCachedFontSize;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_sectionForIndex:(unint64_t)a3;
- (id)_statusButtons;
- (id)_viewControllerForPresentingViewControllers;
- (id)defaultAlertTitleForEditItem:(id)a3;
- (id)editItemEventToDetach;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_indexForSection:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelAvailabilitySpinnerTimer;
- (void)_dismiss:(id)a3;
- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3;
- (void)_eventModified:(id)a3;
- (void)_fontSizeDefinitionsChanged:(id)a3;
- (void)_popViewControllerAnimated:(BOOL)a3;
- (void)_presentViewController:(id)a3;
- (void)_pushViewController:(id)a3 animated:(BOOL)a4;
- (void)_refreshIfNeeded;
- (void)_scheduleAvailabilitySpinnerTimer;
- (void)_searcherStateChanged:(int64_t)a3;
- (void)_updateStatusButtons;
- (void)availabilityDateChangedTo:(id)a3;
- (void)dateChangedTo:(id)a3;
- (void)doneButtonTapped;
- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5;
- (void)editItemRequiresHeightChange:(id)a3;
- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)loadView;
- (void)resetBackgroundColor;
- (void)setAllInviteesCanAttendSection:(id)a3;
- (void)setAvailabilitySearcher:(id)a3;
- (void)setAvailabilitySearcherRunningSpinner:(id)a3;
- (void)setAvailabilitySearcherRunningSpinnerTimer:(id)a3;
- (void)setEvent:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setOriginalConflictSection:(id)a3;
- (void)setOriginalDate:(id)a3;
- (void)setProposeTimeItem:(id)a3;
- (void)setProposedStartDate:(id)a3;
- (void)setRemoteUIDelegate:(id)a3;
- (void)setResetConflictResolutionSections:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setSomeInviteesCanAttendSection:(id)a3;
- (void)setStatusButtonsContainerView:(id)a3;
- (void)setStatusButtonsView:(id)a3;
- (void)setStatusButtonsViewCachedFontSize:(double)a3;
- (void)setViewAvailabilitySection:(id)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateCheckmark;
- (void)updateCustomBackButton;
- (void)viewAvailabilityTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKEventProposeNewTimeViewController

- (EKEventProposeNewTimeViewController)initWithEvent:(id)a3 model:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)EKEventProposeNewTimeViewController;
  v8 = [(EKEventProposeNewTimeViewController *)&v26 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = EventKitUIBundle();
    v10 = [v9 localizedStringForKey:@"Propose New Time" value:&stru_1F0CC2140 table:0];
    [(EKEventProposeNewTimeViewController *)v8 setTitle:v10];

    v11 = [v6 proposedStartDate];
    if (v11)
    {
      [(EKEventProposeNewTimeViewController *)v8 setOriginalDate:v11];
    }
    else
    {
      v12 = [v6 startDate];
      [(EKEventProposeNewTimeViewController *)v8 setOriginalDate:v12];
    }
    v13 = [v6 proposedStartDate];
    [(EKEventProposeNewTimeViewController *)v8 setProposedStartDate:v13];

    [(EKEventProposeNewTimeViewController *)v8 setEvent:v6];
    [(EKEventProposeNewTimeViewController *)v8 setResetConflictResolutionSections:1];
    objc_storeStrong((id *)&v8->_model, a4);
    objc_initWeak(&location, v8);
    id v14 = objc_alloc(MEMORY[0x1E4F25578]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke;
    v23[3] = &unk_1E60878F0;
    objc_copyWeak(&v24, &location);
    v15 = (void *)[v14 initWithStateChangedCallback:v23];
    [(EKEventProposeNewTimeViewController *)v8 setAvailabilitySearcher:v15];

    v16 = [(EKEventProposeNewTimeViewController *)v8 availabilitySearcher];
    [v16 setNoConflictRequired:1];

    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    objc_initWeak(&from, v8);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_3;
    v20[3] = &unk_1E60874F8;
    objc_copyWeak(&v21, &from);
    id v18 = (id)[(EKEventProposeNewTimeViewController *)v8 registerForTraitChanges:v17 withHandler:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_2;
  v3[3] = &unk_1E60878C8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _searcherStateChanged:*(void *)(a1 + 40)];
}

void __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = [v16 traitCollection];
  uint64_t v7 = [v6 _presentationSemanticContext];
  uint64_t v8 = [v5 _presentationSemanticContext];

  if (v7 != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained resetBackgroundColor];
  }
  uint64_t v10 = [v5 horizontalSizeClass];
  v11 = [v16 traitCollection];
  if (v10 != [v11 horizontalSizeClass])
  {

    goto LABEL_7;
  }
  uint64_t v12 = [v5 verticalSizeClass];
  v13 = [v16 traitCollection];
  uint64_t v14 = [v13 verticalSizeClass];

  if (v12 != v14)
  {
LABEL_7:
    id v15 = objc_loadWeakRetained((id *)(a1 + 32));
    [v15 _updateStatusButtons];
  }
}

- (id)_statusButtons
{
  return &unk_1F0D03B08;
}

- (EKUIEventStatusButtonsView)statusButtonsView
{
  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    v4 = [EKUIEventStatusButtonsView alloc];
    id v5 = [(EKEventProposeNewTimeViewController *)self _statusButtons];
    id v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setDisableButtonHighlights:0];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTextSizeMode:1];
    statusButtonsView = self->_statusButtonsView;
  }

  return statusButtonsView;
}

- (SingleToolbarItemContainerView)statusButtonsContainerView
{
  statusButtonsContainerView = self->_statusButtonsContainerView;
  if (!statusButtonsContainerView)
  {
    v4 = [SingleToolbarItemContainerView alloc];
    id v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    statusButtonsContainerView = self->_statusButtonsContainerView;
  }

  return statusButtonsContainerView;
}

- (void)_updateStatusButtons
{
  v42[4] = *MEMORY[0x1E4F143B8];
  v3 = [(EKEventProposeNewTimeViewController *)self _statusButtons];
  [(EKEventProposeNewTimeViewController *)self setStatusButtonsViewCachedFontSize:0.0];
  v4 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];

  if (v4)
  {
    id v5 = [(EKEventProposeNewTimeViewController *)self navigationController];
    [v5 setToolbarHidden:0];

    uint64_t v6 = [(EKEventProposeNewTimeViewController *)self toolbarItems];
    if (!v6
      || (uint64_t v7 = (void *)v6,
          [(EKEventProposeNewTimeViewController *)self statusButtonsContainerView],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      v9 = [(EKEventProposeNewTimeViewController *)self statusButtonsContainerView];
      uint64_t v10 = [(EKEventProposeNewTimeViewController *)self statusButtonsView];
      [v9 addSubview:v10];
      v34 = (void *)MEMORY[0x1E4F28DC8];
      v39 = [v10 leadingAnchor];
      v38 = [v9 leadingAnchor];
      v37 = [v39 constraintEqualToAnchor:v38];
      v42[0] = v37;
      v36 = [v10 trailingAnchor];
      v35 = [v9 trailingAnchor];
      v33 = [v36 constraintEqualToAnchor:v35];
      v42[1] = v33;
      v11 = [v10 topAnchor];
      [v9 topAnchor];
      uint64_t v12 = v40 = v3;
      v13 = [v11 constraintEqualToAnchor:v12];
      v42[2] = v13;
      uint64_t v14 = [v10 bottomAnchor];
      id v15 = [v9 bottomAnchor];
      id v16 = [v14 constraintEqualToAnchor:v15];
      v42[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
      [v34 activateConstraints:v17];

      id v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v9];
      v41 = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      [(EKEventProposeNewTimeViewController *)self setToolbarItems:v19 animated:1];

      v3 = v40;
    }
    v20 = [(EKEventProposeNewTimeViewController *)self navigationController];
    id v21 = [v20 toolbar];

    v22 = [(EKEventProposeNewTimeViewController *)self statusButtonsContainerView];
    [v22 setBoundsWithToolbar:v21];

    v23 = [(EKEventProposeNewTimeViewController *)self statusButtonsContainerView];
    [v23 frame];
    double v25 = v24;
    objc_super v26 = [(EKEventProposeNewTimeViewController *)self statusButtonsContainerView];
    [v26 frame];
    double v28 = v27;

    v29 = [(EKEventProposeNewTimeViewController *)self statusButtonsView];
    objc_msgSend(v29, "setFrame:", 0.0, 0.0, v25, v28);

    v30 = [(EKEventProposeNewTimeViewController *)self statusButtonsView];
    [v30 setActions:v3];
  }
  else
  {
    v31 = [(EKEventProposeNewTimeViewController *)self toolbarItems];

    if (v31)
    {
      v32 = [(EKEventProposeNewTimeViewController *)self navigationController];
      [v32 setToolbarHidden:1];

      [(EKEventProposeNewTimeViewController *)self setToolbarItems:0 animated:1];
    }
  }
}

- (void)loadView
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__eventModified_ name:*MEMORY[0x1E4F25448] object:self->_event];
  [v5 addObserver:self selector:sel__fontSizeDefinitionsChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  v3 = [EKUIEventInviteesView alloc];
  v4 = -[EKUIEventInviteesView initWithFrame:style:](v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(EKUIEventInviteesView *)v4 setDelegate:self];
  [(EKUIEventInviteesView *)v4 setDataSource:self];
  [(EKEventProposeNewTimeViewController *)self setTableView:v4];
  [(EKEventProposeNewTimeViewController *)self resetBackgroundColor];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  id v5 = [(EKEventProposeNewTimeViewController *)self tableView];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v4];
}

- (void)viewDidLoad
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  v141.receiver = self;
  v141.super_class = (Class)EKEventProposeNewTimeViewController;
  [(EKEventProposeNewTimeViewController *)&v141 viewDidLoad];
  objc_initWeak(&location, self);
  BOOL v3 = objc_alloc_init(EKEventDateEditItem);
  [(EKEventProposeNewTimeViewController *)self setProposeTimeItem:v3];

  v4 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
  [v4 setProposedTime:1];

  id v5 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
  uint64_t v6 = [(EKEventProposeNewTimeViewController *)self event];
  uint64_t v7 = [(EKEventProposeNewTimeViewController *)self event];
  uint64_t v8 = [v7 eventStore];
  [v5 setCalendarItem:v6 store:v8];

  v9 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
  [v9 setDelegate:self];

  uint64_t v10 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
  [v10 setEventDateEditItemDelegate:self];

  v11 = objc_alloc_init(EKUIInviteesViewOriginalConflictSection);
  [(EKEventProposeNewTimeViewController *)self setOriginalConflictSection:v11];

  uint64_t v12 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v12 clearCheckmark];

  v13 = [(EKEventProposeNewTimeViewController *)self event];
  uint64_t v14 = [v13 startTimeZone];
  id v15 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v15 setTimeZone:v14];

  id v16 = EventKitUIBundle();
  v17 = [v16 localizedStringForKey:@"Original Time" value:&stru_1F0CC2140 table:0];
  id v18 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v18 setTitle:v17];

  v19 = objc_alloc_init(EKUIInviteesViewAllInviteesCanAttendSection);
  [(EKEventProposeNewTimeViewController *)self setAllInviteesCanAttendSection:v19];

  v20 = [(EKEventProposeNewTimeViewController *)self event];
  id v21 = [v20 startTimeZone];
  v22 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v22 setTimeZone:v21];

  v23 = [(EKEventProposeNewTimeViewController *)self tableView];
  if (EKUICatalyst()) {
    [v23 setSeparatorStyle:1];
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  double v24 = [(EKEventProposeNewTimeViewController *)self event];
  double v25 = [v24 attendees];

  uint64_t v26 = [v25 countByEnumeratingWithState:&v136 objects:v147 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v137;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v137 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        if (([v29 isCurrentUser] & 1) == 0 && objc_msgSend(v29, "participantRole") != 3)
        {

          v30 = objc_alloc_init(EKUIInviteesViewSomeInviteesCanAttendSection);
          [(EKEventProposeNewTimeViewController *)self setSomeInviteesCanAttendSection:v30];

          double v25 = [(EKEventProposeNewTimeViewController *)self event];
          v31 = [v25 startTimeZone];
          v32 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
          [v32 setTimeZone:v31];

          int v92 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v136 objects:v147 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  int v92 = 0;
LABEL_14:

  v33 = objc_alloc_init(EKUIInviteesViewAvailabilitySection);
  [(EKEventProposeNewTimeViewController *)self setViewAvailabilitySection:v33];

  v34 = [(EKEventProposeNewTimeViewController *)self viewAvailabilitySection];
  [v34 setIsForAttendeeProposedTime:1];

  v35 = [(EKEventProposeNewTimeViewController *)self viewAvailabilitySection];
  v36 = [(EKEventProposeNewTimeViewController *)self event];
  [v35 updateWithEvent:v36];

  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke;
  v134[3] = &unk_1E6087918;
  objc_copyWeak(&v135, &location);
  v37 = [(EKEventProposeNewTimeViewController *)self viewAvailabilitySection];
  [v37 setViewAvailabilityTapped:v134];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2;
  aBlock[3] = &unk_1E6087940;
  objc_copyWeak(&v133, &location);
  id v38 = v23;
  id v132 = v38;
  v39 = _Block_copy(aBlock);
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_45;
  v129[3] = &unk_1E6087968;
  objc_copyWeak(&v130, &location);
  v40 = _Block_copy(v129);
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_48;
  v127[3] = &unk_1E6087990;
  objc_copyWeak(&v128, &location);
  v127[4] = self;
  v41 = _Block_copy(v127);
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_50;
  v125[3] = &unk_1E60879B8;
  id v42 = v38;
  id v126 = v42;
  v94 = _Block_copy(v125);
  v43 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  v44 = [(EKEventProposeNewTimeViewController *)self availabilitySearcher];
  [v43 setAvailabilitySearcher:v44];

  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_52;
  v122[3] = &unk_1E60879E0;
  objc_copyWeak(&v124, &location);
  id v45 = v40;
  id v123 = v45;
  v46 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v46 setShowPreviewOfEventAtTime:v122];

  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2_54;
  v119[3] = &unk_1E6087A08;
  id v47 = v39;
  id v120 = v47;
  objc_copyWeak(&v121, &location);
  v48 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v48 setTableViewCellHook:v119];

  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_3;
  v116[3] = &unk_1E6087A30;
  id v49 = v41;
  id v117 = v49;
  objc_copyWeak(&v118, &location);
  v50 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v50 setNewTimeChosen:v116];

  v51 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  v52 = [(EKEventProposeNewTimeViewController *)self availabilitySearcher];
  [v51 setAvailabilitySearcher:v52];

  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_4;
  v114[3] = &unk_1E6087A58;
  id v89 = v45;
  id v115 = v89;
  v53 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v53 setShowPreviewOfEventAtTime:v114];

  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_5;
  v111[3] = &unk_1E6087A08;
  id v88 = v47;
  id v112 = v88;
  objc_copyWeak(&v113, &location);
  v54 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v54 setTableViewCellHook:v111];

  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_6;
  v108[3] = &unk_1E6087A30;
  id v87 = v49;
  id v109 = v87;
  objc_copyWeak(&v110, &location);
  v55 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v55 setNewTimeChosen:v108];

  v56 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v56 setShowMoreAlternativeTimesTapped:v94];

  if (v92)
  {
    v57 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    v58 = [(EKEventProposeNewTimeViewController *)self availabilitySearcher];
    [v57 setAvailabilitySearcher:v58];

    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_7;
    v106[3] = &unk_1E6087A58;
    id v107 = v89;
    v59 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    [v59 setShowPreviewOfEventAtTime:v106];

    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_8;
    v103[3] = &unk_1E6087A08;
    id v104 = v88;
    objc_copyWeak(&v105, &location);
    v60 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    [v60 setTableViewCellHook:v103];

    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_9;
    v100[3] = &unk_1E6087A30;
    id v101 = v87;
    objc_copyWeak(&v102, &location);
    v61 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    [v61 setNewTimeChosen:v100];

    v62 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    [v62 setShowMoreAlternativeTimesTapped:v94];

    objc_destroyWeak(&v102);
    objc_destroyWeak(&v105);
  }
  v95 = [MEMORY[0x1E4F1CA48] array];
  v63 = [(EKEventProposeNewTimeViewController *)self viewAvailabilitySection];
  v146[0] = v63;
  v64 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  v146[1] = v64;
  v65 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  v146[2] = v65;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:3];
  [v95 addObjectsFromArray:v66];

  if (v92)
  {
    v67 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    [v95 addObject:v67];
  }
  [(EKEventProposeNewTimeViewController *)self setSections:v95];
  v68 = (id)kEKUILogInviteesHandle;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    v69 = [(EKEventProposeNewTimeViewController *)self sections];
    *(_DWORD *)buf = 138412290;
    v145 = v69;
    _os_log_impl(&dword_1B3F4C000, v68, OS_LOG_TYPE_DEBUG, "Set up sections: [%@].", buf, 0xCu);
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v70 = [(EKEventProposeNewTimeViewController *)self sections];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v96 objects:v143 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v71; ++j)
      {
        if (*(void *)v97 != v72) {
          objc_enumerationMutation(v70);
        }
        [*(id *)(*((void *)&v96 + 1) + 8 * j) reloadAndRegisterReusableCellsWithTableView:v42];
      }
      uint64_t v71 = [v70 countByEnumeratingWithState:&v96 objects:v143 count:16];
    }
    while (v71);
  }

  [(EKEventProposeNewTimeViewController *)self _updateStatusButtons];
  id v74 = objc_alloc_init(MEMORY[0x1E4FB1400]);
  [(EKEventProposeNewTimeViewController *)self setAvailabilitySearcherRunningSpinner:v74];

  v75 = [(EKEventProposeNewTimeViewController *)self availabilitySearcherRunningSpinner];
  [v75 setTranslatesAutoresizingMaskIntoConstraints:0];

  v76 = [(EKEventProposeNewTimeViewController *)self view];
  v77 = [(EKEventProposeNewTimeViewController *)self availabilitySearcherRunningSpinner];
  [v76 addSubview:v77];

  v86 = (void *)MEMORY[0x1E4F28DC8];
  v93 = [(EKEventProposeNewTimeViewController *)self availabilitySearcherRunningSpinner];
  v90 = [v93 centerXAnchor];
  v91 = [(EKEventProposeNewTimeViewController *)self view];
  v78 = [v91 centerXAnchor];
  v79 = [v90 constraintEqualToAnchor:v78];
  v142[0] = v79;
  v80 = [(EKEventProposeNewTimeViewController *)self availabilitySearcherRunningSpinner];
  v81 = [v80 centerYAnchor];
  v82 = [(EKEventProposeNewTimeViewController *)self view];
  v83 = [v82 centerYAnchor];
  v84 = [v81 constraintEqualToAnchor:v83];
  v142[1] = v84;
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:2];
  [v86 activateConstraints:v85];

  [(EKEventProposeNewTimeViewController *)self _refreshIfNeeded];
  objc_destroyWeak(&v110);

  objc_destroyWeak(&v113);
  objc_destroyWeak(&v118);

  objc_destroyWeak(&v121);
  objc_destroyWeak(&v124);

  objc_destroyWeak(&v128);
  objc_destroyWeak(&v130);

  objc_destroyWeak(&v133);
  objc_destroyWeak(&v135);

  objc_destroyWeak(&location);
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained viewAvailabilityTapped];
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 < 0)
  {
    v11 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSNumber;
      v13 = v11;
      uint64_t v14 = [v12 numberWithInteger:a3];
      int v20 = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_ERROR, "Invalid row index given: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v20, 0xCu);
    }
  }
  else if ([v5 sectionShouldBeShown])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = [WeakRetained _indexForSection:v6];

    if (v8 != -1)
    {
      v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:v8];
      uint64_t v10 = [*(id *)(a1 + 32) cellForRowAtIndexPath:v9];

      goto LABEL_10;
    }
    id v15 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      id v16 = NSNumber;
      v17 = v15;
      id v18 = [v16 numberWithInteger:-1];
      int v20 = 138412290;
      id v21 = v18;
      _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "Invalid section index found: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Showing preview of event.  Date to show: [%@].  Overridden start date: [%@]  Overridden start date: [%@]", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v12 = [[EKDayPreviewController alloc] initWithDate:v7 event:WeakRetained[135] overriddenEventStartDate:v8 overriddenEventEndDate:v9 model:WeakRetained[128]];
    [(EKDayPreviewController *)v12 setStyle:2];
    [WeakRetained _pushViewController:v12 animated:1];
  }
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_48(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Setting selected date.  Start date:[%@]  End date: [%@].", (uint8_t *)&v20, 0x16u);
  }
  [v11 clearCheckmark];
  [v12 clearCheckmark];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setProposedStartDate:v9];

  id v15 = objc_loadWeakRetained((id *)(a1 + 40));
  id v16 = [v15 proposeTimeItem];
  [v16 setPendingProposedTime:v9];

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  id v18 = [v17 proposeTimeItem];
  [v18 refreshFromCalendarItemAndStore];

  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  [v19 updateCustomBackButton];

  [*(id *)(a1 + 32) _updateStatusButtons];
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "'Show more alternative times' tapped.", v5, 2u);
  }
  if ([v3 count]) {
    [*(id *)(a1 + 32) reloadData];
  }
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained event];
  if ([v8 isStartDateDirty]) {
    id v9 = v15;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = objc_loadWeakRetained(v5);
  id v12 = [v11 event];
  if ([v12 isEndDateDirty]) {
    int v13 = v6;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2_54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained originalConflictSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained allInviteesCanAttendSection];
  id v9 = objc_loadWeakRetained(v5);
  id v10 = [v9 someInviteesCanAttendSection];
  (*(void (**)(uint64_t, id, id, void *, void *))(v4 + 16))(v4, v7, v6, v8, v10);
}

uint64_t __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained allInviteesCanAttendSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained originalConflictSection];
  id v9 = objc_loadWeakRetained(v5);
  id v10 = [v9 someInviteesCanAttendSection];
  (*(void (**)(uint64_t, id, id, void *, void *))(v4 + 16))(v4, v7, v6, v8, v10);
}

uint64_t __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained someInviteesCanAttendSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained originalConflictSection];
  id v9 = objc_loadWeakRetained(v5);
  id v10 = [v9 allInviteesCanAttendSection];
  (*(void (**)(uint64_t, id, id, void *, void *))(v4 + 16))(v4, v7, v6, v8, v10);
}

- (BOOL)proposedTimeChanged
{
  uint64_t v3 = [(EKEventProposeNewTimeViewController *)self event];
  uint64_t v4 = [v3 proposedStartDate];

  if (v4)
  {
    id v5 = [(EKEventProposeNewTimeViewController *)self event];
    id v6 = [v5 proposedStartDate];
    id v7 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
    char v8 = [v6 isEqualToDate:v7];
  }
  else
  {
    id v5 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
    if (!v5)
    {
      char v10 = 0;
      goto LABEL_6;
    }
    id v6 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
    id v7 = [(EKEventProposeNewTimeViewController *)self event];
    id v9 = [v7 startDate];
    char v8 = [v6 isEqualToDate:v9];
  }
  char v10 = v8 ^ 1;

LABEL_6:
  return v10;
}

- (void)updateCustomBackButton
{
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if ([(EKEventProposeNewTimeViewController *)self proposedTimeChanged])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v4 = EventKitUIBundle();
    id v5 = [v4 localizedStringForKey:@"Done" value:&stru_1F0CC2140 table:0];
    id v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__dismiss_];

    id v7 = [(EKEventProposeNewTimeViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];

    char v8 = +[EKRemoteUIButtonAction Done];
    [v10 addObject:v8];
  }
  id v9 = [(EKEventProposeNewTimeViewController *)self remoteUIDelegate];
  [v9 viewController:self didChangeLeftBarButtons:v10 rightBarButtons:MEMORY[0x1E4F1CBF0]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventProposeNewTimeViewController;
  [(EKEventProposeNewTimeViewController *)&v4 viewWillAppear:a3];
  [(EKEventProposeNewTimeViewController *)self updateCustomBackButton];
  [(EKEventProposeNewTimeViewController *)self _refreshIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKEventProposeNewTimeViewController *)self setViewIsVisible:1];
  v5.receiver = self;
  v5.super_class = (Class)EKEventProposeNewTimeViewController;
  [(EKEventProposeNewTimeViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventProposeNewTimeViewController;
  [(EKEventProposeNewTimeViewController *)&v4 viewWillDisappear:a3];
  [(EKEventProposeNewTimeViewController *)self setViewIsVisible:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(EKEventProposeNewTimeViewController *)self view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2)) {
    unint64_t v3 = 26;
  }
  else {
    unint64_t v3 = 30;
  }

  return v3;
}

- (void)viewAvailabilityTapped
{
  id v10 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
  unint64_t v3 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
  objc_super v4 = [(EKEventProposeNewTimeViewController *)self event];
  [v4 duration];
  objc_super v5 = objc_msgSend(v3, "dateByAddingTimeInterval:");

  id v6 = [EKUIAvailabilityViewController alloc];
  id v7 = [(EKEventProposeNewTimeViewController *)self event];
  char v8 = [(EKUIAvailabilityViewController *)v6 initWithEvent:v7 isAttendeeProposeTime:1 proposedStartDate:v10 proposedEndDate:v5];

  [(EKEditItemViewController *)v8 setEditDelegate:self];
  [(EKUIAvailabilityViewController *)v8 setFromDetail:0];
  id v9 = [[EKUIAvailabilityNavigationController alloc] initWithRootViewController:v8];
  [(EKUIAvailabilityViewController *)v8 preferredContentSize];
  -[EKUIAvailabilityNavigationController setPreferredContentSize:](v9, "setPreferredContentSize:");
  [(EKEventProposeNewTimeViewController *)self _presentViewController:v9];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v3 = self->_sections;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    int64_t v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sectionShouldBeShown", (void)v10);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = [(EKEventProposeNewTimeViewController *)self _sectionForIndex:a4];
    uint64_t v5 = [v4 numberOfRows];
  }
  else
  {
    uint64_t v4 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
    uint64_t v5 = [v4 numberOfSubitems];
  }
  int64_t v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = [(EKEventProposeNewTimeViewController *)self _sectionForIndex:a4];
    [v4 headerTitle];
  }
  else
  {
    uint64_t v4 = EventKitUIBundle();
    [v4 localizedStringForKey:@"Proposed Start Time" value:&stru_1F0CC2140 table:0];
  uint64_t v5 = };

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
      char v8 = [v10 backgroundColor];
      id v9 = [v7 contentView];

      [v9 setBackgroundColor:v8];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    char v8 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v7 section]);
    id v9 = [v8 cellForIndexPath:v7 inTableView:v6];
  }
  else
  {
    char v8 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
    uint64_t v10 = [v7 row];

    id v9 = [v8 cellForSubitemAtIndex:v10];
  }

  if (EKUICatalyst())
  {
    long long v11 = [v6 backgroundColor];
    [v9 setBackgroundColor:v11];
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    id v6 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
    char v7 = [v6 canEditRow:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  if ([v8 section])
  {
    char v7 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v8 section]);
    [v7 commitEditingStyle:a4 forRow:v8];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    id v6 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
    [v6 estimatedHeightForRow:v5];
    double v8 = v7;
  }
  else
  {
    double v8 = *MEMORY[0x1E4FB2F28];
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 rowHeight];
  double v9 = v8;
  if (![v7 section])
  {
    [v6 bounds];
    double v11 = v10;
    [v6 _backgroundInset];
    double v13 = v11 + v12 * -2.0;
    id v14 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
    objc_msgSend(v14, "defaultCellHeightForSubitemAtIndex:forWidth:", objc_msgSend(v7, "row"), v13);
    double v16 = v15;

    if (v16 > 0.0) {
      double v9 = v16;
    }
    if (EKUIUnscaledCatalyst()) {
      double v9 = EKUIUnscaledCatalystTableRowHeightDefault();
    }
  }

  return v9;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    id v6 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
    char v7 = [v6 canSelectRow:v5];
    double v8 = v5;
    if ((v7 & 1) == 0)
    {

      double v8 = 0;
    }
    id v9 = v8;

    double v10 = v9;
  }
  else
  {
    double v11 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
    int v12 = objc_msgSend(v11, "editor:canSelectSubitem:", 0, objc_msgSend(v5, "row"));

    double v10 = 0;
    id v9 = v5;
    if (v12)
    {
      id v9 = v5;
      double v10 = v9;
    }
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    char v7 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v6 section]);
    [v7 selectRow:v6];
  }
  else
  {
    char v7 = [v12 cellForRowAtIndexPath:v6];
    if ([v7 selectionStyle])
    {
      [v12 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
      double v8 = [(EKEventProposeNewTimeViewController *)self _popoverController];

      if (!v8)
      {
        id v9 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
        double v10 = [v9 selectedResponder];
        [v10 resignFirstResponder];
      }
      double v11 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
      objc_msgSend(v11, "editor:didSelectSubitem:", 0, objc_msgSend(v6, "row"));
    }
  }
  [v12 deselectRowAtIndexPath:v6 animated:1];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (![v6 section])
  {
    id v5 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
    objc_msgSend(v5, "editor:didDeselectSubitem:", 0, objc_msgSend(v6, "row"));
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    id v6 = -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
    int64_t v7 = [v6 editingStyleForRow:v5];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    double v8 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_DEBUG, "The user cancelled out from this controller: [%@]", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v7 = [v6 modifiedStartDate];
    [(EKEventProposeNewTimeViewController *)self availabilityDateChangedTo:v7];

LABEL_7:
    [(EKEventProposeNewTimeViewController *)self _dismissPresentedViewControllerAnimated:1];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  id v9 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "Unrecognized controller completed: [%@]", (uint8_t *)&v10, 0xCu);
  }
LABEL_8:
}

- (void)availabilityDateChangedTo:(id)a3
{
  id v4 = a3;
  [(EKEventProposeNewTimeViewController *)self dateChangedTo:v4];
  id v5 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
  [v5 updateStartDateToDate:v4];
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  int64_t v7 = [(EKEventProposeNewTimeViewController *)self event];
  [v7 setProposedStartDate:0];

  id v11 = [(UIResponder *)self EKUI_editor];
  double v8 = [(EKEventProposeNewTimeViewController *)self event];
  [v11 saveEvent:v8 span:0 error:0];

  id v9 = [(EKEventProposeNewTimeViewController *)self navigationController];
  id v10 = (id)[v9 popViewControllerAnimated:1];
}

- (void)doneButtonTapped
{
}

- (void)_dismiss:(id)a3
{
  if ([(EKEventProposeNewTimeViewController *)self proposedTimeChanged])
  {
    id v4 = [(EKEventProposeNewTimeViewController *)self event];
    char v5 = [v4 serverSupportedProposeNewTime];

    id v6 = [(EKEventProposeNewTimeViewController *)self event];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__EKEventProposeNewTimeViewController__dismiss___block_invoke;
    v9[3] = &unk_1E6087AA8;
    char v11 = v5;
    v9[4] = self;
    id v10 = v6;
    id v7 = v6;
    id v8 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:8 viewController:self withCompletionHandler:v9];
  }
  else
  {
    [(EKEventProposeNewTimeViewController *)self _popViewControllerAnimated:1];
  }
}

void __48__EKEventProposeNewTimeViewController__dismiss___block_invoke(uint64_t a1, int a2)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  if (a2 != 1)
  {
    if (a2) {
      return;
    }
    unint64_t v3 = [*(id *)(a1 + 32) proposedStartDate];
    if (v3)
    {
      int v4 = *(unsigned __int8 *)(a1 + 48);

      if (!v4)
      {
        int v20 = [*(id *)(a1 + 40) organizer];
        v53[0] = v20;
        id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];

        if (+[EKUIEmailCompositionManager canShowViewControllerForEvent:*(void *)(a1 + 40) withParticipantRecipients:v44])
        {
          id v21 = EventKitUIBundle();
          v43 = [v21 localizedStringForKey:@"NEW TIME PROPOSAL:" value:&stru_1F0CC2140 table:0];

          __int16 v22 = NSString;
          id v23 = EventKitUIBundle();
          uint64_t v24 = [v23 localizedStringForKey:@"Can we move this event to <b>%@</b>?" value:&stru_1F0CC2140 table:0];
          double v25 = (void *)MEMORY[0x1E4F576C8];
          uint64_t v26 = [*(id *)(a1 + 32) proposedStartDate];
          uint64_t v27 = [*(id *)(a1 + 32) event];
          double v28 = [v27 timeZone];
          v29 = [v25 longStringForDateAndTime:v26 inTimeZone:v28];
          v30 = objc_msgSend(v22, "localizedStringWithFormat:", v24, v29);

          v31 = [[EKUIEmailCompositionManager alloc] initWithEvent:*(void *)(*(void *)(a1 + 32) + 1080) participantRecipients:v44 subjectPrefix:v43 bodyPrefix:v30];
          [*(id *)(a1 + 32) setMessageSendingManager:v31];

          v32 = objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
          v33 = [*(id *)(a1 + 32) messageSendingManager];
          objc_initWeak(&location, v33);

          objc_initWeak(&from, *(id *)(a1 + 32));
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __48__EKEventProposeNewTimeViewController__dismiss___block_invoke_2;
          v46[3] = &unk_1E6087A80;
          objc_copyWeak(&v49, &location);
          objc_copyWeak(&v50, &from);
          id v47 = *(id *)(a1 + 40);
          id v34 = v32;
          id v48 = v34;
          v35 = [*(id *)(a1 + 32) messageSendingManager];
          [v35 setMessageSendingComplete:v46];

          v36 = [*(id *)(a1 + 32) messageSendingManager];
          v37 = [v36 viewController];
          [v37 setModalPresentationStyle:2];

          id v38 = *(void **)(a1 + 32);
          v39 = [v38 messageSendingManager];
          v40 = [v39 viewController];
          [v38 _presentViewController:v40];

          objc_destroyWeak(&v50);
          objc_destroyWeak(&v49);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }
        else
        {
          [*(id *)(a1 + 40) rollback];
          [*(id *)(a1 + 32) _popViewControllerAnimated:1];
        }

        return;
      }
    }
    char v5 = [*(id *)(a1 + 32) event];
    if ([v5 participationStatus] != 2)
    {
      id v6 = [*(id *)(a1 + 32) event];
      uint64_t v7 = [v6 participationStatus];

      if (v7 == 4)
      {
LABEL_9:
        if (*(unsigned char *)(a1 + 48))
        {
          id v9 = [*(id *)(a1 + 32) proposedStartDate];

          BOOL v10 = v9 == 0;
          char v11 = (void *)MEMORY[0x1E4F57BA8];
          uint64_t v12 = [*(id *)(a1 + 32) event];
          double v13 = [v12 responseComment];
          if (v10)
          {
            id v14 = [v11 stringWithAutoCommentRemoved:v13];
            double v15 = [*(id *)(a1 + 32) event];
            [v15 setResponseComment:v14];
          }
          else
          {
            id v14 = [*(id *)(a1 + 32) proposedStartDate];
            double v15 = [*(id *)(a1 + 32) event];
            double v16 = [v15 timeZone];
            id v17 = [v11 comment:v13 withInsertedAutoCommentForDate:v14 timeZone:v16];
            id v18 = [*(id *)(a1 + 32) event];
            [v18 setResponseComment:v17];
          }
        }
        v41 = [*(id *)(a1 + 32) proposedStartDate];
        id v42 = [*(id *)(a1 + 32) event];
        [v42 setProposedStartDate:v41];

        objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        [v45 saveEvent:*(void *)(a1 + 40) span:0 error:0];
        [*(id *)(a1 + 32) _popViewControllerAnimated:1];

        return;
      }
      id v8 = [*(id *)(a1 + 32) event];
      [v8 setInvitationStatus:0];

      char v5 = [*(id *)(a1 + 32) event];
      [v5 setParticipationStatus:4];
    }

    goto LABEL_9;
  }
  [*(id *)(a1 + 40) rollback];
  id v19 = *(void **)(a1 + 32);

  [v19 _popViewControllerAnimated:1];
}

void __48__EKEventProposeNewTimeViewController__dismiss___block_invoke_2(id *a1, char a2)
{
  int v4 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);

    if (v6)
    {
      if (a2) {
        [a1[5] saveEvent:a1[4] span:0 error:0];
      }
      else {
        [a1[4] rollback];
      }
      uint64_t v7 = [WeakRetained viewController];
      id v8 = [v7 presentingViewController];
      [v8 dismissViewControllerAnimated:1 completion:0];

      [v5 _popViewControllerAnimated:1];
    }
  }
}

- (void)_eventModified:(id)a3
{
  [(EKEventProposeNewTimeViewController *)self setResetConflictResolutionSections:1];
  if ([(EKEventProposeNewTimeViewController *)self viewIsVisible])
  {
    [(EKEventProposeNewTimeViewController *)self _refreshIfNeeded];
  }
}

- (void)_fontSizeDefinitionsChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__EKEventProposeNewTimeViewController__fontSizeDefinitionsChanged___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__EKEventProposeNewTimeViewController__fontSizeDefinitionsChanged___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "sections", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 32) tableView];
        [v7 reloadAndRegisterReusableCellsWithTableView:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  id v9 = [*(id *)(a1 + 32) tableView];
  [v9 reloadData];
}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    id v7 = [(EKEventProposeNewTimeViewController *)self navigationController];
  }
  id v8 = v7;

  if (objc_opt_respondsToSelector()) {
    [v8 popViewControllerAnimated:v3];
  }
}

- (void)_pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v8 = [(EKEventProposeNewTimeViewController *)self navigationController];
  }
  id v9 = v8;

  if (objc_opt_respondsToSelector()) {
    [v9 pushViewController:v10 animated:v4];
  }
}

- (void)_presentViewController:(id)a3
{
  p_navigationDelegate = &self->_navigationDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_navigationDelegate);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v8 = [(EKEventProposeNewTimeViewController *)self _viewControllerForPresentingViewControllers];
  }
  id v9 = v8;

  [v9 presentViewController:v5 animated:1 completion:0];
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    id v7 = [(EKEventProposeNewTimeViewController *)self _viewControllerForPresentingViewControllers];
  }
  id v8 = v7;

  [v8 dismissViewControllerAnimated:v3 completion:0];
}

- (id)_viewControllerForPresentingViewControllers
{
  v2 = [(EKEventProposeNewTimeViewController *)self navigationController];
  BOOL v3 = [v2 presentingViewController];
  id v4 = [v3 presentedViewController];

  if (!v4)
  {
    id v4 = [v2 parentViewController];
    if (!v4) {
      id v4 = v2;
    }
  }

  return v4;
}

+ (id)_participantsInArray:(id)a3 thatAreNotInArray:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5 != v6)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                if (objc_msgSend(v12, "isEqualToParticipant:", *(void *)(*((void *)&v21 + 1) + 8 * j), v19))
                {

                  goto LABEL_17;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          [v20 addObject:v12];
LABEL_17:
          ;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    id v5 = v19;
  }

  return v20;
}

- (int64_t)_indexForSection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(EKEventProposeNewTimeViewController *)self sections];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      int64_t v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(id *)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 sectionShouldBeShown])
          {
            if (v11 == v4) {
              goto LABEL_13;
            }
            ++v9;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
    int64_t v9 = -1;
LABEL_13:
  }
  else
  {
    long long v12 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_ERROR, "No section given.  Will not try to find an index.", buf, 2u);
    }
    int64_t v9 = -1;
  }

  return v9;
}

- (id)_sectionForIndex:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_sections;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "sectionShouldBeShown", (void)v13))
        {
          if (v8 == a3)
          {
            id v11 = v10;
            goto LABEL_13;
          }
          ++v8;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (void)_refreshIfNeeded
{
  if ([(EKEventProposeNewTimeViewController *)self resetConflictResolutionSections])
  {
    [(EKEventProposeNewTimeViewController *)self setResetConflictResolutionSections:0];
    BOOL v3 = [(EKEventProposeNewTimeViewController *)self event];
    id v4 = [v3 calendar];
    uint64_t v5 = [v4 source];
    uint64_t v6 = [v5 ownerAddresses];
    id v9 = [v6 anyObject];

    uint64_t v7 = [(EKEventProposeNewTimeViewController *)self availabilitySearcher];
    uint64_t v8 = [(EKEventProposeNewTimeViewController *)self event];
    [v7 resetWithEvent:v8 organizerAddressForNewlyScheduledEvent:v9];
  }
}

- (void)_searcherStateChanged:(int64_t)a3
{
  uint64_t v5 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  unsigned int v57 = [v5 sectionShouldBeShown];

  uint64_t v6 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  unsigned int v58 = [v6 sectionShouldBeShown];

  uint64_t v7 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  unsigned int v51 = [v7 sectionShouldBeShown];

  uint64_t v8 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  int64_t v55 = [(EKEventProposeNewTimeViewController *)self _indexForSection:v8];

  id v9 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  int64_t v56 = [(EKEventProposeNewTimeViewController *)self _indexForSection:v9];

  uint64_t v10 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  int64_t v50 = [(EKEventProposeNewTimeViewController *)self _indexForSection:v10];

  id v11 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  uint64_t v53 = [v11 numberOfRows];

  long long v12 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  uint64_t v54 = [v12 numberOfRows];

  long long v13 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  uint64_t v49 = [v13 numberOfRows];

  long long v14 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v14 availabilitySearcherChangedState:a3];

  long long v15 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v15 availabilitySearcherChangedState:a3];

  long long v16 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  int64_t v46 = a3;
  [v16 availabilitySearcherChangedState:a3];

  long long v17 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  uint64_t v18 = [v17 sectionShouldBeShown];

  id v19 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  unsigned int v52 = [v19 sectionShouldBeShown];

  uint64_t v20 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  unsigned int v48 = [v20 sectionShouldBeShown];

  long long v21 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  int64_t v22 = [(EKEventProposeNewTimeViewController *)self _indexForSection:v21];

  long long v23 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  int64_t v24 = [(EKEventProposeNewTimeViewController *)self _indexForSection:v23];

  long long v25 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  int64_t v47 = [(EKEventProposeNewTimeViewController *)self _indexForSection:v25];

  long long v26 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  uint64_t v27 = [v26 numberOfRows];

  long long v28 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  uint64_t v29 = [v28 numberOfRows];

  v30 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  uint64_t v31 = [v30 numberOfRows];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__EKEventProposeNewTimeViewController__searcherStateChanged___block_invoke;
  aBlock[3] = &unk_1E6087AD0;
  void aBlock[4] = self;
  v32 = _Block_copy(aBlock);
  v33 = [(EKEventProposeNewTimeViewController *)self tableView];
  [v33 beginUpdates];

  id v34 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  (*((void (**)(void *, void *, void, int64_t, uint64_t, uint64_t, int64_t, uint64_t, _BYTE))v32
   + 2))(v32, v34, v57, v55, v53, v18, v22, v27, 0);

  v35 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  LOBYTE(v44) = 1;
  (*((void (**)(void *, void *, void, int64_t, uint64_t, void, int64_t, uint64_t, int))v32 + 2))(v32, v35, v58, v56, v54, v52, v24, v29, v44);

  v36 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];

  if (v36)
  {
    v37 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
    LOBYTE(v45) = 1;
    (*((void (**)(void *, void *, void, int64_t, uint64_t, void, int64_t, uint64_t, int))v32
     + 2))(v32, v37, v51, v50, v49, v48, v47, v31, v45);
  }
  id v38 = [(EKEventProposeNewTimeViewController *)self tableView];
  [v38 endUpdates];

  [(EKEventProposeNewTimeViewController *)self updateCheckmark];
  v39 = [(EKEvent *)self->_event calendar];
  v40 = [v39 source];
  v41 = [v40 constraints];
  int v42 = [v41 supportsAvailabilityRequests];

  if (v42)
  {
    if (v46)
    {
      [(EKEventProposeNewTimeViewController *)self _cancelAvailabilitySpinnerTimer];
      v43 = [(EKEventProposeNewTimeViewController *)self availabilitySearcherRunningSpinner];
      [v43 stopAnimating];
    }
    else
    {
      [(EKEventProposeNewTimeViewController *)self _scheduleAvailabilitySpinnerTimer];
    }
  }
}

void __61__EKEventProposeNewTimeViewController__searcherStateChanged___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  long long v16 = v15;
  if (a3 != a6)
  {
    if (a3)
    {
      id v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
      uint64_t v18 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412290;
        id v25 = v17;
        _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_DEBUG, "Deleting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [*(id *)(a1 + 32) tableView];
      [v19 deleteSections:v17 withRowAnimation:0];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a7];
      int64_t v22 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412290;
        id v25 = v17;
        _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_DEBUG, "Inserting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [*(id *)(a1 + 32) tableView];
      [v19 insertSections:v17 withRowAnimation:0];
    }
LABEL_20:

    goto LABEL_21;
  }
  if (a5 != a8 && a6)
  {
    if ([v15 injectNewRowsBeforeLastExistingRow])
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a5 - 1 < a8 - 1)
      {
        do
        {
          uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathForRow:a5 - 1 inSection:a7];
          [v17 addObject:v20];

          ++a5;
        }
        while (a8 != a5);
      }
      long long v21 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412290;
        id v25 = v17;
        _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_DEBUG, "Inserting rows at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [*(id *)(a1 + 32) tableView];
      [v19 insertRowsAtIndexPaths:v17 withRowAnimation:0];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a7];
      long long v23 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412290;
        id v25 = v17;
        _os_log_impl(&dword_1B3F4C000, v23, OS_LOG_TYPE_DEBUG, "Reloading sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [*(id *)(a1 + 32) tableView];
      [v19 reloadSections:v17 withRowAnimation:0];
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_scheduleAvailabilitySpinnerTimer
{
  [(EKEventProposeNewTimeViewController *)self _cancelAvailabilitySpinnerTimer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v4[2] = __72__EKEventProposeNewTimeViewController__scheduleAvailabilitySpinnerTimer__block_invoke;
  v4[3] = &unk_1E6087AF8;
  v4[4] = self;
  BOOL v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v4 block:1.0];
  [(EKEventProposeNewTimeViewController *)self setAvailabilitySearcherRunningSpinnerTimer:v3];
}

void __72__EKEventProposeNewTimeViewController__scheduleAvailabilitySpinnerTimer__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) availabilitySearcherRunningSpinner];
  [v1 startAnimating];
}

- (void)_cancelAvailabilitySpinnerTimer
{
  BOOL v3 = [(EKEventProposeNewTimeViewController *)self availabilitySearcherRunningSpinnerTimer];
  [v3 invalidate];

  [(EKEventProposeNewTimeViewController *)self setAvailabilitySearcherRunningSpinnerTimer:0];
}

- (void)updateCheckmark
{
  BOOL v3 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v3 clearCheckmark];

  id v4 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v4 clearCheckmark];

  uint64_t v5 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  [v5 clearCheckmark];

  uint64_t v6 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
  [v6 refreshCellsAfterStateChange];

  uint64_t v7 = [(EKEventProposeNewTimeViewController *)self allInviteesCanAttendSection];
  [v7 refreshCellsAfterStateChange];

  uint64_t v8 = [(EKEventProposeNewTimeViewController *)self someInviteesCanAttendSection];
  [v8 refreshCellsAfterStateChange];

  id v9 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
  uint64_t v10 = [(EKEventProposeNewTimeViewController *)self event];
  id v11 = [v10 startDate];
  char v12 = [v9 isEqualToDate:v11];

  if ((v12 & 1) == 0)
  {
    id v13 = [(EKEventProposeNewTimeViewController *)self originalConflictSection];
    [v13 clearCheckmark];
  }
}

- (void)dateChangedTo:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKEventProposeNewTimeViewController *)self proposedStartDate];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_INFO, "Proposed time has not changed. Do nothing. Date: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    [(EKEventProposeNewTimeViewController *)self setProposedStartDate:v4];
    [(EKEventProposeNewTimeViewController *)self updateCustomBackButton];
    [(EKEventProposeNewTimeViewController *)self _updateStatusButtons];
    [(EKEventProposeNewTimeViewController *)self updateCheckmark];
    uint64_t v8 = [(EKEventProposeNewTimeViewController *)self proposeTimeItem];
    [v8 setPendingProposedTime:0];
  }
}

- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = [(EKEventProposeNewTimeViewController *)self tableView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke;
  v12[3] = &unk_1E6087548;
  id v13 = v7;
  long long v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBatchUpdates:v12 completion:&__block_literal_global_4];
}

void __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    id v4 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_2;
    v17[3] = &unk_1E6087B20;
    id v18 = v3;
    id v5 = v3;
    [v4 enumerateIndexesUsingBlock:v17];
    int v6 = [*(id *)(a1 + 40) tableView];
    [v6 insertRowsAtIndexPaths:v5 withRowAnimation:0];
  }
  id v7 = *(void **)(a1 + 48);
  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    int v9 = *(void **)(a1 + 48);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_3;
    id v15 = &unk_1E6087B20;
    id v16 = v8;
    id v10 = v8;
    [v9 enumerateIndexesUsingBlock:&v12];
    id v11 = objc_msgSend(*(id *)(a1 + 40), "tableView", v12, v13, v14, v15);
    [v11 deleteRowsAtIndexPaths:v10 withRowAnimation:0];
  }
}

void __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  [*(id *)(a1 + 32) addObject:v3];
}

void __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  [*(id *)(a1 + 32) addObject:v3];
}

- (void)editItemRequiresHeightChange:(id)a3
{
  id v4 = [(EKEventProposeNewTimeViewController *)self tableView];
  [v4 beginUpdates];

  id v5 = [(EKEventProposeNewTimeViewController *)self tableView];
  [v5 endUpdates];
}

- (id)defaultAlertTitleForEditItem:(id)a3
{
  id v3 = EventKitUIBundle();
  id v4 = [v3 localizedStringForKey:@"Cannot Save Event" value:&stru_1F0CC2140 table:0];

  return v4;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  return (EKUIViewControllerNavigationDelegate *)WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (NSDate)selectedStartDate
{
  return self->_selectedStartDate;
}

- (NSDate)selectedEndDate
{
  return self->_selectedEndDate;
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIDelegate);

  return (EKViewControllerRemoteUIDelegate *)WeakRetained;
}

- (void)setRemoteUIDelegate:(id)a3
{
}

- (NSDate)originalDate
{
  return self->_originalDate;
}

- (void)setOriginalDate:(id)a3
{
}

- (BOOL)resetConflictResolutionSections
{
  return self->_resetConflictResolutionSections;
}

- (void)setResetConflictResolutionSections:(BOOL)a3
{
  self->_resetConflictResolutionSections = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void)setStatusButtonsView:(id)a3
{
}

- (void)setStatusButtonsContainerView:(id)a3
{
}

- (double)statusButtonsViewCachedFontSize
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)setStatusButtonsViewCachedFontSize:(double)a3
{
  self->_statusButtonsViewCachedFontSize = a3;
}

- (NSDate)proposedStartDate
{
  return self->_proposedStartDate;
}

- (void)setProposedStartDate:(id)a3
{
}

- (UIActivityIndicatorView)availabilitySearcherRunningSpinner
{
  return self->_availabilitySearcherRunningSpinner;
}

- (void)setAvailabilitySearcherRunningSpinner:(id)a3
{
}

- (NSTimer)availabilitySearcherRunningSpinnerTimer
{
  return self->_availabilitySearcherRunningSpinnerTimer;
}

- (void)setAvailabilitySearcherRunningSpinnerTimer:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (EKEventDateEditItem)proposeTimeItem
{
  return self->_proposeTimeItem;
}

- (void)setProposeTimeItem:(id)a3
{
}

- (EKUIInviteesViewOriginalConflictSection)originalConflictSection
{
  return self->_originalConflictSection;
}

- (void)setOriginalConflictSection:(id)a3
{
}

- (EKUIInviteesViewSomeInviteesCanAttendSection)someInviteesCanAttendSection
{
  return self->_someInviteesCanAttendSection;
}

- (void)setSomeInviteesCanAttendSection:(id)a3
{
}

- (EKUIInviteesViewAllInviteesCanAttendSection)allInviteesCanAttendSection
{
  return self->_allInviteesCanAttendSection;
}

- (void)setAllInviteesCanAttendSection:(id)a3
{
}

- (EKUIInviteesViewAvailabilitySection)viewAvailabilitySection
{
  return self->_viewAvailabilitySection;
}

- (void)setViewAvailabilitySection:(id)a3
{
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong((id *)&self->_viewAvailabilitySection, 0);
  objc_storeStrong((id *)&self->_allInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_someInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_originalConflictSection, 0);
  objc_storeStrong((id *)&self->_proposeTimeItem, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_availabilitySearcherRunningSpinnerTimer, 0);
  objc_storeStrong((id *)&self->_availabilitySearcherRunningSpinner, 0);
  objc_storeStrong((id *)&self->_proposedStartDate, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_selectedEndDate, 0);
  objc_storeStrong((id *)&self->_selectedStartDate, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);

  objc_storeStrong((id *)&self->_model, 0);
}

@end