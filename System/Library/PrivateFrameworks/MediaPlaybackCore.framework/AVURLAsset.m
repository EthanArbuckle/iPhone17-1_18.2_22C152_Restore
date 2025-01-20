@interface AVURLAsset
@end

@implementation AVURLAsset

void __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained) {
    objc_setAssociatedObject(WeakRetained, (const void *)_MPCAVURLAssetAssociatedKeyModelPlaybackDownloadCompletionObserver, 0, (void *)1);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  id v7 = a3;
  v6(v5, a2, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

intptr_t __80__AVURLAsset_MPCHLSSessionData__mpc_synchronousHLSSessionDataWithTimeout_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 statusOfValueForKey:@"metadata" error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end