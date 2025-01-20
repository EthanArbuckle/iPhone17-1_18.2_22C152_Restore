@interface __NSCFError
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (__NSCFError)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
@end

@implementation __NSCFError

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(objc_class *)objc_lookUpClass("NSError") allocWithZone:a3];
  id v5 = [(__NSCFError *)self domain];
  int64_t v6 = [(__NSCFError *)self code];
  id v7 = [(__NSCFError *)self userInfo];

  return [(objc_class *)v4 initWithDomain:v5 code:v6 userInfo:v7];
}

- (id)userInfo
{
  CFDictionaryRef v2 = CFErrorCopyUserInfo((CFErrorRef)self);

  return v2;
}

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

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (__NSCFError)initWithCoder:(id)a3
{
  id v4 = objc_alloc(objc_lookUpClass("NSError"));

  return (__NSCFError *)[v4 initWithCoder:a3];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (Class)classForCoder
{
  return objc_lookUpClass("NSError");
}

@end