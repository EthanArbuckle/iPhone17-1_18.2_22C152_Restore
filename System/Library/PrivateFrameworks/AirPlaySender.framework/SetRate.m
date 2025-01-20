@interface SetRate
@end

@implementation SetRate

CFTypeRef __audioHoseManagerBuffered_SetRate_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (char *)malloc_type_calloc(1uLL, 0x60uLL, 0x10A0040428D2481uLL);
  CFTypeRef v6 = *(CFTypeRef *)(a1 + 32);
  if (v6) {
    CFTypeRef v6 = CFRetain(v6);
  }
  *((void *)v5 + 2) = v6;
  *(void *)v5 = *(void *)(a1 + 40);
  *((void *)v5 + 1) = *(void *)(a1 + 48);
  *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 76);
  *(_OWORD *)(v5 + 40) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v5 + 28) = v7;
  *(_DWORD *)(a3 + 44) = *(_DWORD *)(a1 + 72);
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(void *)(a1 + 56)) {
      CMBaseObjectGetDerivedStorage();
    }
    LogPrintF();
  }
  uint64_t v8 = *(void *)a3;
  uint64_t v9 = *(unsigned int *)(a1 + 72);
  *(_OWORD *)v20 = *(_OWORD *)(a1 + 76);
  *(_OWORD *)&v20[12] = *(_OWORD *)(a1 + 88);
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  uint64_t ProtocolVTable = CMBaseObjectGetProtocolVTable();
  if (ProtocolVTable)
  {
    uint64_t v12 = *(void *)(ProtocolVTable + 16);
    if (v12)
    {
      v13 = *(void (**)(uint64_t, uint64_t, _OWORD *, uint64_t (*)(uint64_t, uint64_t, uint64_t, int, uint64_t), char *))(v12 + 80);
      if (v13)
      {
        v21[0] = *(_OWORD *)v20;
        *(_OWORD *)((char *)v21 + 12) = *(_OWORD *)&v20[12];
        v13(v8, v9, v21, audioHoseManagerBuffered_hoseSetRateCallbackCompletionHandler, v5);
      }
      else
      {
        audioHoseManagerBuffered_hoseSetRateCallbackCompletionHandler(v8, v11, MEMORY[0x1E4F4A160], -12782, (uint64_t)v5);
      }
    }
  }
  uint64_t v14 = *(void *)a3;
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  v17 = *(void (**)(uint64_t, void, void))(v16 + 56);
  if (v17) {
    v17(v14, *MEMORY[0x1E4F49FD8], *MEMORY[0x1E4F1CFD0]);
  }
  v18 = *(const void **)(*(void *)(a1 + 64) + 440);
  if (v18) {
    CFRelease(v18);
  }
  CFTypeRef result = *(CFTypeRef *)a3;
  if (*(void *)a3) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(a1 + 64) + 440) = result;
  *(_DWORD *)(a3 + 92) = 0;
  return result;
}

@end