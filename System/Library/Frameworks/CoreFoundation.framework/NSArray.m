@interface NSArray
+ (BOOL)supportsSecureCoding;
+ (NSArray)allocWithZone:(_NSZone *)a3;
+ (NSArray)array;
+ (NSArray)arrayWithArray:(NSArray *)array;
+ (NSArray)arrayWithArray:(id)a3 copyItems:(BOOL)a4;
+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4;
+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSArray)arrayWithObject:(id)anObject;
+ (NSArray)arrayWithObjects:(id *)objects count:(NSUInteger)cnt;
+ (NSArray)arrayWithObjects:(id)firstObj;
+ (NSArray)arrayWithOrderedSet:(id)a3;
+ (NSArray)arrayWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4;
+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSArray)arrayWithSet:(id)a3;
+ (NSArray)arrayWithSet:(id)a3 copyItems:(BOOL)a4;
+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4;
- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4;
- (BOOL)containsObject:(id)anObject;
- (BOOL)containsObjectIdenticalTo:(id)a3;
- (BOOL)containsObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArray:(NSArray *)otherArray;
- (BOOL)isNSArray__;
- (NSArray)arrayByAddingObject:(id)anObject;
- (NSArray)arrayByAddingObjectsFromArray:(NSArray *)otherArray;
- (NSArray)initWithArray:(NSArray *)array;
- (NSArray)initWithArray:(NSArray *)array copyItems:(BOOL)flag;
- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4;
- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSArray)initWithCoder:(NSCoder *)coder;
- (NSArray)initWithObject:(id)a3;
- (NSArray)initWithObjects:(id *)objects count:(NSUInteger)cnt;
- (NSArray)initWithObjects:(id)firstObj;
- (NSArray)initWithOrderedSet:(id)a3;
- (NSArray)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4;
- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSArray)initWithSet:(id)a3;
- (NSArray)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes;
- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr;
- (NSArray)sortedArrayUsingFunction:(NSInteger (__cdecl *)comparator context:;
- (NSArray)sortedArrayUsingSelector:(SEL)comparator;
- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (NSArray)subarrayWithRange:(NSRange)range;
- (NSEnumerator)objectEnumerator;
- (NSEnumerator)reverseObjectEnumerator;
- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSString)componentsJoinedByString:(NSString *)separator;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (NSUInteger)count;
- (NSUInteger)indexOfObject:(id)anObject;
- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp;
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObjectPassingTest:(void *)predicate;
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5;
- (id)allObjects;
- (id)arrayByApplyingSelector:(SEL)a3;
- (id)arrayByExcludingObjectsInArray:(id)a3;
- (id)arrayByExcludingToObjectsInArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)firstObjectCommonWithArray:(NSArray *)otherArray;
- (id)indexesOfObject:(id)a3;
- (id)indexesOfObject:(id)a3 inRange:(_NSRange)a4;
- (id)indexesOfObjectIdenticalTo:(id)a3;
- (id)indexesOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectPassingTest:(id)a3;
- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectsPassingTest:(id)a3;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)reversedArray;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (unint64_t)_cfTypeID;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)hash;
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getObjects:(id *)objects;
- (void)getObjects:(id *)objects range:(NSRange)range;
- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;
@end

@implementation NSArray

- (id)firstObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  id result = [(NSArray *)self count];
  if (result)
  {
    return [(NSArray *)self objectAtIndex:0];
  }
  return result;
}

- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v50 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v35 = _os_log_pack_size();
    v37 = (char *)&v49 - ((MEMORY[0x1F4188790](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136315138;
    *(void *)(v38 + 4) = "-[NSArray initWithArray:range:copyItems:]";
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSArray initWithArray:range:copyItems:]");
    v40 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v37 size:v35];
    objc_exception_throw(v40);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      uint64_t v26 = _os_log_pack_size();
      v28 = (char *)&v49 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      double v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSArray initWithArray:range:copyItems:]", location, length);
      CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v30, "-[NSArray initWithArray:range:copyItems:]", location, length);
      v32 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v32);
    }
    uint64_t v41 = _os_log_pack_size();
    v43 = (char *)&v49 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    uint64_t v45 = v12 - 1;
    double v46 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSArray initWithArray:range:copyItems:]", location, length, v45);
    CFStringRef v47 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v46, "-[NSArray initWithArray:range:copyItems:]", location, length, v45);
    v48 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v47) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v48);
  }
  if (length >> 60)
  {
    CFStringRef v33 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    v34 = +[NSException exceptionWithName:@"NSGenericException" reason:v33 userInfo:0];
    CFRelease(v33);
    objc_exception_throw(v34);
  }
  if (length <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v13, v11);
  v16 = (id *)((char *)&v49 - v15);
  size_t v49 = 0;
  if (length >= 0x101)
  {
    v16 = (id *)_CFCreateArrayStorage(v14, 0, &v49);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v49, v50);
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
  if (v17)
  {
    if (length)
    {
      NSUInteger v20 = length;
      v21 = v17;
      do
      {
        if (((unint64_t)*v21 & 0x8000000000000000) == 0) {
          id v22 = *v21;
        }
        ++v21;
        --v20;
      }
      while (v20);
    }
    v23 = [(NSArray *)self _initByAdoptingBuffer:v17 count:length size:length];
  }
  else
  {
    v23 = [(NSArray *)self initWithObjects:v16 count:length];
  }
  v24 = v23;
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  return v24;
}

- (BOOL)isNSArray__
{
  return 1;
}

- (id)lastObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  id result = [(NSArray *)self count];
  if (result)
  {
    return [(NSArray *)self objectAtIndex:(char *)result - 1];
  }
  return result;
}

+ (NSArray)arrayWithObjects:(id *)objects count:(NSUInteger)cnt
{
  v4 = (void *)[objc_alloc((Class)a1) initWithObjects:objects count:cnt];

  return (NSArray *)v4;
}

+ (NSArray)array
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithObjects:0 count:0];

  return (NSArray *)v2;
}

+ (NSArray)arrayWithObject:(id)anObject
{
  Array = (void *)__createArray(objc_alloc((Class)a1), (uint64_t)anObject);

  return (NSArray *)Array;
}

+ (NSArray)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSArray == a1)
  {
    return (NSArray *)__NSArrayImmutablePlaceholder();
  }
  else if (NSMutableArray == a1)
  {
    return (NSArray *)__NSArrayMutablePlaceholder();
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSArray;
    return (NSArray *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (unint64_t)_cfTypeID
{
  return 19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v6 = [(NSArray *)self countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(self);
        }
        if (*(id *)(*((void *)&v14 + 1) + 8 * v10) == anObject) {
          return v8 + v10;
        }
        ++v10;
      }
      while (v7 != v10);
      unint64_t v7 = [(NSArray *)self countByEnumeratingWithState:&v14 objects:v13 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsObject:(id)anObject
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(self);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * i) == anObject || (objc_msgSend(anObject, "isEqual:") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }
      unint64_t v7 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
      LOBYTE(v6) = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6 = a5;
  v22[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)v22 - ((MEMORY[0x1F4188790](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSArray countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = v6;
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSArray countByEnumeratingWithState:objects:count:]", v6);
    goto LABEL_21;
  }
  if (a5 >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)v22 - ((MEMORY[0x1F4188790](v14, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "-[NSArray countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = v6;
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSArray countByEnumeratingWithState:objects:count:]", v6);
LABEL_21:
    v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v16 size:v14];
    objc_exception_throw(v21);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  unint64_t var0 = a3->var0;
  if (a3->var0 == -1) {
    return 0;
  }
  if (var0)
  {
    NSUInteger v11 = a3->var3[0];
  }
  else
  {
    a3->var2 = a3->var3;
    NSUInteger v11 = [(NSArray *)self count];
    a3->var3[0] = v11;
    unint64_t var0 = a3->var0;
  }
  a3->var1 = a4;
  if (v11 - var0 < v6) {
    unint64_t v6 = v11 - var0;
  }
  if (v6)
  {
    -[NSArray getObjects:range:](self, "getObjects:range:", a4);
    unint64_t var0 = a3->var0;
  }
  unint64_t v12 = var0 + v6;
  if (v11 <= var0 + v6) {
    unint64_t v12 = -1;
  }
  a3->unint64_t var0 = v12;
  return v6;
}

- (NSUInteger)indexOfObject:(id)anObject
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v6 = [(NSArray *)self countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v15;
  while (2)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v8 + v7;
    do
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(self);
      }
      if (*(id *)(*((void *)&v14 + 1) + 8 * v10) == anObject || (objc_msgSend(anObject, "isEqual:") & 1) != 0) {
        return v8 + v10;
      }
      ++v10;
    }
    while (v7 != v10);
    unint64_t v7 = [(NSArray *)self countByEnumeratingWithState:&v14 objects:v13 count:16];
    NSUInteger result = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = v11;
    if (v7) {
      continue;
    }
    break;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    int v6 = _NSIsNSArray((uint64_t)a3);
    if (v6)
    {
      LOBYTE(v6) = [(NSArray *)self isEqualToArray:a3];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self objectAtIndex:idx];
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self descriptionWithLocale:locale indent:0];
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self count];
}

