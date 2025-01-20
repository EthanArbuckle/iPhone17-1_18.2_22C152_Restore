@interface EKEventViewControllerOOPWrapperImpl
+ (id)_orderedActionsForMask:(int64_t)a3;
+ (void)setDefaultDatesForEvent:(id)a3;
- (BOOL)_backingEventAllowsEditing;
- (BOOL)_isDisplayingDeletableEvent;
- (BOOL)_isDisplayingInvitation;
- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage;
- (BOOL)_shouldDisplayDoneButton;
- (BOOL)_shouldDisplayStatusButtons;
- (BOOL)_shouldPopSelf;
- (BOOL)_shouldShowEditButton;
- (BOOL)allowsCalendarPreview;
- (BOOL)allowsEditing;
- (BOOL)allowsInviteResponses;
- (BOOL)allowsSubitems;
- (BOOL)calendarPreviewIsInlineDayView;
- (BOOL)canShowRealContent;
- (BOOL)eventEditViewPresented;
- (BOOL)hasInProcessNavBar;
- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter;
- (BOOL)isICSPreview;
- (BOOL)isLargeDayView;
- (BOOL)minimalMode;
- (BOOL)noninteractivePlatterMode;
- (BOOL)showsAddToCalendarForICSPreview;
- (BOOL)showsDelegateMessage;
- (BOOL)showsDelegatorMessage;
- (BOOL)showsDeleteForICSPreview;
- (BOOL)showsDetectedConferenceItem;
- (BOOL)showsDoneButton;
- (BOOL)showsOutOfDateMessage;
- (BOOL)showsUpdateCalendarForICSPreview;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKEventViewControllerOOPWrapperImpl)init;
- (EKEventViewDelegate)delegate;
- (NSDictionary)context;
- (UIScrollView)eventDetailsScrollView;
- (UIViewController)eventDetailsViewController;
- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)vc;
- (double)eventStatusButtonsViewButtonFontSize:(id)a3;
- (id)_detachSheetHandler;
- (id)_proposedDate;
- (id)_statusButtonsContainerView;
- (id)_statusButtonsView;
- (id)_viewControllerForEditorPresentation;
- (id)activeEventEditor;
- (id)navigationItem;
- (id)presentationSourceViewController;
- (id)statusButtons;
- (id)toolbarItems;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int64_t)_actionsMask;
- (void)_acceptProposedTimeWithSourceViewForPopover:(id)a3;
- (void)_addToCalendarClicked:(id)a3;
- (void)_cancelProposedTime;
- (void)_deleteClicked:(id)a3;
- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4;
- (void)_performDelete:(int64_t)a3 editor:(id)a4;
- (void)_prepareEventForEdit:(id)a3;
- (void)_presentDetachSheetFromView:(id)a3;
- (void)_rejectProposedTime;
- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4;
- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4;
- (void)_setupStatusToolbarButtons;
- (void)_updateNavBarAnimated:(BOOL)a3;
- (void)_updateResponse;
- (void)_updateStatusButtonsActions;
- (void)completeWithAction:(int64_t)a3;
- (void)doneButtonTapped;
- (void)editButtonTapped;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 waitUntil:(id)a5;
- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4;
- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)fullReloadWithNewEvent:(id)a3;
- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4;
- (void)performAddToCalendar;
- (void)presentEditorAnimated:(BOOL)a3;
- (void)reloadRemoteViewWithUpdatedEventID:(id)a3 waitUntil:(id)a4;
- (void)setActiveEventEditor:(id)a3;
- (void)setAllowsCalendarPreview:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsInviteResponses:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventEditViewPresented:(BOOL)a3;
- (void)setICSPreview:(BOOL)a3;
- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setIsLargeDayView:(BOOL)a3;
- (void)setMinimalMode:(BOOL)a3;
- (void)setNeedsReload;
- (void)setNoninteractivePlatterMode:(BOOL)a3;
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
- (void)setVc:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKEventViewControllerOOPWrapperImpl

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

- (EKEventViewControllerOOPWrapperImpl)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  v2 = [(EKEventViewControllerOOPWrapperImpl *)&v5 init];
  v3 = objc_alloc_init(_TtC10EventKitUI28EKEventViewControllerOOPImpl);
  [(EKEventViewControllerOOPWrapperImpl *)v2 setVc:v3];

  return v2;
}

