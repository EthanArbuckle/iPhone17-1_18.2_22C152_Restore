@interface DAAccountLoader
+ (id)sharedInstance;
+ (void)_findPrivateFrameworks;
- (BOOL)_loadFrameworkAtSubpath:(id)a3;
- (Class)agentClassForACAccount:(id)a3;
- (Class)clientAccountClassForACAccount:(id)a3;
- (Class)daemonAccountClassForACAccount:(id)a3;
- (Class)daemonAppropriateAccountClassForACAccount:(id)a3;
- (DAAccountLoader)init;
- (NSMutableDictionary)acAccountTypeToAccountDaemonBundleSubpath;
- (NSMutableDictionary)acAccountTypeToAccountFrameworkSubpath;
- (NSMutableDictionary)classNamesForDirectlyNestedAccountTypes;
- (NSMutableDictionary)classNamesForTopLevelAccountTypes;
- (NSMutableDictionary)defaultClassNamesForAccountTypes;
- (id)_classNamesDictionaryForAccount:(id)a3;
- (void)_addAccountInfo:(id)a3 forFrameworkNamed:(id)a4;
- (void)loadDaemonBundleForACAccountType:(id)a3;
- (void)loadFrameworkForACAccountType:(id)a3;
- (void)setAcAccountTypeToAccountDaemonBundleSubpath:(id)a3;
- (void)setAcAccountTypeToAccountFrameworkSubpath:(id)a3;
- (void)setClassNamesForDirectlyNestedAccountTypes:(id)a3;
- (void)setClassNamesForTopLevelAccountTypes:(id)a3;
- (void)setDefaultClassNamesForAccountTypes:(id)a3;
@end

@implementation DAAccountLoader

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__DAAccountLoader_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __33__DAAccountLoader_sharedInstance__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _findPrivateFrameworks];
  sharedInstance__sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)_addAccountInfo:(id)a3 forFrameworkNamed:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"ACAccountType"];
  v9 = [v6 objectForKeyedSubscript:@"ACParentAccountType"];
  v10 = [v6 objectForKeyedSubscript:@"ACTopLevelAccountType"];
  if (v8)
  {
    v11 = objc_opt_new();
    v12 = [v6 objectForKeyedSubscript:@"DAAccountClass"];
    [v11 setAccountClassName:v12];

    v13 = [v6 objectForKeyedSubscript:@"DAClientAccountClass"];
    [v11 setClientAccountClassName:v13];

    v14 = [v6 objectForKeyedSubscript:@"DADaemonAccountClass"];
    [v11 setDaemonAccountClassName:v14];

    v15 = [v6 objectForKeyedSubscript:@"DAAgentClass"];
    [v11 setAgentClassName:v15];

    v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v16, v17))
    {
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1BA384000, v16, v17, "Handling account info mapping %@", (uint8_t *)&v24, 0xCu);
    }

    [(NSMutableDictionary *)self->_acAccountTypeToAccountFrameworkSubpath setObject:v7 forKeyedSubscript:v8];
    if (v10)
    {
      v18 = [(NSMutableDictionary *)self->_classNamesForTopLevelAccountTypes objectForKeyedSubscript:v10];
      if (!v18)
      {
        v18 = objc_opt_new();
        classNamesForTopLevelAccountTypes = self->_classNamesForTopLevelAccountTypes;
        v20 = v18;
        v21 = v10;
LABEL_10:
        [(NSMutableDictionary *)classNamesForTopLevelAccountTypes setObject:v20 forKeyedSubscript:v21];
      }
    }
    else
    {
      if (!v9)
      {
        [(NSMutableDictionary *)self->_defaultClassNamesForAccountTypes setObject:v11 forKeyedSubscript:v8];
        v18 = [v6 objectForKeyedSubscript:@"DAAgentClassBundle"];
        if (v18)
        {
          v22 = [v7 stringByAppendingPathComponent:v18];
          v23 = [v22 stringByAppendingPathExtension:@"bundle"];

          if (v23) {
            [(NSMutableDictionary *)self->_acAccountTypeToAccountDaemonBundleSubpath setObject:v23 forKeyedSubscript:v8];
          }
        }
        goto LABEL_12;
      }
      v18 = [(NSMutableDictionary *)self->_classNamesForDirectlyNestedAccountTypes objectForKeyedSubscript:v9];
      if (!v18)
      {
        v18 = objc_opt_new();
        classNamesForTopLevelAccountTypes = self->_classNamesForDirectlyNestedAccountTypes;
        v20 = v18;
        v21 = v9;
        goto LABEL_10;
      }
    }
    [v18 setObject:v11 forKeyedSubscript:v8];
