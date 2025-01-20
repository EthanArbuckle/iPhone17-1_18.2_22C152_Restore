@interface CFURLCredentialStorageCopyAllCredentialsWithAccessControlGroupIncludeLegacyKeychain
@end

@implementation CFURLCredentialStorageCopyAllCredentialsWithAccessControlGroupIncludeLegacyKeychain

uint64_t ___CFURLCredentialStorageCopyAllCredentialsWithAccessControlGroupIncludeLegacyKeychain_block_invoke@<X0>(uint64_t a1@<X8>)
{
  *(CFAbsoluteTime *)a1 = CFAbsoluteTimeGetCurrent();
  v2 = pthread_self();
  *(_DWORD *)(a1 + 8) = pthread_mach_thread_np(v2);
  uint64_t result = getpid();
  *(_DWORD *)(a1 + 12) = result;
  *(void *)(a1 + 16) = "CFNetwork.f";
  *(void *)(a1 + 24) = "CFNetwork";
  *(void *)(a1 + 32) = 70;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = "none";
  return result;
}

@end