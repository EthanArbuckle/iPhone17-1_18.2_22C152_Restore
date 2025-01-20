@interface TryReconnect
@end

@implementation TryReconnect

void __fbf_TryReconnect_block_invoke(uint64_t a1, int a2, NSObject *a3)
{
  if (a2 == 5)
  {
    if (*(void *)(a1 + 32))
    {
      v3 = *(const void **)(a1 + 32);
      CFRelease(v3);
    }
  }
  else
  {
    FigRetainProxyLockMutex();
    if (!FigRetainProxyIsInvalidated())
    {
      FigRetainProxyGetOwner();
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (*(void *)(DerivedStorage + 488))
      {
        uint64_t v7 = DerivedStorage;
        if (a2 == 4)
        {
          if (a3)
          {
            CFErrorRef v8 = nw_error_copy_cf_error(a3);
            nw_error_domain_t error_domain = nw_error_get_error_domain(a3);
            int error_code = nw_error_get_error_code(a3);
            if (error_domain - 1 > 2) {
              v11 = kCoreMediaErrorDomain;
            }
            else {
              v11 = (__CFString **)qword_1E5794E58[error_domain - 1];
            }
            CFError = (const void *)FigCreateCFError(*v11, error_code, @"Reconnect failure", 0, 0, *(void *)(v7 + 168), v8);
            if (v8) {
              CFRelease(v8);
            }
          }
          else
          {
            CFError = (const void *)FigCreateCFError(@"CoreMediaErrorDomain", -12935, @"Reconnect failure", 0, 0, *(void *)(DerivedStorage + 168), 0);
          }
          fbf_CancelReconnect(v7);
          ++*(_DWORD *)(v7 + 496);
          if (CFError) {
            fbf_ReleaseAndRetainLastErrorFromCFError(v7, CFError);
          }
          if (*(void *)(v7 + 520) <= FigGetUpTimeNanoseconds())
          {
            *(void *)(v7 + 512) = 0;
            fbf_postConnectionToHostLostNotification(v7);
          }
          else
          {
            *(void *)(v7 + 512) = FigGetUpTimeNanoseconds() + 30000000000;
            FigHTTPRescheduleTimer(30.0, *(void *)(v7 + 48), *(NSObject **)(v7 + 456));
          }
        }
        else if (a2 == 3)
        {
          *(unsigned char *)(DerivedStorage + 17) = 0;
          fbf_CancelReconnect(DerivedStorage);
          if (FigByteFlumePostHostAvailableNotification(v7)) {
            fbf_ReportingAgentResetErrorStats(v7);
          }
        }
      }
      else
      {
        FigSignalErrorAt();
      }
    }
    FigRetainProxyUnlockMutex();
  }
}

@end