@interface EFOrderedDictionary
+ (BOOL)supportsSecureCoding;
- (EFOrderedDictionary)init;
- (EFOrderedDictionary)initWithCoder:(id)a3;
- (NSArray)allValues;
- (NSCopying)firstKey;
- (NSCopying)lastKey;
- (NSDictionary)dictionary;
- (NSOrderedSet)allKeys;
- (id)_initWithOrderedKeys:(id)a3 objectsByKey:(id)a4;
- (id)firstObject;
- (id)keyAtIndex:(unint64_t)a3;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation EFOrderedDictionary

- (unint64_t)count
{
  return [(NSOrderedSet *)self->_orderedKeys count];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsByKey, 0);
  objc_storeStrong((id *)&self->_orderedKeys, 0);
}

- (id)_initWithOrderedKeys:(id)a3 objectsByKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EFOrderedDictionary;
  v9 = [(EFOrderedDictionary *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_orderedKeys, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (EFOrderedDictionary)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  v5 = [(EFOrderedDictionary *)self _initWithOrderedKeys:v3 objectsByKey:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [EFMutableOrderedDictionary alloc];
  orderedKeys = self->_orderedKeys;
  objectsByKey = self->_objectsByKey;
  return [(EFMutableOrderedDictionary *)v4 _initWithOrderedKeys:orderedKeys objectsByKey:objectsByKey];
}

- (NSCopying)firstKey
{
  return (NSCopying *)[(NSOrderedSet *)self->_orderedKeys firstObject];
}

- (id)firstObject
{
  objectsByKey = self->_objectsByKey;
  id v3 = [(EFOrderedDictionary *)self firstKey];
  id v4 = [(NSDictionary *)objectsByKey objectForKeyedSubscript:v3];

  return v4;
}

- (NSCopying)lastKey
{
  return (NSCopying *)[(NSOrderedSet *)self->_orderedKeys lastObject];
}

- (id)lastObject
{
  objectsByKey = self->_objectsByKey;
  id v3 = [(EFOrderedDictionary *)self lastKey];
  id v4 = [(NSDictionary *)objectsByKey objectForKeyedSubscript:v3];

  return v4;
}

- (NSDictionary)dictionary
{
  v2 = (void *)[(NSDictionary *)self->_objectsByKey copy];
  return (NSDictionary *)v2;
}

- (NSOrderedSet)allKeys
{
  v2 = (void *)[(NSOrderedSet *)self->_orderedKeys copy];
  return (NSOrderedSet *)v2;
}

- (NSArray)allValues
{
  id v3 = [(NSOrderedSet *)self->_orderedKeys array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__EFOrderedDictionary_allValues__block_invoke;
  v6[3] = &unk_1E6122EA8;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "ef_map:", v6);

  return (NSArray *)v4;
}

id __32__EFOrderedDictionary_allValues__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:a2];
  return v2;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  objectsByKey = self->_objectsByKey;
  id v4 = [(NSOrderedSet *)self->_orderedKeys objectAtIndexedSubscript:a3];
  v5 = [(NSDictionary *)objectsByKey objectForKeyedSubscript:v4];

  return v5;
}

- (unint64_t)indexOfKey:(id)a3
{
  return [(NSOrderedSet *)self->_orderedKeys indexOfObject:a3];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSOrderedSet *)self->_orderedKeys objectAtIndexedSubscript:a3];
}

- (id)objectForKey:(id)a3
{
  id v3 = [(EFOrderedDictionary *)self objectForKeyedSubscript:a3];
  return v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v3 = [(NSDictionary *)self->_objectsByKey objectForKeyedSubscript:a3];
  return v3;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  orderedKeys = self->_orderedKeys;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__EFOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E6122ED0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOrderedSet *)orderedKeys enumerateObjectsUsingBlock:v7];
}

void __57__EFOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v8 + 16))(v8, a3, v10, v9, a4);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  orderedKeys = self->_orderedKeys;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__EFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E6122ED0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NSOrderedSet *)orderedKeys enumerateObjectsWithOptions:a3 usingBlock:v9];
}

void __69__EFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v8 + 16))(v8, a3, v10, v9, a4);
}

- (void)enumerateKeysAndObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  orderedKeys = self->_orderedKeys;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__EFOrderedDictionary_enumerateKeysAndObjectsAtIndexes_options_usingBlock___block_invoke;
  v11[3] = &unk_1E6122ED0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(NSOrderedSet *)orderedKeys enumerateObjectsAtIndexes:a3 options:a4 usingBlock:v11];
}

void __75__EFOrderedDictionary_enumerateKeysAndObjectsAtIndexes_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v8 + 16))(v8, a3, v10, v9, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EFOrderedDictionary)initWithCoder:(id)a3
{
  id v30 = a3;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v28 = [v30 decodeObjectOfClasses:v13 forKey:@"EFPropertyKey_orderedKeys"];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
  v25 = [v30 decodeObjectOfClasses:v24 forKey:@"EFPropertyKey_objectsByKey"];

  v26 = [(EFOrderedDictionary *)self _initWithOrderedKeys:v28 objectsByKey:v25];
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_orderedKeys forKey:@"EFPropertyKey_orderedKeys"];
  [v4 encodeObject:self->_objectsByKey forKey:@"EFPropertyKey_objectsByKey"];
}

@end