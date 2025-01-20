@interface EKAbstractCalendarEditor
+ (id)createNewCalendarForEntityType:(unint64_t)a3 inEventStore:(id)a4;
- (BOOL)canManagePresentationStyle;
- (BOOL)enableDoneInitially;
- (BOOL)isModalInPresentation;
- (BOOL)isNewCalendar;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)wantsManagement;
- (CGSize)calculatePreferredContentSize;
- (CGSize)preferredContentSize;
- (EKAbstractCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6;
- (EKAbstractCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6 enableDoneInitially:(BOOL)a7;
- (EKCalendar)calendar;
- (EKCalendarEditorDelegate)delegate;
- (EKEventStore)eventStore;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)editItems;
- (id)leftButton;
- (id)loadEditItems;
- (id)reconfiguredEditItems;
- (id)rightButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int)sectionForCalendarEditItem:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_eventStoreChanged:(id)a3;
- (void)_localeChanged;
- (void)_presentValidationAlert:(id)a3;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)loadView;
- (void)reconfigureAndReloadEditItems;
- (void)resetBackgroundColor;
- (void)saveCalendar;
- (void)saveChanges;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setupForCalendar;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updatePreferredContentSize;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKAbstractCalendarEditor

- (EKAbstractCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  return [(EKAbstractCalendarEditor *)self initWithCalendar:a3 eventStore:a4 entityType:a5 limitedToSource:a6 enableDoneInitially:0];
}

- (EKAbstractCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6 enableDoneInitially:(BOOL)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EKAbstractCalendarEditor;
  v15 = [(EKAbstractCalendarEditor *)&v24 initWithStyle:2];
  v15->_enableDoneInitially = a7;
  v15->_isNewCalendar = 0;
  [(EKAbstractCalendarEditor *)v15 setModalInPresentation:1];
  [(EKAbstractCalendarEditor *)v15 setHidesBottomBarWhenPushed:1];
  objc_storeStrong((id *)&v15->_eventStore, a4);
  if (v12)
  {
    [(EKAbstractCalendarEditor *)v15 setCalendar:v12];
    v15->_isNewCalendar = 0;
  }
  else
  {
    v15->_isNewCalendar = 1;
    v16 = [(id)objc_opt_class() createNewCalendarForEntityType:a5 inEventStore:v13];
    [(EKAbstractCalendarEditor *)v15 setCalendar:v16];
  }
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:v15 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];

  objc_initWeak(&location, v15);
  v25[0] = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__EKAbstractCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource_enableDoneInitially___block_invoke;
  v21[3] = &unk_1E60874F8;
  objc_copyWeak(&v22, &location);
  id v19 = (id)[(EKAbstractCalendarEditor *)v15 registerForTraitChanges:v18 withHandler:v21];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v15;
}

void __103__EKAbstractCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource_enableDoneInitially___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
}

+ (id)createNewCalendarForEntityType:(unint64_t)a3 inEventStore:(id)a4
{
  return (id)[MEMORY[0x1E4F254C0] calendarForEntityType:a3 eventStore:a4];
}

- (void)setEventStore:(id)a3
{
  v5 = (EKEventStore *)a3;
  v6 = v5;
  p_eventStore = &self->_eventStore;
  eventStore = self->_eventStore;
  if (eventStore != v5)
  {
    id v12 = v5;
    if (eventStore && [(EKAbstractCalendarEditor *)self isViewLoaded])
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*MEMORY[0x1E4F25460] object:*p_eventStore];
    }
    objc_storeStrong((id *)&self->_eventStore, a3);
    int v10 = [(EKAbstractCalendarEditor *)self isViewLoaded];
    v6 = v12;
    if (v10)
    {
      if (*p_eventStore)
      {
        v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v11 addObserver:self selector:sel__eventStoreChanged_ name:*MEMORY[0x1E4F25460] object:*p_eventStore];
      }
      [(EKAbstractCalendarEditor *)self _eventStoreChanged:0];
      v6 = v12;
    }
  }
}

