@interface EKUIEventInviteesViewController
+ (id)_participantsInArray:(id)a3 thatAreNotInArray:(id)a4;
- (BOOL)deletedParticipants;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (BOOL)fromDetail;
- (BOOL)hidesBottomBarWhenPushed;
- (BOOL)hidesManagedAttendeesSection;
- (BOOL)prohibitCallingSearcherStateChanged;
- (BOOL)resetAttendeesSections;
- (BOOL)resetConflictResolutionSections;
- (BOOL)showsManagedAttendeesSectionFooter;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)useCustomBackButton;
- (BOOL)usesCustomToolbar;
- (BOOL)usesRaisedCustomToolbar;
- (BOOL)viewIsVisible;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKInviteeAlternativeTimeSearcher)availabilitySearcher;
- (EKUIEmailCompositionManager)messageSendingManager;
- (EKUIEventInviteesEditViewController)parentController;
- (EKUIEventInviteesView)inviteesView;
- (EKUIEventInviteesViewController)initWithEvent:(id)a3 fromDetail:(BOOL)a4 model:(id)a5;
- (EKUIInviteesViewAddInviteesSection)addInviteesSection;
- (EKUIInviteesViewAllInviteesCanAttendSection)allInviteesCanAttendSection;
- (EKUIInviteesViewAvailabilitySection)availabilitySection;
- (EKUIInviteesViewInvisibleInviteeStatusSection)invisibleInviteeStatusSection;
- (EKUIInviteesViewNotRespondedInviteesSection)notRespondedSection;
- (EKUIInviteesViewOriginalConflictSection)originalConflictSection;
- (EKUIInviteesViewProposedTimeSection)proposedTimeSection;
- (EKUIInviteesViewSomeInviteesCanAttendSection)someInviteesCanAttendSection;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (EKViewControllerRemoteUIDelegate)remoteUIDelegate;
- (NSArray)sections;
- (NSDate)selectedEndDate;
- (NSDate)selectedStartDate;
- (NSMutableArray)respondedSection;
- (UITableView)tableView;
- (UIViewController)presentedController;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)EKUI_oopContentBackgroundColor;
- (id)_sectionForIndex:(unint64_t)a3;
- (id)availabilityTapped;
- (id)editItemEventToDetach;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_indexForSection:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss:(id)a3;
- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3;
- (void)_eventModified:(id)a3;
- (void)_fontSizeDefinitionsChanged:(id)a3;
- (void)_popViewControllerAnimated:(BOOL)a3;
- (void)_presentViewController:(id)a3;
- (void)_pushViewController:(id)a3;
- (void)_refreshIfNeeded;
- (void)_requestDismissal;
- (void)_searcherStateChanged:(int64_t)a3;
- (void)_sendMessageToParticipants:(id)a3;
- (void)_smoothRefreshIfNeededForSections:(id)a3;
- (void)addInviteesTapped;
- (void)dealloc;
- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)loadView;
- (void)prepareToReloadAttendeesSections;
- (void)resetBackgroundColor;
- (void)saveAndDismissWithPrompt;
- (void)setAddInviteesSection:(id)a3;
- (void)setAllInviteesCanAttendSection:(id)a3;
- (void)setAvailabilitySearcher:(id)a3;
- (void)setAvailabilitySection:(id)a3;
- (void)setDeletedParticipants:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setFromDetail:(BOOL)a3;
- (void)setHidesManagedAttendeesSection:(BOOL)a3;
- (void)setInvisibleInviteeStatusSection:(id)a3;
- (void)setInviteesView:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setNotRespondedSection:(id)a3;
- (void)setOriginalConflictSection:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPresentedController:(id)a3;
- (void)setProhibitCallingSearcherStateChanged:(BOOL)a3;
- (void)setProposedTimeSection:(id)a3;
- (void)setRemoteUIDelegate:(id)a3;
- (void)setResetAttendeesSections:(BOOL)a3;
- (void)setResetConflictResolutionSections:(BOOL)a3;
- (void)setRespondedSection:(id)a3;
- (void)setSections:(id)a3;
- (void)setSelectedEndDate:(id)a3;
- (void)setSelectedStartDate:(id)a3;
- (void)setSomeInviteesCanAttendSection:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUsesCustomToolbar:(BOOL)a3;
- (void)setUsesRaisedCustomToolbar:(BOOL)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateCustomNavigationItemButtons;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKUIEventInviteesViewController

- (EKUIEventInviteesViewController)initWithEvent:(id)a3 fromDetail:(BOOL)a4 model:(id)a5
{
  BOOL v6 = a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)EKUIEventInviteesViewController;
  v10 = [(EKUIEventInviteesViewController *)&v28 initWithNibName:0 bundle:0];
  if (v10)
  {
    v11 = EventKitUIBundle();
    v12 = [v11 localizedStringForKey:@"Invitees" value:&stru_1F0CC2140 table:0];
    [(EKUIEventInviteesViewController *)v10 setTitle:v12];

    v13 = [v8 startDate];
    [(EKUIEventInviteesViewController *)v10 setSelectedStartDate:v13];

    v14 = [v8 endDateUnadjustedForLegacyClients];
    [(EKUIEventInviteesViewController *)v10 setSelectedEndDate:v14];

    [(EKUIEventInviteesViewController *)v10 setEvent:v8];
    [(EKUIEventInviteesViewController *)v10 setResetAttendeesSections:1];
    [(EKUIEventInviteesViewController *)v10 setResetConflictResolutionSections:1];
    [(EKUIEventInviteesViewController *)v10 setFromDetail:v6];
    [(EKUIEventInviteesViewController *)v10 setProhibitCallingSearcherStateChanged:0];
    objc_storeStrong((id *)&v10->_model, a5);
    v15 = [(EKUIEventInviteesViewController *)v10 event];
    int v16 = [v15 isSelfOrganized];

    if (v16)
    {
      v17 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEBUG, "Initializing the availability searcher.", (uint8_t *)buf, 2u);
      }
      objc_initWeak(buf, v10);
      id v18 = objc_alloc(MEMORY[0x1E4F25578]);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke;
      v25[3] = &unk_1E60878F0;
      objc_copyWeak(&v26, buf);
      v19 = (void *)[v18 initWithStateChangedCallback:v25];
      [(EKUIEventInviteesViewController *)v10 setAvailabilitySearcher:v19];

      objc_destroyWeak(&v26);
      objc_destroyWeak(buf);
    }
    objc_initWeak(buf, v10);
    v29[0] = objc_opt_class();
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_3;
    v23[3] = &unk_1E60874F8;
    objc_copyWeak(&v24, buf);
    id v21 = (id)[(EKUIEventInviteesViewController *)v10 registerForTraitChanges:v20 withHandler:v23];

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }

  return v10;
}

void __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_2;
  v3[3] = &unk_1E60878C8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _searcherStateChanged:*(void *)(a1 + 40)];
}

void __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)dealloc
{
  v3 = [(EKUIEventInviteesViewController *)self inviteesView];
  [v3 setDelegate:0];

  v4 = [(EKUIEventInviteesViewController *)self inviteesView];
  [v4 setDataSource:0];

  v5.receiver = self;
  v5.super_class = (Class)EKUIEventInviteesViewController;
  [(EKUIEventInviteesViewController *)&v5 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v7 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__eventModified_ name:*MEMORY[0x1E4F25448] object:self->_event];
  [v4 addObserver:self selector:sel__fontSizeDefinitionsChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  objc_super v5 = [EKUIEventInviteesView alloc];
  [v7 bounds];
  BOOL v6 = -[EKUIEventInviteesView initWithFrame:style:](v5, "initWithFrame:style:", 2);
  [(EKUIEventInviteesView *)v6 setAutoresizingMask:18];
  [(EKUIEventInviteesView *)v6 setDelegate:self];
  [(EKUIEventInviteesView *)v6 setDataSource:self];
  [(EKUIEventInviteesViewController *)self setInviteesView:v6];
  if (EKUICatalyst()) {
    [(EKUIEventInviteesView *)v6 setSeparatorStyle:1];
  }
  [(EKUIEventInviteesViewController *)self setTableView:v6];
  [(EKUIEventInviteesViewController *)self resetBackgroundColor];
  [v7 addSubview:v6];
  [(EKUIEventInviteesViewController *)self setView:v7];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  id v5 = [(EKUIEventInviteesViewController *)self tableView];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v4];
}

- (BOOL)hidesBottomBarWhenPushed
{
  return 1;
}