- (void)viewDidLoad
{
  v48[3] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  [(EKEventViewControllerOOPWrapperImpl *)&v47 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = EventKitUIBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"Event Details" value:&stru_1F0CC2140 table:0];

  [(EKEventViewControllerOOPWrapperImpl *)self setTitle:v6];
  id v7 = [(EKEventViewControllerOOPWrapperImpl *)self parentViewController];
  v46 = (void *)v6;
  [v7 setTitle:v6];

  [(EKEventViewControllerOOPWrapperImpl *)self _updateNavBarAnimated:0];
  BOOL v8 = [(EKEventViewControllerOOPWrapperImpl *)self hasInProcessNavBar];
  v9 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v9 setHasInProcessNavBar:v8];

  [(EKEventViewControllerOOPWrapperImpl *)self _setupStatusToolbarButtons];
  v10 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [(EKEventViewControllerOOPWrapperImpl *)self addChildViewController:v10];

  v11 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  v12 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  v13 = [v12 view];
  [v11 addSubview:v13];

  v14 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v14 didMoveToParentViewController:self];

  v15 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  v16 = [v15 view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  v44 = [v45 view];
  v42 = [v44 leadingAnchor];
  v43 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v48[0] = v40;
  v39 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  v38 = [v39 view];
  v35 = [v38 topAnchor];
  v36 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  v17 = [v36 topAnchor];
  v18 = [v35 constraintEqualToAnchor:v17];
  v48[1] = v18;
  v19 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  v20 = [v19 view];
  v21 = [v20 trailingAnchor];
  v22 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v48[2] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  [v37 activateConstraints:v25];

  statusButtonsContainerView = self->_statusButtonsContainerView;
  v27 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  v28 = [v27 view];
  v29 = [v28 bottomAnchor];
  v30 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  v31 = v30;
  if (statusButtonsContainerView)
  {
    v32 = [v30 safeAreaLayoutGuide];
    v33 = [v32 bottomAnchor];
    v34 = [v29 constraintEqualToAnchor:v33];
    [v34 setActive:1];
  }
  else
  {
    v32 = [v30 bottomAnchor];
    v33 = [v29 constraintEqualToAnchor:v32];
    [v33 setActive:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  [(EKEventViewControllerOOPWrapperImpl *)&v6 viewWillAppear:a3];
  [(EKEventViewControllerOOPWrapperImpl *)self _updateStatusButtonsActions];
  [(EKEventViewControllerOOPWrapperImpl *)self _updateResponse];
  uint64_t v4 = [(EKEventViewControllerOOPWrapperImpl *)self _shouldDisplayStatusButtons] ^ 1;
  objc_super v5 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
  [v5 setToolbarHidden:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  [(EKEventViewControllerOOPWrapperImpl *)&v10 viewWillDisappear:a3];
  uint64_t v4 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    objc_super v6 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      BOOL v8 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      [v8 performSelector:sel_eventViewControllerWillDisappear_ withObject:self];
    }
  }
  v9 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
  [v9 setToolbarHidden:1];
}

- (CGSize)preferredContentSize
{
  v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateNavBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  double v6 = [v5 title];
  double v7 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
  [v7 setBackButtonTitle:v6];

  if ([(EKEventViewControllerOOPWrapperImpl *)self _shouldShowEditButton])
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel_editButtonTapped];
    if ([(EKEventViewControllerOOPWrapperImpl *)self _shouldDisplayDoneButton])
    {
      double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped];
      v9 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
      [v9 setLeftBarButtonItem:v12 animated:v3];

      objc_super v10 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
      [v10 setRightBarButtonItem:v8 animated:v3];
    }
    else
    {
      double v8 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
      [v8 setRightBarButtonItem:v12 animated:v3];
    }
  }
  else if ([(EKEventViewControllerOOPWrapperImpl *)self _shouldDisplayDoneButton])
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped];
    v11 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
    [v11 setRightBarButtonItem:v12 animated:v3];
  }
  else
  {
    id v12 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
    [v12 setRightBarButtonItem:0 animated:v3];
  }
}

- (BOOL)_shouldShowEditButton
{
  if (![(EKEventViewControllerOOPWrapperImpl *)self allowsEditing]
    || ![(EKEventViewControllerOOPWrapperImpl *)self _backingEventAllowsEditing])
  {
    return 0;
  }

  return [(EKEventViewControllerOOPWrapperImpl *)self canShowRealContent];
}

