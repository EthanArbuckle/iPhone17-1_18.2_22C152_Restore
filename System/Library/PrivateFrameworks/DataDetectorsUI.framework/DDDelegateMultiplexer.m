@interface DDDelegateMultiplexer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (DDDelegateMultiplexer)initWithDelegate:(id)a3 andDelegate:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation DDDelegateMultiplexer

- (DDDelegateMultiplexer)initWithDelegate:(id)a3 andDelegate:(id)a4
{
  p_delegateA = &self->_delegateA;
  id v7 = a4;
  objc_storeWeak((id *)p_delegateA, a3);
  objc_storeWeak((id *)&self->_delegateB, v7);

  return self;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  p_delegateA = &self->_delegateA;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  if (WeakRetained
    && (id v7 = WeakRetained,
        id v8 = objc_loadWeakRetained((id *)p_delegateA),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    p_delegateB = &self->_delegateB;
    id v12 = objc_loadWeakRetained((id *)&self->_delegateB);
    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)p_delegateB);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && !sel_isEqual(a3, sel_adaptivePresentationStyleForPresentationController_traitCollection_))
      {
        BOOL v10 = !sel_isEqual(a3, sel_adaptivePresentationStyleForPresentationController_);
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v15 = a3;
  [v15 selector];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegateA);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegateA);
      [v15 invokeWithTarget:v8];
    }
  }
  p_delegateB = &self->_delegateB;
  id v10 = objc_loadWeakRetained((id *)p_delegateB);
  if (v10)
  {
    v11 = v10;
    id v12 = objc_loadWeakRetained((id *)p_delegateB);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_delegateB);
      [v15 invokeWithTarget:v14];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  id v6 = [WeakRetained methodSignatureForSelector:a3];

  if (!v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegateB);
    id v6 = [v7 methodSignatureForSelector:a3];
  }
  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  if (WeakRetained
    && (id v6 = WeakRetained,
        id v7 = objc_loadWeakRetained((id *)&self->_delegateA),
        char v8 = [v7 conformsToProtocol:v4],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = 1;
  }
  else
  {
    p_delegateB = &self->_delegateB;
    id v11 = objc_loadWeakRetained((id *)&self->_delegateB);
    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_delegateB);
      char v9 = [v12 conformsToProtocol:v4];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateB);
  objc_destroyWeak((id *)&self->_delegateA);
}

@end