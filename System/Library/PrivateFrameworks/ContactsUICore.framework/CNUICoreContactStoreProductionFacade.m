@interface CNUICoreContactStoreProductionFacade
- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (CNContactStore)contactStore;
- (CNUICoreContactStoreProductionFacade)init;
- (CNUICoreContactStoreProductionFacade)initWithContactStore:(id)a3;
- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)containerForContact:(id)a3;
@end

@implementation CNUICoreContactStoreProductionFacade

- (CNUICoreContactStoreProductionFacade)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactStoreProductionFacade)initWithContactStore:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_14 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_14, &__block_literal_global_122);
    }
    v6 = CNGuardOSLog_cn_once_object_0_14;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_14, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CNUICoreContactStoreProductionFacade;
  v14 = [(CNUICoreContactStoreProductionFacade *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactStore, a3);
    v16 = v15;
  }

  return v15;
}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNUICoreContactStoreProductionFacade *)self contactStore];
  uint64_t v8 = [v7 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:a4];

  return v8;
}

- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(CNUICoreContactStoreProductionFacade *)self contactStore];
  LOBYTE(a4) = [v10 enumerateContactsWithFetchRequest:v9 error:a4 usingBlock:v8];

  return (char)a4;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNUICoreContactStoreProductionFacade *)self contactStore];
  LOBYTE(a4) = [v7 executeSaveRequest:v6 error:a4];

  return (char)a4;
}

- (id)containerForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUICoreContactStoreProductionFacade *)self contactStore];
  id v6 = (void *)MEMORY[0x263EFEA80];
  uint64_t v7 = [v4 identifier];

  id v8 = [v6 predicateForContainerOfContactWithIdentifier:v7];
  id v9 = [v5 containersMatchingPredicate:v8 error:0];
  uint64_t v10 = [v9 firstObject];

  return v10;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end