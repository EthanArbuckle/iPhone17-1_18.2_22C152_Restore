@interface FMWeakForwardingContainer
- (BOOL)respondsToSelector:(SEL)a3;
- (FMWeakForwardingContainer)initWithTarget:(id)a3;
- (NSObject)target;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation FMWeakForwardingContainer

- (void).cxx_destruct
{
}

- (FMWeakForwardingContainer)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMWeakForwardingContainer;
  v5 = [(FMWeakForwardingContainer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_target, v4);
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return WeakRetained;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  v6 = [WeakRetained methodSignatureForSelector:a3];

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)FMWeakForwardingContainer;
    v6 = [(FMWeakForwardingContainer *)&v8 methodSignatureForSelector:sel_self];
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [v5 selector];
  if (objc_opt_respondsToSelector()) {
    [v5 invokeWithTarget:WeakRetained];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return 1;
}

- (NSObject)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return WeakRetained;
}

@end