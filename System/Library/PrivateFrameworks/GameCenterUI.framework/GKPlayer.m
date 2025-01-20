@interface GKPlayer
@end

@implementation GKPlayer

void __53__GKPlayer_UIPrivate__showAlertWithTitle_andMessage___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4FB1EC0] _gkKeyWindowRootViewController];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = GKGameCenterUIFrameworkBundle();
  v5 = GKGetLocalizedStringFromTableInBundle();
  id v6 = (id)[v7 _gkPresentAlertWithTitle:v3 message:v2 buttonTitle:v5];
}

void __93__GKPlayer_UIPrivate__showConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke(void *a1)
{
  id v3 = [MEMORY[0x1E4FB1EC0] _gkKeyWindowRootViewController];
  id v2 = (id)[v3 _gkPresentConfirmationAlertWithTitle:a1[4] message:a1[5] buttonTitle:a1[6] block:a1[7] cancelAction:a1[8]];
}

void __61__GKPlayer_UIPrivate__renderingScopeForPhotoSize_colorIndex___block_invoke()
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v20 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [MEMORY[0x1E4F89D48] availableColors];
  uint64_t v0 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = *(void *)v22;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v22 != v2) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v21 + 1) + 8 * v3);
        v5 = [MEMORY[0x1E4F639F0] sharedController];
        [v5 greatestScreenScale];
        double v7 = v6;

        uint64_t v8 = GKShouldLayoutRTL();
        uint64_t v9 = [(id)objc_opt_class() sizeForPhotoSize:0];
        v10 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v9, (double)v9, v7);
        uint64_t v11 = [(id)objc_opt_class() sizeForPhotoSize:1];
        v12 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v11, (double)v11, v7);
        uint64_t v13 = [(id)objc_opt_class() sizeForPhotoSize:0x10000];
        v14 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v13, (double)v13, v7);
        uint64_t v15 = [(id)objc_opt_class() sizeForPhotoSize:65537];
        v16 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v15, (double)v15, v7);
        v25[0] = &unk_1F08124E0;
        v25[1] = &unk_1F08124F8;
        v26[0] = v10;
        v26[1] = v12;
        v25[2] = &unk_1F0812510;
        v25[3] = &unk_1F0812528;
        v26[2] = v14;
        v26[3] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
        [v20 addObject:v17];

        ++v3;
      }
      while (v1 != v3);
      uint64_t v1 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v1);
  }

  v18 = (void *)renderingScopeForPhotoSize_colorIndex__sAvatarImageRenderingScopes;
  renderingScopeForPhotoSize_colorIndex__sAvatarImageRenderingScopes = (uint64_t)v20;
}

void __50__GKPlayer_UIPrivate__renderingScopeForPhotoSize___block_invoke()
{
  v15[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F639F0] sharedController];
  [v0 greatestScreenScale];
  double v2 = v1;

  uint64_t v3 = GKShouldLayoutRTL();
  uint64_t v4 = [(id)objc_opt_class() sizeForPhotoSize:0];
  v5 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v4, (double)v4, v2);
  uint64_t v6 = [(id)objc_opt_class() sizeForPhotoSize:1];
  double v7 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v6, (double)v6, v2);
  uint64_t v8 = [(id)objc_opt_class() sizeForPhotoSize:0x10000];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v8, (double)v8, v2);
  uint64_t v10 = [(id)objc_opt_class() sizeForPhotoSize:65537];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v10, (double)v10, v2);
  v14[0] = &unk_1F08124E0;
  v14[1] = &unk_1F08124F8;
  v15[0] = v5;
  v15[1] = v7;
  v14[2] = &unk_1F0812510;
  v14[3] = &unk_1F0812528;
  v15[2] = v9;
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  uint64_t v13 = (void *)renderingScopeForPhotoSize__sAvatarImageRenderingScopes;
  renderingScopeForPhotoSize__sAvatarImageRenderingScopes = v12;
}

void __42__GKPlayer_UIPrivate__avatarImageRenderer__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1BB20]);
  id v3 = [MEMORY[0x1E4F1BB28] defaultSettings];
  uint64_t v1 = [v0 initWithSettings:v3];
  double v2 = (void *)avatarImageRenderer_sImageRenderer;
  avatarImageRenderer_sImageRenderer = v1;
}