- (BOOL)_backingEventAllowsEditing
{
  BOOL v3 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  if ([v3 isEditable])
  {
    double v4 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    double v5 = [v4 eventStore];
    if (v5)
    {
      double v6 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      double v7 = [v6 calendar];
      int v8 = [v7 isSuggestedEventCalendar] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_shouldDisplayDoneButton
{
  BOOL v3 = [(EKEventViewControllerOOPWrapperImpl *)self navigationItem];
  double v4 = [v3 leftBarButtonItem];
  if (![(EKEventViewControllerOOPWrapperImpl *)self showsDoneButton])
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  if (([v3 hidesBackButton] & 1) != 0 || v4 && objc_msgSend(v4, "systemItem"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    double v6 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
    double v7 = [v6 viewControllers];

    if ([v7 count])
    {
      int v8 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
      v9 = [v7 objectAtIndex:0];
      BOOL v5 = v8 == v9;
    }
    else
    {
      BOOL v5 = 1;
    }

    if (!v5) {
      goto LABEL_15;
    }
  }
  if (v4)
  {
    if (![v4 systemItem]) {
      [v3 setLeftBarButtonItem:0];
    }
    LOBYTE(v5) = 1;
  }
LABEL_15:

  return v5;
}

- (void)doneButtonTapped
{
  if ([(EKEventViewControllerOOPWrapperImpl *)self canShowRealContent])
  {
    id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
    [v4 doneButtonTapped];
  }
  else
  {
    id v4 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    BOOL v3 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
    [v4 eventViewController:v3 didCompleteWithAction:0];
  }
}

- (void)editButtonTapped
{
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  BOOL v5 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || ([(EKEventViewControllerOOPWrapperImpl *)self delegate],
        double v7 = objc_claimAutoreleasedReturnValue(),
        [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 eventViewControllerEditButtonTemporarilyDisabled:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
LABEL_4:
    uint64_t v10 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    if (v10)
    {
      v11 = (void *)v10;
      id v12 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        v14 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
        [v14 performSelector:sel_eventViewControllerWillBeginEditingEvent_ withObject:self];
      }
    }
    uint64_t v15 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    if (!v15) {
      goto LABEL_10;
    }
    v16 = (void *)v15;
    v17 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0
      || ([(EKEventViewControllerOOPWrapperImpl *)self delegate],
          v19 = objc_claimAutoreleasedReturnValue(),
          [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController],
          v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v19 eventViewDelegateShouldCreateOwnEditViewController:v20],
          v20,
          v19,
          (v21 & 1) == 0))
    {
LABEL_10:
      v22 = objc_alloc_init(EKEventEditViewController);
      v23 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      [(EKEventEditViewController *)v22 setEvent:v23];

      v24 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      v25 = [v24 eventStore];
      [(EKEventEditViewController *)v22 setEventStore:v25];

      [(EKEventViewControllerOOPWrapperImpl *)self setActiveEventEditor:v22];
    }
    [(EKEventViewControllerOOPWrapperImpl *)self presentEditorAnimated:1];
  }
}

- (BOOL)hasInProcessNavBar
{
  v2 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  uint64_t v3 = [v2 navigationController];

  if (v3) {
    int v4 = [v3 isNavigationBarHidden] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_updateResponse
{
  id v13 = [(EKEventViewControllerOOPWrapperImpl *)self _statusButtonsView];
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  int v4 = [v3 calendar];

  if (v4)
  {
    BOOL v5 = [v4 source];
    char v6 = [v5 constraints];
    int v7 = [v6 statusesAreAccurate] ^ 1;
  }
  else
  {
    int v7 = 0;
  }
  int v8 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  uint64_t v9 = [v8 participationStatus];

  if (v7
    && ([(EKEventViewControllerOOPWrapperImpl *)self event],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isStatusDirty],
        v10,
        !v11)
    || (unint64_t)(v9 - 2) > 2)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = qword_1B413A9F0[v9 - 2];
  }
  [v13 setSelectedAction:v12];
}

- (BOOL)_shouldDisplayStatusButtons
{
  v2 = [(EKEventViewControllerOOPWrapperImpl *)self statusButtons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_setupStatusToolbarButtons
{
  v30[4] = *MEMORY[0x1E4F143B8];
  if ([(EKEventViewControllerOOPWrapperImpl *)self _shouldDisplayStatusButtons])
  {
    BOOL v3 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
    [v3 setToolbarHidden:0];

    int v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    BOOL v5 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
    char v6 = [v5 toolbar];
    [v6 setBackgroundColor:v4];

    int v7 = [(EKEventViewControllerOOPWrapperImpl *)self toolbarItems];
    if (!v7
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v7, !statusButtonsContainerView))
    {
      uint64_t v9 = [(EKEventViewControllerOOPWrapperImpl *)self _statusButtonsContainerView];
      uint64_t v10 = [(EKEventViewControllerOOPWrapperImpl *)self _statusButtonsView];
      [v9 addSubview:v10];
      v23 = (void *)MEMORY[0x1E4F28DC8];
      v28 = [v10 leadingAnchor];
      v27 = [v9 leadingAnchor];
      v26 = [v28 constraintEqualToAnchor:v27];
      v30[0] = v26;
      v25 = [v10 trailingAnchor];
      v24 = [v9 trailingAnchor];
      v22 = [v25 constraintEqualToAnchor:v24];
      v30[1] = v22;
      int v11 = [v10 topAnchor];
      uint64_t v12 = [v9 topAnchor];
      id v13 = [v11 constraintEqualToAnchor:v12];
      v30[2] = v13;
      v14 = [v10 bottomAnchor];
      uint64_t v15 = [v9 bottomAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v30[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
      [v23 activateConstraints:v17];

      char v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v9];
      v29 = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      [(EKEventViewControllerOOPWrapperImpl *)self setToolbarItems:v19 animated:1];
    }
  }
  else
  {
    v20 = [(EKEventViewControllerOOPWrapperImpl *)self toolbarItems];

    if (v20)
    {
      char v21 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
      [v21 setToolbarHidden:1];

      [(EKEventViewControllerOOPWrapperImpl *)self setToolbarItems:0 animated:1];
    }
  }
}

- (id)statusButtons
{
  int64_t v2 = [(EKEventViewControllerOOPWrapperImpl *)self _actionsMask];
  BOOL v3 = objc_opt_class();

  return (id)[v3 _orderedActionsForMask:v2];
}

- (id)_statusButtonsView
{
  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    int v4 = [EKUIEventStatusButtonsView alloc];
    BOOL v5 = [(EKEventViewControllerOOPWrapperImpl *)self statusButtons];
    char v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setDisableButtonHighlights:[(EKEventViewControllerOOPWrapperImpl *)self _isDisplayingInvitation] ^ 1];
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
    int v4 = [SingleToolbarItemContainerView alloc];
    BOOL v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    char v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    [(SingleToolbarItemContainerView *)self->_statusButtonsContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    statusButtonsContainerView = self->_statusButtonsContainerView;
  }

  return statusButtonsContainerView;
}

- (void)_updateStatusButtonsActions
{
  id v3 = [(EKEventViewControllerOOPWrapperImpl *)self statusButtons];
  [(EKUIEventStatusButtonsView *)self->_statusButtonsView setActions:v3];
}

- (BOOL)canShowRealContent
{
  uint64_t v3 = [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:0];
  if (v3 == 4)
  {
    int v4 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    BOOL v5 = [v4 eventStore];
    char v6 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    int v7 = [v5 isCurrentProcessCreatorOfEvent:v6];

    if (v7) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  unint64_t v8 = v3 - 3;
  uint64_t v9 = [(EKEventViewControllerOOPWrapperImpl *)self event];

  return v8 < 2 && v9 != 0;
}

- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage
{
  if ([(EKEventViewControllerOOPWrapperImpl *)self showsOutOfDateMessage]
    || [(EKEventViewControllerOOPWrapperImpl *)self showsDelegatorMessage])
  {
    return 1;
  }

  return [(EKEventViewControllerOOPWrapperImpl *)self showsDelegateMessage];
}

- (BOOL)_isDisplayingInvitation
{
  BOOL v3 = [(EKEventViewControllerOOPWrapperImpl *)self allowsInviteResponses];
  if (v3)
  {
    int v4 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    char v5 = [v4 allowsParticipationStatusModifications];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isDisplayingDeletableEvent
{
  BOOL v3 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  int v4 = [v3 calendar];
  if ([v4 allowsContentModifications])
  {
    char v5 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    int v6 = [v5 isPrivateEventSharedToMe];

    if (!v6) {
      return 1;
    }
  }
  else
  {
  }
  unint64_t v8 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  if ([v8 status] == 3)
  {
    uint64_t v9 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    uint64_t v10 = [v9 calendar];
    int v11 = [v10 source];
    if ([v11 isDelegate])
    {
      uint64_t v12 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      id v13 = [v12 calendar];
      v14 = [v13 source];
      char v7 = [v14 isWritable];
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)_actionsMask
{
  if ([(EKEventViewControllerOOPWrapperImpl *)self _shouldDisplayDelegateOrOutOfDateMessage]|| ![(EKEventViewControllerOOPWrapperImpl *)self canShowRealContent])
  {
    return 0;
  }
  if ([(EKEventViewControllerOOPWrapperImpl *)self _isDisplayingInvitation]) {
    return 7;
  }
  if ([(EKEventViewControllerOOPWrapperImpl *)self isICSPreview])
  {
    if ([(EKEventViewControllerOOPWrapperImpl *)self showsAddToCalendarForICSPreview])
    {
      int64_t v3 = 8;
    }
    else if ([(EKEventViewControllerOOPWrapperImpl *)self showsUpdateCalendarForICSPreview])
    {
      int64_t v3 = 2048;
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  if ([(EKEventViewControllerOOPWrapperImpl *)self _isDisplayingDeletableEvent]
    && (![(EKEventViewControllerOOPWrapperImpl *)self isICSPreview]
     || [(EKEventViewControllerOOPWrapperImpl *)self showsDeleteForICSPreview]))
  {
    char v5 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    uint64_t v6 = [v5 status];

    if (v6 == 3) {
      return v3 | 0x100000;
    }
    else {
      return v3 | 0x10;
    }
  }
  return v3;
}

+ (id)_orderedActionsForMask:(int64_t)a3
{
  int v4 = objc_opt_new();
  for (uint64_t i = 0; i != 11; ++i)
  {
    if ((_orderedActionsForMask__actionOrder[i] & a3) != 0)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v4 addObject:v6];
    }
  }

  return v4;
}

- (void)_prepareEventForEdit:(id)a3
{
  id v7 = a3;
  int64_t v3 = [v7 calendar];

  if (!v3)
  {
    int v4 = [v7 eventStore];
    char v5 = [v4 defaultCalendarForNewEvents];
    [v7 setCalendar:v5];
  }
  uint64_t v6 = [v7 startDate];

  if (!v6) {
    [(id)objc_opt_class() setDefaultDatesForEvent:v7];
  }
}

- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(a4, "buttonForAction:");
  id v7 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "EKEventViewController invoking action: %ld", (uint8_t *)&v10, 0xCu);
  }
  if (a3 > 4095)
  {
    if (a3 < 0x8000)
    {
      if (a3 == 4096)
      {
        [(EKEventViewControllerOOPWrapperImpl *)self _acceptProposedTimeWithSourceViewForPopover:v6];
      }
      else if (a3 == 0x2000)
      {
        [(EKEventViewControllerOOPWrapperImpl *)self _rejectProposedTime];
      }
    }
    else if (a3 == 0x8000)
    {
      [(EKEventViewControllerOOPWrapperImpl *)self _cancelProposedTime];
    }
    else if (a3 == 0x80000 || a3 == 0x100000)
    {
LABEL_14:
      uint64_t v9 = [(EKEventViewControllerOOPWrapperImpl *)self _statusButtonsView];
      [(EKEventViewControllerOOPWrapperImpl *)self _deleteClicked:v9];
    }
  }
  else
  {
    uint64_t v8 = 2;
    switch(a3)
    {
      case 1:
        goto LABEL_19;
      case 2:
        uint64_t v8 = 4;
        goto LABEL_19;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        uint64_t v8 = 3;
LABEL_19:
        [(EKEventViewControllerOOPWrapperImpl *)self _saveStatus:v8 sourceViewForPopover:v6];
        break;
      case 8:
        goto LABEL_13;
      default:
        if (a3 == 16) {
          goto LABEL_14;
        }
        if (a3 == 2048) {
LABEL_13:
        }
          [(EKEventViewControllerOOPWrapperImpl *)self _addToCalendarClicked:self];
        break;
    }
  }
}

- (id)_proposedDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  int v4 = [v3 attendees];

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
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if ([v10 proposedStartDateStatus] == 1
            || ![v10 proposedStartDateStatus])
          {
            int64_t v11 = [(EKEventViewControllerOOPWrapperImpl *)self event];
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
  uint64_t v5 = [(EKEventViewControllerOOPWrapperImpl *)self _proposedDate];
  if (v5)
  {
    uint64_t v6 = [(EKEventViewControllerOOPWrapperImpl *)self event];
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
    if ([v6 hasRecurrenceRules])
    {
      uint64_t v19 = [(EKEventViewControllerOOPWrapperImpl *)self presentationSourceViewController];
      [v4 bounds];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __83__EKEventViewControllerOOPWrapperImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke;
      v22[3] = &unk_1E6088638;
      v22[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v4, v6, v22);
      v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v20;
    }
    else
    {
      [(EKEventViewControllerOOPWrapperImpl *)self _performSave:0 animated:0];
    }
  }
}

void __83__EKEventViewControllerOOPWrapperImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke(uint64_t a1, uint64_t a2)
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
    uint64_t v7 = *(void **)(v6 + 1000);
    *(void *)(v6 + 1000) = 0;

    uint64_t v8 = *(void **)(a1 + 32);
    [v8 _performSave:v5 animated:0];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1000);
    *(void *)(v3 + 1000) = 0;
  }
}

- (void)_rejectProposedTime
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self event];
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

  int64_t v11 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  if ([v11 hasRecurrenceRules]) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }

  [(EKEventViewControllerOOPWrapperImpl *)self _performSave:v12 animated:0];
}

