@interface ARWeakReference
+ (ARWeakReference)weakReferenceWithObject:(id)a3;
+ (void)_noOp;
- (ARWeakReference)initWithObject:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)object;
- (void)forwardInvocation:(id)a3;
@end

@implementation ARWeakReference

+ (ARWeakReference)weakReferenceWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return (ARWeakReference *)v5;
}

- (ARWeakReference)initWithObject:(id)a3
{
  if (a3)
  {
    objc_storeWeak(&self->_object, a3);
    id v4 = self;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  if (WeakRetained) {
    [v5 invokeWithTarget:WeakRetained];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    SEL v6 = a3;
  }
  else
  {
    id WeakRetained = objc_opt_class();
    SEL v6 = sel__noOp;
  }
  v7 = [WeakRetained methodSignatureForSelector:v6];

  return v7;
}

+ (void)_noOp
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This method is used as a dummy method signature and should never be called under any circumstances." userInfo:0];
  objc_exception_throw(v2);
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end