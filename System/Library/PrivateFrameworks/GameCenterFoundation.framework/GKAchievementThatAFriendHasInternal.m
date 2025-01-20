@interface GKAchievementThatAFriendHasInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (GKPlayerInternal)friendPlayer;
- (NSDate)timestamp;
- (void)setFriendPlayer:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation GKAchievementThatAFriendHasInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_34 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_34, &__block_literal_global_36);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_33;

  return v2;
}

void __62__GKAchievementThatAFriendHasInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"friendPlayer";
  v2[1] = @"timestamp";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_33;
  secureCodedPropertyKeys_sSecureCodedKeys_33 = v0;
}

- (GKPlayerInternal)friendPlayer
{
  return self->friendPlayer;
}

- (void)setFriendPlayer:(id)a3
{
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timestamp, 0);

  objc_storeStrong((id *)&self->friendPlayer, 0);
}

@end