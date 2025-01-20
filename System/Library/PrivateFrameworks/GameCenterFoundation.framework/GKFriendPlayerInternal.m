@interface GKFriendPlayerInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)challengedTogether;
- (BOOL)isFriend;
- (id)lastChallengedDate;
- (id)lastChallengedGame;
- (id)lastPlayedDate;
- (id)lastPlayedGame;
- (id)status;
- (int)defaultFamiliarity;
- (void)setChallengedTogether:(BOOL)a3;
- (void)setLastChallengedDate:(id)a3;
- (void)setLastChallengedGame:(id)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setLastPlayedGame:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation GKFriendPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__GKFriendPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_487 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_487, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_486;

  return v2;
}

void __49__GKFriendPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKFriendPlayerInternal;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"status";
  v7[0] = objc_opt_class();
  v6[1] = @"lastPlayedDate";
  v7[1] = objc_opt_class();
  v6[2] = @"lastPlayedGame";
  v7[2] = objc_opt_class();
  v6[3] = @"challengedTogether";
  v7[3] = objc_opt_class();
  v6[4] = @"lastChallengedDate";
  v7[4] = objc_opt_class();
  v6[5] = @"lastChallengedGame";
  v7[5] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_486;
  secureCodedPropertyKeys_sSecureCodedKeys_486 = (uint64_t)v2;
}

- (BOOL)isFriend
{
  return 1;
}

- (int)defaultFamiliarity
{
  return 2;
}

- (id)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (id)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (id)lastPlayedGame
{
  return self->_lastPlayedGame;
}

- (void)setLastPlayedGame:(id)a3
{
}

- (BOOL)challengedTogether
{
  return self->_challengedTogether;
}

- (void)setChallengedTogether:(BOOL)a3
{
  self->_challengedTogether = a3;
}

- (id)lastChallengedDate
{
  return self->_lastChallengedDate;
}

- (void)setLastChallengedDate:(id)a3
{
}

- (id)lastChallengedGame
{
  return self->_lastChallengedGame;
}

- (void)setLastChallengedGame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChallengedDate, 0);
  objc_storeStrong((id *)&self->_lastChallengedGame, 0);
  objc_storeStrong((id *)&self->_lastPlayedGame, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

@end