- (void)_eventStoreChanged:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(EKAbstractCalendarEditor *)self isNewCalendar])
  {
    v5 = [v4 userInfo];
    v6 = [v5 objectForKey:*MEMORY[0x1E4F25468]];

    if ([v6 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v13 = [(EKAbstractCalendarEditor *)self calendar];
            id v14 = [v13 objectID];
            LOBYTE(v12) = [v12 isEqual:v14];

            if (v12)
            {

              goto LABEL_13;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_13:
      v15 = [(EKAbstractCalendarEditor *)self calendar];
      v16 = [v15 eventStore];

      if (v16)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v17 = [(EKAbstractCalendarEditor *)self editItems];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v23 != v20) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v22 + 1) + 8 * j) reset];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v19);
        }

        id v7 = [(EKAbstractCalendarEditor *)self tableView];
        [v7 reloadData];
      }
      else
      {
        id v7 = [(EKAbstractCalendarEditor *)self delegate];
        [v7 calendarEditor:self didCompleteWithAction:2];
      }
    }
  }
}

- (void)_localeChanged
{
  id v2 = [(EKAbstractCalendarEditor *)self tableView];
  [v2 reloadData];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)EKAbstractCalendarEditor;
  [(EKAbstractCalendarEditor *)&v5 loadView];
  v3 = [(EKAbstractCalendarEditor *)self tableView];
  [v3 setEstimatedRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setEstimatedSectionFooterHeight:0.0];
  [v3 setEstimatedSectionHeaderHeight:0.0];
  [(EKAbstractCalendarEditor *)self resetBackgroundColor];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__localeChanged name:*MEMORY[0x1E4F57AB0] object:0];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  id v5 = [(EKAbstractCalendarEditor *)self tableView];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v4];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)EKAbstractCalendarEditor;
  [(EKAbstractCalendarEditor *)&v14 viewDidLoad];
  if (self->_eventStore)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__eventStoreChanged_ name:*MEMORY[0x1E4F25460] object:self->_eventStore];
  }
  id v4 = [(EKAbstractCalendarEditor *)self leftButton];
  id v5 = [(EKAbstractCalendarEditor *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  BOOL v6 = !self->_enableDoneInitially;
  id v7 = [(EKAbstractCalendarEditor *)self navigationItem];
  uint64_t v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v6];

  uint64_t v9 = [(EKAbstractCalendarEditor *)self rightButton];
  uint64_t v10 = [(EKAbstractCalendarEditor *)self navigationItem];
  [v10 setRightBarButtonItem:v9];

  BOOL enableDoneInitially = self->_enableDoneInitially;
  id v12 = [(EKAbstractCalendarEditor *)self navigationItem];
  id v13 = [v12 rightBarButtonItem];
  [v13 setEnabled:enableDoneInitially];

  [(EKAbstractCalendarEditor *)self setupForCalendar];
}

- (id)leftButton
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  [v2 setAccessibilityIdentifier:@"cancel-button"];

  return v2;
}

- (id)rightButton
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  [v2 setAccessibilityIdentifier:@"done-button"];

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKAbstractCalendarEditor;
  [(EKAbstractCalendarEditor *)&v6 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

  id v5 = [(EKAbstractCalendarEditor *)self tableView];
  [v5 reloadData];

  [(EKAbstractCalendarEditor *)self updatePreferredContentSize];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)EKAbstractCalendarEditor;
  [(EKAbstractCalendarEditor *)&v6 viewWillDisappear:v3];
}

- (void)setupForCalendar
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(EKAbstractCalendarEditor *)self editItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(EKAbstractCalendarEditor *)self calendar];
        [v8 setCalendar:v9 store:self->_eventStore];

        [v8 setDelegate:self];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [(EKAbstractCalendarEditor *)self tableView];
  [v10 reloadData];
}

- (id)loadEditItems
{
  return 0;
}

- (id)reconfiguredEditItems
{
  return 0;
}

- (void)reconfigureAndReloadEditItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_editItems)
  {
    BOOL v3 = [(EKAbstractCalendarEditor *)self reconfiguredEditItems];
    uint64_t v4 = (NSMutableArray *)[v3 mutableCopy];
    editItems = self->_editItems;
    self->_editItems = v4;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(EKAbstractCalendarEditor *)self editItems];
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
          [*(id *)(*((void *)&v12 + 1) + 8 * v10++) reloadData];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    long long v11 = [(EKAbstractCalendarEditor *)self tableView];
    [v11 reloadData];
  }
}

