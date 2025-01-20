@interface EKICSPreviewController
- (BOOL)_anyCalendarsSupportingImport;
- (BOOL)_calendarSupportsImport:(id)a3;
- (BOOL)_shouldShowCalendarChooser;
- (BOOL)allowsEditing;
- (BOOL)allowsImport;
- (BOOL)allowsSubitems;
- (BOOL)eventViewControllerShouldAlwaysShowNavBar:(id)a3;
- (BOOL)eventViewControllerShouldDismissSelf:(id)a3;
- (BOOL)showListViewForOneEvent;
- (EKICSPreviewController)initWithData:(id)a3 eventStore:(id)a4;
- (EKICSPreviewController)initWithData:(id)a3 eventStore:(id)a4 options:(unint64_t)a5;
- (EKICSPreviewController)initWithEventObjectID:(id)a3 eventStore:(id)a4;
- (EKICSPreviewController)initWithEventUID:(int)a3 eventStore:(id)a4;
- (EKICSPreviewController)initWithURL:(id)a3 eventStore:(id)a4;
- (EKICSPreviewController)initWithURL:(id)a3 eventStore:(id)a4 options:(unint64_t)a5;
- (EKICSPreviewControllerDelegate)previewDelegate;
- (EKICSPreviewModel)model;
- (id)_defaultCalendarForImport;
- (id)detailViewForEvent:(id)a3 eventInRealStore:(BOOL)a4 showUpdate:(BOOL)a5 showDelete:(BOOL)a6;
- (id)singleExistingEventUniqueID;
- (id)viewController;
- (int)eventUID;
- (unint64_t)_countOfCalendarsSupportingImport;
- (unint64_t)actionsState;
- (void)_createCancelButtonWithType:(int64_t)a3 target:(id)a4 action:(SEL)a5;
- (void)_enumerateSupportedCalendarsUsingBlock:(id)a3;
- (void)_updateCancelButton;
- (void)addEventsToCalendar;
- (void)attemptDisplayReviewPrompt;
- (void)calendarChooserDidCancel:(id)a3;
- (void)calendarChooserDidFinish:(id)a3;
- (void)dealloc;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewControllerDidRequestAddToCalendar:(id)a3;
- (void)handleDidImportEvent:(id)a3 fromController:(id)a4 intoCalendar:(id)a5;
- (void)handleImportEventError;
- (void)icsPreviewListController:(id)a3 didSelectEvent:(id)a4;
- (void)importAllIntoCalendar:(id)a3;
- (void)importAllRequested:(id)a3;
- (void)importEventFromController:(id)a3 intoCalendar:(id)a4;
- (void)presentCalendarChooserForController:(id)a3;
- (void)setActionsState:(unint64_t)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsImport:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setCancelButtonWithTarget:(id)a3 action:(SEL)a4;
- (void)setPreviewDelegate:(id)a3;
- (void)setShowListViewForOneEvent:(BOOL)a3;
@end

@implementation EKICSPreviewController

- (EKICSPreviewController)initWithURL:(id)a3 eventStore:(id)a4
{
  return [(EKICSPreviewController *)self initWithURL:a3 eventStore:a4 options:0];
}

- (EKICSPreviewController)initWithURL:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  if (a3)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3];
    if (v9)
    {
      self = [(EKICSPreviewController *)self initWithData:v9 eventStore:v8 options:a5];
      v10 = self;
    }
    else
    {
      NSLog(&cfstr_UnableToGetIcs.isa);
      v10 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Can't pass nil URL"];
    v10 = 0;
  }

  return v10;
}

- (EKICSPreviewController)initWithData:(id)a3 eventStore:(id)a4
{
  return [(EKICSPreviewController *)self initWithData:a3 eventStore:a4 options:0];
}

