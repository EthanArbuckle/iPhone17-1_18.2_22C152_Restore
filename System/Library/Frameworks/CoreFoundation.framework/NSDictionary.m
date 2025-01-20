@interface NSDictionary
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)allocWithZone:(_NSZone *)a3;
+ (NSDictionary)dictionary;
+ (NSDictionary)dictionaryWithDictionary:(NSDictionary *)dict;
+ (NSDictionary)dictionaryWithDictionary:(id)a3 copyItems:(BOOL)a4;
+ (NSDictionary)dictionaryWithObject:(id)object forKey:(id)key;
+ (NSDictionary)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;
+ (NSDictionary)dictionaryWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt;
+ (NSDictionary)dictionaryWithObjectsAndKeys:(id)firstObject;
+ (id)newDictionaryWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
+ (id)sharedKeySetForKeys:(NSArray *)keys;
- (BOOL)__getValue:(id *)a3 forKey:(id)a4;
- (BOOL)containsKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary;
- (BOOL)isNSDictionary__;
- (NSArray)allKeys;
- (NSArray)allKeysForObject:(id)anObject;
- (NSArray)allValues;
- (NSArray)keysSortedByValueUsingComparator:(NSComparator)cmptr;
- (NSArray)keysSortedByValueUsingSelector:(SEL)comparator;
- (NSArray)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (NSArray)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker;
- (NSDictionary)initWithCoder:(NSCoder *)coder;
- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary;
- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag;
- (NSDictionary)initWithObject:(id)a3 forKey:(id)a4;
- (NSDictionary)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;
- (NSDictionary)initWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt;
- (NSDictionary)initWithObjectsAndKeys:(id)firstObject;
- (NSEnumerator)keyEnumerator;
- (NSEnumerator)objectEnumerator;
- (NSSet)keysOfEntriesPassingTest:(void *)predicate;
- (NSSet)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (NSUInteger)count;
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)buffer count:(NSUInteger)len;
- (id)_cfMutableCopy;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invertedDictionary;
- (id)keyOfEntryPassingTest:(id)a3;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)aKey;
- (id)objectForKeyedSubscript:(id)key;
- (unint64_t)_cfTypeID;
- (unint64_t)countForKey:(id)a3;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)hash;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(void *)block;
- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getKeys:(id *)a3;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)objects andKeys:(id *)keys;
- (void)getObjects:(id *)objects andKeys:(id *)keys count:(NSUInteger)count;
@end

@implementation NSDictionary

- (NSArray)allKeys
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = [(NSDictionary *)self count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    v13 = +[NSException exceptionWithName:@"NSGenericException" reason:v12 userInfo:0];
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  [(NSDictionary *)self getObjects:0 andKeys:v6 count:v5];
  if (v6)
  {
    if (v5)
    {
      v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    v10 = [[NSArray alloc] _initByAdoptingBuffer:v6 count:v5 size:v5];
  }
  else
  {
    v10 = [[NSArray alloc] initWithObjects:0 count:v5];
  }
  return v10;
}

- (id)objectForKeyedSubscript:(id)key
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self objectForKey:key];
}

- (unint64_t)_cfTypeID
{
  return 18;
}

- (BOOL)__getValue:(id *)a3 forKey:(id)a4
{
  id v5 = [(NSDictionary *)self objectForKey:a4];
  if (a3 && v5) {
    *a3 = v5;
  }
  return v5 != 0;
}

- (void)getObjects:(id *)objects andKeys:(id *)keys
{
  v15[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  NSUInteger v8 = [(NSDictionary *)self count];
  NSUInteger v9 = v8 >> 61;
  if (objects && v9 || keys && v9)
  {
    NSUInteger v10 = v8;
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSDictionary getObjects:andKeys:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = v10;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSDictionary getObjects:andKeys:]", v10);
    v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
    objc_exception_throw(v14);
  }

  [(NSDictionary *)self getObjects:objects andKeys:keys count:v8];
}

- (BOOL)containsKey:(id)a3
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    if (a3) {
      return [(NSDictionary *)self objectForKey:a3] != 0;
    }
  }
  else if (a3)
  {
    return [(NSDictionary *)self objectForKey:a3] != 0;
  }
  return 0;
}

uint64_t __32__NSDictionary___apply_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (void)getObjects:(id *)objects andKeys:(id *)keys count:(NSUInteger)count
{
  NSUInteger v6 = count;
  v7 = keys;
  NSUInteger v8 = objects;
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  NSUInteger v10 = count >> 61;
  if (objects && v10 || keys && v10)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = v6;
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSDictionary getObjects:andKeys:count:]", v6);
    v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:&v20[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v16];
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  NSUInteger v11 = [(NSDictionary *)self countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v11)
  {
    NSUInteger v12 = v11;
    uint64_t v13 = *(void *)v22;
LABEL_9:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(self);
      }
      if (v6 == v14) {
        break;
      }
      v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
      if (v7) {
        *v7++ = v15;
      }
      if (v8) {
        *v8++ = [(NSDictionary *)self objectForKey:v15];
      }
      if (v12 == ++v14)
      {
        NSUInteger v12 = [(NSDictionary *)self countByEnumeratingWithState:&v21 objects:v20 count:16];
        v6 -= v14;
        if (v12) {
          goto LABEL_9;
        }
        return;
      }
    }
  }
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)buffer count:(NSUInteger)len
{
  v25[1] = *(void *)off_1ECE0A5B0;
  if (!buffer && len)
  {
    uint64_t v19 = _os_log_pack_size();
    v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = len;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSDictionary countByEnumeratingWithState:objects:count:]", len);
    goto LABEL_28;
  }
  if (len >> 61)
  {
    uint64_t v19 = _os_log_pack_size();
    v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315394;
    *(void *)(v23 + 4) = "-[NSDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v23 + 12) = 2048;
    *(void *)(v23 + 14) = len;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSDictionary countByEnumeratingWithState:objects:count:]", len);
