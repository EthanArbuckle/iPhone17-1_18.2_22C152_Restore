@interface NSSharedKeyDictionary
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (id)sharedKeyDictionaryWithKeySet:(id)a3;
- (Class)classForCoder;
- (NSSharedKeyDictionary)initWithCoder:(id)a3;
- (NSSharedKeyDictionary)initWithKeySet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)keySet;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObservationInfo:(void *)a3;
@end

@implementation NSSharedKeyDictionary

- (void)setObject:(id)a3 forKey:(id)a4
{
  v24[1] = *(void *)off_1ECE0A5B0;
  ++self->_mutations;
  if (!a4)
  {
    uint64_t v12 = _os_log_pack_size();
    v14 = (char *)v24 - ((MEMORY[0x1F4188790](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSSharedKeyDictionary setObject:forKey:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[NSSharedKeyDictionary setObject:forKey:]");
    v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v12];
    objc_exception_throw(v17);
  }
  if (!a3)
  {
    uint64_t v18 = _os_log_pack_size();
    v20 = (char *)v24 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSSharedKeyDictionary setObject:forKey:]";
    *(_WORD *)(v21 + 12) = 2112;
    *(void *)(v21 + 14) = a4;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil (key: %@)", "-[NSSharedKeyDictionary setObject:forKey:]", a4);
    v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:v20 size:v18];
    objc_exception_throw(v23);
  }
  keyMap = self->_keyMap;
  if (keyMap) {
    uint64_t v8 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a4);
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_doKVO) {
    [(NSSharedKeyDictionary *)self willChangeValueForKey:a4];
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sideDic = self->_sideDic;
    if (!sideDic)
    {
      sideDic = (NSMutableDictionary *)objc_opt_new();
      self->_sideDic = sideDic;
    }
    [(NSMutableDictionary *)sideDic setObject:a3 forKey:a4];
  }
  else
  {
    uint64_t v10 = (uint64_t)self->_values[v8];
    if ((id)v10 != a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) == 0) {
        id v11 = a3;
      }
      if (v10)
      {
        self->_values[v8] = a3;
        if (v10 >= 1) {
      }
        }
      else
      {
        ++self->_count;
        self->_values[v8] = a3;
      }
    }
  }
  if (self->_doKVO)
  {
    [(NSSharedKeyDictionary *)self didChangeValueForKey:a4];
  }
}

- (id)objectForKey:(id)a3
{
  if (a3)
  {
    keyMap = self->_keyMap;
    if (keyMap)
    {
      uint64_t v6 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a3);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        return self->_values[v6];
      }
    }
  }
  sideDic = self->_sideDic;

  return [(NSDictionary *)sideDic objectForKey:a3];
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v22[1] = *(void *)off_1ECE0A5B0;
  unint64_t v9 = a5 >> 61;
  if (a3 && v9 || a4 && v9)
  {
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSSharedKeyDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSSharedKeyDictionary getObjects:andKeys:count:]", a5);
    uint64_t v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:(char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0) size:v18];
    objc_exception_throw(v21);
  }
  sideDic = self->_sideDic;
  if (sideDic)
  {
    unint64_t v11 = [(NSDictionary *)sideDic count];
    sideDic = self->_sideDic;
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (v11 >= a5) {
    unint64_t v12 = a5;
  }
  else {
    unint64_t v12 = v11;
  }
  [(NSDictionary *)sideDic getObjects:a3 andKeys:a4 count:v12];
  unint64_t v13 = a5 - v12;
  if (a5 != v12)
  {
    unint64_t v14 = [(NSSharedKeySet *)self->_keyMap count];
    if (v14)
    {
      if (a4) {
        uint64_t v15 = &a4[v12];
      }
      else {
        uint64_t v15 = 0;
      }
      if (a3) {
        CFStringRef v16 = &a3[v12];
      }
      else {
        CFStringRef v16 = 0;
      }
      unint64_t v17 = v14 - 1;
      do
      {
        if (self->_values[v17])
        {
          if (v15) {
            *v15++ = [(NSSharedKeySet *)self->_keyMap keyAtIndex:v17];
          }
          if (v16) {
            *v16++ = self->_values[v17];
          }
          if (!--v13) {
            break;
          }
        }
        --v17;
      }
      while (v17 != -1);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKeySet:", self->_keyMap);
  v5[2] = self->_count;
  unint64_t v6 = [(NSSharedKeySet *)self->_keyMap count];
  if (v6)
  {
    unint64_t v7 = v6 - 1;
    do
    {
      uint64_t v8 = (uint64_t)self->_values[v7];
      if (v8 >= 1)
      {
        id v9 = (id)v8;
        uint64_t v8 = (uint64_t)self->_values[v7];
      }
      *(void *)(v5[3] + 8 * v7--) = v8;
    }
    while (v7 != -1);
  }
  v5[5] = [(NSDictionary *)self->_sideDic mutableCopyWithZone:a3];
  return v5;
}

+ (id)sharedKeyDictionaryWithKeySet:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithKeySet:a3];

  return v3;
}

