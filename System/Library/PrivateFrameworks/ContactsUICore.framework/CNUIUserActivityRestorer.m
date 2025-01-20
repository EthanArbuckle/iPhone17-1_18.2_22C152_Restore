@interface CNUIUserActivityRestorer
+ (OS_os_log)log;
- (BOOL)restoreCreateContactIntent:(id)a3;
- (BOOL)restoreEditingContact:(id)a3;
- (BOOL)restoreSpotlightQueryContinuation:(id)a3;
- (BOOL)restoreSpotlightSearchableItem:(id)a3;
- (BOOL)restoreUserActivity:(id)a3;
- (BOOL)restoreViewingContact:(id)a3;
- (BOOL)restoreViewingGroups:(id)a3;
- (BOOL)restoreViewingList:(id)a3;
- (BOOL)shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:(id)a3;
- (CNContactStore)contactStore;
- (CNUIUserActivityRestorer)initWithContactStore:(id)a3;
- (CNUIUserActivityRestorerDelegate)delegate;
- (NSSet)restorableActivityTypes;
- (NSString)activityTypeCreateContactIntent;
- (NSString)activityTypeSpotlightQueryContinuation;
- (NSString)activityTypeSpotlightSearchableItem;
- (void)setDelegate:(id)a3;
@end

@implementation CNUIUserActivityRestorer

- (void)setDelegate:(id)a3
{
}

- (CNUIUserActivityRestorer)initWithContactStore:(id)a3
{
  v36[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CNUIUserActivityRestorer;
  v6 = [(CNUIUserActivityRestorer *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    activityTypeCreateContactIntent = v7->_activityTypeCreateContactIntent;
    v7->_activityTypeCreateContactIntent = (NSString *)v9;

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v11 = (id *)getCSQueryContinuationActionTypeSymbolLoc_ptr;
    uint64_t v35 = getCSQueryContinuationActionTypeSymbolLoc_ptr;
    if (!getCSQueryContinuationActionTypeSymbolLoc_ptr)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __getCSQueryContinuationActionTypeSymbolLoc_block_invoke;
      v30 = &unk_264017B98;
      v31 = &v32;
      v12 = (void *)CoreSpotlightLibrary();
      v13 = dlsym(v12, "CSQueryContinuationActionType");
      *(void *)(v31[1] + 24) = v13;
      getCSQueryContinuationActionTypeSymbolLoc_ptr = *(void *)(v31[1] + 24);
      v11 = (id *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v11) {
      goto LABEL_10;
    }
    objc_storeStrong((id *)&v7->_activityTypeSpotlightQueryContinuation, *v11);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v14 = (id *)getCSSearchableItemActionTypeSymbolLoc_ptr;
    uint64_t v35 = getCSSearchableItemActionTypeSymbolLoc_ptr;
    if (!getCSSearchableItemActionTypeSymbolLoc_ptr)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __getCSSearchableItemActionTypeSymbolLoc_block_invoke;
      v30 = &unk_264017B98;
      v31 = &v32;
      v15 = (void *)CoreSpotlightLibrary();
      v16 = dlsym(v15, "CSSearchableItemActionType");
      *(void *)(v31[1] + 24) = v16;
      getCSSearchableItemActionTypeSymbolLoc_ptr = *(void *)(v31[1] + 24);
      v14 = (id *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v14)
    {
LABEL_10:
      -[CNUIUserActivityRestorer initWithContactStore:]();
      __break(1u);
    }
    objc_storeStrong((id *)&v7->_activityTypeSpotlightSearchableItem, *v14);
    v17 = (void *)MEMORY[0x263EFFA08];
    v36[0] = CNUIActivityTypeViewingContact;
    v36[1] = CNUIActivityTypeEditingContact;
    v36[2] = CNUIActivityTypeViewingList;
    v36[3] = CNUIActivityTypeViewingGroups;
    v18 = [(CNUIUserActivityRestorer *)v7 activityTypeSpotlightQueryContinuation];
    v36[4] = v18;
    v19 = [(CNUIUserActivityRestorer *)v7 activityTypeSpotlightSearchableItem];
    v36[5] = v19;
    v20 = [(CNUIUserActivityRestorer *)v7 activityTypeCreateContactIntent];
    v36[6] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:7];
    uint64_t v22 = [v17 setWithArray:v21];
    restorableActivityTypes = v7->_restorableActivityTypes;
    v7->_restorableActivityTypes = (NSSet *)v22;

    v24 = v7;
  }

  return v7;
}

- (NSString)activityTypeSpotlightSearchableItem
{
  return self->_activityTypeSpotlightSearchableItem;
}

- (NSString)activityTypeSpotlightQueryContinuation
{
  return self->_activityTypeSpotlightQueryContinuation;
}

- (NSString)activityTypeCreateContactIntent
{
  return self->_activityTypeCreateContactIntent;
}

+ (OS_os_log)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_17);
  }
  v2 = (void *)log_cn_once_object_1;
  return (OS_os_log *)v2;
}

