@interface NSConstantDictionary
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSConstantDictionary)new;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSConstantDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)allKeys;
- (id)allValues;
- (id)keyEnumerator;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)retainCount;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation NSConstantDictionary

- (id)objectForKey:(id)a3
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  unint64_t options = self->_options;
  size_t count = self->_count;
  keys = self->_keys;
  objects = self->_objects;
  id v11 = a3;
  if (!count) {
    return 0;
  }
  if (count == 1 && *keys == a3) {
    return (id)*objects;
  }
  if ((options & 2) != 0)
  {
    if ((_NSIsNSNumber((uint64_t)a3) & 1) == 0) {
      return 0;
    }
    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToNumber:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0;
    }
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForNumericKeys;
    if ((options & 1) == 0)
    {
LABEL_20:
      while (1)
      {
        v10 = (void *)*keys;
        if (*keys == a3) {
          break;
        }
        if ((options & 2) != 0)
        {
          if (objc_msgSend(v10, "isEqualToNumber:", a3, v11, v12)) {
            return (id)*objects;
          }
        }
        else if ([v10 isEqualToString:a3])
        {
          return (id)*objects;
        }
        id result = 0;
        ++objects;
        ++keys;
        if (!--count) {
          return result;
        }
      }
      return (id)*objects;
    }
  }
  else
  {
    if ((_NSIsNSString((uint64_t)a3) & 1) == 0)
    {
      if (!options)
      {
        while (*keys != a3 && (objc_msgSend((id)*keys, "isEqual:", a3, v11, v12) & 1) == 0)
        {
          id result = 0;
          ++objects;
          ++keys;
          if (!--count) {
            return result;
          }
        }
        return (id)*objects;
      }
      return 0;
    }
    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToString:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0;
    }
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForStringKeys;
    if ((options & 1) == 0) {
      goto LABEL_20;
    }
  }
  id result = bsearch(&v11, keys, count, 8uLL, v9);
  if (!result) {
    return result;
  }
  objects = (const void **)((char *)objects + (unsigned char *)result - (unsigned char *)keys);
  return (id)*objects;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (!a3)
  {
    uint64_t v8 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: function pointer is NULL", v8);
    v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0];
    objc_exception_throw(v10);
  }
  if (self->_count)
  {
    unint64_t v7 = 0;
    do
    {
      ((void (*)(const void *, const void *, void *))a3)(self->_keys[v7], self->_objects[v7], a4);
      ++v7;
    }
    while (v7 < self->_count);
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a5;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_18;
  }
  if (a5 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a5;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]", a5);
LABEL_18:
    v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v17);
  }
  unint64_t count = self->_count;
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_4;
  }
  if (count <= var0) {
    return 0;
  }
  a3->var1 = a4;
  if (!a5) {
    return 0;
  }
  unint64_t v7 = 0;
  do
  {
    uint64_t v8 = (void *)self->_keys[var0++];
    a3->unint64_t var0 = var0;
    if (v8)
    {
      a4[v7++] = v8;
      unint64_t var0 = a3->var0;
    }
  }
  while (var0 < count && v7 < a5);
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  unint64_t options = self->_options;
  size_t count = self->_count;
  keys = self->_keys;
  objects = self->_objects;
  id v11 = a3;
  if (!count) {
    return 0;
  }
  if (count == 1 && *keys == a3) {
    return (id)*objects;
  }
  if ((options & 2) != 0)
  {
    if ((_NSIsNSNumber((uint64_t)a3) & 1) == 0) {
      return 0;
    }
    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToNumber:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0;
    }
    CFStringRef v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForNumericKeys;
    if ((options & 1) == 0)
    {
LABEL_20:
      while (1)
      {
        v10 = (void *)*keys;
        if (*keys == a3) {
          break;
        }
        if ((options & 2) != 0)
        {
          if (objc_msgSend(v10, "isEqualToNumber:", a3, v11, v12)) {
            return (id)*objects;
          }
        }
        else if ([v10 isEqualToString:a3])
        {
          return (id)*objects;
        }
        id result = 0;
        ++objects;
        ++keys;
        if (!--count) {
          return result;
        }
      }
      return (id)*objects;
    }
  }
  else
  {
    if ((_NSIsNSString((uint64_t)a3) & 1) == 0)
    {
      if (!options)
      {
        while (*keys != a3 && (objc_msgSend((id)*keys, "isEqual:", a3, v11, v12) & 1) == 0)
        {
          id result = 0;
          ++objects;
          ++keys;
          if (!--count) {
            return result;
          }
        }
        return (id)*objects;
      }
      return 0;
    }
    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToString:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0;
    }
    CFStringRef v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForStringKeys;
    if ((options & 1) == 0) {
      goto LABEL_20;
    }
  }
  id result = bsearch(&v11, keys, count, 8uLL, v9);
  if (!result) {
    return result;
  }
  objects = (const void **)((char *)objects + (unsigned char *)result - (unsigned char *)keys);
  return (id)*objects;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v15[1] = *(void *)off_1ECE0A5B0;
  unint64_t v7 = a5 >> 61;
  if (a3 && v7 || a4 && v7)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSConstantDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSConstantDictionary getObjects:andKeys:count:]", a5);
    CFStringRef v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
    objc_exception_throw(v14);
  }
  size_t v8 = 8 * self->_count;
  if (a4) {
    memmove(a4, self->_keys, v8);
  }
  if (a3)
  {
    objects = self->_objects;
    memmove(a3, objects, v8);
  }
}

