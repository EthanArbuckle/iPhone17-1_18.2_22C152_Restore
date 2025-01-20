@interface CopyCurrentEvent
@end

@implementation CopyCurrentEvent

CFTypeRef __fpic_CopyCurrentEvent_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fpic_GetCurrentlyPlayingEvent();
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

const void *__fpirc_CopyCurrentEvent_block_invoke(void *a1)
{
  CFTypeRef result = fpirc_GetCurrentEventWrapperOnQueue(a1[5], a1[6]);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

@end