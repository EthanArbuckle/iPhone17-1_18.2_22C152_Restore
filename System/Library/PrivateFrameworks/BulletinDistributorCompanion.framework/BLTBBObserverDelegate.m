@interface BLTBBObserverDelegate
- (BBObserverDelegate)actualDelegate;
- (BLTBBObserverDelegateDelegate)delegate;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)setActualDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BLTBBObserverDelegate

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained noteServerConnectionStateChanged:v4];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = +[BLTTransaction transactionWithDescription:@"BLTBBObserverDelegate forwarding transaction"];
  v6 = [(BLTBBObserverDelegate *)self actualDelegate];
  [v4 selector];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(BLTBBObserverDelegate *)self actualDelegate];
    [v4 invokeWithTarget:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BLTBBObserverDelegate;
    [(BLTBBObserverDelegate *)&v9 forwardInvocation:v4];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BLTBBObserverDelegate;
  if (-[BLTBBObserverDelegate respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(BLTBBObserverDelegate *)self actualDelegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    char v4 = [(BLTBBObserverDelegate *)self actualDelegate];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BLTBBObserverDelegate;
  v5 = -[BLTBBObserverDelegate methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = [(BLTBBObserverDelegate *)self actualDelegate];
    v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BBObserverDelegate)actualDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actualDelegate);
  return (BBObserverDelegate *)WeakRetained;
}

- (void)setActualDelegate:(id)a3
{
}

- (BLTBBObserverDelegateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTBBObserverDelegateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_actualDelegate);
}

@end