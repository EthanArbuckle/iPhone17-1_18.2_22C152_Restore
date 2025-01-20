@interface EKEventEditViewControllerDefaultImpl
+ (void)setDefaultDatesForEvent:(id)a3;
- (BOOL)displayingRootView;
- (BOOL)editor:(id)a3 shouldCompleteWithAction:(int64_t)a4;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)isModalInPresentation;
- (BOOL)shouldRecordPrecommitEvent;
- (BOOL)timeImplicitlySet;
- (BOOL)willPresentDialogOnSave;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKEventEditViewControllerDefaultImpl)initWithNibName:(id)a3 bundle:(id)a4;
- (EKEventEditViewControllerDefaultImpl)strongSelf;
- (EKEventEditViewDelegate)editViewDelegate;
- (EKEventEditor)editor;
- (EKEventStore)eventStore;
- (NSString)suggestionKey;
- (UIColor)editorBackgroundColor;
- (id)_confirmDismissAlertExplanationText;
- (id)_leftBarButtonItem;
- (id)_rightBarButtonItem;
- (id)alertIconImage;
- (id)confirmDismissAlertController;
- (id)confirmPendingConferenceDismissAlertController;
- (id)pasteboardManagerForCalendarItemEditor:(id)a3;
- (id)precommitSerializedEvent;
- (unint64_t)eventCreationMethod;
- (unint64_t)supportedInterfaceOrientations;
- (void)_annotateEventEntityIfNeeded;
- (void)_storeChanged:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)cancelEditing;
- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4;
- (void)completeAndSave;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)editor:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)editor:(id)a3 prepareCalendarItemForEdit:(id)a4;
- (void)focusAndSelectStartDate;
- (void)focusAndSelectTitle;
- (void)focusTitle;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationControllerDidAttemptToDismiss;
- (void)presentationControllerDidAttemptToDismissWithPendingConference;
- (void)refreshStartAndEndDates;
- (void)refreshUIForUpdatedEvent;
- (void)setDefaultCalendar:(id)a3;
- (void)setEditViewDelegate:(id)a3;
- (void)setEditor:(id)a3;
- (void)setEditorBackgroundColor:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventCreationMethod:(unint64_t)a3;
- (void)setEventStore:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4;
- (void)setShouldRecordPrecommitEvent:(BOOL)a3;
- (void)setStrongSelf:(id)a3;
- (void)setSuggestionKey:(id)a3;
- (void)setTimeImplicitlySet:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation EKEventEditViewControllerDefaultImpl

+ (void)setDefaultDatesForEvent:(id)a3
{
  id v3 = a3;
  v4 = CUIKNowDate();
  CUIKGetDefaultStartAndEndTimeForDate();
  id v5 = 0;
  id v6 = 0;

  [v3 setStartDate:v5];
  [v3 setEndDateUnadjustedForLegacyClients:v6];
}

- (EKEventEditViewControllerDefaultImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  v4 = [(EKEventEditViewControllerDefaultImpl *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    EKUILogInitIfNeeded();
    id v5 = objc_alloc_init(EKEventEditor);
    editor = v4->_editor;
    v4->_editor = v5;

    [(EKCalendarItemEditor *)v4->_editor setEditorDelegate:v4];
    [(EKEventEditViewControllerDefaultImpl *)v4 addChildViewController:v4->_editor];
    [(EKEventEditor *)v4->_editor didMoveToParentViewController:v4];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel__storeChanged_ name:*MEMORY[0x1E4F25460] object:v4->_store];
  }
  return v4;
}

