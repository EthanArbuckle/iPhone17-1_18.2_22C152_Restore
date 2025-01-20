@interface VSWeakForwardingTarget
- (BOOL)respondsToSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)object;
- (void)setObject:(id)a3;
@end

@implementation VSWeakForwardingTarget

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VSWeakForwardingTarget;
  if (-[VSWeakForwardingTarget respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(VSWeakForwardingTarget *)self object];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VSWeakForwardingTarget;
  v5 = -[VSWeakForwardingTarget methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = [(VSWeakForwardingTarget *)self object];
    v5 = [v6 methodSignatureForSelector:a3];
  }

  return v5;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end