- (void)dealloc
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  values = self->_values;
  if (values)
  {
    unint64_t v4 = [(NSSharedKeySet *)self->_keyMap count];
    if (v4)
    {
      unint64_t v5 = v4;
      do
      {
        if (((unint64_t)*values & 0x8000000000000000) == 0) {

        }
        ++values;
        --v5;
      }
      while (v5);
    }
    free(self->_values);
  }
  keyMap = self->_keyMap;
  if ((uint64_t)keyMap >= 1) {

  }
  sideDic = self->_sideDic;
  if ((uint64_t)sideDic >= 1) {

  }
  v8.receiver = self;
  v8.super_class = (Class)NSSharedKeyDictionary;
  [(NSSharedKeyDictionary *)&v8 dealloc];
}

- (NSSharedKeyDictionary)initWithKeySet:(id)a3
{
  if (a3)
  {
    if (((unint64_t)a3 & 0x8000000000000000) == 0) {
      id v6 = a3;
    }
    self->_keyMap = (NSSharedKeySet *)a3;
    self->_ifkIMP = (void *)[a3 methodForSelector:sel_indexForKey_];
    unint64_t v7 = (id *)malloc_type_calloc([(NSSharedKeySet *)self->_keyMap count], 8uLL, 0x80040B8603338uLL);
    self->_values = v7;
    if (!v7)
    {
      uint64_t v9 = __CFExceptionProem((objc_class *)self, a2);
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - memory failure", v9);
      uint64_t v11 = _CFAutoreleasePoolAddObject(0, (uint64_t)v10);

      objc_exception_throw(+[NSException exceptionWithName:@"NSMallocException" reason:v11 userInfo:0]);
    }
  }
  return self;
}

- (unint64_t)count
{
  unint64_t count = self->_count;
  sideDic = self->_sideDic;
  if (sideDic) {
    sideDic = [(NSDictionary *)sideDic count];
  }
  return (unint64_t)sideDic + count;
}

