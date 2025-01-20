@interface EKCalendarEditor
+ (id)fetchInitialSourceWithLimitedToSource:(id)a3 calendar:(id)a4 store:(id)a5;
+ (id)newFamilyCalendarEditorWithEventStore:(id)a3;
- (BOOL)isNewFamilyCalendar;
- (EKCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6;
- (EKSharee)meSharee;
- (NSString)prefillCalendarTitle;
- (id)existingSharees;
- (id)fetchInitialSource;
- (id)loadEditItems;
- (id)newSharees;
- (id)reconfiguredEditItems;
- (void)_deleteCalendar;
- (void)_deleteClicked:(id)a3;
- (void)_updateAppEntityAnnotationsIfNeeded;
- (void)accountEditItem:(id)a3 selectedSourceChanged:(id)a4;
- (void)addNewSharees:(id)a3;
- (void)calendarEditItem:(id)a3 shareesChanged:(id)a4 changesSaved:(BOOL)a5;
- (void)calendarEditItemWillChangeSharees:(id)a3;
- (void)calendarItemStartedEditing:(id)a3;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)loadView;
- (void)selectedSourceChanged:(id)a3;
- (void)setIsNewFamilyCalendar:(BOOL)a3;
- (void)setMeSharee:(id)a3;
- (void)setPrefillCalendarTitle:(id)a3;
- (void)updateShouldSuggestFamilyShareesWithSource:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation EKCalendarEditor

+ (id)newFamilyCalendarEditorWithEventStore:(id)a3
{
  id v3 = a3;
  v4 = [v3 primaryAppleAccountSource];
  v5 = [[EKCalendarEditor alloc] initWithCalendar:0 eventStore:v3 entityType:0 limitedToSource:v4];

  [(EKCalendarEditor *)v5 setIsNewFamilyCalendar:1];
  v6 = EventKitUIBundle();
  v7 = [v6 localizedStringForKey:@"Family Calendar" value:&stru_1F0CC2140 table:0];
  [(EKCalendarEditor *)v5 setPrefillCalendarTitle:v7];

  v8 = (void *)MEMORY[0x1E4F25568];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__EKCalendarEditor_newFamilyCalendarEditorWithEventStore___block_invoke;
  v11[3] = &unk_1E6088B50;
  v9 = v5;
  v12 = v9;
  [v8 requestFamilyShareesWithCompletion:v11];

  return v9;
}

void __58__EKCalendarEditor_newFamilyCalendarEditorWithEventStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setInitialSharees:a2];
  [*(id *)(a1 + 32) setMeSharee:v6];
}

- (EKCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EKCalendarEditor;
  v13 = [(EKAbstractCalendarEditor *)&v21 initWithCalendar:v10 eventStore:v11 entityType:a5 limitedToSource:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_limitedToSource, a6);
    v14->_entityType = a5;
    objc_initWeak(&location, v14);
    v22[0] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__EKCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke;
    v18[3] = &unk_1E60874F8;
    objc_copyWeak(&v19, &location);
    id v16 = (id)[(EKCalendarEditor *)v14 registerForTraitChanges:v15 withHandler:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __75__EKCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[139] reset];
    v2 = [v3 tableView];
    [v2 reloadData];

    WeakRetained = v3;
  }
}

- (void)loadView
{
  BOOL v3 = [(EKAbstractCalendarEditor *)self isNewCalendar];
  v4 = EventKitUIBundle();
  v5 = v4;
  if (v3)
  {
    id v6 = @"Add Calendar Title";
    v7 = @"Add Calendar";
  }
  else
  {
    id v6 = @"Edit Calendar";
    v7 = &stru_1F0CC2140;
  }
  v8 = [v4 localizedStringForKey:v6 value:v7 table:0];
  [(EKCalendarEditor *)self setTitle:v8];

  v9.receiver = self;
  v9.super_class = (Class)EKCalendarEditor;
  [(EKAbstractCalendarEditor *)&v9 loadView];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)EKCalendarEditor;
  [(EKAbstractCalendarEditor *)&v11 viewDidLoad];
  BOOL v3 = [(EKCalendarEditor *)self prefillCalendarTitle];
  uint64_t v4 = [v3 length];

  BOOL v5 = [(EKAbstractCalendarEditor *)self enableDoneInitially];
  id v6 = [(EKCalendarEditor *)self navigationItem];
  v7 = v6;
  if (v4)
  {
    if (v5) {
      [v6 leftBarButtonItem];
    }
    else {
    v8 = [v6 rightBarButtonItem];
    }
    objc_super v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    if (v5) {
      [v6 leftBarButtonItem];
    }
    else {
    v8 = [v6 rightBarButtonItem];
    }
    objc_super v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setEnabled:v10];

  [(EKCalendarEditor *)self _updateAppEntityAnnotationsIfNeeded];
}

