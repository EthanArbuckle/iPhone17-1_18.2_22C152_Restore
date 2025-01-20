@interface NSMutableOrderedSet
+ (NSMutableOrderedSet)orderedSetWithCapacity:(NSUInteger)numItems;
- (Class)classForCoder;
- (NSMutableOrderedSet)initWithCapacity:(NSUInteger)numItems;
- (NSMutableOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)addObject:(id)object;
- (void)addObjects:(id *)objects count:(NSUInteger)count;
- (void)addObjectsFromArray:(NSArray *)array;
- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromOrderedSet:(id)a3;
- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromSet:(id)a3;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)insertObject:(id)object atIndex:(NSUInteger)idx;
- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4;
- (void)intersectOrderedSet:(NSOrderedSet *)other;
- (void)intersectSet:(NSSet *)other;
- (void)minusOrderedSet:(NSOrderedSet *)other;
- (void)minusSet:(NSSet *)other;
- (void)moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx;
- (void)removeAllObjects;
- (void)removeFirstObject;
- (void)removeLastObject;
- (void)removeObject:(id)a3 inRange:(_NSRange)a4;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)idx;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (void)removeObjectsInArray:(NSArray *)array;
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
- (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
- (void)replaceObjectsInRange:(NSRange)range withObjects:(id *)objects count:(NSUInteger)count;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4 range:(_NSRange)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4;
- (void)setArray:(id)a3;
- (void)setObject:(id)a3;
- (void)setObject:(id)obj atIndex:(NSUInteger)idx;
- (void)setOrderedSet:(id)a3;
- (void)setSet:(id)a3;
- (void)sortRange:(NSRange)range options:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (void)sortUsingComparator:(NSComparator)cmptr;
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (void)unionOrderedSet:(NSOrderedSet *)other;
- (void)unionSet:(NSSet *)other;
@end

@implementation NSMutableOrderedSet

+ (NSMutableOrderedSet)orderedSetWithCapacity:(NSUInteger)numItems
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:numItems];

  return (NSMutableOrderedSet *)v3;
}

- (void)removeObjectsInArray:(NSArray *)array
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!array) {
      goto LABEL_4;
    }
  }
  else if (!array)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)array) & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet removeObjectsInArray:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet removeObjectsInArray:]");
    v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:&v15[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v11];
    objc_exception_throw(v14);
  }
LABEL_4:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v6 = [(NSArray *)array countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(array);
        }
        NSUInteger v10 = [(NSOrderedSet *)self indexOfObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableOrderedSet *)self removeObjectAtIndex:v10];
        }
      }
      unint64_t v7 = [(NSArray *)array countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)intersectSet:(NSSet *)other
{
  uint64_t v33 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v20 = _os_log_pack_size();
    v22 = (char *)&v26 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSMutableOrderedSet intersectSet:]";
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet intersectSet:]");
    v25 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v22 size:v20];
    objc_exception_throw(v25);
  }
LABEL_4:
  NSUInteger v6 = [(NSOrderedSet *)self count];
  if (v6 >> 60)
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    long long v19 = +[NSException exceptionWithName:@"NSGenericException" reason:v18 userInfo:0];
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  NSUInteger v10 = (uint64_t *)((char *)&v26 - v9);
  size_t v27 = 0;
  if (v11 >= 0x101)
  {
    NSUInteger v10 = (uint64_t *)_CFCreateArrayStorage(v8, 0, &v27);
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v13 = [(NSOrderedSet *)self countByEnumeratingWithState:&v29 objects:v28 count:16];
  v14 = v10;
  if (v13)
  {
    uint64_t v15 = *(void *)v30;
    v14 = v10;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(self);
        }
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (![(NSSet *)other countForObject:v17]) {
          *v14++ = v17;
        }
      }
      unint64_t v13 = [(NSOrderedSet *)self countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v13);
  }
  while (v10 < v14)
    [(NSMutableOrderedSet *)self removeObject:*v10++];
  free(v12);
}

- (void)addObject:(id)object
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (object) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableOrderedSet addObject:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableOrderedSet addObject:]");
    NSUInteger v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!object) {
    goto LABEL_7;
  }
LABEL_3:
  NSUInteger v6 = [(NSOrderedSet *)self count];

  [(NSMutableOrderedSet *)self insertObject:object atIndex:v6];
}

- (void)removeObject:(id)object
{
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = [(NSOrderedSet *)self indexOfObject:object];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)self removeObjectAtIndex:v6];
  }
}

uint64_t __57__NSMutableOrderedSet_sortRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8 * a2), *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (void)unionOrderedSet:(NSOrderedSet *)other
{
  v23[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    long long v19 = (char *)v23 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableOrderedSet unionOrderedSet:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet unionOrderedSet:]");
    v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
LABEL_4:
  NSUInteger v6 = [(NSOrderedSet *)other count];
  unint64_t v8 = v6;
  if (v6 >> 60)
  {
    CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    long long v16 = +[NSException exceptionWithName:@"NSGenericException" reason:v15 userInfo:0];
    CFRelease(v15);
    objc_exception_throw(v16);
  }
  if (v6 <= 1) {
    NSUInteger v6 = 1;
  }
  unint64_t v9 = MEMORY[0x1F4188790](v6, v7);
  unint64_t v11 = (char *)v23 - v10;
  v23[0] = 0;
  if (v8 >= 0x101)
  {
    unint64_t v11 = (char *)_CFCreateArrayStorage(v9, 0, v23);
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  -[NSOrderedSet getObjects:range:](other, "getObjects:range:", v11, 0, v8, v23[0]);
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      unint64_t v14 = [(NSOrderedSet *)other countForObject:*(void *)&v11[8 * i]] + 1;
      while (--v14)
        [(NSMutableOrderedSet *)self addObject:*(void *)&v11[8 * i]];
    }
  }
  free(v12);
}

- (void)minusOrderedSet:(NSOrderedSet *)other
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet minusOrderedSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet minusOrderedSet:]");
    long long v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  if (self == (NSMutableOrderedSet *)other)
  {
    [(NSOrderedSet *)other removeAllObjects];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v6 = [(NSOrderedSet *)other countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v6)
    {
      unint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(other);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v11 = [(NSOrderedSet *)other countForObject:v10];
          if (v11)
          {
            unint64_t v12 = v11;
            do
            {
              --v12;
              [(NSMutableOrderedSet *)self removeObject:v10];
            }
            while (v12);
          }
        }
        unint64_t v7 = [(NSOrderedSet *)other countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  v33[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
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
    uint64_t v19 = _os_log_pack_size();
    long long v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a4;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a4);
    goto LABEL_20;
  }
LABEL_4:
  if (a4 >> 61)
  {
    uint64_t v19 = _os_log_pack_size();
    long long v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315394;
    *(void *)(v23 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
    *(_WORD *)(v23 + 12) = 2048;
    *(void *)(v23 + 14) = a4;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a4);
LABEL_20:
    CFStringRef v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:v20 size:v19];
    objc_exception_throw(v24);
  }
  if (a4)
  {
    uint64_t v10 = 0;
    do
    {
      if (!a3[v10])
      {
        uint64_t v15 = _os_log_pack_size();
        uint64_t v16 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v16 = 136315394;
        *(void *)(v16 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
        *(_WORD *)(v16 + 12) = 2048;
        *(void *)(v16 + 14) = v10;
        CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableOrderedSet insertObjects:count:atIndex:]", v10);
        long long v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:(char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) size:v15];
        objc_exception_throw(v18);
      }
      ++v10;
    }
    while (a4 != v10);
  }
  unint64_t v11 = [(NSOrderedSet *)self count];
  if ((a5 & 0x8000000000000000) != 0 || v11 < a5)
  {
    if (v11)
    {
      unint64_t v29 = v11;
      uint64_t v25 = _os_log_pack_size();
      uint64_t v26 = (char *)v33 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSMutableOrderedSet insertObjects:count:atIndex:]", a5, --v29);
      CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v31, "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a5, v29);
    }
    else
    {
      uint64_t v25 = _os_log_pack_size();
      uint64_t v26 = (char *)v33 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v27 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v27 = 136315394;
      *(void *)(v27 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
      *(_WORD *)(v27 + 12) = 2048;
      *(void *)(v27 + 14) = a5;
      CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a5);
    }
    long long v32 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v26 size:v25];
    objc_exception_throw(v32);
  }
  NSUInteger v12 = [(NSOrderedSet *)self count];
  if (a4)
  {
    unint64_t v13 = a5 - v12;
    do
    {
      uint64_t v14 = (uint64_t)*a3++;
      [(NSMutableOrderedSet *)self insertObject:v14 atIndex:v13 + [(NSOrderedSet *)self count]];
      --a4;
    }
    while (a4);
  }
}

