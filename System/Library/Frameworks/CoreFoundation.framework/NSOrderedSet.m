@interface NSOrderedSet
+ (BOOL)supportsSecureCoding;
+ (NSOrderedSet)allocWithZone:(_NSZone *)a3;
+ (NSOrderedSet)orderedSet;
+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array;
+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array range:(NSRange)range copyItems:(BOOL)flag;
+ (NSOrderedSet)orderedSetWithArray:(id)a3 copyItems:(BOOL)a4;
+ (NSOrderedSet)orderedSetWithArray:(id)a3 range:(_NSRange)a4;
+ (NSOrderedSet)orderedSetWithObject:(id)object;
+ (NSOrderedSet)orderedSetWithObjects:(id *)objects count:(NSUInteger)cnt;
+ (NSOrderedSet)orderedSetWithObjects:(id)firstObj;
+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set;
+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag;
+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 range:(_NSRange)a4;
+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set;
+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set copyItems:(BOOL)flag;
+ (id)newOrderedSetWithObjects:(const void *)a3 count:(unint64_t)a4;
- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4;
- (BOOL)containsObject:(id)object;
- (BOOL)intersectsOrderedSet:(NSOrderedSet *)other;
- (BOOL)intersectsSet:(NSSet *)set;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrderedSet:(NSOrderedSet *)other;
- (BOOL)isNSOrderedSet__;
- (BOOL)isSubsetOfOrderedSet:(NSOrderedSet *)other;
- (BOOL)isSubsetOfSet:(NSSet *)set;
- (NSArray)array;
- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes;
- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr;
- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (NSEnumerator)objectEnumerator;
- (NSEnumerator)reverseObjectEnumerator;
- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSOrderedSet)initWithArray:(NSArray *)array;
- (NSOrderedSet)initWithArray:(NSArray *)set copyItems:(BOOL)flag;
- (NSOrderedSet)initWithArray:(NSArray *)set range:(NSRange)range copyItems:(BOOL)flag;
- (NSOrderedSet)initWithArray:(id)a3 range:(_NSRange)a4;
- (NSOrderedSet)initWithCoder:(NSCoder *)coder;
- (NSOrderedSet)initWithObject:(id)object;
- (NSOrderedSet)initWithObjects:(id *)objects count:(NSUInteger)cnt;
- (NSOrderedSet)initWithObjects:(id)firstObj;
- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set;
- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set copyItems:(BOOL)flag;
- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag;
- (NSOrderedSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4;
- (NSOrderedSet)initWithSet:(NSSet *)set;
- (NSOrderedSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag;
- (NSOrderedSet)reversedOrderedSet;
- (NSSet)set;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (NSUInteger)count;
- (NSUInteger)indexOfObject:(id)object;
- (NSUInteger)indexOfObject:(id)object inSortedRange:(NSRange)range options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp;
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)indexOfObjectPassingTest:(void *)predicate;
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(NSUInteger)idx;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectPassingTest:(id)a3;
- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectsPassingTest:(id)a3;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)hash;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)objects range:(NSRange)range;
@end

@implementation NSOrderedSet

- (id)lastObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  id result = [(NSOrderedSet *)self count];
  if (result)
  {
    return [(NSOrderedSet *)self objectAtIndex:(char *)result - 1];
  }
  return result;
}

- (id)firstObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  id result = [(NSOrderedSet *)self count];
  if (result)
  {
    return [(NSOrderedSet *)self objectAtIndex:0];
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6 = a5;
  v23[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = (char *)v23 - ((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSOrderedSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = v6;
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSOrderedSet countByEnumeratingWithState:objects:count:]", v6);
    goto LABEL_21;
  }
  if (a5 >> 61)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = (char *)v23 - ((MEMORY[0x1F4188790](v15, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSOrderedSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = v6;
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSOrderedSet countByEnumeratingWithState:objects:count:]", v6);
LABEL_21:
    v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v22);
  }
  unint64_t var0 = a3->var0;
  if (a3->var0 == -1) {
    return 0;
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
    unint64_t var0 = a3->var0;
  }
  var3 = a3->var3;
  if (var0)
  {
    NSUInteger v12 = *var3;
  }
  else
  {
    a3->var2 = var3;
    NSUInteger v12 = [(NSOrderedSet *)self count];
    a3->var3[0] = v12;
    unint64_t var0 = a3->var0;
  }
  a3->var1 = a4;
  if (v12 - var0 < v6) {
    unint64_t v6 = v12 - var0;
  }
  if (v6)
  {
    -[NSOrderedSet getObjects:range:](self, "getObjects:range:", a4);
    unint64_t var0 = a3->var0;
  }
  unint64_t v13 = var0 + v6;
  if (v12 <= var0 + v6) {
    unint64_t v13 = -1;
  }
  a3->unint64_t var0 = v13;
  return v6;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self objectAtIndex:idx];
}