- (void)_updateAppEntityAnnotationsIfNeeded
{
  id v5 = [(EKAbstractCalendarEditor *)self calendar];
  if (CalendarLinkLibraryCore() && v5 && ([v5 isNew] & 1) == 0)
  {
    BOOL v3 = [(EKCalendarEditor *)self view];
    objc_msgSend(v3, "Cal_annotateWithCalendar:", v5);

    uint64_t v4 = [(EKCalendarEditor *)self view];
    objc_msgSend(v4, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", 1, 0, 0, 0, 1, 1);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    __int16 v14 = 1024;
    BOOL v15 = [(EKAbstractCalendarEditor *)self isNewCalendar];
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. isNew = %d", buf, 0x12u);
  }
  if ([(EKAbstractCalendarEditor *)self isNewCalendar]
    && ![(EKCalendarEditor *)self isNewFamilyCalendar])
  {
    objc_super v9 = [(EKAbstractCalendarEditor *)self editItems];
    uint64_t v10 = [v9 objectAtIndex:0];
    [v10 becomeFirstResponder];
  }
  v11.receiver = self;
  v11.super_class = (Class)EKCalendarEditor;
  [(EKCalendarEditor *)&v11 viewDidAppear:v3];
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [(EKCalendarColorEditItem *)self->_colorEditItem reset];
  id v4 = [(EKCalendarEditor *)self tableView];
  [v4 reloadData];
}

- (id)loadEditItems
{
  BOOL v3 = [(EKAbstractCalendarEditor *)self calendar];
  id v4 = [v3 source];

  if (!v4)
  {
    id v5 = [(EKCalendarEditor *)self fetchInitialSource];
    id v6 = [(EKAbstractCalendarEditor *)self calendar];
    [v6 setSource:v5];
  }
  v7 = [(EKAbstractCalendarEditor *)self calendar];
  v8 = [v7 source];
  [(EKCalendarEditor *)self updateShouldSuggestFamilyShareesWithSource:v8];

  objc_super v9 = objc_alloc_init(EKCalendarTitleEditItem);
  titleItem = self->_titleItem;
  self->_titleItem = v9;

  uint64_t v11 = [(EKCalendarEditor *)self prefillCalendarTitle];
  if (v11)
  {
    id v12 = (void *)v11;
    v13 = [(EKCalendarEditor *)self prefillCalendarTitle];
    char v14 = [v13 isEqual:&stru_1F0CC2140];

    if ((v14 & 1) == 0)
    {
      BOOL v15 = [(EKCalendarEditor *)self prefillCalendarTitle];
      [(EKCalendarTitleEditItem *)self->_titleItem setPrefillTitle:v15];
    }
  }
  uint64_t v16 = [[EKCalendarAccountEditItem alloc] initLimitedToSource:self->_limitedToSource];
  accountItem = self->_accountItem;
  self->_accountItem = v16;

  [(EKCalendarAccountEditItem *)self->_accountItem setEditable:1];
  v18 = objc_alloc_init(EKCalendarShareesEditItem);
  shareesEditItem = self->_shareesEditItem;
  self->_shareesEditItem = v18;

  v20 = objc_alloc_init(EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem);
  ignoreSharedResourceChangeNotificationsItem = self->_ignoreSharedResourceChangeNotificationsItem;
  self->_ignoreSharedResourceChangeNotificationsItem = v20;

  v22 = objc_alloc_init(EKCalendarColorEditItem);
  colorEditItem = self->_colorEditItem;
  self->_colorEditItem = v22;

  [(EKCalendarColorEditItem *)self->_colorEditItem setLayoutInline:0];
  v24 = objc_alloc_init(EKCalendarIgnoreAlertsEditItem);
  ignoreAlertsItem = self->_ignoreAlertsItem;
  self->_ignoreAlertsItem = v24;

  v26 = objc_alloc_init(EKCalendarIsAffectingAvailabilityEditItem);
  affectsAvailabilityItem = self->_affectsAvailabilityItem;
  self->_affectsAvailabilityItem = v26;

  v28 = objc_alloc_init(EKCalendarPublishingEditItem);
  publishItem = self->_publishItem;
  self->_publishItem = v28;

  v30 = objc_alloc_init(EKCalendarDeleteButtonEditItem);
  deleteItem = self->_deleteItem;
  self->_deleteItem = v30;

  [(EKCalendarButtonEditItem *)self->_deleteItem setButtonTarget:self action:sel__deleteClicked_];
  v32 = self->_deleteItem;
  v33 = EventKitUIBundle();
  v34 = [v33 localizedStringForKey:@"Delete Calendar" value:&stru_1F0CC2140 table:0];
  [(EKCalendarButtonEditItem *)v32 setButtonTitle:v34];

  [(EKCalendarButtonEditItem *)self->_deleteItem setAccessibilityIdentifier:@"delete-calendar-button"];
  v35 = [(EKAbstractCalendarEditor *)self calendar];
  v36 = [v35 source];
  [(EKCalendarEditor *)self updateShouldSuggestFamilyShareesWithSource:v36];

  return [(EKCalendarEditor *)self reconfiguredEditItems];
}

- (id)reconfiguredEditItems
{
  v38[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F57B90] shared];
  int v4 = [v3 isCurrentProcessAnApplicationExtension];

  if (v4)
  {
    accountItem = self->_accountItem;
    v38[0] = self->_titleItem;
    v38[1] = accountItem;
    ignoreAlertsItem = self->_ignoreAlertsItem;
    v38[2] = self->_colorEditItem;
    v38[3] = ignoreAlertsItem;
    deleteItem = self->_deleteItem;
    v38[4] = self->_affectsAvailabilityItem;
    v38[5] = deleteItem;
    v8 = (void *)MEMORY[0x1E4F1C978];
    objc_super v9 = v38;
    uint64_t v10 = 6;
  }
  else
  {
    if ([(EKAbstractCalendarEditor *)self isNewCalendar])
    {
      uint64_t v11 = self->_accountItem;
      v37[0] = self->_titleItem;
      v37[1] = v11;
      ignoreSharedResourceChangeNotificationsItem = self->_ignoreSharedResourceChangeNotificationsItem;
      v37[2] = self->_shareesEditItem;
      v37[3] = ignoreSharedResourceChangeNotificationsItem;
      v13 = self->_ignoreAlertsItem;
      v37[4] = self->_colorEditItem;
      v37[5] = v13;
      char v14 = self->_deleteItem;
      v37[6] = self->_affectsAvailabilityItem;
      v37[7] = v14;
      v8 = (void *)MEMORY[0x1E4F1C978];
      objc_super v9 = v37;
    }
    else
    {
      shareesEditItem = self->_shareesEditItem;
      v36[0] = self->_titleItem;
      v36[1] = shareesEditItem;
      colorEditItem = self->_colorEditItem;
      v36[2] = self->_ignoreSharedResourceChangeNotificationsItem;
      v36[3] = colorEditItem;
      affectsAvailabilityItem = self->_affectsAvailabilityItem;
      v36[4] = self->_ignoreAlertsItem;
      v36[5] = affectsAvailabilityItem;
      v18 = self->_deleteItem;
      v36[6] = self->_publishItem;
      v36[7] = v18;
      v8 = (void *)MEMORY[0x1E4F1C978];
      objc_super v9 = v36;
    }
    uint64_t v10 = 8;
  }
  id v19 = [v8 arrayWithObjects:v9 count:v10];
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v27 = [(EKAbstractCalendarEditor *)self calendar];
        v28 = [(EKAbstractCalendarEditor *)self eventStore];
        int v29 = [v26 configureWithCalendar:v27 store:v28];

        if (v29) {
          [v20 addObject:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v23);
  }

  return v20;
}

