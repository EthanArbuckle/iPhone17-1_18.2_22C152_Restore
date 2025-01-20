@interface CNContactStore
@end

@implementation CNContactStore

void __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = (void *)MEMORY[0x1D9430630]();
  id v7 = objc_alloc(MEMORY[0x1E4F1B908]);
  v8 = [MEMORY[0x1E4F5F5C0] keysToFetch];
  v9 = (void *)[v7 initWithKeysToFetch:v8];

  v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v5];
  [v9 setPredicate:v10];

  [v9 setUnifyResults:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_2;
  v21[3] = &unk_1E69738B0;
  v11 = (void *)a1[4];
  v21[4] = a1[5];
  id v22 = 0;
  int v12 = [v11 enumerateContactsWithFetchRequest:v9 error:&v22 usingBlock:v21];
  id v13 = v22;
  id v14 = v22;
  v15 = DNDSLogSettings;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(*(void *)(a1[5] + 8) + 40);
      v17 = v15;
      uint64_t v18 = [v16 count];
      *(_DWORD *)buf = 134349056;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Fetched %{public}lld sanitizated contacts", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
      __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_cold_1((uint64_t)v14, v15);
    }
    uint64_t v19 = *(void *)(a1[5] + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;

    *a3 = 1;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v13);
  }
}

void __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F5F5C0] contactWithCNContact:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

void __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch sanitized contacts: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end