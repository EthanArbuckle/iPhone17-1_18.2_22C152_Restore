@interface GKAchievement(GKChallenge)
+ (uint64_t)reportAchievements:()GKChallenge withEligibleChallenges:withCompletionHandler:;
- (id)challengeComposeControllerWithMessage:()GKChallenge players:completion:;
- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:;
- (id)challengeComposeControllerWithPlayers:()GKChallenge message:completionHandler:;
- (void)issueChallengeToPlayers:()GKChallenge message:;
- (void)selectChallengeablePlayerIDs:()GKChallenge withCompletionHandler:;
- (void)selectChallengeablePlayers:()GKChallenge withCompletionHandler:;
@end

@implementation GKAchievement(GKChallenge)

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__GKAchievement_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke;
  v12[3] = &unk_1E5F66C40;
  id v13 = v8;
  id v9 = v8;
  v10 = [a1 challengeComposeControllerWithMessage:a3 players:a4 completion:v12];

  return v10;
}

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F636F0] currentGame];
  v12 = [v11 internal];
  char v13 = [v12 supportsChallenges];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F636A8];
    v15 = [a1 game];
    v16 = [MEMORY[0x1E4F63760] localPlayer];
    v17 = [v14 challengeForGame:v15 andPlayer:v16 withAchievement:a1];

    v18 = +[GKHostedChallengeIssueController hostedIssueControllerWithChallenge:v17 players:v9 defaultMessage:v8 completionHandler:v10];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860]) {
      id v20 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:]();
    }
    if (!*v19) {
      id v21 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:]();
    }
    v18 = [MEMORY[0x1E4F636A8] challengesNotSupportedAlertController];
    if (v10) {
      (*((void (**)(id, void *, void, void))v10 + 2))(v10, v18, 0, 0);
    }
  }

  return v18;
}

- (id)challengeComposeControllerWithPlayers:()GKChallenge message:completionHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v11 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKAchievement(GKChallenge) challengeComposeControllerWithPlayers:message:completionHandler:]();
    }
    v12 = 0;
  }
  else
  {
    char v13 = [v8 _gkIncompletePlayersFromPlayerIDs];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__GKAchievement_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke;
    v15[3] = &unk_1E5F66C40;
    id v16 = v10;
    v12 = [a1 challengeComposeControllerWithMessage:v9 players:v13 completionHandler:v15];
  }

  return v12;
}

+ (uint64_t)reportAchievements:()GKChallenge withEligibleChallenges:withCompletionHandler:
{
  return [a1 reportAchievements:a3 whileScreeningChallenges:1 withEligibleChallenges:a4 withCompletionHandler:a5];
}

- (void)issueChallengeToPlayers:()GKChallenge message:
{
  id v6 = a3;
  id v7 = a4;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKAchievement(GKChallenge) issueChallengeToPlayers:message:]();
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F636A8];
    id v10 = [a1 game];
    id v11 = [MEMORY[0x1E4F63760] localPlayer];
    v12 = [v9 challengeForGame:v10 andPlayer:v11 withAchievement:a1];

    unint64_t v13 = [v6 count];
    if (v13 >= 3) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = v13;
    }
    v15 = objc_msgSend(v6, "subarrayWithRange:", 0, v14);

    id v16 = [v15 _gkIncompletePlayersFromPlayerIDs];
    +[GKHostedChallengeIssueController presentHostedIssueControllerWithChallenge:v12 players:v16 defaultMessage:v7];

    id v6 = v15;
  }
}

- (void)selectChallengeablePlayerIDs:()GKChallenge withCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if (!GKApplicationLinkedOnOrAfter())
  {
    id v10 = [v6 _gkIncompletePlayersFromPlayerIDs];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__GKAchievement_GKChallenge__selectChallengeablePlayerIDs_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E5F66C68;
    id v12 = v7;
    [a1 selectChallengeablePlayers:v10 withCompletionHandler:v11];

    id v9 = v12;
    goto LABEL_8;
  }
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR))
  {
    -[GKAchievement(GKChallenge) selectChallengeablePlayerIDs:withCompletionHandler:]();
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (v7)
  {
LABEL_6:
    id v9 = [MEMORY[0x1E4F28C58] userErrorForCode:34 underlyingError:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
LABEL_8:
  }
LABEL_9:
}

- (void)selectChallengeablePlayers:()GKChallenge withCompletionHandler:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"GKChallenge+UI.m", 505, @"Invalid parameter not satisfying: %@", @"players" object file lineNumber description];
  }
  id v9 = dispatch_group_create();
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__13;
  v32 = __Block_byref_object_dispose__13;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__13;
  v26[4] = __Block_byref_object_dispose__13;
  id v27 = 0;
  if ([a1 isReplayable])
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7];
    id v11 = (void *)v29[5];
    v29[5] = v10;
  }
  else
  {
    dispatch_group_enter(v9);
    id v12 = (void *)MEMORY[0x1E4F63668];
    unint64_t v13 = [a1 identifier];
    uint64_t v14 = [a1 game];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E5F66C90;
    v24 = v26;
    id v22 = v7;
    v25 = &v28;
    v23 = v9;
    [v12 loadAchievementWithID:v13 forGame:v14 players:v22 complete:v21];

    id v11 = v22;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5F63678;
  id v18 = v8;
  v19 = v26;
  id v20 = &v28;
  id v15 = v8;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
}

- (void)challengeComposeControllerWithPlayers:()GKChallenge message:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_1AF250000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)issueChallengeToPlayers:()GKChallenge message:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_1AF250000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)selectChallengeablePlayerIDs:()GKChallenge withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_2(&dword_1AF250000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

@end