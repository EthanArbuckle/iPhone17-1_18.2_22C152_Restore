@interface Start
@end

@implementation Start

void __apEndpointRemoteControlSession_Start_block_invoke(uint64_t a1)
{
  if (!apEndpointRemoteControlSession_ensureAndCopyTransportStreams(*(void *)(a1 + 32), 0))
  {
    if (gLogCategory_APEndpointRemoteControlSession > 50
      || gLogCategory_APEndpointRemoteControlSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_6;
    }
LABEL_4:
    LogPrintF();
    goto LABEL_6;
  }
  if (gLogCategory_APEndpointRemoteControlSession <= 90
    && (gLogCategory_APEndpointRemoteControlSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
LABEL_6:
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

uint64_t __vdsink_Start_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __vdsink_Start_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void __hdpd_Start_block_invoke()
{
  if (gLogCategory_SPHubbedDevicesProviderDefaults <= 30
    && (gLogCategory_SPHubbedDevicesProviderDefaults != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  hdpd_handlePreferencesChanged();
  if (gLogCategory_SPHubbedDevicesProviderDefaults <= 30
    && (gLogCategory_SPHubbedDevicesProviderDefaults != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end