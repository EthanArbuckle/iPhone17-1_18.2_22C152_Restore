@interface CNContainerDataSource
+ (id)os_log;
- (BOOL)ignoresExchangeContainers;
- (CNContactStore)store;
- (CNContactViewCache)contactViewCache;
- (CNContainerDataSource)initWithContactStore:(id)a3;
- (NSArray)containerPickerItems;
- (NSArray)containers;
- (id)allAccounts;
- (id)writableContainersForAccount:(id)a3;
- (void)discoverContainers;
- (void)setContactViewCache:(id)a3;
- (void)setContainerPickerItems:(id)a3;
- (void)setContainers:(id)a3;
- (void)setIgnoresExchangeContainers:(BOOL)a3;
- (void)setStore:(id)a3;
@end

@implementation CNContainerDataSource

- (void)setIgnoresExchangeContainers:(BOOL)a3
{
  self->_ignoresExchangeContainers = a3;
}

- (CNContainerDataSource)initWithContactStore:(id)a3
{
  v4 = (CNContactStore *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContainerDataSource;
  v5 = [(CNContainerDataSource *)&v12 init];
  store = v5->_store;
  v5->_store = v4;
  v7 = v4;

  containerPickerItems = v5->_containerPickerItems;
  v5->_containerPickerItems = (NSArray *)MEMORY[0x1E4F1CBF0];

  v9 = objc_alloc_init(CNContactViewCache);
  contactViewCache = v5->_contactViewCache;
  v5->_contactViewCache = v9;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_containers, 0);

  objc_storeStrong((id *)&self->_containerPickerItems, 0);
}

- (void)setContactViewCache:(id)a3
{
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setStore:(id)a3
{
}

- (CNContactStore)store
{
  return self->_store;
}

- (BOOL)ignoresExchangeContainers
{
  return self->_ignoresExchangeContainers;
}

- (void)setContainers:(id)a3
{
}

- (void)setContainerPickerItems:(id)a3
{
}

- (id)writableContainersForAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1B9B0];
  v6 = [v4 identifier];
  v7 = [v5 predicateForContainersInAccountWithIdentifier:v6];

  v8 = [(CNContainerDataSource *)self contactViewCache];
  v9 = [v8 contactStore];
  id v18 = 0;
  v10 = [v9 containersMatchingPredicate:v7 error:&v18];
  id v11 = v18;

  if (v11)
  {
    objc_super v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = [v4 identifier];
      v16 = [v11 localizedDescription];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "Error fetching containers in account %@: %@", buf, 0x16u);
    }
    v13 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v20 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__CNContainerDataSource_writableContainersForAccount___block_invoke;
    v17[3] = &unk_1E5499AD8;
    v17[4] = self;
    v17[5] = buf;
    v13 = objc_msgSend(v10, "_cn_filter:", v17);
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

uint64_t __54__CNContainerDataSource_writableContainersForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled]
    && ([v3 type] != 2 || (objc_msgSend(*(id *)(a1 + 32), "ignoresExchangeContainers") & 1) == 0))
  {
    if ([v3 type] != 2)
    {
      uint64_t v5 = 1;
      goto LABEL_9;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v4 + 24))
    {
      uint64_t v5 = 1;
      *(unsigned char *)(v4 + 24) = 1;
      goto LABEL_9;
    }
  }
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (id)allAccounts
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(CNContainerDataSource *)self contactViewCache];
  id v3 = [v2 contactStore];
  id v9 = 0;
  uint64_t v4 = [v3 accountsMatchingPredicate:0 error:&v9];
  id v5 = v9;

  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Error fetching accounts: %@", buf, 0xCu);
    }
  }

  return v4;
}