void __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) monogramColorIndex];
  v5 = v4;
  if (v4) {
    objc_msgSend(*(id *)(a1 + 32), "renderingScopeForPhotoSize:colorIndex:", *(void *)(a1 + 56), objc_msgSend(v4, "integerValue"));
  }
  else {
  uint64_t v6 = [*(id *)(a1 + 32) renderingScopeForPhotoSize:*(void *)(a1 + 56)];
  }
  double v7 = [*(id *)(a1 + 32) avatarImageRenderer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_2;
  v11[3] = &unk_1E5F644E0;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = v3;
  id v9 = v3;
  id v10 = (id)[v7 renderMonogramForString:v8 scope:v6 imageHandler:v11];
}

uint64_t __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResult:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __36__GKPlayer_UIPrivate__monogramQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.gamecenter.monogramqueue", MEMORY[0x1E4F14430]);
  uint64_t v1 = monogramQueue_sMonogramQueue;
  monogramQueue_sMonogramQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() monogramQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_2;
  v9[3] = &unk_1E5F66A70;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v6;
  uint64_t v7 = *(void *)(a1 + 64);
  id v14 = v3;
  uint64_t v15 = v7;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_3;
  v6[3] = &unk_1E5F66A48;
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  id v11 = v4;
  uint64_t v12 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v2 cachedImageFromGamedWithSubdirectory:v3 handler:v6];
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setResult:a2];
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) stringForMonogram];
    uint64_t v5 = *(void *)(a1 + 72);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_4;
    v7[3] = &unk_1E5F66A20;
    uint64_t v6 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    [v6 renderMonogramImageWithPhotoSize:v5 monogramString:v4 handler:v7];
  }
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setResult:v3];
    [*(id *)(a1 + 40) cacheImageUsingGamed:v3 cacheSubdirectory:*(void *)(a1 + 48) withHandler:0];
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_4_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_53(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __66__GKPlayer_UIPrivate__playerAvatarDataWithSize_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = [a2 imageData];
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v8, a3, v7);
}

void __67__GKPlayer_UIPrivate__playerAvatarImageWithSize_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = [a2 image];
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v8, a3, v7);
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) photoURLForSize:*(void *)(a1 + 48)];
  uint64_t v5 = (NSObject **)MEMORY[0x1E4F63860];
  uint64_t v6 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v7 = (id)GKOSLoggers();
    uint64_t v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_cold_1((uint64_t)v4, v6);
    if (v4) {
      goto LABEL_5;
    }
  }
  else if (v4)
  {
LABEL_5:
    uint64_t v8 = [(id)objc_opt_class() sizeForPhotoSize:*(void *)(a1 + 48)];
    id v9 = [*(id *)(a1 + 32) internal];
    id v10 = [v9 playerID];
    id v11 = GKAvatarSubdirectoryNameForPlayerID();

    uint64_t v12 = [MEMORY[0x1E4F63A10] sharedTheme];
    uint64_t v13 = [v12 avatarSourceWithDimension:v8];

    id v14 = dispatch_get_global_queue(33, 0);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_58;
    v24[3] = &unk_1E5F66B10;
    uint64_t v15 = *(void *)(a1 + 32);
    id v25 = *(id *)(a1 + 40);
    uint64_t v28 = v3;
    id v16 = v4;
    uint64_t v17 = *(void *)(a1 + 32);
    id v26 = v16;
    uint64_t v27 = v17;
    uint64_t v29 = *(void *)(a1 + 48);
    [v13 loadAndCacheAvatarFromGamedForURLString:v16 useUIImage:1 cacheSubdirectory:v11 reference:v15 queue:v14 handler:v24];

    goto LABEL_12;
  }
  v18 = *v5;
  if (!*v5)
  {
    id v19 = (id)GKOSLoggers();
    v18 = *v5;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = *(void **)(a1 + 32);
    long long v21 = v18;
    long long v22 = [v20 alias];
    long long v23 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    *(_DWORD *)buf = 138412546;
    v31 = v22;
    __int16 v32 = 2112;
    v33 = v23;
    _os_log_impl(&dword_1AF250000, v21, OS_LOG_TYPE_INFO, "%@ has no photo url for photo size: %@", buf, 0x16u);
  }
  v3[2](v3);
