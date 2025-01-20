@interface IKDataBinding
- (IKDataBinding)initWithEntries:(id)a3;
- (NSDictionary)keyValues;
- (NSSet)dataBoundKeys;
- (NSSet)unresolvedKeys;
- (id)dataBoundKeysWithAnyOfAttributes:(unint64_t)a3;
- (id)keysWithAnyOfAttributes:(unint64_t)a3;
- (id)unresolvedKeysWithAnyOfAttributes:(unint64_t)a3;
- (void)markResolvedForKey:(id)a3;
- (void)setKeyValues:(id)a3;
- (void)setNeedsResolutionForAllKeys;
- (void)setNeedsResolutionForKey:(id)a3;
@end

@implementation IKDataBinding

- (IKDataBinding)initWithEntries:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)IKDataBinding;
  v5 = [(IKDataBinding *)&v37 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v14 = [v13 key];
          [v7 setObject:v13 forKeyedSubscript:v14];

          v15 = [v13 value];
          v16 = [v13 key];
          [v6 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }

    uint64_t v17 = [v7 copy];
    entriesByKey = v5->_entriesByKey;
    v5->_entriesByKey = (NSDictionary *)v17;

    uint64_t v19 = [v6 copy];
    keyValues = v5->_keyValues;
    v5->_keyValues = (NSDictionary *)v19;

    v21 = (void *)MEMORY[0x1E4F1CA80];
    v22 = [(NSDictionary *)v5->_keyValues allKeys];
    uint64_t v23 = [v21 setWithArray:v22];
    unresolvedKeys = v5->_unresolvedKeys;
    v5->_unresolvedKeys = (NSMutableSet *)v23;

    v25 = [MEMORY[0x1E4F1CA80] set];
    v26 = v5->_keyValues;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __33__IKDataBinding_initWithEntries___block_invoke;
    v31[3] = &unk_1E6DE6CA0;
    id v32 = v25;
    id v27 = v25;
    [(NSDictionary *)v26 enumerateKeysAndObjectsUsingBlock:v31];
    uint64_t v28 = [v27 copy];
    dataBoundKeys = v5->_dataBoundKeys;
    v5->_dataBoundKeys = (NSSet *)v28;
  }
  return v5;
}

void __33__IKDataBinding_initWithEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (NSSet)unresolvedKeys
{
  v3 = (void *)[(NSMutableSet *)self->_unresolvedKeys count];
  if (v3) {
    v3 = (void *)[(NSMutableSet *)self->_unresolvedKeys copy];
  }
  return (NSSet *)v3;
}

- (id)keysWithAnyOfAttributes:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_entriesByKey;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](self->_entriesByKey, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (([v11 attributes] & a3) != 0)
        {
          v12 = [v11 key];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    v13 = (void *)[v5 copy];
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (id)dataBoundKeysWithAnyOfAttributes:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_dataBoundKeys;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](self->_entriesByKey, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if ([v11 attributes] | a3)
        {
          v12 = [v11 key];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    v13 = (void *)[v5 copy];
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (id)unresolvedKeysWithAnyOfAttributes:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_unresolvedKeys;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](self->_entriesByKey, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if ([v11 attributes] | a3)
        {
          v12 = [v11 key];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    v13 = (void *)[v5 copy];
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (void)setNeedsResolutionForKey:(id)a3
{
}

- (void)setNeedsResolutionForAllKeys
{
  unresolvedKeys = self->_unresolvedKeys;
  id v4 = [(IKDataBinding *)self keyValues];
  v3 = [v4 allKeys];
  [(NSMutableSet *)unresolvedKeys addObjectsFromArray:v3];
}

- (void)markResolvedForKey:(id)a3
{
}

- (NSDictionary)keyValues
{
  return self->_keyValues;
}

- (void)setKeyValues:(id)a3
{
}

- (NSSet)dataBoundKeys
{
  return self->_dataBoundKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBoundKeys, 0);
  objc_storeStrong((id *)&self->_keyValues, 0);
  objc_storeStrong((id *)&self->_unresolvedKeys, 0);
  objc_storeStrong((id *)&self->_entriesByKey, 0);
}

@end