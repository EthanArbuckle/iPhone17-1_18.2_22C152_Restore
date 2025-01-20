@interface EKEventEditViewController
+ (EKEventEditViewController)eventEditViewControllerWithEvent:(id)a3 eventStore:(id)a4 editViewDelegate:(id)a5;
+ (id)editViewControllerImplementation;
+ (id)eventOrIntegrationViewControllerWithEvent:(id)a3 creationMethod:(unint64_t)a4 eventEditViewDelegate:(id)a5;
+ (void)registerIntegrationEditViewControllerCreator:(id)a3;
- (BOOL)canManagePresentationStyle;
- (BOOL)displayingRootView;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)shouldRecordPrecommitEvent;
- (BOOL)timeImplicitlySet;
- (BOOL)wantsManagement;
- (BOOL)willPresentDialogOnSave;
- (CGSize)preferredContentSize;
- (EKCalendar)calendarToMakeVisibleOnSave;
- (EKEvent)event;
- (EKEventEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (EKEventEditViewController)initWithRemoteUI:(BOOL)a3;
- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate;
- (EKEventStore)eventStore;
- (NSString)suggestionKey;
- (UIColor)editorBackgroundColor;
- (id)_eventEditorForTestingOnly;
- (id)confirmDismissAlertController;
- (id)editViewDelegate;
- (id)precommitSerializedEvent;
- (unint64_t)eventCreationMethod;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)cancelEditing;
- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4;
- (void)commonInit;
- (void)completeAndSave;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)configureAppearanceForSplitDayView;
- (void)focusAndSelectStartDate;
- (void)focusAndSelectTitle;
- (void)focusTitle;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)refreshStartAndEndDates;
- (void)refreshUIForUpdatedEvent;
- (void)setDefaultCalendar:(id)a3;
- (void)setEditViewDelegate:(id)editViewDelegate;
- (void)setEditorBackgroundColor:(id)a3;
- (void)setEvent:(EKEvent *)event;
- (void)setEventCreationMethod:(unint64_t)a3;
- (void)setEventStore:(EKEventStore *)eventStore;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)setInternalEditViewDelegate:(id)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4;
- (void)setShouldRecordPrecommitEvent:(BOOL)a3;
- (void)setSuggestionKey:(id)a3;
- (void)setTimeImplicitlySet:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKEventEditViewController

+ (void)registerIntegrationEditViewControllerCreator:(id)a3
{
  id v3 = a3;
  v4 = (void *)_integrationEditViewControllerCreators;
  id v7 = v3;
  if (!_integrationEditViewControllerCreators)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = (void *)_integrationEditViewControllerCreators;
    _integrationEditViewControllerCreators = (uint64_t)v5;

    id v3 = v7;
    v4 = (void *)_integrationEditViewControllerCreators;
  }
  [v4 addObject:v3];
}

- (EKEventEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewController;
  v4 = [(EKEventEditViewController *)&v9 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4)
  {
    [(EKEventEditViewController *)v4 commonInit];
    uint64_t v6 = +[SwappableViewControllerImplementationFactory eventEditViewControllerImpl];
    impl = v5->_impl;
    v5->_impl = (EKEventEditViewControllerImpl *)v6;

    [(EKEventEditViewController *)v5 pushViewController:v5->_impl animated:0];
  }
  return v5;
}

- (EKEventEditViewController)initWithRemoteUI:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewController;
  v4 = [(EKEventEditViewController *)&v9 initWithNibName:0 bundle:0];
  id v5 = v4;
  if (v4)
  {
    [(EKEventEditViewController *)v4 commonInit];
    uint64_t v6 = +[SwappableViewControllerImplementationFactory eventEditViewControllerImplWithRemoteUI:v3];
    impl = v5->_impl;
    v5->_impl = (EKEventEditViewControllerImpl *)v6;

    [(EKEventEditViewController *)v5 pushViewController:v5->_impl animated:0];
  }
  return v5;
}

- (void)commonInit
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];

  [(EKEventEditViewController *)self _setClipUnderlapWhileTransitioning:1];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
}