- (NSSet)set
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  v4 = [[__NSOrderedSetSetProxy alloc] initWithOrderedSet:self];

  return (NSSet *)v4;
}

- (NSArray)array
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  v4 = [[__NSOrderedSetArrayProxy alloc] initWithOrderedSet:self];

  return (NSArray *)v4;
}

- (BOOL)isSubsetOfOrderedSet:(NSOrderedSet *)other
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (other && (_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSOrderedSet isSubsetOfOrderedSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSOrderedSet isSubsetOfOrderedSet:]");
    uint64_t v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t v6 = [(NSOrderedSet *)self count];
  if (v6 > [(NSOrderedSet *)other count]) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v8 = [(NSOrderedSet *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(self);
        }
        if (![(NSOrderedSet *)other countForObject:*(void *)(*((void *)&v18 + 1) + 8 * i)])
        {
          BOOL v12 = 0;
          return other && v12;
        }
      }
      unint64_t v9 = [(NSOrderedSet *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
  return other && v12;
}

+ (NSOrderedSet)orderedSetWithObject:(id)object
{
  OrderedSet = (void *)__createOrderedSet(objc_alloc((Class)a1), (uint64_t)object);

  return (NSOrderedSet *)OrderedSet;
}

+ (NSOrderedSet)orderedSet
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithObjects:0 count:0];

  return (NSOrderedSet *)v2;
}

+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);

  return (NSOrderedSet *)v3;
}

+ (NSOrderedSet)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSOrderedSet == a1)
  {
    return (NSOrderedSet *)__NSOrderedSetImmutablePlaceholder();
  }
  else if (NSMutableOrderedSet == a1)
  {
    return (NSOrderedSet *)__NSOrderedSetMutablePlaceholder();
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSOrderedSet;
    return (NSOrderedSet *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (NSOrderedSet)initWithArray:(NSArray *)set range:(NSRange)range copyItems:(BOOL)flag
{
  BOOL v5 = flag;
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v46 = *(void *)off_1ECE0A5B0;
  if (set && (_NSIsNSArray((uint64_t)set) & 1) == 0)
  {
    uint64_t v31 = _os_log_pack_size();
    v33 = (char *)&v45 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSOrderedSet initWithArray:range:copyItems:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSOrderedSet initWithArray:range:copyItems:]");
    v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  NSUInteger v10 = [(NSArray *)set count];
  NSUInteger v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      uint64_t v22 = _os_log_pack_size();
      v24 = (char *)&v45 - ((MEMORY[0x1F4188790](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSOrderedSet initWithArray:range:copyItems:]", location, length);
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v26, "-[NSOrderedSet initWithArray:range:copyItems:]", location, length);
      v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v24 size:v22];
      objc_exception_throw(v28);
    }
    uint64_t v37 = _os_log_pack_size();
    v39 = (char *)&v45 - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    uint64_t v41 = v12 - 1;
    double v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSOrderedSet initWithArray:range:copyItems:]", location, length, v41);
    CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v42, "-[NSOrderedSet initWithArray:range:copyItems:]", location, length, v41);
    v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v39 size:v37];
    objc_exception_throw(v44);
  }
  if (length >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
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
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  -[NSArray getObjects:range:](set, "getObjects:range:", v16, location, length, v45, v46);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    long long v18 = v16;
    NSUInteger v19 = length;
    do
    {
      *long long v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }
    while (v19);
  }
  long long v20 = [(NSOrderedSet *)self initWithObjects:v16 count:length];
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

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t v6 = +[NSOrderedSet allocWithZone:a3];
  NSUInteger v7 = [(NSOrderedSet *)self count];

  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](v6, "initWithOrderedSet:range:copyItems:", self, 0, v7, 0);
}

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag
{
  BOOL v5 = flag;
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v46 = *(void *)off_1ECE0A5B0;
  if (set && (_NSIsNSOrderedSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v31 = _os_log_pack_size();
    v33 = (char *)&v45 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSOrderedSet initWithOrderedSet:range:copyItems:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSOrderedSet initWithOrderedSet:range:copyItems:]");
    v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  NSUInteger v10 = [(NSOrderedSet *)set count];
  NSUInteger v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      uint64_t v22 = _os_log_pack_size();
      v24 = (char *)&v45 - ((MEMORY[0x1F4188790](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length);
      CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v26, "-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length);
      v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v24 size:v22];
      objc_exception_throw(v28);
    }
    uint64_t v37 = _os_log_pack_size();
    v39 = (char *)&v45 - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    uint64_t v41 = v12 - 1;
    double v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length, v41);
    CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v42, "-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length, v41);
    v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v39 size:v37];
    objc_exception_throw(v44);
  }
  if (length >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
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
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  -[NSOrderedSet getObjects:range:](set, "getObjects:range:", v16, location, length, v45, v46);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    long long v18 = v16;
    NSUInteger v19 = length;
    do
    {
      *long long v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }
    while (v19);
  }
  long long v20 = [(NSOrderedSet *)self initWithObjects:v16 count:length];
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

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    int v6 = _NSIsNSOrderedSet((uint64_t)a3);
    if (v6)
    {
      LOBYTE(v6) = [(NSOrderedSet *)self isEqualToOrderedSet:a3];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isEqualToOrderedSet:(NSOrderedSet *)other
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2);
  int v6 = (void *)v5;
  NSUInteger v7 = (void *)v4;
  v24[256] = *(void *)off_1ECE0A5B0;
  if (v5 && (_NSIsNSOrderedSet(v5) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    v17 = &v23[-((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet isEqualToOrderedSet:]";
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSOrderedSet isEqualToOrderedSet:]");
    long long v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(v7, v3, __CFTSANTagMutableOrderedSet);
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
        NSUInteger v12 = (id *)v23;
        uint64_t v13 = (id *)v24;
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

- (BOOL)isNSOrderedSet__
{
  return 1;
}

- (unint64_t)countForObject:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return [(NSOrderedSet *)self indexOfObject:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsObject:(id)object
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return [(NSOrderedSet *)self indexOfObject:object] != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSOrderedSet)initWithArray:(NSArray *)array
{
  NSUInteger v5 = [(NSArray *)array count];

  return -[NSOrderedSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, v5, 0);
}

- (NSEnumerator)reverseObjectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v4 = [[__NSOrderedSetReverseEnumerator alloc] initWithObject:self];

  return (NSEnumerator *)v4;
}

+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithSet:set copyItems:0];

  return (NSOrderedSet *)v3;
}