- (void)_cancelProposedTime
{
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  [v3 setProposedStartDate:0];

  [(EKEventViewControllerOOPWrapperImpl *)self _performSave:0 animated:0];
}

- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v13 = v6;
    uint64_t v7 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    char v8 = [v7 responseMustApplyToAll];

    if (v8)
    {
      uint64_t v9 = 4;
    }
    else
    {
      id v10 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      char v11 = [v10 hasRecurrenceRules];

      if (v11)
      {
        self->_pendingStatus = a3;
        [(EKEventViewControllerOOPWrapperImpl *)self _presentDetachSheetFromView:v13];
LABEL_8:
        id v6 = v13;
        goto LABEL_9;
      }
      uint64_t v12 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      [v12 isDetached];

      uint64_t v9 = 0;
    }
    [(EKEventViewControllerOOPWrapperImpl *)self _saveStatus:a3 span:v9];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4
{
  uint64_t v7 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  [v7 setParticipationStatus:a3];

  char v8 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  [v8 setInvitationStatus:0];

  [(EKEventViewControllerOOPWrapperImpl *)self _performSave:a4 animated:1];
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  id v6 = [(UIResponder *)self EKUI_editor];
  uint64_t v7 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  id v14 = 0;
  char v8 = [v6 saveEvent:v7 span:a3 error:&v14];
  id v9 = v14;

  if ((v8 & 1) == 0 && v9)
  {
    id v10 = [v9 domain];
    if (v10 != (void *)*MEMORY[0x1E4F25338])
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v11 = [v9 code];

    if (v11 == 1010)
    {
      id v10 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      uint64_t v12 = [v10 eventStore];
      [v12 rollback];

      goto LABEL_6;
    }
  }
LABEL_7:
  [(EKEventViewControllerOOPWrapperImpl *)self completeWithAction:1];

  return 1;
}

