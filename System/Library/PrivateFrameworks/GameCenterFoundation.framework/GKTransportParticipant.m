@interface GKTransportParticipant
+ (id)participantsFrom:(id)a3 withKey:(id)a4;
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKTransportParticipant)initWithPlayerID:(id)a3 pseudonym:(id)a4;
- (NSString)playerID;
- (NSString)pseudonym;
- (id)description;
- (id)serverRepresentation;
- (unint64_t)hash;
- (void)setPlayerID:(id)a3;
- (void)setPseudonym:(id)a3;
@end

@implementation GKTransportParticipant

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_15 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_15, &__block_literal_global_54);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_15;

  return v2;
}

void __49__GKTransportParticipant_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"playerID";
  v2[1] = @"pseudonym";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_15;
  secureCodedPropertyKeys_sSecureCodedKeys_15 = v0;
}

- (GKTransportParticipant)initWithPlayerID:(id)a3 pseudonym:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKTransportParticipant;
  v8 = [(GKTransportParticipant *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKTransportParticipant *)v8 setPlayerID:v6];
    [(GKTransportParticipant *)v9 setPseudonym:v7];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(GKTransportParticipant *)self playerID];
  v5 = [(GKTransportParticipant *)self pseudonym];
  id v6 = [v3 stringWithFormat:@"GKTransportParticipant<%p>[%@, %@]", self, v4, v5];

  return v6;
}

+ (id)participantsFrom:(id)a3 withKey:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v22 = v6;
  v23 = v5;
  v8 = [v5 objectForKeyedSubscript:v6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 objectForKeyedSubscript:@"pid"];
        uint64_t v15 = [v13 objectForKeyedSubscript:@"ps"];
        v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          if (!os_log_GKGeneral) {
            id v18 = GKOSLoggers();
          }
          v19 = os_log_GKFastSync;
          if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v14;
            __int16 v30 = 2112;
            v31 = v16;
            _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "UpdateAfterInviteeAcceptedUserInfo cannot init participant. playerID(%@) or pseudonym(%@) is nil.", buf, 0x16u);
          }
        }
        else
        {
          v20 = [[GKTransportParticipant alloc] initWithPlayerID:v14 pseudonym:v15];
          [v7 addObject:v20];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)serverRepresentation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = [(GKTransportParticipant *)self playerID];
  uint64_t v4 = [(GKTransportParticipant *)self pseudonym];
  id v5 = (void *)v4;
  if (!v3 || !v4)
  {
    id v6 = NSString;
    id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    v8 = [v6 stringWithFormat:@"Invalid participant info for: %@. Call Stack: %@", self, v7];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerServiceInterface.m"];
    id v10 = [v9 lastPathComponent];
    uint64_t v11 = [v6 stringWithFormat:@"%@ (playerID != nil && pseudonym != nil)\n[%s (%s:%d)]", v8, "-[GKTransportParticipant serverRepresentation]", objc_msgSend(v10, "UTF8String"), 132];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
  }
  v14[0] = @"pid";
  v14[1] = @"ps";
  v15[0] = v3;
  v15[1] = v5;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 playerID];
    id v7 = [(GKTransportParticipant *)self playerID];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 pseudonym];
      uint64_t v9 = [(GKTransportParticipant *)self pseudonym];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(GKTransportParticipant *)self playerID];
  uint64_t v4 = [v3 hash];
  id v5 = [(GKTransportParticipant *)self pseudonym];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseudonym, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end