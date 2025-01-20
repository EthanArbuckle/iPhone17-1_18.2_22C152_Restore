@interface CNUIDefaultUserActionFetcher
+ (BOOL)doesRecentContact:(id)a3 matchUserActionItem:(id)a4;
+ (id)defaultActionItemForActionItem:(id)a3 recentContacts:(id)a4;
+ (id)queryForUserActionItem:(id)a3;
+ (id)recentContactsForUserActionItem:(id)a3 recentsLibrary:(id)a4 scheduler:(id)a5;
- (CNUIDefaultUserActionFetcher)init;
- (CNUIDefaultUserActionFetcher)initWithRecentsLibrary:(id)a3;
- (CRRecentContactsLibrary)library;
- (id)defaultActionItemForActionItems:(id)a3 schedulerProvider:(id)a4;
- (id)observableForDefaultActionsChanged;
@end

@implementation CNUIDefaultUserActionFetcher

- (CNUIDefaultUserActionFetcher)init
{
  v3 = [MEMORY[0x263F37DB0] defaultInstance];
  v4 = [(CNUIDefaultUserActionFetcher *)self initWithRecentsLibrary:v3];

  return v4;
}

- (CNUIDefaultUserActionFetcher)initWithRecentsLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIDefaultUserActionFetcher;
  v6 = [(CNUIDefaultUserActionFetcher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = v7;
  }

  return v7;
}

- (id)observableForDefaultActionsChanged
{
  v2 = (void *)MEMORY[0x263F33608];
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  v4 = [v2 observableOnNotificationCenter:v3 withName:@"com.apple.contacts.ContactsUICore.CNUIUserActionRecentsChangedNotification" object:0];

  return v4;
}

- (id)defaultActionItemForActionItems:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke;
  v14 = &unk_2640188C8;
  v15 = self;
  id v16 = v6;
  id v7 = v6;
  v8 = [a3 switchMap:&v11 schedulerProvider:v7];
  v9 = objc_msgSend(v8, "doOnNext:", &__block_literal_global_7_1, v11, v12, v13, v14, v15);

  return v9;
}

id __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_2;
  v14 = &unk_264019770;
  v4 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v4;
  id v5 = objc_msgSend(a2, "_cn_map:", &v11);
  id v6 = objc_msgSend(MEMORY[0x263F33608], "merge:schedulerProvider:", v5, *(void *)(a1 + 40), v11, v12, v13, v14, v15);
  id v7 = [v6 scan:&__block_literal_global_11_0];
  v8 = [v7 takeLast:1];
  v9 = [v8 map:&__block_literal_global_79];

  return v9;
}

id __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  id v5 = [*(id *)(a1 + 32) library];
  id v6 = [*(id *)(a1 + 40) backgroundScheduler];
  id v7 = [v4 recentContactsForUserActionItem:v3 recentsLibrary:v5 scheduler:v6];

  v8 = [(id)objc_opt_class() defaultActionItemForActionItem:v3 recentContacts:v7];

  return v8;
}

uint64_t __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 first];
}

void __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_4_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (id)recentContactsForUserActionItem:(id)a3 recentsLibrary:(id)a4 scheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263F33608];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke;
  v17[3] = &unk_264019828;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  id v21 = a1;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  uint64_t v15 = [v11 observableWithBlock:v17];

  return v15;
}

