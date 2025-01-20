@interface CDMAssetsUsages
+ (id)cdmAssetsUsageKeyToString:(int64_t)a3;
- (BOOL)addUsageForKey:(int64_t)a3 withAssetUsageValue:(id)a4;
- (CDMAssetsUsages)init;
- (id)getUsages;
@end

@implementation CDMAssetsUsages

- (CDMAssetsUsages)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDMAssetsUsages;
  v2 = [(CDMAssetsUsages *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    usages = v2->_usages;
    v2->_usages = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)addUsageForKey:(int64_t)a3 withAssetUsageValue:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:a3];

  if (v7)
  {
    usages = self->_usages;
    v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)usages setObject:v6 forKey:v9];
  }
  else
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = [NSNumber numberWithInteger:a3];
      int v13 = 136315394;
      v14 = "-[CDMAssetsUsages addUsageForKey:withAssetUsageValue:]";
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s No assets usage key string found for %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v7 != 0;
}

+ (id)cdmAssetsUsageKeyToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_2647A55D8[a3];
  }
}

- (void).cxx_destruct
{
}

- (id)getUsages
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableDictionary count](self->_usages, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_usages;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", objc_msgSend(v9, "integerValue", (void)v13));
        v11 = [(NSMutableDictionary *)self->_usages objectForKeyedSubscript:v9];
        [v3 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

@end