- (void)discoverContainers
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEBUG, "Fetching containers", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(CNContainerDataSource *)self allAccounts];
  uint64_t v7 = *MEMORY[0x1E4F5A258];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v6))
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Accounts fetch returned 0 items", buf, 2u);
    }
    goto LABEL_37;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v45 = v6;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v9) {
    goto LABEL_34;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v58;
  uint64_t v46 = v7;
  uint64_t v47 = *(void *)v58;
  do
  {
    uint64_t v12 = 0;
    uint64_t v48 = v10;
    do
    {
      if (*(void *)v58 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v57 + 1) + 8 * v12);
      v14 = [(CNContainerDataSource *)self writableContainersForAccount:v13];
      if (((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v14) & 1) == 0)
      {
        uint64_t v50 = v12;
        v51 = v14;
        unint64_t v15 = [v14 count];
        v16 = objc_msgSend((id)objc_opt_class(), "os_log");
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
        if (v15 < 2)
        {
          if (v17)
          {
            v39 = [v13 identifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v39;
            _os_log_debug_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEBUG, "Account %@ has only 1 container", buf, 0xCu);
          }
          v33 = [v14 firstObject];
          v34 = objc_msgSend(v13, "_cnui_displayName");
          v35 = objc_alloc_init(CNContainerPickerItem);
          [(CNContainerPickerItem *)v35 setName:v34];
          v36 = [v33 identifier];
          [(CNContainerPickerItem *)v35 setIdentifier:v36];

          -[CNContainerPickerItem setType:](v35, "setType:", [v33 type]);
          [v5 addObject:v35];
          id v52 = v33;
          [v4 addObject:v33];
          v37 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v40 = [v33 identifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v62 = (uint64_t)v40;
            __int16 v63 = 2112;
            v64 = v34;
            _os_log_debug_impl(&dword_18B625000, v37, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);
          }
LABEL_30:
          uint64_t v11 = v47;
        }
        else
        {
          if (v17)
          {
            v38 = [v13 identifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v38;
            _os_log_debug_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEBUG, "Account %@ has more than 1 container", buf, 0xCu);
          }
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v52 = v14;
          uint64_t v18 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v54;
            p_vtable = CNContactListActionExecutor.vtable;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v54 != v20) {
                  objc_enumerationMutation(v52);
                }
                v23 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                id v24 = objc_alloc_init((Class)(p_vtable + 187));
                v25 = [v23 name];
                [v24 setName:v25];

                v26 = [v23 identifier];
                [v24 setIdentifier:v26];

                objc_msgSend(v24, "setType:", objc_msgSend(v23, "type"));
                [v5 addObject:v24];
                [v4 addObject:v23];
                v27 = objc_msgSend((id)objc_opt_class(), "os_log");
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  [v23 identifier];
                  v28 = self;
                  v29 = v5;
                  v31 = v30 = v4;
                  v32 = [v23 name];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v62 = (uint64_t)v31;
                  __int16 v63 = 2112;
                  v64 = v32;
                  _os_log_debug_impl(&dword_18B625000, v27, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);

                  uint64_t v4 = v30;
                  id v5 = v29;
                  self = v28;
                  p_vtable = (void **)(CNContactListActionExecutor + 24);
                }
              }
              uint64_t v19 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
            }
            while (v19);
            uint64_t v7 = v46;
            goto LABEL_30;
          }
        }

        uint64_t v10 = v48;
        uint64_t v12 = v50;
        v14 = v51;
      }

      ++v12;
    }
    while (v12 != v10);
    uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  }
  while (v10);
LABEL_34:

  v41 = (void *)[v4 copy];
  [(CNContainerDataSource *)self setContainers:v41];

  v42 = (void *)[v5 copy];
  [(CNContainerDataSource *)self setContainerPickerItems:v42];

  v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v43 = [(CNContainerDataSource *)self containers];
    uint64_t v44 = [v43 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v62 = v44;
    _os_log_debug_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEBUG, "Finished fetching %lu containers", buf, 0xCu);
  }
  v6 = v45;
LABEL_37:
}

- (NSArray)containers
{
  containers = self->_containers;
  if (!containers)
  {
    [(CNContainerDataSource *)self discoverContainers];
    containers = self->_containers;
  }

  return containers;
}

- (NSArray)containerPickerItems
{
  containerPickerItems = self->_containerPickerItems;
  if (!containerPickerItems)
  {
    [(CNContainerDataSource *)self discoverContainers];
    containerPickerItems = self->_containerPickerItems;
  }

  return containerPickerItems;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_43128 != -1) {
    dispatch_once(&os_log_cn_once_token_1_43128, &__block_literal_global_43129);
  }
  v2 = (void *)os_log_cn_once_object_1_43130;

  return v2;
}

void __31__CNContainerDataSource_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "containerDataSource");
  v1 = (void *)os_log_cn_once_object_1_43130;
  os_log_cn_once_object_1_43130 = (uint64_t)v0;
}

@end