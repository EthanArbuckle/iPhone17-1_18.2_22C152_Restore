@interface EFPromise
+ (id)promise;
- (BOOL)respondsToSelector:(SEL)a3;
- (EFFuture)future;
- (EFPromise)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)cancel;
@end

@implementation EFPromise

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_future;
}

- (void).cxx_destruct
{
}

+ (id)promise
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (EFPromise)init
{
  v6.receiver = self;
  v6.super_class = (Class)EFPromise;
  id v2 = [(EFPromise *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(EFFuture);
    future = v2->_future;
    v2->_future = v3;
  }
  return v2;
}

- (EFFuture)future
{
  return (EFFuture *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EFPromise;
  if (-[EFPromise respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EFPromise;
  objc_super v5 = -[EFPromise methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(EFFuture *)self->_future methodSignatureForSelector:a3];
  }
  v8 = v7;

  return v8;
}

- (void)cancel
{
}

@end