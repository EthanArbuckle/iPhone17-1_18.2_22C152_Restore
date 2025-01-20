@interface DAAccountLoader
+ (id)sharedInstance;
+ (void)_findPrivateFrameworks;
- (BOOL)_loadFrameworkAtSubpath:(id)a3;
- (Class)accountClassForACAccount:(id)a3;
- (Class)agentClassForACAccount:(id)a3;
- (Class)clientAccountClassForACAccount:(id)a3;
- (Class)daemonAccountClassForACAccount:(id)a3;
- (Class)daemonAppropriateAccountClassForACAccount:(id)a3;
- (DAAccountLoader)init;
- (NSMutableDictionary)acAccountTypeToAccountDaemonBundleSubpath;
- (NSMutableDictionary)acAccountTypeToAccountFrameworkSubpath;
- (NSMutableDictionary)acAccountTypeToClassNames;
- (NSMutableDictionary)acParentAccountTypeToChildAccountTypes;
- (void)_addAccountInfo:(id)a3 forFrameworkNamed:(id)a4;
- (void)loadDaemonBundleForACAccountType:(id)a3;
- (void)loadFrameworkForACAccountType:(id)a3;
- (void)setAcAccountTypeToAccountDaemonBundleSubpath:(id)a3;
- (void)setAcAccountTypeToAccountFrameworkSubpath:(id)a3;
- (void)setAcAccountTypeToClassNames:(id)a3;
- (void)setAcParentAccountTypeToChildAccountTypes:(id)a3;
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"ACAccountType"];
  v9 = [v6 objectForKeyedSubscript:@"ACParentAccountType"];
  if (v8)
  {
    v10 = objc_opt_new();
    v11 = [v6 objectForKeyedSubscript:@"DAAccountClass"];
    [v10 setAccountClassName:v11];

    v12 = [v6 objectForKeyedSubscript:@"DAClientAccountClass"];
    [v10 setClientAccountClassName:v12];

    v13 = [v6 objectForKeyedSubscript:@"DADaemonAccountClass"];
    [v10 setDaemonAccountClassName:v13];

    v14 = [v6 objectForKeyedSubscript:@"DAAgentClass"];
    [v10 setAgentClassName:v14];

    v15 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
    if (os_log_type_enabled(v15, v16))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_1C86FF000, v15, v16, "Handling account info mapping %@", (uint8_t *)&v20, 0xCu);
    }

    if (v9)
    {
      v17 = [(NSMutableDictionary *)self->_acParentAccountTypeToChildAccountTypes objectForKeyedSubscript:v9];
      if (!v17)
      {
        v17 = objc_opt_new();
        [(NSMutableDictionary *)self->_acParentAccountTypeToChildAccountTypes setObject:v17 forKeyedSubscript:v9];
      }
      [v17 setObject:v10 forKeyedSubscript:v8];
      [(NSMutableDictionary *)self->_acAccountTypeToAccountFrameworkSubpath setObject:v7 forKeyedSubscript:v8];
    }
    else
    {
      [(NSMutableDictionary *)self->_acAccountTypeToClassNames setObject:v10 forKeyedSubscript:v8];
      [(NSMutableDictionary *)self->_acAccountTypeToAccountFrameworkSubpath setObject:v7 forKeyedSubscript:v8];
      v17 = [v6 objectForKeyedSubscript:@"DAAgentClassBundle"];
      if (v17)
      {
        v18 = [v7 stringByAppendingPathComponent:v17];
        v19 = [v18 stringByAppendingPathExtension:@"bundle"];

        if (v19) {
          [(NSMutableDictionary *)self->_acAccountTypeToAccountDaemonBundleSubpath setObject:v19 forKeyedSubscript:v8];
        }
      }
    }
  }
}

