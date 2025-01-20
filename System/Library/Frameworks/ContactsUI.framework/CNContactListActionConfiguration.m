@interface CNContactListActionConfiguration
+ (id)log;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNContactStoreFilter)contactStoreFilter;
- (CNContactViewCache)contactViewCache;
- (CNUIContactsEnvironment)environment;
- (id)containerForContainerIdentifier:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactStoreFilter:(id)a3;
- (void)setContactViewCache:(id)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation CNContactListActionConfiguration

+ (id)log
{
  if (log_cn_once_token_1_65461 != -1) {
    dispatch_once(&log_cn_once_token_1_65461, &__block_literal_global_65462);
  }
  v2 = (void *)log_cn_once_object_1_65463;

  return v2;
}

void __39__CNContactListActionConfiguration_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNContactListActionConfiguration");
  v1 = (void *)log_cn_once_object_1_65463;
  log_cn_once_object_1_65463 = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreFilter, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setContactStoreFilter:(id)a3
{
}

- (CNContactStoreFilter)contactStoreFilter
{
  return self->_contactStoreFilter;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactViewCache:(id)a3
{
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setEnvironment:(id)a3
{
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (id)containerForContainerIdentifier:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    v5 = (void *)MEMORY[0x1E4F1B9B0];
    v19[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v7 = [v5 predicateForContainersWithIdentifiers:v6];

    v8 = [(CNContactListActionConfiguration *)self contactStore];
    id v14 = 0;
    v9 = [v8 containersMatchingPredicate:v7 error:&v14];
    id v10 = v14;

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Error fetching container for container identifier:%@, error: %@", buf, 0x16u);
      }

      v12 = 0;
    }
    else
    {
      v12 = [v9 firstObject];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end