@interface __NSFrozenArrayM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSFrozenArrayM

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v13 = _os_log_pack_size();
    v15 = (char *)&v19 - ((MEMORY[0x1F4188790](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[__NSFrozenArrayM enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSFrozenArrayM enumerateObjectsWithOptions:usingBlock:]");
    v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v13];
    objc_exception_throw(v18);
  }
  char v5 = a3;
  p_storage = &self->storage;
  unsigned int size = self->storage.size;
  size_t used = self->storage.state.var0.used;
  v21[0] = off_1ECE0A5A0;
  v21[1] = 3221225472;
  v21[2] = ___deque_enumerateObjectsWithOptionsBlock_block_invoke;
  v21[3] = &unk_1ECDAB810;
  unsigned int v22 = size;
  v21[4] = a4;
  v21[5] = &self->storage;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v21) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      char v20 = 0;
      uint64_t v11 = p_storage->state.var0.used;
      while (v11)
      {
        --v11;
        v12 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v12);
      }
    }
    else
    {
      char v20 = 0;
      if (p_storage->state.var0.used)
      {
        unint64_t v9 = 0;
        do
        {
          v10 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
          ++v9;
        }
        while (v9 < p_storage->state.var0.used);
      }
    }
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  v16[1] = *(void *)off_1ECE0A5B0;
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    uint64_t v8 = _os_log_pack_size();
    v10 = (char *)v16 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v13 = used - 1;
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSFrozenArrayM objectAtIndex:]", a3, v13);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v14, "-[__NSFrozenArrayM objectAtIndex:]", a3, v13);
    }
    else
    {
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSFrozenArrayM objectAtIndex:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = a3;
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSFrozenArrayM objectAtIndex:]", a3);
    }
    v15 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v15);
  }
  unsigned int size = self->storage.size;
  unsigned int v5 = self->storage.var0 + a3;
  if (size > v5) {
    unsigned int size = 0;
  }
  return self->storage.list[v5 - size];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  atomic_load((unint64_t *)&self->cow);
  unint64_t result = a3->var0;
  if (a3->var0 == -1) {
    return 0;
  }
  p_storage = &self->storage;
  if (result)
  {
    list = (id *)p_storage->list;
    a3->uint64_t var0 = -1;
    a3->var1 = list;
  }
  else
  {
    a3->var2 = (unint64_t *)&_deque_countByEnumeratingWithStateObjectsCount_const_mu;
    unint64_t result = p_storage->state.var0.used;
    uint64_t v8 = p_storage->list;
    uint64_t var0 = p_storage->var0;
    unsigned int size = p_storage->size;
    a3->var1 = (id *)&v8[var0];
    BOOL v11 = (int)var0 + (int)result >= size;
    unint64_t v12 = var0 + result - size;
    if (v12 != 0 && v11)
    {
      a3->uint64_t var0 = v12;
      result -= v12;
    }
    else
    {
      a3->uint64_t var0 = -1;
    }
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v16[1] = *(void *)off_1ECE0A5B0;
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    uint64_t v8 = _os_log_pack_size();
    v10 = (char *)v16 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v13 = used - 1;
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3, v13);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v14, "-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3, v13);
    }
    else
    {
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSFrozenArrayM objectAtIndexedSubscript:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = a3;
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3);
    }
    v15 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v15);
  }
  unsigned int size = self->storage.size;
  unsigned int v5 = self->storage.var0 + a3;
  if (size > v5) {
    unsigned int size = 0;
  }
  return self->storage.list[v5 - size];
}