LABEL_28:
    long long v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:v20 size:v19];
    objc_exception_throw(v24);
  }
  unint64_t v10 = state->state;
  if (state->state == -1) {
    return 0;
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
    unint64_t v10 = state->state;
    if (state->state) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    state->mutationsPtr = state->extra;
    state->extra[0] = [(NSDictionary *)self count];
    NSUInteger v12 = [(NSDictionary *)self keyEnumerator];
    state->extra[1] = (unint64_t)v12;
    if (v12)
    {
      NSUInteger v11 = v12;
      unint64_t v10 = state->state;
      goto LABEL_11;
    }
    return 0;
  }
LABEL_7:
  NSUInteger v11 = (NSEnumerator *)state->extra[1];
LABEL_11:
  state->itemsPtr = buffer;
  unint64_t v13 = state->extra[0];
  if (v13 - v10 >= len) {
    NSUInteger v14 = len;
  }
  else {
    NSUInteger v14 = v13 - v10;
  }
  if (v14)
  {
    NSUInteger v15 = 0;
    while (1)
    {
      id v16 = [(NSEnumerator *)v11 nextObject];
      if (!v16) {
        break;
      }
      buffer[v15++] = v16;
      if (v14 == v15)
      {
        unint64_t v10 = state->state;
        goto LABEL_19;
      }
    }
    unint64_t v17 = -1;
  }
  else
  {
LABEL_19:
    unint64_t v17 = v10 + v14;
    if (v13 <= v17) {
      unint64_t v17 = -1;
    }
    NSUInteger v15 = v14;
  }
  state->state = v17;
  return v15;
}

- (unint64_t)countForKey:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return [(NSDictionary *)self objectForKey:a3] != 0;
}

- (NSArray)allKeysForObject:(id)anObject
{
  uint64_t v34 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  NSUInteger v6 = [(NSDictionary *)self count];
  if (v6 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  unint64_t v10 = (char *)&v27 - v9;
  size_t v28 = 0;
  if (v11 >= 0x101)
  {
    unint64_t v10 = (char *)_CFCreateArrayStorage(v8, 0, &v28);
    NSUInteger v12 = (id *)v10;
  }
  else
  {
    NSUInteger v12 = 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  NSUInteger v13 = [(NSDictionary *)self countByEnumeratingWithState:&v30 objects:v29 count:16];
  NSUInteger v14 = v10;
  if (v13)
  {
    uint64_t v15 = *(void *)v31;
    NSUInteger v14 = v10;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(self);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v18 = [(NSDictionary *)self objectForKey:v17];
        if (v18 == anObject || [anObject isEqual:v18])
        {
          *(void *)NSUInteger v14 = v17;
          v14 += 8;
        }
      }
      NSUInteger v13 = [(NSDictionary *)self countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v13);
  }
  uint64_t v19 = (v14 - v10) >> 3;
  if (v12)
  {
    if (v14 - v10 >= 1)
    {
      if (v19 <= 1) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = (v14 - v10) >> 3;
      }
      uint64_t v21 = v12;
      do
      {
        id v22 = *v21++;
        --v20;
      }
      while (v20);
    }
    uint64_t v23 = [[NSArray alloc] _initByAdoptingBuffer:v12 count:v19 size:v19];
  }
  else
  {
    uint64_t v23 = [[NSArray alloc] initWithObjects:v10 count:(v14 - v10) >> 3];
  }
  return v23;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  NSUInteger v6 = [(NSDictionary *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(self);
        }
        id v10 = [(NSDictionary *)self objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v10 == a3 || ([a3 isEqual:v10] & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }
      NSUInteger v7 = [(NSDictionary *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
      LOBYTE(v6) = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  if (otherDictionary && (_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSDictionary isEqualToDictionary:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[NSDictionary isEqualToDictionary:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:&v21[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v16];
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  LOBYTE(v6) = otherDictionary == self;
  if (otherDictionary != self && otherDictionary)
  {
    NSUInteger v7 = [(NSDictionary *)self count];
    if ([(NSDictionary *)otherDictionary count] == v7)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      NSUInteger v8 = [(NSDictionary *)self countByEnumeratingWithState:&v22 objects:v21 count:16];
      if (!v8)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
      NSUInteger v9 = v8;
      uint64_t v10 = *(void *)v23;
LABEL_10:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(self);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
        id v13 = [(NSDictionary *)otherDictionary objectForKey:v12];
        id v14 = [(NSDictionary *)self objectForKey:v12];
        if (v13 && v14 == 0) {
          break;
        }
        if (v14)
        {
          if (!v13) {
            break;
          }
          int v6 = [v14 isEqual:v13];
          if (!v6) {
            return v6;
          }
        }
        if (v9 == ++v11)
        {
          NSUInteger v9 = [(NSDictionary *)self countByEnumeratingWithState:&v22 objects:v21 count:16];
          LOBYTE(v6) = 1;
          if (v9) {
            goto LABEL_10;
          }
          return v6;
        }
      }
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isNSDictionary__
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    int v6 = _NSIsNSDictionary((uint64_t)a3);
    if (v6)
    {
      LOBYTE(v6) = [(NSDictionary *)self isEqualToDictionary:a3];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self descriptionWithLocale:locale indent:0];
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self count];
}

+ (NSDictionary)dictionaryWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithObjects:objects forKeys:keys count:cnt];

  return (NSDictionary *)v5;
}

+ (NSDictionary)dictionary
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithObjects:0 forKeys:0 count:0];

  return (NSDictionary *)v2;
}

+ (NSDictionary)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSDictionary == a1)
  {
    return (NSDictionary *)__NSDictionaryImmutablePlaceholder();
  }
  else if (NSMutableDictionary == a1)
  {
    return (NSDictionary *)__NSDictionaryMutablePlaceholder();
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSDictionary;
    return (NSDictionary *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (NSDictionary)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
  v46[1] = *(void *)off_1ECE0A5B0;
  if (objects && (_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    uint64_t v31 = _os_log_pack_size();
    long long v33 = (char *)&v44 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSDictionary initWithObjects:forKeys:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: objects argument is not an NSArray", "-[NSDictionary initWithObjects:forKeys:]");
    v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  if (keys && (_NSIsNSArray((uint64_t)keys) & 1) == 0)
  {
    uint64_t v37 = _os_log_pack_size();
    v39 = (char *)&v44 - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[NSDictionary initWithObjects:forKeys:]";
    CFStringRef v41 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: keys argument is not an NSArray", "-[NSDictionary initWithObjects:forKeys:]");
    v42 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v41) userInfo:0 osLogPack:v39 size:v37];
    objc_exception_throw(v42);
  }
  NSUInteger v8 = [(NSArray *)objects count];
  NSUInteger v9 = [(NSArray *)keys count];
  if (v8 != v9) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of objects (%lu) differs from count of keys (%lu)", "-[NSDictionary initWithObjects:forKeys:]", v8, v9);
  }
  NSUInteger v10 = [(NSArray *)keys count];
  NSUInteger v11 = [(NSArray *)objects count];
  if (v10 != v11)
  {
    NSUInteger v25 = v11;
    uint64_t v26 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: number of objects (%lu) not equal to number of keys (%lu)", v26, v25, v10);
    size_t v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0];
    objc_exception_throw(v28);
  }
  if (v10 >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v10);
    long long v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  if (v10 <= 1) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = v10;
  }
  uint64_t v14 = MEMORY[0x1F4188790](v11, v12);
  uint64_t v17 = (char *)&v44 - v16;
  v46[0] = 0;
  if (v10 > 0x100)
  {
    uint64_t v20 = (char *)_CFCreateArrayStorage(v13, 0, v46);
    MEMORY[0x1F4188790](v20, v22);
    uint64_t v19 = (char *)&v43;
    size_t v45 = 0;
    uint64_t v21 = (char *)_CFCreateArrayStorage(v13, 0, &v45);
    uint64_t v17 = v20;
  }
  else
  {
    MEMORY[0x1F4188790](v14, v15);
    uint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    size_t v45 = 0;
  }
  if (v10 >= 0x101) {
    uint64_t v19 = v21;
  }
  -[NSArray getObjects:range:](keys, "getObjects:range:", v17, 0, v10);
  -[NSArray getObjects:range:](objects, "getObjects:range:", v19, 0, v10);
  long long v23 = [(NSDictionary *)self initWithObjects:v19 forKeys:v17 count:v10];
  free(v21);
  free(v20);
  return v23;
}