- (NSOrderedSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v20 = _os_log_pack_size();
    uint64_t v22 = (char *)&v26 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSOrderedSet initWithSet:copyItems:]";
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSOrderedSet initWithSet:copyItems:]");
    uint64_t v25 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v22 size:v20];
    objc_exception_throw(v25);
  }
  NSUInteger v7 = [(NSSet *)set count];
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
    CFStringRef v19 = +[NSException exceptionWithName:@"NSGenericException" reason:v18 userInfo:0];
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  if (v7 <= 1) {
    NSUInteger v7 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v7, v8);
  NSUInteger v12 = (id *)((char *)&v26 - v11);
  size_t v26 = 0;
  if (v9 >= 0x101)
  {
    NSUInteger v12 = (id *)_CFCreateArrayStorage(v10, 0, &v26);
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  -[NSSet getObjects:count:](set, "getObjects:count:", v12, v9, v26, v27);
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
  uint64_t v16 = [(NSOrderedSet *)self initWithObjects:v12 count:v9];
  if (v4)
  {
    do
    {

      --v9;
    }
    while (v9);
  }
  free(v13);
  return v16;
}

- (NSEnumerator)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  BOOL v4 = [[__NSFastEnumerationEnumerator alloc] initWithObject:self];

  return (NSEnumerator *)v4;
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  uint64_t v59 = *(void *)off_1ECE0A5B0;
  if (!indexes)
  {
    uint64_t v24 = _os_log_pack_size();
    size_t v26 = (char *)&v58 - ((MEMORY[0x1F4188790](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSOrderedSet objectsAtIndexes:]");
    CFStringRef v29 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v26 size:v24];
    objc_exception_throw(v29);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v30 = _os_log_pack_size();
    uint64_t v32 = (char *)&v58 - ((MEMORY[0x1F4188790](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315138;
    *(void *)(v33 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringRef v34 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet objectsAtIndexes:]");
    CFStringRef v35 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v34) userInfo:0 osLogPack:v32 size:v30];
    objc_exception_throw(v35);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v36 = _os_log_pack_size();
    uint64_t v38 = (char *)&v58 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet objectsAtIndexes:]");
    uint64_t v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
    objc_exception_throw(v41);
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];
  uint64_t v7 = [0 count];
  NSUInteger v8 = [(NSIndexSet *)indexes lastIndex];
  uint64_t v9 = v8;
  if ((v8 & 0x8000000000000000) != 0)
  {
    NSUInteger v10 = v7 + v6;
    goto LABEL_26;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = v7 + v6;
    if (v10 <= v8)
    {
LABEL_26:
      if (!v10)
      {
        uint64_t v42 = _os_log_pack_size();
        v44 = (char *)&v58 - ((MEMORY[0x1F4188790](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v45 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v45 = 136315394;
        *(void *)(v45 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
        *(_WORD *)(v45 + 12) = 2048;
        *(void *)(v45 + 14) = v9;
        CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty ordered set", "-[NSOrderedSet objectsAtIndexes:]", v9);
        v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v44 size:v42];
        objc_exception_throw(v47);
      }
      uint64_t v48 = _os_log_pack_size();
      v50 = (char *)&v58 - ((MEMORY[0x1F4188790](v48, v49) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v51 = _os_log_pack_fill();
      uint64_t v52 = v10 - 1;
      double v53 = __os_log_helper_1_2_3_8_32_8_0_8_0(v51, (uint64_t)"-[NSOrderedSet objectsAtIndexes:]", v9, v52);
      CFStringRef v54 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v53, "-[NSOrderedSet objectsAtIndexes:]", v9, v52);
      v55 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v54) userInfo:0 osLogPack:v50 size:v48];
      objc_exception_throw(v55);
    }
  }
  unint64_t v11 = [(NSIndexSet *)indexes count];
  uint64_t v12 = v11;
  if (v11 >> 60)
  {
    CFStringRef v56 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    v57 = +[NSException exceptionWithName:@"NSGenericException" reason:v56 userInfo:0];
    CFRelease(v56);
    objc_exception_throw(v57);
  }
  size_t v58 = 0;
  if (v11 <= 1) {
    unint64_t v11 = 1;
  }
  uint64_t v13 = (id *)_CFCreateArrayStorage(v11, 0, &v58);
  uint64_t v14 = 0;
  for (unint64_t i = 0; i < [(NSIndexSet *)indexes rangeCount]; ++i)
  {
    uint64_t v16 = [(NSIndexSet *)indexes rangeAtIndex:i];
    uint64_t v18 = v17;
    -[NSOrderedSet getObjects:range:](self, "getObjects:range:", &v13[v14], v16, v17);
    v14 += v18;
  }
  if (v13)
  {
    if (v12 >= 1)
    {
      CFStringRef v19 = v13;
      uint64_t v20 = v12;
      do
      {
        id v21 = *v19++;
        --v20;
      }
      while (v20);
    }
    uint64_t v22 = [[NSArray alloc] _initByAdoptingBuffer:v13 count:v12 size:v12];
  }
  else
  {
    uint64_t v22 = [[NSArray alloc] initWithObjects:0 count:v12];
  }
  return v22;
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSOrderedSet enumerateObjectsUsingBlock:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSOrderedSet enumerateObjectsUsingBlock:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  [(NSOrderedSet *)self enumerateObjectsWithOptions:0 usingBlock:block];
}

- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet indexesOfObjectsPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet indexesOfObjectsPassingTest:]");
    NSUInteger v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self indexesOfObjectsWithOptions:0 passingTest:predicate];
}

