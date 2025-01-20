@interface EKEventViewControllerModernImpl
+ (id)_orderedActionsForMask:(int64_t)a3;
- (BOOL)_backingEventAllowsEditing;
- (BOOL)_isDisplayingDeletableEvent;
- (BOOL)_isDisplayingInvitation;
- (BOOL)_isDisplayingSuggestion;
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
- (BOOL)eventEditViewPresented;
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
- (EKEvent)event;
- (EKEventViewControllerModernImpl)init;
- (EKEventViewDelegate)delegate;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (NSDictionary)context;
- (UIScrollView)eventDetailsScrollView;
- (UIViewController)eventDetailsViewController;
- (double)eventStatusButtonsViewButtonFontSize:(id)a3;
- (id)_detachSheetHandler;
- (id)_proposedDate;
- (id)_statusButtonsContainerView;
- (id)_statusButtonsView;
- (id)_viewControllerForEditorPresentation;
- (id)calendarModel;
- (id)navigationItem;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (id)presentationSourceViewController;
- (id)statusButtons;
- (id)toolbarItems;
- (id)viewControllerManager;
- (id)viewTitle;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int64_t)_actionsMask;
- (void)_acceptProposedTimeWithSourceViewForPopover:(id)a3;
- (void)_addToCalendarClicked:(id)a3;
- (void)_cancelProposedTime;
- (void)_deleteClicked:(id)a3;
- (void)_deleteSuggestionTapped:(id)a3;
- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4;
- (void)_doneButtonPressed:(id)a3;
- (void)_performDelete:(int64_t)a3 editor:(id)a4;
- (void)_pop;
- (void)_presentDetachSheetFromBarButtonItem:(id)a3;
- (void)_presentDetachSheetFromView:(id)a3;
- (void)_rejectProposedTime;
- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4;
- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4;
- (void)_unsubscribeClicked:(id)a3;
- (void)_updateNavBarAnimated:(BOOL)a3;
- (void)_updateResponse;
- (void)_updateResponseVisibility;
- (void)_updateStatusButtonsActions;
- (void)completeWithAction:(int64_t)a3;
- (void)doneButtonTapped;
- (void)editEvent;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4;
- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4;
- (void)loadView;
- (void)presentEditorAnimated:(BOOL)a3;
- (void)requestAttendeesDetailPresentation;
- (void)requestOrganizerDetailPresentation;
- (void)setActiveEventEditor:(id)a3;
- (void)setAllowsCalendarPreview:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsInviteResponses:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorHideTransition:(int)a3;
- (void)setEditorShowTransition:(int)a3;
- (void)setEvent:(id)a3;
- (void)setEventEditViewPresented:(BOOL)a3;
- (void)setICSPreview:(BOOL)a3;
- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setIsLargeDayView:(BOOL)a3;
- (void)setMinimalMode:(BOOL)a3;
- (void)setNavigationDelegate:(id)a3;
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
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKEventViewControllerModernImpl

- (EKEventViewControllerModernImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventViewControllerModernImpl;
  return [(EKEventViewControllerModernImpl *)&v3 init];
}

- (id)viewControllerManager
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F57B88]) initWithDelegate:self];

  return v2;
}

