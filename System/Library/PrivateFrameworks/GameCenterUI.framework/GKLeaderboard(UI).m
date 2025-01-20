@interface GKLeaderboard(UI)
+ (id)localizedStringForLeaderboardOccurrence:()UI;
+ (id)localizedStringForTimeScope:()UI;
- (id)imageURL;
- (id)miniImageURL;
- (void)loadImageWithCompletionHandler:()UI;
@end

@implementation GKLeaderboard(UI)

- (void)loadImageWithCompletionHandler:()UI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F636D8];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard+UI.m", 28, "-[GKLeaderboard(UI) loadImageWithCompletionHandler:]");
  v7 = [v5 dispatchGroupWithName:v6];

  v8 = [a1 imageURL];
  v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E5F62F28;
    id v14 = v8;
    id v15 = v7;
    [v15 perform:v13];
  }
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E5F63988;
    id v12 = v4;
    id v11 = v7;
    [v11 notifyOnMainQueueWithBlock:v10];
  }
}

- (id)imageURL
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v2 userInterfaceIdiom];

  v3 = [a1 internal];
  id v4 = [v3 icons];
  v5 = [MEMORY[0x1E4F639F0] sharedController];
  [v5 greatestScreenScale];
  v6 = objc_msgSend(v4, "_gkImageURLForSize:scale:", 187);

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
  v6 = objc_msgSend(v4, "_gkImageURLForSize:scale:", 187);

  return v6;
}

+ (id)localizedStringForTimeScope:()UI
{
  v0 = GKGameCenterUIFrameworkBundle();
  v1 = GKGetLocalizedStringFromTableInBundle();

  return v1;
}

+ (id)localizedStringForLeaderboardOccurrence:()UI
{
  v0 = GKGameCenterUIFrameworkBundle();
  v1 = GKGetLocalizedStringFromTableInBundle();

  return v1;
}

@end