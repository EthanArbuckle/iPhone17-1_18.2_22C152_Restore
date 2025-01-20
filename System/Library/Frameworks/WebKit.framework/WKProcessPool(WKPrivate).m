@interface WKProcessPool(WKPrivate)
- (uint64_t)_getActivePagesOriginsInWebProcessForTesting:()WKPrivate completionHandler:;
- (uint64_t)_isJITDisabledInAllRemoteWorkerProcesses:()WKPrivate;
- (uint64_t)_seedResourceLoadStatisticsForTestingWithFirstParty:()WKPrivate thirdParty:shouldScheduleNotification:completionHandler:;
- (void)_getActivePagesOriginsInWebProcessForTesting:()WKPrivate completionHandler:;
@end

@implementation WKProcessPool(WKPrivate)

- (uint64_t)_isJITDisabledInAllRemoteWorkerProcesses:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getActivePagesOriginsInWebProcessForTesting:()WKPrivate completionHandler:
{
  *a1 = &unk_1EE9C4E80;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getActivePagesOriginsInWebProcessForTesting:()WKPrivate completionHandler:
{
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>(a2, (uint64_t *)&cf);
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  if (v3) {
    CFRelease(v3);
  }
}

- (uint64_t)_seedResourceLoadStatisticsForTestingWithFirstParty:()WKPrivate thirdParty:shouldScheduleNotification:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end