- (NSArray)allValues
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = [(NSDictionary *)self count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    unint64_t v13 = +[NSException exceptionWithName:@"NSGenericException" reason:v12 userInfo:0];
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  int v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  [(NSDictionary *)self getObjects:v6 andKeys:0 count:v5];
  if (v6)
  {
    if (v5)
    {
      NSUInteger v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    NSUInteger v10 = [[NSArray alloc] _initByAdoptingBuffer:v6 count:v5 size:v5];
  }
  else
  {
    NSUInteger v10 = [[NSArray alloc] initWithObjects:0 count:v5];
  }
  return v10;
}

+ (NSDictionary)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
  unint64_t v4 = (void *)[objc_alloc((Class)a1) initWithObjects:objects forKeys:keys];

  return (NSDictionary *)v4;
}

- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary
{
  return [(NSDictionary *)self initWithDictionary:otherDictionary copyItems:0];
}

uint64_t __45__NSDictionary_descriptionWithLocale_indent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8 * a2) compare:*(void *)(*(void *)(a1 + 32) + 8 * a3)];
}

uint64_t __61__NSDictionary_keysSortedByValueWithOptions_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8 * a2), *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (void)enumerateKeysAndObjectsUsingBlock:(void *)block
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSDictionary enumerateKeysAndObjectsUsingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSDictionary enumerateKeysAndObjectsUsingBlock:]");
    id v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  [(NSDictionary *)self enumerateKeysAndObjectsWithOptions:0 usingBlock:block];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = +[NSDictionary allocWithZone:a3];

  return [(NSDictionary *)v6 initWithDictionary:self copyItems:0];
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  v7[6] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v4 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: function pointer is NULL", v4);
    uint64_t v6 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v5) userInfo:0];
    objc_exception_throw(v6);
  }
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __32__NSDictionary___apply_context___block_invoke;
  v7[3] = &__block_descriptor_48_e15_v32__0_8_16_B24l;
  v7[4] = a3;
  v7[5] = a4;
  [(NSDictionary *)self enumerateKeysAndObjectsWithOptions:0 usingBlock:v7];
}

- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v13[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
    objc_exception_throw(v12);
  }
  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)block);

  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)block);
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  id v62 = locale;
  v70[1] = *(void *)off_1ECE0A5B0;
  if (level >= 0x64) {
    NSUInteger v4 = 100;
  }
  else {
    NSUInteger v4 = level;
  }
  v63 = self;
  NSUInteger v5 = [(NSDictionary *)self count];
  unint64_t v7 = v5;
  if (v5 >> 60)
  {
    CFStringRef v51 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
    v52 = +[NSException exceptionWithName:@"NSGenericException" reason:v51 userInfo:0];
    CFRelease(v51);
    objc_exception_throw(v52);
  }
  NSUInteger v59 = v4;
  if (v5 <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = v5;
  }
  uint64_t v9 = MEMORY[0x1F4188790](v5, v6);
  CFStringRef v12 = (CFStringRef *)((char *)&v54 - v11);
  v70[0] = 0;
  if (v7 > 0x100)
  {
    CFStringRef v12 = (CFStringRef *)_CFCreateArrayStorage(v8, 0, v70);
    size_t v69 = 0;
    uint64_t v15 = (CFStringRef *)_CFCreateArrayStorage(v8, 0, &v69);
    MEMORY[0x1F4188790](v15, v20);
    uint64_t v18 = (char *)&v53;
    v66[0] = 0;
    uint64_t v19 = (char *)_CFCreateArrayStorage(v8, 0, v66);
    v57 = v15;
    v58 = v12;
  }
  else
  {
    uint64_t v13 = MEMORY[0x1F4188790](v9, v10);
    uint64_t v15 = (CFStringRef *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    size_t v69 = 0;
    MEMORY[0x1F4188790](v13, v16);
    uint64_t v18 = (char *)&v54 - v17;
    v57 = 0;
    v58 = 0;
    uint64_t v19 = 0;
    v66[0] = 0;
  }
  if (v7 >= 0x101) {
    uint64_t v18 = v19;
  }
  uint64_t v21 = [(NSDictionary *)v63 getObjects:0 andKeys:v18 count:v7];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (_NSIsNSString(*(void *)&v18[8 * i]))
      {
        uint64_t v24 = objc_opt_respondsToSelector();
        if (v24) {
          continue;
        }
      }
      memmove(v12, v18, 8 * v7);
      goto LABEL_28;
    }
    MEMORY[0x1F4188790](v24, v25);
    CFStringRef v27 = (char *)&v54 - v26;
    if (v7 <= 0x1000) {
      goto LABEL_22;
    }
    size_t v28 = (char *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v21, v22);
    CFStringRef v27 = (char *)&v54 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_22:
    size_t v28 = v27;
  }
  v68[0] = off_1ECE0A5A0;
  v68[1] = 3221225472;
  v68[2] = __45__NSDictionary_descriptionWithLocale_indent___block_invoke;
  v68[3] = &__block_descriptor_40_e11_q24__0q8q16l;
  v68[4] = v18;
  CFSortIndexes((uint64_t)v28, v7, 0, (uint64_t)v68);
  if (v7)
  {
    long long v30 = (uint64_t *)v28;
    uint64_t v31 = v12;
    unint64_t v32 = v7;
    do
    {
      uint64_t v33 = *v30++;
      *v31++ = *(CFStringRef *)&v18[8 * v33];
      --v32;
    }
    while (v32);
  }
  if (v27 != v28) {
    free(v28);
  }
LABEL_28:
  free(v19);
  v66[0] = 0;
  v66[1] = (size_t)v66;
  v66[2] = 0x2020000000;
  int v67 = -1;
  v64[0] = off_1ECE0A5A0;
  v64[1] = 3221225472;
  v60 = v65;
  v65[0] = __45__NSDictionary_descriptionWithLocale_indent___block_invoke_2;
  v65[1] = &unk_1ECDFDEB0;
  v65[2] = v66;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  CFAllocatorRef v56 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v55 = (void *)MEMORY[0x185311AE0]();
  if (v7)
  {
    NSUInteger v61 = v59 + 1;
    CFStringRef v35 = (__CFString **)v12;
    v36 = (__CFString **)v15;
    unint64_t v37 = v7;
    do
    {
      uint64_t v38 = *v35;
      id v39 = [(NSDictionary *)v63 objectForKey:*v35];
      if (_NSIsNSString((uint64_t)v38))
      {
        uint64_t v40 = [(__CFString *)v38 _stringRepresentation];
      }
      else if ((_NSIsNSDictionary((uint64_t)v38) & 1) != 0 || _NSIsNSArray((uint64_t)v38))
      {
        uint64_t v40 = [(__CFString *)v38 descriptionWithLocale:v62 indent:v61];
      }
      else if (_NSIsNSData((uint64_t)v38))
      {
        uint64_t v40 = [(__CFString *)v38 description];
      }
      else
      {
        uint64_t v45 = [(__CFString *)v38 description];
        uint64_t v40 = ((uint64_t (*)(void *, uint64_t))v65[0])(v64, v45);
      }
      CFStringRef v41 = (__CFString *)v40;
      if (_NSIsNSString((uint64_t)v39))
      {
        uint64_t v42 = [v39 _stringRepresentation];
      }
      else if ((_NSIsNSDictionary((uint64_t)v39) & 1) != 0 || _NSIsNSArray((uint64_t)v39))
      {
        uint64_t v42 = [v39 descriptionWithLocale:v62 indent:v61];
      }
      else if (_NSIsNSData((uint64_t)v39))
      {
        uint64_t v42 = [v39 description];
      }
      else
      {
        uint64_t v46 = [v39 description];
        uint64_t v42 = ((uint64_t (*)(void *, uint64_t))v65[0])(v64, v46);
      }
      if (v41) {
        uint64_t v43 = v41;
      }
      else {
        uint64_t v43 = @"(null)";
      }
      *v35++ = v43;
      if (v42) {
        uint64_t v44 = (__CFString *)v42;
      }
      else {
        uint64_t v44 = @"(null)";
      }
      *v36++ = v44;
      --v37;
    }
    while (v37);
  }
  CFMutableStringRef v47 = CFStringCreateMutable(v56, 0);
  for (NSUInteger j = v59; j; --j)
    CFStringAppend(v47, @"    ");
  CFStringAppend(Mutable, v47);
  CFStringAppend(Mutable, @"{\n");
  for (; v7; --v7)
  {
    CFStringAppend(Mutable, v47);
    CFStringAppend(Mutable, @"    ");
    CFStringAppend(Mutable, *v12);
    CFStringAppend(Mutable, @" = ");
    CFStringAppend(Mutable, *v15);
    CFStringAppend(Mutable, @";\n");
    ++v15;
    ++v12;
  }
  CFStringAppend(Mutable, v47);
  CFStringAppend(Mutable, @"}");
  CFRelease(v47);
  v49 = Mutable;
  _Block_object_dispose(v66, 8);
  free(v57);
  free(v58);
  return v49;
}