uint64_t __31__CNUIUserActivityRestorer_log__block_invoke()
{
  log_cn_once_object_1 = (uint64_t)os_log_create("contactsui", "activity");
  return MEMORY[0x270F9A758]();
}

- (BOOL)shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:CNUIActivityTypeViewingContact] & 1) != 0
    || ([v4 isEqualToString:CNUIActivityTypeEditingContact] & 1) != 0
    || ([v4 isEqualToString:CNUIActivityTypeViewingList] & 1) != 0
    || ([v4 isEqualToString:CNUIActivityTypeViewingGroups] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    v7 = [(CNUIUserActivityRestorer *)self activityTypeSpotlightSearchableItem];
    char v5 = [v4 isEqualToString:v7];
  }
  return v5;
}

- (BOOL)restoreUserActivity:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 activityType];
    int v27 = 138412290;
    uint64_t v28 = v6;
    _os_log_impl(&dword_20B704000, v5, OS_LOG_TYPE_INFO, "did receive activity of type %@", (uint8_t *)&v27, 0xCu);
  }
  v7 = [v4 activityType];
  int v8 = [v7 isEqualToString:CNUIActivityTypeViewingContact];

  if (v8)
  {
    BOOL v9 = [(CNUIUserActivityRestorer *)self restoreViewingContact:v4];
  }
  else
  {
    v10 = [v4 activityType];
    int v11 = [v10 isEqualToString:CNUIActivityTypeEditingContact];

    if (v11)
    {
      BOOL v9 = [(CNUIUserActivityRestorer *)self restoreEditingContact:v4];
    }
    else
    {
      v12 = [v4 activityType];
      int v13 = [v12 isEqualToString:CNUIActivityTypeViewingList];

      if (v13)
      {
        BOOL v9 = [(CNUIUserActivityRestorer *)self restoreViewingList:v4];
      }
      else
      {
        v14 = [v4 activityType];
        int v15 = [v14 isEqualToString:CNUIActivityTypeViewingGroups];

        if (v15)
        {
          BOOL v9 = [(CNUIUserActivityRestorer *)self restoreViewingGroups:v4];
        }
        else
        {
          v16 = [v4 activityType];
          v17 = [(CNUIUserActivityRestorer *)self activityTypeSpotlightQueryContinuation];
          int v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            BOOL v9 = [(CNUIUserActivityRestorer *)self restoreSpotlightQueryContinuation:v4];
          }
          else
          {
            v19 = [v4 activityType];
            v20 = [(CNUIUserActivityRestorer *)self activityTypeSpotlightSearchableItem];
            int v21 = [v19 isEqualToString:v20];

            if (v21)
            {
              BOOL v9 = [(CNUIUserActivityRestorer *)self restoreSpotlightSearchableItem:v4];
            }
            else
            {
              uint64_t v22 = [v4 activityType];
              v23 = [(CNUIUserActivityRestorer *)self activityTypeCreateContactIntent];
              int v24 = [v22 isEqualToString:v23];

              if (!v24)
              {
                BOOL v25 = 0;
                goto LABEL_18;
              }
              BOOL v9 = [(CNUIUserActivityRestorer *)self restoreCreateContactIntent:v4];
            }
          }
        }
      }
    }
  }
  BOOL v25 = v9;
LABEL_18:

  return v25;
}

- (BOOL)restoreViewingContact:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22[0] = *MEMORY[0x263EFDFE0];
  char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v6 = [(CNUIUserActivityRestorer *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(CNUIUserActivityRestorer *)self delegate];
    uint64_t v9 = [v8 userActivityRestorer:self keysToFetchWhenRestoringViewContactActivity:v4];

    char v5 = (void *)v9;
  }
  v10 = [(CNUIUserActivityRestorer *)self contactStore];
  int v11 = [v4 userInfo];
  v12 = [v10 contactWithUserActivityUserInfo:v11 keysToFetch:v5];

  int v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v12 identifier];
    int v18 = 138412546;
    v19 = v12;
    __int16 v20 = 2112;
    int v21 = v14;
    _os_log_impl(&dword_20B704000, v13, OS_LOG_TYPE_INFO, "activity continuity - continuing with viewing contact %@ (%@)", (uint8_t *)&v18, 0x16u);
  }
  int v15 = [(CNUIUserActivityRestorer *)self delegate];
  char v16 = [v15 userActivityRestorer:self restoreViewContact:v12 activity:v4];

  return v16;
}

