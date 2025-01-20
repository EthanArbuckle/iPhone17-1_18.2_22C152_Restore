@interface StopAudioIO
@end

@implementation StopAudioIO

void ___StopAudioIO_block_invoke(uint64_t a1)
{
  Boolean outIsRunning = 0;
  if (gLogCategory_APReceiverAudioSessionPlatform <= 30
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(OpaqueAUGraph **)(v2 + 192);
  if (!v3) {
    goto LABEL_23;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(v2 + 256) = 1;
    *(unsigned char *)(v2 + 257) = *(unsigned char *)(v2 + 232);
  }
  else if (*(unsigned char *)(v2 + 256))
  {
    *(unsigned char *)(v2 + 257) = 0;
    goto LABEL_24;
  }
  AUGraphIsRunning(v3, &outIsRunning);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 232)) {
    BOOL v5 = outIsRunning == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (AUGraphStop(*(AUGraph *)(v4 + 192)))
    {
      if (gLogCategory_APReceiverAudioSessionPlatform <= 60
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
LABEL_23:
      APSLogErrorAt();
      goto LABEL_24;
    }
    AUGraphUninitialize(*(AUGraph *)(*(void *)(a1 + 32) + 192));
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 232) = 0;
LABEL_24:
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 16));
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 24));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end