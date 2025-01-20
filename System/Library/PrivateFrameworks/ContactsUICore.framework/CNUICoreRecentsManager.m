@interface CNUICoreRecentsManager
+ (CNKeyDescriptor)descriptorForRequiredKeys;
+ (id)allHandlesToSearchForFromContact:(id)a3;
+ (id)handlesForContactProperties:(id)a3;
+ (id)predicateForSearchingHandlesForAllSupportedKinds:(id)a3;
+ (id)queryForHandles:(id)a3;
+ (id)queryForHandles:(id)a3 sorted:(BOOL)a4;
+ (id)supportedPropertyDescriptions;
+ (id)supportedRecentsDomains;
+ (id)supportedRecentsKinds;
+ (id)transformForPropertyDescription:(id)a3;
- (CNScheduler)workQueue;
- (CNUICoreRecentsManager)init;
- (CNUICoreRecentsManager)initWithRecentsLibrary:(id)a3 schedulerProvider:(id)a4;
- (CRRecentContactsLibrary)recentsLibrary;
- (id)recentContactsMatchingAllPropertiesOfContact:(id)a3;
- (id)recentContactsMatchingContactProperties:(id)a3;
- (id)recentsContactsMatchingHandles:(id)a3;
- (id)recentsContactsMatchingHandles:(id)a3 sorted:(BOOL)a4;
- (id)removeRecents:(id)a3;
- (id)restoreRecents:(id)a3;
- (id)sortedRecentHandlesMatchingAllPropertiesOfContact:(id)a3;
- (void)removeRecents:(id)a3 completionHandler:(id)a4;
- (void)removeRecentsWithIdentifiers:(id)a3 domain:(id)a4 completionHandler:(id)a5;
@end

@implementation CNUICoreRecentsManager

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  v2 = (void *)MEMORY[0x263EFE9F8];
  v3 = [a1 supportedPropertyDescriptions];
  v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_25);
  v5 = [NSString stringWithUTF8String:"+[CNUICoreRecentsManager descriptorForRequiredKeys]"];
  v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return (CNKeyDescriptor *)v6;
}

- (CNUICoreRecentsManager)init
{
  v3 = [MEMORY[0x263F335C8] currentEnvironment];
  v4 = [v3 coreRecentsLibrary];

  v5 = [MEMORY[0x263F335C8] currentEnvironment];
  v6 = [v5 schedulerProvider];

  v7 = [(CNUICoreRecentsManager *)self initWithRecentsLibrary:v4 schedulerProvider:v6];
  return v7;
}

- (CNUICoreRecentsManager)initWithRecentsLibrary:(id)a3 schedulerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUICoreRecentsManager;
  v9 = [(CNUICoreRecentsManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentsLibrary, a3);
    uint64_t v11 = [v8 backgroundScheduler];
    workQueue = v10->_workQueue;
    v10->_workQueue = (CNScheduler *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)recentContactsMatchingAllPropertiesOfContact:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v12[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  if (([v4 areKeysAvailable:v6] & 1) == 0) {
    -[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:]();
  }

  id v7 = [(id)objc_opt_class() allHandlesToSearchForFromContact:v4];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v8 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:]();
    }

    uint64_t v9 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    uint64_t v9 = [(CNUICoreRecentsManager *)self recentsContactsMatchingHandles:v7];
  }
  v10 = (void *)v9;

  return v10;
}

- (id)sortedRecentHandlesMatchingAllPropertiesOfContact:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v12[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  if (([v4 areKeysAvailable:v6] & 1) == 0) {
    -[CNUICoreRecentsManager sortedRecentHandlesMatchingAllPropertiesOfContact:]();
  }

  id v7 = [(id)objc_opt_class() allHandlesToSearchForFromContact:v4];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v8 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:]();
    }

    uint64_t v9 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    v10 = [(CNUICoreRecentsManager *)self recentsContactsMatchingHandles:v7 sorted:1];
    uint64_t v9 = [v10 flatMap:&__block_literal_global_14];
  }
  return v9;
}

id __76__CNUICoreRecentsManager_sortedRecentHandlesMatchingAllPropertiesOfContact___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "_cn_map:", &__block_literal_global_17_1);
  v3 = [MEMORY[0x263F335E0] futureWithResult:v2];

  return v3;
}

uint64_t __76__CNUICoreRecentsManager_sortedRecentHandlesMatchingAllPropertiesOfContact___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 address];
}

+ (id)allHandlesToSearchForFromContact:(id)a3
{
  id v4 = a3;
  v5 = [a1 supportedPropertyDescriptions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__CNUICoreRecentsManager_allHandlesToSearchForFromContact___block_invoke;
  v9[3] = &unk_264018038;
  id v10 = v4;
  id v11 = a1;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "_cn_flatMap:", v9);

  return v7;
}

