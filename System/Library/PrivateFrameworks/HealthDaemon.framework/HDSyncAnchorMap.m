@interface HDSyncAnchorMap
+ (BOOL)supportsSecureCoding;
+ (HDSyncAnchorMap)syncAnchorMapWithCodableSyncAnchorRangeMap:(id)a3;
+ (HDSyncAnchorMap)syncAnchorMapWithDictionary:(id)a3;
+ (HDSyncAnchorMap)syncAnchorMapWithSyncAnchorRangeMap:(id)a3;
- (BOOL)isAllZero;
- (BOOL)isEqual:(id)a3;
- (HDSyncAnchorMap)initWithCoder:(id)a3;
- (NSString)description;
- (id)anchorIfPresentForSyncEntityIdentifier:(id)a3;
- (id)codableSyncAnchorRangeMap;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)anchorForSyncEntityClass:(Class)a3;
- (int64_t)anchorForSyncEntityIdentifier:(id)a3;
- (unint64_t)anchorCount;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAnchorsAndEntityIdentifiersWithBlock:(id)a3;
- (void)setAnchor:(int64_t)a3 forSyncEntity:(Class)a4;
- (void)setAnchor:(int64_t)a3 forSyncEntityIdentifier:(id)a4;
- (void)setAnchorsFromMap:(id)a3;
@end

@implementation HDSyncAnchorMap

- (void).cxx_destruct
{
}

- (void)setAnchor:(int64_t)a3 forSyncEntity:(Class)a4
{
  if (!a4)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDSyncAnchorMap.m", 68, @"Invalid parameter not satisfying: %@", @"syncEntityClass != Nil" object file lineNumber description];
  }
  id v9 = [(objc_class *)a4 syncEntityIdentifier];
  [(HDSyncAnchorMap *)self setAnchor:a3 forSyncEntityIdentifier:v9];
}

+ (HDSyncAnchorMap)syncAnchorMapWithCodableSyncAnchorRangeMap:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(HDSyncAnchorMap);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v3, "anchorRanges", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [HDSyncEntityIdentifier alloc];
        v12 = [v10 entityIdentifier];
        v13 = [(HDSyncEntityIdentifier *)v11 initWithCodableEntityIdentifier:v12];

        -[HDSyncAnchorMap setAnchor:forSyncEntityIdentifier:](v4, "setAnchor:forSyncEntityIdentifier:", [v10 endAnchor], v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (HDSyncAnchorMap)syncAnchorMapWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HDSyncAnchorMap);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HDSyncAnchorMap_syncAnchorMapWithDictionary___block_invoke;
  v7[3] = &unk_1E6308470;
  v5 = v4;
  uint64_t v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __47__HDSyncAnchorMap_syncAnchorMapWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v4, "setAnchor:forSyncEntityIdentifier:", objc_msgSend(a3, "longLongValue"), v5);
}

- (id)codableSyncAnchorRangeMap
{
  id v3 = objc_alloc_init(HDCodableSyncAnchorRangeMap);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HDSyncAnchorMap_codableSyncAnchorRangeMap__block_invoke;
  v6[3] = &unk_1E62F5BE8;
  v4 = v3;
  uint64_t v7 = v4;
  [(HDSyncAnchorMap *)self enumerateAnchorsAndEntityIdentifiersWithBlock:v6];

  return v4;
}

void __44__HDSyncAnchorMap_codableSyncAnchorRangeMap__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v7 = objc_alloc_init(HDCodableSyncAnchorRange);
  [(HDCodableSyncAnchorRange *)v7 setStartAnchor:0];
  [(HDCodableSyncAnchorRange *)v7 setEndAnchor:a3];
  uint64_t v6 = [v5 codableEntityIdentifier];

  [(HDCodableSyncAnchorRange *)v7 setEntityIdentifier:v6];
  [*(id *)(a1 + 32) addAnchorRanges:v7];
}

- (void)setAnchor:(int64_t)a3 forSyncEntityIdentifier:(id)a4
{
  id v9 = a4;
  if (!self->_anchorsByEntityIdentifier)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
    self->_anchorsByEntityIdentifier = v6;
  }
  uint64_t v8 = [NSNumber numberWithLongLong:a3];
  [(NSMutableDictionary *)self->_anchorsByEntityIdentifier setObject:v8 forKeyedSubscript:v9];
}

- (int64_t)anchorForSyncEntityClass:(Class)a3
{
  if (!a3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDSyncAnchorMap.m", 83, @"Invalid parameter not satisfying: %@", @"syncEntityClass != Nil" object file lineNumber description];
  }
  id v5 = [(objc_class *)a3 syncEntityIdentifier];
  int64_t v6 = [(HDSyncAnchorMap *)self anchorForSyncEntityIdentifier:v5];

  return v6;
}

- (int64_t)anchorForSyncEntityIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_anchorsByEntityIdentifier objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)anchorIfPresentForSyncEntityIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_anchorsByEntityIdentifier objectForKeyedSubscript:a3];
}