- (CGSize)preferredContentSize
{
  [(EKEventEditViewControllerImpl *)self->_impl preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKEventEditViewController;
  [(EKEventEditViewController *)&v7 viewWillAppear:a3];
  v4 = [(EKEventEditViewController *)self presentationController];
  id v5 = [v4 delegate];

  if (!v5)
  {
    uint64_t v6 = [(EKEventEditViewController *)self presentationController];
    [v6 setDelegate:self];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)EKEventEditViewController;
  [(EKEventEditViewController *)&v11 viewIsAppearing:a3];
  v4 = [MEMORY[0x1E4F57B90] shared];
  int v5 = [v4 isCurrentProcessAnApplicationExtension];

  if (v5)
  {
    uint64_t v6 = +[EKUIApplicationExtensionOverrides shared];
    objc_super v7 = [v6 viewHierarchyOrOverride];

    v8 = objc_msgSend(v7, "ekui_tintColor");
    objc_super v9 = [(EKEventEditViewController *)self view];
    v10 = [v9 window];
    [v10 setTintColor:v8];
  }
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

- (void)setEvent:(EKEvent *)event
{
  v12 = event;
  v4 = [(EKEventEditViewControllerImpl *)self->_impl event];

  int v5 = v12;
  if (v4 != v12)
  {
    uint64_t v6 = [(EKEventEditViewControllerImpl *)self->_impl eventStore];
    if (v6)
    {
      objc_super v7 = (void *)v6;
      uint64_t v8 = [(EKEvent *)v12 eventStore];
      if (v8)
      {
        objc_super v9 = (void *)v8;
        v10 = [(EKEvent *)v12 eventStore];
        objc_super v11 = [(EKEventEditViewControllerImpl *)self->_impl eventStore];

        if (v10 != v11) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Event does not belong to eventStore"];
        }
      }
      else
      {
      }
    }
    [(EKEventEditViewControllerImpl *)self->_impl setEvent:v12];
    int v5 = v12;
  }
}

- (EKEvent)event
{
  return (EKEvent *)[(EKEventEditViewControllerImpl *)self->_impl event];
}

- (void)setEventStore:(EKEventStore *)eventStore
{
  v15 = eventStore;
  v4 = [(EKEventEditViewControllerImpl *)self->_impl eventStore];

  int v5 = v15;
  if (v4 != v15)
  {
    uint64_t v6 = [(EKEventEditViewControllerImpl *)self->_impl event];
    if (v6)
    {
      objc_super v7 = (void *)v6;
      uint64_t v8 = [(EKEventEditViewControllerImpl *)self->_impl event];
      uint64_t v9 = [v8 eventStore];
      if (v9)
      {
        v10 = (void *)v9;
        objc_super v11 = [(EKEventEditViewControllerImpl *)self->_impl event];
        v12 = [v11 eventStore];

        if (v12 != v15) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Event does not belong to eventStore"];
        }
      }
      else
      {
      }
    }
    [(EKEventEditViewControllerImpl *)self->_impl setEventStore:v15];
    v13 = [(EKEventEditViewControllerImpl *)self->_impl event];

    int v5 = v15;
    if (!v13)
    {
      v14 = [MEMORY[0x1E4F25538] eventWithEventStore:v15];
      [(EKEventEditViewControllerImpl *)self->_impl setEvent:v14];

      int v5 = v15;
    }
  }
}

- (EKEventStore)eventStore
{
  double v3 = [(EKEventEditViewControllerImpl *)self->_impl eventStore];

  if (!v3)
  {
    v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "EKEventEditViewController: Getting eventStore before setting it", v7, 2u);
    }
  }
  int v5 = [(EKEventEditViewControllerImpl *)self->_impl eventStore];

  return (EKEventStore *)v5;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
}

- (BOOL)shouldRecordPrecommitEvent
{
  return [(EKEventEditViewControllerImpl *)self->_impl shouldRecordPrecommitEvent];
}

- (void)setShouldRecordPrecommitEvent:(BOOL)a3
{
}

- (id)precommitSerializedEvent
{
  return (id)[(EKEventEditViewControllerImpl *)self->_impl precommitSerializedEvent];
}

- (void)setDefaultCalendar:(id)a3
{
}

- (void)setEditViewDelegate:(id)editViewDelegate
{
}

- (id)editViewDelegate
{
  return (id)[(EKEventEditViewControllerImpl *)self->_impl editViewDelegate];
}

