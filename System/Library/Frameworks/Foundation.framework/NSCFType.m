@interface NSCFType
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (NSCFType)retain;
- (unint64_t)hash;
@end

@implementation NSCFType

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (unint64_t)hash
{
  return MEMORY[0x1F40D8EB0](self, a2);
}

- (NSCFType)retain
{
  return (NSCFType *)MEMORY[0x1F40D8EC0](self, a2);
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end