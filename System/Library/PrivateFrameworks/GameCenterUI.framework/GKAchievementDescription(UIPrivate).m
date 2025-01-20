@interface GKAchievementDescription(UIPrivate)
- (id)imageURL;
- (uint64_t)showBanner;
@end

@implementation GKAchievementDescription(UIPrivate)

- (id)imageURL
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    if (*MEMORY[0x1E4F63A38]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = *MEMORY[0x1E4F63830] == 0;
    }
    if (v4) {
      uint64_t v5 = 128;
    }
    else {
      uint64_t v5 = 64;
    }
  }
  else
  {
    uint64_t v5 = 64;
  }
  v6 = [a1 internal];
  v7 = [v6 icons];
  v8 = [MEMORY[0x1E4F639F0] sharedController];
  [v8 greatestScreenScale];
  v9 = objc_msgSend(v7, "_gkImageURLForSize:scale:", v5);

  return v9;
}

- (uint64_t)showBanner
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke;
  v2[3] = &unk_1E5F65328;
  v2[4] = a1;
  return [a1 loadImageWithTimeout:v2 completionHandler:3.0];
}

@end