@interface GKMultiplayerGroupInternal
+ (id)secureCodedPropertyKeys;
- (NSMutableArray)participants;
- (NSString)groupID;
- (id)description;
- (int64_t)numberOfAutomached;
- (int64_t)playedAt;
- (void)setGroupID:(id)a3;
- (void)setNumberOfAutomached:(int64_t)a3;
- (void)setParticipants:(id)a3;
- (void)setPlayedAt:(int64_t)a3;
@end

@implementation GKMultiplayerGroupInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_3 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_3, &__block_literal_global_17);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_3;

  return v2;
}

void __53__GKMultiplayerGroupInternal_secureCodedPropertyKeys__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"participants";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v6[0] = v2;
  v5[1] = @"numberOfAutomached";
  v6[1] = objc_opt_class();
  v5[2] = @"playedAt";
  v6[2] = objc_opt_class();
  v5[3] = @"groupID";
  v6[3] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_3;
  secureCodedPropertyKeys_sSecureCodedKeys_3 = v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(GKMultiplayerGroupInternal *)self groupID];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKMultiplayerGroupInternal numberOfAutomached](self, "numberOfAutomached"));
  v6 = [(GKMultiplayerGroupInternal *)self participants];
  v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(-[GKMultiplayerGroupInternal playedAt](self, "playedAt") / 1000));
  v8 = [v3 stringWithFormat:@"groupID: %@, number of automatched: %@ participants: %@ playedAt: %@", v4, v5, v6, v7];

  return v8;
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (int64_t)numberOfAutomached
{
  return self->_numberOfAutomached;
}

- (void)setNumberOfAutomached:(int64_t)a3
{
  self->_numberOfAutomached = a3;
}

- (int64_t)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(int64_t)a3
{
  self->_playedAt = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end