- (id)fetchInitialSource
{
  limitedToSource = self->_limitedToSource;
  int v4 = [(EKAbstractCalendarEditor *)self calendar];
  id v5 = [(EKAbstractCalendarEditor *)self eventStore];
  id v6 = +[EKCalendarEditor fetchInitialSourceWithLimitedToSource:limitedToSource calendar:v4 store:v5];

  return v6;
}

+ (id)fetchInitialSourceWithLimitedToSource:(id)a3 calendar:(id)a4 store:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 source];
  if (!v10)
  {
    if (v7)
    {
      id v10 = v7;
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = objc_msgSend(v9, "sources", 0);
      id v10 = (id)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v11);
            }
            char v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([v8 isSubscribed])
            {
              if (([v14 isDelegate] & 1) == 0)
              {
                BOOL v15 = [v14 constraints];
                if ([v15 supportsSubscribedCalendars])
                {

LABEL_21:
                  id v10 = v14;
                  goto LABEL_22;
                }
                uint64_t v16 = [v14 sourceType];

                if (v16 == 4) {
                  goto LABEL_21;
                }
              }
            }
            else if ([v14 supportsCalendarCreation] {
                   && [v14 sourceType] != 4
            }
                   && ![v14 isDelegate])
            {
              goto LABEL_21;
            }
          }
          id v10 = (id)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
  }

  return v10;
}

