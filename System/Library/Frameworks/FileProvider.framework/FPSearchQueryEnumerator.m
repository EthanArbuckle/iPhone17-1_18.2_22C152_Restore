@interface FPSearchQueryEnumerator
- (FPSearchQueryEnumerator)initWithSearchQuery:(id)a3 mountPoint:(id)a4;
- (id)_createSearchQuery;
- (id)_fpItemsFromSearchableItems:(id)a3;
- (void)_gatherItemsWithCompletionBlock:(id)a3;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)invalidate;
@end

@implementation FPSearchQueryEnumerator

- (FPSearchQueryEnumerator)initWithSearchQuery:(id)a3 mountPoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPSearchQueryEnumerator;
  v9 = [(FPSearchQueryEnumerator *)&v14 init];
  if (v9)
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[FPSearchQueryEnumerator initWithSearchQuery:mountPoint:]((uint64_t)v9, (uint64_t)v8, v10);
    }

    objc_storeStrong((id *)&v9->_fileProviderSearchQuery, a3);
    uint64_t v11 = [v8 copy];
    mountPoint = v9->_mountPoint;
    v9->_mountPoint = (NSString *)v11;
  }
  return v9;
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v5 = a3;
  v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[FPSearchQueryEnumerator enumerateItemsForObserver:startingAtPage:](v6);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke;
  v8[3] = &unk_1E5AF6430;
  id v9 = v5;
  id v7 = v5;
  [(FPSearchQueryEnumerator *)self _gatherItemsWithCompletionBlock:v8];
}

void __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = fp_current_or_default_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_2(v6, v8);
    }

    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    v13[0] = v6;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"NSFileProviderErrorDomain" code:-1004 userInfo:v10];

    [*(id *)(a1 + 32) finishEnumeratingWithError:v11];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_1(v5, v8);
    }

    [*(id *)(a1 + 32) didEnumerateItems:v5];
    [*(id *)(a1 + 32) finishEnumeratingUpToPage:0];
  }
}

- (void)invalidate
{
  searchQuery = self->_searchQuery;
  if (searchQuery)
  {
    [(CSSearchQuery *)searchQuery cancel];
    v4 = self->_searchQuery;
    self->_searchQuery = 0;
  }
}

- (void)_gatherItemsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FPSearchQueryEnumerator *)self _createSearchQuery];
  id v6 = objc_opt_new();
  id location = 0;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke;
  v16[3] = &unk_1E5AF6458;
  id v7 = v6;
  id v17 = v7;
  [(CSSearchQuery *)v5 setFoundItemsHandler:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke_2;
  v12[3] = &unk_1E5AF6480;
  objc_copyWeak(&v15, &location);
  id v8 = v4;
  id v14 = v8;
  id v9 = v7;
  id v13 = v9;
  [(CSSearchQuery *)v5 setCompletionHandler:v12];
  [(CSSearchQuery *)v5 start];
  searchQuery = self->_searchQuery;
  self->_searchQuery = v5;
  uint64_t v11 = v5;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));
    id v5 = [v4 _fpItemsFromSearchableItems:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (WeakRetained)
    {
      id v6 = (void *)WeakRetained[3];
      WeakRetained[3] = 0;
    }
  }
}

- (id)_createSearchQuery
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  id v5 = (void *)getCSSearchQueryContextClass_softClass_1;
  uint64_t v39 = getCSSearchQueryContextClass_softClass_1;
  if (!getCSSearchQueryContextClass_softClass_1)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getCSSearchQueryContextClass_block_invoke_1;
    v34 = &unk_1E5AF1950;
    v35 = &v36;
    __getCSSearchQueryContextClass_block_invoke_1((uint64_t)&v31);
    id v5 = (void *)v37[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v36, 8);
  id v7 = objc_opt_new();
  id v8 = FPDefaultFetchedAttributes();
  [v7 setFetchAttributes:v8];

  id v9 = objc_opt_new();
  if (self->_mountPoint)
  {
    v42[0] = self->_mountPoint;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v7 setMountPoints:v10];
  }
  v41 = v4;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  uint64_t v12 = FPFileProviderOriginatedItemsQueryStringFragment((void *)v11);

  [v9 addObject:v12];
  id v13 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery filename];
  LOBYTE(v11) = v13 == 0;

  if ((v11 & 1) == 0)
  {
    id v14 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery filename];
    id v15 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery keyboardLanguage];
    v16 = FPSpotlightQueryStringForFilename(v14, v15);

    [v9 addObject:v16];
  }
  id v17 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery allowedContentTypes];
  v18 = [v17 allObjects];
  v19 = FPContentTypeQueryStringForFileTypes(v18, MEMORY[0x1E4F1CBF0]);

  [v9 addObject:v19];
  v20 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery csQueryScopes];
  [v7 setScopes:v20];

  if ([(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery trashedItemsMembership])
  {
    v21 = FPIsTrashedQueryStringFragment([(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery trashedItemsMembership] == 2);
    [v9 addObject:v21];
  }
  v22 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery scopeFragment];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    v24 = [(NSFileProviderSearchQuery *)self->_fileProviderSearchQuery scopeFragment];
    [v9 addObject:v24];
  }
  v25 = [v9 componentsJoinedByString:@" && "];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  v26 = (void *)getCSSearchQueryClass_softClass_1;
  uint64_t v39 = getCSSearchQueryClass_softClass_1;
  if (!getCSSearchQueryClass_softClass_1)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getCSSearchQueryClass_block_invoke_1;
    v34 = &unk_1E5AF1950;
    v35 = &v36;
    __getCSSearchQueryClass_block_invoke_1((uint64_t)&v31);
    v26 = (void *)v37[3];
  }
  v27 = v26;
  _Block_object_dispose(&v36, 8);
  v28 = (void *)[[v27 alloc] initWithQueryString:v25 context:v7];
  uint64_t v40 = *MEMORY[0x1E4F28358];
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [v28 setProtectionClasses:v29];

  return v28;
}

- (id)_fpItemsFromSearchableItems:(id)a3
{
  return (id)objc_msgSend(a3, "fp_map:", &__block_literal_global_61);
}

FPItem *__55__FPSearchQueryEnumerator__fpItemsFromSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FPItem alloc] initWithSearchableItem:v2];
  if (!v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__FPSearchQueryEnumerator__fpItemsFromSearchableItems___block_invoke_cold_1();
    }
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);

  objc_storeStrong((id *)&self->_fileProviderSearchQuery, 0);
}

- (void)initWithSearchQuery:(NSObject *)a3 mountPoint:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_2();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] New %@ for mount point: %@", v7, 0x16u);
}

- (void)enumerateItemsForObserver:(os_log_t)log startingAtPage:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Enumerating items ...", v1, 2u);
}

void __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully enumerated %ld items", v3, 0xCu);
}

void __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Error occurred while enumerating items: %@", v4, 0xCu);
}

void __55__FPSearchQueryEnumerator__fpItemsFromSearchableItems___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Unable to transform searchable item to FileProvider item: %@", v1, 0xCu);
}

@end