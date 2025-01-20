@interface HMLocalization
+ (id)sharedManager;
- (HMLocalization)init;
- (NSArray)stringTable;
- (id)getLocalizedOrCustomString:(id)a3;
- (id)getLocalizedString:(id)a3;
- (void)_updateLocalizedStrings;
- (void)handleLocaleDidChange:(id)a3;
@end

@implementation HMLocalization

uint64_t __31__HMLocalization_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_sharedObj;
  sharedManager_sharedObj = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (HMLocalization)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMLocalization;
  uint64_t v2 = [(HMLocalization *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HomeKit"];
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v3;

    [(HMLocalization *)v2 _updateLocalizedStrings];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_handleLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (void)_updateLocalizedStrings
{
  uint64_t v2 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  if (self) {
    self = (HMLocalization *)objc_getProperty(self, a2, 24, 1);
  }
  v4 = [(HMLocalization *)self localizations];
  v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v6 = [v3 preferredLocalizationsFromArray:v4 forPreferences:v5];

  objc_super v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EEF08F60];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * v11);
        if (v2) {
          id Property = objc_getProperty(v2, v8, 24, 1);
        }
        else {
          id Property = 0;
        }
        v15 = [Property pathsForResourcesOfType:@"strings" inDirectory:0 forLocalization:v12];
        if (v2) {
          id v16 = objc_getProperty(v2, v14, 24, 1);
        }
        else {
          id v16 = 0;
        }
        v17 = [v16 pathsForResourcesOfType:@"loctable" inDirectory:0 forLocalization:v12];
        if ([v15 count] || objc_msgSend(v17, "count"))
        {
          v19 = [v15 arrayByAddingObjectsFromArray:v17];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v29 != v21) {
                  objc_enumerationMutation(v19);
                }
                v23 = [*(id *)(*((void *)&v28 + 1) + 8 * i) lastPathComponent];
                v24 = [v23 stringByDeletingPathExtension];

                if (([v7 containsObject:v24] & 1) == 0) {
                  [v7 addObject:v24];
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v20);
          }

          goto LABEL_30;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      uint64_t v9 = v18;
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_30:

  os_unfair_lock_lock_with_options();
  uint64_t v25 = [v7 copy];
  stringTable = v2->_stringTable;
  v2->_stringTable = (NSArray *)v25;

  os_unfair_lock_unlock(&v2->_lock);
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HMLocalization_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_59049 != -1) {
    dispatch_once(&sharedManager_onceToken_59049, block);
  }
  uint64_t v2 = (void *)sharedManager_sharedObj;

  return v2;
}

- (id)getLocalizedOrCustomString:(id)a3
{
  id v4 = a3;
  v5 = [(HMLocalization *)self getLocalizedString:v4];
  v6 = v5;
  if (!v5 || [v5 isEqualToString:v4])
  {
    uint64_t v7 = [(HMLocalization *)self getLocalizedString:@"CUSTOM"];

    v6 = (void *)v7;
  }

  return v6;
}

- (id)getLocalizedString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(HMLocalization *)self stringTable];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [(NSBundle *)self->_bundle localizedStringForKey:v4 value:&stru_1EEE9DD88 table:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          if (![v4 isEqualToString:v10])
          {

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v10 = v4;
  }
  else
  {
    id v10 = 0;
  }
LABEL_13:

  return v10;
}

- (NSArray)stringTable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_stringTable;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_stringTable, 0);
}

- (void)handleLocaleDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HMLocalization_handleLocaleDidChange___block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __40__HMLocalization_handleLocaleDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocalizedStrings];
}

@end