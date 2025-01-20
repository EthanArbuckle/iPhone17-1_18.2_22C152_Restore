@interface NSSet
+ (BOOL)supportsSecureCoding;
+ (NSSet)allocWithZone:(_NSZone *)a3;
+ (NSSet)set;
+ (NSSet)setWithArray:(NSArray *)array;
+ (NSSet)setWithArray:(id)a3 copyItems:(BOOL)a4;
+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4;
+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSSet)setWithObject:(id)object;
+ (NSSet)setWithObjects:(id *)objects count:(NSUInteger)cnt;
+ (NSSet)setWithObjects:(id)firstObj;
+ (NSSet)setWithOrderedSet:(id)a3;
+ (NSSet)setWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4;
+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSSet)setWithSet:(NSSet *)set;
+ (NSSet)setWithSet:(id)a3 copyItems:(BOOL)a4;
+ (id)newSetWithObjects:(const void *)a3 count:(unint64_t)a4;
- (BOOL)__getValue:(id *)a3 forObj:(id)a4;
- (BOOL)containsObject:(id)anObject;
- (BOOL)intersectsOrderedSet:(id)a3;
- (BOOL)intersectsSet:(NSSet *)otherSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(NSSet *)otherSet;
- (BOOL)isNSSet__;
- (BOOL)isSubsetOfOrderedSet:(id)a3;
- (BOOL)isSubsetOfSet:(NSSet *)otherSet;
- (NSArray)allObjects;
- (NSEnumerator)objectEnumerator;
- (NSSet)initWithArray:(NSArray *)array;
- (NSSet)initWithArray:(id)a3 copyItems:(BOOL)a4;
- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4;
- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSSet)initWithCoder:(NSCoder *)coder;
- (NSSet)initWithObject:(id)a3;
- (NSSet)initWithObjects:(id *)objects count:(NSUInteger)cnt;
- (NSSet)initWithObjects:(id)firstObj;
- (NSSet)initWithOrderedSet:(id)a3;
- (NSSet)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4;
- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSSet)initWithSet:(NSSet *)set;
- (NSSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag;
- (NSSet)objectsPassingTest:(void *)predicate;
- (NSSet)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSSet)setByAddingObject:(id)anObject;
- (NSSet)setByAddingObjectsFromArray:(NSArray *)other;
- (NSSet)setByAddingObjectsFromSet:(NSSet *)other;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSUInteger)count;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)member:(id)object;
- (id)members:(id)a3 notFoundMarker:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectPassingTest:(id)a3;
- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)hash;
- (void)__applyValues:(void *)a3 context:(void *)a4;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;
@end

@implementation NSSet

- (NSSet)initWithArray:(NSArray *)array
{
  NSUInteger v5 = [(NSArray *)array count];

  return -[NSSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, v5, 0);
}

+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  NSUInteger v5 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, a5);

  return (NSSet *)v5;
}

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    int v6 = _NSIsNSSet((uint64_t)a3);
    if (v6)
    {
      LOBYTE(v6) = [(NSSet *)self isEqualToSet:a3];
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  return (NSString *)[(NSSet *)self descriptionWithLocale:locale indent:0];
}

+ (NSSet)setWithSet:(NSSet *)set
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithSet:set copyItems:0];

  return (NSSet *)v3;
}

- (NSSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  NSUInteger v5 = set;
  uint64_t v43 = *(void *)off_1ECE0A5B0;
  if (set)
  {
    if ((_NSIsNSSet((uint64_t)set) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      __int16 v8 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v9, v10, v11, v12, v13, v14, v8);
    }
    v15 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v16 = [(NSSet *)v5 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v5);
          }
          [v15 addObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        }
        uint64_t v16 = [(NSSet *)v5 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v16);
    }
    NSUInteger v5 = v15;
    if (v5)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v5) & 1) == 0)
      {
        uint64_t v32 = _os_log_pack_size();
        v34 = (char *)v38 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v35 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v35 = 136315138;
        *(void *)(v35 + 4) = "-[NSSet initWithSet:copyItems:]";
        CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSSet initWithSet:copyItems:]");
        v37 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v36) userInfo:0 osLogPack:v34 size:v32];
        objc_exception_throw(v37);
      }
    }
  }
  unint64_t v19 = [(NSSet *)v5 count];
  unint64_t v21 = v19;
  if (v19 >> 60)
  {
    CFStringRef v30 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v19);
    v31 = +[NSException exceptionWithName:@"NSGenericException" reason:v30 userInfo:0];
    CFRelease(v30);
    objc_exception_throw(v31);
  }
  if (v19 <= 1) {
    unint64_t v19 = 1;
  }
  unint64_t v22 = MEMORY[0x1F4188790](v19, v20);
  v24 = (id *)((char *)v38 - v23);
  v38[0] = 0;
  if (v21 >= 0x101)
  {
    v24 = (id *)_CFCreateArrayStorage(v22, 0, v38);
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  -[NSSet getObjects:count:](v5, "getObjects:count:", v24, v21, v38[0]);
  if (!v21) {
    BOOL v4 = 0;
  }
  if (v4)
  {
    v26 = v24;
    unint64_t v27 = v21;
    do
    {
      id *v26 = (id)[*v26 copyWithZone:0];
      ++v26;
      --v27;
    }
    while (v27);
  }
  v28 = [(NSSet *)self initWithObjects:v24 count:v21];
  if (v4)
  {
    do
    {

      --v21;
    }
    while (v21);
  }
  free(v25);
  return v28;
}

+ (NSSet)setWithArray:(NSArray *)array
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);

  return (NSSet *)v3;
}

- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v46 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)&v45 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSSet initWithArray:range:copyItems:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSSet initWithArray:range:copyItems:]");
    CFStringRef v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      uint64_t v22 = _os_log_pack_size();
      v24 = (char *)&v45 - ((MEMORY[0x1F4188790](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSSet initWithArray:range:copyItems:]", location, length);
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty set", v26, "-[NSSet initWithArray:range:copyItems:]", location, length);
      v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v24 size:v22];
      objc_exception_throw(v28);
    }
    uint64_t v37 = _os_log_pack_size();
    long long v39 = (char *)&v45 - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    uint64_t v41 = v12 - 1;
    double v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSSet initWithArray:range:copyItems:]", location, length, v41);
    CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v42, "-[NSSet initWithArray:range:copyItems:]", location, length, v41);
    v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v39 size:v37];
    objc_exception_throw(v44);
  }
  if (length >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    CFStringRef v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  if (length <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v13, v11);
  uint64_t v16 = (id *)((char *)&v45 - v15);
  size_t v45 = 0;
  if (length >= 0x101)
  {
    uint64_t v16 = (id *)_CFCreateArrayStorage(v14, 0, &v45);
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v45, v46);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v18 = v16;
    NSUInteger v19 = length;
    do
    {
      id *v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }
    while (v19);
  }
  uint64_t v20 = [(NSSet *)self initWithObjects:v16 count:length];
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  free(v17);
  return v20;
}

+ (NSSet)set
{
  v2 = (void *)[objc_alloc((Class)a1) initWithObjects:0 count:0];

  return (NSSet *)v2;
}

+ (NSSet)setWithObject:(id)object
{
  Set = (void *)__createSet(objc_alloc((Class)a1), (uint64_t)object);

  return (NSSet *)Set;
}

+ (NSSet)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSSet == a1)
  {
    return (NSSet *)__NSSetImmutablePlaceholder();
  }
  else if (NSMutableSet == a1)
  {
    return (NSSet *)__NSSetMutablePlaceholder();
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSSet;
    return (NSSet *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

+ (NSSet)setWithObjects:(id)firstObj
{
  va_start(va, firstObj);
  v21[1] = *(void *)off_1ECE0A5B0;
  va_list v20 = 0;
  v21[0] = (uint64_t)firstObj;
  if (firstObj)
  {
    unint64_t v5 = 0;
    va_copy(v19, va);
    do
    {
      int v6 = v19;
      v19 += 8;
      ++v5;
    }
    while (*v6);
    if (NSSet == a1)
    {
      va_copy(v20, va);
      uint64_t v17 = __NSSetI_new(v21, (uint64_t *)va, v5, 0);
      return (NSSet *)v17;
    }
    if (v5 >> 60)
    {
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
      __int16 v8 = +[NSException exceptionWithName:@"NSGenericException" reason:v7 userInfo:0];
      CFRelease(v7);
      objc_exception_throw(v8);
    }
LABEL_9:
    if (v5 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v5;
    }
    unint64_t v10 = MEMORY[0x1F4188790](v9, a2);
    unint64_t v12 = (va_list *)((char *)&v19 - v11);
    va_list v19 = 0;
    if (v5 >= 0x101)
    {
      unint64_t v12 = _CFCreateArrayStorage(v10, 0, (size_t *)&v19);
      va_copy(v20, va);
      *unint64_t v12 = firstObj;
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = 0;
      if (!v5) {
        goto LABEL_19;
      }
      va_copy(v20, va);
      *unint64_t v12 = firstObj;
      if (v5 == 1) {
        goto LABEL_19;
      }
    }
    for (uint64_t i = 1; i != v5; ++i)
    {
      uint64_t v15 = v20;
      v20 += 8;
      v12[i] = *v15;
    }
LABEL_19:
    id v16 = objc_alloc((Class)a1);
    uint64_t v17 = (unsigned char *)objc_msgSend(v16, "initWithObjects:count:", v12, v5, v19);
    free(v13);
    return (NSSet *)v17;
  }
  if (NSSet != a1)
  {
    unint64_t v5 = 0;
    goto LABEL_9;
  }
  return (NSSet *)__NSSet0__;
}

- (id)anyObject
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  memset(v6, 0, sizeof(v6));
  id result = [(NSSet *)self countByEnumeratingWithState:v6 objects:&v5 count:16];
  if (result) {
    return (id)**((void **)&v6[0] + 1);
  }
  return result;
}

- (BOOL)intersectsSet:(NSSet *)otherSet
{
  objc_super v4 = otherSet;
  uint64_t v44 = *(void *)off_1ECE0A5B0;
  if (otherSet)
  {
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
    }
    unint64_t v14 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v15 = [(NSSet *)v4 countByEnumeratingWithState:&v40 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v4);
          }
          [v14 addObject:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        }
        uint64_t v16 = [(NSSet *)v4 countByEnumeratingWithState:&v40 objects:v39 count:16];
      }
      while (v16);
    }
    objc_super v4 = v14;
    if (v4)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
      {
        uint64_t v27 = _os_log_pack_size();
        CFStringRef v29 = &v34[-((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0)];
        uint64_t v30 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v30 = 136315138;
        *(void *)(v30 + 4) = "-[NSSet intersectsSet:]";
        CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSSet intersectsSet:]");
        uint64_t v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
        objc_exception_throw(v32);
      }
    }
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  NSUInteger v19 = [(NSSet *)self count];
  unint64_t v20 = [(NSSet *)v4 count];
  BOOL v21 = v19 >= v20;
  long long v35 = 0u;
  long long v36 = 0u;
  if (v19 >= v20) {
    uint64_t v22 = v4;
  }
  else {
    uint64_t v22 = self;
  }
  if (!v21) {
    self = v4;
  }
  long long v37 = 0uLL;
  long long v38 = 0uLL;
  uint64_t v23 = [(NSSet *)v22 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    while (2)
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        if ([(NSSet *)self containsObject:*(void *)(*((void *)&v35 + 1) + 8 * v26)])
        {
          LOBYTE(v23) = 1;
          return v23;
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v23 = [(NSSet *)v22 countByEnumeratingWithState:&v35 objects:v34 count:16];
      uint64_t v24 = v23;
      if (v23) {
        continue;
      }
      break;
    }
  }
  return v23;
}