- (void)loadView
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)EKEventViewControllerModernImpl;
  [(EKEventViewControllerModernImpl *)&v26 loadView];
  objc_super v3 = [(EKEventViewControllerModernImpl *)self viewControllerManager];
  v4 = [v3 viewController];

  v25 = v4;
  [(EKEventViewControllerModernImpl *)self addChildViewController:v4];
  [v4 didMoveToParentViewController:self];
  v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(EKEventViewControllerModernImpl *)self view];
  [v6 addSubview:v5];

  v17 = (void *)MEMORY[0x1E4F28DC8];
  v24 = [(EKEventViewControllerModernImpl *)self view];
  v23 = [v24 leadingAnchor];
  v22 = [v5 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v27[0] = v21;
  v20 = [(EKEventViewControllerModernImpl *)self view];
  v19 = [v20 trailingAnchor];
  v18 = [v5 trailingAnchor];
  v16 = [v19 constraintEqualToAnchor:v18];
  v27[1] = v16;
  v7 = [(EKEventViewControllerModernImpl *)self view];
  v8 = [v7 topAnchor];
  v9 = [v5 topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v27[2] = v10;
  v11 = [(EKEventViewControllerModernImpl *)self view];
  v12 = [v11 bottomAnchor];
  v13 = [v5 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v27[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v17 activateConstraints:v15];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerModernImpl;
  [(EKEventViewControllerModernImpl *)&v5 viewDidLoad];
  objc_super v3 = [(EKEventViewControllerModernImpl *)self viewTitle];
  v4 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  [v4 setTitle:v3];
}

- (id)viewTitle
{
  v2 = EventKitUIBundle();
  objc_super v3 = [v2 localizedStringForKey:@"Event Details" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)EKEventViewControllerModernImpl;
  [(EKEventViewControllerModernImpl *)&v12 viewDidAppear:a3];
  self->_didAppear = 1;
  if (self->_autoPop)
  {
    v4 = [(EKEventViewControllerModernImpl *)self navigationController];
    id v5 = (id)[v4 popViewControllerAnimated:1];
  }
  if (!self->_countedAppearance)
  {
    self->_countedAppearance = 1;
    uint64_t v6 = [(EKEvent *)self->_event suggestionInfo];
    if (v6)
    {
      v7 = (void *)v6;
      int v8 = [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp];

      if (v8)
      {
        [MEMORY[0x1E4F57840] trackPseudoEventDetailsOpened];
        v9 = (void *)MEMORY[0x1E4F57848];
        v10 = [(EKEvent *)self->_event suggestionInfo];
        v11 = [v10 uniqueKey];
        [v9 logEventShowedDetailsWithUniqueKey:v11];
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventViewControllerModernImpl;
  [(EKEventViewControllerModernImpl *)&v4 viewWillAppear:a3];
  [(EKEventViewControllerModernImpl *)self _updateStatusButtonsActions];
  [(EKEventViewControllerModernImpl *)self _updateResponse];
  [(EKEventViewControllerModernImpl *)self _updateNavBarAnimated:0];
  [(EKEventViewControllerModernImpl *)self _updateResponseVisibility];
}

- (BOOL)_shouldShowEditButton
{
  BOOL v3 = [(EKEventViewControllerModernImpl *)self allowsEditing];
  if (v3)
  {
    LOBYTE(v3) = [(EKEventViewControllerModernImpl *)self _backingEventAllowsEditing];
  }
  return v3;
}

- (BOOL)_backingEventAllowsEditing
{
  if ([(EKEvent *)self->_event isEditable])
  {
    BOOL v3 = [(EKEvent *)self->_event eventStore];
    if (v3)
    {
      objc_super v4 = [(EKEvent *)self->_event calendar];
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

- (void)_updateNavBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(EKEvent *)self->_event title];
  uint64_t v6 = [(EKEventViewControllerModernImpl *)self navigationItem];
  [v6 setBackButtonTitle:v5];

  if ([(EKEventViewControllerModernImpl *)self _shouldShowEditButton])
  {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel_editEvent];
    if ([(EKEventViewControllerModernImpl *)self _shouldDisplayDoneButton])
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonPressed_];
      int v8 = [(EKEventViewControllerModernImpl *)self navigationItem];
      [v8 setLeftBarButtonItem:v11 animated:v3];

      v9 = [(EKEventViewControllerModernImpl *)self navigationItem];
      [v9 setRightBarButtonItem:v7 animated:v3];
    }
    else
    {
      v7 = [(EKEventViewControllerModernImpl *)self navigationItem];
      [v7 setRightBarButtonItem:v11 animated:v3];
    }
  }
  else if ([(EKEventViewControllerModernImpl *)self _shouldDisplayDoneButton])
  {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonPressed_];
    v10 = [(EKEventViewControllerModernImpl *)self navigationItem];
    [v10 setRightBarButtonItem:v11 animated:v3];
  }
  else
  {
    id v11 = [(EKEventViewControllerModernImpl *)self navigationItem];
    [v11 setRightBarButtonItem:0 animated:v3];
  }
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!self->_recurrenceAlertController)
  {
    id v7 = v4;
    if ([(EKEvent *)self->_event hasChanges])
    {
      if ([(EKEvent *)self->_event requiresDetach])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(EKEventViewControllerModernImpl *)self _presentDetachSheetFromBarButtonItem:v7];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          int v5 = v7;
          if ((isKindOfClass & 1) == 0) {
            goto LABEL_11;
          }
          [(EKEventViewControllerModernImpl *)self _presentDetachSheetFromView:v7];
        }
      }
      else
      {
        [(EKEventViewControllerModernImpl *)self _performSave:0 animated:1];
      }
    }
    else
    {
      [(EKEventViewControllerModernImpl *)self completeWithAction:0];
    }
    int v5 = v7;
  }
LABEL_11:
}

- (BOOL)_shouldDisplayDoneButton
{
  BOOL v3 = [(EKEventViewControllerModernImpl *)self navigationItem];
  id v4 = [v3 leftBarButtonItem];
  if (!self->_showsDoneButton) {
    goto LABEL_7;
  }
  if (([v3 hidesBackButton] & 1) == 0 && (!v4 || !objc_msgSend(v4, "systemItem")))
  {
    int v5 = [(EKEventViewControllerModernImpl *)self navigationController];
    uint64_t v6 = [v5 viewControllers];

    if ([v6 count])
    {
      id v7 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
      int v8 = [v6 objectAtIndex:0];

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

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 performSelector:sel_eventViewControllerWillDisappear_ withObject:self];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)EKEventViewControllerModernImpl;
  [(EKEventViewControllerModernImpl *)&v11 viewWillDisappear:v3];
}

- (id)_statusButtonsView
{
  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    id v4 = [EKUIEventStatusButtonsView alloc];
    int v5 = [(EKEventViewControllerModernImpl *)self statusButtons];
    uint64_t v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setDisableButtonHighlights:[(EKEventViewControllerModernImpl *)self _isDisplayingInvitation] ^ 1];
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
    id v4 = [SingleToolbarItemContainerView alloc];
    int v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    [(SingleToolbarItemContainerView *)self->_statusButtonsContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    statusButtonsContainerView = self->_statusButtonsContainerView;
  }

  return statusButtonsContainerView;
}

