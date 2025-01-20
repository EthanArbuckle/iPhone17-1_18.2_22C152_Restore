@interface SignalDataAvailable
@end

@implementation SignalDataAvailable

uint64_t __stream_SignalDataAvailable_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = APSLogErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16617;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = *(uint64_t (**)(uint64_t))(v5 + 72);
    if (v6) {
      int v7 = v6(v3);
    }
    else {
      int v7 = -12782;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
    uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (result)
    {
      return APSLogErrorAt();
    }
  }
  return result;
}

void __tcpunbufnw_SignalDataAvailable_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 340))
  {
    if (gLogCategory_APTransportConnectionTCPUnbufferedNW <= 30)
    {
      if (gLogCategory_APTransportConnectionTCPUnbufferedNW != -1
        || (v3 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v3))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    APTTrafficMetricsDataAvailable(*(void *)(v2 + 360));
    uint64_t v4 = *(void *)(a1 + 32);
    *(unsigned char *)(v4 + 340) = 1;
    tcpunbufnwGuts_connectionSendPackages(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v2);
}

@end