- (id)keyEnumerator
{
  v17[1] = *(void *)off_1ECE0A5B0;
  unint64_t count = self->_count;
  sideDic = self->_sideDic;
  if (sideDic) {
    sideDic = [(NSDictionary *)sideDic count];
  }
  unint64_t v5 = (unint64_t)sideDic + count;
  if (v5 >> 60)
  {
    CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
    CFStringRef v16 = +[NSException exceptionWithName:@"NSGenericException" reason:v15 userInfo:0];
    CFRelease(v15);
    objc_exception_throw(v16);
  }
  v17[0] = 0;
  if (v5 <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = v5;
  }
  unint64_t v7 = (id *)_CFCreateArrayStorage(v6, 0, v17);
  [(NSSharedKeyDictionary *)self getObjects:0 andKeys:v7 count:v5];
  if (v7)
  {
    if (v5)
    {
      objc_super v8 = v7;
      unint64_t v9 = v5;
      do
      {
        id v10 = *v8++;
        --v9;
      }
      while (v9);
    }
    uint64_t v11 = [[NSArray alloc] _initByAdoptingBuffer:v7 count:v5 size:v5];
  }
  else
  {
    uint64_t v11 = [[NSArray alloc] initWithObjects:0 count:v5];
  }
  unint64_t v12 = v11;
  unint64_t v13 = [(NSArray *)v11 objectEnumerator];

  return v13;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5 = a5;
  v37[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v23 = _os_log_pack_size();
    v25 = (char *)v37 - ((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315394;
    *(void *)(v26 + 4) = "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v26 + 12) = 2048;
    *(void *)(v26 + 14) = v5;
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]", v5);
    v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v25 size:v23];
    objc_exception_throw(v28);
  }
  if (a5 >> 61)
  {
    uint64_t v29 = _os_log_pack_size();
    v31 = (char *)v37 - ((MEMORY[0x1F4188790](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136315394;
    *(void *)(v32 + 4) = "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v32 + 12) = 2048;
    *(void *)(v32 + 14) = v5;
    CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]", v5);
    v34 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v33) userInfo:0 osLogPack:v31 size:v29];
    objc_exception_throw(v34);
  }
  unint64_t var0 = a3->var0;
  if (!a3->var0)
  {
    a3->var2 = &self->_mutations;
    unint64_t count = self->_count;
    sideDic = self->_sideDic;
    if (sideDic)
    {
      sideDic = [(NSDictionary *)sideDic count];
      unint64_t v12 = a3->var0;
    }
    else
    {
      unint64_t v12 = 0;
    }
    unint64_t v13 = (unint64_t)sideDic + count;
    a3->var3[0] = v13;
    if (v13 <= v12)
    {
      unint64_t v5 = 0;
      unint64_t v18 = -1;
LABEL_22:
      a3->unint64_t var0 = v18;
      return v5;
    }
    if (v13 >> 60)
    {
      CFStringRef v35 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v13);
      v36 = +[NSException exceptionWithName:@"NSGenericException" reason:v35 userInfo:0];
      CFRelease(v35);
      objc_exception_throw(v36);
    }
    v37[0] = 0;
    unint64_t v14 = (id *)_CFCreateArrayStorage(v13, 0, v37);
    [(NSSharedKeyDictionary *)self getObjects:0 andKeys:v14 count:v13];
    if (v14)
    {
      uint64_t v15 = 0;
      do
        id v16 = v14[v15++];
      while (v13 != v15);
      unint64_t v17 = [[NSArray alloc] _initByAdoptingBuffer:v14 count:v13 size:v13];
    }
    else
    {
      unint64_t v17 = [[NSArray alloc] initWithObjects:0 count:v13];
    }
    a3->var3[1] = (unint64_t)v17;
    unint64_t var0 = a3->var0;
  }
  unint64_t v19 = a3->var3[0];
  BOOL v20 = v19 > var0;
  unint64_t v21 = v19 - var0;
  if (v20)
  {
    if (v21 < v5) {
      unint64_t v5 = v21;
    }
    objc_msgSend((id)a3->var3[1], "getObjects:range:", a4);
    a3->var1 = a4;
    unint64_t v18 = a3->var0 + v5;
    goto LABEL_22;
  }
  return 0;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v13 = &v17[-((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSSharedKeyDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSSharedKeyDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    id v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v16);
  }
  size_t v7 = [(NSSharedKeySet *)self->_keyMap count];
  uint64_t v19 = 0;
  BOOL v20 = (unsigned __int8 *)&v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = off_1ECE0A5A0;
  v18[1] = 3221225472;
  v18[2] = __71__NSSharedKeyDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v18[3] = &unk_1ECDABBE8;
  v18[4] = self;
  v18[5] = a4;
  v18[6] = &v19;
  if (!__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v18))
  {
    v17[15] = 0;
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (self->_values[i])
        {
          id v10 = (void *)_CFAutoreleasePoolPush();
          [(NSSharedKeySet *)self->_keyMap keyAtIndex:i];
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
      }
    }
    goto LABEL_10;
  }
  unsigned __int8 v8 = atomic_load(v20 + 24);
  if ((v8 & 1) == 0) {
LABEL_10:
  }
    [(NSDictionary *)self->_sideDic enumerateKeysAndObjectsWithOptions:a3 usingBlock:a4];
  _Block_object_dispose(&v19, 8);
}