- (void)_deleteClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  uint64_t v6 = [v5 status];

  uint64_t v7 = [(UIResponder *)self EKUI_editor];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__EKEventViewControllerOOPWrapperImpl__deleteClicked___block_invoke;
  aBlock[3] = &unk_1E6089560;
  aBlock[4] = self;
  BOOL v26 = v6 == 3;
  id v8 = v7;
  id v25 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(EKEventViewControllerOOPWrapperImpl *)self presentationSourceViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 buttonForAction:16];
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (v6 == 3) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = 4;
  }
  [v11 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  char v21 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", v12, v10, v11, v21, 0, v9, v14, v16, v18, v20);
  v22 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v22;
}

void __54__EKEventViewControllerOOPWrapperImpl__deleteClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = 2;
  }
  else if (a2 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = 1;
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    uint64_t v3 = 2 * *(unsigned __int8 *)(a1 + 48);
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  [v4 _performDelete:v3 editor:v5];
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 1000);
  *(void *)(v6 + 1000) = 0;
}

- (void)_performDelete:(int64_t)a3 editor:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F25540];
  id v7 = a4;
  id v8 = [v6 sharedInstance];
  uint64_t v9 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  [v8 handleEventDeletion:v9];

  id v10 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  id v15 = 0;
  LOBYTE(v9) = [v7 deleteEvent:v10 span:a3 error:&v15];

  id v11 = v15;
  if ((v9 & 1) == 0)
  {
    uint64_t v12 = [v11 domain];
    if (v12 != (void *)*MEMORY[0x1E4F25338])
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v13 = [v11 code];

    if (v13 == 1010)
    {
      uint64_t v12 = [(EKEventViewControllerOOPWrapperImpl *)self event];
      double v14 = [v12 eventStore];
      [v14 rollback];

      goto LABEL_5;
    }
  }