- (void)_updateStatusButtonsActions
{
  id v3 = [(EKEventViewControllerModernImpl *)self statusButtons];
  [(EKUIEventStatusButtonsView *)self->_statusButtonsView setActions:v3];
}

- (BOOL)_shouldDisplayStatusButtons
{
  v2 = [(EKEventViewControllerModernImpl *)self statusButtons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_isDisplayingInvitation
{
  int v3 = [(EKEventViewControllerModernImpl *)self allowsInviteResponses];
  if (v3)
  {
    event = self->_event;
    LOBYTE(v3) = [(EKEvent *)event allowsParticipationStatusModifications];
  }
  return v3;
}

- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage
{
  if ([(EKEventViewControllerModernImpl *)self showsOutOfDateMessage]
    || [(EKEventViewControllerModernImpl *)self showsDelegatorMessage])
  {
    return 1;
  }

  return [(EKEventViewControllerModernImpl *)self showsDelegateMessage];
}

- (BOOL)_isDisplayingSuggestion
{
  v2 = [(EKEvent *)self->_event calendar];
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
    char v9 = 1;
    goto LABEL_6;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = [v7 eventViewControllerShouldHideDeleteButton];

  char v9 = v8 ^ 1;
LABEL_6:
  id v10 = [(EKEvent *)self->_event calendar];
  if ([v10 allowsContentModifications]
    && ([(EKEvent *)self->_event isPrivateEventSharedToMe] & 1) == 0)
  {
    if (self->_minimalMode) {
      char v9 = 0;
    }

    if (v9) {
      return 1;
    }
  }
  else
  {
  }
  if ([(EKEvent *)self->_event status] != EKEventStatusCanceled) {
    return 0;
  }
  objc_super v11 = [(EKEvent *)self->_event calendar];
  objc_super v12 = [v11 source];
  if ([v12 isDelegate])
  {
    v13 = [(EKEvent *)self->_event calendar];
    v14 = [v13 source];
    char v15 = [v14 isWritable];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (int64_t)_actionsMask
{
  if ([(EKEventViewControllerModernImpl *)self _shouldDisplayDelegateOrOutOfDateMessage])
  {
    return 0;
  }
  if (![(EKEventViewControllerModernImpl *)self _isDisplayingInvitation])
  {
    if ([(EKEventViewControllerModernImpl *)self isICSPreview])
    {
      if ([(EKEventViewControllerModernImpl *)self showsAddToCalendarForICSPreview])
      {
        int64_t v3 = 8;
        goto LABEL_13;
      }
      BOOL v4 = ![(EKEventViewControllerModernImpl *)self showsUpdateCalendarForICSPreview];
      uint64_t v5 = 2048;
    }
    else
    {
      BOOL v4 = ![(EKEventViewControllerModernImpl *)self _isDisplayingSuggestion];
      uint64_t v5 = 136;
    }
    if (v4) {
      int64_t v3 = 0;
    }
    else {
      int64_t v3 = v5;
    }
LABEL_13:
    if ([(EKEventViewControllerModernImpl *)self _isDisplayingDeletableEvent]
      && (![(EKEventViewControllerModernImpl *)self isICSPreview]
       || [(EKEventViewControllerModernImpl *)self showsDeleteForICSPreview]))
    {
      if ([(EKEvent *)self->_event status] == EKEventStatusCanceled) {
        v3 |= 0x100000uLL;
      }
      else {
        v3 |= 0x10uLL;
      }
    }
    goto LABEL_19;
  }
  int64_t v3 = 7;
LABEL_19:
  char v6 = [(EKEventViewControllerModernImpl *)self event];
  id v7 = [v6 calendar];

  if ([v7 isSubscribed]
    && ([v7 isSubscribedHolidayCalendar] & 1) == 0
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
    if ((_orderedActionsForMask__actionOrder_1[i] & a3) != 0)
    {
      char v6 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v4 addObject:v6];
    }
  }

  return v4;
}

- (id)statusButtons
{
  int64_t v2 = [(EKEventViewControllerModernImpl *)self _actionsMask];
  int64_t v3 = objc_opt_class();

  return (id)[v3 _orderedActionsForMask:v2];
}

- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v6 = objc_msgSend(a4, "buttonForAction:");
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
          [(EKEventViewControllerModernImpl *)self _saveStatus:v8 sourceViewForPopover:v6];
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
        [(EKEventViewControllerModernImpl *)self _deleteSuggestionTapped:self];
      }
      else if (a3 == 2048)
      {
LABEL_15:
        [(EKEventViewControllerModernImpl *)self _addToCalendarClicked:self];
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
        [(EKEventViewControllerModernImpl *)self _acceptProposedTimeWithSourceViewForPopover:v6];
        break;
      case 0x2000:
        [(EKEventViewControllerModernImpl *)self _rejectProposedTime];
        break;
      case 0x8000:
        [(EKEventViewControllerModernImpl *)self _cancelProposedTime];
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
      char v9 = [(EKEventViewControllerModernImpl *)self _statusButtonsView];
      [(EKEventViewControllerModernImpl *)self _deleteClicked:v9];
      goto LABEL_23;
    }
    if (a3 == 0x10000)
    {
      PresentJunkAlertControllerForEvent(self->_event, self);
      goto LABEL_30;
    }
    if (a3 == 0x40000)
    {
      char v9 = [(EKEventViewControllerModernImpl *)self _statusButtonsView];
      [(EKEventViewControllerModernImpl *)self _unsubscribeClicked:v9];
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
  int64_t v3 = [(EKEventViewControllerModernImpl *)self event];
  BOOL v4 = [v3 attendees];

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
            int64_t v11 = [(EKEventViewControllerModernImpl *)self event];
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
  uint64_t v5 = [(EKEventViewControllerModernImpl *)self _proposedDate];
  if (v5)
  {
    uint64_t v6 = [(EKEventViewControllerModernImpl *)self event];
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
      uint64_t v19 = [(EKEventViewControllerModernImpl *)self presentationSourceViewController];
      [v4 bounds];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __79__EKEventViewControllerModernImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke;
      v22[3] = &unk_1E6088638;
      v22[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v4, v6, v22);
      v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v20;
    }
    else
    {
      [(EKEventViewControllerModernImpl *)self _performSave:0 animated:0];
    }
  }
}

void __79__EKEventViewControllerModernImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v3 = [(EKEventViewControllerModernImpl *)self event];
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

  int64_t v11 = [(EKEventViewControllerModernImpl *)self event];
  if ([v11 isOrWasPartOfRecurringSeries]) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }

  [(EKEventViewControllerModernImpl *)self _performSave:v12 animated:0];
}

