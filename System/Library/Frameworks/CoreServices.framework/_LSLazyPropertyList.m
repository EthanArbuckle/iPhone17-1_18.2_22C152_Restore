@interface _LSLazyPropertyList
+ (BOOL)supportsSecureCoding;
+ (_LSDataBackedPropertyList)lazyPropertyListWithPropertyListData:(uint64_t)a1;
+ (_LSDictionaryBackedPropertyList)lazyPropertyListWithPropertyList:(uint64_t)a1;
+ (_LSLazyPropertyList)lazyPropertyListWithContext:(LSContext *)a3 unit:(unsigned int)a4;
+ (_LSLazyPropertyList)lazyPropertyListWithDatabase:(id)a3 unit:(unsigned int)a4;
+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a1;
+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a3 options:(uint64_t)a4 error:;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSLazyPropertyList)init;
- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)objectsForKeys:(id)a3;
- (id)propertyList;
- (id)uncheckedObjectsForKeys:(id)a3;
@end

@implementation _LSLazyPropertyList

+ (_LSLazyPropertyList)lazyPropertyListWithContext:(LSContext *)a3 unit:(unsigned int)a4
{
  if (a3) {
    a3 = (LSContext *)a3->db;
  }
  return (_LSLazyPropertyList *)[a1 lazyPropertyListWithDatabase:a3 unit:*(void *)&a4];
}

+ (_LSLazyPropertyList)lazyPropertyListWithDatabase:(id)a3 unit:(unsigned int)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6
    || !a4
    || (_LSPlistGet((uint64_t)v6, a4), (v8 = objc_claimAutoreleasedReturnValue()) == 0)
    || (+[_LSLazyPropertyList lazyPropertyListWithPropertyListData:]((uint64_t)a1, v8),
        v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    v9 = +[_LSEmptyPropertyList sharedInstance];
  }

  return (_LSLazyPropertyList *)v9;
}

+ (_LSDataBackedPropertyList)lazyPropertyListWithPropertyListData:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [[_LSDataBackedPropertyList alloc] initWithPropertyListData:v2];

  return v3;
}

- (_LSLazyPropertyList)init
{
  v3.receiver = self;
  v3.super_class = (Class)_LSLazyPropertyList;
  return (_LSLazyPropertyList *)[(LSPropertyList *)&v3 _init];
}

+ (_LSDictionaryBackedPropertyList)lazyPropertyListWithPropertyList:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 count])
  {
    objc_super v3 = [[_LSDictionaryBackedPropertyList alloc] initWithPropertyList:v2];
  }
  else
  {
    objc_super v3 = +[_LSEmptyPropertyList sharedInstance];
  }
  v4 = v3;

  return v4;
}

- (id)propertyList
{
  if (a1)
  {
    var8[0] = 0;
    [a1 _getPropertyList:var8];
    a1 = var8[0];
    unint64_t v1 = (unint64_t)var8[2];
  }
  return a1;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  v5 = [(_LSLazyPropertyList *)self objectForKey:a3 checkingKeyClass:a4 checkingValueClass:a5];

  return v5;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  v4 = [(_LSLazyPropertyList *)self objectForKey:a3 checkingKeyClass:a4 checkingValueClass:0];

  return v4;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (void *)MEMORY[0x18530F680]();
  if (!v9)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LSLazyPropertyList.mm", 204, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  id v25 = 0;
  BOOL v11 = [(_LSLazyPropertyList *)self _getValue:&v25 forPropertyListKey:v9];
  id v12 = v25;
  v13 = v12;
  if (v12) {
    BOOL v14 = v11;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v15 = v12;
    if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
      id v16 = v15;
LABEL_25:

      goto LABEL_26;
    }
    v13 = v15;
    if (a5)
    {
      if (_NSIsNSArray())
      {
        id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v17 = v15;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              if (objc_opt_isKindOfClass()) {
                [v16 addObject:v21];
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v18);
        }

        v13 = (void *)[v16 copy];
        goto LABEL_24;
      }
      v13 = v15;
      if (_NSIsNSDictionary())
      {
        v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = ___ZN14LaunchServices13PropertyListsL27filterValueFromPropertyListEP11objc_objectP10objc_classS4__block_invoke;
        v30[3] = &unk_1E522FBB8;
        Class v32 = a5;
        id v16 = v22;
        id v31 = v16;
        [v15 enumerateKeysAndObjectsUsingBlock:v30];
        v13 = (void *)[v16 copy];

        id v17 = v31;
LABEL_24:

        goto LABEL_25;
      }
    }
LABEL_26:
  }

  return v13;
}

+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  id v8 = 0;
  v4 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:options:error:](v3, v2, 1, (uint64_t)&v8);
  id v5 = v8;
  if (v4)
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:]((uint64_t)v2, v6);
    }
  }
  else
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:v6];
    }
  }

  return v4;
}

+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a3 options:(uint64_t)a4 error:
{
  id v6 = a2;
  uint64_t v7 = self;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:a3 error:a4];
  if (v8)
  {
    id v9 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListData:](v7, v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LSLazyPropertyList.mm", 152, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [(_LSLazyPropertyList *)self objectForKey:v11 ofClass:0];
        if (v12) {
          [v6 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v6 copy];

  return v13;
}

- (BOOL)_getPropertyList:(id *)a3
{
  return 0;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  return 0;
}

- (id)objectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x18530F680]();
  id v6 = [(_LSLazyPropertyList *)self uncheckedObjectsForKeys:v4];
  id v7 = [[LSBundleInfoCachedValues alloc] _initWithKeys:v4 forDictionary:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)lazyPropertyListWithPropertyListURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Failed to load plist data from %{private}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)lazyPropertyListWithPropertyListURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Loaded plist data at %{private}@ (don't know if valid yet)", (uint8_t *)&v2, 0xCu);
}

@end