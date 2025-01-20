@interface DNDSContactProvider
+ (id)sharedContactStore;
- (DNDSContactProvider)init;
- (id)_bestMatchForContact:(id)a3 inContacts:(id)a4;
- (id)contactForContact:(id)a3;
@end

@implementation DNDSContactProvider

+ (id)sharedContactStore
{
  if (sharedContactStore_onceToken != -1) {
    dispatch_once(&sharedContactStore_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedContactStore_contactStore;
  return v2;
}

uint64_t __41__DNDSContactProvider_sharedContactStore__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v1 = sharedContactStore_contactStore;
  sharedContactStore_contactStore = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (DNDSContactProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)DNDSContactProvider;
  v2 = [(DNDSContactProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() sharedContactStore];
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v3;
  }
  return v2;
}

- (id)contactForContact:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  objc_super v6 = [v4 phoneNumbers];
  v7 = [v6 allObjects];
  [v5 addObjectsFromArray:v7];

  v8 = [v4 emailAddresses];
  v9 = [v8 allObjects];
  [v5 addObjectsFromArray:v9];

  v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingHandleStrings:v5];
  v11 = v4;
  if (v10)
  {
    contactStore = self->_contactStore;
    v13 = [MEMORY[0x1E4F5F5C0] keysToFetch];
    id v19 = 0;
    v14 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v10 keysToFetch:v13 error:&v19];
    id v15 = v19;

    if ((unint64_t)[v14 count] < 2) {
      [v14 firstObject];
    }
    else {
    v16 = [(DNDSContactProvider *)self _bestMatchForContact:v4 inContacts:v14];
    }
    if (v16)
    {
      v11 = [MEMORY[0x1E4F5F5C0] contactWithCNContact:v16];
    }
    else
    {
      v17 = DNDSLogSettings;
      v11 = v4;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      {
        -[DNDSContactProvider contactForContact:]((uint64_t)v4, v17);
        v11 = v4;
      }
    }
  }
  return v11;
}

- (id)_bestMatchForContact:(id)a3 inContacts:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 134349314;
    uint64_t v105 = [v6 count];
    __int16 v106 = 2112;
    unint64_t v107 = (unint64_t)v5;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Scoring %{public}llu matches for contact %@", buf, 0x16u);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = v6;
  uint64_t v75 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (!v75)
  {
    id v74 = 0;
    unint64_t v76 = 0;
    goto LABEL_70;
  }
  unint64_t v76 = 0;
  uint64_t v73 = *(void *)v96;
  id v74 = 0;
  *(void *)&long long v9 = 134349056;
  long long v71 = v9;
  v78 = v5;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v96 != v73) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v95 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "givenName", v71);
      uint64_t v77 = v10;
      if ([v12 length])
      {
        v13 = [v5 firstName];
        if ([v13 length])
        {
          v14 = [v11 givenName];
          id v15 = [v14 lowercaseString];
          v16 = [v5 firstName];
          v17 = [v16 lowercaseString];
          unsigned int v18 = [v15 isEqualToString:v17];

          unint64_t v19 = v18;
          goto LABEL_13;
        }
      }
      unint64_t v19 = 0;
LABEL_13:
      v20 = [v11 middleName];
      if ([v20 length])
      {
        v21 = [v5 middleName];
        if ([v21 length])
        {
          v22 = [v11 middleName];
          v23 = [v22 lowercaseString];
          v24 = [v5 middleName];
          v25 = [v24 lowercaseString];
          unsigned int v26 = [v23 isEqualToString:v25];

          v19 += v26;
          goto LABEL_18;
        }
      }
LABEL_18:
      v27 = [v11 familyName];
      if ([v27 length])
      {
        v28 = [v5 lastName];
        if ([v28 length])
        {
          v29 = [v11 familyName];
          v30 = [v29 lowercaseString];
          v31 = [v5 lastName];
          v32 = [v31 lowercaseString];
          unsigned int v33 = [v30 isEqualToString:v32];

          v19 += v33;
          goto LABEL_23;
        }
      }
LABEL_23:
      v34 = [v11 organizationName];
      if ([v34 length])
      {
        v35 = [v5 organizationName];
        if ([v35 length])
        {
          v36 = [v11 organizationName];
          v37 = [v36 lowercaseString];
          v38 = [v5 organizationName];
          v39 = [v38 lowercaseString];
          unsigned int v40 = [v37 isEqualToString:v39];

          v19 += v40;
          goto LABEL_28;
        }
      }
LABEL_28:
      v41 = [MEMORY[0x1E4F1CA80] set];
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      v42 = [v11 emailAddresses];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v91 objects:v102 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v92;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v92 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = [*(id *)(*((void *)&v91 + 1) + 8 * i) value];
            [v41 addObject:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v91 objects:v102 count:16];
        }
        while (v44);
      }

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      v48 = [v78 emailAddresses];
      uint64_t v49 = [v48 countByEnumeratingWithState:&v87 objects:v101 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v88;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v88 != v51) {
              objc_enumerationMutation(v48);
            }
            if ([v41 containsObject:*(void *)(*((void *)&v87 + 1) + 8 * j)]) {
              v19 += 10;
            }
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v87 objects:v101 count:16];
        }
        while (v50);
      }

      v53 = [MEMORY[0x1E4F1CA80] set];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      v54 = [v11 phoneNumbers];
      uint64_t v55 = [v54 countByEnumeratingWithState:&v83 objects:v100 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v84 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = [*(id *)(*((void *)&v83 + 1) + 8 * k) value];
            v60 = [v59 stringValue];
            [v53 addObject:v60];
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v83 objects:v100 count:16];
        }
        while (v56);
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v5 = v78;
      v61 = [v78 phoneNumbers];
      uint64_t v62 = [v61 countByEnumeratingWithState:&v79 objects:v99 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v80;
        do
        {
          for (uint64_t m = 0; m != v63; ++m)
          {
            if (*(void *)v80 != v64) {
              objc_enumerationMutation(v61);
            }
            if ([v53 containsObject:*(void *)(*((void *)&v79 + 1) + 8 * m)]) {
              v19 += 10;
            }
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v79 objects:v99 count:16];
        }
        while (v63);
      }

      v66 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v105 = (uint64_t)v11;
        __int16 v106 = 2050;
        unint64_t v107 = v19;
        _os_log_impl(&dword_1D3052000, v66, OS_LOG_TYPE_DEFAULT, "Contact %@ scored %{public}llu", buf, 0x16u);
      }
      if (v19 > v76)
      {
        v67 = DNDSLogSettings;
        if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v71;
          uint64_t v105 = v19;
          _os_log_impl(&dword_1D3052000, v67, OS_LOG_TYPE_DEFAULT, "New high score: %{public}llu", buf, 0xCu);
        }
        id v68 = v11;

        id v74 = v68;
        unint64_t v76 = v19;
      }

      uint64_t v10 = v77 + 1;
    }
    while (v77 + 1 != v75);
    uint64_t v75 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
  }
  while (v75);
LABEL_70:

  v69 = DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v105 = (uint64_t)v74;
    __int16 v106 = 2050;
    unint64_t v107 = v76;
    _os_log_impl(&dword_1D3052000, v69, OS_LOG_TYPE_DEFAULT, "Contact %@ has the high score %{public}llu", buf, 0x16u);
  }

  return v74;
}

- (void).cxx_destruct
{
}

- (void)contactForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Could not fetch a contact for contact: %@", (uint8_t *)&v2, 0xCu);
}

@end