- (id)allKeys
{
  return +[NSArray arrayWithObjects:self->_keys count:self->_count];
}

- (id)mutableCopy
{
  return __NSDictionaryM_new((uint64_t)self->_keys, (uint64_t)self->_objects, self->_count, 2uLL);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:&v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v9];
    objc_exception_throw(v12);
  }
  unint64_t count = self->_count;
  v13[7] = 0;
  if (count)
  {
    for (unint64_t i = 0; i < count; ++i)
    {
      if (self->_keys[i])
      {
        size_t v8 = (void *)_CFAutoreleasePoolPush();
        __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v8);
      }
    }
  }
}

- (id)allValues
{
  return +[NSArray arrayWithObjects:self->_objects count:self->_count];
}

- (NSConstantDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (id)keyEnumerator
{
  v2 = [[__NSConstantDictionaryEnumerator alloc] initWithConstantDictionary:self enumerateKeys:1];

  return v2;
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  unint64_t count = self->_count;
  char v13 = 0;
  if (!count) {
    return 0;
  }
  uint64_t v7 = 0;
  size_t v8 = 0;
  do
  {
    uint64_t v9 = (void *)self->_keys[v7];
    if (v9)
    {
      uint64_t v10 = self->_objects[v7];
      CFStringRef v11 = (void *)_CFAutoreleasePoolPush();
      if ((*((unsigned int (**)(id, void *, const void *, char *))a4 + 2))(a4, v9, v10, &v13))
      {
        char v13 = 1;
        size_t v8 = v9;
      }
      _CFAutoreleasePoolPop(v11);
      if (v13) {
        break;
      }
    }
    ++v7;
  }
  while (count != v7);
  return v8;
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSConstantDictionary keysOfEntriesWithOptions:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSConstantDictionary keysOfEntriesWithOptions:passingTest:]");
    uint64_t v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:(char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0) size:v13];
    objc_exception_throw(v16);
  }
  unint64_t count = self->_count;
  uint64_t v7 = +[NSSet set];
  HIBYTE(v17) = 0;
  if (count)
  {
    for (unint64_t i = 0; i < count; ++i)
    {
      uint64_t v9 = self->_keys[i];
      if (v9)
      {
        uint64_t v10 = self->_objects[i];
        CFStringRef v11 = (void *)_CFAutoreleasePoolPush();
        if ((*((unsigned int (**)(id, const void *, const void *, char *))a4 + 2))(a4, v9, v10, (char *)&v17 + 7))
        {
          [(NSSet *)v7 addObject:v9];
        }
        _CFAutoreleasePoolPop(v11);
        if (HIBYTE(v17)) {
          break;
        }
      }
    }
  }
  return +[NSSet setWithSet:v7];
}

- (id)objectEnumerator
{
  v2 = [[__NSConstantDictionaryEnumerator alloc] initWithConstantDictionary:self enumerateKeys:0];

  return v2;
}

+ (NSConstantDictionary)new
{
  return (NSConstantDictionary *)objc_opt_new();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSDictionaryM_new((uint64_t)self->_keys, (uint64_t)self->_objects, self->_count, 2uLL);
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end