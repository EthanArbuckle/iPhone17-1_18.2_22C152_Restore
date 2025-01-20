@interface CNContactStore(Sanitization)
- (id)fetchContactsWithIdentifiers:()Sanitization error:;
- (id)sanitizeContacts:()Sanitization;
@end

@implementation CNContactStore(Sanitization)

- (id)sanitizeContacts:()Sanitization
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [MEMORY[0x1E4F1CA80] set];
    v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = [MEMORY[0x1E4F1CA80] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 needsSanitization])
          {
            v14 = [v13 contactIdentifier];
            [v7 addObject:v14];
          }
          else
          {
            [v6 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      id v20 = 0;
      v15 = [a1 fetchContactsWithIdentifiers:v7 error:&v20];
      id v16 = v20;
      if (v16)
      {
        v17 = DNDSLogSettings;
        if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
          -[CNContactStore(Sanitization) sanitizeContacts:]((uint64_t)v16, v17);
        }
      }
      else
      {
        [v5 unionSet:v15];
        [v5 unionSet:v6];
        id v8 = v5;
      }
      id v18 = v8;
    }
    else
    {
      id v18 = v8;
    }
  }
  else
  {
    id v18 = v4;
  }

  return v18;
}

- (id)fetchContactsWithIdentifiers:()Sanitization error:
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__10;
  long long v22 = __Block_byref_object_dispose__10;
  id v23 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  id v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  v7 = [v6 allObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke;
  v11[3] = &unk_1E6974910;
  v11[4] = a1;
  v11[5] = &v18;
  v11[6] = &v12;
  [v7 enumerateBatchesOfSize:10 handler:v11];

  if (a4)
  {
    id v8 = (void *)v13[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void)sanitizeContacts:()Sanitization .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Could not sanitize contacts; will use existing data this time: %{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end