@interface GCControllerMetaDefaultsObserver
- (GCControllerMetaDefaultsObserver)init;
- (NSUserDefaults)metaDefaults;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation GCControllerMetaDefaultsObserver

- (GCControllerMetaDefaultsObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)GCControllerMetaDefaultsObserver;
  v2 = [(GCControllerMetaDefaultsObserver *)&v8 init];
  if (v2)
  {
    v3 = +[NSString stringWithFormat:@"%@%@.%@", &stru_26D27BBB8, @"com.apple.gamecontroller.settings", @"meta"];
    v4 = getGCSettingsLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "Initializing user defaults with suite = %@", buf, 0xCu);
    }

    uint64_t v5 = [objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:v3];
    metaDefaults = v2->_metaDefaults;
    v2->_metaDefaults = (NSUserDefaults *)v5;

    [(NSUserDefaults *)v2->_metaDefaults addObserver:v2 forKeyPath:@"settingsExist" options:3 context:kGCSettingsContext];
    [(NSUserDefaults *)v2->_metaDefaults addObserver:v2 forKeyPath:@"controllerSettingsExist" options:3 context:kGCSettingsContext];
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if ((void *)kGCSettingsContext == a6)
  {
    v12 = +[GCControllerSettings settingsDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __83__GCControllerMetaDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_26D22A8E8;
    id v15 = v10;
    id v16 = v11;
    dispatch_sync(v12, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GCControllerMetaDefaultsObserver;
    [(GCControllerMetaDefaultsObserver *)&v13 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

void __83__GCControllerMetaDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = *(__CFString **)(a1 + 32);
  if (v2 == @"settingsExist")
  {
    v39 = [*(id *)(a1 + 40) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    v40 = [*(id *)(a1 + 40) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    v41 = +[NSNull null];
    int v42 = [v39 isEqual:v41];

    if (v42)
    {
      uint64_t v43 = +[NSDictionary dictionary];

      v39 = (void *)v43;
    }
    v44 = +[NSNull null];
    int v45 = [v40 isEqual:v44];

    if (v45)
    {
      uint64_t v46 = +[NSDictionary dictionary];

      v40 = (void *)v46;
    }
    id v11 = +[NSMutableArray array];
    v47 = +[NSMutableArray array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v38 = v40;
    uint64_t v48 = [v38 countByEnumeratingWithState:&v100 objects:v110 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v101;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v101 != v50) {
            objc_enumerationMutation(v38);
          }
          uint64_t v52 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          v53 = [v39 objectForKeyedSubscript:v52];

          if (!v53) {
            [v11 addObject:v52];
          }
        }
        uint64_t v49 = [v38 countByEnumeratingWithState:&v100 objects:v110 count:16];
      }
      while (v49);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v54 = v39;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v96 objects:v109 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v97;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v97 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v96 + 1) + 8 * j);
          v60 = [v38 objectForKeyedSubscript:v59];

          if (!v60) {
            [v47 addObject:v59];
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v96 objects:v109 count:16];
      }
      while (v56);
    }
    id v71 = v54;

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v61 = +[GCControllerSettings settingsCustomizedChangedHandlers];
    uint64_t v62 = [v61 countByEnumeratingWithState:&v92 objects:v108 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v93;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v93 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = *(void *)(*((void *)&v92 + 1) + 8 * k);
          v67 = +[GCControllerSettings settingsCustomizedChangedHandlers];
          v68 = [v67 objectForKeyedSubscript:v66];
          ((void (**)(void, id, void *))v68)[2](v68, v11, v47);
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v92 objects:v108 count:16];
      }
      while (v63);
    }

    v3 = v71;
  }
  else
  {
    if (v2 != @"controllerSettingsExist") {
      return;
    }
    v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    uint64_t v5 = +[NSNull null];
    int v6 = [v3 isEqual:v5];

    if (v6)
    {
      uint64_t v7 = +[NSDictionary dictionary];

      v3 = (void *)v7;
    }
    objc_super v8 = +[NSNull null];
    int v9 = [v4 isEqual:v8];

    if (v9)
    {
      uint64_t v10 = +[NSDictionary dictionary];

      v4 = (void *)v10;
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v11 = v4;
    uint64_t v73 = [v11 countByEnumeratingWithState:&v88 objects:v107 count:16];
    if (v73)
    {
      v70 = v3;
      uint64_t v72 = *(void *)v89;
      id v69 = v11;
      do
      {
        for (uint64_t m = 0; m != v73; ++m)
        {
          if (*(void *)v89 != v72) {
            objc_enumerationMutation(v11);
          }
          uint64_t v13 = *(void *)(*((void *)&v88 + 1) + 8 * m);
          v14 = +[GCControllerSettings controllerSettingsCustomizedChangedHandlers];
          id v15 = [v14 objectForKeyedSubscript:v13];

          if (v15)
          {
            uint64_t v75 = m;
            id v16 = [v3 objectForKeyedSubscript:v13];
            v17 = [v11 objectForKeyedSubscript:v13];
            v18 = +[NSMutableArray array];
            v19 = +[NSMutableArray array];
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v20 = v17;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v84 objects:v106 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v85;
              do
              {
                for (uint64_t n = 0; n != v22; ++n)
                {
                  if (*(void *)v85 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v84 + 1) + 8 * n);
                  if (([v16 containsObject:v25] & 1) == 0) {
                    [v18 addObject:v25];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v84 objects:v106 count:16];
              }
              while (v22);
            }

            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v26 = v16;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v80 objects:v105 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v81;
              do
              {
                for (uint64_t ii = 0; ii != v28; ++ii)
                {
                  if (*(void *)v81 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v80 + 1) + 8 * ii);
                  if (([v20 containsObject:v31] & 1) == 0) {
                    [v19 addObject:v31];
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v80 objects:v105 count:16];
              }
              while (v28);
            }

            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            v74 = v15;
            id v32 = v15;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v104 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v77;
              do
              {
                for (uint64_t jj = 0; jj != v34; ++jj)
                {
                  if (*(void *)v77 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  v37 = [v32 objectForKeyedSubscript:*(void *)(*((void *)&v76 + 1) + 8 * jj)];
                  ((void (**)(void, uint64_t, void *, void *))v37)[2](v37, v13, v18, v19);
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v104 count:16];
              }
              while (v34);
            }

            id v11 = v69;
            v3 = v70;
            id v15 = v74;
            uint64_t m = v75;
          }
        }
        uint64_t v73 = [v11 countByEnumeratingWithState:&v88 objects:v107 count:16];
      }
      while (v73);
    }
    id v38 = v11;
  }
}

- (void)dealloc
{
}

- (NSUserDefaults)metaDefaults
{
  return self->_metaDefaults;
}

- (void).cxx_destruct
{
}

@end