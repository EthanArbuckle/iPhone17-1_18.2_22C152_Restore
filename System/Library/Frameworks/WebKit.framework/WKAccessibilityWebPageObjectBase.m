@interface WKAccessibilityWebPageObjectBase
- (IntPoint)accessibilityRemoteFrameOffset;
- (NakedPtr<WebCore::AXObjectCache>)axObjectCache;
- (id).cxx_construct;
- (id)accessibilityFocusedUIElement;
- (id)accessibilityPluginObject;
- (id)accessibilityRootObjectWrapper;
- (uint64_t)accessibilityPluginObject;
- (void)accessibilityRootObjectWrapper;
- (void)setHasMainFramePlugin:(BOOL)a3;
- (void)setRemoteFrameOffset:(IntPoint)a3;
- (void)setRemoteParent:(id)a3;
- (void)setWebPage:(NakedPtr<WebKit::WebPage>)a3;
@end

@implementation WKAccessibilityWebPageObjectBase

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)setWebPage:(NakedPtr<WebKit::WebPage>)a3
{
  self->m_page.m_ptr = *(WebPage **)a3.m_ptr;
  if (*(void *)a3.m_ptr)
  {
    self->m_pageID.m_value.m_identifier = *(void *)(*(void *)a3.m_ptr + 40);
    uint64_t v3 = *(void *)(*(void *)a3.m_ptr + 48);
    if (v3)
    {
      uint64_t v3 = *(void *)(v3 + 160);
      if (v3)
      {
        if (*(unsigned char *)(v3 + 144))
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          uint64_t v3 = *(void *)(v3 + 296);
          if (v3) {
            LODWORD(v3) = (*(unsigned __int16 *)(v3 + 3406) >> 3) & 1;
          }
        }
      }
    }
    self->m_hasMainFramePlugin = v3;
  }
  else
  {
    self->m_pageID.m_value.m_identifier = 0;
    self->m_hasMainFramePlugin = 0;
  }
}

- (NakedPtr<WebCore::AXObjectCache>)axObjectCache
{
  uint64_t v3 = v2;
  m_ptr = self->m_page.m_ptr;
  if (m_ptr
    && (uint64_t v5 = *((void *)m_ptr + 6)) != 0
    && ((uint64_t v6 = *(void *)(v5 + 160)) != 0 ? (v7 = *(unsigned char *)(v6 + 144) == 0) : (v7 = 0),
        v7 || *(unsigned char *)(v6 + 144) && (uint64_t v6 = *(void *)(v6 + 88)) != 0 && !*(unsigned char *)(v6 + 144)))
  {
    v8 = *(WebCore::Document **)(v6 + 296);
    if (v8) {
      v8 = (WebCore::Document *)WebCore::Document::axObjectCache(v8);
    }
  }
  else
  {
    v8 = 0;
  }
  *uint64_t v3 = v8;
  return (NakedPtr<WebCore::AXObjectCache>)v8;
}

- (id)accessibilityPluginObject
{
  uint64_t v5 = self;
  BOOL v7 = 0;
  v2 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v2 = &unk_1EE9DFBD0;
  v2[1] = &v7;
  v2[2] = &v5;
  uint64_t v6 = v2;
  WTF::callOnMainRunLoopAndWait();
  uint64_t v3 = v6;
  uint64_t v6 = 0;
  if (v3) {
    (*(void (**)(void *))(*v3 + 8))(v3);
  }
  return v7;
}

- (id)accessibilityRootObjectWrapper
{
  CFTypeRef v9 = self;
  if (self) {
    CFRetain(self);
  }
  CFTypeRef cf = 0;
  v2 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v2 = &unk_1EE9DFD20;
  v2[1] = &cf;
  v2[2] = &v9;
  v10 = v2;
  WTF::callOnMainThreadAndWait();
  uint64_t v3 = v10;
  v10 = 0;
  if (v3) {
    (*(void (**)(void *))(*v3 + 8))(v3);
  }
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  CFTypeRef v7 = v9;
  CFTypeRef v9 = 0;
  if (v7) {
    CFRelease(v7);
  }
  return (id)v5;
}

- (void)setHasMainFramePlugin:(BOOL)a3
{
  self->m_hasMainFramePlugin = a3;
}

- (void)setRemoteFrameOffset:(IntPoint)a3
{
  self->m_remoteFrameOffset = a3;
}

- (IntPoint)accessibilityRemoteFrameOffset
{
  return self->m_remoteFrameOffset;
}

- (void)setRemoteParent:(id)a3
{
  WTF::RetainPtr<objc_object *>::operator=((const void **)&self->m_parent.m_ptr, a3);
}

- (id)accessibilityFocusedUIElement
{
  id v2 = [(WKAccessibilityWebPageObjectBase *)self accessibilityRootObjectWrapper];

  return (id)[v2 accessibilityFocusedUIElement];
}

- (void).cxx_destruct
{
  m_ptr = self->m_parent.m_ptr;
  self->m_parent.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (uint64_t)accessibilityPluginObject
{
  if (*(void *)(**(void **)(result + 16) + 8)) {
    **(void **)(result + 8) = 0;
  }
  return result;
}

- (void)accessibilityRootObjectWrapper
{
  uint64_t v2 = *(void *)(a1 + 16);
  unsigned __int8 v3 = atomic_load(MEMORY[0x1E4FB64B0]);
  if ((v3 & 1) == 0) {
    atomic_store(1u, MEMORY[0x1E4FB64B0]);
  }
  CFTypeRef v4 = *(void **)v2;
  if (*(unsigned char *)(*(void *)v2 + 40))
  {
    CFTypeRef v5 = (const void *)[v4 accessibilityPluginObject];
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  [v4 axObjectCache];
  if (v9 && (uint64_t v6 = WebCore::AXObjectCache::rootObject(v9)) != 0)
  {
    CFTypeRef v5 = *(const void **)(v6 + 24);
    if (v5) {
LABEL_5:
    }
      CFRetain(v5);
  }
  else
  {
    CFTypeRef v5 = 0;
  }
LABEL_11:
  CFTypeRef v7 = *(const void ***)(a1 + 8);
  v8 = *v7;
  *CFTypeRef v7 = v5;
  if (v8) {
    CFRelease(v8);
  }
}

@end