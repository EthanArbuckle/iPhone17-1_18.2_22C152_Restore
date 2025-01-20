@interface HDSyncAnchorRangeMap
+ (BOOL)supportsSecureCoding;
- (BOOL)getAnchorRange:(HDSyncAnchorRange *)a3 forSyncEntityIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HDSyncAnchorRangeMap)initWithCodableSyncAnchorRangeMap:(id)a3 error:(id *)a4;
- (HDSyncAnchorRangeMap)initWithCoder:(id)a3;
- (id)codableSyncAnchorRangeMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)anchorRangeCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAnchorRangesAndEntityIdentifiersWithBlock:(id)a3;
- (void)reset;
- (void)setAnchorRange:(HDSyncAnchorRange)a3 forSyncEntityIdentifier:(id)a4;
@end

@implementation HDSyncAnchorRangeMap

- (HDSyncAnchorRangeMap)initWithCodableSyncAnchorRangeMap:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HDSyncAnchorRangeMap;
  v7 = [(HDSyncAnchorRangeMap *)&v32 init];
  if (!v7) {
    goto LABEL_22;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v8 = [v6 anchorRanges];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v29;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
      if (![v13 hasStartAnchor]
        || ![v13 hasEndAnchor]
        || ![v13 hasEntityType])
      {
        v26 = @"Codable sync anchor range %@ does not contain all required fields.";
LABEL_25:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, v26, v13);

        v25 = 0;
        goto LABEL_26;
      }
      uint64_t v14 = [v13 startAnchor];
      if (v14 > [v13 endAnchor])
      {
        v26 = @"Codable sync anchor range %@ has a start anchor after its end anchor.";
        goto LABEL_25;
      }
      if ([v13 hasEntityIdentifier])
      {
        v15 = [HDSyncEntityIdentifier alloc];
        v16 = [v13 entityIdentifier];
        v17 = [(HDSyncEntityIdentifier *)v15 initWithCodableEntityIdentifier:v16];

        if (v17) {
          goto LABEL_15;
        }
      }
      id v18 = HDBuiltinSyncEntityClassForType([v13 entityType]);
      if (v18)
      {
        v17 = [v18 syncEntityIdentifier];
        if (!v17) {
          goto LABEL_16;
        }
LABEL_15:
        uint64_t v19 = HDSyncAnchorRangeMake([v13 startAnchor], objc_msgSend(v13, "endAnchor"));
        -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v7, "setAnchorRange:forSyncEntityIdentifier:", v19, v20, v17);

        goto LABEL_16;
      }
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        uint64_t v23 = [v13 entityType];
        *(_DWORD *)buf = 134217984;
        uint64_t v34 = v23;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "Codable sync anchor range contains invalid sync entity type (%lld) which will be ignored.", buf, 0xCu);
      }
LABEL_16:
      ++v12;
    }
    while (v10 != v12);
    uint64_t v24 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    uint64_t v10 = v24;
  }
  while (v24);
LABEL_21:

LABEL_22:
  v25 = v7;
LABEL_26:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[HDSyncAnchorRangeMap allocWithZone:](HDSyncAnchorRangeMap, "allocWithZone:") init];
  id v6 = (void *)[(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier mutableCopyWithZone:a3];
  if (v5) {
    objc_storeStrong((id *)&v5->_anchorRangesByEntityIdentifier, v6);
  }

  return v5;
}

- (id)codableSyncAnchorRangeMap
{
  v3 = objc_alloc_init(HDCodableSyncAnchorRangeMap);
  anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HDSyncAnchorRangeMap_codableSyncAnchorRangeMap__block_invoke;
  v7[3] = &unk_1E630E560;
  v5 = v3;
  v8 = v5;
  [(NSMutableDictionary *)anchorRangesByEntityIdentifier enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __49__HDSyncAnchorRangeMap_codableSyncAnchorRangeMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = a3;
  id v5 = a2;
  id v6 = objc_alloc_init(HDCodableSyncAnchorRange);
  if (v10)
  {
    uint64_t v7 = v10[1];
    uint64_t v8 = v10[2];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  [(HDCodableSyncAnchorRange *)v6 setStartAnchor:v7];
  [(HDCodableSyncAnchorRange *)v6 setEndAnchor:v8];
  -[HDCodableSyncAnchorRange setEntityType:](v6, "setEntityType:", [v5 entityIdentifier]);
  uint64_t v9 = [v5 codableEntityIdentifier];

  [(HDCodableSyncAnchorRange *)v6 setEntityIdentifier:v9];
  [*(id *)(a1 + 32) addAnchorRanges:v6];
}

- (void)setAnchorRange:(HDSyncAnchorRange)a3 forSyncEntityIdentifier:(id)a4
{
  int64_t end = a3.end;
  int64_t start = a3.start;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDSyncAnchorRangeMap.m", 151, @"Invalid parameter not satisfying: %@", @"syncEntityIdentifier != nil" object file lineNumber description];
  }
  if (!self->_anchorRangesByEntityIdentifier)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
    self->_anchorRangesByEntityIdentifier = v9;
  }
  uint64_t v11 = [_HDSyncAnchorRangeBox alloc];
  if (v11)
  {
    v15.receiver = v11;
    v15.super_class = (Class)_HDSyncAnchorRangeBox;
    uint64_t v12 = [(HDSyncAnchorRangeMap *)&v15 init];
    v13 = v12;
    if (v12)
    {
      v12->_anchorRangesByEntityIdentifier = (NSMutableDictionary *)start;
      v12[1].super.isa = (Class)end;
    }
  }
  else
  {
    v13 = 0;
  }
  [(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier setObject:v13 forKeyedSubscript:v8];
}

- (BOOL)getAnchorRange:(HDSyncAnchorRange *)a3 forSyncEntityIdentifier:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDSyncAnchorRangeMap.m", 162, @"Invalid parameter not satisfying: %@", @"syncEntityIdentifier != nil" object file lineNumber description];
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier objectForKeyedSubscript:v7];
  if (v8) {
    *a3 = *(HDSyncAnchorRange *)(v8 + 8);
  }
  BOOL v9 = v8 != 0;

  return v9;
}

