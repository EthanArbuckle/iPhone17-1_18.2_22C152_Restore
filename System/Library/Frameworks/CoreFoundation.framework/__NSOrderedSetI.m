@interface __NSOrderedSetI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSOrderedSetI

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a5;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:v8 size:v7];
    objc_exception_throw(v13);
  }
  if (a3->var0) {
    return 0;
  }
  a3->var0 = -1;
  a3->var1 = (id *)((char *)self + 16);
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  return *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
}

- (id)objectAtIndex:(unint64_t)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  unint64_t v3 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  if (v3 <= a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    if (v3)
    {
      uint64_t v9 = v3 - 1;
      double v10 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSOrderedSetI objectAtIndex:]", a3, v9);
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v10, "-[__NSOrderedSetI objectAtIndex:]", a3, v9);
    }
    else
    {
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = "-[__NSOrderedSetI objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = a3;
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[__NSOrderedSetI objectAtIndex:]", a3);
    }
    v11 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v11);
  }
  return *(id *)&self->_used[8 * a3 + 8];
}

- (void)dealloc
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  used = self->_used;
  unint64_t v4 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = *(void *)&self->_used[8 * i + 8];
      if (v6 >= 1)
      {

        unint64_t v4 = *(unsigned int *)used | ((unint64_t)(*((unsigned __int16 *)used + 2) | (used[6] << 16)) << 32);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSOrderedSetI;
  [(__NSOrderedSetI *)&v7 dealloc];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  unint64_t v8 = [(__NSOrderedSetI *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      unint64_t v20 = v8;
      uint64_t v9 = _os_log_pack_size();
      double v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[__NSOrderedSetI getObjects:range:]", location, length, --v20);
      CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[__NSOrderedSetI getObjects:range:]", location, length, v20);
    }
    else
    {
      uint64_t v9 = _os_log_pack_size();
      double v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v11 = _os_log_pack_fill();
      double v12 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSOrderedSetI getObjects:range:]", location, length);
      CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v12, "-[__NSOrderedSetI getObjects:range:]", location, length);
    }
    v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v10 size:v9];
    objc_exception_throw(v23);
  }
  if (!a3 && length)
  {
    uint64_t v14 = _os_log_pack_size();
    v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSOrderedSetI getObjects:range:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = length;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSOrderedSetI getObjects:range:]", length);
    goto LABEL_14;
  }
  if (length >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[__NSOrderedSetI getObjects:range:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = length;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSOrderedSetI getObjects:range:]", length);
LABEL_14:
    v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }

  memmove(a3, &self->_used[8 * location + 8], 8 * length);
}

- (unint64_t)count
{
  return *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
}

- (unint64_t)indexOfObject:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self->_used[7];
    if (v4 >= 4)
    {
      unint64_t v6 = v4 >> 2;
      int v7 = self->_used[6];
      int v8 = *(unsigned __int16 *)&self->_used[4];
      unint64_t v9 = __NSOrderedSetSizes[v4 >> 2];
      uint64_t v10 = *(unsigned int *)self->_used;
      int v11 = self->_used[7] & 3;
      unint64_t v12 = [a3 hash];
      if (v6 != 63 && v11 != 3)
      {
        uint64_t v16 = (char *)self + 16;
        CFStringRef v17 = &self->_used[((8 * v10) | ((unint64_t)(v8 | (v7 << 16)) << 35)) + 8];
        unint64_t v18 = v12 % v9;
        if (v9 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v9;
        }
        do
        {
          if (v11 == 1)
          {
            uint64_t v20 = *(unsigned __int16 *)&v17[2 * v18];
          }
          else if (v11)
          {
            uint64_t v20 = *(unsigned int *)&v17[4 * v18];
          }
          else
          {
            uint64_t v20 = v17[v18];
          }
          if (!v20) {
            break;
          }
          unint64_t v14 = v20 - 1;
          id v21 = *(id *)&v16[8 * v20 - 8];
          if (v21 == a3 || ([v21 isEqual:a3] & 1) != 0) {
            return v14;
          }
          unint64_t v22 = v18 + 1 >= v9 ? v9 : 0;
          unint64_t v18 = v18 + 1 - v22;
          --v19;
        }
        while (v19);
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v19[6] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v12 = _os_log_pack_size();
    unint64_t v14 = (char *)&v19[-1] - ((MEMORY[0x1F4188790](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[__NSOrderedSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSOrderedSetI enumerateObjectsWithOptions:usingBlock:]");
    CFStringRef v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v12];
    objc_exception_throw(v17);
  }
  char v5 = a3;
  size_t v7 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  v19[0] = off_1ECE0A5A0;
  v19[1] = 3221225472;
  v19[2] = __58____NSOrderedSetI_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v19[3] = &unk_1ECB43C40;
  v19[4] = self;
  v19[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, v7, (uint64_t)v19) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v18) = 0;
      for (unint64_t i = (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32))
              - 1; i != -1; --i)
      {
        int v11 = (void *)_CFAutoreleasePoolPush();
        __NSORDEREDSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v11);
      }
    }
    else
    {
      HIBYTE(v18) = 0;
      if (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32))
      {
        unint64_t v8 = 0;
        do
        {
          unint64_t v9 = (void *)_CFAutoreleasePoolPush();
          __NSORDEREDSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }
        while (v8 < (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32)));
      }
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end