+ (NSArray)arrayWithArray:(NSArray *)array
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);

  return (NSArray *)v3;
}

- (NSArray)initWithArray:(NSArray *)array copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  NSUInteger v7 = [(NSArray *)array count];

  return -[NSArray initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, v7, v4);
}

- (BOOL)isEqualToArray:(NSArray *)otherArray
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2);
  int v6 = (void *)v5;
  NSUInteger v7 = (void *)v4;
  v24[256] = *(void *)off_1ECE0A5B0;
  if (v5 && (_NSIsNSArray(v5) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    long long v17 = &v23[-((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray isEqualToArray:]";
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSArray isEqualToArray:]");
    uint64_t v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(v7, v3, __CFTSANTagMutableArray);
  }
  LOBYTE(v8) = v6 == v7;
  if (v6 != v7 && v6)
  {
    unint64_t v9 = [v7 count];
    if ([v6 count] == v9)
    {
      if (v9)
      {
        unint64_t v10 = 0;
        if (v9 >= 0x100) {
          uint64_t v11 = 256;
        }
        else {
          uint64_t v11 = v9;
        }
        while (1)
        {
          objc_msgSend(v7, "getObjects:range:", v24, v10, v11);
          objc_msgSend(v6, "getObjects:range:", v23, v10, v11);
          if (v11) {
            break;
          }
LABEL_17:
          v10 += v11;
          if (v9 < v10 + v11) {
            uint64_t v11 = v9 - v10;
          }
          if (v9 <= v10) {
            goto LABEL_20;
          }
        }
        unint64_t v12 = (id *)v23;
        long long v13 = (id *)v24;
        uint64_t v14 = v11;
        while (1)
        {
          if (*v13 != *v12)
          {
            int v8 = objc_msgSend(*v13, "isEqual:");
            if (!v8) {
              break;
            }
          }
          ++v12;
          ++v13;
          if (!--v14) {
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_20:
        LOBYTE(v8) = 1;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (NSArray)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
  uint64_t v28 = *(void *)off_1ECE0A5B0;
  if (otherArray && (_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    v21 = (char *)&v27 - ((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSArray arrayByAddingObjectsFromArray:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSArray arrayByAddingObjectsFromArray:]");
    v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v21 size:v19];
    objc_exception_throw(v24);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)otherArray count];
  if (v6)
  {
    NSUInteger v7 = v6;
    NSUInteger v8 = [(NSArray *)self count];
    unint64_t v9 = v8 + v7;
    if ((v8 + v7) >> 60)
    {
      CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8 + v7);
      uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
      CFRelease(v25);
      objc_exception_throw(v26);
    }
    NSUInteger v10 = v8;
    size_t v27 = 0;
    if (v9 <= 1) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = v8 + v7;
    }
    unint64_t v12 = (id *)_CFCreateArrayStorage(v11, 0, &v27);
    if (v10) {
      -[NSArray getObjects:range:](self, "getObjects:range:", v12, 0, v10, v27, v28);
    }
    -[NSArray getObjects:range:](otherArray, "getObjects:range:", &v12[v10], 0, v7, v27);
    if (v12)
    {
      if (v9)
      {
        long long v13 = v12;
        unint64_t v14 = v9;
        do
        {
          id v15 = *v13++;
          --v14;
        }
        while (v14);
      }
      uint64_t v16 = [[NSArray alloc] _initByAdoptingBuffer:v12 count:v9 size:v9];
    }
    else
    {
      uint64_t v16 = [[NSArray alloc] initWithObjects:0 count:v9];
    }
    return v16;
  }
  else
  {
    long long v17 = self;
    return v17;
  }
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSArray enumerateObjectsUsingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSArray enumerateObjectsUsingBlock:]");
    unint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  [(NSArray *)self enumerateObjectsWithOptions:0 usingBlock:block];
}

- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp
{
  v53 = self;
  uint64_t v54 = *(void *)off_1ECE0A5B0;
  if (!obj)
  {
    uint64_t v38 = _os_log_pack_size();
    CFStringRef v39 = (char *)&v51 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringRef v41 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]");
    goto LABEL_58;
  }
  if (!cmp)
  {
    uint64_t v38 = _os_log_pack_size();
    CFStringRef v39 = (char *)&v51 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v42 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v42 = 136315138;
    *(void *)(v42 + 4) = "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringRef v41 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]");
LABEL_58:
    v43 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v41) userInfo:0 osLogPack:v39 size:v38];
    objc_exception_throw(v43);
  }
  NSUInteger length = r.length;
  NSUInteger location = r.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(v53, v6, __CFTSANTagMutableArray);
  }
  unint64_t v13 = [(NSArray *)v53 count];
  if ((location & 0x8000000000000000) != 0
    || (length & 0x8000000000000000) != 0
    || (NSUInteger v14 = location + length, v13 < location + length))
  {
    if (v13)
    {
      unint64_t v47 = v13;
      uint64_t v33 = _os_log_pack_size();
      v34 = (char *)&v51 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v48, (uint64_t)"-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length, --v47);
      CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v49, "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length, v47);
    }
    else
    {
      uint64_t v33 = _os_log_pack_size();
      v34 = (char *)&v51 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v35 = _os_log_pack_fill();
      double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v35, (uint64_t)"-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length);
      CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v36, "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length);
    }
    uint64_t v50 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v34 size:v33];
    objc_exception_throw(v50);
  }
  NSBinarySearchingOptions v15 = opts & 0x300;
  if (v15 == 768)
  {
    uint64_t v44 = __CFExceptionProem((objc_class *)v53, a2);
    CFStringRef v45 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: both NSBinarySearchingFirstEqual and NSBinarySearchingLastEqual options cannot be specified", v44);
    double v46 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v45) userInfo:0];
    objc_exception_throw(v46);
  }
  if (!length)
  {
    BOOL v30 = (opts & 0x400) == 0;
    NSUInteger v31 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_43;
  }
  NSBinarySearchingOptions v52 = opts & 0x200;
  if (length < 0x101) {
    goto LABEL_15;
  }
  NSUInteger v16 = v14 - 1;
  uint64_t v17 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, [(NSArray *)v53 objectAtIndex:v14 - 1], obj);
  if (v17 < 0)
  {
    NSUInteger v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_47:
    if ((opts & 0x400) != 0) {
      return location + length;
    }
    else {
      return v16;
    }
  }
  if (!(v17 | opts & 0x100)) {
    goto LABEL_47;
  }
  uint64_t v18 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, obj, [(NSArray *)v53 objectAtIndex:location]);
  if (v18 < 0)
  {
    NSUInteger v31 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_53:
    BOOL v30 = (opts & 0x400) == 0;
LABEL_43:
    if (v30) {
      return v31;
    }
    else {
      return location;
    }
  }
  if (!(v18 | v52))
  {
    NSUInteger v31 = location;
    goto LABEL_53;
  }
