@interface AMSURLDelegateProxy
- (AMSURLDelegateProxy)initWithSession:(id)a3 delegate:(id)a4;
- (AMSURLSession)session;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)delegate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AMSURLDelegateProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  v5 = [(AMSURLDelegateProxy *)self session];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(AMSURLDelegateProxy *)self session];
  }
  else
  {
    v8 = [(AMSURLDelegateProxy *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v7 = [(AMSURLDelegateProxy *)self delegate];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)AMSURLDelegateProxy;
      v7 = [(AMSURLDelegateProxy *)&v11 forwardingTargetForSelector:a3];
    }
  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5 = [(AMSURLDelegateProxy *)self session];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(AMSURLDelegateProxy *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v6 = 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)AMSURLDelegateProxy;
      BOOL v6 = [(AMSURLDelegateProxy *)&v9 respondsToSelector:a3];
    }
  }
  return v6;
}

- (AMSURLSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (AMSURLSession *)WeakRetained;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (AMSURLDelegateProxy)initWithSession:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSURLDelegateProxy;
  v8 = [(AMSURLDelegateProxy *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_session, v6);
    objc_storeWeak(&v9->_delegate, v7);
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
}

- (void)invalidate
{
  [(AMSURLDelegateProxy *)self setSession:0];
  [(AMSURLDelegateProxy *)self setDelegate:0];
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSURLDelegateProxy;
  v3 = [(AMSURLDelegateProxy *)&v5 methodSignatureForSelector:a3];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:"@:"];
  }
  return v3;
}

@end