- (BOOL)isEqualToSet:(NSSet *)otherSet
{
  objc_super v4 = otherSet;
  uint64_t v45 = *(void *)off_1ECE0A5B0;
  if (!otherSet) {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_15;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
  {
    __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
  }
  unint64_t v14 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v15 = [(NSSet *)v4 countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v4);
        }
        [v14 addObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v16 = [(NSSet *)v4 countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v16);
  }
  objc_super v4 = v14;
  if (v4)
  {
LABEL_15:
    if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
    {
      uint64_t v29 = _os_log_pack_size();
      CFStringRef v31 = &v35[-((MEMORY[0x1F4188790](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v32 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v32 = 136315138;
      *(void *)(v32 + 4) = "-[NSSet isEqualToSet:]";
      CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSSet isEqualToSet:]");
      uint64_t v34 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v33) userInfo:0 osLogPack:v31 size:v29];
      objc_exception_throw(v34);
    }
    char v19 = 0;
  }
  else
  {
LABEL_17:
    char v19 = 1;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  BOOL result = v4 == self;
  if (v4 == self) {
    char v21 = 1;
  }
  else {
    char v21 = v19;
  }
  if ((v21 & 1) == 0)
  {
    NSUInteger v22 = [(NSSet *)self count];
    if ([(NSSet *)v4 count] == v22)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      unint64_t v23 = [(NSSet *)self countByEnumeratingWithState:&v36 objects:v35 count:16];
      if (!v23) {
        return 1;
      }
      unint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
LABEL_27:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(self);
        }
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * v26);
        uint64_t v28 = [(NSSet *)v4 countForObject:v27];
        if (v28 != [(NSSet *)self countForObject:v27]) {
          break;
        }
        if (v24 == ++v26)
        {
          unint64_t v24 = [(NSSet *)self countByEnumeratingWithState:&v36 objects:v35 count:16];
          BOOL result = 1;
          if (v24) {
            goto LABEL_27;
          }
          return result;
        }
      }
    }
    return 0;
  }
  return result;
}

- (BOOL)isNSSet__
{
  return 1;
}

- (NSArray)allObjects
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  unint64_t v4 = [(NSSet *)self count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    uint64_t v13 = +[NSException exceptionWithName:@"NSGenericException" reason:v12 userInfo:0];
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  int v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  [(NSSet *)self getObjects:v6 count:v5];
  if (v6)
  {
    if (v5)
    {
      __int16 v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    uint64_t v10 = [[NSArray alloc] _initByAdoptingBuffer:v6 count:v5 size:v5];
  }
  else
  {
    uint64_t v10 = [[NSArray alloc] initWithObjects:0 count:v5];
  }
  return v10;
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }

  return [(NSSet *)self count];
}

- (NSSet)initWithSet:(NSSet *)set
{
  return [(NSSet *)self initWithSet:set copyItems:0];
}

uint64_t __40__NSSet_objectsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    [*(id *)(a1 + 32) addObject:a2];
    unint64_t v5 = *(pthread_mutex_t **)(a1 + 48);
    return pthread_mutex_unlock(v5);
  }
  return result;
}

- (void)getObjects:(id *)a3
{
  v16[1] = *(void *)off_1ECE0A5B0;
  NSUInteger v6 = [(NSSet *)self count];
  if (!a3 && v6)
  {
    NSUInteger v8 = v6;
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSSet getObjects:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v8;
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSSet getObjects:]", v8);
    goto LABEL_11;
  }
  if (v6 >> 61)
  {
    NSUInteger v13 = v6;
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSSet getObjects:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v13;
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSSet getObjects:]", v13);
LABEL_11:
    uint64_t v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v9];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  NSUInteger v7 = [(NSSet *)self count];

  [(NSSet *)self getObjects:a3 count:v7];
}