- (NSUInteger)indexOfObject:(id)object inSortedRange:(NSRange)range options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp
{
  double v53 = self;
  uint64_t v54 = *(void *)off_1ECE0A5B0;
  if (!object)
  {
    uint64_t v38 = _os_log_pack_size();
    uint64_t v39 = (char *)&v51 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringRef v41 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]");
    goto LABEL_58;
  }
  if (!cmp)
  {
    uint64_t v38 = _os_log_pack_size();
    uint64_t v39 = (char *)&v51 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v42 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v42 = 136315138;
    *(void *)(v42 + 4) = "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringRef v41 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]");
LABEL_58:
    uint64_t v43 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v41) userInfo:0 osLogPack:v39 size:v38];
    objc_exception_throw(v43);
  }
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(v53, v6, __CFTSANTagMutableOrderedSet);
  }
  unint64_t v13 = [(NSOrderedSet *)v53 count];
  if ((location & 0x8000000000000000) != 0
    || (length & 0x8000000000000000) != 0
    || (NSUInteger v14 = location + length, v13 < location + length))
  {
    if (v13)
    {
      unint64_t v47 = v13;
      uint64_t v33 = _os_log_pack_size();
      CFStringRef v34 = (char *)&v51 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v48, (uint64_t)"-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length, --v47);
      CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v49, "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length, v47);
    }
    else
    {
      uint64_t v33 = _os_log_pack_size();
      CFStringRef v34 = (char *)&v51 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v35 = _os_log_pack_fill();
      double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v35, (uint64_t)"-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length);
      CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v36, "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length);
    }
    v50 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v34 size:v33];
    objc_exception_throw(v50);
  }
  NSBinarySearchingOptions v15 = opts & 0x300;
  if (v15 == 768)
  {
    uint64_t v44 = __CFExceptionProem((objc_class *)v53, a2);
    CFStringRef v45 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: both NSBinarySearchingFirstEqual and NSBinarySearchingLastEqual options cannot be specified", v44);
    CFStringRef v46 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v45) userInfo:0];
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
  uint64_t v17 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, [(NSOrderedSet *)v53 objectAtIndex:v14 - 1], object);
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
  uint64_t v18 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, object, [(NSOrderedSet *)v53 objectAtIndex:location]);
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
      uint64_t v20 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, [(NSOrderedSet *)v53 objectAtIndex:location + (v23 >> 1)], object);
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

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set
{
  NSUInteger v5 = [(NSOrderedSet *)set count];

  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", set, 0, v5, 0);
}

- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSOrderedSet indexOfObjectWithOptions:passingTest:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet indexOfObjectWithOptions:passingTest:]");
    NSBinarySearchingOptions v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:(char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) size:v12];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v9 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x2000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2000000000000000, 0);

  return __NSOrderedSetGetIndexPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v16[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]");
    NSBinarySearchingOptions v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:(char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) size:v12];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x4000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x4000000000000000, 0);

  return (NSIndexSet *)__NSOrderedSetGetIndexesPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self descriptionWithLocale:locale indent:0];
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self descriptionWithLocale:0 indent:0];
}

- (NSUInteger)indexOfObjectPassingTest:(void *)predicate
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet indexOfObjectPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet indexOfObjectPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self indexOfObjectWithOptions:0 passingTest:predicate];
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  id v32 = locale;
  v33[1] = *(void *)off_1ECE0A5B0;
  if (level >= 0x64) {
    NSUInteger v5 = 100;
  }
  else {
    NSUInteger v5 = level;
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];
  unint64_t v8 = v6;
  if (v6 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    BOOL v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v9 = MEMORY[0x1F4188790](v6, v7);
  unint64_t v11 = (uint64_t *)((char *)&v27 - v10);
  v33[0] = 0;
  if (v8 >= 0x101)
  {
    unint64_t v11 = (uint64_t *)_CFCreateArrayStorage(v9, 0, v33);
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v11, 0, v8);
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  CFAllocatorRef v29 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  BOOL v30 = v12;
  NSUInteger v28 = (void *)MEMORY[0x185311AE0]();
  if (v8)
  {
    NSUInteger v31 = sel_descriptionWithLocale_;
    CFStringRef v14 = v11;
    unint64_t v15 = v8;
    do
    {
      NSUInteger v16 = (void *)*v14;
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
        uint64_t v18 = (__CFString *)v17;
      }
      else {
        uint64_t v18 = @"(null)";
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
  uint64_t v23 = Mutable;
  free(v19);
  return v23;
}

+ (NSOrderedSet)orderedSetWithObjects:(id *)objects count:(NSUInteger)cnt
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithObjects:objects count:cnt];

  return (NSOrderedSet *)v4;
}

- (void)getObjects:(id *)a3
{
  v17[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];
  if (!a3 && v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v17 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSOrderedSet getObjects:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v7;
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSOrderedSet getObjects:]", v7);
    goto LABEL_11;
  }
  if (v6 >> 61)
  {
    NSUInteger v13 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v17 - ((MEMORY[0x1F4188790](v8, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSOrderedSet getObjects:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = v13;
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSOrderedSet getObjects:]", v13);
LABEL_11:
    NSUInteger v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v16);
  }

  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", a3, 0, v6);
}

- (id)allObjects
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  unint64_t v4 = [(NSOrderedSet *)self count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    NSUInteger v13 = +[NSException exceptionWithName:@"NSGenericException" reason:v12 userInfo:0];
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  NSUInteger v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v6, 0, v5);
  if (v6)
  {
    if (v5)
    {
      NSUInteger v7 = v6;
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
  v20[1] = *(void *)off_1ECE0A5B0;
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSOrderedSet containsObject:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSOrderedSet containsObject:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSOrderedSet containsObject:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "-[NSOrderedSet containsObject:inRange:]", location, length);
    }
    char v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length) != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v20[1] = *(void *)off_1ECE0A5B0;
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSOrderedSet countForObject:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSOrderedSet countForObject:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSOrderedSet countForObject:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "-[NSOrderedSet countForObject:inRange:]", location, length);
    }
    char v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v20[1] = *(void *)off_1ECE0A5B0;
  if (!s)
  {
    uint64_t v13 = _os_log_pack_size();
    double v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    double v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_14;
  }
  if (!block)
  {
    uint64_t v13 = _os_log_pack_size();
    double v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
LABEL_14:
    char v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v11 = opts & 0xEFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x1000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v11 | 0x1000000000000000, s);

  __NSOrderedSetEnumerate(self, (uint64_t)block, v12, s);
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v13[1] = *(void *)off_1ECE0A5B0;
  if (!block)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSOrderedSet enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[NSOrderedSet enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
    objc_exception_throw(v12);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  if ((opts & 2) != 0) {
    opts &= ~1uLL;
  }
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, opts, 0);

  __NSOrderedSetEnumerate(self, (uint64_t)block, opts, 0);
}

- (void)getObjects:(id *)objects range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v7 = objects;
  v25[1] = *(void *)off_1ECE0A5B0;
  if (!objects && range.length)
  {
    uint64_t v10 = _os_log_pack_size();
    CFStringRef v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSOrderedSet getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSOrderedSet getObjects:range:]", length);
    goto LABEL_14;
  }
  if (range.length >> 61)
  {
    uint64_t v10 = _os_log_pack_size();
    CFStringRef v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSOrderedSet getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = length;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSOrderedSet getObjects:range:]", length);
