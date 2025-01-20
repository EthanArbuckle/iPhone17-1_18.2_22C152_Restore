@interface _WKWebExtensionContextDelegate
- (_WKWebExtensionContextDelegate)initWithWebExtensionContext:(void *)a3;
- (id).cxx_construct;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation _WKWebExtensionContextDelegate

- (_WKWebExtensionContextDelegate)initWithWebExtensionContext:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_WKWebExtensionContextDelegate;
  v4 = [(_WKWebExtensionContextDelegate *)&v10 init];
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 6, (uint64_t)a3 + 16);
    v6 = (atomic_uint *)*((void *)a3 + 3);
    if (v6) {
      atomic_fetch_add(v6, 1u);
    }
    m_ptr = (unsigned int *)v4->_webExtensionContext.m_impl.m_ptr;
    v4->_webExtensionContext.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v5);
    }
    v8 = v4;
  }

  return v4;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v11 = *((void *)m_ptr + 1);
    if (v11)
    {
      id v12 = v8;
      v13 = [v12 request];
      v14 = [v13 URL];

      v15 = [v12 targetFrame];
      if ([v15 isMainFrame])
      {
        MEMORY[0x19972E8A0](&v21, v14);
        if (*((unsigned char *)&v21 + 8)) {
          unsigned int v18 = WTF::protocolHostAndPortAreEqual((WTF *)(v11 + 64), &v21, v17);
        }
        else {
          unsigned int v18 = 0;
        }
        v19 = v21.m_string.m_impl.m_ptr;
        v21.m_string.m_impl.m_ptr = 0;
        if (v19)
        {
          if (*(_DWORD *)v19 == 2) {
            WTF::StringImpl::destroy((WTF::StringImpl *)v19, v16);
          }
          else {
            *(_DWORD *)v19 -= 2;
          }
        }
      }
      else
      {
        unsigned int v18 = 1;
      }

      v9[2](v9, v18);
    }
  }
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v8 = *((void *)m_ptr + 1);
    if (v8)
    {
      id v9 = v11;
      if (WTF::operator==<WKWebView,WKWebView>(v9, (id *)(v8 + 312)))
      {
        uint64_t v10 = *(void *)(v8 + 48);
        WebKit::WebExtension::populateBackgroundPropertiesIfNeeded((id *)v10);
        if (!*(unsigned char *)(v10 + 320)) {
          WebKit::WebExtensionContext::performTasksAfterBackgroundContentLoads(v8 - 16);
        }
      }
    }
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v11 = *((void *)m_ptr + 1);
    if (v11)
    {
      id v12 = v17;
      id v13 = v9;
      BOOL v14 = WTF::operator==<WKWebView,WKWebView>(v12, (id *)(v11 + 312));
      if (v14)
      {
        v15 = WebKit::WebExtensionContext::createError(v14, 6, 0, v13);
        WTF::RetainPtr<NSError>::operator=((const void **)(v11 + 328), v15);

        WTF::RetainPtr<__IOHIDDevice *>::get();
        v16 = (NSError *)objc_claimAutoreleasedReturnValue();
        WebKit::WebExtensionContext::recordError((const void **)(v11 - 16), v16);

        WebKit::WebExtensionContext::unloadBackgroundWebView((WebKit::WebExtensionContext *)(v11 - 16));
      }
    }
  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4 = a3;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v6 = *((void *)m_ptr + 1);
    if (v6)
    {
      id v8 = v4;
      id v7 = v4;
      if (WTF::operator==<WKWebView,WKWebView>(v7, (id *)(v6 + 312)))
      {
        WebKit::WebExtensionContext::unloadBackgroundWebView((WebKit::WebExtensionContext *)(v6 - 16));
        if (WebKit::WebExtension::backgroundContentIsPersistent(*(id **)(v6 + 48))) {
          WebKit::WebExtensionContext::loadBackgroundWebView((WebKit::WebExtensionContext *)(v6 - 16));
        }
      }

      id v4 = v8;
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_webExtensionContext.m_impl.m_ptr;
  self->_webExtensionContext.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end