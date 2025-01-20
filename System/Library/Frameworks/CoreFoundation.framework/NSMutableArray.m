@interface NSMutableArray
+ (NSMutableArray)arrayWithCapacity:(NSUInteger)numItems;
- (NSMutableArray)initWithCapacity:(NSUInteger)numItems;
- (NSMutableArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)arrayByAddingObjectsFromArray:(id)a3;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)addObject:(id)anObject;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(NSArray *)otherArray;
- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromOrderedSet:(id)a3;
- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromSet:(id)a3;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeFirstObject;
- (void)removeLastObject;
- (void)removeObject:(id)anObject;
- (void)removeObject:(id)anObject inRange:(NSRange)range;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjectIdenticalTo:(id)anObject;
- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (void)removeObjectsInArray:(NSArray *)otherArray;
- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInOrderedSet:(id)a3;
- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInRange:(NSRange)range;
- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4;
- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5;
- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4;
- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5;
- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4;
- (void)removeObjectsInSet:(id)a3;
- (void)removeObjectsPassingTest:(id)a3;
- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)replaceObject:(id)a3;
- (void)replaceObject:(id)a3 inRange:(_NSRange)a4;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4;
- (void)setArray:(NSArray *)otherArray;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (void)setOrderedSet:(id)a3;
- (void)setSet:(id)a3;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(NSComparator)cmptr;
- (void)sortUsingFunction:(NSInteger (__cdecl *)compare context:;
- (void)sortUsingFunction:(void *)a3 context:(void *)a4 range:(_NSRange)a5;
- (void)sortUsingSelector:(SEL)comparator;
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
@end

@implementation NSMutableArray

- (void)addObjectsFromArray:(NSArray *)otherArray
{
  v4 = otherArray;
  uint64_t v30 = *(void *)off_1ECE0A5B0;
  if (otherArray)
  {
    if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
    {
      CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray addObjectsFromArray:]");
      __int16 v7 = _CFAutoreleasePoolAddObject(0, (uint64_t)v6);
      CFLog(3, @"%@", v8, v9, v10, v11, v12, v13, v7);
      if (objc_opt_respondsToSelector())
      {
        v14 = +[NSArray array];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v15 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v4);
              }
              [(NSArray *)v14 addObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            }
            uint64_t v16 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v25 count:16];
          }
          while (v16);
        }
        v4 = v14;
      }
    }
  }
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!v4) {
      goto LABEL_15;
    }
  }
  else if (!v4)
  {
    goto LABEL_15;
  }
  if ((_NSIsNSArray((uint64_t)v4) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    v21 = &v25[-((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableArray addObjectsFromArray:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray addObjectsFromArray:]");
    v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v21 size:v19];
    objc_exception_throw(v24);
  }
LABEL_15:
  -[NSMutableArray insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", v4, 0, [(NSArray *)v4 count], [(NSArray *)self count]);
}

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange
{
  NSUInteger length = otherRange.length;
  NSUInteger location = otherRange.location;
  NSUInteger v9 = range.length;
  NSUInteger v10 = range.location;
  v58[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    uint64_t v36 = _os_log_pack_size();
    v38 = (char *)v58 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]";
    CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]");
    v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
    objc_exception_throw(v41);
  }
LABEL_4:
  NSUInteger v12 = [(NSArray *)otherArray count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v22 = (char *)v58 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = _os_log_pack_fill();
      double v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v24, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      long long v26 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v25) userInfo:0 osLogPack:v22 size:v20];
      objc_exception_throw(v26);
    }
    NSUInteger v42 = v12;
    uint64_t v43 = _os_log_pack_size();
    v45 = (char *)v58 - ((MEMORY[0x1F4188790](v43, v44) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v46 = _os_log_pack_fill();
    double v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v46, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length, --v42);
    CFStringRef v48 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v47, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length, v42);
    v49 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v48) userInfo:0 osLogPack:v45 size:v43];
    objc_exception_throw(v49);
  }
  NSUInteger v13 = [(NSArray *)self count];
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      uint64_t v27 = _os_log_pack_size();
      long long v29 = (char *)v58 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v31, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      v33 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v29 size:v27];
      objc_exception_throw(v33);
    }
    NSUInteger v50 = v13;
    uint64_t v51 = _os_log_pack_size();
    v53 = (char *)v58 - ((MEMORY[0x1F4188790](v51, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v54 = _os_log_pack_fill();
    double v55 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v54, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, --v50);
    CFStringRef v56 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v55, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, v50);
    v57 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v56) userInfo:0 osLogPack:v53 size:v51];
    objc_exception_throw(v57);
  }
  if (length >> 60)
  {
    CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    v35 = +[NSException exceptionWithName:@"NSGenericException" reason:v34 userInfo:0];
    CFRelease(v34);
    objc_exception_throw(v35);
  }
  if (length <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = length;
  }
  unint64_t v16 = MEMORY[0x1F4188790](v15, v14);
  v18 = (char *)v58 - v17;
  v58[0] = 0;
  if (length >= 0x101)
  {
    v18 = (char *)_CFCreateArrayStorage(v16, 0, v58);
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  -[NSArray getObjects:range:](otherArray, "getObjects:range:", v18, location, length, v58[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v12 = [(NSArray *)self count];
  NSUInteger v13 = v12;
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v21 = (char *)v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v34 = _os_log_pack_fill();
      double v35 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9, v13 - 1);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v35, "-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9, v13 - 1);
    }
    else
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v21 = (char *)v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v23, "-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9);
    }
    uint64_t v36 = _CFAutoreleasePoolAddObject(0, (uint64_t)v24);
    uint64_t v37 = v21;
    uint64_t v38 = v20;
LABEL_28:
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v36 userInfo:0 osLogPack:v37 size:v38]);
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v30 = _os_log_pack_size();
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[NSMutableArray removeObjectsInRange:inArray:range:]";
    CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray removeObjectsInRange:inArray:range:]");
    v33 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:(char *)v41 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0) size:v30];
    objc_exception_throw(v33);
  }
  unint64_t v14 = [a4 count];
  unint64_t v15 = v14;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v14 < location + length)
  {
    if (v14)
    {
      uint64_t v25 = _os_log_pack_size();
      long long v26 = (char *)v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v39 = _os_log_pack_fill();
      double v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v39, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length, v15 - 1);
      CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v40, "-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length, v15 - 1);
    }
    else
    {
      uint64_t v25 = _os_log_pack_size();
      long long v26 = (char *)v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v27 = _os_log_pack_fill();
      double v28 = __os_log_helper_1_2_3_8_32_8_0_8_0(v27, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length);
      CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v28, "-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length);
    }
    uint64_t v36 = _CFAutoreleasePoolAddObject(0, (uint64_t)v29);
    uint64_t v37 = v26;
    uint64_t v38 = v25;
    goto LABEL_28;
  }
  unint64_t v16 = (void *)_CFAutoreleasePoolPush();
  uint64_t v17 = +[NSSet setWithArray:range:copyItems:](NSSet, "setWithArray:range:copyItems:", a4, location, length, 0);
  if (v9)
  {
    v18 = v17;
    NSUInteger v19 = v9 - 1;
    do
    {
      if ([(NSSet *)v18 containsObject:[(NSArray *)self objectAtIndex:v10 + v19]])
      {
        [(NSMutableArray *)self removeObjectAtIndex:v19];
      }
      --v19;
    }
    while (v19 != -1);
  }

  _CFAutoreleasePoolPop(v16);
}

+ (NSMutableArray)arrayWithCapacity:(NSUInteger)numItems
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:numItems];

  return (NSMutableArray *)v3;
}

- (void)removeObjectsInArray:(NSArray *)otherArray
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    uint64_t v8 = _os_log_pack_size();
    NSUInteger v10 = (char *)v14 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableArray removeObjectsInArray:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray removeObjectsInArray:]");
    NSUInteger v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];
  NSUInteger v7 = [(NSArray *)otherArray count];

  -[NSMutableArray removeObjectsInRange:inArray:range:](self, "removeObjectsInRange:inArray:range:", 0, v6, otherArray, 0, v7);
}

- (void)sortUsingFunction:(NSInteger (__cdecl *)compare context:
{
  v10[6] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (compare) {
      goto LABEL_3;
    }
LABEL_5:
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: function pointer cannot be NULL", "-[NSMutableArray sortUsingFunction:context:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0];
    objc_exception_throw(v9);
  }
  if (!compare) {
    goto LABEL_5;
  }
LABEL_3:
  v10[0] = off_1ECE0A5A0;
  v10[1] = 3221225472;
  v10[2] = __44__NSMutableArray_sortUsingFunction_context___block_invoke;
  v10[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v10[4] = compare;
  v10[5] = context;
  [(NSMutableArray *)self sortWithOptions:0 usingComparator:v10];
}

- (void)sortUsingSelector:(SEL)comparator
{
  v6[5] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (comparator) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!comparator) {
LABEL_3:
  }
    [self doesNotRecognizeSelector:0];
LABEL_4:
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __36__NSMutableArray_sortUsingSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v6[4] = comparator;
  [(NSMutableArray *)self sortWithOptions:0 usingComparator:v6];
}

- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v15[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v11 = (char *)v15 - ((MEMORY[0x1F4188790](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableArray sortWithOptions:usingComparator:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSMutableArray sortWithOptions:usingComparator:]");
    unint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v9];
    objc_exception_throw(v14);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!cmptr) {
    goto LABEL_8;
  }
LABEL_3:
  NSUInteger v8 = [(NSArray *)self count];
  if (v8 >= 2)
  {
    -[NSMutableArray sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v8, opts, cmptr);
  }
}

- (void)sortUsingComparator:(NSComparator)cmptr
{
  v13[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v9 = (char *)v13 - ((MEMORY[0x1F4188790](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableArray sortUsingComparator:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSMutableArray sortUsingComparator:]");
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v7];
    objc_exception_throw(v12);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!cmptr) {
    goto LABEL_8;
  }
LABEL_3:
  NSUInteger v6 = [(NSArray *)self count];
  if (v6 >= 2)
  {
    -[NSMutableArray sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v6, 0, cmptr);
  }
}

- (void)removeObjectIdenticalTo:(id)anObject
{
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v5 = [(NSArray *)self count];
  id v6 = anObject;
  if (v5)
  {
    NSUInteger v7 = v5 - 1;
    do
    {
      if ([(NSArray *)self objectAtIndex:v7] == anObject) {
        [(NSMutableArray *)self removeObjectAtIndex:v7];
      }
      --v7;
    }
    while (v7 != -1);
  }
}

- (void)removeAllObjects
{
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  NSUInteger v4 = [(NSArray *)self count];
  if (v4)
  {
    NSUInteger v5 = v4 - 1;
    do
      [(NSMutableArray *)self removeObjectAtIndex:v5--];
    while (v5 != -1);
  }
}

- (void)removeObject:(id)anObject
{
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v5 = [(NSArray *)self count];
  id v6 = anObject;
  if (v5)
  {
    NSUInteger v7 = v5 - 1;
    do
    {
      if ([(NSArray *)self objectAtIndex:v7] == anObject
        || objc_msgSend(anObject, "isEqual:"))
      {
        [(NSMutableArray *)self removeObjectAtIndex:v7];
      }
      --v7;
    }
    while (v7 != -1);
  }
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  char v7 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v53[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a5) {
      goto LABEL_3;
    }
LABEL_27:
    uint64_t v28 = _os_log_pack_size();
    uint64_t v30 = (char *)&v50 - ((MEMORY[0x1F4188790](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[NSMutableArray sortRange:options:usingComparator:]";
    CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSMutableArray sortRange:options:usingComparator:]");
    v33 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v30 size:v28];
    objc_exception_throw(v33);
  }
  if (!a5) {
    goto LABEL_27;
  }
LABEL_3:
  NSUInteger v11 = [(NSArray *)self count];
  NSUInteger v13 = v11;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      uint64_t v34 = _os_log_pack_size();
      uint64_t v36 = (char *)&v50 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v37 = _os_log_pack_fill();
      double v38 = __os_log_helper_1_2_3_8_32_8_0_8_0(v37, (uint64_t)"-[NSMutableArray sortRange:options:usingComparator:]", location, length);
      CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v38, "-[NSMutableArray sortRange:options:usingComparator:]", location, length);
      double v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v36 size:v34];
      objc_exception_throw(v40);
    }
    uint64_t v41 = _os_log_pack_size();
    uint64_t v43 = (char *)&v50 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    double v45 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSMutableArray sortRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v45, "-[NSMutableArray sortRange:options:usingComparator:]", location, length, v13 - 1);
    double v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v47);
  }
  if (length >= 2)
  {
    if (length >> 60)
    {
      CFStringRef v48 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
      v49 = +[NSException exceptionWithName:@"NSGenericException" reason:v48 userInfo:0];
      CFRelease(v48);
      objc_exception_throw(v49);
    }
    if (length >= 0x101) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = length;
    }
    uint64_t v15 = 8 * v14;
    MEMORY[0x1F4188790](v11, v12);
    uint64_t v17 = (char *)&v50 - v16;
    v53[0] = 0;
    if (length >= 0x101)
    {
      uint64_t v17 = (char *)_CFCreateArrayStorage(length, 0, v53);
      NSUInteger v50 = v17;
    }
    else
    {
      NSUInteger v50 = 0;
    }
    uint64_t v18 = -[NSArray getObjects:range:](self, "getObjects:range:", v17, location, length, v50);
    MEMORY[0x1F4188790](v18, v19);
    uint64_t v21 = (char *)&v50 - v20;
    uint64_t v22 = (char *)&v50 - v20;
    if (length > 0x1000) {
      uint64_t v22 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
    }
    v52[0] = off_1ECE0A5A0;
    v52[1] = 3221225472;
    v52[2] = __52__NSMutableArray_sortRange_options_usingComparator___block_invoke;
    v52[3] = &unk_1ECDABB78;
    v52[4] = a5;
    v52[5] = v17;
    CFSortIndexes((uint64_t)v22, length, v7, (uint64_t)v52);
    MEMORY[0x1F4188790](v23, v24);
    uint64_t v25 = 0;
    size_t v51 = 0;
    if (length >= 0x101) {
      uint64_t v25 = (char *)_CFCreateArrayStorage(length, 0, &v51);
    }
    uint64_t v26 = 0;
    if (length >= 0x101) {
      uint64_t v27 = v25;
    }
    else {
      uint64_t v27 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    }
    do
    {
      *(void *)&v27[8 * v26] = *(void *)&v17[8 * *(void *)&v22[8 * v26]];
      ++v26;
    }
    while (length != v26);
    -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length);
    if (v21 != v22) {
      free(v22);
    }
    free(v25);
    free(v50);
  }
}

- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v56[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v56 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSMutableArray insertObjectsFromArray:range:atIndex:]";
    CFStringRef v38 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray insertObjectsFromArray:range:atIndex:]");
    CFStringRef v39 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v38) userInfo:0 osLogPack:v36 size:v34];
    objc_exception_throw(v39);
  }
LABEL_4:
  unint64_t v11 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      uint64_t v19 = _os_log_pack_size();
      uint64_t v21 = (char *)v56 - ((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v23, "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length);
      uint64_t v25 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v21 size:v19];
      objc_exception_throw(v25);
    }
    unint64_t v40 = v11;
    uint64_t v41 = _os_log_pack_size();
    uint64_t v43 = (char *)v56 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    double v45 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length, --v40);
    CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v45, "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length, v40);
    double v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v47);
  }
  unint64_t v12 = [(NSArray *)self count];
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      uint64_t v26 = _os_log_pack_size();
      uint64_t v28 = (char *)v56 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315394;
      *(void *)(v29 + 4) = "-[NSMutableArray insertObjectsFromArray:range:atIndex:]";
      *(_WORD *)(v29 + 12) = 2048;
      *(void *)(v29 + 14) = a5;
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", a5);
      uint64_t v31 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v31);
    }
    unint64_t v48 = v12;
    uint64_t v49 = _os_log_pack_size();
    size_t v51 = (char *)v56 - ((MEMORY[0x1F4188790](v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v52 = _os_log_pack_fill();
    double v53 = __os_log_helper_1_2_3_8_32_8_0_8_0(v52, (uint64_t)"-[NSMutableArray insertObjectsFromArray:range:atIndex:]", a5, --v48);
    CFStringRef v54 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v53, "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", a5, v48);
    double v55 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v54) userInfo:0 osLogPack:v51 size:v49];
    objc_exception_throw(v55);
  }
  if (length >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    v33 = +[NSException exceptionWithName:@"NSGenericException" reason:v32 userInfo:0];
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (length <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = length;
  }
  unint64_t v15 = MEMORY[0x1F4188790](v14, v13);
  uint64_t v17 = (char *)v56 - v16;
  v56[0] = 0;
  if (length >= 0x101)
  {
    uint64_t v17 = (char *)_CFCreateArrayStorage(v15, 0, v56);
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v17, location, length, v56[0]);
  [(NSMutableArray *)self insertObjects:v17 count:length atIndex:a5];
  free(v18);
}

uint64_t __52__NSMutableArray_sortRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8 * a2), *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

uint64_t __44__NSMutableArray_sortUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

id __36__NSMutableArray_sortUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  v6.receiver = self;
  v6.super_class = (Class)NSMutableArray;
  return (id)objc_msgSend(-[NSArray sortedArrayFromRange:options:usingComparator:](&v6, sel_sortedArrayFromRange_options_usingComparator_, a3.location, a3.length, a4, a5), "copy");
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
  v27[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (indexes) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    unint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableArray removeObjectsAtIndexes:]");
    goto LABEL_14;
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!indexes) {
    goto LABEL_12;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    unint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableArray removeObjectsAtIndexes:]");
