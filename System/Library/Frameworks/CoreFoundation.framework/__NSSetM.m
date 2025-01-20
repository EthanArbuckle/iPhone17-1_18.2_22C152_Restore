@interface __NSSetM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (double)clumpingFactor;
- (double)clumpingInterestingThreshold;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)member:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (void)_mutate;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation __NSSetM

- (BOOL)containsObject:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  p_storage = &self->storage;
  unint64_t v7 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (!(v7 >> 26)) {
    return 0;
  }
  unint64_t v8 = *(unsigned int *)((char *)&__NSSetSizes_0 + ((v7 >> 23) & 0x1F8));
  objs = p_storage->objs;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1 : v8;
  unint64_t v12 = v8;
  while (1)
  {
    v13 = objs[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v12 == v8) {
        unint64_t v12 = v10;
      }
    }
    else if (v13 == a3 || ([(state *)v13 isEqual:a3] & 1) != 0)
    {
      unint64_t v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = 0;
    }
    unint64_t v10 = v10 + 1 - v14;
    if (!--v11) {
      goto LABEL_23;
    }
  }
  if (v12 == v8) {
    unint64_t v12 = v10;
  }
LABEL_23:
  if (v12 >= v8) {
    return 0;
  }
  v15 = p_storage->objs[v12];
  return v15 != (state *)&___NSSetM_DeletedMarker && v15 != 0;
}

- (unint64_t)countForObject:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  p_storage = &self->storage;
  unint64_t v7 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (!(v7 >> 26)) {
    return 0;
  }
  unint64_t v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v7 >> 23) & 0x1F8));
  objs = p_storage->objs;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1 : v8;
  unint64_t v12 = v8;
  while (1)
  {
    v13 = objs[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v12 == v8) {
        unint64_t v12 = v10;
      }
    }
    else if (v13 == a3 || ([(state *)v13 isEqual:a3] & 1) != 0)
    {
      unint64_t v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = 0;
    }
    unint64_t v10 = v10 + 1 - v14;
    if (!--v11) {
      goto LABEL_23;
    }
  }
  if (v12 == v8) {
    unint64_t v12 = v10;
  }
