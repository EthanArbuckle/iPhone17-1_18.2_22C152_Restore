@interface NSAutoContentAccessingProxy
+ (id)proxyWithTarget:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation NSAutoContentAccessingProxy

+ (id)proxyWithTarget:(id)a3
{
  if (![a3 conformsToProtocol:&unk_1ECACB2C0]
    || ![a3 beginContentAccess])
  {
    return 0;
  }
  v4 = [NSAutoContentAccessingProxy alloc];
  v4->_target = a3;

  return v4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_target methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  [a3 setTarget:self->_target];

  [a3 invoke];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [self->_target endContentAccess];

  v3.receiver = self;
  v3.super_class = (Class)NSAutoContentAccessingProxy;
  [(NSProxy *)&v3 dealloc];
}

@end