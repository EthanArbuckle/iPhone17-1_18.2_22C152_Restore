@interface __NSDictionaryM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (double)_clumpingFactor;
- (double)_clumpingInterestingThreshold;
- (id)_cfMutableCopy;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)__setObject:(id)a3 forKey:(id)a4;
- (void)_mutate;
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setObservationInfo:(void *)a3;
@end

@implementation __NSDictionaryM

- (void)dealloc
{
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  v45 = (unint64_t *)self;
  uint64_t v46 = *(void *)off_1ECE0A5B0;
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_70:
    uint64_t v35 = _os_log_pack_size();
    v37 = (char *)&v41 - ((MEMORY[0x1F4188790](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136315138;
    *(void *)(v38 + 4) = "-[__NSDictionaryM setObject:forKeyedSubscript:]";
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[__NSDictionaryM setObject:forKeyedSubscript:]");
    v40 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v37 size:v35];
    objc_exception_throw(v40);
  }
  __cf_tsanWriteFunction(v45, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_70;
  }
LABEL_3:
  v7 = v45;
  uint64_t v8 = atomic_load(v45 + 3);
  v9 = (uint64_t *)(v7 + 1);
  unint64_t v10 = v7[2];
  if (((v10 >> 9) & 0x3FFFFF) < 0x7D) {
    uint64_t v11 = (v10 & 0x7FFFFFFF) + 1;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM setObject:forKeyedSubscript:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v45, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t v10 = v9[1];
  }
  v9[1] = v10 & 0xFFFFFFFF80000000 | v11;
  if (a3)
  {
    unint64_t v13 = v10 >> 58;
    if (v10 >> 58)
    {
      LODWORD(v14) = __NSDictionarySizes_0[v13];
    }
    else
    {
      v9[1] = v10 & 0x3FFFFFF80000000 | v11 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
      v15 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
      if (!v15)
      {
        __break(1u);
        return;
      }
      uint64_t *v9 = (uint64_t)v15;
      LODWORD(v13) = 1;
      LODWORD(v14) = 3;
    }
    unint64_t v42 = v10;
    if (((unint64_t)a3 & 0x8000000000000000) == 0) {
      id v16 = a3;
    }
    uint64_t v17 = v9[1];
    id v43 = a3;
    uint64_t v44 = v17;
    while (1)
    {
      uint64_t v18 = *v9;
      unint64_t v19 = v14;
      unint64_t v20 = [a4 hash];
      unint64_t v21 = 0;
      if (v14)
      {
        unint64_t v22 = v20 % v14;
        uint64_t v23 = v14;
        unint64_t v14 = v14;
        while (1)
        {
          id v24 = *(id *)(v18 + 8 * v22);
          if (!v24) {
            break;
          }
          if (v24 == &___NSDictionaryM_DeletedMarker)
          {
            ++v21;
            if (v14 == v19) {
              unint64_t v14 = v22;
            }
          }
          else if (v24 == a4 || ([v24 isEqual:a4] & 1) != 0)
          {
            unint64_t v14 = v22;
            goto LABEL_43;
          }
          if (v22 + 1 >= v19) {
            unint64_t v25 = v19;
          }
          else {
            unint64_t v25 = 0;
          }
          unint64_t v22 = v22 + 1 - v25;
          if (!--v23) {
            goto LABEL_43;
          }
        }
        if (v14 == v19) {
          unint64_t v14 = v22;
        }
      }
      else
      {
        unint64_t v14 = 0;
      }
LABEL_43:
      if (v14 < v19 && v21 <= 0xF) {
        break;
      }
      if (v14 < v19) {
        unsigned int v26 = v13;
      }
      else {
        unsigned int v26 = v13 + 1;
      }
      mdict_rehashd((uint64_t)v45, v26);
      unint64_t v13 = (unint64_t)v9[1] >> 58;
      LODWORD(v14) = __NSDictionarySizes_0[v13];
    }
    v27 = *(void **)(v18 + 8 * v14);
    uint64_t v28 = v18 + 8 * v19;
    if ((v44 & 0x200000000000000) != 0) {
      [v45 willChangeValueForKey:a4];
    }
    uint64_t v29 = *(void *)(v28 + 8 * v14);
    if (v27 == &___NSDictionaryM_DeletedMarker || v27 == 0)
    {
      if ((v42 & 0x80000000) != 0)
      {
        id v31 = (id)[a4 copyWithZone:0];
      }
      else
      {
        id v31 = a4;
        if (((unint64_t)a4 & 0x8000000000000000) == 0)
        {
          id v32 = a4;
          id v31 = a4;
        }
      }
      *(void *)(v18 + 8 * v14) = v31;
      *(void *)(v28 + 8 * v14) = v43;
      uint64_t v33 = v9[1];
      unint64_t v34 = (v33 + 0x100000000) & 0x1FFFFFF00000000;
      v9[1] = v34 | v33 & 0xFE000000FFFFFFFFLL;
      if ((unint64_t)__NSDictionaryCapacities_0[v13] < HIDWORD(v34)) {
        mdict_rehashd((uint64_t)v45, v13 + 1);
      }
    }
    else
    {
      *(void *)(v28 + 8 * v14) = v43;
    }
    if ((v44 & 0x200000000000000) != 0) {
      [v45 didChangeValueForKey:a4];
    }
    if (v29 >= 1)
    {
    }
  }
  else
  {
    mdict_removeObjectForKey((uint64_t *)v45, a4);
  }
}

- (id)objectForKey:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  p_storage = &self->storage;
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0;
  }
  unint64_t v8 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = p_storage->buffer;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1 : v8;
  unint64_t v12 = v8;
  while (1)
  {
    unint64_t v13 = buffer[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSDictionaryM_DeletedMarker)
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
  if (v12 < v8) {
    return *(&buffer[v8] + v12);
  }
  else {
    return 0;
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  v47 = (unint64_t *)self;
  uint64_t v48 = *(void *)off_1ECE0A5B0;
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_63:
    uint64_t v33 = _os_log_pack_size();
    uint64_t v35 = (char *)&v45 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315138;
    *(void *)(v36 + 4) = "-[__NSDictionaryM setObject:forKey:]";
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[__NSDictionaryM setObject:forKey:]");
    uint64_t v38 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v38);
  }
  __cf_tsanWriteFunction(v47, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_63;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v39 = _os_log_pack_size();
    uint64_t v41 = (char *)&v45 - ((MEMORY[0x1F4188790](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v42 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v42 = 136315394;
    *(void *)(v42 + 4) = "-[__NSDictionaryM setObject:forKey:]";
    *(_WORD *)(v42 + 12) = 2112;
    *(void *)(v42 + 14) = a4;
    CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil (key: %@)", "-[__NSDictionaryM setObject:forKey:]", a4);
    uint64_t v44 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
    objc_exception_throw(v44);
  }
  v7 = v47;
  uint64_t v8 = atomic_load(v47 + 3);
  v9 = (uint64_t *)(v7 + 1);
  unint64_t v10 = v7[2];
  if (((v10 >> 9) & 0x3FFFFF) < 0x7D) {
    uint64_t v11 = (v10 & 0x7FFFFFFF) + 1;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM setObject:forKey:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v47, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t v10 = v9[1];
  }
  v9[1] = v10 & 0xFFFFFFFF80000000 | v11;
  unint64_t v13 = v10 >> 58;
  if (v10 >> 58)
  {
    LODWORD(v14) = __NSDictionarySizes_0[v13];
    if (((unint64_t)a3 & 0x8000000000000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v9[1] = v10 & 0x3FFFFFF80000000 | v11 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
  id v32 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
  if (!v32)
  {
    __break(1u);
    return;
  }
  uint64_t *v9 = (uint64_t)v32;
  LODWORD(v13) = 1;
  LODWORD(v14) = 3;
  if (((unint64_t)a3 & 0x8000000000000000) == 0) {
LABEL_17:
  }
    id v15 = a3;
LABEL_18:
  uint64_t v16 = v9[1];
  id v45 = a3;
  uint64_t v46 = v16;
  while (1)
  {
    uint64_t v17 = *v9;
    unint64_t v18 = v14;
    unint64_t v19 = objc_msgSend(a4, "hash", v45);
    unint64_t v20 = 0;
    if (v14)
    {
      unint64_t v21 = v19 % v14;
      uint64_t v22 = v14;
      unint64_t v14 = v14;
      while (1)
      {
        id v23 = *(id *)(v17 + 8 * v21);
        if (!v23) {
          break;
        }
        if (v23 == &___NSDictionaryM_DeletedMarker)
        {
          ++v20;
          if (v14 == v18) {
            unint64_t v14 = v21;
          }
        }
        else if (v23 == a4 || ([v23 isEqual:a4] & 1) != 0)
        {
          unint64_t v14 = v21;
          goto LABEL_37;
        }
        if (v21 + 1 >= v18) {
          unint64_t v24 = v18;
        }
        else {
          unint64_t v24 = 0;
        }
        unint64_t v21 = v21 + 1 - v24;
        if (!--v22) {
          goto LABEL_37;
        }
      }
      if (v14 == v18) {
        unint64_t v14 = v21;
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
LABEL_37:
    if (v14 < v18 && v20 <= 0xF) {
      break;
    }
    if (v14 < v18) {
      unsigned int v25 = v13;
    }
    else {
      unsigned int v25 = v13 + 1;
    }
    mdict_rehashd((uint64_t)v47, v25);
    unint64_t v13 = (unint64_t)v9[1] >> 58;
    LODWORD(v14) = __NSDictionarySizes_0[v13];
  }
  unsigned int v26 = *(void **)(v17 + 8 * v14);
  uint64_t v27 = v17 + 8 * v18;
  if ((v46 & 0x200000000000000) != 0) {
    [v47 willChangeValueForKey:a4];
  }
  uint64_t v28 = *(void *)(v27 + 8 * v14);
  if (v26 == &___NSDictionaryM_DeletedMarker || v26 == 0)
  {
    *(void *)(v17 + 8 * v14) = [a4 copyWithZone:0];
    *(void *)(v27 + 8 * v14) = v45;
    uint64_t v30 = v9[1];
    unint64_t v31 = (v30 + 0x100000000) & 0x1FFFFFF00000000;
    v9[1] = v31 | v30 & 0xFE000000FFFFFFFFLL;
    if ((unint64_t)__NSDictionaryCapacities_0[v13] < HIDWORD(v31)) {
      mdict_rehashd((uint64_t)v47, v13 + 1);
    }
  }
  else
  {
    *(void *)(v27 + 8 * v14) = v45;
  }
  if ((v46 & 0x200000000000000) != 0) {
    [v47 didChangeValueForKey:a4];
  }
  if (v28 >= 1)
  {
  }
}

- (void)__setObject:(id)a3 forKey:(id)a4
{
  uint64_t v80 = *(void *)off_1ECE0A5B0;
  v79 = (unint64_t *)self;
  [(__NSDictionaryM *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_117:
    uint64_t v63 = _os_log_pack_size();
    v65 = (char *)&v75 - ((MEMORY[0x1F4188790](v63, v64) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v66 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v66 = 136315138;
    *(void *)(v66 + 4) = "-[__NSDictionaryM __setObject:forKey:]";
    CFStringRef v67 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[__NSDictionaryM __setObject:forKey:]");
    v68 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v67) userInfo:0 osLogPack:v65 size:v63];
    objc_exception_throw(v68);
  }
  __cf_tsanWriteFunction(v79, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_117;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v69 = _os_log_pack_size();
    v71 = (char *)&v75 - ((MEMORY[0x1F4188790](v69, v70) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v72 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v72 = 136315394;
    *(void *)(v72 + 4) = "-[__NSDictionaryM __setObject:forKey:]";
    *(_WORD *)(v72 + 12) = 2112;
    *(void *)(v72 + 14) = a4;
    CFStringRef v73 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil (key: %@)", "-[__NSDictionaryM __setObject:forKey:]", a4);
    v74 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v73) userInfo:0 osLogPack:v71 size:v69];
    objc_exception_throw(v74);
  }
  v7 = v79;
  uint64_t v8 = atomic_load(v79 + 3);
  v9 = (uint64_t *)(v7 + 1);
  unint64_t v10 = v7[2];
  if (((v10 >> 9) & 0x3FFFFF) < 0x7D) {
    uint64_t v11 = (v10 & 0x7FFFFFFF) + 1;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM __setObject:forKey:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v79, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t v10 = v9[1];
  }
  unint64_t v13 = v10 & 0xFFFFFFFF80000000 | v11;
  v9[1] = v13;
  id v77 = a3;
  if ((v10 & 0x80000000) == 0) {
    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v13 = v9[1];
LABEL_18:
    unint64_t v20 = v13 >> 58;
    if (v13 >> 58)
    {
      unsigned int v21 = __NSDictionarySizes_0[v20];
      goto LABEL_22;
    }
    v9[1] = v13 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
    uint64_t v22 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
    if (v22)
    {
      uint64_t *v9 = (uint64_t)v22;
      LODWORD(v20) = 1;
      unsigned int v21 = 3;
LABEL_22:
      unint64_t v76 = v13;
      if (((unint64_t)a3 & 0x8000000000000000) == 0) {
        id v23 = a3;
      }
      uint64_t v78 = v9[1];
      while (1)
      {
        uint64_t v24 = *v9;
        unint64_t v25 = [a4 hash];
        unint64_t v26 = 0;
        if (v21)
        {
          unint64_t v27 = v25 % v21;
          uint64_t v28 = v21;
          unint64_t v29 = v21;
          while (1)
          {
            id v30 = *(id *)(v24 + 8 * v27);
            if (!v30) {
              break;
            }
            if (v30 == &___NSDictionaryM_DeletedMarker)
            {
              ++v26;
              if (v29 == v21) {
                unint64_t v29 = v27;
              }
            }
            else if (v30 == a4 || ([v30 isEqual:a4] & 1) != 0)
            {
              unint64_t v29 = v27;
              goto LABEL_43;
            }
            if (v27 + 1 >= v21) {
              uint64_t v31 = v21;
            }
            else {
              uint64_t v31 = 0;
            }
            unint64_t v27 = v27 + 1 - v31;
            if (!--v28) {
              goto LABEL_43;
            }
          }
          if (v29 == v21) {
            unint64_t v29 = v27;
          }
        }
        else
        {
          unint64_t v29 = 0;
        }
LABEL_43:
        if (v29 < v21 && v26 <= 0xF) {
          break;
        }
        if (v29 < v21) {
          unsigned int v32 = v20;
        }
        else {
          unsigned int v32 = v20 + 1;
        }
        mdict_rehashd((uint64_t)v79, v32);
        unint64_t v20 = (unint64_t)v9[1] >> 58;
        unsigned int v21 = __NSDictionarySizes_0[v20];
      }
      uint64_t v33 = *(void **)(v24 + 8 * v29);
      uint64_t v34 = v24 + 8 * v21;
      if ((v78 & 0x200000000000000) != 0) {
        [v79 willChangeValueForKey:a4];
      }
      uint64_t v35 = *(void *)(v34 + 8 * v29);
      if (v33 == &___NSDictionaryM_DeletedMarker || v33 == 0)
      {
        if ((v76 & 0x80000000) != 0)
        {
          id v37 = (id)[a4 copyWithZone:0];
        }
        else
        {
          id v37 = a4;
          if (((unint64_t)a4 & 0x8000000000000000) == 0)
          {
            id v38 = a4;
            id v37 = a4;
          }
        }
        *(void *)(v24 + 8 * v29) = v37;
        *(void *)(v34 + 8 * v29) = v77;
        uint64_t v60 = v9[1];
        unint64_t v61 = (v60 + 0x100000000) & 0x1FFFFFF00000000;
        v9[1] = v61 | v60 & 0xFE000000FFFFFFFFLL;
        if ((unint64_t)__NSDictionaryCapacities_0[v20] < HIDWORD(v61)) {
          mdict_rehashd((uint64_t)v79, v20 + 1);
        }
      }
      else
      {
        *(void *)(v34 + 8 * v29) = v77;
      }
      if ((v78 & 0x200000000000000) != 0) {
        [v79 didChangeValueForKey:a4];
      }
      if (v35 >= 1)
      {
      }
      return;
    }
    goto LABEL_120;
  }
  CFLog(3, @"*** CFDictionarySetValue(): attempt to use this function to set a key which is not copyable into a non-CFDictionary via toll-free bridging", v14, v15, v16, v17, v18, v19, v75);
  unint64_t v39 = v9[1];
  unint64_t v40 = v39 >> 58;
  if (v39 >> 58)
  {
    LODWORD(v41) = __NSDictionarySizes_0[v40];
    if (((unint64_t)a3 & 0x8000000000000000) == 0) {
LABEL_61:
    }
      id v42 = a3;
  }
  else
  {
    v9[1] = v39 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
    v62 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
    if (!v62)
    {
LABEL_120:
      __break(1u);
      goto LABEL_121;
    }
    uint64_t *v9 = (uint64_t)v62;
    LODWORD(v40) = 1;
    LODWORD(v41) = 3;
    if (((unint64_t)a3 & 0x8000000000000000) == 0) {
      goto LABEL_61;
    }
  }
  uint64_t v78 = v9[1];
  while (1)
  {
    uint64_t v43 = *v9;
    unint64_t v44 = v41;
    unint64_t v45 = [a4 hash];
    unint64_t v46 = 0;
    if (v41)
    {
      unint64_t v47 = v45 % v41;
      uint64_t v41 = v41;
      unint64_t v48 = v41;
      while (1)
      {
        id v49 = *(id *)(v43 + 8 * v47);
        if (!v49) {
          break;
        }
        if (v49 == &___NSDictionaryM_DeletedMarker)
        {
          ++v46;
          if (v48 == v44) {
            unint64_t v48 = v47;
          }
        }
        else if (v49 == a4 || ([v49 isEqual:a4] & 1) != 0)
        {
          unint64_t v48 = v47;
          goto LABEL_81;
        }
        if (v47 + 1 >= v44) {
          unint64_t v50 = v44;
        }
        else {
          unint64_t v50 = 0;
        }
        unint64_t v47 = v47 + 1 - v50;
        if (!--v41) {
          goto LABEL_81;
        }
      }
      if (v48 == v44) {
        unint64_t v48 = v47;
      }
    }
    else
    {
      unint64_t v48 = 0;
    }
LABEL_81:
    if (v48 < v44 && v46 <= 0xF) {
      break;
    }
    if (v48 < v44) {
      unsigned int v51 = v40;
    }
    else {
      unsigned int v51 = v40 + 1;
    }
    mdict_rehashd((uint64_t)v79, v51);
    unint64_t v40 = (unint64_t)v9[1] >> 58;
    LODWORD(v41) = __NSDictionarySizes_0[v40];
  }
  v52 = *(void **)(v43 + 8 * v48);
  uint64_t v53 = v43 + 8 * v44;
  uint64_t v54 = v78;
  if ((v78 & 0x200000000000000) != 0) {
    [v79 willChangeValueForKey:a4];
  }
  uint64_t v55 = *(void *)(v53 + 8 * v48);
  if (v52 == &___NSDictionaryM_DeletedMarker || v52 == 0)
  {
    if (((unint64_t)a4 & 0x8000000000000000) == 0) {
      id v57 = a4;
    }
    *(void *)(v43 + 8 * v48) = a4;
    *(void *)(v53 + 8 * v48) = v77;
    uint64_t v58 = v9[1];
    unint64_t v59 = (v58 + 0x100000000) & 0x1FFFFFF00000000;
    v9[1] = v59 | v58 & 0xFE000000FFFFFFFFLL;
    if ((unint64_t)__NSDictionaryCapacities_0[v40] < HIDWORD(v59)) {
      mdict_rehashd((uint64_t)v79, v40 + 1);
    }
  }
  else
  {
    *(void *)(v53 + 8 * v48) = v77;
  }
  if ((v54 & 0x200000000000000) != 0) {
    [v79 didChangeValueForKey:a4];
  }
  if (v55 >= 1) {

  }
  if (getenv("__setObject_throw_on_warning")) {
LABEL_121:
  }
    objc_exception_throw(+[NSException exceptionWithName:@"NSInvalidArgumentException" reason:@"key should be copyable" userInfo:0]);
}

- (void)_mutate
{
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v26[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  }
  unint64_t v10 = a5 >> 61;
  if (a3 && v10 || a4 && v10)
  {
    uint64_t v20 = _os_log_pack_size();
    uint64_t v22 = (char *)v26 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315394;
    *(void *)(v23 + 4) = "-[__NSDictionaryM getObjects:andKeys:count:]";
    *(_WORD *)(v23 + 12) = 2048;
    *(void *)(v23 + 14) = a5;
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSDictionaryM getObjects:andKeys:count:]", a5);
    unint64_t v25 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v22 size:v20];
    objc_exception_throw(v25);
  }
  unint64_t mutations = self->storage.var0.var0.mutations;
  unint64_t v12 = mutations >> 58;
  unint64_t v13 = HIDWORD(mutations) & 0x1FFFFFF;
  if (v13 >= a5) {
    unint64_t v13 = a5;
  }
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    unint64_t v15 = 0;
    unint64_t v16 = LODWORD(__NSDictionarySizes_0[v12]);
    buffer = self->storage.buffer;
    do
    {
      uint64_t v18 = buffer[v15];
      if (v18) {
        BOOL v19 = v18 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19)
      {
        if (a4) {
          *a4++ = v18;
        }
        if (a3) {
          *a3++ = *(&buffer[v16] + v15);
        }
        --v13;
      }
      ++v15;
    }
    while (v15 < v16 && v13);
  }
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return self->storage.var0.var1.other & 0x1FFFFFF;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (!a3)
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: function pointer is NULL", v10);
    unint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
    objc_exception_throw(v12);
  }
  unint64_t v4 = self->storage.var0.var0.mutations >> 58;
  if (v4)
  {
    unint64_t v6 = v4;
    buffer = self->storage.buffer;
    if (LODWORD(__NSDictionarySizes_0[v6]) <= 1uLL) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = LODWORD(__NSDictionarySizes_0[v6]);
    }
    do
    {
      if (*buffer) {
        BOOL v9 = *buffer == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        ((void (*)(void))a3)();
      }
      ++buffer;
      --v8;
    }
    while (v8);
  }
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v6 = a3;
  v22[7] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v15 = _os_log_pack_size();
    uint64_t v17 = &v21[-((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[__NSDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v20);
  }
  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v22[0] = off_1ECE0A5A0;
  v22[1] = 3221225472;
  v22[2] = __mdict_enumerateKeysAndObjectsWithOptionsUsingBlock_block_invoke;
  v22[3] = &unk_1ECE00F88;
  v22[4] = a4;
  v22[5] = buffer;
  v22[6] = &buffer[v10];
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v10, (uint64_t)v22) & 1) == 0)
  {
    v21[15] = 0;
    if (mutations >> 58)
    {
      size_t v11 = 0;
      do
      {
        unint64_t v12 = buffer[v11];
        if (v12) {
          BOOL v13 = v12 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          BOOL v14 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v14);
        }
        ++v11;
      }
      while (v11 < v10);
    }
  }
}

- (void)removeAllObjects
{
}

- (id)objectForKeyedSubscript:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  p_storage = &self->storage;
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0;
  }
  unint64_t v8 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = p_storage->buffer;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1 : v8;
  unint64_t v12 = v8;
  while (1)
  {
    BOOL v13 = buffer[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSDictionaryM_DeletedMarker)
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
  if (v12 < v8) {
    return *(&buffer[v8] + v12);
  }
  else {
    return 0;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v24[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
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
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v24 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_23;
  }
LABEL_4:
  if (a5 >> 61)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v24 - ((MEMORY[0x1F4188790](v16, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = a5;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]", a5);
LABEL_23:
    uint64_t v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v16];
    objc_exception_throw(v23);
  }
  unint64_t var0 = a3->var0;
  unint64_t v11 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((self->storage.var0.var0.mutations >> 55) & 0x1F8));
  if (!a3->var0) {
    a3->var2 = &self->storage.var0.var0.mutations;
  }
  if (var0 >= v11) {
    return 0;
  }
  buffer = self->storage.buffer;
  a3->var1 = a4;
  unint64_t result = 0;
  if (a5)
  {
    do
    {
      unint64_t v14 = buffer[var0];
      if (v14) {
        BOOL v15 = v14 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v15 = 1;
      }
      if (!v15) {
        a4[result++] = v14;
      }
      ++var0;
    }
    while (var0 < v11 && result < a5);
  }
  a3->unint64_t var0 = var0;
  return result;
}