- (DAAccountLoader)init
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)DAAccountLoader;
  v2 = [(DAAccountLoader *)&v59 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(DAAccountLoader *)v2 setAcAccountTypeToAccountFrameworkSubpath:v3];

    v4 = objc_opt_new();
    [(DAAccountLoader *)v2 setAcAccountTypeToAccountDaemonBundleSubpath:v4];

    v5 = objc_opt_new();
    [(DAAccountLoader *)v2 setAcAccountTypeToClassNames:v5];

    id v6 = objc_opt_new();
    [(DAAccountLoader *)v2 setAcParentAccountTypeToChildAccountTypes:v6];

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = (id)privateFrameworksPath;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = [v8 stringByAppendingPathComponent:@"AccountInfo.plist"];
    v11 = [v9 dictionaryWithContentsOfFile:v10];

    v12 = [v11 objectForKeyedSubscript:@"DAAccountInfo"];
    v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
    BOOL v15 = os_log_type_enabled(v13, v14);
    id v43 = v8;
    if (v12)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C86FF000, v13, v14, "Using pre-cached account infos", buf, 2u);
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = v12;
      uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(obj);
            }
            int v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            id v21 = [v20 objectForKeyedSubscript:@"DAFrameworkName"];
            if (v21) {
              [(DAAccountLoader *)v2 _addAccountInfo:v20 forFrameworkNamed:v21];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v17);
        id v8 = v43;
      }
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C86FF000, v13, v14, "Going to the disk for our account info providers", buf, 2u);
      }

      [v7 contentsOfDirectoryAtPath:v8 error:0];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v22)
      {
        v40 = 0;
        v41 = v11;
        v42 = v7;
        uint64_t v23 = *(void *)v51;
        unint64_t v24 = 0x1E4F28000uLL;
        uint64_t v25 = v22;
        do
        {
          uint64_t v26 = 0;
          uint64_t v44 = v25;
          do
          {
            if (*(void *)v51 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * v26);
            id v28 = objc_alloc(*(Class *)(v24 + 2896));
            v29 = [v8 stringByAppendingPathComponent:v27];
            v30 = (void *)[v28 initWithPath:v29];

            if (v30)
            {
              v31 = [v30 infoDictionary];
              v32 = v31;
              if (v31)
              {
                uint64_t v33 = v23;
                v34 = [v31 objectForKeyedSubscript:@"DAAccountInfo"];
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v60 count:16];
                if (v35)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = *(void *)v47;
                  do
                  {
                    for (uint64_t j = 0; j != v36; ++j)
                    {
                      if (*(void *)v47 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      -[DAAccountLoader _addAccountInfo:forFrameworkNamed:](v2, "_addAccountInfo:forFrameworkNamed:", *(void *)(*((void *)&v46 + 1) + 8 * j), v27, v40, v41, v42);
                    }
                    uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v60 count:16];
                  }
                  while (v36);
                }

                id v8 = v43;
                uint64_t v25 = v44;
                uint64_t v23 = v33;
                unint64_t v24 = 0x1E4F28000;
              }
            }
            ++v26;
          }
          while (v26 != v25);
          uint64_t v25 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
        }
        while (v25);
        v11 = v41;
        id v7 = v42;
        v12 = v40;
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
    [v8 handleFailureInMethod:a2, a1, @"DAAccountLoader.m", 140, @"Could not find the frameworks directory for bundle %@", v7 object file lineNumber description];
  }
}

- (BOOL)_loadFrameworkAtSubpath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
  id v13 = 0;
  char v8 = [v6 loadAndReturnError:&v13];
  id v9 = v13;
  if ((v8 & 1) == 0)
  {
    v10 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1C86FF000, v10, v11, "Failed to load account bundle {error: %@}", buf, 0xCu);
    }
  }
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
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = [v4 identifier];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1C86FF000, v8, v9, "We don't know of any bundles for account type \"%@\"", (uint8_t *)&v11, 0xCu);
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

