@interface CNUICoreContactRefetcher
+ (id)contactsByReplacingContacts:(id)a3 withContactsHavingMatchingIdentifier:(id)a4;
+ (id)contactsFoundAndNotFoundByPartioningContacts:(id)a3 usingFoundContacts:(id)a4;
+ (id)refetchedContacts:(id)a3 fromStore:(id)a4 keysToFetch:(id)a5;
- (CNUICoreContactRefetcher)init;
- (CNUICoreContactRefetcher)initWithContactStore:(id)a3 contactsToRefetch:(id)a4;
- (CNUICoreContactRefetcher)initWithContactStore:(id)a3 contactsToRefetch:(id)a4 keysToFetch:(id)a5;
- (CNUICoreContactStoreFacade)contactStore;
- (NSArray)contactsToRefetch;
- (NSArray)keysToFetch;
- (id)allContacts;
- (id)contactsFoundAndNotFound;
- (id)foundContacts;
@end

@implementation CNUICoreContactRefetcher

- (CNUICoreContactRefetcher)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactRefetcher)initWithContactStore:(id)a3 contactsToRefetch:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263EFEA28];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 keyVectorWithAllKeys];
  v13[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11 = [(CNUICoreContactRefetcher *)self initWithContactStore:v8 contactsToRefetch:v7 keysToFetch:v10];

  return v11;
}

- (CNUICoreContactRefetcher)initWithContactStore:(id)a3 contactsToRefetch:(id)a4 keysToFetch:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_51);
  }
  v12 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v10) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_51);
  }
  v20 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](v20, v21, v22, v23, v24, v25, v26, v27);
  }
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_51);
    }
    v28 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v40 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"contactsToRefetch cannot be empty" userInfo:0];
    objc_exception_throw(v40);
  }
  v41.receiver = self;
  v41.super_class = (Class)CNUICoreContactRefetcher;
  v36 = [(CNUICoreContactRefetcher *)&v41 init];
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_contactStore, a3);
    objc_storeStrong((id *)&v37->_contactsToRefetch, a4);
    objc_storeStrong((id *)&v37->_keysToFetch, a5);
    v38 = v37;
  }

  return v37;
}

- (id)allContacts
{
  id v3 = [(CNUICoreContactRefetcher *)self foundContacts];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__CNUICoreContactRefetcher_allContacts__block_invoke;
  v6[3] = &unk_264017648;
  v6[4] = self;
  v4 = [v3 map:v6];

  return v4;
}

id __39__CNUICoreContactRefetcher_allContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  v5 = [*(id *)(a1 + 32) contactsToRefetch];
  v6 = [v4 contactsByReplacingContacts:v5 withContactsHavingMatchingIdentifier:v3];

  return v6;
}

- (id)foundContacts
{
  v2 = [(CNUICoreContactRefetcher *)self contactsFoundAndNotFound];
  id v3 = [v2 map:&__block_literal_global_7];

  return v3;
}

uint64_t __41__CNUICoreContactRefetcher_foundContacts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 first];
}

- (id)contactsFoundAndNotFound
{
  id v3 = objc_opt_class();
  v4 = [(CNUICoreContactRefetcher *)self contactsToRefetch];
  v5 = [(CNUICoreContactRefetcher *)self contactStore];
  v6 = [(CNUICoreContactRefetcher *)self keysToFetch];
  id v7 = [v3 refetchedContacts:v4 fromStore:v5 keysToFetch:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__CNUICoreContactRefetcher_contactsFoundAndNotFound__block_invoke;
  v10[3] = &unk_264017690;
  v10[4] = self;
  id v8 = [v7 map:v10];

  return v8;
}

id __52__CNUICoreContactRefetcher_contactsFoundAndNotFound__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  v5 = [*(id *)(a1 + 32) contactsToRefetch];
  v6 = [v4 contactsFoundAndNotFoundByPartioningContacts:v5 usingFoundContacts:v3];

  id v7 = (void *)MEMORY[0x263F33618];
  id v8 = [v6 second];
  id v9 = [v7 pairWithFirst:v3 second:v8];

  return v9;
}

+ (id)refetchedContacts:(id)a3 fromStore:(id)a4 keysToFetch:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263EFEA18];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v7 alloc] initWithKeysToFetch:v8];

  v12 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v13 = objc_msgSend(v10, "_cn_map:", &__block_literal_global_22);

  uint64_t v14 = [v12 predicateForContactsWithIdentifiers:v13];
  [v11 setPredicate:v14];

  [v11 setUnifyResults:0];
  uint64_t v15 = +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:v11 fromStore:v9];

  return v15;
}

+ (id)contactsByReplacingContacts:(id)a3 withContactsHavingMatchingIdentifier:(id)a4
{
  id v5 = a3;
  v6 = objc_msgSend(a4, "_cn_indexBy:", &__block_literal_global_22);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__CNUICoreContactRefetcher_contactsByReplacingContacts_withContactsHavingMatchingIdentifier___block_invoke;
  v10[3] = &unk_2640176B8;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(v5, "_cn_map:", v10);

  return v8;
}

id __93__CNUICoreContactRefetcher_contactsByReplacingContacts_withContactsHavingMatchingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v3 identifier];
  id v5 = [v2 objectForKeyedSubscript:v4];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = v3;
  }
  id v7 = v6;

  return v7;
}

+ (id)contactsFoundAndNotFoundByPartioningContacts:(id)a3 usingFoundContacts:(id)a4
{
  id v5 = a3;
  v6 = objc_msgSend(a4, "_cn_indexBy:", &__block_literal_global_22);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__CNUICoreContactRefetcher_contactsFoundAndNotFoundByPartioningContacts_usingFoundContacts___block_invoke;
  v10[3] = &unk_2640176E0;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(v5, "_cn_partition:", v10);

  return v8;
}

BOOL __92__CNUICoreContactRefetcher_contactsFoundAndNotFoundByPartioningContacts_usingFoundContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

- (CNUICoreContactStoreFacade)contactStore
{
  return self->_contactStore;
}

- (NSArray)contactsToRefetch
{
  return self->_contactsToRefetch;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactsToRefetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithContactStore:(uint64_t)a3 contactsToRefetch:(uint64_t)a4 keysToFetch:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContactStore:(uint64_t)a3 contactsToRefetch:(uint64_t)a4 keysToFetch:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContactStore:(uint64_t)a3 contactsToRefetch:(uint64_t)a4 keysToFetch:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end