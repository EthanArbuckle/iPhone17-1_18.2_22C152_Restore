@interface FigICY
@end

@implementation FigICY

uint64_t __FigICY_ResumeHTTP_block_invoke()
{
  FigRetainProxyRetain();
  FigRetainProxyLockMutex();
  if (!FigRetainProxyIsInvalidated())
  {
    uint64_t Owner = FigRetainProxyGetOwner();
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    while (CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 360)) >= 1)
    {
      ValueAtIndex = (OpaqueCMBlockBuffer *)CFArrayGetValueAtIndex(*(CFArrayRef *)(DerivedStorage + 360), 0);
      v3 = ValueAtIndex;
      if (ValueAtIndex) {
        CFRetain(ValueAtIndex);
      }
      size_t DataLength = CMBlockBufferGetDataLength(v3);
      v5 = *(__CFArray **)(DerivedStorage + 360);
      *(void *)(DerivedStorage + 368) -= DataLength;
      CFArrayRemoveValueAtIndex(v5, 0);
      if (*(unsigned char *)(DerivedStorage + 377) && !CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 360)))
      {
        *(unsigned char *)(DerivedStorage + 377) = 0;
        int v6 = 1;
      }
      else
      {
        int v6 = 0;
      }
      CMBlockBufferGetDataLength(v3);
      FigICY_HTTPCommonCallback(Owner, v3, v6, 0);
      if (v3) {
        CFRelease(v3);
      }
      if (FigRetainProxyIsInvalidated() || !*(unsigned char *)(DerivedStorage + 19)) {
        goto LABEL_19;
      }
    }
    if (!*(void *)(DerivedStorage + 320))
    {
      *(unsigned char *)(DerivedStorage + 376) = 0;
      v7 = *(const void **)(DerivedStorage + 96);
      if (*(void *)(DerivedStorage + 208))
      {
        FigICY_CreateHTTPRequest(Owner, v7, 1);
      }
      else
      {
        FigICY_CreateHTTPRequest(Owner, v7, 0);
        *(unsigned char *)(DerivedStorage + 21) = 1;
      }
    }
  }
LABEL_19:
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();

  return FigRetainProxyRelease();
}

@end