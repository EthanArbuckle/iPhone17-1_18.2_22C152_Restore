@interface IMInvocationTrampoline
- (BOOL)respondsToSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)performInvocation:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation IMInvocationTrampoline

- (void)dealloc
{
  id target = self->_target;
  self->_id target = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMInvocationTrampoline;
  [(IMInvocationTrampoline *)&v4 dealloc];
}

- (void)performInvocation:(id)a3
{
  id v11 = a3;
  objc_super v4 = (void *)MEMORY[0x192FDE5A0]();
  v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_invokeWithTarget_(v11, v9, (uint64_t)v8, v10);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)IMInvocationTrampoline;
  if (-[IMInvocationTrampoline respondsToSelector:](&v14, sel_respondsToSelector_))
  {
    v8 = self;
  }
  else
  {
    objc_msgSend_target(self, v5, v6, v7);
    v8 = (IMInvocationTrampoline *)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v8;
  v12 = objc_msgSend_methodSignatureForSelector_(v8, v9, (uint64_t)a3, v10);

  return v12;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IMInvocationTrampoline;
  if (-[IMInvocationTrampoline respondsToSelector:](&v10, sel_respondsToSelector_))
  {
    char v7 = 1;
  }
  else
  {
    v8 = objc_msgSend_target(self, v4, v5, v6);
    char v7 = objc_opt_respondsToSelector();
  }
  return v7 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  objc_msgSend_target(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeWithTarget_(v4, v8, (uint64_t)v10, v9);
}

- (id)target
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end