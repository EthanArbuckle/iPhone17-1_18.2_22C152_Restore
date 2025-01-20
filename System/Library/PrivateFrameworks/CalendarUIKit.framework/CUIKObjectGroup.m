@interface CUIKObjectGroup
+ (id)_identifierForObject:(id)a3;
+ (id)_objectMapForObjects:(id)a3;
- (BOOL)_newSeriesSpawnedWithObject:(id)a3;
- (BOOL)objectsBelongInGroup:(id)a3;
- (CUIKObjectGroup)initWithObjects:(id)a3;
- (CalDefaultDictionary)spawnedObjectIdentifiers;
- (NSDictionary)originalObjectMap;
- (NSMutableDictionary)objectMap;
- (id)description;
- (id)objectIdentifiers;
- (id)objects;
- (id)originalObjects;
- (id)shiftedOccurrencePreviouslySpawnedByIdentifier:(id)a3;
- (void)newObject:(id)a3 spawnedFromObject:(id)a4;
- (void)setObjectMap:(id)a3;
- (void)setOriginalObjectMap:(id)a3;
- (void)setSpawnedObjectIdentifiers:(id)a3;
@end

@implementation CUIKObjectGroup

- (CUIKObjectGroup)initWithObjects:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CUIKObjectGroup;
  v5 = [(CUIKObjectGroup *)&v11 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _objectMapForObjects:v4];
    [(CUIKObjectGroup *)v5 setOriginalObjectMap:v6];

    v7 = (void *)MEMORY[0x1E4F1CA60];
    v8 = [(CUIKObjectGroup *)v5 originalObjectMap];
    v9 = [v7 dictionaryWithDictionary:v8];
    [(CUIKObjectGroup *)v5 setObjectMap:v9];
  }
  return v5;
}

+ (id)_objectMapForObjects:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "copy", (void)v15);
        v13 = [a1 _identifierForObject:v11];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_identifierForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 eventOccurrenceID];
  }
  else {
  id v4 = [v3 uniqueIdentifier];
  }

  return v4;
}

- (BOOL)_newSeriesSpawnedWithObject:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 uniqueIdentifier];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];
  id v6 = [v5 keys];

  uint64_t v23 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v7 = *(void *)v30;
    uint64_t v21 = *(void *)v30;
    v22 = self;
    v24 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v10 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];
        objc_super v11 = [v10 existingObjectForKey:v9];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [MEMORY[0x1E4F255F0] recurrenceIdentifierWithString:*(void *)(*((void *)&v25 + 1) + 8 * i)];
              long long v17 = [v16 localUID];
              char v18 = [v17 isEqualToString:v4];

              if (v18)
              {

                BOOL v19 = 1;
                id v6 = v24;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        ++v8;
        self = v22;
        id v6 = v24;
        uint64_t v7 = v21;
      }
      while (v8 != v23);
      BOOL v19 = 0;
      uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_19:

  return v19;
}

- (BOOL)objectsBelongInGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        objc_super v11 = [(id)objc_opt_class() _identifierForObject:v10];
        uint64_t v12 = [(CUIKObjectGroup *)self originalObjectMap];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          ++v7;
        }
        else
        {
          BOOL v14 = [(CUIKObjectGroup *)self _newSeriesSpawnedWithObject:v10];

          if (!v14)
          {

            BOOL v15 = 0;
            goto LABEL_21;
          }
          ++v20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v7 = 0;
  }

  long long v16 = [(CUIKObjectGroup *)self originalObjectMap];
  uint64_t v17 = [v16 count];

  BOOL v15 = v17 == v7 || v17 == v7 + v20;
LABEL_21:

  return v15;
}

- (void)newObject:(id)a3 spawnedFromObject:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() _identifierForObject:v6];
  uint64_t v8 = [(CUIKObjectGroup *)self originalObjectMap];
  uint64_t v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 isMainOccurrence])
      {
        uint64_t v10 = [v6 localUID];

        uint64_t v7 = (void *)v10;
      }
    }
  }
  objc_super v11 = [(CUIKObjectGroup *)self originalObjectMap];
  uint64_t v12 = [v11 objectForKey:v7];

  if (v12)
  {
    uint64_t v13 = [(id)objc_opt_class() _identifierForObject:v19];
    if (([v13 isEqualToString:v7] & 1) == 0)
    {
      BOOL v14 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];

      if (!v14)
      {
        BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F576D8]) initWithDefaultClass:objc_opt_class()];
        [(CUIKObjectGroup *)self setSpawnedObjectIdentifiers:v15];
      }
      long long v16 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];
      uint64_t v17 = [v16 objectForKey:v7];
      [v17 addObject:v13];

      char v18 = [(CUIKObjectGroup *)self objectMap];
      [v18 setObject:v19 forKeyedSubscript:v13];
    }
  }
}

- (id)shiftedOccurrencePreviouslySpawnedByIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F255F0] recurrenceIdentifierWithString:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];
  uint64_t v7 = [v6 existingObjectForKey:v4];

  id v8 = (id)[v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v17 = v4;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [MEMORY[0x1E4F255F0] recurrenceIdentifierWithString:v11];
        uint64_t v13 = [v12 localUID];
        BOOL v14 = [v5 localUID];
        char v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          id v8 = v11;

          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
LABEL_11:
    id v4 = v17;
  }

  return v8;
}

- (id)objectIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(CUIKObjectGroup *)self objectMap];
  id v4 = [v3 allKeys];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)objects
{
  v2 = [(CUIKObjectGroup *)self objectMap];
  id v3 = [v2 allValues];

  return v3;
}

- (id)originalObjects
{
  v2 = [(CUIKObjectGroup *)self originalObjectMap];
  id v3 = [v2 allValues];

  return v3;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(CUIKObjectGroup *)self originalObjectMap];
  uint64_t v5 = [v4 allKeys];
  [v3 appendFormat:@"originalIdentifiers: %@ \n", v5];

  id v6 = [(CUIKObjectGroup *)self objectIdentifiers];
  [v3 appendFormat:@"currentIdentifiers: %@ \n", v6];

  uint64_t v7 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];

  if (v7)
  {
    id v8 = [(CUIKObjectGroup *)self spawnedObjectIdentifiers];
    uint64_t v9 = [v8 finalDictionary];
    [v3 appendFormat:@"spawnedIdentifiers: %@", v9];
  }

  return v3;
}

- (NSDictionary)originalObjectMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOriginalObjectMap:(id)a3
{
}

- (NSMutableDictionary)objectMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObjectMap:(id)a3
{
}

- (CalDefaultDictionary)spawnedObjectIdentifiers
{
  return (CalDefaultDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSpawnedObjectIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spawnedObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_objectMap, 0);

  objc_storeStrong((id *)&self->_originalObjectMap, 0);
}

@end