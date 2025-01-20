@interface BSOrderedDictionary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BSOrderedDictionary)init;
- (BSOrderedDictionary)initWithCoder:(id)a3;
- (BSOrderedDictionary)initWithDictionary:(id)a3 keyOrderingStrategy:(id)a4;
- (BSOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (NSString)description;
- (id)_initTabulaRasa;
- (id)allKeys;
- (id)allValues;
- (id)filter:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)sortedDictionaryUsingComparator:(id)a3;
- (id)subdictionaryWithRange:(_NSRange)a3;
- (id)unorderedDictionary;
- (uint64_t)_initWithCopyOfOrderedDictionary:(void *)a1;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithIndexesUsingBlock:(id)a3;
@end

@implementation BSOrderedDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyOrderingStrategy, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)enumerateKeysAndObjectsWithIndexesUsingBlock:(id)a3
{
  uint64_t v5 = [(BSOrderedDictionary *)self count];
  uint64_t v6 = v5 - 1;
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      v8 = [(NSArray *)self->_keys objectAtIndex:v7];
      v9 = [(NSDictionary *)self->_values objectForKey:v8];
      unsigned __int8 v12 = 0;
      (*((void (**)(id, void *, void *, uint64_t, unsigned __int8 *))a3 + 2))(a3, v8, v9, v7, &v12);
      int v10 = v12;

      if (v10) {
        break;
      }
    }
    while (v6 != v7++);
  }
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_values objectForKey:a3];
}

- (unint64_t)count
{
  return [(NSArray *)self->_keys count];
}

- (id)_initTabulaRasa
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)BSOrderedDictionary;
  v3 = [(BSOrderedDictionary *)&v11 init];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class() && v4 != objc_opt_class() && v4 != objc_opt_class())
  {
    uint64_t v6 = [NSString stringWithFormat:@"subclassing not permitted"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v13 = v7;
      __int16 v14 = 2114;
      int v10 = (void *)v9;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      v17 = v3;
      __int16 v18 = 2114;
      v19 = @"BSOrderedDictionary.m";
      __int16 v20 = 1024;
      int v21 = 124;
      __int16 v22 = 2114;
      v23 = v6;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v6 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE9814);
  }
  return v3;
}

- (BSOrderedDictionary)init
{
  +[_BSEmptyOrderedDictionary emptyDictionary]();
  v3 = (BSOrderedDictionary *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_initWithCopyOfOrderedDictionary:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = [a1 _initTabulaRasa];
  if (v3)
  {
    uint64_t v4 = [a2[1] copy];
    uint64_t v5 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v4;

    uint64_t v6 = [a2[2] copy];
    id v7 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v6;

    objc_storeStrong((id *)(v3 + 24), a2[3]);
  }
  return v3;
}

- (BSOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v6 = [[BSMutableOrderedDictionary alloc] initWithObjects:a3 forKeys:a4 count:a5];
  id v7 = (BSOrderedDictionary *)[(BSMutableOrderedDictionary *)v6 copy];

  return v7;
}

- (BSOrderedDictionary)initWithDictionary:(id)a3 keyOrderingStrategy:(id)a4
{
  uint64_t v5 = [[BSMutableOrderedDictionary alloc] initWithDictionary:a3 keyOrderingStrategy:a4];
  uint64_t v6 = (BSOrderedDictionary *)[(BSMutableOrderedDictionary *)v5 copy];

  return v6;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_keys hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = a3;
  if ([(NSArray *)self->_keys isEqual:v5[1]]) {
    char v6 = [(NSDictionary *)self->_values isEqual:v5[2]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__BSOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v3[3] = &unk_1E5446F08;
  v3[4] = a3;
  [(BSOrderedDictionary *)self enumerateKeysAndObjectsWithIndexesUsingBlock:v3];
}

uint64_t __57__BSOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)filter:(id)a3
{
  uint64_t v5 = [(BSOrderedDictionary *)self count];
  char v6 = [[BSMutableOrderedDictionary alloc] initWithCapacity:v5 keyOrderingStrategy:self->_keyOrderingStrategy];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v8 = [(NSArray *)self->_keys objectAtIndex:i];
      uint64_t v9 = [(NSDictionary *)self->_values objectForKey:v8];
      if ((*((unsigned int (**)(id, void *, void *, uint64_t))a3 + 2))(a3, v8, v9, i)) {
        [(BSMutableOrderedDictionary *)v6 setObject:v8 forKey:v9];
      }
    }
  }
  return v6;
}