LABEL_15:
  NSBinarySearchingOptions v51 = opts;
  char v19 = flsl(length);
  uint64_t v20 = 0;
  char v21 = 0;
  uint64_t v22 = 2 << v19;
  do
  {
    if (v22 >= 0) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = v22 + 1;
    }
    NSUInteger v24 = location + (v23 >> 1);
    if (v24 < v14)
    {
      uint64_t v20 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, [(NSArray *)v53 objectAtIndex:location + (v23 >> 1)], obj);
      if (!(v20 | v15)) {
        return v24;
      }
      if (v20) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = v52 == 0;
      }
      v21 |= v20 == 0;
      BOOL v26 = !v25 || v20 <= -1;
      if (v26) {
        location += v23 >> 1;
      }
    }
    BOOL v26 = v22 <= 1;
    uint64_t v22 = v23 >> 1;
  }
  while (!v26);
  LODWORD(v27) = v52 != 0;
  if (v20) {
    LODWORD(v27) = 0;
  }
  if (v20 < 0) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = v27;
  }
  NSUInteger v28 = location + v27;
  NSUInteger v29 = location + ((unint64_t)v20 >> 63);
  if ((v21 & 1) == 0) {
    NSUInteger v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((v51 & 0x400) != 0) {
    return v28;
  }
  else {
    return v29;
  }
}

- (void)getObjects:(id *)objects range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v7 = objects;
  v25[1] = *(void *)off_1ECE0A5B0;
  if (!objects && range.length)
  {
    uint64_t v10 = _os_log_pack_size();
    unint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSArray getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSArray getObjects:range:]", length);
    goto LABEL_13;
  }
  if (range.length >> 61)
  {
    uint64_t v10 = _os_log_pack_size();
    unint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSArray getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSArray getObjects:range:]", length);
LABEL_13:
    NSBinarySearchingOptions v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v21 = v9;
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSArray getObjects:range:]", location, length, --v21);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v23, "-[NSArray getObjects:range:]", location, length, v21);
    }
    else
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSArray getObjects:range:]", location, length);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v19, "-[NSArray getObjects:range:]", location, length);
    }
    NSUInteger v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v17 size:v16];
    objc_exception_throw(v24);
  }
  for (; length; --length)
    *v7++ = [(NSArray *)self objectAtIndex:location++];
}

uint64_t __56__NSArray_sortedArrayFromRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8 * a2), *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

id __36__NSArray_sortedArrayUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

uint64_t __44__NSArray_sortedArrayUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

uint64_t __28__NSArray_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "getObjects:range:", *(void *)(a1 + 48) + 8 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  uint64_t v6 = +[NSArray allocWithZone:a3];
  NSUInteger v7 = [(NSArray *)self count];

  return -[NSArray initWithArray:range:copyItems:](v6, "initWithArray:range:copyItems:", self, 0, v7, 0);
}

- (NSArray)sortedArrayUsingFunction:(NSInteger (__cdecl *)comparator context:
{
  v11[6] = *(void *)off_1ECE0A5B0;
  if (!comparator)
  {
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: function pointer cannot be NULL", context, "-[NSArray sortedArrayUsingFunction:context:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  v11[0] = off_1ECE0A5A0;
  v11[1] = 3221225472;
  v11[2] = __44__NSArray_sortedArrayUsingFunction_context___block_invoke;
  v11[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v11[4] = comparator;
  v11[5] = context;
  return [(NSArray *)self sortedArrayWithOptions:0 usingComparator:v11];
}

- (NSArray)sortedArrayUsingSelector:(SEL)comparator
{
  v7[5] = *(void *)off_1ECE0A5B0;
  if (!comparator) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __36__NSArray_sortedArrayUsingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v7[4] = comparator;
  return [(NSArray *)self sortedArrayWithOptions:0 usingComparator:v7];
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  v49[1] = *(void *)off_1ECE0A5B0;
  if (!a5)
  {
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)&v47[-1] - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSArray sortedArrayFromRange:options:usingComparator:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSArray sortedArrayFromRange:options:usingComparator:]");
    double v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  char v7 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v11 = [(NSArray *)self count];
  if (length && (NSUInteger v13 = v11) != 0)
  {
    if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
    {
      uint64_t v37 = _os_log_pack_size();
      CFStringRef v39 = (char *)&v47[-1] - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v40 = _os_log_pack_fill();
      double v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSArray sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
      CFStringRef v42 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v41, "-[NSArray sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
      v43 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v42) userInfo:0 osLogPack:v39 size:v37];
      objc_exception_throw(v43);
    }
    if (v11 == 1)
    {
      uint64_t v14 = self;
      return v14;
    }
    else if (length == 1)
    {
      id v16 = [(NSArray *)self objectAtIndex:location];
      return +[NSArray arrayWithObject:v16];
    }
    else
    {
      if (length >> 60)
      {
        CFStringRef v44 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
        CFStringRef v45 = +[NSException exceptionWithName:@"NSGenericException" reason:v44 userInfo:0];
        CFRelease(v44);
        objc_exception_throw(v45);
      }
      MEMORY[0x1F4188790](v11, v12);
      uint64_t v18 = (char *)&v47[-1] - v17;
      v49[0] = 0;
      if (length >= 0x101)
      {
        uint64_t v18 = (char *)_CFCreateArrayStorage(length, 0, v49);
        double v19 = v18;
      }
      else
      {
        double v19 = 0;
      }
      size_t v48 = 0;
      CFStringRef v20 = (id *)_CFCreateArrayStorage(length, 0, &v48);
      uint64_t v21 = -[NSArray getObjects:range:](self, "getObjects:range:", v18, location, length);
      MEMORY[0x1F4188790](v21, v22);
      NSUInteger v24 = (char *)&v47[-1] - v23;
      BOOL v25 = (char *)&v47[-1] - v23;
      if (length > 0x1000) {
        BOOL v25 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
      }
      v47[0] = off_1ECE0A5A0;
      v47[1] = 3221225472;
      v47[2] = __56__NSArray_sortedArrayFromRange_options_usingComparator___block_invoke;
      v47[3] = &unk_1ECDABB78;
      v47[4] = a5;
      v47[5] = v18;
      CFSortIndexes((uint64_t)v25, length, v7, (uint64_t)v47);
      for (uint64_t i = 0; i != length; ++i)
        v20[i] = *(id *)&v18[8 * *(void *)&v25[8 * i]];
      if (v24 != v25) {
        free(v25);
      }
      if ((uint64_t)length >= 1)
      {
        uint64_t v27 = v20;
        NSUInteger v28 = length;
        do
        {
          id v29 = *v27++;
          --v28;
        }
        while (v28);
      }
      id v30 = [[NSArray alloc] _initByAdoptingBuffer:v20 count:length size:length];
      free(v19);
      return v30;
    }
  }
  else
  {
    return +[NSArray array];
  }
}

- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (!cmptr)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = (char *)v16 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSArray sortedArrayWithOptions:usingComparator:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSArray sortedArrayWithOptions:usingComparator:]");
    NSBinarySearchingOptions v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = [(NSArray *)self count];

  return (NSArray *)-[NSArray sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, v8, opts, cmptr);
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  v38[1] = *(void *)off_1ECE0A5B0;
  if (level >= 0x64) {
    NSUInteger v6 = 100;
  }
  else {
    NSUInteger v6 = level;
  }
  NSUInteger v7 = [(NSArray *)self count];
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
    NSUInteger v28 = +[NSException exceptionWithName:@"NSGenericException" reason:v27 userInfo:0];
    CFRelease(v27);
    objc_exception_throw(v28);
  }
  if (v7 <= 1) {
    NSUInteger v7 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v7, v8);
  uint64_t v12 = (uint64_t *)((char *)&v29 - v11);
  v38[0] = 0;
  if (v9 >= 0x101)
  {
    uint64_t v12 = (uint64_t *)_CFCreateArrayStorage(v10, 0, v38);
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  -[NSArray getObjects:range:](self, "getObjects:range:", v12, 0, v9);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  int v37 = -1;
  v34[1] = 3221225472;
  uint64_t v33 = v35;
  v34[0] = off_1ECE0A5A0;
  v35[0] = __40__NSArray_descriptionWithLocale_indent___block_invoke;
  v35[1] = &unk_1ECDFDEB0;
  v35[2] = v36;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  CFAllocatorRef v31 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  uint64_t v32 = v13;
  id v30 = (void *)MEMORY[0x185311AE0]();
  if (v9)
  {
    NSBinarySearchingOptions v15 = v12;
    unint64_t v16 = v9;
    do
    {
      uint64_t v17 = (void *)*v15;
      if (_NSIsNSString(*v15))
      {
        uint64_t v18 = [v17 _stringRepresentation];
      }
      else if ((_NSIsNSDictionary((uint64_t)v17) & 1) != 0 || _NSIsNSArray((uint64_t)v17))
      {
        uint64_t v18 = [v17 descriptionWithLocale:locale indent:v6 + 1];
      }
      else if (_NSIsNSData((uint64_t)v17))
      {
        uint64_t v18 = [v17 description];
      }
      else
      {
        uint64_t v20 = [v17 description];
        uint64_t v18 = ((uint64_t (*)(void *, uint64_t))v35[0])(v34, v20);
      }
      if (v18) {
        double v19 = (__CFString *)v18;
      }
      else {
        double v19 = @"(null)";
      }
      *v15++ = (uint64_t)v19;
      --v16;
    }
    while (v16);
  }
  uint64_t v21 = v32;
  for (CFMutableStringRef i = CFStringCreateMutable(v31, 0); v6; --v6)
    CFStringAppend(i, @"    ");
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @"(\n");
  unint64_t v23 = 0;
  while (v9 != v23)
  {
    CFStringAppend(Mutable, i);
    CFStringAppend(Mutable, @"    ");
    CFStringAppend(Mutable, (CFStringRef)v12[v23++]);
    if (v23 >= v9) {
      CFStringRef v24 = @"\n";
    }
    else {
      CFStringRef v24 = @",\n";
    }
    CFStringAppend(Mutable, v24);
  }
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @""));
  CFRelease(i);
  BOOL v25 = Mutable;
  _Block_object_dispose(v36, 8);
  free(v21);
  return v25;
}