uint64_t __45__NSDictionary_descriptionWithLocale_indent___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -1) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_lookUpClass("NSString") != 0;
  }
  if (!_CFExecutableLinkedOnOrAfter(6uLL) || !*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    return (uint64_t)a2;
  }

  return [a2 _stringRepresentation];
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self descriptionWithLocale:0 indent:0];
}

+ (NSDictionary)dictionaryWithDictionary:(NSDictionary *)dict
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithDictionary:dict copyItems:0];

  return (NSDictionary *)v3;
}

- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  v36[1] = *(void *)off_1ECE0A5B0;
  if (otherDictionary && (_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    uint64_t v29 = (char *)&v34 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSDictionary initWithDictionary:copyItems:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[NSDictionary initWithDictionary:copyItems:]");
    unint64_t v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
  NSUInteger v7 = [(NSDictionary *)otherDictionary count];
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
    uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v7 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = v7;
  }
  uint64_t v11 = MEMORY[0x1F4188790](v7, v8);
  uint64_t v14 = (id *)((char *)&v34 - v13);
  v36[0] = 0;
  if (v9 > 0x100)
  {
    uint64_t v17 = (id *)_CFCreateArrayStorage(v10, 0, v36);
    MEMORY[0x1F4188790](v17, v19);
    uint64_t v16 = (id *)&v33;
    size_t v35 = 0;
    uint64_t v18 = (id *)_CFCreateArrayStorage(v10, 0, &v35);
    uint64_t v14 = v17;
  }
  else
  {
    MEMORY[0x1F4188790](v11, v12);
    uint64_t v16 = (id *)((char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    size_t v35 = 0;
  }
  if (v9 >= 0x101) {
    uint64_t v16 = v18;
  }
  [(NSDictionary *)otherDictionary getObjects:v16 andKeys:v14 count:v9];
  if (!v9) {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v20 = v14;
    uint64_t v21 = v16;
    unint64_t v22 = v9;
    do
    {
      id *v20 = (id)[*v20 copyWithZone:0];
      *uint64_t v21 = (id)[*v21 copyWithZone:0];
      ++v21;
      ++v20;
      --v22;
    }
    while (v22);
  }
  long long v23 = [(NSDictionary *)self initWithObjects:v16 forKeys:v14 count:v9];
  if (v4)
  {
    do
    {

      ++v14;
      --v9;
    }
    while (v9);
  }
  free(v18);
  free(v17);
  return v23;
}

- (id)_cfMutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  id v4 = objc_allocWithZone((Class)NSMutableDictionary);

  return (id)[v4 initWithDictionary:self copyItems:0];
}

- (NSEnumerator)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  id v4 = [(__NSFastEnumerationEnumerator *)[__NSDictionaryObjectEnumerator alloc] initWithObject:self];

  return (NSEnumerator *)v4;
}

- (NSSet)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSDictionary keysOfEntriesWithOptions:passingTest:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSDictionary keysOfEntriesWithOptions:passingTest:]");
    uint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
    objc_exception_throw(v14);
  }
  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate);
  unint64_t v9 = +[NSSet set];
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  uint64_t v16 = 850045857;
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  void v15[2] = __53__NSDictionary_keysOfEntriesWithOptions_passingTest___block_invoke;
  v15[3] = &unk_1ECDB0830;
  v15[5] = predicate;
  v15[6] = &v16;
  v15[4] = v9;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v15);
  return +[NSSet setWithSet:v9];
}

+ (NSDictionary)dictionaryWithObject:(id)object forKey:(id)key
{
  Dictionary = (void *)__createDictionary(objc_alloc((Class)a1), (uint64_t)object, (uint64_t)key);

  return (NSDictionary *)Dictionary;
}

+ (NSDictionary)dictionaryWithObjectsAndKeys:(id)firstObject
{
  va_start(va1, firstObject);
  va_start(va, firstObject);
  uint64_t v34 = va_arg(va1, void);
  v33[1] = *(void *)off_1ECE0A5B0;
  va_list v32 = 0;
  v33[0] = (uint64_t)firstObject;
  if (firstObject)
  {
    unint64_t v5 = 0;
    va_copy(v32, va);
    do
    {
      char v6 = v32;
      v32 += 8;
      ++v5;
    }
    while (*v6);
    if (v5)
    {
      uint64_t v26 = __CFExceptionProem((objc_class *)a1, a2);
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: second object of each pair must be non-nil.  Or, did you forget to nil-terminate your parameter list?", v26);
      uint64_t v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0];
      objc_exception_throw(v28);
    }
    unint64_t v7 = v5 >> 1;
    if (NSDictionary == a1)
    {
      va_copy(v32, va);
      long long v23 = (NSDictionary *)__NSDictionaryI_new(v33, 0, (uint64_t *)va, v5 >> 1, 1);
LABEL_25:
      uint64_t v24 = v23;
      return v23;
    }
    if (v5 >> 61)
    {
      CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5 >> 1);
      unint64_t v9 = +[NSException exceptionWithName:@"NSGenericException" reason:v8 userInfo:0];
      CFRelease(v8);
      objc_exception_throw(v9);
    }