LABEL_14:
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  NSUInteger v6 = [(NSArray *)self count];
  uint64_t v7 = [0 count];
  NSUInteger v8 = [(NSIndexSet *)indexes lastIndex];
  if ((v8 & 0x8000000000000000) != 0)
  {
    uint64_t v20 = v8;
    NSUInteger v9 = v7 + v6;
    goto LABEL_17;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v9 = v7 + v6;
    if (v9 <= v8)
    {
      uint64_t v20 = v8;
LABEL_17:
      uint64_t v21 = _os_log_pack_size();
      uint64_t v22 = _os_log_pack_fill();
      if (v9)
      {
        uint64_t v24 = v9 - 1;
        double v25 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsAtIndexes:]", v20, v24);
        CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v25, "-[NSMutableArray removeObjectsAtIndexes:]", v20, v24);
      }
      else
      {
        *(_DWORD *)uint64_t v22 = 136315394;
        *(void *)(v22 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
        *(_WORD *)(v22 + 12) = 2048;
        *(void *)(v22 + 14) = v20;
        CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty array", "-[NSMutableArray removeObjectsAtIndexes:]", v20);
      }
      uint64_t v26 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:(char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0) size:v21];
      objc_exception_throw(v26);
    }
  }
  uint64_t v10 = [(NSIndexSet *)indexes rangeCount];
  if (v10)
  {
    uint64_t v11 = v10 - 1;
    do
    {
      uint64_t v12 = [(NSIndexSet *)indexes rangeAtIndex:v11];
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v12, v13);
      --v11;
    }
    while (v11 != -1);
  }
}

- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
  v60[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!objects) {
      goto LABEL_4;
    }
  }
  else if (!objects)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    uint64_t v54 = _os_log_pack_size();
    CFStringRef v56 = (char *)v60 - ((MEMORY[0x1F4188790](v54, v55) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v57 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v57 = 136315138;
    *(void *)(v57 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringRef v58 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray insertObjects:atIndexes:]");
    v59 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v58) userInfo:0 osLogPack:v56 size:v54];
    objc_exception_throw(v59);
  }
LABEL_4:
  if (!indexes)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v60 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableArray insertObjects:atIndexes:]");
    uint64_t v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v32 = _os_log_pack_size();
    uint64_t v34 = (char *)v60 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableArray insertObjects:atIndexes:]");
    uint64_t v37 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v36) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v37);
  }
  NSUInteger v8 = [(NSArray *)self count];
  NSUInteger v9 = [(NSArray *)objects count];
  NSUInteger v10 = [(NSIndexSet *)indexes lastIndex];
  if ((v10 & 0x8000000000000000) != 0)
  {
    uint64_t v38 = v10;
    NSUInteger v11 = v9 + v8;
    goto LABEL_26;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = v9 + v8;
    if (v11 <= v10)
    {
      uint64_t v38 = v10;
LABEL_26:
      if (!v11)
      {
        uint64_t v39 = _os_log_pack_size();
        uint64_t v41 = (char *)v60 - ((MEMORY[0x1F4188790](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v42 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v42 = 136315394;
        *(void *)(v42 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
        *(_WORD *)(v42 + 12) = 2048;
        *(void *)(v42 + 14) = v38;
        CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty array", "-[NSMutableArray insertObjects:atIndexes:]", v38);
        uint64_t v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
        objc_exception_throw(v44);
      }
      uint64_t v45 = _os_log_pack_size();
      double v47 = (char *)v60 - ((MEMORY[0x1F4188790](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableArray insertObjects:atIndexes:]", v38, v11 - 1);
      CFStringRef v50 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v49, "-[NSMutableArray insertObjects:atIndexes:]", v38, v11 - 1);
      size_t v51 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v50) userInfo:0 osLogPack:v47 size:v45];
      objc_exception_throw(v51);
    }
  }
  NSUInteger v12 = [(NSArray *)objects count];
  NSUInteger v13 = [(NSIndexSet *)indexes count];
  if (v12 != v13) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of array (%lu) differs from count of index set (%lu)", "-[NSMutableArray insertObjects:atIndexes:]", v12, v13);
  }
  NSUInteger v14 = [(NSArray *)objects count];
  unint64_t v16 = v14;
  if (v14 >> 60)
  {
    CFStringRef v52 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v14);
    double v53 = +[NSException exceptionWithName:@"NSGenericException" reason:v52 userInfo:0];
    CFRelease(v52);
    objc_exception_throw(v53);
  }
  if (v14 <= 1) {
    NSUInteger v14 = 1;
  }
  unint64_t v17 = MEMORY[0x1F4188790](v14, v15);
  uint64_t v19 = (char *)v60 - v18;
  v60[0] = 0;
  if (v16 >= 0x101)
  {
    uint64_t v19 = (char *)_CFCreateArrayStorage(v17, 0, v60);
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v20 = 0;
  }
  -[NSArray getObjects:range:](objects, "getObjects:range:", v19, 0, v16, v60[0]);
  uint64_t v21 = 0;
  for (unint64_t i = 0; i < [(NSIndexSet *)indexes rangeCount]; ++i)
  {
    uint64_t v23 = [(NSIndexSet *)indexes rangeAtIndex:i];
    uint64_t v25 = v24;
    [(NSMutableArray *)self insertObjects:&v19[8 * v21] count:v24 atIndex:v23];
    v21 += v25;
  }
  free(v20);
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
  v60[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!objects) {
      goto LABEL_4;
    }
  }
  else if (!objects)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    uint64_t v54 = _os_log_pack_size();
    CFStringRef v56 = (char *)v60 - ((MEMORY[0x1F4188790](v54, v55) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v57 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v57 = 136315138;
    *(void *)(v57 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringRef v58 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
    v59 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v58) userInfo:0 osLogPack:v56 size:v54];
    objc_exception_throw(v59);
  }
LABEL_4:
  if (!indexes)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v60 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
    uint64_t v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v32 = _os_log_pack_size();
    uint64_t v34 = (char *)v60 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
    uint64_t v37 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v36) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v37);
  }
  NSUInteger v8 = [(NSArray *)self count];
  NSUInteger v9 = [(NSArray *)objects count];
  NSUInteger v10 = [(NSIndexSet *)indexes lastIndex];
  if ((v10 & 0x8000000000000000) != 0)
  {
    uint64_t v38 = v10;
    NSUInteger v11 = v9 + v8;
    goto LABEL_26;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = v9 + v8;
    if (v11 <= v10)
    {
      uint64_t v38 = v10;
LABEL_26:
      if (!v11)
      {
        uint64_t v39 = _os_log_pack_size();
        uint64_t v41 = (char *)v60 - ((MEMORY[0x1F4188790](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v42 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v42 = 136315394;
        *(void *)(v42 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
        *(_WORD *)(v42 + 12) = 2048;
        *(void *)(v42 + 14) = v38;
        CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty array", "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v38);
        uint64_t v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
        objc_exception_throw(v44);
      }
      uint64_t v45 = _os_log_pack_size();
      double v47 = (char *)v60 - ((MEMORY[0x1F4188790](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v38, v11 - 1);
      CFStringRef v50 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v49, "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v38, v11 - 1);
      size_t v51 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v50) userInfo:0 osLogPack:v47 size:v45];
      objc_exception_throw(v51);
    }
  }
  NSUInteger v12 = [(NSArray *)objects count];
  NSUInteger v13 = [(NSIndexSet *)indexes count];
  if (v12 != v13) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of array (%lu) differs from count of index set (%lu)", "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v12, v13);
  }
  NSUInteger v14 = [(NSArray *)objects count];
  unint64_t v16 = v14;
  if (v14 >> 60)
  {
    CFStringRef v52 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v14);
    double v53 = +[NSException exceptionWithName:@"NSGenericException" reason:v52 userInfo:0];
    CFRelease(v52);
    objc_exception_throw(v53);
  }
  if (v14 <= 1) {
    NSUInteger v14 = 1;
  }
  unint64_t v17 = MEMORY[0x1F4188790](v14, v15);
  uint64_t v19 = (char *)v60 - v18;
  v60[0] = 0;
  if (v16 >= 0x101)
  {
    uint64_t v19 = (char *)_CFCreateArrayStorage(v17, 0, v60);
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v20 = 0;
  }
  -[NSArray getObjects:range:](objects, "getObjects:range:", v19, 0, v16, v60[0]);
  uint64_t v21 = 0;
  for (unint64_t i = 0; i < [(NSIndexSet *)indexes rangeCount]; ++i)
  {
    uint64_t v23 = [(NSIndexSet *)indexes rangeAtIndex:i];
    uint64_t v25 = v24;
    -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v23, v24, &v19[8 * v21], v24);
    v21 += v25;
  }
  free(v20);
}

