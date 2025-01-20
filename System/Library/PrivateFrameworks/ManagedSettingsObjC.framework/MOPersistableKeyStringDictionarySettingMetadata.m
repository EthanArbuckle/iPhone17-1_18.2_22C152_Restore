@interface MOPersistableKeyStringDictionarySettingMetadata
- (BOOL)_isAcceptablePersistedArrayElement:(id)a3;
- (BOOL)_isAcceptableStringValue:(id)a3;
- (Class)persistableKeyClass;
- (MOPersistableKeyStringDictionarySettingMetadata)initWithSettingName:(id)a3 defaultDictionary:(id)a4 persistableKeyClass:(Class)a5 combineOperator:(int64_t)a6 rankedAllowedValues:(id)a7 maximumCount:(unint64_t)a8 isPublic:(BOOL)a9 scope:(id)a10 isPrivacySensitive:(BOOL)a11;
- (NSDictionary)defaultValue;
- (NSDictionary)rankedAllowedValues;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
- (int64_t)combineOperator;
- (unint64_t)maximumCount;
@end

@implementation MOPersistableKeyStringDictionarySettingMetadata

- (MOPersistableKeyStringDictionarySettingMetadata)initWithSettingName:(id)a3 defaultDictionary:(id)a4 persistableKeyClass:(Class)a5 combineOperator:(int64_t)a6 rankedAllowedValues:(id)a7 maximumCount:(unint64_t)a8 isPublic:(BOOL)a9 scope:(id)a10 isPrivacySensitive:(BOOL)a11
{
  v17 = (NSDictionary *)a7;
  v21.receiver = self;
  v21.super_class = (Class)MOPersistableKeyStringDictionarySettingMetadata;
  v18 = [(MOSettingMetadata *)&v21 initWithSettingName:a3 defaultValue:a4 isPublic:a9 scope:a10 isPrivacySensitive:a11];
  objc_storeStrong((id *)&v18->_persistableKeyClass, a5);
  v18->_combineOperator = a6;
  rankedAllowedValues = v18->_rankedAllowedValues;
  v18->_rankedAllowedValues = v17;

  v18->_maximumCount = a8;
  return v18;
}

- (NSDictionary)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOPersistableKeyStringDictionarySettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (NSDictionary *)v2;
}

- (id)persistableValueFromValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            v12 = [v6 objectForKeyedSubscript:v11];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [(MOPersistableKeyStringDictionarySettingMetadata *)self _isAcceptableStringValue:v12])
            {
              v22[0] = @"key";
              v13 = [v11 persistableValue];
              v22[1] = @"value";
              v23[0] = v13;
              v23[1] = v12;
              v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

              [v17 addObject:v14];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }

    v15 = (void *)[v17 copy];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)valueFromPersistableValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v4;
    id v5 = v4;
    long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (-[MOPersistableKeyStringDictionarySettingMetadata _isAcceptablePersistedArrayElement:](self, "_isAcceptablePersistedArrayElement:", v11, v18))
          {
            Class persistableKeyClass = self->_persistableKeyClass;
            v13 = [v11 objectForKeyedSubscript:@"key"];
            v14 = [(objc_class *)persistableKeyClass initializeWithPersistableValue:v13];

            v15 = [v11 objectForKeyedSubscript:@"value"];
            [v19 setObject:v15 forKeyedSubscript:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    v16 = (void *)[v19 copy];
    id v4 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)sanitizePersistableValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 count] <= self->_maximumCount)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            if (-[MOPersistableKeyStringDictionarySettingMetadata _isAcceptablePersistedArrayElement:](self, "_isAcceptablePersistedArrayElement:", v13, (void)v15))
            {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }

      id v6 = (void *)[v7 copy];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_isAcceptableStringValue:(id)a3
{
  v3 = [(NSDictionary *)self->_rankedAllowedValues objectForKeyedSubscript:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isAcceptablePersistedArrayElement:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"key"];
    if ([(objc_class *)self->_persistableKeyClass isValidPersistableRepresentation:v5])
    {
      id v6 = [v4 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
        && [(MOPersistableKeyStringDictionarySettingMetadata *)self _isAcceptableStringValue:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(MOPersistableKeyStringDictionarySettingMetadata *)self sanitizePersistableValue:a3];
  id v8 = [(MOPersistableKeyStringDictionarySettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      id v9 = [(MOPersistableKeyStringDictionarySettingMetadata *)self _combine:v7 with:v8];
    }
    else
    {
      id v9 = v7;
    }
    goto LABEL_7;
  }
  if (v8)
  {
    id v9 = v8;
LABEL_7:
    uint64_t v10 = v9;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (id)_combine:(id)a3 with:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(MOPersistableKeyStringDictionarySettingMetadata *)self valueFromPersistableValue:a3];
  id v8 = (void *)[v7 mutableCopy];

  long long v21 = v6;
  id v9 = [(MOPersistableKeyStringDictionarySettingMetadata *)self valueFromPersistableValue:v6];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v23 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v12 = [v8 objectForKeyedSubscript:v11];
        uint64_t v13 = [v9 objectForKeyedSubscript:v11];
        if (v12)
        {
          v14 = [(NSDictionary *)self->_rankedAllowedValues objectForKeyedSubscript:v12];
          long long v15 = [(NSDictionary *)self->_rankedAllowedValues objectForKeyedSubscript:v13];
          int64_t combineOperator = self->_combineOperator;
          if (combineOperator == 1) {
            goto LABEL_11;
          }
          if (!combineOperator)
          {
            uint64_t v17 = [v14 integerValue];
            if (v17 > [v15 integerValue]) {
              [v8 setObject:v13 forKeyedSubscript:v11];
            }
LABEL_11:
            uint64_t v18 = [v14 integerValue];
            if (v18 < [v15 integerValue]) {
              [v8 setObject:v13 forKeyedSubscript:v11];
            }
          }

          goto LABEL_15;
        }
        [v8 setObject:v13 forKeyedSubscript:v11];
LABEL_15:
      }
      uint64_t v23 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v23);
  }
  long long v19 = [(MOPersistableKeyStringDictionarySettingMetadata *)self persistableValueFromValue:v8];

  return v19;
}

- (Class)persistableKeyClass
{
  return self->_persistableKeyClass;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (NSDictionary)rankedAllowedValues
{
  return self->_rankedAllowedValues;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedAllowedValues, 0);
  objc_storeStrong((id *)&self->_persistableKeyClass, 0);
}

@end