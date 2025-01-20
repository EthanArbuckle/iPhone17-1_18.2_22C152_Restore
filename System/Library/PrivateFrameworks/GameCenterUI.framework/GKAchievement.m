@interface GKAchievement
@end

@implementation GKAchievement

void __94__GKAchievement_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  v7 = [a4 _gkPlayersIDsFromPlayers];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, void *))(v8 + 16))(v8, v9, a3, v7);
  }
}

uint64_t __94__GKAchievement_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__GKAchievement_GKChallenge__selectChallengeablePlayerIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = [a2 _gkPlayersIDsFromPlayers];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

void __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (v5 && !v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:*(void *)(a1 + 32)];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "isCompleted", (void)v18))
          {
            v14 = [v13 player];
            [v7 removeObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      uint64_t v15 = [v7 array];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  if (!v1) {
    return;
  }
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (v3)
  {
    v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
    uint64_t v5 = a1[4];
    uint64_t v6 = 0;
LABEL_7:
    v4(v5, v6, v3);
    return;
  }
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v6)
  {
    v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
    uint64_t v5 = a1[4];
    uint64_t v3 = 0;
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4F1C978] array];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v7, *(void *)(*(void *)(a1[5] + 8) + 40));
}

@end