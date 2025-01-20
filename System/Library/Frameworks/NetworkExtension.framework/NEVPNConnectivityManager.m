@interface NEVPNConnectivityManager
- (BOOL)hasRelayConfigurations;
- (BOOL)usesPolicyBasedRouting;
- (NEVPNConnectivityManager)initWithDelegate:(id)a3;
- (NEVPNConnectivityManagerDelegate)delegate;
- (id)toggleVPNConnectivity:(BOOL)a3;
- (unint64_t)connectivityState;
- (unint64_t)visibilityStyle;
- (void)cancelSessions:(void *)a3 withCompletionHandler:;
- (void)dealloc;
- (void)refreshConfigurations;
- (void)refreshConnectivityState;
- (void)sessionStatusDidChange:(id)a3;
- (void)setConnectivityState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasRelayConfigurations:(BOOL)a3;
- (void)setUsesPolicyBasedRouting:(BOOL)a3;
- (void)setVisibilityStyle:(unint64_t)a3;
@end

@implementation NEVPNConnectivityManager

void __45__NEVPNConnectivityManager_initWithDelegate___block_invoke(uint64_t a1)
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "NEVPNConnectivityManager: Configurations changed", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(NEVPNConnectivityManager *)WeakRetained refreshConfigurations];
}

- (void)refreshConfigurations
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 56, 1);
    objc_setProperty_atomic(a1, v4, 0, 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke;
    v5[3] = &unk_1E59932C0;
    v5[4] = a1;
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](a1, v3, v5);
  }
}

BOOL __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_51(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 VPN];
    if (v3)
    {
      BOOL v4 = 1;
    }
    else
    {
      v5 = [v2 appVPN];
      if (v5)
      {
        BOOL v4 = 1;
      }
      else
      {
        v6 = [v2 alwaysOnVPN];
        if (v6)
        {
          BOOL v4 = 1;
        }
        else
        {
          v7 = [v2 relay];
          BOOL v4 = v7 != 0;
        }
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v6;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to load NetworkExtension configurations: %@", buf, 0xCu);
    }
  }
  else
  {
    [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_17132];
    uint64_t v35 = v36 = v5;
    v8 = objc_msgSend(v5, "filteredArrayUsingPredicate:");
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v43 = [v8 count];
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Loaded %lu VPN configurations", buf, 0xCu);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
          v16 = [NEVPNConnectivitySession alloc];
          v18 = v16;
          v19 = *(void **)(a1 + 32);
          if (v19)
          {
            id Property = objc_getProperty(*(id *)(a1 + 32), v17, 48, 1);
            v16 = v18;
            v21 = v15;
            v22 = v19;
          }
          else
          {
            v21 = v15;
            v22 = 0;
            id Property = 0;
          }
          v23 = -[NEVPNConnectivitySession initWithConfiguration:delegate:queue:](v16, v21, v22, Property);
          v24 = ne_log_obj();
          v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_msgSend(objc_getProperty(v23, v26, 8, 1), "name");
              v29 = objc_msgSend(objc_getProperty(v23, v28, 8, 1), "identifier");
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = (uint64_t)v27;
              __int16 v44 = 2112;
              v45 = v29;
              _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEFAULT, "Now tracking VPN configuration %@ (%@)", buf, 0x16u);
            }
            [v10 addObject:v23];
          }
          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v30 = [v15 name];
              v31 = [v15 identifier];
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = (uint64_t)v30;
              __int16 v44 = 2112;
              v45 = v31;
              _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "Failed to track VPN configuration %@ (%@)", buf, 0x16u);
            }
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        uint64_t v12 = v32;
      }
      while (v32);
    }

    v34 = *(void **)(a1 + 32);
    if (v34)
    {
      objc_setProperty_atomic(v34, v33, v10, 56);
      v34 = *(void **)(a1 + 32);
    }
    id v6 = 0;
    [(NEVPNConnectivityManager *)v34 refreshConnectivityState];

    id v5 = v36;
    v7 = v35;
  }
}

