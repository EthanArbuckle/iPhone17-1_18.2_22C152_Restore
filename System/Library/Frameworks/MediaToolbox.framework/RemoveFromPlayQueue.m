@interface RemoveFromPlayQueue
@end

@implementation RemoveFromPlayQueue

void __playerairplay_RemoveFromPlayQueue_block_invoke(uint64_t a1)
{
  if (!**(unsigned char **)(a1 + 32))
  {
    int v2 = pap_AirPlayState(*(const void **)(a1 + 40));
    if (v2) {
      BOOL v3 = v2 == 10;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      playerairplay_removeItemFromLocalPlayQueue(*(const void **)(a1 + 40), *(const void **)(a1 + 48));
    }
    playerairplay_removeItemFromSubPlayerPlayQueue(*(void *)(a1 + 40), *(const void **)(a1 + 48));
  }
  v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    CFRelease(v5);
  }
}

@end