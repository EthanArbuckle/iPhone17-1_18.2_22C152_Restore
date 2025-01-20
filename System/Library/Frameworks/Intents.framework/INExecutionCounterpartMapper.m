@interface INExecutionCounterpartMapper
+ (void)initialize;
- (BOOL)_filled;
- (INExecutionCounterpartMapper)init;
- (NSMutableDictionary)_mapping;
- (id)counterpartIdentifiersForLocalIdentifier:(id)a3;
- (id)localIdentifiersForCounterpartIdentifier:(id)a3;
- (os_unfair_lock_s)_lock;
- (void)dealloc;
- (void)installedApplicationsDidChange:(id)a3;
- (void)reset;
@end

@implementation INExecutionCounterpartMapper

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)_lock
{
  return self->_lock;
}

- (BOOL)_filled
{
  return self->_filled;
}

- (NSMutableDictionary)_mapping
{
  return self->_mapping;
}

- (id)counterpartIdentifiersForLocalIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  if (v5)
  {
    v6 = INCounterpartIdentifiersForApplicationRecord(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)localIdentifiersForCounterpartIdentifier:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
    __int16 v47 = 2112;
    id v48 = v4;
    _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] Starting counterpart mapping for bundle id: %@", buf, 0x16u);
  }
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __73__INExecutionCounterpartMapper_localIdentifiersForCounterpartIdentifier___block_invoke;
    v42[3] = &unk_1E55208F8;
    v42[4] = self;
    v31 = (void (**)(void))MEMORY[0x192F984C0](v42);
    v28 = [(NSMutableDictionary *)self->_mapping objectForKey:v4];
    if (v28)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
        __int16 v47 = 2112;
        id v48 = v4;
        __int16 v49 = 2112;
        v50 = v28;
        _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Found counterpart in local mapping: %@", buf, 0x20u);
      }
      v7 = v28;
      id v8 = v28;
    }
    else
    {
      if (self->_filled)
      {
        v9 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
          __int16 v47 = 2112;
          id v48 = v4;
          _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Mapping is filled and a counterpart was not found, returning nil", buf, 0x16u);
        }
        id v8 = 0;
      }
      else
      {
        [MEMORY[0x1E4F223C8] enumeratorWithOptions:1];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v10)
        {
          uint64_t v30 = *(void *)v39;
          *(void *)&long long v11 = 136315394;
          long long v26 = v11;
          while (2)
          {
            uint64_t v12 = 0;
            uint64_t v29 = v10;
            do
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v33 = v12;
              v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
              context = (void *)MEMORY[0x192F98250]();
              v14 = INCounterpartIdentifiersForApplicationRecord(v13);
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              id v15 = v14;
              uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v35;
                while (2)
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v35 != v17) {
                      objc_enumerationMutation(v15);
                    }
                    v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                    v20 = INSiriLogContextIntents;
                    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315650;
                      v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
                      __int16 v47 = 2112;
                      id v48 = v4;
                      __int16 v49 = 2112;
                      v50 = v19;
                      _os_log_impl(&dword_18CB2F000, v20, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Found counterpart: %@", buf, 0x20u);
                    }
                    v21 = -[NSMutableDictionary objectForKey:](self->_mapping, "objectForKey:", v19, v26);
                    if (!v21)
                    {
                      v21 = objc_opt_new();
                      [(NSMutableDictionary *)self->_mapping setObject:v21 forKey:v19];
                    }
                    v22 = [v13 bundleIdentifier];
                    [v21 addObject:v22];

                    if ([v19 isEqualToString:v4])
                    {
                      v23 = INSiriLogContextIntents;
                      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v26;
                        v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
                        __int16 v47 = 2112;
                        id v48 = v4;
                        _os_log_impl(&dword_18CB2F000, v23, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Counterpart and original match, stopping", buf, 0x16u);
                      }

                      LOBYTE(v16) = 1;
                      goto LABEL_34;
                    }
                  }
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }
LABEL_34:

              if (v16)
              {
                BOOL v24 = 0;
                goto LABEL_39;
              }
              uint64_t v12 = v33 + 1;
            }
            while (v33 + 1 != v29);
            uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
        BOOL v24 = 1;
LABEL_39:

        self->_filled = v24;
        id v8 = [(NSMutableDictionary *)self->_mapping objectForKey:v4];
      }
      v7 = 0;
    }

    v31[2]();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __73__INExecutionCounterpartMapper_localIdentifiersForCounterpartIdentifier___block_invoke(uint64_t a1)
{
}

- (void)reset
{
  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__INExecutionCounterpartMapper_reset__block_invoke;
  v6[3] = &unk_1E55208F8;
  v6[4] = self;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v6);
  id v4 = (NSMutableDictionary *)objc_opt_new();
  mapping = self->_mapping;
  self->_mapping = v4;

  self->_filled = 0;
  v3[2](v3);
}

void __37__INExecutionCounterpartMapper_reset__block_invoke(uint64_t a1)
{
}

- (void)installedApplicationsDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKey:@"isPlaceholder"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  if ((v8 & 1) == 0)
  {
    [(INExecutionCounterpartMapper *)self reset];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];

  v4.receiver = self;
  v4.super_class = (Class)INExecutionCounterpartMapper;
  [(INExecutionCounterpartMapper *)&v4 dealloc];
}

- (INExecutionCounterpartMapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)INExecutionCounterpartMapper;
  v2 = [(INExecutionCounterpartMapper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_super v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:v3 selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v4 addObserver:v3 selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    [(INExecutionCounterpartMapper *)v3 reset];
    v5 = v3;
  }
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end