LABEL_10:
    if (v7 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = v7;
    }
    uint64_t v11 = MEMORY[0x1F4188790](a1, a2);
    uint64_t v14 = (uint64_t *)((char *)&v29 - v13);
    size_t v31 = 0;
    if (v7 >= 0x101)
    {
      long long v17 = _CFCreateArrayStorage(v10, 0, &v31);
      size_t v30 = 0;
      long long v18 = (id *)_CFCreateArrayStorage(v10, 0, &v30);
      va_copy(v32, va);
      *long long v18 = firstObject;
      long long v19 = v32;
      v32 += 8;
      *long long v17 = *v19;
      uint64_t v14 = v17;
      uint64_t v16 = v18;
    }
    else
    {
      MEMORY[0x1F4188790](v11, v12);
      uint64_t v16 = (id *)((char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
      size_t v30 = 0;
      if (!v7)
      {
        long long v18 = 0;
        long long v17 = 0;
LABEL_24:
        long long v23 = (NSDictionary *)[objc_alloc((Class)a1) initWithObjects:v16 forKeys:v14 count:v7];
        free(v18);
        free(v17);
        goto LABEL_25;
      }
      long long v17 = 0;
      long long v18 = 0;
      *uint64_t v16 = firstObject;
      va_copy(v32, va1);
      void *v14 = v34;
      if (v7 == 1) {
        goto LABEL_24;
      }
    }
    for (uint64_t i = 1; i != v7; ++i)
    {
      uint64_t v21 = v32;
      v32 += 8;
      v16[i] = (id)*v21;
      unint64_t v22 = v32;
      v32 += 8;
      v14[i] = *v22;
    }
    goto LABEL_24;
  }
  if (NSDictionary != a1)
  {
    unint64_t v7 = 0;
    goto LABEL_10;
  }
  return (NSDictionary *)&__NSDictionary0__struct;
}

+ (id)newDictionaryWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v22[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a5) {
    goto LABEL_33;
  }
  if (a5 >> 61)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "+[NSDictionary newDictionaryWithObjects:forKeys:count:]", a5);
    goto LABEL_30;
  }
  if (a5)
  {
    for (uint64_t i = 0; i != a5; ++i)
    {
      if (!a3[i]) {
        goto LABEL_29;
      }
    }
    if (a4)
    {
      uint64_t i = 0;
      while (a4[i])
      {
        if (a5 == ++i) {
          goto LABEL_12;
        }
      }
LABEL_29:
      uint64_t v12 = i;
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = v12;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "+[NSDictionary newDictionaryWithObjects:forKeys:count:]", v12);
LABEL_30:
      long long v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
      objc_exception_throw(v17);
    }
LABEL_33:
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a5;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "+[NSDictionary newDictionaryWithObjects:forKeys:count:]", a5);
    goto LABEL_30;
  }
LABEL_12:
  if (NSDictionary == a1)
  {
    if (a5 == 1)
    {
      unint64_t v9 = *a4;
      unint64_t v10 = *a3;
      return __NSSingleEntryDictionaryI_new((unint64_t)v9, (unint64_t)v10, 4);
    }
    else if (a5)
    {
      return __NSDictionaryI_new((uint64_t *)a4, (uint64_t *)a3, 0, a5, 5);
    }
    else
    {
      return &__NSDictionary0__struct;
    }
  }
  else
  {
    if (NSMutableDictionary != a1)
    {
      uint64_t v11 = __CFLookUpClass("NSDictionary");
      __CFRequireConcreteImplementation(v11, (objc_class *)a1, a2);
    }
    return __NSDictionaryM_new((uint64_t)a4, (uint64_t)a3, a5, 3uLL);
  }
}

- (NSDictionary)initWithObjectsAndKeys:(id)firstObject
{
  va_start(va1, firstObject);
  va_start(va, firstObject);
  uint64_t v35 = va_arg(va1, void);
  v34[1] = *(void *)off_1ECE0A5B0;
  va_list v33 = 0;
  v34[0] = (uint64_t)firstObject;
  char v6 = (__objc2_class *)objc_opt_class();
  if (firstObject)
  {
    unint64_t v8 = 0;
    va_copy(v33, va);
    do
    {
      unint64_t v9 = v33;
      v33 += 8;
      ++v8;
    }
    while (*v9);
    if (v8)
    {
      uint64_t v27 = __CFExceptionProem((objc_class *)self, a2);
      CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: second object of each pair must be non-nil.  Or, did you forget to nil-terminate your parameter list?", v27);
      uint64_t v29 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0];
      objc_exception_throw(v29);
    }
    unint64_t v10 = v8 >> 1;
    if (v6 != NSDictionary)
    {
      if (v8 >> 61)
      {
        CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8 >> 1);
        uint64_t v12 = +[NSException exceptionWithName:@"NSGenericException" reason:v11 userInfo:0];
        CFRelease(v11);
        objc_exception_throw(v12);
      }
LABEL_10:
      if (v10 <= 1) {
        unint64_t v13 = 1;
      }
      else {
        unint64_t v13 = v10;
      }
      uint64_t v14 = MEMORY[0x1F4188790](v6, v7);
      size_t v32 = 0;
      if (v10 >= 0x101)
      {
        uint64_t v19 = _CFCreateArrayStorage(v13, 0, &v32);
        size_t v31 = 0;
        uint64_t v20 = (id *)_CFCreateArrayStorage(v13, 0, &v31);
        va_copy(v33, va);
        id *v20 = firstObject;
        uint64_t v21 = v33;
        v33 += 8;
        void *v19 = *v21;
        CFStringRef v16 = v19;
        long long v18 = v20;
      }
      else
      {
        MEMORY[0x1F4188790](v14, v15);
        long long v18 = (id *)((char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
        size_t v31 = 0;
        if (!v10)
        {
          uint64_t v20 = 0;
          uint64_t v19 = 0;
LABEL_24:
          CFStringRef v25 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:");
          free(v20);
          free(v19);
          return v25;
        }
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        *long long v18 = firstObject;
        va_copy(v33, va1);
        *CFStringRef v16 = v35;
        if (v10 == 1) {
          goto LABEL_24;
        }
      }
      for (uint64_t i = 1; i != v10; ++i)
      {
        long long v23 = v33;
        v33 += 8;
        v18[i] = (id)*v23;
        uint64_t v24 = v33;
        v33 += 8;
        v16[i] = *v24;
      }
      goto LABEL_24;
    }

    va_copy(v33, va);
    return (NSDictionary *)__NSDictionaryI_new(v34, 0, (uint64_t *)va, v10, 1);
  }
  else
  {
    if (v6 != NSDictionary)
    {
      unint64_t v10 = 0;
      goto LABEL_10;
    }
    return (NSDictionary *)&__NSDictionary0__struct;
  }
}

