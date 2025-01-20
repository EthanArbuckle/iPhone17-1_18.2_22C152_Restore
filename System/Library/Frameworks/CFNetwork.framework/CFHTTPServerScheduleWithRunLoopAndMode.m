@interface CFHTTPServerScheduleWithRunLoopAndMode
@end

@implementation CFHTTPServerScheduleWithRunLoopAndMode

void ___CFHTTPServerScheduleWithRunLoopAndMode_block_invoke(uint64_t a1, uint64_t a2)
{
  HTTPServerBase::schedule((HTTPServerBase *)(a2 + 8), *(__CFRunLoop **)(a1 + 32), *(const __CFString **)(a1 + 40));
  v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
  }
}

@end