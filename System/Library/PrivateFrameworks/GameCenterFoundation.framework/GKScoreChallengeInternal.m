@interface GKScoreChallengeInternal
+ (id)internalRepresentation;
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardInternal)leaderboard;
- (GKScoreInternal)score;
- (id)serverRepresentationForReceivingPlayer:(id)a3;
- (id)titleText;
- (unint64_t)type;
- (void)setLeaderboard:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation GKScoreChallengeInternal

+ (id)internalRepresentation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GKScoreChallengeInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_168 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_168, block);
  }
  id v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_167;

  return v2;
}

void __51__GKScoreChallengeInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___GKScoreChallengeInternal;
  v1 = objc_msgSendSuper2(&v4, sel_secureCodedPropertyKeys);
  id v2 = (void *)[v1 mutableCopy];

  [v2 setObject:objc_opt_class() forKey:@"score"];
  [v2 setObject:objc_opt_class() forKey:@"leaderboard"];
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_167;
  secureCodedPropertyKeys_sSecureCodedKeys_167 = (uint64_t)v2;
}

- (id)serverRepresentationForReceivingPlayer:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)GKScoreChallengeInternal;
  v5 = [(GKChallengeInternal *)&v21 serverRepresentationForReceivingPlayer:a3];
  v6 = (void *)[v5 mutableCopy];

  [v6 setObject:&unk_1F1E7ECC0 forKey:@"challenge-type"];
  v22[0] = @"value";
  v7 = NSNumber;
  v20 = [(GKScoreChallengeInternal *)self score];
  v19 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v20, "value"));
  v23[0] = v19;
  v22[1] = @"leaderboard-id";
  v8 = [(GKScoreChallengeInternal *)self score];
  v9 = [v8 leaderboardIdentifier];
  v23[1] = v9;
  v22[2] = @"timestamp";
  v10 = [(GKScoreChallengeInternal *)self score];
  v11 = [v10 date];
  if (v11)
  {
    v18 = [(GKScoreChallengeInternal *)self score];
    v3 = [v18 date];
    [v3 _gkServerTimestamp];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] _gkServerTimestamp];
  v12 = };
  v23[2] = v12;
  v22[3] = @"context";
  v13 = NSNumber;
  v14 = [(GKScoreChallengeInternal *)self score];
  v15 = objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v14, "context"));
  v23[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

  if (v11)
  {

    v12 = v18;
  }

  [v6 setObject:v16 forKey:@"score"];

  return v6;
}

- (unint64_t)type
{
  return 1;
}

- (id)titleText
{
  v3 = [(GKScoreChallengeInternal *)self score];
  objc_super v4 = [v3 formattedValue];

  if (v4
    && ([(GKScoreChallengeInternal *)self leaderboard],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 title],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = NSString;
    v8 = +[GCFLocalizedStrings SHORT_CHALLENGE_SCORE_TITLE_FORMAT];
    v9 = [(GKScoreChallengeInternal *)self leaderboard];
    v10 = [v9 title];
    v11 = objc_msgSend(v7, "stringWithFormat:", v8, v4, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GKScoreInternal)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (GKLeaderboardInternal)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboard, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

@end