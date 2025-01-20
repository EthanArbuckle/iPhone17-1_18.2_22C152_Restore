@interface GKTurnBasedParticipantInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isAutomatchParticipant;
- (BOOL)isEqual:(id)a3;
- (GKPlayerInternal)invitedBy;
- (GKPlayerInternal)player;
- (NSDate)lastTurnDate;
- (NSDate)timeoutDate;
- (NSString)inviteMessage;
- (NSString)playerID;
- (NSString)sessionID;
- (NSString)status;
- (id)descriptionSubstitutionMap;
- (id)serverRepresentation;
- (unint64_t)hash;
- (unsigned)matchOutcome;
- (unsigned)slot;
- (void)setInviteMessage:(id)a3;
- (void)setInvitedBy:(id)a3;
- (void)setLastTurnDate:(id)a3;
- (void)setMatchOutcome:(unsigned int)a3;
- (void)setPlayer:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSlot:(unsigned __int8)a3;
- (void)setStatus:(id)a3;
- (void)setTimeoutDate:(id)a3;
@end

@implementation GKTurnBasedParticipantInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_275 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_275, &__block_literal_global_277);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_274;

  return v2;
}

void __57__GKTurnBasedParticipantInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"sessionID";
  v3[0] = objc_opt_class();
  v2[1] = @"lastTurnDate";
  v3[1] = objc_opt_class();
  v2[2] = @"timeoutDate";
  v3[2] = objc_opt_class();
  v2[3] = @"invitedBy";
  v3[3] = objc_opt_class();
  v2[4] = @"inviteMessage";
  v3[4] = objc_opt_class();
  v2[5] = @"status";
  v3[5] = objc_opt_class();
  v2[6] = @"matchOutcome";
  v3[6] = objc_opt_class();
  v2[7] = @"slot";
  v3[7] = objc_opt_class();
  v2[8] = @"player";
  v3[8] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_274;
  secureCodedPropertyKeys_sSecureCodedKeys_274 = v0;
}

- (unint64_t)hash
{
  return [(GKTurnBasedParticipantInternal *)self slot];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int slot = self->_slot, slot == [v4 slot]))
  {
    sessionID = self->_sessionID;
    v7 = [v4 sessionID];
    if (sessionID == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = self->_sessionID;
      v9 = [v4 sessionID];
      char v10 = [(NSString *)v8 isEqualToString:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)serverRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(GKTurnBasedParticipantInternal *)self status];
  [v3 setObject:v4 forKeyedSubscript:@"player-status"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKTurnBasedParticipantInternal matchOutcome](self, "matchOutcome"));
  [v3 setObject:v5 forKeyedSubscript:@"player-status-code"];

  v6 = [(GKTurnBasedParticipantInternal *)self player];
  v7 = [v6 playerID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(GKTurnBasedParticipantInternal *)self player];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v11 = [(GKTurnBasedParticipantInternal *)self player];
    v12 = v11;
    if (isKindOfClass)
    {
      v13 = [v11 guestIdentifier];
      [v3 setObject:v13 forKeyedSubscript:@"guest-id"];

      v14 = [v12 hostPlayerInternal];
      v15 = [v14 playerID];
      [v3 setObject:v15 forKeyedSubscript:@"player-id"];
    }
    else
    {
      v14 = [v11 playerID];
      [v3 setObject:v14 forKeyedSubscript:@"player-id"];
    }
  }

  return v3;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1F1E7EDE0;
}

- (BOOL)isAutomatchParticipant
{
  v3 = [(GKTurnBasedParticipantInternal *)self player];
  char v4 = [v3 isLocalPlayer];

  if (v4) {
    return 0;
  }
  v6 = [(GKTurnBasedParticipantInternal *)self player];
  v7 = [v6 playerID];
  BOOL v5 = [v7 length] == 0;

  return v5;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSDate)lastTurnDate
{
  return self->_lastTurnDate;
}

- (void)setLastTurnDate:(id)a3
{
}

- (NSDate)timeoutDate
{
  return self->_timeoutDate;
}

- (void)setTimeoutDate:(id)a3
{
}

- (GKPlayerInternal)invitedBy
{
  return self->_invitedBy;
}

- (void)setInvitedBy:(id)a3
{
}

- (NSString)inviteMessage
{
  return self->_inviteMessage;
}

- (void)setInviteMessage:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (unsigned)matchOutcome
{
  return self->_matchOutcome;
}

- (void)setMatchOutcome:(unsigned int)a3
{
  self->_matchOutcome = a3;
}

- (unsigned)slot
{
  return self->_slot;
}

- (void)setSlot:(unsigned __int8)a3
{
  self->_int slot = a3;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_lastTurnDate, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_inviteMessage, 0);
  objc_storeStrong((id *)&self->_invitedBy, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (NSString)playerID
{
  v2 = [(GKTurnBasedParticipantInternal *)self player];
  v3 = [v2 playerID];

  return (NSString *)v3;
}

@end