void *__71__NSSharedKeyDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(void *result, uint64_t a2)
{
  if (*(void *)(*(void *)(result[4] + 24) + 8 * a2))
  {
    v3 = result;
    unint64_t v4 = (void *)_CFAutoreleasePoolPush();
    uint64_t v5 = v3[5];
    [*(id *)(v3[4] + 8) keyAtIndex:a2];
    __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v5);
    return _CFAutoreleasePoolPop(v4);
  }
  return result;
}

- (void)removeObjectForKey:(id)a3
{
  v16[1] = *(void *)off_1ECE0A5B0;
  ++self->_mutations;
  if (!a3)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = (char *)v16 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSSharedKeyDictionary removeObjectForKey:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[NSSharedKeyDictionary removeObjectForKey:]");
    CFStringRef v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v15);
  }
  keyMap = self->_keyMap;
  if (keyMap) {
    uint64_t v6 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a3);
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_doKVO) {
    [(NSSharedKeyDictionary *)self willChangeValueForKey:a3];
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sideDic = self->_sideDic;
    if (sideDic) {
      [(NSMutableDictionary *)sideDic removeObjectForKey:a3];
    }
  }
  else
  {
    values = self->_values;
    unint64_t v9 = (unint64_t)values[v6];
    values[v6] = 0;
    if (v9)
    {
      --self->_count;
      if ((v9 & 0x8000000000000000) == 0) {
    }
      }
  }
  if (self->_doKVO)
  {
    [(NSSharedKeyDictionary *)self didChangeValueForKey:a3];
  }
}

- (id)keySet
{
  return self->_keyMap;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v16 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: this object can only be encoded by a keyed coder", v16);
    unint64_t v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0];
    objc_exception_throw(v18);
  }
  [a3 encodeObject:self->_keyMap forKey:@"NS.skkeyset"];
  [a3 encodeObject:self->_sideDic forKey:@"NS.sideDic"];
  [a3 encodeInt64:self->_count forKey:@"NS.count"];
  if (self->_count)
  {
    uint64_t v6 = +[NSArray array];
    size_t v7 = +[NSArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    keyMap = self->_keyMap;
    uint64_t v9 = [(NSSharedKeySet *)keyMap countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(keyMap);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v14 = [(NSSharedKeyDictionary *)self objectForKey:v13];
          if (v14)
          {
            id v15 = v14;
            [(NSArray *)v6 addObject:v13];
            [(NSArray *)v7 addObject:v15];
          }
        }
        uint64_t v10 = [(NSSharedKeySet *)keyMap countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v10);
    }
    [a3 encodeObject:v6 forKey:@"NS.keys"];
    [a3 encodeObject:v7 forKey:@"NS.values"];
  }
}