- (void)minusSet:(NSSet *)other
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet minusSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet minusSet:]");
    uint64_t v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v6 = [(NSSet *)other countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(other);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v11 = [(NSSet *)other countForObject:v10];
        if (v11)
        {
          unint64_t v12 = v11;
          do
          {
            --v12;
            [(NSMutableOrderedSet *)self removeObject:v10];
          }
          while (v12);
        }
      }
      unint64_t v7 = [(NSSet *)other countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)unionSet:(NSSet *)other
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet unionSet:]";
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet unionSet:]");
    uint64_t v16 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v13];
    objc_exception_throw(v16);
  }
LABEL_4:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v6 = [(NSSet *)other countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(other);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v11 = [(NSSet *)other countForObject:v10];
        if (v11)
        {
          unint64_t v12 = v11;
          do
          {
            --v12;
            [(NSMutableOrderedSet *)self addObject:v10];
          }
          while (v12);
        }
      }
      unint64_t v7 = [(NSSet *)other countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
  v27[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (indexes) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableOrderedSet removeObjectsAtIndexes:]");
    goto LABEL_14;
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!indexes) {
    goto LABEL_12;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    CFStringRef v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableOrderedSet removeObjectsAtIndexes:]");
LABEL_14:
    long long v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  NSUInteger v6 = [(NSOrderedSet *)self count];
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
        double v25 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet removeObjectsAtIndexes:]", v20, v24);
        CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v25, "-[NSMutableOrderedSet removeObjectsAtIndexes:]", v20, v24);
      }
      else
      {
        *(_DWORD *)uint64_t v22 = 136315394;
        *(void *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
        *(_WORD *)(v22 + 12) = 2048;
        *(void *)(v22 + 14) = v20;
        CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty ordered set", "-[NSMutableOrderedSet removeObjectsAtIndexes:]", v20);
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
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v12, v13);
      --v11;
    }
    while (v11 != -1);
  }
}

- (void)sortRange:(NSRange)range options:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  char v7 = opts;
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v53[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_27:
    uint64_t v28 = _os_log_pack_size();
    uint64_t v30 = (char *)&v50 - ((MEMORY[0x1F4188790](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[NSMutableOrderedSet sortRange:options:usingComparator:]";
    CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSMutableOrderedSet sortRange:options:usingComparator:]");
    uint64_t v33 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v30 size:v28];
    objc_exception_throw(v33);
  }
  if (!cmptr) {
    goto LABEL_27;
  }
LABEL_3:
  NSUInteger v11 = [(NSOrderedSet *)self count];
  NSUInteger v13 = v11;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      uint64_t v34 = _os_log_pack_size();
      v36 = (char *)&v50 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v37 = _os_log_pack_fill();
      double v38 = __os_log_helper_1_2_3_8_32_8_0_8_0(v37, (uint64_t)"-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length);
      CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v38, "-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length);
      v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v36 size:v34];
      objc_exception_throw(v40);
    }
    uint64_t v41 = _os_log_pack_size();
    v43 = (char *)&v50 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    double v45 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v45, "-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length, v13 - 1);
    v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v43 size:v41];
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
    CFStringRef v17 = (char *)&v50 - v16;
    v53[0] = 0;
    if (length >= 0x101)
    {
      CFStringRef v17 = (char *)_CFCreateArrayStorage(length, 0, v53);
      v50 = v17;
    }
    else
    {
      v50 = 0;
    }
    uint64_t v18 = -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v17, location, length, v50);
    MEMORY[0x1F4188790](v18, v19);
    uint64_t v21 = (char *)&v50 - v20;
    uint64_t v22 = (char *)&v50 - v20;
    if (length > 0x1000) {
      uint64_t v22 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
    }
    v52[0] = off_1ECE0A5A0;
    v52[1] = 3221225472;
    v52[2] = __57__NSMutableOrderedSet_sortRange_options_usingComparator___block_invoke;
    v52[3] = &unk_1ECDABB78;
    v52[4] = cmptr;
    v52[5] = v17;
    CFSortIndexes((uint64_t)v22, length, v7, (uint64_t)v52);
    MEMORY[0x1F4188790](v23, v24);
    double v25 = 0;
    size_t v51 = 0;
    if (length >= 0x101) {
      double v25 = (char *)_CFCreateArrayStorage(length, 0, &v51);
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
    -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length);
    if (v21 != v22) {
      free(v22);
    }
    free(v25);
    free(v50);
  }
}

- (void)replaceObjectsInRange:(NSRange)range withObjects:(id *)objects count:(NSUInteger)count
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v35[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v11 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      NSUInteger v31 = v11;
      uint64_t v20 = _os_log_pack_size();
      uint64_t v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v32 = _os_log_pack_fill();
      double v33 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v32, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length, --v31);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v33, "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length, v31);
    }
    else
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v23, "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length);
    }
    uint64_t v34 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v21 size:v20];
    objc_exception_throw(v34);
  }
  if (!objects && count)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = (char *)v35 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315394;
    *(void *)(v27 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v27 + 12) = 2048;
    *(void *)(v27 + 14) = count;
    CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", count);
    goto LABEL_26;
  }
  if (count >> 61)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = (char *)v35 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315394;
    *(void *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v29 + 12) = 2048;
    *(void *)(v29 + 14) = count;
    CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", count);
LABEL_26:
    uint64_t v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v26 size:v25];
    objc_exception_throw(v30);
  }
  if (count)
  {
    uint64_t v12 = 0;
    do
    {
      if (!objects[v12])
      {
        uint64_t v16 = _os_log_pack_size();
        uint64_t v17 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v17 = 136315394;
        *(void *)(v17 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v17 + 12) = 2048;
        *(void *)(v17 + 14) = v12;
        CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", v12);
        uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
        objc_exception_throw(v19);
      }
      ++v12;
    }
    while (count != v12);
    uint64_t v13 = 0;
    do
      id v14 = objects[v13++];
    while (count != v13);
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
    [(NSMutableOrderedSet *)self insertObjects:objects count:count atIndex:location];
    do
    {
      uint64_t v15 = *objects++;

      --count;
    }
    while (count);
  }
  else
  {
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
    [(NSMutableOrderedSet *)self insertObjects:objects count:0 atIndex:location];
  }
}

- (void)removeObjectsInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v17[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v7 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v7 < location + length)
  {
    if (v7)
    {
      NSUInteger v13 = v7;
      uint64_t v8 = _os_log_pack_size();
      NSUInteger v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v14, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:]", location, length, --v13);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v15, "-[NSMutableOrderedSet removeObjectsInRange:]", location, length, v13);
    }
    else
    {
      uint64_t v8 = _os_log_pack_size();
      NSUInteger v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v10 = _os_log_pack_fill();
      double v11 = __os_log_helper_1_2_3_8_32_8_0_8_0(v10, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:]", location, length);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v11, "-[NSMutableOrderedSet removeObjectsInRange:]", location, length);
    }
    uint64_t v16 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v9 size:v8];
    objc_exception_throw(v16);
  }
  for (; length; --length)
    [(NSMutableOrderedSet *)self removeObjectAtIndex:location];
}

