@interface GKLeaderboardChallengeActiveInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSString)localizedText;
- (void)setLocalizedText:(id)a3;
@end

@implementation GKLeaderboardChallengeActiveInternal

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__GKLeaderboardChallengeActiveInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_393 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_393, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_392;

  return v2;
}

void __63__GKLeaderboardChallengeActiveInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___GKLeaderboardChallengeActiveInternal;
  v2 = objc_msgSendSuper2(&v7, sel_secureCodedPropertyKeys);
  v3 = [v1 dictionaryWithDictionary:v2];

  v8 = @"localizedText";
  v9[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 addEntriesFromDictionary:v4];

  uint64_t v5 = [v3 copy];
  v6 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_392;
  secureCodedPropertyKeys_sSecureCodedKeys_392 = v5;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeActiveInternal);
  [(GKLeaderboardChallengeDetailsInternal *)v4 updateWithServerFragment:v3];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"card-text"];

  [(GKLeaderboardChallengeActiveInternal *)v4 setLocalizedText:v5];

  return v4;
}

- (NSString)localizedText
{
  return self->_localizedText;
}

- (void)setLocalizedText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end