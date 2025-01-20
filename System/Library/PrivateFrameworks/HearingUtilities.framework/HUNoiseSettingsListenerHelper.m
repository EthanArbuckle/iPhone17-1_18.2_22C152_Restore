@interface HUNoiseSettingsListenerHelper
- (HUNoiseSettingsListenerHelper)initWithListenerAddress:(id)a3;
- (void)addSelectorKey:(SEL)a3;
- (void)dealloc;
@end

@implementation HUNoiseSettingsListenerHelper

- (HUNoiseSettingsListenerHelper)initWithListenerAddress:(id)a3
{
  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)HUNoiseSettingsListenerHelper;
  v4 = [(HUNoiseSettingsListenerHelper *)&v7 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v4->_listenerAddress, v5);
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)addSelectorKey:(SEL)a3
{
  selectorKeys = self->_selectorKeys;
  if (!selectorKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v7 = self->_selectorKeys;
    self->_selectorKeys = v6;

    selectorKeys = self->_selectorKeys;
  }
  NSStringFromSelector(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)selectorKeys addObject:v8];
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
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
        v9 = +[HUNoiseSettings sharedInstance];
        SEL v10 = NSSelectorFromString(v8);
        id WeakRetained = objc_loadWeakRetained(&self->_listenerAddress);
        [v9 registerUpdateBlock:0 forRetrieveSelector:v10 withListener:WeakRetained];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)HUNoiseSettingsListenerHelper;
  [(HUNoiseSettingsListenerHelper *)&v12 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorKeys, 0);

  objc_destroyWeak(&self->_listenerAddress);
}

@end