@interface GetCurrentTimeInCurrentEvent
@end

@implementation GetCurrentTimeInCurrentEvent

CFTypeRef __fpic_GetCurrentTimeInCurrentEvent_block_invoke(uint64_t a1)
{
  CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
  uint64_t FirstCurrentItem = fpic_GetFirstCurrentItem(*(void *)(a1 + 40), *(void *)(a1 + 48));
  if (!CurrentlyPlayingEvent) {
    goto LABEL_12;
  }
  uint64_t v4 = FirstCurrentItem;
  v5 = (const void *)fpic_UnwrapEvent(*(void *)(a1 + 40), (uint64_t)CurrentlyPlayingEvent);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)(v6 + 32) = *MEMORY[0x1E4F1FA48];
  *(void *)(v6 + 48) = *(void *)(v7 + 16);
  if (v4)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 32);
    if (v11) {
      v11(v4, v8 + 32);
    }
    v12 = (CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
    CMTime v20 = *(CMTime *)(*(void *)(a1 + 56) + 408);
    fpic_AccumulateDuration(v12, &v20);
    v13 = (CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
    CMTime v20 = *(CMTime *)(*(void *)(a1 + 56) + 456);
    fpic_AccumulateDuration(v13, &v20);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = fpic_UnwrapEvent(v14, (uint64_t)CurrentlyPlayingEvent);
    if (fpic_hasFirstItemPlayedOutForEvent(v14, CurrentlyPlayingEvent))
    {
      FigPlayerInterstitialEventGetFirstItemStartOffset(v16, (uint64_t)&rhs);
      CMTime v18 = *(CMTime *)(v15 + 32);
      CMTimeAdd(&v20, &v18, &rhs);
      *(CMTime *)(v15 + 32) = v20;
    }
  }
  if (v5) {
    CFTypeRef result = CFRetain(v5);
  }
  else {
LABEL_12:
  }
    CFTypeRef result = 0;
  **(void **)(a1 + 64) = result;
  return result;
}

void __fpirc_GetCurrentTimeInCurrentEvent_block_invoke(uint64_t a1)
{
  CMTimebaseRef timebase = 0;
  uint64_t v2 = (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 56))(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 40) + 32));
  CurrentEventWrapperOnQueue = fpirc_GetCurrentEventWrapperOnQueue(*(void *)(a1 + 48), *(void *)(a1 + 56));
  if (CurrentEventWrapperOnQueue) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    **(void **)(a1 + 64) = 0;
  }
  else
  {
    uint64_t v5 = (uint64_t)CurrentEventWrapperOnQueue;
    CFTypeRef cf = 0;
    uint64_t VTable = CMBaseObjectGetVTable();
    if (*(void *)(VTable + 16)) {
      uint64_t v7 = *(void *)(VTable + 16);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, CFTypeRef *))(v7 + 32);
    if (v8)
    {
      v8(v2, 0, &cf);
      if (cf)
      {
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(cf);
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v10) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        v12 = *(void (**)(uint64_t, __CFString *, void, CMTimebaseRef *))(v11 + 48);
        if (v12) {
          v12(FigBaseObject, @"Timebase", *MEMORY[0x1E4F1CF80], &timebase);
        }
        if (cf) {
          CFRelease(cf);
        }
      }
    }
    if (timebase)
    {
      CMTimebaseGetTime(&v13, timebase);
      *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v13;
    }
    fpirc_UnwrapEvent(*(void *)(a1 + 48), v5);
    **(void **)(a1 + 64) = 0;
    if (timebase) {
      CFRelease(timebase);
    }
  }
}

@end