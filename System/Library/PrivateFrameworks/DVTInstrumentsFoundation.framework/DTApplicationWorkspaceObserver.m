@interface DTApplicationWorkspaceObserver
+ (id)sharedInstance;
- (DTApplicationWorkspaceObserver)init;
- (id)registerNotificationToken:(id)a3 observer:(id)a4 query:(id)a5;
- (void)_notifyWithApplicationProxy:(id)a3 addition:(BOOL)a4;
- (void)_notifyWithDictionaryRepresentation:(id)a3 addition:(BOOL)a4;
- (void)_unregisterNotificationTokenInternal:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)unregisterNotificationToken:(id)a3 observer:(id)a4;
@end

@implementation DTApplicationWorkspaceObserver

+ (id)sharedInstance
{
  if (qword_268707DB8 != -1) {
    dispatch_once(&qword_268707DB8, &unk_26E515488);
  }
  v2 = (void *)qword_268707DC0;
  return v2;
}

- (DTApplicationWorkspaceObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)DTApplicationWorkspaceObserver;
  v2 = [(DTApplicationWorkspaceObserver *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    registrationsByToken = v2->_registrationsByToken;
    v2->_registrationsByToken = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    knownAppsByPath = v2->_knownAppsByPath;
    v2->_knownAppsByPath = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)_notifyWithApplicationProxy:(id)a3 addition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 correspondingApplicationRecord];
  objc_super v8 = v7;
  if (!v4)
  {
    v9 = [v6 correspondingApplicationRecord];
    goto LABEL_8;
  }
  v9 = [v7 bundleIdentifier];
  if (!v9)
  {
    id v12 = 0;
    goto LABEL_7;
  }
  id v24 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:&v24];
  id v11 = v24;
  if (v10)
  {
    id v12 = v10;

LABEL_7:
    v9 = v12;
LABEL_8:
    v13 = sub_230882FDC(v9, !v4);
    [(DTApplicationWorkspaceObserver *)self _notifyWithDictionaryRepresentation:v13 addition:v4];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = [v9 applicationExtensionRecords];
    uint64_t v14 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v19 = v8;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v11);
          }
          v18 = sub_230883368(*(void **)(*((void *)&v20 + 1) + 8 * i), !v4);
          [(DTApplicationWorkspaceObserver *)self _notifyWithDictionaryRepresentation:v18 addition:v4];
        }
        uint64_t v15 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v15);
      objc_super v8 = v19;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    sub_23093C83C((uint64_t)v9, v11);
  }
LABEL_16:
}

- (void)_notifyWithDictionaryRepresentation:(id)a3 addition:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_super v8 = [v6 objectForKeyedSubscript:@"CFBundleIdentifier"];
  if ([v8 length])
  {
    v9 = [v6 objectForKeyedSubscript:@"Type"];
    int v10 = [MEMORY[0x263F08AB0] isAppleInternal];
    if (([v9 isEqualToString:@"System"] ^ 1 | v10))
    {
      if (![v9 isEqualToString:@"Internal"]
        || v10
        && (Boolean keyExistsAndHasValidFormat = 0,
            CFPreferencesGetAppBooleanValue(@"SBShowInternalApps", @"com.apple.springboard", &keyExistsAndHasValidFormat))&& keyExistsAndHasValidFormat)
      {
        id v11 = [(NSMutableDictionary *)v7->_knownAppsByPath objectForKeyedSubscript:v8];
        id v12 = v11;
        if (v11)
        {
          registrationsByToken = v7->_registrationsByToken;
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = sub_230883764;
          v17[3] = &unk_264B8D6B8;
          id v18 = v11;
          [(NSMutableDictionary *)registrationsByToken enumerateKeysAndObjectsUsingBlock:v17];
          [(NSMutableDictionary *)v7->_knownAppsByPath removeObjectForKey:v8];
        }
        if (v4)
        {
          [(NSMutableDictionary *)v7->_knownAppsByPath setObject:v6 forKeyedSubscript:v8];
          uint64_t v14 = v7->_registrationsByToken;
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = sub_23088377C;
          v15[3] = &unk_264B8D6B8;
          id v16 = v6;
          [(NSMutableDictionary *)v14 enumerateKeysAndObjectsUsingBlock:v15];
        }
      }
    }
  }
  objc_sync_exit(v7);
}

