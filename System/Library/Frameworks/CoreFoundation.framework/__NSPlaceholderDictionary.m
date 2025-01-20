@interface __NSPlaceholderDictionary
- (__NSPlaceholderDictionary)init;
- (__NSPlaceholderDictionary)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderDictionary)initWithContentsOfFile:(id)a3;
- (__NSPlaceholderDictionary)initWithContentsOfURL:(id)a3;
- (__NSPlaceholderDictionary)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (__NSPlaceholderDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation __NSPlaceholderDictionary

- (__NSPlaceholderDictionary)init
{
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    return [(__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary initWithObjects:0 forKeys:0 count:0];
  }
  if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary) {
    return [(__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary initWithCapacity:0];
  }
  __break(1u);
  return self;
}

- (__NSPlaceholderDictionary)initWithCapacity:(unint64_t)a3
{
  v9[1] = *(void *)off_1ECE0A5B0;
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderDictionary initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: capacity (%lu) is ridiculous", "-[__NSPlaceholderDictionary initWithCapacity:]", a3);
    v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0 osLogPack:(char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) size:v5];
    objc_exception_throw(v8);
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
    [&___immutablePlaceholderDictionary doesNotRecognizeSelector:a2];
LABEL_9:
    __break(1u);
  }
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary) {
    goto LABEL_9;
  }

  return (__NSPlaceholderDictionary *)__NSDictionaryM_new(0, 0, a3, 3uLL);
}

- (__NSPlaceholderDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5) {
    goto LABEL_32;
  }
  if (a5 >> 61)
  {
    uint64_t v9 = _os_log_pack_size();
    v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a5;
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]", a5);
    goto LABEL_29;
  }
  if (a5)
  {
    for (uint64_t i = 0; i != a5; ++i)
    {
      if (!a4[i]) {
        goto LABEL_28;
      }
    }
    if (a3)
    {
      uint64_t i = 0;
      while (a3[i])
      {
        if (a5 == ++i) {
          goto LABEL_12;
        }
      }
LABEL_28:
      uint64_t v8 = i;
      uint64_t v9 = _os_log_pack_size();
      v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = v8;
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]", v8);
LABEL_29:
      v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v9];
      objc_exception_throw(v13);
    }
LABEL_32:
    uint64_t v9 = _os_log_pack_size();
    v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a5;
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]", a5);
    goto LABEL_29;
  }
LABEL_12:
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
    if (a5 == 1)
    {
      uint64_t v6 = *a4;
      CFStringRef v7 = *a3;
      return (__NSPlaceholderDictionary *)__NSSingleEntryDictionaryI_new((unint64_t)v6, (unint64_t)v7, 1);
    }
    else if (a5)
    {
      return (__NSPlaceholderDictionary *)__NSDictionaryI_new((uint64_t *)a4, (uint64_t *)a3, 0, a5, 1);
    }
    else
    {
      return (__NSPlaceholderDictionary *)&__NSDictionary0__struct;
    }
  }
  else if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    return (__NSPlaceholderDictionary *)__NSDictionaryM_new((uint64_t)a4, (uint64_t)a3, a5, 3uLL);
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (__NSPlaceholderDictionary)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  if (a4) {
    goto LABEL_12;
  }
  CFStringRef v7 = (__objc2_class *)objc_opt_class();
  BOOL v8 = v7 == __NSDictionaryI || v7 == __NSDictionaryM;
  if (!v8 && v7 != __NSFrozenDictionaryM) {
    goto LABEL_12;
  }
  if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    return (__NSPlaceholderDictionary *)[a3 mutableCopyWithZone:0];
  }
  else
  {
    if (self != (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    {
LABEL_12:
      v11.receiver = self;
      v11.super_class = (Class)__NSPlaceholderDictionary;
      return [(NSDictionary *)&v11 initWithDictionary:a3 copyItems:v4];
    }
    return (__NSPlaceholderDictionary *)[a3 copyWithZone:0];
  }
}

- (__NSPlaceholderDictionary)initWithContentsOfFile:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSString((uint64_t)a3) & 1) == 0)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSPlaceholderDictionary initWithContentsOfFile:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: string argument is not an NSString", "-[__NSPlaceholderDictionary initWithContentsOfFile:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }

  return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:a3 immutable:self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary];
}

- (__NSPlaceholderDictionary)initWithContentsOfURL:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (atomic_load(&initWithContentsOfURL____cls_NSURL_0))
  {
    if (!a3) {
      goto LABEL_6;
    }
  }
  else
  {
    atomic_store((unint64_t)objc_lookUpClass("NSURL"), &initWithContentsOfURL____cls_NSURL_0);
    if (!a3) {
      goto LABEL_6;
    }
  }
  atomic_load(&initWithContentsOfURL____cls_NSURL_0);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[__NSPlaceholderDictionary initWithContentsOfURL:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: url argument is not an NSURL", "-[__NSPlaceholderDictionary initWithContentsOfURL:]");
    v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
LABEL_6:

  return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:a3 immutable:self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary];
}

- (unint64_t)count
{
  BOOL v4 = "mutable";
  uint64_t v5 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    BOOL v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v7 = "NSDictionary";
  }
  else {
    uint64_t v7 = v5;
  }
  uint64_t v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s dictionary object", v9, v6);
  objc_super v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0];
  objc_exception_throw(v11);
}

- (id)objectForKey:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v8 = "NSDictionary";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s dictionary object", v10, v7);
  uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (id)keyEnumerator
{
  BOOL v4 = "mutable";
  uint64_t v5 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    BOOL v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v7 = "NSDictionary";
  }
  else {
    uint64_t v7 = v5;
  }
  uint64_t v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s dictionary object", v9, v6);
  CFStringRef v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0];
  objc_exception_throw(v11);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v8 = "immutable";
  }
  else {
    uint64_t v8 = v6;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v9 = "NSDictionary";
  }
  else {
    uint64_t v9 = v7;
  }
  CFStringRef v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s dictionary object", v11, v8);
  v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
  objc_exception_throw(v13);
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v8 = "NSDictionary";
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized %s dictionary object", v10, v7);
  CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0];
  objc_exception_throw(v12);
}

- (unint64_t)retainCount
{
  return -1;
}

@end