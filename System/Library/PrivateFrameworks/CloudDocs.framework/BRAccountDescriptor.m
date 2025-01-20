@interface BRAccountDescriptor
+ (BOOL)mightHaveDataSeparatedAccountDescriptor;
+ (BOOL)supportsSecureCoding;
+ (id)accountDescriptorForAccountID:(id)a3;
+ (id)accountDescriptorForAccountID:(id)a3 mustBeLoggedIn:(BOOL)a4;
+ (id)accountDescriptorForPersonaID:(id)a3;
+ (id)accountDescriptorForPersonaID:(id)a3 mustBeLoggedIn:(BOOL)a4;
+ (id)accountDescriptorForURL:(id)a3;
+ (id)accountDescriptorForURL:(id)a3 mustBeLoggedIn:(BOOL)a4;
+ (id)allEligibleAccountDescriptors;
+ (id)allLoggedInAccountDescriptors;
+ (id)matchDomainWithAccountAndStampDomainIfNeeded:(id)a3 withAccounts:(id)a4 persistDomain:(BOOL *)a5;
+ (void)clearAccountDescriptorCache;
+ (void)refreshCache:(BOOL)a3;
- (BOOL)isDataSeparated;
- (BOOL)isLoggedInToCloudDocs;
- (BRAccountDescriptor)initWithCoder:(id)a3;
- (BRAccountDescriptor)initWithPersonaIdentifier:(id)a3 accountIdentifier:(id)a4 domainIdentifier:(id)a5 organizationName:(id)a6 dataSeparated:(BOOL)a7 loggedInToCloudDocs:(BOOL)a8;
- (NSString)accountIdentifier;
- (NSString)domainIdentifier;
- (NSString)organizationName;
- (id)description;
- (id)personaIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRAccountDescriptor

- (BRAccountDescriptor)initWithPersonaIdentifier:(id)a3 accountIdentifier:(id)a4 domainIdentifier:(id)a5 organizationName:(id)a6 dataSeparated:(BOOL)a7 loggedInToCloudDocs:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BRAccountDescriptor;
  v18 = [(BRAccountDescriptor *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_personaIdentifier, a3);
    objc_storeStrong((id *)&v19->_accountIdentifier, a4);
    objc_storeStrong((id *)&v19->_domainIdentifier, a5);
    objc_storeStrong((id *)&v19->_organizationName, a6);
    v19->_isDataSeparated = a7;
    v19->_isLoggedInToCloudDocs = a8;
  }

  return v19;
}

