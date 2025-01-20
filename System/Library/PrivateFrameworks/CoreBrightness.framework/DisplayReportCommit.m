@interface DisplayReportCommit
@end

@implementation DisplayReportCommit

void ____DisplayReportCommit_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    (*(void (**)(void, __CFString *, void))(*(void *)(a1 + 32) + 16))(*(void *)(*(void *)(a1 + 32) + 24), @"DisplayBrightness", *(void *)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end