LABEL_6:
  [(EKEventViewControllerOOPWrapperImpl *)self completeWithAction:2];
}

- (void)_addToCalendarClicked:(id)a3
{
  uint64_t v4 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      [v8 performSelector:sel_eventViewControllerDidRequestAddToCalendar_ withObject:self];
    }
  }
}

- (void)_presentDetachSheetFromView:(id)a3
{
  id v4 = a3;
  id v17 = [(EKEventViewControllerOOPWrapperImpl *)self _detachSheetHandler];
  uint64_t v5 = [(EKEventViewControllerOOPWrapperImpl *)self presentationSourceViewController];
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v5, v4, v14, v17, v7, v9, v11, v13);
  id v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v15;
}

- (id)_detachSheetHandler
{
  BOOL v2 = self->_pendingStatus == 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__EKEventViewControllerOOPWrapperImpl__detachSheetHandler__block_invoke;
  v7[3] = &unk_1E6089588;
  char v3 = !v2;
  v7[4] = self;
  char v8 = v3;
  id v4 = _Block_copy(v7);
  uint64_t v5 = _Block_copy(v4);

  return v5;
}

void __58__EKEventViewControllerOOPWrapperImpl__detachSheetHandler__block_invoke(uint64_t a1, uint64_t a2)
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
        [v3 _saveStatus:v3[123] span:a2];
      }
      else {
        [v3 _performSave:a2 animated:1];
      }
LABEL_7:
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 1000);
      *(void *)(v4 + 1000) = 0;

      return;
  }
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

- (void)setEvent:(id)a3
{
  id v4 = a3;
  [(EKEventViewControllerOOPWrapperImpl *)self _prepareEventForEdit:v4];
  uint64_t v5 = [v4 eventStore];
  eventStore = self->_eventStore;
  self->_eventStore = v5;

  id v7 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v7 setEvent:v4];
}

- (EKEvent)event
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 event];

  return (EKEvent *)v3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setAllowsEditing:v3];
}

- (BOOL)allowsEditing
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 allowsEditing];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v5 setDelegate:v4];
}

- (EKEventViewDelegate)delegate
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 delegate];

  return (EKEventViewDelegate *)v3;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setAllowsCalendarPreview:v3];
}

- (BOOL)allowsCalendarPreview
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 allowsCalendarPreview];

  return v3;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setCalendarPreviewIsInlineDayView:v3];
}

- (BOOL)calendarPreviewIsInlineDayView
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 calendarPreviewIsInlineDayView];

  return v3;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setInlineDayViewRespectsSelectedCalendarsFilter:v3];
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 inlineDayViewRespectsSelectedCalendarsFilter];

  return v3;
}

- (void)setICSPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setICSPreview:v3];
}

- (BOOL)isICSPreview
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 ICSPreview];

  return v3;
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setAllowsInviteResponses:v3];
}

