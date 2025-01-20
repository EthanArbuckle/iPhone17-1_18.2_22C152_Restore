@interface __NSCFData
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_providesConcreteBacking;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLength:(unint64_t)a3;
@end

@implementation __NSCFData

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if ((__CFDataMtbl((uint64_t)self) & 1) != 0 || !_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v6.receiver = self;
    v6.super_class = (Class)__NSCFData;
    return [(__NSCFData *)&v6 copyWithZone:a3];
  }
  else
  {
    return _CFNonObjCRetain((unint64_t *)self);
  }
}

- (Class)classForCoder
{
  __CFDataMtbl((uint64_t)self);

  return (Class)self;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setLength:(unint64_t)a3
{
}

@end