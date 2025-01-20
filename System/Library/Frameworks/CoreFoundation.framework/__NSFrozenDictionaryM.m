@interface __NSFrozenDictionaryM
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
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation __NSFrozenDictionaryM

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (!a3)
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: function pointer is NULL", v10);
    v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
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

- (id)objectForKeyedSubscript:(id)a3
{
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0;
  }
  unint64_t v5 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = self->storage.buffer;
  unint64_t v7 = [a3 hash] % v5;
  uint64_t v8 = v5 <= 1 ? 1 : v5;
  unint64_t v9 = v5;
  while (1)
  {
    uint64_t v10 = buffer[v7];
    if (!v10) {
      break;
    }
    if (v10 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v9 == v5) {
        unint64_t v9 = v7;
      }
    }
    else if (v10 == a3 || ([(state *)v10 isEqual:a3] & 1) != 0)
    {
      unint64_t v9 = v7;
      goto LABEL_21;
    }
    if (v7 + 1 >= v5) {
      unint64_t v11 = v5;
    }
    else {
      unint64_t v11 = 0;
    }
    unint64_t v7 = v7 + 1 - v11;
    if (!--v8) {
      goto LABEL_21;
    }
  }
  if (v9 == v5) {
    unint64_t v9 = v7;
  }
LABEL_21:
  if (v9 < v5) {
    return *(&buffer[v5] + v9);
  }
  else {
    return 0;
  }
}

- (id)objectForKey:(id)a3
{
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0;
  }
  unint64_t v5 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = self->storage.buffer;
  unint64_t v7 = [a3 hash] % v5;
  uint64_t v8 = v5 <= 1 ? 1 : v5;
  unint64_t v9 = v5;
  while (1)
  {
    uint64_t v10 = buffer[v7];
    if (!v10) {
      break;
    }
    if (v10 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v9 == v5) {
        unint64_t v9 = v7;
      }
    }
    else if (v10 == a3 || ([(state *)v10 isEqual:a3] & 1) != 0)
    {
      unint64_t v9 = v7;
      goto LABEL_21;
    }
    if (v7 + 1 >= v5) {
      unint64_t v11 = v5;
    }
    else {
      unint64_t v11 = 0;
    }
    unint64_t v7 = v7 + 1 - v11;
    if (!--v8) {
      goto LABEL_21;
    }
  }
  if (v9 == v5) {
    unint64_t v9 = v7;
  }
LABEL_21:
  if (v9 < v5) {
    return *(&buffer[v5] + v9);
  }
  else {
    return 0;
  }
}

- (unint64_t)count
{
  return self->storage.var0.var1.other & 0x1FFFFFF;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v12 = _os_log_pack_size();
    v14 = (char *)v21 - ((MEMORY[0x1F4188790](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a5;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_20;
  }
  if (a5 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    v14 = (char *)v21 - ((MEMORY[0x1F4188790](v12, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]", a5);
LABEL_20:
    v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v12];
    objc_exception_throw(v20);
  }
  unint64_t var0 = a3->var0;
  unint64_t v6 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((self->storage.var0.var0.mutations >> 55) & 0x1F8));
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&mdict_countByEnumeratingWithStateObjectsCount_const_mu;
  }
  if (var0 >= v6) {
    return 0;
  }
  buffer = self->storage.buffer;
  a3->var1 = a4;
  unint64_t result = 0;
  if (a5)
  {
    do
    {
      unint64_t v9 = buffer[var0];
      if (v9) {
        BOOL v10 = v9 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        a4[result++] = v9;
      }
      ++var0;
    }
    while (var0 < v6 && result < a5);
  }
  a3->unint64_t var0 = var0;
  return result;
}

- (void)dealloc
{
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v22[1] = *(void *)off_1ECE0A5B0;
  unint64_t v5 = a5 >> 61;
  if (a3 && v5 || a4 && v5)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v22 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[__NSFrozenDictionaryM getObjects:andKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSFrozenDictionaryM getObjects:andKeys:count:]", a5);
    v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v16];
    objc_exception_throw(v21);
  }
  unint64_t mutations = self->storage.var0.var0.mutations;
  unint64_t v7 = mutations >> 58;
  unint64_t v8 = HIDWORD(mutations) & 0x1FFFFFF;
  if (v8 >= a5) {
    unint64_t v8 = a5;
  }
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = 0;
    unint64_t v11 = LODWORD(__NSDictionarySizes_0[v7]);
    buffer = self->storage.buffer;
    do
    {
      uint64_t v13 = buffer[v10];
      if (v13) {
        BOOL v14 = v13 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14)
      {
        if (a4) {
          *a4++ = v13;
        }
        if (a3) {
          *a3++ = *(&buffer[v11] + v10);
        }
        --v8;
      }
      ++v10;
    }
    while (v10 < v11 && v8);
  }
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    unint64_t v5 = _cow_create((uint64_t)self, 0);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  unint64_t v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  BOOL v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v9, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 0);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  id v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  unint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v10, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)keyEnumerator
{
  uint64_t v2 = (void *)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];

  return v2;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v19[7] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v12 = _os_log_pack_size();
    BOOL v14 = &v18[-((MEMORY[0x1F4188790](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[__NSFrozenDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSFrozenDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v12];
    objc_exception_throw(v17);
  }
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v7 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v19[0] = off_1ECE0A5A0;
  v19[1] = 3221225472;
  v19[2] = __mdict_enumerateKeysAndObjectsWithOptionsUsingBlock_block_invoke;
  v19[3] = &unk_1ECE00F88;
  v19[4] = a4;
  v19[5] = buffer;
  v19[6] = &buffer[v7];
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v19) & 1) == 0)
  {
    v18[15] = 0;
    if (mutations >> 58)
    {
      size_t v8 = 0;
      do
      {
        id v9 = buffer[v8];
        if (v9) {
          BOOL v10 = v9 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          unint64_t v11 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v11);
        }
        ++v8;
      }
      while (v8 < v7);
    }
  }
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSFrozenDictionaryM keysOfEntriesWithOptions:passingTest:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[__NSFrozenDictionaryM keysOfEntriesWithOptions:passingTest:]");
    id v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  p_storage = (uint64_t *)&self->storage;

  return mdict_keysOfEntriesWithOptionsPassingTest(p_storage, a3, (uint64_t)a4);
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v7 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16[0] = off_1ECE0A5A0;
  v16[1] = 3221225472;
  v16[2] = __mdict_keyOfEntryWithOptionsPassingTest_block_invoke;
  v16[3] = &unk_1ECE00FB0;
  v16[6] = buffer;
  v16[7] = &buffer[v7];
  v16[4] = a4;
  v16[5] = &v17;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16))
  {
    CFStringRef v8 = (state *)atomic_load((unint64_t *)v18 + 3);
  }
  else
  {
    char v15 = 0;
    if (mutations >> 58)
    {
      CFStringRef v8 = 0;
      if (v7 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v7;
      }
      do
      {
        BOOL v10 = *buffer;
        if (*buffer) {
          BOOL v11 = v10 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          uint64_t v12 = buffer[v7];
          uint64_t v13 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, state *, state *, char *))a4 + 2))(a4, v10, v12, &v15))
          {
            char v15 = 1;
            CFStringRef v8 = v10;
          }
          _CFAutoreleasePoolPop(v13);
          if (v15) {
            break;
          }
        }
        ++buffer;
        --v9;
      }
      while (v9);
    }
    else
    {
      CFStringRef v8 = 0;
    }
  }
  _Block_object_dispose(&v17, 8);
  return v8;
}

@end