- (void)sortUsingComparator:(NSComparator)cmptr
{
  v13[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = _os_log_pack_size();
    NSUInteger v9 = (char *)v13 - ((MEMORY[0x1F4188790](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableOrderedSet sortUsingComparator:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSMutableOrderedSet sortUsingComparator:]");
    CFStringRef v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:v9 size:v7];
    objc_exception_throw(v12);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!cmptr) {
    goto LABEL_8;
  }
LABEL_3:
  NSUInteger v6 = [(NSOrderedSet *)self count];
  if (v6 >= 2)
  {
    -[NSMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v6, 0, cmptr);
  }
}

- (void)addObjectsFromArray:(NSArray *)array
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!array) {
      goto LABEL_4;
    }
  }
  else if (!array)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)array) & 1) == 0)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v14 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableOrderedSet addObjectsFromArray:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet addObjectsFromArray:]");
    NSUInteger v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
LABEL_4:
  NSUInteger v6 = [(NSOrderedSet *)self count];
  NSUInteger v7 = [(NSArray *)array count];

  -[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", array, 0, v7, v6);
}

- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v56[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
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
    v36 = (char *)v56 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]";
    CFStringRef v38 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]");
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
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v23, "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length);
      uint64_t v25 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v21 size:v19];
      objc_exception_throw(v25);
    }
    unint64_t v40 = v11;
    uint64_t v41 = _os_log_pack_size();
    v43 = (char *)v56 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    double v45 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length, --v40);
    CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v45, "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length, v40);
    v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v47);
  }
  unint64_t v12 = [(NSOrderedSet *)self count];
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      uint64_t v26 = _os_log_pack_size();
      CFStringRef v28 = (char *)v56 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315394;
      *(void *)(v29 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]";
      *(_WORD *)(v29 + 12) = 2048;
      *(void *)(v29 + 14) = a5;
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", a5);
      NSUInteger v31 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v31);
    }
    unint64_t v48 = v12;
    uint64_t v49 = _os_log_pack_size();
    size_t v51 = (char *)v56 - ((MEMORY[0x1F4188790](v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v52 = _os_log_pack_fill();
    double v53 = __os_log_helper_1_2_3_8_32_8_0_8_0(v52, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", a5, --v48);
    CFStringRef v54 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v53, "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", a5, v48);
    v55 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v54) userInfo:0 osLogPack:v51 size:v49];
    objc_exception_throw(v55);
  }
  if (length >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    double v33 = +[NSException exceptionWithName:@"NSGenericException" reason:v32 userInfo:0];
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
    CFStringRef v18 = v17;
  }
  else
  {
    CFStringRef v18 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v17, location, length, v56[0]);
  [(NSMutableOrderedSet *)self insertObjects:v17 count:length atIndex:a5];
  free(v18);
}

- (void)intersectOrderedSet:(NSOrderedSet *)other
{
  uint64_t v33 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v18 = _os_log_pack_size();
    uint64_t v20 = (char *)&v26 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315138;
    *(void *)(v21 + 4) = "-[NSMutableOrderedSet intersectOrderedSet:]";
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet intersectOrderedSet:]");
    double v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:v20 size:v18];
    objc_exception_throw(v23);
  }
LABEL_4:
  if (self != (NSMutableOrderedSet *)other)
  {
    NSUInteger v6 = [(NSOrderedSet *)self count];
    if (v6 >> 60)
    {
      CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
      uint64_t v25 = +[NSException exceptionWithName:@"NSGenericException" reason:v24 userInfo:0];
      CFRelease(v24);
      objc_exception_throw(v25);
    }
    if (v6 <= 1) {
      NSUInteger v6 = 1;
    }
    unint64_t v8 = MEMORY[0x1F4188790](v6, v7);
    uint64_t v10 = (uint64_t *)((char *)&v26 - v9);
    size_t v27 = 0;
    if (v11 >= 0x101)
    {
      uint64_t v10 = (uint64_t *)_CFCreateArrayStorage(v8, 0, &v27);
      unint64_t v12 = v10;
    }
    else
    {
      unint64_t v12 = 0;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v13 = [(NSOrderedSet *)self countByEnumeratingWithState:&v29 objects:v28 count:16];
    uint64_t v14 = v10;
    if (v13)
    {
      uint64_t v15 = *(void *)v30;
      uint64_t v14 = v10;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(self);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if (![(NSOrderedSet *)other countForObject:v17]) {
            *v14++ = v17;
          }
        }
        unint64_t v13 = [(NSOrderedSet *)self countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v13);
    }
    while (v10 < v14)
      [(NSMutableOrderedSet *)self removeObject:*v10++];
    free(v12);
  }
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
  v60[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    v56 = (char *)v60 - ((MEMORY[0x1F4188790](v54, v55) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v57 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v57 = 136315138;
    *(void *)(v57 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringRef v58 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    v59 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v58) userInfo:0 osLogPack:v56 size:v54];
    objc_exception_throw(v59);
  }
LABEL_4:
  if (!indexes)
  {
    uint64_t v26 = _os_log_pack_size();
    CFStringRef v28 = (char *)v60 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    long long v31 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v31);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v32 = _os_log_pack_size();
    uint64_t v34 = (char *)v60 - ((MEMORY[0x1F4188790](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    uint64_t v37 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v36) userInfo:0 osLogPack:v34 size:v32];
    objc_exception_throw(v37);
  }
  NSUInteger v8 = [(NSOrderedSet *)self count];
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
        *(void *)(v42 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
        *(_WORD *)(v42 + 12) = 2048;
        *(void *)(v42 + 14) = v38;
        CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjects:atIndexes:]", v38);
        uint64_t v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
        objc_exception_throw(v44);
      }
      uint64_t v45 = _os_log_pack_size();
      v47 = (char *)v60 - ((MEMORY[0x1F4188790](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableOrderedSet insertObjects:atIndexes:]", v38, v11 - 1);
      CFStringRef v50 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v49, "-[NSMutableOrderedSet insertObjects:atIndexes:]", v38, v11 - 1);
      size_t v51 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v50) userInfo:0 osLogPack:v47 size:v45];
      objc_exception_throw(v51);
    }
  }
  NSUInteger v12 = [(NSArray *)objects count];
  NSUInteger v13 = [(NSIndexSet *)indexes count];
  if (v12 != v13) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of array (%lu) differs from count of index set (%lu)", "-[NSMutableOrderedSet insertObjects:atIndexes:]", v12, v13);
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
    [(NSMutableOrderedSet *)self insertObjects:&v19[8 * v21] count:v24 atIndex:v23];
    v21 += v25;
  }
  free(v20);
}

- (void)addObjects:(id *)objects count:(NSUInteger)count
{
  v20[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (objects) {
      goto LABEL_4;
    }
  }
  else if (objects)
  {
    goto LABEL_4;
  }
  if (count)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = count;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableOrderedSet addObjects:count:]", count);
    goto LABEL_17;
  }
LABEL_4:
  if (count >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = count;
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableOrderedSet addObjects:count:]", count);
LABEL_17:
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v15 size:v14];
    objc_exception_throw(v19);
  }
  if (count)
  {
    uint64_t v8 = 0;
    do
    {
      if (!objects[v8])
      {
        uint64_t v10 = _os_log_pack_size();
        uint64_t v11 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v11 = 136315394;
        *(void *)(v11 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
        *(_WORD *)(v11 + 12) = 2048;
        *(void *)(v11 + 14) = v8;
        CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableOrderedSet addObjects:count:]", v8);
        NSUInteger v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:(char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) size:v10];
        objc_exception_throw(v13);
      }
      ++v8;
    }
    while (count != v8);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];

  [(NSMutableOrderedSet *)self insertObjects:objects count:count atIndex:v9];
}

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet addObjectsFromArray:range:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet addObjectsFromArray:range:]");
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
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length, --v20);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length, v20);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length);
    }
    uint64_t v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v23);
  }
  NSUInteger v10 = [(NSOrderedSet *)self count];

  -[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", a3, location, length, v10);
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]");
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
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length, --v20);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length, v20);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length);
    }
    uint64_t v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v23);
  }
  NSUInteger v10 = [(NSOrderedSet *)self count];

  -[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, location, length, v10);
}