- (EKICSPreviewController)initWithData:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)EKICSPreviewController;
  v10 = [(EKICSPreviewController *)&v19 init];
  v11 = v10;
  if (!v10)
  {
LABEL_11:
    v16 = v11;
    goto LABEL_12;
  }
  if (v8)
  {
    p_eventStore = &v10->_eventStore;
    objc_storeStrong((id *)&v10->_eventStore, a4);
    v13 = [[EKICSPreviewModel alloc] initWithICSData:v8 eventStore:v11->_eventStore options:a5];
    model = v11->_model;
    v11->_model = v13;

    if ([(EKICSPreviewModel *)v11->_model totalEventCount])
    {
      if (*p_eventStore)
      {
        *(_WORD *)&v11->_allowsEditing = 257;
        uint64_t v15 = [(EKICSPreviewModel *)v11->_model actionsState];
      }
      else
      {
        uint64_t v15 = 1;
      }
      v11->_actionsState = v15;
      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 addObserver:v11 selector:sel__databaseChanged_ name:*MEMORY[0x1E4F25460] object:v11->_eventStore];

      goto LABEL_11;
    }
    NSLog(&cfstr_ImportOfIcsFil.isa);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Can't pass nil data"];
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (EKICSPreviewController)initWithEventObjectID:(id)a3 eventStore:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EKICSPreviewController;
  id v8 = [(EKICSPreviewController *)&v18 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_eventStore, a4);
  v10 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  [(EKEventStore *)v9->_eventStore setTimeZone:v10];

  v11 = [(EKEventStore *)v9->_eventStore eventForObjectID:v6 occurrenceDate:0];
  if (v11)
  {
    eventFromUID = v9->_eventFromUID;
    v9->_eventFromUID = v11;
    v13 = v11;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v9 selector:sel__databaseChanged_ name:*MEMORY[0x1E4F25460] object:v9->_eventStore];

LABEL_4:
    uint64_t v15 = v9;
    goto LABEL_8;
  }
  v16 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "EKICSPreviewController cannot be initialized with no event; Could not find event with object id: %@",
      buf,
      0xCu);
  }
  uint64_t v15 = 0;
LABEL_8:

  return v15;
}

- (EKICSPreviewController)initWithEventUID:(int)a3 eventStore:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4F25598];
  uint64_t v7 = *MEMORY[0x1E4F574B8];
  id v8 = a4;
  id v9 = [v6 objectIDWithEntityType:2 rowID:v4 databaseID:v7];
  v10 = [(EKICSPreviewController *)self initWithEventObjectID:v9 eventStore:v8];

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F25460] object:self->_eventStore];

  v4.receiver = self;
  v4.super_class = (Class)EKICSPreviewController;
  [(EKICSPreviewController *)&v4 dealloc];
}

