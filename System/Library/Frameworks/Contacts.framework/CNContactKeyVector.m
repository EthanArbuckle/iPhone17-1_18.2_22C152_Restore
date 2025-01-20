@interface CNContactKeyVector
+ (BOOL)supportsSecureCoding;
+ (CNContactKeyVector)keyVectorWithAllKeys;
+ (CNContactKeyVector)keyVectorWithKey:(id)a3;
+ (CNContactKeyVector)keyVectorWithKeys:(id)a3;
+ (id)freezeIfClassIsImmutable:(id)a3;
+ (id)keyVector;
- (BOOL)containsAllKeys;
- (BOOL)containsKey:(id)a3;
- (BOOL)intersectsKeyVector:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKeyVector:(id)a3;
- (BOOL)isSubsetOfKeyVector:(id)a3;
- (CNContactKeyVector)init;
- (CNContactKeyVector)initWithAllKeys;
- (CNContactKeyVector)initWithCoder:(id)a3;
- (CNContactKeyVector)initWithKeys:(id)a3;
- (NSString)description;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
- (id)keyVectorByAddingKey:(id)a3;
- (id)keyVectorByAddingKeys:(id)a3;
- (id)keyVectorByAddingKeysFromKeyVector:(id)a3;
- (id)keyVectorByRemovingKeys:(id)a3;
- (id)keyVectorByRemovingKeysFromKeyVector:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)_bitBuckets;
- (void)_cn_executeGetterForRepresentedKeys:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePropertiesUsingBlock:(id)a3;
@end

@implementation CNContactKeyVector

+ (CNContactKeyVector)keyVectorWithAllKeys
{
  if ((id)objc_opt_class() == a1)
  {
    if (keyVectorWithAllKeys_cn_once_token_1 != -1) {
      dispatch_once(&keyVectorWithAllKeys_cn_once_token_1, &__block_literal_global_2_3);
    }
    id v3 = (id)keyVectorWithAllKeys_cn_once_object_1;
  }
  else
  {
    id v3 = (id)[objc_alloc((Class)a1) initWithAllKeys];
  }

  return (CNContactKeyVector *)v3;
}

- (int64_t)_bitBuckets
{
  return self->_bitBuckets;
}

+ (CNContactKeyVector)keyVectorWithKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNMutableContactKeyVector);
  [(CNMutableContactKeyVector *)v5 addKey:v4];

  v6 = [a1 freezeIfClassIsImmutable:v5];

  return (CNContactKeyVector *)v6;
}

- (CNContactKeyVector)initWithKeys:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNContactKeyVector;
  v5 = [(CNContactKeyVector *)&v24 init];
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__CNContactKeyVector_initWithKeys___block_invoke;
    block[3] = &unk_1E56B4530;
    v17 = v5;
    v23 = v17;
    if (initWithKeys__onceToken != -1) {
      dispatch_once(&initWithKeys__onceToken, block);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v16 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(const void **)(*((void *)&v18 + 1) + 8 * v11);
          if (v12)
          {
            if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1) {
              dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_140_0);
            }
            Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v12);
            if (Value) {
              goto LABEL_16;
            }
            if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1) {
              dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_144);
            }
            Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v12);
            if (Value) {
LABEL_16:
            }
              *(int64_t *)((char *)v17->_bitBuckets
                                + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value - 1);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v9);
    }

    v14 = v17;
    id v4 = v16;
  }

  return v6;
}

+ (id)freezeIfClassIsImmutable:(id)a3
{
  return (id)[a3 freeze];
}

- (BOOL)intersectsKeyVector:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 _bitBuckets];
  char v5 = 0;
  uint64_t v6 = 0;
  do
  {
    char v7 = v5;
    int64_t v8 = *(void *)(v4 + 8 * v6) & self->_bitBuckets[v6];
    BOOL v9 = v8 != 0;
    if (v8) {
      break;
    }
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while ((v7 & 1) == 0);
  return v9;
}