- (void)loadView
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  [(EKEventEditViewControllerDefaultImpl *)&v28 loadView];
  id v3 = [(EKEventEditViewControllerDefaultImpl *)self view];
  v4 = [(EKEventEditor *)self->_editor view];
  [v3 addSubview:v4];

  id v5 = [(EKEventEditor *)self->_editor view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(EKEventEditor *)self->_editor view];
  v25 = [v27 leadingAnchor];
  v26 = [(EKEventEditViewControllerDefaultImpl *)self view];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v29[0] = v23;
  v22 = [(EKEventEditor *)self->_editor view];
  v20 = [v22 trailingAnchor];
  v21 = [(EKEventEditViewControllerDefaultImpl *)self view];
  v19 = [v21 trailingAnchor];
  v17 = [v20 constraintEqualToAnchor:v19];
  v29[1] = v17;
  v16 = [(EKEventEditor *)self->_editor view];
  v15 = [v16 topAnchor];
  id v6 = [(EKEventEditViewControllerDefaultImpl *)self view];
  v7 = [v6 topAnchor];
  v8 = [v15 constraintEqualToAnchor:v7];
  v29[2] = v8;
  objc_super v9 = [(EKEventEditor *)self->_editor view];
  v10 = [v9 bottomAnchor];
  v11 = [(EKEventEditViewControllerDefaultImpl *)self view];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v29[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v18 activateConstraints:v14];

  [(EKEventEditViewControllerDefaultImpl *)self _annotateEventEntityIfNeeded];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  id v4 = a3;
  [(EKEventEditViewControllerDefaultImpl *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[EKEventEditViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  [(EKEventEditViewControllerDefaultImpl *)&v3 viewDidAppear:a3];
  if ([(id)*MEMORY[0x1E4FB2608] isRunningTest]) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global);
  }
}

void __54__EKEventEditViewControllerDefaultImpl_viewDidAppear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"EKEventEditViewControllerDidAppear" object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  [(EKEventEditViewControllerDefaultImpl *)&v6 viewDidDisappear:a3];
  if (!self->_completedWithAction)
  {
    id v4 = [(EKEventEditViewControllerDefaultImpl *)self parentViewController];
    int v5 = [v4 isBeingDismissed];

    if (v5) {
      [(EKEventEditViewControllerDefaultImpl *)self editor:self->_editor didCompleteWithAction:0];
    }
  }
}

- (BOOL)isModalInPresentation
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  if ([(EKEventEditViewControllerDefaultImpl *)&v4 isModalInPresentation]
    || [(EKEventEditViewControllerDefaultImpl *)self hasUnsavedChanges])
  {
    return 1;
  }
  if ([(EKEventEditViewControllerDefaultImpl *)self _isInPopoverPresentation]) {
    return 0;
  }
  return ![(EKEventEditViewControllerDefaultImpl *)self displayingRootView];
}

- (void)setEventStore:(id)a3
{
  p_store = &self->_store;
  objc_storeStrong((id *)&self->_store, a3);
  id v6 = a3;
  [(EKCalendarItemEditor *)self->_editor setStore:*p_store];
}

- (EKEventStore)eventStore
{
  return self->_store;
}

- (void)setEvent:(id)a3
{
  p_event = &self->_event;
  objc_storeStrong((id *)&self->_event, a3);
  id v6 = a3;
  double v7 = [(EKEvent *)*p_event eventIdentifier];
  double v8 = (NSString *)[v7 copy];
  eventId = self->_eventId;
  self->_eventId = v8;

  [(EKEventEditor *)self->_editor setEvent:*p_event];

  [(EKEventEditViewControllerDefaultImpl *)self _annotateEventEntityIfNeeded];
}

- (void)_annotateEventEntityIfNeeded
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
}

- (void)setDefaultCalendar:(id)a3
{
}

- (BOOL)shouldRecordPrecommitEvent
{
  return [(EKEventEditor *)self->_editor shouldRecordPrecommitEvent];
}

- (void)setShouldRecordPrecommitEvent:(BOOL)a3
{
}

- (id)precommitSerializedEvent
{
  return [(EKEventEditor *)self->_editor precommitSerializedEvent];
}

- (void)setEventCreationMethod:(unint64_t)a3
{
}

- (unint64_t)eventCreationMethod
{
  return [(EKCalendarItemEditor *)self->_editor calendarItemCreationMethod];
}

- (void)setSuggestionKey:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionKey, a3);
  id v5 = a3;
  [(EKEventEditor *)self->_editor setSuggestionKey:v5];
}

- (void)refreshStartAndEndDates
{
}

- (void)refreshUIForUpdatedEvent
{
  [(EKEventEditor *)self->_editor refreshTitle];
  [(EKEventEditor *)self->_editor refreshURLAndNotes];
  [(EKEventEditor *)self->_editor refreshStartAndEndDates];
  [(EKEventEditor *)self->_editor refreshRecurrence];
  id v3 = [(EKEventEditor *)self->_editor tableView];
  [v3 reloadData];
}

