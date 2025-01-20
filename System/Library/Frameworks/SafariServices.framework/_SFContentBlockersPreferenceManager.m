@interface _SFContentBlockersPreferenceManager
- (BOOL)hasEnabledContentBlockers;
- (_SFContentBlockersPreferenceManager)initWithPerSitePreferencesStore:(id)a3 extensionsController:(id)a4;
- (void)_checkForContentBlockers;
- (void)invalidate;
@end

@implementation _SFContentBlockersPreferenceManager

- (_SFContentBlockersPreferenceManager)initWithPerSitePreferencesStore:(id)a3 extensionsController:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_SFContentBlockersPreferenceManager;
  v8 = [(WBSContentBlockersPreferenceManager *)&v21 initWithPerSitePreferencesStore:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extensionsController, a4);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = [(SFWebExtensionsController *)v9->_extensionsController allContentBlockerManagers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v14++) addObserver:v9];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }

    [(_SFContentBlockersPreferenceManager *)v9 _checkForContentBlockers];
    v15 = v9;
  }

  return v9;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(SFWebExtensionsController *)self->_extensionsController allContentBlockerManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_checkForContentBlockers
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  self->_hasEnabledContentBlockers = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [(SFWebExtensionsController *)self->_extensionsController allContentBlockerManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v9 = objc_msgSend(v8, "extensions", v18);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([v8 extensionIsEnabled:*(void *)(*((void *)&v23 + 1) + 8 * j)])
              {
                self->_hasEnabledContentBlockers = 1;

                goto LABEL_27;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v18;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(SFWebExtensionsController *)self->_extensionsController allWebExtensionControllers];
  uint64_t v14 = [v3 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    while (2)
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v19 + 1) + 8 * k) anyWebExtensionContentBlockerEnabled])
        {
          self->_hasEnabledContentBlockers = 1;
          goto LABEL_27;
        }
      }
      uint64_t v15 = [v3 countByEnumeratingWithState:&v19 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_27:
}

- (BOOL)hasEnabledContentBlockers
{
  return self->_hasEnabledContentBlockers;
}

- (void).cxx_destruct
{
}

@end