uint64_t __48__NSSet_sortedArrayWithOptions_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8 * a2), *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  NSUInteger v6 = +[NSSet allocWithZone:a3];

  return [(NSSet *)v6 initWithSet:self copyItems:0];
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  id v32 = a3;
  v33[1] = *(void *)off_1ECE0A5B0;
  if (a4 >= 0x64) {
    unint64_t v5 = 100;
  }
  else {
    unint64_t v5 = a4;
  }
  NSUInteger v6 = [(NSSet *)self count];
  unint64_t v8 = v6;
  if (v6 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v9 = MEMORY[0x1F4188790](v6, v7);
  uint64_t v11 = (uint64_t *)((char *)&v27 - v10);
  v33[0] = 0;
  if (v8 >= 0x101)
  {
    uint64_t v11 = (uint64_t *)_CFCreateArrayStorage(v9, 0, v33);
    CFStringRef v12 = v11;
  }
  else
  {
    CFStringRef v12 = 0;
  }
  [(NSSet *)self getObjects:v11 count:v8];
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  CFAllocatorRef v29 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  uint64_t v30 = v12;
  uint64_t v28 = (void *)MEMORY[0x185311AE0]();
  if (v8)
  {
    CFStringRef v31 = sel_descriptionWithLocale_;
    uint64_t v14 = v11;
    unint64_t v15 = v8;
    do
    {
      uint64_t v16 = (void *)*v14;
      if (_NSIsNSString(*v14))
      {
        uint64_t v17 = [v16 _stringRepresentation];
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v16 descriptionWithLocale:v32 indent:v5 + 1];
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v16 descriptionWithLocale:v32];
      }
      else
      {
        uint64_t v17 = [v16 description];
      }
      if (v17) {
        v18 = (__CFString *)v17;
      }
      else {
        v18 = @"(null)";
      }
      *v14++ = (uint64_t)v18;
      --v15;
    }
    while (v15);
  }
  char v19 = v30;
  for (CFMutableStringRef i = CFStringCreateMutable(v29, 0); v5; --v5)
    CFStringAppend(i, @"    ");
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @"{(\n");
  unint64_t v21 = 0;
  while (v8 != v21)
  {
    CFStringAppend(Mutable, i);
    CFStringAppend(Mutable, @"    ");
    CFStringAppend(Mutable, (CFStringRef)v11[v21++]);
    if (v21 >= v8) {
      CFStringRef v22 = @"\n";
    }
    else {
      CFStringRef v22 = @",\n";
    }
    CFStringAppend(Mutable, v22);
  }
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @"}"));
  CFRelease(i);
  unint64_t v23 = Mutable;
  free(v19);
  return v23;
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }

  return (NSString *)[(NSSet *)self descriptionWithLocale:0 indent:0];
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSSet enumerateObjectsUsingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSSet enumerateObjectsUsingBlock:]");
    unint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  [(NSSet *)self enumerateObjectsWithOptions:0 usingBlock:block];
}

- (NSSet)setByAddingObjectsFromArray:(NSArray *)other
{
  uint64_t v28 = *(void *)off_1ECE0A5B0;
  if (other && (_NSIsNSArray((uint64_t)other) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    unint64_t v21 = (char *)&v27 - ((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSSet setByAddingObjectsFromArray:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSSet setByAddingObjectsFromArray:]");
    unint64_t v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v21 size:v19];
    objc_exception_throw(v24);
  }
  NSUInteger v5 = [(NSArray *)other count];
  if (v5)
  {
    NSUInteger v6 = v5;
    NSUInteger v7 = [(NSSet *)self count];
    unint64_t v9 = v7 + v6;
    if ((v7 + v6) >> 60)
    {
      CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7 + v6);
      uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
      CFRelease(v25);
      objc_exception_throw(v26);
    }
    NSUInteger v10 = v7;
    if (v9 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v7 + v6;
    }
    unint64_t v12 = MEMORY[0x1F4188790](v11, v8);
    uint64_t v14 = (char *)&v27 - v13;
    size_t v27 = 0;
    if (v9 >= 0x101)
    {
      uint64_t v14 = (char *)_CFCreateArrayStorage(v12, 0, &v27);
      unint64_t v15 = v14;
      if (!v10)
      {
LABEL_16:
        -[NSArray getObjects:range:](other, "getObjects:range:", &v14[8 * v10], 0, v6, v27);
        v18 = +[NSSet setWithObjects:v14 count:v9];
        free(v15);
        return v18;
      }
    }
    else
    {
      unint64_t v15 = 0;
      if (!v10) {
        goto LABEL_16;
      }
    }
    -[NSSet getObjects:count:](self, "getObjects:count:", v14, v10, v27, v28);
    goto LABEL_16;
  }
  uint64_t v16 = self;

  return v16;
}

- (NSSet)setByAddingObject:(id)anObject
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  if (!anObject)
  {
    uint64_t v17 = _os_log_pack_size();
    uint64_t v19 = (char *)&v25 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSSet setByAddingObject:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSSet setByAddingObject:]");
    uint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
  if (-[NSSet containsObject:](self, "containsObject:"))
  {
    NSUInteger v5 = self;
    return v5;
  }
  else
  {
    NSUInteger v7 = [(NSSet *)self count];
    unint64_t v9 = v7 + 1;
    if ((v7 + 1) >> 60)
    {
      CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7 + 1);
      unint64_t v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
      CFRelease(v23);
      objc_exception_throw(v24);
    }
    NSUInteger v10 = v7;
    if (v9 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v7 + 1;
    }
    unint64_t v12 = MEMORY[0x1F4188790](v11, v8);
    uint64_t v14 = (char *)&v25 - v13;
    size_t v25 = 0;
    if (v9 >= 0x101)
    {
      uint64_t v14 = (char *)_CFCreateArrayStorage(v12, 0, &v25);
      unint64_t v15 = v14;
    }
    else
    {
      unint64_t v15 = 0;
    }
    -[NSSet getObjects:count:](self, "getObjects:count:", v14, v10, v25, v26);
    *(void *)&v14[8 * v10] = anObject;
    uint64_t v16 = +[NSSet setWithObjects:v14 count:v9];
    free(v15);
    return v16;
  }
}

