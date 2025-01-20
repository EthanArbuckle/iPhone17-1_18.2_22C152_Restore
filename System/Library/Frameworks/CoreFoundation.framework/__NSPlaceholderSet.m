@interface __NSPlaceholderSet
+ (void)initialize;
- (__NSPlaceholderSet)init;
- (__NSPlaceholderSet)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (__NSPlaceholderSet)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation __NSPlaceholderSet

- (__NSPlaceholderSet)init
{
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    return [(__NSPlaceholderSet *)&___immutablePlaceholderSet initWithObjects:0 count:0];
  }
  if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet) {
    return [(__NSPlaceholderSet *)&___mutablePlaceholderSet initWithCapacity:0];
  }
  __break(1u);
  return self;
}

- (__NSPlaceholderSet)initWithCapacity:(unint64_t)a3
{
  v9[1] = *(void *)off_1ECE0A5B0;
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderSet initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: capacity (%lu) is ridiculous", "-[__NSPlaceholderSet initWithCapacity:]", a3);
    v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0 osLogPack:(char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) size:v5];
    objc_exception_throw(v8);
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
    [&___immutablePlaceholderSet doesNotRecognizeSelector:a2];
LABEL_9:
    __break(1u);
  }
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet) {
    goto LABEL_9;
  }

  return (__NSPlaceholderSet *)__NSSetM_new(0, a3, 0);
}

- (__NSPlaceholderSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  if (a4) {
    goto LABEL_12;
  }
  CFStringRef v7 = (__objc2_class *)objc_opt_class();
  BOOL v8 = v7 == __NSSetI || v7 == __NSSetM;
  if (!v8 && v7 != __NSFrozenSetM) {
    goto LABEL_12;
  }
  if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    return (__NSPlaceholderSet *)[a3 mutableCopyWithZone:0];
  }
  else
  {
    if (self != (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    {
LABEL_12:
      v11.receiver = self;
      v11.super_class = (Class)__NSPlaceholderSet;
      return [(NSSet *)&v11 initWithSet:a3 copyItems:v4];
    }
    return (__NSPlaceholderSet *)[a3 copyWithZone:0];
  }
}

- (__NSPlaceholderSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v17[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a4;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSPlaceholderSet initWithObjects:count:]", a4);
    goto LABEL_25;
  }
  if (a4 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSPlaceholderSet initWithObjects:count:]", a4);
    goto LABEL_25;
  }
  if (a4)
  {
    uint64_t v4 = 0;
    while (a3[v4])
    {
      if (a4 == ++v4) {
        goto LABEL_8;
      }
    }
    uint64_t v7 = v4;
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = v7;
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[__NSPlaceholderSet initWithObjects:count:]", v7);
LABEL_25:
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v12);
  }
LABEL_8:
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
    if (a4 == 1)
    {
      uint64_t v6 = *a3;
      return (__NSPlaceholderSet *)__NSSingleObjectSetI_new((uint64_t)v6, 0);
    }
    else if (a4)
    {
      return (__NSPlaceholderSet *)__NSSetI_new((uint64_t *)a3, 0, a4, 0);
    }
    else
    {
      uint64_t v5 = (void *)__NSSet0__;
      return (__NSPlaceholderSet *)v5;
    }
  }
  else if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    return (__NSPlaceholderSet *)__NSSetM_new((uint64_t)a3, a4, 0);
  }
  else
  {
    __break(1u);
  }
  return self;
}

+ (void)initialize
{
  if (__NSPlaceholderSet == a1) {
    __NSSet0__ = (uint64_t)__NSSetI_new(0, 0, 0, 0);
  }
}

- (unint64_t)count
{
  uint64_t v4 = "mutable";
  uint64_t v5 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    uint64_t v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v7 = "NSSet";
  }
  else {
    uint64_t v7 = v5;
  }
  uint64_t v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s set object", v9, v6);
  CFStringRef v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0];
  objc_exception_throw(v11);
}

- (id)member:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v8 = "NSSet";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s set object", v10, v7);
  uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (id)objectEnumerator
{
  uint64_t v4 = "mutable";
  uint64_t v5 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    uint64_t v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v7 = "NSSet";
  }
  else {
    uint64_t v7 = v5;
  }
  uint64_t v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s set object", v9, v6);
  CFStringRef v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0];
  objc_exception_throw(v11);
}

- (void)addObject:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v8 = "NSSet";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s set object", v10, v7);
  uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (void)removeObject:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    uint64_t v8 = "NSSet";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s set object", v10, v7);
  uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (unint64_t)retainCount
{
  return -1;
}

@end