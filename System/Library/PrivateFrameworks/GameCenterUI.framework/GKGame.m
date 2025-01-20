@interface GKGame
@end

@implementation GKGame

uint64_t __91__GKGame_GKSpringboardSupport__removeHistoryForGameWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOutputSize:", 87.0, 87.0);
  uint64_t v2 = [*(id *)(a1 + 40) networkImageSourceWithName:@"DWIconsSharing" imageBrush:*(void *)(a1 + 32)];
  uint64_t v3 = imageSourceForiOSIconStyle__sharingImageSource;
  imageSourceForiOSIconStyle__sharingImageSource = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkImageSourceWithName:@"DWIconsList" imageBrush:*(void *)(a1 + 40)];
  uint64_t v2 = imageSourceForiOSIconStyle__sImageSource;
  imageSourceForiOSIconStyle__sImageSource = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkImageSourceWithName:@"DWIconsDetail" imageBrush:*(void *)(a1 + 40)];
  uint64_t v2 = imageSourceForiOSIconStyle__sImageSource_11;
  imageSourceForiOSIconStyle__sImageSource_11 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

void __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_4(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F639B8] brush];
  uint64_t v2 = [*(id *)(a1 + 32) networkImageSourceWithName:@"DWIconsMessage" imageBrush:v4];
  uint64_t v3 = (void *)imageSourceForiOSIconStyle__sImageSource_16;
  imageSourceForiOSIconStyle__sImageSource_16 = v2;
}

uint64_t __38__GKGame_UI___imageSourceForIconSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkImageSourceWithName:@"app-icon-64" imageBrush:*(void *)(a1 + 40)];
  uint64_t v2 = _imageSourceForIconSize__source64;
  _imageSourceForIconSize__source64 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __38__GKGame_UI___imageSourceForIconSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkImageSourceWithName:@"app-icon-128" imageBrush:*(void *)(a1 + 40)];
  uint64_t v2 = _imageSourceForIconSize__source128;
  _imageSourceForIconSize__source128 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __38__GKGame_UI___imageSourceForIconSize___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkImageSourceWithName:@"app-icon-256" imageBrush:*(void *)(a1 + 40)];
  uint64_t v2 = _imageSourceForIconSize__source256;
  _imageSourceForIconSize__source256 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __38__GKGame_UI___imageSourceForIconSize___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkImageSourceWithName:@"app-icon-512" imageBrush:*(void *)(a1 + 40)];
  uint64_t v2 = _imageSourceForIconSize__source512;
  _imageSourceForIconSize__source512 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __58__GKGame_UI__loadIconForSize_scale_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, a2, a3, 0);
  }
  return result;
}

uint64_t __53__GKGame_UI__loadIconForStyle_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, a2, a3, 0);
  }
  return result;
}

void __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_2;
  v8[3] = &unk_1E5F64040;
  v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[6];
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v11 = v6;
  id v7 = v3;
  [v5 perform:v8];
}

void __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) imageSourceForIconStyle:*(void *)(a1 + 40)];
  v5 = [*(id *)(a1 + 32) _imageURLForIconStyle:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [MEMORY[0x1E4F636D8] backgroundConcurrentQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_3;
  v9[3] = &unk_1E5F64018;
  id v10 = v3;
  id v8 = v3;
  [v4 loadImageForURLString:v5 reference:v6 queue:v7 handler:v9];
}

uint64_t __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__GKGame_UI__logoImageWithMaximumSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) localImageSourceWithName:@"logo" imageBrush:0];
  uint64_t v2 = logoImageWithMaximumSize__sImageSource;
  logoImageWithMaximumSize__sImageSource = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __39__GKGame_UI__logoImageWithMaximumSize___block_invoke_75(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end