- (BRAccountDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRAccountDescriptor;
  v5 = [(BRAccountDescriptor *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaID"];
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainID"];
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orgName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v12;

    v5->_isDataSeparated = [v4 decodeBoolForKey:@"dataSeparated"];
    v5->_isLoggedInToCloudDocs = [v4 decodeBoolForKey:@"loggedInToCloudDocs"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  personaIdentifier = self->_personaIdentifier;
  id v5 = a3;
  [v5 encodeObject:personaIdentifier forKey:@"personaID"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountID"];
  [v5 encodeObject:self->_domainIdentifier forKey:@"domainID"];
  [v5 encodeObject:self->_organizationName forKey:@"orgName"];
  [v5 encodeBool:self->_isDataSeparated forKey:@"dataSeparated"];
  [v5 encodeBool:self->_isLoggedInToCloudDocs forKey:@"loggedInToCloudDocs"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)personaIdentifier
{
  return self->_personaIdentifier;
}

+ (void)clearAccountDescriptorCache
{
  if (g_allAccounts)
  {
    id obj = (id)g_allAccounts;
    objc_sync_enter(obj);
    g_cacheValid = 0;
    g_hasDSAccount = 0;
    [(id)g_allAccounts removeAllObjects];
    objc_sync_exit(obj);
  }
}

+ (id)allLoggedInAccountDescriptors
{
  v2 = [a1 allEligibleAccountDescriptors];
  v3 = (void *)[v2 mutableCopy];

  id v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_123];
  [v3 removeObjectsAtIndexes:v4];

  return v3;
}

uint64_t __52__BRAccountDescriptor_allLoggedInAccountDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLoggedInToCloudDocs] ^ 1;
}

+ (void)refreshCache:(BOOL)a3
{
  BOOL v3 = a3;
  if (refreshCache__onceToken == -1)
  {
    if (a3)
    {
LABEL_3:
      id v4 = refreshCache__refreshQueue;
      dispatch_async(v4, &__block_literal_global_129);
      return;
    }
  }
  else
  {
    dispatch_once(&refreshCache__onceToken, &__block_literal_global_125);
    if (v3) {
      goto LABEL_3;
    }
  }

  __36__BRAccountDescriptor_refreshCache___block_invoke_2((uint64_t)a1, (uint64_t)a2);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)g_allAccounts;
  g_allAccounts = v0;

  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("account-refresh-queue", v2);

  id v4 = (void *)refreshCache__refreshQueue;
  refreshCache__refreshQueue = (uint64_t)v3;
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  int v65 = BRIsFPFSEnabled(a1, a2);
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v62 = [v2 bundleIdentifier];

  dispatch_queue_t v3 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  if (v65)
  {
    dispatch_queue_t v3 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
    id v4 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  }
  else
  {
    id v4 = @"com.apple.CloudDocs.MobileDocumentsFileProviderManaged";
  }
  id v5 = v3;
  v61 = v4;
  int v6 = objc_msgSend(v62, "isEqualToString:");
  v60 = v5;
  int v71 = [v62 isEqualToString:v5];
  BOOL v7 = 1;
  int v66 = v6;
  if (([v62 isEqualToString:@"com.apple.bird"] & 1) == 0 && (v6 & 1) == 0 && (v71 & 1) == 0)
  {
    getpid();
    BOOL v7 = sandbox_check() != 0;
  }
  id v8 = (id)g_allAccounts;
  objc_sync_enter(v8);
  if ((g_cacheValid & 1) == 0)
  {
    id v58 = v8;
    if (v7)
    {
      getpid();
      if (sandbox_check())
      {
        brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 497);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        v9 = brc_default_log(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_5();
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F179C8], "defaultStore", "com.apple.accountsd.accountmanager");
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = objc_msgSend(v59, "br_allEligibleAppleAccounts");
        v9 = v16;
        if (v65 && [v16 count])
        {
          id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
          if ((v71 & 1) == 0)
          {
            v18 = objc_msgSend(MEMORY[0x1E4F25DE8], "br_getEnterpriseProviderManager");
            if (v18)
            {
              [v17 addObject:v18];
            }
            else
            {
              v38 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 511);
              v39 = brc_default_log(0);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
                __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_4();
              }
            }
          }
          if ((v66 & 1) == 0)
          {
            v40 = objc_msgSend(MEMORY[0x1E4F25DE8], "br_getPrimaryProviderManager");
            if (v40)
            {
              [v17 addObject:v40];
            }
            else
            {
              v41 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 519);
              v42 = brc_default_log(0);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
                __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_3();
              }
            }
          }
          objc_super v22 = objc_opt_new();
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v57 = v17;
          uint64_t v68 = [v57 countByEnumeratingWithState:&v81 objects:v89 count:16];
          if (v68)
          {
            id obja = *(id *)v82;
            while (2)
            {
              for (uint64_t i = 0; i != v68; ++i)
              {
                if (*(id *)v82 != obja) {
                  objc_enumerationMutation(v57);
                }
                v43 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                id v80 = 0;
                v44 = objc_msgSend(v43, "br_getFPDomainsWithError:", &v80);
                id v45 = v80;
                if (v45)
                {
                  v54 = v45;
                  v55 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 529);
                  v56 = brc_default_log(0);
                  if (os_log_type_enabled(v56, (os_log_type_t)0x90u)) {
                    __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_2();
                  }

                  v37 = v57;
                  v36 = v57;
                  goto LABEL_82;
                }
                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                id v46 = v44;
                uint64_t v47 = [v46 countByEnumeratingWithState:&v76 objects:v88 count:16];
                if (v47)
                {
                  uint64_t v48 = *(void *)v77;
                  do
                  {
                    for (uint64_t j = 0; j != v47; ++j)
                    {
                      if (*(void *)v77 != v48) {
                        objc_enumerationMutation(v46);
                      }
                      v50 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                      v51 = +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:v50 withAccounts:v9 persistDomain:0];
                      if (v51)
                      {
                        v52 = [v50 identifier];
                        v53 = [v51 identifier];
                        [v22 setObject:v52 forKeyedSubscript:v53];
                      }
                    }
                    uint64_t v47 = [v46 countByEnumeratingWithState:&v76 objects:v88 count:16];
                  }
                  while (v47);
                }
              }
              uint64_t v68 = [v57 countByEnumeratingWithState:&v81 objects:v89 count:16];
              if (v68) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          objc_super v22 = 0;
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id obj = v9;
        uint64_t v23 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
        if (v23)
        {
          uint64_t v67 = *(void *)v73;
          do
          {
            uint64_t v69 = v23;
            for (uint64_t k = 0; k != v69; ++k)
            {
              if (*(void *)v73 != v67) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v72 + 1) + 8 * k);
              if ((!v71 || ([*(id *)(*((void *)&v72 + 1) + 8 * k) isDataSeparatedAccount] & 1) == 0)
                && (!v66 || [v25 isDataSeparatedAccount]))
              {
                v26 = [v25 identifier];
                v27 = v26;
                if (v65)
                {
                  uint64_t v28 = [v22 objectForKeyedSubscript:v26];
                  v29 = (void *)v28;
                  if (v28) {
                    v30 = (void *)v28;
                  }
                  else {
                    v30 = v27;
                  }
                  id v31 = v30;
                }
                else
                {
                  id v31 = v26;
                }
                v32 = [BRAccountDescriptor alloc];
                v33 = objc_msgSend(v25, "br_personaIdentifier");
                v34 = [v25 accountDescription];
                v35 = -[BRAccountDescriptor initWithPersonaIdentifier:accountIdentifier:domainIdentifier:organizationName:dataSeparated:loggedInToCloudDocs:](v32, "initWithPersonaIdentifier:accountIdentifier:domainIdentifier:organizationName:dataSeparated:loggedInToCloudDocs:", v33, v27, v31, v34, [v25 isDataSeparatedAccount], objc_msgSend(v25, "br_isEnabledForCloudDocs"));

                [(id)g_allAccounts addObject:v35];
                if ([v25 isDataSeparatedAccount]) {
                  g_hasDSAccount = 1;
                }
              }
            }
            uint64_t v23 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
          }
          while (v23);
        }

        g_cacheValid = 1;
        v36 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 576);
        v37 = brc_default_log(1);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_1();
        }