- (id)arrayByAddingObjectsFromArray:(id)a3
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    uint64_t v21 = (char *)&v25 - ((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableArray arrayByAddingObjectsFromArray:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray arrayByAddingObjectsFromArray:]");
    uint64_t v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v21 size:v19];
    objc_exception_throw(v24);
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  uint64_t v6 = [a3 count];
  NSUInteger v7 = [(NSArray *)self count];
  unint64_t v8 = v7 + v6;
  if ((v7 + v6) >> 60)
  {
    CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7 + v6);
    uint64_t v18 = +[NSException exceptionWithName:@"NSGenericException" reason:v17 userInfo:0];
    CFRelease(v17);
    objc_exception_throw(v18);
  }
  NSUInteger v9 = v7;
  size_t v25 = 0;
  if (v8 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = v7 + v6;
  }
  NSUInteger v11 = (id *)_CFCreateArrayStorage(v10, 0, &v25);
  if (v9) {
    -[NSArray getObjects:range:](self, "getObjects:range:", v11, 0, v9, v25, v26);
  }
  if (v6) {
    objc_msgSend(a3, "getObjects:range:", &v11[v9], 0, v6);
  }
  if (v11)
  {
    if (v8)
    {
      NSUInteger v12 = v11;
      unint64_t v13 = v8;
      do
      {
        id v14 = *v12++;
        --v13;
      }
      while (v13);
    }
    uint64_t v15 = [[NSArray alloc] _initByAdoptingBuffer:v11 count:v8 size:v8];
  }
  else
  {
    uint64_t v15 = [[NSArray alloc] initWithObjects:0 count:v8];
  }
  return v15;
}

- (void)setArray:(NSArray *)otherArray
{
  v22[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    uint64_t v14 = _os_log_pack_size();
    unint64_t v16 = (char *)v22 - ((MEMORY[0x1F4188790](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray setArray:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray setArray:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v16 size:v14];
    objc_exception_throw(v19);
  }
LABEL_4:
  if (self != (NSMutableArray *)otherArray)
  {
    NSUInteger v6 = [(NSArray *)self count];
    NSUInteger v7 = [(NSArray *)otherArray count];
    unint64_t v9 = v7;
    if (v7 >> 60)
    {
      CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
      uint64_t v21 = +[NSException exceptionWithName:@"NSGenericException" reason:v20 userInfo:0];
      CFRelease(v20);
      objc_exception_throw(v21);
    }
    if (v7 <= 1) {
      NSUInteger v7 = 1;
    }
    unint64_t v10 = MEMORY[0x1F4188790](v7, v8);
    NSUInteger v12 = (char *)v22 - v11;
    v22[0] = 0;
    if (v9 >= 0x101)
    {
      NSUInteger v12 = (char *)_CFCreateArrayStorage(v10, 0, v22);
      unint64_t v13 = v12;
    }
    else
    {
      unint64_t v13 = 0;
    }
    -[NSArray getObjects:range:](otherArray, "getObjects:range:", v12, 0, v9, v22[0]);
    -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", 0, v6, v12, v9);
    free(v13);
  }
}

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    uint64_t v27 = _os_log_pack_size();
    uint64_t v29 = (char *)v41 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]");
    uint64_t v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
LABEL_4:
  NSUInteger v9 = [(NSArray *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v18 = _os_log_pack_size();
      CFStringRef v20 = (char *)v41 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v22, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length);
      uint64_t v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v20 size:v18];
      objc_exception_throw(v24);
    }
    uint64_t v33 = _os_log_pack_size();
    uint64_t v35 = (char *)v41 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = v10 - 1;
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length, v37);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v38, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length, v37);
    uint64_t v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  NSUInteger v11 = [(NSArray *)otherArray count];
  unint64_t v13 = v11;
  if (v11 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v11 <= 1) {
    NSUInteger v11 = 1;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v11, v12);
  unint64_t v16 = (char *)v41 - v15;
  v41[0] = 0;
  if (v13 >= 0x101)
  {
    unint64_t v16 = (char *)_CFCreateArrayStorage(v14, 0, v41);
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  -[NSArray getObjects:range:](otherArray, "getObjects:range:", v16, 0, v13, v41[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)addObject:(id)anObject
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (anObject) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableArray addObject:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableArray addObject:]");
    NSUInteger v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!anObject) {
    goto LABEL_7;
  }
LABEL_3:
  NSUInteger v6 = [(NSArray *)self count];

  [(NSMutableArray *)self insertObject:anObject atIndex:v6];
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v20[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSMutableArray addObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableArray addObjects:count:]", a4);
    goto LABEL_17;
  }
LABEL_4:
  if (a4 >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSMutableArray addObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableArray addObjects:count:]", a4);
LABEL_17:
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      if (!a3[v8])
      {
        uint64_t v10 = _os_log_pack_size();
        uint64_t v11 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v11 = 136315394;
        *(void *)(v11 + 4) = "-[NSMutableArray addObjects:count:]";
        *(_WORD *)(v11 + 12) = 2048;
        *(void *)(v11 + 14) = v8;
        CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableArray addObjects:count:]", v8);
        unint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
        objc_exception_throw(v13);
      }
      ++v8;
    }
    while (a4 != v8);
  }
  NSUInteger v9 = [(NSArray *)self count];

  [(NSMutableArray *)self insertObjects:a3 count:a4 atIndex:v9];
}

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray addObjectsFromArray:range:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray addObjectsFromArray:range:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
    objc_exception_throw(v19);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      unint64_t v20 = v9;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableArray addObjectsFromArray:range:]", location, length, --v20);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableArray addObjectsFromArray:range:]", location, length, v20);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray addObjectsFromArray:range:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSMutableArray addObjectsFromArray:range:]", location, length);
    }
    CFStringRef v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v23);
  }
  NSUInteger v10 = [(NSArray *)self count];

  -[NSMutableArray insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", a3, location, length, v10);
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray addObjectsFromOrderedSet:range:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray addObjectsFromOrderedSet:range:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
    objc_exception_throw(v19);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      unint64_t v20 = v9;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length, --v20);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length, v20);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length);
    }
    CFStringRef v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v23);
  }
  NSUInteger v10 = [(NSArray *)self count];

  -[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, location, length, v10);
}

- (void)addObjectsFromOrderedSet:(id)a3
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v8 = _os_log_pack_size();
    NSUInteger v10 = (char *)v14 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableArray addObjectsFromOrderedSet:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray addObjectsFromOrderedSet:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];
  uint64_t v7 = [a3 count];

  -[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, 0, v7, v6);
}

- (void)addObjectsFromSet:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableArray addObjectsFromSet:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableArray addObjectsFromSet:]");
    NSUInteger v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];

  [(NSMutableArray *)self insertObjectsFromSet:a3 atIndex:v6];
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
  v30[1] = *(id *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = [(NSArray *)self count];
  if ((idx1 & 0x8000000000000000) != 0 || v8 <= idx1)
  {
    if (v8)
    {
      NSUInteger v21 = v8;
      uint64_t v13 = _os_log_pack_size();
      double v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx1, --v21);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v23, "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx1, v21);
    }
    else
    {
      uint64_t v13 = _os_log_pack_size();
      double v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = idx1;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx1);
    }
    uint64_t v24 = _CFAutoreleasePoolAddObject(0, (uint64_t)v16);
    CFStringRef v25 = v14;
    uint64_t v26 = v13;
LABEL_24:
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v24 userInfo:0 osLogPack:v25 size:v26]);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((idx2 & 0x8000000000000000) != 0 || v9 <= idx2)
  {
    if (v9)
    {
      NSUInteger v27 = v9;
      uint64_t v17 = _os_log_pack_size();
      CFStringRef v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v28 = _os_log_pack_fill();
      double v29 = __os_log_helper_1_2_3_8_32_8_0_8_0(v28, (uint64_t)"-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx2, --v27);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v29, "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx2, v27);
    }
    else
    {
      uint64_t v17 = _os_log_pack_size();
      CFStringRef v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136315394;
      *(void *)(v19 + 4) = "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v19 + 12) = 2048;
      *(void *)(v19 + 14) = idx2;
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx2);
    }
    uint64_t v24 = _CFAutoreleasePoolAddObject(0, (uint64_t)v20);
    CFStringRef v25 = v18;
    uint64_t v26 = v17;
    goto LABEL_24;
  }
  if (idx1 != idx2)
  {
    if (idx2 <= idx1) {
      NSUInteger v10 = idx1;
    }
    else {
      NSUInteger v10 = idx2;
    }
    if (idx2 >= idx1) {
      idx2 = idx1;
    }
    v30[0] = [(NSArray *)self objectAtIndex:idx2];
    id v11 = [(NSArray *)self objectAtIndex:v10];
    id v12 = v30[0];
    [(NSMutableArray *)self replaceObjectAtIndex:idx2 withObject:v11];
    [(NSMutableArray *)self replaceObjectAtIndex:v10 withObject:v30[0]];
  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  v31[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    uint64_t v17 = _os_log_pack_size();
    CFStringRef v18 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a4;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableArray insertObjects:count:atIndex:]", a4);
    goto LABEL_19;
  }
LABEL_4:
  if (a4 >> 61)
  {
    uint64_t v17 = _os_log_pack_size();
    CFStringRef v18 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a4;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableArray insertObjects:count:atIndex:]", a4);
