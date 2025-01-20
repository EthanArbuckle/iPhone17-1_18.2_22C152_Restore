@interface ESAccountLoader
+ (id)sharedInstance;
- (BOOL)_loadFrameworkAtSubpath:(id)a3;
- (Class)accountClassForACAccount:(id)a3;
- (Class)agentClassForACAccount:(id)a3;
- (Class)clientAccountClassForACAccount:(id)a3;
- (Class)daemonAccountClassForACAccount:(id)a3;
- (Class)daemonAppropriateAccountClassForACAccount:(id)a3;
- (ESAccountLoader)init;
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

@implementation ESAccountLoader

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ESAccountLoader_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __33__ESAccountLoader_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v0;

  sMainBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (void)_addAccountInfo:(id)a3 forFrameworkNamed:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
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
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v15, v16))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_239784000, v15, v16, "Handling account info mapping %@", (uint8_t *)&v20, 0xCu);
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

- (ESAccountLoader)init
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)ESAccountLoader;
  v3 = [(ESAccountLoader *)&v73 init];
  if (v3)
  {
    v4 = objc_opt_new();
    [(ESAccountLoader *)v3 setAcAccountTypeToAccountFrameworkSubpath:v4];

    v5 = objc_opt_new();
    [(ESAccountLoader *)v3 setAcAccountTypeToAccountDaemonBundleSubpath:v5];

    id v6 = objc_opt_new();
    [(ESAccountLoader *)v3 setAcAccountTypeToClassNames:v6];

    id v7 = objc_opt_new();
    [(ESAccountLoader *)v3 setAcParentAccountTypeToChildAccountTypes:v7];

    v8 = [MEMORY[0x263F08850] defaultManager];
    unint64_t v9 = 0x263F08000uLL;
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 privateFrameworksPath];

    if (!v11)
    {
      v49 = [MEMORY[0x263F08690] currentHandler];
      v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v49 handleFailureInMethod:a2, v3, @"ESAccountLoader.m", 105, @"Could not find the frameworks directory for bundle %@", v50 object file lineNumber description];
    }
    v12 = NSDictionary;
    v13 = [v11 stringByAppendingPathComponent:@"AccountInfo.plist"];
    v14 = [v12 dictionaryWithContentsOfFile:v13];

    v15 = [v14 objectForKeyedSubscript:@"DAAccountInfo"];
    os_log_type_t v16 = v15;
    if (v15 && [v15 count])
    {
      v17 = DALoggingwithCategory();
      os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239784000, v17, v18, "Using pre-cached account infos", buf, 2u);
      }

      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      obuint64_t j = v16;
      uint64_t v19 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (!v19) {
        goto LABEL_44;
      }
      uint64_t v20 = v19;
      v53 = v16;
      id v21 = v14;
      uint64_t v22 = v8;
      uint64_t v23 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v70 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v26 = [v25 objectForKeyedSubscript:@"DAFrameworkName"];
          if (v26) {
            [(ESAccountLoader *)v3 _addAccountInfo:v25 forFrameworkNamed:v26];
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v20);
      v8 = v22;
      v14 = v21;
    }
    else
    {
      v27 = DALoggingwithCategory();
      uint64_t v28 = MEMORY[0x263F38F90];
      os_log_type_t v29 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
      if (os_log_type_enabled(v27, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239784000, v27, v29, "Going to the disk for our account info providers", buf, 2u);
      }

      [v8 contentsOfDirectoryAtPath:v11 error:0];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (!v30) {
        goto LABEL_44;
      }
      uint64_t v31 = v30;
      v52 = v8;
      v53 = v16;
      v51 = v14;
      uint64_t v32 = *(void *)v66;
      os_log_type_t v33 = *(unsigned char *)(v28 + 7);
      uint64_t v54 = *(void *)v66;
      v55 = v11;
      do
      {
        uint64_t v34 = 0;
        uint64_t v56 = v31;
        do
        {
          if (*(void *)v66 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = v34;
          uint64_t v35 = *(void *)(*((void *)&v65 + 1) + 8 * v34);
          v36 = DALoggingwithCategory();
          if (os_log_type_enabled(v36, v33))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v76 = v35;
            _os_log_impl(&dword_239784000, v36, v33, "Checking account info from framework: %@", buf, 0xCu);
          }

          id v37 = objc_alloc(*(Class *)(v9 + 1760));
          v38 = [v11 stringByAppendingPathComponent:v35];
          v39 = (void *)[v37 initWithPath:v38];

          if (v39)
          {
            v40 = [v39 infoDictionary];
            if (v40)
            {
              v57 = v40;
              v58 = v39;
              v41 = [v40 objectForKeyedSubscript:@"DAAccountInfo"];
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v61 objects:v74 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v62;
                do
                {
                  for (uint64_t j = 0; j != v43; ++j)
                  {
                    if (*(void *)v62 != v44) {
                      objc_enumerationMutation(v41);
                    }
                    uint64_t v46 = *(void *)(*((void *)&v61 + 1) + 8 * j);
                    v47 = DALoggingwithCategory();
                    if (os_log_type_enabled(v47, v33))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v76 = v46;
                      _os_log_impl(&dword_239784000, v47, v33, "Adding account info: %@", buf, 0xCu);
                    }

                    [(ESAccountLoader *)v3 _addAccountInfo:v46 forFrameworkNamed:v35];
                  }
                  uint64_t v43 = [v41 countByEnumeratingWithState:&v61 objects:v74 count:16];
                }
                while (v43);
              }

              uint64_t v32 = v54;
              v11 = v55;
              unint64_t v9 = 0x263F08000;
              uint64_t v31 = v56;
              v40 = v57;
              v39 = v58;
            }
          }
          uint64_t v34 = v60 + 1;
        }
        while (v60 + 1 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
      }
      while (v31);
      v14 = v51;
      v8 = v52;
    }
    os_log_type_t v16 = v53;