LABEL_12:
  }
}

- (DAAccountLoader)init
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)DAAccountLoader;
  v2 = [(DAAccountLoader *)&v60 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(DAAccountLoader *)v2 setAcAccountTypeToAccountFrameworkSubpath:v3];

    v4 = objc_opt_new();
    [(DAAccountLoader *)v2 setAcAccountTypeToAccountDaemonBundleSubpath:v4];

    v5 = objc_opt_new();
    [(DAAccountLoader *)v2 setDefaultClassNamesForAccountTypes:v5];

    id v6 = objc_opt_new();
    [(DAAccountLoader *)v2 setClassNamesForDirectlyNestedAccountTypes:v6];

    id v7 = objc_opt_new();
    [(DAAccountLoader *)v2 setClassNamesForTopLevelAccountTypes:v7];

    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = (id)privateFrameworksPath;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = [v9 stringByAppendingPathComponent:@"AccountInfo.plist"];
    v12 = [v10 dictionaryWithContentsOfFile:v11];

    v13 = [v12 objectForKeyedSubscript:@"DAAccountInfo"];
    v14 = DALoggingwithCategory();
    os_log_type_t v15 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    BOOL v16 = os_log_type_enabled(v14, v15);
    id v44 = v9;
    if (v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA384000, v14, v15, "Using pre-cached account infos", buf, 2u);
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      obuint64_t j = v13;
      uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v56 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            v22 = [v21 objectForKeyedSubscript:@"DAFrameworkName"];
            if (v22) {
              [(DAAccountLoader *)v2 _addAccountInfo:v21 forFrameworkNamed:v22];
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v18);
        id v9 = v44;
      }
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA384000, v14, v15, "Going to the disk for our account info providers", buf, 2u);
      }

      [v8 contentsOfDirectoryAtPath:v9 error:0];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v23)
      {
        v41 = 0;
        v42 = v12;
        v43 = v8;
        uint64_t v24 = *(void *)v52;
        unint64_t v25 = 0x1E4F28000uLL;
        uint64_t v26 = v23;
        do
        {
          uint64_t v27 = 0;
          uint64_t v45 = v26;
          do
          {
            if (*(void *)v52 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v51 + 1) + 8 * v27);
            id v29 = objc_alloc(*(Class *)(v25 + 2896));
            v30 = [v9 stringByAppendingPathComponent:v28];
            v31 = (void *)[v29 initWithPath:v30];

            if (v31)
            {
              v32 = [v31 infoDictionary];
              v33 = v32;
              if (v32)
              {
                uint64_t v34 = v24;
                v35 = [v32 objectForKeyedSubscript:@"DAAccountInfo"];
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v61 count:16];
                if (v36)
                {
                  uint64_t v37 = v36;
                  uint64_t v38 = *(void *)v48;
                  do
                  {
                    for (uint64_t j = 0; j != v37; ++j)
                    {
                      if (*(void *)v48 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      -[DAAccountLoader _addAccountInfo:forFrameworkNamed:](v2, "_addAccountInfo:forFrameworkNamed:", *(void *)(*((void *)&v47 + 1) + 8 * j), v28, v41, v42, v43);
                    }
                    uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v61 count:16];
                  }
                  while (v37);
                }

                id v9 = v44;
                uint64_t v26 = v45;
                uint64_t v24 = v34;
                unint64_t v25 = 0x1E4F28000;
              }
            }
            ++v27;
          }
          while (v27 != v26);
          uint64_t v26 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
        }
        while (v26);
        v12 = v42;
        v8 = v43;
        v13 = v41;
      }
    }
  }
  return v2;
}

+ (void)_findPrivateFrameworks
{
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 privateFrameworksPath];
  id v6 = (void *)privateFrameworksPath;
  privateFrameworksPath = v5;

  if (!privateFrameworksPath)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v8 handleFailureInMethod:a2, a1, @"DAAccountLoader.m", 168, @"Could not find the frameworks directory for bundle %@", v7 object file lineNumber description];
  }
}

- (BOOL)_loadFrameworkAtSubpath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(id)privateFrameworksPath stringByAppendingPathComponent:v4];
    id v6 = [MEMORY[0x1E4F28B50] bundleWithPath:v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = self;
  objc_sync_enter(v7);
  char v8 = [v6 load];
  objc_sync_exit(v7);

  return v8;
}