- (void)viewDidLoad
{
  v212[11] = *MEMORY[0x1E4F143B8];
  v208.receiver = self;
  v208.super_class = (Class)EKUIEventInviteesViewController;
  [(EKUIEventInviteesViewController *)&v208 viewDidLoad];
  objc_initWeak(&location, self);
  v2 = objc_alloc_init(EKUIInviteesViewAddInviteesSection);
  [(EKUIEventInviteesViewController *)self setAddInviteesSection:v2];

  BOOL v3 = objc_opt_new();
  [(EKUIEventInviteesViewController *)self setRespondedSection:v3];

  uint64_t v4 = 0;
  do
  {
    id v5 = [(EKUIEventInviteesViewController *)self respondedSection];
    BOOL v6 = [[EKUIInviteesViewRespondedInviteesSection alloc] initWithResponseType:v4];
    [v5 addObject:v6];

    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 3);
  id v7 = objc_alloc_init(EKUIInviteesViewNotRespondedInviteesSection);
  [(EKUIEventInviteesViewController *)self setNotRespondedSection:v7];

  id v8 = objc_alloc_init(EKUIInviteesViewInvisibleInviteeStatusSection);
  [(EKUIEventInviteesViewController *)self setInvisibleInviteeStatusSection:v8];

  id v9 = objc_alloc_init(EKUIInviteesViewAvailabilitySection);
  [(EKUIEventInviteesViewController *)self setAvailabilitySection:v9];

  v10 = objc_alloc_init(EKUIInviteesViewProposedTimeSection);
  [(EKUIEventInviteesViewController *)self setProposedTimeSection:v10];

  v11 = objc_alloc_init(EKUIInviteesViewOriginalConflictSection);
  [(EKUIEventInviteesViewController *)self setOriginalConflictSection:v11];

  v12 = [(EKUIEventInviteesViewController *)self event];
  v13 = [v12 startTimeZone];
  v14 = [(EKUIEventInviteesViewController *)self originalConflictSection];
  [v14 setTimeZone:v13];

  v15 = objc_alloc_init(EKUIInviteesViewAllInviteesCanAttendSection);
  [(EKUIEventInviteesViewController *)self setAllInviteesCanAttendSection:v15];

  int v16 = [(EKUIEventInviteesViewController *)self event];
  v17 = [v16 startTimeZone];
  id v18 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  [v18 setTimeZone:v17];

  v19 = objc_alloc_init(EKUIInviteesViewSomeInviteesCanAttendSection);
  [(EKUIEventInviteesViewController *)self setSomeInviteesCanAttendSection:v19];

  v20 = [(EKUIEventInviteesViewController *)self event];
  id v21 = [v20 startTimeZone];
  v22 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  [v22 setTimeZone:v21];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E6087F50;
  objc_copyWeak(&v206, &location);
  v23 = _Block_copy(aBlock);
  v203[0] = MEMORY[0x1E4F143A8];
  v203[1] = 3221225472;
  v203[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_43;
  v203[3] = &unk_1E6087F78;
  objc_copyWeak(&v204, &location);
  v121 = _Block_copy(v203);
  v201[0] = MEMORY[0x1E4F143A8];
  v201[1] = 3221225472;
  v201[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_46;
  v201[3] = &unk_1E6087FC8;
  objc_copyWeak(&v202, &location);
  id v24 = _Block_copy(v201);
  v199[0] = MEMORY[0x1E4F143A8];
  v199[1] = 3221225472;
  v199[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3;
  v199[3] = &unk_1E6087968;
  objc_copyWeak(&v200, &location);
  v113 = _Block_copy(v199);
  v197[0] = MEMORY[0x1E4F143A8];
  v197[1] = 3221225472;
  v197[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_54;
  v197[3] = &unk_1E6087FF0;
  objc_copyWeak(&v198, &location);
  v111 = _Block_copy(v197);
  v195[0] = MEMORY[0x1E4F143A8];
  v195[1] = 3221225472;
  v195[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_56;
  v195[3] = &unk_1E6088018;
  objc_copyWeak(&v196, &location);
  v115 = _Block_copy(v195);
  v193[0] = MEMORY[0x1E4F143A8];
  v193[1] = 3221225472;
  v193[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_58;
  v193[3] = &unk_1E6088040;
  objc_copyWeak(&v194, &location);
  v120 = _Block_copy(v193);
  v25 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  [v25 setParticipantTapped:v121];

  v190[0] = MEMORY[0x1E4F143A8];
  v190[1] = 3221225472;
  v190[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2_60;
  v190[3] = &unk_1E6088068;
  id v26 = v24;
  id v191 = v26;
  objc_copyWeak(&v192, &location);
  v27 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  [v27 setParticipantRemoved:v190];

  v187[0] = MEMORY[0x1E4F143A8];
  v187[1] = 3221225472;
  v187[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3_62;
  v187[3] = &unk_1E6087A08;
  id v28 = v23;
  id v188 = v28;
  objc_copyWeak(&v189, &location);
  v29 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  [v29 setTableViewCellHook:v187];

  v30 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  [v30 setParticipantSetRole:v120];

  v31 = [(EKUIEventInviteesViewController *)self invisibleInviteeStatusSection];
  [v31 setParticipantTapped:v121];

  v184[0] = MEMORY[0x1E4F143A8];
  v184[1] = 3221225472;
  v184[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_4;
  v184[3] = &unk_1E6088068;
  id v118 = v26;
  id v185 = v118;
  objc_copyWeak(&v186, &location);
  v32 = [(EKUIEventInviteesViewController *)self invisibleInviteeStatusSection];
  [v32 setParticipantRemoved:v184];

  v33 = [(EKUIEventInviteesViewController *)self invisibleInviteeStatusSection];
  [v33 setParticipantSetRole:v120];

  v181[0] = MEMORY[0x1E4F143A8];
  v181[1] = 3221225472;
  v181[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_5;
  v181[3] = &unk_1E6087A08;
  id v116 = v28;
  id v182 = v116;
  objc_copyWeak(&v183, &location);
  v34 = [(EKUIEventInviteesViewController *)self respondedSection];
  v35 = [v34 objectAtIndexedSubscript:2];
  [v35 setTableViewCellHook:v181];

  uint64_t v36 = 0;
  uint64_t v37 = MEMORY[0x1E4F143A8];
  do
  {
    v38 = [(EKUIEventInviteesViewController *)self respondedSection];
    v39 = [v38 objectAtIndexedSubscript:v36];
    [v39 setParticipantTapped:v121];

    v177[0] = v37;
    v177[1] = 3221225472;
    v177[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_6;
    v177[3] = &unk_1E6088090;
    id v40 = v118;
    id v178 = v40;
    objc_copyWeak(&v179, &location);
    int v180 = v36;
    v41 = [(EKUIEventInviteesViewController *)self respondedSection];
    v42 = [v41 objectAtIndexedSubscript:v36];
    [v42 setParticipantRemoved:v177];

    v173[0] = v37;
    v173[1] = 3221225472;
    v173[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_7;
    v173[3] = &unk_1E60880B8;
    id v43 = v116;
    id v174 = v43;
    objc_copyWeak(&v175, &location);
    int v176 = v36;
    v44 = [(EKUIEventInviteesViewController *)self respondedSection];
    v45 = [v44 objectAtIndexedSubscript:v36];
    [v45 setTableViewCellHook:v173];

    v46 = [(EKUIEventInviteesViewController *)self respondedSection];
    v47 = [v46 objectAtIndexedSubscript:v36];
    [v47 setParticipantSetRole:v120];

    objc_destroyWeak(&v175);
    objc_destroyWeak(&v179);

    ++v36;
  }
  while (v36 != 3);
  v48 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  [v48 setParticipantSetRole:v120];

  v49 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  [v49 setParticipantTapped:v121];

  v170[0] = MEMORY[0x1E4F143A8];
  v170[1] = 3221225472;
  v170[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_8;
  v170[3] = &unk_1E6088068;
  id v109 = v40;
  id v171 = v109;
  objc_copyWeak(&v172, &location);
  v50 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  [v50 setParticipantRemoved:v170];

  v167[0] = MEMORY[0x1E4F143A8];
  v167[1] = 3221225472;
  v167[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_9;
  v167[3] = &unk_1E6087A08;
  id v51 = v43;
  id v168 = v51;
  objc_copyWeak(&v169, &location);
  v52 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  [v52 setTableViewCellHook:v167];

  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_10;
  v165[3] = &unk_1E6087918;
  objc_copyWeak(&v166, &location);
  v53 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  [v53 setAddInviteesTapped:v165];
  v54 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  [v54 setAddInviteesTapped:v165];

  v163[0] = MEMORY[0x1E4F143A8];
  v163[1] = 3221225472;
  v163[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_11;
  v163[3] = &unk_1E6087918;
  objc_copyWeak(&v164, &location);
  v55 = [(EKUIEventInviteesViewController *)self availabilitySection];
  [v55 setViewAvailabilityTapped:v163];

  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_14;
  v160[3] = &unk_1E6087A08;
  id v56 = v51;
  id v161 = v56;
  objc_copyWeak(&v162, &location);
  v57 = [(EKUIEventInviteesViewController *)self availabilitySection];
  [v57 setTableViewCellHook:v160];

  v58 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
  v59 = [(EKUIEventInviteesViewController *)self availabilitySearcher];
  [v58 setAvailabilitySearcher:v59];

  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_15;
  v158[3] = &unk_1E6087A58;
  id v60 = v113;
  id v159 = v60;
  v61 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
  [v61 setShowPreviewOfEventAtTime:v158];

  v155[0] = MEMORY[0x1E4F143A8];
  v155[1] = 3221225472;
  v155[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_16;
  v155[3] = &unk_1E6087A08;
  id v62 = v56;
  id v156 = v62;
  objc_copyWeak(&v157, &location);
  v63 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
  [v63 setTableViewCellHook:v155];

  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_17;
  v152[3] = &unk_1E6087A30;
  id v64 = v111;
  id v153 = v64;
  objc_copyWeak(&v154, &location);
  v65 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
  [v65 setNewTimeChosen:v152];

  v66 = [(EKUIEventInviteesViewController *)self originalConflictSection];
  v67 = [(EKUIEventInviteesViewController *)self availabilitySearcher];
  [v66 setAvailabilitySearcher:v67];

  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_18;
  v149[3] = &unk_1E60879E0;
  objc_copyWeak(&v151, &location);
  id v68 = v60;
  id v150 = v68;
  v69 = [(EKUIEventInviteesViewController *)self originalConflictSection];
  [v69 setShowPreviewOfEventAtTime:v149];

  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_19;
  v146[3] = &unk_1E6087A08;
  id v70 = v62;
  id v147 = v70;
  objc_copyWeak(&v148, &location);
  v71 = [(EKUIEventInviteesViewController *)self originalConflictSection];
  [v71 setTableViewCellHook:v146];

  v143[0] = MEMORY[0x1E4F143A8];
  v143[1] = 3221225472;
  v143[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_20;
  v143[3] = &unk_1E6087A30;
  id v72 = v64;
  id v144 = v72;
  objc_copyWeak(&v145, &location);
  v73 = [(EKUIEventInviteesViewController *)self originalConflictSection];
  [v73 setNewTimeChosen:v143];

  v74 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  v75 = [(EKUIEventInviteesViewController *)self availabilitySearcher];
  [v74 setAvailabilitySearcher:v75];

  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_21;
  v141[3] = &unk_1E6087A58;
  id v76 = v68;
  id v142 = v76;
  v77 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  [v77 setShowPreviewOfEventAtTime:v141];

  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_22;
  v138[3] = &unk_1E6087A08;
  id v78 = v70;
  id v139 = v78;
  objc_copyWeak(&v140, &location);
  v79 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  [v79 setTableViewCellHook:v138];

  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_23;
  v135[3] = &unk_1E6087A30;
  id v80 = v72;
  id v136 = v80;
  objc_copyWeak(&v137, &location);
  v81 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  [v81 setNewTimeChosen:v135];

  v82 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  [v82 setShowMoreAlternativeTimesTapped:v115];

  v83 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  v84 = [(EKUIEventInviteesViewController *)self availabilitySearcher];
  [v83 setAvailabilitySearcher:v84];

  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_24;
  v133[3] = &unk_1E6087A58;
  id v108 = v76;
  id v134 = v108;
  v85 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  [v85 setShowPreviewOfEventAtTime:v133];

  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_25;
  v130[3] = &unk_1E6087A08;
  id v106 = v78;
  id v131 = v106;
  objc_copyWeak(&v132, &location);
  v86 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  [v86 setTableViewCellHook:v130];

  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_26;
  v127[3] = &unk_1E6087A30;
  id v107 = v80;
  id v128 = v107;
  objc_copyWeak(&v129, &location);
  v87 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  [v87 setNewTimeChosen:v127];

  v88 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  [v88 setShowMoreAlternativeTimesTapped:v115];

  v119 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  v212[0] = v119;
  v117 = [(EKUIEventInviteesViewController *)self invisibleInviteeStatusSection];
  v212[1] = v117;
  v114 = [(EKUIEventInviteesViewController *)self respondedSection];
  v112 = [v114 objectAtIndexedSubscript:0];
  v212[2] = v112;
  v110 = [(EKUIEventInviteesViewController *)self respondedSection];
  v89 = [v110 objectAtIndexedSubscript:1];
  v212[3] = v89;
  v90 = [(EKUIEventInviteesViewController *)self respondedSection];
  v91 = [v90 objectAtIndexedSubscript:2];
  v212[4] = v91;
  v92 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  v212[5] = v92;
  v93 = [(EKUIEventInviteesViewController *)self availabilitySection];
  v212[6] = v93;
  v94 = [(EKUIEventInviteesViewController *)self originalConflictSection];
  v212[7] = v94;
  v95 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
  v212[8] = v95;
  v96 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
  v212[9] = v96;
  v97 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
  v212[10] = v97;
  v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:11];
  [(EKUIEventInviteesViewController *)self setSections:v98];

  v99 = (id)kEKUILogInviteesHandle;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    v100 = [(EKUIEventInviteesViewController *)self sections];
    *(_DWORD *)buf = 138412290;
    v211 = v100;
    _os_log_impl(&dword_1B3F4C000, v99, OS_LOG_TYPE_DEBUG, "Set up sections: [%@].", buf, 0xCu);
  }
  v101 = [(EKUIEventInviteesViewController *)self inviteesView];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v102 = [(EKUIEventInviteesViewController *)self sections];
  uint64_t v103 = [v102 countByEnumeratingWithState:&v123 objects:v209 count:16];
  if (v103)
  {
    uint64_t v104 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v103; ++i)
      {
        if (*(void *)v124 != v104) {
          objc_enumerationMutation(v102);
        }
        objc_msgSend(*(id *)(*((void *)&v123 + 1) + 8 * i), "reloadAndRegisterReusableCellsWithTableView:", v101, v106);
      }
      uint64_t v103 = [v102 countByEnumeratingWithState:&v123 objects:v209 count:16];
    }
    while (v103);
  }

  [(EKUIEventInviteesViewController *)self _refreshIfNeeded];
  objc_destroyWeak(&v129);

  objc_destroyWeak(&v132);
  objc_destroyWeak(&v137);

  objc_destroyWeak(&v140);
  objc_destroyWeak(&v145);

  objc_destroyWeak(&v148);
  objc_destroyWeak(&v151);
  objc_destroyWeak(&v154);

  objc_destroyWeak(&v157);
  objc_destroyWeak(&v162);

  objc_destroyWeak(&v164);
  objc_destroyWeak(&v166);
  objc_destroyWeak(&v169);

  objc_destroyWeak(&v172);
  objc_destroyWeak(&v183);

  objc_destroyWeak(&v186);
  objc_destroyWeak(&v189);

  objc_destroyWeak(&v192);
  objc_destroyWeak(&v194);

  objc_destroyWeak(&v196);
  objc_destroyWeak(&v198);

  objc_destroyWeak(&v200);
  objc_destroyWeak(&v202);

  objc_destroyWeak(&v204);
  objc_destroyWeak(&v206);
  objc_destroyWeak(&location);
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = v5;
  if (a3 < 0)
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = NSNumber;
      int v16 = v14;
      v17 = [v15 numberWithInteger:a3];
      int v23 = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "Invalid row index given: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v23, 0xCu);
    }
  }
  else if ([v5 sectionShouldBeShown])
  {
    id v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v7);
    uint64_t v9 = [WeakRetained _indexForSection:v6];

    if (v9 != -1)
    {
      v10 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:v9];
      id v11 = objc_loadWeakRetained(v7);
      v12 = [v11 inviteesView];
      v13 = [v12 cellForRowAtIndexPath:v10];

      goto LABEL_10;
    }
    id v18 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v19 = NSNumber;
      v20 = v18;
      id v21 = [v19 numberWithInteger:-1];
      int v23 = 138412290;
      id v24 = v21;
      _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_ERROR, "Invalid section index found: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v23, 0xCu);
    }
  }
  v13 = 0;
LABEL_10:

  return v13;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "Participant tapped: [%@].", (uint8_t *)&v7, 0xCu);
  }
  id v5 = [[EKIdentityViewController alloc] initWithIdentity:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pushViewController:v5];
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_46(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v10;
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Participant removed: [%@].", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = [WeakRetained inviteesView];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_47;
  v22[3] = &unk_1E6087FA0;
  objc_copyWeak(&v27, (id *)(a1 + 32));
  id v16 = v12;
  id v26 = v16;
  id v17 = v10;
  id v23 = v17;
  id v18 = v9;
  id v24 = v18;
  id v19 = v11;
  id v25 = v19;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_49;
  v20[3] = &unk_1E60875E8;
  objc_copyWeak(&v21, (id *)(a1 + 32));
  [v15 performBatchUpdates:v22 completion:v20];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v27);
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_47(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained availabilitySection];
  int v5 = [v4 sectionShouldBeShown];

  id v6 = objc_loadWeakRetained(v2);
  int v7 = [v6 availabilitySection];
  uint64_t v8 = [v6 _indexForSection:v7];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v9 = objc_loadWeakRetained(v2);
  id v10 = [v9 event];
  [v10 removeAttendee:*(void *)(a1 + 32)];

  id v11 = objc_loadWeakRetained(v2);
  id v12 = [v11 availabilitySection];
  char v13 = [v12 sectionShouldBeShown];

  if (v5 && (v13 & 1) == 0)
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v15 = NSNumber;
      id v16 = v14;
      id v17 = [v15 numberWithInteger:v8];
      *(_DWORD *)buf = 138412290;
      v33 = v17;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_DEBUG, "The show availability section was present and now is not. Deleting this section: %@", buf, 0xCu);
    }
    id v18 = objc_loadWeakRetained(v2);
    id v19 = [v18 inviteesView];
    v20 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v8];
    [v19 deleteSections:v20 withRowAnimation:5];
  }
  if ([*(id *)(a1 + 40) numberOfRows])
  {
    id v21 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v33 = v22;
      _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_DEBUG, "Deleting row at index path: [%@].", buf, 0xCu);
    }
    id v23 = objc_loadWeakRetained(v2);
    id v24 = [v23 inviteesView];
    uint64_t v31 = *(void *)(a1 + 48);
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v24 deleteRowsAtIndexPaths:v25 withRowAnimation:5];
  }
  else
  {
    uint64_t v26 = [*(id *)(a1 + 48) section];
    id v27 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      id v28 = NSNumber;
      id v29 = v27;
      uint64_t v30 = [v28 numberWithInteger:v26];
      *(_DWORD *)buf = 138412290;
      v33 = v30;
      _os_log_impl(&dword_1B3F4C000, v29, OS_LOG_TYPE_DEBUG, "There are no more attendees left in section [%@].  Deleting this section.", buf, 0xCu);
    }
    id v23 = objc_loadWeakRetained(v2);
    id v24 = [v23 inviteesView];
    id v25 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v26];
    [v24 deleteSections:v25 withRowAnimation:5];
  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_49(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setProhibitCallingSearcherStateChanged:1];

    dispatch_time_t v4 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2;
    block[3] = &unk_1E6087918;
    objc_copyWeak(&v6, v2);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setProhibitCallingSearcherStateChanged:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setResetConflictResolutionSections:1];

  id v4 = objc_loadWeakRetained(v1);
  [v4 _refreshIfNeeded];

  id v5 = objc_loadWeakRetained(v1);
  [v5 updateCustomNavigationItemButtons];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setDeletedParticipants:1];
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Showing preview of event.  Date to show: [%@].  Overridden start date: [%@]  Overridden start date: [%@]", (uint8_t *)&v14, 0x20u);
    }
    id v12 = [[EKDayPreviewController alloc] initWithDate:v7 event:WeakRetained[133] overriddenEventStartDate:v8 overriddenEventEndDate:v9 model:WeakRetained[122]];
    [(EKDayPreviewController *)v12 setStyle:2];
    char v13 = [WeakRetained navigationDelegate];
    [v13 pushViewController:v12 animated:1];
  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_54(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Setting selected date.  Start date:[%@]  End date: [%@].", buf, 0x16u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15++), "clearCheckmark", (void)v20);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  __int16 v16 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v16);
  [WeakRetained setSelectedStartDate:v7];

  id v18 = objc_loadWeakRetained(v16);
  [v18 setSelectedEndDate:v8];

  id v19 = objc_loadWeakRetained(v16);
  [v19 updateCustomNavigationItemButtons];
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "'Show more alternative times' tapped.", v7, 2u);
  }
  if ([v3 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = [WeakRetained inviteesView];
    [v6 reloadData];
  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_58(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v9);
  id v11 = objc_msgSend(WeakRetained, "event", 0);
  uint64_t v12 = [v11 attendees];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v7 isEqualToParticipant:v17]) {
          [v17 setParticipantRole:a3];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  id v18 = objc_loadWeakRetained(v9);
  [v18 setResetAttendeesSections:1];

  id v19 = objc_loadWeakRetained(v9);
  [v19 _smoothRefreshIfNeededForSections:v8];

  id v20 = objc_loadWeakRetained(v9);
  [v20 updateCustomNavigationItemButtons];
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2_60(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  id v11 = [WeakRetained addInviteesSection];
  (*(void (**)(uint64_t, void *, id, id, id))(v6 + 16))(v6, v11, v10, v9, v8);
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3_62(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained addInviteesSection];
  uint64_t v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  id v11 = [WeakRetained invisibleInviteeStatusSection];
  (*(void (**)(uint64_t, void *, id, id, id))(v6 + 16))(v6, v11, v10, v9, v8);
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained invisibleInviteeStatusSection];
  uint64_t v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = (id *)(a1 + 40);
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  uint64_t v12 = [WeakRetained respondedSection];
  uint64_t v13 = [v12 objectAtIndexedSubscript:*(int *)(a1 + 48)];
  (*(void (**)(uint64_t, void *, id, id, id))(v7 + 16))(v7, v13, v11, v10, v9);
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained respondedSection];
  uint64_t v7 = [v6 objectAtIndexedSubscript:*(int *)(a1 + 48)];
  id v8 = (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v7, a2);

  return v8;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  id v11 = [WeakRetained notRespondedSection];
  (*(void (**)(uint64_t, void *, id, id, id))(v6 + 16))(v6, v11, v10, v9, v8);
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained notRespondedSection];
  uint64_t v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained addInviteesTapped];
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_11(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained availabilityTapped];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = objc_msgSend(v4, "EKUI_editor");

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_12;
  v7[3] = &unk_1E60880E0;
  objc_copyWeak(&v9, v1);
  id v6 = v5;
  id v8 = v6;
  [v3 setSaveBlock:v7];

  objc_destroyWeak(&v9);
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setProhibitCallingSearcherStateChanged:1];

  id v8 = [v6 startDate];
  id v9 = objc_loadWeakRetained(v5);
  [v9 setSelectedStartDate:v8];

  [*(id *)(a1 + 32) saveEvent:v6 span:a3 error:0];
  dispatch_time_t v10 = dispatch_time(0, 600000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_13;
  block[3] = &unk_1E6087918;
  objc_copyWeak(&v12, v5);
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v12);
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_13(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setProhibitCallingSearcherStateChanged:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setResetAttendeesSections:1];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setResetConflictResolutionSections:1];

  id v5 = objc_loadWeakRetained(v1);
  [v5 _refreshIfNeeded];

  id v6 = objc_loadWeakRetained(v1);
  [v6 updateCustomNavigationItemButtons];
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained availabilitySection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

