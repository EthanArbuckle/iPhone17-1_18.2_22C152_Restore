@interface WKWebView(WKPrivateIOS)
- (uint64_t)_addLayerForFindOverlay;
- (uint64_t)_detectDataWithTypes:()WKPrivateIOS completionHandler:;
- (uint64_t)_doAfterNextStablePresentationUpdate:()WKPrivateIOS;
- (uint64_t)_isForcedIntoAppBoundMode:()WKPrivateIOS;
- (uint64_t)_isNavigatingToAppBoundDomain:()WKPrivateIOS;
- (uint64_t)_removeLayerForFindOverlay;
- (uint64_t)_snapshotRectAfterScreenUpdates:()WKPrivateIOS rectInViewCoordinates:intoImageOfWidth:completionHandler:;
- (void)_addLayerForFindOverlay;
- (void)_removeLayerForFindOverlay;
@end

@implementation WKWebView(WKPrivateIOS)

- (uint64_t)_doAfterNextStablePresentationUpdate:()WKPrivateIOS
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_detectDataWithTypes:()WKPrivateIOS completionHandler:
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    if (v4) {
      WebKit::WebPageProxy::setDataDetectionResult(v4 - 16, a2);
    }
  }
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (uint64_t)_snapshotRectAfterScreenUpdates:()WKPrivateIOS rectInViewCoordinates:intoImageOfWidth:completionHandler:
{
  if (*(unsigned char *)(a2 + 64))
  {
    WebCore::ShareableBitmap::create();
    if (v7)
    {
      WebCore::ShareableBitmap::makeCGImage();
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    }
    uint64_t result = (uint64_t)v7;
    if (v7) {
      return WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v7, v3);
    }
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v4();
  }
  return result;
}

- (uint64_t)_isNavigatingToAppBoundDomain:()WKPrivateIOS
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_isForcedIntoAppBoundMode:()WKPrivateIOS
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_addLayerForFindOverlay
{
  *a1 = &unk_1EE9CD7A8;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_addLayerForFindOverlay
{
  long long v4 = *a2;
  int v2 = *((unsigned __int8 *)a2 + 16);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    if (v2) {
      long long v5 = v4;
    }
    else {
      long long v5 = 0uLL;
    }
    *(_OWORD *)(WeakRetained + 1016) = v5;
    CFRelease(WeakRetained);
  }
}

- (uint64_t)_removeLayerForFindOverlay
{
  *a1 = &unk_1EE9CD7D0;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_removeLayerForFindOverlay
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    int v2 = WeakRetained;
    [WeakRetained _didRemoveLayerForFindOverlay];
    CFRelease(v2);
  }
}

@end