- (NSSharedKeyDictionary)initWithCoder:(id)a3
{
  uint64_t v109 = *(void *)off_1ECE0A5B0;
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v16 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: this object can only be decoded by a keyed coder", v16);
    uint64_t v18 = _CFAutoreleasePoolAddObject(0, (uint64_t)v17);

    [a3 failWithError:__archiveIsCorrupt(v18)];
    return 0;
  }
  uint64_t v6 = objc_opt_class();
  objc_getClass("NSKeyedUnarchiver");
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v107 = 0;
  uint64_t v108 = 0;
  if (isKindOfClass) {
    id v8 = a3;
  }
  else {
    id v8 = 0;
  }
  uint64_t v105 = 0;
  id v106 = v8;
  id v103 = v8;
  uint64_t v104 = 0;
  uint64_t v9 = [a3 decodeObjectOfClass:v6 forKey:@"NS.skkeyset"];
  uint64_t v10 = v9;
  uint64_t v107 = v9;
  uint64_t v99 = 8;
  self->_keyMap = (NSSharedKeySet *)v9;
  if (v9 >= 1) {
    id v11 = (id)v9;
  }
  uint64_t v12 = objc_opt_class();
  if (v12 == v6)
  {
    long long v20 = *(Class *)((char *)&self->super.super.super.isa + v99);
    if (v20)
    {
      self->_ifkIMP = (void *)[v20 methodForSelector:sel_indexForKey_];
      long long v21 = (id *)malloc_type_calloc([*(id *)((char *)&self->super.super.super.isa + v99) count], 8uLL, 0x80040B8603338uLL);
      self->_values = v21;
      if (!v21)
      {
        uint64_t v33 = __CFExceptionProem((objc_class *)self, a2);
        CFStringRef v34 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - memory failure", v33);
        uint64_t v15 = _CFAutoreleasePoolAddObject(0, (uint64_t)v34);
        if ([a3 decodingFailurePolicy] == 1) {

        }
        goto LABEL_10;
      }
      if (isKindOfClass)
      {
        uint64_t v22 = objc_opt_new();
        uint64_t v108 = v22;
        if (!v22)
        {
          uint64_t v43 = __CFExceptionProem((objc_class *)self, a2);
          CFStringRef v44 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - memory failure", v43);
          uint64_t v15 = _CFAutoreleasePoolAddObject(0, (uint64_t)v44);
          if ([a3 decodingFailurePolicy] == 1) {

          }
          goto LABEL_10;
        }
        if (v10) {
          [a3 replaceObject:v10 withObject:v22];
        }
      }
    }
    Class v23 = objc_lookUpClass("NSArray");
    objc_lookUpClass("NSDictionary");
    Class v24 = objc_lookUpClass("NSMutableDictionary");
    block[0] = off_1ECE0A5A0;
    block[1] = 3221225472;
    block[2] = __39__NSSharedKeyDictionary_initWithCoder___block_invoke;
    block[3] = &unk_1ECDB0298;
    block[4] = objc_lookUpClass("NSString");
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, block);
    }
    v25 = (void *)[a3 allowedClasses];
    uint64_t v26 = (void *)[v25 setByAddingObjectsFromSet:initWithCoder__oPlistClasses];
    uint64_t sideDic = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v26, "setByAddingObject:", v24), @"NS.sideDic");
    uint64_t v28 = sideDic;
    uint64_t v104 = sideDic;
    self->_uint64_t sideDic = (NSMutableDictionary *)sideDic;
    if (sideDic >= 1)
    {
      id v29 = (id)sideDic;
      uint64_t sideDic = (uint64_t)self->_sideDic;
    }
    if (sideDic)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v35 = __CFExceptionProem((objc_class *)self, a2);
        CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: invalid archive (must be mutable)", v35);
        uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v36);
        if ([a3 decodingFailurePolicy] == 1) {

        }
        goto LABEL_82;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = __CFExceptionProem((objc_class *)self, a2);
        CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: invalid archive (invalid dictionary)", v30);
        uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v31);
        if ([a3 decodingFailurePolicy] == 1) {

        }
LABEL_82:
        [a3 failWithError:__archiveIsCorrupt(v32)];
        goto LABEL_11;
      }
      if (isKindOfClass)
      {
        uint64_t v37 = objc_opt_new();
        uint64_t v105 = v37;
        if (!v37)
        {
          uint64_t v71 = __CFExceptionProem((objc_class *)self, a2);
          CFStringRef v72 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unable to unarchive - memory failure", v71);
          uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v72);
          if ([a3 decodingFailurePolicy] == 1) {

          }
          goto LABEL_82;
        }
        if (v28) {
          [a3 replaceObject:v28 withObject:v37];
        }
      }
      uint64_t v38 = [(NSDictionary *)self->_sideDic count];
      unint64_t v40 = v38;
      if (v38 >= 1)
      {
        if ((unint64_t)v38 >= 0x1000001)
        {
          uint64_t v41 = __CFExceptionProem((objc_class *)self, a2);
          CFStringRef v42 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unreasonably sized collection", v41);
          uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v42);
          if ([a3 decodingFailurePolicy] == 1) {

          }
          goto LABEL_82;
        }
        v98 = &v93;
        MEMORY[0x1F4188790](v38, v39);
        v46 = (char *)&v93 - v45;
        v47 = 0;
        size_t v101 = 0;
        if (v40 >= 0x101)
        {
          v47 = (char *)_CFCreateArrayStorage(v40, 0, &v101);
          v46 = v47;
        }
        [(NSDictionary *)self->_sideDic getObjects:0 andKeys:v46 count:v40];
        while ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v46 += 8;
          if (!--v40)
          {
            free(v47);
            goto LABEL_56;
          }
        }
        uint64_t v73 = objc_opt_class();
        CFStringRef v74 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"unexpected recursive keys (%@)", v73);
        uint64_t v75 = _CFAutoreleasePoolAddObject(0, (uint64_t)v74);
        if ([a3 decodingFailurePolicy] == 1) {

        }
        [a3 failWithError:__archiveIsCorrupt(v75)];
        v76 = v47;
