@interface GKScoreChallenge
+ (BOOL)instancesRespondToSelector:(SEL)a3;
- (BOOL)detailsLoaded;
- (GKLeaderboard)leaderboard;
- (GKLeaderboardEntry)leaderboardEntry;
- (GKScore)score;
- (GKScoreChallenge)initWithInternalRepresentation:(id)a3;
- (id)description;
- (id)detailGoalTextForPlayer:(id)a3 withLeaderboard:(id)a4;
- (id)titleText;
- (void)loadDetailsWithCompletionHandler:(id)a3;
- (void)setInternal:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation GKScoreChallenge

- (id)description
{
  v15 = NSString;
  v14 = [(GKScoreChallenge *)self challengeID];
  v17 = [(GKScoreChallenge *)self score];
  v13 = [v17 formattedValue];
  v3 = [(GKScoreChallenge *)self issueDate];
  v16 = [(GKChallenge *)self issuingPlayer];
  v4 = [v16 internal];
  v5 = [v4 conciseDescription];
  v6 = [(GKChallenge *)self receivingPlayer];
  v7 = [v6 internal];
  v8 = [v7 conciseDescription];
  v9 = +[GKChallenge stringForState:[(GKScoreChallenge *)self state]];
  v10 = [(GKScoreChallenge *)self completionDate];
  v11 = [v15 stringWithFormat:@"%p GKScoreChallenge %@ score:%@ issueDate: %@ issuingPlayer: %@ receivingPlayer: %@ state: %@ completedDate: %@", self, v14, v13, v3, v5, v8, v9, v10];

  return v11;
}

- (GKScoreChallenge)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKScoreChallenge;
  v5 = [(GKScoreChallenge *)&v8 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_8;
    }
    if (!v4)
    {
      id v4 = +[GKScoreChallengeInternal internalRepresentation];
    }
    [(GKScoreChallenge *)v5 setInternal:v4];
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)setInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(GKChallenge *)self internal];
  v12.receiver = self;
  v12.super_class = (Class)GKScoreChallenge;
  [(GKChallenge *)&v12 setInternal:v4];
  if (v5 != v4)
  {
    v6 = [v4 score];

    if (v6)
    {
      v7 = [GKScore alloc];
      objc_super v8 = [v4 score];
      v6 = [(GKScore *)v7 initWithInternalRepresentation:v8];

      v9 = [GKGame alloc];
      v10 = [v4 game];
      v11 = [(GKGame *)v9 initWithInternalRepresentation:v10];
      [(GKScore *)v6 setGame:v11];
    }
    [(GKScoreChallenge *)self setScore:v6];
  }
}

- (GKLeaderboard)leaderboard
{
  v3 = [GKLeaderboard alloc];
  id v4 = [(GKChallenge *)self internal];
  id v5 = [v4 leaderboard];
  v6 = [(GKLeaderboard *)v3 initWithInternalRepresentation:v5];

  return v6;
}

- (GKLeaderboardEntry)leaderboardEntry
{
  v3 = [(GKScoreChallenge *)self score];
  if (v3)
  {
    id v4 = [(GKScoreChallenge *)self score];
    id v5 = +[GKLeaderboardEntry fromGKScore:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (GKLeaderboardEntry *)v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  if (class_respondsToSelector((Class)a1, a3)) {
    return 1;
  }
  int v5 = GKApplicationLinkedOnOrAfter(393216, 0);
  BOOL result = 0;
  if (v5)
  {
    return +[GKScoreChallengeInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)titleText
{
  v2 = [(GKChallenge *)self internal];
  v3 = [v2 leaderboard];
  id v4 = [v3 title];

  return v4;
}

- (BOOL)detailsLoaded
{
  v2 = [(GKChallenge *)self internal];
  v3 = [v2 leaderboard];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)loadDetailsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = +[GKDispatchGroup dispatchGroupWithName:@"ScoreChallengeDetails"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E646DCA0;
  v9[4] = self;
  [v5 perform:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E646D7A0;
  id v8 = v4;
  id v6 = v4;
  [v5 notifyOnMainQueueWithBlock:v7];
}

void __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) score];
  int v5 = [v4 leaderboardIdentifier];
  id v6 = [*(id *)(a1 + 32) score];
  v7 = [v6 game];
  id v8 = +[GKLocalPlayer localPlayer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E6470A38;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v9 = v3;
  +[GKLeaderboard loadLeaderboardWithIdentifier:v5 forGame:v7 withPlayer:v8 withCompletionHandler:v10];
}

void __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) internal];
  if (v3)
  {
    int v5 = [v3 internal];
    [v4 setLeaderboard:v5];
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) formattedValue];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = +[GKDaemonProxy proxyForLocalPlayer];
    id v8 = [v7 gameStatServicePrivate];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 16) internal];
    v16[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v11 = [*(id *)(a1 + 32) game];
    objc_super v12 = [v11 gameDescriptor];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E646DC78;
    v13 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v13;
    [v8 getHypotheticalLeaderboardRanksForScores:v10 forGameDescriptor:v12 handler:v14];
  }
}

void __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    id v3 = [v5 lastObject];
    id v4 = [v3 objectForKey:@"formatted-score-value"];
    [*(id *)(*(void *)(a1 + 32) + 16) setFormattedValue:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)detailGoalTextForPlayer:(id)a3 withLeaderboard:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[GCFLocalizedStrings CHALLENGE_DETAIL_SCORE_GOAL_FORMAT];
  v10 = [v8 displayNameWithOptions:0];

  id v11 = [(GKScoreChallenge *)self score];
  objc_super v12 = [v11 formattedValue];
  v13 = [v7 localizedTitle];

  v14 = objc_msgSend(v6, "stringWithFormat:", v9, v10, v12, v13);

  return v14;
}

- (GKScore)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end