- (void)refreshConnectivityState
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = a1;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    v80[3] = 0;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x2020000000;
    uint64_t v79 = 2;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    char v75 = 1;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    id v3 = objc_getProperty(a1, a2, 56, 1);
    v53 = (void *)[v3 copy];
    self = v2;

    uint64_t v4 = [v53 count];
    if (v4)
    {
      if (v4 == 1)
      {
        id v5 = [v53 firstObject];
        v7 = v5;
        if (v5) {
          id Property = objc_getProperty(v5, v6, 8, 1);
        }
        else {
          id Property = 0;
        }
        id v9 = Property;
        id v10 = [v9 relay];
        if (v10)
        {

          uint64_t v4 = 2;
        }
        else
        {
          uint64_t v11 = [v53 firstObject];
          uint64_t v13 = v11;
          if (v11) {
            id v14 = objc_getProperty(v11, v12, 8, 1);
          }
          else {
            id v14 = 0;
          }
          id v15 = v14;
          v16 = [v15 VPN];
          int v17 = [v16 isEnabled];

          if (v17) {
            uint64_t v4 = 1;
          }
          else {
            uint64_t v4 = 2;
          }
        }
      }
      else
      {
        uint64_t v4 = 2;
      }
    }
    v77[3] = v4;
    group = dispatch_group_create();
    if (v77[3])
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v19 = v53;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v66 objects:v86 count:16];
      if (!v21) {
        goto LABEL_38;
      }
      uint64_t v22 = *(void *)v67;
      while (1)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v67 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v66 + 1) + 8 * v23);
          if (v24) {
            id v25 = objc_getProperty(*(id *)(*((void *)&v66 + 1) + 8 * v23), v20, 8, 1);
          }
          else {
            id v25 = 0;
          }
          id v26 = v25;
          v27 = [v26 appVPN];
          if (v27)
          {

LABEL_27:
            v77[3] = 2;
            goto LABEL_28;
          }
          if (v24) {
            id v30 = objc_getProperty(v24, v28, 8, 1);
          }
          else {
            id v30 = 0;
          }
          id v31 = v30;
          uint64_t v32 = [v31 alwaysOnVPN];
          BOOL v33 = v32 == 0;

          if (!v33) {
            goto LABEL_27;
          }
LABEL_28:
          if (v24) {
            id v34 = objc_getProperty(v24, v29, 8, 1);
          }
          else {
            id v34 = 0;
          }
          id v35 = v34;
          id v36 = [v35 relay];
          BOOL v37 = v36 == 0;

          if (!v37) {
            *((unsigned char *)v71 + 24) = 1;
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v38 = [v19 countByEnumeratingWithState:&v66 objects:v86 count:16];
        uint64_t v21 = v38;
        if (!v38)
        {
LABEL_38:

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id obj = v19;
          uint64_t v39 = [obj countByEnumeratingWithState:&v62 objects:v85 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v63 != v40) {
                  objc_enumerationMutation(obj);
                }
                v42 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                if (v42 && v42[2])
                {
                  uint64_t v43 = ne_log_obj();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    id v45 = objc_getProperty(v42, v44, 8, 1);
                    v46 = [v45 name];
                    id v48 = objc_getProperty(v42, v47, 8, 1);
                    v49 = [v48 identifier];
                    *(_DWORD *)buf = 138412546;
                    v82 = v46;
                    __int16 v83 = 2112;
                    v84 = v49;
                    _os_log_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_DEFAULT, "Fetching status of %@ (%@)", buf, 0x16u);
                  }
                  dispatch_group_enter(group);
                  id v51 = objc_getProperty(self, v50, 48, 1);
                  block[9] = MEMORY[0x1E4F143A8];
                  block[10] = 3221225472;
                  block[11] = __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke;
                  block[12] = &unk_1E5991958;
                  v59 = v80;
                  v60 = v74;
                  v61 = &v76;
                  block[13] = v42;
                  block[14] = self;
                  v58 = group;
                  ne_session_get_status();
                }
              }
              uint64_t v39 = [obj countByEnumeratingWithState:&v62 objects:v85 count:16];
            }
            while (v39);
          }

          id v2 = self;
          break;
        }
      }
    }
    v52 = objc_getProperty(v2, v18, 48, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_45;
    block[3] = &unk_1E5991980;
    block[4] = v2;
    block[5] = &v76;
    block[6] = v80;
    block[7] = &v70;
    block[8] = v74;
    dispatch_group_notify(group, v52, block);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(v74, 8);
    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(v80, 8);
  }
}

