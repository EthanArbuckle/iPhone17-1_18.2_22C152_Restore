@interface PairingSessionSavePeerPairingManager
@end

@implementation PairingSessionSavePeerPairingManager

intptr_t ___PairingSessionSavePeerPairingManager_block_invoke(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NSErrorToOSStatusEx(a2, 0);
  v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

@end