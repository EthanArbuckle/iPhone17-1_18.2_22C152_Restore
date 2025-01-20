@interface EKEventEditViewControllerModernImpl
+ (id)_addLocalizedString;
+ (id)_doneLocalizedString;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)shouldRecordPrecommitEvent;
- (BOOL)timeImplicitlySet;
- (BOOL)willPresentDialogOnSave;
- (EKEvent)event;
- (EKEvent)eventForViewControllerManager;
- (EKEventEditViewControllerModernImpl)init;
- (EKEventEditViewDelegate)editViewDelegate;
- (EKEventStore)eventStore;
- (NSString)suggestionKey;
- (UIColor)editorBackgroundColor;
- (id)_eventEditorForTestingOnly;
- (id)confirmDismissAlertController;
- (id)editItemEventToDetach;
- (id)precommitSerializedEvent;
- (unint64_t)eventCreationMethod;
- (void)_cancel;
- (void)_done;
- (void)_updateNavButtonsWithSpacing;
- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)loadView;
- (void)requestLocationOrVideoCallPresentation;
- (void)setEditViewDelegate:(id)a3;
- (void)setEditorBackgroundColor:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventCreationMethod:(unint64_t)a3;
- (void)setEventStore:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)setSuggestionKey:(id)a3;
- (void)setTimeImplicitlySet:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation EKEventEditViewControllerModernImpl

- (EKEventEditViewControllerModernImpl)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventEditViewControllerModernImpl;
  v2 = [(EKEventEditViewControllerModernImpl *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F57B78]) initWithDelegate:v2];
    vcManager = v2->_vcManager;
    v2->_vcManager = (CUIKEventEditViewControllerManager *)v3;
  }
  return v2;
}

- (void)loadView
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)EKEventEditViewControllerModernImpl;
  [(EKEventEditViewControllerModernImpl *)&v24 loadView];
  v23 = [(CUIKEventEditViewControllerManager *)self->_vcManager viewController];
  [(EKEventEditViewControllerModernImpl *)self addChildViewController:v23];
  [v23 didMoveToParentViewController:self];
  uint64_t v3 = [v23 view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(EKEventEditViewControllerModernImpl *)self view];
  [v4 addSubview:v3];

  v15 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(EKEventEditViewControllerModernImpl *)self view];
  v21 = [v22 leadingAnchor];
  v20 = [v3 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v25[0] = v19;
  v18 = [(EKEventEditViewControllerModernImpl *)self view];
  v17 = [v18 trailingAnchor];
  v16 = [v3 trailingAnchor];
  v14 = [v17 constraintEqualToAnchor:v16];
  v25[1] = v14;
  v5 = [(EKEventEditViewControllerModernImpl *)self view];
  objc_super v6 = [v5 topAnchor];
  v7 = [v3 topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v25[2] = v8;
  v9 = [(EKEventEditViewControllerModernImpl *)self view];
  v10 = [v9 bottomAnchor];
  v11 = [v3 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v25[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v15 activateConstraints:v13];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditViewControllerModernImpl;
  [(EKEventEditViewControllerModernImpl *)&v3 viewDidLoad];
  [(EKEventEditViewControllerModernImpl *)self _updateNavButtonsWithSpacing];
}

+ (id)_addLocalizedString
{
  v2 = EventKitUIBundle();
  objc_super v3 = [v2 localizedStringForKey:@"Add" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_doneLocalizedString
{
  v2 = EventKitUIBundle();
  objc_super v3 = [v2 localizedStringForKey:@"Done" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)_updateNavButtonsWithSpacing
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!self->_cancelButton)
  {
    objc_super v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v3;
  }
  if (!self->_doneButton)
  {
    char v5 = [(EKEvent *)self->_event isNew];
    objc_super v6 = objc_opt_class();
    if (v5) {
      [v6 _addLocalizedString];
    }
    else {
    v7 = [v6 _doneLocalizedString];
    }
    v8 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:2 target:self action:sel__done];
    doneButton = self->_doneButton;
    self->_doneButton = v8;
  }
  v15[0] = self->_cancelButton;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v11 = [(EKEventEditViewControllerModernImpl *)self navigationItem];
  [v11 setLeftBarButtonItems:v10];

  v14 = self->_doneButton;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v13 = [(EKEventEditViewControllerModernImpl *)self navigationItem];
  [v13 setRightBarButtonItems:v12];
}

- (void)_cancel
{
  p_editViewDelegate = &self->_editViewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_editViewDelegate);
    objc_super v6 = [(EKEventEditViewControllerModernImpl *)self _ekEventEditViewController];
    [v7 eventEditViewController:v6 didCompleteWithAction:0];
  }
}

