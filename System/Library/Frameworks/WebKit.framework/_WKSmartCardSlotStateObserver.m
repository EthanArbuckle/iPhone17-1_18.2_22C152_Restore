@interface _WKSmartCardSlotStateObserver
- (WebKit::CcidConnection)observeValueForKeyPath:(WebKit::CcidConnection *)result ofObject:change:context:;
- (_WKSmartCardSlotStateObserver)initWithService:(void *)a3 slot:(void *)a4;
- (id).cxx_construct;
- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observeValueForKeyPath:(void *)a1 ofObject:(void *)a2 change:context:;
- (void)removeObserver;
@end

@implementation _WKSmartCardSlotStateObserver

- (_WKSmartCardSlotStateObserver)initWithService:(void *)a3 slot:(void *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_WKSmartCardSlotStateObserver;
  v6 = [(_WKSmartCardSlotStateObserver *)&v14 init];
  v8 = v6;
  if (v6)
  {
    v9 = *(DefaultWeakPtrImpl **)a3;
    *(void *)a3 = 0;
    m_ptr = (unsigned int *)v6->m_service.m_impl.m_ptr;
    v8->m_service.m_impl.m_ptr = v9;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v7);
    }
    v11 = *(void **)a4;
    *(void *)a4 = 0;
    v12 = v8->m_slot.m_ptr;
    v8->m_slot.m_ptr = v11;
    if (v12) {
      CFRelease(v12);
    }
  }
  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  m_ptr = self->m_service.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    int v9 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "intValue");
    if (v9 == 4)
    {
      v10 = (const void *)[a4 makeSmartCard];
      v11 = v10;
      v12 = self->m_service.m_impl.m_ptr;
      if (v12) {
        atomic_fetch_add((atomic_uint *volatile)v12, 1u);
      }
      if (v10) {
        CFRetain(v10);
      }
      v13 = (void *)WTF::fastMalloc((WTF *)0x18);
      void *v13 = &unk_1EE9D2730;
      v13[1] = v12;
      v13[2] = v11;
      objc_super v14 = v13;
      WTF::callOnMainRunLoop();
      if (v14) {
        (*(void (**)(void *))(*v14 + 8))(v14);
      }
    }
    else if (!v9)
    {
      [(_WKSmartCardSlotStateObserver *)self removeObserver];
    }
  }
}

- (void)removeObserver
{
  m_ptr = self->m_slot.m_ptr;
  if (m_ptr)
  {
    [m_ptr removeObserver:self forKeyPath:@"state"];
    v4 = self->m_slot.m_ptr;
    self->m_slot.m_ptr = 0;
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = self->m_slot.m_ptr;
  self->m_slot.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = (unsigned int *)self->m_service.m_impl.m_ptr;
  self->m_service.m_impl.m_ptr = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)observeValueForKeyPath:(void *)a1 ofObject:(void *)a2 change:context:
{
  *a1 = &unk_1EE9D2730;
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  *(void *)this = &unk_1EE9D2730;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (unsigned int *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }

  return WTF::fastFree(this, a2);
}

- (WebKit::CcidConnection)observeValueForKeyPath:(WebKit::CcidConnection *)result ofObject:change:context:
{
  uint64_t v1 = *((void *)result + 1);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 8);
    if (v2) {
      return WebKit::CcidService::onValidCard(v2, (uint64_t *)result + 2);
    }
  }
  return result;
}

@end