uint64_t __40__NSArray_descriptionWithLocale_indent___block_invoke(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -1) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_lookUpClass("NSString") != 0;
  }
  if (!_CFExecutableLinkedOnOrAfter(6uLL) || !*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    return (uint64_t)a2;
  }

  return [a2 _stringRepresentation];
}

- (NSString)componentsJoinedByString:(NSString *)separator
{
  CFStringRef v4 = (const __CFString *)separator;
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  if (separator && (_NSIsNSString((uint64_t)separator) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSArray componentsJoinedByString:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: string argument is not an NSString", "-[NSArray componentsJoinedByString:]");
    uint64_t v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:&v18[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v14];
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (!v4) {
    CFStringRef v4 = &stru_1ECE10768;
  }
  unint64_t v6 = [(NSArray *)self count];
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v8 = [(NSArray *)self countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(self);
        }
        CFStringAppend(Mutable, (CFStringRef)[*(id *)(*((void *)&v19 + 1) + 8 * i) description]);
        if (v10 + 1 + i < v6) {
          CFStringAppend(Mutable, v4);
        }
      }
      v10 += v9;
      unint64_t v9 = [(NSArray *)self countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v9);
  }
  return (NSString *)Mutable;
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self descriptionWithLocale:0 indent:0];
}

- (NSArray)initWithObjects:(id)firstObj
{
  va_start(va, firstObj);
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  va_list v21 = 0;
  id v22 = firstObj;
  uint64_t v5 = __NSArrayImmutablePlaceholder();
  if (firstObj)
  {
    unint64_t v7 = 0;
    va_copy(v21, va);
    do
    {
      unint64_t v8 = v21;
      v21 += 8;
      ++v7;
    }
    while (*v8);
    if (v5 == (__objc2_class **)self)
    {
      va_copy(v21, va);
      return (NSArray *)__NSArrayI_new(&v22, (uint64_t *)va, v7, 0);
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
    if (v5 == (__objc2_class **)self) {
      return (NSArray *)&__NSArray0__struct;
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
  uint64_t v14 = (size_t *)((char *)&v20 - v13);
  size_t v20 = 0;
  if (v7 >= 0x101)
  {
    uint64_t v14 = _CFCreateArrayStorage(v12, 0, &v20);
    va_copy(v21, va);
    *uint64_t v14 = firstObj;
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
    if (!v7) {
      goto LABEL_19;
    }
    va_copy(v21, va);
    *uint64_t v14 = firstObj;
    if (v7 == 1) {
      goto LABEL_19;
    }
  }
  for (uint64_t i = 1; i != v7; ++i)
  {
    uint64_t v17 = v21;
    v21 += 8;
    v14[i] = *v17;
  }
LABEL_19:
  uint64_t v18 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v20, v21, v22, v23);
  free(v15);
  return v18;
}

- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!cmptr)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v14 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSArray sortedArrayUsingComparator:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSArray sortedArrayUsingComparator:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];

  return (NSArray *)-[NSArray sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, v6, 0, cmptr);
}

- (NSEnumerator)objectEnumerator
{
  uint64_t v2 = [[__NSFastEnumerationEnumerator alloc] initWithObject:self];

  return (NSEnumerator *)v2;
}

- (NSEnumerator)reverseObjectEnumerator
{
  uint64_t v2 = [[__NSArrayReverseEnumerator alloc] initWithObject:self];

  return (NSEnumerator *)v2;
}

- (NSUInteger)indexOfObjectPassingTest:(void *)predicate
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray indexOfObjectPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray indexOfObjectPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self indexOfObjectWithOptions:0 passingTest:predicate];
}

- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray indexesOfObjectsPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray indexesOfObjectsPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self indexesOfObjectsWithOptions:0 passingTest:predicate];
}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v20[1] = *(void *)off_1ECE0A5B0;
  if (!s)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_14;
  }
  if (!block)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
LABEL_14:
    long long v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v11 = opts & 0xEFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x1000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v11 | 0x1000000000000000, s);

  __NSArrayEnumerate(self, (uint64_t)block, v12, s);
}

- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSArray indexesOfObjectsWithOptions:passingTest:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray indexesOfObjectsWithOptions:passingTest:]");
    uint64_t v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:(char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) size:v12];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x4000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x4000000000000000, 0);

  return (NSIndexSet *)__NSArrayGetIndexesPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSArray indexOfObjectWithOptions:passingTest:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray indexOfObjectWithOptions:passingTest:]");
    uint64_t v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:(char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) size:v12];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v9 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x2000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2000000000000000, 0);

  return __NSArrayGetIndexPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v13[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSArray enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSArray enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
    objc_exception_throw(v12);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  if ((opts & 2) != 0) {
    opts &= ~1uLL;
  }
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, opts, 0);

  __NSArrayEnumerate(self, (uint64_t)block, opts, 0);
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  v57[1] = *(void *)off_1ECE0A5B0;
  if (!indexes)
  {
    uint64_t v20 = _os_log_pack_size();
    id v22 = (char *)&v55[-1] - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSArray objectsAtIndexes:]");
    BOOL v25 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v22 size:v20];
    objc_exception_throw(v25);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v26 = _os_log_pack_size();
    NSUInteger v28 = (char *)&v55[-1] - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray objectsAtIndexes:]");
    CFAllocatorRef v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v32 = _os_log_pack_size();
    uint64_t v34 = (char *)&v55[-1] - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray objectsAtIndexes:]");
    int v37 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v36) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v37);
  }
  NSUInteger v6 = [(NSArray *)self count];
  uint64_t v7 = [0 count];
  NSUInteger v8 = [(NSIndexSet *)indexes lastIndex];
  uint64_t v9 = v8;
  if ((v8 & 0x8000000000000000) != 0)
  {
    NSUInteger v10 = v7 + v6;
    goto LABEL_23;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = v7 + v6;
    if (v10 <= v8)
    {
LABEL_23:
      if (!v10)
      {
        uint64_t v38 = _os_log_pack_size();
        uint64_t v40 = (char *)&v55[-1] - ((MEMORY[0x1F4188790](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v41 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v41 = 136315394;
        *(void *)(v41 + 4) = "-[NSArray objectsAtIndexes:]";
        *(_WORD *)(v41 + 12) = 2048;
        *(void *)(v41 + 14) = v9;
        CFStringRef v42 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty array", "-[NSArray objectsAtIndexes:]", v9);
        v43 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v42) userInfo:0 osLogPack:v40 size:v38];
        objc_exception_throw(v43);
      }
      uint64_t v44 = _os_log_pack_size();
      double v46 = (char *)&v55[-1] - ((MEMORY[0x1F4188790](v44, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v47 = _os_log_pack_fill();
      uint64_t v48 = v10 - 1;
      double v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v47, (uint64_t)"-[NSArray objectsAtIndexes:]", v9, v48);
      CFStringRef v50 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v49, "-[NSArray objectsAtIndexes:]", v9, v48);
      NSBinarySearchingOptions v51 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v50) userInfo:0 osLogPack:v46 size:v44];
      objc_exception_throw(v51);
    }
  }
  unint64_t v11 = [(NSIndexSet *)indexes count];
  unint64_t v12 = v11;
  if (v11 >> 60)
  {
    CFStringRef v52 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    v53 = +[NSException exceptionWithName:@"NSGenericException" reason:v52 userInfo:0];
    CFRelease(v52);
    objc_exception_throw(v53);
  }
  v57[0] = 0;
  if (v11 <= 1) {
    unint64_t v11 = 1;
  }
  uint64_t v13 = (id *)_CFCreateArrayStorage(v11, 0, v57);
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v56[3] = 0;
  v55[0] = off_1ECE0A5A0;
  v55[1] = 3221225472;
  v55[2] = __28__NSArray_objectsAtIndexes___block_invoke;
  v55[3] = &unk_1ECDFDF00;
  v55[5] = v56;
  v55[6] = v13;
  v55[4] = self;
  [(NSIndexSet *)indexes __forwardEnumerateRanges:v55];
  if (v13)
  {
    if (v12)
    {
      CFStringRef v14 = v13;
      unint64_t v15 = v12;
      do
      {
        id v16 = *v14++;
        --v15;
      }
      while (v15);
    }
    uint64_t v17 = [[NSArray alloc] _initByAdoptingBuffer:v13 count:v12 size:v12];
  }
  else
  {
    uint64_t v17 = [[NSArray alloc] initWithObjects:0 count:v12];
  }
  uint64_t v18 = v17;
  _Block_object_dispose(v56, 8);
  return v18;
}

- (NSArray)arrayByAddingObject:(id)anObject
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (!anObject)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v17 = (char *)&v23 - ((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray arrayByAddingObject:]";
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSArray arrayByAddingObject:]");
    uint64_t v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];
  unint64_t v7 = v6 + 1;
  if ((v6 + 1) >> 60)
  {
    CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6 + 1);
    id v22 = +[NSException exceptionWithName:@"NSGenericException" reason:v21 userInfo:0];
    CFRelease(v21);
    objc_exception_throw(v22);
  }
  unint64_t v8 = v6;
  size_t v23 = 0;
  if (v7 <= 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = v6 + 1;
  }
  NSUInteger v10 = (id *)_CFCreateArrayStorage(v9, 0, &v23);
  -[NSArray getObjects:range:](self, "getObjects:range:", v10, 0, v8, v23, v24);
  v10[v8] = anObject;
  if (v8 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v11 = v10;
    unint64_t v12 = v7;
    do
    {
      id v13 = *v11++;
      --v12;
    }
    while (v12);
  }
  return (NSArray *)[[NSArray alloc] _initByAdoptingBuffer:v10 count:v7 size:v7];
}

+ (NSArray)arrayWithObjects:(id)firstObj
{
  va_start(va, firstObj);
  v22[1] = *(id *)off_1ECE0A5B0;
  va_list v21 = 0;
  v22[0] = firstObj;
  if (firstObj)
  {
    unint64_t v5 = 0;
    va_copy(v21, va);
    do
    {
      NSUInteger v6 = v21;
      v21 += 8;
      ++v5;
    }
    while (*v6);
    if (__NSPlaceholderArray == a1)
    {
      va_copy(v21, va);
      uint64_t v17 = (NSArray *)__NSArrayI_new(v22, (uint64_t *)va, v5, 0);
      goto LABEL_21;
    }
    if (v5 >> 60)
    {
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
      unint64_t v8 = +[NSException exceptionWithName:@"NSGenericException" reason:v7 userInfo:0];
      CFRelease(v7);
      objc_exception_throw(v8);
    }
  }
  else
  {
    if (__NSPlaceholderArray == a1) {
      return (NSArray *)&__NSArray0__struct;
    }
    unint64_t v5 = 0;
  }
  if (v5 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v5;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v9, a2);
  unint64_t v12 = (size_t *)((char *)&v20 - v11);
  size_t v20 = 0;
  if (v5 >= 0x101)
  {
    unint64_t v12 = _CFCreateArrayStorage(v10, 0, &v20);
    va_copy(v21, va);
    *unint64_t v12 = firstObj;
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
    if (!v5) {
      goto LABEL_19;
    }
    va_copy(v21, va);
    *unint64_t v12 = firstObj;
    if (v5 == 1) {
      goto LABEL_19;
    }
  }
  for (uint64_t i = 1; i != v5; ++i)
  {
    uint64_t v15 = v21;
    v21 += 8;
    v12[i] = *v15;
  }
LABEL_19:
  id v16 = objc_alloc((Class)a1);
  uint64_t v17 = (NSArray *)objc_msgSend(v16, "initWithObjects:count:", v12, v5, v20);
  free(v13);
LABEL_21:
  uint64_t v18 = v17;
  return v17;
}

+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v20[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a4;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "+[NSArray newArrayWithObjects:count:]", a4);
    goto LABEL_26;
  }
  if (a4 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a4;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "+[NSArray newArrayWithObjects:count:]", a4);
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
    uint64_t v10 = v6;
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v10;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "+[NSArray newArrayWithObjects:count:]", v10);
LABEL_26:
    uint64_t v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v15);
  }
LABEL_8:
  if (NSArray == a1)
  {
    if (a4 == 1)
    {
      unint64_t v8 = *a3;
      return __NSSingleObjectArrayI_new((uint64_t)v8, 1);
    }
    else if (a4)
    {
      return __NSArrayI_new((id *)a3, 0, a4, 1);
    }
    else
    {
      return &__NSArray0__struct;
    }
  }
  else
  {
    if (NSMutableArray != a1)
    {
      uint64_t v9 = __CFLookUpClass("NSArray");
      __CFRequireConcreteImplementation(v9, (objc_class *)a1, a2);
    }
    return __NSArrayM_new(a3, a4, 1);
  }
}