LABEL_19:
    uint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v17];
    objc_exception_throw(v22);
  }
  if (a4)
  {
    uint64_t v10 = 0;
    do
    {
      if (!a3[v10])
      {
        uint64_t v13 = _os_log_pack_size();
        uint64_t v14 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v14 = 136315394;
        *(void *)(v14 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
        *(_WORD *)(v14 + 12) = 2048;
        *(void *)(v14 + 14) = v10;
        CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableArray insertObjects:count:atIndex:]", v10);
        CFStringRef v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:(char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0) size:v13];
        objc_exception_throw(v16);
      }
      ++v10;
    }
    while (a4 != v10);
  }
  unint64_t v11 = [(NSArray *)self count];
  if ((a5 & 0x8000000000000000) != 0 || v11 < a5)
  {
    if (v11)
    {
      unint64_t v27 = v11;
      uint64_t v23 = _os_log_pack_size();
      uint64_t v24 = (char *)v31 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v28 = _os_log_pack_fill();
      double v29 = __os_log_helper_1_2_3_8_32_8_0_8_0(v28, (uint64_t)"-[NSMutableArray insertObjects:count:atIndex:]", a5, --v27);
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v29, "-[NSMutableArray insertObjects:count:atIndex:]", a5, v27);
    }
    else
    {
      uint64_t v23 = _os_log_pack_size();
      uint64_t v24 = (char *)v31 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v25 = 136315394;
      *(void *)(v25 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
      *(_WORD *)(v25 + 12) = 2048;
      *(void *)(v25 + 14) = a5;
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray insertObjects:count:atIndex:]", a5);
    }
    uint64_t v30 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v26) userInfo:0 osLogPack:v24 size:v23];
    objc_exception_throw(v30);
  }
  for (; a4; --a4)
  {
    uint64_t v12 = (uint64_t)*a3++;
    [(NSMutableArray *)self insertObject:v12 atIndex:a5++];
  }
}

- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    unint64_t v27 = (char *)v39 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSMutableArray insertObjectsFromArray:atIndex:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray insertObjectsFromArray:atIndex:]");
    uint64_t v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v8 = [(NSArray *)self count];
  unint64_t v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v19 = (char *)v39 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableArray insertObjectsFromArray:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = a4;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray insertObjectsFromArray:atIndex:]", a4);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
      objc_exception_throw(v22);
    }
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v39 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    uint64_t v35 = v9 - 1;
    double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSMutableArray insertObjectsFromArray:atIndex:]", a4, v35);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v36, "-[NSMutableArray insertObjectsFromArray:atIndex:]", a4, v35);
    double v38 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v38);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if (v10 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v10);
    uint64_t v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  unint64_t v13 = MEMORY[0x1F4188790](v10, v11);
  CFStringRef v15 = (char *)v39 - v14;
  v39[0] = 0;
  if (v12 >= 0x101)
  {
    CFStringRef v15 = (char *)_CFCreateArrayStorage(v13, 0, v39);
    CFStringRef v16 = v15;
  }
  else
  {
    CFStringRef v16 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v15, 0, v12, v39[0]);
  [(NSMutableArray *)self insertObjects:v15 count:v12 atIndex:a4];
  free(v16);
}

- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v56[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    double v36 = (char *)v56 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]";
    CFStringRef v38 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]");
    CFStringRef v39 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v38) userInfo:0 osLogPack:v36 size:v34];
    objc_exception_throw(v39);
  }
LABEL_4:
  unint64_t v11 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      uint64_t v19 = _os_log_pack_size();
      CFStringRef v21 = (char *)v56 - ((MEMORY[0x1F4188790](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v23, "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      uint64_t v25 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v21 size:v19];
      objc_exception_throw(v25);
    }
    unint64_t v40 = v11;
    uint64_t v41 = _os_log_pack_size();
    CFStringRef v43 = (char *)v56 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    double v45 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length, --v40);
    CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v45, "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length, v40);
    double v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v47);
  }
  unint64_t v12 = [(NSArray *)self count];
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      uint64_t v26 = _os_log_pack_size();
      uint64_t v28 = (char *)v56 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315394;
      *(void *)(v29 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]";
      *(_WORD *)(v29 + 12) = 2048;
      *(void *)(v29 + 14) = a5;
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", a5);
      uint64_t v31 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v31);
    }
    unint64_t v48 = v12;
    uint64_t v49 = _os_log_pack_size();
    size_t v51 = (char *)v56 - ((MEMORY[0x1F4188790](v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v52 = _os_log_pack_fill();
    double v53 = __os_log_helper_1_2_3_8_32_8_0_8_0(v52, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", a5, --v48);
    CFStringRef v54 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v53, "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", a5, v48);
    uint64_t v55 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v54) userInfo:0 osLogPack:v51 size:v49];
    objc_exception_throw(v55);
  }
  if (length >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    uint64_t v33 = +[NSException exceptionWithName:@"NSGenericException" reason:v32 userInfo:0];
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (length <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = length;
  }
  unint64_t v15 = MEMORY[0x1F4188790](v14, v13);
  uint64_t v17 = (char *)v56 - v16;
  v56[0] = 0;
  if (length >= 0x101)
  {
    uint64_t v17 = (char *)_CFCreateArrayStorage(v15, 0, v56);
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v17, location, length, v56[0]);
  [(NSMutableArray *)self insertObjects:v17 count:length atIndex:a5];
  free(v18);
}

- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v27 = (char *)v39 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]");
    CFStringRef v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v8 = [(NSArray *)self count];
  unint64_t v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v19 = (char *)v39 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = a4;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]", a4);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
      objc_exception_throw(v22);
    }
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v39 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    uint64_t v35 = v9 - 1;
    double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]", a4, v35);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v36, "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]", a4, v35);
    CFStringRef v38 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v38);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if (v10 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v10);
    CFStringRef v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  unint64_t v13 = MEMORY[0x1F4188790](v10, v11);
  unint64_t v15 = (char *)v39 - v14;
  v39[0] = 0;
  if (v12 >= 0x101)
  {
    unint64_t v15 = (char *)_CFCreateArrayStorage(v13, 0, v39);
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v15, 0, v12, v39[0]);
  [(NSMutableArray *)self insertObjects:v15 count:v12 atIndex:a4];
  free(v16);
}

- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v27 = (char *)v39 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSMutableArray insertObjectsFromSet:atIndex:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableArray insertObjectsFromSet:atIndex:]");
    CFStringRef v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v8 = [(NSArray *)self count];
  unint64_t v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v19 = (char *)v39 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableArray insertObjectsFromSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = a4;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray insertObjectsFromSet:atIndex:]", a4);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
      objc_exception_throw(v22);
    }
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v39 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    uint64_t v35 = v9 - 1;
    double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSMutableArray insertObjectsFromSet:atIndex:]", a4, v35);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v36, "-[NSMutableArray insertObjectsFromSet:atIndex:]", a4, v35);
    CFStringRef v38 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v38);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if (v10 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v10);
    CFStringRef v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  unint64_t v13 = MEMORY[0x1F4188790](v10, v11);
  unint64_t v15 = (char *)v39 - v14;
  v39[0] = 0;
  if (v12 >= 0x101)
  {
    unint64_t v15 = (char *)_CFCreateArrayStorage(v13, 0, v39);
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  objc_msgSend(a3, "getObjects:count:", v15, v12, v39[0]);
  [(NSMutableArray *)self insertObjects:v15 count:v12 atIndex:a4];
  free(v16);
}

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  v64[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v23 = _os_log_pack_size();
    uint64_t v25 = (char *)v64 - ((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableArray moveObjectsAtIndexes:toIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v25 size:v23];
    objc_exception_throw(v28);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a3) {
    goto LABEL_17;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v29 = _os_log_pack_size();
    uint64_t v31 = (char *)v64 - ((MEMORY[0x1F4188790](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136315138;
    *(void *)(v32 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
    CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableArray moveObjectsAtIndexes:toIndex:]");
    uint64_t v34 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v33) userInfo:0 osLogPack:v31 size:v29];
    objc_exception_throw(v34);
  }
  NSUInteger v8 = [(NSArray *)self count];
  uint64_t v9 = [0 count];
  unint64_t v10 = [a3 lastIndex];
  if ((v10 & 0x8000000000000000) != 0)
  {
    uint64_t v35 = v10;
    unint64_t v11 = v9 + v8;
    goto LABEL_21;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v9 + v8;
    if (v11 <= v10)
    {
      uint64_t v35 = v10;
LABEL_21:
      if (!v11)
      {
        uint64_t v36 = _os_log_pack_size();
        CFStringRef v38 = (char *)v64 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v39 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v39 = 136315394;
        *(void *)(v39 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
        *(_WORD *)(v39 + 12) = 2048;
        *(void *)(v39 + 14) = v35;
        CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty array", "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", v35);
        uint64_t v41 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
        objc_exception_throw(v41);
      }
      uint64_t v42 = _os_log_pack_size();
      uint64_t v44 = (char *)v64 - ((MEMORY[0x1F4188790](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v45 = _os_log_pack_fill();
      double v46 = __os_log_helper_1_2_3_8_32_8_0_8_0(v45, (uint64_t)"-[NSMutableArray moveObjectsAtIndexes:toIndex:]", v35, v11 - 1);
      CFStringRef v47 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v46, "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", v35, v11 - 1);
      unint64_t v48 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v47) userInfo:0 osLogPack:v44 size:v42];
      objc_exception_throw(v48);
    }
  }
  NSUInteger v12 = [(NSArray *)self count];
  uint64_t v13 = objc_msgSend(a3, "countOfIndexesInRange:", 0, a4);
  unint64_t v14 = v12 - v13;
  if ((a4 & 0x8000000000000000) != 0 || v14 < a4)
  {
    if (v12 == v13)
    {
      uint64_t v49 = _os_log_pack_size();
      size_t v51 = (char *)v64 - ((MEMORY[0x1F4188790](v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v52 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v52 = 136315394;
      *(void *)(v52 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v52 + 12) = 2048;
      *(void *)(v52 + 14) = a4;
      CFStringRef v53 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", a4);
      CFStringRef v54 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v53) userInfo:0 osLogPack:v51 size:v49];
      objc_exception_throw(v54);
    }
    uint64_t v57 = _os_log_pack_size();
    v59 = (char *)v64 - ((MEMORY[0x1F4188790](v57, v58) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v60 = _os_log_pack_fill();
    double v61 = __os_log_helper_1_2_3_8_32_8_0_8_0(v60, (uint64_t)"-[NSMutableArray moveObjectsAtIndexes:toIndex:]", a4, v14 - 1);
    CFStringRef v62 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v61, "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", a4, v14 - 1);
    v63 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v62) userInfo:0 osLogPack:v59 size:v57];
    objc_exception_throw(v63);
  }
  unint64_t v15 = [(NSArray *)self objectsAtIndexes:a3];
  [(NSMutableArray *)self removeObjectsAtIndexes:a3];
  unint64_t v16 = [(NSArray *)v15 count];
  unint64_t v18 = v16;
  if (v16 >> 60)
  {
    CFStringRef v55 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v16);
    CFStringRef v56 = +[NSException exceptionWithName:@"NSGenericException" reason:v55 userInfo:0];
    CFRelease(v55);
    objc_exception_throw(v56);
  }
  if (v16 <= 1) {
    unint64_t v16 = 1;
  }
  unint64_t v19 = MEMORY[0x1F4188790](v16, v17);
  CFStringRef v21 = (char *)v64 - v20;
  v64[0] = 0;
  if (v18 >= 0x101)
  {
    CFStringRef v21 = (char *)_CFCreateArrayStorage(v19, 0, v64);
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
  }
  -[NSArray getObjects:range:](v15, "getObjects:range:", v21, 0, v18, v64[0]);
  [(NSMutableArray *)self insertObjects:v21 count:v18 atIndex:a4];
  free(v22);
}

- (void)removeFirstObject
{
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  if ([(NSArray *)self count])
  {
    [(NSMutableArray *)self removeObjectAtIndex:0];
  }
}

- (void)removeLastObject
{
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  NSUInteger v4 = [(NSArray *)self count];
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!v4) {
      return;
    }
    goto LABEL_5;
  }
  if (v4) {
    NSUInteger v5 = v4 - 1;
  }
  else {
    NSUInteger v5 = 0;
  }
  [(NSMutableArray *)self removeObjectAtIndex:v5];
  if (v4)
  {
LABEL_5:
    [(NSMutableArray *)self removeObjectAtIndex:v4 - 1];
  }
}