- (void)addNewSharees:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = [(EKAbstractCalendarEditor *)self calendar];
        [v10 addSharee:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(EKAbstractCalendarEditor *)self reconfigureAndReloadEditItems];
}

- (id)newSharees
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(EKAbstractCalendarEditor *)self calendar];
  uint64_t v5 = [v4 sharees];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isNew]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)existingSharees
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(EKAbstractCalendarEditor *)self calendar];
  uint64_t v5 = [v4 sharees];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 isNew] & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)setMeSharee:(id)a3
{
  objc_storeStrong((id *)&self->_meSharee, a3);
  id v5 = a3;
  [(EKCalendarShareesEditItem *)self->_shareesEditItem setMeSharee:v5];

  id v7 = [(EKAbstractCalendarEditor *)self calendar];
  uint64_t v6 = [v7 source];
  [(EKCalendarEditor *)self updateShouldSuggestFamilyShareesWithSource:v6];
}

- (void)updateShouldSuggestFamilyShareesWithSource:(id)a3
{
  id v4 = a3;
  id v5 = [(EKAbstractCalendarEditor *)self eventStore];
  uint64_t v6 = [v5 primaryAppleAccountSource];
  uint64_t v7 = [v6 isEqual:v4];

  shareesEditItem = self->_shareesEditItem;

  [(EKCalendarShareesEditItem *)shareesEditItem setShouldSuggestFamilySharees:v7];
}

- (void)_deleteCalendar
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(EKAbstractCalendarEditor *)self calendar];
    *(_DWORD *)buf = 138412290;
    v36 = v5;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEFAULT, "Deleting Calendar %@", buf, 0xCu);
  }
  unint64_t entityType = self->_entityType;
  if (entityType) {
    uint64_t v7 = 2 * (entityType == 1);
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = [MEMORY[0x1E4F25540] sharedInstance];
  uint64_t v9 = [(EKAbstractCalendarEditor *)self calendar];
  [v8 removeInteractionsForCalendar:v9];

  id v10 = [(EKAbstractCalendarEditor *)self calendar];
  if (![v10 isSubscribed]) {
    goto LABEL_15;
  }
  long long v11 = [(EKAbstractCalendarEditor *)self calendar];
  long long v12 = [v11 source];
  uint64_t v13 = [v12 sourceType];

  if (v13 != 2)
  {
    long long v14 = [(EKAbstractCalendarEditor *)self calendar];
    id v10 = [v14 subcalAccountID];

    id v15 = objc_alloc_init(MEMORY[0x1E4F179C8]);
    uint64_t v16 = [v15 accountWithIdentifier:v10];
    uint64_t v17 = (void *)kEKUILogHandle;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
      {
        long long v18 = v17;
        long long v19 = [(EKAbstractCalendarEditor *)self calendar];
        *(_DWORD *)buf = 138543618;
        v36 = v10;
        __int16 v37 = 2112;
        v38 = v19;
        _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_INFO, "Deleting account %{public}@ to delete subscribed calendar %@", buf, 0x16u);
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __35__EKCalendarEditor__deleteCalendar__block_invoke;
      v32[3] = &unk_1E60895B0;
      id v33 = v10;
      long long v34 = self;
      [v15 removeAccount:v16 withCompletionHandler:v32];
    }
    else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      long long v20 = v17;
      long long v21 = [(EKAbstractCalendarEditor *)self calendar];
      *(_DWORD *)buf = 138543618;
      v36 = v10;
      __int16 v37 = 2112;
      v38 = v21;
      _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_ERROR, "Couldn't find account with ID %{public}@ to remove while deleting subscribed calendar %@", buf, 0x16u);
    }