- (void)_presentValidationAlert:(id)a3
{
}

- (void)cancel:(id)a3
{
  uint64_t v4 = [(EKAbstractCalendarEditor *)self calendar];
  int v5 = [v4 hasChanges];

  if (v5)
  {
    uint64_t v6 = [(EKAbstractCalendarEditor *)self calendar];
    [v6 rollback];
  }
  uint64_t v7 = [(EKAbstractCalendarEditor *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(EKAbstractCalendarEditor *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(EKAbstractCalendarEditor *)self delegate];
      [v11 calendarEditor:self didCompleteWithAction:0];
    }
  }
}

- (void)done:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  if ([(EKAbstractCalendarEditor *)self isNewCalendar]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  int v5 = [(EKAbstractCalendarEditor *)self editItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [(EKAbstractCalendarEditor *)self calendar];
        [v10 saveStateToCalendar:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  long long v12 = [(EKAbstractCalendarEditor *)self calendar];
  int v13 = [v12 hasChanges];

  if (v13)
  {
    [(EKAbstractCalendarEditor *)self saveCalendar];
    uint64_t v14 = [(EKAbstractCalendarEditor *)self delegate];
    if (v14)
    {
      long long v15 = (void *)v14;
      uint64_t v16 = [(EKAbstractCalendarEditor *)self delegate];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        uint64_t v18 = [(EKAbstractCalendarEditor *)self delegate];
        uint64_t v19 = v18;
        uint64_t v20 = self;
        uint64_t v21 = v4;
LABEL_18:
        [v18 calendarEditor:v20 didCompleteWithAction:v21];
      }
    }
  }
  else
  {
    uint64_t v22 = [(EKAbstractCalendarEditor *)self delegate];
    if (v22)
    {
      long long v23 = (void *)v22;
      long long v24 = [(EKAbstractCalendarEditor *)self delegate];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        uint64_t v18 = [(EKAbstractCalendarEditor *)self delegate];
        uint64_t v19 = v18;
        uint64_t v20 = self;
        uint64_t v21 = 0;
        goto LABEL_18;
      }
    }
  }
}

- (void)saveChanges
{
}

- (void)saveCalendar
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    int v5 = [(EKAbstractCalendarEditor *)self calendar];
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEFAULT, "Saving Calendar: %@", buf, 0xCu);
  }
  uint64_t v6 = [(EKAbstractCalendarEditor *)self calendar];
  [(EKAbstractCalendarEditor *)self willSaveCalendar:v6];

  uint64_t v7 = [(UIResponder *)self EKUI_editor];
  uint64_t v8 = [(EKAbstractCalendarEditor *)self calendar];
  id v16 = 0;
  char v9 = [v7 saveCalendar:v8 error:&v16];
  id v10 = v16;

  if ((v9 & 1) == 0)
  {
    id v11 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Calendar unable to save: %@", buf, 0xCu);
    }
    [(EKAbstractCalendarEditor *)self performSelector:sel__presentValidationAlert_ withObject:v10 afterDelay:0.0];
  }
  long long v12 = [(EKAbstractCalendarEditor *)self calendar];
  [(EKAbstractCalendarEditor *)self didSaveCalendar:v12];

  int v13 = (void *)MEMORY[0x1E4F25568];
  uint64_t v14 = [(EKAbstractCalendarEditor *)self calendar];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__EKAbstractCalendarEditor_saveCalendar__block_invoke;
  v15[3] = &unk_1E6087520;
  v15[4] = self;
  [v13 isFamilyCalendar:v14 completion:v15];
}

void __40__EKAbstractCalendarEditor_saveCalendar__block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v3 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      int v5 = v3;
      uint64_t v6 = [v4 calendar];
      int v8 = 138412290;
      char v9 = v6;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEFAULT, "Sending out save family calendar darwin notification. %@", (uint8_t *)&v8, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F25470], 0, 0, 1u);
  }
}

- (id)editItems
{
  editItems = self->_editItems;
  if (!editItems)
  {
    uint64_t v4 = [(EKAbstractCalendarEditor *)self loadEditItems];
    int v5 = (NSMutableArray *)[v4 mutableCopy];
    uint64_t v6 = self->_editItems;
    self->_editItems = v5;

    [(EKAbstractCalendarEditor *)self setupForCalendar];
    editItems = self->_editItems;
  }

  return editItems;
}