- (void)removeObjectForKey:(id)a3
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (((mutations >> 9) & 0x3FFFFF) < 0x7D) {
    uint64_t v8 = (mutations & 0x7FFFFFFF) + 1;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSDictionaryM removeObjectForKey:]();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    unint64_t mutations = self->storage.var0.var0.mutations;
  }
  self->storage.var0.var0.unint64_t mutations = mutations & 0xFFFFFFFF80000000 | v8;
  if (!a3)
  {
    uint64_t v10 = _os_log_pack_size();
    unint64_t v12 = (char *)v16 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[__NSDictionaryM removeObjectForKey:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[__NSDictionaryM removeObjectForKey:]");
    BOOL v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v15);
  }

  mdict_removeObjectForKey((uint64_t *)self, a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 1);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  uint64_t v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  uint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
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
  id v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v9, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    }
  }
  if (![(__NSDictionaryM *)self count]) {
    return &__NSDictionary0__struct;
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 1);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  id v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  uint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v9, 0);
  return v9;
}

- (id)copy
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
    }
  }
  if (![(__NSDictionaryM *)self count]) {
    return &__NSDictionary0__struct;
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
  id v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v9, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v8, 0);
  return v8;
}

- (id)_cfMutableCopy
{
  id result = [(__NSDictionaryM *)self mutableCopyWithZone:0];
  *((void *)result + 2) = *((void *)result + 2) & 0xFFFFFFFF7FFFFFFFLL | (((self->storage.var0.var0.mutations >> 31) & 1) << 31);
  return result;
}