- (void)addObjectsFromOrderedSet:(id)a3
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v11 + 4) = "-[NSMutableOrderedSet addObjectsFromOrderedSet:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet addObjectsFromOrderedSet:]");
    uint64_t v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
LABEL_4:
  NSUInteger v6 = [(NSOrderedSet *)self count];
  uint64_t v7 = [a3 count];

  -[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, 0, v7, v6);
}

- (void)addObjectsFromSet:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v8 + 4) = "-[NSMutableOrderedSet addObjectsFromSet:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet addObjectsFromSet:]");
    NSUInteger v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
LABEL_4:
  NSUInteger v6 = [(NSOrderedSet *)self count];

  [(NSMutableOrderedSet *)self insertObjectsFromSet:a3 atIndex:v6];
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
  v31[1] = *(id *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v8 = [(NSOrderedSet *)self count];
  if ((idx1 & 0x8000000000000000) != 0 || v8 <= idx1)
  {
    if (v8)
    {
      NSUInteger v22 = v8;
      uint64_t v14 = _os_log_pack_size();
      CFStringRef v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = _os_log_pack_fill();
      double v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx1, --v22);
      CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v24, "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx1, v22);
    }
    else
    {
      uint64_t v14 = _os_log_pack_size();
      CFStringRef v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v16 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v16 = 136315394;
      *(void *)(v16 + 4) = "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v16 + 12) = 2048;
      *(void *)(v16 + 14) = idx1;
      CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx1);
    }
    uint64_t v25 = _CFAutoreleasePoolAddObject(0, (uint64_t)v17);
    uint64_t v26 = v15;
    uint64_t v27 = v14;
LABEL_24:
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v25 userInfo:0 osLogPack:v26 size:v27]);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((idx2 & 0x8000000000000000) != 0 || v9 <= idx2)
  {
    if (v9)
    {
      NSUInteger v28 = v9;
      uint64_t v18 = _os_log_pack_size();
      uint64_t v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      double v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx2, --v28);
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v30, "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx2, v28);
    }
    else
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = idx2;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx2);
    }
    uint64_t v25 = _CFAutoreleasePoolAddObject(0, (uint64_t)v21);
    uint64_t v26 = v19;
    uint64_t v27 = v18;
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
    id v11 = [(NSOrderedSet *)self objectAtIndex:idx2];
    v31[0] = [(NSOrderedSet *)self objectAtIndex:v10];
    id v12 = v11;
    id v13 = v31[0];
    [(NSMutableOrderedSet *)self removeObjectAtIndex:v10];
    [(NSMutableOrderedSet *)self replaceObjectAtIndex:idx2 withObject:v31[0]];
    [(NSMutableOrderedSet *)self insertObject:v11 atIndex:v10];
  }
}

- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    uint64_t v27 = (char *)v39 - ((MEMORY[0x1F4188790](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315138;
    *(void *)(v28 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]");
    double v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v8 = [(NSOrderedSet *)self count];
  unint64_t v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v19 = (char *)v39 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = a4;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]", a4);
      NSUInteger v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
      objc_exception_throw(v22);
    }
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v39 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    uint64_t v35 = v9 - 1;
    double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]", a4, v35);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v36, "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]", a4, v35);
    uint64_t v38 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v33 size:v31];
    objc_exception_throw(v38);
  }
  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if (v10 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v10);
    double v24 = +[NSException exceptionWithName:@"NSGenericException" reason:v23 userInfo:0];
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
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v15, 0, v12, v39[0]);
  [(NSMutableOrderedSet *)self insertObjects:v15 count:v12 atIndex:a4];
  free(v16);
}

- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v56[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v37 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]";
    CFStringRef v38 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]");
    uint64_t v39 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v38) userInfo:0 osLogPack:v36 size:v34];
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
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v23, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      uint64_t v25 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v21 size:v19];
      objc_exception_throw(v25);
    }
    unint64_t v40 = v11;
    uint64_t v41 = _os_log_pack_size();
    CFStringRef v43 = (char *)v56 - ((MEMORY[0x1F4188790](v41, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = _os_log_pack_fill();
    double v45 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v44, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length, --v40);
    CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v45, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length, v40);
    v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v43 size:v41];
    objc_exception_throw(v47);
  }
  unint64_t v12 = [(NSOrderedSet *)self count];
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      uint64_t v26 = _os_log_pack_size();
      uint64_t v28 = (char *)v56 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315394;
      *(void *)(v29 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]";
      *(_WORD *)(v29 + 12) = 2048;
      *(void *)(v29 + 14) = a5;
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", a5);
      uint64_t v31 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
      objc_exception_throw(v31);
    }
    unint64_t v48 = v12;
    uint64_t v49 = _os_log_pack_size();
    size_t v51 = (char *)v56 - ((MEMORY[0x1F4188790](v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v52 = _os_log_pack_fill();
    double v53 = __os_log_helper_1_2_3_8_32_8_0_8_0(v52, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", a5, --v48);
    CFStringRef v54 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v53, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", a5, v48);
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
  [(NSMutableOrderedSet *)self insertObjects:v17 count:length atIndex:a5];
  free(v18);
}

- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v28 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]");
    CFStringRef v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v8 = [(NSOrderedSet *)self count];
  unint64_t v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v19 = (char *)v39 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = a4;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]", a4);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
      objc_exception_throw(v22);
    }
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v39 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    uint64_t v35 = v9 - 1;
    double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]", a4, v35);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v36, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]", a4, v35);
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
  [(NSMutableOrderedSet *)self insertObjects:v15 count:v12 atIndex:a4];
  free(v16);
}

- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v28 + 4) = "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]";
    CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]");
    CFStringRef v30 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v29) userInfo:0 osLogPack:v27 size:v25];
    objc_exception_throw(v30);
  }
LABEL_4:
  unint64_t v8 = [(NSOrderedSet *)self count];
  unint64_t v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v19 = (char *)v39 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = a4;
      CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]", a4);
      uint64_t v22 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
      objc_exception_throw(v22);
    }
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v39 - ((MEMORY[0x1F4188790](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = _os_log_pack_fill();
    uint64_t v35 = v9 - 1;
    double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]", a4, v35);
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v36, "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]", a4, v35);
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
  [(NSMutableOrderedSet *)self insertObjects:v15 count:v12 atIndex:a4];
  free(v16);
}

