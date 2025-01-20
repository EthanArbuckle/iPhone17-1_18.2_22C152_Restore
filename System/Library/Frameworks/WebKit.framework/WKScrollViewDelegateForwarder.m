@interface WKScrollViewDelegateForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (WKScrollViewDelegateForwarder)initWithInternalDelegate:(id)a3 externalDelegate:(id)a4;
- (id).cxx_construct;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation WKScrollViewDelegateForwarder

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKScrollViewDelegateForwarder;
  if (-[WKScrollViewDelegateForwarder respondsToSelector:](&v7, sel_respondsToSelector_)
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
    char v4 = objc_opt_respondsToSelector();
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
  }
  return v4 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  char v5 = objc_opt_respondsToSelector();
  if (sel_isEqual(a3, sel_viewForZoomingInScrollView_))
  {
    char v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
    char v6 = objc_opt_respondsToSelector();
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
  }
  if ((v5 & 1) != 0 && (v6 & 1) == 0) {
    return self->_internalDelegate;
  }
  if (v5 & 1 | ((v6 & 1) == 0)) {
    return 0;
  }

  return objc_loadWeak(&self->_externalDelegate.m_weakReference);
}

- (WKScrollViewDelegateForwarder)initWithInternalDelegate:(id)a3 externalDelegate:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WKScrollViewDelegateForwarder;
  char v6 = [(WKScrollViewDelegateForwarder *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_internalDelegate = (WKWebView *)a3;
    objc_storeWeak(&v6->_externalDelegate.m_weakReference, a4);
  }
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  char v6 = (const char *)[a3 selector];
  int v7 = objc_opt_respondsToSelector();
  if (sel_isEqual(v6, sel_viewForZoomingInScrollView_))
  {
    int v8 = 0;
    goto LABEL_6;
  }
  int v8 = objc_opt_respondsToSelector();
  if ((v7 & v8 & 1) == 0)
  {
LABEL_6:
    char v9 = 1;
    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [(WKWebView *)self->_internalDelegate _willInvokeUIScrollViewDelegateCallback];
  char v9 = 0;
  int v8 = 1;
  if (v7) {
LABEL_7:
  }
    [a3 invokeWithTarget:self->_internalDelegate];
LABEL_8:
  if (v8) {
    [a3 invokeWithTarget:WeakRetained];
  }
  if ((v9 & 1) == 0) {
    [(WKWebView *)self->_internalDelegate _didInvokeUIScrollViewDelegateCallback];
  }
  if (((v7 | v8) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)WKScrollViewDelegateForwarder;
    [(WKScrollViewDelegateForwarder *)&v10 forwardInvocation:a3];
  }
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  v8.receiver = self;
  v8.super_class = (Class)WKScrollViewDelegateForwarder;
  id v6 = [(WKScrollViewDelegateForwarder *)&v8 methodSignatureForSelector:a3];
  if (!v6)
  {
    id v6 = (id)[(WKWebView *)self->_internalDelegate methodSignatureForSelector:a3];
    if (!v6) {
      id v6 = (id)[WeakRetained methodSignatureForSelector:a3];
    }
  }
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v6;
}

- (void).cxx_destruct
{
}

@end