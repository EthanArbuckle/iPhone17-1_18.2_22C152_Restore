@interface __NSSingleEntryDictionaryI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)isEqualToDictionary:(id)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation __NSSingleEntryDictionaryI

- (unint64_t)count
{
  return 1;
}

- (id)objectForKey:(id)a3
{
  id key = self->_key;
  if (key == a3 || objc_msgSend(key, "isEqual:")) {
    return self->_obj;
  }
  else {
    return 0;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a5;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:v8 size:v7];
    objc_exception_throw(v13);
  }
  if (a3->var0) {
    return 0;
  }
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_2;
  *a4 = self->_key;
  unint64_t result = 1;
  a3->var0 = 1;
  return result;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  v3 = self;
  v12[1] = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136315138;
      *(void *)(v8 + 4) = "-[__NSSingleEntryDictionaryI isEqualToDictionary:]";
      CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: dictionary argument is not an NSDictionary", "-[__NSSingleEntryDictionaryI isEqualToDictionary:]");
      CFStringRef v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
      objc_exception_throw(v10);
    }
    if (a3 == v3)
    {
      LOBYTE(self) = 1;
    }
    else if ([a3 count] == 1)
    {
      self = (__NSSingleEntryDictionaryI *)[a3 objectForKey:v3->_key];
      if (self)
      {
        v5 = self;
        id obj = v3->_obj;
        LOBYTE(self) = [obj isEqual:v5];
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = self == 0;
  }
  return (char)self;
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  uint64_t obj = (uint64_t)self->_obj;
  if (obj >= 1) {

  }
  uint64_t key = (uint64_t)self->_key;
  if (key >= 1) {

  }
  v5.receiver = self;
  v5.super_class = (Class)__NSSingleEntryDictionaryI;
  [(__NSSingleEntryDictionaryI *)&v5 dealloc];
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (!a3)
  {
    uint64_t v6 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: function pointer is NULL", v6);
    uint64_t v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
    objc_exception_throw(v8);
  }
  id obj = self->_obj;
  id key = self->_key;

  ((void (*)(id, id, void *))a3)(key, obj, a4);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v11[1] = *(void *)off_1ECE0A5B0;
  unint64_t v5 = a5 >> 61;
  if (a3)
  {
    if (v5) {
      goto LABEL_10;
    }
    if (!a5) {
      return;
    }
    *a3 = self->_obj;
  }
  if (!a4) {
    return;
  }
  if (v5)
  {
LABEL_10:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v8 + 4) = "-[__NSSingleEntryDictionaryI getObjects:andKeys:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = a5;
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSingleEntryDictionaryI getObjects:andKeys:count:]", a5);
    CFStringRef v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (a5) {
    *a4 = self->_key;
  }
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSSingleEntryDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSSingleEntryDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]");
    CFStringRef v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:&v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v6];
    objc_exception_throw(v9);
  }
  v10[7] = 0;
  unint64_t v5 = (void *)_CFAutoreleasePoolPush();
  __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSDictionaryM_new((uint64_t)&self->_key, (uint64_t)&self->_obj, 1uLL, 2uLL);
}

- (id)keyEnumerator
{
  v2 = [[__NSSingleObjectEnumerator alloc] initWithObject:self->_key collection:self];

  return v2;
}

- (id)objectEnumerator
{
  v2 = [[__NSSingleObjectEnumerator alloc] initWithObject:self->_obj collection:self];

  return v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end