@interface CADFullLoggingSpotlightIndex
- (CADFullLoggingSpotlightIndex)initWithIndex:(id)a3;
- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4;
@end

@implementation CADFullLoggingSpotlightIndex

- (CADFullLoggingSpotlightIndex)initWithIndex:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADFullLoggingSpotlightIndex;
  v6 = [(CADFullLoggingSpotlightIndex *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedIndex, a3);
  }

  return v7;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = v8;
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = [v6 count];
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_INFO, "deleteSearchableItems called with %lu domain identifiers: %@", buf, 0x16u);
  }
  wrappedIndex = self->_wrappedIndex;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__CADFullLoggingSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_1E624EB90;
  id v13 = v7;
  id v11 = v7;
  [(CADSpotlightIndex *)wrappedIndex deleteSearchableItemsWithDomainIdentifiers:v6 completionHandler:v12];
}

void __93__CADFullLoggingSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_INFO, "deleteSearchableItems finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  v24 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  id v6 = (void *)CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = [v5 count];
    _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_INFO, "indexSearchableItems called with %lu searchable items: [", buf, 0xCu);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "attributeSet", v24);
        uint64_t v15 = [v14 attributeDictionary];
        __int16 v16 = (void *)[v15 mutableCopy];

        [v16 removeObjectForKey:@"_kMDItemProviderDataTypes"];
        id v17 = (void *)CADSpotlightHandle;
        if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = v17;
          v19 = [v13 attributeSet];
          v20 = [v19 customAttributeDictionary];
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = (uint64_t)v16;
          __int16 v34 = 2112;
          v35 = v20;
          _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_INFO, "Item %@\n%@", buf, 0x16u);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  v21 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_INFO, "]", buf, 2u);
  }
  wrappedIndex = v24->_wrappedIndex;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__CADFullLoggingSpotlightIndex_indexSearchableItems_completionHandler___block_invoke;
  v26[3] = &unk_1E624EB90;
  id v27 = v25;
  id v23 = v25;
  [(CADSpotlightIndex *)wrappedIndex indexSearchableItems:v8 completionHandler:v26];
}

void __71__CADFullLoggingSpotlightIndex_indexSearchableItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_INFO, "indexSearchableItems finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_INFO, "deleteSearchableItemsForBundleID called with bundle id: %@", buf, 0xCu);
  }
  wrappedIndex = self->_wrappedIndex;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__CADFullLoggingSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke;
  v11[3] = &unk_1E624EB90;
  id v12 = v7;
  id v10 = v7;
  [(CADSpotlightIndex *)wrappedIndex deleteAllSearchableItemsForBundleID:v6 completionHandler:v11];
}

void __86__CADFullLoggingSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_INFO, "deleteAllSearchableItemsForBundleID finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end