@interface __NSSingleObjectSetI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
@end

@implementation __NSSingleObjectSetI

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  uint64_t element = (uint64_t)self->element;
  if (element >= 1) {

  }
  v4.receiver = self;
  v4.super_class = (Class)__NSSingleObjectSetI;
  [(__NSSingleObjectSetI *)&v4 dealloc];
}

- (unint64_t)count
{
  return 1;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  v12[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v5 = _os_log_pack_size();
    v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSSingleObjectSetI getObjects:count:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a4;
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSingleObjectSetI getObjects:count:]", a4);
    goto LABEL_9;
  }
  if (a4 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSSingleObjectSetI getObjects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a4;
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSingleObjectSetI getObjects:count:]", a4);
LABEL_9:
    v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:v6 size:v5];
    objc_exception_throw(v11);
  }
  if (a4) {
    *a3 = self->element;
  }
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
    *(void *)(v10 + 4) = "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a5;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_12;
  }
  if (a5 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a5;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]", a5);
LABEL_12:
    v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v14);
  }
  unint64_t var0 = a3->var0;
  if (a3->var0) {
    return 0;
  }
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_1;
  if (a4 && a5)
  {
    *a4 = self->element;
    unint64_t var0 = 1;
    a3->unint64_t var0 = 1;
  }
  return var0;
}

- (unint64_t)countForObject:(id)a3
{
  id element = self->element;
  return (element == a3 || [a3 isEqual:element]) && element != 0;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSSingleObjectSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSSingleObjectSetI enumerateObjectsWithOptions:usingBlock:]");
    v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:&v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v6];
    objc_exception_throw(v9);
  }
  v10[7] = 0;
  uint64_t v5 = (void *)_CFAutoreleasePoolPush();
  __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (BOOL)containsObject:(id)a3
{
  id element = self->element;
  if (element == a3 || (int v4 = [a3 isEqual:element]) != 0) {
    LOBYTE(v4) = element != 0;
  }
  return v4;
}

- (id)objectEnumerator
{
  v2 = (void *)[objc_allocWithZone((Class)__NSSingleObjectEnumerator) initWithObject:self->element collection:self];

  return v2;
}

- (id)member:(id)a3
{
  id element = self->element;
  if (element != a3 && ![a3 isEqual:element]) {
    return 0;
  }
  return element;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end