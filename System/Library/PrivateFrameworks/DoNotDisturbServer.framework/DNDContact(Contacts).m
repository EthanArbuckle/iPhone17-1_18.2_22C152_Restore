@interface DNDContact(Contacts)
+ (id)contactWithCNContact:()Contacts;
+ (id)keysToFetch;
- (id)sanitizedContactWithContactStore:()Contacts withError:;
@end

@implementation DNDContact(Contacts)

+ (id)contactWithCNContact:()Contacts
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F5F6F0]);
  v5 = [v3 identifier];
  [v4 setContactIdentifier:v5];

  v6 = [v3 givenName];
  [v4 setFirstName:v6];

  v7 = [v3 middleName];
  [v4 setMiddleName:v7];

  v8 = [v3 familyName];
  [v4 setLastName:v8];

  v9 = [v3 nickname];
  [v4 setNickName:v9];

  v10 = [v3 organizationName];
  [v4 setOrganizationName:v10];

  v11 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v12 = [v3 emailAddresses];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v34 + 1) + 8 * i) value];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v14);
  }

  [v4 setEmailAddresses:v11];
  v18 = [MEMORY[0x1E4F1CA80] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v29 = v3;
  v19 = [v3 phoneNumbers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v30 + 1) + 8 * j) value];
        v25 = [v24 stringValue];

        v26 = [MEMORY[0x1E4F5F5C0] normalizePhoneNumber:v25];
        [v18 addObject:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  [v4 setPhoneNumbers:v18];
  v27 = (void *)[v4 copy];

  return v27;
}

+ (id)keysToFetch
{
  if (keysToFetch_onceToken != -1) {
    dispatch_once(&keysToFetch_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)keysToFetch_keys;
  return v0;
}

- (id)sanitizedContactWithContactStore:()Contacts withError:
{
  id v6 = a3;
  id v7 = a1;
  v8 = [MEMORY[0x1E4F5F5C0] keysToFetch];
  id v9 = [v7 contactIdentifier];
  if (!v9) {
    goto LABEL_5;
  }
  v10 = [v7 phoneNumbers];
  if ([v10 count])
  {
    v11 = [v7 emailAddresses];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      id v9 = 0;
LABEL_5:
      uint64_t v13 = v7;
      goto LABEL_14;
    }
  }
  else
  {
  }
  uint64_t v14 = [v7 contactIdentifier];
  id v18 = 0;
  uint64_t v15 = [v6 unifiedContactWithIdentifier:v14 keysToFetch:v8 error:&v18];
  id v9 = v18;

  uint64_t v13 = v7;
  if (v15)
  {
    uint64_t v13 = [MEMORY[0x1E4F5F5C0] contactWithCNContact:v15];
  }
  if (v9)
  {
    v16 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
    {
      -[DNDContact(Contacts) sanitizedContactWithContactStore:withError:]((uint64_t)v7, (uint64_t)v9, v16);
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if (a4) {
LABEL_12:
    }
      *a4 = v9;
  }
LABEL_13:

LABEL_14:
  return v13;
}

- (void)sanitizedContactWithContactStore:()Contacts withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Sanitizing contact %{public}@ failed: error=%{public}@", (uint8_t *)&v3, 0x16u);
}

@end