- (id)singleExistingEventUniqueID
{
  if ([(EKICSPreviewModel *)self->_model totalEventCount] == 1
    && [(EKICSPreviewModel *)self->_model importedEventCount] == 1)
  {
    v3 = [(EKICSPreviewModel *)self->_model importedEvents];
    objc_super v4 = [v3 firstObject];

    v5 = [(EKICSPreviewModel *)self->_model eventStore];
    id v6 = [v4 uniqueId];
    uint64_t v7 = [v5 eventWithUniqueId:v6];

    if (v7 && (int v8 = [v7 sequenceNumber], v8 >= (int)objc_msgSend(v4, "sequenceNumber")))
    {
      id v9 = [v7 uniqueID];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)addEventsToCalendar
{
  if (![(EKICSPreviewController *)self allowsImport])
  {
    objc_super v4 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    v5 = "Add to Calendar requested, but self.allowsImport isn't true";
    id v6 = buf;
    goto LABEL_8;
  }
  if (self->_eventFromUID
    || ([(EKICSPreviewController *)self singleExistingEventUniqueID],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    objc_super v4 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v9 = 0;
    v5 = "Add to Calendar requested, but event already exists in the store";
    id v6 = (uint8_t *)&v9;
LABEL_8:
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    contentViewController = self->_contentViewController;
    [(UIViewController *)contentViewController performAddToCalendar];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = self->_contentViewController;
      [(EKICSPreviewController *)self importAllRequested:v8];
    }
  }
}

- (id)detailViewForEvent:(id)a3 eventInRealStore:(BOOL)a4 showUpdate:(BOOL)a5 showDelete:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = [[EKEventViewController alloc] initWithRemoteUI:0];
  [(EKEventViewController *)v11 setICSPreview:!v8];
  [(EKEventViewController *)v11 setEvent:v10];

  if (self->_allowsImport)
  {
    BOOL v12 = 0;
    if (!self->_actionsState && !v8) {
      BOOL v12 = [(EKICSPreviewController *)self _anyCalendarsSupportingImport];
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  [(EKEventViewController *)v11 setShowsAddToCalendarForICSPreview:v12 && !v7];
  [(EKEventViewController *)v11 setShowsUpdateCalendarForICSPreview:v12 & v7];
  [(EKEventViewController *)v11 setShowsDeleteForICSPreview:v12 & v6];
  unint64_t actionsState = self->_actionsState;
  switch(actionsState)
  {
    case 4uLL:
      [(EKEventViewController *)v11 setShowsDelegateMessage:1];
      break;
    case 3uLL:
      [(EKEventViewController *)v11 setShowsDelegatorMessage:1];
      break;
    case 2uLL:
      [(EKEventViewController *)v11 setShowsOutOfDateMessage:1];
      break;
  }
  [(EKEventViewController *)v11 setAllowsEditing:0];
  [(EKEventViewController *)v11 setAllowsInviteResponses:1];
  [(EKEventViewController *)v11 setAllowsSubitems:self->_allowsSubitems];
  [(EKEventViewController *)v11 setDelegate:self];
  [(EKEventViewController *)v11 setModalInPresentation:0];
  [(EKEventViewController *)v11 setShowsDoneButton:0];
  v14 = [(EKEventViewController *)v11 view];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = EKUIContainedControllerIdealWidth();
  v22 = [(EKEventViewController *)v11 view];
  objc_msgSend(v22, "setFrame:", v16, v18, v21, v20);

  [(EKEventViewController *)v11 preferredContentSize];
  -[EKEventViewController setPreferredContentSize:](v11, "setPreferredContentSize:");

  return v11;
}

- (id)viewController
{
  if (!self->_contentViewController)
  {
    if (self->_eventFromUID)
    {
      v3 = [[EKEventViewController alloc] initWithRemoteUI:0];
      [(EKEventViewController *)v3 setICSPreview:1];
      [(EKEventViewController *)v3 setEvent:self->_eventFromUID];
      [(EKEventViewController *)v3 setAllowsCalendarPreview:1];
      [(EKEventViewController *)v3 setAllowsEditing:1];
      [(EKEventViewController *)v3 setShowsDeleteForICSPreview:1];
      [(EKEventViewController *)v3 setDelegate:self];
      contentViewController = self->_contentViewController;
      self->_contentViewController = &v3->super;
    }
    else if ([(EKICSPreviewModel *)self->_model totalEventCount] == 1 {
           && !self->_showListViewForOneEvent)
    }
    {
      double v19 = [(EKICSPreviewModel *)self->_model importedEvents];
      uint64_t v20 = [v19 count];

      double v21 = [(EKICSPreviewModel *)self->_model allEvents];
      contentViewController = [v21 firstObject];

      if ([contentViewController isPhantom])
      {
        v22 = [contentViewController detachedItems];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          v24 = [contentViewController detachedItems];
          uint64_t v25 = [v24 anyObject];

          contentViewController = (void *)v25;
        }
      }
      if (contentViewController)
      {
        [(EKICSPreviewController *)self detailViewForEvent:contentViewController eventInRealStore:v20 == 1 showUpdate:[(EKICSPreviewModel *)self->_model shouldAllowUpdateEvent:contentViewController] showDelete:[(EKICSPreviewModel *)self->_model shouldAllowDeleteEvent:contentViewController]];
        v26 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        v27 = self->_contentViewController;
        self->_contentViewController = v26;
      }
    }
    else
    {
      v5 = [[EKICSPreviewListController alloc] initWithModel:self->_model];
      [(EKICSPreviewListController *)v5 setListDelegate:self];
      [(EKICSPreviewListController *)v5 setAllowsImport:self->_allowsImport];
      [(EKICSPreviewListController *)v5 setAllowsSubitems:self->_allowsSubitems];
      uint64_t v6 = *MEMORY[0x1E4FB28C8];
      BOOL v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [v7 _scaledValueForValue:65.0];
      double v9 = v8;
      id v10 = [(EKICSPreviewListController *)v5 tableView];
      [v10 setEstimatedRowHeight:v9];

      v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];
      [v11 _scaledValueForValue:28.0];
      double v13 = v12;
      v14 = [(EKICSPreviewListController *)v5 tableView];
      [v14 setEstimatedSectionHeaderHeight:v13];

      double v15 = self->_contentViewController;
      self->_contentViewController = &v5->super.super;
      double v16 = v5;

      contentViewController = [(EKICSPreviewListController *)v16 tableView];
      objc_msgSend(contentViewController, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1000.0);
      -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:");
    }
  }
  double v17 = self->_contentViewController;

  return v17;
}

- (void)_createCancelButtonWithType:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  if (self->_hasCustomCancelButton)
  {
    self->_cancelButtonType = a3;
    double v8 = (objc_class *)MEMORY[0x1E4FB14A8];
    id v9 = a4;
    id v12 = (id)[[v8 alloc] initWithBarButtonSystemItem:a3 target:v9 action:a5];

    id v10 = [(EKICSPreviewController *)self viewController];
    v11 = [v10 navigationItem];
    [v11 setLeftBarButtonItem:v12];
  }
}

