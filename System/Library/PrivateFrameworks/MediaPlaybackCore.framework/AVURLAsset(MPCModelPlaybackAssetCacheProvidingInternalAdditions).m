@interface AVURLAsset(MPCModelPlaybackAssetCacheProvidingInternalAdditions)
- (void)mpc_addDownloadCompletionHandler:()MPCModelPlaybackAssetCacheProvidingInternalAdditions;
@end

@implementation AVURLAsset(MPCModelPlaybackAssetCacheProvidingInternalAdditions)

- (void)mpc_addDownloadCompletionHandler:()MPCModelPlaybackAssetCacheProvidingInternalAdditions
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_getAssociatedObject(a1, (const void *)_MPCAVURLAssetAssociatedKeyModelPlaybackDownloadCompletionObserver);
    v6 = v5;
    if (v5)
    {
      v7 = [v5 completionHandler];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke_2;
      v9[3] = &unk_2643BEBA8;
      id v10 = v7;
      id v11 = v4;
      v8 = v7;
      [v6 setCompletionHandler:v9];
    }
    else
    {
      v8 = [[_MPCURLAssetDownloadCompletionObserver alloc] initWithAsset:a1];
      objc_initWeak(&location, a1);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke;
      v12[3] = &unk_2643BEB80;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      [(_MPCURLAssetDownloadCompletionObserver *)v8 setCompletionHandler:v12];
      objc_setAssociatedObject(a1, (const void *)_MPCAVURLAssetAssociatedKeyModelPlaybackDownloadCompletionObserver, v8, (void *)1);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

@end