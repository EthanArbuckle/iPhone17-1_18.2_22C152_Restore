@interface HCSettingsListenerHelper
- (HCSettingsListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4;
- (void)addSelectorKey:(SEL)a3;
- (void)dealloc;
@end

@implementation HCSettingsListenerHelper

- (HCSettingsListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HCSettingsListenerHelper;
  v7 = [(HCSettingsListenerHelper *)&v10 init];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_listenerAddress, v8);

    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  objc_destroyWeak(&location);
  return v7;
}

- (void)addSelectorKey:(SEL)a3
{
  selectorKeys = self->_selectorKeys;
  if (!selectorKeys)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_selectorKeys;
    self->_selectorKeys = v6;

    selectorKeys = self->_selectorKeys;
  }
  NSStringFromSelector(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)selectorKeys addObject:v8];
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_selectorKeys;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(NSString **)(*((void *)&v13 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        SEL v10 = NSSelectorFromString(v8);
        id v11 = objc_loadWeakRetained(&self->_listenerAddress);
        [WeakRetained registerUpdateBlock:0 forRetrieveSelector:v10 withListener:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)HCSettingsListenerHelper;
  [(HCSettingsListenerHelper *)&v12 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_listenerAddress);
}

@end