uint64_t __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained proposedTimeSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained originalConflictSection];
  id v10 = objc_loadWeakRetained(v5);
  id v11 = objc_msgSend(v10, "allInviteesCanAttendSection", v9);
  v15[1] = v11;
  id v12 = objc_loadWeakRetained(v5);
  uint64_t v13 = [v12 someInviteesCanAttendSection];
  v15[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_18(uint64_t a1, void *a2, void *a3)
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
    uint64_t v13 = v6;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained originalConflictSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained proposedTimeSection];
  id v10 = objc_loadWeakRetained(v5);
  id v11 = objc_msgSend(v10, "allInviteesCanAttendSection", v9);
  v15[1] = v11;
  id v12 = objc_loadWeakRetained(v5);
  uint64_t v13 = [v12 someInviteesCanAttendSection];
  v15[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);
}

uint64_t __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained allInviteesCanAttendSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained originalConflictSection];
  id v10 = objc_loadWeakRetained(v5);
  id v11 = objc_msgSend(v10, "proposedTimeSection", v9);
  v15[1] = v11;
  id v12 = objc_loadWeakRetained(v5);
  uint64_t v13 = [v12 someInviteesCanAttendSection];
  v15[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);
}

uint64_t __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_25(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained someInviteesCanAttendSection];
  id v6 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained originalConflictSection];
  id v10 = objc_loadWeakRetained(v5);
  id v11 = objc_msgSend(v10, "allInviteesCanAttendSection", v9);
  v15[1] = v11;
  id v12 = objc_loadWeakRetained(v5);
  uint64_t v13 = [v12 proposedTimeSection];
  v15[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);
}