- (void)dealloc
{
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  unsigned int v5 = a3;
  v43[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4.length)
  {
    uint64_t v25 = _os_log_pack_size();
    v27 = (char *)v43 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315394;
    *(void *)(v28 + 4) = "-[__NSFrozenArrayM getObjects:range:]";
    *(_WORD *)(v28 + 12) = 2048;
    *(void *)(v28 + 14) = length;
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSFrozenArrayM getObjects:range:]", length);
    goto LABEL_35;
  }
  if (a4.length >> 61)
  {
    uint64_t v25 = _os_log_pack_size();
    v27 = (char *)v43 - ((MEMORY[0x1F4188790](v25, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315394;
    *(void *)(v31 + 4) = "-[__NSFrozenArrayM getObjects:range:]";
    *(_WORD *)(v31 + 12) = 2048;
    *(void *)(v31 + 14) = length;
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSFrozenArrayM getObjects:range:]", length);
LABEL_35:
    v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v32);
  }
  p_storage = &self->storage;
  NSUInteger used = self->storage.state.var0.used;
  if ((a4.location & 0x8000000000000000) != 0 || a4.location + a4.length > used)
  {
    NSUInteger location = a4.location;
    uint64_t v34 = _os_log_pack_size();
    v36 = (char *)v43 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v37 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v40 = used - 1;
      double v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v37, (uint64_t)"-[__NSFrozenArrayM getObjects:range:]", location, length, v40);
      CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v41, "-[__NSFrozenArrayM getObjects:range:]", location, length, v40);
    }
    else
    {
      double v38 = __os_log_helper_1_2_3_8_32_8_0_8_0(v37, (uint64_t)"-[__NSFrozenArrayM getObjects:range:]", location, length);
      CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v38, "-[__NSFrozenArrayM getObjects:range:]", location, length);
    }
    v42 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v36 size:v34];
    objc_exception_throw(v42);
  }
  if (a3 && a4.length)
  {
    list = p_storage->list;
    uint64_t size = self->storage.size;
    unint64_t v10 = (unint64_t)&p_storage->list[size];
    uint64_t v11 = &self->storage.list[self->storage.var0] + a4.location;
    uint64_t v12 = -size;
    if (v10 <= (unint64_t)v11) {
      uint64_t v13 = -size;
    }
    else {
      uint64_t v13 = 0;
    }
    double v14 = (void **)&v11[v13];
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_31;
      case 2uLL:
        goto LABEL_27;
      case 3uLL:
        goto LABEL_23;
      case 4uLL:
        goto LABEL_19;
      default:
        if ((uint64_t)(v10 - (void)v14) >> 3 >= a4.length) {
          LODWORD(v15) = a4.length;
        }
        else {
          uint64_t v15 = (uint64_t)(v10 - (void)v14) >> 3;
        }
        if (v15) {
          memmove(a3, v14, 8 * v15);
        }
        if (length != v15) {
          memmove(&v5[v15], list, 8 * (length - v15));
        }
LABEL_19:
        CFStringRef v17 = *v14;
        uint64_t v16 = v14 + 1;
        *v5++ = v17;
        if (v10 <= (unint64_t)v16) {
          uint64_t v18 = v12;
        }
        else {
          uint64_t v18 = 0;
        }
        double v14 = (void **)&v16[v18];
LABEL_23:
        char v20 = *v14;
        uint64_t v19 = v14 + 1;
        *v5++ = v20;
        if (v10 <= (unint64_t)v19) {
          uint64_t v21 = v12;
        }
        else {
          uint64_t v21 = 0;
        }
        double v14 = (void **)&v19[v21];
LABEL_27:
        uint64_t v23 = *v14;
        unsigned int v22 = v14 + 1;
        *v5++ = v23;
        if (v10 <= (unint64_t)v22) {
          uint64_t v24 = v12;
        }
        else {
          uint64_t v24 = 0;
        }
        double v14 = (void **)&v22[v24];
LABEL_31:
        *unsigned int v5 = *v14;
        break;
    }
  }
}

- (unint64_t)count
{
  return self->storage.state.var0.used;
}

- (id)mutableCopy
{
  p_cow = &self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    unsigned int v5 = _cow_create((uint64_t)self, 0);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)p_cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  uint64_t v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v9, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  list = self->storage.list;
  unsigned int used = self->storage.state.var0.used;
  uint64_t var0 = self->storage.var0;
  unsigned int v6 = self->storage.size - var0;
  if (used >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = used;
  }
  if (v7)
  {
    unint64_t result = 0;
    uint64_t v9 = &list[var0];
    while (v9[result] != a3)
    {
      if (v7 == ++result) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    if (used <= v6)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      while (*list != a3)
      {
        LODWORD(v7) = v7 + 1;
        ++list;
        if (used == v7) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      return v7;
    }
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  p_cow = &self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    unsigned int v6 = _cow_create((uint64_t)self, 0);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)p_cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  id v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  unint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v10, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end