@interface BSIntegerSet
- (BOOL)containsValue:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BSIntegerSet)init;
- (BSIntegerSet)initWithCapacity:(unint64_t)a3;
- (_BYTE)_initWithHashTable:(char)a3 hasZeroValue:;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)enumerateIndexesUsingBlock:(id)a3;
- (void)enumerateRangesUsingBlock:(id)a3;
- (void)enumerateSortedWithBlock:(id)a3;
- (void)enumerateWithBlock:(id)a3;
@end

@implementation BSIntegerSet

- (void).cxx_destruct
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = +[BSMutableIntegerSet allocWithZone:](BSMutableIntegerSet, "allocWithZone:");
  v6 = (void *)[(NSHashTable *)self->_hashTable copyWithZone:a3];
  v7 = -[BSIntegerSet _initWithHashTable:hasZeroValue:](v5, v6, self->_hasZeroValue);

  return v7;
}

- (void)enumerateWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void, char *))a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BSIntegerSet.m", 63, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  char v15 = 0;
  if (!self->_hasZeroValue || (v5[2](v5, 0, &v15), !v15))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = [(NSHashTable *)self->_hashTable objectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        v5[2](v5, *(void *)(*((void *)&v11 + 1) + 8 * v9), &v15);
        if (v15) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
          if (v7) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
}

- (unint64_t)count
{
  BOOL hasZeroValue = self->_hasZeroValue;
  return NSCountHashTable(self->_hashTable) + hasZeroValue;
}

- (BSIntegerSet)initWithCapacity:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:1282 capacity:a3];
  v5 = (BSIntegerSet *)-[BSIntegerSet _initWithHashTable:hasZeroValue:](self, v4, 0);

  return v5;
}

- (_BYTE)_initWithHashTable:(char)a3 hasZeroValue:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BSIntegerSet;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[16] = a3;
    }
  }

  return a1;
}

- (BSIntegerSet)init
{
  return [(BSIntegerSet *)self initWithCapacity:8];
}

uint64_t __41__BSIntegerSet_enumerateSortedWithBlock___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 40) + 8 * (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24))++) = a2;
  return result;
}

- (BOOL)containsValue:(int64_t)a3
{
  return !a3 && self->_hasZeroValue || NSHashGet(self->_hashTable, (const void *)a3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSIntegerSet *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (!self->_hasZeroValue == v5->_hasZeroValue) {
        char v6 = 0;
      }
      else {
        char v6 = [(NSHashTable *)self->_hashTable isEqual:v5->_hashTable];
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)enumerateSortedWithBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, char *))a3;
  int64_t v5 = [(BSIntegerSet *)self count];
  char v6 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__BSIntegerSet_enumerateSortedWithBlock___block_invoke;
  v13[3] = &unk_1E5446CC0;
  v13[4] = v14;
  v13[5] = v6;
  [(BSIntegerSet *)self enumerateWithBlock:v13];
  qsort_b(v6, v5, 8uLL, &__block_literal_global_31);
  char v12 = 0;
  BOOL v7 = v5 < 1;
  int64_t v8 = v5 - 1;
  if (!v7)
  {
    objc_super v9 = (uint64_t *)v6;
    do
    {
      uint64_t v10 = *v9++;
      v4[2](v4, v10, &v12);
      if (v12) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v8 == 0;
      }
      --v8;
    }
    while (!v11);
  }
  free(v6);
  _Block_object_dispose(v14, 8);
}

uint64_t __41__BSIntegerSet_enumerateSortedWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (unint64_t)hash
{
  return [(NSHashTable *)self->_hashTable hash] + self->_hasZeroValue;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:self];
}

- (void)enumerateIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__BSIntegerSet_NSIndexSetCompatibility__enumerateIndexesUsingBlock___block_invoke;
  v6[3] = &unk_1E5446D08;
  id v7 = v4;
  id v5 = v4;
  [(BSIntegerSet *)self enumerateWithBlock:v6];
}

uint64_t __68__BSIntegerSet_NSIndexSetCompatibility__enumerateIndexesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateRangesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__BSIntegerSet_NSIndexSetCompatibility__enumerateRangesUsingBlock___block_invoke;
  v6[3] = &unk_1E5446D08;
  id v7 = v4;
  id v5 = v4;
  [(BSIntegerSet *)self enumerateWithBlock:v6];
}

uint64_t __67__BSIntegerSet_NSIndexSetCompatibility__enumerateRangesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end