@interface AMSUIWebDelegateProxy
- (AMSUIWebDelegateProxy)initWithDelegate:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)delegate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMSUIWebDelegateProxy

- (AMSUIWebDelegateProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebDelegateProxy;
  v5 = [(AMSUIWebDelegateProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_delegate, v4);
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v5 = [(AMSUIWebDelegateProxy *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(AMSUIWebDelegateProxy *)self delegate];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AMSUIWebDelegateProxy;
    v7 = [(AMSUIWebDelegateProxy *)&v9 forwardingTargetForSelector:a3];
  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5 = [(AMSUIWebDelegateProxy *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AMSUIWebDelegateProxy;
    BOOL v6 = [(AMSUIWebDelegateProxy *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIWebDelegateProxy;
  v3 = [(AMSUIWebDelegateProxy *)&v5 methodSignatureForSelector:a3];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF970] signatureWithObjCTypes:"@:"];
  }
  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end