- (void)setInternalEditViewDelegate:(id)a3
{
}

- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate
{
  double v2 = [(EKEventEditViewControllerImpl *)self->_impl editViewDelegate];
  if ([v2 conformsToProtocol:&unk_1F0D2A3A0]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (EKEventOrIntegrationEditViewDelegate *)v3;
}

- (void)cancelEditing
{
}

- (id)_eventEditorForTestingOnly
{
  return (id)[(EKEventEditViewControllerImpl *)self->_impl _eventEditorForTestingOnly];
}

- (void)setEventCreationMethod:(unint64_t)a3
{
}

- (unint64_t)eventCreationMethod
{
  return [(EKEventEditViewControllerImpl *)self->_impl eventCreationMethod];
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
}

- (BOOL)ignoreUnsavedChanges
{
  return [(EKEventEditViewControllerImpl *)self->_impl ignoreUnsavedChanges];
}

- (BOOL)displayingRootView
{
  id v3 = [(EKEventEditViewController *)self visibleViewController];
  v4 = [(EKEventEditViewController *)self viewControllers];
  int v5 = [v4 firstObject];
  BOOL v6 = v3 == v5;

  return v6;
}

- (void)setSuggestionKey:(id)a3
{
}

- (NSString)suggestionKey
{
  return (NSString *)[(EKEventEditViewControllerImpl *)self->_impl suggestionKey];
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
}

- (BOOL)timeImplicitlySet
{
  return [(EKEventEditViewControllerImpl *)self->_impl timeImplicitlySet];
}

- (void)setEditorBackgroundColor:(id)a3
{
}

- (UIColor)editorBackgroundColor
{
  return (UIColor *)[(EKEventEditViewControllerImpl *)self->_impl editorBackgroundColor];
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

- (void)completeAndSave
{
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
}

- (void)refreshStartAndEndDates
{
}

- (void)refreshUIForUpdatedEvent
{
}

- (BOOL)willPresentDialogOnSave
{
  return [(EKEventEditViewControllerImpl *)self->_impl willPresentDialogOnSave];
}

- (BOOL)hasUnsavedChanges
{
  return [(EKEventEditViewControllerImpl *)self->_impl hasUnsavedChanges];
}

- (id)confirmDismissAlertController
{
  return (id)[(EKEventEditViewControllerImpl *)self->_impl confirmDismissAlertController];
}

- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4
{
}

+ (id)editViewControllerImplementation
{
  return +[SwappableViewControllerImplementationFactory eventEditViewControllerImplWithRemoteUI:0];
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (void)configureAppearanceForSplitDayView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v4 configureWithOpaqueBackground];
  id v3 = [(EKEventEditViewController *)self navigationBar];
  [v3 setScrollEdgeAppearance:v4];
}

- (EKCalendar)calendarToMakeVisibleOnSave
{
  double v2 = [(EKEventEditViewController *)self event];
  id v3 = [v2 calendar];

  return (EKCalendar *)v3;
}

- (void).cxx_destruct
{
}

+ (EKEventEditViewController)eventEditViewControllerWithEvent:(id)a3 eventStore:(id)a4 editViewDelegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[EKEventEditViewController alloc] initWithNibName:0 bundle:0];
  [(EKEventEditViewController *)v10 setEvent:v9];

  [(EKEventEditViewController *)v10 setEventStore:v8];
  [(EKEventEditViewController *)v10 setEditViewDelegate:v7];

  return v10;
}

+ (id)eventOrIntegrationViewControllerWithEvent:(id)a3 creationMethod:(unint64_t)a4 eventEditViewDelegate:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 isIntegrationEvent])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)_integrationEditViewControllerCreators;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        if (objc_msgSend(v14, "useThisIntegrationEditorForEvent:", v7, (void)v18)) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v15 = [v14 integrationViewControllerForEvent:v7 eventEditViewDelegate:v8];

      if (v15) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
  }
  v16 = objc_msgSend(v7, "eventStore", (void)v18);
  v15 = +[EKEventEditViewController eventEditViewControllerWithEvent:v7 eventStore:v16 editViewDelegate:v8];

  [v15 setEventCreationMethod:a4];
LABEL_13:

  return v15;
}

@end