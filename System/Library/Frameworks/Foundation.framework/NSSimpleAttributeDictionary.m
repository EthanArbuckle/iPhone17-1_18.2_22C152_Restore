@interface NSSimpleAttributeDictionary
+ (id)emptyAttributeDictionary;
+ (id)newWithDictionary:(id)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newWithKey:(id)a3 object:(id)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)slotForKey:(id)a3;
- (void)dealloc;
@end

@implementation NSSimpleAttributeDictionary

+ (id)emptyAttributeDictionary
{
  if (qword_1EB1EC968 != -1) {
    dispatch_once(&qword_1EB1EC968, &__block_literal_global_1);
  }
  return (id)_MergedGlobals_19;
}

_DWORD *__55__NSSimpleAttributeDictionary_emptyAttributeDictionary__block_invoke()
{
  v0 = (objc_class *)self;
  result = NSAllocateObject(v0, 0, 0);
  _MergedGlobals_19 = (uint64_t)result;
  result[2] = 0;
  return result;
}

+ (id)newWithDictionary:(id)a3
{
  id v19 = a3;
  if (a3 && (self, char isKindOfClass = objc_opt_isKindOfClass(), a3 = v19, (isKindOfClass & 1) != 0))
  {
    return v19;
  }
  else
  {
    uint64_t v6 = [a3 count];
    if (v6)
    {
      unint64_t v7 = v6;
      v8 = (void *)[v19 keyEnumerator];
      v9 = (objc_class *)self;
      v10 = NSAllocateObject(v9, 24 * v7 - 24, 0);
      v10[2] = v7;
      uint64_t v11 = [v8 nextObject];
      if (v11)
      {
        v12 = (void *)v11;
        do
        {
          unint64_t v13 = [v12 hash];
          unint64_t v14 = v13 % v7;
          v15 = (void *)[v19 objectForKey:v12];
          v16 = v10 + 4;
          while (*(void *)&v16[6 * v14 + 2])
          {
            if (v14 + 1 == v7) {
              unint64_t v14 = 0;
            }
            else {
              ++v14;
            }
          }
          uint64_t v17 = 3 * v14;
          *(void *)&v16[2 * v17] = v13;
          *(void *)&v10[2 * v17 + 6] = [v12 copyWithZone:0];
          *(void *)&v10[2 * v17 + 8] = v15;
          v12 = (void *)[v8 nextObject];
        }
        while (v12);
      }
      return v10;
    }
    else
    {
      v18 = (void *)[a1 emptyAttributeDictionary];
      return v18;
    }
  }
}

- (id)newWithKey:(id)a3 object:(id)a4
{
  unint64_t v6 = -[NSSimpleAttributeDictionary slotForKey:](self, "slotForKey:");
  unint64_t v7 = self;
  unint64_t v8 = v6;
  unsigned int numElements = self->numElements;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = numElements + 1;
  }
  else {
    unint64_t v10 = numElements;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL
    && ((v11 = self->elements[v6].var0, v11 == a4) || (v12 = [v11 isEqual:a4], unint64_t v7 = self, v12)))
  {
    return v7;
  }
  else
  {
    unint64_t v14 = (objc_class *)self;
    v15 = NSAllocateObject(v14, 24 * v10 - 24, 0);
    v15[2] = v10;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v10)
      {
        id v16 = a4;
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (i == self->numElements)
          {
            unint64_t hash = [a3 hash];
            id key = a3;
            id var0 = v16;
          }
          else
          {
            v21 = &self->elements[i];
            id key = v21->key;
            id var0 = v21->var0;
            unint64_t hash = v21->hash;
          }
          unint64_t v22 = hash % v10;
          v23 = v15 + 4;
          while (1)
          {
            v24 = &v23[6 * v22];
            uint64_t v26 = *((void *)v24 + 1);
            v25 = v24 + 2;
            if (!v26) {
              break;
            }
            if (v22 + 1 == v10) {
              unint64_t v22 = 0;
            }
            else {
              ++v22;
            }
          }
          v27 = (unint64_t *)&v23[6 * v22];
          unint64_t *v27 = hash;
          void *v25 = [key copyWithZone:0];
          v27[2] = (unint64_t)var0;
        }
      }
    }
    else
    {
      id v34 = a4;
      unint64_t v28 = self->numElements;
      if (v28)
      {
        unint64_t v29 = 0;
        v30 = v15;
        v31 = self;
        do
        {
          if (v8 != v29)
          {
            v32 = v31->elements[0].key;
            v30[2] = v31->elements[0].hash;
            v30[3] = -[value copyWithZone:](v32, "copyWithZone:", 0, v34);
            v30[4] = v31->elements[0].var0;
            unint64_t v28 = self->numElements;
          }
          ++v29;
          v31 = (NSSimpleAttributeDictionary *)((char *)v31 + 24);
          v30 += 3;
        }
        while (v29 < v28);
      }
      v33 = &v15[6 * v8 + 4];
      void *v33 = objc_msgSend(a3, "hash", v34);
      v33[1] = [a3 copyWithZone:0];
      v33[2] = v35;
    }
    return v15;
  }
}

- (unint64_t)count
{
  return self->numElements;
}

- (unint64_t)slotForKey:(id)a3
{
  uint64_t numElements = self->numElements;
  if (!numElements) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = 0;
  elements = self->elements;
  for (uint64_t i = &self->elements[0].key; *i != a3; i += 3)
  {
    if (numElements == ++v6)
    {
      unint64_t v9 = [a3 hash];
      unint64_t v10 = self->numElements;
      unint64_t v11 = v9 % v10;
      unint64_t v6 = v9 % v10;
      do
      {
        if (elements[v6].hash == v9)
        {
          if ([(value *)elements[v6].key isEqual:a3]) {
            return v6;
          }
          unint64_t v10 = self->numElements;
        }
        if (v6 + 1 == v10) {
          unint64_t v6 = 0;
        }
        else {
          ++v6;
        }
      }
      while (v6 != v11);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (id)objectForKey:(id)a3
{
  unint64_t v4 = [(NSSimpleAttributeDictionary *)self slotForKey:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return self->elements[v4].var0;
  }
}

- (id)keyEnumerator
{
  v2 = (void *)[objc_allocWithZone((Class)NSSimpleAttributeDictionaryEnumerator) initWithAttributeDictionary:self];

  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->numElements)
  {
    unint64_t v3 = 0;
    p_id var0 = &self->elements[0].var0;
    do
    {

      id v5 = *p_var0;
      p_var0 += 3;

      ++v3;
    }
    while (v3 < self->numElements);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSSimpleAttributeDictionary;
  [(NSSimpleAttributeDictionary *)&v6 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t numElements = self->numElements;
  if (numElements < 0x29)
  {
    if (numElements)
    {
      p_id var0 = &self->elements[0].var0;
      objc_super v6 = v10;
      uint64_t v7 = v11;
      do
      {
        *v7++ = *(p_var0 - 1);
        id v8 = *p_var0;
        p_var0 += 3;
        *v6++ = v8;
        --numElements;
      }
      while (numElements);
    }
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", a3), "initWithObjects:forKeys:count:", v10, v11, self->numElements);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSSimpleAttributeDictionary;
    return [(NSSimpleAttributeDictionary *)&v9 mutableCopyWithZone:a3];
  }
}

@end