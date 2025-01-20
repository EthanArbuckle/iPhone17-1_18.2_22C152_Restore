@interface UpdateHoseReadiness
@end

@implementation UpdateHoseReadiness

void __audioHoseManagerBuffered_UpdateHoseReadiness_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(void (**)(uint64_t, void, void, uint64_t))(v8 + 48);
  if (v9) {
    v9(v5, *MEMORY[0x1E4F21400], 0, v6 + 24);
  }
  if (!*(_DWORD *)(a1 + 80))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = APSGetFBOPropertyInt64() != 0;
    int v10 = *((_DWORD *)a3 + 23);
    if ((v10 - 1) > 2
      || (v11 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) == 0
      || *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (v10 != 1) {
        goto LABEL_45;
      }
      *((_DWORD *)a3 + 23) = 2;
      *(unsigned char *)(*(void *)(a1 + 56) + 372) = 1;
      if (gLogCategory_APAudioHoseManagerBuffered > 50
        || gLogCategory_APAudioHoseManagerBuffered == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_45;
      }
      if (!*(void *)(a1 + 64))
      {
LABEL_32:
        LogPrintF();
LABEL_45:
        v18 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (v18)
        {
          CFRelease(v18);
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        }
        if (*((_DWORD *)a3 + 23) == 2 && !a3[30]) {
          a3[30] = UpTicksToMilliseconds();
        }
        return;
      }
LABEL_14:
      CMBaseObjectGetDerivedStorage();
      goto LABEL_32;
    }
    CFDictionaryRef v12 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v12)
    {
LABEL_18:
      int v13 = CFDictionaryContainsKey(v12, v11);
      CFDictionaryRef v14 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      v15 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (v13)
      {
        Value = CFDictionaryGetValue(v14, v15);
        if (Value[23] == 1)
        {
          Value[23] = 2;
          *(unsigned char *)(*(void *)(a1 + 56) + 372) = 1;
          if (gLogCategory_APAudioHoseManagerBuffered <= 50
            && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
          {
            if (*(void *)(a1 + 64)) {
              CMBaseObjectGetDerivedStorage();
            }
            LogPrintF();
          }
        }
        if (*((_DWORD *)a3 + 23) != 1) {
          goto LABEL_45;
        }
        *((_DWORD *)a3 + 23) = 2;
        *(unsigned char *)(*(void *)(a1 + 56) + 372) = 1;
        if (gLogCategory_APAudioHoseManagerBuffered > 50
          || gLogCategory_APAudioHoseManagerBuffered == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_45;
        }
        if (!*(void *)(a1 + 64)) {
          goto LABEL_32;
        }
      }
      else
      {
        CFDictionaryAddValue(v14, v15, a3);
        if (*((_DWORD *)a3 + 23) != 1) {
          goto LABEL_45;
        }
        uint64_t v17 = *(void *)(a1 + 56);
        if ((unint64_t)(*(void *)(a1 + 72) - a3[6]) < *(void *)(v17 + 360)) {
          goto LABEL_45;
        }
        *((_DWORD *)a3 + 23) = 2;
        *(unsigned char *)(v17 + 372) = 1;
        if (gLogCategory_APAudioHoseManagerBuffered > 50
          || gLogCategory_APAudioHoseManagerBuffered == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_45;
        }
        if (!*(void *)(a1 + 64)) {
          goto LABEL_32;
        }
      }
      goto LABEL_14;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
    CFDictionaryRef v12 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v12)
    {
      v11 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      goto LABEL_18;
    }
  }
  APSLogErrorAt();
}

@end