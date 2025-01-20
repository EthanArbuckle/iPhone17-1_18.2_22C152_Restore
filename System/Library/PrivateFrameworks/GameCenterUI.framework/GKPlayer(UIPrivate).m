@interface GKPlayer(UIPrivate)
+ (id)monogramQueue;
+ (uint64_t)preloadImagesForPlayers:()UIPrivate size:;
+ (uint64_t)sizeForPhotoSize:()UIPrivate;
- (__CFString)stringForMonogram;
- (id)avatarImageRenderer;
- (id)monogramColorIndex;
- (id)photoURLForSize:()UIPrivate;
- (id)placeholderImageWithPhotoSize:()UIPrivate;
- (id)renderingScopeForPhotoSize:()UIPrivate;
- (id)renderingScopeForPhotoSize:()UIPrivate colorIndex:;
- (void)_playerAvatarWithSize:()UIPrivate completionHandler:;
- (void)clearInMemoryCachedAvatars;
- (void)loadPlayerContactForAvatarControllerWithImageSize:()UIPrivate completion:;
- (void)monogramImageWithPhotoSize:()UIPrivate handler:;
- (void)playerAvatarDataWithSize:()UIPrivate completionHandler:;
- (void)playerAvatarImageWithSize:()UIPrivate completionHandler:;
- (void)renderMonogramImageWithPhotoSize:()UIPrivate monogramString:handler:;
- (void)showAlertWithTitle:()UIPrivate andMessage:;
- (void)showConfirmationAlertWithTitle:()UIPrivate message:buttonTitle:block:cancelAction:;
- (void)stringForMonogram;
@end

@implementation GKPlayer(UIPrivate)

- (void)showAlertWithTitle:()UIPrivate andMessage:
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__GKPlayer_UIPrivate__showAlertWithTitle_andMessage___block_invoke;
  v9[3] = &unk_1E5F63350;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

- (void)showConfirmationAlertWithTitle:()UIPrivate message:buttonTitle:block:cancelAction:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__GKPlayer_UIPrivate__showConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke;
  block[3] = &unk_1E5F669F8;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

+ (uint64_t)sizeForPhotoSize:()UIPrivate
{
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 == 0x10000) {
        return 64;
      }
      else {
        return 128;
      }
    }
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    BOOL v6 = v10 == 1;
    uint64_t v7 = 256;
    uint64_t v8 = 512;
  }
  else
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    BOOL v6 = v5 == 1;
    uint64_t v7 = 128;
    uint64_t v8 = 256;
  }
  if (v6) {
    return v8;
  }
  else {
    return v7;
  }
}

- (id)photoURLForSize:()UIPrivate
{
  v4 = [a1 internal];
  uint64_t v5 = [v4 photos];
  uint64_t v6 = [(id)objc_opt_class() sizeForPhotoSize:a3];
  uint64_t v7 = [MEMORY[0x1E4F639F0] sharedController];
  [v7 greatestScreenScale];
  uint64_t v8 = objc_msgSend(v5, "_gkImageURLForSize:scale:", v6);

  return v8;
}

- (__CFString)stringForMonogram
{
  int v2 = [a1 isAutomatchPlayer];
  v3 = [a1 internal];
  v4 = v3;
  if (v2)
  {
    uint64_t v5 = [v3 automatchPosition];
    uint64_t v6 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v7 = [NSNumber numberWithInteger:v5];
    uint64_t v8 = [v6 localizedStringFromNumber:v7 numberStyle:0];
LABEL_5:
    uint64_t v10 = (__CFString *)v8;
    goto LABEL_6;
  }
  v9 = [v3 alias];

  if (v9)
  {
    v4 = [a1 internal];
    uint64_t v7 = [v4 alias];
    uint64_t v8 = [v7 _firstGrapheme];
    goto LABEL_5;
  }
  v4 = objc_opt_new();
  id v12 = [a1 internal];
  id v13 = [v12 firstName];
  [v4 setGivenName:v13];

  id v14 = [a1 internal];
  id v15 = [v14 lastName];
  [v4 setFamilyName:v15];

  uint64_t v7 = objc_opt_new();
  [v7 setStyle:4];
  id v16 = [v7 stringFromPersonNameComponents:v4];
  if ([v16 length] && (unint64_t)objc_msgSend(v16, "length") <= 2)
  {
    id v17 = v16;
  }
  else
  {
    if (![v16 length])
    {
      id v18 = [a1 internal];
      id v19 = [v18 compositeName];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        v21 = [a1 internal];
        id v22 = [v21 compositeName];
        uint64_t v10 = [v22 _firstGrapheme];
      }
      else
      {
        if (!*MEMORY[0x1E4F63860]) {
          id v23 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
          -[GKPlayer(UIPrivate) stringForMonogram]();
        }
        uint64_t v10 = @" ";
      }
      goto LABEL_15;
    }
    id v17 = [v16 _firstGrapheme];
  }
  uint64_t v10 = v17;
