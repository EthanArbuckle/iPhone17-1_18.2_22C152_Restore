@interface NSCFError
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (Class)classForCoder;
- (NSCFError)initWithCoder:(id)a3;
- (NSCFError)retain;
- (id)userInfo;
- (unint64_t)hash;
@end

@implementation NSCFError

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

- (NSCFError)retain
{
  return (NSCFError *)MEMORY[0x1F40D8EC0](self, a2);
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

- (NSCFError)initWithCoder:(id)a3
{
  v4 = [NSError alloc];

  return (NSCFError *)[(NSError *)v4 initWithCoder:a3];
}

- (id)userInfo
{
  CFDictionaryRef v2 = CFErrorCopyUserInfo((CFErrorRef)self);

  return v2;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end