- (void)moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx
{
  v64[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (indexes) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v23 = _os_log_pack_size();
    uint64_t v25 = (char *)v64 - ((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v27) userInfo:0 osLogPack:v25 size:v23];
    objc_exception_throw(v28);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!indexes) {
    goto LABEL_17;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v29 = _os_log_pack_size();
    uint64_t v31 = (char *)v64 - ((MEMORY[0x1F4188790](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136315138;
    *(void *)(v32 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
    CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]");
    uint64_t v34 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v33) userInfo:0 osLogPack:v31 size:v29];
    objc_exception_throw(v34);
  }
  NSUInteger v8 = [(NSOrderedSet *)self count];
  uint64_t v9 = [0 count];
  NSUInteger v10 = [(NSIndexSet *)indexes lastIndex];
  if ((v10 & 0x8000000000000000) != 0)
  {
    uint64_t v35 = v10;
    NSUInteger v11 = v9 + v8;
    goto LABEL_21;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = v9 + v8;
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
        *(void *)(v39 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
        *(_WORD *)(v39 + 12) = 2048;
        *(void *)(v39 + 14) = v35;
        CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty ordered set", "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", v35);
        uint64_t v41 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
        objc_exception_throw(v41);
      }
      uint64_t v42 = _os_log_pack_size();
      uint64_t v44 = (char *)v64 - ((MEMORY[0x1F4188790](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v45 = _os_log_pack_fill();
      double v46 = __os_log_helper_1_2_3_8_32_8_0_8_0(v45, (uint64_t)"-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", v35, v11 - 1);
      CFStringRef v47 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v46, "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", v35, v11 - 1);
      unint64_t v48 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v47) userInfo:0 osLogPack:v44 size:v42];
      objc_exception_throw(v48);
    }
  }
  NSUInteger v12 = [(NSOrderedSet *)self count];
  NSUInteger v13 = -[NSIndexSet countOfIndexesInRange:](indexes, "countOfIndexesInRange:", 0, idx);
  NSUInteger v14 = v12 - v13;
  if ((idx & 0x8000000000000000) != 0 || v14 < idx)
  {
    if (v12 == v13)
    {
      uint64_t v49 = _os_log_pack_size();
      size_t v51 = (char *)v64 - ((MEMORY[0x1F4188790](v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v52 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v52 = 136315394;
      *(void *)(v52 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v52 + 12) = 2048;
      *(void *)(v52 + 14) = idx;
      CFStringRef v53 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", idx);
      CFStringRef v54 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v53) userInfo:0 osLogPack:v51 size:v49];
      objc_exception_throw(v54);
    }
    uint64_t v57 = _os_log_pack_size();
    v59 = (char *)v64 - ((MEMORY[0x1F4188790](v57, v58) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v60 = _os_log_pack_fill();
    double v61 = __os_log_helper_1_2_3_8_32_8_0_8_0(v60, (uint64_t)"-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", idx, v14 - 1);
    CFStringRef v62 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v61, "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", idx, v14 - 1);
    v63 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v62) userInfo:0 osLogPack:v59 size:v57];
    objc_exception_throw(v63);
  }
  unint64_t v15 = [(NSOrderedSet *)self objectsAtIndexes:indexes];
  [(NSMutableOrderedSet *)self removeObjectsAtIndexes:indexes];
  unint64_t v16 = [(NSArray *)v15 count];
  unint64_t v18 = v16;
  if (v16 >> 60)
  {
    CFStringRef v55 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v16);
    v56 = +[NSException exceptionWithName:@"NSGenericException" reason:v55 userInfo:0];
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
  [(NSMutableOrderedSet *)self insertObjects:v21 count:v18 atIndex:idx];
  free(v22);
}

- (void)removeAllObjects
{
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v4 = [(NSOrderedSet *)self count];
  if (v4)
  {
    NSUInteger v5 = v4 - 1;
    do
      [(NSMutableOrderedSet *)self removeObjectAtIndex:v5--];
    while (v5 != -1);
  }
}

- (void)removeFirstObject
{
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  if ([(NSOrderedSet *)self count])
  {
    [(NSMutableOrderedSet *)self removeObjectAtIndex:0];
  }
}

- (void)removeLastObject
{
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v4 = [(NSOrderedSet *)self count];
  if (v4)
  {
    [(NSMutableOrderedSet *)self removeObjectAtIndex:v4 - 1];
  }
}

- (void)removeObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v20[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSMutableOrderedSet removeObject:inRange:]", location, length, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v18, "-[NSMutableOrderedSet removeObject:inRange:]", location, length, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObject:inRange:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "-[NSMutableOrderedSet removeObject:inRange:]", location, length);
    }
    unint64_t v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v19);
  }
  unint64_t v10 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)self removeObjectAtIndex:v10];
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v38[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v12 = [(NSOrderedSet *)self count];
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      NSUInteger v29 = v12;
      uint64_t v15 = _os_log_pack_size();
      NSUInteger v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v30, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9, --v29);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v31, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9, v29);
    }
    else
    {
      uint64_t v15 = _os_log_pack_size();
      NSUInteger v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v18, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9);
    }
    uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v19);
    CFStringRef v33 = v16;
    uint64_t v34 = v15;
LABEL_25:
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v32 userInfo:0 osLogPack:v33 size:v34]);
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]";
    CFStringRef v27 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]");
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
      double v37 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length, --v35);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v37, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length, v35);
    }
    else
    {
      uint64_t v20 = _os_log_pack_size();
      CFStringRef v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length);
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v23, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length);
    }
    uint64_t v32 = _CFAutoreleasePoolAddObject(0, (uint64_t)v24);
    CFStringRef v33 = v21;
    uint64_t v34 = v20;
    goto LABEL_25;
  }
  for (; length; --length)
  {
    unint64_t v14 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", [a4 objectAtIndex:location], v10, v9);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableOrderedSet *)self removeObjectAtIndex:v14];
    }
    ++location;
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v34 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v25 = _os_log_pack_fill();
      uint64_t v26 = v10 - 1;
      double v27 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length, v26);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v27, "-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length, v26);
    }
    else
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v19, "-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length);
    }
    uint64_t v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v17 size:v16];
    objc_exception_throw(v28);
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v21 = _os_log_pack_size();
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inArray:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet removeObjectsInRange:inArray:]");
    CFStringRef v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:&v29[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v21];
    objc_exception_throw(v24);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = [a4 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(a4);
        }
        unint64_t v15 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *(void *)(*((void *)&v30 + 1) + 8 * i), location, length);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableOrderedSet *)self removeObjectAtIndex:v15];
        }
      }
      uint64_t v12 = [a4 countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v12);
  }
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet removeObjectsInArray:range:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet removeObjectsInArray:range:]");
    double v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
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
      uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length, --v20);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length, v20);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length);
    }
    CFStringRef v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v23);
  }
  for (; length; --length)
  {
    NSUInteger v10 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", [a3 objectAtIndex:location]);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableOrderedSet *)self removeObjectAtIndex:v10];
    }
    ++location;
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v59[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v12 = [(NSOrderedSet *)self count];
  NSUInteger v13 = v12;
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (!v12)
    {
      uint64_t v23 = _os_log_pack_size();
      uint64_t v25 = (char *)v59 - ((MEMORY[0x1F4188790](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v26 = _os_log_pack_fill();
      double v27 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9);
      CFStringRef v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v27, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9);
      NSUInteger v29 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v28) userInfo:0 osLogPack:v25 size:v23];
      objc_exception_throw(v29);
    }
    uint64_t v45 = _os_log_pack_size();
    CFStringRef v47 = (char *)v59 - ((MEMORY[0x1F4188790](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v48 = _os_log_pack_fill();
    double v49 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v48, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9, v13 - 1);
    CFStringRef v50 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v49, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9, v13 - 1);
    size_t v51 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v50) userInfo:0 osLogPack:v47 size:v45];
    objc_exception_throw(v51);
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v39 = _os_log_pack_size();
    uint64_t v41 = (char *)v59 - ((MEMORY[0x1F4188790](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v42 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v42 = 136315138;
    *(void *)(v42 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]";
    CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]");
    uint64_t v44 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
    objc_exception_throw(v44);
  }
  unint64_t v14 = [a4 count];
  unint64_t v16 = v14;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v14 < location + length)
  {
    if (!v14)
    {
      uint64_t v30 = _os_log_pack_size();
      long long v32 = (char *)v59 - ((MEMORY[0x1F4188790](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v33 = _os_log_pack_fill();
      double v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v33, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length);
      CFStringRef v35 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v34, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length);
      uint64_t v36 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v35) userInfo:0 osLogPack:v32 size:v30];
      objc_exception_throw(v36);
    }
    uint64_t v52 = _os_log_pack_size();
    CFStringRef v54 = (char *)v59 - ((MEMORY[0x1F4188790](v52, v53) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v55 = _os_log_pack_fill();
    double v56 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v55, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length, v16 - 1);
    CFStringRef v57 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v56, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length, v16 - 1);
    uint64_t v58 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v57) userInfo:0 osLogPack:v54 size:v52];
    objc_exception_throw(v58);
  }
  if (length >> 60)
  {
    CFStringRef v37 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    CFStringRef v38 = +[NSException exceptionWithName:@"NSGenericException" reason:v37 userInfo:0];
    CFRelease(v37);
    objc_exception_throw(v38);
  }
  if (length <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = length;
  }
  unint64_t v18 = MEMORY[0x1F4188790](v17, v15);
  unint64_t v20 = (size_t *)((char *)v59 - v19);
  v59[0] = 0;
  if (length >= 0x101)
  {
    unint64_t v20 = _CFCreateArrayStorage(v18, 0, v59);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v21 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v20, location, length, v59[0]);
  for (; length; --length)
  {
    unint64_t v22 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *v20, v10, v9);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableOrderedSet *)self removeObjectAtIndex:v22];
    }
    ++v20;
  }
  free(v21);
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v28[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v23 = v9;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length, --v23);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v26, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length, v23);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v15, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length);
    }
    double v27 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v27);
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    uint64_t v19 = (char *)v28 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]");
    unint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
    objc_exception_throw(v22);
  }
  uint64_t v10 = [a4 count];

  -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", location, length, a4, 0, v10);
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v28[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    uint64_t v19 = (char *)v28 - ((MEMORY[0x1F4188790](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]");
    unint64_t v22 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v17];
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
      NSUInteger v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length, --v23);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v26, "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length, v23);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v13 = (char *)v28 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v15, "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length);
    }
    double v27 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v27);
  }
  NSUInteger v10 = [(NSOrderedSet *)self count];

  -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, v10, a3, location, length);
}

