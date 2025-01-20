@interface __NSArrayI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)nothingAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSArrayI

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t used = self->storage.used;
  if (used <= a3) {
    __boundsFail(a3, used);
  }
  return self->storage.list[a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v15[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a5;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a5;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v14);
  }
  if (a3->var0) {
    return 0;
  }
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_6;
  list = self->storage.list;
  unint64_t result = self->storage.used;
  a3->var0 = -1;
  a3->var1 = list;
  return result;
}

- (id)mutableCopy
{
  return __NSArrayM_new(self->storage.list, self->storage.used, 0);
}

- (unint64_t)count
{
  return self->storage.used;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v27[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4.length)
  {
    NSUInteger length = a4.length;
    uint64_t v11 = _os_log_pack_size();
    v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSArrayI getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = length;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayI getObjects:range:]", length);
    goto LABEL_17;
  }
  if (a4.length >> 61)
  {
    NSUInteger v15 = a4.length;
    uint64_t v11 = _os_log_pack_size();
    v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSArrayI getObjects:range:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = v15;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayI getObjects:range:]", v15);
LABEL_17:
    v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v17);
  }
  p_storage = &self->storage;
  unint64_t used = self->storage.used;
  if ((a4.location & 0x8000000000000000) != 0 || used < a4.location + a4.length)
  {
    NSUInteger location = a4.location;
    NSUInteger v19 = a4.length;
    uint64_t v20 = _os_log_pack_size();
    uint64_t v21 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v24 = used - 1;
      double v25 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[__NSArrayI getObjects:range:]", location, v19, v24);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v25, "-[__NSArrayI getObjects:range:]", location, v19, v24);
    }
    else
    {
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[__NSArrayI getObjects:range:]", location, v19);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v22, "-[__NSArrayI getObjects:range:]", location, v19);
    }
    v26 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:(char *)v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0) size:v20];
    objc_exception_throw(v26);
  }
  v6 = &p_storage->list[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v6, 8 * a4.length);
  }
  else
  {
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        v7 = *v6;
        v6 = &p_storage->list[a4.location + 1];
        *a3++ = v7;
LABEL_9:
        uint64_t v8 = *v6++;
        *a3++ = v8;
LABEL_10:
        v9 = *v6++;
        *a3++ = v9;
LABEL_11:
        *a3 = *v6;
        break;
      default:
        return;
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(self->storage.list, self->storage.used, 0);
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  list = self->storage.list;
  for (unint64_t i = self->storage.used; i; --i)
  {
    if (((unint64_t)*list & 0x8000000000000000) == 0) {

    }
    ++list;
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSArrayI;
  [(__NSArrayI *)&v5 dealloc];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  unint64_t used = self->storage.used;
  if (used <= a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v9 = used - 1;
      double v10 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI objectAtIndexedSubscript:]", a3, v9);
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v10, "-[__NSArrayI objectAtIndexedSubscript:]", a3, v9);
    }
    else
    {
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = "-[__NSArrayI objectAtIndexedSubscript:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = a3;
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayI objectAtIndexedSubscript:]", a3);
    }
    uint64_t v11 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v11);
  }
  return self->storage.list[a3];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v20[6] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v13 = _os_log_pack_size();
    NSUInteger v15 = (char *)&v20[-1] - ((MEMORY[0x1F4188790](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[__NSArrayI enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSArrayI enumerateObjectsWithOptions:usingBlock:]");
    v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v13];
    objc_exception_throw(v18);
  }
  char v5 = a3;
  p_storage = &self->storage;
  size_t used = self->storage.used;
  v20[0] = off_1ECE0A5A0;
  v20[1] = 3221225472;
  v20[2] = __53____NSArrayI_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v20[3] = &unk_1ECB43C40;
  v20[4] = self;
  v20[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v20) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v19) = 0;
      for (unint64_t i = p_storage->used; i; unint64_t i = v11)
      {
        unint64_t v11 = i - 1;
        v12 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v12);
      }
    }
    else
    {
      HIBYTE(v19) = 0;
      if (p_storage->used)
      {
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }
        while (v8 < p_storage->used);
      }
    }
  }
}

- (id)nothingAtIndex:(unint64_t)a3
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end