- (void)enumerateAnchorsAndEntityIdentifiersWithBlock:(id)a3
{
  id v4 = a3;
  anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HDSyncAnchorMap_enumerateAnchorsAndEntityIdentifiersWithBlock___block_invoke;
  v7[3] = &unk_1E6308498;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)anchorsByEntityIdentifier enumerateKeysAndObjectsUsingBlock:v7];
}

void __65__HDSyncAnchorMap_enumerateAnchorsAndEntityIdentifiersWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, [a3 integerValue], a4);
}

- (void)setAnchorsFromMap:(id)a3
{
  id v4 = a3;
  anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  id v8 = v4;
  if (!anchorsByEntityIdentifier)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = self->_anchorsByEntityIdentifier;
    self->_anchorsByEntityIdentifier = v6;

    id v4 = v8;
    anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  }
  [(NSMutableDictionary *)anchorsByEntityIdentifier addEntriesFromDictionary:*((void *)v4 + 1)];
}

- (unint64_t)anchorCount
{
  return [(NSMutableDictionary *)self->_anchorsByEntityIdentifier count];
}

- (BOOL)isAllZero
{
  BOOL v3 = 1;
  if ([(NSMutableDictionary *)self->_anchorsByEntityIdentifier count])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 1;
    anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__HDSyncAnchorMap_isAllZero__block_invoke;
    v6[3] = &unk_1E63084C0;
    void v6[4] = &v7;
    [(NSMutableDictionary *)anchorsByEntityIdentifier enumerateKeysAndObjectsUsingBlock:v6];
    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

uint64_t __28__HDSyncAnchorMap_isAllZero__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 longLongValue];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (NSString)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_anchorsByEntityIdentifier;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        char v10 = [(NSMutableDictionary *)self->_anchorsByEntityIdentifier objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 integerValue];

        v12 = [NSString stringWithFormat:@"%@: %lld", v9, v11];
        [v3 addObject:v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v13 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)HDSyncAnchorMap;
  v14 = [(HDSyncAnchorMap *)&v17 description];
  long long v15 = [v13 stringWithFormat:@"<%@ %@>", v14, v3];

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  uint64_t v6 = (NSMutableDictionary *)v4[1];
  if (anchorsByEntityIdentifier != v6)
  {
    if (v6)
    {
      if (-[NSMutableDictionary isEqual:](anchorsByEntityIdentifier, "isEqual:")) {
        goto LABEL_5;
      }
      anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
    }
    if (![(NSMutableDictionary *)anchorsByEntityIdentifier count])
    {
      BOOL v7 = [v4[1] count] == 0;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
LABEL_5:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HDSyncAnchorMap);
  uint64_t v5 = [(NSMutableDictionary *)self->_anchorsByEntityIdentifier mutableCopy];
  anchorsByEntityIdentifier = v4->_anchorsByEntityIdentifier;
  v4->_anchorsByEntityIdentifier = (NSMutableDictionary *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  [v14 encodeObject:self->_anchorsByEntityIdentifier forKey:@"AnchorByEntityIdentifier"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_anchorsByEntityIdentifier;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 schemaIdentifier];

        if (!v11)
        {
          v12 = [(NSMutableDictionary *)self->_anchorsByEntityIdentifier objectForKeyedSubscript:v10];
          v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "entityIdentifier"));
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v14 encodeObject:v4 forKey:@"AnchorByObjectType"];
}

- (HDSyncAnchorMap)initWithCoder:(id)a3
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HDSyncAnchorMap;
  uint64_t v5 = [(HDSyncAnchorMap *)&v31 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    uint64_t v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AnchorByEntityIdentifier"];
    anchorsByEntityIdentifier = v5->_anchorsByEntityIdentifier;
    v5->_anchorsByEntityIdentifier = (NSMutableDictionary *)v9;

    if (!v5->_anchorsByEntityIdentifier)
    {
      v26 = v8;
      uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
      v33[0] = objc_opt_class();
      v33[1] = objc_opt_class();
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      v13 = [v11 setWithArray:v12];
      id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"AnchorByObjectType"];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
            if (!v5->_anchorsByEntityIdentifier)
            {
              long long v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              v22 = v5->_anchorsByEntityIdentifier;
              v5->_anchorsByEntityIdentifier = v21;
            }
            uint64_t v23 = +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, [v20 integerValue]);
            v24 = [v15 objectForKeyedSubscript:v20];
            [(NSMutableDictionary *)v5->_anchorsByEntityIdentifier setObject:v24 forKeyedSubscript:v23];

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v17);
      }

      uint64_t v8 = v26;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HDSyncAnchorMap)syncAnchorMapWithSyncAnchorRangeMap:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(HDSyncAnchorMap);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__HDSyncAnchorMap_HDSyncAnchorRangeMap__syncAnchorMapWithSyncAnchorRangeMap___block_invoke;
  v7[3] = &unk_1E62F5B78;
  uint64_t v5 = v4;
  uint64_t v8 = v5;
  [v3 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v7];

  return v5;
}

uint64_t __77__HDSyncAnchorMap_HDSyncAnchorRangeMap__syncAnchorMapWithSyncAnchorRangeMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) setAnchor:a4 forSyncEntityIdentifier:a2];
}

@end