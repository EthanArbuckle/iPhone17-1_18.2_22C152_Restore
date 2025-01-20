@interface UIImage
@end

@implementation UIImage

void __54__UIImage_GKAchievementProgress___gkQuestionMarkImage__block_invoke()
{
  id v2 = [MEMORY[0x1E4F63A10] sharedTheme];
  uint64_t v0 = [v2 achievementsNotStartedIcon];
  v1 = (void *)_gkQuestionMarkImage_sImage;
  _gkQuestionMarkImage_sImage = v0;
}

uint64_t __68__UIImage_GKAchievementProgress___gkMaskImageWithProgress_isDetail___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_gkMaskImageWithProgress_isDetail__sMaskCache;
  _gkMaskImageWithProgress_isDetail__sMaskCache = (uint64_t)v0;

  [(id)_gkMaskImageWithProgress_isDetail__sMaskCache setName:@"com.apple.gamekit.achievement-progress-mask.cache"];
  id v2 = (void *)_gkMaskImageWithProgress_isDetail__sMaskCache;

  return [v2 setCountLimit:20];
}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_2;
  v9[3] = &unk_1E5F66A48;
  id v10 = *(id *)(a1 + 48);
  id v14 = v3;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v15 = v7;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v3;
  [v4 cachedImageFromGamedWithSubdirectory:v5 handler:v9];
}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setResult:a2];
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    v4 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_3;
    v7[3] = &unk_1E5F661C0;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 72);
    id v8 = v5;
    uint64_t v13 = v6;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    dispatch_async(v4, v7);
  }
}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v3 = IMSPIGetGroupPhotosForChatsWithGroupIDs();

  if ([v3 count])
  {
    v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v5 = [MEMORY[0x1E4FB1818] _gkImageWithCheckedData:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      CGFloat v7 = (double)*(uint64_t *)(a1 + 72);
      [v5 scale];
      CGFloat v9 = v8;
      v12.width = v7;
      v12.height = v7;
      UIGraphicsBeginImageContextWithOptions(v12, 0, v9);
      objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v7, v7);
      id v10 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      if (v10)
      {
        [*(id *)(a1 + 40) setResult:v10];
        [*(id *)(a1 + 48) cacheImageUsingGamed:v10 cacheSubdirectory:*(void *)(a1 + 56) withHandler:0];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end