- (void)_cancelProposedTime
{
  uint64_t v3 = [(EKEventViewControllerModernImpl *)self event];
  [v3 setProposedStartDate:0];

  [(EKEventViewControllerModernImpl *)self _performSave:0 animated:0];
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
      if ([(EKEvent *)self->_event isOrWasPartOfRecurringSeries])
      {
        self->_pendingStatus = a3;
        [(EKEventViewControllerModernImpl *)self _presentDetachSheetFromView:v8];
LABEL_8:
        id v6 = v8;
        goto LABEL_9;
      }
      uint64_t v7 = 0;
    }
    [(EKEventViewControllerModernImpl *)self _saveStatus:a3 span:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4
{
  [(EKEvent *)self->_event setParticipationStatus:a3];
  [(EKEvent *)self->_event setInvitationStatus:0];

  [(EKEventViewControllerModernImpl *)self _performSave:a4 animated:1];
}

- (void)_presentDetachSheetFromBarButtonItem:(id)a3
{
  id v4 = a3;
  id v8 = [(EKEventViewControllerModernImpl *)self _detachSheetHandler];
  uint64_t v5 = [(EKEventViewControllerModernImpl *)self presentationSourceViewController];
  id v6 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:0 viewController:v5 barButtonItem:v4 forEvent:self->_event withCompletionHandler:v8];

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v6;
}

- (void)_presentDetachSheetFromView:(id)a3
{
  id v4 = a3;
  id v8 = [(EKEventViewControllerModernImpl *)self _detachSheetHandler];
  uint64_t v5 = [(EKEventViewControllerModernImpl *)self presentationSourceViewController];
  [v4 bounds];
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v5, v4, self->_event, v8);
  id v6 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v6;
}

- (id)_detachSheetHandler
{
  BOOL v2 = self->_pendingStatus == 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__EKEventViewControllerModernImpl__detachSheetHandler__block_invoke;
  v7[3] = &unk_1E6089588;
  char v3 = !v2;
  v7[4] = self;
  char v8 = v3;
  id v4 = _Block_copy(v7);
  uint64_t v5 = _Block_copy(v4);

  return v5;
}

void __54__EKEventViewControllerModernImpl__detachSheetHandler__block_invoke(uint64_t a1, uint64_t a2)
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
        [v3 _saveStatus:v3[126] span:a2];
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