LABEL_15:

LABEL_6:

  return v10;
}

- (id)placeholderImageWithPhotoSize:()UIPrivate
{
  uint64_t v3 = [(id)objc_opt_class() sizeForPhotoSize:a3];
  v4 = [MEMORY[0x1E4F63A10] sharedTheme];
  uint64_t v5 = [v4 placeholderSourceWithDimension:v3];

  uint64_t v6 = [v5 cachedImageForIdentifier:@"placeholders"];
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1BB20]);
    uint64_t v8 = [MEMORY[0x1E4F1BB28] defaultSettings];
    v9 = (void *)[v7 initWithSettings:v8];

    uint64_t v10 = [v9 placeholderImageProvider];
    double v11 = (double)v3;
    id v12 = [MEMORY[0x1E4F639F0] sharedController];
    [v12 greatestScreenScale];
    uint64_t v6 = objc_msgSend(v10, "imageForSize:scale:style:", 0, v11, v11, v13);

    id v14 = (id)[v5 processAndCacheImage:v6 forIdentifier:@"placeholders"];
  }

  return v6;
}

- (id)renderingScopeForPhotoSize:()UIPrivate colorIndex:
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GKPlayer_UIPrivate__renderingScopeForPhotoSize_colorIndex___block_invoke;
  block[3] = &unk_1E5F62EB0;
  void block[4] = a1;
  if (renderingScopeForPhotoSize_colorIndex__onceToken != -1) {
    dispatch_once(&renderingScopeForPhotoSize_colorIndex__onceToken, block);
  }
  uint64_t v6 = [(id)renderingScopeForPhotoSize_colorIndex__sAvatarImageRenderingScopes objectAtIndexedSubscript:a4];
  id v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)renderingScopeForPhotoSize:()UIPrivate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GKPlayer_UIPrivate__renderingScopeForPhotoSize___block_invoke;
  block[3] = &unk_1E5F62EB0;
  void block[4] = a1;
  if (renderingScopeForPhotoSize__onceToken != -1) {
    dispatch_once(&renderingScopeForPhotoSize__onceToken, block);
  }
  v4 = (void *)renderingScopeForPhotoSize__sAvatarImageRenderingScopes;
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)avatarImageRenderer
{
  if (avatarImageRenderer_onceToken != -1) {
    dispatch_once(&avatarImageRenderer_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)avatarImageRenderer_sImageRenderer;

  return v0;
}

- (void)renderMonogramImageWithPhotoSize:()UIPrivate monogramString:handler:
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F636D8];
  double v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer+UI.m", 347, "-[GKPlayer(UIPrivate) renderMonogramImageWithPhotoSize:monogramString:handler:]");
  id v12 = [v10 dispatchGroupWithName:v11];

  if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke;
    v16[3] = &unk_1E5F65ED0;
    v16[4] = a1;
    uint64_t v19 = a3;
    id v17 = v8;
    id v18 = v12;
    [v18 perform:v16];
  }
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_3;
    v13[3] = &unk_1E5F63988;
    id v15 = v9;
    id v14 = v12;
    [v14 notifyOnMainQueueWithBlock:v13];
  }
}

