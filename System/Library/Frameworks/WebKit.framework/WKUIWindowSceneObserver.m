@interface WKUIWindowSceneObserver
- (WKUIWindowSceneObserver)initWithParent:(void *)a3;
- (id).cxx_construct;
- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:change:context:;
- (void)observeValueForKeyPath:(void *)a1 ofObject:change:context:;
- (void)setObservedWindow:(id)a3;
@end

@implementation WKUIWindowSceneObserver

- (void)setObservedWindow:(id)a3
{
  if (WTF::linkedOnOrAfterSDKWithBehavior())
  {
    if (a3) {
      CFRetain(a3);
    }
    id WeakRetained = objc_loadWeakRetained(&self->_window.m_weakReference);
    v6 = WeakRetained;
    if (WeakRetained != a3)
    {
      if (WeakRetained) {
        [WeakRetained removeObserver:self forKeyPath:@"windowScene"];
      }
      objc_storeWeak(&self->_window.m_weakReference, a3);
      if (a3) {
        [a3 addObserver:self forKeyPath:@"windowScene" options:1 context:WebKit::WKUIWindowSceneObserverContext];
      }
    }
    if (v6) {
      CFRelease(v6);
    }
    if (a3)
    {
      CFRelease(a3);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (WKUIWindowSceneObserver)initWithParent:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKUIWindowSceneObserver;
  v4 = [(WKUIWindowSceneObserver *)&v9 init];
  if (v4)
  {
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3, (uint64_t)a3);
    v6 = *(atomic_uint **)a3;
    if (*(void *)a3) {
      atomic_fetch_add(v6, 1u);
    }
    m_ptr = (unsigned int *)v4->_parent.m_impl.m_ptr;
    v4->_parent.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v5);
    }
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WebKit::WKUIWindowSceneObserverContext == a6)
  {
    if (self) {
      CFRetain(self);
    }
    if (a5) {
      CFRetain(a5);
    }
    v8 = (void *)WTF::fastMalloc((WTF *)0x20);
    void *v8 = &unk_1EE9C1860;
    v8[1] = self;
    v8[2] = self;
    v8[3] = a5;
    objc_super v9 = v8;
    WTF::ensureOnMainThread();
    if (v9) {
      (*(void (**)(void *))(*v9 + 8))(v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_window.m_weakReference);
  m_ptr = (unsigned int *)self->_parent.m_impl.m_ptr;
  self->_parent.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, v3);
  }
}

- (void)observeValueForKeyPath:(void *)a1 ofObject:change:context:
{
  *a1 = &unk_1EE9C1860;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  *(void *)this = &unk_1EE9C1860;
  v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:change:context:
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 8) + 8);
  if (v1 && *(void *)(v1 + 8))
  {
    uint64_t v3 = [*(id *)(a1 + 24) valueForKey:*MEMORY[0x1E4F284C8]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = *(void *)(*(void *)(a1 + 8) + 8);
    if (isKindOfClass)
    {
      if (v5) {
        v6 = *(id **)(v5 + 8);
      }
      else {
        v6 = 0;
      }
      v7 = (UIScene *)v3;
    }
    else
    {
      if (v5) {
        v6 = *(id **)(v5 + 8);
      }
      else {
        v6 = 0;
      }
      v7 = 0;
    }
    WebKit::ApplicationStateTracker::setScene(v6, v7);
  }
}

@end