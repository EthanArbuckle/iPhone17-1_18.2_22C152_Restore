@interface NSMutableDictionary
+ (NSMutableDictionary)dictionaryWithCapacity:(NSUInteger)numItems;
+ (NSMutableDictionary)dictionaryWithSharedKeySet:(id)keyset;
- (NSMutableDictionary)initWithCapacity:(NSUInteger)numItems;
- (NSMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)__addObject:(id)a3 forKey:(id)a4;
- (void)__setObject:(id)a3 forKey:(id)a4;
- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)addObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)addObjects:(id)a3 forKeys:(id)a4;
- (void)invert;
- (void)removeAllObjects;
- (void)removeEntriesInDictionary:(id)a3;
- (void)removeEntriesPassingTest:(id)a3;
- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)removeKeysForObject:(id)a3;
- (void)removeObjectForKey:(id)aKey;
- (void)removeObjectsForKeys:(NSArray *)keyArray;
- (void)replaceObject:(id)a3 forKey:(id)a4;
- (void)replaceObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)replaceObjects:(id)a3 forKeys:(id)a4;
- (void)setDictionary:(NSDictionary *)otherDictionary;
- (void)setEntriesFromDictionary:(id)a3;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (void)setObject:(id)obj forKeyedSubscript:(id)key;
- (void)setObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)setObjects:(id)a3 forKeys:(id)a4;
@end

@implementation NSMutableDictionary

- (void)__addObject:(id)a3 forKey:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableDictionary __addObject:forKey:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableDictionary __addObject:forKey:]");
    goto LABEL_11;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableDictionary __addObject:forKey:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[NSMutableDictionary __addObject:forKey:]");
LABEL_11:
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v13);
  }
  if (![(NSDictionary *)self objectForKey:a4])
  {
    [(NSMutableDictionary *)self __setObject:a3 forKey:a4];
  }
}

- (void)setDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!otherDictionary) {
      goto LABEL_4;
    }
  }
  else if (!otherDictionary)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary setDictionary:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[NSMutableDictionary setDictionary:]");
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  if (self != (NSMutableDictionary *)otherDictionary)
  {
    [(NSMutableDictionary *)self removeAllObjects];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    NSUInteger v6 = [(NSDictionary *)otherDictionary countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      NSUInteger v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(otherDictionary);
          }
          [(NSMutableDictionary *)self setObject:[(NSDictionary *)otherDictionary objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)] forKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        NSUInteger v7 = [(NSDictionary *)otherDictionary countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!otherDictionary) {
      goto LABEL_4;
    }
  }
  else if (!otherDictionary)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary addEntriesFromDictionary:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[NSMutableDictionary addEntriesFromDictionary:]");
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  if (self != (NSMutableDictionary *)otherDictionary)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    NSUInteger v6 = [(NSDictionary *)otherDictionary countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      NSUInteger v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(otherDictionary);
          }
          [(NSMutableDictionary *)self setObject:[(NSDictionary *)otherDictionary objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)] forKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        NSUInteger v7 = [(NSDictionary *)otherDictionary countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

+ (NSMutableDictionary)dictionaryWithCapacity:(NSUInteger)numItems
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:numItems];

  return (NSMutableDictionary *)v3;
}

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!keyArray) {
      goto LABEL_4;
    }
  }
  else if (!keyArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)keyArray) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary removeObjectsForKeys:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableDictionary removeObjectsForKeys:]");
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = [(NSArray *)keyArray countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(keyArray);
        }
        [(NSMutableDictionary *)self removeObjectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      unint64_t v7 = [(NSArray *)keyArray countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setObject:(id)obj forKeyedSubscript:(id)key
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  if (obj)
  {
    [(NSMutableDictionary *)self setObject:obj forKey:key];
  }
  else
  {
    [(NSMutableDictionary *)self removeObjectForKey:key];
  }
}

- (void)replaceObject:(id)a3 forKey:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableDictionary replaceObject:forKey:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableDictionary replaceObject:forKey:]");
    goto LABEL_12;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableDictionary replaceObject:forKey:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[NSMutableDictionary replaceObject:forKey:]");
LABEL_12:
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v13);
  }
  if ([(NSDictionary *)self objectForKey:a4])
  {
    [(NSMutableDictionary *)self setObject:a3 forKey:a4];
  }
}