- (id)monogramColorIndex
{
  v1 = [a1 internal];
  int v2 = [v1 playerID];
  uint64_t v3 = [v2 componentsSeparatedByString:@":"];

  if ([v3 count] != 2)
  {
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  v4 = [v3 objectAtIndexedSubscript:0];
  if ([v4 isEqualToString:@"G"])
  {
  }
  else
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:0];
    int v7 = [v6 isEqualToString:@"U"];

    uint64_t v5 = 0;
    if (!v7) {
      goto LABEL_7;
    }
  }
  id v8 = NSNumber;
  id v9 = [v3 objectAtIndexedSubscript:1];
  unint64_t v10 = [v9 integerValue];
  double v11 = [MEMORY[0x1E4F89D48] availableColors];
  uint64_t v5 = objc_msgSend(v8, "numberWithUnsignedInteger:", v10 % objc_msgSend(v11, "count"));

LABEL_7:

  return v5;
}

+ (id)monogramQueue
{
  if (monogramQueue_onceToken != -1) {
    dispatch_once(&monogramQueue_onceToken, &__block_literal_global_45);
  }
  v0 = (void *)monogramQueue_sMonogramQueue;

  return v0;
}

- (void)monogramImageWithPhotoSize:()UIPrivate handler:
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4F636D8];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer+UI.m", 412, "-[GKPlayer(UIPrivate) monogramImageWithPhotoSize:handler:]");
  v29 = [v7 dispatchGroupWithName:v8];

  uint64_t v9 = [(id)objc_opt_class() sizeForPhotoSize:a3];
  unint64_t v10 = [MEMORY[0x1E4F63A10] sharedTheme];
  double v11 = [v10 monogramSourceWithDimension:v9];

  id v12 = [a1 internal];
  double v13 = [v12 playerID];

  if ([a1 isAutomatchPlayer])
  {
    id v14 = [a1 internal];
    uint64_t v15 = [v14 automatchPosition];
    id v16 = NSString;
    id v17 = [NSNumber numberWithInteger:v15];
    id v18 = [v16 stringWithFormat:@"-%@", v17];
    uint64_t v19 = [v13 stringByAppendingString:v18];

    double v13 = (void *)v19;
  }
  uint64_t v20 = GKAvatarSubdirectoryNameForPlayerID();
  v21 = NSNumber;
  id v22 = [a1 internal];
  id v23 = [v22 alias];
  id v24 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash"));
  id v25 = [v20 stringByAppendingFormat:@"_%@", v24];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke;
  v33[3] = &unk_1E5F66A98;
  v33[4] = a1;
  id v26 = v11;
  id v34 = v26;
  id v27 = v25;
  id v35 = v27;
  id v28 = v29;
  id v36 = v28;
  uint64_t v37 = a3;
  [v28 perform:v33];
  if (v6)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_53;
    v30[3] = &unk_1E5F63988;
    id v32 = v6;
    id v31 = v28;
    [v31 notifyOnMainQueueWithBlock:v30];
  }
}

- (void)playerAvatarDataWithSize:()UIPrivate completionHandler:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__GKPlayer_UIPrivate__playerAvatarDataWithSize_completionHandler___block_invoke;
  v8[3] = &unk_1E5F66AC0;
  id v9 = v6;
  id v7 = v6;
  [a1 _playerAvatarWithSize:a3 completionHandler:v8];
}

- (void)playerAvatarImageWithSize:()UIPrivate completionHandler:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__GKPlayer_UIPrivate__playerAvatarImageWithSize_completionHandler___block_invoke;
  v8[3] = &unk_1E5F66AC0;
  id v9 = v6;
  id v7 = v6;
  [a1 _playerAvatarWithSize:a3 completionHandler:v8];
}

