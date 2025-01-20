@interface PairingSessionCopyIdentityPairingManager
@end

@implementation PairingSessionCopyIdentityPairingManager

void ___PairingSessionCopyIdentityPairingManager_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v7 = v4;
  id v6 = a3;
  LODWORD(v4) = NSErrorToOSStatusEx(v6, 0);

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end