- (void)removeObjectsInOrderedSet:(id)a3
{
  v14[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    *(void *)(v11 + 4) = "-[NSMutableOrderedSet removeObjectsInOrderedSet:]";
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet removeObjectsInOrderedSet:]");
    NSUInteger v13 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v13);
  }
LABEL_4:
  NSUInteger v6 = [(NSOrderedSet *)self count];
  uint64_t v7 = [a3 count];

  -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, v6, a3, 0, v7);
}

- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v34 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = [(NSOrderedSet *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v25 = _os_log_pack_fill();
      uint64_t v26 = v10 - 1;
      double v27 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length, v26);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v27, "-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length, v26);
    }
    else
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length);
      CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v19, "-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length);
    }
    CFStringRef v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v17 size:v16];
    objc_exception_throw(v28);
  }
  if (a4 && (_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v21 = _os_log_pack_size();
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inSet:]";
    CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet removeObjectsInRange:inSet:]");
    uint64_t v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:&v29[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v21];
    objc_exception_throw(v24);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = [a4 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(a4);
        }
        unint64_t v15 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *(void *)(*((void *)&v30 + 1) + 8 * i), location, length);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableOrderedSet *)self removeObjectAtIndex:v15];
        }
      }
      uint64_t v12 = [a4 countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v12);
  }
}

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet removeObjectsInSet:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet removeObjectsInSet:]");
    uint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:&v15[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)] size:v11];
    objc_exception_throw(v14);
  }
LABEL_4:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        NSUInteger v10 = [(NSOrderedSet *)self indexOfObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableOrderedSet *)self removeObjectAtIndex:v10];
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v25[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v18 = _os_log_pack_size();
    long long v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  if (!a3) {
    goto LABEL_12;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v18 = _os_log_pack_size();
    long long v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  if (!a5)
  {
    uint64_t v18 = _os_log_pack_size();
    long long v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
LABEL_15:
    uint64_t v24 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v21) userInfo:0 osLogPack:v19 size:v18];
    objc_exception_throw(v24);
  }
  unint64_t v11 = a4 & 0xAFFFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0) {
    unint64_t v11 = a4;
  }
  uint64_t v12 = v11 | 0x5000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v11 | 0x5000000000000000, a3);
  id IndexesPassingTest = __NSOrderedSetGetIndexesPassingTest(self, (uint64_t)a5, v12, a3);
  uint64_t v14 = [IndexesPassingTest rangeCount];
  if (v14)
  {
    uint64_t v15 = v14 - 1;
    do
    {
      uint64_t v16 = [IndexesPassingTest rangeAtIndex:v15];
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v16, v17);
      --v15;
    }
    while (v15 != -1);
  }
}

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v20[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet removeObjectsWithOptions:passingTest:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableOrderedSet removeObjectsWithOptions:passingTest:]");
    long long v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:(char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) size:v16];
    objc_exception_throw(v19);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t v9 = a3 & 0xBFFFFFFFFFFFFFFELL;
  if ((a3 & 2) == 0) {
    unint64_t v9 = a3;
  }
  uint64_t v10 = v9 | 0x4000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v9 | 0x4000000000000000, 0);
  id IndexesPassingTest = __NSOrderedSetGetIndexesPassingTest(self, (uint64_t)a4, v10, 0);
  uint64_t v12 = [IndexesPassingTest rangeCount];
  if (v12)
  {
    uint64_t v13 = v12 - 1;
    do
    {
      uint64_t v14 = [IndexesPassingTest rangeAtIndex:v13];
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v14, v15);
      --v13;
    }
    while (v13 != -1);
  }
}

- (void)removeObjectsPassingTest:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  if (!a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet removeObjectsPassingTest:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: predicate cannot be nil", "-[NSMutableOrderedSet removeObjectsPassingTest:]");
    unint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }

  [(NSMutableOrderedSet *)self removeObjectsWithOptions:0 passingTest:a3];
}

- (void)replaceObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (a3) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet replaceObject:inRange:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableOrderedSet replaceObject:inRange:]");
    uint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
    objc_exception_throw(v14);
  }
  if (!a3) {
    goto LABEL_11;
  }
LABEL_3:
  NSUInteger v9 = [(NSOrderedSet *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v20 = v9;
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObject:inRange:]", location, length, --v20);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v22, "-[NSMutableOrderedSet replaceObject:inRange:]", location, length, v20);
    }
    else
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSMutableOrderedSet replaceObject:inRange:]", location, length);
      CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v18, "-[NSMutableOrderedSet replaceObject:inRange:]", location, length);
    }
    uint64_t v23 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v16 size:v15];
    objc_exception_throw(v23);
  }
  unint64_t v10 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)self replaceObjectAtIndex:v10 withObject:a3];
  }
}