- (id)unorderedDictionary
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[BSOrderedDictionary count](self, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BSOrderedDictionary_unorderedDictionary__block_invoke;
  v7[3] = &unk_1E5446F30;
  id v4 = v3;
  id v8 = v4;
  [(BSOrderedDictionary *)self enumerateKeysAndObjectsWithIndexesUsingBlock:v7];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

uint64_t __42__BSOrderedDictionary_unorderedDictionary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (id)allKeys
{
  v2 = (void *)[(NSArray *)self->_keys copy];
  return v2;
}

- (id)allValues
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_keys, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_keys;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = -[NSDictionary objectForKey:](self->_values, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)sortedDictionaryUsingComparator:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(BSMutableOrderedDictionary);
  uint64_t v6 = [(BSOrderedDictionary *)self allKeys];
  id v7 = [v6 sortedArrayUsingComparator:a3];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = -[BSOrderedDictionary objectForKey:](self, "objectForKey:", v12, (void)v16);
        [(BSMutableOrderedDictionary *)v5 setObject:v13 forKey:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  __int16 v14 = (void *)[(BSMutableOrderedDictionary *)v5 copy];
  return v14;
}

- (id)subdictionaryWithRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0)
  {
    id v4 = +[_BSEmptyOrderedDictionary emptyDictionary]();
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v8 = objc_alloc_init(BSMutableOrderedDictionary);
    uint64_t v9 = v8;
    if (location < location + length)
    {
      do
      {
        uint64_t v10 = [(NSArray *)self->_keys objectAtIndex:location];
        long long v11 = [(NSDictionary *)self->_values objectForKey:v10];
        [(BSMutableOrderedDictionary *)v9 setObject:v10 forKey:v11];

        ++location;
        --length;
      }
      while (length);
    }
    id v4 = (void *)[(BSMutableOrderedDictionary *)v9 copy];
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BSMutableOrderedDictionary alloc];
  return (id)-[BSOrderedDictionary _initWithCopyOfOrderedDictionary:](v4, (id *)&self->super.isa);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_keys forKey:@"k"];
  values = self->_values;
  [a3 encodeObject:values forKey:@"v"];
}

- (BSOrderedDictionary)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BSOrderedDictionary;
  id v4 = [(BSOrderedDictionary *)&v16 init];
  if (v4)
  {
    objc_opt_class();
    objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    id v7 = [a3 allowedClasses];
    id v8 = (void *)[v7 mutableCopy];

    [v8 addObject:v5];
    uint64_t v9 = [a3 allowedClasses];
    uint64_t v10 = (void *)[v9 mutableCopy];

    [v10 addObject:v6];
    uint64_t v11 = [a3 decodeObjectOfClasses:v8 forKey:@"k"];
    keys = v4->_keys;
    v4->_keys = (NSArray *)v11;

    uint64_t v13 = [a3 decodeObjectOfClasses:v10 forKey:@"v"];
    values = v4->_values;
    v4->_values = (NSDictionary *)v13;
  }
  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_keys countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E54456B8;
  v3[4] = a3;
  void v3[5] = self;
  [a3 appendProem:self block:v3];
}

void __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_2;
  v8[3] = &unk_1E54456B8;
  v8[4] = *(void *)(a1 + 40);
  id v9 = v6;
  id v7 = v6;
  [v7 appendBodySectionWithOpenDelimiter:@"{" closeDelimiter:@"}" block:v8];
}

void __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_3;
  v2[3] = &unk_1E5446F30;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsWithIndexesUsingBlock:v2];
}

void __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = [a2 description];
  id v5 = (id)objc_msgSend(v4, "appendObject:withName:", a3);
}

@end