- (NSSet)setByAddingObjectsFromSet:(NSSet *)other
{
  uint64_t v3 = other;
  uint64_t v42 = *(void *)off_1ECE0A5B0;
  if (other)
  {
    if ((_NSIsNSSet((uint64_t)other) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      __int16 v6 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v7, v8, v9, v10, v11, v12, v6);
    }
    uint64_t v13 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v14 = [(NSSet *)v3 countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v3);
          }
          [v13 addObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        }
        uint64_t v14 = [(NSSet *)v3 countByEnumeratingWithState:&v38 objects:v37 count:16];
      }
      while (v14);
    }
    uint64_t v3 = v13;
    if (v3)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v3) & 1) == 0)
      {
        uint64_t v31 = _os_log_pack_size();
        CFStringRef v33 = (char *)v37 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v34 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v34 = 136315138;
        *(void *)(v34 + 4) = "-[NSSet setByAddingObjectsFromSet:]";
        CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSSet setByAddingObjectsFromSet:]");
        long long v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
        objc_exception_throw(v36);
      }
    }
  }
  uint64_t v17 = [(NSSet *)v3 count];
  if (v17)
  {
    NSUInteger v18 = [(NSSet *)self count];
    NSUInteger v20 = v18;
    unint64_t v21 = v18 + v17;
    if ((v18 + v17) >> 60)
    {
      CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v18 + v17);
      uint64_t v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
      CFRelease(v29);
      objc_exception_throw(v30);
    }
    if (v21 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v18 + v17;
    }
    unint64_t v23 = MEMORY[0x1F4188790](v22, v19);
    size_t v25 = (char *)v37 - v24;
    v37[0] = 0;
    if (v21 >= 0x101)
    {
      size_t v25 = (char *)_CFCreateArrayStorage(v23, 0, v37);
      uint64_t v26 = v25;
      if (!v20)
      {
LABEL_27:
        -[NSSet getObjects:count:](v3, "getObjects:count:", &v25[8 * v20], v17, v37[0]);
        size_t v27 = +[NSSet setWithObjects:v25 count:v21];
        free(v26);
        return v27;
      }
    }
    else
    {
      uint64_t v26 = 0;
      if (!v20) {
        goto LABEL_27;
      }
    }
    -[NSSet getObjects:count:](self, "getObjects:count:", v25, v20, v37[0]);
    goto LABEL_27;
  }
  return self;
}

+ (NSSet)setWithObjects:(id *)objects count:(NSUInteger)cnt
{
  unint64_t v4 = (void *)[objc_alloc((Class)a1) initWithObjects:objects count:cnt];

  return (NSSet *)v4;
}

- (BOOL)isSubsetOfSet:(NSSet *)otherSet
{
  unint64_t v4 = otherSet;
  uint64_t v43 = *(void *)off_1ECE0A5B0;
  if (otherSet)
  {
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      __int16 v7 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, @"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s", v8, v9, v10, v11, v12, v13, v7);
    }
    uint64_t v14 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v15 = [(NSSet *)v4 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v4);
          }
          [v14 addObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        }
        uint64_t v16 = [(NSSet *)v4 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v16);
    }
    unint64_t v4 = v14;
    if (v4)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
      {
        uint64_t v27 = _os_log_pack_size();
        CFStringRef v29 = &v33[-((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0)];
        uint64_t v30 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v30 = 136315138;
        *(void *)(v30 + 4) = "-[NSSet isSubsetOfSet:]";
        CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSSet isSubsetOfSet:]");
        uint64_t v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
        objc_exception_throw(v32);
      }
    }
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  unint64_t v19 = [(NSSet *)self count];
  if (v19 > [(NSSet *)v4 count]) {
    return 0;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v21 = [(NSSet *)self countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v21)
  {
    unint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
LABEL_22:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v35 != v23) {
        objc_enumerationMutation(self);
      }
      uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * v24);
      unint64_t v26 = [(NSSet *)v4 countForObject:v25];
      if (v26 < [(NSSet *)self countForObject:v25]) {
        return 0;
      }
      if (v22 == ++v24)
      {
        unint64_t v22 = [(NSSet *)self countByEnumeratingWithState:&v34 objects:v33 count:16];
        if (v22) {
          goto LABEL_22;
        }
        return v4 != 0;
      }
    }
  }
  return v4 != 0;
}

- (unint64_t)countForObject:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return [(NSSet *)self member:a3] != 0;
}

- (BOOL)containsObject:(id)anObject
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    if (anObject) {
      return [(NSSet *)self member:anObject] != 0;
    }
  }
  else if (anObject)
  {
    return [(NSSet *)self member:anObject] != 0;
  }
  return 0;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  unint64_t v5 = a4;
  __int16 v6 = a3;
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSSet getObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v5;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSSet getObjects:count:]", v5);
    goto LABEL_17;
  }
  if (a4 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSSet getObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = v5;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSSet getObjects:count:]", v5);
LABEL_17:
    uint64_t v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = [(NSSet *)self countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(self);
      }
      if (v5 == v11) {
        break;
      }
      *v6++ = *(id *)(*((void *)&v19 + 1) + 8 * v11);
      if (v9 == ++v11)
      {
        unint64_t v9 = [(NSSet *)self countByEnumeratingWithState:&v19 objects:v18 count:16];
        v5 -= v11;
        if (v9) {
          goto LABEL_8;
        }
        return;
      }
    }
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v25[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v19 = _os_log_pack_size();
    long long v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a5;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSSet countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_28;
  }
  if (a5 >> 61)
  {
    uint64_t v19 = _os_log_pack_size();
    long long v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315394;
    *(void *)(v23 + 4) = "-[NSSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v23 + 12) = 2048;
    *(void *)(v23 + 14) = a5;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSSet countByEnumeratingWithState:objects:count:]", a5);
