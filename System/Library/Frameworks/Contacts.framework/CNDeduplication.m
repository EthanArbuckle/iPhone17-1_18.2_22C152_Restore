@interface CNDeduplication
+ (id)os_log;
- (id)contactsForGroup:(id)a3 store:(id)a4;
- (id)identifierSetFromContacts:(id)a3;
- (void)addContactsForIds:(id)a3 toGroup:(id)a4 usingRequest:(id)a5 store:(id)a6;
- (void)deduplicateAllContainers:(id)a3;
- (void)deduplicateContainer:(id)a3 store:(id)a4;
- (void)deduplicateKeeping:(id)a3 deleting:(id)a4 store:(id)a5;
@end

@implementation CNDeduplication

+ (id)os_log
{
  if (os_log_cn_once_token_0_9 != -1) {
    dispatch_once(&os_log_cn_once_token_0_9, &__block_literal_global_59);
  }
  v2 = (void *)os_log_cn_once_object_0_9;

  return v2;
}

uint64_t __25__CNDeduplication_os_log__block_invoke()
{
  os_log_cn_once_object_0_9 = (uint64_t)os_log_create("com.apple.contacts", "dedupe-groups");

  return MEMORY[0x1F41817F8]();
}

- (void)deduplicateAllContainers:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Deduplicating groups for store %@", buf, 0xCu);
  }

  v6 = [v4 containersMatchingPredicate:0 error:0];
  v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_5_1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__CNDeduplication_deduplicateAllContainers___block_invoke_2;
  v9[3] = &unk_1E56B6450;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v7, "_cn_each:", v9);
}

uint64_t __44__CNDeduplication_deduplicateAllContainers___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 permissions];
  uint64_t v3 = [v2 canCreateGroups];

  return v3;
}

void __44__CNDeduplication_deduplicateAllContainers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a2 identifier];
  [v3 deduplicateContainer:v4 store:*(void *)(a1 + 40)];
}

- (void)deduplicateContainer:(id)a3 store:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25 = self;
  id v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Deduplicating container %@ in store %@", buf, 0x16u);
  }

  v24 = v6;
  +[CNGroup predicateForGroupsInContainerWithIdentifier:v6];
  v23 = v9 = v7;
  id v10 = objc_msgSend(v7, "groupsMatchingPredicate:error:");
  v11 = (void *)[v10 mutableCopy];

  [v11 sortUsingComparator:&__block_literal_global_9_0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v15 = 0;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v19 = [v15 name];
        v20 = [v18 name];
        int v21 = [v19 isEqualToString:v20];

        if (v21)
        {
          [(CNDeduplication *)v25 deduplicateKeeping:v15 deleting:v18 store:v9];
        }
        else
        {
          id v22 = v18;

          v15 = v22;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }
}

uint64_t __46__CNDeduplication_deduplicateContainer_store___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)deduplicateKeeping:(id)a3 deleting:(id)a4 store:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNDeduplication *)self contactsForGroup:v8 store:v10];
  long long v29 = [(CNDeduplication *)self contactsForGroup:v9 store:v10];
  id v12 = -[CNDeduplication identifierSetFromContacts:](self, "identifierSetFromContacts:");
  uint64_t v13 = (void *)[v12 mutableCopy];

  uint64_t v14 = [(CNDeduplication *)self identifierSetFromContacts:v11];
  [v13 minusSet:v14];
  v15 = objc_alloc_init(CNSaveRequest);
  uint64_t v16 = [v13 count];
  v17 = objc_msgSend((id)objc_opt_class(), "os_log");
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      uint64_t v19 = [v13 count];
      [v9 name];
      long long v28 = v14;
      id v20 = v8;
      v22 = int v21 = v11;
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      id v34 = v22;
      _os_log_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEFAULT, "Need to adjust membership of %lu contacts before deleting duplicate group %@", buf, 0x16u);

      v11 = v21;
      id v8 = v20;
      uint64_t v14 = v28;
    }

    v17 = [v13 allObjects];
    [(CNDeduplication *)self addContactsForIds:v17 toGroup:v8 usingRequest:v15 store:v10];
  }
  else if (v18)
  {
    v23 = [v9 name];
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = (uint64_t)v23;
    _os_log_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEFAULT, "No membership adjustment needed before deleting duplicate group %@", buf, 0xCu);
  }
  v24 = (void *)[v9 mutableCopy];
  [(CNSaveRequest *)v15 deleteGroup:v24];

  id v30 = 0;
  LODWORD(v24) = [v10 executeSaveRequest:v15 error:&v30];
  id v25 = v30;
  long long v26 = v25;
  if (!v24 || v25)
  {
    long long v27 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = (uint64_t)v26;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1909E3000, v27, OS_LOG_TYPE_DEFAULT, "Unexpected error:%{public}@ cleaning up group for deduplication:%@", buf, 0x16u);
    }
  }
}

- (id)contactsForGroup:(id)a3 store:(id)a4
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  id v9 = [CNContactFetchRequest alloc];
  id v10 = [(CNContactFetchRequest *)v9 initWithKeysToFetch:MEMORY[0x1E4F1CBF0]];
  v11 = [v5 identifier];
  id v12 = +[CNContact predicateForContactsInGroupWithIdentifier:v11];
  [(CNContactFetchRequest *)v10 setPredicate:v12];

  [(CNContactFetchRequest *)v10 setUnifyResults:0];
  id v22 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __42__CNDeduplication_contactsForGroup_store___block_invoke;
  id v20 = &unk_1E56B6498;
  id v13 = v8;
  id v21 = v13;
  [v7 enumerateContactsWithFetchRequest:v10 error:&v22 usingBlock:&v17];

  id v14 = v22;
  if (v14)
  {
    v15 = objc_msgSend((id)objc_opt_class(), "os_log", v17, v18, v19, v20);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CNDeduplication contactsForGroup:store:]();
    }
  }

  return v13;
}

uint64_t __42__CNDeduplication_contactsForGroup_store___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)addContactsForIds:(id)a3 toGroup:(id)a4 usingRequest:(id)a5 store:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = [CNContactFetchRequest alloc];
  id v14 = [(CNContactFetchRequest *)v13 initWithKeysToFetch:MEMORY[0x1E4F1CBF0]];
  v15 = +[CNContact predicateForContactsWithIdentifiers:v12];

  [(CNContactFetchRequest *)v14 setPredicate:v15];
  [(CNContactFetchRequest *)v14 setUnifyResults:0];
  id v23 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__CNDeduplication_addContactsForIds_toGroup_usingRequest_store___block_invoke;
  v20[3] = &unk_1E56B44E0;
  id v16 = v10;
  id v21 = v16;
  id v17 = v9;
  id v22 = v17;
  [v11 enumerateContactsWithFetchRequest:v14 error:&v23 usingBlock:v20];

  id v18 = v23;
  if (v18)
  {
    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CNDeduplication addContactsForIds:toGroup:usingRequest:store:]();
    }
  }
}

uint64_t __64__CNDeduplication_addContactsForIds_toGroup_usingRequest_store___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addMember:a2 toGroup:*(void *)(a1 + 40)];
}

- (id)identifierSetFromContacts:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = objc_msgSend(a3, "_cn_map:", CNContactToIdentifier);
  id v5 = [v3 setWithArray:v4];

  return v5;
}

- (void)contactsForGroup:store:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Unexpected error:%{public}@  getting contacts for group: %@");
}

- (void)addContactsForIds:toGroup:usingRequest:store:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Unexpected error:%{public}@ getting contacts to add to group:%@");
}

@end