@interface IAMFigaroEvent
- (BOOL)matchesWithKey:(id)a3;
- (IAMFigaroEvent)initWithFigaroEventProperties:(id)a3;
- (NSDictionary)payload;
- (NSString)name;
- (id)decomposeKey:(id)a3;
- (id)serializeFigaroEventProperties:(id)a3 withPrefix:(id)a4;
- (int64_t)type;
- (void)setPayload:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IAMFigaroEvent

- (IAMFigaroEvent)initWithFigaroEventProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IAMFigaroEvent;
  v5 = [(IAMFigaroEvent *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(IAMFigaroEvent *)v5 setPayload:v4];
    [(IAMFigaroEvent *)v6 setType:0];
  }

  return v6;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setPayload:(id)a3
{
}

- (NSString)name
{
  v3 = [(IAMFigaroEvent *)self payload];
  id v4 = [(IAMFigaroEvent *)self serializeFigaroEventProperties:v3 withPrefix:0];

  return (NSString *)v4;
}

- (id)serializeFigaroEventProperties:(id)a3 withPrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = &stru_26CA141E0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__IAMFigaroEvent_serializeFigaroEventProperties_withPrefix___block_invoke;
  v11[3] = &unk_264346728;
  v13 = v15;
  v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  v14 = &v17;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = (id)v18[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __60__IAMFigaroEvent_serializeFigaroEventProperties_withPrefix___block_invoke(void *a1, void *a2, void *a3)
{
  id v17 = a3;
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = NSString;
  id v8 = &stru_26CA141E0;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    id v9 = &stru_26CA141E0;
  }
  else {
    id v9 = @"|";
  }
  if (isKindOfClass)
  {
    v10 = (void *)a1[4];
    v11 = [NSString stringWithFormat:@"%@_", v5];

    id v12 = [v10 serializeFigaroEventProperties:v17 withPrefix:v11];
    v13 = [v7 stringWithFormat:@"%@%@", v9, v12];
  }
  else
  {
    if (a1[5]) {
      id v8 = (__CFString *)a1[5];
    }
    v13 = [NSString stringWithFormat:@"%@%@%@:%@", v9, v8, v5, v17];

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  uint64_t v14 = [*(id *)(*(void *)(a1[7] + 8) + 40) stringByAppendingString:v13];
  uint64_t v15 = *(void *)(a1[7] + 8);
  char v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
}

- (BOOL)matchesWithKey:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [(IAMFigaroEvent *)self payload];
  id v7 = [v6 allKeys];
  id v8 = [v4 setWithArray:v7];

  id v9 = [(IAMFigaroEvent *)self decomposeKey:v5];

  v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [v9 ruleDestructuredIdentifiers];
  id v12 = [v11 allKeys];
  v13 = [v10 setWithArray:v12];

  if (([v13 count] || objc_msgSend(v9, "hasPredicates"))
    && [v13 isSubsetOfSet:v8]
    && ([v9 ruleDestructuredIdentifiers],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [(IAMFigaroEvent *)self payload],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v14 isSubsetOfDictionary:v15],
        v15,
        v14,
        v16))
  {
    id v17 = [(IAMFigaroEvent *)self payload];
    char v18 = [v9 predicatesMatchFigaroEventProperties:v17];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)decomposeKey:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v27 = objc_alloc_init(IAMDecomposedKey);
  v24 = v3;
  id v4 = [v3 componentsSeparatedByString:@"|"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = CFSTR("\\(");
    id v8 = @"\\");
    uint64_t v9 = *(void *)v29;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v6;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        if ([v11 hasPrefix:v7] && objc_msgSend(v11, "hasSuffix:", v8))
        {
          id v12 = objc_msgSend(v11, "substringWithRange:", 2, objc_msgSend(v11, "length") - 4);
          [(IAMDecomposedKey *)v27 addPredicateCondition:v12];
        }
        else
        {
          id v12 = [v11 componentsSeparatedByString:@":"];
          if ([v12 count] == 2)
          {
            v13 = [v12 objectAtIndexedSubscript:0];
            if ([v13 containsString:@"_"])
            {
              uint64_t v14 = [v13 componentsSeparatedByString:@"_"];
              uint64_t v15 = [v14 objectAtIndexedSubscript:1];
              v32 = v15;
              [v12 objectAtIndexedSubscript:1];
              int v16 = v8;
              id v17 = v7;
              uint64_t v19 = v18 = v4;
              v33 = v19;
              v20 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

              v21 = [(IAMDecomposedKey *)v27 ruleDestructuredIdentifiers];
              v22 = [v14 objectAtIndexedSubscript:0];
              [v21 setObject:v20 forKeyedSubscript:v22];

              uint64_t v9 = v25;
              id v4 = v18;
              id v7 = v17;
              id v8 = v16;
              uint64_t v6 = v26;
            }
            else
            {
              uint64_t v14 = [v12 objectAtIndexedSubscript:1];
              v20 = [(IAMDecomposedKey *)v27 ruleDestructuredIdentifiers];
              [v20 setObject:v14 forKeyedSubscript:v13];
            }
          }
        }

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }

  return v27;
}

- (int64_t)type
{
  return self->_type;
}

@end