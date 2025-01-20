@interface SGContactsInterface
+ (BOOL)enumerateContactsMatchingEmailAddress:(id)a3 withKeysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6 usingBlock:(id)a7;
+ (BOOL)enumerateContactsMatchingName:(id)a3 withKeysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6 usingBlock:(id)a7;
+ (BOOL)enumerateContactsWithFetchRequest:(id)a3 usingContactStore:(id)a4 error:(id *)a5 usingBlock:(id)a6;
+ (BOOL)handleExistsInContactStoreForHandle:(id)a3 withHandleType:(id)a4;
+ (id)identifiersPredicateFromCacheForPredicate:(id)a3 isCached:(BOOL *)a4;
+ (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6;
+ (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6;
+ (id)unifiedMeContactWithKeysToFetch:(id)a3 usingContactStore:(id)a4 error:(id *)a5;
+ (void)clearCache;
+ (void)initialize;
@end

@implementation SGContactsInterface

+ (BOOL)handleExistsInContactStoreForHandle:(id)a3 withHandleType:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F1AEE0];
  if (![v7 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
      goto LABEL_6;
    }
    v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "Unsupported handleType: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v6];
  if (!v9)
  {
    v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGContactsInterface: CNPhoneNumber initWithStringValue returned nil", (uint8_t *)&buf, 2u);
    }
    goto LABEL_18;
  }
  v10 = (void *)v9;
  v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v9];

LABEL_6:
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__11919;
  v36 = __Block_byref_object_dispose__11920;
  id v37 = 0;
  v12 = [(id)_cache resultIfAvailable];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke;
  v27[3] = &unk_1E65BB4E8;
  p_long long buf = &buf;
  v13 = v11;
  v28 = v13;
  [v12 runWithLockAcquired:v27];

  if ([*(id *)(*((void *)&buf + 1) + 40) count])
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v32[0] = *MEMORY[0x1E4F1ADC8];
    v32[1] = v8;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v15];
    [v16 setPredicate:v13];
    v17 = +[SGContactStoreFactory contactStore];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke_2;
    v21[3] = &unk_1E65B7A00;
    v21[4] = &v23;
    id v22 = 0;
    [a1 enumerateContactsWithFetchRequest:v16 usingContactStore:v17 error:&v22 usingBlock:v21];
    id v18 = v22;

    if (v18)
    {
      v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v30 = 138412290;
        id v31 = v18;
        _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "Error enumerating contacts: %@", v30, 0xCu);
      }
    }
    BOOL v14 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&buf, 8);
LABEL_19:

  return v14;
}

uint64_t __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

uint64_t __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

+ (void)clearCache
{
  id v2 = [(id)_cache resultIfAvailable];
  [v2 runWithLockAcquired:&__block_literal_global_30_11926];
}

uint64_t __33__SGContactsInterface_clearCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

+ (BOOL)enumerateContactsMatchingEmailAddress:(id)a3 withKeysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6 usingBlock:(id)a7
{
  v12 = (objc_class *)MEMORY[0x1E4F1B908];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[[v12 alloc] initWithKeysToFetch:v15];

  id v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v16];

  [v17 setPredicate:v18];
  LOBYTE(a6) = [a1 enumerateContactsWithFetchRequest:v17 usingContactStore:v14 error:a6 usingBlock:v13];

  return (char)a6;
}

+ (BOOL)enumerateContactsMatchingName:(id)a3 withKeysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6 usingBlock:(id)a7
{
  v12 = (objc_class *)MEMORY[0x1E4F1B908];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[[v12 alloc] initWithKeysToFetch:v15];

  id v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v16];

  [v17 setPredicate:v18];
  LOBYTE(a6) = [a1 enumerateContactsWithFetchRequest:v17 usingContactStore:v14 error:a6 usingBlock:v13];

  return (char)a6;
}