- (BOOL)isModalInPresentation
{
  id v2 = [(EKAbstractCalendarEditor *)self navigationItem];
  BOOL v3 = [v2 rightBarButtonItem];
  char v4 = [v3 isEnabled];

  return v4;
}

- (CGSize)preferredContentSize
{
  p_preferredContentSize = &self->_preferredContentSize;
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(EKAbstractCalendarEditor *)self calculatePreferredContentSize];
    p_preferredContentSize->double width = width;
    p_preferredContentSize->double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)updatePreferredContentSize
{
  [(EKAbstractCalendarEditor *)self calculatePreferredContentSize];
  if (v3 != self->_preferredContentSize.width || v4 != self->_preferredContentSize.height)
  {
    self->_preferredContentSize.double width = v3;
    self->_preferredContentSize.double height = v4;
    id v7 = [(EKAbstractCalendarEditor *)self navigationController];
    uint64_t v6 = [v7 presentationController];
    [v6 preferredContentSizeDidChangeForChildContentContainer:v7];
  }
}

- (CGSize)calculatePreferredContentSize
{
  id v2 = [(EKAbstractCalendarEditor *)self tableView];
  objc_msgSend(v2, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1100.0);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (int)sectionForCalendarEditItem:(id)a3
{
  id v4 = a3;
  double v5 = [(EKAbstractCalendarEditor *)self editItems];
  if ([v5 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      double v7 = [v5 objectAtIndex:v6];
      char v8 = [v4 isEqual:v7];

      if (v8) {
        break;
      }
      if ([v5 count] <= (unint64_t)++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    LODWORD(v6) = -1;
  }

  return v6;
}

- (BOOL)isNewCalendar
{
  return self->_isNewCalendar;
}

- (BOOL)enableDoneInitially
{
  return self->_enableDoneInitially;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3 = [(EKAbstractCalendarEditor *)self editItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(EKAbstractCalendarEditor *)self editItems];
  uint64_t v6 = [v5 objectAtIndex:a4];
  int64_t v7 = [v6 numberOfSubitems];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v5 = [(EKAbstractCalendarEditor *)self editItems];
  uint64_t v6 = [v5 objectAtIndex:a4];

  int64_t v7 = [v6 headerTitle];

  return v7;
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
      char v9 = [v7 contentView];

      [v9 setBackgroundColor:v8];
    }
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  double v5 = [(EKAbstractCalendarEditor *)self editItems];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 footerTitle];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(EKAbstractCalendarEditor *)self editItems];
  id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));

  uint64_t v8 = [v5 row];
  char v9 = [v7 cellForSubitemAtIndex:v8];

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(EKAbstractCalendarEditor *)self editItems];
  char v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  [v7 bounds];
  double v11 = v10;
  [v7 _backgroundInset];
  double v13 = v12;

  uint64_t v14 = [v6 row];
  [v9 defaultCellHeightForSubitemAtIndex:v14 forWidth:v11 + v13 * -2.0];
  double v16 = v15;
  if (v15 > 0.0)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v15];
    double v16 = v17;
  }

  return v16;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(EKAbstractCalendarEditor *)self editItems];
  id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));

  uint64_t v8 = [v5 row];
  LOBYTE(self) = [v7 calendarEditor:self shouldSelectSubitem:v8];

  return (char)self;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 cellForRowAtIndexPath:v6];
  if ([v7 selectionStyle])
  {
    [v10 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
    uint64_t v8 = [(EKAbstractCalendarEditor *)self editItems];
    char v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

    objc_msgSend(v9, "calendarEditor:didSelectSubitem:", self, objc_msgSend(v6, "row"));
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  int64_t v4 = [(EKAbstractCalendarEditor *)self view];
  BOOL IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v4);

  if (IsCompactInViewHierarchy)
  {
    id v6 = [(EKAbstractCalendarEditor *)self firstResponder];
    [v6 resignFirstResponder];
  }
}

- (EKCalendarEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKCalendarEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_editItems, 0);
}

@end