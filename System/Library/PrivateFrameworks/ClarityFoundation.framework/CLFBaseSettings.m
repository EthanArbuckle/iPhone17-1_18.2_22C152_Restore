@interface CLFBaseSettings
+ (NSArray)allPreferenceSelectorsAsStrings;
+ (NSString)domainName;
+ (void)deleteAllKeys;
- (CLFBaseSettings)init;
- (NSString)domainName;
- (id)observeUpdatesForSelector:(SEL)a3 handler:(id)a4;
- (id)preferenceKeyForSelector:(SEL)a3;
- (uint64_t)preferenceKeysBySelectorName;
- (void)_deleteAllKeys;
- (void)deleteAllKeys;
- (void)registerUpdateBlock:(id)a3 withListener:(id)a4;
@end

@implementation CLFBaseSettings

- (CLFBaseSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLFBaseSettings;
  v2 = [(AXBaseSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    preferenceKeysBySelectorName = v2->_preferenceKeysBySelectorName;
    v2->_preferenceKeysBySelectorName = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)observeUpdatesForSelector:(SEL)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = [[_CLFSettingsObserver alloc] initWithSettings:self settingsSelector:a3];
  [(AXBaseSettings *)self registerUpdateBlock:v6 forRetrieveSelector:a3 withListener:v7];

  return v7;
}

- (void)registerUpdateBlock:(id)a3 withListener:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend((id)objc_opt_class(), "allPreferenceSelectorsAsStrings", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(AXBaseSettings *)self registerUpdateBlock:v6 forRetrieveSelector:NSSelectorFromString(*(NSString **)(*((void *)&v13 + 1) + 8 * v12++)) withListener:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSString)domainName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 domainName];
}

- (void)deleteAllKeys
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__CLFBaseSettings_deleteAllKeys__block_invoke;
  v3[3] = &unk_2642F37D8;
  v3[4] = self;
  if (![(AXBaseSettings *)self _switchFromRootUserIfNecessary:v3]) {
    [(CLFBaseSettings *)self _deleteAllKeys];
  }
}

uint64_t __32__CLFBaseSettings_deleteAllKeys__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteAllKeys];
}

+ (void)deleteAllKeys
{
  id v4 = [a1 domainName];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v4];
  uint64_t v3 = v2;
  if (v2) {
    [v2 removePersistentDomainForName:v4];
  }
}

+ (NSArray)allPreferenceSelectorsAsStrings
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  if (self) {
    preferenceKeysBySelectorName = self->_preferenceKeysBySelectorName;
  }
  else {
    preferenceKeysBySelectorName = 0;
  }
  v5 = preferenceKeysBySelectorName;
  id v6 = NSStringFromSelector(a3);
  id v7 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v6];

  return v7;
}

- (uint64_t)preferenceKeysBySelectorName
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)_deleteAllKeys
{
  id v4 = [(CLFBaseSettings *)self domainName];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v4];
  uint64_t v3 = v2;
  if (v2) {
    [v2 removePersistentDomainForName:v4];
  }
}

- (void).cxx_destruct
{
}

+ (NSString)domainName
{
  return (NSString *)&stru_26C8F4C70;
}

@end