- (void)_playerAvatarWithSize:()UIPrivate completionHandler:
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F636D8];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer+UI.m", 481, "-[GKPlayer(UIPrivate) _playerAvatarWithSize:completionHandler:]");
  id v9 = [v7 dispatchGroupWithName:v8];

  [v9 setObject:a1 forKeyedSubscript:@"reference"];
  unint64_t v10 = [a1 contact];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    double v13 = [a1 internal];
    id v12 = [v13 contact];
  }
  id v14 = [a1 internal];
  uint64_t v15 = [v14 playerID];

  if (v15)
  {
    if ([a1 hasPhoto])
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke;
      v37[3] = &unk_1E5F64738;
      v37[4] = a1;
      uint64_t v39 = a3;
      id v38 = v9;
      [v38 perform:v37];
      id v16 = v38;
LABEL_15:

      goto LABEL_22;
    }
    id v17 = [v12 thumbnailImageData];

    if (!v17)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_63;
      v34[3] = &unk_1E5F64738;
      v34[4] = a1;
      uint64_t v36 = a3;
      id v35 = v9;
      [v35 perform:v34];
      id v16 = v35;
      goto LABEL_15;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F639A8]);
    uint64_t v19 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v20 = [v12 thumbnailImageData];
    v21 = [v19 _gkImageWithCheckedData:v20];

    id v22 = (NSObject **)MEMORY[0x1E4F63860];
    id v23 = *MEMORY[0x1E4F63860];
    if (v21)
    {
      if (!v23)
      {
        id v24 = (id)GKOSLoggers();
        id v23 = *v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[GKPlayer(UIPrivate) _playerAvatarWithSize:completionHandler:]();
      }
      [v18 setImage:v21];
      id v25 = [v12 thumbnailImageData];
      [v18 setImageData:v25];
    }
    else
    {
      if (!v23)
      {
        id v26 = (id)GKOSLoggers();
        id v23 = *v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[GKPlayer(UIPrivate) _playerAvatarWithSize:completionHandler:]();
      }
      id v25 = [a1 placeholderImageWithPhotoSize:a3];
      [v18 setImage:v25];
      id v27 = UIImagePNGRepresentation(v25);
      [v18 setImageData:v27];
    }
    [v9 setResult:v18];
  }
LABEL_22:
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_65;
  v30[3] = &unk_1E5F63268;
  id v32 = a1;
  id v33 = v6;
  id v31 = v9;
  id v28 = v9;
  id v29 = v6;
  [v28 notifyOnMainQueueWithBlock:v30];
}

- (void)clearInMemoryCachedAvatars
{
  int v2 = [a1 internal];
  uint64_t v3 = [v2 playerID];

  if (v3)
  {
    v4 = [a1 internal];
    uint64_t v5 = [v4 playerID];
    GKAvatarSubdirectoryNameForPlayerID();
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v7 = [(id)objc_opt_class() sizeForPhotoSize:qword_1AF7CB1E8[i]];
      id v8 = [MEMORY[0x1E4F63A10] sharedTheme];
      id v9 = [v8 avatarSourceWithDimension:v7];

      [v9 clearCachedImageForIdentifier:v10];
    }
  }
}

+ (uint64_t)preloadImagesForPlayers:()UIPrivate size:
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__GKPlayer_UIPrivate__preloadImagesForPlayers_size___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v32__0__GKPlayer_8Q16_B24l;
  v5[4] = a4;
  return [a3 enumerateObjectsUsingBlock:v5];
}

- (void)loadPlayerContactForAvatarControllerWithImageSize:()UIPrivate completion:
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F636D8];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer+UI.m", 598, "-[GKPlayer(UIPrivate) loadPlayerContactForAvatarControllerWithImageSize:completion:]");
  id v9 = [v7 dispatchGroupWithName:v8];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke;
  v20[3] = &unk_1E5F64738;
  v20[4] = a1;
  uint64_t v22 = a3;
  id v10 = v9;
  id v21 = v10;
  [v10 perform:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_3;
  v18[3] = &unk_1E5F62F28;
  v18[4] = a1;
  id v11 = v10;
  id v19 = v11;
  [v11 perform:v18];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_4;
  v14[3] = &unk_1E5F62F50;
  uint64_t v16 = a1;
  id v17 = v6;
  id v15 = v11;
  id v12 = v6;
  id v13 = v11;
  [v13 notifyOnMainQueueWithBlock:v14];
}

- (void)stringForMonogram
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "stringForMonogram - No usable monogram string for the player", v2, v3, v4, v5, v6);
}

- (void)_playerAvatarWithSize:()UIPrivate completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "_playerAvatarWithSize: Failed to create image with thumbnailImageData, fall back to monogram", v2, v3, v4, v5, v6);
}

- (void)_playerAvatarWithSize:()UIPrivate completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "_playerAvatarWithSize: The player has a contact image.", v2, v3, v4, v5, v6);
}

@end