LABEL_15:
  }
  uint64_t v22 = [(UIResponder *)self EKUI_editor];
  uint64_t v23 = [(EKAbstractCalendarEditor *)self calendar];
  [v22 deleteCalendar:v23 forEntityType:v7];

  uint64_t v24 = [(EKAbstractCalendarEditor *)self delegate];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(EKAbstractCalendarEditor *)self delegate];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(EKAbstractCalendarEditor *)self delegate];
      [v28 calendarEditor:self didCompleteWithAction:2];
    }
  }
  int v29 = (void *)MEMORY[0x1E4F25568];
  v30 = [(EKAbstractCalendarEditor *)self calendar];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __35__EKCalendarEditor__deleteCalendar__block_invoke_58;
  v31[3] = &unk_1E6087520;
  v31[4] = self;
  [v29 isFamilyCalendar:v30 completion:v31];
}

void __35__EKCalendarEditor__deleteCalendar__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)kEKUILogHandle;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v9 = v6;
      id v10 = [v7 calendar];
      int v17 = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      long long v20 = v10;
      long long v11 = "Successfully removed account %{public}@ for delete of subscribed calendar %@";
      long long v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1B3F4C000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    uint64_t v9 = v6;
    id v10 = [v15 calendar];
    int v17 = 138543874;
    uint64_t v18 = v16;
    __int16 v19 = 2112;
    long long v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    long long v11 = "Failed to remove account %{public}@ while deleting subscribed calendar %@: %@";
    long long v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 32;
    goto LABEL_6;
  }
}

void __35__EKCalendarEditor__deleteCalendar__block_invoke_58(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v3 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = v3;
      uint64_t v6 = [v4 calendar];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEFAULT, "Sending out delete family calendar darwin notification. %@", (uint8_t *)&v8, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F25470], 0, 0, 1u);
  }
}

- (void)_deleteClicked:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(EKAbstractCalendarEditor *)self calendar];

  if (!v6)
  {
    long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"EKCalendarEditor.m" lineNumber:357 description:@"-[EKCalendarEditor _deleteClicked]: There is no calendar to delete."];
  }
  uint64_t v7 = [(EKAbstractCalendarEditor *)self calendar];
  uint64_t v8 = [v7 allowedEntityTypes];

  switch(v8)
  {
    case 1:
      uint64_t v9 = EventKitUIBundle();
      uint64_t v10 = v9;
      long long v11 = @"Are you sure you want to delete this calendar? All events associated with the calendar will also be deleted.";
      break;
    case 2:
      uint64_t v9 = EventKitUIBundle();
      uint64_t v10 = v9;
      long long v11 = @"Are you sure you want to delete this calendar? All reminders associated with the calendar will also be deleted.";
      break;
    case 3:
      uint64_t v9 = EventKitUIBundle();
      uint64_t v10 = v9;
      long long v11 = @"Are you sure you want to delete this calendar? All events and reminders associated with the calendar will also be deleted.";
      break;
    default:
      long long v12 = 0;
      goto LABEL_11;
  }
  long long v12 = [v9 localizedStringForKey:v11 value:&stru_1F0CC2140 table:0];

LABEL_11:
  os_log_type_t v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:0 preferredStyle:0];
  uint32_t v14 = (void *)MEMORY[0x1E4FB1410];
  id v15 = EventKitUIBundle();
  uint64_t v16 = [v15 localizedStringForKey:@"Delete Calendar" value:&stru_1F0CC2140 table:0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __35__EKCalendarEditor__deleteClicked___block_invoke;
  v35[3] = &unk_1E60874A8;
  v35[4] = self;
  int v17 = [v14 actionWithTitle:v16 style:2 handler:v35];
  [v13 addAction:v17];

  uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
  __int16 v19 = EventKitUIBundle();
  long long v20 = [v19 localizedStringForKey:@"Cancel - delete clicked" value:@"Cancel" table:0];
  __int16 v21 = [v18 actionWithTitle:v20 style:1 handler:0];
  [v13 addAction:v21];

  id v22 = [v5 buttonView];
  uint64_t v23 = [v13 popoverPresentationController];
  [v23 setSourceView:v22];

  uint64_t v24 = [v5 buttonView];

  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  id v33 = [v13 popoverPresentationController];
  objc_msgSend(v33, "setSourceRect:", v26, v28, v30, v32);

  [(EKCalendarEditor *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __35__EKCalendarEditor__deleteClicked___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteCalendar];
}

- (void)calendarItemStartedEditing:(id)a3
{
  BOOL v4 = [(EKAbstractCalendarEditor *)self enableDoneInitially];
  id v5 = [(EKCalendarEditor *)self navigationItem];
  id v7 = v5;
  if (v4) {
    [v5 leftBarButtonItem];
  }
  else {
  uint64_t v6 = [v5 rightBarButtonItem];
  }
  [v6 setEnabled:1];
}

- (void)calendarEditItemWillChangeSharees:(id)a3
{
  id v7 = [(EKAbstractCalendarEditor *)self calendar];
  BOOL v4 = [v7 sharees];
  id v5 = (NSSet *)[v4 copy];
  shareesBeforeSave = self->_shareesBeforeSave;
  self->_shareesBeforeSave = v5;
}

- (void)calendarEditItem:(id)a3 shareesChanged:(id)a4 changesSaved:(BOOL)a5
{
  BOOL v5 = a5;
  [(EKAbstractCalendarEditor *)self reconfigureAndReloadEditItems];
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__EKCalendarEditor_calendarEditItem_shareesChanged_changesSaved___block_invoke;
    v8[3] = &unk_1E6088B50;
    v8[4] = self;
    [MEMORY[0x1E4F25568] requestFamilyShareesWithCompletion:v8];
  }
  else
  {
    shareesBeforeSave = self->_shareesBeforeSave;
    self->_shareesBeforeSave = 0;
  }
}

