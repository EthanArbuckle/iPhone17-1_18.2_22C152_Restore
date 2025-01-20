@interface EnsureClientEstablished
@end

@implementation EnsureClientEstablished

void __cryptorRemote_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  v5[0] = 1;
  v5[1] = (unint64_t)cryptorRemote_DeadConnectionCallback;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"FigCPECryptor_ServerConnectionDied");
    FigRemote_ShouldConnectToMediaparserdForFileParsing();
    if (FigRemote_ShouldConnectToMediaplaybackd()) {
      v4 = "com.apple.coremedia.mediaplaybackd.figcpecryptor.xpc";
    }
    else {
      v4 = "com.apple.coremedia.figcpecryptor";
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)v4, v5, 0, &gFigCPECryptorRemoteClient);
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigSignalErrorAt(4294949725, 0, 0, 0, 0, 0, 0);
  }
}

void __remoteVirtualCaptureCardClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    CFDictionaryRef v3 = Mutable;
    CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"FigVirtualCaptureCard_ServerConnectionDied");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.figvirtualcapturecard.xpc", kFigVirtualCaptureCardNotification_ServerConnectionDied_block_invoke_callbacks, v3, &gFigVirtualCaptureCardRemoteClient);
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16150;
  }
}

void __figEndpointStreamRemoteXPC_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"EndpointStream_ServerConnectionDied");
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_PrivilegedConnection", (const void *)*MEMORY[0x1E4F1CFD0]);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointstream.xpc", kFigEndpointStreamNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointStreamRemoteClient);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void __figEndpointMessengerRemoteXPC_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"Endpoint_ServerConnectionDied");
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_PrivilegedConnection", (const void *)*MEMORY[0x1E4F1CFD0]);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointmessenger.xpc", kFigEndpointMessengerNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointMessengerRemoteClient);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void __figCustomURLLoaderRemote_EnsureClientEstablished_block_invoke()
{
  v2[0] = 3;
  v2[1] = (unint64_t)figCustomURLLoaderRemote_DeadConnectionCallback;
  long long v3 = 0u;
  long long v4 = 0u;
  v5 = figCustomURLLoaderRemote_serverStatePurged;
  uint64_t v6 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"CustomURLHandler_ServerConnectionDied");
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  if (FigRemote_ShouldConnectToMediaplaybackd()) {
    v1 = "com.apple.coremedia.mediaplaybackd.customurlloader.xpc";
  }
  else {
    v1 = "com.apple.coremedia.customurlloader.xpc";
  }
  figCustomURLLoaderRemote_EnsureClientEstablished_err = FigXPCRemoteClientCreate((uint64_t)v1, v2, Mutable, &gFigCustomURLLoaderRemoteClient);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __remoteXPCEndpointPlaybackSessionClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"EndpointPlaybackSession_ServerConnectionDied");
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_PrivilegedConnection", (const void *)*MEMORY[0x1E4F1CFD0]);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointplaybacksession.xpc", kFigEndpointPlaybackSessionNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointPlaybackSessionRemoteClient);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void __remoteXPCEndpointRemoteControlSessionClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_DeathNoticeName", @"EndpointRemoteControlSession_ServerConnectionDied");
  CFDictionarySetValue(Mutable, @"xpcRemoteClientOption_PrivilegedConnection", (const void *)*MEMORY[0x1E4F1CFD0]);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointremotecontrolsession.xpc", kFigEndpointRemoteControlSessionNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointRemoteControlSessionRemoteClient);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

uint64_t __remoteClient_EnsureClientEstablished_block_invoke()
{
  uint64_t v6 = 0;
  long long v5 = 0u;
  long long v4 = 0u;
  long long v3 = 0u;
  unint64_t v2 = 1;
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  if (FigRemote_ShouldConnectToMediaplaybackd()) {
    v0 = "com.apple.coremedia.mediaplaybackd.controlcommands.xpc";
  }
  else {
    v0 = "com.apple.coremedia.logging.xpc";
  }
  uint64_t result = FigXPCRemoteClientCreate((uint64_t)v0, &v2, 0, &gFigControlCommandsRemoteClient);
  remoteClient_EnsureClientEstablished_err = result;
  return result;
}

@end