@interface RemoveConnectionForSession
@end

@implementation RemoveConnectionForSession

void ___RemoveConnectionForSession_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t HTTPConnectionForSession = _FindHTTPConnectionForSession(*(void *)(a1 + 32), *(void *)(a1 + 40), &v3);
  if (HTTPConnectionForSession)
  {
    uint64_t v2 = HTTPConnectionForSession;
    if (gLogCategory_AirPlayReceiverServer <= 50
      && (gLogCategory_AirPlayReceiverServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _DestroyHTTPConnection(v3, v2);
  }
}

@end