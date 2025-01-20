@interface VSSubscriptionPropertyListStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
- (BOOL)load:(id *)a3;
- (BOOL)save:(id *)a3;
- (VSSubscriptionPropertyListStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)newCacheNodeForManagedObject:(id)a3;
- (id)newReferenceObjectForManagedObject:(id)a3;
- (void)updateCacheNode:(id)a3 fromManagedObject:(id)a4;
@end

@implementation VSSubscriptionPropertyListStore

- (VSSubscriptionPropertyListStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)VSSubscriptionPropertyListStore;
  v6 = [(NSAtomicStore *)&v12 initWithPersistentStoreCoordinator:a3 configurationName:a4 URL:a5 options:a6];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v8 = [(NSAtomicStore *)v6 metadata];
    v9 = (void *)[v7 initWithDictionary:v8];

    v10 = VSSubscriptionPropertyListStoreType();
    [v9 setObject:v10 forKey:*MEMORY[0x1E4F1BF88]];

    [(NSAtomicStore *)v6 setMetadata:v9];
  }
  return v6;
}

- (BOOL)load:(id *)a3
{
  v5 = [(VSSubscriptionPropertyListStore *)self URL];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5 options:0 error:a3];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:a3];
      BOOL v8 = v7 != 0;
      if (v7)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1C0A8], "vs_subscriptionEntityForVersion:", 0);
        v10 = [(VSSubscriptionPropertyListStore *)self persistentStoreCoordinator];
        v11 = [v10 managedObjectModel];
        objc_super v12 = [v11 entitiesByName];
        v13 = [v9 name];
        v21 = v12;
        if (v13)
        {
          v14 = [v12 objectForKey:v13];
          v15 = v14;
          if (v14)
          {
            v20 = v11;
            v16 = v10;
            id v17 = v14;

            v9 = v17;
            v10 = v16;
            v11 = v20;
          }
        }
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __40__VSSubscriptionPropertyListStore_load___block_invoke;
          v22[3] = &unk_1E6BD4590;
          v22[4] = self;
          id v23 = v9;
          id v24 = v18;
          [v7 enumerateKeysAndObjectsUsingBlock:v22];
        }
        [(NSAtomicStore *)self addCacheNodes:v18];
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:258 userInfo:0];
    BOOL v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __40__VSSubscriptionPropertyListStore_load___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = (void *)[v5 copy];
      v10 = [v7 objectIDForEntity:v8 referenceObject:v9];

      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C000]) initWithObjectID:v10];
      [*(id *)(a1 + 48) addObject:v11];
      objc_super v12 = [*(id *)(a1 + 40) attributesByName];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __40__VSSubscriptionPropertyListStore_load___block_invoke_2;
      v14[3] = &unk_1E6BD2D28;
      id v15 = v6;
      id v16 = v11;
      id v13 = v11;
      [v12 enumerateKeysAndObjectsUsingBlock:v14];
    }
  }
}

void __40__VSSubscriptionPropertyListStore_load___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(v5, "vs_propertyListKey");
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKey:v6];
    uint64_t v8 = objc_msgSend(v5, "vs_propertyListValueTransformer");
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 reverseTransformedValue:v7];

      id v7 = (void *)v10;
    }
    [*(id *)(a1 + 40) setValue:v7 forKey:v11];
  }
}

- (BOOL)save:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = self;
  id obj = [(NSAtomicStore *)self cacheNodes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v9 = [v8 objectID];
        uint64_t v10 = [v9 entity];
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        objc_super v12 = [v10 attributesByName];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __40__VSSubscriptionPropertyListStore_save___block_invoke;
        v27[3] = &unk_1E6BD2D28;
        v27[4] = v8;
        id v13 = v11;
        id v28 = v13;
        [v12 enumerateKeysAndObjectsUsingBlock:v27];

        v14 = objc_msgSend(v10, "vs_referenceValueAttribute");
        id v15 = objc_msgSend(v14, "vs_propertyListKey");
        if (v15)
        {
          id v16 = [v13 objectForKey:v15];
          if (v16) {
            [v25 setObject:v13 forKey:v16];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  id v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v25 format:200 options:0 error:a3];
  if (v17)
  {
    id v18 = [(VSSubscriptionPropertyListStore *)v23 URL];
    id v19 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v20 = [v18 URLByDeletingLastPathComponent];
    if (v20)
    {
      if (![v19 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:a3])goto LABEL_20; {
      if (v18)
      }
      {
        char v21 = [v17 writeToURL:v18 options:1073741825 error:a3];
LABEL_21:

        goto LABEL_22;
      }
    }
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:514 userInfo:0];
      char v21 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    char v21 = 0;
    goto LABEL_21;
  }
  char v21 = 0;
LABEL_22:

  return v21;
}

void __40__VSSubscriptionPropertyListStore_save___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) valueForKey:a2];
  uint64_t v6 = objc_msgSend(v12, "vs_propertyListValueTransformer");
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 transformedValue:v5];

    uint64_t v5 = (void *)v8;
  }
  uint64_t v9 = objc_msgSend(v12, "vs_propertyListKey");
  uint64_t v10 = (void *)v9;
  if (v5) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v9];
  }
}

- (id)newCacheNodeForManagedObject:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C000];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 objectID];
  uint64_t v8 = (void *)[v6 initWithObjectID:v7];

  [(VSSubscriptionPropertyListStore *)self updateCacheNode:v8 fromManagedObject:v5];
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [(NSAtomicStore *)self addCacheNodes:v9];

  return v8;
}

- (void)updateCacheNode:(id)a3 fromManagedObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 entity];
  uint64_t v8 = [v7 attributesByName];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__VSSubscriptionPropertyListStore_updateCacheNode_fromManagedObject___block_invoke;
  v11[3] = &unk_1E6BD2D28;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
}

void __69__VSSubscriptionPropertyListStore_updateCacheNode_fromManagedObject___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

- (id)newReferenceObjectForManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 entity];
  id v5 = objc_msgSend(v4, "vs_referenceValueAttribute");
  id v6 = [v5 name];
  id v7 = [v3 valueForKey:v6];

  uint64_t v8 = objc_msgSend(v5, "vs_propertyListValueTransformer");
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 transformedValue:v7];

    id v7 = (void *)v10;
  }
  if (!v7)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to construct reference object for managed object: %@", v3 format];
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The value parameter must not be nil."];
  }

  return v7;
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:0];
  }
  return 0;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:0];
  }
  return 0;
}

@end