- (void)removeObjectsInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v17[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v7 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v7 < location + length)
  {
    if (v7)
    {
      NSUInteger v13 = v7;
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v14, (uint64_t)"-[NSMutableArray removeObjectsInRange:]", location, length, --v13);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v15, "-[NSMutableArray removeObjectsInRange:]", location, length, v13);
    }
    else
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v10 = _os_log_pack_fill();
      double v11 = __os_log_helper_1_2_3_8_32_8_0_8_0(v10, (uint64_t)"-[NSMutableArray removeObjectsInRange:]", location, length);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v11, "-[NSMutableArray removeObjectsInRange:]", location, length);
    }
    unint64_t v16 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v16);
  }
  for (; length; --length)
    [(NSMutableArray *)self removeObjectAtIndex:location];
}

- (void)removeObject:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v20[0] = anObject;
  v20[1] = *(id *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      NSUInteger v16 = v8;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSMutableArray removeObject:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSMutableArray removeObject:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObject:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSMutableArray removeObject:inRange:]", location, length);
    }
    unint64_t v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  id v9 = v20[0];
  if (length)
  {
    NSUInteger v10 = location - 1;
    do
    {
      if ([(NSArray *)self objectAtIndex:v10 + length] == v20[0]
        || objc_msgSend(v20[0], "isEqual:"))
      {
        [(NSMutableArray *)self removeObjectAtIndex:v10 + length];
      }
      --length;
    }
    while (length);
  }
}

- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v20[0] = anObject;
  v20[1] = *(id *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      NSUInteger v16 = v8;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length);
    }
    unint64_t v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  id v9 = v20[0];
  if (length)
  {
    NSUInteger v10 = location - 1;
    do
    {
      if ([(NSArray *)self objectAtIndex:v10 + length] == v20[0]) {
        [(NSMutableArray *)self removeObjectAtIndex:v10 + length];
      }
      --length;
    }
    while (length);
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v28[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v23 = v9;
      uint64_t v11 = _os_log_pack_size();
      uint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:]", location, length, --v23);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v26, "-[NSMutableArray removeObjectsInRange:inArray:]", location, length, v23);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      uint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v15, "-[NSMutableArray removeObjectsInRange:inArray:]", location, length);
    }
    CFStringRef v27 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v27);
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    unint64_t v19 = (char *)v28 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableArray removeObjectsInRange:inArray:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray removeObjectsInRange:inArray:]");
    uint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
  uint64_t v10 = [a4 count];

  -[NSMutableArray removeObjectsInRange:inArray:range:](self, "removeObjectsInRange:inArray:range:", location, length, a4, 0, v10);
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v28[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    unint64_t v19 = (char *)v28 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableArray removeObjectsInArray:range:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableArray removeObjectsInArray:range:]");
    uint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      unint64_t v23 = v9;
      uint64_t v11 = _os_log_pack_size();
      uint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableArray removeObjectsInArray:range:]", location, length, --v23);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v26, "-[NSMutableArray removeObjectsInArray:range:]", location, length, v23);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      uint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSMutableArray removeObjectsInArray:range:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v15, "-[NSMutableArray removeObjectsInArray:range:]", location, length);
    }
    CFStringRef v27 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v27);
  }
  NSUInteger v10 = [(NSArray *)self count];

  -[NSMutableArray removeObjectsInRange:inArray:range:](self, "removeObjectsInRange:inArray:range:", 0, v10, a3, location, length);
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v38[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v12 = [(NSArray *)self count];
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      NSUInteger v29 = v12;
      uint64_t v15 = _os_log_pack_size();
      CFStringRef v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v30, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9, --v29);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v31, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9, v29);
    }
    else
    {
      uint64_t v15 = _os_log_pack_size();
      CFStringRef v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v18, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9);
    }
    uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v19);
    CFStringRef v33 = v16;
    uint64_t v34 = v15;
LABEL_26:
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v32 userInfo:0 osLogPack:v33 size:v34]);
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]";
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]");
    uint64_t v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:(char *)v38 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0) size:v25];
    objc_exception_throw(v28);
  }
  unint64_t v13 = [a4 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v13 < location + length)
  {
    if (v13)
    {
      unint64_t v35 = v13;
      uint64_t v20 = _os_log_pack_size();
      CFStringRef v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v36 = _os_log_pack_fill();
      double v37 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length, --v35);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v37, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length, v35);
    }
    else
    {
      uint64_t v20 = _os_log_pack_size();
      CFStringRef v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v23, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length);
    }
    uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v24);
    CFStringRef v33 = v21;
    uint64_t v34 = v20;
    goto LABEL_26;
  }
  if (v9)
  {
    NSUInteger v14 = v9 - 1;
    do
    {
      if (objc_msgSend(a4, "containsObject:inRange:", -[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + v14), location, length))-[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v14); {
      --v14;
      }
    }
    while (v14 != -1);
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v28[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v23 = v9;
      uint64_t v11 = _os_log_pack_size();
      unint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length, --v23);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v26, "-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length, v23);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      unint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v15, "-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length);
    }
    CFStringRef v27 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v27);
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    CFStringRef v19 = (char *)v28 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableArray removeObjectsInRange:inOrderedSet:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray removeObjectsInRange:inOrderedSet:]");
    uint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
  uint64_t v10 = [a4 count];

  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", location, length, a4, 0, v10);
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v28[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    CFStringRef v19 = (char *)v28 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableArray removeObjectsInOrderedSet:range:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray removeObjectsInOrderedSet:range:]");
    uint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
LABEL_4:
  unint64_t v9 = [a3 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      unint64_t v23 = v9;
      uint64_t v11 = _os_log_pack_size();
      unint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length, --v23);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v26, "-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length, v23);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      unint64_t v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v15, "-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length);
    }
    CFStringRef v27 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v27);
  }
  NSUInteger v10 = [(NSArray *)self count];

  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, v10, a3, location, length);
}

- (void)removeObjectsInOrderedSet:(id)a3
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v8 = _os_log_pack_size();
    NSUInteger v10 = (char *)v14 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableArray removeObjectsInOrderedSet:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray removeObjectsInOrderedSet:]");
    unint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];
  uint64_t v7 = [a3 count];

  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, v6, a3, 0, v7);
}

- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v20 = v9;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableArray removeObjectsInRange:inSet:]", location, length, --v20);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableArray removeObjectsInRange:inSet:]", location, length, v20);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInRange:inSet:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v14, "-[NSMutableArray removeObjectsInRange:inSet:]", location, length);
    }
    unint64_t v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v23);
  }
  if (a4 && (_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray removeObjectsInRange:inSet:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableArray removeObjectsInRange:inSet:]");
    CFStringRef v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
    objc_exception_throw(v19);
  }
  if (length)
  {
    NSUInteger v10 = length - 1;
    do
    {
      if (objc_msgSend(a4, "containsObject:", -[NSArray objectAtIndex:](self, "objectAtIndex:", location + v10)))-[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v10); {
      --v10;
      }
    }
    while (v10 != -1);
  }
}

- (void)removeObjectsInSet:(id)a3
{
  v13[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v7 = _os_log_pack_size();
    NSUInteger v9 = (char *)v13 - ((MEMORY[0x1F4188790](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableArray removeObjectsInSet:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableArray removeObjectsInSet:]");
    CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v7];
    objc_exception_throw(v12);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];

  -[NSMutableArray removeObjectsInRange:inSet:](self, "removeObjectsInRange:inSet:", 0, v6, a3);
}

- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v25[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v18 = _os_log_pack_size();
    CFStringRef v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  if (!a3) {
    goto LABEL_12;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v18 = _os_log_pack_size();
    CFStringRef v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  if (!a5)
  {
    uint64_t v18 = _os_log_pack_size();
    CFStringRef v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
LABEL_15:
    uint64_t v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v18];
    objc_exception_throw(v24);
  }
  unint64_t v11 = a4 & 0xAFFFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0) {
    unint64_t v11 = a4;
  }
  uint64_t v12 = v11 | 0x5000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v11 | 0x5000000000000000, a3);
  id IndexesPassingTest = __NSArrayGetIndexesPassingTest(self, (uint64_t)a5, v12, a3);
  uint64_t v14 = [IndexesPassingTest rangeCount];
  if (v14)
  {
    uint64_t v15 = v14 - 1;
    do
    {
      uint64_t v16 = [IndexesPassingTest rangeAtIndex:v15];
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v16, v17);
      --v15;
    }
    while (v15 != -1);
  }
}

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v20[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray removeObjectsWithOptions:passingTest:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableArray removeObjectsWithOptions:passingTest:]");
    CFStringRef v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
    objc_exception_throw(v19);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t v9 = a3 & 0xBFFFFFFFFFFFFFFELL;
  if ((a3 & 2) == 0) {
    unint64_t v9 = a3;
  }
  uint64_t v10 = v9 | 0x4000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v9 | 0x4000000000000000, 0);
  id IndexesPassingTest = __NSArrayGetIndexesPassingTest(self, (uint64_t)a4, v10, 0);
  uint64_t v12 = [IndexesPassingTest rangeCount];
  if (v12)
  {
    uint64_t v13 = v12 - 1;
    do
    {
      uint64_t v14 = [IndexesPassingTest rangeAtIndex:v13];
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v14, v15);
      --v13;
    }
    while (v13 != -1);
  }
}

- (void)removeObjectsPassingTest:(id)a3
{
  v7[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = "-[NSMutableArray removeObjectsPassingTest:]";
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableArray removeObjectsPassingTest:]");
    NSUInteger v6 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v5) userInfo:0 osLogPack:(char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) size:v3];
    objc_exception_throw(v6);
  }

  [(NSMutableArray *)self removeObjectsWithOptions:0 passingTest:a3];
}

- (void)replaceObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[0] = a3;
  v24[1] = *(id *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  if (!v24[0])
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableArray replaceObject:inRange:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableArray replaceObject:inRange:]");
    uint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
    objc_exception_throw(v14);
  }
  NSUInteger v8 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      NSUInteger v20 = v8;
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObject:inRange:]", location, length, --v20);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableArray replaceObject:inRange:]", location, length, v20);
    }
    else
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSMutableArray replaceObject:inRange:]", location, length);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v18, "-[NSMutableArray replaceObject:inRange:]", location, length);
    }
    uint64_t v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v16 size:v15];
    objc_exception_throw(v23);
  }
  id v9 = v24[0];
  if (length)
  {
    NSUInteger v10 = location - 1;
    do
    {
      if ([(NSArray *)self objectAtIndex:v10 + length] != v24[0]
        && objc_msgSend(v24[0], "isEqual:"))
      {
        [(NSMutableArray *)self replaceObjectAtIndex:v10 + length withObject:v24[0]];
      }
      --length;
    }
    while (length);
  }
}