- (NSArray)subarrayWithRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v30[1] = *(void *)off_1ECE0A5B0;
  NSUInteger v7 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v7 < location + length)
  {
    if (!v7)
    {
      uint64_t v13 = _os_log_pack_size();
      uint64_t v15 = (char *)v30 - ((MEMORY[0x1F4188790](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray subarrayWithRange:]", location, length);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v17, "-[NSArray subarrayWithRange:]", location, length);
      uint64_t v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v15 size:v13];
      objc_exception_throw(v19);
    }
    NSUInteger v22 = v7;
    uint64_t v23 = _os_log_pack_size();
    BOOL v25 = (char *)v30 - ((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = _os_log_pack_fill();
    double v27 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v26, (uint64_t)"-[NSArray subarrayWithRange:]", location, length, --v22);
    CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v27, "-[NSArray subarrayWithRange:]", location, length, v22);
    uint64_t v29 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v25 size:v23];
    objc_exception_throw(v29);
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    if (length) {
      goto LABEL_6;
    }
  }
  else if (length)
  {
LABEL_6:
    if (length >> 60)
    {
      CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
      va_list v21 = +[NSException exceptionWithName:@"NSGenericException" reason:v20 userInfo:0];
      CFRelease(v20);
      objc_exception_throw(v21);
    }
    v30[0] = 0;
    unint64_t v8 = (id *)_CFCreateArrayStorage(length, 0, v30);
    -[NSArray getObjects:range:](self, "getObjects:range:", v8, location, length);
    if (v8)
    {
      for (uint64_t i = 0; i != length; ++i)
        id v10 = v8[i];
      uint64_t v11 = [[NSArray alloc] _initByAdoptingBuffer:v8 count:length size:length];
    }
    else
    {
      uint64_t v11 = [[NSArray alloc] initWithObjects:0 count:length];
    }
    return v11;
  }

  return +[NSArray array];
}

- (void)makeObjectsPerformSelector:(SEL)aSelector
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];
  if (v6 > 0x80)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v14 = [(NSArray *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(self);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) performSelector:aSelector];
        }
        unint64_t v14 = [(NSArray *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v14);
    }
  }
  else
  {
    NSUInteger v8 = v6;
    uint64_t v9 = MEMORY[0x1F4188790](v6, v7);
    uint64_t v11 = (void **)&v17[-v10];
    if (v9)
    {
      uint64_t v12 = 0;
      do
      {
        v11[v12] = [(NSArray *)self objectAtIndex:v12];
        ++v12;
      }
      while (v8 != v12);
      for (; v8; --v8)
      {
        uint64_t v13 = *v11++;
        [v13 performSelector:aSelector];
      }
    }
  }
}

- (id)arrayByApplyingSelector:(SEL)a3
{
  uint64_t v31 = *(void *)off_1ECE0A5B0;
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];
  if (v6 >> 60)
  {
    CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    uint64_t v23 = +[NSException exceptionWithName:@"NSGenericException" reason:v22 userInfo:0];
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  uint64_t v10 = (char *)&v24 - v9;
  size_t v25 = 0;
  if (v11 >= 0x101)
  {
    uint64_t v10 = (char *)_CFCreateArrayStorage(v8, 0, &v25);
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = 0;
  unint64_t v14 = [(NSArray *)self countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(self);
        }
        uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) performSelector:a3];
        if (v17) {
          *(void *)&v10[8 * v13++] = v17;
        }
      }
      unint64_t v14 = [(NSArray *)self countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v14);
    if (v12)
    {
      if (v13 >= 1)
      {
        for (uint64_t j = 0; j != v13; ++j)
          id v19 = *(id *)&v12[8 * j];
      }
      goto LABEL_26;
    }
LABEL_27:
    long long v20 = [[NSArray alloc] initWithObjects:v10 count:v13];
    return v20;
  }
  if (!v12) {
    goto LABEL_27;
  }
LABEL_26:
  long long v20 = [[NSArray alloc] _initByAdoptingBuffer:v12 count:v13 size:v13];
  return v20;
}

- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = [(NSArray *)self count];
  if (v8 > 0x80)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v16 = [(NSArray *)self countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(self);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) performSelector:aSelector withObject:argument];
        }
        unint64_t v16 = [(NSArray *)self countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v16);
    }
  }
  else
  {
    NSUInteger v10 = v8;
    uint64_t v11 = MEMORY[0x1F4188790](v8, v9);
    uint64_t v13 = (void **)&v19[-v12];
    if (v11)
    {
      uint64_t v14 = 0;
      do
      {
        v13[v14] = [(NSArray *)self objectAtIndex:v14];
        ++v14;
      }
      while (v10 != v14);
      for (; v10; --v10)
      {
        uint64_t v15 = *v13++;
        [v15 performSelector:aSelector withObject:argument];
      }
    }
  }
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      uint64_t v15 = _os_log_pack_size();
      unint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      uint64_t v21 = v10 - 1;
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSArray indexOfObject:inRange:]", location, length, v21);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSArray indexOfObject:inRange:]", location, length, v21);
    }
    else
    {
      uint64_t v15 = _os_log_pack_size();
      unint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray indexOfObject:inRange:]", location, length);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v18, "-[NSArray indexOfObject:inRange:]", location, length);
    }
    long long v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v16 size:v15];
    objc_exception_throw(v23);
  }
  if (!length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v11 = 0;
  for (NSUInteger i = location; ; ++i)
  {
    id v13 = [(NSArray *)self objectAtIndex:i];
    if (v13 == anObject) {
      break;
    }
    if ([anObject isEqual:v13]) {
      return i;
    }
    ++v11;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v11 + location;
}

- (void)getObjects:(id *)objects
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];
  if (!objects && v6)
  {
    NSUInteger v8 = v6;
    uint64_t v9 = _os_log_pack_size();
    uint64_t v11 = (char *)v18 - ((MEMORY[0x1F4188790](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSArray getObjects:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = v8;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSArray getObjects:]", v8);
    goto LABEL_11;
  }
  if (v6 >> 61)
  {
    NSUInteger v14 = v6;
    uint64_t v9 = _os_log_pack_size();
    uint64_t v11 = (char *)v18 - ((MEMORY[0x1F4188790](v9, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSArray getObjects:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = v14;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSArray getObjects:]", v14);
LABEL_11:
    uint64_t v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v9];
    objc_exception_throw(v17);
  }
  NSUInteger v7 = [(NSArray *)self count];

  -[NSArray getObjects:range:](self, "getObjects:range:", objects, 0, v7);
}

- (NSArray)initWithObject:(id)a3
{
  v4[1] = *(void *)off_1ECE0A5B0;
  v4[0] = a3;
  return [(NSArray *)self initWithObjects:v4 count:1];
}

- (id)arrayByExcludingToObjectsInArray:(id)a3
{
  uint64_t v38 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    long long v27 = (char *)&v31 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSArray arrayByExcludingToObjectsInArray:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSArray arrayByExcludingToObjectsInArray:]");
    long long v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];
  if (v6 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    uint64_t v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  uint64_t v10 = (char *)&v31 - v9;
  size_t v32 = 0;
  if (v11 >= 0x101)
  {
    uint64_t v10 = (char *)_CFCreateArrayStorage(v8, 0, &v32);
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }
  CFStringRef v13 = +[NSSet setWithArray:a3];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = 0;
  unint64_t v15 = [(NSArray *)self countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(self);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if ([(NSSet *)v13 containsObject:v18]) {
          *(void *)&v10[8 * v14++] = v18;
        }
      }
      unint64_t v15 = [(NSArray *)self countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v15);
    if (v12)
    {
      if (v14 >= 1)
      {
        for (uint64_t j = 0; j != v14; ++j)
          id v20 = *(id *)&v12[8 * j];
      }
      goto LABEL_26;
    }
LABEL_27:
    uint64_t v21 = [[NSArray alloc] initWithObjects:v10 count:v14];
    return v21;
  }
  if (!v12) {
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v21 = [[NSArray alloc] _initByAdoptingBuffer:v12 count:v14 size:v14];
  return v21;
}

- (id)arrayByExcludingObjectsInArray:(id)a3
{
  uint64_t v38 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    long long v27 = (char *)&v31 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSArray arrayByExcludingObjectsInArray:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSArray arrayByExcludingObjectsInArray:]");
    long long v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = [(NSArray *)self count];
  if (v6 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    uint64_t v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  uint64_t v10 = (char *)&v31 - v9;
  size_t v32 = 0;
  if (v11 >= 0x101)
  {
    uint64_t v10 = (char *)_CFCreateArrayStorage(v8, 0, &v32);
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }
  CFStringRef v13 = +[NSSet setWithArray:a3];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = 0;
  unint64_t v15 = [(NSArray *)self countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(self);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if (![(NSSet *)v13 containsObject:v18]) {
          *(void *)&v10[8 * v14++] = v18;
        }
      }
      unint64_t v15 = [(NSArray *)self countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v15);
    if (v12)
    {
      if (v14 >= 1)
      {
        for (uint64_t j = 0; j != v14; ++j)
          id v20 = *(id *)&v12[8 * j];
      }
      goto LABEL_26;
    }
LABEL_27:
    uint64_t v21 = [[NSArray alloc] initWithObjects:v10 count:v14];
    return v21;
  }
  if (!v12) {
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v21 = [[NSArray alloc] _initByAdoptingBuffer:v12 count:v14 size:v14];
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  uint64_t ShouldCopy = __NSCollectionsShouldCopy();
  uint64_t v7 = +[NSArray allocWithZone:a3];
  NSUInteger v8 = [(NSArray *)self count];

  return -[NSArray initWithArray:range:copyItems:](v7, "initWithArray:range:copyItems:", self, 0, v8, ShouldCopy);
}

- (id)allObjects
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  unint64_t v4 = [(NSArray *)self count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    CFStringRef v13 = +[NSException exceptionWithName:@"NSGenericException" reason:v12 userInfo:0];
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  NSUInteger v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSArray getObjects:range:](self, "getObjects:range:", v6, 0, v5);
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
    uint64_t v10 = [[NSArray alloc] _initByAdoptingBuffer:v6 count:v5 size:v5];
  }
  else
  {
    uint64_t v10 = [[NSArray alloc] initWithObjects:0 count:v5];
  }
  return v10;
}

- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v20 = v9;
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSArray containsObject:inRange:]", location, length, --v20);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSArray containsObject:inRange:]", location, length, v20);
    }
    else
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray containsObject:inRange:]", location, length);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v18, "-[NSArray containsObject:inRange:]", location, length);
    }
    CFStringRef v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v16 size:v15];
    objc_exception_throw(v23);
  }
  if (length)
  {
    id v10 = [(NSArray *)self objectAtIndex:location];
    if (v10 == a3)
    {
      return 1;
    }
    else
    {
      id v11 = v10;
      unint64_t v12 = 1;
      BOOL v13 = 1;
      do
      {
        if ([a3 isEqual:v11]) {
          break;
        }
        BOOL v13 = v12 < length;
        if (length == v12) {
          break;
        }
        id v11 = [(NSArray *)self objectAtIndex:location + v12++];
      }
      while (v11 != a3);
    }
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)containsObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v19 = v9;
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSArray containsObjectIdenticalTo:inRange:]", location, length, --v19);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v21, "-[NSArray containsObjectIdenticalTo:inRange:]", location, length, v19);
    }
    else
    {
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray containsObjectIdenticalTo:inRange:]", location, length);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v17, "-[NSArray containsObjectIdenticalTo:inRange:]", location, length);
    }
    double v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v22);
  }
  if (!length) {
    return 0;
  }
  if ([(NSArray *)self objectAtIndex:location] == a3) {
    return 1;
  }
  uint64_t v10 = 1;
  do
  {
    NSUInteger v11 = v10;
    if (length == v10) {
      break;
    }
    id v12 = [(NSArray *)self objectAtIndex:location + v10];
    uint64_t v10 = v11 + 1;
  }
  while (v12 != a3);
  return v11 < length;
}

- (BOOL)containsObjectIdenticalTo:(id)a3
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(self);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * v9) == a3)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      unint64_t v6 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
      unint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      uint64_t v14 = _os_log_pack_size();
      long long v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v19 = _os_log_pack_fill();
      uint64_t v20 = v10 - 1;
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSArray countForObject:inRange:]", location, length, v20);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v21, "-[NSArray countForObject:inRange:]", location, length, v20);
    }
    else
    {
      uint64_t v14 = _os_log_pack_size();
      long long v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray countForObject:inRange:]", location, length);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v17, "-[NSArray countForObject:inRange:]", location, length);
    }
    double v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v22);
  }
  for (unint64_t i = 0; length; --length)
  {
    id v12 = [(NSArray *)self objectAtIndex:location];
    if (v12 == a3 || [a3 isEqual:v12]) {
      ++i;
    }
    ++location;
  }
  return i;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v6 = [(NSArray *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0;
  }
  unint64_t v7 = v6;
  unint64_t v8 = 0;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(self);
      }
      if (*(id *)(*((void *)&v13 + 1) + 8 * i) == a3 || objc_msgSend(a3, "isEqual:")) {
        ++v8;
      }
    }
    unint64_t v7 = [(NSArray *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
  }
  while (v7);
  return v8;
}

- (id)firstObjectCommonWithArray:(NSArray *)otherArray
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    if (!otherArray) {
      goto LABEL_4;
    }
  }
  else if (!otherArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSArray firstObjectCommonWithArray:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSArray firstObjectCommonWithArray:]");
    long long v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  unint64_t v6 = +[NSSet setWithArray:otherArray];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v7 = [(NSArray *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  unint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
LABEL_6:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v19 != v9) {
      objc_enumerationMutation(self);
    }
    NSUInteger v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
    if ([(NSSet *)v6 containsObject:v11]) {
      return v11;
    }
    if (v8 == ++v10)
    {
      unint64_t v8 = [(NSArray *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v8) {
        goto LABEL_6;
      }
      return 0;
    }
  }
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v20[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v11 = _os_log_pack_size();
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length);
    }
    long long v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  if (!length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while ([(NSArray *)self objectAtIndex:location] != anObject)
  {
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return location;
}

- (id)indexesOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v20[5] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v11 = _os_log_pack_size();
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSArray indexesOfObject:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSArray indexesOfObject:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSArray indexesOfObject:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSArray indexesOfObject:inRange:]", location, length);
    }
    long long v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  v20[0] = off_1ECE0A5A0;
  v20[1] = 3221225472;
  void v20[2] = __35__NSArray_indexesOfObject_inRange___block_invoke;
  v20[3] = &unk_1ECDFDED8;
  v20[4] = a3;
  return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", -[objc_class indexSetWithIndexesInRange:](__CFLookUpClass("NSIndexSet"), "indexSetWithIndexesInRange:", location, length), 0, v20);
}

uint64_t __35__NSArray_indexesOfObject_inRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 == a2) {
    return 1;
  }
  else {
    return [v2 isEqual:a2];
  }
}

- (id)indexesOfObject:(id)a3
{
  v7[5] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __27__NSArray_indexesOfObject___block_invoke;
  v7[3] = &unk_1ECDFDED8;
  v7[4] = a3;
  return [(NSArray *)self indexesOfObjectsWithOptions:0 passingTest:v7];
}

uint64_t __27__NSArray_indexesOfObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 == a2) {
    return 1;
  }
  else {
    return [v2 isEqual:a2];
  }
}

- (id)indexesOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v20[5] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v11 = _os_log_pack_size();
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length);
    }
    long long v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  v20[0] = off_1ECE0A5A0;
  v20[1] = 3221225472;
  void v20[2] = __46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke;
  v20[3] = &unk_1ECDFDED8;
  v20[4] = a3;
  return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", -[objc_class indexSetWithIndexesInRange:](__CFLookUpClass("NSIndexSet"), "indexSetWithIndexesInRange:", location, length), 0, v20);
}

BOOL __46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (id)indexesOfObjectIdenticalTo:(id)a3
{
  v7[5] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __38__NSArray_indexesOfObjectIdenticalTo___block_invoke;
  v7[3] = &unk_1ECDFDED8;
  v7[4] = a3;
  return [(NSArray *)self indexesOfObjectsWithOptions:0 passingTest:v7];
}

