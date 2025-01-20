@interface MDExtensionLoader
@end

@implementation MDExtensionLoader

void __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E554C7E8;
  id v12 = v6;
  id v8 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v8;
  uint64_t v13 = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2(uint64_t *a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  if (a1[4])
  {
    v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2_cold_1(a1 + 4, v3);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    id v10 = 0;
    id v11 = 0;
    id v6 = [v4 _filterIndexExtensions:v5 outFileProviderBundleMap:&v11 outFileProviderBundleIDs:&v10];
    id v7 = v11;
    id v8 = v10;
    uint64_t v9 = a1[7];
    if (v9) {
      (*(void (**)(uint64_t, void *, id, id, void))(v9 + 16))(v9, v6, v7, v8, 0);
    }
  }
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) matchingContext];

  v3 = logForCSLogCategoryDefault();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_cold_1(v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D0E3000, v4, OS_LOG_TYPE_DEFAULT, "Started looking for indexing extensions", buf, 2u);
    }

    uint64_t v5 = (void *)MEMORY[0x1E4F28C70];
    id v6 = [(id)objc_opt_class() _matchDictionary];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_48;
    id v12 = &unk_1E554C810;
    id v7 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v7;
    id v8 = [v5 beginMatchingExtensionsWithAttributes:v6 completion:&v9];
    objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", v8, v9, v10, v11, v12, v13);
  }
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEFAULT, "beginMatchingExtensionsWithAttributes %@ %@", buf, 0x16u);
  }

  id v8 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_49;
  v12[3] = &unk_1E554C7E8;
  id v13 = v6;
  id v9 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v9;
  uint64_t v14 = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_49(uint64_t *a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  if (a1[4])
  {
    v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_49_cold_1(a1 + 4, v3);
    }

    uint64_t v4 = a1[7];
    if (v4) {
      (*(void (**)(uint64_t, void, void, void, uint64_t))(v4 + 16))(v4, 0, 0, 0, a1[4]);
    }
  }
  else
  {
    id v5 = (void *)a1[5];
    uint64_t v6 = a1[6];
    id v11 = 0;
    id v12 = 0;
    id v7 = [v5 _filterIndexExtensions:v6 outFileProviderBundleMap:&v12 outFileProviderBundleIDs:&v11];
    id v8 = v12;
    id v9 = v11;
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, void *, id, id, void))(v10 + 16))(v10, v7, v8, v9, 0);
    }
  }
}

void __46___MDExtensionLoader_stopLookingForExtensions__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  v3 = [*(id *)(a1 + 32) matchingContext];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C70];
    id v5 = [*(id *)(a1 + 32) matchingContext];
    [v4 endMatchingExtensions:v5];

    [*(id *)(a1 + 32) setMatchingContext:0];
  }
}

void __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Failed to find index extensions, error:%@", (uint8_t *)&v3, 0xCu);
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Already looking for indexing extensions", v1, 2u);
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_49_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Failed to find indexing extensions, error:%@", (uint8_t *)&v3, 0xCu);
}

@end