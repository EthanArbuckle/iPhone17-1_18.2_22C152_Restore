@interface IMCapturedInvocationTrampoline
- (IMCapturedInvocationTrampoline)initWithTarget:(id)a3 outInvocation:(id *)a4;
- (void)forwardInvocation:(id)a3;
@end

@implementation IMCapturedInvocationTrampoline

- (IMCapturedInvocationTrampoline)initWithTarget:(id)a3 outInvocation:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMCapturedInvocationTrampoline;
  v7 = [(IMCapturedInvocationTrampoline *)&v12 init];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setTarget_(v7, v8, (uint64_t)v6, v9);
    v10->_outInvocation = a4;
  }

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v11 = a3;
  v7 = objc_msgSend_target(self, v4, v5, v6);
  objc_msgSend_setTarget_(v11, v8, (uint64_t)v7, v9);

  outInvocation = self->_outInvocation;
  if (outInvocation) {
    id *outInvocation = v11;
  }
}

@end