@interface IOHIDServiceInit
@end

@implementation IOHIDServiceInit

void ____IOHIDServiceInit_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 440) = 0;
  if (!*(_DWORD *)(v2 + 444))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 448));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  CFRelease((CFTypeRef)v2);
}

void ____IOHIDServiceInit_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 444) - 1;
  *(_DWORD *)(v2 + 444) = v3;
  if (!v3 && !*(unsigned char *)(v2 + 440))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 448));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  CFRelease((CFTypeRef)v2);
}

@end