- (void)_sendMessageToParticipants:(id)a3
{
  id v4 = a3;
  CalAnalyticsSendEvent();
  id v5 = [[EKUIEmailCompositionManager alloc] initWithEvent:self->_event];
  messageSendingManager = self->_messageSendingManager;
  self->_messageSendingManager = v5;

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke;
  v10[3] = &unk_1E6088108;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  [(EKUIEmailCompositionManager *)self->_messageSendingManager setMessageSendingComplete:v10];
  id v7 = [(EKUIEmailCompositionManager *)self->_messageSendingManager viewController];
  [v7 setModalPresentationStyle:2];

  id v8 = +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:self];
  id v9 = [(EKUIEmailCompositionManager *)self->_messageSendingManager viewController];
  [v8 presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained[145] viewController];
  id v4 = [v3 presentingViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke_2;
  v5[3] = &unk_1E6087570;
  v5[4] = *(void *)(a1 + 32);
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 1160);
  *(void *)(v1 + 1160) = 0;
}

- (BOOL)useCustomBackButton
{
  if ([(EKUIEventInviteesViewController *)self fromDetail])
  {
    uint64_t v3 = [(EKUIEventInviteesViewController *)self event];
    if ([v3 allowsAttendeesModifications])
    {
      id v4 = [(EKUIEventInviteesViewController *)self event];
      if ([v4 hasChanges])
      {
        LOBYTE(v5) = 1;
      }
      else
      {
        id v6 = [(EKUIEventInviteesViewController *)self selectedStartDate];
        id v7 = [(EKUIEventInviteesViewController *)self event];
        id v8 = [v7 startDate];
        int v5 = [v6 isEqualToDate:v8] ^ 1;
      }
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

- (void)updateCustomNavigationItemButtons
{
  if ([(EKUIEventInviteesViewController *)self useCustomBackButton])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v4 = EventKitUIBundle();
    int v5 = [v4 localizedStringForKey:@"Done" value:&stru_1F0CC2140 table:0];
    id v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__dismiss_];

    id v7 = [(EKUIEventInviteesViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];

    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = +[EKRemoteUIButtonAction Done];
    id v18 = [v8 arrayWithObject:v9];
  }
  else
  {
    id v18 = 0;
  }
  if (+[EKUIEmailCompositionManager canShowViewControllerForEvent:self->_event withParticipantRecipients:0])
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope"];
    id v12 = (void *)[v10 initWithImage:v11 style:0 target:self action:sel__sendMessageToParticipants_];

    uint64_t v13 = [(EKUIEventInviteesViewController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];

    id v14 = (void *)MEMORY[0x1E4F1C978];
    id v15 = +[EKRemoteUIButtonAction PresentEmailCompose];
    __int16 v16 = [v14 arrayWithObject:v15];
  }
  else
  {
    id v12 = [(EKUIEventInviteesViewController *)self navigationItem];
    [v12 setRightBarButtonItem:0];
    __int16 v16 = 0;
  }

  id v17 = [(EKUIEventInviteesViewController *)self remoteUIDelegate];
  [v17 viewController:self didChangeLeftBarButtons:v18 rightBarButtons:v16];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIEventInviteesViewController;
  [(EKUIEventInviteesViewController *)&v4 viewWillAppear:a3];
  [(EKUIEventInviteesViewController *)self updateCustomNavigationItemButtons];
  [(EKUIEventInviteesViewController *)self _refreshIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKUIEventInviteesViewController *)self setViewIsVisible:1];
  v6.receiver = self;
  v6.super_class = (Class)EKUIEventInviteesViewController;
  [(EKUIEventInviteesViewController *)&v6 viewDidAppear:v3];
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_willEnterForeground name:*MEMORY[0x1E4FB2730] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIEventInviteesViewController;
  [(EKUIEventInviteesViewController *)&v5 viewWillDisappear:a3];
  [(EKUIEventInviteesViewController *)self setViewIsVisible:0];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(EKUIEventInviteesViewController *)self view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2)) {
    unint64_t v3 = 26;
  }
  else {
    unint64_t v3 = 30;
  }

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v3 = self->_sections;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sectionShouldBeShown", (void)v14);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  id v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v10 = NSNumber;
    id v11 = v9;
    id v12 = [v10 numberWithInteger:v6];
    *(_DWORD *)buf = 138412290;
    id v19 = v12;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Number of sections: [%@]", buf, 0xCu);
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EKUIEventInviteesViewController *)self _sectionForIndex:a4];
  int64_t v5 = [v4 numberOfRows];
  int64_t v6 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v6;
    id v8 = [v4 debugTitle];
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2048;
    int64_t v13 = v5;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Section [%@] has [%ld] rows.", (uint8_t *)&v10, 0x16u);
  }
  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EKUIEventInviteesViewController *)self _sectionForIndex:a4];
  int64_t v5 = [v4 headerTitle];
  int64_t v6 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v6;
    id v8 = [v4 debugTitle];
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    int64_t v13 = v5;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Section [%@] has a header title of [%@].", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = [(EKUIEventInviteesViewController *)self _sectionForIndex:a4];
  if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [v4 customHeaderView];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(EKUIEventInviteesViewController *)self _sectionForIndex:a4];
  if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [v4 customFooterView];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)showsManagedAttendeesSectionFooter
{
  return [(EKEvent *)self->_event hasHumanInviteesToDisplay];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
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
      id v8 = [v10 backgroundColor];
      id v9 = [v7 contentView];

      [v9 setBackgroundColor:v8];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v7 section]);
  id v9 = [v8 cellForIndexPath:v7 inTableView:v6];
  if (EKUICatalyst())
  {
    id v10 = [v6 backgroundColor];
    [v9 setBackgroundColor:v10];
  }
  id v11 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    long long v16 = v9;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Cell acquired for index path: [%@].  Cell: [%@]", (uint8_t *)&v13, 0x16u);
  }

  return v9;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v8 section]);
  if ([v9 supportsContextMenuForIndexPath:v8])
  {
    id v10 = [v7 contextMenuInteraction];
    id v11 = [v9 contextMenuDataForIndexPath:v8 interaction:v10];

    __int16 v12 = (void *)MEMORY[0x1E4FB1678];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__EKUIEventInviteesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
    v16[3] = &unk_1E6088150;
    id v17 = v11;
    id v13 = v11;
    id v14 = [v12 configurationWithIdentifier:0 previewProvider:&__block_literal_global_8 actionProvider:v16];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __93__EKUIEventInviteesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke()
{
  return 0;
}

uint64_t __93__EKUIEventInviteesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) menu];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
  char v7 = [v6 canEditRow:v5];
  id v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = CalBooleanAsString();
    id v11 = [v6 debugTitle];
    int v13 = 138412802;
    id v14 = v10;
    __int16 v15 = 2112;
    long long v16 = v11;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, "Can edit row: [%@].  Section: [%@].  Index path: [%@].", (uint8_t *)&v13, 0x20u);
  }
  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v7 section]);
  [v8 commitEditingStyle:a4 forRow:v7];
  id v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v9;
    id v11 = [v8 debugTitle];
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Committed editing style for row at index path: [%@].  Section: [%@].", (uint8_t *)&v12, 0x16u);
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
  [v6 estimatedHeightForRow:v5];
  double v8 = v7;
  id v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v10 = NSNumber;
    id v11 = v9;
    int v12 = [v10 numberWithDouble:v8];
    id v13 = [v6 debugTitle];
    int v15 = 138412802;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Estimated row height: [%@].  Section: [%@].  Index path: [%@].", (uint8_t *)&v15, 0x20u);
  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
  char v7 = [v6 canSelectRow:v5];
  double v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = CalBooleanAsString();
    id v11 = [v6 debugTitle];
    int v13 = 138412802;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, "Highlighting allowed: [%@].  Section: [%@].  Index path: [%@]", (uint8_t *)&v13, 0x20u);
  }
  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
  char v7 = v5;
  if (([v6 canSelectRow:v5] & 1) == 0)
  {

    char v7 = 0;
  }
  double v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = [v6 debugTitle];
    int v12 = 138412802;
    int v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, "Overridden index path for row selection: [%@].  Section: [%@].  Original index path: [%@]", (uint8_t *)&v12, 0x20u);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v6 section]);
  [v8 selectRow:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  id v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v9;
    id v11 = [v8 debugTitle];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Selected row at index path: [%@].  Section: [%@]", (uint8_t *)&v12, 0x16u);
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
  id v7 = [v6 actionsForRow:v5];

  double v8 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v7];

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", [v5 section]);
  int64_t v7 = [v6 editingStyleForRow:v5];
  double v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v9 = NSNumber;
    id v10 = v8;
    id v11 = [v9 numberWithInteger:v7];
    int v12 = [v6 debugTitle];
    int v14 = 138412802;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Editing style [%@] chosen for row at index path: [%@].  Section: [%@]", (uint8_t *)&v14, 0x20u);
  }
  return v7;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = (EKUIEventInviteesViewController *)a3;
  if (!v4)
  {
    uint64_t v37 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
LABEL_44:
      -[EKUIEventInviteesViewController _dismissPresentedViewControllerAnimated:](self, "_dismissPresentedViewControllerAnimated:", 1, v52);
      goto LABEL_45;
    }
    *(_DWORD *)buf = 138412290;
    v69 = v6;
    v38 = "The user cancelled out from this controller: [%@]";
    v39 = v37;
    os_log_type_t v40 = OS_LOG_TYPE_DEBUG;
    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v6;
      if (![(EKUIEventInviteesViewController *)self fromDetail])
      {
        v41 = [(EKUIEventInviteesViewController *)self selectedStartDate];
        v42 = [(EKUIEventInviteesViewController *)v11 modifiedStartDate];
        char v43 = [v41 isEqualToDate:v42];

        if ((v43 & 1) == 0)
        {
          v44 = [(EKUIEventInviteesViewController *)v11 modifiedStartDate];
          v45 = [(EKUIEventInviteesViewController *)self event];
          [v45 setStartDate:v44];

          v46 = [(EKUIEventInviteesViewController *)v11 modifiedEndDate];
          v47 = [(EKUIEventInviteesViewController *)self event];
          [v47 setEndDateUnadjustedForLegacyClients:v46];

          v48 = [(EKUIEventInviteesViewController *)v11 modifiedStartDate];
          [(EKUIEventInviteesViewController *)self setSelectedStartDate:v48];

          v49 = [(EKUIEventInviteesViewController *)v11 modifiedEndDate];
          [(EKUIEventInviteesViewController *)self setSelectedEndDate:v49];

          [(EKUIEventInviteesViewController *)self setResetAttendeesSections:1];
          [(EKUIEventInviteesViewController *)self setResetConflictResolutionSections:1];
          [(EKUIEventInviteesViewController *)self _refreshIfNeeded];
        }
      }
      goto LABEL_40;
    }
    uint64_t v50 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138412290;
    v69 = v6;
    v38 = "Unrecognized controller completed: [%@]";
    v39 = v50;
    os_log_type_t v40 = OS_LOG_TYPE_ERROR;