+ (NSMutableDictionary)dictionaryWithSharedKeySet:(id)keyset
{
  if (!keyset)
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: keyset cannot be nil", v10);
    goto LABEL_12;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = __CFExceptionProem((objc_class *)a1, a2);
    uint64_t v11 = objc_opt_class();
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: keyset must be an object created by +sharedKeySetForKeys: instead of '%@'", v8, v11);
LABEL_12:
    v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
    objc_exception_throw(v9);
  }
  if ([keyset isEmpty])
  {
    return +[NSMutableDictionary dictionaryWithCapacity:0];
  }
  else
  {
    return (NSMutableDictionary *)+[NSSharedKeyDictionary sharedKeyDictionaryWithKeySet:keyset];
  }
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableDictionary addObject:forKey:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableDictionary addObject:forKey:]");
    goto LABEL_11;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableDictionary addObject:forKey:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[NSMutableDictionary addObject:forKey:]");
LABEL_11:
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v13);
  }
  if (![(NSDictionary *)self objectForKey:a4])
  {
    [(NSMutableDictionary *)self setObject:a3 forKey:a4];
  }
}

- (void)addObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v21[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a5) {
    goto LABEL_22;
  }
LABEL_4:
  if (a5 >> 61)
  {
    uint64_t v15 = _os_log_pack_size();
    long long v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a5;
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableDictionary addObjects:forKeys:count:]", a5);
    goto LABEL_23;
  }
  if (!a5) {
    return;
  }
  uint64_t v10 = 0;
  do
  {
    if (!a3[v10])
    {
LABEL_19:
      uint64_t v11 = _os_log_pack_size();
      uint64_t v12 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v12 = 136315394;
      *(void *)(v12 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
      *(_WORD *)(v12 + 12) = 2048;
      *(void *)(v12 + 14) = v10;
      CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableDictionary addObjects:forKeys:count:]", v10);
      v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
      objc_exception_throw(v14);
    }
    ++v10;
  }
  while (a5 != v10);
  if (!a4)
  {
LABEL_22:
    uint64_t v15 = _os_log_pack_size();
    long long v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableDictionary addObjects:forKeys:count:]", a5);
LABEL_23:
    v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v16 size:v15];
    objc_exception_throw(v20);
  }
  uint64_t v10 = 0;
  do
  {
    if (!a4[v10]) {
      goto LABEL_19;
    }
    ++v10;
  }
  while (a5 != v10);
  do
  {
    if (![(NSDictionary *)self objectForKey:*a4]) {
      [(NSMutableDictionary *)self setObject:*a3 forKey:*a4];
    }
    ++a3;
    ++a4;
    --a5;
  }
  while (a5);
}

- (void)addObjects:(id)a3 forKeys:(id)a4
{
  v19[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary addObjects:forKeys:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: objects argument is not an NSArray", "-[NSMutableDictionary addObjects:forKeys:]");
    goto LABEL_16;
  }
LABEL_4:
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableDictionary addObjects:forKeys:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: keys argument is not an NSArray", "-[NSMutableDictionary addObjects:forKeys:]");
LABEL_16:
    CFStringRef v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v18);
  }
  uint64_t v8 = [a3 count];
  uint64_t v9 = [a4 count];
  if (v8 != v9) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of objects (%lu) differs from count of keys (%lu)", "-[NSMutableDictionary addObjects:forKeys:]", v8, v9);
  }
  uint64_t v10 = [a3 count];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
      -[NSMutableDictionary addObject:forKey:](self, "addObject:forKey:", [a3 objectAtIndex:i], objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)invert
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  uint64_t v4 = [(NSDictionary *)self allKeys];
  uint64_t v5 = [(NSDictionary *)self allValues];
  [(NSMutableDictionary *)self removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableDictionary *)self setObject:*(void *)(*((void *)&v12 + 1) + 8 * v10) forKey:[(NSArray *)v5 objectAtIndex:v8 + v10]];
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
      v8 += v10;
    }
    while (v7);
  }
}

- (void)removeAllObjects
{
  v15[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  NSUInteger v4 = [(NSDictionary *)self count];
  unint64_t v6 = v4;
  if (v4 >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    long long v14 = +[NSException exceptionWithName:@"NSGenericException" reason:v13 userInfo:0];
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  if (v4 <= 1) {
    NSUInteger v4 = 1;
  }
  unint64_t v7 = MEMORY[0x1F4188790](v4, v5);
  uint64_t v9 = (char *)v15 - v8;
  v15[0] = 0;
  if (v6 >= 0x101)
  {
    uint64_t v9 = (char *)_CFCreateArrayStorage(v7, 0, v15);
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v9, v6, v15[0]);
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      unint64_t v12 = [(NSDictionary *)self countForKey:*(void *)&v9[8 * i]] + 1;
      while (--v12)
        [(NSMutableDictionary *)self removeObjectForKey:*(void *)&v9[8 * i]];
    }
  }
  free(v10);
}