void __65__EKCalendarEditor_calendarEditItem_shareesChanged_changesSaved___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F25568];
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[146];
  id v6 = a2;
  id v7 = [v4 calendar];
  uint64_t v8 = [v7 source];
  LODWORD(v3) = objc_msgSend(v3, "isFamilyCalendarGivenCalendarSharees:familySharees:isPrimaryAppleAccount:", v5, v6, objc_msgSend(v8, "isPrimaryAppleAccount"));

  uint64_t v9 = (void *)MEMORY[0x1E4F25568];
  uint64_t v10 = [*(id *)(a1 + 32) calendar];
  LODWORD(v9) = [v9 isFamilyCalendar:v10 givenFamilySharees:v6];

  if (v3 != v9)
  {
    long long v11 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = *(void **)(a1 + 32);
      os_log_type_t v13 = v11;
      uint32_t v14 = [v12 calendar];
      int v18 = 138412290;
      __int16 v19 = v14;
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEFAULT, "Sending out family calendar changed darwin notification. %@", (uint8_t *)&v18, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F25470], 0, 0, 1u);
  }
  uint64_t v16 = *(void *)(a1 + 32);
  int v17 = *(void **)(v16 + 1168);
  *(void *)(v16 + 1168) = 0;
}

- (void)accountEditItem:(id)a3 selectedSourceChanged:(id)a4
{
}

- (void)selectedSourceChanged:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(EKAbstractCalendarEditor *)self calendar];
  int v5 = [v4 isNew];

  if (v5)
  {
    id v6 = [(EKAbstractCalendarEditor *)self calendar];
    [v6 setSharees:0];
  }
  [(EKCalendarEditor *)self updateShouldSuggestFamilyShareesWithSource:v7];
  [(EKAbstractCalendarEditor *)self reconfigureAndReloadEditItems];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(EKAbstractCalendarEditor *)self editItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [(EKCalendarEditor *)self view];
        [v9 frame];
        [v8 layoutForWidth:CGRectGetWidth(v16)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)isNewFamilyCalendar
{
  return self->_isNewFamilyCalendar;
}

- (void)setIsNewFamilyCalendar:(BOOL)a3
{
  self->_isNewFamilyCalendar = a3;
}

- (NSString)prefillCalendarTitle
{
  return self->_prefillCalendarTitle;
}

- (void)setPrefillCalendarTitle:(id)a3
{
}

- (EKSharee)meSharee
{
  return self->_meSharee;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meSharee, 0);
  objc_storeStrong((id *)&self->_prefillCalendarTitle, 0);
  objc_storeStrong((id *)&self->_shareesBeforeSave, 0);
  objc_storeStrong((id *)&self->_limitedToSource, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_publishItem, 0);
  objc_storeStrong((id *)&self->_affectsAvailabilityItem, 0);
  objc_storeStrong((id *)&self->_ignoreAlertsItem, 0);
  objc_storeStrong((id *)&self->_colorEditItem, 0);
  objc_storeStrong((id *)&self->_ignoreSharedResourceChangeNotificationsItem, 0);
  objc_storeStrong((id *)&self->_shareesEditItem, 0);
  objc_storeStrong((id *)&self->_accountItem, 0);

  objc_storeStrong((id *)&self->_titleItem, 0);
}

@end