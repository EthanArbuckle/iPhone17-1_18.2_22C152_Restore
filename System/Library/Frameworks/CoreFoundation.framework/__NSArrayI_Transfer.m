@interface __NSArrayI_Transfer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSArrayI_Transfer

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  list = self->_list;
  unint64_t used = self->_used;
  if (used)
  {
    do
    {
      if (((unint64_t)*list & 0x8000000000000000) == 0) {

      }
      ++list;
      --used;
    }
    while (used);
    list = self->_list;
  }
  free(list);
  v5.receiver = self;
  v5.super_class = (Class)__NSArrayI_Transfer;
  [(__NSArrayI_Transfer *)&v5 dealloc];
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
    *(void *)(v10 + 4) = "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a5;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a5;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v14);
  }
  if (a3->var0) {
    return 0;
  }
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_43;
  list = self->_list;
  a3->var0 = -1;
  a3->var1 = list;
  return self->_used;
}

- (unint64_t)count
{
  return self->_used;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v26[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4.length)
  {
    NSUInteger length = a4.length;
    uint64_t v10 = _os_log_pack_size();
    CFStringRef v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSArrayI_Transfer getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayI_Transfer getObjects:range:]", length);
    goto LABEL_17;
  }
  if (a4.length >> 61)
  {
    NSUInteger v14 = a4.length;
    uint64_t v10 = _os_log_pack_size();
    CFStringRef v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSArrayI_Transfer getObjects:range:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = v14;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayI_Transfer getObjects:range:]", v14);
LABEL_17:
    v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v16);
  }
  unint64_t used = self->_used;
  if ((a4.location & 0x8000000000000000) != 0 || used < a4.location + a4.length)
  {
    NSUInteger location = a4.location;
    NSUInteger v18 = a4.length;
    uint64_t v19 = _os_log_pack_size();
    uint64_t v20 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v23 = used - 1;
      double v24 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[__NSArrayI_Transfer getObjects:range:]", location, v18, v23);
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v24, "-[__NSArrayI_Transfer getObjects:range:]", location, v18, v23);
    }
    else
    {
      double v21 = __os_log_helper_1_2_3_8_32_8_0_8_0(v20, (uint64_t)"-[__NSArrayI_Transfer getObjects:range:]", location, v18);
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v21, "-[__NSArrayI_Transfer getObjects:range:]", location, v18);
    }
    v25 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:(char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0) size:v19];
    objc_exception_throw(v25);
  }
  objc_super v5 = &self->_list[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v5, 8 * a4.length);
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
        uint64_t v6 = *v5++;
        *a3++ = v6;
LABEL_9:
        v7 = *v5++;
        *a3++ = v7;
LABEL_10:
        uint64_t v8 = *v5++;
        *a3++ = v8;
LABEL_11:
        *a3 = *v5;
        break;
      default:
        return;
    }
  }
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  unint64_t used = self->_used;
  if (used <= a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v9 = used - 1;
      double v10 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3, v9);
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v10, "-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3, v9);
    }
    else
    {
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = "-[__NSArrayI_Transfer objectAtIndexedSubscript:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = a3;
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3);
    }
    CFStringRef v11 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v11);
  }
  return self->_list[a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(self->_list, self->_used, 0);
}

- (id)objectAtIndex:(unint64_t)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  unint64_t used = self->_used;
  if (used <= a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v9 = used - 1;
      double v10 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI_Transfer objectAtIndex:]", a3, v9);
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v10, "-[__NSArrayI_Transfer objectAtIndex:]", a3, v9);
    }
    else
    {
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = "-[__NSArrayI_Transfer objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = a3;
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayI_Transfer objectAtIndex:]", a3);
    }
    CFStringRef v11 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v11);
  }
  return self->_list[a3];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v19[6] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v12 = _os_log_pack_size();
    NSUInteger v14 = (char *)&v19[-1] - ((MEMORY[0x1F4188790](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[__NSArrayI_Transfer enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSArrayI_Transfer enumerateObjectsWithOptions:usingBlock:]");
    v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v12];
    objc_exception_throw(v17);
  }
  char v5 = a3;
  size_t used = self->_used;
  v19[0] = off_1ECE0A5A0;
  v19[1] = 3221225472;
  v19[2] = __62____NSArrayI_Transfer_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v19[3] = &unk_1ECB43C40;
  v19[4] = self;
  v19[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v19) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v18) = 0;
      for (unint64_t i = self->_used - 1; i != -1; --i)
      {
        CFStringRef v11 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v11);
      }
    }
    else
    {
      HIBYTE(v18) = 0;
      if (self->_used)
      {
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }
        while (v8 < self->_used);
      }
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end