- (id)keyVectorByAddingKey:(id)a3
{
  id v4 = a3;
  char v5 = [[CNMutableContactKeyVector alloc] initWithKeyVector:self];
  [(CNMutableContactKeyVector *)v5 addKey:v4];

  uint64_t v6 = [(CNMutableContactKeyVector *)v5 freeze];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNContactKeyVector *)a3;
  char v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CNContactKeyVector *)self isEqualToKeyVector:v5];

  return v6;
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v5 = +[CN allContactProperties];
  char v11 = 0;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    bitBuckets = self->_bitBuckets;
    do
    {
      if ((*(unint64_t *)((char *)bitBuckets + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ~(_BYTE)v8))
      {
        uint64_t v10 = [v5 objectAtIndexedSubscript:v8];
        v4[2](v4, v10, &v11);

        if (v11) {
          break;
        }
      }
      ++v8;
    }
    while (v8 < v7);
  }
}

- (BOOL)containsKey:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1) {
    dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_140_0);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v4);
  if (Value) {
    goto LABEL_8;
  }
  if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1) {
    dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_144);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v4);
  if (Value) {
LABEL_8:
  }
    unint64_t v6 = ((unint64_t)self->_bitBuckets[((unint64_t)Value - 1) >> 6] >> ~(Value - 1)) & 1;
  else {
LABEL_9:
  }
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)isSubsetOfKeyVector:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 _bitBuckets];
  char v5 = 0;
  uint64_t v6 = 0;
  do
  {
    int64_t v7 = self->_bitBuckets[v6] & ~*(void *)(v4 + 8 * v6);
    BOOL v8 = v7 == 0;
    if (v5) {
      break;
    }
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while (!v7);
  return v8;
}

- (id)keyVectorByRemovingKeysFromKeyVector:(id)a3
{
  id v4 = a3;
  char v5 = [[CNMutableContactKeyVector alloc] initWithKeyVector:self];
  [(CNMutableContactKeyVector *)v5 minusKeyVector:v4];

  uint64_t v6 = [(CNMutableContactKeyVector *)v5 freeze];

  return v6;
}

+ (CNContactKeyVector)keyVectorWithKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count] && (id)objc_opt_class() == a1)
  {
    char v11 = [a1 keyVector];
  }
  else
  {
    char v5 = objc_alloc_init(CNMutableContactKeyVector);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[CNMutableContactKeyVector addKey:](v5, "addKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    char v11 = [a1 freezeIfClassIsImmutable:v5];
  }

  return (CNContactKeyVector *)v11;
}

- (BOOL)isEqualToKeyVector:(id)a3
{
  id v4 = (CNContactKeyVector *)a3;
  char v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4)
  {
    id v6 = [(CNContactKeyVector *)v4 _bitBuckets];
    BOOL v8 = self->_bitBuckets[0] == *v6 && self->_bitBuckets[1] == v6[1];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CNMutableContactKeyVector alloc];

  return [(CNMutableContactKeyVector *)v4 initWithKeyVector:self];
}

- (BOOL)containsAllKeys
{
  if (CNContactKeyVectorBitBucketsForAllProperties_onceToken != -1) {
    dispatch_once(&CNContactKeyVectorBitBucketsForAllProperties_onceToken, &__block_literal_global_146_0);
  }
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    int64_t v5 = self->_bitBuckets[v3];
    uint64_t v6 = *((void *)&CNContactKeyVectorBitBucketsForAllProperties_referenceBuckets + v3);
    if (v5 != v6) {
      break;
    }
    char v7 = v4;
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
  return v5 == v6;
}

+ (id)keyVector
{
  if ((id)objc_opt_class() == a1)
  {
    if (keyVector_cn_once_token_0 != -1) {
      dispatch_once(&keyVector_cn_once_token_0, &__block_literal_global_58);
    }
    id v4 = (id)keyVector_cn_once_object_0;
  }
  else
  {
    id v3 = objc_alloc((Class)a1);
    id v4 = (id)[v3 initWithKeys:MEMORY[0x1E4F1CBF0]];
  }

  return v4;
}

uint64_t __35__CNContactKeyVector_initWithKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkStorageSize];
}