LABEL_82:
      }
    }
    else
    {
      uint64_t v10 = +[BRDaemonConnection secondaryConnection];
      v11 = (void *)[v10 newSyncProxy];

      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __36__BRAccountDescriptor_refreshCache___block_invoke_3;
      v85[3] = &unk_1E59AD558;
      v86 = v11;
      id v59 = v86;
      [v86 queryEligibleAccountDescriptorsWithReply:v85];
      uint64_t v12 = [v59 error];
      LODWORD(v11) = v12 == 0;

      if (v11)
      {
        v19 = (void *)g_allAccounts;
        v20 = [v59 result];
        [v19 addObjectsFromArray:v20];

        if ((unint64_t)[(id)g_allAccounts count] > 1)
        {
          g_hasDSAccount = 1;
        }
        else
        {
          v21 = [(id)g_allAccounts firstObject];
          g_hasDSAccount = [v21 isDataSeparated];
        }
        g_cacheValid = 1;
        v13 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke_2", 488);
        id v14 = brc_default_log(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_1();
        }
      }
      else
      {
        v13 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 491);
        id v14 = brc_default_log(0);
        if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        {
          objc_super v15 = [v59 error];
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_7(v15, (uint64_t)v13, (uint64_t)v90);
        }
      }

      v9 = v86;
    }

    id v8 = v58;
  }
  objc_sync_exit(v8);
}

uint64_t __36__BRAccountDescriptor_refreshCache___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

+ (id)allEligibleAccountDescriptors
{
  +[BRAccount startAccountTokenChangeObserverIfNeeded];
  if (g_cacheValid & 1) != 0 || ([a1 refreshCache:0], (g_cacheValid))
  {
    id v4 = (id)g_allAccounts;
    objc_sync_enter(v4);
    dispatch_queue_t v3 = (void *)[(id)g_allAccounts copy];
    objc_sync_exit(v4);
  }
  else
  {
    dispatch_queue_t v3 = 0;
  }

  return v3;
}