- (void)_done
{
  p_editViewDelegate = &self->_editViewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_editViewDelegate);
    objc_super v6 = [(EKEventEditViewControllerModernImpl *)self _ekEventEditViewController];
    [v7 eventEditViewController:v6 didCompleteWithAction:1];
  }
}

- (id)_eventEditorForTestingOnly
{
  return 0;
}

- (id)confirmDismissAlertController
{
  return 0;
}

- (BOOL)hasUnsavedChanges
{
  return 0;
}

- (BOOL)willPresentDialogOnSave
{
  return 0;
}

- (void)setEvent:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_event, a3);
  if (v9 && ![v9 isNew])
  {
    char v5 = EventKitUIBundle();
    objc_super v6 = v5;
    id v7 = @"Edit Event";
  }
  else
  {
    char v5 = EventKitUIBundle();
    objc_super v6 = v5;
    id v7 = @"New Event";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1F0CC2140 table:0];
  [(EKEventEditViewControllerModernImpl *)self setTitle:v8];
}

- (BOOL)shouldRecordPrecommitEvent
{
  return 0;
}

- (id)precommitSerializedEvent
{
  return 0;
}

- (EKEvent)eventForViewControllerManager
{
  return self->_event;
}

- (void)requestLocationOrVideoCallPresentation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [EKLocationEditItemViewController alloc];
  v4 = -[EKLocationEditItemViewController initWithFrame:calendarItem:eventStore:](v3, "initWithFrame:calendarItem:eventStore:", self->_event, self->_eventStore, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(EKEditItemViewController *)v4 setEditDelegate:self];
  [(EKEditItemViewController *)v4 setModal:1];
  [(EKEditItemViewController *)v4 setShowsDoneButton:0];
  [(EKLocationEditItemViewController *)v4 setSupportedSearchTypes:2047];
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v4 action:sel_cancel];
  id v6 = objc_alloc(MEMORY[0x1E4FB14B8]);
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = (void *)[v6 initWithBarButtonItems:v7 representativeItem:0];

  id v9 = [(EKLocationEditItemViewController *)v4 navigationItem];
  objc_msgSend(v9, "_dci_setFixedTrailingGroup:", v8);

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [(EKEventEditViewControllerModernImpl *)self presentViewController:v10 animated:1 completion:0];
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 needsSave])
    {
      id v6 = [v5 selectedLocation];
      [(EKEvent *)self->_event setStructuredLocation:v6];
      id v7 = [(UIResponder *)self EKUI_editor];
      [v7 saveEvent:self->_event span:0 error:0];
    }
  }

  return 1;
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (UIColor)editorBackgroundColor
{
  return self->editorBackgroundColor;
}

- (void)setEditorBackgroundColor:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (NSString)suggestionKey
{
  return self->suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
}

- (EKEventEditViewDelegate)editViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);

  return (EKEventEditViewDelegate *)WeakRetained;
}

- (void)setEditViewDelegate:(id)a3
{
}

- (unint64_t)eventCreationMethod
{
  return self->eventCreationMethod;
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  self->eventCreationMethod = a3;
}

- (BOOL)ignoreUnsavedChanges
{
  return self->ignoreUnsavedChanges;
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  self->ignoreUnsavedChanges = a3;
}

- (BOOL)timeImplicitlySet
{
  return self->timeImplicitlySet;
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  self->timeImplicitlySet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editViewDelegate);
  objc_storeStrong((id *)&self->suggestionKey, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->editorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_storeStrong((id *)&self->_vcManager, 0);
}

@end