@interface GKAchievementDescription
@end

@implementation GKAchievementDescription

void __63__GKAchievementDescription_UI__loadImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImage:");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v5, 0);
    }
    else
    {
      v4 = [MEMORY[0x1E4F28C58] userErrorForCode:3 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
    }
  }
}

void __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_2;
  block[3] = &unk_1E5F652B0;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_2(void *result)
{
  uint64_t v1 = *(void *)(result[6] + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (void *)(*(uint64_t (**)(void, void))(result[5] + 16))(result[5], result[4]);
  }
  return result;
}

uint64_t __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) achievedDescription];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) achievedDescription];
    long long v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v4 = [v5 stringByTrimmingCharactersInSet:v6];
  }
  v7 = [*(id *)(a1 + 32) title];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) title];
    long long v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v7 = [v8 stringByTrimmingCharactersInSet:v9];
  }
  if ([MEMORY[0x1E4F63760] usesGameOverlayUI])
  {
    v10 = (void *)MEMORY[0x1E4F63760];
    v11 = [*(id *)(a1 + 32) internal];
    v12 = [v11 identifier];
    [v10 presentAchievementBannerInOverlayWithIdentifier:v12 title:v7 message:v4 image:v3];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke_2;
    v13[3] = &unk_1E5F62EB0;
    v13[4] = *(void *)(a1 + 32);
    +[GKNotificationBanner showAchievementBannerWithTitle:v7 achievementImage:v3 message:v4 touchHandler:v13];
  }
}

void __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F63660] reporter];
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 recordClickWithAction:@"navigate" targetId:@"dashboard" targetType:@"achievementEarnedBanner" pageId:v3 pageType:@"achievementEarnedBanner"];

  id v6 = +[GKAccessPoint shared];
  id v4 = [*(id *)(a1 + 32) internal];
  id v5 = [v4 identifier];
  [v6 triggerAccessPointWithAchievementID:v5 handler:0];
}

@end