BOOL __38__NSArray_indexesOfObjectIdenticalTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (!s)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
LABEL_14:
    long long v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v11 = opts & 0xCFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x3000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x3000000000000000, s);

  return __NSArrayGetIndexPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (!s)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
LABEL_14:
    long long v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v11 = opts & 0xAFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x5000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x5000000000000000, s);

  return (NSIndexSet *)__NSArrayGetIndexesPassingTest(self, (uint64_t)predicate, v12, s);
}

- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSArray objectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray objectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if (!a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray objectAtIndexes:options:passingTest:]");
LABEL_14:
    uint64_t v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v10 = [(NSArray *)self indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NSArray *)self objectAtIndex:v10];
}

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSArray objectWithOptions:passingTest:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray objectWithOptions:passingTest:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = [(NSArray *)self indexOfObjectWithOptions:a3 passingTest:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NSArray *)self objectAtIndex:v8];
}

- (id)objectPassingTest:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray objectPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray objectPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self objectWithOptions:0 passingTest:a3];
}

- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSArray objectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSArray objectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray objectsAtIndexes:options:passingTest:]");
LABEL_12:
    uint64_t v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  uint64_t v10 = [(NSArray *)self indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5];

  return [(NSArray *)self objectsAtIndexes:v10];
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSArray objectsWithOptions:passingTest:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray objectsWithOptions:passingTest:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = [(NSArray *)self indexesOfObjectsWithOptions:a3 passingTest:a4];

  return [(NSArray *)self objectsAtIndexes:v8];
}

- (id)objectsPassingTest:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray objectsPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSArray objectsPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return [(NSArray *)self objectsWithOptions:0 passingTest:a3];
}

- (id)reversedArray
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  uint64_t v4 = [[__NSArrayReversed alloc] initWithArray:self];

  return v4;
}

- (NSArray)initWithArray:(NSArray *)array
{
  NSUInteger v5 = [(NSArray *)array count];

  return -[NSArray initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, v5, 0);
}

- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSArray initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSArray)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v26 = (char *)&v30 - ((MEMORY[0x1F4188790](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSArray initWithSet:copyItems:]";
    CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSArray initWithSet:copyItems:]");
    CFStringRef v29 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v26 size:v24];
    objc_exception_throw(v29);
  }
  unint64_t v7 = [a3 count];
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
    CFStringRef v23 = +[NSException exceptionWithName:@"NSGenericException" reason:v22 userInfo:0];
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v7 <= 1) {
    unint64_t v7 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v7, v8);
  CFStringRef v12 = (id *)((char *)&v30 - v11);
  size_t v30 = 0;
  if (v9 >= 0x101)
  {
    CFStringRef v12 = (id *)_CFCreateArrayStorage(v10, 0, &v30);
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_msgSend(a3, "getObjects:count:", v12, v9, v30, v31);
  if (!v9) {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v14 = v12;
    unint64_t v15 = v9;
    do
    {
      *uint64_t v14 = (id)[*v14 copyWithZone:0];
      ++v14;
      --v15;
    }
    while (v15);
  }
  if (v13)
  {
    if (v9)
    {
      unint64_t v16 = v9;
      uint64_t v17 = v13;
      do
      {
        if (((unint64_t)*v17 & 0x8000000000000000) == 0) {
          id v18 = *v17;
        }
        ++v17;
        --v16;
      }
      while (v16);
    }
    uint64_t v19 = [(NSArray *)self _initByAdoptingBuffer:v13 count:v9 size:v9];
  }
  else
  {
    uint64_t v19 = [(NSArray *)self initWithObjects:v12 count:v9];
  }
  long long v20 = v19;
  if (v4)
  {
    do
    {

      --v9;
    }
    while (v9);
  }
  return v20;
}

- (NSArray)initWithSet:(id)a3
{
  return [(NSArray *)self initWithSet:a3 copyItems:0];
}

- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v50 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v35 = _os_log_pack_size();
    long long v37 = (char *)&v49 - ((MEMORY[0x1F4188790](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136315138;
    *(void *)(v38 + 4) = "-[NSArray initWithOrderedSet:range:copyItems:]";
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSArray initWithOrderedSet:range:copyItems:]");
    uint64_t v40 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v37 size:v35];
    objc_exception_throw(v40);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      uint64_t v26 = _os_log_pack_size();
      CFStringRef v28 = (char *)&v49 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      double v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSArray initWithOrderedSet:range:copyItems:]", location, length);
      CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v30, "-[NSArray initWithOrderedSet:range:copyItems:]", location, length);
      size_t v32 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v32);
    }
    uint64_t v41 = _os_log_pack_size();
    v43 = (char *)&v49 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    uint64_t v45 = v12 - 1;
    double v46 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSArray initWithOrderedSet:range:copyItems:]", location, length, v45);
    CFStringRef v47 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v46, "-[NSArray initWithOrderedSet:range:copyItems:]", location, length, v45);
    uint64_t v48 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v47) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v48);
  }
  if (length >> 60)
  {
    CFStringRef v33 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    long long v34 = +[NSException exceptionWithName:@"NSGenericException" reason:v33 userInfo:0];
    CFRelease(v33);
    objc_exception_throw(v34);
  }
  if (length <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v13, v11);
  unint64_t v16 = (id *)((char *)&v49 - v15);
  size_t v49 = 0;
  if (length >= 0x101)
  {
    unint64_t v16 = (id *)_CFCreateArrayStorage(v14, 0, &v49);
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v49, v50);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v18 = v16;
    NSUInteger v19 = length;
    do
    {
      id *v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    if (length)
    {
      NSUInteger v20 = length;
      long long v21 = v17;
      do
      {
        if (((unint64_t)*v21 & 0x8000000000000000) == 0) {
          id v22 = *v21;
        }
        ++v21;
        --v20;
      }
      while (v20);
    }
    CFStringRef v23 = [(NSArray *)self _initByAdoptingBuffer:v17 count:length size:length];
  }
  else
  {
    CFStringRef v23 = [(NSArray *)self initWithObjects:v16 count:length];
  }
  uint64_t v24 = v23;
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  return v24;
}

- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSArray initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSArray)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 count];

  return -[NSArray initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, v7, v4);
}

- (NSArray)initWithOrderedSet:(id)a3
{
  uint64_t v5 = [a3 count];

  return -[NSArray initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, v5, 0);
}

- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  unint64_t v5 = a4;
  uint64_t v7 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", a3, a4, a5);
  if (v5)
  {
    uint64_t v8 = a3;
    do
    {
      unint64_t v9 = *v8++;

      --v5;
    }
    while (v5);
  }
  free(a3);
  return v7;
}

+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  unint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, a5);

  return (NSArray *)v5;
}

+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);

  return (NSArray *)v4;
}

+ (NSArray)arrayWithArray:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);

  return (NSArray *)v4;
}

+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  unint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, a5);

  return (NSArray *)v5;
}

+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);

  return (NSArray *)v4;
}

+ (NSArray)arrayWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);

  return (NSArray *)v4;
}

+ (NSArray)arrayWithOrderedSet:(id)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), 0);

  return (NSArray *)v3;
}

+ (NSArray)arrayWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = (void *)[objc_alloc((Class)a1) initWithSet:a3 copyItems:a4];

  return (NSArray *)v4;
}

+ (NSArray)arrayWithSet:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithSet:a3 copyItems:0];

  return (NSArray *)v3;
}

- (NSArray)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  BOOL v4 = __CFLookUpClass("NSArray");
  __CFRequireConcreteImplementation(v4, (objc_class *)self, a2);
}

- (id)objectAtIndex:(NSUInteger)index
{
  unint64_t v5 = __CFLookUpClass("NSArray");
  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

- (NSArray)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  unint64_t v6 = __CFLookUpClass("NSArray");
  __CFRequireConcreteImplementation(v6, (objc_class *)self, a2);
}

@end