- (void)_updateCancelButton
{
  if (self->_hasCustomCancelButton)
  {
    uint64_t v3 = [(EKICSPreviewModel *)self->_model unimportedEventCount] && self->_allowsImport;
    if (v3 != self->_cancelButtonType)
    {
      objc_super v4 = [(EKICSPreviewController *)self viewController];
      v5 = [v4 navigationItem];
      uint64_t v6 = [v5 leftBarButtonItem];
      id v11 = [v6 target];

      BOOL v7 = [(EKICSPreviewController *)self viewController];
      double v8 = [v7 navigationItem];
      id v9 = [v8 leftBarButtonItem];
      uint64_t v10 = [v9 action];

      [(EKICSPreviewController *)self _createCancelButtonWithType:v3 target:v11 action:v10];
    }
  }
}

- (void)setCancelButtonWithTarget:(id)a3 action:(SEL)a4
{
  self->_hasCustomCancelButton = 1;
  model = self->_model;
  id v8 = a3;
  if ([(EKICSPreviewModel *)model unimportedEventCount]) {
    BOOL allowsImport = self->_allowsImport;
  }
  else {
    BOOL allowsImport = 0;
  }
  [(EKICSPreviewController *)self _createCancelButtonWithType:allowsImport target:v8 action:a4];
}

- (void)icsPreviewListController:(id)a3 didSelectEvent:(id)a4
{
  model = self->_model;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(EKICSPreviewModel *)model importedEvents];
  -[EKICSPreviewController detailViewForEvent:eventInRealStore:showUpdate:showDelete:](self, "detailViewForEvent:eventInRealStore:showUpdate:showDelete:", v7, [v9 containsObject:v7], -[EKICSPreviewModel shouldAllowUpdateEvent:](self->_model, "shouldAllowUpdateEvent:", v7), -[EKICSPreviewModel shouldAllowDeleteEvent:](self->_model, "shouldAllowDeleteEvent:", v7));
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = [v8 navigationController];

  [v10 pushViewController:v11 animated:1];
}

- (void)presentCalendarChooserForController:(id)a3
{
  id v24 = a3;
  objc_super v4 = [[EKCalendarChooser alloc] initWithSelectionStyle:0 displayStyle:1 eventStore:self->_eventStore];
  v5 = v4;
  if (v4)
  {
    [(EKCalendarChooser *)v4 setChooserMode:1];
    [(EKCalendarChooser *)v5 setDelegate:self];
    [(EKCalendarChooser *)v5 setShowsDoneButton:1];
    [(EKCalendarChooser *)v5 setShowsCancelButton:1];
    uint64_t v6 = EventKitUIBundle();
    id v7 = [v6 localizedStringForKey:@"Choose Calendar" value:&stru_1F0CC2140 table:0];
    [(EKCalendarChooser *)v5 setTitle:v7];

    id v8 = [(EKICSPreviewController *)self _defaultCalendarForImport];
    [(EKCalendarChooser *)v5 setSelectedCalendar:v8];

    [(EKCalendarChooser *)v5 setShowDetailAccessories:1];
    id v9 = [(EKCalendarChooser *)v5 view];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = EKUIContainedControllerIdealWidth();
    double v17 = [(EKCalendarChooser *)v5 view];
    objc_msgSend(v17, "setFrame:", v11, v13, v16, v15);

    double v18 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    double v19 = v18;
    if (v18)
    {
      [v18 setModalPresentationStyle:3];
      uint64_t v20 = [v24 navigationController];
      double v21 = [v20 navigationController];
      if (v20) {
        v22 = v20;
      }
      else {
        v22 = v24;
      }
      if (v21) {
        v22 = v21;
      }
      id v23 = v22;
      [v23 presentModalViewController:v19 withTransition:8];
    }
  }
}

- (BOOL)_calendarSupportsImport:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 source];
  v5 = [v4 constraints];
  if ([v5 prohibitsICSImport]) {
    char v6 = 0;
  }
  else {
    char v6 = [v3 allowsContentModifications];
  }

  return v6;
}

- (void)_enumerateSupportedCalendarsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(EKEventStore *)self->_eventStore readWriteCalendarsForEntityType:0];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__EKICSPreviewController__enumerateSupportedCalendarsUsingBlock___block_invoke;
  v7[3] = &unk_1E608A978;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  id v9 = v10;
  [v5 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __65__EKICSPreviewController__enumerateSupportedCalendarsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_calendarSupportsImport:"))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (unint64_t)_countOfCalendarsSupportingImport
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__EKICSPreviewController__countOfCalendarsSupportingImport__block_invoke;
  v4[3] = &unk_1E608A9A0;
  v4[4] = &v5;
  [(EKICSPreviewController *)self _enumerateSupportedCalendarsUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__EKICSPreviewController__countOfCalendarsSupportingImport__block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)_anyCalendarsSupportingImport
{
  return [(EKICSPreviewController *)self _countOfCalendarsSupportingImport] != 0;
}

- (BOOL)_shouldShowCalendarChooser
{
  unint64_t v2 = [(EKEventStore *)self->_eventStore readWriteCalendarsForEntityType:0];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)_defaultCalendarForImport
{
  BOOL v3 = [(EKEventStore *)self->_eventStore defaultCalendarForNewEvents];
  if ([(EKICSPreviewController *)self _calendarSupportsImport:v3])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    double v10 = __Block_byref_object_copy__19;
    double v11 = __Block_byref_object_dispose__19;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__EKICSPreviewController__defaultCalendarForImport__block_invoke;
    v6[3] = &unk_1E608A9A0;
    v6[4] = &v7;
    [(EKICSPreviewController *)self _enumerateSupportedCalendarsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  return v4;
}

void __51__EKICSPreviewController__defaultCalendarForImport__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

- (void)importAllRequested:(id)a3
{
  id v5 = a3;
  if ([(EKICSPreviewController *)self _shouldShowCalendarChooser])
  {
    [(EKICSPreviewController *)self presentCalendarChooserForController:v5];
  }
  else
  {
    id v4 = [(EKEventStore *)self->_eventStore defaultCalendarForNewEvents];
    [(EKICSPreviewController *)self importAllIntoCalendar:v4];
  }
}

- (void)calendarChooserDidFinish:(id)a3
{
  currentImport = self->_currentImport;
  id v5 = a3;
  id v6 = [v5 selectedCalendar];
  if (currentImport) {
    [(EKICSPreviewController *)self importEventFromController:currentImport intoCalendar:v6];
  }
  else {
    [(EKICSPreviewController *)self importAllIntoCalendar:v6];
  }

  [v5 dismissViewControllerAnimated:0 completion:0];
  uint64_t v7 = self->_currentImport;
  self->_currentImport = 0;
}

- (void)calendarChooserDidCancel:(id)a3
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  currentImport = self->_currentImport;
  self->_currentImport = 0;
}

- (void)importAllIntoCalendar:(id)a3
{
  if (!self->_importing)
  {
    self->_importing = 1;
    [(EKICSPreviewModel *)self->_model importAllIntoCalendar:a3];
    self->_importing = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)&self->_previewDelegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __48__EKICSPreviewController_importAllIntoCalendar___block_invoke;
        block[3] = &unk_1E6087570;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
  [(EKICSPreviewController *)self _updateCancelButton];
}

void __48__EKICSPreviewController_importAllIntoCalendar___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained icsPreviewControllerImportDidImportEvents:*(void *)(a1 + 32)];
}

- (void)importEventFromController:(id)a3 intoCalendar:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!self->_importing)
  {
    self->_importing = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
    if (WeakRetained)
    {
      uint64_t v8 = WeakRetained;
      id v9 = objc_loadWeakRetained((id *)&self->_previewDelegate);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_previewDelegate);
        [v11 icsPreviewControllerImportDidStart:self];
      }
    }
    model = self->_model;
    double v13 = [v15 event];
    double v14 = [(EKICSPreviewModel *)model importEvent:v13 intoCalendar:v6];

    if (v14) {
      [(EKICSPreviewController *)self handleDidImportEvent:v14 fromController:v15 intoCalendar:v6];
    }
    else {
      [(EKICSPreviewController *)self handleImportEventError];
    }
    self->_importing = 0;
  }
  [(EKICSPreviewController *)self _updateCancelButton];
}

