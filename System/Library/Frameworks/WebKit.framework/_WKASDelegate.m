@interface _WKASDelegate
- (_WKASDelegate)initWithPage:(void *)a3 completionHandler:(void *)a4;
- (id).cxx_construct;
- (id)presentationAnchorForAuthorizationController:(id)a3;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
@end

@implementation _WKASDelegate

- (_WKASDelegate)initWithPage:(void *)a3 completionHandler:(void *)a4
{
  v11 = self;
  SEL v10 = a2;
  v9 = (uint64_t *)a3;
  v8 = (uint64_t *)a4;
  v7.receiver = self;
  v7.super_class = (Class)_WKASDelegate;
  v11 = [(_WKASDelegate *)&v7 init];
  if (!v11) {
    return 0;
  }
  if (WTF::WeakPtr<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>::operator BOOL(v9))
  {
    v4 = (WebKit::WebPageProxy *)WTF::WeakPtr<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>::operator->(v9);
    WebKit::WebPageProxy::cocoaView(v4, &v6);
    WTF::RetainPtr<__IOHIDManager *>::operator=((uint64_t *)v11 + 1, &v6);
    WTF::RetainPtr<NSURLRequest>::~RetainPtr(&v6);
  }
  WTF::BlockPtr<void ()(ASAuthorization *,NSError *)>::operator=((const void **)v11 + 2, v8);
  return (_WKASDelegate *)v11;
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  if (!WTF::RetainPtr<WKWebView>::operator BOOL(&self->m_view.m_ptr)) {
    return 0;
  }
  WTF::RetainPtr<__IOHIDDevice *>::get();
  return (id)objc_msgSend(v3, "window", a3, a2);
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end