- (void)loadFrameworkForACAccountType:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  acAccountTypeToAccountFrameworkSubpath = self->_acAccountTypeToAccountFrameworkSubpath;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)acAccountTypeToAccountFrameworkSubpath objectForKeyedSubscript:v6];

  if (![(DAAccountLoader *)self _loadFrameworkAtSubpath:v7])
  {
    char v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = [v4 identifier];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1BA384000, v8, v9, "We don't know of any bundles for account type \"%@\"", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)loadDaemonBundleForACAccountType:(id)a3
{
  acAccountTypeToAccountDaemonBundleSubpath = self->_acAccountTypeToAccountDaemonBundleSubpath;
  uint64_t v5 = [a3 identifier];
  id v6 = [(NSMutableDictionary *)acAccountTypeToAccountDaemonBundleSubpath objectForKeyedSubscript:v5];

  [(DAAccountLoader *)self _loadFrameworkAtSubpath:v6];
}

- (id)_classNamesDictionaryForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 parentAccount];

  if (v5)
  {
    id v6 = [v4 calTopLevelAccount];
    id v7 = [v6 accountType];
    char v8 = [v7 identifier];

    os_log_type_t v9 = [(NSMutableDictionary *)self->_classNamesForTopLevelAccountTypes objectForKeyedSubscript:v8];
    if (v9)
    {
      v10 = [v4 accountType];
      int v11 = [v10 identifier];
      v12 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v11];

      if (v12)
      {

        goto LABEL_10;
      }
    }
    classNamesForDirectlyNestedAccountTypes = self->_classNamesForDirectlyNestedAccountTypes;
    v14 = [v4 parentAccount];
    os_log_type_t v15 = [v14 accountType];
    BOOL v16 = [v15 identifier];
    uint64_t v17 = [(NSMutableDictionary *)classNamesForDirectlyNestedAccountTypes objectForKeyedSubscript:v16];

    if (v17)
    {
      uint64_t v18 = [v4 accountType];
      uint64_t v19 = [v18 identifier];
      v20 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:v19];

      if (v20)
      {

        os_log_type_t v9 = v17;
        goto LABEL_10;
      }
    }
  }
  os_log_type_t v9 = self->_defaultClassNamesForAccountTypes;
LABEL_10:

  return v9;
}

- (Class)clientAccountClassForACAccount:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accountType];
  [(DAAccountLoader *)self loadFrameworkForACAccountType:v5];

  id v6 = [(DAAccountLoader *)self _classNamesDictionaryForAccount:v4];
  id v7 = [v4 accountType];
  char v8 = [v7 identifier];
  os_log_type_t v9 = [v6 objectForKeyedSubscript:v8];
  v10 = [v9 clientAccountClassName];

  if (!v10)
  {
    int v11 = [v4 accountType];
    v12 = [v11 identifier];
    uint64_t v13 = [v6 objectForKeyedSubscript:v12];
    v10 = [v13 accountClassName];
  }
  Class v14 = NSClassFromString(v10);
  if (!v14)
  {
    os_log_type_t v15 = [v4 parentAccount];

    BOOL v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    BOOL v18 = os_log_type_enabled(v16, v17);
    if (v15)
    {
      if (v18)
      {
        uint64_t v19 = [v4 parentAccount];
        int v22 = 138412802;
        uint64_t v23 = v10;
        __int16 v24 = 2112;
        id v25 = v4;
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        _os_log_impl(&dword_1BA384000, v16, v17, "Could not come up with a client account class (name %@) for account %@ parent account %@", (uint8_t *)&v22, 0x20u);
      }
    }
    else if (v18)
    {
      int v22 = 138412546;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_1BA384000, v16, v17, "Could not come up with a client account class (name %@) for account %@", (uint8_t *)&v22, 0x16u);
    }
  }
  v20 = v14;

  return v20;
}