LABEL_43:
    _os_log_impl(&dword_1B3F4C000, v39, v40, v38, buf, 0xCu);
    goto LABEL_44;
  }
  int64_t v7 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    double v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithUnsignedInt:v4];
    *(_DWORD *)buf = 138412546;
    v69 = v10;
    __int16 v70 = 2112;
    v71 = v6;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, "Controller completed with action: [%@].  Controller: [%@]", buf, 0x16u);
  }
  v55 = v6;
  id v11 = v6;
  uint64_t v12 = [(EKUIEventInviteesViewController *)v11 attendees];
  id v13 = [(EKUIEventInviteesViewController *)self event];
  uint64_t v14 = [v13 attendeesNotIncludingOrganizerOrLocationsOrResources];

  id v56 = [(id)objc_opt_class() _participantsInArray:v14 thatAreNotInArray:v12];
  v53 = (void *)v14;
  v54 = (void *)v12;
  __int16 v15 = [(id)objc_opt_class() _participantsInArray:v12 thatAreNotInArray:v14];
  if (([(EKUIEventInviteesViewController *)v11 appendOnly] & 1) == 0)
  {
    v52 = v15;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    __int16 v16 = v56;
    uint64_t v17 = [(EKUIEventInviteesViewController *)v16 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v63 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          long long v22 = kEKUILogInviteesHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v16;
            _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_DEBUG, "Removing attendee: [%@]", buf, 0xCu);
          }
          long long v23 = [(EKUIEventInviteesViewController *)self event];
          [v23 removeAttendee:v21];
        }
        uint64_t v18 = [(EKUIEventInviteesViewController *)v16 countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v18);
    }

    __int16 v15 = v52;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v24 = v15;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v59 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        uint64_t v30 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v56;
          _os_log_impl(&dword_1B3F4C000, v30, OS_LOG_TYPE_DEBUG, "Adding attendee: [%@]", buf, 0xCu);
        }
        uint64_t v31 = [(EKUIEventInviteesViewController *)self event];
        [v31 addAttendee:v29];

        if ([(EKUIEventInviteesViewController *)v11 appendOnly]) {
          [v29 markAsForward];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v26);
  }

  id v6 = v55;
  if (!-[EKUIEventInviteesViewController count](v56, "count") && ![v24 count]) {
    goto LABEL_33;
  }
  v32 = [(EKUIEventInviteesViewController *)self event];
  v33 = [v32 attendeesNotIncludingOrganizerOrLocationsOrResources];
  uint64_t v34 = [v33 count];

  v35 = kEKUILogInviteesHandle;
  BOOL v36 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG);
  if (v34)
  {
    if (v36)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v35, OS_LOG_TYPE_DEBUG, "The attendee list was modified.  Marking sections as needing an update.", buf, 2u);
    }
    [(EKUIEventInviteesViewController *)self setResetAttendeesSections:1];
    [(EKUIEventInviteesViewController *)self setResetConflictResolutionSections:1];
    [(EKUIEventInviteesViewController *)self _refreshIfNeeded];