id __59__CNUICoreRecentsManager_allHandlesToSearchForFromContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  v5 = [v4 CNValueForContact:v3];
  id v6 = [*(id *)(a1 + 40) transformForPropertyDescription:v4];

  id v7 = objc_msgSend(v5, "_cn_flatMap:", v6);

  return v7;
}

- (id)recentContactsMatchingContactProperties:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() handlesForContactProperties:v4];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v6 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CNUICoreRecentsManager recentContactsMatchingContactProperties:]();
    }

    uint64_t v7 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    uint64_t v7 = [(CNUICoreRecentsManager *)self recentsContactsMatchingHandles:v5];
  }
  id v8 = (void *)v7;

  return v8;
}

+ (id)handlesForContactProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_21_0);
  uint64_t v6 = [v5 count];
  if (v6 != [v4 count])
  {
    uint64_t v7 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2;
      v14[3] = &unk_264018080;
      id v15 = v5;
      id v11 = objc_msgSend(v4, "_cn_filter:", v14);
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_debug_impl(&dword_20B704000, v7, OS_LOG_TYPE_DEBUG, "Detected invalid properties passed in, are you sure you meant to do this? %@", buf, 0xCu);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_23;
  v13[3] = &__block_descriptor_40_e27_B16__0__CNContactProperty_8l;
  v13[4] = a1;
  id v8 = objc_msgSend(v5, "_cn_filter:", v13);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2_24;
  v12[3] = &__block_descriptor_40_e36___NSArray_16__0__CNContactProperty_8l;
  v12[4] = a1;
  uint64_t v9 = objc_msgSend(v8, "_cn_flatMap:", v12);

  return v9;
}

BOOL __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x263EFE9C8] contactPropertiesByKey];
  id v4 = [v2 key];
  v5 = [v3 objectForKeyedSubscript:v4];
  if (v5)
  {
    uint64_t v6 = [v2 labeledValue];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 supportedPropertyDescriptions];
  v5 = [MEMORY[0x263EFE9C8] contactPropertiesByKey];
  uint64_t v6 = [v3 key];

  BOOL v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v4 containsObject:v7];

  return v8;
}

id __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 labeledValue];
  v5 = [MEMORY[0x263EFE9C8] contactPropertiesByKey];
  uint64_t v6 = [v3 key];

  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [*(id *)(a1 + 32) transformForPropertyDescription:v7];
  uint64_t v9 = ((void (**)(void, void *))v8)[2](v8, v4);

  return v9;
}

- (id)recentsContactsMatchingHandles:(id)a3
{
  return [(CNUICoreRecentsManager *)self recentsContactsMatchingHandles:a3 sorted:0];
}

- (id)recentsContactsMatchingHandles:(id)a3 sorted:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() queryForHandles:v5];
  BOOL v7 = +[CNUICoreLogProvider likenesses_os_log];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      -[CNUICoreRecentsManager recentsContactsMatchingHandles:sorted:](v6, (uint64_t)v5, v7);
    }

    uint64_t v9 = [(CNUICoreRecentsManager *)self recentsLibrary];
    id v10 = [v9 _recentContactsWithQuery:v6];

    [v10 addFailureBlock:&__block_literal_global_29_0];
    [v10 addSuccessBlock:&__block_literal_global_33];
  }
  else
  {
    if (v8) {
      -[CNUICoreRecentsManager recentsContactsMatchingHandles:sorted:](v7);
    }

    id v10 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v10;
}

void __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_20B704000, v3, OS_LOG_TYPE_INFO, "Searching CoreRecents failed with %@", (uint8_t *)&v4, 0xCu);
  }
}

void __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke_30_cold_1(v2, v3);
  }
}

- (id)removeRecents:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x263F33630];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  BOOL v7 = [v6 errorOnlyCompletionHandlerAdapter];
  [(CNUICoreRecentsManager *)self removeRecents:v5 completionHandler:v7];

  BOOL v8 = [v6 future];

  return v8;
}

- (void)removeRecents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    BOOL v8 = [(CNUICoreRecentsManager *)self workQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke;
    v9[3] = &unk_264018108;
    void v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [v8 performBlock:v9];
  }
}