- (id)keyEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  uint64_t v4 = (void *)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];

  return v4;
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  v13[1] = *(void *)off_1ECE0A5B0;
  if (!__cf_tsanReadFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[__NSDictionaryM keysOfEntriesWithOptions:passingTest:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[__NSDictionaryM keysOfEntriesWithOptions:passingTest:]");
    unint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
    objc_exception_throw(v12);
  }
  __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_7;
  }
LABEL_3:

  return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, v6, (uint64_t)a4);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  unint64_t mutations = self->storage.var0.var0.mutations;
  unint64_t v8 = mutations;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSDictionaryM setObservationInfo:]();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    unint64_t v8 = self->storage.var0.var0.mutations;
  }
  if (((mutations >> 9) & 0x3FFFFF) < 0x7D) {
    uint64_t v10 = (mutations & 0x7FFFFFFF) + 1;
  }
  else {
    uint64_t v10 = 0;
  }
  self->storage.var0.var0.unint64_t mutations = v10 | ((unint64_t)(a3 != 0) << 57) | v8 & 0xFDFFFFFF80000000;
  v11.receiver = self;
  v11.super_class = (Class)__NSDictionaryM;
  [(__NSDictionaryM *)&v11 setObservationInfo:a3];
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = off_1ECE0A5A0;
  v19[1] = 3221225472;
  v19[2] = __mdict_keyOfEntryWithOptionsPassingTest_block_invoke;
  v19[3] = &unk_1ECE00FB0;
  v19[6] = buffer;
  v19[7] = &buffer[v10];
  v19[4] = a4;
  v19[5] = &v20;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v10, (uint64_t)v19))
  {
    objc_super v11 = (state *)atomic_load((unint64_t *)v21 + 3);
  }
  else
  {
    char v18 = 0;
    objc_super v11 = 0;
    if (mutations >> 58)
    {
      if (v10 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v10;
      }
      do
      {
        uint64_t v13 = *buffer;
        if (*buffer) {
          BOOL v14 = v13 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          BOOL v15 = buffer[v10];
          uint64_t v16 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, state *, state *, char *))a4 + 2))(a4, v13, v15, &v18))
          {
            char v18 = 1;
            objc_super v11 = v13;
          }
          _CFAutoreleasePoolPop(v16);
          if (v18) {
            break;
          }
        }
        ++buffer;
        --v12;
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (((mutations >> 9) & 0x3FFFFF) < 0x7D) {
    uint64_t v10 = (mutations & 0x7FFFFFFF) + 1;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM removeEntriesWithOptions:passingTest:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t mutations = self->storage.var0.var0.mutations;
  }
  self->storage.var0.var0.unint64_t mutations = mutations & 0xFFFFFFFF80000000 | v10;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = [(__NSDictionaryM *)self keysOfEntriesWithOptions:a3 passingTest:a4];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(__NSDictionaryM *)self removeObjectForKey:*(void *)(*((void *)&v18 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v14);
  }
}

