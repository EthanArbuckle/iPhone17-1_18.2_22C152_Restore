@interface GKAchievementDescriptionInternal
+ (id)secureCodedPropertyKeys;
@end

@implementation GKAchievementDescriptionInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_5 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_5, &__block_literal_global_29);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_5;

  return v2;
}

void __59__GKAchievementDescriptionInternal_secureCodedPropertyKeys__block_invoke()
{
  v7[10] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"identifier", @"title", @"achievedDescription", @"unachievedDescription", @"maximumPoints", @"hidden", @"icons");
  v7[6] = v3;
  v6[7] = @"replayable";
  v7[7] = objc_opt_class();
  v6[8] = @"groupIdentifier";
  v7[8] = objc_opt_class();
  v6[9] = @"rarityPercent";
  v7[9] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:10];
  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_5;
  secureCodedPropertyKeys_sSecureCodedKeys_5 = v4;
}

@end