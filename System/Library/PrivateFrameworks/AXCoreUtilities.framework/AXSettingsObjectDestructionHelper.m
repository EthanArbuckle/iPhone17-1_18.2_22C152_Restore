@interface AXSettingsObjectDestructionHelper
- (AXSettingsObjectDestructionHelper)initWithListenerAddress:(void *)a3 forSettings:(id)a4;
- (void)addPreferenceKey:(id)a3;
- (void)dealloc;
@end

@implementation AXSettingsObjectDestructionHelper

- (AXSettingsObjectDestructionHelper)initWithListenerAddress:(void *)a3 forSettings:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXSettingsObjectDestructionHelper;
  v7 = [(AXSettingsObjectDestructionHelper *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_listenerAddress = a3;
    objc_storeWeak((id *)&v7->_settings, v6);
    v9 = v8;
  }

  return v8;
}

- (void)addPreferenceKey:(id)a3
{
  id v4 = a3;
  preferenceKeys = self->_preferenceKeys;
  id v8 = v4;
  if (!preferenceKeys)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_preferenceKeys;
    self->_preferenceKeys = v6;

    id v4 = v8;
    preferenceKeys = self->_preferenceKeys;
  }
  [(NSMutableArray *)preferenceKeys addObject:v4];
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_preferenceKeys;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_settings);
        v10 = [NSNumber numberWithUnsignedLongLong:self->_listenerAddress];
        [WeakRetained unregisterUpdateBlockForPreferenceKey:v8 withListenerID:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)AXSettingsObjectDestructionHelper;
  [(AXSettingsObjectDestructionHelper *)&v11 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settings);
  objc_storeStrong((id *)&self->_preferenceKeys, 0);
}

@end