- (void)cancelEditing
{
}

- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4
{
}

- (BOOL)editor:(id)a3 shouldCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    if ([(EKEventEditViewControllerDefaultImpl *)self isModalInPresentation]
      && [v6 pendingVideoConference])
    {
      [(EKEventEditViewControllerDefaultImpl *)self presentationControllerDidAttemptToDismissWithPendingConference];
      goto LABEL_9;
    }
LABEL_10:
    BOOL v7 = 1;
    goto LABEL_11;
  }
  if (a4
    || ![(EKEventEditViewControllerDefaultImpl *)self isModalInPresentation]
    || [(EKEventEditViewControllerDefaultImpl *)self ignoreUnsavedChanges])
  {
    goto LABEL_10;
  }
  [(EKEventEditViewControllerDefaultImpl *)self presentationControllerDidAttemptToDismiss];
LABEL_9:
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (void)editor:(id)a3 didCompleteWithAction:(int64_t)a4
{
  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  if (WeakRetained)
  {
    double v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_editViewDelegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_editViewDelegate);
      v12 = [(EKEventEditViewControllerDefaultImpl *)self _ekEventEditViewControllerForDelegate];
      [v11 eventEditViewController:v12 didCompleteWithAction:a4];
    }
  }
  if (a4)
  {
    if (a4 == 1
      && (([(EKEvent *)self->_event isNew] & 1) != 0
       || [(EKEvent *)self->_event _hasChangesForKey:@"location"]))
    {
      v13 = [(EKEvent *)self->_event preferredLocation];
      int v14 = [v13 isPrediction];

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E4F25638];
        v16 = [(EKEvent *)self->_event preferredLocation];
        v17 = [v16 predictedLOI];
        v18 = v15;
        v19 = v17;
        uint64_t v20 = 5;
LABEL_14:
        [v18 userInteractionWithPredictedLocationOfInterest:v19 interaction:v20];
      }
    }
  }
  else if (([(EKEvent *)self->_event isNew] & 1) != 0 {
         || [(EKEvent *)self->_event _hasChangesForKey:@"location"])
  }
  {
    v21 = [(EKEvent *)self->_event preferredLocation];
    int v22 = [v21 isPrediction];

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E4F25638];
      v16 = [(EKEvent *)self->_event preferredLocation];
      v17 = [v16 predictedLOI];
      v18 = v23;
      v19 = v17;
      uint64_t v20 = 6;
      goto LABEL_14;
    }
  }
  v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v24 removeObserver:self name:*MEMORY[0x1E4F25460] object:self->_store];

  v25 = *p_strongSelf;
  *p_strongSelf = 0;

  self->_completedWithAction = 1;
}

- (void)editor:(id)a3 prepareCalendarItemForEdit:(id)a4
{
  id v14 = a4;
  id v5 = [v14 calendar];

  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
    if (!WeakRetained) {
      goto LABEL_5;
    }
    BOOL v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_editViewDelegate);
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0
      || (id v10 = objc_loadWeakRetained((id *)&self->_editViewDelegate),
          -[EKEventEditViewControllerDefaultImpl _ekEventEditViewControllerForDelegate](self, "_ekEventEditViewControllerForDelegate"), id v11 = objc_claimAutoreleasedReturnValue(), [v10 eventEditViewControllerDefaultCalendarForNewEvents:v11], v12 = objc_claimAutoreleasedReturnValue(), v11, v10, !v12))
    {
LABEL_5:
      v12 = [(EKEventStore *)self->_store defaultCalendarForNewEvents];
    }
    [v14 setCalendar:v12];
  }
  v13 = [v14 startDate];

  if (!v13) {
    [(id)objc_opt_class() setDefaultDatesForEvent:v14];
  }
}

