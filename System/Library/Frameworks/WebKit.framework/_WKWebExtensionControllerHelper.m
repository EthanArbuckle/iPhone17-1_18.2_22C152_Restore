@interface _WKWebExtensionControllerHelper
- (_WKWebExtensionControllerHelper)initWithWebExtensionController:(void *)a3;
- (id).cxx_construct;
- (void)_didDeleteLocalStorage:(id)a3;
@end

@implementation _WKWebExtensionControllerHelper

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (_WKWebExtensionControllerHelper)initWithWebExtensionController:(void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionControllerHelper;
  v4 = [(_WKWebExtensionControllerHelper *)&v11 init];
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 6, (uint64_t)a3 + 16);
    v6 = (atomic_uint *)*((void *)a3 + 3);
    if (v6) {
      atomic_fetch_add(v6, 1u);
    }
    m_ptr = (unsigned int *)v4->_webExtensionController.m_impl.m_ptr;
    v4->_webExtensionController.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v5);
    }
    v8 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v8 addObserver:v4 selector:sel__didDeleteLocalStorage_ name:@"WebExtensionLocalStorageWasDeleted" object:0];

    v9 = v4;
  }

  return v4;
}

- (void)_didDeleteLocalStorage:(id)a3
{
  v4 = [a3 userInfo];
  v5 = WebKit::objectForKey<NSString>(v4, @"uniqueIdentifier", 1);

  if (v5)
  {
    m_ptr = self->_webExtensionController.m_impl.m_ptr;
    if (m_ptr)
    {
      uint64_t v7 = *((void *)m_ptr + 1);
      if (v7)
      {
        MEMORY[0x19972EAD0](&v11, v5);
        WebKit::WebExtensionController::extensionContext((WebKit::WebExtensionController *)(v7 - 16), &v11, &v12);
        v9 = v11;
        objc_super v11 = 0;
        if (v9)
        {
          if (*(_DWORD *)v9 == 2) {
            WTF::StringImpl::destroy(v9, v8);
          }
          else {
            *(_DWORD *)v9 -= 2;
          }
        }
        v10 = v12;
        if (v12)
        {
          WebKit::WebExtensionContext::invalidateStorage(v12);
          CFRelease(*((CFTypeRef *)v10 + 1));
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_webExtensionController.m_impl.m_ptr;
  self->_webExtensionController.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

@end