- (Class)accountClassForACAccount:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accountType];
  [(DAAccountLoader *)self loadFrameworkForACAccountType:v5];

  id v6 = self->_acAccountTypeToClassNames;
  id v7 = [v4 parentAccount];

  if (v7)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    os_log_type_t v9 = [v4 parentAccount];
    v10 = [v9 accountType];
    int v11 = [v10 identifier];
    uint64_t v12 = [(NSMutableDictionary *)acParentAccountTypeToChildAccountTypes objectForKeyedSubscript:v11];

    id v6 = (NSMutableDictionary *)v12;
  }
  uint64_t v13 = [v4 accountType];
  os_log_type_t v14 = [v13 identifier];
  id v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];
  uint64_t v16 = [v15 accountClassName];

  Class v17 = NSClassFromString(v16);
  if (!v17)
  {
    uint64_t v18 = [v4 parentAccount];

    v19 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    BOOL v21 = os_log_type_enabled(v19, v20);
    if (v18)
    {
      if (v21)
      {
        uint64_t v22 = [v4 parentAccount];
        int v25 = 138412802;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        id v28 = v4;
        __int16 v29 = 2112;
        v30 = v22;
        _os_log_impl(&dword_1C86FF000, v19, v20, "Could not come up with an account class (name %@) for account %@ parent account %@", (uint8_t *)&v25, 0x20u);
      }
    }
    else if (v21)
    {
      int v25 = 138412546;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_1C86FF000, v19, v20, "Could not come up with an account class (name %@) for account %@", (uint8_t *)&v25, 0x16u);
    }
  }
  uint64_t v23 = v17;

  return v23;
}

- (Class)clientAccountClassForACAccount:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accountType];
  [(DAAccountLoader *)self loadFrameworkForACAccountType:v5];

  id v6 = self->_acAccountTypeToClassNames;
  id v7 = [v4 parentAccount];

  if (v7)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    os_log_type_t v9 = [v4 parentAccount];
    v10 = [v9 accountType];
    int v11 = [v10 identifier];
    uint64_t v12 = [(NSMutableDictionary *)acParentAccountTypeToChildAccountTypes objectForKeyedSubscript:v11];

    id v6 = (NSMutableDictionary *)v12;
  }
  uint64_t v13 = [v4 accountType];
  os_log_type_t v14 = [v13 identifier];
  id v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];
  uint64_t v16 = [v15 clientAccountClassName];

  if (!v16)
  {
    Class v17 = [v4 accountType];
    uint64_t v18 = [v17 identifier];
    v19 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v18];
    uint64_t v16 = [v19 accountClassName];
  }
  Class v20 = NSClassFromString(v16);
  if (!v20)
  {
    BOOL v21 = [v4 parentAccount];

    uint64_t v22 = DALoggingwithCategory();
    os_log_type_t v23 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    BOOL v24 = os_log_type_enabled(v22, v23);
    if (v21)
    {
      if (v24)
      {
        int v25 = [v4 parentAccount];
        int v28 = 138412802;
        __int16 v29 = v16;
        __int16 v30 = 2112;
        id v31 = v4;
        __int16 v32 = 2112;
        uint64_t v33 = v25;
        _os_log_impl(&dword_1C86FF000, v22, v23, "Could not come up with a client account class (name %@) for account %@ parent account %@", (uint8_t *)&v28, 0x20u);
      }
    }
    else if (v24)
    {
      int v28 = 138412546;
      __int16 v29 = v16;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_1C86FF000, v22, v23, "Could not come up with a client account class (name %@) for account %@", (uint8_t *)&v28, 0x16u);
    }
  }
  uint64_t v26 = v20;

  return v26;
}