- (BOOL)restoreEditingContact:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22[0] = *MEMORY[0x263EFDFE0];
  char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v6 = [(CNUIUserActivityRestorer *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(CNUIUserActivityRestorer *)self delegate];
    uint64_t v9 = [v8 userActivityRestorer:self keysToFetchWhenRestoringEditContactContactActivity:v4];

    char v5 = (void *)v9;
  }
  v10 = [(CNUIUserActivityRestorer *)self contactStore];
  int v11 = [v4 userInfo];
  v12 = [v10 contactWithUserActivityUserInfo:v11 keysToFetch:v5];

  int v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v12 identifier];
    int v18 = 138412546;
    v19 = v12;
    __int16 v20 = 2112;
    int v21 = v14;
    _os_log_impl(&dword_20B704000, v13, OS_LOG_TYPE_INFO, "activity continuity - continuing with editing contact %@ (%@)", (uint8_t *)&v18, 0x16u);
  }
  int v15 = [(CNUIUserActivityRestorer *)self delegate];
  char v16 = [v15 userActivityRestorer:self restoreEditContact:v12 activity:v4];

  return v16;
}

- (BOOL)restoreViewingList:(id)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:CNUIActivityUserInformationListTopContactKey];

  char v7 = [v4 userInfo];
  uint64_t v29 = [v7 objectForKeyedSubscript:CNUIActivityUserInformationDisplayedContactKey];

  int v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:CNUIActivityUserInformationSearchStringKey];

  v10 = [v4 userInfo];
  int v11 = [v10 objectForKeyedSubscript:CNUIActivityUserInformationIsShowingGroupsKey];
  uint64_t v12 = [v11 BOOLValue];

  v40[0] = *MEMORY[0x263EFDFE0];
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
  v14 = [(CNUIUserActivityRestorer *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    char v16 = [(CNUIUserActivityRestorer *)self delegate];
    uint64_t v17 = [v16 userActivityRestorer:self keysToFetchWhenRestoringViewContactActivity:v4];

    int v13 = (void *)v17;
  }
  int v18 = [(CNUIUserActivityRestorer *)self contactStore];
  uint64_t v28 = (void *)v6;
  v19 = [v18 contactWithUserActivityUserInfo:v6 keysToFetch:v13];

  __int16 v20 = [(CNUIUserActivityRestorer *)self contactStore];
  int v21 = [v20 contactWithUserActivityUserInfo:v29 keysToFetch:v13];

  uint64_t v22 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = [v19 identifier];
    int v24 = [v21 identifier];
    *(_DWORD *)buf = 138413314;
    v31 = v19;
    __int16 v32 = 2112;
    v33 = v23;
    __int16 v34 = 2112;
    uint64_t v35 = v21;
    __int16 v36 = 2112;
    v37 = v24;
    __int16 v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_20B704000, v22, OS_LOG_TYPE_INFO, "activity continuity - continuing with top of list contact %@ (%@) viewing contact %@ (%@) with search String %@", buf, 0x34u);
  }
  BOOL v25 = [(CNUIUserActivityRestorer *)self delegate];
  char v26 = [v25 userActivityRestorer:self restoreViewListAtContact:v19 displayedContact:v21 searchString:v9 isShowingGroups:v12 activity:v4];

  return v26;
}

- (BOOL)restoreViewingGroups:(id)a3
{
  id v4 = a3;
  char v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_20B704000, v5, OS_LOG_TYPE_INFO, "activity continuity - continuing viewing groups", v9, 2u);
  }

  uint64_t v6 = [(CNUIUserActivityRestorer *)self delegate];
  char v7 = [v6 userActivityRestorer:self restoreViewGroupsWithActivity:v4];

  return v7;
}