LABEL_12:
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setResult:v5];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    uint64_t v8 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_58_cold_1(a1, v8);
    }
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 64);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_59;
    v11[3] = &unk_1E5F66AE8;
    void v11[4] = v9;
    uint64_t v14 = v10;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    [v9 monogramImageWithPhotoSize:v10 handler:v11];
  }
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F639A8]);
  if (!v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v5 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_59_cold_1();
    }
    id v3 = [*(id *)(a1 + 32) placeholderImageWithPhotoSize:*(void *)(a1 + 56)];
  }
  [v4 setImage:v3];
  id v6 = UIImagePNGRepresentation(v3);
  [v4 setImageData:v6];

  [*(id *)(a1 + 40) setResult:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x1E4F63860];
  id v5 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v6 = (id)GKOSLoggers();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_63_cold_1();
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_64;
  v10[3] = &unk_1E5F66AE8;
  v10[4] = v7;
  uint64_t v13 = v8;
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v9 = v3;
  [v7 monogramImageWithPhotoSize:v8 handler:v10];
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F639A8]);
  if (!v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v5 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_59_cold_1();
    }
    id v3 = [*(id *)(a1 + 32) placeholderImageWithPhotoSize:*(void *)(a1 + 56)];
  }
  [v4 setImage:v3];
  id v6 = UIImagePNGRepresentation(v3);
  [v4 setImageData:v6];

  [*(id *)(a1 + 40) setResult:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_65(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) result];
  uint64_t v3 = [*(id *)(a1 + 40) avatarType];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"reference"];
  (*(void (**)(uint64_t, id, uint64_t, void *))(v2 + 16))(v2, v5, v3, v4);
}

uint64_t __52__GKPlayer_UIPrivate__preloadImagesForPlayers_size___block_invoke(uint64_t a1, void *a2)
{
  return [a2 playerAvatarImageWithSize:*(void *)(a1 + 32) completionHandler:&__block_literal_global_68];
}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_2;
  v7[3] = &unk_1E5F66B78;
  id v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 _playerAvatarWithSize:v4 completionHandler:v7];
}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 imageData];

  if (v3)
  {
    uint64_t v4 = [v7 imageData];
    [*(id *)(a1 + 32) setResult:v4];
  }
  else
  {
    id v5 = [v7 image];

    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v4 = [v7 image];
    id v6 = UIImagePNGRepresentation(v4);
    [*(id *)(a1 + 32) setResult:v6];
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = (id)objc_opt_new();
  uint64_t v4 = [*(id *)(a1 + 32) internal];
  id v5 = [v4 alias];
  [v6 setGivenName:v5];

  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"contact"];
  v3[2](v3);
}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"contact"];
  uint64_t v2 = [*(id *)(a1 + 32) result];
  [v3 setImageData:v2];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E5F63988;
    id v6 = *(id *)(a1 + 40);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
  else
  {
    [*(id *)(a1 + 32) _loadPhotoForSize:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 40)];
  }
}

uint64_t __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5F66BC8;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  uint64_t v8 = *(void *)(a1 + 48);
  id v13 = v3;
  uint64_t v14 = v8;
  id v9 = v3;
  [v5 playerAvatarImageWithSize:v4 completionHandler:v10];
}

void __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setResult:a2];
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5F644E0;
    id v5 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    [v5 monogramImageWithPhotoSize:v4 handler:v6];
  }
}

uint64_t __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResult:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  if (v2)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] userErrorForCode:26 underlyingError:0];
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v4, v5);
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "monogramImageWithPhotoSize: Can't generate a monogram for the player.", v2, v3, v4, v5, v6);
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "_playerAvatarWithSize: Player has an avatar image (%@), thus load that image", (uint8_t *)&v2, 0xCu);
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_58_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "_playerAvatarWithSize: The avatar image URL points to a file that doesn't exist. Fall back to monogram. (URL: %@)", (uint8_t *)&v3, 0xCu);
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_59_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "_playerAvatarWithSize: Failed to create a monogram. Fall back to a placeholder image.", v2, v3, v4, v5, v6);
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_63_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "_playerAvatarWithSize: Fall back to monogram if no image to load for player", v2, v3, v4, v5, v6);
}

@end