@interface QLDelegateProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (id)firstDelegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)secondDelegate;
- (void)forwardInvocation:(id)a3;
- (void)setFirstDelegate:(id)a3;
- (void)setSecondDelegate:(id)a3;
@end

@implementation QLDelegateProxy

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  if (objc_opt_respondsToSelector())
  {
    char v5 = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained(&self->_secondDelegate);
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  id v6 = [WeakRetained methodSignatureForSelector:a3];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = objc_loadWeakRetained(&self->_secondDelegate);
    id v8 = [v9 methodSignatureForSelector:a3];
  }

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  if (WeakRetained)
  {
    char v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&self->_firstDelegate);
    [v15 selector];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_firstDelegate);
      [v15 invokeWithTarget:v8];
    }
  }
  p_secondDelegate = &self->_secondDelegate;
  id v10 = objc_loadWeakRetained(p_secondDelegate);
  if (v10)
  {
    v11 = v10;
    id v12 = objc_loadWeakRetained(p_secondDelegate);
    [v15 selector];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained(p_secondDelegate);
      [v15 invokeWithTarget:v14];
    }
  }
}

- (id)firstDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);

  return WeakRetained;
}

- (void)setFirstDelegate:(id)a3
{
}

- (id)secondDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_secondDelegate);

  return WeakRetained;
}

- (void)setSecondDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_secondDelegate);

  objc_destroyWeak(&self->_firstDelegate);
}

@end