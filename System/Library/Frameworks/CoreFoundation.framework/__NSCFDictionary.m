@interface __NSCFDictionary
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObservationInfo:(void *)a3;
@end

@implementation __NSCFDictionary

- (id)objectForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return (id)CFDictionaryGetValue((CFDictionaryRef)self, a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  }

  return _CFDictionaryFastEnumeration((unint64_t)self, (uint64_t *)a3, (uint64_t)a4, a5);
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }

  return CFDictionaryGetCount((CFDictionaryRef)self);
}

- (id)keyEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  v4 = (void *)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];

  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (!_CFDictionaryIsMutable((unint64_t)self)) {
    -[__NSCFDictionary setObject:forKey:]((objc_class *)self, a2);
  }
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_4;
    }
LABEL_9:
    _NSDictionaryRaiseInsertNilKeyException((objc_class *)self, a2);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_9;
  }
LABEL_4:
  if (!a3) {
    _NSDictionaryRaiseInsertNilValueException((objc_class *)self, a2, (uint64_t)a4);
  }
  id v9 = (id)[a4 copyWithZone:0];
  CFDictionarySetValue((CFMutableDictionaryRef)self, v9, a3);
}

- (Class)classForCoder
{
  _CFDictionaryIsMutable((unint64_t)self);

  return (Class)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  theDict = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    self = theDict;
  }
  if (_CFDictionaryIsMutable((unint64_t)self))
  {
    return CFDictionaryCreateCopy(0, (CFDictionaryRef)theDict);
  }
  else
  {
    return theDict;
  }
}

- (id)description
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  __CFDictionaryGetKeyCallbacks((uint64_t)self, (uint64_t)v9);
  uint64_t v4 = v10;
  __CFDictionaryGetValueCallbacks((uint64_t)self, v7);
  if (v4 && v4 != CFCopyDescription || v8 && v8 != CFCopyDescription) {
    return (id)(id)CFCopyDescription(self);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFDictionary;
  return [(NSDictionary *)&v6 description];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)removeObjectForKey:(id)a3
{
  if (!_CFDictionaryIsMutable((unint64_t)self)) {
    -[__NSCFDictionary removeObjectForKey:]((objc_class *)self, a2);
  }
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (!a3) {
    _NSDictionaryRaiseRemoveNilKeyException((objc_class *)self, a2);
  }

  CFDictionaryRemoveValue((CFMutableDictionaryRef)self, a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  _CFDictionarySetKVOBit((uint64_t)self, a3 != 0);
  v5.receiver = self;
  v5.super_class = (Class)__NSCFDictionary;
  [(__NSCFDictionary *)&v5 setObservationInfo:a3];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSCFDictionary;
    return [(NSDictionary *)&v7 isEqual:a3];
  }
  else
  {
    return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }

  return CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)self);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (void)setObject:(objc_class *)a1 forKey:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

- (void)removeObjectForKey:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInternalInconsistencyException", @"%@: mutating method sent to immutable object", v2);
}

@end