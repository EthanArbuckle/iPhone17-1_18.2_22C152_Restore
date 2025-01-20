@interface SetRateAndAnchorTime
@end

@implementation SetRateAndAnchorTime

uint64_t __audioHoseManagerBuffered_SetRateAndAnchorTime_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  int v5 = *(_DWORD *)(result + 64);
  if (v5 == 1) {
    v6 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CFC8];
  }
  if (*(_DWORD *)(a3 + 44) == v5)
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), result))
      {
        if (*(void *)(v4 + 32)) {
          CMBaseObjectGetDerivedStorage();
        }
        return LogPrintF();
      }
    }
  }
  else
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(void *)(v4 + 32)) {
        CMBaseObjectGetDerivedStorage();
      }
      LogPrintF();
    }
    v7 = *(const void **)(v4 + 32);
    if (v7)
    {
      CFRetain(v7);
      v8 = *(const void **)(v4 + 32);
    }
    else
    {
      v8 = 0;
    }
    v9 = *(const void **)a3;
    uint64_t v10 = *(unsigned int *)(v4 + 64);
    *(_OWORD *)v23 = *(_OWORD *)(v4 + 68);
    *(_OWORD *)&v23[12] = *(_OWORD *)(v4 + 80);
    long long v21 = *(_OWORD *)(v4 + 40);
    uint64_t v22 = *(void *)(v4 + 56);
    *(_OWORD *)v20 = *(_OWORD *)(v4 + 96);
    *(_OWORD *)&v20[12] = *(_OWORD *)(v4 + 108);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    uint64_t ProtocolVTable = CMBaseObjectGetProtocolVTable();
    if (ProtocolVTable)
    {
      uint64_t v12 = *(void *)(ProtocolVTable + 16);
      if (v12)
      {
        v13 = *(void (**)(const void *, uint64_t, _OWORD *, long long *, _OWORD *, uint64_t (*)(const void *, int, _OWORD *, long long *, _OWORD *, int, const void *), const void *))(v12 + 48);
        if (v13)
        {
          v27[0] = *(_OWORD *)v23;
          *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)&v23[12];
          long long v25 = v21;
          uint64_t v26 = v22;
          v24[0] = *(_OWORD *)v20;
          *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)&v20[12];
          v13(v9, v10, v27, &v25, v24, audioHoseManagerBuffered_hoseSetRateAndAnchorTimeCallbackCompletionHandler, v8);
        }
        else
        {
          audioHoseManagerBuffered_hoseSetRateAndAnchorTimeCallbackCompletionHandler(v9, 0, MEMORY[0x1E4F49F28], MEMORY[0x1E4F4A160], MEMORY[0x1E4F49F28], -12782, v8);
        }
      }
    }
    v14 = *(const void **)a3;
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v17 = *(void *)(VTable + 8);
    result = VTable + 8;
    uint64_t v16 = v17;
    if (v17) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = 0;
    }
    v19 = *(uint64_t (**)(const void *, void, void))(v18 + 56);
    if (v19) {
      result = v19(v14, *MEMORY[0x1E4F49FD8], *v6);
    }
    *(_DWORD *)(a3 + 44) = *(_DWORD *)(v4 + 64);
  }
  return result;
}

@end