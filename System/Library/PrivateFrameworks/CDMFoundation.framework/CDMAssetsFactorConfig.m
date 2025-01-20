@interface CDMAssetsFactorConfig
- (BOOL)isFactorRequired:(id)a3;
- (CDMAssetsFactorConfig)initWithFactorToFoldersMapping:(id)a3;
- (NSMutableDictionary)factorToFoldersMapping;
- (NSMutableDictionary)factorToIsRequiredMapping;
- (id)getAllFactors;
- (id)getFactorToFoldersMapping;
- (id)getFactorToIsRequiredMapping;
- (id)getFoldersForFactor:(id)a3;
- (void)addEntriesFromCDMAssetsFactorConfig:(id)a3;
- (void)setFactorToIsRequiredMapping:(id)a3;
- (void)setIsRequiredForFactor:(id)a3 isRequired:(BOOL)a4;
@end

@implementation CDMAssetsFactorConfig

- (CDMAssetsFactorConfig)initWithFactorToFoldersMapping:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMAssetsFactorConfig;
  v5 = [(CDMAssetsFactorConfig *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
      factorToFoldersMapping = v5->_factorToFoldersMapping;
      v5->_factorToFoldersMapping = (NSMutableDictionary *)v6;
    }
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    factorToIsRequiredMapping = v5->_factorToIsRequiredMapping;
    v5->_factorToIsRequiredMapping = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (void)setIsRequiredForFactor:(id)a3 isRequired:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    factorToIsRequiredMapping = self->_factorToIsRequiredMapping;
    uint64_t v6 = NSNumber;
    id v7 = a3;
    id v8 = [v6 numberWithBool:v4];
    [(NSMutableDictionary *)factorToIsRequiredMapping setObject:v8 forKey:v7];
  }
}

- (id)getFactorToFoldersMapping
{
  return self->_factorToFoldersMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorToIsRequiredMapping, 0);
  objc_storeStrong((id *)&self->_factorToFoldersMapping, 0);
}

- (BOOL)isFactorRequired:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_factorToIsRequiredMapping objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_factorToIsRequiredMapping objectForKeyedSubscript:v4];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)factorToIsRequiredMapping
{
  return self->_factorToIsRequiredMapping;
}

- (NSMutableDictionary)factorToFoldersMapping
{
  return self->_factorToFoldersMapping;
}

- (id)getAllFactors
{
  return (id)[(NSMutableDictionary *)self->_factorToFoldersMapping allKeys];
}

- (id)getFactorToIsRequiredMapping
{
  return self->_factorToIsRequiredMapping;
}

- (void)setFactorToIsRequiredMapping:(id)a3
{
  if (a3) {
    self->_factorToIsRequiredMapping = (NSMutableDictionary *)[a3 mutableCopy];
  }
  else {
    self->_factorToFoldersMapping = 0;
  }
  MEMORY[0x270F9A758]();
}

- (void)addEntriesFromCDMAssetsFactorConfig:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [a3 getFactorToFoldersMapping];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v16;
      *(void *)&long long v6 = 136315394;
      long long v14 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_super v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v10, v14);
          v12 = [(NSMutableDictionary *)self->_factorToFoldersMapping objectForKeyedSubscript:v10];

          if (v12)
          {
            v13 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v14;
              v20 = "-[CDMAssetsFactorConfig addEntriesFromCDMAssetsFactorConfig:]";
              __int16 v21 = 2112;
              uint64_t v22 = v10;
              _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Skipping folders for %@", buf, 0x16u);
            }
          }
          else
          {
            [(NSMutableDictionary *)self->_factorToFoldersMapping setObject:v11 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v7);
    }
  }
}

- (id)getFoldersForFactor:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_factorToFoldersMapping objectForKey:a3];
}

@end