- (id)registerNotificationToken:(id)a3 observer:(id)a4 query:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id val = a4;
  id v43 = a5;
  v41 = v9;
  if (val)
  {
    uint64_t v40 = [v9 length];
    int v10 = self;
    objc_sync_enter(v10);
    obuint64_t j = v10;
    if (![(NSMutableDictionary *)v10->_registrationsByToken count])
    {
      v39 = [MEMORY[0x263F01880] defaultWorkspace];
      if (v40) {
        [v39 addObserver:v10];
      }
      v44 = [MEMORY[0x263EFF9C0] set];
      id v11 = [v43 objectForKeyedSubscript:@"Type"];
      char v12 = [v11 isEqualToString:@"PluginKit"];

      if ((v12 & 1) == 0)
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v13 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v62 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v58 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              uint64_t v5 = [v17 applicationState];
              char v18 = [v5 isRestricted];

              if ((v18 & 1) == 0)
              {
                uint64_t v5 = [v17 bundleIdentifier];
                [v44 addObject:v5];
              }
              v19 = sub_230882FDC(v17, 0);
              [(DTApplicationWorkspaceObserver *)v10 _notifyWithDictionaryRepresentation:v19 addition:1];
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v62 count:16];
          }
          while (v14);
        }
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v20 = [MEMORY[0x263F01858] enumeratorWithOptions:0];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v54 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            v25 = sub_230883368(v24, 0);
            uint64_t v26 = [v24 containingBundleRecord];
            v27 = [v26 bundleIdentifier];

            if (!v27)
            {
              int v28 = 1;
LABEL_25:
              int v29 = [MEMORY[0x263F08AB0] isAppleInternal] ^ 1;
              if (!v27) {
                goto LABEL_27;
              }
              goto LABEL_26;
            }
            int v28 = [v44 containsObject:v27];
            uint64_t v5 = [v24 bundleIdentifier];
            if ([v5 hasPrefix:@"com.apple."]) {
              goto LABEL_25;
            }
            int v29 = 0;
LABEL_26:

LABEL_27:
            v30 = [NSNumber numberWithInt:v29 | v28 ^ 1u];
            [v25 setObject:v30 forKeyedSubscript:@"Restricted"];

            [(DTApplicationWorkspaceObserver *)obj _notifyWithDictionaryRepresentation:v25 addition:1];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v21);
      }
    }
    if (v40)
    {
      objc_initWeak(&location, val);
      v31 = [v41 stringByAppendingFormat:@".%p", val];
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_230883D60;
      aBlock[3] = &unk_264B8D6E0;
      id v50 = v43;
      objc_copyWeak(&v51, &location);
      v32 = _Block_copy(aBlock);
      [(NSMutableDictionary *)obj->_registrationsByToken setObject:v32 forKeyedSubscript:v31];

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
    }
    v33 = [MEMORY[0x263EFF980] array];
    knownAppsByPath = obj->_knownAppsByPath;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = sub_230883EE0;
    v46[3] = &unk_264B8D708;
    id v47 = v43;
    id v35 = v33;
    id v48 = v35;
    [(NSMutableDictionary *)knownAppsByPath enumerateKeysAndObjectsUsingBlock:v46];
    v36 = v48;
    id v37 = v35;

    objc_sync_exit(obj);
  }
  else
  {
    id v37 = 0;
  }

  return v37;
}

- (void)_unregisterNotificationTokenInternal:(id)a3
{
  id v7 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableDictionary *)v4->_registrationsByToken count];
  [(NSMutableDictionary *)v4->_registrationsByToken setObject:0 forKeyedSubscript:v7];
  if (v5 && ![(NSMutableDictionary *)v4->_registrationsByToken count])
  {
    [(NSMutableDictionary *)v4->_knownAppsByPath removeAllObjects];
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    [v6 removeObserver:v4];
  }
  objc_sync_exit(v4);
}

- (void)unregisterNotificationToken:(id)a3 observer:(id)a4
{
  [a3 stringByAppendingFormat:@".%p", a4];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(DTApplicationWorkspaceObserver *)self _unregisterNotificationTokenInternal:v5];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(DTApplicationWorkspaceObserver *)self _notifyWithApplicationProxy:*(void *)(*((void *)&v9 + 1) + 8 * v8++) addition:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(DTApplicationWorkspaceObserver *)self _notifyWithApplicationProxy:*(void *)(*((void *)&v9 + 1) + 8 * v8++) addition:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownAppsByPath, 0);
  objc_storeStrong((id *)&self->_registrationsByToken, 0);
}

@end