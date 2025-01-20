@interface DOCTagLocalStorage
+ (id)sharedAppGroupStorage;
- (DOCTagLocalStorage)init;
- (NSOrderedSet)discoveredTags;
- (NSOrderedSet)userTags;
- (NSUserDefaults)userDefaults;
- (id)_unarchivedTagsFromData:(id)a3;
- (int64_t)tagSerialNumber;
- (void)setDiscoveredTags:(id)a3;
- (void)setTagSerialNumber:(int64_t)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserTags:(id)a3;
@end

@implementation DOCTagLocalStorage

+ (id)sharedAppGroupStorage
{
  if (sharedAppGroupStorage_onceToken != -1) {
    dispatch_once(&sharedAppGroupStorage_onceToken, &__block_literal_global_224);
  }
  v2 = (void *)sharedAppGroupStorage_shared;
  return v2;
}

- (int64_t)tagSerialNumber
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"FinderTagSerialNumber"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSOrderedSet)discoveredTags
{
  int64_t v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"FinderTagsDiscovered"];
  v4 = [(DOCTagLocalStorage *)self _unarchivedTagsFromData:v3];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  }
  v7 = v6;

  return (NSOrderedSet *)v7;
}

- (NSOrderedSet)userTags
{
  int64_t v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"FinderTagsUser"];
  v4 = [(DOCTagLocalStorage *)self _unarchivedTagsFromData:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[DOCTag tagsLoadedFromUserDefaults];
  }
  v7 = v6;

  return (NSOrderedSet *)v7;
}

- (id)_unarchivedTagsFromData:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFFA08]);
    v5 = objc_msgSend(v4, "initWithObjects:", objc_msgSend(MEMORY[0x263EFF9D8], "classForKeyedUnarchiver"), objc_opt_class(), 0);
    id v26 = 0;
    id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v5 fromData:v3 error:&v26];
    id v7 = v26;
    if (v7)
    {
      v8 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v8 = docLogHandle;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[DOCTagLocalStorage _unarchivedTagsFromData:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
      }
      id v15 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = 0;
LABEL_10:

        goto LABEL_12;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = v6;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v16);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v15 = 0;
              id v7 = v5;
              goto LABEL_9;
            }
          }
          uint64_t v19 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      id v15 = v16;
    }
    id v16 = v5;
LABEL_9:

    id v6 = v16;
    v5 = v7;
    goto LABEL_10;
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

uint64_t __43__DOCTagLocalStorage_sharedAppGroupStorage__block_invoke()
{
  v0 = objc_alloc_init(DOCTagLocalStorage);
  uint64_t v1 = sharedAppGroupStorage_shared;
  sharedAppGroupStorage_shared = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DOCTagLocalStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCTagLocalStorage;
  v2 = [(DOCTagLocalStorage *)&v6 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DocumentManager.defaults"];
  userDefaults = v2->_userDefaults;
  v2->_userDefaults = (NSUserDefaults *)v3;

  return v2;
}

- (void)setTagSerialNumber:(int64_t)a3
{
  userDefaults = self->_userDefaults;
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSUserDefaults *)userDefaults setObject:v4 forKey:@"FinderTagSerialNumber"];
}

- (void)setUserTags:(id)a3
{
  id v13 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
  id v5 = v13;
  if (v5)
  {
    objc_super v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      objc_super v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DOCTagLocalStorage setUserTags:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"FinderTagsUser"];
  }
}

- (void)setDiscoveredTags:(id)a3
{
  id v13 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
  id v5 = v13;
  if (v5)
  {
    objc_super v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      objc_super v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DOCTagLocalStorage setDiscoveredTags:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"FinderTagsDiscovered"];
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_unarchivedTagsFromData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setUserTags:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDiscoveredTags:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end