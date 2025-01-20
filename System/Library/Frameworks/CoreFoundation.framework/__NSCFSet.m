@interface __NSCFSet
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation __NSCFSet

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }

  return CFSetGetCount((CFSetRef)self);
}

- (void)getObjects:(id *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  CFIndex Count = CFSetGetCount((CFSetRef)self);
  if (a3 && Count)
  {
    CFSetGetValues((CFSetRef)self, (const void **)a3);
  }
}

- (id)member:(id)a3
{
  v7[1] = *(const void **)off_1ECE0A5B0;
  if (!a3) {
    return 0;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  v7[0] = 0;
  if (CFSetGetValueIfPresent((CFSetRef)self, a3, v7)) {
    return (id)v7[0];
  }
  else {
    return 0;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
  }

  return _CFSetFastEnumeration((unint64_t)self, (uint64_t *)a3, (uint64_t)a4, a5);
}

- (void)removeObject:(id)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (!_CFSetIsMutable((unint64_t)self)) {
    -[__NSCFSet removeObject:]((objc_class *)self, a2);
  }
  if (!a3) {
    -[__NSCFSet removeObject:]((objc_class *)self, a2);
  }

  CFSetRemoveValue((CFMutableSetRef)self, a3);
}

- (void)addObject:(id)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (!_CFSetIsMutable((unint64_t)self)) {
    -[__NSCFSet addObject:]((objc_class *)self, a2);
  }
  if (!a3) {
    -[__NSCFSet addObject:]((objc_class *)self, a2);
  }

  CFSetAddValue((CFMutableSetRef)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  theSet = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    self = theSet;
  }
  if (_CFSetIsMutable((unint64_t)self))
  {
    return CFSetCreateCopy(0, (CFSetRef)theSet);
  }
  else
  {
    return theSet;
  }
}

- (void)removeAllObjects
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }

  return CFSetCreateMutableCopy(0, 0, (CFSetRef)self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSCFSet;
    return [(NSSet *)&v7 isEqual:a3];
  }
  else
  {
    return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)description
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  double Callbacks = __CFSetGetCallbacks((uint64_t)self, (uint64_t)v8);
  if (v9 != CFCopyDescription && v9 != 0) {
    return (id)(id)CFCopyDescription(self);
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSCFSet;
  return [(NSSet *)&v7 description];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (Class)classForCoder
{
  _CFSetIsMutable((unint64_t)self);

  return (Class)self;
}

- (id)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  v4 = (void *)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];

  return v4;
}

- (void)addObject:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: attempt to insert nil", v2);
}

- (void)addObject:(objc_class *)a1 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

- (void)removeObject:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: attempt to remove nil", v2);
}

- (void)removeObject:(objc_class *)a1 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

@end