- (id)pasteboardManagerForCalendarItemEditor:(id)a3
{
  objc_super v4 = [(EKEventEditViewControllerDefaultImpl *)self editViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKEventEditViewControllerDefaultImpl *)self editViewDelegate];
    BOOL v7 = [(EKEventEditViewControllerDefaultImpl *)self _ekEventEditViewControllerForDelegate];
    id v8 = [v6 pasteboardManagerForEventEditViewController:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)attemptDisplayReviewPrompt
{
  id v3 = [(EKEventEditViewControllerDefaultImpl *)self editViewDelegate];
  if (v3 != self)
  {
    objc_super v4 = v3;
    if (objc_opt_respondsToSelector()) {
      [(EKEventEditViewControllerDefaultImpl *)v4 attemptDisplayReviewPrompt];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)_storeChanged:(id)a3
{
  id v4 = a3;
  if (self->_eventId)
  {
    id v6 = v4;
    char v5 = [(EKEvent *)self->_event eventStore];

    id v4 = v6;
    if (!v5)
    {
      [(EKCalendarItemEditor *)self->_editor completeWithAction:2 animated:0];
      id v4 = v6;
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_editor)
  {
    editor = self->_editor;
    return [(EKEventEditor *)editor supportedInterfaceOrientations];
  }
  else
  {
    id v4 = [(EKEventEditViewControllerDefaultImpl *)self view];
    BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v4);

    if (IsRegularInViewHierarchy) {
      return 30;
    }
    else {
      return 26;
    }
  }
}

- (CGSize)preferredContentSize
{
  [(EKEventEditor *)self->_editor preferredContentSize];
  result.height = v3;
  result.width = v2;
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
  return [(EKCalendarItemEditor *)self->_editor willPresentDialogOnSave];
}

- (BOOL)hasUnsavedChanges
{
  if ([(EKEventEditor *)self->_editor hasUnsavedChanges]) {
    return 1;
  }
  editor = self->_editor;

  return [(EKCalendarItemEditor *)editor isTextEditing];
}

- (void)focusAndSelectTitle
{
}

- (void)focusAndSelectStartDate
{
}

- (void)focusTitle
{
}

- (void)setEditorBackgroundColor:(id)a3
{
}

- (UIColor)editorBackgroundColor
{
  return [(EKEventEditor *)self->_editor backgroundColor];
}

- (BOOL)timeImplicitlySet
{
  return [(EKCalendarItemEditor *)self->_editor timeImplicitlySet];
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
}

- (id)_leftBarButtonItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = [(EKCalendarItemEditor *)self->_editor navigationItem];
  double v3 = [v2 leftBarButtonItems];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 systemItem] != 5 && objc_msgSend(v7, "systemItem") != 6)
        {
          id v4 = v7;
          goto LABEL_12;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_rightBarButtonItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = [(EKCalendarItemEditor *)self->_editor navigationItem];
  double v3 = [v2 rightBarButtonItems];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 systemItem] != 5 && objc_msgSend(v7, "systemItem") != 6)
        {
          id v4 = v7;
          goto LABEL_12;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_confirmDismissAlertExplanationText
{
  int v2 = [(EKEvent *)self->_event isNew];
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    uint64_t v5 = @"Are you sure you want to discard this new event?";
  }
  else {
    uint64_t v5 = @"Are you sure you want to discard your changes?";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1F0CC2140 table:0];

  return v6;
}

- (id)alertIconImage
{
  id v2 = objc_alloc(MEMORY[0x1E4F6F248]);
  double v3 = (void *)[v2 initWithBundleIdentifier:*MEMORY[0x1E4F57868]];
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  double v6 = v5;

  BOOL v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 100.0, 100.0, v6);
  id v8 = [v3 imageForDescriptor:v7];
  if ([v8 placeholder])
  {
    uint64_t v9 = [v3 prepareImageForDescriptor:v7];

    id v8 = (void *)v9;
  }
  long long v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", objc_msgSend(v8, "CGImage"));

  return v10;
}

- (id)confirmDismissAlertController
{
  double v3 = [(EKEventEditViewControllerDefaultImpl *)self _confirmDismissAlertExplanationText];
  id v4 = +[EKUIAlertController alertControllerWithTitle:0 message:v3 preferredStyle:0];
  [v4 setProhibitsRotation:1];
  double v5 = [(EKEventEditViewControllerDefaultImpl *)self alertIconImage];
  [v4 setImage:v5];

  double v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"Discard Changes" value:&stru_1F0CC2140 table:0];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__EKEventEditViewControllerDefaultImpl_confirmDismissAlertController__block_invoke;
  v15[3] = &unk_1E60874A8;
  v15[4] = self;
  id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v7 style:2 handler:v15];
  [v4 addAction:v8];

  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v10 = [v9 localizedStringForKey:@"Keep Editing" value:&stru_1F0CC2140 table:0];

  long long v11 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:1 handler:0];
  [v4 addAction:v11];

  long long v12 = [(EKEventEditViewControllerDefaultImpl *)self _leftBarButtonItem];
  v13 = [v4 popoverPresentationController];
  [v13 setBarButtonItem:v12];

  return v4;
}

