@interface WKWebProcessPlugInBrowserContextController(WKPrivate)
- (BOOL)_setEditingDelegate:()WKPrivate;
- (uint64_t)_setEditingDelegate:()WKPrivate;
- (uint64_t)_setFormDelegate:()WKPrivate;
- (void)_setEditingDelegate:()WKPrivate;
- (void)_setFormDelegate:()WKPrivate;
@end

@implementation WKWebProcessPlugInBrowserContextController(WKPrivate)

- (uint64_t)_setFormDelegate:()WKPrivate
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 315);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v3 _webProcessPlugInBrowserContextControllerShouldNotifyOnFormChanges:v2];
      if (!v3) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v4 = 0;
      if (!v3)
      {
LABEL_8:
        CFRelease(v2);
        return v4;
      }
    }
    CFRelease(v3);
    goto LABEL_8;
  }
  return 0;
}

- (void)_setFormDelegate:()WKPrivate
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (!WeakRetained) {
    return;
  }
  v11 = WeakRetained;
  id v12 = objc_loadWeakRetained(WeakRetained + 315);
  if (objc_opt_respondsToSelector())
  {
    if (a3)
    {
      WebKit::InjectedBundleNodeHandle::getOrCreate((WebKit::InjectedBundleNodeHandle *)a3, (WebKit::InjectedBundleNodeHandle **)&v17);
      a3 = v17;
    }
    API::Object::fromNSObject((void *)[v12 _webProcessPlugInBrowserContextController:v11 willBeginInputSessionForElement:a3[1] inFrame:*(void *)(a4 + 8) userIsInteracting:a5], &v16);
LABEL_6:
    uint64_t v13 = v16;
    uint64_t v16 = 0;
    uint64_t v14 = *a6;
    *a6 = v13;
    if (v14)
    {
      CFRelease(*(CFTypeRef *)(v14 + 8));
      uint64_t v15 = v16;
      uint64_t v16 = 0;
      if (v15) {
        CFRelease(*(CFTypeRef *)(v15 + 8));
      }
    }
    CFRelease(a3[1]);
    goto LABEL_15;
  }
  if a5 && (objc_opt_respondsToSelector())
  {
    if (a3)
    {
      WebKit::InjectedBundleNodeHandle::getOrCreate((WebKit::InjectedBundleNodeHandle *)a3, (WebKit::InjectedBundleNodeHandle **)&v17);
      a3 = v17;
    }
    API::Object::fromNSObject((void *)[v12 _webProcessPlugInBrowserContextController:v11 willBeginInputSessionForElement:a3[1] inFrame:*(void *)(a4 + 8)], &v16);
    goto LABEL_6;
  }
LABEL_15:
  if (v12) {
    CFRelease(v12);
  }
  CFRelease(v11);
}

- (uint64_t)_setEditingDelegate:()WKPrivate
{
  if (!*(unsigned char *)(a1 + 22)) {
    return 0;
  }
  v8 = *(WebKit::InjectedBundleNodeHandle **)a4;
  *((_DWORD *)v8 + 7) = *(_DWORD *)(*(void *)a4 + 28) + 2;
  uint64_t v16 = v8;
  int v17 = *(_DWORD *)(a4 + 8);
  uint64_t v9 = *(void *)(a4 + 16);
  *(_DWORD *)(v9 + 28) += 2;
  uint64_t v18 = v9;
  int v19 = *(_DWORD *)(a4 + 24);
  char v20 = 1;
  WebKit::createHandle(&v21);
  std::__optional_destruct_base<WebCore::SimpleRange,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v16);
  WebKit::InjectedBundleNodeHandle::getOrCreate(a3, &v16);
  v10 = v16;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 8) + 2528));
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = v21;
  uint64_t v14 = [WeakRetained _webProcessPlugInBrowserContextController:v12 performTwoStepDrop:*((void *)v10 + 1) atDestination:*(void *)(v21 + 8) isMove:a5];
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  CFRelease(*((CFTypeRef *)v10 + 1));
  CFRelease(*(CFTypeRef *)(v13 + 8));
  return v14;
}

- (BOOL)_setEditingDelegate:()WKPrivate
{
  if (!*(unsigned char *)(a1 + 17)) {
    return 1;
  }
  if (!*(unsigned char *)(a3 + 32)) {
    return *(unsigned char *)(a4 + 32) != 0;
  }
  if (!*(unsigned char *)(a4 + 32)) {
    return 1;
  }
  uint64_t v9 = [WKDOMRange alloc];
  WebCore::createLiveRange();
  id v10 = [(WKDOMRange *)v9 _initWithImpl:v16];
  if (v16)
  {
    if (v16[2] == 1) {
      (*(void (**)())(*(void *)v16 + 8))();
    }
    else {
      --v16[2];
    }
  }
  uint64_t v12 = [WKDOMRange alloc];
  WebCore::createLiveRange();
  id v13 = [(WKDOMRange *)v12 _initWithImpl:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 8) + 2528));
  uint64_t v11 = [WeakRetained _webProcessPlugInBrowserContextController:*(void *)(a1 + 8) shouldChangeSelectedRange:v10 toRange:v13 affinity:a5 ^ 1u stillSelecting:a6];
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

- (void)_setEditingDelegate:()WKPrivate
{
  if (*(unsigned char *)(a1 + 21))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 8) + 2528));
    [WeakRetained _webProcessPlugInBrowserContextControllerDidWriteToPasteboard:*(void *)(a1 + 8)];
    if (WeakRetained)
    {
      CFRelease(WeakRetained);
    }
  }
}

@end