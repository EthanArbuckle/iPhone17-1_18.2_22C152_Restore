@interface CNMutableContactKeyVector
+ (id)freezeIfClassIsImmutable:(id)a3;
- (CNMutableContactKeyVector)init;
- (CNMutableContactKeyVector)initWithKeyVector:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)freeze;
- (void)addKey:(id)a3;
- (void)addKeys:(id)a3;
- (void)intersectKeyVector:(id)a3;
- (void)minusKeyVector:(id)a3;
- (void)subtractKey:(id)a3;
- (void)subtractKeys:(id)a3;
- (void)unionKeyVector:(id)a3;
@end

@implementation CNMutableContactKeyVector

- (void)unionKeyVector:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"key vector to union must be non-nil"];
    id v4 = 0;
  }
  v5 = (void *)[v4 _bitBuckets];
  int64_t v6 = self->super._bitBuckets[1];
  self->super._bitBuckets[0] |= *v5;
  self->super._bitBuckets[1] = v6 | v5[1];
}

- (CNMutableContactKeyVector)init
{
  return [(CNContactKeyVector *)self initWithKeys:MEMORY[0x1E4F1CBF0]];
}

- (void)addKey:(id)a3
{
  id key = a3;
  if (key)
  {
    if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1) {
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_140_0);
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, key);
    if (Value) {
      goto LABEL_8;
    }
    if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1) {
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_144);
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, key);
    if (Value) {
LABEL_8:
    }
      *(int64_t *)((char *)self->super._bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value - 1);
  }
}

- (id)freeze
{
  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

+ (id)freezeIfClassIsImmutable:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CNContactKeyVector keyVector];
  if ([(CNContactKeyVector *)self isEqualToKeyVector:v4])
  {
    id v5 = v4;
  }
  else
  {
    if (![(CNContactKeyVector *)self containsAllKeys])
    {
      id v7 = (void *)[(CNMutableContactKeyVector *)self mutableCopy];
      int64_t v6 = [v7 freeze];

      goto LABEL_7;
    }
    id v5 = +[CNContactKeyVector keyVectorWithAllKeys];
  }
  int64_t v6 = v5;
LABEL_7:

  return v6;
}

- (CNMutableContactKeyVector)initWithKeyVector:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNMutableContactKeyVector;
  id v5 = [(CNContactKeyVector *)&v8 initWithKeys:MEMORY[0x1E4F1CBF0]];
  if (v5)
  {
    if (v4) {
      *(_OWORD *)(v5 + 8) = *(_OWORD *)[v4 _bitBuckets];
    }
    int64_t v6 = v5;
  }

  return (CNMutableContactKeyVector *)v5;
}

- (void)minusKeyVector:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"key vector to subtract must be non-nil"];
    id v4 = 0;
  }
  id v5 = (void *)[v4 _bitBuckets];
  int64_t v6 = self->super._bitBuckets[1];
  self->super._bitBuckets[0] &= ~*v5;
  self->super._bitBuckets[1] = v6 & ~v5[1];
}

- (void)subtractKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    bitBuckets = self->super._bitBuckets;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        if (v10)
        {
          if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1) {
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_140_0);
          }
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v10);
          if (Value) {
            goto LABEL_13;
          }
          if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1) {
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_144);
          }
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v10);
          if (Value) {
LABEL_13:
          }
            *(int64_t *)((char *)bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << ~(Value - 1));
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)intersectKeyVector:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"key vector to intersect must be non-nil"];
    id v4 = 0;
  }
  uint64_t v5 = (void *)[v4 _bitBuckets];
  int64_t v6 = self->super._bitBuckets[1];
  self->super._bitBuckets[0] &= *v5;
  self->super._bitBuckets[1] = v6 & v5[1];
}

- (void)addKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    bitBuckets = self->super._bitBuckets;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        if (v10)
        {
          if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1) {
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_140_0);
          }
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v10);
          if (Value) {
            goto LABEL_13;
          }
          if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1) {
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_144);
          }
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v10);
          if (Value) {
LABEL_13:
          }
            *(int64_t *)((char *)bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value - 1);
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)subtractKey:(id)a3
{
  id key = a3;
  if (key)
  {
    if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1) {
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_140_0);
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, key);
    if (Value) {
      goto LABEL_8;
    }
    if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1) {
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_144);
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, key);
    if (Value) {
LABEL_8:
    }
      *(int64_t *)((char *)self->super._bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << ~(Value - 1));
  }
}

@end