void __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) recentsLibrary];
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  int v4 = [v2 removeRecentContacts:v3 error:&v11];
  id v5 = v11;

  id v6 = +[CNUICoreLogProvider likenesses_os_log];
  BOOL v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke_cold_1((id *)(a1 + 40), v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134218242;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_20B704000, v7, OS_LOG_TYPE_INFO, "Failed to delete %ld recent(s): %{public}@", buf, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    if (v4) {
      id v10 = 0;
    }
    else {
      id v10 = v5;
    }
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

- (void)removeRecentsWithIdentifiers:(id)a3 domain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    id v11 = [(CNUICoreRecentsManager *)self workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __80__CNUICoreRecentsManager_removeRecentsWithIdentifiers_domain_completionHandler___block_invoke;
    v12[3] = &unk_264018130;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [v11 performBlock:v12];
  }
}

void __80__CNUICoreRecentsManager_removeRecentsWithIdentifiers_domain_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentsLibrary];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = 0;
  int v5 = [v2 removeRecentContactsWithRecentIDs:v3 recentsDomain:v4 error:&v9];
  id v6 = v9;

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    if (v5) {
      id v8 = 0;
    }
    else {
      id v8 = v6;
    }
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (id)restoreRecents:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUICoreRecentsManager *)self recentsLibrary];
  id v6 = [v5 restorePreviouslyDeletedRecentContacts:v4];

  return v6;
}

+ (id)queryForHandles:(id)a3
{
  return (id)[a1 queryForHandles:a3 sorted:0];
}

+ (id)queryForHandles:(id)a3 sorted:(BOOL)a4
{
  id v6 = [a1 predicateForSearchingHandlesForAllSupportedKinds:a3];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F37DC0]);
    [v7 setSearchPredicate:v6];
    id v8 = [a1 supportedRecentsDomains];
    [v7 setDomains:v8];

    if (a4)
    {
      id v9 = [MEMORY[0x263F37DC0] frecencyComparator];
      [v7 setComparator:v9];
    }
    else
    {
      [v7 setComparator:0];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)predicateForSearchingHandlesForAllSupportedKinds:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    int v5 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x263F37DB8] predicateForKey:*MEMORY[0x263F37D68] inCollection:v4];
    id v7 = (void *)MEMORY[0x263F37DB8];
    uint64_t v8 = *MEMORY[0x263F37D78];
    id v9 = [a1 supportedRecentsKinds];
    id v10 = [v7 predicateForKey:v8 inCollection:v9];

    id v11 = (void *)MEMORY[0x263F37DB8];
    v14[0] = v10;
    v14[1] = v6;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    int v5 = [v11 predicateSatisfyingAllSubpredicates:v12];
  }
  return v5;
}

+ (id)supportedRecentsDomains
{
  v5[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F37DA0];
  v5[0] = *MEMORY[0x263F37D98];
  v5[1] = v2;
  v5[2] = *MEMORY[0x263F37D88];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  return v3;
}

+ (id)supportedRecentsKinds
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F37D58];
  v5[0] = *MEMORY[0x263F37D48];
  v5[1] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  return v3;
}

+ (id)supportedPropertyDescriptions
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFE9C8] emailAddressesDescription];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFE9C8] phoneNumbersDescription];
  v6[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)transformForPropertyDescription:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFE9C8] emailAddressesDescription];

  if (v4 == v3)
  {
    id v6 = &__block_literal_global_40;
  }
  else
  {
    id v5 = [MEMORY[0x263EFE9C8] phoneNumbersDescription];

    if (v5 == v3) {
      id v6 = &__block_literal_global_45;
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

- (CRRecentContactsLibrary)recentsLibrary
{
  return self->_recentsLibrary;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_recentsLibrary, 0);
}

- (void)recentContactsMatchingAllPropertiesOfContact:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_20B704000, v0, v1, "No property to search CoreRecents for in contact %@", v2);
}

- (void)recentContactsMatchingAllPropertiesOfContact:.cold.2()
{
}

- (void)sortedRecentHandlesMatchingAllPropertiesOfContact:.cold.2()
{
}

- (void)recentContactsMatchingContactProperties:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_20B704000, v0, v1, "No property to search CoreRecents for in %@", v2);
}

- (void)recentsContactsMatchingHandles:(os_log_t)log sorted:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "No property to search CoreRecents for", v1, 2u);
}

- (void)recentsContactsMatchingHandles:(NSObject *)a3 sorted:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = [a1 predicate];
  OUTLINED_FUNCTION_1_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_20B704000, a3, OS_LOG_TYPE_DEBUG, "Searching CoreRecents with query predicate %@ for handles %@", v6, 0x16u);
}

void __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke_30_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_20B704000, a2, v3, "Searching CoreRecents succeeded, got %ld contact(s)!", v4);
}

void __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [*a1 count];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_20B704000, a2, v3, "Deleted %ld recent(s)", v4);
}

@end