- (NSArray)keysSortedByValueUsingComparator:(NSComparator)cmptr
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!cmptr)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSDictionary keysSortedByValueUsingComparator:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSDictionary keysSortedByValueUsingComparator:]");
    unint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self keysSortedByValueWithOptions:0 usingComparator:cmptr];
}

+ (id)sharedKeySetForKeys:(NSArray *)keys
{
  if (!keys)
  {
    uint64_t v9 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: keys cannot be nil", v9);
    goto LABEL_8;
  }
  if ((_NSIsNSArray((uint64_t)keys) & 1) == 0)
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: keys must be a kind of NSArray", v10);
LABEL_8:
    uint64_t v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
    objc_exception_throw(v8);
  }

  return +[NSSharedKeySet keySetWithKeys:keys];
}

- (NSArray)keysSortedByValueUsingSelector:(SEL)comparator
{
  v7[5] = *(void *)off_1ECE0A5B0;
  if (!comparator) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __47__NSDictionary_keysSortedByValueUsingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v7[4] = comparator;
  return [(NSDictionary *)self keysSortedByValueWithOptions:0 usingComparator:v7];
}

- (NSArray)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v46[1] = *(void *)off_1ECE0A5B0;
  if (!cmptr)
  {
    uint64_t v32 = _os_log_pack_size();
    uint64_t v34 = (char *)&v41 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSDictionary keysSortedByValueWithOptions:usingComparator:]";
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSDictionary keysSortedByValueWithOptions:usingComparator:]");
    unint64_t v37 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v36) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v37);
  }
  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  NSUInteger v8 = [(NSDictionary *)self count];
  if (v8)
  {
    unint64_t v10 = v8;
    if (v8 >> 60)
    {
      CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8);
      id v39 = +[NSException exceptionWithName:@"NSGenericException" reason:v38 userInfo:0];
      CFRelease(v38);
      objc_exception_throw(v39);
    }
    uint64_t v11 = MEMORY[0x1F4188790](v8, v9);
    uint64_t v14 = (char *)&v41 - v13;
    v46[0] = 0;
    if (v10 > 0x100)
    {
      uint64_t v14 = (char *)_CFCreateArrayStorage(v10, 0, v46);
      MEMORY[0x1F4188790](v14, v19);
      CFStringRef v16 = (char *)&v40;
      size_t v45 = 0;
      uint64_t v42 = v14;
      uint64_t v17 = (char *)_CFCreateArrayStorage(v10, 0, &v45);
    }
    else
    {
      MEMORY[0x1F4188790](v11, v12);
      CFStringRef v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v42 = 0;
      uint64_t v17 = 0;
      size_t v45 = 0;
    }
    if (v10 >= 0x101) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = v16;
    }
    size_t v44 = 0;
    uint64_t v21 = (id *)_CFCreateArrayStorage(v10, 0, &v44);
    uint64_t v22 = [(NSDictionary *)self getObjects:v20 andKeys:v14 count:v10];
    MEMORY[0x1F4188790](v22, v23);
    CFStringRef v25 = (char *)&v41 - v24;
    uint64_t v26 = (char *)&v41 - v24;
    if (v10 > 0x1000) {
      uint64_t v26 = (char *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    }
    v43[0] = off_1ECE0A5A0;
    v43[1] = 3221225472;
    v43[2] = __61__NSDictionary_keysSortedByValueWithOptions_usingComparator___block_invoke;
    v43[3] = &unk_1ECDABB78;
    v43[4] = cmptr;
    v43[5] = v20;
    CFSortIndexes((uint64_t)v26, v10, v6, (uint64_t)v43);
    for (uint64_t i = 0; i != v10; ++i)
      v21[i] = *(id *)&v14[8 * *(void *)&v26[8 * i]];
    if (v25 != v26) {
      free(v26);
    }
    if ((uint64_t)v10 >= 1)
    {
      CFStringRef v28 = v21;
      unint64_t v29 = v10;
      do
      {
        id v30 = *v28++;
        --v29;
      }
      while (v29);
    }
    size_t v31 = (NSArray *)[[NSArray alloc] _initByAdoptingBuffer:v21 count:v10 size:v10];
    free(v17);
    free(v42);
    return v31;
  }
  else
  {
    return +[NSArray array];
  }
}

- (NSSet)keysOfEntriesPassingTest:(void *)predicate
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSDictionary keysOfEntriesPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSDictionary keysOfEntriesPassingTest:]");
    unint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self keysOfEntriesWithOptions:0 passingTest:predicate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t ShouldCopy = __NSCollectionsShouldCopy();
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v7 = +[NSDictionary allocWithZone:a3];

  return [(NSDictionary *)v7 initWithDictionary:self copyItems:ShouldCopy];
}

