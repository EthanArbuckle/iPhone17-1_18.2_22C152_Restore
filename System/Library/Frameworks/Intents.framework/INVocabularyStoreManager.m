@interface INVocabularyStoreManager
@end

@implementation INVocabularyStoreManager

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v6 = *(void **)(a1 + 32);
    id v22 = 0;
    v7 = [v6 contentsOfDirectoryAtPath:a2 error:&v22];
    id v8 = v22;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14, (void)v18) & 1) == 0)
          {
            v5[2](v5, v14);
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {

              goto LABEL_19;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if (!v8) {
      goto LABEL_19;
    }
    v15 = [v8 domain];
    if ([v15 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v16 = [v8 code];

      if (v16 == 260)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[_INVocabularyStoreManager _iterateVocabularyWithSummary:optionalBlock:]_block_invoke";
      __int16 v25 = 2114;
      id v26 = v8;
      _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s Error listing user-vocabulary directories %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:
}

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) containsObject:v3])
  {
    id v8 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v3];
    id v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "+[_INVocabularyStoreManager _iterateVocabularyWithSummary:optionalBlock:]_block_invoke";
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_error_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_ERROR, "%s Removing invalid user-vocabulary directory %{public}@", buf, 0x16u);
    }
    uint64_t v10 = *(void **)(a1 + 64);
    id v13 = 0;
    char v11 = [v10 removeItemAtPath:v8 error:&v13];
    id v7 = v13;
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "+[_INVocabularyStoreManager _iterateVocabularyWithSummary:optionalBlock:]_block_invoke";
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Error removing invalid user-vocabulary directory %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_10;
  }
  [*(id *)(a1 + 40) addObject:v3];
  if (*(void *)(a1 + 72))
  {
    v4 = _INVocabularyStringTypeFromSlotName(v3);
    [v4 unsignedIntegerValue];

    v5 = *(void **)(a1 + 88);
    v6 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v3];
    id v7 = [v5 _latestVocabularyStringsAt:v6];

    char v14 = 0;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_10:
  }
}

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  if (*(void *)(a1 + 40)) {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_3;
  v15 = &unk_1E55164F8;
  id v16 = *(id *)(a1 + 48);
  id v6 = v4;
  id v17 = v6;
  id v7 = *(id *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 96);
  id v21 = v7;
  uint64_t v23 = v8;
  id v9 = v3;
  id v18 = v9;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 88);
  id v19 = v10;
  uint64_t v22 = v11;
  id v20 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, id, uint64_t *))(v5 + 16))(v5, v9, &v12);
  if (objc_msgSend(v6, "count", v12, v13, v14, v15)) {
    [*(id *)(a1 + 40) setValue:v6 forKey:*(void *)(a1 + 56)];
  }
}

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v3];
  uint64_t v5 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_2;
  v9[3] = &unk_1E5516520;
  id v10 = v4;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  id v13 = v3;
  long long v17 = *(_OWORD *)(a1 + 80);
  id v14 = *(id *)(a1 + 56);
  id v6 = *(void (**)(uint64_t, id, void *))(v5 + 16);
  id v7 = v3;
  id v8 = v4;
  v6(v5, v8, v9);
}

void __81___INVocabularyStoreManager_writeLatestVocabularyItems_forIntentSlot_completion___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = _INVocabularyStringTypeFromSlotName(*(void **)(a1 + 32));
  if (v2)
  {
    [*(id *)(a1 + 40) _writeLatestVocabularyItems:*(void *)(a1 + 48) forIntentSlot:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    id v6 = [NSString stringWithFormat:@"Unknown sync slot '%@'", *(void *)(a1 + 32), @"reason"];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v4 errorWithDomain:v5 code:514 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v8);
  }
}

uint64_t __69___INVocabularyStoreManager_checkIfSyncSlot_isAllowedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68___INVocabularyStoreManager_deleteAllUserVocabularyFromAllAppsAsync__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _customVocabularyDirectory];
  v2 = INRemoveItemAtPath(v1);

  uint64_t v3 = INSiriLogContextIntents;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      uint64_t v5 = "+[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_error_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_ERROR, "%s Failed to delete all user vocabulary with error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "+[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]_block_invoke";
    _os_log_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_INFO, "%s Finished deleting all user vocabulary", (uint8_t *)&v4, 0xCu);
  }
}

void __46___INVocabularyStoreManager__globalClassQueue__block_invoke(uint64_t a1)
{
  id v3 = [NSString stringWithFormat:@"%@.global", *(void *)(a1 + 32)];
  dispatch_queue_t v1 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
  v2 = (void *)_globalClassQueue_stGlobalClassQueue;
  _globalClassQueue_stGlobalClassQueue = (uint64_t)v1;
}

@end