LABEL_44:
  }
  return v3;
}

- (BOOL)_loadFrameworkAtSubpath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)sMainBundle privateFrameworksPath];
    id v6 = [v5 stringByAppendingPathComponent:v4];

    id v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
  }
  else
  {
    id v7 = 0;
  }
  v8 = self;
  objc_sync_enter(v8);
  char v9 = [v7 load];
  objc_sync_exit(v8);

  return v9;
}

- (void)loadFrameworkForACAccountType:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  acAccountTypeToAccountFrameworkSubpath = self->_acAccountTypeToAccountFrameworkSubpath;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)acAccountTypeToAccountFrameworkSubpath objectForKeyedSubscript:v6];

  if (![(ESAccountLoader *)self _loadFrameworkAtSubpath:v7])
  {
    v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = [v4 identifier];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_239784000, v8, v9, "We don't know of any bundles for account type \"%@\"", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)loadDaemonBundleForACAccountType:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  acAccountTypeToAccountDaemonBundleSubpath = self->_acAccountTypeToAccountDaemonBundleSubpath;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)acAccountTypeToAccountDaemonBundleSubpath objectForKeyedSubscript:v6];

  if (![(ESAccountLoader *)self _loadFrameworkAtSubpath:v7])
  {
    v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = [v4 identifier];
      int v11 = 138412546;
      v12 = v10;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_239784000, v8, v9, "Could not load bundle for account type %@ at subpath %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (Class)accountClassForACAccount:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accountType];
  [(ESAccountLoader *)self loadFrameworkForACAccountType:v5];

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
  __int16 v13 = [v4 accountType];
  v14 = [v13 identifier];
  uint64_t v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];
  os_log_type_t v16 = [v15 accountClassName];

  Class v17 = NSClassFromString(v16);
  if (!v17)
  {
    os_log_type_t v18 = [v4 parentAccount];

    uint64_t v19 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    BOOL v21 = os_log_type_enabled(v19, v20);
    if (v18)
    {
      if (v21)
      {
        uint64_t v22 = [v4 parentAccount];
        int v25 = 138412802;
        v26 = v16;
        __int16 v27 = 2112;
        id v28 = v4;
        __int16 v29 = 2112;
        uint64_t v30 = v22;
        _os_log_impl(&dword_239784000, v19, v20, "Could not come up with an account class (name %@) for account %@ parent account %@", (uint8_t *)&v25, 0x20u);
      }
    }
    else if (v21)
    {
      int v25 = 138412546;
      v26 = v16;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_239784000, v19, v20, "Could not come up with an account class (name %@) for account %@", (uint8_t *)&v25, 0x16u);
    }
  }
  uint64_t v23 = v17;

  return v23;
}