- (void)enumerateAnchorRangesAndEntityIdentifiersWithBlock:(id)a3
{
  id v4 = a3;
  anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__HDSyncAnchorRangeMap_enumerateAnchorRangesAndEntityIdentifiersWithBlock___block_invoke;
  v7[3] = &unk_1E630E588;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)anchorRangesByEntityIdentifier enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __75__HDSyncAnchorRangeMap_enumerateAnchorRangesAndEntityIdentifiersWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v6 = a3;
    a3 = *(void *)(a3 + 8);
    uint64_t v7 = *(void *)(v6 + 16);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, a2, a3, v7, a4);
}

- (unint64_t)anchorRangeCount
{
  return [(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier count];
}

- (void)reset
{
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_anchorRangesByEntityIdentifier;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        uint64_t v10 = [(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier objectForKeyedSubscript:v9];
        if (v10)
        {
          uint64_t v12 = v10[1];
          uint64_t v11 = v10[2];
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
        }

        v13 = [NSString stringWithFormat:@"%@: (%lld, %lld)", v9, v12, v11];
        [v3 addObject:v13];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }

  objc_super v15 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)HDSyncAnchorRangeMap;
  v16 = [(HDSyncAnchorRangeMap *)&v20 description];
  v17 = [v3 componentsJoinedByString:@", "];
  id v18 = [v15 stringWithFormat:@"<%@ %@>", v16, v17];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
  uint64_t v6 = (NSMutableDictionary *)v4[1];
  if (anchorRangesByEntityIdentifier == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSMutableDictionary isEqual:](anchorRangesByEntityIdentifier, "isEqual:");
  }
  else {
LABEL_5:
  }
    char v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  [v14 encodeObject:self->_anchorRangesByEntityIdentifier forKey:@"AnchorRangesByEntityIdentifier"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_anchorRangesByEntityIdentifier;
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
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 schemaIdentifier];

        if (!v11)
        {
          uint64_t v12 = [(NSMutableDictionary *)self->_anchorRangesByEntityIdentifier objectForKeyedSubscript:v10];
          v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "entityIdentifier"));
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v14 encodeObject:v4 forKey:@"AnchorRangesByObjectType"];
}

- (HDSyncAnchorRangeMap)initWithCoder:(id)a3
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HDSyncAnchorRangeMap;
  uint64_t v5 = [(HDSyncAnchorRangeMap *)&v33 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    uint64_t v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AnchorRangesByEntityIdentifier"];
    anchorRangesByEntityIdentifier = v5->_anchorRangesByEntityIdentifier;
    v5->_anchorRangesByEntityIdentifier = (NSMutableDictionary *)v9;

    if (!v5->_anchorRangesByEntityIdentifier)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
      v35[0] = objc_opt_class();
      v35[1] = objc_opt_class();
      v35[2] = objc_opt_class();
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
      v13 = [v11 setWithArray:v12];
      id v28 = v4;
      id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"AnchorRangesByObjectType"];

      long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v16 = v5->_anchorRangesByEntityIdentifier;
      v5->_anchorRangesByEntityIdentifier = v15;

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v23 = [v17 objectForKeyedSubscript:v22];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                v25 = +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, [v22 integerValue]);
                uint64_t v26 = [v17 objectForKeyedSubscript:v22];
                [(NSMutableDictionary *)v5->_anchorRangesByEntityIdentifier setObject:v26 forKeyedSubscript:v25];
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v19);
      }

      id v4 = v28;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end