- (void)_updateResponseVisibility
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if ([(EKEventViewControllerModernImpl *)self _shouldDisplayStatusButtons])
  {
    char v3 = [(EKEventViewControllerModernImpl *)self navigationController];
    [v3 setToolbarHidden:0];

    uint64_t v4 = [(EKEventViewControllerModernImpl *)self toolbarItems];
    if (!v4
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v4, !statusButtonsContainerView))
    {
      id v6 = [(EKEventViewControllerModernImpl *)self _statusButtonsContainerView];
      uint64_t v7 = [(EKEventViewControllerModernImpl *)self _statusButtonsView];
      [v6 addSubview:v7];
      v20 = (void *)MEMORY[0x1E4F28DC8];
      long long v25 = [v7 leadingAnchor];
      long long v24 = [v6 leadingAnchor];
      long long v23 = [v25 constraintEqualToAnchor:v24];
      v27[0] = v23;
      v22 = [v7 trailingAnchor];
      v21 = [v6 trailingAnchor];
      uint64_t v19 = [v22 constraintEqualToAnchor:v21];
      v27[1] = v19;
      char v8 = [v7 topAnchor];
      double v9 = [v6 topAnchor];
      id v10 = [v8 constraintEqualToAnchor:v9];
      v27[2] = v10;
      int64_t v11 = [v7 bottomAnchor];
      uint64_t v12 = [v6 bottomAnchor];
      long long v13 = [v11 constraintEqualToAnchor:v12];
      v27[3] = v13;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      [v20 activateConstraints:v14];

      long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v6];
      long long v26 = v15;
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [(EKEventViewControllerModernImpl *)self setToolbarItems:v16 animated:1];
    }
  }
  else
  {
    long long v17 = [(EKEventViewControllerModernImpl *)self toolbarItems];

    if (v17)
    {
      uint64_t v18 = [(EKEventViewControllerModernImpl *)self navigationController];
      [v18 setToolbarHidden:1];

      [(EKEventViewControllerModernImpl *)self setToolbarItems:0 animated:1];
    }
  }
}

- (void)_updateResponse
{
  id v10 = [(EKEventViewControllerModernImpl *)self _statusButtonsView];
  char v3 = [(EKEvent *)self->_event calendar];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 source];
    id v6 = [v5 constraints];
    char v7 = [v6 statusesAreAccurate];

    uint64_t v8 = [(EKEvent *)self->_event participationStatus];
    if ((v7 & 1) == 0 && ![(EKEvent *)self->_event isStatusDirty]) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = [(EKEvent *)self->_event participationStatus];
  }
  if (![(EKEventViewControllerModernImpl *)self _isDisplayingSuggestion]
    && (unint64_t)(v8 - 2) <= 2)
  {
    uint64_t v9 = qword_1B413AFD8[v8 - 2];
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v9 = 0;
LABEL_10:
  [v10 setSelectedAction:v9];
}

- (void)_deleteClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKEventViewControllerModernImpl *)self event];
  uint64_t v6 = [v5 status];

  char v7 = [(UIResponder *)self EKUI_editor];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EKEventViewControllerModernImpl__deleteClicked___block_invoke;
  aBlock[3] = &unk_1E6089560;
  aBlock[4] = self;
  BOOL v23 = v6 == 3;
  if (v6 == 3) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 4;
  }
  id v9 = v7;
  id v22 = v9;
  id v10 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    long long v13 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
    int v14 = [v12 eventViewDelegateShouldHandlePresentationOfDeleteAlert:v13];

    if (v14)
    {
      long long v15 = +[EKUIRecurrenceAlertController deleteAlertWithOptions:v8 forEvent:self->_event stringForDeleteButton:0 withCompletionHandler:v10];
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v15;

      long long v17 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v18 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
      uint64_t v19 = [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController alertController];
      [v17 eventViewController:v18 requestsDisplayOfDeleteAlert:v19];
      goto LABEL_12;
    }
  }
  else
  {
  }
  long long v17 = [(EKEventViewControllerModernImpl *)self presentationSourceViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v4 buttonForAction:16];
  }
  else
  {
    uint64_t v18 = 0;
  }
  [v18 bounds];
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", v8, v17, v18, self->_event, 0, v10);
  v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v20;
LABEL_12:
}

void __50__EKEventViewControllerModernImpl__deleteClicked___block_invoke(uint64_t a1, uint64_t a2)
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
  char v7 = *(void **)(v6 + 1000);
  *(void *)(v6 + 1000) = 0;
}

- (void)_unsubscribeClicked:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__EKEventViewControllerModernImpl__unsubscribeClicked___block_invoke;
  aBlock[3] = &unk_1E6088638;
  aBlock[4] = self;
  uint64_t v5 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  int v9 = [v7 eventViewDelegateShouldHandlePresentationOfDeleteAlert:v8];

  if (!v9)
  {
LABEL_5:
    id v12 = [(EKEventViewControllerModernImpl *)self presentationSourceViewController];
    long long v13 = [v4 buttonForAction:0x40000];
    [v13 bounds];
    +[EKUIRecurrenceAlertController presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:](EKUIRecurrenceAlertController, "presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:", 4, v12, v13, v5);
    long long v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
    recurrenceAlertController = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v15;
    goto LABEL_6;
  }
  id v10 = +[EKUIRecurrenceAlertController unsubscribeAlertWithOptions:4 withCompletionHandler:v5];
  int64_t v11 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v10;

  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  long long v13 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  recurrenceAlertController = [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController alertController];
  [v12 eventViewController:v13 requestsDisplayOfDeleteAlert:recurrenceAlertController];
LABEL_6:
}