- (NSArray)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker
{
  uint64_t v41 = *(void *)off_1ECE0A5B0;
  if (!marker)
  {
    uint64_t v26 = _os_log_pack_size();
    CFStringRef v28 = (char *)&v34 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSDictionary objectsForKeys:notFoundMarker:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: marker cannot be nil", "-[NSDictionary objectsForKeys:notFoundMarker:]");
    size_t v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  NSUInteger v8 = [(NSArray *)keys count];
  if (v8 >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8);
    uint64_t v33 = +[NSException exceptionWithName:@"NSGenericException" reason:v32 userInfo:0];
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (v8 <= 1) {
    NSUInteger v8 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v8, v9);
  uint64_t v12 = (char *)&v34 - v11;
  size_t v35 = 0;
  if (v13 >= 0x101)
  {
    uint64_t v12 = (char *)_CFCreateArrayStorage(v10, 0, &v35);
    uint64_t v14 = (id *)v12;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v15 = [(NSArray *)keys countByEnumeratingWithState:&v37 objects:v36 count:16];
  CFStringRef v16 = v12;
  if (v15)
  {
    uint64_t v17 = *(void *)v38;
    CFStringRef v16 = v12;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(keys);
        }
        id v19 = [(NSDictionary *)self objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        if (v19) {
          id v20 = v19;
        }
        else {
          id v20 = marker;
        }
        *(void *)CFStringRef v16 = v20;
        v16 += 8;
      }
      unint64_t v15 = [(NSArray *)keys countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v15);
  }
  if (v14)
  {
    if (v16 - v12 >= 1)
    {
      if ((v16 - v12) >> 3 <= 1) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = (v16 - v12) >> 3;
      }
      uint64_t v22 = v14;
      do
      {
        id v23 = *v22++;
        --v21;
      }
      while (v21);
    }
    uint64_t v24 = [[NSArray alloc] _initByAdoptingBuffer:v14 count:(v16 - v12) >> 3 size:(v16 - v12) >> 3];
  }
  else
  {
    uint64_t v24 = [[NSArray alloc] initWithObjects:v12 count:(v16 - v12) >> 3];
  }
  return v24;
}

- (id)allObjects
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = [(NSDictionary *)self count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    unint64_t v13 = +[NSException exceptionWithName:@"NSGenericException" reason:v12 userInfo:0];
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  char v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  [(NSDictionary *)self getObjects:v6 andKeys:0 count:v5];
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    unint64_t v10 = [[NSArray alloc] _initByAdoptingBuffer:v6 count:v5 size:v5];
  }
  else
  {
    unint64_t v10 = [[NSArray alloc] initWithObjects:0 count:v5];
  }
  return v10;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v6 = [(NSDictionary *)self countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v6) {
    return 0;
  }
  NSUInteger v7 = v6;
  unint64_t v8 = 0;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(self);
      }
      id v11 = [(NSDictionary *)self objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      if (v11 == a3 || [a3 isEqual:v11]) {
        ++v8;
      }
    }
    NSUInteger v7 = [(NSDictionary *)self countByEnumeratingWithState:&v14 objects:v13 count:16];
  }
  while (v7);
  return v8;
}

- (void)getKeys:(id *)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  NSUInteger v6 = [(NSDictionary *)self count];
  if (a3 && v6 >> 61)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[NSDictionary getKeys:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v7;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSDictionary getKeys:]", v7);
    id v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:(char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) size:v8];
    objc_exception_throw(v11);
  }

  [(NSDictionary *)self getObjects:0 andKeys:a3 count:v6];
}

- (void)getObjects:(id *)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  NSUInteger v6 = [(NSDictionary *)self count];
  if (a3 && v6 >> 61)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[NSDictionary getObjects:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v7;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSDictionary getObjects:]", v7);
    id v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:(char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) size:v8];
    objc_exception_throw(v11);
  }

  [(NSDictionary *)self getObjects:a3 andKeys:0 count:v6];
}

- (id)invertedDictionary
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = [(NSDictionary *)self allKeys];
  id v5 = [(NSDictionary *)self allObjects];

  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v5];
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v15[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSDictionary keyOfEntryWithOptions:passingTest:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSDictionary keyOfEntryWithOptions:passingTest:]");
    unint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
    objc_exception_throw(v13);
  }
  char v6 = a3;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4);
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  size_t v14[2] = __50__NSDictionary_keyOfEntryWithOptions_passingTest___block_invoke;
  v14[3] = &unk_1ECDFE548;
  v14[4] = a4;
  v14[5] = v15;
  v15[0] = 0;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v14);
  return (id)v15[0];
}

uint64_t __50__NSDictionary_keyOfEntryWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    **(void **)(a1 + 40) = a2;
    *a4 = 1;
  }
  if (v8) {
    *a4 = 1;
  }
  return result;
}

- (id)keyOfEntryPassingTest:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSDictionary keyOfEntryPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSDictionary keyOfEntryPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return [(NSDictionary *)self keyOfEntryWithOptions:0 passingTest:a3];
}

uint64_t __53__NSDictionary_keysOfEntriesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    [*(id *)(a1 + 32) addObject:a2];
    id v5 = *(pthread_mutex_t **)(a1 + 48);
    return pthread_mutex_unlock(v5);
  }
  return result;
}

id __47__NSDictionary_keysSortedByValueUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

- (NSDictionary)initWithObject:(id)a3 forKey:(id)a4
{
  v6[1] = *(void *)off_1ECE0A5B0;
  id v5 = a4;
  v6[0] = a3;
  return [(NSDictionary *)self initWithObjects:v6 forKeys:&v5 count:1];
}

+ (NSDictionary)dictionaryWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithDictionary:a3 copyItems:a4];

  return (NSDictionary *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  OUTLINED_FUNCTION_1_5();
  uint64_t v2 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_10(v2);
}

- (id)objectForKey:(id)aKey
{
  OUTLINED_FUNCTION_1_5();
  uint64_t v3 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_10(v3);
}

- (NSEnumerator)keyEnumerator
{
  OUTLINED_FUNCTION_1_5();
  uint64_t v2 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_10(v2);
}

- (NSDictionary)initWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt
{
  OUTLINED_FUNCTION_1_5();
  id v5 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_10(v5);
}

@end