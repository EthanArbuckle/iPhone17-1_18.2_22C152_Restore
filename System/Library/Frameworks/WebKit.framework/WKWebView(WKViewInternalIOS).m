@interface WKWebView(WKViewInternalIOS)
- (WTF::RunLoop)_presentLockdownMode;
- (WebCore::IOSurface)_takeViewSnapshot;
- (uint64_t)_acquireResizeAssertionForReason:()WKViewInternalIOS;
- (uint64_t)_endLiveResize;
- (uint64_t)_firePresentationUpdateForPendingStableStatePresentationCallbacks;
- (uint64_t)_presentLockdownMode;
- (uint64_t)_restorePageScrollPosition:()WKViewInternalIOS scrollOrigin:previousObscuredInset:scale:;
- (uint64_t)_restorePageStateToUnobscuredCenter:()WKViewInternalIOS scale:;
- (uint64_t)_scheduleVisibleContentRectUpdateAfterScrollInView:()WKViewInternalIOS;
- (uint64_t)_takeViewSnapshot;
- (uint64_t)_updateVisibleContentRects;
- (uint64_t)scrollView:()WKViewInternalIOS handleScrollUpdate:completion:;
- (void)_acquireResizeAssertionForReason:;
- (void)_acquireResizeAssertionForReason:()WKViewInternalIOS;
- (void)_endLiveResize;
- (void)_firePresentationUpdateForPendingStableStatePresentationCallbacks;
- (void)_presentLockdownMode;
- (void)_rescheduleEndLiveResizeTimer;
- (void)_restorePageScrollPosition:()WKViewInternalIOS scrollOrigin:previousObscuredInset:scale:;
- (void)_restorePageStateToUnobscuredCenter:()WKViewInternalIOS scale:;
- (void)_scheduleVisibleContentRectUpdateAfterScrollInView:()WKViewInternalIOS;
- (void)_takeViewSnapshot;
- (void)_updateVisibleContentRects;
- (void)scrollView:()WKViewInternalIOS handleScrollUpdate:completion:;
@end

@implementation WKWebView(WKViewInternalIOS)

- (void)_rescheduleEndLiveResizeTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endLiveResize];
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
  }
}

- (void)_acquireResizeAssertionForReason:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 4))
    {
      [WeakRetained _invalidateResizeAssertions];
      *(unsigned char *)(*(void *)(a1 + 40) + 4) = 1;
    }
    CFRelease(v3);
  }
}

- (void)_firePresentationUpdateForPendingStableStatePresentationCallbacks
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9CD420;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_firePresentationUpdateForPendingStableStatePresentationCallbacks
{
  uint64_t result = [*(id *)(*(void *)(a1 + 8) + 1664) count];
  if (result)
  {
    v3 = *(void **)(a1 + 8);
    return [v3 _firePresentationUpdateForPendingStableStatePresentationCallbacks];
  }
  return result;
}

- (void)_endLiveResize
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9CD690;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_endLiveResize
{
  return [*(id *)(a1 + 8) removeFromSuperview];
}

- (void)_presentLockdownMode
{
  v2 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v2 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
  if (!v4)
  {
    v5 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v5 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];
  }
  v6 = NSString;
  WebCore::copyLocalizedString((uint64_t *)&arg, (WebCore *)@"Lockdown Mode is Turned On For “%@“", v3);
  if (arg)
  {
    CFAutorelease(arg);
    CFTypeRef v7 = arg;
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  WebKit::createUIAlertController((WebKit *)objc_msgSend(v6, "stringWithFormat:", v7, v4), *(NSString **)(a1 + 8), &cf);
  v8 = (void *)cf;
  v9 = (void *)MEMORY[0x1E4F42720];
  WebCore::copyLocalizedString((uint64_t *)&arg, (WebCore *)@"OK", v10);
  if (arg)
  {
    CFAutorelease(arg);
    CFTypeRef v11 = arg;
  }
  else
  {
    CFTypeRef v11 = 0;
  }
  objc_msgSend(v8, "addAction:", objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0));
  v12 = objc_msgSend(*(id *)(a1 + 16), "_wk_viewControllerForFullScreenPresentation");
  [v12 presentViewController:cf animated:1 completion:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setBool:forKey:", 1, @"WebKitCaptivePortalModeAlertShown");
  CFTypeRef v13 = cf;
  CFTypeRef cf = 0;
  if (v13) {
    CFRelease(v13);
  }
}

- (WTF::RunLoop)_presentLockdownMode
{
  if (a2 == 2)
  {
    lockdownModeWarningNeeded = 1;
  }
  else
  {
    lockdownModeWarningNeeded = 0;
    if (a2 == 3)
    {
      v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
      return (WTF::RunLoop *)[v2 setBool:1 forKey:@"WebKitCaptivePortalModeAlertShown"];
    }
    else
    {
      CFStringRef v3 = result;
      WTF::RunLoop::main(result);
      uint64_t v4 = *((void *)v3 + 4);
      if (v4) {
        CFRetain(*((CFTypeRef *)v3 + 4));
      }
      uint64_t v5 = *((void *)v3 + 5);
      *((void *)v3 + 5) = 0;
      v6 = (WTF::RunLoop *)WTF::fastMalloc((WTF *)0x18);
      *(void *)v6 = &unk_1EE9CD4C8;
      *((void *)v6 + 1) = v4;
      *((void *)v6 + 2) = v5;
      CFTypeRef v7 = v6;
      WTF::RunLoop::dispatch();
      uint64_t result = v7;
      if (v7) {
        return (WTF::RunLoop *)(*(uint64_t (**)(WTF::RunLoop *))(*(void *)v7 + 8))(v7);
      }
    }
  }
  return result;
}