LABEL_14:
    uint64_t v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v15);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v21 = v9;
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSOrderedSet getObjects:range:]", location, length, --v21);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v23, "-[NSOrderedSet getObjects:range:]", location, length, v21);
    }
    else
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSOrderedSet getObjects:range:]", location, length);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v19, "-[NSOrderedSet getObjects:range:]", location, length);
    }
    NSUInteger v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v17 size:v16];
    objc_exception_throw(v24);
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!length) {
      return;
    }
  }
  else if (!length)
  {
    return;
  }
  do
  {
    *v7++ = [(NSOrderedSet *)self objectAtIndex:location++];
    --length;
  }
  while (length);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v21[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v17 = v9;
      uint64_t v12 = _os_log_pack_size();
      CFStringRef v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSOrderedSet indexOfObject:inRange:]", location, length, --v17);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v19, "-[NSOrderedSet indexOfObject:inRange:]", location, length, v17);
    }
    else
    {
      uint64_t v12 = _os_log_pack_size();
      CFStringRef v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSOrderedSet indexOfObject:inRange:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v15, "-[NSOrderedSet indexOfObject:inRange:]", location, length);
    }
    CFStringRef v20 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v20);
  }
  unint64_t result = [(NSOrderedSet *)self indexOfObject:a3];
  if (result - location >= length) {
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v11 = result;
  }
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    return v11;
  }
  return result;
}

- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (!s)
  {
    uint64_t v14 = _os_log_pack_size();
    double v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    double v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    double v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
LABEL_14:
    CFStringRef v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v11 = opts & 0xCFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x3000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x3000000000000000, s);

  return __NSOrderedSetGetIndexPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (!s)
  {
    uint64_t v14 = _os_log_pack_size();
    double v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    double v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    double v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
LABEL_14:
    CFStringRef v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v11 = opts & 0xAFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x5000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x5000000000000000, s);

  return (NSIndexSet *)__NSOrderedSetGetIndexesPassingTest(self, (uint64_t)predicate, v12, s);
}

- (BOOL)intersectsOrderedSet:(NSOrderedSet *)other
{
  uint64_t v4 = other;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (other && (_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet intersectsOrderedSet:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSOrderedSet intersectsOrderedSet:]");
    CFStringRef v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:&v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v14];
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];
  unint64_t v7 = [(NSOrderedSet *)v4 count];
  BOOL v8 = v6 >= v7;
  long long v20 = 0u;
  long long v21 = 0u;
  if (v6 >= v7) {
    NSUInteger v9 = v4;
  }
  else {
    NSUInteger v9 = self;
  }
  if (v8) {
    uint64_t v4 = self;
  }
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  uint64_t v10 = [(NSOrderedSet *)v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
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
        if ([(NSOrderedSet *)v4 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * v13)])
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [(NSOrderedSet *)v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
      uint64_t v11 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return v10;
}

- (BOOL)intersectsSet:(NSSet *)set
{
  uint64_t v4 = (NSOrderedSet *)set;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet intersectsSet:]";
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSOrderedSet intersectsSet:]");
    CFStringRef v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:&v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v14];
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];
  unint64_t v7 = [(NSOrderedSet *)v4 count];
  BOOL v8 = v6 >= v7;
  long long v20 = 0u;
  long long v21 = 0u;
  if (v6 >= v7) {
    NSUInteger v9 = v4;
  }
  else {
    NSUInteger v9 = self;
  }
  if (v8) {
    uint64_t v4 = self;
  }
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  uint64_t v10 = [(NSOrderedSet *)v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
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
        if ([(NSOrderedSet *)v4 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * v13)])
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [(NSOrderedSet *)v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
      uint64_t v11 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return v10;
}

- (BOOL)isSubsetOfSet:(NSSet *)set
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSOrderedSet isSubsetOfSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSOrderedSet isSubsetOfSet:]");
    CFStringRef v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t v6 = [(NSOrderedSet *)self count];
  if (v6 > [(NSSet *)set count]) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v8 = [(NSOrderedSet *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(self);
        }
        if (![(NSSet *)set countForObject:*(void *)(*((void *)&v18 + 1) + 8 * i)])
        {
          BOOL v12 = 0;
          return set && v12;
        }
      }
      unint64_t v9 = [(NSOrderedSet *)self countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
  return set && v12;
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
    *(void *)(v14 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
    goto LABEL_14;
  }
  if (!a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
LABEL_14:
    long long v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v10 = [(NSOrderedSet *)self indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NSOrderedSet *)self objectAtIndex:v10];
}

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSOrderedSet objectWithOptions:passingTest:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet objectWithOptions:passingTest:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v8 = [(NSOrderedSet *)self indexOfObjectWithOptions:a3 passingTest:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NSOrderedSet *)self objectAtIndex:v8];
}

