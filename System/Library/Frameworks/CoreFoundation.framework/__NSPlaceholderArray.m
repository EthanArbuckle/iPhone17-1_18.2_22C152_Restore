@interface __NSPlaceholderArray
- (__NSPlaceholderArray)init;
- (__NSPlaceholderArray)initWithArray:(id)a3;
- (__NSPlaceholderArray)initWithArray:(id)a3 copyItems:(BOOL)a4;
- (__NSPlaceholderArray)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderArray)initWithContentsOfFile:(id)a3;
- (__NSPlaceholderArray)initWithContentsOfURL:(id)a3;
- (__NSPlaceholderArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation __NSPlaceholderArray

- (__NSPlaceholderArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a4;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSPlaceholderArray initWithObjects:count:]", a4);
    goto LABEL_25;
  }
  if (a4 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a4;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSPlaceholderArray initWithObjects:count:]", a4);
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
    uint64_t v6 = v4;
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v6;
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[__NSPlaceholderArray initWithObjects:count:]", v6);
LABEL_25:
    v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:v8 size:v7];
    objc_exception_throw(v11);
  }
LABEL_8:
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
  {
    if (a4 == 1)
    {
      v5 = *a3;
      return (__NSPlaceholderArray *)__NSSingleObjectArrayI_new((uint64_t)v5, 0);
    }
    else if (a4)
    {
      return (__NSPlaceholderArray *)__NSArrayI_new((id *)a3, 0, a4, 0);
    }
    else
    {
      return (__NSPlaceholderArray *)&__NSArray0__struct;
    }
  }
  else if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    return (__NSPlaceholderArray *)__NSArrayM_new(a3, a4, 0);
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (__NSPlaceholderArray)init
{
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    return [(__NSPlaceholderArray *)&___immutablePlaceholderArray initWithObjects:0 count:0];
  }
  if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray) {
    return [(__NSPlaceholderArray *)&___mutablePlaceholderArray initWithCapacity:0];
  }
  __break(1u);
  return self;
}

- (__NSPlaceholderArray)initWithCapacity:(unint64_t)a3
{
  v9[1] = *(void *)off_1ECE0A5B0;
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderArray initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: capacity (%lu) is ridiculous", "-[__NSPlaceholderArray initWithCapacity:]", a3);
    v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0 osLogPack:(char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) size:v5];
    objc_exception_throw(v8);
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
  {
    [&___immutablePlaceholderArray doesNotRecognizeSelector:a2];
LABEL_9:
    __break(1u);
  }
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray) {
    goto LABEL_9;
  }

  return (__NSPlaceholderArray *)__NSArrayM_new(0, a3, 0);
}

- (__NSPlaceholderArray)initWithArray:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (a4 || (result = (__NSPlaceholderArray *)__initWithArrayDontCopyItems((__objc2_class **)self, a3)) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)__NSPlaceholderArray;
    return [(NSArray *)&v8 initWithArray:a3 copyItems:v4];
  }
  return result;
}

- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    return __NSArrayI_transferNew(a3, a4);
  }
  if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray) {
    return __NSArrayM_transferNew(a3, a4, a5);
  }
  return 0;
}

- (__NSPlaceholderArray)initWithArray:(id)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  result = (__NSPlaceholderArray *)__initWithArrayDontCopyItems((__objc2_class **)self, a3);
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)__NSPlaceholderArray;
    return [(NSArray *)&v6 initWithArray:a3 copyItems:0];
  }
  return result;
}

- (__NSPlaceholderArray)initWithContentsOfFile:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSString((uint64_t)a3) & 1) == 0)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSPlaceholderArray initWithContentsOfFile:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: string argument is not an NSString", "-[__NSPlaceholderArray initWithContentsOfFile:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }

  return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:a3 immutable:self == (__NSPlaceholderArray *)&___immutablePlaceholderArray];
}

- (unint64_t)count
{
  BOOL v4 = "mutable";
  uint64_t v5 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    BOOL v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v7 = "NSArray";
  }
  else {
    uint64_t v7 = v5;
  }
  CFStringRef v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s array object", v9, v6);
  v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0];
  objc_exception_throw(v11);
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    CFStringRef v8 = "NSArray";
  }
  else {
    CFStringRef v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s array object", v10, v7);
  v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    CFStringRef v8 = "immutable";
  }
  else {
    CFStringRef v8 = v6;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v9 = "NSArray";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s array object", v11, v8);
  uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
  objc_exception_throw(v13);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    CFStringRef v8 = "NSArray";
  }
  else {
    CFStringRef v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s array object", v10, v7);
  CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    CFStringRef v8 = "immutable";
  }
  else {
    CFStringRef v8 = v6;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v9 = "NSArray";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s array object", v11, v8);
  uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
  objc_exception_throw(v13);
}

- (__NSPlaceholderArray)initWithContentsOfURL:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (atomic_load(&initWithContentsOfURL____cls_NSURL))
  {
    if (!a3) {
      goto LABEL_6;
    }
  }
  else
  {
    atomic_store((unint64_t)objc_lookUpClass("NSURL"), &initWithContentsOfURL____cls_NSURL);
    if (!a3) {
      goto LABEL_6;
    }
  }
  atomic_load(&initWithContentsOfURL____cls_NSURL);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[__NSPlaceholderArray initWithContentsOfURL:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: url argument is not an NSURL", "-[__NSPlaceholderArray initWithContentsOfURL:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
LABEL_6:

  return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:a3 immutable:self == (__NSPlaceholderArray *)&___immutablePlaceholderArray];
}

- (unint64_t)retainCount
{
  return -1;
}

@end