+ (id)accountDescriptorForURL:(id)a3
{
  return (id)[a1 accountDescriptorForURL:a3 mustBeLoggedIn:1];
}

+ (id)accountDescriptorForURL:(id)a3 mustBeLoggedIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v6 = +[BRAccountDescriptor allEligibleAccountDescriptors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 personaIdentifier];
        int v13 = objc_msgSend(v5, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v12, 1);

        if (v13)
        {
          if (v4 && ![v11 isLoggedInToCloudDocs]) {
            v11 = 0;
          }
          id v14 = v11;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

+ (id)accountDescriptorForPersonaID:(id)a3
{
  return (id)[a1 accountDescriptorForPersonaID:a3 mustBeLoggedIn:1];
}

+ (id)accountDescriptorForPersonaID:(id)a3 mustBeLoggedIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v7 = [v6 userPersonaUniqueString];
  int v8 = [v5 isEqualToString:v7];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = +[BRAccountDescriptor allEligibleAccountDescriptors];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    BOOL v23 = v4;
    uint64_t v12 = *(void *)v25;
    int v13 = v8 ^ 1;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v16 = [v15 personaIdentifier];
        int v17 = [v16 isEqualToString:v5];
        if ((v17 | v13))
        {
          int v18 = v17;

          if (v18) {
            goto LABEL_13;
          }
        }
        else
        {
          long long v19 = [v15 personaIdentifier];
          char v20 = [v19 isEqualToString:@"__defaultPersonaID__"];

          if (v20)
          {
LABEL_13:
            if (v23 && ![v15 isLoggedInToCloudDocs]) {
              objc_super v15 = 0;
            }
            id v21 = v15;
            goto LABEL_17;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_17:

  return v21;
}

+ (id)accountDescriptorForAccountID:(id)a3
{
  return (id)[a1 accountDescriptorForAccountID:a3 mustBeLoggedIn:1];
}

+ (id)accountDescriptorForAccountID:(id)a3 mustBeLoggedIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v6 = +[BRAccountDescriptor allEligibleAccountDescriptors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 accountIdentifier];
        int v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          if (v4 && ![v11 isLoggedInToCloudDocs]) {
            uint64_t v11 = 0;
          }
          id v14 = v11;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

+ (BOOL)mightHaveDataSeparatedAccountDescriptor
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (g_cacheValid) {
    return g_hasDSAccount != 0;
  }
  dispatch_queue_t v3 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor mightHaveDataSeparatedAccountDescriptor]", 674);
  BOOL v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v11 = v3;
    _os_log_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Cache not populated - going for a quick discovery%@", buf, 0xCu);
  }

  int v5 = kpersona_find_by_type();
  BOOL v6 = v5 == -1;
  uint64_t v7 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor mightHaveDataSeparatedAccountDescriptor]", 682);
  uint64_t v8 = brc_default_log(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)uint64_t v11 = v5 == -1;
    *(_WORD *)&v11[4] = 1024;
    *(_DWORD *)&v11[6] = *(_DWORD *)v11;
    __int16 v12 = 1024;
    int v13 = 0;
    __int16 v14 = 2112;
    objc_super v15 = v7;
    _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] hasManagedPersona = %d because %d || %d%@", buf, 0x1Eu);
  }

  [a1 refreshCache:1];
  return v6;
}

- (id)description
{
  dispatch_queue_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isDataSeparated) {
    int v5 = @"separated";
  }
  else {
    int v5 = @"primary";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p account:%@ persona:%@ org:%@ %@>", v4, self, self->_accountIdentifier, self->_personaIdentifier, self->_organizationName, v5];
}

+ (id)matchDomainWithAccountAndStampDomainIfNeeded:(id)a3 withAccounts:(id)a4 persistDomain:(BOOL *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  if (objc_msgSend(v7, "br_isCiconiaDomain"))
  {
    brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 708);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]();
    }
    __int16 v12 = 0;
  }
  else
  {
    int v13 = [v7 userInfo];
    __int16 v14 = (void *)[v13 mutableCopy];
    objc_super v15 = v14;
    if (v14) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = objc_opt_new();
    }
    uint64_t v11 = v16;

    long long v17 = [v11 objectForKeyedSubscript:@"dsid"];
    long long v18 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 714);
    long long v19 = brc_default_log(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]();
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v39 = a5;
      v40 = v11;
      id v41 = v8;
      v42 = v7;
      uint64_t v23 = *(void *)v44;