LABEL_33:

LABEL_40:
    goto LABEL_44;
  }
  if (v36)
  {
    *(_DWORD *)buf = 138412290;
    v69 = self;
    _os_log_impl(&dword_1B3F4C000, v35, OS_LOG_TYPE_DEBUG, "There are no more participants left.  Will request dismissal of [%@]", buf, 0xCu);
  }
  id v51 = +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:self];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __80__EKUIEventInviteesViewController_editItemViewController_didCompleteWithAction___block_invoke;
  v57[3] = &unk_1E6087570;
  v57[4] = self;
  [v51 dismissViewControllerAnimated:1 completion:v57];

LABEL_45:
  [(EKUIEventInviteesViewController *)self updateCustomNavigationItemButtons];
}

uint64_t __80__EKUIEventInviteesViewController_editItemViewController_didCompleteWithAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestDismissal];
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)saveAndDismissWithPrompt
{
}

- (void)_dismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIEventInviteesViewController *)self selectedStartDate];
  uint64_t v6 = [(EKUIEventInviteesViewController *)self event];
  int64_t v7 = [(id)v6 startDate];
  int v8 = [v5 isEqualToDate:v7];

  id v9 = [(EKUIEventInviteesViewController *)self event];
  LOBYTE(v6) = [v9 hasChanges];

  if ((v6 & 1) != 0 || !v8)
  {
    if (v8) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 4;
    }
    if ([(EKUIEventInviteesViewController *)self deletedParticipants]) {
      uint64_t v11 = v10 | 2;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = [(EKUIEventInviteesViewController *)self addInviteesSection];
    id v13 = [v12 pendingParticipants];
    BOOL v14 = (unint64_t)[v13 count] > 1;

    uint64_t v15 = v11 | v14;
    __int16 v16 = [(UIResponder *)self EKUI_editor];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__EKUIEventInviteesViewController__dismiss___block_invoke;
    aBlock[3] = &unk_1E6087598;
    id v29 = v16;
    id v17 = v16;
    uint64_t v18 = _Block_copy(aBlock);
    uint64_t v19 = [(EKUIEventInviteesViewController *)self event];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __44__EKUIEventInviteesViewController__dismiss___block_invoke_2;
    v23[3] = &unk_1E60881A0;
    id v24 = v19;
    uint64_t v25 = self;
    id v26 = v4;
    id v27 = v18;
    id v20 = v18;
    id v21 = v19;
    id v22 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:v15 viewController:self withCompletionHandler:v23];
  }
  else
  {
    [(EKUIEventInviteesViewController *)self _popViewControllerAnimated:1];
  }
}

uint64_t __44__EKUIEventInviteesViewController__dismiss___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) saveEvent:a2 span:a3 error:0];
}

void __44__EKUIEventInviteesViewController__dismiss___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) rollback];
  }
  else
  {
    if (a2) {
      return;
    }
    unint64_t v3 = [*(id *)(a1 + 40) selectedStartDate];
    [*(id *)(a1 + 32) setStartDate:v3];

    id v4 = [*(id *)(a1 + 40) selectedEndDate];
    [*(id *)(a1 + 32) setEndDateUnadjustedForLegacyClients:v4];

    if ([*(id *)(a1 + 32) isOrWasPartOfRecurringSeries])
    {
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x3032000000;
      id v21 = __Block_byref_object_copy__0;
      id v22 = __Block_byref_object_dispose__0;
      id v23 = 0;
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__EKUIEventInviteesViewController__dismiss___block_invoke_105;
      v13[3] = &unk_1E6088178;
      id v16 = *(id *)(a1 + 56);
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v14 = v8;
      uint64_t v15 = v9;
      id v17 = &v18;
      uint64_t v10 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:0 viewController:v6 barButtonItem:v5 forEvent:v7 withCompletionHandler:v13];
      uint64_t v11 = (void *)v19[5];
      v19[5] = v10;

      _Block_object_dispose(&v18, 8);
      return;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v12 = *(void **)(a1 + 40);

  [v12 _popViewControllerAnimated:1];
}

void __44__EKUIEventInviteesViewController__dismiss___block_invoke_105(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) >= 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) _popViewControllerAnimated:1];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

- (void)_eventModified:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Received a notification: [%@].", (uint8_t *)&v6, 0xCu);
  }
  [(EKUIEventInviteesViewController *)self setResetAttendeesSections:1];
  if ([(EKUIEventInviteesViewController *)self viewIsVisible]) {
    [(EKUIEventInviteesViewController *)self _refreshIfNeeded];
  }
}

- (void)_fontSizeDefinitionsChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Received a notification: [%@].", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__EKUIEventInviteesViewController__fontSizeDefinitionsChanged___block_invoke;
  block[3] = &unk_1E6087570;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__EKUIEventInviteesViewController__fontSizeDefinitionsChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_DEBUG, "Reloading reusable cell identifiers.", buf, 2u);
  }
  unint64_t v3 = [*(id *)(a1 + 32) inviteesView];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "sections", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) reloadAndRegisterReusableCellsWithTableView:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [*(id *)(a1 + 32) inviteesView];
  [v9 reloadData];
}

- (void)addInviteesTapped
{
  unint64_t v3 = [EKEventAttendeesEditViewController alloc];
  id v4 = [(EKUIEventInviteesViewController *)self event];
  uint64_t v5 = [(EKUIEventInviteesViewController *)self selectedStartDate];
  uint64_t v6 = [(EKUIEventInviteesViewController *)self selectedEndDate];
  uint64_t v20 = -[EKEventAttendeesEditViewController initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:](v3, "initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:", v4, v5, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(EKEditItemViewController *)v20 setEditDelegate:self];
  [(EKEventAttendeesEditViewController *)v20 setDisableShowingButtons:1];
  uint64_t v7 = [(EKUIEventInviteesViewController *)self event];
  LODWORD(v4) = [v7 isExternallyOrganizedInvitation];

  if (v4)
  {
    uint64_t v8 = [(EKUIEventInviteesViewController *)self addInviteesSection];
    uint64_t v9 = [v8 pendingParticipants];
    [(EKEventAttendeesEditViewController *)v20 setAttendees:v9];

    [(EKEventAttendeesEditViewController *)v20 setAppendOnly:1];
  }
  else
  {
    long long v10 = [(EKUIEventInviteesViewController *)self event];
    long long v11 = [v10 attendeesNotIncludingOrganizerOrLocationsOrResources];
    [(EKEventAttendeesEditViewController *)v20 setAttendees:v11];
  }
  long long v12 = [(EKUIEventInviteesViewController *)self event];
  long long v13 = [v12 calendar];
  id v14 = [v13 source];
  uint64_t v15 = [v14 externalID];

  [(EKEventAttendeesEditViewController *)v20 setSearchAccountID:v15];
  uint64_t v16 = [[EKUIManagedNavigationController alloc] initWithRootViewController:v20];
  id v17 = [(EKUIEventInviteesViewController *)self view];
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v17))
  {
    uint64_t v18 = [(EKUIEventInviteesViewController *)self view];
    BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v18);

    if (IsRegular) {
      [(EKUIManagedNavigationController *)v16 setModalPresentationStyle:3];
    }
  }
  else
  {
  }
  [(EKUIEventInviteesViewController *)self _presentViewController:v16];
}

- (id)availabilityTapped
{
  unint64_t v3 = [EKUIAvailabilityViewController alloc];
  id v4 = [(EKUIEventInviteesViewController *)self event];
  uint64_t v5 = [(EKUIAvailabilityViewController *)v3 initWithEvent:v4];

  [(EKEditItemViewController *)v5 setEditDelegate:self];
  [(EKUIAvailabilityViewController *)v5 setFromDetail:[(EKUIEventInviteesViewController *)self fromDetail]];
  uint64_t v6 = [[EKUIAvailabilityNavigationController alloc] initWithRootViewController:v5];
  [(EKUIAvailabilityViewController *)v5 preferredContentSize];
  -[EKUIAvailabilityNavigationController setPreferredContentSize:](v6, "setPreferredContentSize:");
  if (+[SwappableViewControllerImplementationFactory shouldUseOutOfProcessUI])
  {
    uint64_t v7 = [(EKUIEventInviteesViewController *)self view];
    if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v7))
    {
    }
    else
    {
      uint64_t v8 = [(EKUIEventInviteesViewController *)self view];
      BOOL IsCompact = EKUICurrentHeightSizeClassIsCompact(v8);

      if (!IsCompact) {
        [(EKUIAvailabilityNavigationController *)v6 setModalPresentationStyle:0];
      }
    }
  }
  [(EKUIEventInviteesViewController *)self _presentViewController:v6];

  return v5;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  p_navigationDelegate = &self->_navigationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    uint64_t v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    uint64_t v5 = [(EKUIEventInviteesViewController *)self navigationController];
  }

  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)_pushViewController:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else
  {
    id v6 = [(EKUIEventInviteesViewController *)self navigationController];
  }
  uint64_t v7 = v6;

  if (objc_opt_respondsToSelector()) {
    [v7 pushViewController:v8 animated:1];
  }
}

