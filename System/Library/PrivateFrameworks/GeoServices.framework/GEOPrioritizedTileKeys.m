@interface GEOPrioritizedTileKeys
- (BOOL)popHighestPriorityKey:(_OWORD *)a3 priority:(_DWORD *)a4;
- (GEOPrioritizedTileKeys)init;
- (GEOPrioritizedTileKeys)initWithKeys:(id)a3 priorities:(id)a4;
- (unint64_t)count;
- (unsigned)highestPriority;
- (void)dealloc;
- (void)removeKey:(long long *)a3;
- (void)setPriority:(int)a3 forKey:(_OWORD *)a4;
@end

@implementation GEOPrioritizedTileKeys

- (GEOPrioritizedTileKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOPrioritizedTileKeys;
  if ([(GEOPrioritizedTileKeys *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (GEOPrioritizedTileKeys)initWithKeys:(id)a3 priorities:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9.receiver = self;
  v9.super_class = (Class)GEOPrioritizedTileKeys;
  if ([(GEOPrioritizedTileKeys *)&v9 init]) {
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  keysAndPriorities = (void **)self->_keysAndPriorities;
  if (keysAndPriorities)
  {
    v4 = *keysAndPriorities;
    if (*keysAndPriorities)
    {
      keysAndPriorities[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x18C11F580](keysAndPriorities, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOPrioritizedTileKeys;
  [(GEOPrioritizedTileKeys *)&v5 dealloc];
}

- (void)setPriority:(int)a3 forKey:(_OWORD *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = *(uint64_t **)(a1 + 8);
  uint64_t v5 = *v4;
  v6 = (char *)v4[1];
  *(_OWORD *)v19 = *a4;
  uint64_t v7 = v5;
  if ((char *)v5 != v6)
  {
    uint64_t v7 = v5;
    while (v19[0] != *(uint64_t (**)(char *, char *))v7
         || v19[1] != *(uint64_t (**)(char *, char *))(v7 + 8))
    {
      v7 += 20;
      if ((char *)v7 == v6) {
        return;
      }
    }
  }
  if ((char *)v7 != v6)
  {
    *(_DWORD *)(v7 + 16) = a3;
    if (v5 != v7)
    {
      if (v7 - v5 < 1)
      {
        objc_super v9 = 0;
        int64_t v10 = 0;
      }
      else
      {
        objc_super v9 = (char *)operator new(0x14uLL, MEMORY[0x1E4FBA2D0]);
        int64_t v10 = v9 != 0;
      }
      if (v9) {
        operator delete(v9);
      }
      uint64_t v5 = *v4;
      v6 = (char *)v4[1];
    }
    v11 = (char *)(v7 + 20);
    uint64_t v12 = (v6 - v11) >> 2;
    unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * v12;
    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * v12) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v11[-v5] >> 2))) {
      int64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v11[-v5] >> 2);
    }
    else {
      int64_t v14 = 0xCCCCCCCCCCCCCCCDLL * v12;
    }
    if (v14 < 1)
    {
LABEL_24:
      v18 = 0;
      int64_t v14 = 0;
    }
    else
    {
      v15 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
      while (1)
      {
        v16 = (char *)operator new(20 * v14, v15);
        if (v16) {
          break;
        }
        BOOL v17 = (unint64_t)v14 > 1;
        int64_t v14 = (unint64_t)v14 >> 1;
        if (!v17) {
          goto LABEL_24;
        }
      }
      v18 = v16;
    }
    if (v18) {
      operator delete(v18);
    }
  }
}

- (unsigned)highestPriority
{
  keysAndPriorities = (uint64_t *)self->_keysAndPriorities;
  uint64_t v4 = *keysAndPriorities;
  uint64_t v3 = keysAndPriorities[1];
  if (v4 == v3) {
    return 0;
  }
  else {
    return *(_DWORD *)(v3 - 4);
  }
}

- (unint64_t)count
{
  return 0xCCCCCCCCCCCCCCCDLL
       * ((uint64_t)(*((void *)self->_keysAndPriorities + 1) - *(void *)self->_keysAndPriorities) >> 2);
}

- (BOOL)popHighestPriorityKey:(_OWORD *)a3 priority:(_DWORD *)a4
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  if (*v4 != v6)
  {
    long long v9 = *(_OWORD *)(v6 - 20);
    int v7 = *(_DWORD *)(v6 - 4);
    v4[1] = v6 - 20;
    *a3 = v9;
    *a4 = v7;
  }
  return v5 != v6;
}

- (void)removeKey:(long long *)a3
{
  uint64_t v3 = (char **)result[1];
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  long long v8 = *a3;
  if (*v3 != v4)
  {
    while ((void)v8 != *(void *)v5 || *((void *)&v8 + 1) != *((void *)v5 + 1))
    {
      v5 += 20;
      if (v5 == v4) {
        return result;
      }
    }
  }
  if (v5 != v4)
  {
    int64_t v7 = v4 - (v5 + 20);
    if (v4 != v5 + 20) {
      result = memmove(v5, v5 + 20, v4 - (v5 + 20));
    }
    v3[1] = &v5[v7];
  }
  return result;
}

@end