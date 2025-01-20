@interface SavePeer
@end

@implementation SavePeer

uint64_t __coreUtilsPairingPeerCache_SavePeer_block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __coreUtilsPairingPeerCache_SavePeer_block_invoke_2(uint64_t result)
{
  if (gLogCategory_APPairingClientCoreUtils <= 30)
  {
    uint64_t v1 = result;
    if (gLogCategory_APPairingClientCoreUtils != -1 || (result = _LogCategory_Initialize(), result))
    {
      ++*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24);
      return LogPrintF();
    }
  }
  return result;
}

@end