LABEL_86:
        free(v76);
        self = 0;
        goto LABEL_12;
      }
    }
LABEL_56:
    unint64_t v48 = [a3 decodeInt64ForKey:@"NS.count"];
    unint64_t v49 = v48;
    if ((v48 & 0x8000000000000000) != 0)
    {
      uint64_t v53 = __CFExceptionProem((objc_class *)self, a2);
      CFStringRef v54 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: negative count", v53);
      uint64_t v52 = _CFAutoreleasePoolAddObject(0, (uint64_t)v54);
      if ([a3 decodingFailurePolicy] == 1) {
    }
      }
    else
    {
      if (!v48) {
        goto LABEL_12;
      }
      if (v48 < 0x1000001)
      {
        if (*(Class *)((char *)&self->super.super.super.isa + v99))
        {
          uint64_t v55 = [v26 setByAddingObject:v23];
          v56 = (void *)[a3 decodeObjectOfClasses:v55 forKey:@"NS.keys"];
          uint64_t v57 = [a3 decodeObjectOfClasses:v55 forKey:@"NS.values"];
          if (!_NSIsNSArray((uint64_t)v56)) {
            v56 = 0;
          }
          if (_NSIsNSArray(v57)) {
            v58 = (void *)v57;
          }
          else {
            v58 = 0;
          }
          uint64_t v59 = [v56 count];
          uint64_t v60 = [v58 count];
          if (v59 && v60)
          {
            if (v59 == v60)
            {
              if (v59 == v49)
              {
                v98 = &v93;
                uint64_t v62 = MEMORY[0x1F4188790](v60, v61);
                v65 = (char *)&v93 - v64;
                size_t v101 = 0;
                if (v49 > 0x100)
                {
                  v65 = (char *)_CFCreateArrayStorage(v49, 0, &v101);
                  MEMORY[0x1F4188790](v65, v83);
                  v67 = &v92;
                  size_t v100 = 0;
                  v68 = _CFCreateArrayStorage(v49, 0, &v100);
                  v97 = v65;
                }
                else
                {
                  MEMORY[0x1F4188790](v62, v63);
                  v67 = (uint64_t *)((char *)&v93 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
                  v97 = 0;
                  v68 = 0;
                  size_t v100 = 0;
                }
                id v95 = v58;
                v96 = v68;
                if (v49 >= 0x101) {
                  v67 = (uint64_t *)v68;
                }
                objc_msgSend(v56, "getObjects:range:", v65, 0, v49);
                v94 = v65;
                unint64_t v84 = v49;
                do
                {
                  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
                  {
                    uint64_t v87 = objc_opt_class();
                    CFStringRef v88 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"unexpected recursive keys (%@)", v87);
                    uint64_t v89 = _CFAutoreleasePoolAddObject(0, (uint64_t)v88);
                    if ([a3 decodingFailurePolicy] == 1) {

                    }
                    goto LABEL_109;
                  }
                  v65 += 8;
                  --v84;
                }
                while (v84);
                objc_msgSend(v95, "getObjects:range:", v67, 0, v49);
                v85 = v94;
                while (1)
                {
                  uint64_t v86 = *(void *)v85;
                  if (((uint64_t (*)(void, char *, void))self->_ifkIMP)(*(Class *)((char *)&self->super.super.super.isa + v99), sel_indexForKey_, *(void *)v85) == 0x7FFFFFFFFFFFFFFFLL)break; {
                  [(NSSharedKeyDictionary *)self setObject:*v67++ forKey:v86];
                  }
                  v85 += 8;
                  if (!--v49)
                  {
                    free(v96);
                    free(v97);
                    goto LABEL_12;
                  }
                }
                uint64_t v90 = __CFExceptionProem((objc_class *)self, a2);
                CFStringRef v91 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: encoded key not present in keyset", v90);
                uint64_t v89 = _CFAutoreleasePoolAddObject(0, (uint64_t)v91);
                if ([a3 decodingFailurePolicy] == 1) {

                }
LABEL_109:
                [a3 failWithError:__archiveIsCorrupt(v89)];
                free(v96);
                v76 = v97;
                goto LABEL_86;
              }
              uint64_t v81 = __CFExceptionProem((objc_class *)self, a2);
              CFStringRef v82 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: more entries than expected", v81);
              uint64_t v52 = _CFAutoreleasePoolAddObject(0, (uint64_t)v82);
              if ([a3 decodingFailurePolicy] == 1) {
            }
              }
            else
            {
              uint64_t v79 = __CFExceptionProem((objc_class *)self, a2);
              CFStringRef v80 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: encoded keys/values length does not match", v79);
              uint64_t v52 = _CFAutoreleasePoolAddObject(0, (uint64_t)v80);
              if ([a3 decodingFailurePolicy] == 1) {
            }
              }
          }
          else
          {
            uint64_t v77 = __CFExceptionProem((objc_class *)self, a2);
            CFStringRef v78 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: encoded keys/values are empty", v77);
            uint64_t v52 = _CFAutoreleasePoolAddObject(0, (uint64_t)v78);
            if ([a3 decodingFailurePolicy] == 1) {
          }
            }
        }
        else
        {
          uint64_t v69 = __CFExceptionProem((objc_class *)self, a2);
          CFStringRef v70 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: invalid archive (encoded count but missing keyset)", v69);
          uint64_t v52 = _CFAutoreleasePoolAddObject(0, (uint64_t)v70);
          if ([a3 decodingFailurePolicy] == 1) {
        }
          }
      }
      else
      {
        uint64_t v50 = __CFExceptionProem((objc_class *)self, a2);
        CFStringRef v51 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: unreasonably sized collection", v50);
        uint64_t v52 = _CFAutoreleasePoolAddObject(0, (uint64_t)v51);
        if ([a3 decodingFailurePolicy] == 1) {
      }
        }
    }
    [a3 failWithError:__archiveIsCorrupt(v52)];
    goto LABEL_11;
  }
  uint64_t v13 = __CFExceptionProem((objc_class *)self, a2);
  CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: invalid archive (unexpected keyset: %@)", v13, v12);
  uint64_t v15 = _CFAutoreleasePoolAddObject(0, (uint64_t)v14);
  if ([a3 decodingFailurePolicy] == 1) {

  }
LABEL_10:
  [a3 failWithError:__archiveIsCorrupt(v15)];
LABEL_11:
  self = 0;
LABEL_12:
  cleanup_sentinel_pair((uint64_t)&v103);
  cleanup_sentinel_pair((uint64_t)&v106);
  return self;
}

NSSet *__39__NSSharedKeyDictionary_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Class v2 = objc_lookUpClass("NSNumber");
  Class v3 = objc_lookUpClass("NSDate");
  Class v4 = objc_lookUpClass("NSURL");
  uint64_t v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_lookUpClass("NSData"), 0);
  initWithCoder__oPlistClasses = (uint64_t)v5;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  self->_doKVO = a3 != 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSharedKeyDictionary;
  -[NSSharedKeyDictionary setObservationInfo:](&v3, sel_setObservationInfo_);
}

@end