LABEL_28:
    uint64_t v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:v20 size:v19];
    objc_exception_throw(v24);
  }
  unint64_t var0 = a3->var0;
  if (a3->var0 == -1) {
    return 0;
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
    unint64_t var0 = a3->var0;
    if (a3->var0) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if (!var0)
  {
LABEL_9:
    a3->var2 = a3->var3;
    a3->var3[0] = [(NSSet *)self count];
    uint64_t v12 = [(NSSet *)self objectEnumerator];
    a3->var3[1] = (unint64_t)v12;
    if (v12)
    {
      uint64_t v11 = v12;
      unint64_t var0 = a3->var0;
      goto LABEL_11;
    }
    return 0;
  }
LABEL_7:
  uint64_t v11 = (NSEnumerator *)a3->var3[1];
LABEL_11:
  a3->var1 = a4;
  unint64_t v13 = a3->var3[0];
  if (v13 - var0 >= a5) {
    unint64_t v14 = a5;
  }
  else {
    unint64_t v14 = v13 - var0;
  }
  if (v14)
  {
    unint64_t v15 = 0;
    while (1)
    {
      id v16 = [(NSEnumerator *)v11 nextObject];
      if (!v16) {
        break;
      }
      a4[v15++] = v16;
      if (v14 == v15)
      {
        unint64_t var0 = a3->var0;
        goto LABEL_19;
      }
    }
    unint64_t v17 = -1;
  }
  else
  {
LABEL_19:
    unint64_t v17 = var0 + v14;
    if (v13 <= v17) {
      unint64_t v17 = -1;
    }
    unint64_t v15 = v14;
  }
  a3->unint64_t var0 = v17;
  return v15;
}

- (NSSet)initWithObjects:(id)firstObj
{
  va_start(va, firstObj);
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  va_list v21 = 0;
  id v22 = firstObj;
  Class = (__objc2_class *)object_getClass(self);
  if (firstObj)
  {
    unint64_t v7 = 0;
    va_copy(v20, va);
    do
    {
      unint64_t v8 = v20;
      v20 += 8;
      ++v7;
    }
    while (*v8);
    if (Class == NSSet)
    {
      va_copy(v21, va);
      return (NSSet *)__NSSetI_new((uint64_t *)&v22, (uint64_t *)va, v7, 0);
    }
    if (v7 >> 60)
    {
      CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
      uint64_t v10 = +[NSException exceptionWithName:@"NSGenericException" reason:v9 userInfo:0];
      CFRelease(v9);
      objc_exception_throw(v10);
    }
  }
  else
  {
    if (Class == NSSet) {
      return (NSSet *)__NSSet0__;
    }
    unint64_t v7 = 0;
  }
  if (v7 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v7;
  }
  unint64_t v12 = MEMORY[0x1F4188790](v11, v6);
  unint64_t v14 = (va_list *)((char *)&v20 - v13);
  va_list v20 = 0;
  if (v7 >= 0x101)
  {
    unint64_t v14 = _CFCreateArrayStorage(v12, 0, (size_t *)&v20);
    va_copy(v21, va);
    *unint64_t v14 = firstObj;
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0;
    if (!v7) {
      goto LABEL_19;
    }
    va_copy(v21, va);
    *unint64_t v14 = firstObj;
    if (v7 == 1) {
      goto LABEL_19;
    }
  }
  for (uint64_t i = 1; i != v7; ++i)
  {
    unint64_t v17 = v21;
    v21 += 8;
    v14[i] = *v17;
  }
LABEL_19:
  NSUInteger v18 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v20, v21, v22, v23);
  free(v15);
  return v18;
}

- (NSSet)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v10 = _os_log_pack_size();
    unint64_t v12 = (char *)v16 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSSet objectsWithOptions:passingTest:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSSet objectsWithOptions:passingTest:]");
    unint64_t v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v15);
  }
  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  unint64_t v8 = +[NSSet set];
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  uint64_t v17 = 850045857;
  v16[0] = off_1ECE0A5A0;
  v16[1] = 3221225472;
  void v16[2] = __40__NSSet_objectsWithOptions_passingTest___block_invoke;
  v16[3] = &unk_1ECB43C68;
  v16[5] = predicate;
  v16[6] = &v17;
  v16[4] = v8;
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)v16);
  return +[NSSet setWithSet:v8];
}

- (NSSet)objectsPassingTest:(void *)predicate
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSSet objectsPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSSet objectsPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  return [(NSSet *)self objectsWithOptions:0 passingTest:predicate];
}

+ (id)newSetWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "+[NSSet newSetWithObjects:count:]", a4);
    goto LABEL_26;
  }
  if (a4 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = a4;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "+[NSSet newSetWithObjects:count:]", a4);
    goto LABEL_26;
  }
  if (a4)
  {
    uint64_t v6 = 0;
    while (a3[v6])
    {
      if (a4 == ++v6) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = v6;
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v11;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "+[NSSet newSetWithObjects:count:]", v11);
LABEL_26:
    id v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v16);
  }
LABEL_8:
  if (NSSet == a1)
  {
    if (a4 == 1)
    {
      CFStringRef v9 = *a3;
      return __NSSingleObjectSetI_new((uint64_t)v9, 1);
    }
    else if (a4)
    {
      return __NSSetI_new((uint64_t *)a3, 0, a4, 1);
    }
    else
    {
      uint64_t v8 = (void *)__NSSet0__;
      return v8;
    }
  }
  else
  {
    if (NSMutableSet != a1)
    {
      uint64_t v10 = __CFLookUpClass("NSSet");
      __CFRequireConcreteImplementation(v10, (objc_class *)a1, a2);
    }
    return __NSSetM_new((uint64_t)a3, a4, 0);
  }
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v14 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSSet enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSSet enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }

  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)block);
}

