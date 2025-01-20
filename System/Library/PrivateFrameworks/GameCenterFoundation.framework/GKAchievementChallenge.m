@interface GKAchievementChallenge
+ (BOOL)instancesRespondToSelector:(SEL)a3;
- (BOOL)detailsLoaded;
- (GKAchievement)achievement;
- (GKAchievementChallenge)initWithInternalRepresentation:(id)a3;
- (id)description;
- (id)detailGoalTextForPlayer:(id)a3 withAchievement:(id)a4;
- (id)titleText;
- (void)loadDetailsWithCompletionHandler:(id)a3;
- (void)setAchievement:(id)a3;
- (void)setInternal:(id)a3;
@end

@implementation GKAchievementChallenge

- (id)description
{
  v15 = NSString;
  v14 = [(GKAchievementChallenge *)self challengeID];
  v17 = [(GKAchievementChallenge *)self achievement];
  v13 = [v17 identifier];
  v3 = [(GKAchievementChallenge *)self issueDate];
  v16 = [(GKChallenge *)self issuingPlayer];
  v4 = [v16 internal];
  v5 = [v4 conciseDescription];
  v6 = [(GKChallenge *)self receivingPlayer];
  v7 = [v6 internal];
  v8 = [v7 conciseDescription];
  v9 = +[GKChallenge stringForState:[(GKAchievementChallenge *)self state]];
  v10 = [(GKAchievementChallenge *)self completionDate];
  v11 = [v15 stringWithFormat:@"%p GKAchievementChallenge %@ achievement:%@ issueDate: %@ issuingPlayer: %@ receivingPlayer: %@ state: %@ completedDate: %@", self, v14, v13, v3, v5, v8, v9, v10];

  return v11;
}

- (GKAchievementChallenge)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKAchievementChallenge;
  v5 = [(GKAchievementChallenge *)&v8 init];
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
      id v4 = +[GKAchievementChallengeInternal internalRepresentation];
    }
    [(GKAchievementChallenge *)v5 setInternal:v4];
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
  v12.super_class = (Class)GKAchievementChallenge;
  [(GKChallenge *)&v12 setInternal:v4];
  if (v5 != v4)
  {
    v6 = [v4 achievement];

    if (v6)
    {
      v7 = [GKAchievement alloc];
      objc_super v8 = [v4 achievement];
      v6 = [(GKAchievement *)v7 initWithInternalRepresentation:v8];

      v9 = [GKGame alloc];
      v10 = [v4 game];
      v11 = [(GKGame *)v9 initWithInternalRepresentation:v10];
      [(GKAchievement *)v6 setGame:v11];
    }
    [(GKAchievementChallenge *)self setAchievement:v6];
  }
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
    return +[GKAchievementChallengeInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)titleText
{
  v2 = [(GKAchievementChallenge *)self achievement];
  v3 = [v2 title];

  return v3;
}

- (id)detailGoalTextForPlayer:(id)a3 withAchievement:(id)a4
{
  int v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = +[GCFLocalizedStrings CHALLENGE_DETAIL_ACHIEVEMENT_GOAL_FORMAT];
  v9 = [v7 displayNameWithOptions:0];

  v10 = [v6 unachievedDescription];

  v11 = objc_msgSend(v5, "stringWithFormat:", v8, v9, v10);

  return v11;
}

- (BOOL)detailsLoaded
{
  v2 = [(GKAchievementChallenge *)self achievement];
  v3 = [v2 unachievedDescription];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)loadDetailsWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(GKAchievementChallenge *)self achievement];
  id v6 = [v5 identifier];

  id v7 = [(GKChallenge *)self game];
  objc_super v8 = +[GKLocalPlayer localPlayer];
  v16[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__GKAchievementChallenge_loadDetailsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6470A60;
  id v13 = v6;
  v14 = self;
  id v15 = v4;
  id v10 = v4;
  id v11 = v6;
  +[GKAchievement loadAchievementsForGameV2:v7 players:v9 includeUnreported:1 includeHidden:1 withCompletionHandler:v12];
}

uint64_t __59__GKAchievementChallenge_loadDetailsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [a2 allValues];
  uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v19 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              id v11 = [v10 identifier];
              if ([v11 isEqualToString:*(void *)(a1 + 32)])
              {

LABEL_17:
                [*(id *)(a1 + 40) setAchievement:v10];
                goto LABEL_18;
              }
              objc_super v12 = [v10 groupIdentifier];
              int v13 = [v12 isEqualToString:*(void *)(a1 + 32)];

              if (v13) {
                goto LABEL_17;
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (GKAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end