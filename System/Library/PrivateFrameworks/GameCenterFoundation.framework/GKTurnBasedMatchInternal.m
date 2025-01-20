@interface GKTurnBasedMatchInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKGameInternal)game;
- (GKPlayerInternal)currentPlayer;
- (NSArray)exchanges;
- (NSArray)participants;
- (NSData)matchData;
- (NSDate)creationDate;
- (NSDate)deletionDate;
- (NSDate)lastTurnDate;
- (NSDictionary)localizableMessage;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)lastTurnPlayerID;
- (NSString)matchDataVersion;
- (NSString)matchID;
- (NSString)message;
- (NSString)reason;
- (NSString)shortBundleVersion;
- (NSString)status;
- (char)currentParticipant;
- (id)descriptionSubstitutionMap;
- (int64_t)activeExchangeCount;
- (int64_t)localPlayerParticipantIndex;
- (int64_t)platform;
- (int64_t)previousParticipantIndex;
- (unint64_t)hash;
- (unsigned)maxPlayers;
- (unsigned)minPlayers;
- (unsigned)state;
- (unsigned)turnNumber;
- (void)setBundleID:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentParticipant:(char)a3;
- (void)setCurrentPlayer:(id)a3;
- (void)setDeletionDate:(id)a3;
- (void)setExchanges:(id)a3;
- (void)setGame:(id)a3;
- (void)setLastTurnDate:(id)a3;
- (void)setLastTurnPlayerID:(id)a3;
- (void)setLocalizableMessage:(id)a3;
- (void)setMatchData:(id)a3;
- (void)setMatchDataVersion:(id)a3;
- (void)setMatchID:(id)a3;
- (void)setMaxPlayers:(unsigned __int8)a3;
- (void)setMessage:(id)a3;
- (void)setMinPlayers:(unsigned __int8)a3;
- (void)setParticipants:(id)a3;
- (void)setPlatform:(int64_t)a3;
- (void)setReason:(id)a3;
- (void)setShortBundleVersion:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setStatus:(id)a3;
- (void)setTurnNumber:(unsigned int)a3;
- (void)state;
@end

@implementation GKTurnBasedMatchInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_24 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_24, &__block_literal_global_64);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_24;

  return v2;
}

void __51__GKTurnBasedMatchInternal_secureCodedPropertyKeys__block_invoke()
{
  v17[23] = *MEMORY[0x1E4F143B8];
  v16[0] = @"matchID";
  v17[0] = objc_opt_class();
  v16[1] = @"status";
  v17[1] = objc_opt_class();
  v16[2] = @"creationDate";
  v17[2] = objc_opt_class();
  v16[3] = @"currentPlayer";
  v17[3] = objc_opt_class();
  v16[4] = @"lastTurnDate";
  v17[4] = objc_opt_class();
  v16[5] = @"message";
  v17[5] = objc_opt_class();
  v16[6] = @"localizableMessage";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v17[6] = v5;
  v16[7] = @"reason";
  v17[7] = objc_opt_class();
  v16[8] = @"minPlayers";
  v17[8] = objc_opt_class();
  v16[9] = @"maxPlayers";
  v17[9] = objc_opt_class();
  v16[10] = @"deletionDate";
  v17[10] = objc_opt_class();
  v16[11] = @"currentParticipant";
  v17[11] = objc_opt_class();
  v16[12] = @"turnNumber";
  v17[12] = objc_opt_class();
  v16[13] = @"lastTurnPlayerID";
  v17[13] = objc_opt_class();
  v16[14] = @"matchData";
  v17[14] = objc_opt_class();
  v16[15] = @"participants";
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v17[15] = v9;
  v16[16] = @"matchDataVersion";
  v17[16] = objc_opt_class();
  v16[17] = @"bundleID";
  v17[17] = objc_opt_class();
  v16[18] = @"bundleVersion";
  v17[18] = objc_opt_class();
  v16[19] = @"shortBundleVersion";
  v17[19] = objc_opt_class();
  v16[20] = @"platform";
  v17[20] = objc_opt_class();
  v16[21] = @"exchanges";
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v17[21] = v13;
  v16[22] = @"game";
  v17[22] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:23];

  v15 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_24;
  secureCodedPropertyKeys_sSecureCodedKeys_24 = v14;
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKTurnBasedMatchInternal *)self matchID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKTurnBasedMatchInternal *)self lastTurnDate];
    uint64_t v7 = [v5 lastTurnDate];
    uint64_t v8 = [(GKTurnBasedMatchInternal *)self matchID];
    v9 = [v5 matchID];
    if ([v8 isEqualToString:v9]
      && (v6 == v7 || [v6 isEqualToDate:v7]))
    {
      v10 = [(GKTurnBasedMatchInternal *)self status];
      uint64_t v11 = [v5 status];
      char v12 = [v10 isEqualToString:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (int64_t)localPlayerParticipantIndex
{
  uint64_t v2 = [(GKTurnBasedMatchInternal *)self participants];
  int64_t v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_82];

  return v3;
}

uint64_t __55__GKTurnBasedMatchInternal_localPlayerParticipantIndex__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 player];
  uint64_t v3 = [v2 isLocalPlayer];

  return v3;
}