- (uint64_t)_presentLockdownMode
{
  *(void *)this = &unk_1EE9CD4C8;
  CFStringRef v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (void)_restorePageScrollPosition:()WKViewInternalIOS scrollOrigin:previousObscuredInset:scale:
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9CD578;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_restorePageScrollPosition:()WKViewInternalIOS scrollOrigin:previousObscuredInset:scale:
{
  LODWORD(a2) = *(_DWORD *)(a1 + 28);
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  LODWORD(a4) = *(_DWORD *)(a1 + 36);
  LODWORD(a5) = *(_DWORD *)(a1 + 40);
  LODWORD(a6) = *(_DWORD *)(a1 + 44);
  LODWORD(a7) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 8), "_restorePageScrollPosition:scrollOrigin:previousObscuredInset:scale:", *(void *)(a1 + 16), *(unsigned int *)(a1 + 24), a2, a3, a4, a5, a6, a7, *(double *)(a1 + 56));
}

- (void)_restorePageStateToUnobscuredCenter:()WKViewInternalIOS scale:
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9CD5A0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_restorePageStateToUnobscuredCenter:()WKViewInternalIOS scale:
{
  return objc_msgSend(*(id *)(a1 + 8), "_restorePageStateToUnobscuredCenter:scale:", *(void *)(a1 + 16), *(unsigned int *)(a1 + 24), *(double *)(a1 + 32));
}

- (void)_takeViewSnapshot
{
  v2 = (WebKit::ViewSnapshot *)a1[1];
  *a1 = &unk_1EE9CD5C8;
  a1[1] = 0;
  if (v2) {
    WTF::RefCounted<WebKit::ViewSnapshot>::deref(v2);
  }
  return a1;
}

- (uint64_t)_takeViewSnapshot
{
  CFStringRef v3 = (WebKit::ViewSnapshot *)*((void *)this + 1);
  *(void *)this = &unk_1EE9CD5C8;
  *((void *)this + 1) = 0;
  if (v3) {
    WTF::RefCounted<WebKit::ViewSnapshot>::deref(v3);
  }

  return WTF::fastFree(this, a2);
}

- (WebCore::IOSurface)_takeViewSnapshot
{
  v2 = *a2;
  *a2 = 0;
  if (v2)
  {
    CFStringRef v3 = (WebCore::IOSurface **)*((void *)result + 1);
    v6 = v2;
    WebKit::ViewSnapshot::setSurface(v3, &v6);
    uint64_t result = v6;
    if (v6)
    {
      WebCore::IOSurface::~IOSurface(v6);
      return (WebCore::IOSurface *)WTF::fastFree(v4, v5);
    }
  }
  return result;
}

- (uint64_t)scrollView:()WKViewInternalIOS handleScrollUpdate:completion:
{
  *a1 = &unk_1EE9CD5F0;
  v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)scrollView:()WKViewInternalIOS handleScrollUpdate:completion:
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    if (*(unsigned char *)(a1 + 24))
    {
      if (!WeakRetained[1682]) {
        *(_WORD *)(WeakRetained + 1681) = a2 ^ 1 | 0x100;
      }
      (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    }
    CFRelease(v5);
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 16) + 16);
    v6();
  }
}

- (uint64_t)_acquireResizeAssertionForReason:()WKViewInternalIOS
{
  *(void *)a1 = &unk_1EE9CD618;
  CFStringRef v3 = *(unsigned int **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3 && atomic_fetch_add((atomic_uint *volatile)v3, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v3);
    WTF::fastFree((WTF *)v3, a2);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  unsigned int *v3;
  void *v4;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9CD618;
  CFStringRef v3 = *(unsigned int **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3 && atomic_fetch_add((atomic_uint *volatile)v3, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v3);
    WTF::fastFree((WTF *)v3, a2);
  }
  objc_destroyWeak((id *)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v4);
}

- (void)_acquireResizeAssertionForReason:()WKViewInternalIOS
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 16) + 4))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      CFStringRef v3 = WeakRetained;
      uint64_t v4 = qword_1EB358730;
      if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 134217984;
        v6 = v3;
        _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "WKWebView %p next visible content rect update took too long; clearing resize assertions",
          (uint8_t *)&v5,
          0xCu);
      }
      [v3 _invalidateResizeAssertions];
      *(unsigned char *)(*(void *)(a1 + 16) + 4) = 1;
      CFRelease(v3);
    }
  }
}

- (void)_scheduleVisibleContentRectUpdateAfterScrollInView:()WKViewInternalIOS
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9CD640;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_scheduleVisibleContentRectUpdateAfterScrollInView:()WKViewInternalIOS
{
  v1 = *(void **)(a1 + 8);
  uint64_t result = [v1 _isValid];
  if (result)
  {
    return [v1 _addUpdateVisibleContentRectPreCommitHandler];
  }
  return result;
}

- (void)_updateVisibleContentRects
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9CD668;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_updateVisibleContentRects
{
  return objc_msgSend(*(id *)(a1 + 8), "setContentOffset:animated:", 0, *(double *)(a1 + 16), *(double *)(a1 + 24));
}

@end