- (void)removeEntriesInDictionary:(id)a3
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary removeEntriesInDictionary:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[NSMutableDictionary removeEntriesInDictionary:]");
    CFStringRef v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  if (self == a3)
  {
    [a3 removeAllObjects];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(a3);
          }
          [(NSMutableDictionary *)self removeObjectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  uint64_t v30 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary removeEntriesWithOptions:passingTest:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableDictionary removeEntriesWithOptions:passingTest:]");
    long long v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:(char *)&v19[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) size:v14];
    objc_exception_throw(v17);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_12;
  }
LABEL_3:
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4);
  uint64_t v9 = +[NSSet set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  uint64_t v29 = 0;
  uint64_t v25 = 850045857;
  v19[0] = off_1ECE0A5A0;
  v19[1] = 3221225472;
  void v19[2] = __60__NSMutableDictionary_removeEntriesWithOptions_passingTest___block_invoke;
  v19[3] = &unk_1ECDB0830;
  v19[5] = a4;
  v19[6] = &v25;
  v19[4] = v9;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v19);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NSMutableDictionary *)self removeObjectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v11);
  }
}

uint64_t __60__NSMutableDictionary_removeEntriesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    [*(id *)(a1 + 32) addObject:a2];
    uint64_t v5 = *(pthread_mutex_t **)(a1 + 48);
    return pthread_mutex_unlock(v5);
  }
  return result;
}

- (void)removeEntriesPassingTest:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableDictionary removeEntriesPassingTest:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableDictionary removeEntriesPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:

  [(NSMutableDictionary *)self removeEntriesWithOptions:0 passingTest:a3];
}

- (void)removeKeysForObject:(id)a3
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = +[NSArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  NSUInteger v7 = [(NSDictionary *)self countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(self);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if ([(NSDictionary *)self objectForKey:v11] == a3) {
          [(NSArray *)v6 addObject:v11];
        }
      }
      NSUInteger v8 = [(NSDictionary *)self countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v6);
        }
        [(NSMutableDictionary *)self removeObjectForKey:*(void *)(*((void *)&v17 + 1) + 8 * j)];
      }
      uint64_t v13 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v13);
  }
}

- (void)replaceObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a5) {
    goto LABEL_20;
  }
LABEL_4:
  if (a5 >> 61)
  {
    uint64_t v18 = _os_log_pack_size();
    long long v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = a5;
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableDictionary replaceObjects:forKeys:count:]", a5);
    goto LABEL_21;
  }
  if (!a5) {
    return;
  }
  uint64_t v10 = 0;
  do
  {
    if (!a3[v10])
    {
LABEL_17:
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = v10;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableDictionary replaceObjects:forKeys:count:]", v10);
      long long v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:(char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) size:v14];
      objc_exception_throw(v17);
    }
    ++v10;
  }
  while (a5 != v10);
  if (!a4)
  {
LABEL_20:
    uint64_t v18 = _os_log_pack_size();
    long long v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = a5;
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableDictionary replaceObjects:forKeys:count:]", a5);
LABEL_21:
    long long v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v18];
    objc_exception_throw(v23);
  }
  uint64_t v10 = 0;
  do
  {
    if (!a4[v10]) {
      goto LABEL_17;
    }
    ++v10;
  }
  while (a5 != v10);
  do
  {
    uint64_t v12 = (uint64_t)*a3++;
    uint64_t v11 = v12;
    uint64_t v13 = (uint64_t)*a4++;
    [(NSMutableDictionary *)self replaceObject:v11 forKey:v13];
    --a5;
  }
  while (a5);
}

- (void)replaceObjects:(id)a3 forKeys:(id)a4
{
  v19[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: objects argument is not an NSArray", "-[NSMutableDictionary replaceObjects:forKeys:]");
    goto LABEL_16;
  }
LABEL_4:
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: keys argument is not an NSArray", "-[NSMutableDictionary replaceObjects:forKeys:]");
LABEL_16:
    uint64_t v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v18);
  }
  uint64_t v8 = [a3 count];
  uint64_t v9 = [a4 count];
  if (v8 != v9) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of objects (%lu) differs from count of keys (%lu)", "-[NSMutableDictionary replaceObjects:forKeys:]", v8, v9);
  }
  uint64_t v10 = [a3 count];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
      -[NSMutableDictionary replaceObject:forKey:](self, "replaceObject:forKey:", [a3 objectAtIndex:i], objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)setEntriesFromDictionary:(id)a3
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary setEntriesFromDictionary:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[NSMutableDictionary setEntriesFromDictionary:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:&v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v10];
    objc_exception_throw(v13);
  }