uint64_t __69__EKEventEditViewControllerDefaultImpl_confirmDismissAlertController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelEditingWithDelegateNotification:1 forceCancel:1];
}

- (id)confirmPendingConferenceDismissAlertController
{
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Save without video call link?" value:&stru_1F0CC2140 table:0];

  double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"This will save the event before the video call link finishes loading." value:&stru_1F0CC2140 table:0];

  BOOL v7 = +[EKUIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:0];
  [v7 setProhibitsRotation:1];
  id v8 = [(EKEventEditViewControllerDefaultImpl *)self alertIconImage];
  [v7 setImage:v8];

  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v10 = [v9 localizedStringForKey:@"Save Event" value:&stru_1F0CC2140 table:0];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__EKEventEditViewControllerDefaultImpl_confirmPendingConferenceDismissAlertController__block_invoke;
  v18[3] = &unk_1E60874A8;
  v18[4] = self;
  long long v11 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:2 handler:v18];
  [v7 addAction:v11];

  long long v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"Keep Editing" value:&stru_1F0CC2140 table:0];

  uint64_t v14 = [MEMORY[0x1E4FB1410] actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];

  v15 = [(EKEventEditViewControllerDefaultImpl *)self _rightBarButtonItem];
  v16 = [v7 popoverPresentationController];
  [v16 setBarButtonItem:v15];

  return v7;
}

uint64_t __86__EKEventEditViewControllerDefaultImpl_confirmPendingConferenceDismissAlertController__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) setPendingVideoConference:0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1024);

  return [v2 completeAndSave];
}

- (void)presentationControllerDidAttemptToDismiss
{
  if (([(EKEventEditViewControllerDefaultImpl *)self _isInPopoverPresentation] & 1) != 0
    || [(EKEventEditViewControllerDefaultImpl *)self displayingRootView])
  {
    [(EKCalendarItemEditor *)self->_editor resignCurrentEditItemFirstResponder];
    if ([(EKEventEditor *)self->_editor isShowingAccessDeniedView])
    {
      [(EKEventEditViewControllerDefaultImpl *)self cancelEditingWithDelegateNotification:1 forceCancel:1];
    }
    else
    {
      id v3 = [(EKEventEditViewControllerDefaultImpl *)self confirmDismissAlertController];
      [(EKEventEditViewControllerDefaultImpl *)self presentViewController:v3 animated:1 completion:0];
    }
  }
}

- (void)presentationControllerDidAttemptToDismissWithPendingConference
{
  if (([(EKEventEditViewControllerDefaultImpl *)self _isInPopoverPresentation] & 1) != 0
    || [(EKEventEditViewControllerDefaultImpl *)self displayingRootView])
  {
    [(EKCalendarItemEditor *)self->_editor resignCurrentEditItemFirstResponder];
    id v3 = [(EKEventEditViewControllerDefaultImpl *)self confirmPendingConferenceDismissAlertController];
    [(EKEventEditViewControllerDefaultImpl *)self presentViewController:v3 animated:1 completion:0];
  }
}

- (BOOL)displayingRootView
{
  id v2 = [(EKEventEditViewControllerDefaultImpl *)self navigationController];
  id v3 = [v2 visibleViewController];
  id v4 = [v2 viewControllers];
  double v5 = [v4 firstObject];
  BOOL v6 = v3 == v5;

  return v6;
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (EKEventEditViewDelegate)editViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);

  return (EKEventEditViewDelegate *)WeakRetained;
}

- (void)setEditViewDelegate:(id)a3
{
}

- (BOOL)ignoreUnsavedChanges
{
  return self->ignoreUnsavedChanges;
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  self->ignoreUnsavedChanges = a3;
}

- (EKEventEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (EKEventEditViewControllerDefaultImpl)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_destroyWeak((id *)&self->_editViewDelegate);
  objc_storeStrong((id *)&self->_suggestionKey, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end