void __55__EKEventViewControllerModernImpl__unsubscribeClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2 != 3)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1088) calendar];
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
  if ([(EKEventViewControllerModernImpl *)self _isDisplayingSuggestion])
  {
    id v4 = [(EKEvent *)self->_event suggestionInfo];
    [v4 setChangedFields:0];

    BOOL v5 = [(EKEvent *)self->_event eventStore];
    [v5 acceptSuggestedEvent:self->_event];

    int v6 = (void *)MEMORY[0x1E4F57848];
    id v7 = [(EKEvent *)self->_event suggestionInfo];
    uint64_t v8 = [v7 uniqueIdentifier];
    [v6 logEventConfirmedDetailsWithUniqueKey:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v9 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
    [WeakRetained eventViewController:v9 didCompleteWithAction:0];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v10) {
      return;
    }
    int64_t v11 = v10;
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
  if ([(EKEventViewControllerModernImpl *)self _isDisplayingSuggestion])
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
    int v9 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
    [WeakRetained eventViewController:v9 didCompleteWithAction:2];
  }
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = [(UIResponder *)self EKUI_editor];
  event = self->_event;
  id v14 = 0;
  char v8 = [v6 saveEvent:event span:a3 error:&v14];
  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    id v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "EKEventViewController failed to save event: %@", buf, 0xCu);
    }
    int64_t v11 = [v9 domain];
    if (v11 != (void *)*MEMORY[0x1E4F25338]) {
      goto LABEL_7;
    }
    uint64_t v12 = [v9 code];

    if (v12 == 1010)
    {
      int64_t v11 = [(EKEvent *)self->_event eventStore];
      [v11 rollback];
LABEL_7:
    }
  }
  [(EKEventViewControllerModernImpl *)self completeWithAction:1];

  return 1;
}

- (void)_performDelete:(int64_t)a3 editor:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = (void *)MEMORY[0x1E4F25540];
  id v7 = a4;
  uint64_t v8 = [v6 sharedInstance];
  [(id)v8 handleEventDeletion:self->_event];

  event = self->_event;
  id v14 = 0;
  LOBYTE(v8) = [v7 deleteEvent:event span:a3 error:&v14];

  id v10 = v14;
  if ((v8 & 1) == 0)
  {
    int64_t v11 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "EKEventViewController failed to delete event: %@", buf, 0xCu);
    }
    uint64_t v12 = [v10 domain];
    if (v12 != (void *)*MEMORY[0x1E4F25338]) {
      goto LABEL_7;
    }
    uint64_t v13 = [v10 code];

    if (v13 == 1010)
    {
      uint64_t v12 = [(EKEvent *)self->_event eventStore];
      [v12 rollback];
LABEL_7:
    }
  }
  [(EKEventViewControllerModernImpl *)self completeWithAction:2];
}

- (id)presentationSourceViewController
{
  uint64_t v3 = [(EKEventViewControllerModernImpl *)self navigationController];

  if (v3)
  {
    id v4 = [(EKEventViewControllerModernImpl *)self navigationController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)completeWithAction:(int64_t)a3
{
  if (a3 == 2)
  {
    recurrenceAlertController = self->_recurrenceAlertController;
    if (recurrenceAlertController)
    {
      int v6 = [(EKUIRecurrenceAlertController *)recurrenceAlertController alertController];
      id v7 = [v6 presentingViewController];
      [v7 dismissViewControllerAnimated:0 completion:0];
    }
  }
  [(EKEventViewControllerModernImpl *)self _dismissEditor:0 deleted:a3 == 2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      BOOL v11 = [(EKEventViewControllerModernImpl *)self _shouldPopSelf];

      if (!v11)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v12 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
        [v13 eventViewController:v12 didCompleteWithAction:a3];

        return;
      }
    }
    else
    {
    }
  }

  [(EKEventViewControllerModernImpl *)self _pop];
}

- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4
{
  activeEventEditor = self->_activeEventEditor;
  if (!activeEventEditor) {
    return;
  }
  BOOL v6 = a4;
  if ([(EKEventEditViewController *)activeEventEditor isBeingDismissed]) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (uint64_t v8 = WeakRetained,
        id v9 = objc_loadWeakRetained((id *)&self->_delegate),
        int v10 = [v9 conformsToProtocol:&unk_1F0D6D1B0],
        v9,
        v8,
        v10))
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
      [v13 eventViewControllerWillFinishEditingEvent:v14 deleted:v6];
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    uint64_t v17 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v16)
    {
      uint64_t v18 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
      [v17 eventViewController:v18 requestsDismissalOfEditViewController:self->_activeEventEditor];
    }
    else
    {
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        id v21 = objc_loadWeakRetained((id *)&self->_delegate);
        id v22 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
        [v21 eventViewController:v22 willDismissEditViewController:self->_activeEventEditor deleted:v6];
      }
      BOOL v23 = [(EKEventEditViewController *)self->_activeEventEditor presentingViewController];
      objc_msgSend(v23, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerModernImpl editorHideTransition](self, "editorHideTransition"), 0);

      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      char v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0) {
        goto LABEL_12;
      }
      uint64_t v17 = objc_loadWeakRetained((id *)&self->_delegate);
      long long v26 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
      [v17 eventViewController:v26 didDismissEditViewController:self->_activeEventEditor deleted:v6];
    }
  }
  else
  {
    uint64_t v17 = [(EKEventEditViewController *)self->_activeEventEditor presentingViewController];
    objc_msgSend(v17, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerModernImpl editorHideTransition](self, "editorHideTransition"), 0);
  }