- (BOOL)allowsInviteResponses
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 allowsInviteResponses];

  return v3;
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsAddToCalendarForICSPreview:v3];
}

- (BOOL)showsAddToCalendarForICSPreview
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsAddToCalendarForICSPreview];

  return v3;
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsUpdateCalendarForICSPreview:v3];
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsUpdateCalendarForICSPreview];

  return v3;
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsDeleteForICSPreview:v3];
}

- (BOOL)showsDeleteForICSPreview
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsDeleteForICSPreview];

  return v3;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setAllowsSubitems:v3];
}

- (BOOL)allowsSubitems
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 allowsSubitems];

  return v3;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsDoneButton:v3];
}

- (BOOL)showsDoneButton
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsDoneButton];

  return v3;
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsOutOfDateMessage:v3];
}

- (BOOL)showsOutOfDateMessage
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsOutOfDateMessage];

  return v3;
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsDelegatorMessage:v3];
}

- (BOOL)showsDelegatorMessage
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsDelegatorMessage];

  return v3;
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsDelegateMessage:v3];
}

- (BOOL)showsDelegateMessage
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsDelegateMessage];

  return v3;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setShowsDetectedConferenceItem:v3];
}

- (BOOL)showsDetectedConferenceItem
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 showsDetectedConferenceItem];

  return v3;
}

- (void)setMinimalMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setMinimalMode:v3];
}

- (BOOL)minimalMode
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 minimalMode];

  return v3;
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setNoninteractivePlatterMode:v3];
}

- (BOOL)noninteractivePlatterMode
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 noninteractivePlatterMode];

  return v3;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v4 setIsLargeDayView:v3];
}

- (BOOL)isLargeDayView
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 isLargeDayView];

  return v3;
}

- (int)editorShowTransition
{
  return 8;
}

- (int)editorHideTransition
{
  return 9;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 waitUntil:(id)a5
{
  id v11 = a5;
  char v8 = [a3 event];
  [(EKEventViewControllerOOPWrapperImpl *)self setEvent:v8];

  if (a4 == 2)
  {
    [(EKEventViewControllerOOPWrapperImpl *)self completeWithAction:2];
  }
  else
  {
    double v9 = [(EKEventViewControllerOOPWrapperImpl *)self event];
    double v10 = [v9 eventIdentifier];
    [(EKEventViewControllerOOPWrapperImpl *)self reloadRemoteViewWithUpdatedEventID:v10 waitUntil:v11];

    [(EKEventViewControllerOOPWrapperImpl *)self _dismissEditor:1 deleted:0];
  }
}

- (id)activeEventEditor
{
  return self->_activeEventEditor;
}

- (void)setActiveEventEditor:(id)a3
{
  id v4 = (EKEventEditViewController *)a3;
  [(EKEventEditViewController *)v4 setEditViewDelegate:self];
  id v5 = [(EKEventViewControllerOOPWrapperImpl *)self view];
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
  {
    double v6 = [(EKEventViewControllerOOPWrapperImpl *)self view];
    BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

    if (IsRegular) {
      [(EKEventEditViewController *)v4 setModalPresentationStyle:3];
    }
  }
  else
  {
  }
  char v8 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    -[EKEventEditViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", [v10 editorPresentationStyle]);
  }
  activeEventEditor = self->_activeEventEditor;
  self->_activeEventEditor = v4;
}

- (void)presentEditorAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  double v18 = self->_activeEventEditor;
  id v5 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (![v5 conformsToProtocol:&unk_1F0D6D1B0]) {
    goto LABEL_6;
  }
  double v6 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v7 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  char v8 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  int v9 = [v7 eventViewDelegateShouldHandlePresentationOfEditViewController:v8];

  if (v9)
  {
    double v10 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    id v11 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
    [v10 eventViewController:v11 requestsDisplayOfEditViewController:v18 animated:v3];

LABEL_12:
    goto LABEL_13;
  }
LABEL_7:
  if (v18)
  {
    if (v3
      && (uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self editorShowTransition], v3 == 8))
    {
      double v10 = [(EKEventViewControllerOOPWrapperImpl *)self _viewControllerForEditorPresentation];
      [v10 presentViewController:v18 animated:1 completion:0];
    }
    else
    {
      double v10 = [(EKEventViewControllerOOPWrapperImpl *)self _viewControllerForEditorPresentation];
      [v10 presentModalViewController:v18 withTransition:v3];
    }
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v12 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (v12)
  {
    double v13 = (void *)v12;
    double v14 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      double v16 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      [v16 performSelector:sel_eventViewControllerDidBeginEditingEventWithEditViewController_ withObject:v18];
    }
  }
  id v17 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v17 eventEditViewPresented:1];
}

