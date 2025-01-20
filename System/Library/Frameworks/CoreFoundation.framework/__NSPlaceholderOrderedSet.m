@interface __NSPlaceholderOrderedSet
- (__NSPlaceholderOrderedSet)init;
- (__NSPlaceholderOrderedSet)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)retainCount;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation __NSPlaceholderOrderedSet

- (__NSPlaceholderOrderedSet)initWithCapacity:(unint64_t)a3
{
  v9[1] = *(void *)off_1ECE0A5B0;
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderOrderedSet initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: capacity (%lu) is ridiculous", "-[__NSPlaceholderOrderedSet initWithCapacity:]", a3);
    v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0 osLogPack:(char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) size:v5];
    objc_exception_throw(v8);
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
  {
    [&___immutablePlaceholderOrderedSet doesNotRecognizeSelector:a2];
LABEL_9:
    __break(1u);
  }
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet) {
    goto LABEL_9;
  }

  return (__NSPlaceholderOrderedSet *)__NSOrderedSetM_new(0, a3, 0);
}

- (__NSPlaceholderOrderedSet)init
{
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    return [(__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet initWithObjects:0 count:0];
  }
  if (self == (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet) {
    return [(__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet initWithCapacity:0];
  }
  __break(1u);
  return self;
}

- (__NSPlaceholderOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v7 = _os_log_pack_size();
    v9 = (char *)v19 - ((MEMORY[0x1F4188790](v7, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a4;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSPlaceholderOrderedSet initWithObjects:count:]", a4);
    goto LABEL_23;
  }
  if (a4 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    v9 = (char *)v19 - ((MEMORY[0x1F4188790](v7, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSPlaceholderOrderedSet initWithObjects:count:]", a4);
    goto LABEL_23;
  }
  if (a4)
  {
    uint64_t v4 = 0;
    while (a3[v4])
    {
      if (a4 == ++v4)
      {
        if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
        {
          return (__NSPlaceholderOrderedSet *)__NSOrderedSetI_new((uint64_t)a3, a4, 0);
        }
LABEL_13:
        if (self == (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
        {
          return (__NSPlaceholderOrderedSet *)__NSOrderedSetM_new((id *)a3, a4, 0);
        }
        else
        {
          __break(1u);
        }
        return self;
      }
    }
    uint64_t v6 = v4;
    uint64_t v7 = _os_log_pack_size();
    v9 = (char *)v19 - ((MEMORY[0x1F4188790](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = v6;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[__NSPlaceholderOrderedSet initWithObjects:count:]", v6);
LABEL_23:
    v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v7];
    objc_exception_throw(v12);
  }
  if (self != (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    goto LABEL_13;
  }
  if (initWithObjects_count__static_init != -1) {
    dispatch_once(&initWithObjects_count__static_init, &__block_literal_global_37);
  }
  uint64_t v5 = (void *)initWithObjects_count____NSOrderedSet0__;

  return (__NSPlaceholderOrderedSet *)v5;
}

- (unint64_t)retainCount
{
  return -1;
}

- (unint64_t)count
{
  uint64_t v4 = "mutable";
  uint64_t v5 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "NSOrderedSet";
  }
  else {
    uint64_t v7 = v5;
  }
  uint64_t v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s ordered set object", v9, v6);
  CFStringRef v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0];
  objc_exception_throw(v11);
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v8 = "NSOrderedSet";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s ordered set object", v10, v7);
  v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v8 = "NSOrderedSet";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s ordered set object", v10, v7);
  v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v8 = "immutable";
  }
  else {
    uint64_t v8 = v6;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v9 = "NSOrderedSet";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s ordered set object", v11, v8);
  v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
  objc_exception_throw(v13);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v8 = "NSOrderedSet";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s ordered set object", v10, v7);
  CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v8 = "immutable";
  }
  else {
    uint64_t v8 = v6;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v9 = "NSOrderedSet";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s ordered set object", v11, v8);
  v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
  objc_exception_throw(v13);
}

@end