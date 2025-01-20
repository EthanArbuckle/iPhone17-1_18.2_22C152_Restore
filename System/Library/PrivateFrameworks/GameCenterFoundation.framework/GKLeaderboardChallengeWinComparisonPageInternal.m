@interface GKLeaderboardChallengeWinComparisonPageInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSArray)comparisons;
- (NSString)nextURL;
- (void)setComparisons:(id)a3;
- (void)setNextURL:(id)a3;
@end

@implementation GKLeaderboardChallengeWinComparisonPageInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_517 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_517, &__block_literal_global_519);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_516;

  return v2;
}

void __74__GKLeaderboardChallengeWinComparisonPageInternal_secureCodedPropertyKeys__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"comparisons";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v2 = [v0 setWithArray:v1];
  v6[1] = @"nextURL";
  v7[0] = v2;
  v7[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_516;
  secureCodedPropertyKeys_sSecureCodedKeys_516 = v3;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeWinComparisonPageInternal);
  v5 = [v3 objectForKeyedSubscript:@"result"];
  v6 = [v5 _gkMapWithBlock:&__block_literal_global_525];
  [(GKLeaderboardChallengeWinComparisonPageInternal *)v4 setComparisons:v6];

  v7 = [v3 objectForKeyedSubscript:@"next-url"];

  [(GKLeaderboardChallengeWinComparisonPageInternal *)v4 setNextURL:v7];

  return v4;
}

GKLeaderboardChallengeWinComparisonInternal *__74__GKLeaderboardChallengeWinComparisonPageInternal_initWithServerFragment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengeWinComparisonInternal initWithServerFragment:a2];
}

- (NSArray)comparisons
{
  return self->_comparisons;
}

- (void)setComparisons:(id)a3
{
}

- (NSString)nextURL
{
  return self->_nextURL;
}

- (void)setNextURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextURL, 0);

  objc_storeStrong((id *)&self->_comparisons, 0);
}

@end