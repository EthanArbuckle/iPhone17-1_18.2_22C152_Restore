@interface EKEventEditViewControllerOOPWrapperImpl
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)shouldRecordPrecommitEvent;
- (BOOL)timeImplicitlySet;
- (BOOL)willPresentDialogOnSave;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKEventEditViewControllerOOPWrapperImpl)init;
- (EKEventEditViewControllerOOPWrapperImpl)initWithViewID:(id)a3;
- (EKEventEditViewDelegate)editViewDelegate;
- (EKEventStore)eventStore;
- (NSString)suggestionKey;
- (UIColor)editorBackgroundColor;
- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)vc;
- (id)_eventEditorForTestingOnly;
- (id)confirmDismissAlertController;
- (id)precommitSerializedEvent;
- (unint64_t)eventCreationMethod;
- (void)cancelEditing;
- (void)focusAndSelectStartDate;
- (void)focusAndSelectTitle;
- (void)focusTitle;
- (void)setDefaultCalendar:(id)a3;
- (void)setEditViewDelegate:(id)a3;
- (void)setEditorBackgroundColor:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventCreationMethod:(unint64_t)a3;
- (void)setEventStore:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)setSuggestionKey:(id)a3;
- (void)setTimeImplicitlySet:(BOOL)a3;
- (void)setVc:(id)a3;
- (void)viewDidLoad;
@end

@implementation EKEventEditViewControllerOOPWrapperImpl

- (EKEventEditViewControllerOOPWrapperImpl)init
{
  return [(EKEventEditViewControllerOOPWrapperImpl *)self initWithViewID:@"ROOT_OOP_VIEW"];
}

- (EKEventEditViewControllerOOPWrapperImpl)initWithViewID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKEventEditViewControllerOOPWrapperImpl;
  v6 = [(EKEventEditViewControllerOOPWrapperImpl *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewID, a3);
    v8 = objc_alloc_init(_TtC10EventKitUI32EKEventEditViewControllerOOPImpl);
    [(EKEventEditViewControllerOOPWrapperImpl *)v7 setVc:v8];
  }
  return v7;
}

- (void)viewDidLoad
{
  v49[4] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)EKEventEditViewControllerOOPWrapperImpl;
  [(EKEventEditViewControllerOOPWrapperImpl *)&v48 viewDidLoad];
  v3 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [(EKEventEditViewControllerOOPWrapperImpl *)self addChildViewController:v3];

  v4 = [(EKEventEditViewControllerOOPWrapperImpl *)self view];
  id v5 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  v6 = [v5 view];
  [v4 addSubview:v6];

  v7 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v7 didMoveToParentViewController:self];

  v8 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  v9 = [v8 view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = (void *)MEMORY[0x1E4F28DC8];
  v47 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  v46 = [v47 view];
  v44 = [v46 leadingAnchor];
  v45 = [(EKEventEditViewControllerOOPWrapperImpl *)self view];
  v43 = [v45 leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v49[0] = v42;
  v41 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  v40 = [v41 view];
  v38 = [v40 topAnchor];
  v39 = [(EKEventEditViewControllerOOPWrapperImpl *)self view];
  v37 = [v39 topAnchor];
  v35 = [v38 constraintEqualToAnchor:v37];
  v49[1] = v35;
  v34 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  v33 = [v34 view];
  v31 = [v33 trailingAnchor];
  v32 = [(EKEventEditViewControllerOOPWrapperImpl *)self view];
  objc_super v10 = [v32 trailingAnchor];
  v11 = [v31 constraintEqualToAnchor:v10];
  v49[2] = v11;
  v12 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  v13 = [v12 view];
  v14 = [v13 bottomAnchor];
  v15 = [(EKEventEditViewControllerOOPWrapperImpl *)self view];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v49[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v36 activateConstraints:v18];

  uint64_t v19 = [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:0];
  v20 = [(EKEventEditViewControllerOOPWrapperImpl *)self event];
  v21 = [v20 calendar];
  if (v21)
  {

LABEL_10:
    return;
  }
  v22 = [(EKEventEditViewControllerOOPWrapperImpl *)self event];
  int v23 = [v22 isNew];

  if (v23 && v19 == 3)
  {
    uint64_t v24 = [(EKEventEditViewControllerOOPWrapperImpl *)self editViewDelegate];
    if (!v24) {
      goto LABEL_8;
    }
    v25 = (void *)v24;
    v26 = [(EKEventEditViewControllerOOPWrapperImpl *)self editViewDelegate];
    char v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) == 0) {
      goto LABEL_8;
    }
    v28 = [(EKEventEditViewControllerOOPWrapperImpl *)self editViewDelegate];
    v29 = [(EKEventEditViewControllerOOPWrapperImpl *)self _ekEventEditViewController];
    v20 = [v28 eventEditViewControllerDefaultCalendarForNewEvents:v29];

    if (!v20)
    {
LABEL_8:
      v30 = [(EKEventEditViewControllerOOPWrapperImpl *)self eventStore];
      v20 = [v30 defaultCalendarForNewEvents];
    }
    [(EKEventEditViewControllerOOPWrapperImpl *)self setDefaultCalendar:v20];
    goto LABEL_10;
  }
}

- (CGSize)preferredContentSize
{
  v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setEditViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v5 setEditViewDelegate:v4];
}

- (EKEventEditViewDelegate)editViewDelegate
{
  v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  double v3 = [v2 editViewDelegate];

  return (EKEventEditViewDelegate *)v3;
}

- (void)setEventStore:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v5 setEventStore:v4];
}

- (EKEventStore)eventStore
{
  v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  double v3 = [v2 eventStore];

  return (EKEventStore *)v3;
}

- (void)setEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v5 setEvent:v4];
}

- (EKEvent)event
{
  v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  double v3 = [v2 event];

  return (EKEvent *)v3;
}

- (void)cancelEditing
{
  id v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v2 cancelEditing];
}

- (void)setDefaultCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v5 setDefaultCalendar:v4];
}

- (void)setEditorBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v5 setEditorBackgroundColor:v4];
}

- (UIColor)editorBackgroundColor
{
  id v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  double v3 = [v2 editorBackgroundColor];

  return (UIColor *)v3;
}

- (BOOL)hasUnsavedChanges
{
  id v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  char v3 = [v2 hasUnsavedChanges];

  return v3;
}

- (void)focusAndSelectTitle
{
  id v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v2 focusAndSelectTitle];
}

- (void)focusAndSelectStartDate
{
  id v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v2 focusAndSelectStartDate];
}

- (void)focusTitle
{
  id v2 = [(EKEventEditViewControllerOOPWrapperImpl *)self vc];
  [v2 focusTitle];
}

- (id)precommitSerializedEvent
{
  return 0;
}

- (BOOL)shouldRecordPrecommitEvent
{
  return 0;
}

- (id)_eventEditorForTestingOnly
{
  return 0;
}

- (BOOL)willPresentDialogOnSave
{
  return 0;
}

- (id)confirmDismissAlertController
{
  return 0;
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

- (NSString)suggestionKey
{
  return self->suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
}

- (BOOL)timeImplicitlySet
{
  return self->timeImplicitlySet;
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  self->timeImplicitlySet = a3;
}

- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong(&self->precommitSerializedEvent, 0);
  objc_storeStrong((id *)&self->suggestionKey, 0);

  objc_storeStrong((id *)&self->_viewID, 0);
}

@end