- (double)_clumpingFactor
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v4 = HIDWORD(mutations) & 0x1FFFFFF;
  if ((mutations & 0x1FFFFFE00000000) != 0) {
    uint64_t v5 = HIDWORD(mutations) & 0x1FFFFFF;
  }
  else {
    uint64_t v5 = 1;
  }
  unint64_t v6 = MEMORY[0x1F4188790](v5, a2);
  uint64_t v8 = (char *)&v24 - v7;
  unint64_t v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((v9 >> 55) & 0x1F8));
  size_t v24 = 0;
  if (v4 >= 0x101)
  {
    uint64_t v8 = (char *)_CFCreateArrayStorage(v6, 0, &v24);
    objc_super v11 = v8;
  }
  else
  {
    objc_super v11 = 0;
  }
  -[__NSDictionaryM getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v8, v4, v24, v25);
  double v12 = 0.0;
  if (v4 >= 2)
  {
    uint64_t v13 = 8 * v4;
    uint64_t v14 = (uint64_t *)malloc_type_malloc(8 * v4 + 8, 0xDD117B67uLL);
    unint64_t v15 = 0;
    do
    {
      v14[v15 / 8] = [*(id *)&v8[v15] hash] % v10;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_2);
    unint64_t v16 = 0;
    uint64_t v17 = *v14;
    v14[v4] = *v14 + v10;
    double v18 = (double)v10 / (double)v4;
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
    double v12 = v19 * (double)v4 * (double)v4 / ((double)v10 * (double)v10) / ((double)v4 + -1.0);
  }
  free(v11);
  return v12;
}

- (double)_clumpingInterestingThreshold
{
  unint64_t mutations = self->storage.var0.var0.mutations;
  double v3 = (double)*(unsigned int *)((char *)&__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  return 1.0
       - ((double)(HIDWORD(mutations) & 0x1FFFFFF) + (double)(HIDWORD(mutations) & 0x1FFFFFF)) / v3
       + (double)(HIDWORD(mutations) & 0x1FFFFFF) * (double)(HIDWORD(mutations) & 0x1FFFFFF) / v3 / v3;
}

- (void)removeObjectForKey:.cold.1()
{
}

- (void)setObject:forKey:.cold.1()
{
}

- (void)setObject:forKeyedSubscript:.cold.1()
{
}

- (void)__setObject:forKey:.cold.1()
{
}

- (void)setObservationInfo:.cold.1()
{
}

- (void)removeEntriesWithOptions:passingTest:.cold.1()
{
}

@end