LABEL_23:
  if (v12 >= v8) {
    return 0;
  }
  v15 = p_storage->objs[v12];
  return v15 != (state *)&___NSSetM_DeletedMarker && v15 != 0;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  v23[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  if (!a3 && a4)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = (char *)v23 - ((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "mset_getObjectsCount", a4);
    goto LABEL_23;
  }
  if (a4 >> 61)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = (char *)v23 - ((MEMORY[0x1F4188790](v15, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a4;
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "mset_getObjectsCount", a4);
LABEL_23:
    v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v22);
  }
  unint64_t v8 = *((unsigned int *)&self->storage.var0.var0 + 1);
  int v9 = v8 & 0x3FFFFFF;
  if ((v8 & 0x3FFFFFF) >= a4) {
    int v9 = a4;
  }
  if (v9) {
    BOOL v10 = v8 >> 26 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    unint64_t v11 = 0;
    unint64_t v12 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v8 >> 23) & 0x1F8));
    do
    {
      v13 = self->storage.objs[v11];
      if (v13) {
        BOOL v14 = v13 == (state *)&___NSSetM_DeletedMarker;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14)
      {
        *a3++ = v13;
        --v9;
      }
      if (!v9) {
        break;
      }
      ++v11;
    }
    while (v11 < v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  return (id)__NSSetM_copy((uint64_t)self, (uint64_t)a2);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    }
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  unint64_t v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  BOOL v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSSet_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v23[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
    if (a4) {
      goto LABEL_4;
    }
  }
  else if (a4)
  {
    goto LABEL_4;
  }
  if (a5)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = (char *)v23 - ((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[__NSSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a5;
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSetM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_23;
  }
LABEL_4:
  if (a5 >> 61)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = (char *)v23 - ((MEMORY[0x1F4188790](v15, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[__NSSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a5;
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSetM countByEnumeratingWithState:objects:count:]", a5);
LABEL_23:
    v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v22);
  }
  unint64_t var0 = a3->var0;
  unint64_t v11 = *(unsigned int *)((char *)__NSSetSizes_0
                        + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  if (!a3->var0) {
    a3->var2 = &self->storage.var0.mutations;
  }
  if (var0 >= v11) {
    return 0;
  }
  a3->var1 = a4;
  unint64_t result = 0;
  if (a5)
  {
    do
    {
      v13 = self->storage.objs[var0];
      if (v13) {
        BOOL v14 = v13 == (state *)&___NSSetM_DeletedMarker;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14) {
        a4[result++] = v13;
      }
      ++var0;
    }
    while (var0 < v11 && result < a5);
  }
  a3->unint64_t var0 = var0;
  return result;
}

- (void)removeObject:(id)a3
{
  v29[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  unsigned int muts = self->storage.var0.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v8 = muts + 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSSetM removeObject:]();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }
  self->storage.var0.var0.unsigned int muts = v8;
  if (!a3)
  {
    uint64_t v23 = _os_log_pack_size();
    v25 = (char *)v29 - ((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[__NSSetM removeObject:]";
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSSetM removeObject:]");
    v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v25 size:v23];
    objc_exception_throw(v28);
  }
  unint64_t v10 = *((unsigned int *)&self->storage.var0.var0 + 1);
  if (v10 >> 26)
  {
    v29[0] = v10 >> 26;
    unint64_t v11 = __NSSetSizes_0[2 * (v10 >> 26)];
    objs = self->storage.objs;
    unint64_t v13 = 0;
    unint64_t v14 = [a3 hash] % v11;
    uint64_t v15 = v11 <= 1 ? 1 : v11;
    unint64_t v16 = v11;
    while (1)
    {
      v17 = objs[v14];
      if (!v17) {
        break;
      }
      if (v17 == (state *)&___NSSetM_DeletedMarker)
      {
        ++v13;
        if (v16 == v11) {
          unint64_t v16 = v14;
        }
      }
      else if (v17 == a3 || ([(state *)v17 isEqual:a3] & 1) != 0)
      {
        unint64_t v16 = v14;
        goto LABEL_35;
      }
      if (v14 + 1 >= v11) {
        unint64_t v18 = v11;
      }
      else {
        unint64_t v18 = 0;
      }
      unint64_t v14 = v14 + 1 - v18;
      if (!--v15) {
        goto LABEL_35;
      }
    }
    if (v16 == v11) {
      unint64_t v16 = v14;
    }
LABEL_35:
    if (v16 < v11)
    {
      unint64_t v19 = (unint64_t)objs[v16];
      if (v19 && v19 != (void)&___NSSetM_DeletedMarker)
      {
        objs[v16] = (state *)&___NSSetM_DeletedMarker;
        *((_DWORD *)&self->storage.var0.var0 + 1) = *((_DWORD *)&self->storage.var0.var0 + 1) & 0xFC000000 | (*((_DWORD *)&self->storage.var0.var0 + 1) - 1) & 0x3FFFFFF;
        if (v13 > 0xF)
        {
          __rehashs((uint64_t)self, v29[0]);
          if ((v19 & 0x8000000000000000) != 0) {
            return;
          }
        }
        else
        {
          if (v16 + 1 < v11) {
            unint64_t v21 = v16 + 1;
          }
          else {
            unint64_t v21 = 0;
          }
          if (!objs[v21])
          {
            do
            {
              objs[v16] = 0;
              if (v16) {
                unint64_t v22 = v16;
              }
              else {
                unint64_t v22 = v11;
              }
              unint64_t v16 = v22 - 1;
            }
            while (objs[v22 - 1] == (state *)&___NSSetM_DeletedMarker);
          }
          if ((v19 & 0x8000000000000000) != 0) {
            return;
          }
        }
      }
    }
  }
}

- (void)addObject:(id)a3
{
  v36 = self;
  uint64_t v37 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(v36, v3, __CFTSANTagMutableSet);
    if (a3) {
      goto LABEL_3;
    }
LABEL_55:
    uint64_t v28 = _os_log_pack_size();
    v30 = (char *)&v34 - ((MEMORY[0x1F4188790](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[__NSSetM addObject:]";
    CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSSetM addObject:]");
    v33 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v30 size:v28];
    objc_exception_throw(v33);
  }
  if (!a3) {
    goto LABEL_55;
  }
LABEL_3:
  uint64_t v5 = v36;
  uint64_t v6 = atomic_load((unint64_t *)&v36->cow);
  p_storage = &v5->storage;
  unsigned int muts = v5->storage.var0.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v9 = muts + 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSSetM addObject:]();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)v36, v6, (uint64_t)__NSSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }
  p_storage->var0.var0.unsigned int muts = v9;
  unint64_t v11 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (v11 >> 29 >= 5) {
    __break(1u);
  }
  if (v11 >> 26)
  {
    uint64_t v35 = *((unsigned int *)&p_storage->var0.var0 + 1);
    unint64_t v12 = v11 >> 26;
    unsigned int v13 = __NSSetSizes_0[2 * (v11 >> 26)];
  }
  else
  {
    *((_DWORD *)&p_storage->var0.var0 + 1) = v11 | 0x4000000;
    LODWORD(v12) = 1;
    p_storage->objs = (state **)malloc_type_calloc(1uLL, 0x18uLL, 0x80040B8603338uLL);
    uint64_t v35 = *((unsigned int *)&p_storage->var0.var0 + 1);
    unsigned int v13 = 3;
  }
  while (1)
  {
    objs = p_storage->objs;
    unint64_t v15 = v13;
    unint64_t v16 = [a3 hash];
    unint64_t v17 = 0;
    if (v15)
    {
      unint64_t v18 = v16 % v15;
      unint64_t v19 = v15;
      unint64_t v20 = v15;
      while (1)
      {
        unint64_t v21 = objs[v18];
        if (!v21) {
          break;
        }
        if (v21 == (state *)&___NSSetM_DeletedMarker)
        {
          ++v17;
          if (v20 == v15) {
            unint64_t v20 = v18;
          }
        }
        else if (v21 == a3 || ([(state *)v21 isEqual:a3] & 1) != 0)
        {
          unint64_t v20 = v18;
          goto LABEL_36;
        }
        if (v18 + 1 >= v15) {
          unint64_t v22 = v15;
        }
        else {
          unint64_t v22 = 0;
        }
        unint64_t v18 = v18 + 1 - v22;
        if (!--v19) {
          goto LABEL_36;
        }
      }
      if (v20 == v15) {
        unint64_t v20 = v18;
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
LABEL_36:
    if (v20 < v15 && v17 <= 0xF) {
      break;
    }
    if (v20 < v15) {
      int v23 = v12;
    }
    else {
      int v23 = v12 + 1;
    }
    __rehashs((uint64_t)v36, v23);
    unint64_t v12 = (unint64_t)*((unsigned int *)&p_storage->var0.var0 + 1) >> 26;
    unsigned int v13 = __NSSetSizes_0[2 * v12];
  }
  uint64_t v24 = objs[v20];
  if (v24 == (state *)&___NSSetM_DeletedMarker || v24 == 0)
  {
    unsigned int v26 = v35 & 0x3FFFFFF;
    if (((unint64_t)a3 & 0x8000000000000000) == 0) {
      id v27 = a3;
    }
    objs[v20] = (state *)a3;
    *((_DWORD *)&p_storage->var0.var0 + 1) = *((_DWORD *)&p_storage->var0.var0 + 1) & 0xFC000000 | (*((_DWORD *)&p_storage->var0.var0 + 1)
                                                                                                  + 1) & 0x3FFFFFF;
    if (__NSSetCapacities_0[v12] < (unint64_t)v26)
    {
      __rehashs((uint64_t)v36, v12 + 1);
    }
  }
}

- (void)_mutate
{
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  return *((_DWORD *)&self->storage.var0.var0 + 1) & 0x3FFFFFF;
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
    }
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v5 = _cow_create((uint64_t)self, 1);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  uint64_t v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  unsigned int v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v9, (uint64_t)__NSSet_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (void)dealloc
{
}

- (id)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  uint64_t v4 = (void *)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];

  return v4;
}