- (id)objectPassingTest:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet objectPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet objectPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self objectWithOptions:0 passingTest:a3];
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
    *(void *)(v14 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
LABEL_12:
    long long v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v10 = [(NSOrderedSet *)self objectsAtIndexes:[(NSOrderedSet *)self indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5]];

  return +[NSOrderedSet orderedSetWithArray:v10];
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v14[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSOrderedSet objectsWithOptions:passingTest:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet objectsWithOptions:passingTest:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = [(NSOrderedSet *)self objectsAtIndexes:[(NSOrderedSet *)self indexesOfObjectsWithOptions:a3 passingTest:a4]];

  return +[NSOrderedSet orderedSetWithArray:v8];
}

- (id)objectsPassingTest:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet objectsPassingTest:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSOrderedSet objectsPassingTest:]");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self objectsWithOptions:0 passingTest:a3];
}

- (NSOrderedSet)reversedOrderedSet
{
  uint64_t v2 = [[__NSOrderedSetReversed alloc] initWithOrderedSet:self];

  return (NSOrderedSet *)v2;
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
    *(void *)(v34 + 4) = "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]";
    CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]");
    double v36 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v36);
  }
  char v7 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v11 = [(NSOrderedSet *)self count];
  if (!length || (NSUInteger v13 = v11) == 0)
  {
    uint64_t v14 = (NSOrderedSet *)NSArray;
    goto LABEL_12;
  }
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    uint64_t v37 = _os_log_pack_size();
    uint64_t v39 = (char *)&v47[-1] - ((MEMORY[0x1F4188790](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    double v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringRef v42 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v41, "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
    uint64_t v43 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v42) userInfo:0 osLogPack:v39 size:v37];
    objc_exception_throw(v43);
  }
  if (v11 == 1)
  {
    uint64_t v14 = self;
LABEL_12:
    return [(NSOrderedSet *)v14 array];
  }
  if (length == 1)
  {
    id v16 = [(NSOrderedSet *)self objectAtIndex:location];
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
    long long v18 = (char *)&v47[-1] - v17;
    v49[0] = 0;
    if (length >= 0x101)
    {
      long long v18 = (char *)_CFCreateArrayStorage(length, 0, v49);
      long long v19 = v18;
    }
    else
    {
      long long v19 = 0;
    }
    size_t v48 = 0;
    long long v20 = (id *)_CFCreateArrayStorage(length, 0, &v48);
    uint64_t v21 = -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v18, location, length);
    MEMORY[0x1F4188790](v21, v22);
    uint64_t v24 = (char *)&v47[-1] - v23;
    CFStringRef v25 = (char *)&v47[-1] - v23;
    if (length > 0x1000) {
      CFStringRef v25 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
    }
    v47[0] = off_1ECE0A5A0;
    v47[1] = 3221225472;
    v47[2] = __61__NSOrderedSet_sortedArrayFromRange_options_usingComparator___block_invoke;
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

uint64_t __61__NSOrderedSet_sortedArrayFromRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8 * a2), *(void *)(*(void *)(a1 + 40) + 8 * a3));
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
    *(void *)(v13 + 4) = "-[NSOrderedSet sortedArrayWithOptions:usingComparator:]";
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSOrderedSet sortedArrayWithOptions:usingComparator:]");
    CFStringRef v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v8 = [(NSOrderedSet *)self count];

  return (NSArray *)-[NSOrderedSet sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, v8, opts, cmptr);
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
    *(void *)(v11 + 4) = "-[NSOrderedSet sortedArrayUsingComparator:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSOrderedSet sortedArrayUsingComparator:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];

  return (NSArray *)-[NSOrderedSet sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, v6, 0, cmptr);
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }

  return [(NSOrderedSet *)self count];
}

+ (id)newOrderedSetWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "+[NSOrderedSet newOrderedSetWithObjects:count:]", a4);
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "+[NSOrderedSet newOrderedSetWithObjects:count:]", a4);
    goto LABEL_18;
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
    uint64_t v9 = v6;
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = v9;
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "+[NSOrderedSet newOrderedSetWithObjects:count:]", v9);
LABEL_18:
    CFStringRef v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v10];
    objc_exception_throw(v14);
  }
LABEL_8:
  if (NSOrderedSet == a1)
  {
    return __NSOrderedSetI_new((uint64_t)a3, a4, 1);
  }
  else
  {
    if (NSMutableOrderedSet != a1)
    {
      uint64_t v8 = __CFLookUpClass("NSOrderedSet");
      __CFRequireConcreteImplementation(v8, (objc_class *)a1, a2);
    }
    return __NSOrderedSetM_new((id *)a3, a4, 1);
  }
}

- (NSOrderedSet)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSOrderedSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSOrderedSet)initWithArray:(NSArray *)set copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  NSUInteger v7 = [(NSArray *)set count];

  return -[NSOrderedSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", set, 0, v7, v4);
}

- (NSOrderedSet)initWithObject:(id)object
{
  v4[1] = *(void *)off_1ECE0A5B0;
  v4[0] = object;
  return [(NSOrderedSet *)self initWithObjects:v4 count:1];
}

