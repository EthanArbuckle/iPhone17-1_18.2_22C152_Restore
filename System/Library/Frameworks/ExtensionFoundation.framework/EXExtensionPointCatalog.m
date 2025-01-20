@interface EXExtensionPointCatalog
- (EXExtensionPointCatalog)init;
- (EXExtensionPointCatalog)initWithEnumerator:(id)a3;
- (NSDictionary)extensionPointByIdentifierPlatform;
- (id)extensionPointForIdentifier:(id)a3;
- (id)extensionPointForIdentifier:(id)a3 platform:(unsigned int)a4;
@end

@implementation EXExtensionPointCatalog

- (EXExtensionPointCatalog)init
{
  v3 = +[EXEnumerator extensionPointDefinitionEnumerator];
  v4 = [(EXExtensionPointCatalog *)self initWithEnumerator:v3];

  return v4;
}

- (EXExtensionPointCatalog)initWithEnumerator:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EXExtensionPointCatalog;
  v5 = [(EXExtensionPointCatalog *)&v26 init];
  v6 = v5;
  if (v5)
  {
    v21 = v5;
    v7 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v14 = NSString;
          v15 = [v13 identifier];
          v16 = [v14 stringWithFormat:@"%@:%u", v15, objc_msgSend(v13, "platform")];

          v17 = (void *)[v13 copy];
          [v7 setObject:v17 forKeyedSubscript:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    uint64_t v18 = [v7 copy];
    v6 = v21;
    extensionPointByIdentifierPlatform = v21->_extensionPointByIdentifierPlatform;
    v21->_extensionPointByIdentifierPlatform = (NSDictionary *)v18;
  }
  return v6;
}

- (id)extensionPointForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(EXExtensionPointCatalog *)self extensionPointForIdentifier:v4 platform:dyld_get_active_platform()];

  return v5;
}

- (id)extensionPointForIdentifier:(id)a3 platform:(unsigned int)a4
{
  v5 = [NSString stringWithFormat:@"%@:%u", a3, *(void *)&a4];
  v6 = [(NSDictionary *)self->_extensionPointByIdentifierPlatform objectForKeyedSubscript:v5];

  return v6;
}

- (NSDictionary)extensionPointByIdentifierPlatform
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end