- (void)makeObjectsPerformSelector:(SEL)aSelector
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = [(NSSet *)self countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(self);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) performSelector:aSelector];
      }
      unint64_t v7 = [(NSSet *)self countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v8 = [(NSSet *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(self);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) performSelector:aSelector withObject:argument];
      }
      unint64_t v9 = [(NSSet *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v9);
  }
}

- (id)sortedArrayUsingComparator:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSSet sortedArrayUsingComparator:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSSet sortedArrayUsingComparator:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  return [(NSSet *)self sortedArrayWithOptions:0 usingComparator:a3];
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  v37[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)&v35[-1] - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSSet sortedArrayWithOptions:usingComparator:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSSet sortedArrayWithOptions:usingComparator:]");
    CFStringRef v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  char v6 = a3;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  NSUInteger v8 = [(NSSet *)self count];
  if (v8)
  {
    unint64_t v10 = v8;
    if (v8 >> 60)
    {
      CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8);
      CFStringRef v33 = +[NSException exceptionWithName:@"NSGenericException" reason:v32 userInfo:0];
      CFRelease(v32);
      objc_exception_throw(v33);
    }
    MEMORY[0x1F4188790](v8, v9);
    long long v12 = (char *)&v35[-1] - v11;
    v37[0] = 0;
    if (v10 >= 0x101)
    {
      long long v12 = (char *)_CFCreateArrayStorage(v10, 0, v37);
      long long v13 = v12;
    }
    else
    {
      long long v13 = 0;
    }
    size_t v36 = 0;
    long long v15 = (id *)_CFCreateArrayStorage(v10, 0, &v36);
    uint64_t v16 = [(NSSet *)self getObjects:v12 count:v10];
    MEMORY[0x1F4188790](v16, v17);
    long long v19 = (char *)&v35[-1] - v18;
    uint64_t v20 = (char *)&v35[-1] - v18;
    if (v10 > 0x1000) {
      uint64_t v20 = (char *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    }
    v35[0] = off_1ECE0A5A0;
    v35[1] = 3221225472;
    v35[2] = __48__NSSet_sortedArrayWithOptions_usingComparator___block_invoke;
    v35[3] = &unk_1ECDABB78;
    v35[4] = a4;
    v35[5] = v12;
    CFSortIndexes((uint64_t)v20, v10, v6, (uint64_t)v35);
    for (uint64_t i = 0; i != v10; ++i)
      v15[i] = *(id *)&v12[8 * *(void *)&v20[8 * i]];
    if (v19 != v20) {
      free(v20);
    }
    if ((uint64_t)v10 >= 1)
    {
      uint64_t v22 = v15;
      unint64_t v23 = v10;
      do
      {
        id v24 = *v22++;
        --v23;
      }
      while (v23);
    }
    id v25 = [[NSArray alloc] _initByAdoptingBuffer:v15 count:v10 size:v10];
    free(v13);
    return v25;
  }
  else
  {
    return +[NSArray array];
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  CFLog(3, @"*** ERROR: this process has called an NSArray-taking method, such as initWithArray:, and passed in an NSSet object.  This is being worked-around for now, but will soon cause you grief.", (uint64_t)a3, a4.location, a4.length, v4, v5, v6, v14);
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v7, __CFTSANTagMutableSet);
  }
  NSUInteger v11 = [(NSSet *)self count];
  if (v11)
  {
    NSUInteger v12 = v11;
    long long v13 = malloc_type_malloc(16 * v11, 0xBAD6032DuLL);
    [(NSSet *)self getObjects:v13 count:v12];
    memmove(a3, v13, 8 * length);
  }
}

- (BOOL)intersectsOrderedSet:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSSet intersectsOrderedSet:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSSet intersectsOrderedSet:]");
    uint64_t v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:&v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v14];
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  NSUInteger v6 = [(NSSet *)self count];
  unint64_t v7 = [(NSSet *)v4 count];
  BOOL v8 = v6 >= v7;
  long long v20 = 0u;
  long long v21 = 0u;
  if (v6 >= v7) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = self;
  }
  if (v8) {
    uint64_t v4 = self;
  }
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([(NSSet *)v4 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * v13)])
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
      uint64_t v11 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return v10;
}

- (BOOL)isSubsetOfOrderedSet:(id)a3
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSSet isSubsetOfOrderedSet:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSSet isSubsetOfOrderedSet:]");
    uint64_t v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:&v19[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v15];
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  unint64_t v6 = [(NSSet *)self count];
  if (v6 > [a3 count]) {
    return 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v8 = [(NSSet *)self countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(self);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v13 = [a3 countForObject:v12];
        if (v13 < [(NSSet *)self countForObject:v12])
        {
          BOOL v14 = 0;
          return a3 && v14;
        }
      }
      unint64_t v9 = [(NSSet *)self countByEnumeratingWithState:&v20 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
  return a3 && v14;
}

- (id)members:(id)a3 notFoundMarker:(id)a4
{
  uint64_t v41 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)&v34 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSSet members:notFoundMarker:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: marker cannot be nil", "-[NSSet members:notFoundMarker:]");
    CFStringRef v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  unint64_t v8 = [a3 count];
  if (v8 >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8);
    CFStringRef v33 = +[NSException exceptionWithName:@"NSGenericException" reason:v32 userInfo:0];
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (v8 <= 1) {
    unint64_t v8 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v8, v9);
  uint64_t v12 = (char *)&v34 - v11;
  size_t v35 = 0;
  if (v13 >= 0x101)
  {
    uint64_t v12 = (char *)_CFCreateArrayStorage(v10, 0, &v35);
    BOOL v14 = (id *)v12;
  }
  else
  {
    BOOL v14 = 0;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  uint64_t v16 = v12;
  if (v15)
  {
    uint64_t v17 = *(void *)v38;
    uint64_t v16 = v12;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(a3);
        }
        id v19 = [(NSSet *)self member:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        if (v19) {
          id v20 = v19;
        }
        else {
          id v20 = a4;
        }
        *(void *)uint64_t v16 = v20;
        v16 += 8;
      }
      uint64_t v15 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
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
      long long v22 = v14;
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

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v17[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v11 = (char *)v15 - ((MEMORY[0x1F4188790](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSSet objectWithOptions:passingTest:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSSet objectWithOptions:passingTest:]");
    BOOL v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v9];
    objc_exception_throw(v14);
  }
  char v6 = a3;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  v17[0] = 0;
  char v16 = 0;
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  v15[2] = __39__NSSet_objectWithOptions_passingTest___block_invoke;
  v15[3] = &unk_1ECDFE698;
  v15[4] = a4;
  v15[5] = &v16;
  v15[6] = v17;
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)v15);
  return (id)v17[0];
}

