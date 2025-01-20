@interface GKScore
@end

@implementation GKScore

void __88__GKScore_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  v7 = [a4 _gkPlayersIDsFromPlayers];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, void *))(v8 + 16))(v8, v9, a3, v7);
  }
}

uint64_t __88__GKScore_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end