@interface EnsureClientEstablished
@end

@implementation EnsureClientEstablished

void __remoteXPCAIG_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"AssetImageGenerator_ServerConnectionDied");
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __remoteXPCPlayerClient_EnsureClientEstablished_block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  gRemotePlayerNotificationQueue = MEMORY[0x1E4F14428];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"ServerConnectionDied");
  FigCFDictionarySetInt32();
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCPlayerClient_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (!remoteXPCPlayerClient_EnsureClientEstablished_err)
  {
    remoteXPCPlayerClient_EnsureClientEstablished_err = FigXPCPlaybackCoordinatorClientStartAsSubclient(gPlayerRemoteClient, @"ServerConnectionDied");
    if (!remoteXPCPlayerClient_EnsureClientEstablished_err) {
      remoteXPCPlayerClient_EnsureClientEstablished_err = FigImageQueueGaugeXPCRemoteStartAsSubClient(gPlayerRemoteClient);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t __remoteXPCMutableMovieClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  if (!FigRemote_ShouldConnectToMediaparserdForFileParsing()) {
    FigRemote_ShouldConnectToMediaplaybackd();
  }
  uint64_t result = FigXPCRemoteClientCreate();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __remoteXPCVideoTargetClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"FigVideoTarget_ServerConnectionDied");
    FigRemote_ShouldConnectToMediaparserdForFileParsing();
    FigRemote_ShouldConnectToMediaplaybackd();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
  }
}

uint64_t __frbs_EnsureClientEstablished_block_invoke()
{
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  uint64_t result = FigXPCRemoteClientCreate();
  frbs_EnsureClientEstablished_err = result;
  return result;
}

uint64_t __remoteXPCCPEClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  uint64_t result = FigXPCRemoteClientCreate();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __aptapR_EnsureClientEstablished_block_invoke()
{
  if (FigRemote_ShouldConnectToAirplayd()) {
    uint64_t result = FigXPCRemoteClientCreate();
  }
  else {
    uint64_t result = FigSignalErrorAt();
  }
  aptapR_EnsureClientEstablished_err = result;
  return result;
}

uint64_t __aptapR_EnsureClientEstablished_block_invoke_2()
{
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  uint64_t result = FigXPCRemoteClientCreate();
  aptapR_EnsureClientEstablished_err = result;
  return result;
}

void __remoteSampleGenerator_EnsureClientEstablished_block_invoke()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"SampleGenerator_ServerConnectionDied");
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteSampleGenerator_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __remoteXPCVisualContextClient_EnsureClientEstablished_block_invoke()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"VisualContext_ServerConnectionDied");
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCVisualContextClient_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t __remoteXPCMutableCompositionClient_EnsureClientEstablished_block_invoke()
{
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  uint64_t result = FigXPCRemoteClientCreate();
  remoteXPCMutableCompositionClient_EnsureClientEstablished_err = result;
  return result;
}

void __remoteXPCAssetClient_EnsureClientEstablished_block_invoke()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"Asset_ServerConnectionDied");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22090], (const void *)*MEMORY[0x1E4F1CFD0]);
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCAssetClient_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __remoteXPCCPEProtectorClient_EnsureClientEstablished_block_invoke()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"CPEProtector_ServerConnectionDied");
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCCPEProtectorClient_EnsureClientEstablished_sCPEProtectorRemoteClientEstablishmentError = FigXPCRemoteClientCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t __remoteXPCFigCaptionGroupConverterClient_EnsureClientEstablished_block_invoke()
{
  uint64_t result = FigXPCRemoteClientCreate();
  remoteXPCFigCaptionGroupConverterClient_EnsureClientEstablished_err = result;
  if (result)
  {
    uint64_t result = FigSignalErrorAt();
    remoteXPCFigCaptionGroupConverterClient_EnsureClientEstablished_err = result;
  }
  return result;
}

void __remoteVideoCompositor_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"VideoCompositor_ServerConnectionDied");
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

@end