- (NSOrderedSet)initWithObjects:(id)firstObj
{
  va_start(va, firstObj);
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  va_list v20 = 0;
  unint64_t v5 = 0;
  if (firstObj)
  {
    va_copy(v20, va);
    do
    {
      uint64_t v6 = v20;
      v20 += 8;
      ++v5;
    }
    while (*v6);
    if (v5 >> 60)
    {
      CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
      uint64_t v17 = +[NSException exceptionWithName:@"NSGenericException" reason:v16 userInfo:0];
      CFRelease(v16);
      objc_exception_throw(v17);
    }
  }
  if (v5 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v5;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v7, a2);
  uint64_t v10 = (uint64_t *)((char *)&v18 - v9);
  size_t v19 = 0;
  if (v5 >= 0x101)
  {
    uint64_t v10 = _CFCreateArrayStorage(v8, 0, &v19);
    va_copy(v20, va);
    *uint64_t v10 = firstObj;
    uint64_t v11 = v10;
LABEL_13:
    for (uint64_t i = 1; i != v5; ++i)
    {
      CFStringRef v13 = v20;
      v20 += 8;
      v10[i] = *v13;
    }
    goto LABEL_15;
  }
  uint64_t v11 = 0;
  if (v5)
  {
    va_copy(v20, va);
    *uint64_t v10 = firstObj;
    if (v5 != 1) {
      goto LABEL_13;
    }
  }
LABEL_15:
  CFStringRef v14 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:");
  free(v11);
  return v14;
}

- (NSOrderedSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  NSUInteger v7 = [(NSOrderedSet *)set count];

  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", set, 0, v7, v4);
}

- (NSOrderedSet)initWithSet:(NSSet *)set
{
  return [(NSOrderedSet *)self initWithSet:set copyItems:0];
}

+ (NSOrderedSet)orderedSetWithObjects:(id)firstObj
{
  va_start(va, firstObj);
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  va_list v20 = 0;
  unint64_t v5 = 0;
  if (firstObj)
  {
    va_copy(v20, va);
    do
    {
      uint64_t v6 = v20;
      v20 += 8;
      ++v5;
    }
    while (*v6);
    if (v5 >> 60)
    {
      CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
      uint64_t v17 = +[NSException exceptionWithName:@"NSGenericException" reason:v16 userInfo:0];
      CFRelease(v16);
      objc_exception_throw(v17);
    }
  }
  if (v5 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v5;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v7, a2);
  uint64_t v10 = (uint64_t *)((char *)&v18 - v9);
  size_t v19 = 0;
  if (v5 >= 0x101)
  {
    uint64_t v10 = _CFCreateArrayStorage(v8, 0, &v19);
    va_copy(v20, va);
    *uint64_t v10 = firstObj;
    uint64_t v11 = v10;
LABEL_13:
    for (uint64_t i = 1; i != v5; ++i)
    {
      CFStringRef v13 = v20;
      v20 += 8;
      v10[i] = *v13;
    }
    goto LABEL_15;
  }
  uint64_t v11 = 0;
  if (v5)
  {
    va_copy(v20, va);
    *uint64_t v10 = firstObj;
    if (v5 != 1) {
      goto LABEL_13;
    }
  }
LABEL_15:
  CFStringRef v14 = (NSOrderedSet *)(id)[objc_alloc((Class)a1) initWithObjects:v10 count:v5];
  free(v11);
  return v14;
}

+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array range:(NSRange)range copyItems:(BOOL)flag
{
  unint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, range.location, range.length, flag);

  return (NSOrderedSet *)v5;
}

+ (NSOrderedSet)orderedSetWithArray:(id)a3 range:(_NSRange)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)orderedSetWithArray:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag
{
  unint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", set, range.location, range.length, flag);

  return (NSOrderedSet *)v5;
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", set, 0, -[NSOrderedSet count](set, "count"), 0);

  return (NSOrderedSet *)v3;
}

+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  BOOL v4 = (void *)[objc_alloc((Class)a1) initWithSet:set copyItems:flag];

  return (NSOrderedSet *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v6 = +[NSOrderedSet allocWithZone:a3];
  NSUInteger v7 = [(NSOrderedSet *)self count];

  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](v6, "initWithOrderedSet:range:copyItems:", self, 0, v7, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSOrderedSet)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  OUTLINED_FUNCTION_1_12();
  uint64_t v2 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_20(v2);
}

- (NSUInteger)indexOfObject:(id)object
{
  OUTLINED_FUNCTION_1_12();
  uint64_t v3 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_20(v3);
}

- (id)objectAtIndex:(NSUInteger)idx
{
  OUTLINED_FUNCTION_1_12();
  uint64_t v3 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_20(v3);
}

- (NSOrderedSet)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  OUTLINED_FUNCTION_1_12();
  BOOL v4 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_20(v4);
}

@end