- (int64_t)previousParticipantIndex
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(GKTurnBasedMatchInternal *)self participants];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 lastTurnDate];

        if (v10)
        {
          if (!v6
            || ([v9 lastTurnDate],
                uint64_t v11 = objc_claimAutoreleasedReturnValue(),
                [v6 lastTurnDate],
                char v12 = objc_claimAutoreleasedReturnValue(),
                uint64_t v13 = [v11 compare:v12],
                v12,
                v11,
                v13 == 1))
          {
            id v14 = v9;

            v6 = v14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v15 = [(GKTurnBasedMatchInternal *)self participants];
  int64_t v16 = [v15 indexOfObject:v6];

  return v16;
}

- (int64_t)activeExchangeCount
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKTurnBasedMatchInternal *)self status];
  int v4 = [v3 isEqualToString:@"Active"];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(GKTurnBasedMatchInternal *)self localPlayerParticipantIndex];
  [(GKTurnBasedMatchInternal *)self exchanges];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v34;
    v10 = @"A";
    do
    {
      uint64_t v11 = 0;
      uint64_t v27 = v7;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "statusString", v27);
        int v14 = [v13 isEqualToString:v10];

        if (v14) {
          BOOL v15 = v5 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          int64_t v16 = [v12 replies];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = v9;
            int64_t v20 = v8;
            long long v21 = v10;
            char v22 = 0;
            uint64_t v23 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v30 != v23) {
                  objc_enumerationMutation(v16);
                }
                v22 |= v5 == [*(id *)(*((void *)&v29 + 1) + 8 * i) recipientIndex];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v18);
            uint64_t v25 = (v22 & 1) == 0;
            v10 = v21;
            int64_t v8 = v20;
            uint64_t v9 = v19;
            uint64_t v7 = v27;
          }
          else
          {
            uint64_t v25 = 1;
          }
          v8 += v25;
        }
        ++v11;
      }
      while (v11 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (unsigned)state
{
  unsigned int state = self->_state;
  if (!state)
  {
    if ([(GKTurnBasedMatchInternal *)self activeExchangeCount] > 0)
    {
      unsigned int state = 2;
LABEL_38:
      self->_unsigned int state = state;
      return state;
    }
    int v4 = [(GKTurnBasedMatchInternal *)self status];
    if ([v4 isEqualToString:@"Active"])
    {
    }
    else
    {
      int64_t v5 = [(GKTurnBasedMatchInternal *)self status];
      int v6 = [v5 isEqualToString:@"Matching"];

      if (!v6)
      {
        long long v30 = [(GKTurnBasedMatchInternal *)self status];
        char v31 = [v30 isEqualToString:@"Complete"];

        if (v31)
        {
          unsigned int state = 5;
        }
        else
        {
          long long v32 = os_log_GKGeneral;
          if (!os_log_GKGeneral)
          {
            id v33 = GKOSLoggers();
            long long v32 = os_log_GKGeneral;
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            [(GKTurnBasedMatchInternal *)v32 state];
          }
          unsigned int state = 3;
        }
        goto LABEL_38;
      }
    }
    int v7 = [(GKTurnBasedMatchInternal *)self currentParticipant];
    if (v7 < 0
      || (unint64_t v8 = v7,
          [(GKTurnBasedMatchInternal *)self participants],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          unint64_t v10 = [v9 count],
          v9,
          v10 <= v8))
    {
      char v12 = 0;
    }
    else
    {
      uint64_t v11 = [(GKTurnBasedMatchInternal *)self participants];
      char v12 = [v11 objectAtIndexedSubscript:v8];
    }
    int64_t v13 = [(GKTurnBasedMatchInternal *)self localPlayerParticipantIndex];
    if (v13 < 0
      || (unint64_t v14 = v13,
          [(GKTurnBasedMatchInternal *)self participants],
          BOOL v15 = objc_claimAutoreleasedReturnValue(),
          unint64_t v16 = [v15 count],
          v15,
          v14 >= v16))
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v17 = [(GKTurnBasedMatchInternal *)self participants];
      uint64_t v18 = [v17 objectAtIndexedSubscript:v14];

      if (v18)
      {
        uint64_t v19 = [v18 status];
        char v20 = [v19 isEqualToString:@"Inactive"];

        if (v20)
        {
          unsigned int state = 5;
LABEL_37:

          goto LABEL_38;
        }
      }
    }
    long long v21 = [v12 player];
    if ([v21 isGuestPlayer])
    {
      char v22 = [v12 player];
      uint64_t v23 = [v22 hostPlayerInternal];
      char v24 = [v23 isLocalPlayer];

      if (v24)
      {
        unsigned int state = 6;
        goto LABEL_37;
      }
    }
    else
    {
    }
    uint64_t v25 = [v12 player];
    int v26 = [v25 isLocalPlayer];

    if (v26)
    {
      uint64_t v27 = [v12 status];
      int v28 = [v27 isEqualToString:@"Invited"];

      if (v28) {
        unsigned int state = 1;
      }
      else {
        unsigned int state = 3;
      }
    }
    else
    {
      long long v29 = [(GKTurnBasedMatchInternal *)self participants];
      if ([v29 count])
      {

        unsigned int state = 4;
      }
      else
      {
        long long v34 = [v12 player];
        int v35 = [v34 isLocalPlayer];

        if (v35) {
          unsigned int state = 3;
        }
        else {
          unsigned int state = 4;
        }
      }
    }
    goto LABEL_37;
  }
  return state;
}

