@interface EMMessageListChangeObserverHelper
+ (void)collection:(id)a3 notifyChangeObserversAboutChangedItemIDs:(id)a4 extraInfo:(id)a5;
+ (void)collection:(id)a3 notifyChangeObserversAboutChangedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5;
@end

@implementation EMMessageListChangeObserverHelper

+ (void)collection:(id)a3 notifyChangeObserversAboutChangedItemIDs:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 objectForKeyedSubscript:@"changesByObjectID"];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke;
  v14[3] = &unk_1E63E4B80;
  v17 = &v18;
  id v12 = v11;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [v13 enumerateObserversWithBlock:v14];
  [a1 collection:v13 notifyChangeObserversAboutChangedItemIDs:v9 itemIDsWithCountChanges:v19[5]];

  _Block_object_dispose(&v18, 8);
}

void __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke_2;
    v10[3] = &unk_1E63E4B58;
    v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 count];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) itemIDForObjectID:v7];
    if (v6) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    }
  }
}

+ (void)collection:(id)a3 notifyChangeObserversAboutChangedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_itemIDsWithCountChanges___block_invoke;
  v15[3] = &unk_1E63E4BA8;
  SEL v19 = a2;
  id v20 = a1;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v11;
  [v12 enumerateObserversWithBlock:v15];
}

void __113__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_itemIDsWithCountChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    if (!*(void *)(a1 + 32))
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 64) file:@"EMMessageList.m" lineNumber:1501 description:@"itemIDsWithCountChanges cannot be nil if changeObserver responds to collection:changedItemIDs:itemIDsWithCountChanges:"];
    }
    id v4 = +[EMMessageList log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 40) count];
      uint64_t v6 = [*(id *)(a1 + 32) count];
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 64);
      int v16 = 134219010;
      uint64_t v17 = v5;
      __int16 v18 = 2048;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2048;
      id v23 = v3;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      id v9 = v7;
      _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Notifying observer of %lu changed itemIDs (%lu with count changes): <%@: %p>\n%@", (uint8_t *)&v16, 0x34u);
    }
    [v3 collection:*(void *)(a1 + 48) changedItemIDs:*(void *)(a1 + 40) itemIDsWithCountChanges:*(void *)(a1 + 32)];
  }
  else
  {
    id v10 = +[EMMessageList log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 40) count];
      id v12 = objc_opt_class();
      id v13 = *(void **)(a1 + 64);
      int v16 = 134218754;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v12;
      __int16 v20 = 2048;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = v13;
      id v14 = v12;
      _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "Notifying observer of %lu changed itemIDs: <%@: %p>\n%@", (uint8_t *)&v16, 0x2Au);
    }
    [v3 collection:*(void *)(a1 + 48) changedItemIDs:*(void *)(a1 + 40)];
  }
}

@end