- (Class)clientAccountClassForACAccount:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accountType];
  [(ESAccountLoader *)self loadFrameworkForACAccountType:v5];

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
  __int16 v13 = [v4 accountType];
  v14 = [v13 identifier];
  uint64_t v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];
  os_log_type_t v16 = [v15 clientAccountClassName];

  if (!v16)
  {
    Class v17 = [v4 accountType];
    os_log_type_t v18 = [v17 identifier];
    uint64_t v19 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v18];
    os_log_type_t v16 = [v19 accountClassName];
  }
  Class v20 = NSClassFromString(v16);
  if (!v20)
  {
    BOOL v21 = [v4 parentAccount];

    uint64_t v22 = DALoggingwithCategory();
    os_log_type_t v23 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
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
        os_log_type_t v33 = v25;
        _os_log_impl(&dword_239784000, v22, v23, "Could not come up with a client account class (name %@) for account %@ parent account %@", (uint8_t *)&v28, 0x20u);
      }
    }
    else if (v24)
    {
      int v28 = 138412546;
      __int16 v29 = v16;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_239784000, v22, v23, "Could not come up with a client account class (name %@) for account %@", (uint8_t *)&v28, 0x16u);
    }
  }
  v26 = v20;

  return v26;
}

- (Class)daemonAccountClassForACAccount:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accountType];
  [(ESAccountLoader *)self loadFrameworkForACAccountType:v5];

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
  __int16 v13 = [v4 accountType];
  v14 = [v13 identifier];
  uint64_t v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];
  os_log_type_t v16 = [v15 daemonAccountClassName];

  if (!v16)
  {
    Class v17 = [v4 accountType];
    os_log_type_t v18 = [v17 identifier];
    uint64_t v19 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v18];
    os_log_type_t v16 = [v19 accountClassName];

    if (!v16) {
      goto LABEL_6;
    }
  }
  Class v20 = [v4 accountType];
  [(ESAccountLoader *)self loadDaemonBundleForACAccountType:v20];

  Class v21 = NSClassFromString(v16);
  if (!v21)
  {
LABEL_6:
    uint64_t v22 = [v4 parentAccount];

    os_log_type_t v23 = DALoggingwithCategory();
    os_log_type_t v24 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    BOOL v25 = os_log_type_enabled(v23, v24);
    if (v22)
    {
      if (v25)
      {
        v26 = [v4 parentAccount];
        int v29 = 138412802;
        __int16 v30 = v16;
        __int16 v31 = 2112;
        id v32 = v4;
        __int16 v33 = 2112;
        uint64_t v34 = v26;
        _os_log_impl(&dword_239784000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@ parent account %@", (uint8_t *)&v29, 0x20u);
      }
    }
    else if (v25)
    {
      int v29 = 138412546;
      __int16 v30 = v16;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_239784000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@", (uint8_t *)&v29, 0x16u);
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
  [(ESAccountLoader *)self loadDaemonBundleForACAccountType:v6];

  id v7 = self->_acAccountTypeToClassNames;
  v8 = [v5 parentAccount];

  if (v8)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    v10 = [v5 parentAccount];
    int v11 = [v10 accountType];
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = [(NSMutableDictionary *)acParentAccountTypeToChildAccountTypes objectForKeyedSubscript:v12];

    id v7 = (NSMutableDictionary *)v13;
  }
  v14 = [v5 accountType];
  uint64_t v15 = [v14 identifier];
  os_log_type_t v16 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v15];
  Class v17 = [v16 agentClassName];

  Class v18 = NSClassFromString(v17);
  if (!v18)
  {
    uint64_t v19 = [v5 parentAccount];

    Class v20 = [MEMORY[0x263F08690] currentHandler];
    Class v21 = v20;
    if (v19)
    {
      uint64_t v22 = [v5 parentAccount];
      [v21 handleFailureInMethod:a2, self, @"ESAccountLoader.m", 250, @"Could not come up with an agent class (name %@) for account %@ parent account %@", v17, v5, v22 object file lineNumber description];
    }
    else
    {
      [v20 handleFailureInMethod:a2, self, @"ESAccountLoader.m", 252, @"Could not come up with an agent class (name %@) for account %@", v17, v5 object file lineNumber description];
    }
  }
  os_log_type_t v23 = v18;

  return v23;
}

- (Class)daemonAppropriateAccountClassForACAccount:(id)a3
{
  id v4 = a3;
  if (ESIsRunningInExchangeSyncD()) {
    [(ESAccountLoader *)self daemonAccountClassForACAccount:v4];
  }
  else {
  id v5 = [(ESAccountLoader *)self clientAccountClassForACAccount:v4];
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