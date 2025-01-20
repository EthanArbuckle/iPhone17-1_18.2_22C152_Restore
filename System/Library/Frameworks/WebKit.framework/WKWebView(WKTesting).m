@interface WKWebView(WKTesting)
- (uint64_t)_appPrivacyReportTestingData:()WKTesting;
- (uint64_t)_clearAppPrivacyReportTestingData:()WKTesting;
- (uint64_t)_computePagesForPrinting:()WKTesting completionHandler:;
- (uint64_t)_doAfterProcessingAllPendingMouseEvents:()WKTesting;
- (uint64_t)_dumpPrivateClickMeasurement:()WKTesting;
- (uint64_t)_gpuToWebProcessConnectionCountForTesting:()WKTesting;
- (uint64_t)_isLayerTreeFrozenForTesting:()WKTesting;
- (uint64_t)_lastNavigationWasAppInitiated:()WKTesting;
- (uint64_t)_processWillSuspendForTesting:()WKTesting;
- (uint64_t)_requestActiveNowPlayingSessionInfo:()WKTesting;
- (uint64_t)_setNowPlayingMetadataObserver:()WKTesting;
- (uint64_t)_setPrivateClickMeasurementAppBundleIDForTesting:()WKTesting completionHandler:;
- (uint64_t)_setPrivateClickMeasurementAttributionReportURLsForTesting:()WKTesting destinationURL:completionHandler:;
- (uint64_t)_setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:()WKTesting completionHandler:;
- (uint64_t)_setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:()WKTesting completionHandler:;
- (uint64_t)_setPrivateClickMeasurementOverrideTimerForTesting:()WKTesting completionHandler:;
- (void)_setNowPlayingMetadataObserver:()WKTesting;
@end

@implementation WKWebView(WKTesting)

- (uint64_t)_setNowPlayingMetadataObserver:()WKTesting
{
  *a1 = &unk_1EE9C6968;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_setNowPlayingMetadataObserver:()WKTesting
{
  v4 = objc_alloc_init(_WKNowPlayingMetadata);
  if (*a2) {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_1EEA10550;
  }
  [(_WKNowPlayingMetadata *)v4 setTitle:v5];
  if (a2[1]) {
    v6 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v6 = &stru_1EEA10550;
  }
  [(_WKNowPlayingMetadata *)v4 setArtist:v6];
  if (a2[2]) {
    v7 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v7 = &stru_1EEA10550;
  }
  [(_WKNowPlayingMetadata *)v4 setAlbum:v7];
  if (a2[3]) {
    v8 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v8 = &stru_1EEA10550;
  }
  [(_WKNowPlayingMetadata *)v4 setSourceApplicationIdentifier:v8];
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v4)
  {
    CFRelease(v4);
  }
}

- (uint64_t)_requestActiveNowPlayingSessionInfo:()WKTesting
{
  if (*a5) {
    WTF::StringImpl::operator NSString *();
  }
  a2.n128_u64[0] = a5[8];
  a3.n128_u64[0] = a5[9];
  v7 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 8) + 16);

  return v7(a2, a3);
}

- (uint64_t)_processWillSuspendForTesting:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_doAfterProcessingAllPendingMouseEvents:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementOverrideTimerForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAttributionReportURLsForTesting:()WKTesting destinationURL:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAppBundleIDForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_dumpPrivateClickMeasurement:()WKTesting
{
  if (*a2) {
    WTF::StringImpl::operator NSString *();
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)_lastNavigationWasAppInitiated:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_appPrivacyReportTestingData:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_clearAppPrivacyReportTestingData:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_isLayerTreeFrozenForTesting:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_computePagesForPrinting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_gpuToWebProcessConnectionCountForTesting:()WKTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end