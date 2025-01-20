@interface FigPlayerAirPlayRoute
@end

@implementation FigPlayerAirPlayRoute

uint64_t __FigPlayerAirPlayRoute_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  FigPlayerAirPlayRoute_GetTypeID_FigPlayerAirPlayRouteTypeID = result;
  return result;
}

const void *__FigPlayerAirPlayRoute_CopyProperty_block_invoke(uint64_t a1)
{
  uint64_t result = (const void *)FigCFDictionaryGetBooleanIfPresent();
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t result = (const void *)*MEMORY[0x1E4F1CFC8];
    if (*MEMORY[0x1E4F1CFC8])
    {
      uint64_t result = CFRetain(result);
      v3 = *(void **)(a1 + 40);
    }
    void *v3 = result;
  }
  return result;
}

uint64_t __FigPlayerAirPlayRoute_CopyProperty_block_invoke_2(uint64_t a1)
{
  return playerairplay_copyRoutingContext(*(void *)(a1 + 40), (CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

CFTypeRef __FigPlayerAirPlayRoute_CopyProperty_block_invoke_3(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 48);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

void __FigPlayerAirPlayRoute_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 16))
  {
    uint64_t v5 = *(void *)(v2 + 192);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7)
      {
        v8 = *(void (**)(uint64_t, void, uint64_t))(v7 + 56);
        if (v8) {
          v8(v5, *MEMORY[0x1E4F76670], v6);
        }
      }
    }
  }
  v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

void __FigPlayerAirPlayRoute_ResetRoutingContextIfNeeded_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[16]
    || (playerairplayroute_resetRoutingContextIfNeededInternal((uint64_t)v2), (uint64_t v2 = *(unsigned char **)(a1 + 32)) != 0))
  {
    CFRelease(v2);
  }
}

uint64_t __FigPlayerAirPlayRoute_ReevaluateCurrentRoute_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 16)) {
    return playerairplayroute_pickableRoutesChangedGuts(result);
  }
  return result;
}

void __FigPlayerAirPlayRoute_setNewFigAudioSession_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 16)) {
    goto LABEL_24;
  }
  if (*(void *)(v2 + 192))
  {
    playerairplayroute_stopFigAudioSessionListeners(v2);
    CFTypeRef v3 = CFRetain(*(CFTypeRef *)(*(void *)(a1 + 32) + 192));
    global_queue = dispatch_get_global_queue(0, 0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 0x40000000;
    v19[2] = __FigPlayerAirPlayRoute_setNewFigAudioSession_block_invoke_2;
    v19[3] = &__block_descriptor_tmp_105_1;
    v19[4] = v3;
    dispatch_async(global_queue, v19);
    uint64_t v5 = *(void *)(a1 + 32);
    *(_WORD *)(v5 + 216) = 0;
    playerairplayroute_createOrReleaseClientAssertionIfNeeded((unsigned int *)v5);
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v6 = *(const void **)(v2 + 192);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(const void **)(a1 + 40);
  *(void *)(v2 + 192) = v7;
  if (v7) {
    CFRetain(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
  playerairplayroute_updateAudioSessionPolicyForBuffered(*(void *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = (void *)MEMORY[0x1E4F1CF80];
  if (*(void *)(v8 + 192))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(const void **)(v10 + 224);
    if (v11)
    {
      CFRelease(v11);
      *(void *)(*(void *)(a1 + 32) + 224) = 0;
      uint64_t v10 = *(void *)(a1 + 32);
    }
    uint64_t v12 = *(void *)(v10 + 192);
    if (v12)
    {
      uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v13)
      {
        v14 = *(void (**)(uint64_t, void, void, uint64_t))(v13 + 48);
        if (v14) {
          v14(v12, *MEMORY[0x1E4F761A0], *v9, v10 + 224);
        }
      }
    }
    playerairplay_checkIfPrimaryAppChanged(*(NSObject ***)(a1 + 32));
    uint64_t v8 = *(void *)(a1 + 32);
  }
  playerairplayroute_resetRoutingContextIfNeededInternal(v8);
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 192);
  if (v15)
  {
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16)
    {
      v17 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v16 + 48);
      if (v17) {
        v17(v15, *MEMORY[0x1E4F75F00], *v9, &cf);
      }
    }
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 184) + 16))();
  if (cf) {
    CFRelease(cf);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
LABEL_24:
  }
    CFRelease((CFTypeRef)v2);
  v18 = *(const void **)(a1 + 40);
  if (v18) {
    CFRelease(v18);
  }
}

void __FigPlayerAirPlayRoute_setNewFigAudioSession_block_invoke_2(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4)
    {
      uint64_t v5 = *(void (**)(uint64_t, CFMutableDictionaryRef, void))(v4 + 104);
      if (v5) {
        v5(v3, Mutable, 0);
      }
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v6 = *(const void **)(a1 + 32);

  CFRelease(v6);
}

@end