LABEL_4:
  if (self != a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", [a3 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)], *(void *)(*((void *)&v15 + 1) + 8 * i));
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a5) {
    goto LABEL_20;
  }
LABEL_4:
  if (a5 >> 61)
  {
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = a5;
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableDictionary setObjects:forKeys:count:]", a5);
    goto LABEL_21;
  }
  if (!a5) {
    return;
  }
  uint64_t v10 = 0;
  do
  {
    if (!a3[v10])
    {
LABEL_17:
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = v10;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableDictionary setObjects:forKeys:count:]", v10);
      long long v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:(char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) size:v14];
      objc_exception_throw(v17);
    }
    ++v10;
  }
  while (a5 != v10);
  if (!a4)
  {
LABEL_20:
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = a5;
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableDictionary setObjects:forKeys:count:]", a5);
LABEL_21:
    long long v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v18];
    objc_exception_throw(v23);
  }
  uint64_t v10 = 0;
  do
  {
    if (!a4[v10]) {
      goto LABEL_17;
    }
    ++v10;
  }
  while (a5 != v10);
  do
  {
    uint64_t v12 = (uint64_t)*a3++;
    uint64_t v11 = v12;
    uint64_t v13 = (uint64_t)*a4++;
    [(NSMutableDictionary *)self setObject:v11 forKey:v13];
    --a5;
  }
  while (a5);
}

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  v17[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSMutableDictionary setObjects:forKeys:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: objects argument is not an NSArray", "-[NSMutableDictionary setObjects:forKeys:]");
    goto LABEL_16;
  }
LABEL_4:
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary setObjects:forKeys:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: keys argument is not an NSArray", "-[NSMutableDictionary setObjects:forKeys:]");
LABEL_16:
    CFStringRef v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v16);
  }
  uint64_t v8 = [a3 count];
  uint64_t v9 = [a4 count];
  if (v8 != v9) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of objects (%lu) differs from count of keys (%lu)", "-[NSMutableDictionary setObjects:forKeys:]", v8, v9);
  }
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", [a3 objectAtIndex:i], objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)__setObject:(id)a3 forKey:(id)a4
{
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  [(NSMutableDictionary *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableDictionary __setObject:forKey:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableDictionary __setObject:forKey:]");
    goto LABEL_12;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSMutableDictionary __setObject:forKey:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: key cannot be nil", "-[NSMutableDictionary __setObject:forKey:]");
LABEL_12:
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    CFLog(3, @"*** CFDictionarySetValue(): attempt to use this function to set a key which is not copyable into a non-CFDictionary via toll-free bridging", v8, v9, v10, v11, v12, v13, v20);
  }

  [(NSMutableDictionary *)self setObject:a3 forKey:a4];
}

- (NSMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  unint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  v24[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a5) {
    goto LABEL_21;
  }
  if (a5 >> 61)
  {
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = v5;
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableDictionary initWithObjects:forKeys:count:]", v5);
    goto LABEL_22;
  }
  if (!a5)
  {
    return [(NSMutableDictionary *)self initWithCapacity:0];
  }
  for (uint64_t i = 0; i != a5; ++i)
  {
    if (!a3[i])
    {
LABEL_18:
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = i;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableDictionary initWithObjects:forKeys:count:]", i);
      CFStringRef v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:(char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) size:v14];
      objc_exception_throw(v17);
    }
  }
  if (!a4)
  {
LABEL_21:
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = v5;
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableDictionary initWithObjects:forKeys:count:]", v5);
LABEL_22:
    long long v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v18];
    objc_exception_throw(v23);
  }
  for (uint64_t i = 0; i != a5; ++i)
  {
    if (!a4[i]) {
      goto LABEL_18;
    }
  }
  for (uint64_t j = [(NSMutableDictionary *)self initWithCapacity:a5]; v5; --v5)
  {
    uint64_t v11 = (uint64_t)*v7++;
    uint64_t v10 = v11;
    uint64_t v12 = (uint64_t)*v6++;
    [(NSMutableDictionary *)j setObject:v10 forKey:v12];
  }
  return j;
}

- (void)removeObjectForKey:(id)aKey
{
  unint64_t v5 = __CFLookUpClass("NSMutableDictionary");

  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
  uint64_t v6 = __CFLookUpClass("NSMutableDictionary");

  __CFRequireConcreteImplementation(v6, (objc_class *)self, a2);
}

- (NSMutableDictionary)initWithCapacity:(NSUInteger)numItems
{
  unint64_t v5 = __CFLookUpClass("NSMutableDictionary");
  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

@end