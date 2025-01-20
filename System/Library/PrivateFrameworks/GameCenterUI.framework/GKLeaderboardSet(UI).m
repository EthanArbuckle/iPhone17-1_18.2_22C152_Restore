@interface GKLeaderboardSet(UI)
- (id)imageURL;
- (id)miniImageURL;
- (void)loadImageWithCompletionHandler:()UI;
@end

@implementation GKLeaderboardSet(UI)

- (void)loadImageWithCompletionHandler:()UI
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v6 = [a1 imageURL];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__14;
  v18[4] = __Block_byref_object_dispose__14;
  id v19 = 0;
  if (v6)
  {
    dispatch_group_enter(v5);
    v7 = (void *)MEMORY[0x1E4FB1818];
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E5F67020;
    v17 = v18;
    v16 = v5;
    [v7 _gkloadRemoteImageForURL:v8 queue:v9 withCompletionHandler:v15];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F66C18;
  id v13 = v4;
  v14 = v18;
  id v11 = v4;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v12);

  _Block_object_dispose(v18, 8);
}

- (id)imageURL
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v2 userInterfaceIdiom];

  v3 = [a1 internal];
  id v4 = [v3 icons];
  v5 = [MEMORY[0x1E4F639F0] sharedController];
  [v5 greatestScreenScale];
  v6 = objc_msgSend(v4, "_gkImageURLForSize:scale:", 335);

  return v6;
}

- (id)miniImageURL
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v2 userInterfaceIdiom];

  v3 = [a1 internal];
  id v4 = [v3 icons];
  v5 = [MEMORY[0x1E4F639F0] sharedController];
  [v5 greatestScreenScale];
  v6 = objc_msgSend(v4, "_gkImageURLForSize:scale:", 335);

  return v6;
}

@end