LABEL_12:
  [(EKEventEditViewController *)self->_activeEventEditor setEditViewDelegate:0];
  uint64_t v19 = self->_activeEventEditor;
  self->_activeEventEditor = 0;
}

- (BOOL)_shouldPopSelf
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    return 0;
  }
  BOOL v5 = WeakRetained;
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  id v9 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  char v10 = [v8 eventViewControllerShouldDismissSelf:v9];

  return v10;
}

- (void)_pop
{
  uint64_t v3 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_INFO, "EKEventViewController is dismissing itself; clients of this class should ideally handle their own dismissal by imp"
      "lementing the delegate method eventViewController:didCompleteWithAction:",
      v13,
      2u);
  }
  if (self->_didAppear)
  {
    id v4 = [(EKEventViewControllerModernImpl *)self navigationController];
    BOOL v5 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
    id v6 = (id)[v4 popToViewController:v5 animated:0];

    char v7 = [(EKEventViewControllerModernImpl *)self navigationController];
    id v8 = [v7 viewControllers];
    unint64_t v9 = [v8 count];

    char v10 = [(EKEventViewControllerModernImpl *)self navigationController];
    id v11 = v10;
    if (v9 < 2) {
      [v10 dismissViewControllerAnimated:1 completion:0];
    }
    else {
      id v12 = (id)[v10 popViewControllerAnimated:1];
    }
  }
  else
  {
    self->_autoPop = 1;
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

- (void)setActiveEventEditor:(id)a3
{
  id v4 = (EKEventEditViewController *)a3;
  [(EKEventEditViewController *)v4 setEditViewDelegate:self];
  BOOL v5 = [(EKEventViewControllerModernImpl *)self view];
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
  {
    id v6 = [(EKEventViewControllerModernImpl *)self view];
    BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

    if (IsRegular) {
      [(EKEventEditViewController *)v4 setModalPresentationStyle:3];
    }
  }
  else
  {
  }
  id v8 = [(EKEventViewControllerModernImpl *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventEditViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", [WeakRetained editorPresentationStyle]);
  }
  activeEventEditor = self->_activeEventEditor;
  self->_activeEventEditor = v4;
}

- (void)presentEditorAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v18 = self->_activeEventEditor;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![WeakRetained conformsToProtocol:&unk_1F0D6D1B0]) {
    goto LABEL_6;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  int v10 = [v8 eventViewDelegateShouldHandlePresentationOfEditViewController:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
    [v11 eventViewController:v12 requestsDisplayOfEditViewController:v18 animated:v3];

LABEL_12:
    goto LABEL_13;
  }
LABEL_7:
  if (v18)
  {
    if (v3
      && (uint64_t v3 = [(EKEventViewControllerModernImpl *)self editorShowTransition], v3 == 8))
    {
      id v11 = [(EKEventViewControllerModernImpl *)self _viewControllerForEditorPresentation];
      [v11 presentViewController:v18 animated:1 completion:0];
    }
    else
    {
      id v11 = [(EKEventViewControllerModernImpl *)self _viewControllerForEditorPresentation];
      [v11 presentModalViewController:v18 withTransition:v3];
    }
    goto LABEL_12;
  }
LABEL_13:
  id v13 = objc_loadWeakRetained((id *)p_delegate);
  if (v13)
  {
    id v14 = v13;
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
  uint64_t v3 = [(EKEventViewControllerModernImpl *)self navigationController];

  if (v3)
  {
    id v4 = [(EKEventViewControllerModernImpl *)self navigationController];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (void)doneButtonTapped
{
  id v3 = [(EKEventViewControllerModernImpl *)self view];
  [(EKEventViewControllerModernImpl *)self _doneButtonPressed:v3];
}

- (void)editEvent
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      char v9 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
      char v10 = [v8 eventViewControllerEditButtonTemporarilyDisabled:v9];

      if (v10) {
        return;
      }
    }
  }
  id v11 = objc_loadWeakRetained((id *)p_delegate);
  if (v11)
  {
    id v12 = v11;
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)p_delegate);
      [v15 performSelector:sel_eventViewControllerWillBeginEditingEvent_ withObject:self];
    }
  }
  id v16 = objc_loadWeakRetained((id *)p_delegate);
  if (([v16 conformsToProtocol:&unk_1F0D6D1B0] & 1) == 0)
  {

LABEL_12:
    id v22 = objc_alloc_init(EKEventEditViewController);
    [(EKEventEditViewController *)v22 setEvent:self->_event];
    BOOL v23 = [(EKEvent *)self->_event eventStore];
    [(EKEventEditViewController *)v22 setEventStore:v23];

    [(EKEventViewControllerModernImpl *)self setActiveEventEditor:v22];
    goto LABEL_13;
  }
  id v17 = objc_loadWeakRetained((id *)p_delegate);
  char v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0) {
    goto LABEL_12;
  }
  id v19 = objc_loadWeakRetained((id *)p_delegate);
  char v20 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  char v21 = [v19 eventViewDelegateShouldCreateOwnEditViewController:v20];

  if ((v21 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_13:

  [(EKEventViewControllerModernImpl *)self presentEditorAnimated:1];
}

- (void)requestAttendeesDetailPresentation
{
  id v6 = [(NSDictionary *)self->context objectForKeyedSubscript:@"EKUIEventDetailsContext_ModelKey"];
  id v3 = [[EKUIEventInviteesViewController alloc] initWithEvent:self->_event fromDetail:1 model:v6];
  id v4 = [(EKEventViewControllerModernImpl *)self navigationDelegate];
  [(EKUIEventInviteesViewController *)v3 setNavigationDelegate:v4];

  BOOL v5 = [(EKEventViewControllerModernImpl *)self navigationController];
  [v5 pushViewController:v3 animated:1];
}

- (void)requestOrganizerDetailPresentation
{
  id v3 = [EKIdentityViewController alloc];
  id v4 = [(EKEvent *)self->_event organizer];
  id v6 = [(EKIdentityViewController *)v3 initWithIdentity:v4];

  BOOL v5 = [(EKEventViewControllerModernImpl *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)setToolbarItems:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  [v5 setToolbarItems:v4];
}

- (id)toolbarItems
{
  BOOL v2 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  id v3 = [v2 toolbarItems];

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  [v7 setToolbarItems:v6 animated:v4];
}

- (id)navigationItem
{
  BOOL v2 = [(EKEventViewControllerModernImpl *)self _ekEventViewController];
  id v3 = [v2 navigationItem];

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
    id v5 = [(EKEventViewControllerModernImpl *)self navigationController];
  }

  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  if (a4 == 2)
  {
    [(EKEventViewControllerModernImpl *)self completeWithAction:2];
  }
  else
  {
    [(EKEventViewControllerModernImpl *)self setNeedsReload];
    [(EKEventViewControllerModernImpl *)self _dismissEditor:1 deleted:0];
  }
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  BOOL v4 = [(EKEventViewControllerModernImpl *)self delegate];
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

- (id)calendarModel
{
  return [(NSDictionary *)self->context objectForKeyedSubscript:@"EKUIEventDetailsContext_ModelKey"];
}

- (BOOL)eventEditViewPresented
{
  return self->eventEditViewPresented;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  self->eventEditViewPresented = a3;
}

- (BOOL)allowsCalendarPreview
{
  return self->allowsCalendarPreview;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  self->allowsCalendarPreview = a3;
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  return self->showsUpdateCalendarForICSPreview;
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  self->showsUpdateCalendarForICSPreview = a3;
}

- (BOOL)allowsEditing
{
  return self->allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->allowsEditing = a3;
}

- (BOOL)allowsInviteResponses
{
  return self->allowsInviteResponses;
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  self->allowsInviteResponses = a3;
}

- (BOOL)allowsSubitems
{
  return self->allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->allowsSubitems = a3;
}

- (BOOL)calendarPreviewIsInlineDayView
{
  return self->calendarPreviewIsInlineDayView;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  self->calendarPreviewIsInlineDayView = a3;
}

- (NSDictionary)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

- (EKEventViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)editorHideTransition
{
  return self->editorHideTransition;
}

- (void)setEditorHideTransition:(int)a3
{
  self->editorHideTransition = a3;
}

- (int)editorShowTransition
{
  return self->editorShowTransition;
}

- (void)setEditorShowTransition:(int)a3
{
  self->editorShowTransition = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
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

- (BOOL)isICSPreview
{
  return self->ICSPreview;
}

- (void)setICSPreview:(BOOL)a3
{
  self->ICSPreview = a3;
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return self->inlineDayViewRespectsSelectedCalendarsFilter;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  self->inlineDayViewRespectsSelectedCalendarsFilter = a3;
}

- (BOOL)isLargeDayView
{
  return self->isLargeDayView;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  self->isLargeDayView = a3;
}

- (BOOL)minimalMode
{
  return self->_minimalMode;
}

- (void)setMinimalMode:(BOOL)a3
{
  self->_minimalMode = a3;
}

- (BOOL)noninteractivePlatterMode
{
  return self->noninteractivePlatterMode;
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  self->noninteractivePlatterMode = a3;
}

- (BOOL)showsAddToCalendarForICSPreview
{
  return self->showsAddToCalendarForICSPreview;
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  self->showsAddToCalendarForICSPreview = a3;
}

- (BOOL)showsDelegateMessage
{
  return self->showsDelegateMessage;
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  self->showsDelegateMessage = a3;
}

- (BOOL)showsDelegatorMessage
{
  return self->showsDelegatorMessage;
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  self->showsDelegatorMessage = a3;
}

- (BOOL)showsDeleteForICSPreview
{
  return self->showsDeleteForICSPreview;
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  self->showsDeleteForICSPreview = a3;
}

- (BOOL)showsDetectedConferenceItem
{
  return self->showsDetectedConferenceItem;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  self->showsDetectedConferenceItem = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (BOOL)showsOutOfDateMessage
{
  return self->showsOutOfDateMessage;
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  self->showsOutOfDateMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventDetailsViewController, 0);
  objc_storeStrong((id *)&self->eventDetailsScrollView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->context, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_activeEventEditor, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);

  objc_storeStrong((id *)&self->_statusButtonsView, 0);
}

@end