- (void)replaceObject:(id)a3
{
  v11[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableOrderedSet replaceObject:]";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableOrderedSet replaceObject:]");
    unint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:(char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) size:v7];
    objc_exception_throw(v10);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  NSUInteger v6 = [(NSOrderedSet *)self indexOfObject:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)self replaceObjectAtIndex:v6 withObject:a3];
  }
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
  v63[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    uint64_t v57 = _os_log_pack_size();
    v59 = (char *)v63 - ((MEMORY[0x1F4188790](v57, v58) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v60 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v60 = 136315138;
    *(void *)(v60 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringRef v61 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    CFStringRef v62 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v61) userInfo:0 osLogPack:v59 size:v57];
    objc_exception_throw(v62);
  }
LABEL_4:
  if (!indexes)
  {
    uint64_t v30 = _os_log_pack_size();
    long long v32 = (char *)v63 - ((MEMORY[0x1F4188790](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315138;
    *(void *)(v33 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringRef v34 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set cannot be nil", "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    CFStringRef v35 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v34) userInfo:0 osLogPack:v32 size:v30];
    objc_exception_throw(v35);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v36 = _os_log_pack_size();
    CFStringRef v38 = (char *)v63 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index set argument is not an NSIndexSet", "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    uint64_t v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
    objc_exception_throw(v41);
  }
  NSUInteger v8 = [(NSOrderedSet *)self count];
  NSUInteger v9 = [(NSArray *)objects count];
  NSUInteger v10 = [(NSIndexSet *)indexes lastIndex];
  uint64_t v11 = v10;
  if ((v10 & 0x8000000000000000) != 0)
  {
    NSUInteger v12 = v9 + v8;
    goto LABEL_28;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v12 = v9 + v8;
    if (v12 <= v10)
    {
LABEL_28:
      if (!v12)
      {
        uint64_t v42 = _os_log_pack_size();
        uint64_t v44 = (char *)v63 - ((MEMORY[0x1F4188790](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v45 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v45 = 136315394;
        *(void *)(v45 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
        *(_WORD *)(v45 + 12) = 2048;
        *(void *)(v45 + 14) = v11;
        CFStringRef v46 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds for empty ordered set", "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v11);
        CFStringRef v47 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v46) userInfo:0 osLogPack:v44 size:v42];
        objc_exception_throw(v47);
      }
      uint64_t v48 = _os_log_pack_size();
      CFStringRef v50 = (char *)v63 - ((MEMORY[0x1F4188790](v48, v49) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v51 = _os_log_pack_fill();
      double v52 = __os_log_helper_1_2_3_8_32_8_0_8_0(v51, (uint64_t)"-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v11, v12 - 1);
      CFStringRef v53 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu in index set beyond bounds [0 .. %lu]", v52, "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v11, v12 - 1);
      CFStringRef v54 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v53) userInfo:0 osLogPack:v50 size:v48];
      objc_exception_throw(v54);
    }
  }
  NSUInteger v13 = [(NSArray *)objects count];
  NSUInteger v14 = [(NSIndexSet *)indexes count];
  if (v13 != v14) {
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"*** %s: count of array (%lu) differs from count of index set (%lu)", "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v13, v14);
  }
  NSUInteger v15 = [(NSArray *)objects count];
  unint64_t v17 = v15;
  if (v15 >> 60)
  {
    CFStringRef v55 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v15);
    double v56 = +[NSException exceptionWithName:@"NSGenericException" reason:v55 userInfo:0];
    CFRelease(v55);
    objc_exception_throw(v56);
  }
  if (v15 <= 1) {
    NSUInteger v15 = 1;
  }
  unint64_t v18 = MEMORY[0x1F4188790](v15, v16);
  NSUInteger v20 = (char *)v63 - v19;
  v63[0] = 0;
  if (v17 >= 0x101)
  {
    NSUInteger v20 = (char *)_CFCreateArrayStorage(v18, 0, v63);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v21 = 0;
  }
  -[NSArray getObjects:range:](objects, "getObjects:range:", v20, 0, v17, v63[0]);
  for (uint64_t i = [(NSIndexSet *)indexes rangeCount] - 1; i != -1; --i)
  {
    uint64_t v23 = [(NSIndexSet *)indexes rangeAtIndex:i];
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v23, v24);
  }
  uint64_t v25 = 0;
  for (unint64_t j = 0; j < [(NSIndexSet *)indexes rangeCount]; ++j)
  {
    uint64_t v27 = [(NSIndexSet *)indexes rangeAtIndex:j];
    uint64_t v29 = v28;
    [(NSMutableOrderedSet *)self insertObjects:&v20[8 * v25] count:v28 atIndex:v27];
    v25 += v29;
  }
  free(v21);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v58[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v36 = _os_log_pack_size();
    CFStringRef v38 = (char *)v58 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]";
    CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]");
    uint64_t v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
    objc_exception_throw(v41);
  }
LABEL_4:
  unint64_t v12 = [a4 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      uint64_t v20 = _os_log_pack_size();
      double v22 = (char *)v58 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = _os_log_pack_fill();
      double v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v24, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      uint64_t v26 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v25) userInfo:0 osLogPack:v22 size:v20];
      objc_exception_throw(v26);
    }
    unint64_t v42 = v12;
    uint64_t v43 = _os_log_pack_size();
    uint64_t v45 = (char *)v58 - ((MEMORY[0x1F4188790](v43, v44) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v46 = _os_log_pack_fill();
    double v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v46, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length, --v42);
    CFStringRef v48 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v47, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length, v42);
    uint64_t v49 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v48) userInfo:0 osLogPack:v45 size:v43];
    objc_exception_throw(v49);
  }
  NSUInteger v13 = [(NSOrderedSet *)self count];
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      uint64_t v27 = _os_log_pack_size();
      uint64_t v29 = (char *)v58 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v31, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      uint64_t v33 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v29 size:v27];
      objc_exception_throw(v33);
    }
    NSUInteger v50 = v13;
    uint64_t v51 = _os_log_pack_size();
    CFStringRef v53 = (char *)v58 - ((MEMORY[0x1F4188790](v51, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v54 = _os_log_pack_fill();
    double v55 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v54, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, --v50);
    CFStringRef v56 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v55, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, v50);
    uint64_t v57 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v56) userInfo:0 osLogPack:v53 size:v51];
    objc_exception_throw(v57);
  }
  if (length >> 60)
  {
    CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    CFStringRef v35 = +[NSException exceptionWithName:@"NSGenericException" reason:v34 userInfo:0];
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
  unint64_t v18 = (char *)v58 - v17;
  v58[0] = 0;
  if (length >= 0x101)
  {
    unint64_t v18 = (char *)_CFCreateArrayStorage(v16, 0, v58);
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v18, location, length, v58[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    uint64_t v29 = (char *)v41 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]");
    CFStringRef v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
LABEL_4:
  NSUInteger v9 = [(NSOrderedSet *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v20 = (char *)v41 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length);
      double v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v20 size:v18];
      objc_exception_throw(v24);
    }
    uint64_t v33 = _os_log_pack_size();
    CFStringRef v35 = (char *)v41 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = v10 - 1;
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length, v37);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v38, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length, v37);
    CFStringRef v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  unint64_t v11 = [a4 count];
  unint64_t v13 = v11;
  if (v11 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
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
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v58[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
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
    double v38 = (char *)v58 - ((MEMORY[0x1F4188790](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]";
    CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]");
    uint64_t v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v40) userInfo:0 osLogPack:v38 size:v36];
    objc_exception_throw(v41);
  }
LABEL_4:
  unint64_t v12 = [a4 count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      uint64_t v20 = _os_log_pack_size();
      double v22 = (char *)v58 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = _os_log_pack_fill();
      double v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v24, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      uint64_t v26 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v25) userInfo:0 osLogPack:v22 size:v20];
      objc_exception_throw(v26);
    }
    unint64_t v42 = v12;
    uint64_t v43 = _os_log_pack_size();
    uint64_t v45 = (char *)v58 - ((MEMORY[0x1F4188790](v43, v44) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v46 = _os_log_pack_fill();
    double v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v46, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, --v42);
    CFStringRef v48 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v47, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, v42);
    uint64_t v49 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v48) userInfo:0 osLogPack:v45 size:v43];
    objc_exception_throw(v49);
  }
  NSUInteger v13 = [(NSOrderedSet *)self count];
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      uint64_t v27 = _os_log_pack_size();
      uint64_t v29 = (char *)v58 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v31, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      uint64_t v33 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v29 size:v27];
      objc_exception_throw(v33);
    }
    NSUInteger v50 = v13;
    uint64_t v51 = _os_log_pack_size();
    CFStringRef v53 = (char *)v58 - ((MEMORY[0x1F4188790](v51, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v54 = _os_log_pack_fill();
    double v55 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v54, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, --v50);
    CFStringRef v56 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v55, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, v50);
    uint64_t v57 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v56) userInfo:0 osLogPack:v53 size:v51];
    objc_exception_throw(v57);
  }
  if (length >> 60)
  {
    CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", length);
    CFStringRef v35 = +[NSException exceptionWithName:@"NSGenericException" reason:v34 userInfo:0];
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
  uint64_t v18 = (char *)v58 - v17;
  v58[0] = 0;
  if (length >= 0x101)
  {
    uint64_t v18 = (char *)_CFCreateArrayStorage(v16, 0, v58);
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v18, location, length, v58[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    uint64_t v29 = (char *)v41 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]");
    CFStringRef v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
LABEL_4:
  NSUInteger v9 = [(NSOrderedSet *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v20 = (char *)v41 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      double v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v20 size:v18];
      objc_exception_throw(v24);
    }
    uint64_t v33 = _os_log_pack_size();
    CFStringRef v35 = (char *)v41 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = v10 - 1;
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v37);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v38, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v37);
    CFStringRef v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  unint64_t v11 = [a4 count];
  unint64_t v13 = v11;
  if (v11 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
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
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v41[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
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
    uint64_t v29 = (char *)v41 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]";
    CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]");
    CFStringRef v32 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v31) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v32);
  }