- (void)_presentViewController:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (WeakRetained
    || (+[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:self], (id WeakRetained = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      long long v11 = WeakRetained;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Presenting view controller [%@] from view controller [%@].", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained presentViewController:v4 animated:1 completion:0];
    [(EKUIEventInviteesViewController *)self setPresentedController:v4];
  }
  else
  {
    uint64_t v7 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "Could not find a view controller that should perform the presentation of this view controller: [%@].", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    id v7 = [(EKUIEventInviteesViewController *)self presentedController];
  }
  id v8 = v7;

  if (objc_opt_respondsToSelector()) {
    [v8 dismissViewControllerAnimated:v3 completion:0];
  }
  [(EKUIEventInviteesViewController *)self setPresentedController:0];
}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    id v7 = [(EKUIEventInviteesViewController *)self navigationController];
  }
  id v8 = v7;

  if (objc_opt_respondsToSelector()) {
    [v8 popViewControllerAnimated:v3];
  }
}

- (CGSize)preferredContentSize
{
  BOOL v3 = [(EKUIEventInviteesViewController *)self tableView];
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  double v5 = v4;
  double v7 = v6;

  id v8 = [(EKUIEventInviteesViewController *)self navigationController];
  char v9 = [v8 isToolbarHidden];

  if ((v9 & 1) == 0)
  {
    __int16 v10 = [(EKUIEventInviteesViewController *)self navigationController];
    long long v11 = [v10 toolbar];
    [v11 bounds];
    double v7 = v7 + CGRectGetHeight(v17);
  }
  uint64_t v12 = [(EKUIEventInviteesViewController *)self view];
  BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v12);

  if (IsRegularInViewHierarchy)
  {
    if (v7 > 600.0) {
      double v7 = 600.0;
    }
    double v5 = EKUIContainedControllerIdealWidth();
  }
  double v14 = v5;
  double v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
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
          uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
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
    id v5 = [(EKUIEventInviteesViewController *)self sections];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(id *)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 sectionShouldBeShown])
          {
            if (v11 == v4) {
              goto LABEL_13;
            }
            ++v8;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
    int64_t v8 = -1;
LABEL_13:
  }
  else
  {
    uint64_t v12 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_ERROR, "No section given.  Will not try to find an index.", buf, 2u);
    }
    int64_t v8 = -1;
  }

  return v8;
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
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "sectionShouldBeShown", (void)v13))
        {
          if (v7 == a3)
          {
            id v11 = v10;
            goto LABEL_13;
          }
          ++v7;
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

- (void)_smoothRefreshIfNeededForSections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Smooth refreshing if needed.", v7, 2u);
  }
  if ([(EKUIEventInviteesViewController *)self resetAttendeesSections])
  {
    [(EKUIEventInviteesViewController *)self prepareToReloadAttendeesSections];
    uint64_t v6 = [(EKUIEventInviteesViewController *)self inviteesView];
    [v6 reloadSections:v4 withRowAnimation:100];
  }
}

- (void)prepareToReloadAttendeesSections
{
  [(EKUIEventInviteesViewController *)self setResetAttendeesSections:0];
  BOOL v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v21 = 0;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "Resetting the attendees sections.", v21, 2u);
  }
  id v4 = [(EKUIEventInviteesViewController *)self addInviteesSection];
  uint64_t v5 = [(EKUIEventInviteesViewController *)self event];
  objc_msgSend(v4, "updateWithEvent:showPending:", v5, -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));

  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v7 = [(EKUIEventInviteesViewController *)self respondedSection];
    uint64_t v8 = [v7 objectAtIndexedSubscript:i];
    uint64_t v9 = [(EKUIEventInviteesViewController *)self event];
    uint64_t v10 = [(EKUIEventInviteesViewController *)self event];
    objc_msgSend(v8, "updateWithEvent:editable:", v9, objc_msgSend(v10, "isSelfOrganized"));
  }
  id v11 = [(EKUIEventInviteesViewController *)self notRespondedSection];
  uint64_t v12 = [(EKUIEventInviteesViewController *)self event];
  long long v13 = [(EKUIEventInviteesViewController *)self event];
  objc_msgSend(v11, "updateWithEvent:editable:fromDetail:", v12, objc_msgSend(v13, "isSelfOrganized"), -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));

  long long v14 = [(EKUIEventInviteesViewController *)self invisibleInviteeStatusSection];
  long long v15 = [(EKUIEventInviteesViewController *)self event];
  long long v16 = [(EKUIEventInviteesViewController *)self event];
  objc_msgSend(v14, "updateWithEvent:editable:fromDetail:", v15, objc_msgSend(v16, "isSelfOrganized"), -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));

  long long v17 = [(EKUIEventInviteesViewController *)self availabilitySection];
  uint64_t v18 = [(EKUIEventInviteesViewController *)self event];
  [v17 updateWithEvent:v18];

  id v19 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
  uint64_t v20 = [(EKUIEventInviteesViewController *)self event];
  [v19 updateWithEvent:v20];
}

- (void)_refreshIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "Refreshing if needed.", (uint8_t *)&v25, 2u);
  }
  if ([(EKUIEventInviteesViewController *)self resetAttendeesSections])
  {
    [(EKUIEventInviteesViewController *)self prepareToReloadAttendeesSections];
    id v4 = [(EKUIEventInviteesViewController *)self inviteesView];
    [v4 reloadData];
  }
  if ([(EKUIEventInviteesViewController *)self resetConflictResolutionSections])
  {
    [(EKUIEventInviteesViewController *)self setResetConflictResolutionSections:0];
    uint64_t v5 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Resetting the conflict resolution sections.", (uint8_t *)&v25, 2u);
    }
    uint64_t v6 = [(EKUIEventInviteesViewController *)self event];
    char v7 = [v6 isSelfOrganized];

    if ((v7 & 1) == 0)
    {
      uint64_t v15 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      int v25 = 138412290;
      long long v26 = self;
      uint64_t v12 = "[%@] is not editable.  Will not continue to reset the conflict resolution sections.";
      long long v13 = v15;
      uint32_t v14 = 12;
      goto LABEL_14;
    }
    uint64_t v8 = [(EKUIEventInviteesViewController *)self event];
    int v9 = [v8 isAllDay];

    uint64_t v10 = kEKUILogInviteesHandle;
    BOOL v11 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (!v11) {
        return;
      }
      LOWORD(v25) = 0;
      uint64_t v12 = "The event is marked as 'all-day.'  Will not continue to reset the conflict resolution sections.";
      long long v13 = v10;
      uint32_t v14 = 2;
LABEL_14:
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v25, v14);
      return;
    }
    if (v11)
    {
      long long v16 = v10;
      long long v17 = [(EKUIEventInviteesViewController *)self event];
      int v25 = 138412290;
      long long v26 = v17;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_DEBUG, "Telling the availability searcher to reset with event: [%@]", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v18 = [(EKUIEventInviteesViewController *)self event];
    id v19 = [v18 calendar];
    uint64_t v20 = [v19 source];
    long long v21 = [v20 ownerAddresses];
    long long v22 = [v21 anyObject];

    long long v23 = [(EKUIEventInviteesViewController *)self availabilitySearcher];
    long long v24 = [(EKUIEventInviteesViewController *)self event];
    [v23 resetWithEvent:v24 organizerAddressForNewlyScheduledEvent:v22];
  }
}

- (void)_requestDismissal
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = self;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "Requesting dismissal of [%@]", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(EKUIEventInviteesViewController *)self sections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) cancelOutstandingOperations];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  int v9 = [(EKUIEventInviteesViewController *)self parentController];
  [v9 saveAndDismiss];
}

- (void)_searcherStateChanged:(int64_t)a3
{
  if (![(EKUIEventInviteesViewController *)self prohibitCallingSearcherStateChanged])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke;
    aBlock[3] = &unk_1E6087AD0;
    void aBlock[4] = self;
    uint64_t v5 = _Block_copy(aBlock);
    uint64_t v6 = [(EKUIEventInviteesViewController *)self inviteesView];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint32_t v14 = __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke_118;
    uint64_t v15 = &unk_1E60881C8;
    id v17 = v5;
    int64_t v18 = a3;
    long long v16 = self;
    id v7 = v5;
    [v6 performBatchUpdates:&v12 completion:0];

    uint64_t v8 = [(EKUIEventInviteesViewController *)self proposedTimeSection];
    [v8 refreshCellsAfterStateChange];

    int v9 = [(EKUIEventInviteesViewController *)self originalConflictSection];
    [v9 refreshCellsAfterStateChange];

    long long v10 = [(EKUIEventInviteesViewController *)self allInviteesCanAttendSection];
    [v10 refreshCellsAfterStateChange];

    long long v11 = [(EKUIEventInviteesViewController *)self someInviteesCanAttendSection];
    [v11 refreshCellsAfterStateChange];
  }
}

