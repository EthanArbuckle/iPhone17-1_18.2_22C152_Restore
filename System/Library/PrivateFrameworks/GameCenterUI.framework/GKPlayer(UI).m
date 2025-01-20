@interface GKPlayer(UI)
- (void)_loadPhotoForSize:()UI withCompletionHandler:;
- (void)loadPhotoForSize:()UI withCompletionHandler:;
@end

@implementation GKPlayer(UI)

- (void)loadPhotoForSize:()UI withCompletionHandler:
{
  id v6 = a4;
  if (v6)
  {
    v7 = [a1 internal];
    v8 = [v7 photos];

    if (v8)
    {
      [a1 _loadPhotoForSize:a3 withCompletionHandler:v6];
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke;
      v9[3] = &unk_1E5F66BA0;
      v9[4] = a1;
      uint64_t v11 = a3;
      id v10 = v6;
      [a1 loadProfileWithCompletionHandler:v9];
    }
  }
}

- (void)_loadPhotoForSize:()UI withCompletionHandler:
{
  id v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F636D8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer+UI.m", 661, "-[GKPlayer(UI) _loadPhotoForSize:withCompletionHandler:]");
    v9 = [v7 dispatchGroupWithName:v8];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E5F64738;
    v15[4] = a1;
    uint64_t v17 = a3;
    id v10 = v9;
    id v16 = v10;
    [v10 perform:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_4;
    v12[3] = &unk_1E5F63E30;
    id v13 = v10;
    id v14 = v6;
    id v11 = v10;
    [v11 notifyOnMainQueueWithBlock:v12];
  }
}

@end