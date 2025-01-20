@interface CFHTTPServerConnectionScheduleWithRunLoopAndMode
@end

@implementation CFHTTPServerConnectionScheduleWithRunLoopAndMode

void ___CFHTTPServerConnectionScheduleWithRunLoopAndMode_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(__CFRunLoop **)(a1 + 32);
  CFStringRef v4 = *(const __CFString **)(a1 + 40);
  v5 = (HTTPServerBase *)(a2 + 8);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 88));
  HTTPServerBase::schedule(v5, v3, v4);
  v6 = *(const void **)(a1 + 32);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 40);
  if (v7)
  {
    CFRelease(v7);
  }
}

@end