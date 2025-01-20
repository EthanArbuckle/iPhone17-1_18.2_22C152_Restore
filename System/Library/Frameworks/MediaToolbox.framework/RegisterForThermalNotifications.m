@interface RegisterForThermalNotifications
@end

@implementation RegisterForThermalNotifications

void __fpServer_RegisterForThermalNotifications_block_invoke(int a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (state64 < 0x28)
  {
    v7 = (const void *)bigBossSession;
    if (!bigBossSession) {
      return;
    }
    goto LABEL_11;
  }
  CFTypeRef v19 = 0;
  if (bigBossSession) {
    return;
  }
  getpid();
  uint64_t v2 = *MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef cf = 0;
  if (FPSupport_CanUseCMSession())
  {
    if (CMSessionCreate() || FigAudioSessionCreateWithCMSession(v2, v19, &bigBossSession)) {
      goto LABEL_24;
    }
    uint64_t v4 = bigBossSession;
    if (bigBossSession)
    {
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v5)
      {
        v6 = *(void (**)(uint64_t, void, __CFString *))(v5 + 56);
        if (v6) {
          v6(v4, *MEMORY[0x1E4F75FA8], @"BigBadThermalBoss");
        }
      }
    }
  }
  else if (FigAudioSessionCreateUsingAuxiliaryAVAudioSession(v2, 0, @"BigBadThermalBoss", &bigBossSession))
  {
    goto LABEL_24;
  }
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  uint64_t v8 = bigBossSession;
  if (bigBossSession
    && (uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0
    && (v10 = *(unsigned int (**)(uint64_t, CFMutableDictionaryRef, CFTypeRef *))(v9 + 104)) != 0
    && v10(v8, Mutable, &cf))
  {
    uint64_t v11 = bigBossSession;
    if (bigBossSession)
    {
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v12)
      {
        v13 = *(uint64_t (**)(uint64_t, void))(v12 + 80);
        if (v13)
        {
          BOOL v14 = v13(v11, 0) != 0;
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
    v15 = (const void *)FigCFCopyCompactDescription();
    if (v15) {
      CFRelease(v15);
    }
  }
LABEL_24:
  BOOL v14 = 1;
LABEL_25:
  if (cf) {
    CFRelease(cf);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v19) {
    CFRelease(v19);
  }
  v7 = (const void *)bigBossSession;
  if (bigBossSession) {
    BOOL v16 = v14;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
LABEL_11:
    CFRelease(v7);
    bigBossSession = 0;
  }
}

@end