- (BOOL)restoreSpotlightQueryContinuation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 userInfo];
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v6 = (id *)getCSSearchQueryStringSymbolLoc_ptr;
  uint64_t v18 = getCSSearchQueryStringSymbolLoc_ptr;
  if (!getCSSearchQueryStringSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    __int16 v20 = __getCSSearchQueryStringSymbolLoc_block_invoke;
    int v21 = &unk_264017B98;
    uint64_t v22 = &v15;
    char v7 = (void *)CoreSpotlightLibrary();
    int v8 = dlsym(v7, "CSSearchQueryString");
    *(void *)(v22[1] + 24) = v8;
    getCSSearchQueryStringSymbolLoc_ptr = *(void *)(v22[1] + 24);
    uint64_t v6 = (id *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v6)
  {
    -[CNUIUserActivityRestorer initWithContactStore:]();
    __break(1u);
  }
  id v9 = *v6;
  v10 = objc_msgSend(v5, "objectForKeyedSubscript:", v9, v15);

  int v11 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_20B704000, v11, OS_LOG_TYPE_INFO, "activity continuity - continuing with spotlight query: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v12 = [(CNUIUserActivityRestorer *)self delegate];
  char v13 = [v12 userActivityRestorer:self restoreSearch:v10 activity:v4];

  return v13;
}

- (BOOL)restoreSpotlightSearchableItem:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 userInfo];
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v6 = (id *)getCSSearchableItemActivityIdentifierSymbolLoc_ptr;
  uint64_t v27 = getCSSearchableItemActivityIdentifierSymbolLoc_ptr;
  if (!getCSSearchableItemActivityIdentifierSymbolLoc_ptr)
  {
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCSSearchableItemActivityIdentifierSymbolLoc_block_invoke;
    v30 = &unk_264017B98;
    v31 = &v24;
    char v7 = (void *)CoreSpotlightLibrary();
    int v8 = dlsym(v7, "CSSearchableItemActivityIdentifier");
    *(void *)(v31[1] + 24) = v8;
    getCSSearchableItemActivityIdentifierSymbolLoc_ptr = *(void *)(v31[1] + 24);
    uint64_t v6 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v6)
  {
    -[CNUIUserActivityRestorer initWithContactStore:]();
    __break(1u);
  }
  id v9 = *v6;
  v10 = [v5 objectForKeyedSubscript:v9];

  uint64_t v28 = *MEMORY[0x263EFDFE0];
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  uint64_t v12 = [(CNUIUserActivityRestorer *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(CNUIUserActivityRestorer *)self delegate];
    uint64_t v15 = [v14 userActivityRestorer:self keysToFetchWhenRestoringViewContactActivity:v4];

    int v11 = (void *)v15;
  }
  char v16 = [(CNUIUserActivityRestorer *)self contactStore];
  id v23 = 0;
  uint64_t v17 = [v16 unifiedContactWithIdentifier:v10 keysToFetch:v11 error:&v23];
  id v18 = v23;

  v19 = [(id)objc_opt_class() log];
  __int16 v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(CNUIUserActivityRestorer *)(uint64_t)v10 restoreSpotlightSearchableItem:v20];
    }
    char v21 = 0;
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_20B704000, v20, OS_LOG_TYPE_INFO, "activity continuity - continuing with spotlight searchable contact %@ (%@)", buf, 0x16u);
    }

    __int16 v20 = [(CNUIUserActivityRestorer *)self delegate];
    char v21 = [v20 userActivityRestorer:self restoreViewContact:v17 activity:v4];
  }

  return v21;
}

- (BOOL)restoreCreateContactIntent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char v5 = [v4 interaction];
  uint64_t v6 = [v5 intent];
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }

  if (v7)
  {
    int v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_20B704000, v8, OS_LOG_TYPE_INFO, "activity continuity - continuing with create contact", v12, 2u);
    }

    id v9 = [(CNUIUserActivityRestorer *)self delegate];
    char v10 = [v9 userActivityRestorer:self restoreCreateContact:0 activity:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (CNUIUserActivityRestorerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CNUIUserActivityRestorerDelegate *)WeakRetained;
}

- (NSSet)restorableActivityTypes
{
  return self->_restorableActivityTypes;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeSpotlightSearchableItem, 0);
  objc_storeStrong((id *)&self->_activityTypeSpotlightQueryContinuation, 0);
  objc_storeStrong((id *)&self->_activityTypeCreateContactIntent, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_restorableActivityTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (uint64_t)initWithContactStore:.cold.1()
{
  dlerror();
  int v0 = abort_report_np();
  return [(CNUIUserActivityRestorer *)v0 restoreSpotlightSearchableItem:v2];
}

- (void)restoreSpotlightSearchableItem:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20B704000, log, OS_LOG_TYPE_ERROR, "activity continuity - failed to continue with spotlight searchable contact (%@), error: %@", (uint8_t *)&v3, 0x16u);
}

@end