id __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2;
  v8[3] = &unk_264019800;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 performCancelableBlock:v8];

  return v6;
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 56) queryForUserActionItem:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = [v5 UUIDString];

  uint64_t v7 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_13;
  v18[3] = &unk_2640197D8;
  id v19 = v6;
  id v20 = v4;
  id v14 = *(void **)(a1 + 40);
  id v21 = *(id *)(a1 + 48);
  id v22 = v3;
  id v15 = v3;
  id v16 = v4;
  id v17 = v6;
  [v14 performRecentsSearch:v16 queue:0 completion:v18];
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_13_cold_2(a1, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = +[CNUICoreLogProvider actions_os_log];
  id v15 = v14;
  if (v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_13_cold_1(a1, (uint64_t)v5, v15);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v16 = [*(id *)(a1 + 40) predicate];
    int v17 = 138412546;
    id v18 = v16;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_20B704000, v15, OS_LOG_TYPE_INFO, "[DefaultAction] Query for %@ failed: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  [MEMORY[0x263F33610] sendArray:v5 error:v6 toObserver:*(void *)(a1 + 48) untilCanceled:*(void *)(a1 + 56)];
}

+ (id)queryForUserActionItem:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 sanitizedTargetHandle];
  id v5 = [v3 contactProperty];
  id v6 = @"CNUICRRecentsDomainContactDefaultAction";
  uint64_t v7 = CNUIUserActionRecentsAddressKindForContactProperty();
  v19[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];

  uint64_t v9 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v5 key];
    int v13 = 138412802;
    id v14 = v3;
    __int16 v15 = 2114;
    id v16 = v12;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_debug_impl(&dword_20B704000, v9, OS_LOG_TYPE_DEBUG, "[DefaultAction] composed query for %@, key %{public}@, kind %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [MEMORY[0x263F37DC0] searchQueryForSearchTerm:v4 preferredKinds:v8 sendingAddress:0 recentsDomain:v6];
  [v10 setComparator:0];

  return v10;
}

+ (id)defaultActionItemForActionItem:(id)a3 recentContacts:(id)a4
{
  id v6 = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke;
  v15[3] = &unk_264019850;
  id v17 = a1;
  id v7 = v6;
  id v16 = v7;
  uint64_t v8 = [a4 filter:v15];
  uint64_t v9 = [v8 take:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke_2;
  v13[3] = &unk_264019878;
  id v14 = v7;
  id v10 = v7;
  uint64_t v11 = [v9 map:v13];

  return v11;
}

uint64_t __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) doesRecentContact:a2 matchUserActionItem:*(void *)(a1 + 32)];
}

uint64_t __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F33618] pairWithFirst:*(void *)(a1 + 32) second:a2];
}

+ (BOOL)doesRecentContact:(id)a3 matchUserActionItem:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 contactProperty];
  uint64_t v8 = [v7 identifier];

  uint64_t v9 = [v5 metadata];
  id v10 = [v6 type];
  uint64_t v11 = [v9 valueForKey:v10];
  uint64_t v12 = [v11 valueForKey:v8];

  if (!v12) {
    goto LABEL_12;
  }
  int v13 = [v12 objectForKeyedSubscript:@"bundleIdentifier"];
  if (!v13)
  {
    id v10 = [v6 bundleIdentifier];
    if (!v10) {
      goto LABEL_6;
    }
  }
  id v14 = [v12 objectForKeyedSubscript:@"bundleIdentifier"];
  __int16 v15 = [v6 bundleIdentifier];
  int v16 = [v14 isEqual:v15];

  if (!v13)
  {

    if (v16) {
      goto LABEL_6;
    }
LABEL_12:
    BOOL v24 = 0;
    goto LABEL_13;
  }

  if (!v16) {
    goto LABEL_12;
  }
LABEL_6:
  id v17 = [v12 objectForKeyedSubscript:@"date"];
  id v18 = v17;
  if (v17)
  {
    __int16 v19 = (void *)MEMORY[0x263EFF910];
    [v17 doubleValue];
    id v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
    v26[0] = v20;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    [v5 setRecentDates:v21];
  }
  id v22 = [v5 metadata];
  [v6 associateWithRecentContactMetadata:v22];

  v23 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    +[CNUIDefaultUserActionFetcher doesRecentContact:matchUserActionItem:]();
  }

  BOOL v24 = 1;
LABEL_13:

  return v24;
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
}

void __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_13_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 40) predicate];
  OUTLINED_FUNCTION_1_4();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_20B704000, a3, OS_LOG_TYPE_DEBUG, "[DefaultAction] Query for %@ found %@", v6, 0x16u);
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_13_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)doesRecentContact:matchUserActionItem:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_20B704000, v1, OS_LOG_TYPE_DEBUG, "[DefaultAction] Recent contact %@ matches action %@", v2, 0x16u);
}

@end