LABEL_12:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v43 + 1) + 8 * v24);
        long long v26 = objc_msgSend(v25, "identifier", v39);
        if ([v26 isEqualToString:v9]) {
          break;
        }
        long long v27 = objc_msgSend(v25, "br_dsid");
        int v28 = [v17 isEqualToString:v27];

        if (v28)
        {
          v30 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 723);
          id v31 = brc_default_log(1);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            id v48 = v17;
            __int16 v49 = 2112;
            v50 = v26;
            __int16 v51 = 2112;
            v52 = v9;
            __int16 v53 = 2112;
            v54 = v30;
            _os_log_debug_impl(&dword_19ED3F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Located account with DSID: %@ (accountID: %@, domainID: %@)%@", buf, 0x2Au);
          }
          goto LABEL_27;
        }

        if (v22 == ++v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v22) {
            goto LABEL_12;
          }

          id v8 = v41;
          id v7 = v42;
          uint64_t v11 = v40;
          if (v17) {
            goto LABEL_22;
          }
LABEL_36:
          v36 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 742);
          v37 = brc_default_log(1);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v48 = v9;
            __int16 v49 = 2112;
            v50 = v36;
            _os_log_impl(&dword_19ED3F000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Didn't find an account with identifier %@. Possible data loss%@", buf, 0x16u);
          }

          id v29 = 0;
          long long v17 = 0;
          goto LABEL_39;
        }
      }
      v30 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 719);
      id v31 = brc_default_log(1);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]();
      }
LABEL_27:
      id v8 = v41;
      id v7 = v42;
      uint64_t v11 = v40;

      id v29 = v25;
      if (v17) {
        goto LABEL_28;
      }
      if (v29)
      {
        long long v17 = objc_msgSend(v29, "br_dsid");
        v34 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 735);
        v35 = brc_default_log(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v48 = v42;
          __int16 v49 = 2112;
          v50 = v17;
          __int16 v51 = 2112;
          v52 = v34;
          _os_log_impl(&dword_19ED3F000, v35, OS_LOG_TYPE_DEFAULT, "[NOTICE] Stamping domain %@ with DSID %@%@", buf, 0x20u);
        }

        [v40 setObject:v17 forKeyedSubscript:@"dsid"];
        [v42 setUserInfo:v40];
        if (v39) {
          BOOL *v39 = 1;
        }
        goto LABEL_39;
      }
      goto LABEL_36;
    }

    if (!v17) {
      goto LABEL_36;
    }
LABEL_22:
    id v29 = 0;
LABEL_28:
    v32 = brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 732);
    v33 = brc_default_log(1);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v48 = v7;
      __int16 v49 = 2112;
      v50 = v17;
      __int16 v51 = 2112;
      v52 = v32;
      _os_log_debug_impl(&dword_19ED3F000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Domain %@ was already stamped with dsid: %@%@", buf, 0x20u);
    }

LABEL_39:
    id v10 = v29;

    __int16 v12 = v10;
  }

  return v12;
}

- (BOOL)isLoggedInToCloudDocs
{
  return self->_isLoggedInToCloudDocs;
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_19ED3F000, v0, v1, "[DEBUG] All logged in accounts cache populated to %@%@", v2, v3, v4, v5, 2u);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] Couldn't get FP domains - %@%@");
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't fetch the primary manager%@", v1, 0xCu);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't fetch the enterprise manager%@", v1, 0xCu);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Can't query accountsd for the logged in account descriptors either%@", v2, v3, v4, v5, v6);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_7(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_8((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_19ED3F000, v6, v4, "[ERROR] Couldn't get account descriptors from daemon - %@%@", v5);
}

+ (void)matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] There is no account for Ciconia domain, the Ciconia Migrator should delete this%@", v2, v3, v4, v5, v6);
}

+ (void)matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Located account with identifier: %@%@");
}

+ (void)matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Domain user info: %@%@");
}

@end