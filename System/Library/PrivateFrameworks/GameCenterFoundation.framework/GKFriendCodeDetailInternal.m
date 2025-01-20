@interface GKFriendCodeDetailInternal
+ (id)secureCodedPropertyKeys;
- (GKPlayerInternal)creatorPlayer;
- (NSArray)alreadyUsedPlayerIDs;
- (NSString)creatorPlayerID;
- (NSString)friendCode;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)friendCodeState;
- (int64_t)friendCodeUsageCount;
- (void)setAlreadyUsedPlayerIDs:(id)a3;
- (void)setCreatorPlayer:(id)a3;
- (void)setCreatorPlayerID:(id)a3;
- (void)setFriendCode:(id)a3;
- (void)setFriendCodeState:(int64_t)a3;
- (void)setFriendCodeUsageCount:(int64_t)a3;
@end

@implementation GKFriendCodeDetailInternal

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(GKFriendCodeDetailInternal *)self creatorPlayerID];
  [v4 setCreatorPlayerID:v5];

  objc_msgSend(v4, "setFriendCodeState:", -[GKFriendCodeDetailInternal friendCodeState](self, "friendCodeState"));
  objc_msgSend(v4, "setFriendCodeUsageCount:", -[GKFriendCodeDetailInternal friendCodeUsageCount](self, "friendCodeUsageCount"));
  v6 = [(GKFriendCodeDetailInternal *)self alreadyUsedPlayerIDs];
  [v4 setAlreadyUsedPlayerIDs:v6];

  return v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_14 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_14, &__block_literal_global_52);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_14;

  return v2;
}

void __53__GKFriendCodeDetailInternal_secureCodedPropertyKeys__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"creatorPlayerID";
  v6[0] = objc_opt_class();
  v5[1] = @"friendCode";
  v6[1] = objc_opt_class();
  v5[2] = @"friendCodeState";
  v6[2] = objc_opt_class();
  v5[3] = @"friendCodeUsageCount";
  v6[3] = objc_opt_class();
  v5[4] = @"alreadyUsedPlayerIDs";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v6[4] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_14;
  secureCodedPropertyKeys_sSecureCodedKeys_14 = v3;
}

- (NSString)creatorPlayerID
{
  return self->_creatorPlayerID;
}

- (void)setCreatorPlayerID:(id)a3
{
}

- (GKPlayerInternal)creatorPlayer
{
  return self->_creatorPlayer;
}

- (void)setCreatorPlayer:(id)a3
{
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
}

- (int64_t)friendCodeState
{
  return self->_friendCodeState;
}

- (void)setFriendCodeState:(int64_t)a3
{
  self->_friendCodeState = a3;
}

- (NSArray)alreadyUsedPlayerIDs
{
  return self->_alreadyUsedPlayerIDs;
}

- (void)setAlreadyUsedPlayerIDs:(id)a3
{
}

- (int64_t)friendCodeUsageCount
{
  return self->_friendCodeUsageCount;
}

- (void)setFriendCodeUsageCount:(int64_t)a3
{
  self->_friendCodeUsageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alreadyUsedPlayerIDs, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_storeStrong((id *)&self->_creatorPlayer, 0);

  objc_storeStrong((id *)&self->_creatorPlayerID, 0);
}

@end