void __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  long long v16 = v15;
  if (a3 != a6)
  {
    if (a3)
    {
      id v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
      int64_t v18 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412290;
        id v25 = v17;
        _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_DEBUG, "Deleting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [*(id *)(a1 + 32) inviteesView];
      [v19 deleteSections:v17 withRowAnimation:0];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a7];
      long long v22 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412290;
        id v25 = v17;
        _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_DEBUG, "Inserting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [*(id *)(a1 + 32) inviteesView];
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
      id v19 = [*(id *)(a1 + 32) inviteesView];
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
      id v19 = [*(id *)(a1 + 32) inviteesView];
      [v19 reloadSections:v17 withRowAnimation:0];
    }
    goto LABEL_20;
  }
LABEL_21:
}

void __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke_118(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) originalConflictSection];
  unsigned int v52 = [v2 sectionShouldBeShown];

  BOOL v3 = [*(id *)(a1 + 32) allInviteesCanAttendSection];
  unsigned int v53 = [v3 sectionShouldBeShown];

  id v4 = [*(id *)(a1 + 32) someInviteesCanAttendSection];
  unsigned int v55 = [v4 sectionShouldBeShown];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 originalConflictSection];
  uint64_t v49 = [v5 _indexForSection:v6];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 allInviteesCanAttendSection];
  uint64_t v50 = [v7 _indexForSection:v8];

  int v9 = *(void **)(a1 + 32);
  long long v10 = [v9 someInviteesCanAttendSection];
  uint64_t v51 = [v9 _indexForSection:v10];

  long long v11 = [*(id *)(a1 + 32) originalConflictSection];
  uint64_t v46 = [v11 numberOfRows];

  uint64_t v12 = [*(id *)(a1 + 32) allInviteesCanAttendSection];
  uint64_t v47 = [v12 numberOfRows];

  uint64_t v13 = [*(id *)(a1 + 32) someInviteesCanAttendSection];
  uint64_t v48 = [v13 numberOfRows];

  uint32_t v14 = [*(id *)(a1 + 32) proposedTimeSection];
  [v14 availabilitySearcherChangedState:*(void *)(a1 + 48)];

  id v15 = [*(id *)(a1 + 32) originalConflictSection];
  [v15 availabilitySearcherChangedState:*(void *)(a1 + 48)];

  long long v16 = [*(id *)(a1 + 32) allInviteesCanAttendSection];
  [v16 availabilitySearcherChangedState:*(void *)(a1 + 48)];

  id v17 = [*(id *)(a1 + 32) someInviteesCanAttendSection];
  [v17 availabilitySearcherChangedState:*(void *)(a1 + 48)];

  int64_t v18 = [*(id *)(a1 + 32) originalConflictSection];
  uint64_t v19 = [v18 sectionShouldBeShown];

  uint64_t v20 = [*(id *)(a1 + 32) allInviteesCanAttendSection];
  unsigned int v44 = [v20 sectionShouldBeShown];

  long long v21 = [*(id *)(a1 + 32) someInviteesCanAttendSection];
  unsigned int v45 = [v21 sectionShouldBeShown];

  long long v22 = *(void **)(a1 + 32);
  long long v23 = [v22 originalConflictSection];
  uint64_t v24 = [v22 _indexForSection:v23];

  id v25 = *(void **)(a1 + 32);
  uint64_t v26 = [v25 allInviteesCanAttendSection];
  uint64_t v27 = [v25 _indexForSection:v26];

  long long v28 = *(void **)(a1 + 32);
  id v29 = [v28 someInviteesCanAttendSection];
  uint64_t v30 = [v28 _indexForSection:v29];

  uint64_t v31 = [*(id *)(a1 + 32) originalConflictSection];
  uint64_t v32 = [v31 numberOfRows];

  v33 = [*(id *)(a1 + 32) allInviteesCanAttendSection];
  uint64_t v34 = [v33 numberOfRows];

  v35 = [*(id *)(a1 + 32) someInviteesCanAttendSection];
  uint64_t v36 = [v35 numberOfRows];

  uint64_t v37 = *(void *)(a1 + 40);
  v38 = [*(id *)(a1 + 32) originalConflictSection];
  (*(void (**)(uint64_t, void *, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE))(v37 + 16))(v37, v38, v52, v49, v46, v19, v24, v32, 0);

  uint64_t v39 = *(void *)(a1 + 40);
  os_log_type_t v40 = [*(id *)(a1 + 32) allInviteesCanAttendSection];
  LOBYTE(v42) = 1;
  (*(void (**)(uint64_t, void *, void, uint64_t, uint64_t, void, uint64_t, uint64_t, int))(v39 + 16))(v39, v40, v53, v50, v47, v44, v27, v34, v42);

  uint64_t v41 = *(void *)(a1 + 40);
  id v54 = [*(id *)(a1 + 32) someInviteesCanAttendSection];
  LOBYTE(v43) = 1;
  (*(void (**)(uint64_t, id, void, uint64_t, uint64_t, void, uint64_t, uint64_t, int))(v41 + 16))(v41, v54, v55, v51, v48, v45, v30, v36, v43);
}

- (id)EKUI_oopContentBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (void)setNavigationDelegate:(id)a3
{
}

- (EKUIEventInviteesEditViewController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (EKUIEventInviteesEditViewController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (NSDate)selectedStartDate
{
  return self->_selectedStartDate;
}

- (void)setSelectedStartDate:(id)a3
{
}

- (NSDate)selectedEndDate
{
  return self->_selectedEndDate;
}

- (void)setSelectedEndDate:(id)a3
{
}

- (BOOL)hidesManagedAttendeesSection
{
  return self->_hidesManagedAttendeesSection;
}

- (void)setHidesManagedAttendeesSection:(BOOL)a3
{
  self->_hidesManagedAttendeesSection = a3;
}

- (BOOL)usesCustomToolbar
{
  return self->_usesCustomToolbar;
}

- (void)setUsesCustomToolbar:(BOOL)a3
{
  self->_usesCustomToolbar = a3;
}

- (BOOL)usesRaisedCustomToolbar
{
  return self->_usesRaisedCustomToolbar;
}

- (void)setUsesRaisedCustomToolbar:(BOOL)a3
{
  self->_usesRaisedCustomToolbar = a3;
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIDelegate);

  return (EKViewControllerRemoteUIDelegate *)WeakRetained;
}

- (void)setRemoteUIDelegate:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIViewController)presentedController
{
  return self->_presentedController;
}

- (void)setPresentedController:(id)a3
{
}

- (EKUIEventInviteesView)inviteesView
{
  return self->_inviteesView;
}

- (void)setInviteesView:(id)a3
{
}

- (BOOL)resetAttendeesSections
{
  return self->_resetAttendeesSections;
}

- (void)setResetAttendeesSections:(BOOL)a3
{
  self->_resetAttendeesSections = a3;
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

- (BOOL)deletedParticipants
{
  return self->_deletedParticipants;
}

- (void)setDeletedParticipants:(BOOL)a3
{
  self->_deletedParticipants = a3;
}

- (BOOL)fromDetail
{
  return self->_fromDetail;
}

- (void)setFromDetail:(BOOL)a3
{
  self->_fromDetail = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (EKUIInviteesViewAddInviteesSection)addInviteesSection
{
  return self->_addInviteesSection;
}

- (void)setAddInviteesSection:(id)a3
{
}

- (NSMutableArray)respondedSection
{
  return self->_respondedSection;
}

- (void)setRespondedSection:(id)a3
{
}

- (EKUIInviteesViewNotRespondedInviteesSection)notRespondedSection
{
  return self->_notRespondedSection;
}

- (void)setNotRespondedSection:(id)a3
{
}

- (EKUIInviteesViewInvisibleInviteeStatusSection)invisibleInviteeStatusSection
{
  return self->_invisibleInviteeStatusSection;
}

- (void)setInvisibleInviteeStatusSection:(id)a3
{
}

- (EKUIInviteesViewAvailabilitySection)availabilitySection
{
  return self->_availabilitySection;
}

- (void)setAvailabilitySection:(id)a3
{
}

- (EKUIInviteesViewProposedTimeSection)proposedTimeSection
{
  return self->_proposedTimeSection;
}

- (void)setProposedTimeSection:(id)a3
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

- (BOOL)prohibitCallingSearcherStateChanged
{
  return self->_prohibitCallingSearcherStateChanged;
}

- (void)setProhibitCallingSearcherStateChanged:(BOOL)a3
{
  self->_prohibitCallingSearcherStateChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong((id *)&self->_allInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_someInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_originalConflictSection, 0);
  objc_storeStrong((id *)&self->_proposedTimeSection, 0);
  objc_storeStrong((id *)&self->_availabilitySection, 0);
  objc_storeStrong((id *)&self->_invisibleInviteeStatusSection, 0);
  objc_storeStrong((id *)&self->_notRespondedSection, 0);
  objc_storeStrong((id *)&self->_respondedSection, 0);
  objc_storeStrong((id *)&self->_addInviteesSection, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_inviteesView, 0);
  objc_storeStrong((id *)&self->_presentedController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_selectedEndDate, 0);
  objc_storeStrong((id *)&self->_selectedStartDate, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_destroyWeak((id *)&self->_navigationDelegate);

  objc_storeStrong((id *)&self->_model, 0);
}

@end