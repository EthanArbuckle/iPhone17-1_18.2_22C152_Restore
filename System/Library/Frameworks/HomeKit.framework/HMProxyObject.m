@interface HMProxyObject
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)superclass;
- (HMProxyObject)self;
- (id)debugDescription;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (unint64_t)hash;
- (void)doesNotRecognizeSelector:(SEL)a3;
@end

@implementation HMProxyObject

- (id)debugDescription
{
  v2 = self;

  return (id)[v2 debugDescription];
}

- (id)description
{
  v2 = self;

  return (id)[v2 description];
}

- (unint64_t)hash
{
  v2 = self;

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = self;

  return [v4 isEqual:self];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  v8 = self;

  return (id)[v8 performSelector:a3 withObject:a4 withObject:a5];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  v6 = self;

  return (id)[v6 performSelector:a3 withObject:a4];
}

- (id)performSelector:(SEL)a3
{
  v4 = self;

  return (id)[v4 performSelector:a3];
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"-[??? %@]: unrecognized selector sent to invalid proxy", NSStringFromSelector(a3)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = self;

  return (id)[v4 methodSignatureForSelector:a3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v4 = self;

  return [v4 conformsToProtocol:a3];
}

- (BOOL)isMemberOfClass:(Class)a3
{
  v4 = self;

  return [v4 isMemberOfClass:a3];
}

- (BOOL)isKindOfClass:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (Class)superclass
{
  v2 = self;

  return (Class)[v2 superclass];
}

- (HMProxyObject)self
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"You must override %@ in a subclass", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

@end