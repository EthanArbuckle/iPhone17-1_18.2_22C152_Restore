@interface __NSSingleObjectArrayI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)isEqualToArray:(id)a3;
- (id)firstObject;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSSingleObjectArrayI

- (id)firstObject
{
  return self->_object;
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
    *(void *)(v9 + 4) = "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a5;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:v8 size:v7];
    objc_exception_throw(v13);
  }
  if (a3->var0) {
    return 0;
  }
  a3->var1 = &self->_object;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_7;
  a3->var0 = -1;
  return 1;
}

- (id)lastObject
{
  return self->_object;
}

- (BOOL)isEqualToArray:(id)a3
{
  v3 = self;
  v12[1] = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136315138;
      *(void *)(v8 + 4) = "-[__NSSingleObjectArrayI isEqualToArray:]";
      CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[__NSSingleObjectArrayI isEqualToArray:]");
      CFStringRef v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
      objc_exception_throw(v10);
    }
    if (a3 == v3) {
      goto LABEL_7;
    }
    if ([a3 count] != 1)
    {
      LOBYTE(self) = 0;
      return (char)self;
    }
    uint64_t v5 = [a3 objectAtIndexedSubscript:0];
    id object = v3->_object;
    if (object == (id)v5 || (LODWORD(self) = objc_msgSend(object, "isEqual:"), self)) {
LABEL_7:
    }
      LOBYTE(self) = 1;
  }
  else
  {
    LOBYTE(self) = self == 0;
  }
  return (char)self;
}

- (unint64_t)count
{
  return 1;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    double v7 = __os_log_helper_1_2_3_8_32_8_0_8_0(v6, (uint64_t)"-[__NSSingleObjectArrayI objectAtIndex:]", a3, 0);
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v7, "-[__NSSingleObjectArrayI objectAtIndex:]", a3, 0);
    CFStringRef v9 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) size:v5];
    objc_exception_throw(v9);
  }
  return self->_object;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(&self->_object, 1uLL, 0);
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  uint64_t object = (uint64_t)self->_object;
  if (object >= 1) {

  }
  v4.receiver = self;
  v4.super_class = (Class)__NSSingleObjectArrayI;
  [(__NSSingleObjectArrayI *)&v4 dealloc];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if ((a4.location & 0x8000000000000000) != 0
    || (a4.length & 0x8000000000000000) != 0
    || a4.location + a4.length >= 2)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    double v8 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v7, (uint64_t)"-[__NSSingleObjectArrayI getObjects:range:]", location, length, 0);
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v8, "-[__NSSingleObjectArrayI getObjects:range:]", location, length, 0);
    CFStringRef v10 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v10);
  }
  if (!a3 && a4.length)
  {
    NSUInteger v11 = a4.length;
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSSingleObjectArrayI getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v11;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSingleObjectArrayI getObjects:range:]", v11);
    v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:(char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) size:v12];
    objc_exception_throw(v15);
  }
  if (a4.length) {
    *a3 = self->_object;
  }
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSSingleObjectArrayI enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSSingleObjectArrayI enumerateObjectsWithOptions:usingBlock:]");
    CFStringRef v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:&v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v6];
    objc_exception_throw(v9);
  }
  v10[7] = 0;
  uint64_t v5 = (void *)_CFAutoreleasePoolPush();
  __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (id)objectEnumerator
{
  v2 = (void *)[objc_allocWithZone((Class)__NSSingleObjectEnumerator) initWithObject:self->_object collection:self];

  return v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end