+ (BOOL)enumerateContactsWithFetchRequest:(id)a3 usingContactStore:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v44[0] = 0;
  id v13 = [v10 predicate];
  id v14 = [a1 identifiersPredicateFromCacheForPredicate:v13 isCached:v44];

  if (v14)
  {
    [v10 setPredicate:v14];
  }
  else if (v44[0])
  {
    char v17 = 1;
    goto LABEL_13;
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__11919;
  uint64_t v38 = __Block_byref_object_dispose__11920;
  id v39 = 0;
  id v15 = objc_opt_new();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke;
  v28[3] = &unk_1E65B79D8;
  id v29 = v11;
  id v16 = v15;
  id v30 = v16;
  id v31 = v12;
  v32 = &v40;
  v33 = &v34;
  char v17 = [v29 enumerateContactsWithFetchRequest:v10 error:a5 usingBlock:v28];
  id v18 = (void *)v35[5];
  if (v18) {
    [v18 raise];
  }
  if (!*((unsigned char *)v41 + 24))
  {
    v19 = [v16 proxyArray];
    if ((unint64_t)[v19 count] > 2
      || ([v10 predicate],
          v20 = objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v19],
          v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v20 isEqual:v21],
          v21,
          v20,
          (v22 & 1) == 0))
    {
      uint64_t v23 = [(id)_cache result];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke_28;
      v25[3] = &unk_1E65BBE38;
      id v26 = v10;
      id v27 = v19;
      [v23 runWithLockAcquired:v25];
    }
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
LABEL_13:

  return v17;
}

void __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)a1[5];
    id v7 = [v5 identifier];
    [v6 addCNContactIdentifier:v7];

    (*(void (**)(void))(a1[6] + 16))();
    if (*a3) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected object returned from Contact Store: %@ Retrieved From %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke_28(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((unint64_t)[v5 count] >= 0x64) {
    [v5 removeAllObjects];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 32) predicate];
  [v5 setObject:v3 forKeyedSubscript:v4];
}

+ (id)identifiersPredicateFromCacheForPredicate:(id)a3 isCached:(BOOL *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__11919;
  uint64_t v23 = __Block_byref_object_dispose__11920;
  id v24 = 0;
  id v6 = [(id)_cache resultIfAvailable];
  if (v6)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__SGContactsInterface_identifiersPredicateFromCacheForPredicate_isCached___block_invoke;
    v16[3] = &unk_1E65BB4E8;
    id v18 = &v19;
    id v17 = v5;
    [v6 runWithLockAcquired:v16];
    id v7 = v17;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F93728] sharedInstance];
    uint64_t v9 = objc_opt_new();
    [v8 trackScalarForMessage:v9 count:0];

    uint64_t v25 = @"ContactsInterfaceCacheHit";
    int v10 = [NSNumber numberWithInt:v20[5] != 0];
    v26[0] = v10;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    AnalyticsSendEvent();
  }

  id v11 = objc_opt_new();
  [v11 setCacheHit:v20[5] != 0];
  __int16 v12 = [MEMORY[0x1E4F93728] sharedInstance];
  [v12 trackScalarForMessage:v11];

  uint64_t v13 = v20;
  if (v20[5])
  {
    *a4 = 1;
    if ([(id)v13[5] count])
    {
      uint64_t v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v20[5]];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    *a4 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __74__SGContactsInterface_identifiersPredicateFromCacheForPredicate_isCached___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F93728];
  id v4 = a2;
  id v5 = [v3 sharedInstance];
  id v6 = objc_opt_new();
  objc_msgSend(v5, "trackScalarForMessage:count:", v6, objc_msgSend(v4, "count"));

  AnalyticsSendEvent();
  uint64_t v7 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

+ (id)unifiedMeContactWithKeysToFetch:(id)a3 usingContactStore:(id)a4 error:(id *)a5
{
  return (id)[a4 _crossPlatformUnifiedMeContactWithKeysToFetch:a3 error:a5];
}

+ (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6
{
  return (id)[a5 unifiedContactWithIdentifier:a3 keysToFetch:a4 error:a6];
}

+ (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v11];

  [v14 setPredicate:v12];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__SGContactsInterface_unifiedContactsMatchingPredicate_keysToFetch_usingContactStore_error___block_invoke;
  v18[3] = &unk_1E65BE608;
  id v15 = v13;
  id v19 = v15;
  [a1 enumerateContactsWithFetchRequest:v14 usingContactStore:v10 error:a6 usingBlock:v18];

  if (*a6) {
    id v16 = 0;
  }
  else {
    id v16 = v15;
  }

  return v16;
}

uint64_t __92__SGContactsInterface_unifiedContactsMatchingPredicate_keysToFetch_usingContactStore_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _cache = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_11954];
    MEMORY[0x1F41817F8]();
  }
}

id __33__SGContactsInterface_initialize__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  v1 = objc_opt_new();
  id v2 = (void *)[v0 initWithGuardedData:v1];

  +[SGCuratedChangeNotifications addAddressBookObserver:&__block_literal_global_8_11959 forObjectLifetime:v2];
  return v2;
}

uint64_t __33__SGContactsInterface_initialize__block_invoke_2()
{
  return +[SGContactsInterface clearCache];
}

@end