uint64_t __42__CNContactKeyVector_keyVectorWithAllKeys__block_invoke()
{
  keyVectorWithAllKeys_cn_once_object_1 = [[CNContactKeyVector alloc] initWithAllKeys];

  return MEMORY[0x1F41817F8]();
}

- (CNContactKeyVector)initWithAllKeys
{
  v2 = [(CNContactKeyVector *)self initWithKeys:MEMORY[0x1E4F1CBF0]];
  if (v2)
  {
    if (CNContactKeyVectorBitBucketsForAllProperties_onceToken != -1) {
      dispatch_once(&CNContactKeyVectorBitBucketsForAllProperties_onceToken, &__block_literal_global_146_0);
    }
    *(_OWORD *)v2->_bitBuckets = CNContactKeyVectorBitBucketsForAllProperties_referenceBuckets;
    id v3 = v2;
  }

  return v2;
}

uint64_t __31__CNContactKeyVector_keyVector__block_invoke()
{
  v0 = [CNContactKeyVector alloc];
  keyVector_cn_once_object_0 = [(CNContactKeyVector *)v0 initWithKeys:MEMORY[0x1E4F1CBF0]];

  return MEMORY[0x1F41817F8]();
}

- (id)keyVectorByRemovingKeys:(id)a3
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    int64_t v5 = self;
  }
  else
  {
    uint64_t v6 = [[CNMutableContactKeyVector alloc] initWithKeyVector:self];
    [(CNMutableContactKeyVector *)v6 subtractKeys:v4];
    int64_t v5 = [(CNMutableContactKeyVector *)v6 freeze];
  }

  return v5;
}

- (id)keyVectorByAddingKeys:(id)a3
{
  id v4 = a3;
  int64_t v5 = [[CNMutableContactKeyVector alloc] initWithKeyVector:self];
  [(CNMutableContactKeyVector *)v5 addKeys:v4];

  uint64_t v6 = [(CNMutableContactKeyVector *)v5 freeze];

  return v6;
}

- (id)keyVectorByAddingKeysFromKeyVector:(id)a3
{
  id v4 = a3;
  int64_t v5 = [[CNMutableContactKeyVector alloc] initWithKeyVector:self];
  [(CNMutableContactKeyVector *)v5 unionKeyVector:v4];

  uint64_t v6 = [(CNMutableContactKeyVector *)v5 freeze];

  return v6;
}

- (CNContactKeyVector)init
{
  return [(CNContactKeyVector *)self initWithKeys:MEMORY[0x1E4F1CBF0]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactKeyVector)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNContactKeyVector *)self initWithKeys:MEMORY[0x1E4F1CBF0]];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitBuckets_buffer"];
    if ([v6 length] == 16) {
      *(_OWORD *)v5->_bitBuckets = *(_OWORD *)[v6 bytes];
    }

    char v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  bitBuckets = self->_bitBuckets;
  id v5 = a3;
  id v6 = [v3 dataWithBytes:bitBuckets length:16];
  [v5 encodeObject:v6 forKey:@"bitBuckets_buffer"];
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  v12 = (uint64_t (**)(id, void *))a3;
  id v4 = +[CN allContactProperties];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    bitBuckets = self->_bitBuckets;
    do
    {
      if ((*(unint64_t *)((char *)bitBuckets + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ~(_BYTE)v7))
      {
        uint64_t v9 = [v4 objectAtIndexedSubscript:v7];
        uint64_t v10 = [v9 key];
        id v11 = (id)v12[2](v12, v10);
      }
      ++v7;
    }
    while (v6 != v7);
  }
}

- (id)_cn_optionalKeys
{
  return +[CNContactKeyVector keyVector];
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__CNContactKeyVector_description__block_invoke;
  v10[3] = &unk_1E56B5988;
  id v11 = v4;
  id v5 = v4;
  [(CNContactKeyVector *)self enumeratePropertiesUsingBlock:v10];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];
  id v7 = (id)[v3 appendName:@"keys" object:v6];
  BOOL v8 = [v3 build];

  return (NSString *)v8;
}

void __33__CNContactKeyVector_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  [v2 addObject:v3];
}

@end