- (id)_viewControllerForEditorPresentation
{
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];

  if (v3)
  {
    id v4 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4
{
  activeEventEditor = self->_activeEventEditor;
  if (activeEventEditor)
  {
    BOOL v6 = a4;
    if (([(EKEventEditViewController *)activeEventEditor isBeingDismissed] & 1) == 0)
    {
      uint64_t v7 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      if (v7)
      {
        char v8 = (void *)v7;
        int v9 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
        int v10 = [v9 conformsToProtocol:&unk_1F0D6D1B0];

        if (v10)
        {
          id v11 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
          char v12 = objc_opt_respondsToSelector();

          if (v12)
          {
            double v13 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
            double v14 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
            [v13 eventViewControllerWillFinishEditingEvent:v14 deleted:v6];
          }
          char v15 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
          char v16 = objc_opt_respondsToSelector();

          id v17 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
          if (v16)
          {
            double v18 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
            [v17 eventViewController:v18 requestsDismissalOfEditViewController:self->_activeEventEditor];
            goto LABEL_19;
          }
          char v19 = objc_opt_respondsToSelector();

          if (v19)
          {
            double v20 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
            char v21 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
            [v20 eventViewController:v21 willDismissEditViewController:self->_activeEventEditor deleted:v6];
          }
          int v10 = 1;
        }
      }
      else
      {
        int v10 = 0;
      }
      int v22 = [(EKEventViewControllerOOPWrapperImpl *)self editorHideTransition];
      long long v23 = [(EKEventEditViewController *)self->_activeEventEditor presentingViewController];
      long long v24 = v23;
      if (v22 == 9) {
        [v23 dismissViewControllerAnimated:1 completion:0];
      }
      else {
        objc_msgSend(v23, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerOOPWrapperImpl editorHideTransition](self, "editorHideTransition"), 0);
      }

      if (!v10) {
        goto LABEL_20;
      }
      id v25 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0) {
        goto LABEL_20;
      }
      id v17 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      double v18 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
      [v17 eventViewController:v18 didDismissEditViewController:self->_activeEventEditor deleted:v6];
LABEL_19:

LABEL_20:
      [(EKEventEditViewController *)self->_activeEventEditor setEditViewDelegate:0];
      v27 = self->_activeEventEditor;
      self->_activeEventEditor = 0;
    }
  }
  id v28 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v28 eventEditViewPresented:0];
}

- (BOOL)_shouldPopSelf
{
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  id v5 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  uint64_t v7 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  char v8 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  char v9 = [v7 eventViewControllerShouldDismissSelf:v8];

  return v9;
}

- (void)completeWithAction:(int64_t)a3
{
  [(EKEventViewControllerOOPWrapperImpl *)self _dismissEditor:0 deleted:a3 == 2];
  uint64_t v5 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
  if (v5)
  {
    id v8 = (id)v5;
    char v6 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(EKEventViewControllerOOPWrapperImpl *)self _shouldPopSelf];

      if (v7) {
        return;
      }
      id v8 = [(EKEventViewControllerOOPWrapperImpl *)self delegate];
      char v6 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
      [v8 eventViewController:v6 didCompleteWithAction:a3];
    }
  }
}

- (void)setNeedsReload
{
  id v4 = [(EKEventViewControllerOOPWrapperImpl *)self event];
  uint64_t v3 = [v4 eventIdentifier];
  [(EKEventViewControllerOOPWrapperImpl *)self reloadRemoteViewWithUpdatedEventID:v3 waitUntil:0];
}

- (void)fullReloadWithNewEvent:(id)a3
{
  id v4 = [a3 eventIdentifier];
  [(EKEventViewControllerOOPWrapperImpl *)self reloadRemoteViewWithUpdatedEventID:v4 waitUntil:0];
}

- (void)reloadRemoteViewWithUpdatedEventID:(id)a3 waitUntil:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EKEventViewControllerOOPWrapperImpl *)self vc];
  [v8 eventEditViewCompletedWith:1 eventID:v7 waitUntil:v6];
}

- (void)performAddToCalendar
{
  BOOL v2 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_ERROR, "performAddToCalendar not permitted on out-of-process EKEventViewController.", v3, 2u);
  }
}

- (id)presentationSourceViewController
{
  uint64_t v3 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];

  if (v3)
  {
    id v4 = [(EKEventViewControllerOOPWrapperImpl *)self navigationController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)setToolbarItems:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  [v5 setToolbarItems:v4];
}

- (id)toolbarItems
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  uint64_t v3 = [v2 toolbarItems];

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  [v7 setToolbarItems:v6 animated:v4];
}

- (id)navigationItem
{
  BOOL v2 = [(EKEventViewControllerOOPWrapperImpl *)self _ekEventViewController];
  uint64_t v3 = [v2 navigationItem];

  return v3;
}

- (BOOL)eventEditViewPresented
{
  return self->_eventEditViewPresented;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  self->_eventEditViewPresented = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UIScrollView)eventDetailsScrollView
{
  return self->eventDetailsScrollView;
}

- (UIViewController)eventDetailsViewController
{
  return self->eventDetailsViewController;
}

- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->eventDetailsViewController, 0);
  objc_storeStrong((id *)&self->eventDetailsScrollView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_activeEventEditor, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end