- (id)member:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  p_storage = &self->storage;
  unint64_t v7 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (!(v7 >> 26)) {
    return 0;
  }
  unint64_t v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v7 >> 23) & 0x1F8));
  objs = p_storage->objs;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1 : v8;
  unint64_t v12 = v8;
  while (1)
  {
    unsigned int v13 = objs[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v12 == v8) {
        unint64_t v12 = v10;
      }
    }
    else if (v13 == a3 || ([(state *)v13 isEqual:a3] & 1) != 0)
    {
      unint64_t v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = 0;
    }
    unint64_t v10 = v10 + 1 - v14;
    if (!--v11) {
      goto LABEL_23;
    }
  }
  if (v12 == v8) {
    unint64_t v12 = v10;
  }
LABEL_23:
  if (v12 >= v8) {
    return 0;
  }
  if ((_UNKNOWN *)p_storage->objs[v12] == &___NSSetM_DeletedMarker) {
    return 0;
  }
  return p_storage->objs[v12];
}

- (void)removeAllObjects
{
}

- (id)copy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }

  return (id)__NSSetM_copy((uint64_t)self, (uint64_t)a2);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v6 = a3;
  v22[6] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v15 = _os_log_pack_size();
    unint64_t v17 = &v21[-((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[__NSSetM enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSSetM enumerateObjectsWithOptions:usingBlock:]");
    unint64_t v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v20);
  }
  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  p_storage = &self->storage;
  size_t v9 = *(unsigned int *)((char *)__NSSetSizes_0
                       + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  objs = p_storage->objs;
  v22[0] = off_1ECE0A5A0;
  v22[1] = 3221225472;
  v22[2] = __mset_enumerateObjectsWithOptionsUsingBlock_block_invoke;
  v22[3] = &unk_1ECDFE6C0;
  v22[4] = a4;
  v22[5] = objs;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v9, (uint64_t)v22) & 1) == 0)
  {
    v21[7] = 0;
    if (v9)
    {
      for (size_t i = 0; i < v9; ++i)
      {
        unint64_t v12 = objs[i];
        if (v12) {
          BOOL v13 = v12 == (state *)&___NSSetM_DeletedMarker;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          unint64_t v14 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v14);
        }
      }
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (double)clumpingFactor
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  p_storage = &self->storage;
  int v4 = *((_DWORD *)&self->storage.var0.var0 + 1);
  size_t v5 = v4 & 0x3FFFFFF;
  if ((v4 & 0x3FFFFFF) != 0) {
    uint64_t v6 = v4 & 0x3FFFFFF;
  }
  else {
    uint64_t v6 = 1;
  }
  unint64_t v7 = MEMORY[0x1F4188790](v6, a2);
  size_t v9 = (char *)&v24 - v8;
  size_t v24 = 0;
  if (v5 >= 0x101)
  {
    size_t v9 = (char *)_CFCreateArrayStorage(v7, 0, &v24);
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0;
  }
  -[__NSSetM getObjects:count:](self, "getObjects:count:", v9, v5, v24, v25);
  double v11 = 0.0;
  if (v5 >= 2)
  {
    unint64_t v12 = *(unsigned int *)((char *)__NSSetSizes_0
                          + (((unint64_t)*((unsigned int *)&p_storage->var0.var0 + 1) >> 23) & 0x1F8));
    uint64_t v13 = 8 * v5;
    unint64_t v14 = (uint64_t *)malloc_type_malloc(8 * v5 + 8, 0xDD117B67uLL);
    unint64_t v15 = 0;
    do
    {
      v14[v15 / 8] = [*(id *)&v9[v15] hash] % v12;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v5, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_1);
    unint64_t v16 = 0;
    uint64_t v17 = *v14;
    v14[v5] = *v14 + v12;
    double v18 = (double)v12 / (double)v5;
    double v19 = 0.0;
    do
    {
      uint64_t v20 = v14[v16 / 8 + 1];
      unint64_t v21 = v20 - v17;
      if (v18 <= (double)v21) {
        double v22 = 0.0;
      }
      else {
        double v22 = v18 - (double)v21;
      }
      double v19 = v19 + v22 * v22;
      v16 += 8;
      uint64_t v17 = v20;
    }
    while (v13 != v16);
    free(v14);
    double v11 = v19
        * (double)v5
        * (double)v5
        / ((double)v12
         * (double)v12)
        / ((double)v5 + -1.0);
  }
  free(v10);
  return v11;
}

- (double)clumpingInterestingThreshold
{
  unint64_t v2 = *((unsigned int *)&self->storage.var0.var0 + 1);
  double v3 = (double)*(unsigned int *)((char *)&__NSSetSizes_0 + ((v2 >> 23) & 0x1F8));
  return 1.0
       - ((double)(v2 & 0x3FFFFFF) + (double)(v2 & 0x3FFFFFF)) / v3
       + (double)(v2 & 0x3FFFFFF) * (double)(v2 & 0x3FFFFFF) / v3 / v3;
}

- (void)addObject:.cold.1()
{
}

- (void)removeObject:.cold.1()
{
}

@end