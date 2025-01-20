@interface LSBundleInfoCachedValues
- (BOOL)BOOLForKey:(id)a3;
- (LSBundleInfoCachedValues)init;
- (NSDictionary)rawValues;
- (NSSet)allKeys;
- (id)URLForKey:(id)a3;
- (id)_expensiveDictionaryRepresentation;
- (id)_initWithKeys:(id)a3 forDictionary:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)arrayForKey:(id)a3 withValuesOfClass:(Class)a4;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryForKey:(id)a3 valuesOfClass:(Class)a4;
- (id)numberForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofType:(Class)a4;
- (id)objectsForKeys:(id)a3;
- (id)stringForKey:(id)a3;
@end

@implementation LSBundleInfoCachedValues

- (id)_initWithKeys:(id)a3 forDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 28, @"Invalid parameter not satisfying: %@", @"keys" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)LSBundleInfoCachedValues;
  v9 = [(LSPropertyList *)&v16 _init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    v11 = (void *)v9[1];
    v9[1] = v10;

    uint64_t v12 = [v8 copy];
    v13 = (void *)v9[2];
    v9[2] = v12;
  }
  return v9;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return [(LSBundleInfoCachedValues *)self objectForKey:a3 ofClass:a4 valuesOfClass:0];
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  id v8 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    uint64_t v9 = [(LSBundleInfoCachedValues *)self arrayForKey:v8 withValuesOfClass:a5];
  }
  else
  {
    if ((Class)objc_opt_class() == a4) {
      [(LSBundleInfoCachedValues *)self dictionaryForKey:v8 valuesOfClass:a5];
    }
    else {
    uint64_t v9 = [(LSBundleInfoCachedValues *)self objectForKey:v8 ofType:a4];
    }
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)objectForKey:(id)a3 ofType:(Class)a4
{
  id v7 = a3;
  if (![(NSSet *)self->_keys containsObject:v7])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 47, @"value for key='%@' not requested to be cached", v7 object file lineNumber description];
  }
  uint64_t v8 = [(NSDictionary *)self->_values objectForKey:v7];
  uint64_t v9 = (void *)v8;
  if (a4 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (id)stringForKey:(id)a3
{
  id v5 = a3;
  if (![(NSSet *)self->_keys containsObject:v5])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 67, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }
  values = self->_values;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(NSDictionary *)values objectForKey:v5];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (LSBundleInfoCachedValues)init
{
  v3 = [MEMORY[0x1E4F1CAD0] set];
  v4 = [(LSBundleInfoCachedValues *)self _initWithKeys:v3 forDictionary:MEMORY[0x1E4F1CC08]];

  return v4;
}

- (id)objectForKey:(id)a3
{
  return [(LSBundleInfoCachedValues *)self objectForKey:a3 ofType:0];
}

- (BOOL)BOOLForKey:(id)a3
{
  id v5 = a3;
  if (![(NSSet *)self->_keys containsObject:v5])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 52, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }
  BOOL v6 = [(NSDictionary *)self->_values _LS_BoolForKey:v5];

  return v6;
}

- (id)numberForKey:(id)a3
{
  id v5 = a3;
  if (![(NSSet *)self->_keys containsObject:v5])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 57, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }
  values = self->_values;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(NSDictionary *)values objectForKey:v5];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)URLForKey:(id)a3
{
  id v5 = a3;
  if (![(NSSet *)self->_keys containsObject:v5])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 62, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }
  values = self->_values;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(NSDictionary *)values objectForKey:v5];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)arrayForKey:(id)a3
{
  return [(LSBundleInfoCachedValues *)self arrayForKey:a3 withValuesOfClass:0];
}

- (id)arrayForKey:(id)a3 withValuesOfClass:(Class)a4
{
  id v7 = a3;
  Class v18 = a4;
  if (![(NSSet *)self->_keys containsObject:v7])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 79, @"value for key='%@' not requested to be cached", v7 object file lineNumber description];
  }
  values = self->_values;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [(NSDictionary *)values objectForKey:v7];
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  if (v11) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v18 count:1];
    char v15 = _LSIsArrayWithValuesOfClasses(v11, v14);

    if ((v15 & 1) == 0)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (id)dictionaryForKey:(id)a3
{
  return [(LSBundleInfoCachedValues *)self dictionaryForKey:a3 valuesOfClass:0];
}

- (id)dictionaryForKey:(id)a3 valuesOfClass:(Class)a4
{
  id v7 = a3;
  if (![(NSSet *)self->_keys containsObject:v7])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 97, @"value for key='%@' not requested to be cached", v7 object file lineNumber description];
  }
  values = self->_values;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [(NSDictionary *)values objectForKey:v7];
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  if (a4 && v11 && (_LSIsDictionaryWithKeysAndValuesOfClass(v11, 0, a4) & 1) == 0)
  {

    v11 = 0;
  }

  return v11;
}

- (id)objectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = [[LSBundleInfoCachedValues alloc] _initWithKeys:v4 forDictionary:self->_values];

  return v5;
}

- (id)_expensiveDictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_keys;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = -[NSDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v9, (void)v12);
        if (v10) {
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSDictionary)rawValues
{
  return self->_values;
}

- (NSSet)allKeys
{
  return self->_keys;
}

@end