uint64_t __39__NSSet_objectWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    **(void **)(a1 + 48) = a2;
    *a3 = 1;
  }
  if (**(unsigned char **)(a1 + 40)) {
    *a3 = 1;
  }
  return result;
}

- (id)objectPassingTest:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSSet objectPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSSet objectPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  return [(NSSet *)self objectWithOptions:0 passingTest:a3];
}

- (void)__applyValues:(void *)a3 context:(void *)a4
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v11 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: function pointer is NULL", v11);
    CFStringRef v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
    objc_exception_throw(v13);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v7 = [(NSSet *)self countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(self);
        }
        ((void (*)(void, void *))a3)(*(void *)(*((void *)&v15 + 1) + 8 * v10++), a4);
      }
      while (v8 != v10);
      unint64_t v8 = [(NSSet *)self countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
}

- (BOOL)__getValue:(id *)a3 forObj:(id)a4
{
  id v5 = [(NSSet *)self member:a4];
  if (a3 && v5) {
    *a3 = v5;
  }
  return v5 != 0;
}

- (NSSet)initWithObject:(id)a3
{
  v4[1] = *(void *)off_1ECE0A5B0;
  v4[0] = a3;
  return [(NSSet *)self initWithObjects:v4 count:1];
}

- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSSet)initWithArray:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 count];

  return -[NSSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, 0, v7, v4);
}

- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v46 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v31 = _os_log_pack_size();
    CFStringRef v33 = (char *)&v45 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSSet initWithOrderedSet:range:copyItems:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSSet initWithOrderedSet:range:copyItems:]");
    size_t v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v24 = (char *)&v45 - ((MEMORY[0x1F4188790](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSSet initWithOrderedSet:range:copyItems:]", location, length);
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty set", v26, "-[NSSet initWithOrderedSet:range:copyItems:]", location, length);
      uint64_t v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v24 size:v22];
      objc_exception_throw(v28);
    }
    uint64_t v37 = _os_log_pack_size();
    long long v39 = (char *)&v45 - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    uint64_t v41 = v12 - 1;
    double v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSSet initWithOrderedSet:range:copyItems:]", location, length, v41);
    CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v42, "-[NSSet initWithOrderedSet:range:copyItems:]", location, length, v41);
    long long v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v39 size:v37];
    objc_exception_throw(v44);
  }
  if (length >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    CFStringRef v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  if (length <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v13, v11);
  long long v16 = (id *)((char *)&v45 - v15);
  size_t v45 = 0;
  if (length >= 0x101)
  {
    long long v16 = (id *)_CFCreateArrayStorage(v14, 0, &v45);
    long long v17 = v16;
  }
  else
  {
    long long v17 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v45, v46);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    long long v18 = v16;
    NSUInteger v19 = length;
    do
    {
      id *v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }
    while (v19);
  }
  id v20 = [(NSSet *)self initWithObjects:v16 count:length];
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  free(v17);
  return v20;
}

- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSSet)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 count];

  return -[NSSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, v7, v4);
}

- (NSSet)initWithOrderedSet:(id)a3
{
  uint64_t v5 = [a3 count];

  return -[NSSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, v5, 0);
}

+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);

  return (NSSet *)v4;
}

+ (NSSet)setWithArray:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);

  return (NSSet *)v4;
}

+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  uint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, a5);

  return (NSSet *)v5;
}

+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);

  return (NSSet *)v4;
}

+ (NSSet)setWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);

  return (NSSet *)v4;
}

+ (NSSet)setWithOrderedSet:(id)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), 0);

  return (NSSet *)v3;
}

+ (NSSet)setWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = (void *)[objc_alloc((Class)a1) initWithSet:a3 copyItems:a4];

  return (NSSet *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t ShouldCopy = __NSCollectionsShouldCopy();
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  uint64_t v7 = +[NSSet allocWithZone:a3];

  return [(NSSet *)v7 initWithSet:self copyItems:ShouldCopy];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  OUTLINED_FUNCTION_1_8();
  uint64_t v2 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_14(v2);
}

- (id)member:(id)object
{
  OUTLINED_FUNCTION_1_8();
  uint64_t v3 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_14(v3);
}

- (NSEnumerator)objectEnumerator
{
  OUTLINED_FUNCTION_1_8();
  uint64_t v2 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_14(v2);
}

- (NSSet)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  OUTLINED_FUNCTION_1_8();
  BOOL v4 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_14(v4);
}

@end