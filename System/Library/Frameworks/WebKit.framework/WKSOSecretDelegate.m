@interface WKSOSecretDelegate
- (WKSOSecretDelegate)initWithSession:(void *)a3;
- (id).cxx_construct;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewDidClose:(id)a3;
@end

@implementation WKSOSecretDelegate

- (WKSOSecretDelegate)initWithSession:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKSOSecretDelegate;
  v5 = [(WKSOSecretDelegate *)&v9 init];
  if (v5)
  {
    v6 = (atomic_uchar *)*((void *)a3 + 1);
    if (v6) {
      v6 = WTF::ThreadSafeWeakPtrControlBlock::weakRef(v6);
    }
    m_ptr = (atomic_uchar *)v5->_weakSession.m_controlBlock.m_ptr;
    v5->_weakSession.m_controlBlock.m_ptr = (ThreadSafeWeakPtrControlBlock *)v6;
    if (m_ptr) {
      WTF::ThreadSafeWeakPtrControlBlock::weakDeref(m_ptr, v4);
    }
    v5->_weakSession.m_objectOfCorrectType = (PopUpSOAuthorizationSession *)a3;
    v5->_isFirstNavigation = 1;
  }
  return v5;
}

- (void)webViewDidClose:(id)a3
{
  m_ptr = self->_weakSession.m_controlBlock.m_ptr;
  if (m_ptr)
  {
    WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::LibWebRTCCodecsProxy>(&v7, (atomic_uchar *)m_ptr, (uint64_t)self->_weakSession.m_objectOfCorrectType);
    v5 = v7;
    if (v7)
    {
      WebKit::PopUpSOAuthorizationSession::close(v7, (WKWebView *)a3);
      v6 = (atomic_uchar *)*((void *)v5 + 1);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(v6);
    }
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  if (self->_isFirstNavigation)
  {
    uint64_t v5 = 0;
    self->_isFirstNavigation = 0;
  }
  else
  {
    uint64_t v5 = 3;
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v5);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  m_ptr = self->_weakSession.m_controlBlock.m_ptr;
  if (m_ptr)
  {
    WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::LibWebRTCCodecsProxy>(&v8, (atomic_uchar *)m_ptr, (uint64_t)self->_weakSession.m_objectOfCorrectType);
    v6 = v8;
    if (v8)
    {
      WebKit::PopUpSOAuthorizationSession::close(v8, (WKWebView *)a3);
      v7 = (atomic_uchar *)*((void *)v6 + 1);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(v7);
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_weakSession.m_controlBlock.m_ptr;
  self->_weakSession.m_controlBlock.m_ptr = 0;
  if (m_ptr) {
    WTF::ThreadSafeWeakPtrControlBlock::weakDeref((atomic_uchar *)m_ptr, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end