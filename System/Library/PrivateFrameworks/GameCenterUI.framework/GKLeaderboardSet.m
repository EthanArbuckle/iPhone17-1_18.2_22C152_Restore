@interface GKLeaderboardSet
@end

@implementation GKLeaderboardSet

void __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v2 = *(void (**)(uint64_t))(v1 + 16);
      uint64_t v3 = *(void *)(a1 + 32);
      v2(v3);
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28C58] userErrorForCode:3 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v4);
    }
  }
}

@end