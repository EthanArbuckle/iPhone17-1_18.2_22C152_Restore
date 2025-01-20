@interface GKLeaderboard
@end

@implementation GKLeaderboard

void __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5F644E0;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v4 _gkloadRemoteImageForURL:v5 queue:MEMORY[0x1E4F14428] withCompletionHandler:v7];
}

uint64_t __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResult:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) result];

    uint64_t v3 = *(void *)(a1 + 40);
    if (v2)
    {
      id v4 = [*(id *)(a1 + 32) result];
      (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28C58] userErrorForCode:3 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
    }
  }
}

@end