LABEL_4:
  NSUInteger v9 = [(NSOrderedSet *)self count];
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v20 = (char *)v41 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length);
      CFStringRef v23 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length);
      double v24 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v23) userInfo:0 osLogPack:v20 size:v18];
      objc_exception_throw(v24);
    }
    uint64_t v33 = _os_log_pack_size();
    CFStringRef v35 = (char *)v41 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = v10 - 1;
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length, v37);
    CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v38, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length, v37);
    CFStringRef v40 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v39) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  unint64_t v11 = [a4 count];
  unint64_t v13 = v11;
  if (v11 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v11);
    uint64_t v26 = +[NSException exceptionWithName:@"NSGenericException" reason:v25 userInfo:0];
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
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)setArray:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet setArray:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: array argument is not an NSArray", "-[NSMutableOrderedSet setArray:]");
    NSUInteger v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
LABEL_4:
  [(NSMutableOrderedSet *)self removeAllObjects];

  [(NSMutableOrderedSet *)self insertObjectsFromArray:a3 atIndex:0];
}

- (void)setObject:(id)obj atIndex:(NSUInteger)idx
{
  v21[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (obj) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableOrderedSet setObject:atIndex:]";
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableOrderedSet setObject:atIndex:]");
    uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
    objc_exception_throw(v12);
  }
  if (!obj) {
    goto LABEL_13;
  }
LABEL_3:
  NSUInteger v8 = [(NSOrderedSet *)self count];
  if ((idx & 0x8000000000000000) != 0 || v8 < idx)
  {
    if (v8)
    {
      NSUInteger v17 = v8;
      uint64_t v13 = _os_log_pack_size();
      unint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet setObject:atIndex:]", idx, --v17);
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v19, "-[NSMutableOrderedSet setObject:atIndex:]", idx, v17);
    }
    else
    {
      uint64_t v13 = _os_log_pack_size();
      unint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableOrderedSet setObject:atIndex:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = idx;
      CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[NSMutableOrderedSet setObject:atIndex:]", idx);
    }
    uint64_t v20 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
    objc_exception_throw(v20);
  }
  if ([(NSOrderedSet *)self count] == idx)
  {
    [(NSMutableOrderedSet *)self insertObject:obj atIndex:idx];
  }
  else
  {
    [(NSMutableOrderedSet *)self replaceObjectAtIndex:idx withObject:obj];
  }
}

- (void)setObject:(id)a3
{
  v12[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "-[NSMutableOrderedSet setObject:]";
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[NSMutableOrderedSet setObject:]");
    CFStringRef v11 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v10) userInfo:0 osLogPack:(char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) size:v8];
    objc_exception_throw(v11);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!a3) {
    goto LABEL_12;
  }
LABEL_3:
  NSUInteger v6 = [(NSOrderedSet *)self indexOfObject:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    id v7 = 0;
  }
  else {
    id v7 = [(NSOrderedSet *)self objectAtIndex:v6];
  }
  if (v7 != a3)
  {
    [(NSMutableOrderedSet *)self replaceObjectAtIndex:v6 withObject:a3];
  }
}

- (void)setOrderedSet:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet setOrderedSet:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: ordered set argument is not an NSOrderedSet", "-[NSMutableOrderedSet setOrderedSet:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
LABEL_4:
  if (self != a3)
  {
    [(NSMutableOrderedSet *)self removeAllObjects];
    [(NSMutableOrderedSet *)self insertObjectsFromOrderedSet:a3 atIndex:0];
  }
}

- (void)setSet:(id)a3
{
  v10[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
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
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet setSet:]";
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: set argument is not an NSSet", "-[NSMutableOrderedSet setSet:]");
    uint64_t v9 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v8) userInfo:0 osLogPack:(char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) size:v6];
    objc_exception_throw(v9);
  }
LABEL_4:
  [(NSMutableOrderedSet *)self removeAllObjects];

  [(NSMutableOrderedSet *)self insertObjectsFromSet:a3 atIndex:0];
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  v6.receiver = self;
  v6.super_class = (Class)NSMutableOrderedSet;
  return (id)objc_msgSend(-[NSOrderedSet sortedArrayFromRange:options:usingComparator:](&v6, sel_sortedArrayFromRange_options_usingComparator_, a3.location, a3.length, a4, a5), "copy");
}

- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v15[1] = *(void *)off_1ECE0A5B0;
  [(NSMutableOrderedSet *)self _mutate];
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v9 = _os_log_pack_size();
    CFStringRef v11 = (char *)v15 - ((MEMORY[0x1F4188790](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet sortWithOptions:usingComparator:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: comparator cannot be nil", "-[NSMutableOrderedSet sortWithOptions:usingComparator:]");
    unint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v9];
    objc_exception_throw(v14);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!cmptr) {
    goto LABEL_8;
  }
LABEL_3:
  NSUInteger v8 = [(NSOrderedSet *)self count];
  if (v8 >= 2)
  {
    -[NSMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v8, opts, cmptr);
  }
}

- (NSMutableOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v13 = _os_log_pack_size();
    unint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a4;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[NSMutableOrderedSet initWithObjects:count:]", a4);
    goto LABEL_12;
  }
  if (a4 >> 61)
  {
    uint64_t v13 = _os_log_pack_size();
    unint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a4;
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[NSMutableOrderedSet initWithObjects:count:]", a4);
LABEL_12:
    uint64_t v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v16) userInfo:0 osLogPack:v14 size:v13];
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
        *(void *)(v10 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
        *(_WORD *)(v10 + 12) = 2048;
        *(void *)(v10 + 14) = i;
        CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[NSMutableOrderedSet initWithObjects:count:]", i);
        uint64_t v12 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v11) userInfo:0 osLogPack:(char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) size:v9];
        objc_exception_throw(v12);
      }
    }
  }
  uint64_t v7 = [(NSMutableOrderedSet *)self initWithCapacity:a4];
  [(NSMutableOrderedSet *)v7 insertObjects:a3 count:a4 atIndex:0];
  return v7;
}

- (void)insertObject:(id)object atIndex:(NSUInteger)idx
{
  OUTLINED_FUNCTION_1_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_0_1();

  __CFRequireConcreteImplementation(v4, v5, v6);
}

- (void)removeObjectAtIndex:(NSUInteger)idx
{
  OUTLINED_FUNCTION_1_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_0_1();

  __CFRequireConcreteImplementation(v3, v4, v5);
}

- (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object
{
  OUTLINED_FUNCTION_1_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_0_1();

  __CFRequireConcreteImplementation(v4, v5, v6);
}

- (NSMutableOrderedSet)initWithCapacity:(NSUInteger)numItems
{
  OUTLINED_FUNCTION_1_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_0_1();
  __CFRequireConcreteImplementation(v3, v4, v5);
}

@end