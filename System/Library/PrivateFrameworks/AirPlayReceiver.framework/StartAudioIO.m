@interface StartAudioIO
@end

@implementation StartAudioIO

void ___StartAudioIO_block_invoke(uint64_t a1)
{
  Boolean outIsRunning = 0;
  if (gLogCategory_APReceiverAudioSessionPlatform <= 30
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    _MainAudioEnsureSetup(v2, 0);
    _EnsureAudioOutputStarted(*(void *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 32);
    *(unsigned char *)(v2 + 256) = 0;
    if (!*(unsigned char *)(v2 + 257)) {
      goto LABEL_21;
    }
  }
  else if (*(unsigned char *)(v2 + 256))
  {
    *(unsigned char *)(v2 + 257) = 1;
    goto LABEL_21;
  }
  v3 = *(OpaqueAUGraph **)(v2 + 192);
  if (!v3) {
    goto LABEL_20;
  }
  AUGraphIsRunning(v3, &outIsRunning);
  uint64_t v4 = *(void *)(a1 + 32);
  if (!(*(unsigned __int8 *)(v4 + 232) | outIsRunning))
  {
    AUGraphInitialize(*(AUGraph *)(v4 + 192));
    if (!AUGraphStart(*(AUGraph *)(*(void *)(a1 + 32) + 192)))
    {
      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_11;
    }
    if (gLogCategory_APReceiverAudioSessionPlatform <= 60
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_20:
    APSLogErrorAt();
    goto LABEL_21;
  }
LABEL_11:
  *(unsigned char *)(*(void *)(a1 + 32) + 232) = 1;
LABEL_21:
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 24));
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 16));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end