- (Class)daemonAccountClassForACAccount:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accountType];
  [(DAAccountLoader *)self loadFrameworkForACAccountType:v5];

  id v6 = self->_acAccountTypeToClassNames;
  id v7 = [v4 parentAccount];

  if (v7)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    os_log_type_t v9 = [v4 parentAccount];
    v10 = [v9 accountType];
    int v11 = [v10 identifier];
    uint64_t v12 = [(NSMutableDictionary *)acParentAccountTypeToChildAccountTypes objectForKeyedSubscript:v11];

    id v6 = (NSMutableDictionary *)v12;
  }
  uint64_t v13 = [v4 accountType];
  os_log_type_t v14 = [v13 identifier];
  id v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];
  uint64_t v16 = [v15 daemonAccountClassName];

  if (!v16)
  {
    Class v17 = [v4 accountType];
    uint64_t v18 = [v17 identifier];
    v19 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v18];
    uint64_t v16 = [v19 accountClassName];

    if (!v16) {
      goto LABEL_6;
    }
  }
  Class v20 = [v4 accountType];
  [(DAAccountLoader *)self loadDaemonBundleForACAccountType:v20];

  Class v21 = NSClassFromString(v16);
  if (!v21)
  {
LABEL_6:
    uint64_t v22 = [v4 parentAccount];

    os_log_type_t v23 = DALoggingwithCategory();
    os_log_type_t v24 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    BOOL v25 = os_log_type_enabled(v23, v24);
    if (v22)
    {
      if (v25)
      {
        uint64_t v26 = [v4 parentAccount];
        int v29 = 138412802;
        __int16 v30 = v16;
        __int16 v31 = 2112;
        id v32 = v4;
        __int16 v33 = 2112;
        uint64_t v34 = v26;
        _os_log_impl(&dword_1C86FF000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@ parent account %@", (uint8_t *)&v29, 0x20u);
      }
    }
    else if (v25)
    {
      int v29 = 138412546;
      __int16 v30 = v16;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1C86FF000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@", (uint8_t *)&v29, 0x16u);
    }

    Class v21 = 0;
  }
  __int16 v27 = v21;

  return v27;
}

- (Class)agentClassForACAccount:(id)a3
{
  id v5 = a3;
  id v6 = [v5 accountType];
  [(DAAccountLoader *)self loadDaemonBundleForACAccountType:v6];

  id v7 = self->_acAccountTypeToClassNames;
  char v8 = [v5 parentAccount];

  if (v8)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    v10 = [v5 parentAccount];
    int v11 = [v10 accountType];
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = [(NSMutableDictionary *)acParentAccountTypeToChildAccountTypes objectForKeyedSubscript:v12];

    id v7 = (NSMutableDictionary *)v13;
  }
  os_log_type_t v14 = [v5 accountType];
  id v15 = [v14 identifier];
  uint64_t v16 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v15];
  Class v17 = [v16 agentClassName];

  Class v18 = NSClassFromString(v17);
  if (!v18)
  {
    v19 = [v5 parentAccount];

    Class v20 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v21 = v20;
    if (v19)
    {
      uint64_t v22 = [v5 parentAccount];
      [v21 handleFailureInMethod:a2, self, @"DAAccountLoader.m", 251, @"Could not come up with an agent class (name %@) for account %@ parent account %@", v17, v5, v22 object file lineNumber description];
    }
    else
    {
      [v20 handleFailureInMethod:a2, self, @"DAAccountLoader.m", 253, @"Could not come up with an agent class (name %@) for account %@", v17, v5 object file lineNumber description];
    }
  }
  os_log_type_t v23 = v18;

  return v23;
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

- (NSMutableDictionary)acAccountTypeToClassNames
{
  return self->_acAccountTypeToClassNames;
}

- (void)setAcAccountTypeToClassNames:(id)a3
{
}

- (NSMutableDictionary)acParentAccountTypeToChildAccountTypes
{
  return self->_acParentAccountTypeToChildAccountTypes;
}

- (void)setAcParentAccountTypeToChildAccountTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acParentAccountTypeToChildAccountTypes, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToClassNames, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountDaemonBundleSubpath, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountFrameworkSubpath, 0);
}

@end