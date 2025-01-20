@interface _LSPlistHint
- (id)cachedValueForKey:(uint64_t)a1;
- (id)completeDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (uint64_t)setCachedValue:(uint64_t)a3 forKey:;
- (void)initWithKeys:(char)a3 compacted:;
- (void)setCompleteDictionary:(uint64_t)a1;
@end

@implementation _LSPlistHint

- (void)setCompleteDictionary:(uint64_t)a1
{
  if (a1 && a2 && !*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = [a2 copy];
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v3;

    *(unsigned char *)(a1 + 24) = 1;
  }
}

- (id)completeDictionary
{
  if (a1)
  {
    if (*((unsigned char *)a1 + 24)) {
      a1 = (id *)a1[2];
    }
    else {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)cachedValueForKey:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      a1 = 0;
    }
    else
    {
      a1 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
    }
    uint64_t v2 = vars8;
  }
  return (id)a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (uint64_t)setCachedValue:(uint64_t)a3 forKey:
{
  if (result)
  {
    if (a3)
    {
      uint64_t v4 = result;
      if (!*(unsigned char *)(result + 24))
      {
        v6 = *(void **)(result + 16);
        if (!v6)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v8 = *(void **)(v4 + 16);
          *(void *)(v4 + 16) = v7;

          v6 = *(void **)(v4 + 16);
        }
        return [v6 setObject:a2 forKeyedSubscript:a3];
      }
    }
  }
  return result;
}

- (void)initWithKeys:(char)a3 compacted:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)_LSPlistHint;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = [a2 copy];
    id v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = (void *)v5[2];
    v5[2] = 0;

    *((unsigned char *)v5 + 24) = 0;
    *((unsigned char *)v5 + 25) = a3;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(NSSet *)self->_keys copy];
    uint64_t v6 = (void *)v4[1];
    v4[1] = v5;

    cachedValues = self->_cachedValues;
    if (self->_cachedValuesAreComplete) {
      uint64_t v8 = [(NSDictionary *)cachedValues copy];
    }
    else {
      uint64_t v8 = [(NSDictionary *)cachedValues mutableCopy];
    }
    v9 = (void *)v4[2];
    v4[2] = v8;

    *((unsigned char *)v4 + 24) = self->_cachedValuesAreComplete;
    *((unsigned char *)v4 + 25) = self->_keysAreCompacted;
  }
  return v4;
}

- (id)debugDescription
{
  uint64_t v2 = [NSString stringWithFormat:@"<%@ %p> %@ %@ %i %i", objc_opt_class(), self, self->_keys, self->_cachedValues, self->_cachedValuesAreComplete, self->_keysAreCompacted];

  return v2;
}

@end