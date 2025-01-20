@interface _TSHostingViewInvocationTarget
- (_TSHostingViewInvocationTarget)initWithHandler:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _TSHostingViewInvocationTarget

- (_TSHostingViewInvocationTarget)initWithHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id handler = self->_handler;
  self->_id handler = v4;

  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[MEMORY[0x1E4F1CA38] signatureWithObjCTypes:"v@:@"];
}

- (void)forwardInvocation:(id)a3
{
  id handler = self->_handler;
  uint64_t v4 = [a3 selector];
  v5 = (void (*)(void *, uint64_t))handler[2];

  v5(handler, v4);
}

- (void).cxx_destruct
{
}

@end