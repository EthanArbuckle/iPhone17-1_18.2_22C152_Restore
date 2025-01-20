@interface NotificationFilter
@end

@implementation NotificationFilter

CFTypeRef __remoteXPCPlaybackItem_NotificationFilter_block_invoke(void *a1)
{
  v2 = (const void *)a1[4];
  if (v2) {
    CFRetain(v2);
  }
  v3 = (const void *)a1[5];
  if (v3) {
    CFRetain(v3);
  }
  v4 = (const void *)a1[6];
  if (v4) {
    CFRetain(v4);
  }
  CFTypeRef result = (CFTypeRef)a1[7];
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

void __remoteXPCPlaybackItem_NotificationFilter_block_invoke_2(void *a1)
{
  v2 = (const void *)a1[4];
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[6];
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)a1[7];
  if (v5)
  {
    CFRelease(v5);
  }
}

void __remoteXPCPlaybackItem_NotificationFilter_block_invoke_3(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (!dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32)))
  {
    if (!FigDeferredTransactionCreate(*MEMORY[0x1E4F1CF80], (uint64_t *)&cf))
    {
      remoteXPCPlayer_connectVideoLayerToPlaybackItem(*(const void **)(a1 + 40), *(const void **)(a1 + 48), *(unsigned char *)(a1 + 72) != 0, *(unsigned char *)(a1 + 73) == 0, *(const __CFArray **)(a1 + 56), *(const void **)(a1 + 64), 0, 0, cf);
      remoteXPCPlayer_updateLayerDurationsWhenItemReady(*(void *)(a1 + 40), *(void *)(a1 + 48), 3, cf);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    FigDeferredTransactionCommit((uint64_t)cf);
    if (cf) {
      CFRelease(cf);
    }
  }
}

uint64_t __remoteXPCPlaybackItem_NotificationFilter_block_invoke_4(uint64_t a1)
{
  CMTimebaseRemoveTimerDispatchSource(*(CMTimebaseRef *)(*(void *)(a1 + 48) + 32), *(dispatch_source_t *)(a1 + 32));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

@end