- (void)setState:(unsigned int)a3
{
  self->_unsigned int state = a3;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1F1E7EDB8;
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (GKPlayerInternal)currentPlayer
{
  return self->_currentPlayer;
}

- (void)setCurrentPlayer:(id)a3
{
}

- (NSDate)lastTurnDate
{
  return self->_lastTurnDate;
}

- (void)setLastTurnDate:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (unsigned)minPlayers
{
  return self->_minPlayers;
}

- (void)setMinPlayers:(unsigned __int8)a3
{
  self->_minPlayers = a3;
}

- (unsigned)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(unsigned __int8)a3
{
  self->_maxPlayers = a3;
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
}

- (char)currentParticipant
{
  return self->_currentParticipant;
}

- (void)setCurrentParticipant:(char)a3
{
  self->_currentParticipant = a3;
}

- (unsigned)turnNumber
{
  return self->_turnNumber;
}

- (void)setTurnNumber:(unsigned int)a3
{
  self->_turnNumber = a3;
}

- (NSString)lastTurnPlayerID
{
  return self->_lastTurnPlayerID;
}

- (void)setLastTurnPlayerID:(id)a3
{
}

- (NSData)matchData
{
  return self->_matchData;
}

- (void)setMatchData:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSString)matchDataVersion
{
  return self->_matchDataVersion;
}

- (void)setMatchDataVersion:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)shortBundleVersion
{
  return self->_shortBundleVersion;
}

- (void)setShortBundleVersion:(id)a3
{
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSArray)exchanges
{
  return self->_exchanges;
}

- (void)setExchanges:(id)a3
{
}

- (GKGameInternal)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchanges, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_shortBundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_matchDataVersion, 0);
  objc_storeStrong((id *)&self->_matchData, 0);
  objc_storeStrong((id *)&self->_lastTurnPlayerID, 0);
  objc_storeStrong((id *)&self->_currentPlayer, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_lastTurnDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_matchID, 0);
}

- (void)state
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = [a2 status];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_debug_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_DEBUG, "GKTurnBasedMatchInternal->state Unexpected match status encountered: %@", (uint8_t *)&v5, 0xCu);
}

@end