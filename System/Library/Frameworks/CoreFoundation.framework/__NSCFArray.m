@interface __NSCFArray
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation __NSCFArray

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  char v9 = 0;
  id result = (id)_CFArrayCheckAndGetValueAtIndex((unint64_t *)self, a3, &v9);
  if (v9)
  {
    uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  char v9 = 0;
  id result = (id)_CFArrayCheckAndGetValueAtIndex((unint64_t *)self, a3, &v9);
  if (v9)
  {
    uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (!__cf_tsanReadFunction)
  {
    if (a3) {
      return self == a3 || _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
    }
    return 0;
  }
  __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  if (!a3) {
    return 0;
  }
  return self == a3 || _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (!_CFArrayIsMutable((uint64_t)self)) {
    -[__NSCFArray removeObjectAtIndex:]((objc_class *)self, a2);
  }
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (_CFNonObjCArrayGetCount((uint64_t)self) <= a3)
  {
    uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }

  _CFArrayReplaceValues((unint64_t)self, a3, 1, 0, 0);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  unint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
  unint64_t v11 = location + length;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || Count < v11) {
    _NSArrayRaiseBoundException((uint64_t)self, a2, v11 - 1, Count);
  }
  if (length)
  {
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    CFArrayGetValues((CFArrayRef)self, v12, (const void **)a3);
  }
}

- (void)addObject:(id)a3
{
  uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);

  [(__NSCFArray *)self insertObject:a3 atIndex:Count];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }

  return _CFArrayFastEnumeration((unint64_t *)self, a3);
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }

  return _CFNonObjCArrayGetCount((uint64_t)self);
}

- (Class)classForCoder
{
  _CFArrayIsMutable((uint64_t)self);

  return (Class)self;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v9[1] = *(void *)off_1ECE0A5B0;
  v9[0] = a3;
  if (!_CFArrayIsMutable((uint64_t)self)) {
    -[__NSCFArray insertObject:atIndex:]((objc_class *)self, a2);
  }
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    _NSArrayRaiseInsertNilException((uint64_t)self, a2);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  if (_CFNonObjCArrayGetCount((uint64_t)self) < a4) {
    -[__NSCFArray insertObject:atIndex:]((uint64_t)self, a2, a4);
  }
  _CFArrayReplaceValues((unint64_t)self, a4, 0, v9, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  theArray = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    self = theArray;
  }
  if (_CFArrayIsMutable((uint64_t)self))
  {
    return CFArrayCreateCopy(0, (CFArrayRef)theArray);
  }
  else
  {
    return theArray;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return CFArrayCreateMutableCopy(0, 0, (CFArrayRef)self);
}

- (id)description
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  copyDescription = __CFArrayGetCallBacks((uint64_t)self)->copyDescription;
  if (copyDescription == CFCopyDescription || copyDescription == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)__NSCFArray;
    return [(NSArray *)&v8 description];
  }
  else
  {
    v7 = (__CFString *)CFCopyDescription(self);
    return v7;
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)removeLastObject
{
  uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!Count) {
      return;
    }
    uint64_t v4 = Count - 1;
  }
  else if (Count)
  {
    uint64_t v4 = Count - 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  [(__NSCFArray *)self removeObjectAtIndex:v4];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!_CFArrayIsMutable((uint64_t)self)) {
    -[__NSCFArray replaceObjectAtIndex:withObject:]((objc_class *)self, a2);
  }
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_4;
    }
LABEL_9:
    _NSArrayRaiseInsertNilException((uint64_t)self, a2);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4) {
    goto LABEL_9;
  }
LABEL_4:
  if (_CFNonObjCArrayGetCount((uint64_t)self) <= a3)
  {
    uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }

  CFArraySetValueAtIndex((CFMutableArrayRef)self, a3, a4);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (void)insertObject:(unint64_t)a3 atIndex:.cold.1(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t Count = _CFNonObjCArrayGetCount(a1);
  _NSArrayRaiseBoundException(a1, a2, a3, Count + 1);
}

- (void)insertObject:(objc_class *)a1 atIndex:(const char *)a2 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

- (void)replaceObjectAtIndex:(objc_class *)a1 withObject:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

- (void)removeObjectAtIndex:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

@end