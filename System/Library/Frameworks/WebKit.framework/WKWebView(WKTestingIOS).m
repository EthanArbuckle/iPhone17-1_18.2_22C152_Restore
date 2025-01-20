@interface WKWebView(WKTestingIOS)
- (uint64_t)_doAfterNextVisibleContentRectAndStablePresentationUpdate:;
- (uint64_t)_setDeviceOrientationUserPermissionHandlerForTesting:()WKTestingIOS;
- (void)_doAfterNextVisibleContentRectAndStablePresentationUpdate:;
@end

@implementation WKWebView(WKTestingIOS)

- (void)_doAfterNextVisibleContentRectAndStablePresentationUpdate:
{
  _Block_release(*(const void **)(a1 + 40));
  v2 = *(const void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v2)
  {
    CFRelease(v2);
  }
}

- (uint64_t)_doAfterNextVisibleContentRectAndStablePresentationUpdate:
{
  return [*(id *)(a1 + 32) _doAfterNextStablePresentationUpdate:*(void *)(a1 + 40)];
}

- (uint64_t)_setDeviceOrientationUserPermissionHandlerForTesting:()WKTestingIOS
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end