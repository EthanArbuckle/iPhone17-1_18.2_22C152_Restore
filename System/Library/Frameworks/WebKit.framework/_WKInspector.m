@interface _WKInspector
- (BOOL)isConnected;
- (BOOL)isElementSelectionActive;
- (BOOL)isFront;
- (BOOL)isProfilingPage;
- (BOOL)isVisible;
- (Object)_apiObject;
- (WKWebView)webView;
- (_WKInspectorDelegate)delegate;
- (id).cxx_construct;
- (id)inspectorWebView;
- (void)_fetchURLForTesting:(id)a3;
- (void)_openURLExternallyForTesting:(id)a3 useFrontendAPI:(BOOL)a4;
- (void)_setDiagnosticLoggingDelegate:(id)a3;
- (void)attach;
- (void)close;
- (void)connect;
- (void)dealloc;
- (void)detach;
- (void)hide;
- (void)printErrorToConsole:(id)a3;
- (void)registerExtensionWithID:(id)a3 extensionBundleIdentifier:(id)a4 displayName:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)show;
- (void)showConsole;
- (void)showMainResourceForFrame:(id)a3;
- (void)showResources;
- (void)toggleElementSelection;
- (void)togglePageProfiling;
- (void)unregisterExtension:(id)a3 completionHandler:(id)a4;
@end

@implementation _WKInspector

- (Object)_apiObject
{
  return (Object *)&self->_inspector;
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  return self;
}

- (_WKInspectorDelegate)delegate
{
  WeakRetained = (_WKInspectorDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
  uint64_t v5 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v5 = &unk_1EE9CA028;
  *(void *)(v5 + 8) = 0;
  objc_initWeak((id *)(v5 + 8), a3);
  *(unsigned char *)(v5 + 16) = *(unsigned char *)(v5 + 16) & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v5 + 16) = *(unsigned char *)(v5 + 16) & 0xFD | v6;
  uint64_t v7 = *(void *)&self->_anon_38[8];
  *(void *)&self->_anon_38[8] = v5;
  if (v7)
  {
    v8 = *(void (**)(void))(*(void *)v7 + 8);
    v8();
  }
}

- (WKWebView)webView
{
  uint64_t v2 = *(void *)&self->_inspector.data.__lx[40];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return v4;
}

- (BOOL)isConnected
{
  uint64_t v2 = *(void *)self->_anon_38;
  return v2 && *(void *)(v2 + 8) != 0;
}

- (BOOL)isVisible
{
  return self->_anon_38[25];
}

- (BOOL)isFront
{
  return 0;
}

- (BOOL)isProfilingPage
{
  return self->_anon_38[28];
}

- (BOOL)isElementSelectionActive
{
  return self->_anon_38[31];
}

- (void)connect
{
  WebKit::WebInspectorUIProxy::connect((uint64_t)&self->_inspector, (uint64_t)a2, v2);
}

- (void)show
{
  WebKit::WebInspectorUIProxy::show((uint64_t)&self->_inspector, (uint64_t)a2, v2);
}

- (void)hide
{
  uint64_t v2 = *(void *)&self->_inspector.data.__lx[40];
  if (v2)
  {
    if (*(void *)(v2 + 8)) {
      self->_anon_38[25] = 0;
    }
  }
}

- (void)close
{
}

- (void)showConsole
{
}

- (void)showResources
{
}

- (void)showMainResourceForFrame:(id)a3
{
  if (a3) {
    WebKit::WebInspectorUIProxy::showMainResourceForFrame((WebKit::WebInspectorUIProxy *)&self->_inspector, *((void **)a3 + 3), *((void *)a3 + 4));
  }
}

- (void)attach
{
}

- (void)detach
{
}

- (void)togglePageProfiling
{
}

- (void)toggleElementSelection
{
  WebKit::WebInspectorUIProxy::toggleElementSelection((uint64_t)&self->_inspector, (uint64_t)a2, v2);
}

- (void)printErrorToConsole:(id)a3
{
  v4 = [(_WKInspector *)self webView];
  uint64_t v5 = [NSString stringWithFormat:@"console.error(\"%@\"", a3];

  [(WKWebView *)v4 evaluateJavaScript:v5 completionHandler:0];
}

- (void)_setDiagnosticLoggingDelegate:(id)a3
{
  id v5 = [(_WKInspector *)self inspectorWebView];
  if (v5)
  {
    [v5 _setDiagnosticLoggingDelegate:a3];
    uint64_t v6 = *(void *)(*(void *)self->_anon_38 + 8);
    uint64_t v7 = v6 - 16;
    if (!v6) {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void *)(v7 + 256);
    BOOL v9 = a3 != 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebInspectorUI::SetDiagnosticLoggingAvailable>(v8, (char *)&v9, *(void *)(*(void *)(v6 + 16) + 1928), 0);
  }
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_inspector.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)_WKInspector;
    [(_WKInspector *)&v4 dealloc];
  }
}

- (void)registerExtensionWithID:(id)a3 extensionBundleIdentifier:(id)a4 displayName:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
  uint64_t v8 = (void (*)(id, uint64_t, void))*((void *)a6 + 2);

  v8(a6, v7, 0);
}

- (void)unregisterExtension:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
  uint64_t v6 = (void (*)(id, uint64_t))*((void *)a4 + 2);

  v6(a4, v5);
}

- (void).cxx_destruct
{
}

- (id)inspectorWebView
{
  uint64_t v2 = *(void *)self->_anon_38;
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  CFTypeRef v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return (id)v4;
}

- (void)_fetchURLForTesting:(id)a3
{
  p_inspector = &self->_inspector;
  MEMORY[0x19972EAD0](&v6, [NSString stringWithFormat:@"fetch(\"%@\", objc_msgSend(a3, "absoluteString"")]);
  WebKit::WebInspectorUIProxy::evaluateInFrontendForTesting((WebKit::WebInspectorUIProxy *)p_inspector, (const WTF::String *)&v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (void)_openURLExternallyForTesting:(id)a3 useFrontendAPI:(BOOL)a4
{
  if (a4)
  {
    p_inspector = &self->_inspector;
    MEMORY[0x19972EAD0](&v10, [NSString stringWithFormat:@"InspectorFrontendHost.openURLExternally(\"%@\", objc_msgSend(a3, "absoluteString"")]);
    WebKit::WebInspectorUIProxy::evaluateInFrontendForTesting((WebKit::WebInspectorUIProxy *)p_inspector, (const WTF::String *)&v10);
    uint64_t v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v6);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
  }
  else
  {
    id v8 = [(_WKInspector *)self inspectorWebView];
    uint64_t v9 = [MEMORY[0x1E4F18DA8] requestWithURL:a3];
    [v8 loadRequest:v9];
  }
}

@end