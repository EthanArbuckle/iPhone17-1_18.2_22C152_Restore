@interface GKScore(GKChallenge)
+ (uint64_t)reportScores:()GKChallenge withEligibleChallenges:withCompletionHandler:;
+ (void)reportLeaderboardScores:()GKChallenge withEligibleChallenges:withCompletionHandler:;
- (id)challengeComposeControllerWithMessage:()GKChallenge players:completion:;
- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:;
- (id)challengeComposeControllerWithPlayers:()GKChallenge message:completionHandler:;
- (void)issueChallengeToPlayers:()GKChallenge message:;
@end

@implementation GKScore(GKChallenge)

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F636F0] currentGame];
  v12 = [v11 internal];
  char v13 = [v12 supportsChallenges];

  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__GKScore_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke;
    v19[3] = &unk_1E5F66C40;
    id v20 = v10;
    v14 = [a1 challengeComposeControllerWithMessage:v8 players:v9 completion:v19];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860]) {
      id v16 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:]();
    }
    if (!*v15) {
      id v17 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:]();
    }
    v14 = [MEMORY[0x1E4F636A8] challengesNotSupportedAlertController];
    if (v10) {
      (*((void (**)(id, void *, void, void))v10 + 2))(v10, v14, 0, 0);
    }
  }

  return v14;
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
    id v16 = [MEMORY[0x1E4F63760] localPlayer];
    id v17 = [v14 challengeForGame:v15 andPlayer:v16 withScore:a1];

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
      -[GKScore(GKChallenge) challengeComposeControllerWithPlayers:message:completionHandler:]();
    }
    v12 = 0;
  }
  else
  {
    char v13 = [v8 _gkIncompletePlayersFromPlayerIDs];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__GKScore_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke;
    v15[3] = &unk_1E5F66C40;
    id v16 = v10;
    v12 = [a1 challengeComposeControllerWithMessage:v9 players:v13 completionHandler:v15];
  }

  return v12;
}

+ (uint64_t)reportScores:()GKChallenge withEligibleChallenges:withCompletionHandler:
{
  return [a1 reportScores:a3 whileScreeningChallenges:1 withEligibleChallenges:a4 withCompletionHandler:a5];
}

+ (void)reportLeaderboardScores:()GKChallenge withEligibleChallenges:withCompletionHandler:
{
  v7 = (void *)MEMORY[0x1E4F63750];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 convertToGKScore:a3];
  [(id)objc_opt_class() reportScores:v10 withEligibleChallenges:v9 withCompletionHandler:v8];
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
      -[GKScore(GKChallenge) issueChallengeToPlayers:message:]();
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F636A8];
    id v10 = [a1 game];
    id v11 = [MEMORY[0x1E4F63760] localPlayer];
    v12 = [v9 challengeForGame:v10 andPlayer:v11 withScore:a1];

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

- (void)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "To use Challenges related features, please opt in for your game on App Store Connect.", v2, v3, v4, v5, v6);
}

- (void)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "Developer tried to issue a challenge while this game has not enabled Challenge feature on Apple Store Connect", v2, v3, v4, v5, v6);
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

@end