- (void)replaceObject:(id)a3
{
  v12[0] = a3;
  v12[1] = *(id *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (!v12[0])
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "-[NSMutableArray replaceObject:]";
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableArray replaceObject:]");
    uint64_t v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:(char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) size:v8];
    objc_exception_throw(v11);
  }
  NSUInteger v5 = [(NSArray *)self count];
  id v6 = v12[0];
  if (v5)
  {
    NSUInteger v7 = v5 - 1;
    do
    {
      if ([(NSArray *)self objectAtIndex:v7] != v12[0]
        && objc_msgSend(v12[0], "isEqual:"))
      {
        [(NSMutableArray *)self replaceObjectAtIndex:v7 withObject:v12[0]];
      }
      --v7;
    }
    while (v7 != -1);
  }
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v46[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v11 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      NSUInteger v41 = v11;
      uint64_t v27 = _os_log_pack_size();
      NSUInteger v29 = (char *)v46 - ((MEMORY[0x1F4188790](v27, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v43 = _os_log_pack_fill();
      double v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v43, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length, --v41);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v44, "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length, v41);
    }
    else
    {
      uint64_t v27 = _os_log_pack_size();
      NSUInteger v29 = (char *)v46 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v31, "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length);
    }
    uint64_t v45 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v45);
  }
  if (!a4 && a5)
  {
    uint64_t v33 = _os_log_pack_size();
    unint64_t v35 = (char *)v46 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315394;
    *(void *)(v36 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v36 + 12) = 2048;
    *(void *)(v36 + 14) = a5;
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", a5);
    goto LABEL_37;
  }
  if (a5 >> 61)
  {
    uint64_t v33 = _os_log_pack_size();
    unint64_t v35 = (char *)v46 - ((MEMORY[0x1F4188790](v33, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315394;
    *(void *)(v39 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v39 + 12) = 2048;
    *(void *)(v39 + 14) = a5;
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", a5);
LABEL_37:
    CFStringRef v40 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  if (a5)
  {
    uint64_t v12 = 0;
    do
    {
      if (!a4[v12])
      {
        uint64_t v21 = _os_log_pack_size();
        uint64_t v23 = (char *)v46 - ((MEMORY[0x1F4188790](v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v24 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v24 = 136315394;
        *(void *)(v24 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v24 + 12) = 2048;
        *(void *)(v24 + 14) = v12;
        CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", v12);
        double v26 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v25) userInfo:0 osLogPack:v23 size:v21];
        objc_exception_throw(v26);
      }
      ++v12;
    }
    while (a5 != v12);
    unint64_t v13 = a5;
    uint64_t v14 = a4;
    do
    {
      if (((unint64_t)*v14 & 0x8000000000000000) == 0) {
        id v15 = (id)*v14;
      }
      ++v14;
      --v13;
    }
    while (v13);
  }
  if (length >= a5) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = length;
  }
  if (v16)
  {
    NSUInteger v17 = location;
    double v18 = a4;
    unint64_t v19 = v16;
    do
    {
      uint64_t v20 = (uint64_t)*v18++;
      [(NSMutableArray *)self replaceObjectAtIndex:v17++ withObject:v20];
      --v19;
    }
    while (v19);
  }
  if (length > a5)
  {
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v16 + location, length - v16);
    goto LABEL_27;
  }
  if (length >= a5)
  {
LABEL_27:
    if (!a5) {
      return;
    }
    goto LABEL_28;
  }
  [(NSMutableArray *)self insertObjects:&a4[v16] count:a5 - v16 atIndex:v16 + location];
  do
  {
LABEL_28:
    if (((unint64_t)*a4 & 0x8000000000000000) == 0) {

    }
    ++a4;
    --a5;
  }
  while (a5);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v58[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (!a4) {
      goto LABEL_4;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v36 = _os_log_pack_size();
    uint64_t v38 = (char *)v58 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]";
    CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]");
    NSUInteger v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
    objc_exception_throw(v41);
  }
LABEL_4:
  unint64_t v12 = [a4 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v22 = (char *)v58 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = _os_log_pack_fill();
      double v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v24, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      double v26 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v25) userInfo:0 osLogPack:v22 size:v20];
      objc_exception_throw(v26);
    }
    unint64_t v42 = v12;
    uint64_t v43 = _os_log_pack_size();
    uint64_t v45 = (char *)v58 - ((MEMORY[0x1F4188790](v43, v44) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v46 = _os_log_pack_fill();
    double v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v46, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, --v42);
    CFStringRef v48 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v47, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, v42);
    uint64_t v49 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v48) userInfo:0 osLogPack:v45 size:v43];
    objc_exception_throw(v49);
  }
  NSUInteger v13 = [(NSArray *)self count];
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      uint64_t v27 = _os_log_pack_size();
      NSUInteger v29 = (char *)v58 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v31, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      uint64_t v33 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v29 size:v27];
      objc_exception_throw(v33);
    }
    NSUInteger v50 = v13;
    uint64_t v51 = _os_log_pack_size();
    CFStringRef v53 = (char *)v58 - ((MEMORY[0x1F4188790](v51, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v54 = _os_log_pack_fill();
    double v55 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v54, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, --v50);
    CFStringRef v56 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v55, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, v50);
    uint64_t v57 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v56) userInfo:0 osLogPack:v53 size:v51];
    objc_exception_throw(v57);
  }
  if (length >> 60)
  {
    CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    unint64_t v35 = +[NSException exceptionWithName:@"NSGenericException" reason:v34 userInfo:0];
    CFRelease(v34);
    objc_exception_throw(v35);
  }
  if (length <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = length;
  }
  unint64_t v16 = MEMORY[0x1F4188790](v15, v14);
  double v18 = (char *)v58 - v17;
  v58[0] = 0;
  if (length >= 0x101)
  {
    double v18 = (char *)_CFCreateArrayStorage(v16, 0, v58);
    unint64_t v19 = v18;
  }
  else
  {
    unint64_t v19 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v18, location, length, v58[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a4) {
      goto LABEL_4;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    NSUInteger v29 = (char *)v41 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]");
    CFStringRef v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
LABEL_4:
  NSUInteger v9 = [(NSArray *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v20 = (char *)v41 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v22, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      double v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v20 size:v18];
      objc_exception_throw(v24);
    }
    uint64_t v33 = _os_log_pack_size();
    unint64_t v35 = (char *)v41 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = v10 - 1;
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v37);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v38, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v37);
    CFStringRef v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  unint64_t v11 = [a4 count];
  unint64_t v13 = v11;
  if (v11 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    double v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v11 <= 1) {
    unint64_t v11 = 1;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v11, v12);
  unint64_t v16 = (char *)v41 - v15;
  v41[0] = 0;
  if (v13 >= 0x101)
  {
    unint64_t v16 = (char *)_CFCreateArrayStorage(v14, 0, v41);
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v16, 0, v13, v41[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!a4) {
      goto LABEL_4;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    NSUInteger v29 = (char *)v41 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]");
    CFStringRef v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
LABEL_4:
  NSUInteger v9 = [(NSArray *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v20 = (char *)v41 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v22, "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length);
      double v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v20 size:v18];
      objc_exception_throw(v24);
    }
    uint64_t v33 = _os_log_pack_size();
    unint64_t v35 = (char *)v41 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = v10 - 1;
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length, v37);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v38, "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length, v37);
    CFStringRef v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  unint64_t v11 = [a4 count];
  unint64_t v13 = v11;
  if (v11 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    double v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v11 <= 1) {
    unint64_t v11 = 1;
  }
  unint64_t v14 = MEMORY[0x1F4188790](v11, v12);
  unint64_t v16 = (char *)v41 - v15;
  v41[0] = 0;
  if (v13 >= 0x101)
  {
    unint64_t v16 = (char *)_CFCreateArrayStorage(v14, 0, v41);
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_msgSend(a4, "getObjects:count:", v16, v13, v41[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v21[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableArray setObject:atIndex:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableArray setObject:atIndex:]");
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
    objc_exception_throw(v12);
  }
  if (!a3) {
    goto LABEL_13;
  }
LABEL_3:
  unint64_t v8 = [(NSArray *)self count];
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (v8)
    {
      unint64_t v17 = v8;
      uint64_t v13 = _os_log_pack_size();
      unint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSMutableArray setObject:atIndex:]", a4, --v17);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v19, "-[NSMutableArray setObject:atIndex:]", a4, v17);
    }
    else
    {
      uint64_t v13 = _os_log_pack_size();
      unint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableArray setObject:atIndex:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = a4;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[NSMutableArray setObject:atIndex:]", a4);
    }
    uint64_t v20 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v20);
  }
  if ([(NSArray *)self count] == a4)
  {
    [(NSMutableArray *)self insertObject:a3 atIndex:a4];
  }
  else
  {
    [(NSMutableArray *)self replaceObjectAtIndex:a4 withObject:a3];
  }
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }

  [(NSMutableArray *)self setObject:obj atIndex:idx];
}

- (void)setOrderedSet:(id)a3
{
  v22[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v22 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSMutableArray setOrderedSet:]";
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableArray setOrderedSet:]");
    uint64_t v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v16];
    objc_exception_throw(v21);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];
  unint64_t v7 = [a3 count];
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
    uint64_t v15 = +[NSException exceptionWithName:@"NSGenericException" reason:v14 userInfo:0];
    CFRelease(v14);
    objc_exception_throw(v15);
  }
  if (v7 <= 1) {
    unint64_t v7 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v7, v8);
  uint64_t v12 = (char *)v22 - v11;
  v22[0] = 0;
  if (v9 >= 0x101)
  {
    uint64_t v12 = (char *)_CFCreateArrayStorage(v10, 0, v22);
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v12, 0, v9, v22[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", 0, v6, v12, v9);
  free(v13);
}

- (void)setSet:(id)a3
{
  v22[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v22 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSMutableArray setSet:]";
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableArray setSet:]");
    uint64_t v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v16];
    objc_exception_throw(v21);
  }
LABEL_4:
  NSUInteger v6 = [(NSArray *)self count];
  unint64_t v7 = [a3 count];
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
    uint64_t v15 = +[NSException exceptionWithName:@"NSGenericException" reason:v14 userInfo:0];
    CFRelease(v14);
    objc_exception_throw(v15);
  }
  if (v7 <= 1) {
    unint64_t v7 = 1;
  }
  unint64_t v10 = MEMORY[0x1F4188790](v7, v8);
  uint64_t v12 = (char *)v22 - v11;
  v22[0] = 0;
  if (v9 >= 0x101)
  {
    uint64_t v12 = (char *)_CFCreateArrayStorage(v10, 0, v22);
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_msgSend(a3, "getObjects:count:", v12, v9, v22[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", 0, v6, v12, v9);
  free(v13);
}

- (void)sortUsingFunction:(void *)a3 context:(void *)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v24[6] = *(void *)off_1ECE0A5B0;
  [(NSMutableArray *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: function pointer cannot be NULL", "-[NSMutableArray sortUsingFunction:context:range:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0];
    objc_exception_throw(v13);
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  NSUInteger v11 = [(NSArray *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      NSUInteger v19 = v11;
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)&v24[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSMutableArray sortUsingFunction:context:range:]", location, length, --v19);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v21, "-[NSMutableArray sortUsingFunction:context:range:]", location, length, v19);
    }
    else
    {
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)&v24[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSMutableArray sortUsingFunction:context:range:]", location, length);
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v17, "-[NSMutableArray sortUsingFunction:context:range:]", location, length);
    }
    double v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v22);
  }
  if (length != 1)
  {
    v24[0] = off_1ECE0A5A0;
    v24[1] = 3221225472;
    id v24[2] = __50__NSMutableArray_sortUsingFunction_context_range___block_invoke;
    v24[3] = &__block_descriptor_48_e11_q24__0_8_16l;
    v24[4] = a3;
    v24[5] = a4;
    -[NSMutableArray sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", location, length, 0, v24);
  }
}

uint64_t __50__NSMutableArray_sortUsingFunction_context_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (NSMutableArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a4;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableArray initWithObjects:count:]", a4);
    goto LABEL_12;
  }
  if (a4 >> 61)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a4;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableArray initWithObjects:count:]", a4);
LABEL_12:
    CFStringRef v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v18);
  }
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v9 = _os_log_pack_size();
        uint64_t v10 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v10 = 136315394;
        *(void *)(v10 + 4) = "-[NSMutableArray initWithObjects:count:]";
        *(_WORD *)(v10 + 12) = 2048;
        *(void *)(v10 + 14) = i;
        CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableArray initWithObjects:count:]", i);
        CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
        objc_exception_throw(v12);
      }
    }
  }
  unint64_t v7 = [(NSMutableArray *)self initWithCapacity:a4];
  [(NSMutableArray *)v7 insertObjects:a3 count:a4 atIndex:0];
  return v7;
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
  OUTLINED_FUNCTION_1_7();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_0_13();

  __CFRequireConcreteImplementation(v4, v5, v6);
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
  OUTLINED_FUNCTION_1_7();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_0_13();

  __CFRequireConcreteImplementation(v3, v4, v5);
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
  OUTLINED_FUNCTION_1_7();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_0_13();

  __CFRequireConcreteImplementation(v4, v5, v6);
}

- (NSMutableArray)initWithCapacity:(NSUInteger)numItems
{
  OUTLINED_FUNCTION_1_7();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_0_13();
  __CFRequireConcreteImplementation(v3, v4, v5);
}

@end