- (void)cancelSessions:(void *)a3 withCompletionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 count])
    {
      v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "Canceling sessions", buf, 2u);
      }

      id v9 = objc_getProperty(a1, v8, 48, 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke;
      block[3] = &unk_1E5992CA0;
      id v12 = v5;
      id v13 = v9;
      id v14 = v6;
      id v10 = v9;
      dispatch_async(v10, block);
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
}

void __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40, 1);
  }
  id v5 = Property;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 48, 1);
    uint64_t v8 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v8 = 0;
    id v7 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_2;
  v9[3] = &unk_1E5993278;
  v9[4] = v8;
  [v5 loadConfigurationsWithCompletionQueue:v7 handler:v9];
}

- (BOOL)hasRelayConfigurations
{
  return self->_hasRelayConfigurations;
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_45(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setVisibilityStyle:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setConnectivityState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [*(id *)(a1 + 32) setHasRelayConfigurations:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [*(id *)(a1 + 32) setUsesPolicyBasedRouting:0];
  if ((unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - 1) <= 1) {
    [*(id *)(a1 + 32) setUsesPolicyBasedRouting:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  }
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    unint64_t v4 = [v3 connectivityState];
    if (v3)
    {
      if (v4 > 5) {
        id v5 = @"NEVPNConnectivityStateInactive";
      }
      else {
        id v5 = off_1E59919C0[v4];
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v6 = [*(id *)(a1 + 32) visibilityStyle];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      id v7 = ", has relays";
    }
    else {
      id v7 = "";
    }
    int v8 = [*(id *)(a1 + 32) usesPolicyBasedRouting];
    id v9 = "does not use";
    int v13 = 138413058;
    id v14 = v5;
    __int16 v15 = 2048;
    if (v8) {
      id v9 = "uses";
    }
    uint64_t v16 = v6;
    __int16 v17 = 2082;
    v18 = v7;
    __int16 v19 = 2080;
    v20 = v9;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "VPN connectivity state is now %@, visibility state is now %ld%{public}s, %s policy-based routing", (uint8_t *)&v13, 0x2Au);
  }

  id v10 = [*(id *)(a1 + 32) delegate];
  uint64_t v11 = ne_log_obj();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEFAULT, "NEVPNConnectivityManager: invoking delegate", (uint8_t *)&v13, 2u);
    }

    [v10 connectivityManagerDidChange:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "NEVPNConnectivityManager: delegate is nil", (uint8_t *)&v13, 2u);
    }
  }
}

- (unint64_t)visibilityStyle
{
  return self->_visibilityStyle;
}

- (unint64_t)connectivityState
{
  return self->_connectivityState;
}

- (BOOL)usesPolicyBasedRouting
{
  return self->_usesPolicyBasedRouting;
}

- (void)setVisibilityStyle:(unint64_t)a3
{
  self->_visibilityStyle = a3;
}

- (void)setUsesPolicyBasedRouting:(BOOL)a3
{
  self->_usesPolicyBasedRouting = a3;
}

- (void)setHasRelayConfigurations:(BOOL)a3
{
  self->_hasRelayConfigurations = a3;
}

- (void)setConnectivityState:(unint64_t)a3
{
  self->_connectivityState = a3;
}

- (NEVPNConnectivityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEVPNConnectivityManagerDelegate *)WeakRetained;
}

void __45__NEVPNConnectivityManager_initWithDelegate___block_invoke_35(uint64_t a1, const char *a2)
{
}

