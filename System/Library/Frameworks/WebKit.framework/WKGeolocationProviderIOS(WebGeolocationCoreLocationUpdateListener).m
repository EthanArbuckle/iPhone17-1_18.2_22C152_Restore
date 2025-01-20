@interface WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener)
- (uint64_t)geolocationAuthorizationGranted;
- (void)geolocationAuthorizationGranted;
@end

@implementation WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener)

- (uint64_t)geolocationAuthorizationGranted
{
  (*(void (**)(void))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8));
  v2 = *(void **)(a1 + 16);

  return [v2 geolocationAuthorizationGranted];
}

- (void)geolocationAuthorizationGranted
{
  *a1 = &unk_1EE9D4188;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = a1[1];
  a1[1] = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

@end