- (void)handleDidImportEvent:(id)a3 fromController:(id)a4 intoCalendar:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 setICSPreview:0];
  [v7 setEvent:v8];

  [v7 preferredContentSize];
  objc_msgSend(v7, "setPreferredContentSize:");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  if (WeakRetained)
  {
    char v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)&self->_previewDelegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_previewDelegate);
      [v13 icsPreviewControllerImportDidImportEvents:self];
    }
  }
}

- (void)handleImportEventError
{
  BOOL v3 = EventKitUIBundle();
  id v14 = [v3 localizedStringForKey:@"Error Importing Event" value:&stru_1F0CC2140 table:0];

  id v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"There was a problem adding this event to the calendar." value:&stru_1F0CC2140 table:0];

  id v6 = EventKitUIBundle();
  id v7 = [v6 localizedStringForKey:@"OK" value:&stru_1F0CC2140 table:0];

  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v5 preferredStyle:1];
  id v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v7 style:1 handler:0];
  [v8 addAction:v9];

  char v10 = [(EKICSPreviewController *)self viewController];
  [v10 presentViewController:v8 animated:1 completion:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_previewDelegate);
    [v13 icsPreviewControllerImportDidFail:self];
  }
}

- (void)eventViewControllerDidRequestAddToCalendar:(id)a3
{
  id v5 = a3;
  model = self->_model;
  id v15 = v5;
  id v7 = [v5 event];
  BOOL v8 = [(EKICSPreviewModel *)model shouldAllowUpdateEvent:v7];

  if (![(EKICSPreviewController *)self _shouldShowCalendarChooser] || v8)
  {
    id v9 = [(EKEventStore *)self->_eventStore defaultCalendarForNewEvents];
    if (v8)
    {
      char v10 = [(EKICSPreviewModel *)self->_model eventStore];
      id v11 = [v15 event];
      char v12 = [v11 uniqueId];
      id v13 = [v10 eventWithUniqueId:v12];

      uint64_t v14 = [v13 calendar];

      id v9 = (void *)v14;
    }
    [(EKICSPreviewController *)self importEventFromController:v15 intoCalendar:v9];
  }
  else
  {
    objc_storeStrong((id *)&self->_currentImport, a3);
    [(EKICSPreviewController *)self presentCalendarChooserForController:v15];
  }
}

- (BOOL)eventViewControllerShouldDismissSelf:(id)a3
{
  BOOL v3 = [(EKICSPreviewController *)self previewDelegate];
  char v4 = objc_opt_respondsToSelector();

  return (v4 & 1) == 0;
}

- (BOOL)eventViewControllerShouldAlwaysShowNavBar:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(EKICSPreviewController *)self previewDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v10 = [(EKICSPreviewController *)self previewDelegate];
    [v10 icsPreviewControllerWantsDismissal:self];
  }
  else
  {
    id v7 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = v7;
      id v9 = [(EKICSPreviewController *)self previewDelegate];
      *(_DWORD *)buf = 136315394;
      char v12 = "-[EKICSPreviewController eventViewController:didCompleteWithAction:]";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "%s called on EKICSPreviewController but the preview delegate [%@] doesn't implement -[EKICSPreviewControllerDelegate icsPreviewControllerWantsDismissal]", buf, 0x16u);
    }
  }
}

- (void)attemptDisplayReviewPrompt
{
  p_previewDelegate = &self->_previewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_previewDelegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (EKICSPreviewControllerDelegate)previewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);

  return (EKICSPreviewControllerDelegate *)WeakRetained;
}

- (void)setPreviewDelegate:(id)a3
{
}

- (EKICSPreviewModel)model
{
  return self->_model;
}

- (BOOL)showListViewForOneEvent
{
  return self->_showListViewForOneEvent;
}

- (void)setShowListViewForOneEvent:(BOOL)a3
{
  self->_showListViewForOneEvent = a3;
}

- (BOOL)allowsImport
{
  return self->_allowsImport;
}

- (void)setAllowsImport:(BOOL)a3
{
  self->_BOOL allowsImport = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsSubitems
{
  return self->_allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->_allowsSubitems = a3;
}

- (unint64_t)actionsState
{
  return self->_actionsState;
}

- (void)setActionsState:(unint64_t)a3
{
  self->_unint64_t actionsState = a3;
}

- (int)eventUID
{
  return self->_eventUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_previewDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_currentImport, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_eventFromUID, 0);
}

@end