- (NEVPNConnectivityManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NEVPNConnectivityManager;
  id v5 = [(NEVPNConnectivityManager *)&v21 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = [[NEConfigurationManager alloc] initForAllUsers];
    configManager = v6->_configManager;
    v6->_configManager = v7;

    *(_OWORD *)&v6->_visibilityStyle = xmmword_19DF9BF50;
    v6->_hasRelayConfigurations = 0;
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("Connectivity manager queue", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v6);
    id v12 = v6->_configManager;
    int v13 = v6->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__NEVPNConnectivityManager_initWithDelegate___block_invoke;
    v18[3] = &unk_1E5992DE0;
    objc_copyWeak(&v19, &location);
    [(NEConfigurationManager *)v12 setChangedQueue:v13 andHandler:v18];
    id v14 = v6->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__NEVPNConnectivityManager_initWithDelegate___block_invoke_35;
    block[3] = &unk_1E59932C0;
    __int16 v17 = v6;
    dispatch_async(v14, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)sessionStatusDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 8, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = [Property name];
    if (v4) {
      id v10 = objc_getProperty(v4, v8, 8, 1);
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = [v10 identifier];
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "Session status of %@ (%@) changed", (uint8_t *)&v13, 0x16u);
  }
  [(NEVPNConnectivityManager *)self refreshConnectivityState];
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 8, 1);
    }
    int v8 = [Property name];
    id v9 = *(id *)(a1 + 32);
    if (v9) {
      id v9 = objc_getProperty(v9, v7, 8, 1);
    }
    id v10 = [v9 identifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v10;
    __int16 v41 = 2080;
    uint64_t v42 = ne_session_status_to_string();
    _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "VPN %@ (%@) is %s", buf, 0x20u);
  }
  self;
  if ((a2 - 1) > 4) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = qword_19DF9D250[a2 - 1];
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void *)(v13 + 24);
  if (v12 == v14 || v14 == 2)
  {
    if ((unint64_t)(v12 - 1) > 1) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (v12 == 1)
  {
    *(void *)(v13 + 24) = 1;
LABEL_29:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v19 = *(id *)(a1 + 32);
      if (v19) {
        id v19 = objc_getProperty(v19, v11, 8, 1);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v19 usesPolicyBasedRouting];
    }
    goto LABEL_33;
  }
  if (v12 != 3)
  {
    if (v12 != 2) {
      goto LABEL_33;
    }
    id v16 = *(id *)(a1 + 32);
    if (v16) {
      id v16 = objc_getProperty(v16, v11, 8, 1);
    }
    uint64_t v17 = [v16 relay];

    if (v17) {
      uint64_t v18 = 5;
    }
    else {
      uint64_t v18 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18;
    goto LABEL_29;
  }
  if (v14 != 1) {
    *(void *)(v13 + 24) = 3;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 1) {
    goto LABEL_49;
  }
  v20 = *(void **)(a1 + 32);
  if (!v20) {
    goto LABEL_49;
  }
  if (!v20[2]) {
    goto LABEL_49;
  }
  uint64_t v21 = objc_msgSend(objc_getProperty(v20, v11, 8, 1), "VPN");
  if (!v21) {
    goto LABEL_49;
  }
LABEL_33:
  uint64_t v23 = (void *)v21;
  id v24 = *(id *)(a1 + 32);
  if (v24) {
    id v24 = objc_getProperty(v24, v22, 8, 1);
  }
  id v25 = [v24 VPN];
  int v26 = [v25 isOnDemandEnabled];

  if (v26)
  {
    v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = *(id *)(a1 + 32);
      if (v29) {
        id v29 = objc_getProperty(v29, v28, 8, 1);
      }
      id v31 = [v29 name];
      id v32 = *(id *)(a1 + 32);
      if (v32) {
        id v32 = objc_getProperty(v32, v30, 8, 1);
      }
      BOOL v33 = [v32 identifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = v31;
      __int16 v39 = 2112;
      uint64_t v40 = v33;
      _os_log_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEFAULT, "Fetching extended status of %@ (%@)", buf, 0x16u);
    }
    id v35 = *(void **)(a1 + 40);
    if (v35) {
      objc_getProperty(v35, v34, 48, 1);
    }
    id v36 = *(id *)(a1 + 48);
    ne_session_get_info();
  }
  else
  {
LABEL_49:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = MEMORY[0x19F3B92C0](v3);
    uint64_t v7 = MEMORY[0x1E4F14590];
    if (v6 == MEMORY[0x1E4F14590])
    {
      uint64_t v8 = xpc_dictionary_get_value(v5, "VPN");
      id v9 = (void *)v8;
      if (v8 && MEMORY[0x19F3B92C0](v8) == v7)
      {
        int64_t int64 = xpc_dictionary_get_int64(v9, "OnDemandAction");
        uint64_t v11 = ne_log_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id Property = *(id *)(a1 + 32);
          if (Property) {
            id Property = objc_getProperty(Property, v12, 8, 1);
          }
          __int16 v15 = [Property name];
          id v16 = *(id *)(a1 + 32);
          if (v16) {
            id v16 = objc_getProperty(v16, v14, 8, 1);
          }
          uint64_t v17 = [v16 identifier];
          int v39 = 134218498;
          int64_t v40 = int64;
          __int16 v41 = 2112;
          uint64_t v42 = v15;
          __int16 v43 = 2112;
          __int16 v44 = v17;
          _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "Got on demand action of %ld for %@ (%@)", (uint8_t *)&v39, 0x20u);
        }
        if (int64 == 2) {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
        }
      }
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    id v18 = *(id *)(a1 + 32);
    if (v18) {
      id v18 = objc_getProperty(v18, v4, 8, 1);
    }
    id v19 = [v18 VPN];
    v20 = [v19 protocol];
    uint64_t v21 = [v20 type];

    if (v21 == 4)
    {
      id v23 = *(id *)(a1 + 32);
      if (v23) {
        id v23 = objc_getProperty(v23, v22, 8, 1);
      }
      id v24 = [v23 VPN];
      id v25 = [v24 protocol];

      int v26 = [v25 providerBundleIdentifier];
      v27 = [v25 pluginType];
      uint64_t v28 = +[NELaunchServices pluginProxyWithIdentifier:v26 type:v27 pluginClass:5 extensionPoint:0];

      id v29 = [v25 providerBundleIdentifier];
      id v30 = [v25 pluginType];
      uint64_t v31 = +[NELaunchServices pluginProxyWithIdentifier:v29 type:v30 pluginClass:2 extensionPoint:0];

      if (!(v28 | v31))
      {
        id v32 = ne_log_obj();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = *(id *)(a1 + 32);
          if (v34) {
            id v34 = objc_getProperty(v34, v33, 8, 1);
          }
          id v36 = [v34 name];
          id v37 = *(id *)(a1 + 32);
          if (v37) {
            id v37 = objc_getProperty(v37, v35, 8, 1);
          }
          uint64_t v38 = [v37 identifier];
          int v39 = 138412546;
          int64_t v40 = (int64_t)v36;
          __int16 v41 = 2112;
          uint64_t v42 = v38;
          _os_log_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_DEFAULT, "Provider is not available for %@ (%@)", (uint8_t *)&v39, 0x16u);
        }
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)toggleVPNConnectivity:(BOOL)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(NEVPNConnectivityManager *)self setConnectivityState:1];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v4, 56, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = Property;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (!v7)
    {
LABEL_31:

      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F28798];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57 = @"No enabled VPN configurations are available";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      uint64_t v28 = (void *)[v26 initWithDomain:v27 code:2 userInfo:v6];
      goto LABEL_59;
    }
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v52;
    *(void *)&long long v9 = 138412290;
    long long v45 = v9;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v52 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
      if (v13)
      {
        if (objc_msgSend(objc_getProperty(*(id *)(*((void *)&v51 + 1) + 8 * v12), v8, 8, 1), "isEnabled"))
        {
          id v14 = objc_getProperty(v13, v8, 8, 1);
LABEL_12:
          __int16 v15 = objc_msgSend(v14, "VPN", v45);

          if (v15)
          {
            id v16 = ne_log_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              if (v13) {
                id v18 = objc_getProperty(v13, v17, 8, 1);
              }
              else {
                id v18 = 0;
              }
              id v19 = [v18 name];
              *(_DWORD *)buf = v45;
              v59 = v19;
              _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);
            }
            if (v13 && v13[2])
            {
              ne_session_start();
              uint64_t v28 = 0;
              goto LABEL_59;
            }
            v20 = ne_log_obj();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              if (v13) {
                id v22 = objc_getProperty(v13, v21, 8, 1);
              }
              else {
                id v22 = 0;
              }
              id v23 = [v22 name];
              *(_DWORD *)buf = v45;
              v59 = v23;
              _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "No ne_session available for %@", buf, 0xCu);
            }
          }
        }
      }
      else
      {
        char v24 = [0 isEnabled];
        id v14 = 0;
        if (v24) {
          goto LABEL_12;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v25 = [v6 countByEnumeratingWithState:&v51 objects:v60 count:16];
        uint64_t v10 = v25;
        if (!v25) {
          goto LABEL_31;
        }
        goto LABEL_6;
      }
    }
  }
  [(NEVPNConnectivityManager *)self setConnectivityState:3];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  if (self) {
    id v30 = objc_getProperty(self, v29, 56, 1);
  }
  else {
    id v30 = 0;
  }
  id v6 = v30;
  uint64_t v28 = (void *)[v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v28) {
    goto LABEL_59;
  }
  uint64_t v33 = *(void *)v48;
  *(void *)&long long v32 = 138412290;
  long long v46 = v32;
  do
  {
    id v34 = 0;
    do
    {
      if (*(void *)v48 != v33) {
        objc_enumerationMutation(v6);
      }
      id v35 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v34);
      if (v35)
      {
        if (!objc_msgSend(objc_getProperty(*(id *)(*((void *)&v47 + 1) + 8 * (void)v34), v31, 8, 1), "isEnabled"))goto LABEL_48; {
        id v36 = objc_getProperty(v35, v31, 8, 1);
        }
      }
      else
      {
        char v42 = [0 isEnabled];
        id v36 = 0;
        if ((v42 & 1) == 0) {
          goto LABEL_48;
        }
      }
      id v37 = objc_msgSend(v36, "VPN", v46, (void)v47);

      if (v37)
      {
        if (v35 && v35[2])
        {
          ne_session_stop();
        }
        else
        {
          uint64_t v38 = ne_log_obj();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            if (v35) {
              id v40 = objc_getProperty(v35, v39, 8, 1);
            }
            else {
              id v40 = 0;
            }
            __int16 v41 = [v40 name];
            *(_DWORD *)buf = v46;
            v59 = v41;
            _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "No ne_session available for %@", buf, 0xCu);
          }
        }
      }
LABEL_48:
      id v34 = (char *)v34 + 1;
    }
    while (v28 != v34);
    uint64_t v43 = [v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
    uint64_t v28 = (void *)v43;
  }
  while (v43);
LABEL_59:

  return v28;
}

- (void)dealloc
{
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 56, 1);
    objc_setProperty_atomic(self, v4, 0, 56);
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](self, v3, 0);
  }
  else
  {
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](0, 0, 0);
    id v3 = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)NEVPNConnectivityManager;
  [(NEVPNConnectivityManager *)&v5 dealloc];
}

void __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = dispatch_group_create();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_2;
        v16[3] = &unk_1E59932C0;
        uint64_t v17 = v2;
        long long v9 = v16;
        if (v7)
        {
          id Property = objc_getProperty(v7, v8, 40, 1);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __56__NEVPNConnectivitySession_cancelWithCompletionHandler___block_invoke;
          block[3] = &unk_1E59936F8;
          void block[4] = v7;
          id v23 = v9;
          dispatch_async(Property, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v4);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5993770;
  uint64_t v11 = *(NSObject **)(v12 + 40);
  id v15 = *(id *)(v12 + 48);
  dispatch_group_notify(v2, v11, v14);
}

void __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end