- (Class)daemonAccountClassForACAccount:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accountType];
  [(DAAccountLoader *)self loadFrameworkForACAccountType:v5];

  id v6 = [(DAAccountLoader *)self _classNamesDictionaryForAccount:v4];
  id v7 = [v4 accountType];
  char v8 = [v7 identifier];
  os_log_type_t v9 = [v6 objectForKeyedSubscript:v8];
  v10 = [v9 daemonAccountClassName];

  if (!v10)
  {
    int v11 = [v4 accountType];
    v12 = [v11 identifier];
    uint64_t v13 = [v6 objectForKeyedSubscript:v12];
    v10 = [v13 accountClassName];

    if (!v10) {
      goto LABEL_4;
    }
  }
  Class v14 = [v4 accountType];
  [(DAAccountLoader *)self loadDaemonBundleForACAccountType:v14];

  Class v15 = NSClassFromString(v10);
  if (!v15)
  {
LABEL_4:
    BOOL v16 = [v4 parentAccount];

    os_log_type_t v17 = DALoggingwithCategory();
    os_log_type_t v18 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    BOOL v19 = os_log_type_enabled(v17, v18);
    if (v16)
    {
      if (v19)
      {
        v20 = [v4 parentAccount];
        int v23 = 138412802;
        __int16 v24 = v10;
        __int16 v25 = 2112;
        id v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        _os_log_impl(&dword_1BA384000, v17, v18, "Could not come up with a daemon account class (name %@) for account %@ parent account %@", (uint8_t *)&v23, 0x20u);
      }
    }
    else if (v19)
    {
      int v23 = 138412546;
      __int16 v24 = v10;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_1BA384000, v17, v18, "Could not come up with a daemon account class (name %@) for account %@", (uint8_t *)&v23, 0x16u);
    }

    Class v15 = 0;
  }
  v21 = v15;

  return v21;
}

- (Class)agentClassForACAccount:(id)a3
{
  id v5 = a3;
  id v6 = [v5 accountType];
  [(DAAccountLoader *)self loadDaemonBundleForACAccountType:v6];

  id v7 = [(DAAccountLoader *)self _classNamesDictionaryForAccount:v5];
  char v8 = [v5 accountType];
  os_log_type_t v9 = [v8 identifier];
  v10 = [v7 objectForKeyedSubscript:v9];
  int v11 = [v10 agentClassName];

  Class v12 = NSClassFromString(v11);
  if (!v12)
  {
    uint64_t v13 = [v5 parentAccount];

    Class v14 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v15 = v14;
    if (v13)
    {
      BOOL v16 = [v5 parentAccount];
      [v15 handleFailureInMethod:a2, self, @"DAAccountLoader.m", 273, @"Could not come up with an agent class (name %@) for account %@ parent account %@", v11, v5, v16 object file lineNumber description];
    }
    else
    {
      [v14 handleFailureInMethod:a2, self, @"DAAccountLoader.m", 275, @"Could not come up with an agent class (name %@) for account %@", v11, v5 object file lineNumber description];
    }
  }
  os_log_type_t v17 = v12;

  return v17;
}

- (Class)daemonAppropriateAccountClassForACAccount:(id)a3
{
  id v4 = a3;
  if (DAIsRunningInDataAccessD()) {
    [(DAAccountLoader *)self daemonAccountClassForACAccount:v4];
  }
  else {
  id v5 = [(DAAccountLoader *)self clientAccountClassForACAccount:v4];
  }

  return (Class)v5;
}

- (NSMutableDictionary)acAccountTypeToAccountFrameworkSubpath
{
  return self->_acAccountTypeToAccountFrameworkSubpath;
}

- (void)setAcAccountTypeToAccountFrameworkSubpath:(id)a3
{
}

- (NSMutableDictionary)acAccountTypeToAccountDaemonBundleSubpath
{
  return self->_acAccountTypeToAccountDaemonBundleSubpath;
}

- (void)setAcAccountTypeToAccountDaemonBundleSubpath:(id)a3
{
}

- (NSMutableDictionary)defaultClassNamesForAccountTypes
{
  return self->_defaultClassNamesForAccountTypes;
}

- (void)setDefaultClassNamesForAccountTypes:(id)a3
{
}

- (NSMutableDictionary)classNamesForDirectlyNestedAccountTypes
{
  return self->_classNamesForDirectlyNestedAccountTypes;
}

- (void)setClassNamesForDirectlyNestedAccountTypes:(id)a3
{
}

- (NSMutableDictionary)classNamesForTopLevelAccountTypes
{
  return self->_classNamesForTopLevelAccountTypes;
}

- (void)setClassNamesForTopLevelAccountTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNamesForTopLevelAccountTypes, 0);
  objc_storeStrong((id *)&self->_classNamesForDirectlyNestedAccountTypes, 0);
  objc_storeStrong((id *)&self->_defaultClassNamesForAccountTypes, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountDaemonBundleSubpath, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountFrameworkSubpath, 0);
}

@end