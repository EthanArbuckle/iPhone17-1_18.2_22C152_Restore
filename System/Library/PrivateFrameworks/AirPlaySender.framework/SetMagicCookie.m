@interface SetMagicCookie
@end

@implementation SetMagicCookie

uint64_t __audioHoseManagerBuffered_SetMagicCookie_block_invoke(uint64_t result, uint64_t a2, uint64_t *a3)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v4 = result;
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(void *)(v4 + 40)) {
        CMBaseObjectGetDerivedStorage();
      }
      audioHoseManagerBuffered_getMagicCookieIDForMagicCookieData(*(CFDataRef *)(v4 + 48));
      LogPrintF();
    }
    v5 = *(const void **)(v4 + 40);
    if (v5) {
      CFRetain(v5);
    }
    uint64_t v6 = *a3;
    uint64_t MagicCookieIDForMagicCookieData = audioHoseManagerBuffered_getMagicCookieIDForMagicCookieData(*(CFDataRef *)(v4 + 48));
    uint64_t v9 = *(void *)(v4 + 40);
    uint64_t v8 = *(void *)(v4 + 48);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    result = CMBaseObjectGetProtocolVTable();
    if (result && (v11 = *(void *)(result + 16), result += 16, (uint64_t v10 = v11) != 0))
    {
      v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), uint64_t))(v10 + 104);
      if (v12)
      {
        result = v12(v6, MagicCookieIDForMagicCookieData, v8, audioHoseManagerBuffered_hoseSetMagicCookieCallbackCompletionHandler, v9);
        int v13 = result;
        if (!result) {
          return result;
        }
      }
      else
      {
        int v13 = -12782;
        result = audioHoseManagerBuffered_hoseSetMagicCookieCallbackCompletionHandler(v6, MagicCookieIDForMagicCookieData, -12782, v9);
      }
    }
    else
    {
      int v13 = -12788;
    }
    if (gLogCategory_APAudioHoseManagerBuffered <= 90)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), result))
      {
        if (*(void *)(v4 + 40)) {
          CMBaseObjectGetDerivedStorage();
        }
        result = LogPrintF();
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) = v13;
  }
  return result;
}

@end