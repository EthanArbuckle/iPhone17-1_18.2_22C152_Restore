@interface GKAchievementDescription(UI)
+ (id)incompleteAchievementImage;
+ (id)placeholderCompletedAchievementImage;
- (void)loadImageWithCompletionHandler:()UI;
- (void)loadImageWithTimeout:()UI completionHandler:;
@end

@implementation GKAchievementDescription(UI)

- (void)loadImageWithCompletionHandler:()UI
{
  v4 = a3;
  v5 = [a1 imageNameForIcon];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4FB1818];
    v7 = (void *)MEMORY[0x1E4F28B50];
    v8 = [a1 game];
    v9 = [v8 gameDescriptor];
    v10 = [v9 bundleIdentifier];
    v11 = [v7 bundleWithIdentifier:v10];
    v12 = [v6 imageNamed:v5 inBundle:v11 compatibleWithTraitCollection:0];

    if (v12)
    {
      v4[2](v4, v12, 0);
    }
    else
    {
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v18);
    }
LABEL_12:

    goto LABEL_13;
  }
  v13 = [a1 imageURL];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4FB1818];
    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [a1 imageURL];
    v17 = [v15 URLWithString:v16];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__GKAchievementDescription_UI__loadImageWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E5F644E0;
    v19[4] = a1;
    v20 = v4;
    [v14 _gkloadRemoteImageForURL:v17 queue:MEMORY[0x1E4F14428] withCompletionHandler:v19];
  }
  else if (v4)
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F63140] code:1 userInfo:0];
    }
    else
    {
      v12 = 0;
    }
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v12);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)loadImageWithTimeout:()UI completionHandler:
{
  id v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke;
  v13[3] = &unk_1E5F652D8;
  v15 = v16;
  id v7 = v6;
  id v14 = v7;
  [a1 loadImageWithCompletionHandler:v13];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5F65300;
  id v11 = v7;
  v12 = v16;
  id v9 = v7;
  dispatch_after(v8, MEMORY[0x1E4F14428], v10);

  _Block_object_dispose(v16, 8);
}

+ (id)incompleteAchievementImage
{
  v0 = [MEMORY[0x1E4F63A10] sharedTheme];
  v1 = [v0 achievementsNotStartedIcon];

  return v1;
}

+ (id)placeholderCompletedAchievementImage
{
  v0 = [MEMORY[0x1E4F63A10] sharedTheme];
  v1 = [v0 achievementsDefaultIcon];

  return v1;
}

@end